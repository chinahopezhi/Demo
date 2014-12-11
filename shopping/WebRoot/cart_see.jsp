<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('Please log in first!');window.location.href='index.jsp';</script>");
}else{
	chStr chStr=new chStr();
	connDB conn=new connDB();
	Vector cart=(Vector)session.getAttribute("cart");
	if(cart==null || cart.size()==0){
		response.sendRedirect("cart_null.jsp");
	}else{
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
              <td height="80" background="images/center_cart.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
<table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top">
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
<form method="post" action="cart_modify.jsp" name="form1">
<table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
        <td height="27" class="tableBorder_B1">ID</td>
        <td height="27" class="tableBorder_B1">GoodsID</td>
        <td class="tableBorder_B1">Name</td>
        <td height="27" class="tableBorder_B1">Unit Price</td>
        <td height="27" class="tableBorder_B1">Quantity</td>
        <td height="27" class="tableBorder_B1">Amount</td>
        <td class="tableBorder_B1">Back</td>
      </tr> 
	<%
		float sum=0;
		int ID=-1;
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			goodselement goodsitem=(goodselement)cart.elementAt(i);
			sum=sum+goodsitem.number*goodsitem.nowprice;
			ID=goodsitem.ID;
			if (ID>0){
				ResultSet rs_goods=conn.executeQuery("select * from tb_goods where ID="+ID);
				if (rs_goods.next()){
					goodsname=rs_goods.getString("goodsname");
				}
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="32" height="27"><%=i+1%></td>
        <td width="109" height="27"><%=ID%></td> 
        <td width="199" height="27"><%=goodsname%></td>
        <td width="59" height="27">$<%=goodsitem.nowprice%></td> 
        <td width="51" height="27">
          <input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=goodsitem.number%>" onBlur="check(this.form)"></td> 
        <td width="65" height="27">$<%=(goodsitem.nowprice*goodsitem.number)%></td> 
        <td width="34"><a href="cart_move.jsp?ID=<%=i%>"><img src="images/del.gif" width="16" height="16"></a></td>
        <script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("Please do not input invalid character");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("Pleans input the revised quantity");myform.num<%=i%>.focus();return;}	
				myform.submit();
			}
			-->
		</script>
	<%
		}

	%> </tr>
      </table>
	  </form>
<table width="100%" height="52" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
		<td height="10">&nbsp;		</td>
        <td width="24%" height="10" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">&nbsp;</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1">Amount in total：￥<%=sum%></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"> <a href="index.jsp">Continue shopping</a> | <a href="cart_checkout.jsp">Check out</a> | <a href="cart_clear.jsp">Empty cart</a> | <a href="#">Change quantity</a></td>
        </tr>
</table>
						</td>
                      </tr>
                    </table></td>
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
<%conn.close();}
}%>
