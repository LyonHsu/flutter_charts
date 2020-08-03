# flutter_app_charts

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# flutter_charts

柱狀圖

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
              '\$${sales.sales.toString()}元' //資料文字顯示
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
    
    
圓餅圖
    
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
                arcWidth: 100, //調整圓餅的半徑大小
                arcRendererDecorators: [
                  new ArcLabelDecorator(
                      //labelPosition: ArcLabelPosition.outside //資料文字顯示位置 預設是 內外 自動設定
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
            labelAccessorFn: (LinearSales row, _) => '${row.title}: ${row.sales}元',//資料文字顯示
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
    
    
    
    
