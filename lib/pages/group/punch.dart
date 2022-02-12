import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PunchPage extends StatelessWidget {
  const PunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrdinalSales, String>> seriesList = _createSampleData();
    return Column(
      children: [
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // image: DecorationImage(
              //     image: NetworkImage( 'https://googleflutter.com/sample_image.jpg'),
              //     fit: BoxFit.fill),
            ),
          ),
        ),
        const Center(child: Text("Jeff Hsu")),
        const Center(child: Text("承暉資訊-")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text("本周工作時數"), Text("10 hr 18 min")],
        ),
        Expanded(
          flex: 1,
          child: charts.BarChart(
            seriesList,
            animate: true,
            vertical: false,
            // Set a bar label decorator.
            // Example configuring different styles for inside/outside:
            //       barRendererDecorator: new charts.BarLabelDecorator(
            //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
            //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
            barRendererDecorator: charts.BarLabelDecorator<String>(),
            // Hide domain axis.
            domainAxis: const charts.OrdinalAxisSpec(
                renderSpec: charts.NoneRenderSpec()),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("打卡"),
        )
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 10),
      OrdinalSales('2016', 12),
      OrdinalSales('2017', 11),
    ];

    return [
      charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}: \$${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
