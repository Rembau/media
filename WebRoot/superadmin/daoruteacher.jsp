<%@ page contentType="text/html;charset=GB2312"%>
<html>
<HEAD>
<TITLE>����</TITLE>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</HEAD>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>�����ʦ��</span><br>
<span class="bg">
<p>
<font color="#FF0000"> ע��:</font>excelӦ�������¸�ʽ:
</p>
<table border="1">
<tr>
<td>��һ��:���</td>
<td>�ڶ���:����</td>
<td>������:��ý��ʹ��֤</td>
<td>������:����</td>
<td>������:����</td>
</tr>
</table>
<br>
<form name="change" action="uploadxls.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file" class="file">
<input type="submit" name="Submit" value="ȷ��">
<a href="guanliuser.jsp">����
</a>
</form> 
</span>

</body>
</html>
