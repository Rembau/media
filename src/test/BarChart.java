package test;

import java.awt.Font;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Set;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

public class BarChart {
	public BarChart(String title,String row,String col,LinkedHashMap<String,Double> data,String path){
		JFreeChart chart=ChartFactory.createBarChart3D(
				title,
				row,//Ŀ¼�����ʾ��ǩ
				col,//��ֵ�����ʾ��ǩ
                getDataSet(data),
                PlotOrientation.VERTICAL,//����ͼ����
                false,
                false,
                false        
        );
        
        //���ñ���
        chart.setTitle(new TextTitle(title,new Font("����",Font.ITALIC,22)));
        //����ͼ����
        CategoryPlot plot=(CategoryPlot)chart.getPlot();
        
        CategoryAxis categoryAxis=plot.getDomainAxis();//ȡ�ú���
        categoryAxis.setLabelFont(new Font("����",Font.BOLD,22));//���ú�����ʾ��ǩ������
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);//�����ǩ�ԣ�������б
        categoryAxis.setTickLabelFont(new Font("����",Font.BOLD,18));//�����ǩ����
        
        NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//ȡ������
        numberAxis.setLabelFont(new Font("����",Font.BOLD,42));//����������ʾ��ǩ����
        FileOutputStream fos=null;
        try {
			fos=new FileOutputStream(path);
			ChartUtilities.writeChartAsJPEG(
	                fos,
	                1,
	                chart,
	                800,
	                600,
	                null
	        
	        );
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
	        try {
				fos.close();
			} catch (IOException e) {
			}
		}
        
	}
    private static CategoryDataset getDataSet(LinkedHashMap<String,Double> data){
        DefaultCategoryDataset dataset=new DefaultCategoryDataset();
        Set<String> keys= data.keySet();
        for(String name:keys){
			double value = data.get(name);
			dataset.addValue(value,"",name);
        }
        return dataset;
    }
	public static void main(String[] args) {
		LinkedHashMap<String,Double> data =new LinkedHashMap<String,Double>();
		data.put("��һ��",1278.0);
		data.put("�ڶ���",1763.0);
		data.put("������",1579.0);
		data.put("������",1788.0);
		data.put("������",1650.0);
		String path="c://jfreechart//test.jpg";
		String title="��ͬʱ���ʹ�ö�ý��ĶԱ�����";
		String row="�ܴ�";
		String col="��ʱ";
		new BarChart(title,row,col,data,path);
	}
}
