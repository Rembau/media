<%@ page contentType="text/html;charset=GB2312"%>
<html>
<HEAD>
<TITLE>导表</TITLE>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</HEAD>
<body>
<span class="current"><font color="#F00">当前位置:</font>导入教师表</span><br>
<span class="bg">
<p>
<font color="#FF0000"> 注意:</font>excel应满足如下格式:
</p>
<table border="1">
<tr>
<td>第一列:序号</td>
<td>第二列:工号</td>
<td>第三列:多媒体使用证</td>
<td>第四列:姓名</td>
<td>第五列:部门</td>
</tr>
</table>
<br>
<form name="change" action="uploadxls.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file" class="file">
<input type="submit" name="Submit" value="确定">
<a href="guanliuser.jsp">返回
</a>
</form> 
</span>

</body>
</html>
