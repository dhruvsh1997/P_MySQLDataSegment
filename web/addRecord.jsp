<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="java.time.*" %>
<html>
    <head>
        <title>Insert Record</title>
    </head>
    <body>
        <h1>Data Insertion</h1></br>
        <%
            int oa=0;
        
        String dy = request.getParameter("dd");
        String mnth = request.getParameter("mm");
        String yr = request.getParameter("yy");
            
            
        String emp_id=request.getParameter("eid");
        String emp_nm=request.getParameter("enm");
        String emp_ph=request.getParameter("phn");
        String emp_ds=request.getParameter("edes");
        int emp_sl=Integer.parseInt(request.getParameter("esal"));
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"EMP","root","sharma");
            PreparedStatement ps=conn.prepareStatement("insert into NEW_EMP values(?,?,?,?,?)");
            ps.setString(1,emp_id);
            ps.setString(2,emp_nm);
            ps.setString(3,emp_ph);
            ps.setString(4,emp_ds);
            ps.setInt(5,emp_sl);
            
            oa=ps.executeUpdate();
            if(oa==1)
            {
             out.println("Data has been saved into DB.");   
            }
        }catch(Exception ex){
            out.println("Unable insert Data.");
            out.println("</br>"+ex);
        }
        
        //Display Age
        
        
        Calendar now = Calendar.getInstance();
        int ddy,mmn,yyr;
        ddy=now.get(Calendar.DATE)-Integer.parseInt(dy);
        mmn=(now.get(Calendar.MONTH)+2)-Integer.parseInt(mnth);
        yyr=now.get(Calendar.YEAR)-Integer.parseInt(yr);
        out.println("<br>Your Age is : "+yyr+" years "+mmn+" months "+ddy+" days. <br>");
        %>
        <a href="srchRecord.jsp">Next</a>
    </body>
</html>
