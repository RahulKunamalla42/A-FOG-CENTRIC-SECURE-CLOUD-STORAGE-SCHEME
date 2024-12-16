<html>
<head></head>
<body>


<%@ page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<%
try
{
String fname=request.getParameter("fname");
String oname=request.getParameter("oname");


			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;

				String resp="Permitted";
				
				Statement stss=connection.createStatement();
				stss.executeUpdate("Update cloudserver set pstatus='"+resp+"' where fname='"+fname+"' and ownername='"+oname+"'  ");
				
				
				Statement stss1=connection.createStatement();
				stss1.executeUpdate("Update audit set pstatus='"+resp+"' where fname='"+fname+"' and ownername='"+oname+"'  ");
				

				Statement st=connection.createStatement();
				st.executeUpdate("insert into permitlog (fname,oname,dt) values('"+fname+"','"+oname+"','"+dt+"') ");
				



 response.sendRedirect("P_ViewFilesToPermit.jsp");
}
catch(Exception e)
{
e.printStackTrace();

}

%>


</html>
</body>