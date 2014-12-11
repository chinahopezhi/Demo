<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>Back-stage Management!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.js"></script>
</head>

<body>
      <form name="form1" method="post" action="Login_M_deal.jsp">
      <table width="350" height="228"  border="0" align="center" cellpadding="0" cellspacing="0" background="../images/login_M.jpg" class="tableBorder">
        <tr>
          <td height="136" align="center">&nbsp;</td>
        </tr>	  
              
        <tr>
          <td height="87" align="center" valign="top"><table width="62%" height="87"  border="0" cellpadding="0" cellspacing="0">
			<tr>
              <td width="95%" align="center">&nbsp;Username：
              <input name="manager" type="text" id="manager" size="20"></td>
              </tr>
            <tr>
              <td align="center">&nbsp;Password：
              <input name="PWD" type="password" id="PWD" size="20"></td>
              </tr>

            <tr>
              <td align="center"><input name="Submit" type="button" class="btn_grey" value="OK" onClick="checkM(form1)"> &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="Reset">
              &nbsp;
              <input name="Submit3" type="button" class="btn_grey" value="Back" onClick="window.location.href='../index.jsp';"></td>
              </tr>
           
          </table> </td>
        </tr>
</table>
</form>
</body>
</html>
