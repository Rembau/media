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
                "图书销量统计图",
                "图书",//目录轴的显示标签
                "销量",//数值轴的显示标签
                getDataSet(),
                PlotOrientation.VERTICAL,//设置图表方向
                false,
                false,
                false        
        );
        
        //设置标题
        chart.setTitle(new TextTitle("图书销量统计图",new Font("黑体",Font.ITALIC,22)));
        //设置图表部分
        CategoryPlot plot=(CategoryPlot)chart.getPlot();
        
        CategoryAxis categoryAxis=plot.getDomainAxis();//取得横轴
        categoryAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置横轴显示标签的字体
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);//分类标签以４５度倾斜
        categoryAxis.setTickLabelFont(new Font("宋体",Font.BOLD,18));//分类标签字体
        
        NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//取得纵轴
        numberAxis.setLabelFont(new Font("宋体",Font.BOLD,42));//设置纵轴显示标签字体
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
        dataset.addValue(47000,"", "Spring2.0宝典");
        dataset.addValue(38000,"","轻量级的J@EEE");
        dataset.addValue(31000, "", "JavaScript权威指南");
        dataset.addValue(25000, "", "Ajax In Action");
        return dataset;
    }

}
  
