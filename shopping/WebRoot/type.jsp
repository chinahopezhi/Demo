<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
String type="";
type=request.getParameter("Type");
String sql_r="";
if(type.equals("null") || type.equals("")){
	out.println("<script language='javascript'>alert('You make a mistake');window.location.href='index.jsp'</script>");
}else{
	sql_r="select * from V_goods where subID="+type;
	ResultSet rs_r=conn.executeQuery(sql_r);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
	String subTypename="";
	String superTypename="";
	ResultSet rs_type=conn.executeQuery("select * from V_type where subID="+type);
	if(rs_type.next()){
		superTypename=rs_type.getString(2);
		subTypename=rs_type.getString(3);
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
          <td width="69%" height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="98%" height="80" background="images/center_type.gif">&nbsp;</td>
              <td width="2%"><img src="images/shop_19.gif" width="10" height="80"></td>
            </tr>
            <tr align="center" valign="top">
              <td height="134" align="center"><table width="90%" height="23"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td height="23"> Current Department Selection：[ <%=superTypename%> ]->[ <%=subTypename%> ]</td>
                      </tr>
                  </table>
			  <%
	while(rs_r.next()){
	goodsID=rs_r.getInt("ID");
	goodsName=rs_r.getString("goodsName");
	introduce=rs_r.getString("introduce");
	nowprice=rs_r.getFloat("nowprice");
	if(introduce.length()>10){
	  introduce=introduce.substring(0,10)+"...";
	}
	%>
                  <table width="96%" height="23"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="28%" height="23" style="padding-left:20px;"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a>
					  </td>
                      <td width="41%">&nbsp;<%=introduce%></td>
                      <td width="21%" align="center"><%=nowprice%>(Dollars)</td>
                      <%if (username!=null && username!=""){%>
					  <td width="10%" align="center">&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="Buy">
						</td>
						 <%}%> 
                    </tr>
                  </table>
				  <%}%>
                 </td>
            </tr>
            <tr>
              <td height="42" align="right" background="images/shop_24.gif"><a href="sale.jsp"><br>
                  <br>
              </a></td>
              <td height="42" background="images/shop_25.gif">&nbsp;</td>
            </tr>
          </table>
            </td>
          <td width="31%" valign="top"><jsp:include page="right.jsp"/></td>
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
<%conn.close();}%>