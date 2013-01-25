<%@ page contentType="text/html;charset=GB2312"%>
<html>
<HEAD>
<TITLE>修改密码</TITLE>
</HEAD>
<body text="0a7190" bgcolor="#fcfcfc">
<script Language="Javascript" src="form.js"></Script>
<form name="change" action=".ChangePW" method="post">
账号:&nbsp;
<input type="text" name="number" style="width:150px" maxlength="12"><br>
原密码:<input type="password" name="oldpsw" style="width:150px" maxlength="12"><br>
新密码:<input type="password" name="newpsw" style="width:150px" maxlength="12"><br>
重复:&nbsp;&nbsp;<input type="password" name="newpsw1" style="width:150px" maxlength="12"><br>
<center>
<!--<input type="submit" onClick="window.opener = null; 
window.open(' ', '_self', ' ');window.close()"  value="完成"><input type="button" value="返回" onClick="window.opener = null; 
window.open(' ', '_self', ' ');window.close()" /> -->
<input type="submit" value="确定" onClick="return CheckChangepsw()"></center>
</form> 
</body>
</html>
