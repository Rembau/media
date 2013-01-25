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
				row,//目录轴的显示标签
				col,//数值轴的显示标签
                getDataSet(data),
                PlotOrientation.VERTICAL,//设置图表方向
                false,
                false,
                false        
        );
        
        //设置标题
        chart.setTitle(new TextTitle(title,new Font("黑体",Font.ITALIC,22)));
        //设置图表部分
        CategoryPlot plot=(CategoryPlot)chart.getPlot();
        
        CategoryAxis categoryAxis=plot.getDomainAxis();//取得横轴
        categoryAxis.setLabelFont(new Font("宋体",Font.BOLD,22));//设置横轴显示标签的字体
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);//分类标签以４５度倾斜
        categoryAxis.setTickLabelFont(new Font("宋体",Font.BOLD,18));//分类标签字体
        
        NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();//取得纵轴
        numberAxis.setLabelFont(new Font("宋体",Font.BOLD,42));//设置纵轴显示标签字体
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
		data.put("第一周",1278.0);
		data.put("第二周",1763.0);
		data.put("第三周",1579.0);
		data.put("第四周",1788.0);
		data.put("第五周",1650.0);
		String path="c://jfreechart//test.jpg";
		String title="不同时间段使用多媒体的对比数据";
		String row="周次";
		String col="课时";
		new BarChart(title,row,col,data,path);
	}
}
