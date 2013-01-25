<%@ page contentType="text/html;charset=GB2312" language="java" import="java.sql.*,java.io.*,jxl.*,jxl.write.*,jxl.write.biff.RowsExceededException"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>daochu</title>
</head>
<body> 
<%

	  String username=null;
     username=request.getParameter("username");
	 if(username!=null && username.length()!=0){
	 username=new String(username.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {username="0";}
	 
 String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null && usernum.length()!=0){
	 usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	}
	 else {usernum="0";}	
	 
	 String strusernum="";
String strusername="";
out.print(usernum+" "+username);
if(!username.equals("0") && username.length()!=0)
strusername="and re_name like '"+username+"%'";
if(!usernum.equals("0") && usernum.length()!=0)
strusernum="and re_num like '"+usernum+"%'";
String sql="select * from media_remind where 1=1  "+strusernum+" "+strusername;
 
	 out.print(sql);
String name="remindbiao";
int i=1;
		try
		{ 
			ResultSet rs=conn.stmt.executeQuery(sql);
			WritableWorkbook book = Workbook.createWorkbook(new File
(this.getServletContext().getRealPath("/")+"/superadmin/upload/"+name+".xls"));//所建立的表名和存储路径
			WritableSheet sheet = book.createSheet("申请", 0);                       //表的标签名  
			Label label = new Label(0, 0, "序号");
	        sheet.addCell(label);
	        Label label2 = new Label(1, 0, "教师姓名");   
	        sheet.addCell(label2);
	        Label label3 = new Label(2, 0, "工号");   
	        sheet.addCell(label3);
	        Label label4 = new Label(3, 0, "时间");   
	        sheet.addCell(label4);
			Label label5 = new Label(4, 0, "内容");   
	        sheet.addCell(label5);
			Label label6 = new Label(5, 0, "状态");   
	        sheet.addCell(label6);
			String stri;
			while(rs.next())
			{   stri=String.valueOf(i);
				Label h = new Label(0, i, stri);
				sheet.addCell(h);   
		        Label ii = new Label(1, i,rs.getString(3));   
		        sheet.addCell(ii); 
		        Label gg = new Label(2, i, rs.getString(2));   
		        sheet.addCell(gg);  
		        Label k = new Label(3, i, rs.getString(5));   
		        sheet.addCell(k);
				Label l = new Label(4, i, rs.getString(4));   
		        sheet.addCell(l);  
		        Label m = new Label(5, i, rs.getString(6));   
		        sheet.addCell(m); 
		        i++;
			
			out.println(i);
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
%>

</body>
</html>