
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

	<%
	String owner=(String)application.getAttribute("oname");
	
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
   		try {
		
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		
	   	    String mac1,mac2; 
		   	String query1="";
			String query2="";
			if(block.equalsIgnoreCase("Block1"))
			{
			query1="select mac1 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac1 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			query1="select mac2 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac2 from cloudserver where fname='"+file+"' and ownername='"+owner+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			query1="select mac3 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			query1="select mac4 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
						query2="select mac4 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query1);
	   if ( rs1.next() )
	      {
		    mac1=rs1.getString(1);
		   
		   
		    Statement st2=connection.createStatement();
		 
            ResultSet rs2=st2.executeQuery(query2);
	   if ( rs2.next() )
	      {
		   mac2=rs2.getString(1);
		   
		   if(mac1.equalsIgnoreCase(mac2))
		   {
		  // String ss="File Is Safe";
		  // application.setAttribute("fname",file);
		  //application.setAttribute("attacker",ss);
		  %>
<h1> File Named---- <%=file%>  ---- Block Named  --- <%=block %> ---  is Safe</h1><a href="O_VerifyBlock.html">Back</a></br>

		  <%
		  String status="Safe";
   		    Statement st11=connection.createStatement();
            st11.executeUpdate("insert into auditlog(fname,owner,dt,status)values('"+file+"','"+owner+"','"+dt+"','"+status+"')");
		  
		  
		   }
		   else
		   {%>
		   <h1> File Named---<%=file%>  ---- Block Named  --- <%=block %> ---is Not Safe</h1><a href="O_VerifyBlock.html">Back</a>Do you Want to recover <a href="recover.jsp?owner=<%=owner%>&block=<%=block%>&file=<%=file%>">Recover</a><%
		   
		 		  String status="Attacked";
				    Statement st111=connection.createStatement();
            st111.executeUpdate("insert into auditlog(fname,owner,dt,status)values('"+file+"','"+owner+"','"+dt+"','"+status+"')");
				  
		   }
		    
		   
		   }}
		   else
		   {%>
		   <h1> File doesnot exist</h1><a href="O_VerifyBlock.html">Back</a><%
		   }
		   
		   
		   
		   
		   
		   
		 
		  
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		//response.sendRedirect("O_VerifyBlock1.jsp");  
	%>
