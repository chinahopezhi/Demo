<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs=conn.executeQuery("select top 10 GoodsID,GoodsName, sum(number) as sumNum from V_order_detail group by GoodsName,GoodsID order by sumNum desc");
int goodsID=-1;
String goodsName="";
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
		       <form name="form2" method="post" action="search_deal.jsp">
					<table width="100%" height="23"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="2" height="7"></td>
                  </tr>
                <tr>
                  <td width="85%">Search：
                    <select name="select" class="textarea">
                      <option value="all" selected>All Department</option>
                          </select>                  <input name="bookkey" type="text" class="txt_grey" size="33">                  </td>
                  <td width="15%"><input name="search" type="submit" class="btn_grey" value="Search"></td>
                </tr>
              </table>
			   </form>
		</td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="80" background="images/center_sellsort.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
			  <%int m=1;
	while(rs.next()){
	goodsID=rs.getInt(1);
	goodsName=rs.getString(2);
	%>
                  <table width="96%" height="30"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td width="18%" align="center"><%=m%></td>
                      <td width="61%"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a></td>
                      <td width="21%" align="center"><%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="Buy">
						 <%}else{out.println("Please log in first");}%></td>
                    </tr>
                  </table>
				  <%
				  m++;
				  }%>
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
