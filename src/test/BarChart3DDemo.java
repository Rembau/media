package test;

import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
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

public class BarChart3DDemo {
	
    public static void main(String[] args) throws IOException{
        JFreeChart chart=ChartFactory.createBarChart3D(
                "ͼ������ͳ��ͼ",
                "ͼ��",//Ŀ¼�����ʾ��ǩ
                "����",//��ֵ�����ʾ��ǩ
                getDataSet(),
                PlotOrientation.VERTICAL,//����ͼ����
                false,
                false,
                false        
        );
        
        //���ñ���
        chart.setTitle(new TextTitle("ͼ������ͳ��ͼ",new Font("����",Font.ITALIC,22)));
        //����ͼ����
        CategoryPlot plot=(CategoryPlot)chart.getPlot();
        
        CategoryAxis categoryAxis=plot.getDomainAxis();//ȡ�ú���
        categoryAxis.setLabelFont(new Font("����",Font.BOLD,22));//���ú�����ʾ��ǩ������
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);//�����ǩ�ԣ�������б
        categoryAxis.setTickLabelFont(new Font("����",Font.BOLD,18));//�����ǩ����
        
        NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//ȡ������
        numberAxis.setLabelFont(new Font("����",Font.BOLD,42));//����������ʾ��ǩ����
        FileOutputStream fos=null;
        fos=new FileOutputStream("book1.jpg");
        ChartUtilities.writeChartAsJPEG(
                fos,
                1,
                chart,
                800,
                600,
                null
        
        );
        fos.close();
    }
    private static CategoryDataset getDataSet(){
        DefaultCategoryDataset dataset=new DefaultCategoryDataset();
        dataset.addValue(47000,"", "Spring2.0����");
        dataset.addValue(38000,"","��������J@EEE");
        dataset.addValue(31000, "", "JavaScriptȨ��ָ��");
        dataset.addValue(25000, "", "Ajax In Action");
        return dataset;
    }

}
  
