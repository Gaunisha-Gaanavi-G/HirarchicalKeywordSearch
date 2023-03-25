<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
<!--
.style1 {color: #993300}
.style2 {font-size: 24px}
.style3 {
	font-size: 18px;
	font-weight: bold;
	color: #990000;
}
.style4 {color: #FF0000}
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="aupload" method="post">
	 <%
         int a11=0;
         String a13="",a1="",a2="",a3="",msg="";
         int a12=0;
          String ok=(String)request.getAttribute("ok1");
          if(ok!=null){
              a1=(String)request.getAttribute("a");
        
 a2=(String)request.getAttribute("a1");
 a3=(String)request.getAttribute("a2");
  msg=(String)request.getAttribute("msg");
          }
           String ok1=(String)request.getAttribute("ok");
             if(ok!=null){
             
  msg=(String)request.getAttribute("msg");
          }
         out.print(a1+a3+msg);  
          

%>
	 <table width="980" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td width="974" height="85"><h2 align="center" class="style1 style2">CO-OPERATIVE PROVABLE DATA POSSESSION FOR INTEGRITY VERIFICATION IN MULTI-CLOUD STORAGE</h2></td>
  </tr>
  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="974" border="0" bgcolor="#999999">
      <tr>
        <td width="153"><div align="center" class="style1"><a href="admin.jsp"><strong>Home</strong></a></div></td>
        <td width="122"><div align="center" class="style1"><a href="aupload.jsp"><strong>File Upload </strong></a></div></td>
        <td width="168"><div align="center" class="style1"><a href="avupload.jsp"><strong>Edit File</strong></a></div></td>
         <td width="116"><div align="center" class="style1"><a href="auploadlist.jsp"><strong> File List</strong></a></div></td>
	    <td width="158"><div align="center" class="style1">&nbsp;&nbsp;</a></div></td>
		 <td width="231"><div align="center" class="style1"><a href="login.jsp"><strong>Login</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="928" border="0" align="center">
      <tr>
        <td width="922"><table width="590" border="0" align="center">
  <tr> <% int index=0;
	try
	{
            


		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select max(fid) from upload ");

    			
	 %>   <%
          if (rs.next()) {
				
				a11=Integer.parseInt(rs.getString(1));
                                a12=a11+1;
                                      a13=a12+"";
           %>   <%}else{
                  a12=1000;  
                  a13=a12+"";
           }
           %>
    <td width="151">File ID </td>
    <td width="7">&nbsp;</td>
    <td width="410"><label>
            <input type="text" name="a1" value="<%=a13%>">
    </label></td><%
 
											
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
  </tr>
  <tr>
    <td>File Name </td>
    <td>&nbsp;</td>
    <td><label>
            <input type="file" name="a2" value="<%=a2%>">
    </label></td>
  </tr>
  <tr>
    <td>File Key </td>
    <td>&nbsp;</td>
    <td><label>
            <input type="text" name="a3" value="<%=a3%>">
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t1" value="Add">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="t2" value="Cancel">
    </label></td>
  </tr>
</table></td>
      </tr>
      <tr>
        <td><%
            if(request.getParameter("t1")!=null){
                %>
		<table width="606" border="0" align="center">
<%     try{
                 StringBuffer fileData = new StringBuffer(1000);
            ArrayList st=new ArrayList();
		File file = new File(request.getParameter("a2"));
		long filesize = file.length();
		long filesizeInKB = filesize / 1024;
		System.out.println("Size of File is: " 
		+ filesizeInKB + " KB");
          
                   System.out.println(file.getName());
                String v,v1[];
                BufferedReader reader = new BufferedReader(new FileReader(request.getParameter("a2")));
        char[] buf = new char[175];
           String readData = null;
        int numRead=0;
        while((numRead=reader.read(buf)) != -1){
  
            readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[175];
                  
            st.add(readData);
        }
      %>
  <tr>

    <td width="184">File Block1 </td>
    <td width="7">&nbsp;</td>
    <td width="401"><textarea name="a4" cols="50" rows="5"><%=st.get(0)%></textarea></td>
  </tr>
  <tr>
    <td>File Block2 </td>
    <td>&nbsp;</td>
    <td><textarea name="a5" cols="50" rows="5"><%=st.get(1)%></textarea></td>
  </tr>
  <tr>
    <td>File Block3 </td>
    <td>&nbsp;</td>
    <td><textarea name="a6" cols="50" rows="5"><%=st.get(2)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 4 </td>
    <td>&nbsp;</td>
    <td><textarea name="a7" cols="50" rows="5"><%=st.get(3)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 5 </td>
    <td>&nbsp;</td>
    <td><textarea name="a8" cols="50" rows="5"><%=st.get(4)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 6 </td>
    <td>&nbsp;</td>
    <td><textarea name="a9" cols="50" rows="5"><%=st.get(5)%></textarea></td>
  </tr>
  <tr>
    <td>File Size</td>
    <td>&nbsp;</td>
    <td><input type="text" name="a10" value="<%=filesizeInKB%>"/></td>
  </tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t3" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="t4" value="Delete">
    </label></td>
  </tr>

            <%
                     String a4=request.getParameter("a4");
String a5=request.getParameter("a5");
String a6=request.getParameter("a6");
         String a7=request.getParameter("a7");
String a8=request.getParameter("a8");
String a9=request.getParameter("a9");
            System.out.println(a1);
            System.out.println(a2);
            System.out.println(a3);
            System.out.println(a4);
            System.out.println(a5);
            System.out.println(a6);
            System.out.println(a7);
            System.out.println(a8);
                System.out.println(a9);
            
		}catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}%>
              
</table>
		<%
            
}%>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#999999">&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>
