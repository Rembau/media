<%@page contentType="text/html; charset=GB2312" language="java"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��¼</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>������¼</span>
<br>


<span class="bg"> 
<form action=".Adminrecordruku" method="post" name="absendrecord">
����:
<input type="text" size="40" name="topic"><br>
����:
<textarea name="content" rows="20" cols="90"></textarea><br>
<center>
<input type="submit" value="�ύ" onClick="return checkabsendrecord()">
<a href="record.jsp">�鿴��¼</a>
</center>
</form>
</span>
<script language="javascript">
function checkabsendrecord(){
      if(document.absendrecord.content.value==''){
	      alert("���ݲ���Ϊ��!");
		  return false;
	  }
	  else if(document.absendrecord.topic.value.length>15){
	      alert("���ⲻ�ܶ���15���ַ�!");
		  return false;
	  }
	  else if(document.absendrecord.content.value.length>250){
	      alert("���ݲ��ܶ���250���ַ�!");
		  return false;
	  }
}
</script>
</body>
</html>
