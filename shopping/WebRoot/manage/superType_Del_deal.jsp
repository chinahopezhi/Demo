<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.DB.connDB"%>
<jsp:include page="safe.jsp"/>
<%
connDB conn=new connDB();
String ID[]=request.getParameterValues("delid");
String superTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		superTypeID=superTypeID+ID[i]+",";
	}
	superTypeID=superTypeID.substring(0,superTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_superType Where ID in("+superTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('Please delete the small department first!');window.location.href='superType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('Large department is deleted successfully!');window.location.href='superType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('You make a mistake!');window.location.href='superType.jsp';</script>");
}
%>
