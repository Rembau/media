<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html><head>
<title>��ʱ���</title>
</head>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");

%>
<%
String alljie=null;
     alljie=request.getParameter("alljie");
	 if(alljie!=null){
	 alljie=new String(alljie.getBytes("ISO-8859-1"),"GB2312");}
	 else {alljie="2";}
String week=null;
     week=request.getParameter("week");
	 if(week!=null){
	 week=new String(week.getBytes("ISO-8859-1"),"GB2312");}
	 else {week=String.valueOf(intweek.toString());}
	 
String weekday=null;
     weekday=request.getParameter("weekday");
	 if(weekday!=null && !weekday.equals("0")){
	 weekday=new String(weekday.getBytes("ISO-8859-1"),"GB2312");}
	 else {weekday=String.valueOf(intweekday.toString());}
	 
String jieci=null;
     jieci=request.getParameter("jieci");
	 if(jieci!=null){
	 jieci=new String(jieci.getBytes("ISO-8859-1"),"GB2312");}
	 else {jieci="��һ��";}
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="����";}
	 
String room=null;
     room=request.getParameter("room");
	 if(room!=null){
	 room=new String(room.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {room="0";}
	 
	 

   String ok=null;
     ok=request.getParameter("ok");
	 if(ok!=null){
	 ok=new String(ok.getBytes("ISO-8859-1"),"GB2312");}
	 else {ok="0";}
	 
String marksq=null;
     marksq=request.getParameter("marksq");
	 if(marksq!=null){
	 marksq=new String(marksq.getBytes("ISO-8859-1"),"GB2312");}
	 else {marksq="0";}
	 
String floor1=null;
     floor1=request.getParameter("floor1");
	 if(floor1!=null){
	 floor1=new String(floor1.getBytes("ISO-8859-1"),"GB2312");}
	 else {floor1="17";}
	 if(floor1.equals("����")) floor1="0";
	 	 
	 //out.print(area+" "+jieci+" "+week+" "+weekday+" "+floor1);
	  String strjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
   %>
<span class="current"><font color="#F00">��ǰλ��:</font>��ʱ���(�������Ͽ�ǰһ�����Ͼŵ�ǰ���ѡ��)</span>
<form action="?ok=0" method="get" name="form">
<span class="current">λ��:&nbsp;&nbsp;
У��
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option>
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option></select>
&nbsp;¥��<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
<%String sql1="select * from media_site where sit_area='"+area+"'";
ResultSet rs1=stmt.executeQuery(sql1);

while(rs1.next()){
%>
<option <%if(floor1.equals(rs1.getString(3))){ out.print("selected");}%> value=<%=rs1.getString(3)%>><%=rs1.getString(2)%></option>
<%}%>
</select>
<br>
ʱ��:&nbsp;&nbsp;
�ܴ�
<select name="week" id="weekselectID" onChange="changeweek(this.id)">
<% int allweek=18;
int i=Integer.parseInt(intweek.toString());
while(allweek>=i){String weeknum=String.valueOf(i);
if(week.equals(weeknum)){
out.println("<option selected value="+i+">"+i+"</option>");}
else out.print("<option value="+i+">"+i+"</option>");
i++;
}
%></select>
ʱ��
<select name="weekday" id="weekdayselectID" onChange="changeweek(this.id)">
<option <%if(weekday.equals("����һ")){ out.print("selected");}%> value="����һ">����һ</option>
<option <%if(weekday.equals("���ڶ�")){ out.print("selected");}%> value="���ڶ�">���ڶ�</option>
<option <%if(weekday.equals("������")){ out.print("selected");}%> value="������">������</option>
<option <%if(weekday.equals("������")){ out.print("selected");}%> value="������">������</option>
<option <%if(weekday.equals("������")){ out.print("selected");}%> value="������">������</option>
<option <%if(weekday.equals("������")){ out.print("selected");}%> value="������">������</option>
<option <%if(weekday.equals("������")){ out.print("selected");}%> value="������">������</option></select>
��ʼ�ڴ�
<select name="jieci" id="jieciselectID" onChange="changeweek(this.id)">
<%int intjieci=0;
while(intjieci<10){%>
<option <%if(jieci.equals(strjieci[intjieci])){ out.print("selected");}%> value=<%=strjieci[intjieci]%>><%=strjieci[intjieci]%></option>
<%intjieci++;intjieci++;
}%>
</select>
ѡ���ϼ��ڿ�
<select name="alljie" id="alljie" onChange="changeweek(this.id)">
<option <%if(alljie.equals("2")){ out.print("selected");}%> value="2">2</option>
<option <%if(alljie.equals("3")){ out.print("selected");}%> value="3">3</option>
</select></span>
</form>
��ǰѡ��:<strong>��������</strong>
<script type="text/javascript">
var area=document.form.area.value;
var jieci=document.form.jieci.value;
var week=document.form.week.value;
var weekday=document.form.weekday.value;
var alljie=document.form.alljie.value;
var floor1=document.form.floor1.value;
  function changeweek(x)
    {   
		var chose=document.getElementById(x).value;
		if(x=='weekselectID'){
		week=chose;
		}
		else if(x=='areaselectID'){
		area=chose;
		if(area=='����') floor1="17";
		else floor1="19";
		}
		else if(x=='weekdayselectID'){
		weekday=chose;
		}
		else if(x=='jieciselectID'){
		jieci=chose;
		}
		else if(x=='floor1selectID'){
		floor1=chose;
		}
		else {alljie=chose;}
		
		if(document.form.jieci.value=='������' && document.form.alljie.value=='3')
	{alert("�ڴ��������");
	window.location.reload();
		return false;
		}
	
	else if(document.form.jieci.value=='���߽�' && document.form.alljie.value=='3' )
	{alert("�ڴ��������");
     window.location.reload();
		return false;
		}
      window.location.href='addapplication.jsp?area='+area+'&jieci='+jieci+'&week='+week+'&weekday='+weekday+'&alljie='+alljie+'&floor1='+floor1+'';
		
 }
 
 </script>
  <%if((jieci.equals("��ʮ����") && alljie.equals("2")) ||(jieci.equals("��ʮһ��") || jieci.equals("��ʮ����"))&& alljie.equals("3"))
	 {
	 out.print("���������<br>");
	 jieci="��һ��";
	 }%>

  <%
 
   int cols=7;
   int allnum=0; 
   int rows=0;
   ResultSet rs;
 //  try{
 int jiecistart=0;
 int ii;
for(ii=0;ii<12;ii++)
{if(strjieci[ii].equals(jieci)) {jiecistart=ii;}}
//out.print(jieci+" "+jiecistart+" "+alljie);
String alljieci=null;
String sql=null;
String strroom1="";
String strfloor="";
if(!floor1.equals("0")){
      strroom1="and si_room like '"+floor1+"%'";
    }
try{
if(alljie.equals("2")){ 
  sql="select * from media_situation where si_area='"+area+"'  and si_week='"+week+"'and si_weekday='"+weekday+"'and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"') "+strroom1; }// si_state='����' and and si_state='ռ��'
  else  if(alljie.equals("3")) {sql="select * from media_situation where si_area='"+area+"' and si_week='"+week+"'and si_weekday='"+weekday+"'and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"') "+strroom1;}
 //out.print(sql);
   rs=stmt.executeQuery(sql);
   String allroom[]=new String[100];
   //while()
//���� ����
   int intalljie=Integer.parseInt(alljie);
   rs.last();
	allnum= rs.getRow();
    rows=allnum/(cols*intalljie)+1;
	//out.print(rows);
   rs.beforeFirst();
//   
//   }
//   catch(SQLException e1)
//{
// out.print("SQL�쳣");
//}

%>
  

<table width="100%" border="1">
<%
int remember=cols;
int markroom=1;
int intmarkroom=0;
while(rows>0){  out.print("<tr>"); 
 cols=remember;
   while(cols>0){   
   markroom=1;
   if(intalljie==3){markroom=0;}
   intmarkroom=0;
   while(markroom<=2 && rs.next())
   //if(rs.next())
   {
  if(intmarkroom==0){ int introom=Integer.parseInt(rs.getString(3));
   sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
  out.print("<td heigh='20'>");out.print("<a href='?week="+week+"&area="+area+"&weekday="+weekday+"&jieci="+strjieci[jiecistart]+"&ok="+rs.getString(3)+"&alljie="+alljie+"&floor1="+floor1+"'>����&nbsp;"+area+""+floor2+""+introom%1000+"</a><br>Ŀǰ״̬:");
   
  if(rs.getString(4).equals("����")){out.print("<font color=red>");
 
out.print("����");out.print("</font>");}

else {
out.print("����");}
}
  out.print("<br>"+rs.getString(8)+":");if(rs.getString(5).equals("ռ��")){out.print("<font color=red>"+rs.getString(5)+"</font>");} else out.print(rs.getString(5));
  if(markroom==2) {out.print("</td>");}
  markroom++;
  intmarkroom++;
   }
    
	cols--;
	}
out.print("</tr>");
rows--;}
%>
<%}
  catch(SQLException e1)
{
 out.print("SQL�쳣");
}
%>
</table>
<%if(!ok.equals("0")){
int introom=Integer.parseInt(ok);
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
%>

<p>��ѡ����:<%=area%>&nbsp;&nbsp;<%=floor2%>
<%=introom%1000%>

��<%=week%>��&nbsp;&nbsp;<%=weekday%>&nbsp;&nbsp;&nbsp;<%=jieci%>��,ʱ���&nbsp;&nbsp;
<script type="text/javascript">
function check()
{
	if(document.form2.usernum.value=='' || document.form2.username.value=='')
	{
		alert("��ʦ��Ϣ����д����");
				return false;
		}
	}
</script>
<form action='servlet.Addapplication?week=<%=week%>&area=<%=area%>&weekday=<%=weekday%>&jieci=<%=jieci%>&room=<%=ok%>&alljie=<%=alljie%>' method="post" name="form2">
�����˹���<input type="text" name="usernum" /><br>
����������<input type="text" name="username" /><br>
������Ժϵ<select name="userdepart"> 
<option >��Ϣ����ѧԺ</option>
<option >����ѧԺ</option>
<option >��ѧԺ</option>
<option >����Ժ</option>
<option >��ѧϵ</option>
<option >����ϵ</option>
<option >����ѧԺ</option>
<option >����ϵ</option>
<option >���ϵ</option>
<option>����ϵ</option>
<option>��ѧϵ</option>
<option >����ϵ</option>
<option >����ѧԺ</option>
<option>�ֽ�����</option>
<option>�칫��</option>
<option >������</option>
<option >��ί������</option>
<option >���ʴ�</option>
<option >���ڷ�����</option>
<option >��ѧ�о���</option>
<option>��ί(�����)</option>
<option >����</option>
<option>���´�</option>
<option >ͼ���</option>
<option >У����</option>
<option >У��ί</option>
<option >УҽԺ</option>
<option >ѧ����</option>
<option>����</option>
<option>У�쵼</option>
<option>���д�</option>
</select><br>

<input type="hidden" name="note" value="��">
ȷ������?
<input type="submit" value="ȷ��" onClick="return check()">
</form>
<%}%>

</body>
</html>