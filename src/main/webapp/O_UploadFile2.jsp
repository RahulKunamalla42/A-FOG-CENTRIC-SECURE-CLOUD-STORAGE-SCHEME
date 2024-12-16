
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A Fog centric Secure Cloud Storage Scheme</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
    <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">A Fog centric Secure Cloud Storage Scheme </small></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li  ><a href="O_HomePage.html"><span>Home Page</span></a></li>
          <li  class="active" ><a href="O_MainPage.jsp"><span>Data Owner </span></a></li>

          
          <li><a href="#"><span>End User</span></a></li>
		  <li><a href="#"><span>Cloud Server</span></a></li>
		            <li><a href="about.html"><span></span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <p class="infopost">A Fog centric Secure Cloud Storage Scheme</p>
          <div class="clr"></div>
		  <h5 align="right"><%=new java.util.Date()%></h5>
		  <h1> Upload Data:</h1>
		            <div class="clr"></div>
					   <%
	String owner = (String) application.getAttribute("oname");
	//String ocl=(String)application.getAttribute("uploadC");
%>
					    
						
						<% 
						
						long stime=System.currentTimeMillis();
						
						try 
	{
      		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String cont1 = request.getParameter("text1");
		String cont2 = request.getParameter("text2");
		String cont3 = request.getParameter("text3");
		String cont4 = request.getParameter("text4");
		
		String mac1 = request.getParameter("t1");
				String mac2 = request.getParameter("t2");
						String mac3 = request.getParameter("t3");
								String mac4 = request.getParameter("t4");
								
		String cloud = "cloud";
		String status ="Permit";
		
			
      	SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;

		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();

		Key pubKey = kp.getPublic();

		byte[] pub = pubKey.getEncoded();
		//				System.out.println("PUBLIC KEY" + pub);

		String pk = String.valueOf(pub);
		String rank = "0";
		Statement st = connection.createStatement();

		String user = "Data Owner";
		String task = "Upload";
		Statement st21 = connection.createStatement();
						st21.executeUpdate("insert into  cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,pstatus) values ('"
										+ file
										+ "','"
										+ owner
										+ "','"
										+ cloud
										+ "','"
										+ cont1
										+ "','"
										+ mac1
										+ "','"
										+ cont2
										+ "','"
										+ mac2
										+ "','"
										+ cont3
										+ "','"
										+ mac3
										+ "','"
										+ cont4
										+ "','"
										+ mac4
										+ "','"
										+ pk
										+ "','" + dt + "','" + status+ "')");
										
										
										Statement st211 = connection.createStatement();
						st211.executeUpdate("insert into  backupcloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,pstatus) values ('"
										+ file
										+ "','"
										+ owner
										+ "','"
										+ cloud
										+ "','"
										+ cont1
										+ "','"
										+ mac1
										+ "','"
										+ cont2
										+ "','"
										+ mac2
										+ "','"
										+ cont3
										+ "','"
										+ mac3
										+ "','"
										+ cont4
										+ "','"
										+ mac4
										+ "','"
										+ pk
										+ "','" + dt + "','" + status+ "')");
										
										
										Statement st2111 = connection.createStatement();
						st2111.executeUpdate("insert into  Audit(fname,ownername,cname,mac1,mac2,mac3,mac4,dt,pstatus) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ mac1									                                        + "','"+ mac2+ "','"+ mac3+ "','"+ mac4+ "','" + dt + "','" + status+ "')");
										
										
										
										
										String strQuery2 = "insert into transaction(user,fname,cname,sk,task,dt) values('"
					+ owner
					+ "','"
					+ file
					+ "','"
					+ cloud
					+ "','"
					+ pk
					+ "','"
					+ task
					+ "','" + dt + "')";
			connection.createStatement().executeUpdate(strQuery2);
			
			
			long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont1.length()+cont2.length()+cont3.length()+cont4.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
			
			
										
										%>
										<p>
										
<h2>Data Uploaded Successfully !!!</h2>
</p>
<br />
<p><a href="O_MainPage.jsp">BACK</a></p>
      		
			
      		
			

 <div class="clr"></div>
		
  <%

	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
          <div class="clr"></div>
        </div>
        <div class="article">
          <h2>&nbsp;</h2>
        </div>
        </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.jpg" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span></span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
                   <li class="active"><a href="O_MainPage.jsp"><span>Home Page</span></a></li>
          <li><a href="O_UploadFile.html"><span>Upload File </span></a></li>

          
          <li><a href="O_VerifyBlock.html"><span>Verify Block</span></a></li>
		  <li><a href="O_UpdateBlock.html"><span>Update Block</span></a></li>
		           <li><a href="O_DeleteFile.jsp"><span>Delete File</span></a></li><li><a href="O_ViewDeduplication.jsp"><span>View Deduplication</span></a></li>
            <li><a href="index.html">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>&nbsp;</h2>
        </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
      </div>
      <div class="col c3">
        <h2><span></span></h2>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf"></p>
      <p class="rf"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</html>
