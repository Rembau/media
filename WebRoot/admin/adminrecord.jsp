<%@page contentType="text/html; charset=GB2312" language="java"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>记录</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">当前位置:</font>工作记录</span>
<br>


<span class="bg"> 
<form action=".Adminrecordruku" method="post" name="absendrecord">
主题:
<input type="text" size="40" name="topic"><br>
内容:
<textarea name="content" rows="20" cols="90"></textarea><br>
<center>
<input type="submit" value="提交" onClick="return checkabsendrecord()">
<a href="record.jsp">查看记录</a>
</center>
</form>
</span>
<script language="javascript">
function checkabsendrecord(){
      if(document.absendrecord.content.value==''){
	      alert("内容不能为空!");
		  return false;
	  }
	  else if(document.absendrecord.topic.value.length>15){
	      alert("标题不能多于15个字符!");
		  return false;
	  }
	  else if(document.absendrecord.content.value.length>250){
	      alert("内容不能多于250个字符!");
		  return false;
	  }
}
</script>
</body>
</html>
