<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Attack Form</title>
    <meta charset="ISO-8859-1">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2 align="center">Attack Form</h2>
    <%
        ArrayList<String> domains = new ArrayList<>();
        try {
            String query = "SELECT domain_name FROM pusg_domains";
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                domains.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <form method="post" action="Attack2.jsp">
        <table border="1" align="center">
            <tr>
                <td align="center">User Name</td>
                <td><input type="text" placeholder="Enter Your Name" name="aname" required/></td>
            </tr>
            <tr>
                <td align="center">File Name</td>
                <td><input type="text" placeholder="Enter File Name to Attack" name="fname" required/></td>
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
                <td><input type="text" placeholder="Enter Owner Name" name="owner" required/></td>
            </tr>
            <tr>
                <td align="center">Select the Domain</td>
                <td>
                    <select name="domain" required>
                        <option value="">--Select--</option>
                        <%
                            for (String domain : domains) {
                        %>
                        <option value="<%= domain %>"><%= domain %></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
