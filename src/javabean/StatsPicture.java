package javabean;

import java.awt.Font;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

public class StatsPicture {
	static String sql="select ap_depart,sum(ap_alljie) from media_application where ap_state='通过' group by ap_depart";
	static void setSql(int startweek,int endweek){
		if(endweek==0){
			return;
		}
		String ss="";
		ss=" and ap_week >= "+startweek+" and ap_week<="+endweek+" ";
		StatsPicture.sql="select ap_depart,sum(ap_alljie) from media_application where ap_state='通过' "+ss+" group by ap_depart";
		System.out.println(StatsPicture.sql);
	}
	public static void main(String[] args) {
		JFreeChart jfreechart = createChart(createDataset(),1,24);
		saveAsFile(jfreechart, log.ReadInfo.getString("home")+"webapps/media/superadmin/media.png", 500, 300);
	}
	public static void make(int startweek,int endweek){
		setSql(startweek,endweek);
		JFreeChart jfreechart = createChart(createDataset(),startweek,endweek);
		saveAsFile(jfreechart, log.ReadInfo.getString("home")+"webapps/media/superadmin/media.png", 500, 300);
	}
	public static JFreeChart createChart(PieDataset piedataset,int startweek,int endweek){
	     //定义图表对象
	     JFreeChart jfreechart = ChartFactory.createPieChart("media "+startweek+"-->"+endweek,piedataset,false,false,false);
	     //获得图表显示对象
	     PiePlot pieplot = (PiePlot)jfreechart.getPlot();
	     //设置图表标签字体
	     pieplot.setLabelFont(new Font("SansSerif",Font.BOLD,12));
	     pieplot.setNoDataMessage("No data available");
	     pieplot.setCircular(true);
	     pieplot.setLabelGap(0.01D);//间距
	     
	     return jfreechart;
	   }
	public static void getdata(DefaultPieDataset defaultpiedataset){
		/*String str[]={"信息工程学院","旅游学院","文学院","经管院","数学系","外语系","艺术系","体育系","社科系","建筑系","化学系",
				"教育系","生环学院","现教中心","办公室","保卫处","党委宣传部","国资处","后勤服务集团","徽学研究所","纪委(监察室)",
				"教务处","人事处","图书馆","校工会","校团委","校医院","学生处","总务处","校领导"};*/
		Conn c=new Conn();
		SqlWork s=new SqlWork(c);
		String sql="select sum(ap_alljie) from media_application where ap_state='通过'";
		Statement stmt=c.getOldStmt();
		ResultSet rs=s.select(stmt, sql);
		NumberFormat n=NumberFormat.getInstance();
		n.setMaximumFractionDigits(2);
		double count=0;
		try {
			rs.next();
			count=rs.getDouble(1);
			System.out.println(count);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sql=StatsPicture.sql;
		rs=s.select(stmt, sql);
		BigDecimal b=null,one=null;
		int sum=0;
		try {
			while(rs.next()){
				//t.put(rs.getString(1),rs.getInt(2));
				b   =   new   BigDecimal(Double.toString(rs.getInt(2)*100/count));
				sum=rs.getInt(2)+sum;
				System.out.println(rs.getInt(2)+" "+b+" "+sum);
				one   =   new   BigDecimal("1");
				double bou=b.divide(one,   2,   BigDecimal.ROUND_HALF_UP).doubleValue();
				defaultpiedataset.setValue(rs.getString(1)+""+bou+"%",rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		c.close();
	}
	public static PieDataset createDataset(){
		DefaultPieDataset defaultpiedataset = new DefaultPieDataset();
		getdata(defaultpiedataset);
		return defaultpiedataset;
	}
	public static void saveAsFile(JFreeChart chart, String outputPath,
			int weight, int height) {
		FileOutputStream out = null;
		try {
			File outFile = new File(outputPath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();
			}
			out = new FileOutputStream(outputPath);
			// 保存为PNG文件
			//ChartUtilities.writeChartAsPNG(out, chart, 600, 350);
			// 保存为JPEG文件
		    ChartUtilities.writeChartAsJPEG(out, chart, weight, height);
			out.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					// do nothing
				}
			}
		}
	}
}
