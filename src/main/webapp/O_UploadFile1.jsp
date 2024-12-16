<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.security.Key,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64,java.sql.*,java.io.*,java.security.MessageDigest,java.math.BigInteger" %>
<%@ include file="connect.jsp"%>

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
        function loadFileAsText() {
            var fileToLoad = document.getElementById("file").files[0];
            var fileReader = new FileReader();
            fileReader.onload = function(fileLoadedEvent) {
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
                    <li><a href="O_HomePage.html"><span>Home Page</span></a></li>
                    <li class="active"><a href="O_MainPage.jsp"><span>Data Owner</span></a></li>
                    <li><a href="#"><span>End User</span></a></li>
                    <li><a href="#"><span>Cloud Server</span></a></li>
                    <li><a href="about.html"><span></span></a></li>
                </ul>
            </div>
            <div class="clr"></div>
            <div class="slider">
                <div id="coin-slider">
                    <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt="" /></a>
                    <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt="" /></a>
                    <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt="" /></a>
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
                    <p class="infopost">A Fog centric Secure Cloud Storage Scheme</p>
                    <div class="clr"></div>
                    <h5 align="right"><%= new java.util.Date() %></h5>
                    <h1>Upload Data:</h1>
                    <p>&nbsp;</p>
                    <div class="clr"></div>

                    <% 
                    try {
                        String file = request.getParameter("tt");
                        String cont = request.getParameter("text");
                        String keys = "ef50a0ef2c3e3a5f";
                        String[] h = new String[5];
                        String path = getServletContext().getRealPath("/");

                        ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM cloudserver WHERE fname='" + file + "'");
                        if (!rs.next()) {
                            int sourceFileSize = cont.length();
                            int s = sourceFileSize % 4;
                            int s1 = sourceFileSize / 4;
                            int a1 = s1;
                            int a2 = s1 + s1;
                            int a3 = s1 + s1 + s1;
                            int a4 = s1 + s1 + s1 + s1 + s;

                            // Encryption
                            byte[] keyValue = keys.getBytes();
                            Key key = new SecretKeySpec(keyValue, "AES");
                            Cipher cipher = Cipher.getInstance("AES");
                            cipher.init(Cipher.ENCRYPT_MODE, key);

                            String encryptedValue1 = new String(Base64.encode(cipher.doFinal(cont.substring(0, a1).getBytes())));
                            String encryptedValue2 = new String(Base64.encode(cipher.doFinal(cont.substring(a1, a2).getBytes())));
                            String encryptedValue3 = new String(Base64.encode(cipher.doFinal(cont.substring(a2, a3).getBytes())));
                            String encryptedValue4 = new String(Base64.encode(cipher.doFinal(cont.substring(a3, a4).getBytes())));

                            // Write encrypted content to files
                            try (PrintStream p1 = new PrintStream(new FileOutputStream(path + "filename1.txt"));
                                 PrintStream p2 = new PrintStream(new FileOutputStream(path + "filename2.txt"));
                                 PrintStream p3 = new PrintStream(new FileOutputStream(path + "filename3.txt"));
                                 PrintStream p4 = new PrintStream(new FileOutputStream(path + "filename4.txt"))) {
                                
                                p1.print(encryptedValue1);
                                p2.print(encryptedValue2);
                                p3.print(encryptedValue3);
                                p4.print(encryptedValue4);
                            }

                            // Generate MACs
                            for (int i = 1; i <= 4; i++) {
                                MessageDigest md = MessageDigest.getInstance("SHA-1");
                                try (FileInputStream fis = new FileInputStream(path + "filename" + i + ".txt")) {
                                    byte[] buffer = new byte[1024];
                                    int bytesRead;
                                    while ((bytesRead = fis.read(buffer)) != -1) {
                                        md.update(buffer, 0, bytesRead);
                                    }
                                    BigInteger bi = new BigInteger(1, md.digest());
                                    h[i] = bi.toString(16);
                                }
                            }

                            // Display file info
                    %>
                    <div class="clr"></div>
                    <form action="O_UploadFile2.jsp" method="post">
                        <table width="598" border="1" align="center">
                            <tr>
                                <td width="286"><span class="style4">File Name:</span></td>
                                <td width="356"><input name="t42" type="text" id="t42" size="50" value="<%= file %>" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td width="286"><span class="style4">Block-1</span></td>
                                <td width="286"><span class="style4">Size: <%= a1 %> Bytes</span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><textarea name="text1" cols="50" rows="15" readonly><%= encryptedValue1 %></textarea></td>
                            </tr>
                            <tr>
                                <td><span class="style4">MAC-1:</span></td>
                                <td><input name="t1" type="text" id="t4" size="50" value="<%= h[1] %>" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td width="286"><span class="style4">Block-2</span></td>
                                <td width="286"><span class="style4">Size: <%= a2 - a1 %> Bytes</span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue2 %></textarea></td>
                            </tr>
                            <tr>
                                <td><span class="style4">MAC-2:</span></td>
                                <td><input name="t2" type="text" id="t4" size="50" value="<%= h[2] %>" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td width="286"><span class="style4">Block-3</span></td>
                                <td width="286"><span class="style4">Size: <%= a3 - a2 %> Bytes</span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><textarea name="text3" cols="50" rows="15" readonly><%= encryptedValue3 %></textarea></td>
                            </tr>
                            <tr>
                                <td><span class="style4">MAC-3:</span></td>
                                <td><input name="t3" type="text" id="t4" size="50" value="<%= h[3] %>" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td width="286"><span class="style4">Block-4</span></td>
                                <td width="286"><span class="style4">Size: <%= a4 - a3 %> Bytes</span></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><textarea name="text4" cols="50" rows="15" readonly><%= encryptedValue4 %></textarea></td>
                            </tr>
                            <tr>
                                <td><span class="style4">MAC-4:</span></td>
                                <td><input name="t4" type="text" id="t4" size="50" value="<%= h[4] %>" readonly="readonly" /></td>
                            </tr>
                        </table>
                        <input name="Submit" type="submit" value="Next" />
                    </form>
                    <%
                        } else {
                            out.println("<p>File already exists in the cloud server.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    }
                    %>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="sidebar">
                <div class="gadget">
                    <h2 class="star"><span>About</span></h2>
                    <div class="clr"></div>
                    <p>Welcome to the secure cloud storage scheme designed for safe data storage.</p>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="footer">
        <div class="footer_resize">
            <div class="clr"></div>
            <p class="left">&copy; 2024 Secure Cloud Storage</p>
            <p class="right">Design by <a href="#">Your Name</a></p>
        </div>
    </div>
</div>
</body>
</html>
