<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>�α�1</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
</script>
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
Statement stmt2=conn.getStmt();
Object num=session.getAttribute("num");
Object intweek=session.getAttribute("intweek");

String sqid=null;
     sqid=request.getParameter("sqid");
	 if(sqid!=null){
	 sqid=new String(sqid.getBytes("ISO-8859-1"),"GB2312");}
	 else {sqid="0";}

String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
	 
String week=null;
     week=request.getParameter("week");
	 if(week!=null){
	 week=new String(week.getBytes("ISO-8859-1"),"GB2312");}
	 else {week="1";}
String weekday=null;
     weekday=request.getParameter("weekday");
	 if(weekday!=null){
	 weekday=new String(weekday.getBytes("ISO-8859-1"),"GB2312");}
	 else {weekday="0";}
	 
String jieci=null;
     jieci=request.getParameter("jieci");
	 if(jieci!=null){
	 jieci=new String(jieci.getBytes("ISO-8859-1"),"GB2312");}
	 else {jieci="0";}
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="0";}
	 
String room=null;
     room=request.getParameter("room");
	 if(room!=null){
	 room=new String(room.getBytes("ISO-8859-1"),"GB2312");}
	 else {room="0";}
	 
String alljie=null;
     alljie=request.getParameter("alljie");
	 if(alljie!=null){
	 alljie=new String(alljie.getBytes("ISO-8859-1"),"GB2312");}
	 else {alljie="0";}
	 
	 String sql;
	 ResultSet rs;
	 int jiecistart=0;
	 String strjieci1[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
for(int ii=0;ii<12;ii++)
 {if(strjieci1[ii].equals(jieci)) jiecistart=ii;}
 
	 if(!id.equals("0"))
	 {try{sql="delete from media_table where ta_id='"+id+"'";
	 stmt.executeUpdate(sql);
	 if(alljie.equals("2")){
   sql="update media_situation set si_state ='����' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci1[jiecistart]+"','"+strjieci1[jiecistart+1]+"')";
   //out.print(sql);
   stmt.executeUpdate(sql);}
   if(alljie.equals("3")){
   sql="update media_situation set si_state ='����' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci1[jiecistart]+"','"+strjieci1[jiecistart+1]+"','"+strjieci1[jiecistart+2]+"')";
   // out.print(sql);
   stmt.executeUpdate(sql);
  }
  sql="delete from media_application where ap_id='"+sqid+"'";
   //out.print(sql);
   stmt.executeUpdate(sql);
	 }
	    catch(SQLException e1)
{
 out.print("SQL�쳣");
}
	 }
%>
<script type="text/javascript">

  function changeweek(x)
    {   
		var chose=document.getElementById(x).value;	
		
		window.location.href='sqtable1.jsp?week='+chose;
		
 }
</script>
<table><tr><td><form method="post" action="?" name="">
��ѡ����:
<select name="week" id="weekselectID" onChange="changeweek(this.id)">
<% int allweek=24;
int ii=1;
while(allweek>=ii){String weeknum=String.valueOf(ii);
if(week.equals(weeknum)){
out.println("<option selected value="+ii+">"+ii+"</option>");}
else out.print("<option value="+ii+">"+ii+"</option>");
ii++;
}
%>
</select>
&nbsp;&nbsp;</form></td>
<td>
</td></tr></table>

<%
int row=0;
int col=1;
int col1=7;
String strrow[]={"��һ��","�ڶ���","������","���Ľ�"," ","�����","������","���߽�","�ڰ˽�"," ","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
String strcol[]={" ","����һ","���ڶ�","������","������","������","������","������"};
int intcol2[]={0,0,0,0,0,0,0,0};
int intcol3[]={0,0,0,0,0,0,0,0};

%>
��<%=week%>�ܿα�
<table width="100%" border="1">
<tr><%while(col1>=0) {out.print("<td>"+strcol[7-col1]+"</td>"); col1--;}%></tr>
<!--�� -->
<%while(row<14){
col1=col;
%><tr>
<td width="60"><%out.print(strrow[row]);%></td>
<!--�� -->
<%while(col1<8){ 
while((intcol2[col1]==1 || intcol3[col1]==1)&&col1!=7){
if(intcol2[col1]==1){intcol2[col1]=0;}
if(intcol3[col1]==1){intcol3[col1]=2;}col1++;}

if((intcol2[col1]==1 ||intcol3[col1]==1) && col1==7){
if(intcol2[col1]==1){intcol2[col1]=0;}
if(intcol3[col1]==1){intcol3[col1]=2;}break;}

for(int i=0;i<=7;i++)
{
if(intcol3[i]==2){intcol3[i]=0;intcol2[i]=1;}
}
try{
    sql="select * from media_table where ta_num='"+num.toString()+"' and ta_week='"+week+"' and ta_jiecistart='"+strrow[row]+"' and ta_weekday='"+strcol[col1]+"' order by ta_alljie desc";
//out.print(sql+"<br>");
rs=stmt.executeQuery(sql);
%>
<%
if(rs.next()){
String stralljie=rs.getString(6);
int introom=Integer.parseInt(rs.getString(8));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs1=stmt1.executeQuery(sql);
rs1.next();
String floor1=rs1.getString(2);
%>
<td height="40" width="140" rowspan="<%=stralljie%>">
<%=rs.getString(7)%><%=floor1%><%=introom%1000%>��<%=rs.getString(6)%>��
<a href=".CancelApplication?sqid=<%=rs.getString(10)%>&id=<%=rs.getString(1)%>&week=<%=week%>&weekday=<%=rs.getString(4)%>&area=<%=rs.getString(7)%>&jieci=<%=rs.getString(5)%>&alljie=<%=rs.getString(6)%>&room=<%=rs.getString(8)%>" onClick="return check('ȷ��ɾ��')">ɾ������</a><br>
<%while(rs.next()){
introom=Integer.parseInt(rs.getString(8));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
rs1=stmt2.executeQuery(sql);
rs1.next();
floor1=rs1.getString(2);%>
<%=rs.getString(7)%><%=floor1%><%=introom%1000%>��<%=rs.getString(6)%>��
<a href=".CancelApplication?sqid=<%=rs.getString(10)%>&id=<%=rs.getString(1)%>&week=<%=week%>&weekday=<%=rs.getString(4)%>&area=<%=rs.getString(7)%>&jieci=<%=rs.getString(5)%>&alljie=<%=rs.getString(6)%>&room=<%=rs.getString(8)%>" onClick="return check('ȷ��ɾ��')">ɾ������</a><br>
<%}%>
</td>
<%
if(stralljie.equals("2")){intcol2[col1]=1;}
if(stralljie.equals("3")){intcol3[col1]=1;}
}
else {%><td height="40" width="140"><%//out.print((row+1)+" "+col1);%>
&nbsp;</td>
<%}%>
<%}
catch(SQLException e1)
{
 out.print("SQL�쳣");
}
col1++;
}
%>
</tr>
<%
row++;
}
%>
</table>
</body>
</html>