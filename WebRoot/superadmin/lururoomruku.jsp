<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.util.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>¼�����</title>
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
out.print("¼����̿����е���,��ȴ�.....<br>");
while(fen.hasMoreTokens() )
{
  strroom=fen.nextToken();
  strroom=nummark+""+strroom;
  //out.print(strroom);
  sql="select * from media_rooms where ro_room='"+strroom+"' and ro_area='"+area+"'";//out.print(sql+"<br>");
  rs=conn.stmt.executeQuery(sql);
  if(!rs.next()){
  room[introomnum]=strroom;
  out.print("��¼����");
  out.print(room[introomnum]+",");
  out.print("����<br>");
  sql="insert into media_rooms(ro_room,ro_area) values('"+room[introomnum]+"','"+area+"')";//out.print(sql+"<br>");
  conn.stmt.executeUpdate(sql);
introomnum++;
}
else {out.print(strroom+"�����Ѵ���<br>");}
}
	 
%>
<%


		String[]week={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"};
		String weekday[]={"����һ","���ڶ�","������","������","������","������","������"};
		String jieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��"};
		
//		String room1[]={"1101","1102","1103","1104","1105"};//��������
//		String room2[]={"1101","1102","1103","1104","1105","1201"};//��������
		int count=0;
		for(int i=0;i<18;i++)//����
			for(int j=0;j<7;j++)
			for(int l=0;l<introomnum;l++)
			for(int m=0;m<11;m++){
			sql="insert into media_situation(si_area,si_room,si_week,si_weekday,si_jieci) value('"+area+"','"+room[l]+"','"+week[i]+"','"+weekday[j]+"','"+jieci[m]+"')";//out.print(sql+"<br>");
					conn.stmt.executeUpdate(sql);
					count++;
		}
		out.print("<script>alert('¼��ɹ�');window.location.href='#';</script>");
}
catch(SQLException e){
	   out.println("sql�쳣");
}
%>
<a href="lururoom.jsp">����</a>
</body>
</html>
