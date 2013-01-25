package javabean;

public class VetoAppExecption extends Exception{

	private static final long serialVersionUID = 1L;
	public String getMessage(){
		return "申请记录里没有该记录了!";
	}
}
