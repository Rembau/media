<%@page contentType="text/html; charset=GB2312" language="java"%>
<html>
<head>
<title>注册</title>
<link href="css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(){
   if(document.register.num.value==''){
      alert('工号不能为空!');
      return false;
   }
   else if(document.register.name.value==''){
      alert('姓名不能为空!');
      return false;
   }
   else if(document.register.password1.value!=document.register.password2.value){
      alert('两次密码不一致');
      return false;
   }
    else if(document.register.password1.value==''){
      alert('密码不能为空!');
      return false;
   }
   return true;
}
</script>
<body alink=""> 
<pre class="bg">
<form method="post" action="servlet/Register" name="register">
<input type="text" name="num" />   工号(必填)<br>
<input type="text" name="name" />   真实姓名(必填)<br>
<select name="depart"> 
<option>信息工程学院</option>
<option>旅游学院</option>
<option>文学院</option>
<option>经管院</option>
<option>数学系</option>
<option>旅游学院</option>
<option>外语系</option>
<option>艺术系</option>
<option>体育系</option>
<option>社科系</option>
<option>建筑系</option>
<option>化学系</option>
<option>教育系</option>
<option>生环学院</option>
<option>现教中心</option></select>   院系(必填)<br>
<input type="password" name="password1" />   密码(必填)<br>
<input type="password" name="password2" />   重复密码(必填)<br>
<input type="text" name="cardnum" value="无"/>   多媒体使用证号码(没有可以不填,但经过管理员审批后才能进行登录)<br>
<input type="text" name="telephone" />   电话号码<br>
<input type="text" name="mail" />   邮箱<br>
<input type="submit" value="确定" onClick="return check()"><input type="reset" value="清除"></form>
<a href="landing.jsp">返回</a>
</pre>
</body>
</html>