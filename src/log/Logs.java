package log;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.logging.FileHandler;
import java.util.logging.LogManager;
import java.util.logging.Logger;

public class Logs {
	public static Logger  log;
	public static Logger  logs;
	public static Logger  logd;
	public static Logger  logi;
	public static Logger  logu;
	public static Logger  loga;
	static LogManager logMgr;
	public Logs(){
		System.out.print("=========log≥ı ºªØ========");
		if(logMgr==null){
			readInfo();
		}
	}
	public Logger getlog(){
		if(log==null){
			log = Logger.getLogger("test"+this.getClass().getName());
		    createLogger("test",Logs.log);
		    log.warning("good loggood loggood loggood loggood loggood log");
		}
		return log;
	}
	public Logger getlogs(){
		if(logs==null){
			logs = Logger.getLogger("sqlselect"+this.getClass().getName());
		    createLogger("sqlselect",Logs.logs);
		}
		return logs;
	}
	public Logger getlogi(){
		if(logi==null){
			logi = Logger.getLogger("sqlinsert"+this.getClass().getName());
		    createLogger("sqlinsert",Logs.logi);
		}
		return logi;
	}
	public Logger getlogu(){
		if(logu==null){
			logu = Logger.getLogger("sqlupdata"+this.getClass().getName());
		    createLogger("sqlupdata",Logs.logu);
		}
		return logu;
	}
	public Logger getloga(){
		if(loga==null){
			loga = Logger.getLogger("application"+this.getClass().getName());
		    createLogger("application",Logs.loga);
		}
		return loga;
	}
	public Logger getlogd(){
		if(logd==null){
			logd = Logger.getLogger("sqldelete"+this.getClass().getName());
		    createLogger("sqldelete",Logs.logd);
		}
		return logd;
	}
	void readInfo(){
		logMgr = LogManager.getLogManager();
		InputStream fin=null;
		try {
			fin=Manager.class.getResource("logging.properties").openStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*try {
			fin = new FileInputStream(new File("logging.properties"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		try {
			logMgr.readConfiguration(fin);
			System.out.println("=====");
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	void createLogger(String path,Logger log){
		
		FileHandler h=null;
		Calendar c=Calendar.getInstance();
		int m=c.get(Calendar.MONTH);
		int d=c.get(Calendar.DAY_OF_MONTH);
		int ho=c.get(Calendar.HOUR_OF_DAY);
		int mi=c.get(Calendar.MINUTE);
		int s=c.get(Calendar.SECOND);
		try {		
			File f=new File(ReadInfo.getString("home")+"webapps/media/WEB-INF/classes/log/"+path);
			f.mkdir();
			h=new FileHandler(ReadInfo.getString("home")+"webapps/media/WEB-INF/classes/log/"+path+"/"+m+"."+d+"_"+ho+"."+mi+"."+s+"_%g.log");
		} catch (SecurityException e) {//
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.addHandler(h);
		logMgr.addLogger(log);
	}
	public static void main(String args[]){
		new Logs();
	}
}
