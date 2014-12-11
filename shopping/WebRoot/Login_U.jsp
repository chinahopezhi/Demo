<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String username=chStr.chStr(request.getParameter("username"));//此处必须进行编码转换，否则输入中文用户名时将出现乱码
try{
	ResultSet rs=conn.executeQuery("select * from tb_Member where username='"+username+"' and freeze=0");
	if(rs.next()){
		String PWD=request.getParameter("PWD");
		if(PWD.equals(rs.getString("password"))){
			session.setAttribute("username",username);
			response.sendRedirect("index.jsp");//跳转到index.jsp页面
		}else{
			out.println("<script language='javascript'>alert('Your username or password is wrong!');window.location.href='index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('Your username or password is wrong and your account has been frozen!');window.location.href='index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('You make a mistake!');window.location.href='index.jsp';</script>");
}
conn.close();
%>
