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
        <title>JSP Page</title><link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/datetimepicker_css.js"></script>
	<script type="text/javascript" src="js/general.js"></script>

        <style type="text/css">
<!--
.style1 {color: #993300}
.style2 {font-size: 24px}
.style3 {
	color: #990000;
	font-weight: bold;
	font-size: 24px;
}
.style4 {color: #990000}
.style6 {color: #000000; font-weight: bold; }
-->
        </style><SCRIPT LANGUAGE="JavaScript">

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Begin
function checkEmail(myForm) {
if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(myForm.a6.value)){
return (true)
}
alert("Invalid E-mail Address! Please re-enter.")
return (false)
}
//  End -->
</script>
</head>
    <body bgcolor="#CCCCCC">
     <form action="register" method="post" onSubmit="return checkEmail(this)" name="form1">
         				<%
   String ok=(String)request.getAttribute("ok");
   String msg="";

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
    <td height="516"><table width="754" border="0" align="center">
      <tr>
        <td width="744" height="45" align="center"><span class="style3">REGISTRATION FORM </span></td>
      </tr>
      <tr>
        <td align="center"><table  border="0" align="center">
          <tr>
            <td width="162"><span class="style6">User Id </span></td>
            <td width="10">&nbsp;</td>
            <td width="213"><label>
              <div align="left">
                <input type="text" name="a1" value="" maxlength="15" style="width:180px">
                </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Name</span></td>
            <td>&nbsp;</td>
            <td><label>
               <div align="left">
  <input name="a2" type="text" id="a2" class="displayValue" maxlength="15" style="width:180px"  onKeyPress="return name_val(event);return nospecialcharacters();" onChange="return val_zero('a2','err_a2');"     onblur="return txt_empty('a2','err_a2','Name Should Not Be Blank');" />
  &nbsp;&nbsp;&nbsp;<span id="err_a2"></span>                  </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Password </span></td>
            <td>&nbsp;</td>
            <td><label>
                    <div align="left">
  <input type="password" id="a3" name="a3"  style="width:180px" maxlength="20" class="displayValue" 
onChange="return val_zero('a3','err_a3');"
											onblur="return val_password('a3','err_a3','Password Should Not Be Blank');" />
  &nbsp;&nbsp;&nbsp;<span id="err_a3"></span> </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Retype Password </span></td>
            <td>&nbsp;</td>
            <td><label>
                    <div align="left">
  <input type="password" id="a4" name="a4" style="width:180px" maxlength="20" class="displayValue" 
onChange="return val_zero('a4','err_a4');"
											onblur="return pwd_compare('a3','a4','err_a4');" />
  &nbsp;&nbsp;&nbsp;<span id="err_a4"></span>                            </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Mobile</span></td>
            <td>&nbsp;</td>
            <td><label>
              <div align="left">
                <input type="text" id="a5" name="a5" style="width:180px" maxlength="16" class="displayValue"  onkeypress="return numbersonly();return nospecialcharacters();" onChange="return val_zero('a5','err_a5');" onBlur="return txt_empty('a5','err_a5','Should Not Be Blank');"/>
                </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Email-Id</span></td>
            <td>&nbsp;</td>
            <td><label>
            <div align="left">
  <input name="a6" id="a6" type="text" maxlength="20"  class="displayValue" style="width:180px" onChange="return val_zero('a6','err_a6');"  onblur="return val_email1('a6','err_a6');"/>
  &nbsp;&nbsp;&nbsp;<span id="err_a6"></span>            </div>
            </label></td>
          </tr>
          <tr>
            <td><span class="style6">Date</span></td>
            <td>&nbsp;</td>
            <td>
              <label>
                    <div align="left">
                      <input type="text" style="width:180px" id="a7" name="a7" class="displayValue"  readonly="true" onChange="return val_zero('a7','err_a7');" />  
                      <a href="javascript:NewCssCal('a7','ddmmyyyy')"><img src="images/cal.jpg" alt="" width="16" height="16" /></a>
                               <span id="err_a7"></span>                            </div>
              </label></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><div align="left"></div></td>
          </tr>
          <tr>
            <td><span class="style4"></span></td>
            <td>&nbsp;</td>
            <td><label>
             <input type="submit" name="s1" value="Submit" class="buttons" onClick="return validatePage('a1|a2|a3|a4|a5|a6|a7','err_a1|err_a2|err_a3|err_a4|err_a5|err_a6|err_a7','Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank|Should Not Be Blank');"  />&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="s2" value="Cancel">
            </label></td>
          </tr>

        </table>
        <%=msg%></td>
      </tr>
    </table> </td>
  </tr>
  <tr>
    <td bgcolor="#999999"></td>
  </tr>
</table>

	</form>
    </body>
</html>
