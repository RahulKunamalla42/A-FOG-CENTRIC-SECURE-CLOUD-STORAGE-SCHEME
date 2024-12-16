<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.*, java.sql.*, java.io.*, javax.crypto.*, javax.crypto.spec.*, java.text.SimpleDateFormat, java.util.Date, java.util.Base64"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Attacker::A Fog Centric Secure Cloud Storage Scheme</title>
    <meta charset="ISO-8859-1"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css"/>
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/coin-slider.min.js"></script>

    <script type="text/javascript">
        function saveTextAsFile() {
            var textToWrite = document.getElementById("textarea").value;
            var textFileAsBlob = new Blob([textToWrite], {type: 'text/plain'});
            var fileNameToSaveAs = "File.txt";

            var downloadLink = document.createElement("a");
            downloadLink.download = fileNameToSaveAs;
            downloadLink.innerHTML = "Download File";
            if (window.URL != null) {
                downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
                downloadLink.onclick = destroyClickedElement;
                downloadLink.style.display = "none";
                document.body.appendChild(downloadLink);
            }

            downloadLink.click();
        }

        function destroyClickedElement(event) {
            document.body.removeChild(event.target);
        }
    </script>
</head>
<body>
<div class="main">
    <div class="header">
        <div class="header_resize">
            <div class="logo">
                <h1><a href="index.html">A Fog Centric Secure Cloud Storage Scheme</a></h1>
            </div>
            <div class="menu_nav">
                <ul></ul>
            </div>
            <div class="clr"></div>
            <div class="slider">
                <div id="coin-slider">
                    <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt=""/></a>
                    <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt=""/></a>
                    <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt=""/></a>
                </div>
                <div class="clr"></div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="content">
        <div class="content_resize">
            <div class="mainbar">
                <div class="article">
                    <p class="infopost">A Fog Centric Secure Cloud Storage Scheme</p>
                    <div class="clr"></div>
                    <h2 align="center"><b>Download File</b></h2>
                    <%
                        String decryptedValue1 = "";
                        String decryptedValue2 = "";
                        String decryptedValue3 = "";
                        String decryptedValue4 = "";
                        try {
                            String file = request.getParameter("t1");
                            String aname = request.getParameter("aname");
                            String owner = request.getParameter("oname");
                            String sk = request.getParameter("sk");

                            String query = "SELECT * FROM cloudserver WHERE fname = ? AND ownername = ?";
                            PreparedStatement pstmt = connection.prepareStatement(query);
                            pstmt.setString(1, file);
                            pstmt.setString(2, owner);

                            ResultSet rs = pstmt.executeQuery();

                            if (rs.next()) {
                                String ct1 = rs.getString(4);
                                String ct2 = rs.getString(6);
                                String ct3 = rs.getString(8);
                                String ct4 = rs.getString(10);

                                // Define the key correctly for AES decryption
                                String keyString = "ef50a0ef2c3e3a5f"; // Ensure this is 16 bytes for AES-128
                                byte[] keyValue = keyString.getBytes("UTF-8");
                                Key key = new SecretKeySpec(keyValue, "AES");

                                Cipher cipher = Cipher.getInstance("AES");
                                cipher.init(Cipher.DECRYPT_MODE, key);

                                // Decode base64 and decrypt
                                decryptedValue1 = new String(cipher.doFinal(Base64.getDecoder().decode(ct1)));
                                decryptedValue2 = new String(cipher.doFinal(Base64.getDecoder().decode(ct2)));
                                decryptedValue3 = new String(cipher.doFinal(Base64.getDecoder().decode(ct3)));
                                decryptedValue4 = new String(cipher.doFinal(Base64.getDecoder().decode(ct4)));

                                SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                                SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

                                Date now = new Date();
                                String strDate = sdfDate.format(now);
                                String strTime = sdfTime.format(now);
                                String dt = strDate + " " + strTime;

                                String user = (String) application.getAttribute("uname");
                                String type = "External";
                                String insertQuery = "INSERT INTO attacker(user, fname, ownername, sk, type, dt) VALUES (?, ?, ?, ?, ?, ?)";
                                PreparedStatement pstmtInsert = connection.prepareStatement(insertQuery);
                                pstmtInsert.setString(1, aname);
                                pstmtInsert.setString(2, file);
                                pstmtInsert.setString(3, owner);
                                pstmtInsert.setString(4, sk);
                                pstmtInsert.setString(5, type);
                                pstmtInsert.setString(6, dt);
                                pstmtInsert.executeUpdate();
                                %>

                                <p align="center" class="style1">File Contents</p>
                                <div align="center">
                                    <textarea name="text" id="textarea" cols="45" rows="17"><%= decryptedValue1 %><%= decryptedValue2 %><%= decryptedValue3 %><%= decryptedValue4 %></textarea>
                                    <br/><br/>
                                    <button onClick="saveTextAsFile()">Download</button>
                                </div>
                                <p align="center">&nbsp;</p>

                                <%
                            } else {
                                %>
                                <h1 class="style1">File Doesn't Exist !!!</h1>
                                <p><a href="attack1.jsp">Back</a></p>
                                <%
                            }
                        } catch (Exception e) {
                            out.println("<p style='color:red'>An error occurred: " + e.getMessage() + "</p>");
                        } finally {
                            try {
                                if (connection != null && !connection.isClosed()) {
                                    connection.close();
                                }
                            } catch (SQLException e) {
                                out.println("<p style='color:red'>An error occurred while closing the connection: " + e.getMessage() + "</p>");
                            }
                        }
                    %>
                    <div class="clr"></div>
                </div>
                <div class="article">
                    <h2>&nbsp;</h2>
                </div>
            </div>
            <div class="sidebar">
                <div class="clr"></div>
                <div class="gadget">
                    <div class="clr"></div>
                    <ul class="sb_menu"></ul>
                </div>
                <div class="gadget">
                    <div class="clr"></div>
                    <ul class="ex_menu"></ul>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="fbg"></div>
    <div class="footer"></div>
</div>
</body>
</html>
