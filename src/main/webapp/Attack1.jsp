<%@ include file="connect.jsp"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>File Attack Form</title>
    <meta charset="UTF-8">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1 style="text-align:center">File Attack Form</h1>
    <form method="post" action="Attack2.jsp">
        <table width="755" border="1" align="center">
            <tr>
                <td align="center">User Name</td>
                <td><input type="text" placeholder="Enter Your Name" name="aname" required /></td>
            </tr>
            <tr>
                <td align="center">File Name</td>
                <td><input type="text" placeholder="Enter File Name to Attack" name="fname" required /></td>
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
                <td><input type="text" placeholder="Enter Owner Name" name="owner" required /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Attack" />
                </td>
            </tr>
        </table>
    </form>
    <%
        try {
            // Additional server-side processing can go here if needed.
        } catch (Exception e) {
            out.println("<p style='color:red'>An error occurred: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
