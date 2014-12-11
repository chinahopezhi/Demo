<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");//创建Vector的一个对象保存session中的购物信息
Vector newcart=new Vector();//创建并实例化Vector的一个对象，用于保存修改后的cart
for(int i=0;i<cart.size();i++){
	String number=request.getParameter("num"+i);
	goodselement mygoodselement=(goodselement)cart.elementAt(i);  //取得修改数量的元素
	String num=request.getParameter("num"+i);
	try{
	int newnum=Integer.parseInt(num);
	mygoodselement.number=newnum;         // 用新的数量修改cart中的指定元素的number值
	if(newnum!=0){
		newcart.addElement(mygoodselement);}       //将修改后的元素再次添加到newcart中
	}catch(Exception e){
		out.println("<script language='javascript'>alert('您输入的数量不是有效的整数!');history.back();</script>");
		return;
	}
}             //try...catch 用户输入非整数时捕捉异常的代码
session.setAttribute("cart",newcart);      //将修改后购物信息newcart保存到session变量cart中
response.sendRedirect("cart_see.jsp");     //将页面重定向到查看购物车页面
%>
