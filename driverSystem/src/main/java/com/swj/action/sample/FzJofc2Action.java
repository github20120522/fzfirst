package com.swj.action.sample;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.swj.action.BaseAction;

import jofc2.model.Chart;
import jofc2.model.Text;
import jofc2.model.axis.XAxis;
import jofc2.model.axis.YAxis;
import jofc2.model.elements.LineChart;

// jofc2 的测试类
public class FzJofc2Action extends BaseAction {
	
	private static final long serialVersionUID = 1517169530990076947L;

	private InputStream inputStream;
	
	// jump to jofc2.jsp
	public String gotoJofc2() throws Exception{
		
		log.info("FzJofc2Action.gotoJofc2");
		return "gotoJofc2";
	}
	
	// jofc2 test
	public String jofc2Test() throws Exception{
		
		log.info("FzJofc2Action.jofc2Test");
		LineChart lineChart = new LineChart();
		// 设置字体
		lineChart.setFontSize(15);
		// 设置鼠标移到点上显示的内容
		//lineChart.setTooltip("#val#%");
		// 按照顺序设置各个点的值
		LineChart.Dot dot1 = new LineChart.Dot(70);
		LineChart.Dot dot2 = new LineChart.Dot(85);
		LineChart.Dot dot3 = new LineChart.Dot(44);
		LineChart.Dot dot4 = new LineChart.Dot(67);
		LineChart.Dot dot5 = new LineChart.Dot(90);
		LineChart.Dot dot6 = new LineChart.Dot(64);
		LineChart.Dot dot7 = new LineChart.Dot(28);
		LineChart.Dot dot8 = new LineChart.Dot(99);
		LineChart.Dot dot9 = new LineChart.Dot(66);
		LineChart.Dot dot10 = new LineChart.Dot(77);
		LineChart.Dot dot11 = new LineChart.Dot(88);
		LineChart.Dot dot12 = new LineChart.Dot(11);
		// 按照顺序把点加入到图形中
		lineChart.addDots(dot1);
		lineChart.addDots(dot2);
		lineChart.addDots(dot3);
		lineChart.addDots(dot4);
		lineChart.addDots(dot5);
		lineChart.addDots(dot6);
		lineChart.addDots(dot7);
		lineChart.addDots(dot8);
		lineChart.addDots(dot9);
		lineChart.addDots(dot10);
		lineChart.addDots(dot11);
		lineChart.addDots(dot12);
		// X 轴
		XAxis x = new XAxis();
		x.addLabels("1月份");
		x.addLabels("2月份");
		x.addLabels("3月份");
		x.addLabels("4月份");
		x.addLabels("5月份");
		x.addLabels("6月份");
		x.addLabels("7月份");
		x.addLabels("8月份");
		x.addLabels("9月份");
		x.addLabels("10月份");
		x.addLabels("11月份");
		x.addLabels("12月份");
		// Y轴最大值
		long max = 100;
		YAxis y = new YAxis();
		y.setMax(max+0.0);
		// 步进
		y.setSteps(5);
		// 整个图的标题
		Chart flashChart = new Chart("折线图","font-size:12px;color:#ff0000;");
		// 把图加入到图表
		flashChart.addElements(lineChart);
		// Y轴描述
		Text yText = new Text("jofc2",Text.createStyle(20,"#000000",Text.TEXT_ALIGN_LEFT));
		flashChart.setYAxis(y);
		flashChart.setXAxis(x);
		// 设置y轴显示内容
		flashChart.setYLegend(yText);
		inputStream = new ByteArrayInputStream(flashChart.toString().getBytes("utf-8"));
		return "jofc2Test";
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
