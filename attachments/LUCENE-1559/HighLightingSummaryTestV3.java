package com.amin.app.lucene.util;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertTrue;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringReader;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLEncoder;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.junit.Before;
import org.junit.Test;

/**
 * Test shows with certain terms highlighting does not occur even though the search term returns the result.
 * Line 536 in the file contains the word "document"
 */

public class HighLightingSummaryTestV3 {
	
	private static final String FILE_NAME = "fileToSearch.txt";
	private File fileToBeIndexed = null;
	Document documentToBeIndexed;
	private Directory directory;
	private StandardAnalyzer analyzer = new StandardAnalyzer();
	
	@Before
	public void setUp() throws Exception {
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(FILE_NAME);
		fileToBeIndexed = new File(FILE_NAME);
		InputStreamUtils.convertInputStreamToFile(inputStream, fileToBeIndexed);
		directory = new RAMDirectory();
		
		StringBuilder builder = new StringBuilder();
		
		try {
			BufferedReader  br = new BufferedReader(new InputStreamReader(new FileInputStream(fileToBeIndexed)));
			String line = null;
			while((line = br.readLine())!= null) {
				builder.append(line);
			}
			br.close();
		} catch (IOException e) {
		}
		String body = builder.toString();
		
		Document document = new Document();
		Field field = new Field("body",body, Field.Store.COMPRESS, Field.Index.ANALYZED); 
		document.add(field);
	
		IndexWriter indexWriter = new IndexWriter(directory,analyzer,IndexWriter.MaxFieldLength.UNLIMITED);
		indexWriter.addDocument(document);
		indexWriter.commit();
		indexWriter.close();
	}
	
	
	@Test //PASSES
	public void testSummaryGeneratedWithHighLightForFile() throws Exception {
		IndexSearcher indexSearcher = new IndexSearcher(directory);
		QueryParser queryParser = new MultiFieldQueryParser(new String[] {"body"}, analyzer);
		String term = "aspectj";
		Query query = queryParser.parse(term);
		TopDocs topDocs = indexSearcher.search(query,null, 100, Sort.RELEVANCE);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		
		assertNotNull(scoreDocs);
		assertEquals(1, scoreDocs.length);
		
		Highlighter highlighter = buildHtmlHighlighter(indexSearcher, query);
		
		for (ScoreDoc scoreDoc : scoreDocs) {
			final Document doc = indexSearcher.doc(scoreDoc.doc);
			String buildSummaryWithHighlighedText = buildSummaryWithHighlighedText(highlighter, doc);
			assertNotNull(buildSummaryWithHighlighedText);
			assertNotSame("", buildSummaryWithHighlighedText);
			assertTrue(buildSummaryWithHighlighedText.contains("<span"));
		}
		indexSearcher.close();
	}
	
	
	@Test
	public void testSummaryGeneratedWithHighLightDoesNotWorkForFile() throws Exception {
		IndexSearcher indexSearcher = new IndexSearcher(directory);
		QueryParser queryParser = new MultiFieldQueryParser(new String[] {"body"}, analyzer);
		String term = "document";
		Query query = queryParser.parse(term);
		TopDocs topDocs = indexSearcher.search(query,null, 100, Sort.RELEVANCE);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		
		assertNotNull(scoreDocs);
		assertEquals(1, scoreDocs.length);
		
		Highlighter highlighter = buildHtmlHighlighter(indexSearcher, query);
		
		for (ScoreDoc scoreDoc : scoreDocs) {
			final Document doc = indexSearcher.doc(scoreDoc.doc);
			//the term document was extracted and stored
			assertTrue(doc.get("body").contains("document"));
			String buildSummaryWithHighlighedText = buildSummaryWithHighlighedText(highlighter, doc);
			assertNotNull(buildSummaryWithHighlighedText);
			assertNotSame("", buildSummaryWithHighlighedText);
			
			//failures here as no summary was generated...
			assertTrue(buildSummaryWithHighlighedText.contains("<span"));
		}
		indexSearcher.close();
	}
	
	private Highlighter buildHtmlHighlighter(IndexSearcher indexSearcher,Query query) throws IOException {
		SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<span class=\"highlight\"><b>", "</b></span>");
		//required for highlighting
		Query query2 = indexSearcher.rewrite(query);
		Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query2));
		SimpleHTMLEncoder simpleHTMLEncoder = new SimpleHTMLEncoder();
		highlighter.setEncoder(simpleHTMLEncoder);
		return highlighter;
	}


	private String buildSummaryWithHighlighedText(Highlighter highlighter,final Document doc) throws IOException {
		String text= doc.get("body");
		TokenStream tokenStream = analyzer.tokenStream("body", new StringReader(text));
		String result = highlighter.getBestFragments(tokenStream, text, 3, "...");
		return result;
	}
	
	private static class InputStreamUtils {
		
		public static void convertInputStreamToFile(InputStream inputStream, File file) {
			try
		    {
			    OutputStream out=new FileOutputStream(file);
			    byte buf[]=new byte[1024];
			    int len;
			    while((len=inputStream.read(buf))>0)
			    out.write(buf,0,len);
			    out.close();
			    inputStream.close();
			    
		    }catch (IOException e){
		    	throw new IllegalStateException(e);
		    }
		}
	}
}
