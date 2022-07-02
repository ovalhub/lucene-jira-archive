package org.apache.lucene.search;

/**
 * Copyright 2004 The Apache Software Foundation
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

import java.io.IOException;
import org.apache.lucene.util.Sort;

final class IntegerRangeScorer extends Scorer
{
    private Weight weight;

    private int[] docnos;

    private int pos;

    private byte[] norms;

    private float weightValue;

    private int doc;

    IntegerRangeScorer(Weight weight, int lowval, int hival, boolean inclusive,
            int[] docnos, int[] docvals, Similarity similarity, byte[] norms)
            throws IOException
    {
        super(similarity);
        this.weight = weight;
        this.weightValue = weight.getValue();
        this.pos = 0;
        this.norms = norms;
        
        int lowidx = greatestLowerBound(docnos, docvals, 0, docvals.length - 1,
                lowval);
        int hiidx = leastUpperBound(docnos, docvals, 0, docvals.length - 1,
                hival);
        
        // if the query isn't inclusive then shrink the range
        if (!inclusive)
        {
            while (lowidx <= hiidx && docvals[docnos[lowidx]] == lowval)
                lowidx++;
            while (hiidx >= lowidx && docvals[docnos[hiidx]] == hival)
                hiidx--;
        }
        this.docnos = new int[hiidx - lowidx + 1];
        for (int ii = 0; ii <= hiidx - lowidx; ii++) {
            this.docnos[ii] = docnos[ii + lowidx];
        }
        if (this.docnos.length > 1) Sort.quickSort(this.docnos, 0, this.docnos.length - 1);
    }

    public int doc()
    {
        return doc;
    }

    public boolean next() throws IOException
    {
        if (pos >= docnos.length)
        {
            doc = Integer.MAX_VALUE;
            return false;
        }
        doc = docnos[pos];
        pos++;
        return true;
    }

    public float score() throws IOException
    {
        return weightValue * Similarity.decodeNorm(norms[doc]); // normalize for
        // field
    }

    public boolean skipTo(int target) throws IOException
    {
        for (; pos < docnos.length; pos++)
        {
            if (docnos[pos] >= target)
            {
                doc = docnos[pos];
                pos++;
                return true;
            }
        }
        pos = docnos.length;
        doc = Integer.MAX_VALUE;
        return false;
    }

    public Explanation explain(int doc) throws IOException
    {
        IntegerRangeQuery query = (IntegerRangeQuery) weight.getQuery();
        Explanation explanation = new Explanation();

        explanation.setValue((float) 1.0);
        explanation
                .setDescription("all docs for numeric ranges use same scoring");

        return explanation;
    }

    public String toString()
    {
        return "scorer(" + weight + ")";
    }

    private static final int greatestLowerBound(int[] docnums, int[] docvals,
            int lo, int hi, int val)
    {
        int len = hi - lo;
        int half;
        int middle;

        while (len > 0) {
            half = len >> 1;
            middle = lo + half;
            if (docvals[docnums[middle]] < val) {
                lo = middle + 1;
                len = len - half - 1;
            } else len = half;
        }
        return lo;
    }

    private static final int leastUpperBound(int[] docnums, int[] docvals,
            int lo, int hi, int val)
    {
        int len = hi - lo;
        int half;
        int middle;
 
        while (len > 0) {
          half = len >> 1;
          middle = lo + half;
          if (val < docvals[docnums[middle]])
            len = half;
          else {
            lo = middle + 1;
            len = len - half - 1;
          }
        }
        return lo;
    }

}
