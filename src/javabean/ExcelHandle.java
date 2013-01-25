package javabean;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelHandle
{
  public String path = "d:/用户表.xls";
  int num = 1; int cardnum = 2; int name = 3; int depart = 4; int telephone = 5; int mail = 6;
  public String excel()
  {
	int i=0;
    try
    {
      i=readExcel(this.path);
      System.out.println("OK");
    }
    catch (Exception localException)
    {
      System.out.print("2");
      localException.printStackTrace();
    }
    return String.valueOf(i);
  }

  public int readExcel(String paramString)
  {
Conn c=new Conn();
SqlWork s=new SqlWork(c);
int i = 1;
    try
    {
      String[] arrayOfString = new String[10];
      FileInputStream localFileInputStream = new FileInputStream(paramString);
      Workbook localWorkbook = Workbook.getWorkbook(localFileInputStream);

      Sheet localSheet = localWorkbook.getSheet(0);

      String sql=null;
      ResultSet rs=null;
      Statement stmt=c.getStmt();
      while (i <= localSheet.getRows())
      {
        Object localObject;
        for (int j = 0; j <= 4; j++)
        {
          localObject = localSheet.getCell(j, i).getContents();
          arrayOfString[j] = (String)localObject;
        }
        i++;
        sql="select * from media_user where user_num ='"+arrayOfString[this.num]+"'";
        rs=s.select(stmt, sql);
        if(rs.next()){
        	sql="delete from media_user where user_num ='"+arrayOfString[this.num]+"'";
        	s.delete(sql);
        }
        //System.out.println("insert into media_user(user_num,user_cardnum,user_name,user_depart,user_telephone,user_mail) values('" + arrayOfString[this.num] + "','" + arrayOfString[this.cardnum] + "','" + arrayOfString[this.name] + "','" + arrayOfString[this.depart] + "')");
         s.insert("insert into media_user(user_num,user_cardnum,user_name,user_depart) values('" + arrayOfString[this.num] + "','" + arrayOfString[this.cardnum] + "','" + arrayOfString[this.name] + "','" + arrayOfString[this.depart] + "')");
      }
      c.close();
      localWorkbook.close();
    }
    catch (Exception localException)
    {
      System.out.print("3");
      localException.printStackTrace();
    }
    return i-1;
  }
  public String excel1()
  {
	  String str="";
	  Conn c=new Conn();
	  SqlWork s=new SqlWork(c);
	  Statement stmt=c.getStmt();
	  String[] arrayOfString = new String[10];
      FileInputStream localFileInputStream;
      Workbook localWorkbook=null;
      Sheet localSheet=null;
      try {
    	  localFileInputStream = new FileInputStream(this.path);
    	  localWorkbook = Workbook.getWorkbook(localFileInputStream);
    	  localSheet = localWorkbook.getSheet(0);
      } catch (FileNotFoundException e) {
    	  e.printStackTrace();
      } catch (BiffException e) {
    	  e.printStackTrace();
      } catch (IOException e) {
    	  e.printStackTrace();
      }
      int i=1,x=0; 
      System.out.println(localSheet.getRows());
      while (i < localSheet.getRows())
      {
    	  Object localObject;
    	  for (int j = 0; j <= 4; j++)
    	  {
    		  localObject = localSheet.getCell(j, i).getContents();
    		  System.out.println(localObject.toString());
    		  arrayOfString[j] = (String)localObject;
    	  }
    	  String sql="select * from media_users where user_name='"+arrayOfString[0]+"' and user_num='"+arrayOfString[1]+"'";
    	  ResultSet rs = s.select(stmt, sql);
    	  try {
    		  if(rs.next()){
    			  sql="insert into media_course value('"+arrayOfString[0]+"','"+arrayOfString[1]+"','"+arrayOfString[2]+"','"+arrayOfString[3]+"','"+arrayOfString[4]+"')";
    			  s.insert(sql);
    			  str+=arrayOfString[0]+" "+arrayOfString[1]+"导入成功<br>";
    		  } else{
    			  str+=arrayOfString[0]+" 和 "+arrayOfString[1]+"不对应<br>";
    			  x++;
    		  }
    	  } catch (SQLException e) {
    		  e.printStackTrace();
    	  }
    	  i++;
      }
      str+="共导入"+(--i)+"条记录，其中"+x+"条失败。";
      return str;
  }
}
