package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.time.*;

public final class srchRecord_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Find Data</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Search Data</h1><br>\n");
      out.write("        <form name=\"form1\" action=\"srchRecord.jsp\">\n");
      out.write("            <input type=\"text\" name=\"eid\" placeholder=\"Enter ID to Search\"><br>\n");
      out.write("            <input type=\"submit\" value=\"Search\">\n");
      out.write("        </form><br>\n");
      out.write("        <br><hr>\n");
      out.write("        <br>");

            String emp_id = request.getParameter("form1.eid");
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
        
      out.write("\n");
      out.write("        <br><br> <a href=\"delRecord.jsp\">Delete Record</a>\n");
      out.write("        <br> <a href=\"\">Update Record</a>\n");
      out.write("        <br> <a href=\"addRecord.jsp\">Insert New Record</a>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
