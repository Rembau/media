package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import log.ReadInfo;

public class Export extends ServletFather {
	private static final long serialVersionUID = 1L;

	public Export() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		Statement stmt=conn.getStmt();
		Statement stmt1=conn.getStmt();

		//String allstrjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
		String allstrjieci1[]={"'第一节%'","'第二节%'","'第三节%'","'第四节%'","'第五节%'","'第六节%'","'第七节%'","'第八节%'","'第九节%'","'第十节%'","'第十一节%'","'第十二节%'"};

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
			 else {area="'南区'";}
			 
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
		  
		  if(!weekday.equals("0")){ 
			  if(weekday.startsWith("'")){
				  strweekday="and ap_weekday="+weekday; 
			  }
			  else {
				  strweekday="and ap_weekday='"+weekday+"'"; 
			  }
		  }
		  
		  if(!area.equals("0")){
			  if(area.startsWith("'")){
				  strarea="and ap_area="+area; 
			  }	else {
				  strarea="and ap_area='"+area+"'"; 
			  }
		  }
		  
		  if(!jieci.equals("0")){ strjieci="and ap_jieci like "+jieci;}
		 String strroom1="";
		if(!floor1.equals("0") && layer.equals("0") && room.equals("0")){
		      strroom1="and ap_room like '"+floor1+"%'";
		    }
		else if(!floor1.equals("0") && !layer.equals("0") && room.equals("0")) 
		  strroom1="and ap_room like '"+floor1+""+layer+"%'";
		 else if(!floor1.equals("0") &&  !room.equals("0"))
		 strroom1="and ap_room like '"+room+"'";
		 
		String strsql=null;
		     strsql=request.getParameter("strsql");
			 if(strsql!=null){
			 strsql=new String(strsql.getBytes("ISO-8859-1"),"GB2312");}
			 else {strsql="0";}

			 
		 String strname="";
		 String strnum="";
		 if(!name1.equals("0") &&name1.length()!=0)
		 strname="and ap_name like '"+name1+"%'";
		 if(!num1.equals("0") &&num1.length()!=0)
		 strnum="and ap_num like '"+num1+"%'";
		 
		 String sql="select * from media_application where ap_state='通过'";
			//System.out.print(sql+" "+strweek+" "+strweekday+" "+strarea+" "+strjieci+" "+strroom1+" "+strname+" "+strnum);
		String name="biao";
		  sql=sql+" "+strweek+" "+strweekday+" "+strarea+" "+strjieci+" "+strroom1+" "+strname+" "+strnum;
		int i=1;
		WritableWorkbook book=null;
				try
				{ 
					ResultSet rs=stmt.executeQuery(sql);
					book = Workbook.createWorkbook(new File(this.getServletContext().getRealPath("/")+"/superadmin/upload/"+name+".xls"));//所建立的表名和存储路径
					WritableSheet sheet = book.createSheet("申请", 0);                       //表的标签名  
					Label label = new Label(0, 0, "序号");
					sheet.addCell(label);
			        Label label2 = new Label(1, 0, "教室");   
			        sheet.addCell(label2);
			        Label label3 = new Label(2, 0, "周次");   
			        sheet.addCell(label3);
			        Label label4 = new Label(3, 0, "周几");   
			        sheet.addCell(label4);
			        Label label5 = new Label(4, 0, "节次");   
			        sheet.addCell(label5);
					Label label6 = new Label(5, 0, "院系");   
			        sheet.addCell(label6);
					Label label7 = new Label(6, 0, "教师姓名");   
			        sheet.addCell(label7);
		            Label label8 = new Label(7, 0, "工号");   
			        sheet.addCell(label8);
					Label label9 = new Label(8, 0, "时间");   
			        sheet.addCell(label9);
					Label label10 = new Label(9, 0, "状态");   
			        sheet.addCell(label10);
					Label label11 = new Label(10, 0, "校区");   
			        sheet.addCell(label11);
			        Label label12 = new Label(11, 0, "使用");   
			        sheet.addCell(label12);
			        Label label13 = new Label(12, 0, "正常使用");   
			        sheet.addCell(label13);
					String stri;
					while(rs.next())
					{
						stri=String.valueOf(i);
						Label h = new Label(0, i, stri);   
				        sheet.addCell(h); 
						int introom=Integer.parseInt(rs.getString(5));
						sql="select * from media_site where sit_nummark='"+introom/1000+"'";
						//System.out.println(sql);
						ResultSet rs2=stmt1.executeQuery(sql);
						if(!rs2.next()){
							continue;
						}
						String floor2=rs2.getString(2);
				        Label ii = new Label(1, i,floor2+""+introom%1000 );   
				        sheet.addCell(ii); 
				        Label gg = new Label(2, i, rs.getString(3));   
				        sheet.addCell(gg);  
				        Label k = new Label(3, i, rs.getString(4));   
				        sheet.addCell(k);
						Label l = new Label(4, i, rs.getString(7));   
				        sheet.addCell(l);
						Label m = new Label(5, i, rs.getString(9));   
				        sheet.addCell(m);
						Label n = new Label(6, i, rs.getString(2));   
				        sheet.addCell(n);
		                 Label o = new Label(7, i, rs.getString(10));   
				        sheet.addCell(o);
		                 Label p = new Label(8, i, rs.getString(8));   
				        sheet.addCell(p);
		                 Label q = new Label(9, i, rs.getString(11));   
				        sheet.addCell(q);
		                 Label r = new Label(10, i, rs.getString(6));   
				        sheet.addCell(r);
				        Label s = new Label(11, i, rs.getString("ap_normal"));   
				        sheet.addCell(s);
				        Label t = new Label(12, i, rs.getString("ap_used"));   
				        sheet.addCell(t);
				        i++;
					}
					book.write(); 
					out.println(i); 
					out.println("导出成功！");
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}catch (RowsExceededException e) {
					e.printStackTrace();
				} catch (WriteException e) {
					e.printStackTrace();
				} catch(Exception e){
					e.printStackTrace();
				} finally{    
			        try {
						book.close();
					} catch (WriteException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
				}
		response.sendRedirect("../superadmin/upload/"+name+".xls");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
