<%@ page contentType="text/html;charset=GB2312"%>
<html>
<HEAD>
<TITLE>�޸�����</TITLE>
</HEAD>
<body text="0a7190" bgcolor="#fcfcfc">
<script Language="Javascript" src="form.js"></Script>
<form name="change" action=".ChangePW" method="post">
�˺�:&nbsp;
<input type="text" name="number" style="width:150px" maxlength="12"><br>
ԭ����:<input type="password" name="oldpsw" style="width:150px" maxlength="12"><br>
������:<input type="password" name="newpsw" style="width:150px" maxlength="12"><br>
�ظ�:&nbsp;&nbsp;<input type="password" name="newpsw1" style="width:150px" maxlength="12"><br>
<center>
<!--<input type="submit" onClick="window.opener = null; 
window.open(' ', '_self', ' ');window.close()"  value="���"><input type="button" value="����" onClick="window.opener = null; 
window.open(' ', '_self', ' ');window.close()" /> -->
<input type="submit" value="ȷ��" onClick="return CheckChangepsw()"></center>
</form> 
</body>
</html>
