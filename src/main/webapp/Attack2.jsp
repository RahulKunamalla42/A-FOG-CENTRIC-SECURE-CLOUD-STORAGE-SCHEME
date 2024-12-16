<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.*,java.security.Key,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attacker</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/coin-slider.min.js"></script>
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

                        String keys = "ef50a0ef2c3e3a5f";
                        String query2 = "";
                        String cont = "";

                        try {
                            if (block.equalsIgnoreCase("Block-1")) {
                                query2 = "SELECT ct1 FROM cloudserver WHERE fname=? AND ownername=?";
                            } else if (block.equalsIgnoreCase("Block-2")) {
                                query2 = "SELECT ct2 FROM cloudserver WHERE fname=? AND ownername=?";
                            } else if (block.equalsIgnoreCase("Block-3")) {
                                query2 = "SELECT ct3 FROM cloudserver WHERE fname=? AND ownername=?";
                            } else if (block.equalsIgnoreCase("Block-4")) {
                                query2 = "SELECT ct4 FROM cloudserver WHERE fname=? AND ownername=?";
                            } else {
                                out.println("<h1>Invalid Block Selection</h1>");
                                return;
                            }

                            // Use PreparedStatement to prevent SQL Injection
                            PreparedStatement pst1 = connection.prepareStatement(query2);
                            pst1.setString(1, file);
                            pst1.setString(2, owner);
                            ResultSet rs1 = pst1.executeQuery();

                            // Check if the user is blocked
                            PreparedStatement pst2 = connection.prepareStatement("SELECT * FROM attacker WHERE user=? AND type='External'");
                            pst2.setString(1, aname);
                            ResultSet rs2 = pst2.executeQuery();
                            if (rs2.next()) {
                                %>
                                <h1>Sorry, you are blocked</h1>
                                <%
                            } else {
                                if (rs1.next()) {
                                    cont = rs1.getString(1);

                                    // Decrypt the content
                                    byte[] keyValue = keys.getBytes();
                                    Key key = new SecretKeySpec(keyValue, "AES");
                                    Cipher cipher = Cipher.getInstance("AES");
                                    cipher.init(Cipher.DECRYPT_MODE, key);
                                    byte[] decryptedBytes = cipher.doFinal(Base64.decode(cont.getBytes()));
                                    String decryptedValue = new String(decryptedBytes, "UTF-8");

                                    %>
                                    <form method="post" action="Attack3.jsp">
                                        <table width="755" border="1" align="center">
                                            <tr>
                                                <td align="center">User Name</td>
                                                <td><input type="text" value="<%= aname %>" name="aname" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center">File Name</td>
                                                <td><input type="text" value="<%= file %>" name="fname" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center">Select Block</td>
                                                <td><input type="text" value="<%= block %>" name="block" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center">Owner Name</td>
                                                <td><input type="text" value="<%= owner %>" name="owner" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center">File Contents</td>
                                                <td><textarea name="cont" id="textarea" cols="82" rows="20"><%= decryptedValue %></textarea></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center"><input type="submit" value="Attack" /></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <%
                                } else {
                                    %>
                                    <h2>File does not exist</h2>
                                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.println("<p style='color:red'>An error occurred: " + e.getMessage() + "</p>");
                        }
                    %>
                    <p>&nbsp;</p>
                </div>
            </div>
        </div>
    </div>
    <div class="clr"></div>
</div>
</body>
</html>
