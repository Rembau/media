<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>�����ý������</title>

</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
</script>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
Statement stmt2=conn.getStmt();
Statement stmt3=conn.getStmt();
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
%>
<%
String allstrjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
	  String allstrjieci1[]={"'��һ��%'","'�ڶ���%'","'������%'","'���Ľ�%'","'�����%'","'������%'","'���߽�%'","'�ڰ˽�%'","'�ھŽ�%'","'��ʮ��%'","'��ʮһ��%'","'��ʮ����%'"};

String week=null;
     week=request.getParameter("week");
	 if(week!=null){
	 week=new String(week.getBytes("ISO-8859-1"),"GB2312");}
	 else {week="0";}
	 
String weekday=null;
     weekday=request.getParameter("weekday");
	 if(weekday!=null){
	 weekday=new String(weekday.getBytes("ISO-8859-1"),"GB2312");}
	 else {weekday="0";}
	 
int intjieci=-1;	 
String jieci=null;
     jieci=request.getParameter("jieci");
	 if(jieci!=null){
	 jieci=new String(jieci.getBytes("ISO-8859-1"),"GB2312");
	 for(int intmarkjieci=0;intmarkjieci<12;intmarkjieci++)
	  {
	      if(allstrjieci1[intmarkjieci].equals(jieci)){intjieci=intmarkjieci;}
	  }
	 }
	 else {jieci="0";}
	 
String strintjieci=null;
     strintjieci=request.getParameter("intjieci");
	 if(strintjieci!=null && !strintjieci.equals("-1")){
	 strintjieci=new String(strintjieci.getBytes("ISO-8859-1"),"GB2312");
	 intjieci=Integer.parseInt(strintjieci);
	 jieci=allstrjieci1[intjieci];
	 //out.print("strintjieci"+strintjieci);
	 }
	 else {strintjieci="0";}
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="'����'";}
	 
String room=null;
     room=request.getParameter("room");
	 if(room!=null){
	 room=new String(room.getBytes("ISO-8859-1"),"GB2312");}
	 else {room="0";}
	 
String teacher=null;
     teacher=request.getParameter("teacher");
	 if(teacher!=null){
	 teacher=new String(teacher.getBytes("ISO-8859-1"),"GB2312");}
	 else {teacher="0";}
	 
String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else {mark="0";}
	 
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}

String floor1=null;
     floor1=request.getParameter("floor1");
	 if(floor1!=null){
	 floor1=new String(floor1.getBytes("ISO-8859-1"),"GB2312");}
	 else {floor1="0";}
		  
	  
String layer=null;
     layer=request.getParameter("layer");
	 if(layer!=null){
	 layer=new String(layer.getBytes("ISO-8859-1"),"GB2312");}
	 else {layer="0";}

String name1=null;
     name1=request.getParameter("name1");
	 if(name1!=null){
	 name1=new String(name1.getBytes("ISO-8859-1"),"GB2312");}
	 else {name1="0";}	

String num1=null;
     num1=request.getParameter("num1");
	 if(num1!=null){
	 num1=new String(num1.getBytes("ISO-8859-1"),"GB2312");}
	 else {num1="0";}	 
	 
String endweek=null;
     endweek=request.getParameter("endweek");
	 if(endweek!=null){
	 endweek=new String(endweek.getBytes("ISO-8859-1"),"GB2312");}
	 else {endweek="0";}
	 //out.print(endweek);
	 //out.print(jieci+" "+intjieci);
%>

<span class="current"><font color="#F00">��ǰλ��:</font>�鿴����</span>

<form action="?ok=0" method="get" name="form"><span class="bg">
  λ��:&nbsp;У��
    <select name="area" id="areaselectID" onChange="changeweek(this.id)">
      <option <%if(area.equals("'����'")){ out.print("selected");}%> value="'����'">����</option>
      <option <%if(area.equals("'����'")){ out.print("selected");}%> value="'����'">����</option>
      
    </select>
&nbsp;¥��
<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
  <%String sql2="select * from media_site where sit_area="+area+"";
ResultSet rs3=stmt2.executeQuery(sql2);
while(rs3.next()){
%>
  <option <%if(floor1.equals(rs3.getString(3))){ out.print("selected");}%> value=<%=rs3.getString(3)%>><%=rs3.getString(2)%></option>
  <%}%>
  <option <%if(floor1.equals("0")){ out.print("selected");}%> value="0">����</option>
  </select>
&nbsp;����
<select name="layer" id="layerselectID" onChange="changeweek(this.id)">
<option <%if(layer.equals("1")){ out.print("selected");}%> value="1">��һ��</option>
<option <%if(layer.equals("2")){ out.print("selected");}%> value="2">�ڶ���</option>
<option <%if(layer.equals("3")){ out.print("selected");}%> value="3">������</option>
<option <%if(layer.equals("4")){ out.print("selected");}%> value="4">���Ĳ�</option>
<option <%if(layer.equals("5")){ out.print("selected");}%> value="5">�����</option>
<option <%if(layer.equals("6")){ out.print("selected");}%> value="6">������</option>
<option <%if(layer.equals("0")){ out.print("selected");}%> value="0">����</option>
</select>
&nbsp;����
<select name="room" id="roomselectID" onChange="changeweek(this.id)">
  <%if(!floor1.equals("0")){
  if(layer.equals("0"))
 sql2="select * from media_rooms where ro_area="+area+" and ro_room like '"+floor1+"%'";
 else sql2="select * from media_rooms where ro_area="+area+" and ro_room like '"+floor1+""+layer+"%'";
rs3=stmt2.executeQuery(sql2);
while(rs3.next()){
%>
  <option <%if(room.equals(rs3.getString(2))){ out.print("selected");}%> value=<%=rs3.getString(2)%>><%=Integer.parseInt(rs3.getString(2))%1000%></option>
  <%}}%>
  <option <%if(room.equals("0")){ out.print("selected");}%> value="0">����</option>
  </select>
<br>
ʱ��:&nbsp;�ܴ�
    
  <select name="week" id="weekselectID" onChange="changeweek(this.id)">
  <% 
int allweek=24;
int i=1;
while(allweek>=i){String weeknum=String.valueOf(i);
if(week.equals(weeknum)){
out.println("<option value="+i+" selected>"+i+"</option>");}
else out.print("<option value="+i+">"+i+"</option>");
i++;
}
%>
  <option <%if(week.equals("0")){ out.print("selected");}%> value="0">����</option>
</select>
&nbsp;ʱ��
    <select name="weekday" id="weekdayselectID" onChange="changeweek(this.id)">
      <option <%if(weekday.equals("'����һ'")){ out.print("selected");}%> value="'����һ'">����һ</option>
      <option <%if(weekday.equals("'���ڶ�'")){ out.print("selected");}%> value="'���ڶ�'">���ڶ�</option>
      <option <%if(weekday.equals("'������'")){ out.print("selected");}%> value="'������'">������</option>
      <option <%if(weekday.equals("'������'")){ out.print("selected");}%> value="'������'">������</option>
      <option <%if(weekday.equals("'������'")){ out.print("selected");}%> value="'������'">������</option>
      <option <%if(weekday.equals("'������'")){ out.print("selected");}%> value="'������'">������</option>
      <option <%if(weekday.equals("'������'")){ out.print("selected");}%> value="'������'">������</option>
      <option <%if(weekday.equals("0")){ out.print("selected");}%> value="0">����</option>
    </select>
&nbsp;�ڴ�
<select name="intjieci" id="jieciselectID" onChange="changeweek(this.id)">
  <%int intjieci1=0;
while(intjieci1<9){%>
  <option <%if(jieci.equals(allstrjieci1[intjieci1])){ out.print("selected");}%> value="<%=intjieci1%>"><%=allstrjieci[intjieci1]%></option>
  <%intjieci1++;intjieci1++;
}%>
  <option <%if(jieci.equals("0")){ out.print("selected");}%> value="-1">����</option>
</select>
&nbsp;�����ܴ�
 <select name="endweek" id="endweekselectID" onChange="changeweek(this.id)">
  <% 
allweek=18;
i=Integer.parseInt(week)+1;
while(allweek>=i){String weeknum=String.valueOf(i);
if(endweek.equals(weeknum)){
out.println("<option value="+i+" selected>"+i+"</option>");}
else out.print("<option value="+i+">"+i+"</option>");
i++;
}
%>
  <option <%if(endweek.equals("0")){ out.print("selected");}%> value="0">����</option>
</select>(ѡ�˴������ѡ��ʱ��ͽڴ�)
<br>
��ʦ:
&nbsp;����<input type="text" name="name1" <%if(!name1.equals("0")){out.print("value="+name1);} %>>
&nbsp;����<input type="text" name="num1" <%if(!num1.equals("0")){out.print("value="+num1);} %>>
&nbsp;<input type="submit" value="ȷ��">
</span>
</form>
<script type="text/javascript">
var area=document.form.area.value;
var intjieci=document.form.intjieci.value;
if(intjieci=='0'){
intjieci="-1";
}
var week=document.form.week.value;
var weekday=document.form.weekday.value;
var floor1=document.form.floor1.value;
var room=document.form.room.value;
var layer=document.form.layer.value;
var endweek=document.form.endweek.value;
  function changeweek(x)
    {   
		var chose=document.getElementById(x).value;
		if(x=='weekselectID'){
		week=chose;
		}
		else if(x=='areaselectID'){
		area=chose;
		floor1="0";
		}
		else if(x=='weekdayselectID'){
		weekday=chose;
		}
		else if(x=='endweekselectID'){
		endweek=chose;
		weekday="0";
		intjieci="-1"
		}
		else if(x=='jieciselectID'){
		//if(chose=='0')
		//intjieci=-1;
		//else
		 intjieci=chose;
		}
		else if(x=='floor1selectID'){
		floor1=chose;
		}
		else if(x=='roomselectID'){
		room=chose;
		}
		else if(x=='layerselectID'){
		layer=chose;
		}
		
	window.location.href='guanlisq.jsp?area='+area+'&intjieci='+intjieci+'&week='+week+'&weekday='+weekday+'&floor1='+floor1+'&layer='+layer+'&room='+room+'&name1=<%=name1%>&num1=<%=num1%>';
		
 }
</script>
<% String sql;
String strsql="";
ResultSet rs1;
try{
if(mark.equals("1")){
sql="update media_application set ap_state='δͨ��' where ap_id='"+id+"'";
stmt.executeUpdate(sql);
//sql="";
sql="select * from media_application where ap_id='"+id+"'";
rs1=stmt.executeQuery(sql);
rs1.next();
String str=null;
		try {
			sql="select * from media_site where sit_nummark='"+Integer.parseInt(rs1.getString("ap_room"))/1000+"'";
			ResultSet rs2=stmt3.executeQuery(sql);
			rs2.next();
			str = "���������¼:<br>  ��"+rs1.getString("ap_week")+"��,"+rs1.getString("ap_weekday")+"" +
					","+rs1.getString("ap_jieci")+","+rs1.getString("ap_area")+","+rs2.getString("sit_name")+"," +
							""+Integer.parseInt(rs1.getString("ap_room"))%1000+"<br>������Աȡ��";
		//System.out.println(str);
		} catch (SQLException e) {
		out.print(sql);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql="insert into media_remind(re_num,re_name,re_content,re_admin) values('"+rs1.getString("ap_num")+"','"+rs1.getString("ap_name")+"','"+str+"','"+session.getAttribute("name")+"')";
		stmt3.executeUpdate(sql);
String tableid=rs1.getString(15);
sql="delete from media_table where ta_id='"+tableid+"'";

stmt.executeUpdate(sql);
//out.print(sql);

sql="select * from media_application where ap_id='"+id+"'";
rs1=stmt.executeQuery(sql);
rs1.next();
String strjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
int jiecistart=0;
for(int ii=0;ii<12;ii++)
{if(strjieci[ii].equals(rs1.getString(17))) {jiecistart=ii;break;}}
//out.print(strjieci[jiecistart]);

// out.print("si_area='"+rs1.getString(6)+"' and si_room='"+rs1.getString(5)+"' and si_week='"+rs1.getString(3)+"' and si_weekday='"+rs1.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')");
// out.print(rs1.getString(16));
if(rs1.getString(16).equals("2"))
sql="update media_situation set si_state ='����' where si_area='"+rs1.getString(6)+"' and si_room='"+rs1.getString(5)+"' and si_week='"+rs1.getString(3)+"' and si_weekday='"+rs1.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
if(rs1.getString(16).equals("3"))
sql="update media_situation set si_state ='����' where si_area='"+rs1.getString(6)+"' and si_room='"+rs1.getString(5)+"' and si_week='"+rs1.getString(3)+"' and si_weekday='"+rs1.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";

//out.print(sql);
stmt.executeUpdate(sql);
out.print("<script>alert('�����ɹ�');</script>");
}

else if(mark.equals("2")){

sql="delete from media_application where ap_id='"+id+"'";
stmt.executeUpdate(sql);
out.print("<script>alert('��ɾ��');</script>");
}}
   catch(SQLException e1)
{
 out.print("SQL�쳣");
}
%>
<% 
String strweek="";
String strweekday="";
String strarea="";
String strjieci="";
//out.print("jieci"+jieci);
//out.print("weekday"+weekday);
  if(!week.equals("0")){
  strweek="and ap_week="+week;
  if(!endweek.equals("0")){
  int intweek1;
  int intendweek;
  intweek1=Integer.parseInt(week);
  intendweek=Integer.parseInt(endweek);
  strweek="and ap_week between "+intweek1+" and "+intendweek;
   }
  }
  if(!weekday.equals("0")){ strweekday="and ap_weekday="+weekday; }
  
  if(!area.equals("0")){strarea="and ap_area="+area; }
  
  if(!jieci.equals("0")){ strjieci="and ap_jieci like "+jieci;}
 String strroom1="";
if(!floor1.equals("0") && layer.equals("0") && room.equals("0")){
      strroom1="and ap_room like '"+floor1+"%'";
    }
else if(!floor1.equals("0") && !layer.equals("0") && room.equals("0")) 
  strroom1="and ap_room like '"+floor1+""+layer+"%'";
 else if(!floor1.equals("0") &&  !room.equals("0"))
 strroom1="and ap_room like '"+room+"'";
 
 String strname="";
 String strnum="";
 if(!name1.equals("0") &&name1.length()!=0)
 strname="and ap_name like '"+name1+"%'";
 if(!num1.equals("0") &&num1.length()!=0)
 strnum="and ap_num like '"+num1+"%'";
  ResultSet rs;
try{
String sql1;

sql="select * from media_application where ap_state!='δ����' and ap_state!='�Ѵ���'";
//out.print(sql+" "+strnum+" "+strweekday+" "+strarea+" "+strjieci+" "+strroom1+" "+strname+" "+strweek);
rs=stmt.executeQuery(sql+" "+strweek+" "+strweekday+" "+strarea+" "+strjieci+" "+strroom1+" "+strname+" "+strnum);
strsql=sql+" "+strweek+" "+strweekday+" "+strarea+" "+strjieci+" "+strroom1+" "+strname+" "+strnum;
%>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="managerSq.jsp">�����¼</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="guanlisq1.jsp">�ǽ�ѧ����</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="../addapplication.jsp">��ʱ���</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="repeatsq.jsp">�鿴�ظ�����</a>
<table width="100%" border="1" style="empty-cells:show; border-collapse:collapse;">
	  <tr>
	  <th>���</th>
	  <th>λ��</th>
	  <th>����</th>
	  <th>�ܴ�</th>
	  <th>�ܼ�</th>
	  <th>�ڴ�</th>
	  <th>Ժϵ</th>
	  <th>��ʦ</th>
	  <th>����</th>
	  <th>ʱ��</th>
	  <th>״̬</th>
	  <th>����</th>
	  </tr>
	  <%int xuhao=1;
	  int pagenum = 12;
			int nowpage=1;
			String currentpagestr = null;
			int allpage=1;
			int all;
			request.setCharacterEncoding("gbk");
			currentpagestr = request.getParameter("page");
			if (currentpagestr != null)
				//nowpage = Integer.valueOf(currentpagestr); 
				nowpage=Integer.parseInt(currentpagestr);
				//if(nowpage==0)
			//out.print("<script>alert('���¼');window.location.href='landing.jsp';</script>");
			rs.last();
			all= rs.getRow();
			allpage=(all-1)/pagenum +1;
			rs.beforeFirst();
			int inum=(nowpage-1)*pagenum;
			int k=inum+1;
			while(inum>0){
			rs.next();
			inum--;}
	    
	  %>
	<%int j=0;
	//out.print(jieci);
	while(rs.next()&&j < pagenum){%><tr><td heigh='15'><%=k%></td><td><%=rs.getString(6)%>
	<td><%int introom=Integer.parseInt(rs.getString(5));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
%><%=floor2%>
<%=introom%1000%></td>
	 <td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(7)%></td>
	 
	 <td><%=rs.getString(9)%></td> <td>
	 <a href="?page=<%=nowpage%>&week=<%=week%>&weekday=<%=weekday%>&intjieci=<%=intjieci%>&area=<%=area%>&room=<%=room%>&floor1=<%=floor1%>&layer=<%=layer%>&teacher=<%=rs.getString(10)%>"><%=rs.getString(2)%></a></td><td><%=rs.getString(10)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(11)%></td><td><%if(!rs.getString(11).equals("δͨ��")){%>
	 <a href="?page=<%=nowpage%>&week=<%=week%>&weekday=<%=weekday%>&intjieci=<%=intjieci%>&area=<%=area%>&room=<%=room%>&floor1=<%=floor1%>&layer=<%=layer%>&endweek=<%=endweek%>&id=<%=rs.getString(1)%>&mark=1" onClick="return check('ȷ��')">ȡ��ͨ��������</a>&nbsp;&nbsp;<%}%>
	 </td></tr>
	 
	<%k++;
	j++;
	}%>
	<tr><td></td><td></td><td>��<%=nowpage%>ҳ </td><td></td>
	<td><%if(nowpage>1){%><a href="?page=<%=nowpage-1%>&week=<%=week%>&weekday=<%=weekday%>&intjieci=<%=intjieci%>&area=<%=area%>&room=<%=room%>&floor1=<%=floor1%>&layer=<%=layer%>&endweek=<%=endweek%>&name1=<%=name1 %>&num1=<%=num1 %>">��һҳ</a><%}%></td>
	<td><%if(nowpage<allpage){%><a href="?page=<%=nowpage+1%>&week=<%=week%>&weekday=<%=weekday%>&intjieci=<%=intjieci%>&area=<%=area%>&room=<%=room%>&floor1=<%=floor1%>&layer=<%=layer%>&endweek=<%=endweek%>&name1=<%=name1 %>&num1=<%=num1 %>">��һҳ</a><%}%></td>
	<td>��<%=allpage%>ҳ</td><td></td><td></td><td></td><td></td><td></td></tr>
</table>
<script language="javascript">
<!--
function Sure(){
//page==nowpage%>&week=<=week%>&weekday%=weekday%>&intjieci=<=intjieci%>&area=%=area%>&room=%=room%>
var page="<%=nowpage%>";
var week="<%=week%>";
var weekday="<%=weekday%>";
var intjieci="<%=intjieci%>";
var area="<%=area%>";
var room="<%=room%>";
var floor1="<%=floor1%>";
var layer="<%=layer%>";
var endweek="<%=endweek%>";

if(window.confirm('��ȷ����?')){
alert('ok');
}
else {
document.write(page+' '+week+' '+weekday+' '+intjieci+' '+area+' '+room+' '+floor1+' '+layer+' '+endweek);
window.location.href='guanlisq.jsp?page='+nowpage+'&week='+week+'&weekday='+weekday+'&intjieci='+intjieci+'&area='+area+'&room='+room+'&floor1='+floor1+'&layer='+layer+'&endweek='+endweek+'&mark=0';
}
}
-->
</script>
<%}
 catch(SQLException e){
   out.print("sql�쳣");
   }
   
 if(!teacher.equals("0")){
sql="select * from media_users where user_num='"+teacher+"'";
rs=stmt.executeQuery(sql);
rs.next();/*
out.print("����:"+rs.getString(4)+"<br>Ժϵ:"+rs.getString(5)+"<br>����"+rs.getString(2)+"<br>�绰"+rs.getString(7)+"<br>����"+rs.getString(8)+"<br>");*/
%>
<script type="text/javascript">
var vname="<%=rs.getString(4)%>";
var vdepart="<%=rs.getString(5)%>";
var vnum="<%=rs.getString(2)%>";
var vtelephone="<%=rs.getString(7)%>";
var vmail="<%=rs.getString(8)%>";
alert('����:'+vname+'\nԺϵ:'+vdepart+'\n����:'+vnum+'\n�绰:'+vtelephone+'\n����:'+vmail);
</script>

<%
}
%>
<div align="right"><a href=".Export?area=<%=area%>&intjieci=<%=intjieci%>&week=<%=week%>&weekday=<%=weekday%>&floor1=<%=floor1%>&layer=<%=layer%>&room=<%=room%>&endweek=<%=endweek%>">������¼</a></div>

</body>
</html>