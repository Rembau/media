<%@page contentType="text/html; charset=GB2312" language="java"%>
<html>
<head>
<title>ע��</title>
<link href="css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(){
   if(document.register.num.value==''){
      alert('���Ų���Ϊ��!');
      return false;
   }
   else if(document.register.name.value==''){
      alert('��������Ϊ��!');
      return false;
   }
   else if(document.register.password1.value!=document.register.password2.value){
      alert('�������벻һ��');
      return false;
   }
    else if(document.register.password1.value==''){
      alert('���벻��Ϊ��!');
      return false;
   }
   return true;
}
</script>
<body alink=""> 
<pre class="bg">
<form method="post" action="servlet/Register" name="register">
<input type="text" name="num" />   ����(����)<br>
<input type="text" name="name" />   ��ʵ����(����)<br>
<select name="depart"> 
<option>��Ϣ����ѧԺ</option>
<option>����ѧԺ</option>
<option>��ѧԺ</option>
<option>����Ժ</option>
<option>��ѧϵ</option>
<option>����ѧԺ</option>
<option>����ϵ</option>
<option>����ϵ</option>
<option>����ϵ</option>
<option>���ϵ</option>
<option>����ϵ</option>
<option>��ѧϵ</option>
<option>����ϵ</option>
<option>����ѧԺ</option>
<option>�ֽ�����</option></select>   Ժϵ(����)<br>
<input type="password" name="password1" />   ����(����)<br>
<input type="password" name="password2" />   �ظ�����(����)<br>
<input type="text" name="cardnum" value="��"/>   ��ý��ʹ��֤����(û�п��Բ���,����������Ա��������ܽ��е�¼)<br>
<input type="text" name="telephone" />   �绰����<br>
<input type="text" name="mail" />   ����<br>
<input type="submit" value="ȷ��" onClick="return check()"><input type="reset" value="���"></form>
<a href="landing.jsp">����</a>
</pre>
</body>
</html>