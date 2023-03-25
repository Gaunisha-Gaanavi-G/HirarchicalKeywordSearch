<%-- 
    Document   : sample2
    Created on : Nov 8, 2012, 9:58:21 AM
    Author     : Perumal S
--%>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post"  >
            <%
            String a1=request.getParameter("a1");
String a2=request.getParameter("a2");
String a3=request.getParameter("a3");
          

%>
		<table width="590" border="0" align="center">
  <tr>
    <td width="151">File ID </td>
    <td width="7">&nbsp;</td>
    <td width="410"><label>
            <input type="text" name="a1" value="<%=a1%>">
    </label></td>
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
</table>
            <%
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
        char[] buf = new char[255];
           String readData = null;
        int numRead=0;
        while((numRead=reader.read(buf)) != -1){
  
            readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[250];
                  
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
	
              
                
    </form>   </body>
</html>
