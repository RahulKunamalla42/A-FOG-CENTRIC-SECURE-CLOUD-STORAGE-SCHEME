

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
<title>File Request::A Fog centric Secure Cloud Storage Scheme</title>
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
.style1 {
	color: #FF0000;
	font-style: italic;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><small>A Fog centric Secure Cloud Storage Scheme</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li  ><a href="C_HomePage.html"><span>Home Page</span></a></li>
          <li  ><a href="#"><span>Data Owner </span></a></li>

          
         <li   ><a href="#"><span>End User</span></a></li>
		  <li class="active" ><a href="C_MainPage.jsp"><span>Cloud Server</span></a></li>
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
		   <h1 align="center">&nbsp;</h1>
		   <h1 align="center" class="style1">End User File Requests</h1>
		   <p align="center">&nbsp;</p>
		   <br/>
        
            <table width="800" border="1" align="center">
  <tr>
   <td ><div align="center"><span class="style3"><strong>EndUser Name</strong></span></div></td>
      <td ><div align="center"><span class="style3"><strong>File Request</strong> </span></div></td>
   
     <td ><div align="center"><span class="style3"><strong>Req Date Time</strong></span></div></td>
      <td ><div align="center"><span class="style3"><strong>Processed Status</strong> </span></div></td>
 
   
  </tr>
        
     <%
             	String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
             	int i = 0, j = 0, k = 0;
             	String fname = request.getParameter("fn");
             	try {

             		String query = "select * from userrequest ";
             		Statement st = connection.createStatement();
             		ResultSet rs = st.executeQuery(query);
             		while (rs.next()) {
             			s1 = rs.getString(1);
             			s2 = rs.getString(2);
             			s3 = rs.getString(3);
             			s4 = rs.getString(4);
             			s5 = rs.getString(5);
             			
             %>
		

  <tr>
		<td height="29">
		<div align="center"><%=s1%></div>
		</td>
		<td>
		<div align="center"><%=s2%></div>
		</td>

		
		<td height="29">
		<div align="center"><%=s3%></div>
		</td>

		
	
		
		<%if(!s5.equalsIgnoreCase("Waiting"))
		{%>
		<td height="29">
			<div align="center"><%=s5%></div>
		
		</td>
		<%}
		else
		{%>
		<td height="29">
	<div align="center"><a href="Process.jsp?uname=<%=s1%>&fname=<%=s2%>"><%=s5%></a></div>
		</td>
	<%	}%>
		
	
	</tr>

<%
	}

		connection.close();
	}

	catch (Exception e) {
		out.println(e.getMessage());
	}
%>


</table></p>
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
                   <li class="active"><a href="C_MainPage.jsp"><span>Home Page</span></a></li>
          <li><a href="C_ViewDataOwners.jsp"><span>View Data Owners </span></a></li>

          
          <li><a href="C_ViewEndUsers.jsp"><span>View End Users</span></a></li>
	 <li><a href="C_ViewFileRequest.jsp"><span>View File Requests</span></a></li>
		            <li><a href="C_ViewAttackers.jsp"><span>View Attackers</span></a></li>
					
		            <li><a href="C_ViewTransaction.jsp"><span>View Transactions</span></a></li>
					<li><a href="C_ViewBlockDetails.jsp"><span>View Blocks</span></a></li>
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
