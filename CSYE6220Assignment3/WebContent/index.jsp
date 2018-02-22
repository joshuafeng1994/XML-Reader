<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.xml.sax.SAXException"%>
<%@page import="javax.xml.parsers.ParserConfigurationException"%>
<%@page import="org.w3c.dom.NamedNodeMap"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My RSS Page</title>
</head>

<body>
<form method="post">
Feed URL: <input type="text" name="url"><input type="submit" value="Add subscription" id="click">
</form>

<hr>
<%
	
%>
<%
		String url1 = "http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk";
		DocumentBuilderFactory dbfrss1 = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder dbrss1 = dbfrss1.newDocumentBuilder();
			Document doc1 = dbrss1.parse(url1);
			
			
			NodeList rssTitle1 = doc1.getElementsByTagName("title");
			NodeList rssUrl1 = doc1.getElementsByTagName("link");
%>
<%			for(int i =0; i<rssTitle1.getLength()&&i<10; i++) {	%>
				
			
	<a href="<% 	out.println(rssUrl1.item(i).getFirstChild().getNodeValue());	%>">
		<% 	out.println(rssTitle1.item(i).getFirstChild().getNodeValue());	%>
			<%// 	out.println(rssUrl1.item(i).getFirstChild().getNodeValue());%> </a><br>
<%			}
	
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		

%>
<hr>
<%
		String url2 = "http://feeds.reuters.com/reuters/businessNews";
		DocumentBuilderFactory dbfrss2 = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder dbrss2 = dbfrss2.newDocumentBuilder();
			Document doc2 = dbrss2.parse(url2);
			
			
			NodeList rssTitle2 = doc2.getElementsByTagName("title");
			NodeList rssUrl2 = doc2.getElementsByTagName("link");
			

%>
		<% 	for(int i =0; i<rssTitle2.getLength()&&i<10; i++) {	%>
				
		
	<a href="<% out.println(rssUrl2.item(i).getFirstChild().getNodeValue());%>">
	<% //out.println(rssUrl2.item(i).getFirstChild().getNodeValue());%>
	<% out.println(rssTitle2.item(i).getFirstChild().getNodeValue());%>
</a><br>


		<%	}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}


%>
<hr>

<%	
//	List<String> urls = new ArrayList<String>();
	String getUrl = request.getParameter("url");
	
//	session.setAttribute("0", getUrl);
//	urls.add((String)session.getAttribute("0"));
	
	
	
	//out.println(getUrl);
//	for(int j=0; j<urls.size();j++){
//		session.setAttribute(Integer.toString(j), getUrl);
		//urls.add((String)session.getAttribute(String.valueOf(j)));
			
	DocumentBuilderFactory dbfGetRss = DocumentBuilderFactory.newInstance();
	try {
		DocumentBuilder dbrssGet = dbfGetRss.newDocumentBuilder();
		Document docGetRss = dbrssGet.parse(getUrl);

		NodeList rssTitle = docGetRss.getElementsByTagName("title");
		NodeList rssUrl = docGetRss.getElementsByTagName("link");
%>

<%		for(int i =0; i<rssTitle.getLength()&&i<10; i++) {	
			
		
		
%>
				
			
	<a href="<% out.println(rssUrl.item(i).getFirstChild().getNodeValue());	%>">
	<% 	out.println(rssTitle.item(i).getFirstChild().getNodeValue());	%>
			<% //	out.println(rssUrl.item(i).getFirstChild().getNodeValue());%> </a><br>
			
<%			}%>
	<hr>
<%		} catch (Exception e) {
			// TODO: handle exception
		}
		
//	}
	

%>

</body>

</html>


