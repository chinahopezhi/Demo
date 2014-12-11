<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs=conn.executeQuery("select ID,GoodsName,Introduce,price,nowprice,picture from tb_goods where sale=1 order by GoodsName");
int goodsID=-1;
String goodsName="";
String introduce="";
float price=(float)0.0;
float nowprice=(float)0.0;
String picture="";
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
            <td align="right" class="word_green"><marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">^_^ Welcome to our store and enjoy your time<a href="register.jsp" class="word_green">[New to our store]</a></marquee></td>
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
              <td height="80" background="images/center_sale.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
			  <%
	while(rs.next()){
	goodsID=rs.getInt(1);
	goodsName=rs.getString(2);
	introduce=rs.getString(3);
	price=rs.getFloat(4);
	nowprice=rs.getFloat(5);
	picture=rs.getString(6); 
	%>
                  <table width="98%" height="79"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="37%" height="95" rowspan="5" align="center"><img src="images/goods/<%=picture%>" width="184" height="119"></td>
                      <td width="63%" height="27"><%=goodsName%></td>
                    </tr>
                    <tr>
                      <td height="27" style="text-decoration:line-through;color:#FF0000">Original Price：<%=price%> (Dollar)</td>
                    </tr>
                    <tr>
                      <td height="27">Current Price：<%=nowprice%>(Dollars) </td>
                    </tr>
                    <tr>
                      <td height="27"><%=introduce%></td>
                    </tr>
                    <tr>
                      <td><input name="Submit" type="submit" class="btn_grey" onClick="history.back(-1);" value="Back">
&nbsp;					  <%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="Buy">
						 <%}%></td>
                    </tr>
                  </table>
				  <hr align="center" width="92%" size="1">
				  <%}%>
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
<%conn.close();%>
