<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html><head>
<title>临时添加</title>
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
	 else {jieci="第一节";}
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="南区";}
	 
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
	 if(floor1.equals("不限")) floor1="0";
	 	 
	 //out.print(area+" "+jieci+" "+week+" "+weekday+" "+floor1);
	  String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
   %>
<span class="current"><font color="#F00">当前位置:</font>临时添加(必须在上课前一天晚上九点前完成选课)</span>
<form action="?ok=0" method="get" name="form">
<span class="current">位置:&nbsp;&nbsp;
校区
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("南区")){ out.print("selected");}%> value="南区">南区</option>
<option <%if(area.equals("北区")){ out.print("selected");}%> value="北区">北区</option></select>
&nbsp;楼号<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
<%String sql1="select * from media_site where sit_area='"+area+"'";
ResultSet rs1=stmt.executeQuery(sql1);

while(rs1.next()){
%>
<option <%if(floor1.equals(rs1.getString(3))){ out.print("selected");}%> value=<%=rs1.getString(3)%>><%=rs1.getString(2)%></option>
<%}%>
</select>
<br>
时间:&nbsp;&nbsp;
周次
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
时间
<select name="weekday" id="weekdayselectID" onChange="changeweek(this.id)">
<option <%if(weekday.equals("星期一")){ out.print("selected");}%> value="星期一">星期一</option>
<option <%if(weekday.equals("星期二")){ out.print("selected");}%> value="星期二">星期二</option>
<option <%if(weekday.equals("星期三")){ out.print("selected");}%> value="星期三">星期三</option>
<option <%if(weekday.equals("星期四")){ out.print("selected");}%> value="星期四">星期四</option>
<option <%if(weekday.equals("星期五")){ out.print("selected");}%> value="星期五">星期五</option>
<option <%if(weekday.equals("星期六")){ out.print("selected");}%> value="星期六">星期六</option>
<option <%if(weekday.equals("星期天")){ out.print("selected");}%> value="星期天">星期天</option></select>
开始节次
<select name="jieci" id="jieciselectID" onChange="changeweek(this.id)">
<%int intjieci=0;
while(intjieci<10){%>
<option <%if(jieci.equals(strjieci[intjieci])){ out.print("selected");}%> value=<%=strjieci[intjieci]%>><%=strjieci[intjieci]%></option>
<%intjieci++;intjieci++;
}%>
</select>
选择上几节课
<select name="alljie" id="alljie" onChange="changeweek(this.id)">
<option <%if(alljie.equals("2")){ out.print("selected");}%> value="2">2</option>
<option <%if(alljie.equals("3")){ out.print("selected");}%> value="3">3</option>
</select></span>
</form>
当前选择:<strong>正常申请</strong>
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
		if(area=='南区') floor1="17";
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
		
		if(document.form.jieci.value=='第三节' && document.form.alljie.value=='3')
	{alert("节次输入错误");
	window.location.reload();
		return false;
		}
	
	else if(document.form.jieci.value=='第七节' && document.form.alljie.value=='3' )
	{alert("节次输入错误");
     window.location.reload();
		return false;
		}
      window.location.href='addapplication.jsp?area='+area+'&jieci='+jieci+'&week='+week+'&weekday='+weekday+'&alljie='+alljie+'&floor1='+floor1+'';
		
 }
 
 </script>
  <%if((jieci.equals("第十二节") && alljie.equals("2")) ||(jieci.equals("第十一节") || jieci.equals("第十二节"))&& alljie.equals("3"))
	 {
	 out.print("周输入错误<br>");
	 jieci="第一节";
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
  sql="select * from media_situation where si_area='"+area+"'  and si_week='"+week+"'and si_weekday='"+weekday+"'and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"') "+strroom1; }// si_state='正常' and and si_state='占用'
  else  if(alljie.equals("3")) {sql="select * from media_situation where si_area='"+area+"' and si_week='"+week+"'and si_weekday='"+weekday+"'and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"') "+strroom1;}
 //out.print(sql);
   rs=stmt.executeQuery(sql);
   String allroom[]=new String[100];
   //while()
//计算 行数
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
// out.print("SQL异常");
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
  out.print("<td heigh='20'>");out.print("<a href='?week="+week+"&area="+area+"&weekday="+weekday+"&jieci="+strjieci[jiecistart]+"&ok="+rs.getString(3)+"&alljie="+alljie+"&floor1="+floor1+"'>申请&nbsp;"+area+""+floor2+""+introom%1000+"</a><br>目前状态:");
   
  if(rs.getString(4).equals("故障")){out.print("<font color=red>");
 
out.print("故障");out.print("</font>");}

else {
out.print("正常");}
}
  out.print("<br>"+rs.getString(8)+":");if(rs.getString(5).equals("占用")){out.print("<font color=red>"+rs.getString(5)+"</font>");} else out.print(rs.getString(5));
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
 out.print("SQL异常");
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

<p>您选择了:<%=area%>&nbsp;&nbsp;<%=floor2%>
<%=introom%1000%>

第<%=week%>周&nbsp;&nbsp;<%=weekday%>&nbsp;&nbsp;&nbsp;<%=jieci%>等,时间段&nbsp;&nbsp;
<script type="text/javascript">
function check()
{
	if(document.form2.usernum.value=='' || document.form2.username.value=='')
	{
		alert("教师信息请填写完整");
				return false;
		}
	}
</script>
<form action='servlet.Addapplication?week=<%=week%>&area=<%=area%>&weekday=<%=weekday%>&jieci=<%=jieci%>&room=<%=ok%>&alljie=<%=alljie%>' method="post" name="form2">
申请人工号<input type="text" name="usernum" /><br>
申请人姓名<input type="text" name="username" /><br>
申请人院系<select name="userdepart"> 
<option >信息工程学院</option>
<option >旅游学院</option>
<option >文学院</option>
<option >经管院</option>
<option >数学系</option>
<option >外语系</option>
<option >艺术学院</option>
<option >体育系</option>
<option >社科系</option>
<option>建筑系</option>
<option>化学系</option>
<option >教育系</option>
<option >生环学院</option>
<option>现教中心</option>
<option>办公室</option>
<option >保卫处</option>
<option >党委宣传部</option>
<option >国资处</option>
<option >后勤服务集团</option>
<option >徽学研究所</option>
<option>纪委(监察室)</option>
<option >教务处</option>
<option>人事处</option>
<option >图书馆</option>
<option >校工会</option>
<option >校团委</option>
<option >校医院</option>
<option >学生处</option>
<option>总务处</option>
<option>校领导</option>
<option>科研处</option>
</select><br>

<input type="hidden" name="note" value="无">
确定申请?
<input type="submit" value="确定" onClick="return check()">
</form>
<%}%>

</body>
</html>