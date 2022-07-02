import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermDocs;
import org.apache.lucene.index.TermPositions;
import org.apache.lucene.search.*;


import java.io.IOException;

/**
 * Copyright 2004 The Apache Software Foundation
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * The BoostingTermQuery is very similar to the {@link org.apache.lucene.search.spans.SpanTermQuery} except
 * that it factors in the value of the payload located at each of the positions where the
 * {@link org.apache.lucene.index.Term} occurs.
 * <p>
 * In order to take advantage of this, you must override {@link org.apache.lucene.search.Similarity#scorePayload(byte[],int,int)}
 * which returns 1 by default.
 * <p>
 * Payload scores are averaged across term occurrences in the document.  
 * 
 * <p><font color="#FF0000">
 * WARNING: The status of the <b>Payloads</b> feature is experimental. 
 * The APIs introduced here might change in the future and will not be 
 * supported anymore in such a case.</font>
 *
 * @see org.apache.lucene.search.Similarity#scorePayload(byte[], int, int)
 */
public class BoostingTermQuery extends TermQuery{
	Term term;
	Similarity similarity;

  public BoostingTermQuery(Term term) {
    super(term);
    this.term = term;

  }


  protected Weight createWeight(Searcher searcher) throws IOException {
	this.similarity = getSimilarity(searcher);	  
    return new BoostingTermWeight(this, searcher);
  }

  protected class BoostingTermWeight extends TermWeight implements Weight {


    public BoostingTermWeight(BoostingTermQuery query, Searcher searcher) throws IOException {
      super(searcher);
    }




    public Scorer scorer(IndexReader reader) throws IOException {
      return new BoostingTermScorer(reader.termDocs(term), reader.termPositions(term), this, similarity,
             reader.norms(term.field()));
    }

    class BoostingTermScorer extends TermScorer {

      //TODO: is this the best way to allocate this?
      byte[] payload = new byte[256];
      private TermPositions positions;
      protected float payloadScore;
      private int payloadsSeen;

      public BoostingTermScorer(TermDocs termDocs, TermPositions termPositions, Weight weight,
                                Similarity similarity, byte[] norms) throws IOException {
    	  super(weight, termDocs, similarity, norms);
    	  positions = termPositions;

      }

      /**
       * Go to the next document
       * 
       */
      public boolean next() throws IOException {

        boolean result = super.next();
        //set the payload.  super.next() properly increments the term positions
        if (result) {
          if (positions.skipTo(super.doc())) {
        	  positions.nextPosition();
	          processPayload(similarity);
          }
        }

        return result;
      }

      public boolean skipTo(int target) throws IOException {
        boolean result = super.skipTo(target);

        if (result) {
            if (positions.skipTo(target)) {
          	  positions.nextPosition();
        	  processPayload(similarity);
          }
        }

        return result;
      }

//      protected boolean setFreqCurrentDoc() throws IOException {
//        if (!more) {
//          return false;
//        }
//        doc = spans.doc();
//        freq = 0.0f;
//        payloadScore = 0;
//        payloadsSeen = 0;
//        Similarity similarity1 = getSimilarity();
//        while (more && doc == spans.doc()) {
//          int matchLength = spans.end() - spans.start();
//
//          freq += similarity1.sloppyFreq(matchLength);
//          processPayload(similarity1);
//
//          more = spans.next();//this moves positions to the next match in this document
//        }
//        return more || (freq != 0);
//      }


      protected void processPayload(Similarity similarity) throws IOException {
        if (positions.isPayloadAvailable()) {
          payload = positions.getPayload(payload, 0);
          payloadScore += similarity.scorePayload(payload, 0, positions.getPayloadLength());
          payloadsSeen++;

        } else {
          //zero out the payload?
        }

      }

      public float score() {

        return super.score() * (payloadsSeen > 0 ? (payloadScore / payloadsSeen) : 1);
      }


      public Explanation explain(final int doc) throws IOException {
        Explanation result = new Explanation();
        Explanation nonPayloadExpl = super.explain(doc);
        result.addDetail(nonPayloadExpl);
        //QUESTION: Is there a wau to avoid this skipTo call?  We need to know whether to load the payload or not
        
        Explanation payloadBoost = new Explanation();
        result.addDetail(payloadBoost);
/*
        if (skipTo(doc) == true) {
          processPayload();
        }
*/

        float avgPayloadScore =  (payloadsSeen > 0 ? (payloadScore / payloadsSeen) : 1); 
        payloadBoost.setValue(avgPayloadScore);
        //GSI: I suppose we could toString the payload, but I don't think that would be a good idea 
        payloadBoost.setDescription("scorePayload(...)");
        result.setValue(nonPayloadExpl.getValue() * avgPayloadScore);
        result.setDescription("btq, product of:");
        return result;
      }
    }

  }


  public boolean equals(Object o) {
    if (!(o instanceof BoostingTermQuery))
      return false;
    BoostingTermQuery other = (BoostingTermQuery) o;
    return (this.getBoost() == other.getBoost())
            && this.term.equals(other.term);
  }
}
