package test;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Enumeration;
import java.util.Hashtable;
import java.awt.Font;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

public class PieCharts_{
	private static final long serialVersionUID = 1L;
	public PieCharts_(String title,Hashtable<String,Double> data,String path){
		JFreeChart jfreechart = createChart(title,createDataset(data));
     	saveAsFile(jfreechart, path, 500, 300);
	}
	public static PieDataset createDataset(Hashtable<String,Double> data){
		DefaultPieDataset defaultpiedataset = new DefaultPieDataset();
		Enumeration<String> keys= data.keys();
		while(keys.hasMoreElements()){
			String name = keys.nextElement();
			double value = data.get(name);
			defaultpiedataset.setValue(name,value);
		}
		return defaultpiedataset;
	}

   //生成图表主对象JFreeChart
	public static JFreeChart createChart(String title,PieDataset piedataset){
		//定义图表对象
		JFreeChart jfreechart = ChartFactory.createPieChart(title,piedataset,true,true,false); 
		jfreechart.getTitle().setFont(new   Font( "宋体",   Font.BOLD,  25)); 
		jfreechart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));
		//获得图表显示对象
		PiePlot pieplot = (PiePlot)jfreechart.getPlot();
		//设置图表标签字体
		pieplot.setLabelFont(new Font("宋体",Font.BOLD,12));
		pieplot.setNoDataMessage("No data available");
		pieplot.setCircular(true);
		pieplot.setLabelGap(0.01D);//间距
		pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(
				("{0}: ({2})"), NumberFormat.getNumberInstance(),
				new DecimalFormat("0.00%")));
		return jfreechart;
	}
   
	public static void main(String[] args){
		Hashtable<String,Double> data =new Hashtable<String,Double>();
		data.put("南区二教",8316.0);
		data.put("南区一教",4361.0);
		data.put("北区一教",3226.0);
		String path="c://jfreechart//test3.jpg";
		String title="不同教学楼中多媒体教室使用次数对比";
		new PieCharts_(title,data,path);
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
		    ChartUtilities.writeChartAsJPEG(out, 1,chart, 800,600,null);
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
				}
			}
		}
	}
}

/*
CategoryAxis domainAxis = plot.getDomainAxis();  
// NumberAxis  valueAxis=(NumberAxis) plot.getRangeAxis(); 
//有人说这个是水平方向设置的 方法。
ValueAxis numberaxis = plot.getRangeAxis();
------设置X轴坐标上的文字----------- 
domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 11));   
------设置X轴的标题文字------------ 
domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));   
/*------设置Y轴坐标上的文字-----------  
numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));   
/*------设置Y轴的标题文字------------
numberaxis.setLabelFont(new Font("黑体", Font.PLAIN, 12));   
/*------这句代码解决了底部汉字乱码的问题----------- 
jfreechart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));*/