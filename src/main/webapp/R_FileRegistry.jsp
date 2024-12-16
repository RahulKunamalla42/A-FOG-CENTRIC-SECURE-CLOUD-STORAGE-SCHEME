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
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {color: #FF0000; font-weight: bold; }
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
          
          <p class="infopost">
            <marquee behavior="alternate">
            WELCOME TO FILE REGISTRY DETAILS 
            </marquee> 
          </p>
          <div class="clr"></div>
          <div class="img"></div>
        </div>
         <% try 
	{
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s77="";
      		



	String query="select * from permitlog "; 
    Statement st5=connection.createStatement();
    ResultSet rs=st5.executeQuery(query);

	%>
         <table width="633" align="center" border="1" cellpadding="3">
	<tr><td width="192"><div align="center" class="style1"><strong>File Name</strong></div></td>
	<td width="210"><div align="center" class="style2">Owner Name</div></td>
	<td width="223"><div align="center" class="style2">Date and Time</div></td>
	</tr>
	<%	
	
	
	while ( rs.next() )
{

s2=rs.getString(1);
s7=rs.getString(2);
s77=rs.getString(3);
			
			
			%>
			
		<tr><td><div align="center"><%=s2%></div></td><td><div align="center"><%=s7%></div></td><td><div align="center"><%=s77%></div></td></tr>	<br />
<%
	
}
	   
%>
</table>
          <p>
            <%
         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
          <p><a href="R_MainPage.jsp">Back</a>
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
				   
				   <li><a href="R_FileRegistry.jsp"><span>View All File Registry Details </span></a></li>

          
          <li><a href="R_FileAuditingRegistry.jsp"><span>View All Public Auditing Registry</span></a></li>
		  <li><a href="O_UpdateBlock.html"><span>View All Fog Server1 Registry Details</span></a></li>
		            <li><a href="O_DeleteFile.jsp"><span>View All Attacker Registry Details</span></a></li>


          
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
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
</html>
</strong>