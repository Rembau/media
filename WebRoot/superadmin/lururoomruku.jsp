<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.util.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>录入教室</title>
</head>
<body>
<%
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="0";}
	 
String allroom=null;
     allroom=request.getParameter("allroom");
	 if(allroom!=null){
	 allroom=new String(allroom.getBytes("ISO-8859-1"),"GB2312");}
	 else {allroom="0";}
	 
String layer=null;
     layer=request.getParameter("layer");
	 if(layer!=null){
	 layer=new String(layer.getBytes("ISO-8859-1"),"GB2312");}
	 else {layer="0";}

	 
StringTokenizer fen=new StringTokenizer(allroom,", "); 
String room[]=new String[100];
int introomnum=0;
String sql;
ResultSet rs;
String strroom;
try{sql="select * from media_site where sit_area='"+area+"' and sit_name='"+layer+"'";
//out.print(sql+"<br>");
rs=conn.stmt.executeQuery(sql);
String nummark;
rs.next();
nummark=rs.getString(3);
out.print("录入过程可能有点慢,请等待.....<br>");
while(fen.hasMoreTokens() )
{
  strroom=fen.nextToken();
  strroom=nummark+""+strroom;
  //out.print(strroom);
  sql="select * from media_rooms where ro_room='"+strroom+"' and ro_area='"+area+"'";//out.print(sql+"<br>");
  rs=conn.stmt.executeQuery(sql);
  if(!rs.next()){
  room[introomnum]=strroom;
  out.print("您录入了");
  out.print(room[introomnum]+",");
  out.print("教室<br>");
  sql="insert into media_rooms(ro_room,ro_area) values('"+room[introomnum]+"','"+area+"')";//out.print(sql+"<br>");
  conn.stmt.executeUpdate(sql);
introomnum++;
}
else {out.print(strroom+"教室已存在<br>");}
}
	 
%>
<%


		String[]week={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"};
		String weekday[]={"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
		String jieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节"};
		
//		String room1[]={"1101","1102","1103","1104","1105"};//南区教室
//		String room2[]={"1101","1102","1103","1104","1105","1201"};//北区教室
		int count=0;
		for(int i=0;i<18;i++)//南区
			for(int j=0;j<7;j++)
			for(int l=0;l<introomnum;l++)
			for(int m=0;m<11;m++){
			sql="insert into media_situation(si_area,si_room,si_week,si_weekday,si_jieci) value('"+area+"','"+room[l]+"','"+week[i]+"','"+weekday[j]+"','"+jieci[m]+"')";//out.print(sql+"<br>");
					conn.stmt.executeUpdate(sql);
					count++;
		}
		out.print("<script>alert('录入成功');window.location.href='#';</script>");
}
catch(SQLException e){
	   out.println("sql异常");
}
%>
<a href="lururoom.jsp">返回</a>
</body>
</html>
