<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.dao.MemberDaoImpl" %>
<jsp:useBean id="member" scope="request" class="commerce.member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>Member information change!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
connDB conn=new connDB();

request.setCharacterEncoding("gb2312");
Integer id=member.getID();
ResultSet rs=conn.executeQuery("select * from tb_Member where ID='"+id+"'");
if (!rs.next()){
	out.println("<script language='javascript'>alert('You make a mistake！');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        MemberDaoImpl ins_member=new MemberDaoImpl();
        ret=ins_member.update(member);
	if (ret!=0){
          out.println("<script language='javascript'>alert('Information is revised successfully！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('Information is revised failed！');window.location.href='modifyMember.jsp';</script>");
        }
}

%>
</body>
</html>
