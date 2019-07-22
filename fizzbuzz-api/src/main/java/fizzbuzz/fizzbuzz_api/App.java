package fizzbuzz.fizzbuzz_api;

import java.io.IOException;
import java.net.URISyntaxException;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;


public class App 
{
    public static void main( String[] args )
    {
    	
    	
    	Options options = new Options();
    	
    	Option getPage   = Option.builder()
    		         .longOpt("get_page")
    		         .argName("page_number" )
    		         .hasArg()
    		         .desc("get the corresponding fizzbuzz page" )
    		         .build();
    	
    	Option pageSize   = Option.builder()
		         .longOpt("page_size")
		         .argName("page_size" )
		         .hasArg()
		         .desc("set number of elements from the corresponding fizzbuzz page" )
		         .build();
    	
    	
    	Option setFav   = Option.builder()
		         .longOpt("favourite")
		         .argName("favourite" )
		         .hasArg()
		         .desc("set the corresponding element as favourite" )
		         .build();
    	
    	Option unsetFav   = Option.builder()
		         .longOpt("unset_favourite")
		         .argName("unset_favourite" )
		         .hasArg()
		         .desc("unset the corresponding element as favourite" )
		         .build();
    	
    	Option help   = Option.builder()
		         .longOpt("help")
		         .desc("Display the help" )
		         .build();


    	options.addOption(getPage);
    	options.addOption(pageSize);
     	options.addOption(setFav);
     	options.addOption(unsetFav);
     	options.addOption(help);
    	
        CommandLineParser parser = new DefaultParser();
        try {
            // parse the command line arguments
            CommandLine line = parser.parse( options, args );
            
            
            if(line.hasOption("get_page")) {
                
                try {
                	
                    if(line.hasOption("page_size")) { 
                    	
                    	getPageHttp(line.getOptionValue( "get_page" ), line.getOptionValue( "page_size" ));
                    	
                    }
                    else {
    					getPageHttp(line.getOptionValue( "get_page" ), null);
                    }
                                    	
				} catch (Exception e) {
					e.printStackTrace();
					System.err.println( "Exception while calling the fizzbuzz app: " + e.getMessage() );
				}
             }
            
            else if (line.hasOption("favourite")) {
            	            	
            	try {
					putFavourite(line.getOptionValue( "favourite" ));
				} catch (Exception e) {
					e.printStackTrace();
					System.err.println( "Exception while calling the fizzbuzz app: " + e.getMessage() );
				}
            }
            else if (line.hasOption("unset_favourite")) {
            	
            	try {
            		delFavourite(line.getOptionValue( "unset_favourite" ));
				} catch (Exception e) {
					e.printStackTrace();
					System.err.println( "Exception while calling the fizzbuzz app: " + e.getMessage() );
				}
            }
            else if (line.hasOption("help")) {
            	 HelpFormatter formatter = new HelpFormatter();
                 formatter.printHelp("FizzBuzz API", options);
            }
            
            
            
        }
        catch( ParseException exp ) {
            // oops, something went wrong
            System.err.println( "Parsing failed.  Reason: " + exp.getMessage() );
        }
    }
    
    
    public static void getPageHttp (String number, String pageSize) throws IOException, URISyntaxException {
    	
    	
    	
    	CloseableHttpClient httpclient = HttpClients.createDefault();
    	URIBuilder builder = new URIBuilder("http://localhost:4000/api/page");
    	builder.setParameter("page", number);
    	if (pageSize != null) {
    		builder.setParameter("page_size", pageSize);
    	}
    	HttpGet httpGet = new HttpGet(builder.build());
   
    	CloseableHttpResponse response1 = httpclient.execute(httpGet);
    	
    	try {
    	    System.out.println(response1.getStatusLine());
    	    HttpEntity entity1 = response1.getEntity();
    	    
    	    System.out.println(EntityUtils.toString(entity1));
    	    EntityUtils.consume(entity1);
    	} finally {
    	    response1.close();
    	}
    	    	
    }
    
    
    public static void putFavourite (String number) throws IOException, URISyntaxException {
    	
    
    	CloseableHttpClient httpclient = HttpClients.createDefault();
    	URIBuilder builder = new URIBuilder("http://localhost:4000/api/favourite/"+number);
    	HttpPut httpPut = new HttpPut(builder.build());
   
    	CloseableHttpResponse response1 = httpclient.execute(httpPut);
    	
    	try {
    	    System.out.println(response1.getStatusLine());
    	    HttpEntity entity1 = response1.getEntity();
    	    
    	    System.out.println(EntityUtils.toString(entity1));
    	    EntityUtils.consume(entity1);
    	} finally {
    	    response1.close();
    	}
    	    	
    }
    
    
    public static void delFavourite (String number) throws IOException, URISyntaxException {
    	
    
    	CloseableHttpClient httpclient = HttpClients.createDefault();
    	URIBuilder builder = new URIBuilder("http://localhost:4000/api/favourite/"+number);
    	HttpDelete httpDel = new HttpDelete(builder.build());
   
    	CloseableHttpResponse response1 = httpclient.execute(httpDel);
    	
    	try {
    	    System.out.println(response1.getStatusLine());
    	    HttpEntity entity1 = response1.getEntity();
    	    
    	    System.out.println(EntityUtils.toString(entity1));
    	    EntityUtils.consume(entity1);
    	} finally {
    	    response1.close();
    	}
    	    	
    }
}

