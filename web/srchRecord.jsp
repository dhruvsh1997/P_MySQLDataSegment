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
        <title>Find Data</title>
    </head>
    <body>
        <h1>Search Data</h1><br>
        <form action="srchRecord.jsp">
            <input type="text" name="eid" placeholder="Enter ID to Search"><br>
            <input type="submit" value="Search">
        </form><br>
        <br><hr>
        <br><%
            String emp_id = request.getParameter("eid");
            try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"EMP","root","sharma");
            Statement smt = conn.createStatement();
            ResultSet rs=smt.executeQuery("select * from NEW_EMP where EMP_ID='"+emp_id+"';");
            while(rs.next())
            {
            out.println("<br>Name="+rs.getString(2));
            out.println("<br>PhoneNo="+rs.getString(3));
            out.println("<br>Designation="+rs.getString(4));
            out.println("<br>Basic Salary="+String.valueOf(rs.getInt(5)));
            }
            }catch(Exception ex)    
            {
                out.println("Unable ot Connect DB.<br>"+ex);
            }
        %>
        <br><br> <a href="delRecord.jsp">Delete Record</a>
        <br> <a href="">Update Record</a>
        <br> <a href="addRecord.jsp">Insert New Record</a>
    </body>
</html>
