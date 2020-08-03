/// Bar chart example
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
class SimpleBarChart extends StatelessWidget {
  final List<Series> seriesList ;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});
  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new BarChart(
      seriesList,
      animate: animate,
// Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new BarLabelDecorator<String>(),
      domainAxis: new OrdinalAxisSpec(),
    );
  }
  /// Create one series with sample hard coded data.
  static List<Series<OrdinalSales, String>> createSampleData() {
    final data = [
      new OrdinalSales('伙食', 14320, Color.black),
      new OrdinalSales('住宿', 5650, MaterialPalette.deepOrange.shadeDefault),
      new OrdinalSales('交通', 830, MaterialPalette.blue.shadeDefault),
      new OrdinalSales('飲料', 830, MaterialPalette.green.shadeDefault),
      new OrdinalSales('衣著', 2000, MaterialPalette.pink.shadeDefault),
      new OrdinalSales('玩樂', 6500, MaterialPalette.purple.shadeDefault),
      new OrdinalSales('教育', 1000, MaterialPalette.yellow.shadeDefault),
    ];
    return [
      new Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (OrdinalSales sales, __) => sales.color,
        domainFn: (OrdinalSales sales, _) => sales.title,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
          '\$${sales.sales.toString()}元'
      )
    ];
  }

  void _onSelectionChanged(SelectionModel model){
    print('you touch the chart.'+model.selectedSeries.toString());
  }

}
/// Sample ordinal data type.
class OrdinalSales {
  final String title;
  final int sales;
  final Color color;
  OrdinalSales(this.title, this.sales,this.color);
}