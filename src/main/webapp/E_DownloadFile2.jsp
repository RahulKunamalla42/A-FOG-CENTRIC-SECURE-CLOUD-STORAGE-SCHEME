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
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Download::A Fog centric Secure Cloud Storage Scheme</title>

<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type" content="text/html; charset=windows-1252" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>

<script type='text/javascript'>

function saveTextAsFile()
{
    var textToWrite = document.getElementById("textarea").value;
    var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
    var fileNameToSaveAs = "File.txt";

    var downloadLink = document.createElement("a");
    downloadLink.download = fileNameToSaveAs;
    downloadLink.innerHTML = "Download File";
    if (window.webkitURL != null)
    {
        // Chrome allows the link to be clicked
        // without actually adding it to the DOM.
        downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
    }
    else
    {
        // Firefox requires the link to be added to the DOM
        // before it can be clicked.
        downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
        downloadLink.onclick = destroyClickedElement;
        downloadLink.style.display = "none";
        document.body.appendChild(downloadLink);
    }

    downloadLink.click();
}

function destroyClickedElement(event)
{
    document.body.removeChild(event.target);
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
          <li><a href="E_HomePage.html"><span>Home Page</span></a></li>
          <li><a href="#"><span>Data Owner</span></a></li>
          <li class="active"><a href="E_MainPage.jsp"><span>End User</span></a></li>
          <li><a href="#"><span>Cloud Server</span></a></li>
          <li><a href="about.html"><span>About</span></a></li>
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
           <h2 align="center">&nbsp;</h2>
           <h2 align="center"><b>Download File</b> </h2>
           <p align="center">&nbsp;</p>
           <%
            try {
                String file = request.getParameter("t1");
                String owner = request.getParameter("oname");
                String mac1 = request.getParameter("t12");
                String mac2 = request.getParameter("t122");
                String mac3 = request.getParameter("t123");
                String mac4 = request.getParameter("t124");
                String sk = request.getParameter("t13");

                application.setAttribute("file2", file);
                application.setAttribute("sk2", sk);

                String strQuery = "select * from cloudserver where fname='"
                        + file
                        + "' and ownername='"
                        + owner
                        + "' and  mac1='"
                        + mac1
                        + "' and  mac2='"
                        + mac2
                        + "' and  mac3='"
                        + mac3
                        + "' and  mac4='"
                        + mac4
                        + "' and  sk='" + sk + "'";
            
                String strQuery1 = "select * from cloudserver where fname='" + file + "'";
                ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
                ResultSet rs = connection.createStatement().executeQuery(strQuery);
                
                if(rs1.next())
                {
                    if(rs.next())
                    {
                        String ct1 = rs.getString(4);
                        String ct2 = rs.getString(6);
                        String ct3 = rs.getString(8);
                        String ct4 = rs.getString(10);

                        String keys = "ef50a0ef2c3e3a5f";
                        byte[] keyValue1 = keys.getBytes();
                        Key key1 = new SecretKeySpec(keyValue1, "AES");
                        Cipher c1 = Cipher.getInstance("AES");
                        c1.init(Cipher.DECRYPT_MODE, key1);

                        // Decrypting the ciphertext
                        byte[] decodedValue1 = Base64.decode(ct1.getBytes());
                        byte[] decryptedValue1 = c1.doFinal(decodedValue1);
                        
                        byte[] decodedValue2 = Base64.decode(ct2.getBytes());
                        byte[] decryptedValue2 = c1.doFinal(decodedValue2);
                        
                        byte[] decodedValue3 = Base64.decode(ct3.getBytes());
                        byte[] decryptedValue3 = c1.doFinal(decodedValue3);
                        
                        byte[] decodedValue4 = Base64.decode(ct4.getBytes());
                        byte[] decryptedValue4 = c1.doFinal(decodedValue4);

                        %>
                        <p align="center" class="style1">File Contents</p>

                        <label>
                            <div align="center">
                                <textarea name="text" id="textarea" cols="45" rows="17">
                                    <%= new String(decryptedValue1, "ISO-8859-1") %>
                                    <%= new String(decryptedValue2, "ISO-8859-1") %>
                                    <%= new String(decryptedValue3, "ISO-8859-1") %>
                                    <%= new String(decryptedValue4, "ISO-8859-1") %>
                                </textarea>
                                <br/>
                                <br/>
                                <td><button onClick="saveTextAsFile()">Download</button></td>
                            </div>
                        </label>
                        <p align="center">&nbsp; </p>
                        <%
                    } 
                    else {
                        SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                        SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

                        Date now = new Date();
                        String strDate = sdfDate.format(now);
                        String strTime = sdfTime.format(now);
                        String dt = strDate + "   " + strTime;

                        String user = (String) application.getAttribute("uname");
                        String type = "Internal";
                        String strQuery2 = "insert into attacker(user,fname,ownername,sk,type,dt) values('"
                                + user + "','" + file + "','" + owner + "','" + sk + "','" + type + "','" + dt + "')";
                        connection.createStatement().executeUpdate(strQuery2);
                        %>
                        <script language="JavaScript">
                            alert("The Mac Address You Entered is Invalid");
                            document.location="E_HomePage.html";
                        </script>
                        <%
                    }
                } 
                else {
                    SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

                    Date now = new Date();
                    String strDate = sdfDate.format(now);
                    String strTime = sdfTime.format(now);
                    String dt = strDate + "   " + strTime;

                    String user = (String) application.getAttribute("uname");
                    String type = "External";
                    String strQuery2 = "insert into attacker(user,fname,ownername,sk,type,dt) values('"
                            + user + "','" + file + "','" + owner + "','" + sk + "','" + type + "','" + dt + "')";
                    connection.createStatement().executeUpdate(strQuery2);
                    %>
                    <script language="JavaScript">
                        alert("The file name you entered is invalid");
                        document.location="E_HomePage.html";
                    </script>
                    <%
                }
            } 
            catch (Exception e) {
                e.printStackTrace();
            }
           %>
        </div>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </div>
    </div>
  </div>
  <div class="clr"></div>
</div>
</body>
</html>
