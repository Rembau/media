package listenerEvent;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javabean.Conn;
import javabean.SqlWork;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener
  implements HttpSessionListener
{
  Conn conn;

  public void sessionCreated(HttpSessionEvent arg0)
  {
    System.out.println("---sessionCreated---");
    this.conn = new Conn();
    arg0.getSession().setAttribute("conn", this.conn);
    this.conn.getConn();
    addSessionValue(arg0.getSession());
  }

  public void sessionDestroyed(HttpSessionEvent arg0) {
    try {
      ((Conn)arg0.getSession().getAttribute("conn")).close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    System.out.println("sessionDestroyed");
  }
  void addSessionValue(HttpSession session) {
    SqlWork s = new SqlWork(this.conn);
    Statement stmt = this.conn.getOldStmt();
    Date date = new Date();
    SimpleDateFormat matter = new SimpleDateFormat("MM");
    String mm = matter.format(date);
    matter = new SimpleDateFormat("dd");
    String dd = matter.format(date);
    matter = new SimpleDateFormat("E");
    String E = matter.format(date);
    if (E.equals("星期日"))
      E = "星期天";
    matter = new SimpleDateFormat("HH");
    String H = matter.format(date);

    int intHH = Integer.parseInt(H);
    int intmm = Integer.parseInt(mm);
    int intdd = Integer.parseInt(dd);
    int intmarkweek = intmm * 100 + intdd;
    String sql = "select * from media_weeks order by wee_id asc";
    ResultSet rsweek = s.select(stmt, sql);
    int intweek = 0;
    try 
    {
    	while (rsweek.next())
    	{
    		if(intmarkweek<rsweek.getInt("wee_num"))
    		{
    			intweek = rsweek.getInt("wee_id")-1;
    			break;
    		}
    	}
    } catch (NumberFormatException e) 
    {
      e.printStackTrace();
    } catch (SQLException e) 
    {
      e.printStackTrace();
    }
    session.setAttribute("intweek", Integer.valueOf(intweek));
    session.setAttribute("intmonth", mm);
    session.setAttribute("intday", dd);
    session.setAttribute("intweekday", E);
    session.setAttribute("inthour", Integer.valueOf(intHH));
  }
}