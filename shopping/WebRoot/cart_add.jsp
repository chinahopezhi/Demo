<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Add to Cart</title>
</head>

<body>
<%
chStr chStr=new chStr();
connDB conn=new connDB();
int ID=Integer.parseInt(request.getParameter("goodsID"));
String sql="select * from tb_goods where ID="+ID;
ResultSet rs=conn.executeQuery(sql);
float nowprice=0;
if(rs.next()){
	nowprice=rs.getFloat("nowprice");
}
goodselement mygoodselement=new goodselement();
mygoodselement.ID=ID;
mygoodselement.nowprice=nowprice;
mygoodselement.number=1;
boolean Flag=true;
Vector cart=(Vector)session.getAttribute("cart");
if(cart==null){
	cart=new Vector();
}else{
	for(int i=0;i<cart.size();i++){
		goodselement goodsitem=(goodselement)cart.elementAt(i);
		if(goodsitem.ID==mygoodselement.ID){  
			goodsitem.number++;
			cart.setElementAt(goodsitem,i);
			Flag=false;
		}
	}
}
if(Flag)cart.addElement(mygoodselement);
session.setAttribute("cart",cart);
conn.close();
response.sendRedirect("cart_see.jsp");
%>
