package test;

import java.io.File;

public class DeleteLogs {
	DeleteLogs(){
	}
	static void delete(String path){
		File f=new File("D:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/Webmedia/WEB-INF/classes/log/"+path);
		File ff[]=f.listFiles();
		for(int i=0;i<ff.length;i++){
			try{
				ff[i].delete();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		String str[]={"test","sqlselect","sqlinsert","sqlupdata","sqldelete","application"};
		for(int i=0;i<str.length;i++){
			delete(str[i]);
		}
		System.out.print("over");
	}
}
