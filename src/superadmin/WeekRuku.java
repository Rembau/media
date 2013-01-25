package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class WeekRuku extends ServletFather {

	private static final long serialVersionUID = 1L;

	public WeekRuku() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String date=attributes.get("date");
		String semester=attributes.get("semester");
		String semester1=attributes.get("semester1");
		String num = attributes.get("num");
		String day1[]=new String[3];
		int intday[]=new int[3];
		int daynum=0;
	    StringTokenizer fen=new StringTokenizer(date," -"); 
	    while(fen.hasMoreTokens()){
	    	day1[daynum]=fen.nextToken();
	    	daynum++;
	    }
	    /*if(!day1[0].equals(semester.split("-")[0])){
	    	out.print("<script>alert('学期和日期格式不匹配');window.location.href='makeweek.jsp';</script>");
	    	return;
	    }*/
	    if(daynum!=3){
	    	out.print("<script>alert('格式不正确');window.location.href='makeweek.jsp';</script>");
	    	return;
	    }
	    for(int i=0;i<3;i++){
	    	intday[i]=Integer.parseInt(day1[i]);
	    	//out.print(intday[i]+"<br>");
	    }
	    if(intday[1]>12 || intday[1]<1){
	    	out.print("<script>alert('月份格式不正确');window.location.href='makeweek.jsp';</script>");
	    	return;
	    }
	    int markyear=checkYear(intday[0]);
	    
		int month=intday[1];
		int maxday=checkMonth(month,markyear);;
		if(intday[2]<1 || intday[2]>maxday){
	    	  out.print("<script>alert('日期格式不正确');window.location.href='makeweek.jsp';</script>");
	    	  return;
	    }
		  int day=intday[2];
		  int intmarkweek[]=new int[24];
		  int flag=0;
		  for(int j=0;j<Integer.valueOf(num);j++)
		  {    
		      maxday=checkMonth(month,markyear);
		      if(day<=maxday){
			      intmarkweek[j]=month*100+day;
				  day=day+7;
			  }
			  else {
				  day=day-maxday;
				  month++;
				  if(month>12 && flag==0){
			    	  flag=1;
			    	  markyear=checkYear(intday[0]+1);
			    	  month=1;
			      }
				  intmarkweek[j]=month*100+day;
				  day=day+7;
			  }	
		 }
		 //String sql="insert media_week(we_1,we_2,we_3,we_4,we_5,we_6,we_7,we_8,we_9,we_10,we_11,we_12,we_13,we_14,we_15,we_16,we_17,we_18,we_semester,we_semester1,we_19,we_20,we_21,we_22,we_23,we_24) values('"+intmarkweek[0]+"','"+intmarkweek[1]+"','"+intmarkweek[2]+"','"+intmarkweek[3]+"','"+intmarkweek[4]+"','"+intmarkweek[5]+"','"+intmarkweek[6]+"','"+intmarkweek[7]+"','"+intmarkweek[8]+"','"+intmarkweek[9]+"','"+intmarkweek[10]+"','"+intmarkweek[11]+"','"+intmarkweek[12]+"','"+intmarkweek[13]+"','"+intmarkweek[14]+"','"+intmarkweek[15]+"','"+intmarkweek[16]+"','"+intmarkweek[17]+"','"+semester+"','"+semester1+"','"+intmarkweek[18]+"','"+intmarkweek[19]+"','"+intmarkweek[20]+"','"+intmarkweek[21]+"','"+intmarkweek[22]+"','"+intmarkweek[23]+"')";
		 String  sql = "delete from media_week";
		 s.delete(sql);
		 sql="insert media_week(we_num,we_semester,we_semester1) value('"+num+"','"+semester+"','"+semester1+"')";
		 s.insert(sql);
		 int i=0;
		 sql = "delete from media_weeks";
		 s.delete(sql);
		 while(i<Integer.valueOf(num))
		 {
			 sql = "insert media_weeks(wee_id,wee_num) value('"+(i+1)+"','"+intmarkweek[i]+"')";
			 s.insert(sql);
			 i++;
		 }
		 out.print("<script>alert('录入成功');window.location.href='makeweek.jsp';</script>");
		 out.flush();
		 out.close();
	}
	public int checkYear(int year){
		int mark=0;
		if(year%4==0 &&(year%100!=0 || year%400==0)){
	    	mark=1;
		}
		return mark;
	}
	public int checkMonth(int month,int markyear){
		int maxday=0;
		if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)
		  {maxday=31;}
		  else if(month==4 || month==6 || month==9 || month==11)
		  {maxday=30;}
		  else {if(markyear==0) {maxday=28;} else {maxday=29;}  }
		return maxday;
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
