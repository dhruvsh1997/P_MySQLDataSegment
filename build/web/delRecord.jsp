<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="java.time.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Remove Data</title>
    </head>
    <body>
        <h1>Delete Data</h1><br>
        <form action="delRecord.jsp">
            <input type="text" name="eid" placeholder="Enter ID to Delete"><br>
            <input type="submit" value="Delete">
        </form><br>
        <br><hr>
        <br><%
            String emp_id = request.getParameter("eid");
            try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"EMP","root","sharma");
            Statement smt = conn.createStatement();
            smt.executeUpdate("delete * from NEW_EMP where EMP_ID='"+emp_id+"';");
            }catch(Exception ex)    
            {
                out.println("Unable ot Delete Record from DB.<br>"+ex);
            }
        %>
        <br><br> <a href="">Insert New Record</a>
        <br> <a href="">Update Record</a>
        <br> <a href="">Search Record</a>
    </body>
</html>
