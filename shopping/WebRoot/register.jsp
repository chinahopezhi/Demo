<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>Roman Holiday Online Store</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
</head>
<body>
<table width="790"  border="0" cellspacing="0" cellpadding="0" align="center">
 <tr>
 <td class="tableBorder">
<jsp:include page="navigation.jsp"/>
<table width="790" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" height="182" valign="top">
	<jsp:include page="left.jsp"/>
	</td>
    <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="93" height="33" background="images/shop_12.gif"></td>
        <td width="505" height="33" align="right" valign="middle" background="images/shop_12.gif"><table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">^_^ Welcome to our store and enjoy your time<a href="register.jsp" class="word_green">[New to our store]</a></marquee></td>
          </tr>
        </table></td>
        <td width="10" background="images/shop_12.gif">&nbsp;</td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top">
		  <form action="register_deal.jsp" method="post" name="myform">
		  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <script language="javascript">
						   function openwin(UID){
						   if (UID==""){
								alert("Please input the username!");
								myform.username.focus();
								return;
						   }
						   var str="checkUserName.jsp?username="+UID;
						   window.showModalDialog(str,"","dialogWidth=300px;dialogHeight=150px;status=no;help=no;scrollbars=no");
						   }
			    </script>
              <td width="18%" height="30" align="center">Username：</td>
              <td width="82%" class="word_grey"><input name="username" type="text" maxlength="20">
                <span class="word_orange">*</span> <span class="word_orange">[</span><a href="#" onClick="openwin(myform.username.value)">Test Username</a><span class="word_orange">]</span></td>
            </tr>
            <tr>
              <td height="28" align="center">Realname：</td>
              <td height="28"><input name="truename" type="text" maxlength="15">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">Password：</td>
              <td height="28"><input name="pwd" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">Confirm Password：</td>
              <td height="28"><input name="pwd1" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span> </td>
            </tr>
            <tr>
              <td height="28" align="center">City：</td>
              <td><input name="city" type="text"></td>
            </tr>
            <tr>
              <td height="28" align="center">Address：</td>
              <td class="word_grey"><input name="address" type="text"size="50"></td>
            </tr>
            <tr>
              <td height="28" align="center">Zip：</td>
              <td class="word_grey"><input name="postcode" type="text" size="20"></td>
            </tr>
            <tr>
              <td height="28" align="center">ID：</td>
              <td><input name="cardno" type="text">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">ID Type：</td>
              <td><input name="cardtype" type="radio" class="noborder" value="身份证" checked>
      SSN&nbsp;
      <input name="cardtype" type="radio" class="noborder" value="军官证">
      Passport
      <input name="cardtype" type="radio" class="noborder" value="学生证">
     StudentID</td>
            </tr>
            <tr>
              <td height="28" align="center">Tel：</td>
              <td><input name="tel" type="text"></td>
            </tr>
            <tr>
              <td height="28" align="center" style="padding-left:10px">Email：</td>
              <td class="word_grey"><input name="email" type="text" size="50">
                <span class="word_orange">*</span></td>
            </tr>

            <tr>
              <td height="34">&nbsp;</td>
              <td class="word_grey"><input name="Button" type="button" class="btn_grey" value="Save" onClick="check()">
                  <input name="Submit2" type="reset" class="btn_grey" value="Reset">
                  <input name="Submit22" type="button" class="btn_grey" value="Back" onClick="window.location.href='index.jsp'">
              </td>
            </tr>
          </table>
		  </form>
		  </td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="790"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><jsp:include page="copyright.jsp"/></td>
  </tr>
</table>
</body>
</html>
<%//conn.close();%>
