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
   if(state=='待审核'){
      alert('你暂时不能申请多媒体,详情请联系电教部');
      return false;
   }
   return true;
}
</script>
<body>
<div id="menu" align="center">
<ul>
<li><a href="teacher/application.jsp?ok=0" target="main_iframe" onClick="return tip()">教师申请</a></li>
<li><a href="teacher/sqtable.jsp" target="main_iframe">查看,取消申请</a></li>
<li><a href="teacher/copy.jsp" target="main_iframe">复制选课</a></li>
<li><a href="teacher/fault.jsp?id=0" target="main_iframe">故障报告</a></li>
<li><a href="teacher/suggestion.jsp" target="main_iframe">提交建议</a></li>
<li><a href="news/news.jsp" target="main_iframe">查看公告</a></li>
<li><a href="teacher/teacher.jsp" target="main_iframe">查看提醒</a></li>
<li><a href="changeany.jsp" target="main_iframe">更改信息</a></li>
<!--<li><a href="teacher/activation.jsp" target="main_iframe">激活帐号</a></li>-->
<li><a href="help/help.jsp" target="main_iframe">帮助</a></li>
<!--<li>联系现教中心</li>
<li></li>
<li>电话:</li>
<li>QQ:</li>
<li>E-mail:</li>-->
<%--<li><img src="images/manage_12.gif" /></li>--%>
</ul>
</div>
</body>
</html>
