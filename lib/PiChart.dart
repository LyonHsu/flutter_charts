/// Bar chart example
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class SimplePieChart extends StatelessWidget {
  final List<Series> seriesList ;
  final bool animate;

  SimplePieChart(this.seriesList, {this.animate});
  /// Creates a [BarChart] with sample data and no transition.
  factory SimplePieChart.withSampleData() {
    return new SimplePieChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new PieChart(
      seriesList,
      animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        //
        // [ArcLabelDecorator] will automatically position the label inside the
        // arc if the label will fit. If the label will not fit, it will draw
        // outside of the arc with a leader line. Labels can always display
        // inside or outside using [LabelPosition].
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new ArcRendererConfig(
            arcWidth: 100,
            arcRendererDecorators: [
              new ArcLabelDecorator(
                  //labelPosition: ArcLabelPosition.outside //預設是 內外 自動設定
              )
            ]),

    );
  }
  /// Create one series with sample hard coded data.
  static List<Series<LinearSales, String>> createSampleData() {
    final data = [
      new LinearSales('伙食', 14320, Color.black),
      new LinearSales('住宿', 5650, MaterialPalette.deepOrange.shadeDefault),
      new LinearSales('交通', 830, MaterialPalette.blue.shadeDefault),
      new LinearSales('飲料', 830, MaterialPalette.green.shadeDefault),
      new LinearSales('衣著', 2000, MaterialPalette.pink.shadeDefault),
      new LinearSales('玩樂', 6500, MaterialPalette.purple.shadeDefault),
      new LinearSales('教育', 1000, MaterialPalette.yellow.shadeDefault),
    ];
    return [
      new Series<LinearSales, String>(
        id: 'Sales',
        colorFn: (LinearSales sales, __) => sales.color,
        domainFn: (LinearSales sales, _) => sales.title,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.title}: ${row.sales}元',
      )
    ];
  }

  void _onSelectionChanged(SelectionModel model){
    print('you touch the chart.'+model.selectedSeries.toString());
  }

}
/// Sample ordinal data type.
class LinearSales {
  final String title;
  final int sales;
  final Color color;
  LinearSales(this.title, this.sales,this.color);
}