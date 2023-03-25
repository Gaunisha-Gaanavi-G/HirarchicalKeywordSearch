<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<script type="text/javascript" src="js/datetimepicker_css.js"></script>
	<script type="text/javascript" src="js/general.js"></script>
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
     <form action="login" method="post">
         	<%
   String ok=(String)request.getAttribute("ok");
   String msg="";
   String a="";
   String b="";
    if(ok!=null)
   {
   msg=(String)request.getAttribute("msg");
   
     }
    %>
         <table width="921" border="0" align="center" bgcolor="#FFFFFF">

  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="917" border="0" bgcolor="#999999">
      <tr>
        <td width="184"><div align="center" class="style1"><a href="index.jsp"><strong>Home</strong></a></div></td>
        <td width="142"><div align="center" class="style1"><a href="aboutus.jsp"><strong>About us</strong></a></div></td>
        <td width="200"><div align="center" class="style1"><a href="register.jsp"><strong>Register</strong></a></div></td>
        <td width="209"><div align="center" class="style1"><a href="login.jsp"><strong>Login</strong></a></div></td>
        <td width="146"><div align="center" class="style1"><a href="service.jsp"><strong>Service</strong></a></div></td>
	    <td width="200"><div align="center" class="style1"><a href="contactus.jsp"><strong>Contact us</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="913" height="517" border="0" align="center">
      <tr>
        <td width="250" height="292">&nbsp;</td>
        <td width="653"  align="center"><table width="517" border="0" align="center">
          <tr>
            <td width="511" height="32" align="center"><span class="style3">Login Form</span></td>
          </tr>
          <tr>
            <td height="147"><table width="417" border="0" align="center">
              <tr>
                <td width="144"><strong>User Name <span class="style4">* </span></strong></td>
                <td width="10">&nbsp;</td>
                <td width="249"><input type="text" id="a1" name="a1"  maxlength="15"class="displayValue" onKeyPress="return nospecialcharacters();" onChange="return val_zero('a1','err_a1');" 
											onBlur="return txt_empty('a1','err_a1','User Name Should Not Be Blank');" />
										&nbsp;&nbsp;&nbsp;
				<span id="err_a1"></span>    </label></td>
              </tr>
              <tr>
                <td><strong>Password <span class="style4">* </span></strong></td>
                <td>&nbsp;</td>
                <td><label>
    <input type="password" id="a2" name="a2"  maxlength="10" class="displayValue" 
onChange="return val_zero('a2','err_a2');"
											onblur="return val_password('a2','err_a2,'Password Should Not Be Blank');" />
										&nbsp;&nbsp;&nbsp;
				<span id="err_a2"></span>    </label> </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
			   <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><%=msg%></td>
                <td><label>
                   <input type="submit" name="s1" value="Submit" class="buttons"
											onclick="return validatePage('a1|a2,'err_a1|err_a2','User Name Should Not Be Blank|Password Should Not Be Blank');"/>&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="s2" value="Cancel">
                </label></td>
              </tr>
             
            </table></td>
          </tr>
        </table></td>
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
