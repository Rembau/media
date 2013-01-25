<%@page contentType="text/html; charset=GB2312" language="java"%>
<html>
<head>
<title>设定学期和周</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="javascript">
function check(){
     var mark=document.form1.semester.value.charAt(4);
	 if(document.form1.date.value=='' || document.form1.semester.value==''){
	 alert("请输入完整!");
	 return false;
	 }
}
</script>
<span class="current"><font color="#F00">当前位置:</font>设定学期和周次</span>
<br>
<span class="bg">
<form action=".WeekRuku" method="post" name="form1">
请输入本学期:(格式如;2010-2011)<br>
<input name="semester">&nbsp;&nbsp;
第
<select name="semester1">
<option>1</option>
<option>2</option>
<option>3</option>
</select>
学期<br>
请输入第一周星期一的日期(格式:2011-08-29)<br>
<input type="text" name="date">&nbsp;&nbsp; 	
共
<select name="num">
<%for(int i=1;i<25;i++) out.println("<option>"+i+"</option>");%>
</select>
周
<br>
<input type="submit" value="确定" onClick="return check()">
</form>
<a href="cannotselect.jsp">不能选课日期设置</a> &nbsp;&nbsp;<a href="init.jsp">初始化设置</a>
</span>
</body>
</html>