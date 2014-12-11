<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
int superID=-1;
String superName="";
if(rs_super.next()){
	superID=rs_super.getInt(1);
}else{
	out.println("<script language='javascript'>alert('Please input the department information!');window.location.href='index.jsp';</script>");
	return;
}

int P_superID=-1;
ResultSet rs_sub=null;
//查询所属小类的默认选项
if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	P_superID=superID;
}else{
	P_superID=Integer.parseInt(request.getParameter("superID"));
}
rs_sub=conn.executeQuery("select * from tb_subType where superType="+P_superID);
int subID=-1;
String subName="";
%>
<html>
<head>
<title>Roman Holiday Online Store Back-stage Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("Please input the goods name!");form1.goodsName.focus();return;
	}
	if (form1.picture.value==""){
		alert("Please input the image path!");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("Please input the goods price!");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("The price is wrong, please try again!");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("Please input the goods details!");form1.introduce.focus();return;
	}		
	form1.submit();
}
</script>
<body>
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
        <td valign="top" background="../images/manage_center_goodsadd.gif"><table width="100%" height="36"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="98%" align="right"><a href="superType.jsp">[ <img src="../images/list.gif" width="11" height="13">&nbsp;Large Department Management]</a>&nbsp;<a href="subType.jsp">[ <img src="../images/list.gif" width="11" height="13">&nbsp;Small Department Management]</a>&nbsp;<a href="goods_add.jsp">[ <img src="../images/list.gif" width="11" height="13">&nbsp;Add Goods]</a></td>
            <td width="2%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
   			  			  <form action="goods_add_deal.jsp" method="post" name="form1">
			    <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td height="27">&nbsp;Large Department：</td>
                    <td width="31%" height="27">&nbsp;
					<script language="javascript">
					function F_super(val){
						window.location.href="goods_add.jsp?superID="+val;   //实现级联菜单
					}
					</script>
                      <select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    <td width="13%" height="27"> &nbsp;Small Department：</td>
                    <td width="42%" height="27">&nbsp;
                      <select name="typeID" class="textarea" id="typeID">
					  <%while(rs_sub.next()){
					  	subID=rs_sub.getInt(1);
					  	subName=rs_sub.getString(3);
					  %>
					   <option value="<%=subID%>"><%=subName%></option>
					  <%}%>
                     </select>
</td>
                  </tr>
                  <tr>
                    <td width="14%" height="27">&nbsp;Name：</td>
                    <td height="27" colspan="3">&nbsp;
                      <input name="goodsName" type="text" class="Sytle_text" id="bookID2" size="50">&nbsp;&nbsp;                    </td>
                    </tr>
                  <tr>
                    <td height="41">&nbsp;Image：</td>
                    <td height="41">&nbsp;
                          <input name="picture" type="text" class="Style_upload" id="picture">
                    </td>
                    <td height="41">&nbsp;Price：</td>
                    <td height="41">&nbsp;
                          <input name="price" type="text" class="Sytle_text" id="price">
      (Dallors)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;New?：</td>
                    <td>&nbsp; <input name="newGoods" type="radio" class="noborder" value="1" checked>
Yes
  <input name="newGoods" type="radio" class="noborder" value="0">
No</td>
                    <td>&nbsp;On Sale?：</td>
                    <td><input name="sale" type="radio" class="noborder" value="1" checked>
Yes
  <input name="sale" type="radio" class="noborder" value="0">
No</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;Details：</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_grey" value="Save" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="Reset">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="Back" onClick="JScript:history.back(-1)">
                    </td>
                  </tr>
                </table>
			  </form>
          </td>
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
