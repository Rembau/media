<%@page contentType="text/html; charset=GB2312" language="java"%>
<html>
<head>
<title>�趨ѧ�ں���</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="javascript">
function check(){
     var mark=document.form1.semester.value.charAt(4);
	 if(document.form1.date.value=='' || document.form1.semester.value==''){
	 alert("����������!");
	 return false;
	 }
}
</script>
<span class="current"><font color="#F00">��ǰλ��:</font>�趨ѧ�ں��ܴ�</span>
<br>
<span class="bg">
<form action=".WeekRuku" method="post" name="form1">
�����뱾ѧ��:(��ʽ��;2010-2011)<br>
<input name="semester">&nbsp;&nbsp;
��
<select name="semester1">
<option>1</option>
<option>2</option>
<option>3</option>
</select>
ѧ��<br>
�������һ������һ������(��ʽ:2011-08-29)<br>
<input type="text" name="date">&nbsp;&nbsp; 	
��
<select name="num">
<%for(int i=1;i<25;i++) out.println("<option>"+i+"</option>");%>
</select>
��
<br>
<input type="submit" value="ȷ��" onClick="return check()">
</form>
<a href="cannotselect.jsp">����ѡ����������</a> &nbsp;&nbsp;<a href="init.jsp">��ʼ������</a>
</span>
</body>
</html>