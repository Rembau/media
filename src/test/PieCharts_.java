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

   //����ͼ��������JFreeChart
	public static JFreeChart createChart(String title,PieDataset piedataset){
		//����ͼ�����
		JFreeChart jfreechart = ChartFactory.createPieChart(title,piedataset,true,true,false); 
		jfreechart.getTitle().setFont(new   Font( "����",   Font.BOLD,  25)); 
		jfreechart.getLegend().setItemFont(new Font("����", Font.PLAIN, 12));
		//���ͼ����ʾ����
		PiePlot pieplot = (PiePlot)jfreechart.getPlot();
		//����ͼ���ǩ����
		pieplot.setLabelFont(new Font("����",Font.BOLD,12));
		pieplot.setNoDataMessage("No data available");
		pieplot.setCircular(true);
		pieplot.setLabelGap(0.01D);//���
		pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(
				("{0}: ({2})"), NumberFormat.getNumberInstance(),
				new DecimalFormat("0.00%")));
		return jfreechart;
	}
   
	public static void main(String[] args){
		Hashtable<String,Double> data =new Hashtable<String,Double>();
		data.put("��������",8316.0);
		data.put("����һ��",4361.0);
		data.put("����һ��",3226.0);
		String path="c://jfreechart//test3.jpg";
		String title="��ͬ��ѧ¥�ж�ý�����ʹ�ô����Ա�";
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
			// ����ΪPNG�ļ�
			//ChartUtilities.writeChartAsPNG(out, chart, 600, 350);
			// ����ΪJPEG�ļ�
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
//����˵�����ˮƽ�������õ� ������
ValueAxis numberaxis = plot.getRangeAxis();
------����X�������ϵ�����----------- 
domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 11));   
------����X��ı�������------------ 
domainAxis.setLabelFont(new Font("����", Font.PLAIN, 12));   
/*------����Y�������ϵ�����-----------  
numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));   
/*------����Y��ı�������------------
numberaxis.setLabelFont(new Font("����", Font.PLAIN, 12));   
/*------���������˵ײ��������������----------- 
jfreechart.getLegend().setItemFont(new Font("����", Font.PLAIN, 12));*/