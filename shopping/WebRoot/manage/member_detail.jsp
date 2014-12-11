<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<jsp:include page="safe.jsp"/>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs=conn.executeQuery("select * from tb_member where ID="+ID);
	String username="";
	String Truename="";
	String city="";
	String address="";
	String postcode="";
	String CardNO="";
	String CardType="";	  
	float Amount=0;
	String Tel="";
	String Email=""; 
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('You make a mistake!');window.location.href='membermanage.jsp';</script>");
	}else{
		username=rs.getString("username");
		Truename=rs.getString("Truename");
		city=rs.getString("city");
		address=rs.getString("address");
		postcode=rs.getString("postcode");
		CardNO=rs.getString("CardNO");
		CardType=rs.getString("CardType");	  
		Amount=rs.getFloat("Amount");
		Tel=rs.getString("Tel");	
		Email=rs.getString("Email");	 
	}
%>
<html>
<head>
<title>Roman Holiday Online Store Back-stage Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="onclock.JS"></script>
</head>
<body  onLoad="clockon(bgclock)"> 
<table width="777" height="192"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
<tr>
  <td>
<jsp:include page="banner.jsp"/>
<table width="777" height="288"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" background="../images/manage_02.gif"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>
    <td align="center" valign="top"><table width="100%" height="120"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" background="../images/manage_center_memberdetail.gif"><table width="100%" height="36"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="98%" align="right">&nbsp;</td>
            <td width="2%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
          </table>
             <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder_dashed">
                  <tr>
                    <td width="19%" height="27" align="center" class="tableBorder_B_dashed">&nbsp;Username£º</td>
                    <td height="13" class="tableBorder_B_dashed"> &nbsp;<%=username%>                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Realname£º</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=Truename%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;City£º</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=city%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Address£º</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=address%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Zip£º</td>
                    <td width="81%" height="27" class="tableBorder_B_dashed">&nbsp;<%=postcode%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;ID£º</td>
                    <td height="14" class="tableBorder_B_dashed">&nbsp;<%=CardType%> </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;IDNO£º</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=CardNO%>
                    </td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Tel£º</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Tel%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Email£º</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Email%></td>
                    </tr>
                  <tr>
                    <td height="27" align="center" class="tableBorder_B_dashed">&nbsp;Expenditure£º</td>
                    <td class="tableBorder_B_dashed">&nbsp;<%=Amount%> (Dollars)</td>
                    </tr>
                  <tr>
                    <td height="38" colspan="2" align="center">

                        <input name="Submit3" type="button" class="btn_grey" value="Back" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>		  </td>
        </tr>
      </table>
      <table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td background="../images/manage_06.gif">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="54" align="center"><jsp:include page="copyright.jsp"/></td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
<%
}else{
	out.println("<script lanuage='javascript'>alert('You make a mistake!');window.location.href='index.jsp';</script>");
}%>