<%@ page contentType="text/html; charset=gb18030" language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="Shortcut Icon" href="ico/1.ico">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="css/side_iframe.css" rel="stylesheet" type="text/css" />
</head>
<%String mark=(String)session.getAttribute("mark"); %>
<script type="text/javascript">
function tip(){
   var state='<%=mark%>'; 
   if(state=='�����'){
      alert('����ʱ���������ý��,��������ϵ��̲�');
      return false;
   }
   return true;
}
</script>
<body>
<div id="menu" align="center">
<ul>
<li><a href="teacher/application.jsp?ok=0" target="main_iframe" onClick="return tip()">��ʦ����</a></li>
<li><a href="teacher/sqtable.jsp" target="main_iframe">�鿴,ȡ������</a></li>
<li><a href="teacher/copy.jsp" target="main_iframe">����ѡ��</a></li>
<li><a href="teacher/fault.jsp?id=0" target="main_iframe">���ϱ���</a></li>
<li><a href="teacher/suggestion.jsp" target="main_iframe">�ύ����</a></li>
<li><a href="news/news.jsp" target="main_iframe">�鿴����</a></li>
<li><a href="teacher/teacher.jsp" target="main_iframe">�鿴����</a></li>
<li><a href="changeany.jsp" target="main_iframe">������Ϣ</a></li>
<!--<li><a href="teacher/activation.jsp" target="main_iframe">�����ʺ�</a></li>-->
<li><a href="help/help.jsp" target="main_iframe">����</a></li>
<!--<li>��ϵ�ֽ�����</li>
<li></li>
<li>�绰:</li>
<li>QQ:</li>
<li>E-mail:</li>-->
<%--<li><img src="images/manage_12.gif" /></li>--%>
</ul>
</div>
</body>
</html>
