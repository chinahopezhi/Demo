<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<jsp:include page="safe.jsp"/>
<%
connDB conn=new connDB();
if(request.getParameter("ID")!=""){
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_member set freeze=1 where ID="+ID;
	int ret=0;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('The membership is frozen£¡');window.location.href='membermanage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('You make a mistake!');window.location.href='membermanage.jsp';</script>");
	}
}
%>
