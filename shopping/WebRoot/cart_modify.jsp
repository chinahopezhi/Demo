<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");//����Vector��һ�����󱣴�session�еĹ�����Ϣ
Vector newcart=new Vector();//������ʵ����Vector��һ���������ڱ����޸ĺ��cart
for(int i=0;i<cart.size();i++){
	String number=request.getParameter("num"+i);
	goodselement mygoodselement=(goodselement)cart.elementAt(i);  //ȡ���޸�������Ԫ��
	String num=request.getParameter("num"+i);
	try{
	int newnum=Integer.parseInt(num);
	mygoodselement.number=newnum;         // ���µ������޸�cart�е�ָ��Ԫ�ص�numberֵ
	if(newnum!=0){
		newcart.addElement(mygoodselement);}       //���޸ĺ��Ԫ���ٴ���ӵ�newcart��
	}catch(Exception e){
		out.println("<script language='javascript'>alert('�����������������Ч������!');history.back();</script>");
		return;
	}
}             //try...catch �û����������ʱ��׽�쳣�Ĵ���
session.setAttribute("cart",newcart);      //���޸ĺ�����Ϣnewcart���浽session����cart��
response.sendRedirect("cart_see.jsp");     //��ҳ���ض��򵽲鿴���ﳵҳ��
%>
