<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String username=chStr.chStr(request.getParameter("username"));
ResultSet rs=conn.executeQuery("select * from tb_member where username='"+username+"'");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Check username</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
      <table width="90%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="7" align="center">&nbsp;</td>
        </tr>	  
	  <%
	  if(rs.next()){
	  %>

        <tr>
          <td height="45" align="center"><%out.println("Sorry!<br><br>["+username+"]Already have!");%></td>
        </tr>
	<%}else{%>
        <tr>
          <td height="56" align="center"><%out.println("Congratulation!<br><br>["+username+"]Have not been used!");%></td>
        </tr>	
	<%}%>
        <tr>
          <td height="30" align="center"><input type="button" name="Button" value="Close" onClick="window.close();"></td>
        </tr>		
    </table>
</body>
</html>
