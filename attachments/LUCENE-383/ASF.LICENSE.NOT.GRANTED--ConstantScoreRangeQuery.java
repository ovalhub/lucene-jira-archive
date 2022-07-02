package org.apache.lucene.search;

/**
 * Copyright 2004 The Apache Software Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.apache.lucene.index.IndexReader;

import java.io.IOException;

/**
 * A Query that can handle any number of terms (unlike the standard RangeQuery
 * which expands to a boolean query).
 * A constant score is produced for all documents in the range.
 * <p>
 * If an endpoint is null, it is said to be "open".
 * Either or both endpoints may be open.  Open endpoints may not be exclusive
 * (you can't select all but the first or last term without explicitly specifying them.)
 *
 * @author yonik
 * @version $Id: ConstantScoreRangeQuery.java,v 1.1 2005/04/24 23:33:00 yonik Exp $
 */

public class ConstantScoreRangeQuery extends Query
{
  private final String fieldName;
  private final String lowerVal;
  private final String upperVal;
  private final boolean includeLower;
  private final boolean includeUpper;

  private final float constantScore;

  static float DEFAULT_SCORE=1e-4f;
  public static float getDefaultScore() {
    return DEFAULT_SCORE;
  }
  public static void setDefaultScore(float defaultScore) {
    DEFAULT_SCORE=defaultScore;
  }


  public ConstantScoreRangeQuery(String fieldName, String lowerVal, String upperVal, boolean includeLower, boolean includeUpper) {
    this(fieldName,lowerVal,upperVal,includeLower,includeUpper,DEFAULT_SCORE);
  }

  public ConstantScoreRangeQuery(String fieldName, String lowerVal, String upperVal, boolean includeLower, boolean includeUpper, float constantScore)
  {
    this.constantScore = constantScore;

    // do a little bit of normalization...
    // open ended range queries should always be inclusive.
    if (lowerVal==null) {
      includeLower=true;
    } else if (includeLower && lowerVal.equals("")) {
      lowerVal=null;
    }
    if (upperVal==null) {
      includeUpper=true;
    }


    this.fieldName = fieldName.intern();  // intern it, just like terms...
    this.lowerVal = lowerVal;
    this.upperVal = upperVal;
    this.includeLower = includeLower;
    this.includeUpper = includeUpper;
  }

  /** Returns the field name for this query */
  public String getField() { return fieldName; }
  /** Returns the value of the lower endpoint of this range query, null if open ended */
  public String getLowerVal() { return lowerVal; }
  /** Returns the value of the upper endpoint of this range query, null if open ended */
  public String getUpperVal() { return upperVal; }
  /** Returns <code>true</code> if the lower endpoint is inclusive */
  public boolean includesLower() { return includeLower; }
  /** Returns <code>true</code> if the upper endpoint is inclusive */
  public boolean includesUpper() { return includeUpper; }

  public Query rewrite(IndexReader reader) throws IOException {
    // TODO: if number of terms are low enough, rewrite to a BooleanQuery
    // or RangeQuery.rewrite() for potentially faster execution.

    // Map to RangeFilter semantics which are slightly different...
    RangeFilter rangeFilt = new RangeFilter(fieldName,
            lowerVal!=null?lowerVal:"",
            upperVal, lowerVal==""?false:includeLower, upperVal==null?false:includeUpper);
    return new ConstantScoreQuery(rangeFilt,constantScore);
  }

    /** Prints a user-readable version of this query. */
    public String toString(String field)
    {
        StringBuffer buffer = new StringBuffer();
        if (!getField().equals(field))
        {
            buffer.append(getField());
            buffer.append(":");
        }
        buffer.append(includeLower ? '[' : '{');
        buffer.append(lowerVal != null ? lowerVal : "*");
        buffer.append(" TO ");
        buffer.append(upperVal != null ? upperVal : "*");
        buffer.append(includeUpper ? ']' : '}');
        if (getBoost() != 1.0f)
        {
            buffer.append("^");
            buffer.append(Float.toString(getBoost()));
        }
        return buffer.toString();
    }

    /** Returns true if <code>o</code> is equal to this. */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ConstantScoreRangeQuery)) return false;
        ConstantScoreRangeQuery other = (ConstantScoreRangeQuery) o;

        if (this.fieldName != other.fieldName  // interned comparison
            || this.includeLower != other.includeLower
            || this.includeUpper != other.includeUpper
           ) { return false; }
        if (this.lowerVal != null ? !this.lowerVal.equals(other.upperVal) : other.lowerVal != null) return false;
        if (this.upperVal != null ? !this.upperVal.equals(other.upperVal) : other.upperVal != null) return false;
        return this.getBoost() == other.getBoost();
    }

    /** Returns a hash code value for this object.*/
    public int hashCode() {
      int h = Float.floatToIntBits(getBoost()) ^ fieldName.hashCode();
      // hashCode of "" is 0, so don't use that for null...
      h ^= lowerVal != null ? lowerVal.hashCode() : 0x965a965a;
      // don't just XOR upperVal with out mixing either it or h, as it will cancel
      // out lowerVal if they are equal.
      h ^= (h << 17) | (h >>> 16);  // a reversible (one to one) 32 bit mapping mix
      h ^= (upperVal != null ? (upperVal.hashCode()) : 0x5a695a69);
      h ^= (includeLower ? 0x665599aa : 0x5566aa99)
         ^ (includeUpper ? 0x99aa5566 : 0xaa996655);
      return h;
    }
}
