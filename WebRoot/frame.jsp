<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="Shortcut Icon" href="ico/1.ico">
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<title>��ý�����ʹ������ϵͳ</title>
<link href="css/frame_style.css" rel="stylesheet" type="text/css" />
</head>
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
Object state=session.getAttribute("state");
//out.print(state.toString());
%>
<style type="text/css">
    a:hover{
    text-decoration: underline ;
	background: url(images/manage_101.jpg) no-repeat 0px 0px;
	color: #555;
}
</style>
<script language="javascript">
function out(){
      window.open("out.jsp","newwindow","height=150,width=280,top=300,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
	  }
</script>
<body id=main>
<%
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else id="0";
	 
	String sql="select * from media_remind where re_num='"+num.toString()+"' and re_state='δ����' order by re_id desc";
					 ResultSet rs=conn.stmt.executeQuery(sql);
					  if(rs.next()){
						  out.print("<script>alert('���յ�������:"+rs.getString(4)+";�뼰ʱ����.');</script>");
					  }
%>
<table id="container" width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" height="93" colspan="2"><img src="images/manage_02.gif" width="376" height="93" /></td>
  </tr>
  <tr>
    <td height="27" valign="top" class="top1">
    <img class="time" src="images/manage_05.gif" width="17" height="27" />
	<div class="left">
		<%
		if(num!=null){
		out.print("���ڣ�"+intmonth.toString()+"��");
		out.print(intday.toString()+"��"+"&nbsp;&nbsp;");
		out.print("��"+intweek+"��"+"&nbsp;&nbsp;");
		out.print(intweekday);
		%>
	</div>
	</td>
	
	<td align="right" valign="top" class="top1">   
	<a href="./"><img class="out" src="images/manage_10.gif" width="65" height="27" border="0" /></a>
	<img class="out" src="images/manage_09.gif" width="20" height="27" />
	<div class="right">
	<%
	out.print("������"+name.toString()+"&nbsp;&nbsp;");
	out.print("ID��"+num.toString()+"&nbsp;&nbsp;");
	out.print("���ţ�"+depart.toString()+"&nbsp;&nbsp;");
	}
	else {
	out.print("<script>alert('��ʱ');window.location.href='landing.jsp';</script>");
	}%>
	</div>
	</td>
  </tr>
  <tr>
    <td class="side" width="214" height="479">
	<%
	String address="";
	if(id.equals("0") && state.toString().equals("��ʦ")){ address="side_teacher.jsp"; }
	else if(id.equals("1") && state.toString().equals("����Ա")){ address="side_admin.jsp"; }
	else if(id.equals("2") && state.toString().equals("��������Ա")){ address="side_superadmin.jsp"; }
	else if(id.equals("3") && state.toString().equals("�ǽ�ѧ�����û�")){ address="side_teacher1.jsp"; }
	else out.print("<script>window.location.href='landing.jsp';</script>");
	%>
	<iframe src=<%=address%> width="214" height="479" frameborder="0" name="side_iframe"></iframe></td>
    <td width="786">
    <iframe src="news/news.jsp" width="786" height="479" frameborder="0" name="main_iframe"></iframe></td>
  </tr>
  <tr>
    <td height="31" colspan="2" class="bottom">Copyright &copy; 2010 - 2012 ��ɽѧԺ�ֽ���������з�����</td>
  </tr>
</table>
</body>
</html>
