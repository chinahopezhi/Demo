<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.dao.SuperTypeDaoImpl"%>
<jsp:useBean id="SuperType" scope="page" class="commerce.SuperType">
<jsp:setProperty name="SuperType" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.wgh.DB.chStr"/>
<jsp:useBean id="conn" scope="page" class="com.wgh.DB.connDB"/>
<jsp:include page="safe.jsp"/>
<%
String typename=chStr.chStr(SuperType.gettypename());
ResultSet rs=conn.executeQuery("select * from tb_superType where typename='"+typename+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('Have added,try a new large department��');window.location.href='super_add.jsp';</script>");
}else{
	int ret=0;
        SuperTypeDaoImpl ins_SuperType=new SuperTypeDaoImpl();
        ret=ins_SuperType.insert(SuperType);
	if (ret!=0){
          out.println("<script language='javascript'>alert('Added successfully��');window.location.href='superType.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('Added failed��');window.location.href='super_add.jsp';</script>");
        }
}
%>