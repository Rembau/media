<%@page contentType="text/html; charset=gb2312" import="java.net.URLEncoder"%>
<html>
<head>
<link rel="Shortcut Icon" href="ico/1.ico">
<script   LANGUAGE= "JavaScript"> 
function   openwin()   { 
window.open("change.jsp","newwindow","height=150,width=280,top=300,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
//写成一行 
} 
function CheckLogin(){
   if(document.userlogin.num.value=='' || document.userlogin.password.value==''){
      alert('用户名或密码不能为空');
      return false;
   }
   return true;
}
</script>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.top {
	background: url(images/media_01.gif);
}
.middle {
	background: url(images/media_05.gif);
}
.logo {
	background: url(images/media_06.gif) repeat-x;
}
.bottom {
	background: url(images/media_09.gif) repeat-x;
}
.submit{
	margin-top: 7px;
	margin-left: 75px;
}
.submit input {
	margin-right: 15px;	
}
body {
	margin-top: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
	font-weight: 100;
	letter-spacing: 0.2em;
	color: #888;
}
a:link {
	color: #333333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #333333;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}

-->
</style>
</head>
<body>
<div align="center">
<!-- ImageReady Slices (media.psd) -->
<table id="Table_01" width="1000" border="0" cellpadding="0" cellspacing="0">
	<tr class="top">
		<td  height="23"></td>
	</tr>
	<tr class="logo">
		<td height="133"><img src="images/media_03.gif" width="221" height="133"></td>
	</tr>
	<tr class="middle">
		<td height="30" align="right">
		<a href="help/loginhelp.jsp">注册需知</a>
		<a href="register.jsp">立即注册</a>
		<a href="#" onclick= "openwin()">修改密码&nbsp;</a></td>
	</tr>
	<tr>
		<td height="151">
			<img src="images/media_07.gif" width="1000" height="151" ></td>
	</tr>
	<tr>
	  <td height="227" align="center">
	          <form action="servlet/LoginJump" method="post"  name="userlogin">
	  <table width="248" border="0">
          <tr>
            <td colspan="2"><font face="黑体" size="3" color="#333333">账号：</font>
			<input type="text" name="num" style="width:180; height:20" /></td>
          </tr>
          <tr>
            <td colspan="2"><font face="黑体" size="3" color="#333333">密码：</font>
        <input type="password" name="password" style="width:180; height:20"/></td>
          </tr>
          <tr>
            <td width="142" align="right"><input type="image" src="images/media_12.gif" onClick="return CheckLogin()"></td>
            <td width="96" align="center"><input onclick= "document.userlogin.reset();return false;" type=image src="images/media_14.gif" name=image></td>
          </tr>
      </table>
              </form>
      </td>
	</tr>
	<tr class="bottom">
		<td height="36" align="center">
			Copyright&copy;  2010 - 2012 黄山学院现教中心软件研发中心</td>
	</tr>
</table>
<!-- End ImageReady Slices -->
</div>
</body>
</html>