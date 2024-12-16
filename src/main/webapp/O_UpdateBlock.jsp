
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
    <style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
.style2 {color: #FF0000}
-->
    </style>
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
		  <h1>Update Block File:</h1>
		  <p>&nbsp;</p>
		  <div class="clr"></div>
					<%
				
					String owner=(String)application.getAttribute("oname");
	
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
   		try {
	   	  
		   	String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			String cont="";
			if(block.equalsIgnoreCase("Block1"))
			{
			
			query2="select ct1 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			
			query2="select ct2 from cloudserver where fname='"+file+"' and ownername='"+owner+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			
			query2="select ct3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			
						query2="select ct4 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query2);
			
			if(rs1.next())
			{
			cont=rs1.getString(1);
			
			}
			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(cont.getBytes()));
					%>
           <form id="form1" name="form1" method="post" action="O_UpdateBlock1.jsp">
          <table width="598" border="1" align="center">
            <tr>
              <td width="286"><span class="style4 style2"><strong>Enter File Name</strong></span></td>
              <td width="356"><input required="required" type="text" name="file" id="file" value="<%=file%>" size="50" /></td>
            </tr>
            <tr>
              <td class="style4"><span class="style1">Select The Block </span></td>
           <td width="356"><input required="required" type="text" name="block" id="file" value="<%=block%>" size="50" /></td>
            </tr>
            <tr>
              <td class="style4">Block Contents </td>
    <td><textarea name="cont" id="textarea"  cols="50" rows="15"><%=decryptedValue%></textarea></td>
            </tr>
            <tr>
              <td><div align="right"></div></td>
              <td><input type="submit" name="Submit" value="Update Block" /></td>
            </tr>
          </table>
  </form><%
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }%>
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
		                  <li><a href="O_DeleteFile.jsp"><span>Delete File</span></a></li> <li><a href="O_ViewBlocks.jsp"><span>View Block Files</span></a></li>
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
