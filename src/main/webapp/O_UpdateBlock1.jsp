
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
        <h1><a href="index.html">A Fog centric Secure Cloud Storage Scheme</a></h1>
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
					   
					    <% try 
	{
      		String file=request.getParameter("file");
			String block=request.getParameter("block");
      		String cont=request.getParameter("cont");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h="";
      		String filename="filename.txt";
			String filename1="filename1.txt";
			String filename2="filename2.txt";
			String filename3="filename3.txt";
			String filename4="filename4.txt";
			
      		
      		
			
      		
			
			String encryptedValue3="",encryptedValue2="",encryptedValue1="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
				 	
												
			
			
			
			
			
			
      	
			PrintStream p1 = new PrintStream(new FileOutputStream("filename1.txt"));
			p1.print(new String(encryptedValue));
			
			
		
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream("filename1.txt");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h = bi1.toString(16);
			
			
			
			
      	
	
%>
 <div class="clr"></div>
					
          <form action="O_UpdateBlock2.jsp" method="post">
<table width="598" border="1" align="center">

	<tr>
		<td width="286"><span class="style4">File Name :- </span></td>
		<td width="356"><input name="file" type="text" id="t42" size="50"
			value="<%= file %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td width="286"><span class="style4"><input name="block" type="text" id="t42" size="50"
			value="<%= block %>" readonly="readonly" /> :</span></td>
		<td width="286"><span class="style4"></span></td>
	
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><textarea name="cont" cols="50" rows="15" readonly><%= encryptedValue%></textarea></td>
	</tr>
	<tr>
		<td><span class="style4">MAC: </span></td>
		<td><input name="mac" type="text" id="t4" size="50"
			value="<%= h %>" readonly="readonly" /></td>
	</tr>
	
	<tr>
		<td>
		<div align="right"></div>
		</td>
		<td><input type="submit" name="Submit2" value="Update" /></td>
	</tr>
</table>
</form>
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
