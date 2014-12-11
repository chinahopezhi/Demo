<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%@ page import="com.wgh.DB.chStr" %>
<%
chStr chStr=new chStr();
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
int ID=-1;
ID=Integer.parseInt(request.getParameter("ID"));
if(ID>0){
	ResultSet rs=conn.executeQuery("select * from tb_bbs where ID="+ID);
	String Title="";
	String content="";
	String Intime="";
	if(rs.next()){
		Title=rs.getString(2);
		content=rs.getString(3);
		Intime=rs.getString(4);
	}
%>
<html>
<head>
<title>Roman Holiday Online Store</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
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
        <td height="33" background="images/shop_12.gif"></td>
        <td width="505" height="33" align="right" valign="middle" background="images/shop_12.gif"><table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">^_^ Welcome to our store and enjoy your time <a href="register.jsp" class="word_green">[New to our store]</a></marquee></td>
          </tr>
        </table></td>
        <td width="10" background="images/shop_12.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="93" height="50" background="images/shop_15.gif">&nbsp;</td>
        <td colspan="2" background="images/shop_16.gif">
		       <jsp:include page="search.jsp"/>
		</td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="80" background="images/center_bbsdetail.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
                  <table width="98%" height="79"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="2%" height="12" align="center">&nbsp;</td>
                      <td width="95%" height="27">&nbsp;<%=Title%></td>
                      <td width="3%">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="2%" height="12" align="center">&nbsp;</td>
                      <td height="27">&nbsp;<%=chStr.convertStr(content)%></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="2%" height="24" align="center">&nbsp;</td>
                      <td height="27">&nbsp;Publish Date：<%=Intime%></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="2%" height="47" align="center">&nbsp;</td>
                      <td align="center"><input name="Submit" type="submit" class="btn_grey" onClick="history.back(-1);" value="Back"></td>
                      <td></td>
                    </tr>
                  </table>
                 </td>
            </tr>
            <tr>
              <td height="38" align="right" background="images/center02.gif"><a href="sale.jsp"><br>
                    <br>
              </a></td>
              </tr>
          </table></td>
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('You make a mistake');window.location.href='index.jsp';");
}%>
