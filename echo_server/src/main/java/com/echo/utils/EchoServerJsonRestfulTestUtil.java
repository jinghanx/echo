package com.echo.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;

public class EchoServerJsonRestfulTestUtil {
	public static void main(String[] args) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		JsonFactory f = new JsonFactory();
		JsonGenerator g = null;
		try {
			g = f.createJsonGenerator(out);
		 
			g.writeStartObject();
			g.writeObjectFieldStart("name");
			g.writeStringField("first", "Joe");
			g.writeStringField("last", "Sixpack");
			g.writeEndObject();
			g.writeStringField("gender", "male");
			g.writeBooleanField("verified", false);
			g.writeFieldName("userImage");
			byte[] binaryData = new byte[100];
			g.writeBinary(binaryData);
			g.writeEndObject();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (g != null) {
				try {
					g.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		String requestJSON = out.toString();
		System.out.println(requestJSON);
		
		HttpClient client = new DefaultHttpClient();
		HttpPut put = new HttpPut("http://localhost:8080/users");
		
		StringEntity se;
		try {
			se = new StringEntity(requestJSON);
			se.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
			put.setEntity(se);
			client.execute(put);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
