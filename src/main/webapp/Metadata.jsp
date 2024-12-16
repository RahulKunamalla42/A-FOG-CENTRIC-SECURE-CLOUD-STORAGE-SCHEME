
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

<html>
         <% try 
	{
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="";
      		
String Status="Permitted";

	String query="select * from audit where pstatus='"+ Status + "'  "; 
    Statement st5=connection.createStatement();
    ResultSet rs=st5.executeQuery(query);

	%>
         <h1>View Block Details <span style="color:#FF00FF"> </span>
	     <table width="918" align="center" border="1" cellpadding="3">
	<tr><td width="115">File Name</td>
	<td width="119">Owner Name</td>
	<td width="123">Block1--MAC-1</td>
	<td width="150">Block2--MAC-2</td>
	<td width="150">Block3--MAC-3</td>
	<td width="150">Block4--MAC-4</td>
	<td width="37">DT</td>
	</tr>
	<%	
	
	
	while ( rs.next() )
{
s1=rs.getString(1);
s2=rs.getString(2);
s3=rs.getString(4);
s4=rs.getString(5);
s5=rs.getString(6);
s6=rs.getString(7);
s7=rs.getString(8);

	
			
			
			
			%>
		<tr><td><%=s1%></td><td><%=s2%></td><td><%=s3%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td></tr>	

 <%

}
	   
%>
</table>
<%
         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
</html>