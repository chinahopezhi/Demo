<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
ResultSet rs_bbs=conn.executeQuery("select top 5 * from tb_bbs order by INTime desc");
ResultSet rs_sort=conn.executeQuery("select GoodsID,GoodsName, sum(number) as sumNum from V_order_detail group by GoodsName,GoodsID order by sumNum desc");
%>
<script src="JS/check.js"></script>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="83" align="center"><img src="images/shop_11.gif" width="182" height="83"></td>
      </tr>
      <tr>
        <td height="98" align="center" background="images/shop_17.gif">		  <form name="form1" method="post" action="Login_U.jsp">
		  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10%">&nbsp;</td>
              <td width="90%" valign="top" background="Images/index_09.gif">
			  <%String username=(String)session.getAttribute("username");
			  if (username==null || username==""){%>
			  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="94%" height="24">Username
                    <input name="username" type="text" class="txt_grey" id="username" size="16"></td>
                  <td width="6%">&nbsp;</td>
                </tr>
                <tr>
                  <td height="24">Password
                    <input name="PWD" type="password" class="txt_grey" id="PWD" size="16" onKeydown="if(event.keyCode==13) form1.submit();"></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="31">
                    <input name="Button" type="button" class="btn_grey" value="New" onClick="window.location.href='register.jsp'">
                    
                    <input name="Submit2" type="button" class="btn_grey" value="Sign in" onClick="checkU(form1)">                    <input name="Submit3" type="reset" class="btn_grey" value="Reset"></td>
                  <td>&nbsp;</td>
                </tr>
              </table>
			  <%}else{%>
                <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="94%" height="31" align="center" class="word_white"><%=username%> Hi，<br>Wishing you a happy shopping!</td>
                    <td width="6%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="24" align="center"><input name="Submit22" type="button" class="btn_grey" value="Revise information" onClick="window.location.href='modifyMember.jsp';"></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="24" align="center">
      <input name="Submit32" type="button" class="btn_grey" value="Log out" onClick="window.location.href='logout.jsp';"></td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
				<%}%>
				</td>
            </tr>
          </table>
		  </form></td>
      </tr>
    </table>
      <table width="100%" height="155"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/shop_22.gif" width="182" height="58"></td>
        </tr>
        <tr>
          <td height="97" align="center" valign="top" class="tableBorder_l"><table width="88%"  border="0" cellspacing="0" cellpadding="0">
            <%
			int ID_bbs=0;
			String title="";
			while(rs_bbs.next()){
			  ID_bbs=rs_bbs.getInt(1);
			  title=rs_bbs.getString(2);
%>
			<tr>
              <td height="24" class="tableBorder_T_dashed"><a href="bbs_detail.jsp?ID=<%=ID_bbs%>"><%=title%></a></td>
            </tr>
<%			}%>
          </table></td>
        </tr>
      </table>
      <table width="100%" height="151"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" background="images/shop_33.gif">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" valign="top" class="tableBorder_lb"><table width="88%"  border="0" cellspacing="0" cellpadding="0">
            <%
			int ID_sort=0;
			String goodsname="";
			while(rs_sort.next()){
			  ID_sort=rs_sort.getInt(1);
			  goodsname=rs_sort.getString(2);
%>
			<tr>
              <td height="20" class="tableBorder_B_dashed"><a href="goods_detail.jsp?ID=<%=ID_sort%>"><%=goodsname%></a></td>
            </tr>
<%}%>
          </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
