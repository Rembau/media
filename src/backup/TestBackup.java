package backup;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Properties;
import java.util.Timer;

import javax.swing.JOptionPane;
import javax.servlet.http.HttpServlet;
public class TestBackup extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static String mysqlPath;
	static String backupFilePath;
	static String databaseName;
	static int backupHour;
	public TestBackup(){
		super();
		new File("d:/mediabackup").mkdir();
		getValue();
		startTimer();
	}
	static void getValue(){
		Properties p=new Properties();
		try {
			InputStream in=TestBackup.class.getResource("data.properties").openStream();
			p.load(in);
			mysqlPath=p.getProperty("mysqlPath");
			backupFilePath=p.getProperty("backupFilePath");
			backupHour=Integer.parseInt(p.getProperty("backupHour"));
			databaseName=p.getProperty("databaseName");
			in.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String title = "错误";
			JOptionPane.showMessageDialog(null,"读取配置文件出错", title, JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
			System.exit(0);
		}
	}
	static Timer timer=new Timer();
	static void startTimer(){
		timer.schedule(new MyTask(), 0, 3600*1000);
	}
	public static void main(String args[]){
		getValue();
		startTimer();
	}
	static class MyTask extends java.util.TimerTask{
		String week[]={"","星期天","星期一","星期二","星期三","星期四","星期五","星期六"};
		@Override
		public void run() {
			int hour=Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
			System.out.println(week[Calendar.getInstance().get(Calendar.DAY_OF_WEEK)]);
			// TODO Auto-generated method stub
			if(hour==backupHour){
				String command=mysqlPath+"/bin/mysqldump.exe -u backup --allow-keywords "+databaseName;	// > d://test.sql  
				try {
					System.out.println(command);
					Process p = Runtime.getRuntime().exec(command);
					BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream(),"UTF-8"));
				     String line;
				     FileOutputStream backupfile = new FileOutputStream(backupFilePath+"/"+week[Calendar.getInstance().get(Calendar.DAY_OF_WEEK)]+".sql");
				     while ((line = br.readLine()) != null) {
				    	 backupfile.write((line+"\r\n").getBytes());
				    	 //System.out.println(line);
				     }
				     br.close();
				     backupfile.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					String title = "错误";
					JOptionPane.showMessageDialog(null,"读取配置文件出错", title, JOptionPane.ERROR_MESSAGE);
					e.printStackTrace();
					System.exit(0);
				}
			}
			System.out.println(Calendar.getInstance().getTime()+"________"+hour);//定时任务主要实现
		}
	}
}
