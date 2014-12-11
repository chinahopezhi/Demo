<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.dao.GoodsDaoImpl"%>
<jsp:useBean id="goods" scope="page" class="commerce.goods">
<jsp:setProperty name="goods" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.wgh.DB.chStr"/>
<jsp:useBean id="conn" scope="page" class="com.wgh.DB.connDB"/>
<jsp:include page="safe.jsp"/>
<%
Integer id=goods.getID();
ResultSet rs=conn.executeQuery("select * from tb_goods where ID="+id);
if (!rs.next()){
	out.println("<script language='javascript'>alert('You make a mistake!');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        GoodsDaoImpl up_goods=new GoodsDaoImpl();
        ret=up_goods.update(goods);
	if (ret!=0){
          out.println("<script language='javascript'>alert('Goods is revised successfully!');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('Goods is revised failed!');window.location.href='index.jsp';</script>");
        }
}

%>
