package com.anup.controller;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.event.ItemSelectEvent;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.BubbleChartModel;
import org.primefaces.model.chart.BubbleChartSeries;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;
import org.primefaces.model.chart.PieChartModel;

@ManagedBean
public class ChartController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private BubbleChartModel bubbleModel;

	private LineChartModel areaModel;

	private BarChartModel barModel;
	private PieChartModel pieModel1;

	@PostConstruct
	public void init() {
		createBubbleModels();
		createAreaModel();
		createBarModels();
		createPieModels();
	}

	public BarChartModel getBarModel() {
		return barModel;
	}

	public PieChartModel getPieModel1() {
		return pieModel1;
	}

	private void createBarModels() {
		createBarModel();
	}

	public BubbleChartModel getBubbleModel() {
		return bubbleModel;
	}

	public LineChartModel getAreaModel() {
		return areaModel;
	}

	private void createBubbleModels() {

		bubbleModel = initBubbleModel();
		bubbleModel.setTitle("Label Printed Status");
		bubbleModel.setShadow(false);
		bubbleModel.setBubbleGradients(true);
		bubbleModel.setBubbleAlpha(0.8);
		bubbleModel.getAxis(AxisType.X).setTickAngle(-50);
		Axis yAxis = bubbleModel.getAxis(AxisType.Y);
		yAxis.setMin(0);
		yAxis.setMax(250);
		yAxis.setTickAngle(50);
	}

	private BubbleChartModel initBubbleModel() {
		BubbleChartModel model = new BubbleChartModel();

		model.add(new BubbleChartSeries("Generic Labels", 70, 183, 55));
		model.add(new BubbleChartSeries("ASN Labels", 45, 92, 36));
		model.add(new BubbleChartSeries("PO Labels", 24, 104, 40));

		return model;
	}

	private void createAreaModel() {
		areaModel = new LineChartModel();

		LineChartSeries asn = new LineChartSeries();
		asn.setFill(true);
		asn.setLabel("ASN Labels");
		asn.set("2014", 120);
		asn.set("2015", 100);
		asn.set("2016", 44);
		asn.set("2017", 150);
		asn.set("2018", 25);

		LineChartSeries generic = new LineChartSeries();
		generic.setFill(true);
		generic.setLabel("Generic Labels");
		generic.set("2014", 52);
		generic.set("2015", 60);
		generic.set("2016", 110);
		generic.set("2017", 90);
		generic.set("2018", 120);

		LineChartSeries po = new LineChartSeries();
		po.setFill(true);
		po.setLabel("PO Labels");
		po.set("2014", 140);
		po.set("2015", 120);
		po.set("2016", 40);
		po.set("2017", 100);
		po.set("2018", 5);

		areaModel.addSeries(asn);
		areaModel.addSeries(generic);
		areaModel.addSeries(po);

		areaModel.setTitle("Printing Chart");
		areaModel.setLegendPosition("ne");
		areaModel.setStacked(true);
		areaModel.setShowPointLabels(true);

		Axis xAxis = new CategoryAxis("Years");
		areaModel.getAxes().put(AxisType.X, xAxis);
		Axis yAxis = areaModel.getAxis(AxisType.Y);
		yAxis.setLabel("Qty Printed");
		yAxis.setMin(0);
		yAxis.setMax(300);
	}

	private void createBarModel() {
		barModel = initBarModel();

		barModel.setTitle("Label Printed Per Year");
		barModel.setLegendPosition("ne");

		Axis xAxis = barModel.getAxis(AxisType.X);
		xAxis.setLabel("Year");

		Axis yAxis = barModel.getAxis(AxisType.Y);
		yAxis.setLabel("Qty");
		yAxis.setMin(0);
		yAxis.setMax(200);
	}

	private BarChartModel initBarModel() {
		BarChartModel model = new BarChartModel();

		ChartSeries asn = new ChartSeries();
		asn.setLabel("ASN Labels");
		asn.set("2014", 120);
		asn.set("2015", 100);
		asn.set("2016", 44);
		asn.set("2017", 150);
		asn.set("2018", 25);

		ChartSeries generic = new ChartSeries();
		generic.setLabel("Generic Labels");
		generic.set("2014", 52);
		generic.set("2015", 60);
		generic.set("2016", 110);
		generic.set("2017", 90);
		generic.set("2018", 120);

		model.addSeries(asn);
		model.addSeries(generic);

		return model;
	}

	private void createPieModels() {
		createPieModel1();
	}

	private void createPieModel1() {
		pieModel1 = new PieChartModel();

		pieModel1.set("Generic Label", 540);
		pieModel1.set("ASN Label", 325);
		pieModel1.set("PO Label", 702);

		pieModel1.setTitle("Label Chart");
		pieModel1.setLegendPosition("w");
	}

	public void itemSelect(ItemSelectEvent event) {
		FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Item selected",
				"Item Index: " + event.getItemIndex() + ", Series Index:" + event.getSeriesIndex());

		FacesContext.getCurrentInstance().addMessage(null, msg);
	}
}
