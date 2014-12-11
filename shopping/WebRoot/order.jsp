<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('Please log in first!');window.location.href='index.jsp';</script>");
}else{
	connDB conn=new connDB();
	ResultSet rs=conn.executeQuery("select * from tb_order where username='"+username+"'");
	int orderID=0;
	int bnumber=0;
	String truename="";
	String pay="";	
	String carry="";
	float rebate=1;
	String orderDate="";
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
              <td height="80" background="images/center_order.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
<table width="94%"  border="0" cellpadding="0" cellspacing="0">
                    <tr align="center" >
                      <td width="8%" height="30" class="tableBorder_B_dashed">Order NO</td>
                      <td width="8%" class="tableBorder_B_dashed">Class</td>
                      <td width="13%" class="tableBorder_B_dashed">RealName</td>
                      <td width="18%" class="tableBorder_B_dashed">PayMethod</td>
                      <td width="18%" class="tableBorder_B_dashed">ShipMethod</td>
                      <td width="26%" class="tableBorder_B_dashed">OrderDate</td>
                    </tr>
					<%
					while(rs.next()){
						orderID=rs.getInt("orderID");
						bnumber=rs.getInt("bnumber");
						truename=rs.getString("truename");
						pay=rs.getString("pay");
						carry=rs.getString("carry");
						rebate=rs.getFloat("rebate");
						orderDate=rs.getString("orderDate");
					%>
                    <tr align="center">
                      <td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
                      <td><%=bnumber%></td>
                      <td><%=truename%></td>
                      <td><%=pay%></td>
                      <td><%=carry%></td>
                      <td><%=orderDate%></td>
                    </tr>
					<%}%>
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
<%conn.close();}%>
