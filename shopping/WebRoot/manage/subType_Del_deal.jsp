<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.DB.connDB"%>
<jsp:include page="safe.jsp"/>
<%
connDB conn=new connDB();
String ID[]=request.getParameterValues("delid");
String subTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		subTypeID=subTypeID+ID[i]+",";
	}
	subTypeID=subTypeID.substring(0,subTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_subType Where ID in("+subTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('Deleted failed');window.location.href='subType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('Deleted successfully!');window.location.href='subType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('You make a mistake!');window.location.href='subType.jsp';</script>");
}

%>
