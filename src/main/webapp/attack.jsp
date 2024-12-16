<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.*,java.security.Key,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>EPAS: A Sampling Based Similarity Identification Algorithm for the Cloud</title>
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
                    <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt="" /> </a> 
                    <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt="" /> </a> 
                    <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt="" /> </a> 
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
                    <form method="post" action="Attack2.jsp">
                        <table width="755" border="1" align="center">
                            <tr>
                                <td align="center">User Name</td>
                                <td><input type="text" placeholder="Enter Your Name" name="aname" required /> </td>
                            </tr>
                            <tr>
                                <td align="center">File Name</td>
                                <td><input type="text" placeholder="Enter File Name to Attack" name="fname" required /> </td>
                            </tr>
                            <tr>
                                <td align="center">Select Block</td>
                                <td>
                                    <select name="block" required>
                                        <option value="">--Select--</option>
                                        <option value="Block-1">Block-1</option>
                                        <option value="Block-2">Block-2</option>
                                        <option value="Block-3">Block-3</option>
                                        <option value="Block-4">Block-4</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Owner Name</td>
                                <td><input type="text" placeholder="Enter Owner Name" name="owner" required /> </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit" value="Attack" /></td>
                            </tr>
                        </table>
                    </form>
                    <p>&nbsp;</p>
                </div>
            </div>
            <div class="footer"></div>
        </div>
    </div>
</body>
</html>
