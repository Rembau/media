package log;

import javax.servlet.http.HttpServlet;

public class Manager extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public Manager(){
		super();
		new Logs();
	}
	public void destroy() {
		super.destroy();
	}
	public static void main(String args[]){
		new Manager();
	}
}
