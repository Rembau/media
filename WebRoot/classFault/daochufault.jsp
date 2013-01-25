<%@ page contentType="text/html;charset=GB2312" language="java" import="java.sql.*,java.io.*,jxl.*,jxl.write.*,jxl.write.biff.RowsExceededException"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<title>daochu</title>
</head>
<body> 
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
String faultdepart=null;
     faultdepart=request.getParameter("faultdepart");
	 if(faultdepart!=null){
	 faultdepart=new String(faultdepart.getBytes("ISO-8859-1"),"GB2312");}
	 else {faultdepart="0";}
	 
String room=null;
     room=request.getParameter("room");
	 if(room!=null){
	 room=new String(room.getBytes("ISO-8859-1"),"GB2312");}
	 else {room="0";}
	 if(room.length()==0) room="0";
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="南区";}

String floor1=null;
     floor1=request.getParameter("floor1");
	 if(floor1!=null){
	 floor1=new String(floor1.getBytes("ISO-8859-1"),"GB2312");}
	 else {floor1="0";}
	 	 
String daochu=null;
     daochu=request.getParameter("daochu");
	 if(daochu!=null){
	 daochu=new String(daochu.getBytes("ISO-8859-1"),"GB2312");}
	 else {daochu="0";}
		 
	 %>
	 
	 <span class="bg">
<form action="?" method="post" name="fault">
    位置:
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("南区")){ out.print("selected");}%> value="南区">南区</option>
<option <%if(area.equals("北区")){ out.print("selected");}%> value="北区">北区</option></select>
&nbsp;楼号<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
<%String sql="select * from media_site where sit_area='"+area+"'";
ResultSet rs1=stmt.executeQuery(sql);
while(rs1.next()){
%>
<option <%if(floor1.equals(rs1.getString(3))){ out.print("selected");}%> value=<%=rs1.getString(3)%>><%=rs1.getString(2)%></option>
<%}%>
<option <%if(floor1.equals("0")){ out.print("selected");}%> value="0">不限</option></select>
故障关键字<select id="faultdepartselectID" name="faultdepart" onChange="changeweek(this.id)">
	<%sql="select * from media_mediadepart";
	ResultSet rs=stmt1.executeQuery(sql);
	while(rs.next()){%>
	<option <%if(faultdepart.equals(rs.getString(2))){ out.print("selected");}%>  value=<%=rs.getString(2)%>><%=rs.getString(2)%></option>
	<%}%>
	<option <%if(faultdepart.equals("0")){ out.print("selected");}%> value="0">不限</option></select>

	教室<input type="text" name="room" />
	<input type="submit" value="确定">
	</form>
<script type="text/javascript">
<!--
var floor1=document.fault.floor1.value;
var area=document.fault.area.value;
var faultdepart=document.fault.faultdepart.value;
 function changeweek(x)
    {   
		var chose=document.getElementById(x).value;
		if(x=='areaselectID')
		area=chose;
		else if(x=='faultdepartselectID')
		faultdepart=chose;
		else floor1=chose;
      window.location.href='daochufault.jsp?area='+area+'&floor1='+floor1+'&faultdepart='+faultdepart+'';
		
 }
 -->
 </script>
 
	 <%
	 
	 String strroom="";
String strfaultdepart="";
String strarea="";
String strfloor1="";
if(!area.equals("0"))
strarea="and fa_area = '"+area+"'";
if(!faultdepart.equals("0"))
strfaultdepart="and fa_faultdepart = '"+faultdepart+"'";
if(!floor1.equals("0")){
strroom="and fa_room like '"+floor1+"%'";
if(!room.equals("0"))
strroom="and fa_room like '"+floor1+""+room+"%'";
}
try{sql="select * from media_fault where fa_state!='未处理'" +strarea+" "+strfaultdepart+" "+strroom;
 //out.print(sql);
 rs=stmt.executeQuery(sql);
	 %>
	  <table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
      <th>序号</th>
	  <th>位置</th>
	  <th>教室</th>
	  <th>申报教师</th>
	  <th>申报时间</th>
	  <th>申报主题</th>
	  <th>状态</th>
	  <th>损坏部位</th>
	  <th>查看详情</th>
	  </tr>
	  <%int xuhao=1;
	  int pagenum = 9;
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
			//out.print("<script>alert('请登录');window.location.href='landing.jsp';</script>");
			rs.last();
			all= rs.getRow();
			allpage=(all-1)/pagenum +1;
			rs.beforeFirst();
			int i=(nowpage-1)*pagenum;
			int k=i+1;
			while(i>0){
			rs.next();
			i--;}
	    
	  %>
	<%int j=0;
	while(rs.next()&&j < pagenum){%>
	<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	 <td><%=k%></td>
	 <td><%=rs.getString(2)%></td>
	 <td><%int introom=Integer.parseInt(rs.getString(3));
String sqll="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sqll);
rs2.next();
String floor2=rs2.getString(2);
%><%=floor2%>
<%=introom%1000%></td>
	 <td><%=rs.getString(6)%></td>
	 <td><%=rs.getString(7)%></td>
	 <td><%=rs.getString(9)%></td>
	 <td><%=rs.getString(4)%></td>
	 <td><%=rs.getString(14)%></td>
	 <td><a href="fault.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>&markpage=0">点击查看详细内容</a></td> 
	 </tr>
	 
	<%k++;
	j++;
	}%>
	</table>
    <center>
      <table width="400" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" align="center">第<%=nowpage%>页 </td>
          <td width="100" align="center"><%if(nowpage>1){%>
            <a href="?page=<%=nowpage-1%>">上一页</a>
          <%}%></td>
          <td width="100" align="center"><%if(nowpage<allpage){%>
            <a href="?page=<%=nowpage+1%>">下一页</a>
          <%}%></td>
          <td width="100" align="center">共<%=allpage%>页</td><td></td><td></td>
        </tr>
      </table>
	  <%
	 }
	 catch(SQLException e1)
{
 out.print("SQL异常");
}

if(daochu.equals("1")){
daochu="0";
String name="faultbiao";
int inti=1;
		try
		{	 
 strroom="";
 strfaultdepart="";
strarea="";
 strfloor1="";
if(!area.equals("0"))
strarea="and fa_area = '"+area+"'";
if(!faultdepart.equals("0"))
strfaultdepart="and fa_faultdepart = '"+faultdepart+"'";
if(!floor1.equals("0")){
strroom="and fa_room like '"+floor1+"%'";
if(!room.equals("0"))
strroom="and fa_room like '"+floor1+""+room+"%'";
}
sql="select * from media_fault where fa_state!='未处理'" +strarea+" "+strfaultdepart+" "+strroom;
 //out.print(sql);
 rs=stmt.executeQuery(sql);
			//.print(sql);
			
			File file=new File(this.getServletContext().getRealPath("/")+"/classfault/upload/"+name+".xls");
			System.out.println(file.getAbsolutePath());
			WritableWorkbook book = Workbook.createWorkbook(file);//所建立的表名和存储路径
			WritableSheet sheet = book.createSheet("申请", 0);                       //表的标签名  
			Label label = new Label(0, 0, "序号");
	        sheet.addCell(label);
	        Label label2 = new Label(1, 0, "申报教师");   
	        sheet.addCell(label2);
	        Label label3 = new Label(2, 0, "校区");   
	        sheet.addCell(label3);        
            Label label4 = new Label(3, 0, "教室");   
	        sheet.addCell(label4);
			Label label5 = new Label(4, 0, "时间");   
	        sheet.addCell(label5);
			Label label6 = new Label(5, 0, "故障描述");   
	        sheet.addCell(label6);
			Label label7 = new Label(6, 0, "设备");   
	        sheet.addCell(label7);
			Label label8 = new Label(7, 0, "解决办法");   
	        sheet.addCell(label8);
			Label label9 = new Label(8, 0, "状态");   
	        sheet.addCell(label9);
			String stri;
			while(rs.next())
			{   stri=String.valueOf(inti);
				Label h = new Label(0, inti, stri);
				sheet.addCell(h);   
		        Label ii = new Label(1, inti,rs.getString(6));   
		        sheet.addCell(ii); 
		        Label gg = new Label(2, inti, rs.getString(2));   
		        sheet.addCell(gg);  
					int introom=Integer.parseInt(rs.getString(3));
String sqll="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sqll);
rs2.next();
String floor2=rs2.getString(2);	
		        Label kk = new Label(3, inti, floor2+" "+introom%1000);   
		        sheet.addCell(kk);
				Label l = new Label(4,inti, rs.getString(7));   
		        sheet.addCell(l);  
		        Label m = new Label(5, inti, "教师:"+rs.getString(5)+"    管理员:"+rs.getString(13));   
		        sheet.addCell(m); 
				Label n = new Label(6, inti, rs.getString(14));   
		        sheet.addCell(n); 
				Label o = new Label(7, inti, rs.getString(10));   
		        sheet.addCell(o); 
				Label p = new Label(8, inti, rs.getString(4));   
		        sheet.addCell(p); 
		        inti++;
			
			//out.println(inti);
			}
			 
			book.write();     
	        book.close();  
			out.println("导出成功！");
		}
		catch(SQLException e)
		{
		out.println(e);
		}
		
response.sendRedirect("upload/"+name+".xls");
}
%>
<div align="right"><a href="?daochu=1&area=<%=area%>&floor1=<%=floor1%>&faultdepart=<%=faultdepart%>">导出记录</a></div>
</body>
</html>