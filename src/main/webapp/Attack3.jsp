<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.io.*, java.math.BigInteger, java.security.*, javax.crypto.*, javax.crypto.spec.SecretKeySpec, java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Attacker::A Fog Centric Secure Cloud Storage Scheme</title>
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
                <h1><a href="index.html">A Fog Centric Secure Cloud Storage Scheme</a></h1>
            </div>
            <div class="menu_nav">
                <ul></ul>
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
                    <p class="infopost">A Fog Centric Secure Cloud Storage Scheme</p>
                    <div class="clr"></div>
                    <h2 style="text-align:center">Attack Block File Content</h2>
                    <p>&nbsp;</p>
                    <%
                        String aname = request.getParameter("aname");
                        String file = request.getParameter("fname");
                        String block = request.getParameter("block");
                        String owner = request.getParameter("owner");
                        String cont = request.getParameter("cont");
                        String strQuery2 = "";
                        
                        String keys = "ef50a0ef2c3e3a5f";
                        String h1 = "";
                        String filename = "filename.txt";
                        
                        try {
                            // Encrypt the content
                            byte[] keyValue = keys.getBytes();
                            Key key = new SecretKeySpec(keyValue, "AES");
                            Cipher c = Cipher.getInstance("AES");
                            c.init(Cipher.ENCRYPT_MODE, key);
                            String encryptedValue = Base64.getEncoder().encodeToString(c.doFinal(cont.getBytes()));
                            
                            // Save the content to file and compute SHA1 hash
                            try (PrintStream p = new PrintStream(new FileOutputStream(filename))) {
                                p.print(cont);
                            } catch (IOException e) {
                                out.println("<p style='color:red'>Error writing to file: " + e.getMessage() + "</p>");
                                e.printStackTrace();
                                return;
                            }
                            
                            MessageDigest md = MessageDigest.getInstance("SHA1");
                            try (FileInputStream fis11 = new FileInputStream(filename);
                                 DigestInputStream dis1 = new DigestInputStream(fis11, md);
                                 BufferedInputStream bis1 = new BufferedInputStream(dis1)) {
                                while (bis1.read() != -1) {}
                            } catch (IOException e) {
                                out.println("<p style='color:red'>Error reading from file: " + e.getMessage() + "</p>");
                                e.printStackTrace();
                                return;
                            }
                            
                            BigInteger bi1 = new BigInteger(md.digest());
                            h1 = bi1.toString(16);
                            
                            // Generate RSA key pair and encode public key
                            KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
                            kg.initialize(2048);
                            KeyPair kp = kg.generateKeyPair();
                            byte[] pub = kp.getPublic().getEncoded();
                            String pk = Base64.getEncoder().encodeToString(pub);
                            
                            // Get current date and time
                            SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
                            Date now = new Date();
                            String dt = sdfDate.format(now) + " " + sdfTime.format(now);
                            
                            // Update the cloud server block content
                            switch (block.toLowerCase()) {
                                case "block-1":
                                    strQuery2 = "UPDATE cloudserver SET ct1=?, mac1=?, sk=? WHERE fname=? AND ownername=?";
                                    break;
                                case "block-2":
                                    strQuery2 = "UPDATE cloudserver SET ct2=?, mac2=?, sk=? WHERE fname=? AND ownername=?";
                                    break;
                                case "block-3":
                                    strQuery2 = "UPDATE cloudserver SET ct3=?, mac3=?, sk=? WHERE fname=? AND ownername=?";
                                    break;
                                case "block-4":
                                    strQuery2 = "UPDATE cloudserver SET ct4=?, mac4=?, sk=? WHERE fname=? AND ownername=?";
                                    break;
                                default:
                                    throw new IllegalArgumentException("Invalid block specified");
                            }
                            
                            try (PreparedStatement pst = connection.prepareStatement(strQuery2)) {
                                pst.setString(1, encryptedValue);
                                pst.setString(2, h1);
                                pst.setString(3, pk);
                                pst.setString(4, file);
                                pst.setString(5, owner);
                                pst.executeUpdate();
                            }
                            
                            // Insert attacker record
                            String strQuery4 = "INSERT INTO attacker(user, fname, ownername, sk, type, dt) VALUES (?, ?, ?, ?, ?, ?)";
                            try (PreparedStatement pst4 = connection.prepareStatement(strQuery4)) {
                                pst4.setString(1, aname);
                                pst4.setString(2, file);
                                pst4.setString(3, owner);
                                pst4.setString(4, pk);
                                pst4.setString(5, "External");
                                pst4.setString(6, dt);
                                pst4.executeUpdate();
                            }
                    %>

                    <p>
                        <h1>Attack Successful! <a href="attack.jsp">Back</a></h1>
                    </p>
                    <br />
                    <%
                        } catch (Exception e) {
                            out.println("<p style='color:red'>An error occurred: " + e.getMessage() + "</p>");
                        }
                    %>
                    <p>&nbsp;</p>
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
