import 'package:flutter/material.dart';
import 'package:helioz/Home/mainmenu/screens/mainmenu.dart';
import 'package:helioz/common/AppBar/myappbar.dart';
import 'package:helioz/common/colorsres.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, ColorsRes.borderColor),
      ChartData('Steve', 38, ColorsRes.applightcolor),
      ChartData('Jack', 34, ColorsRes.buttoncolor),
      ChartData('Others', 52, ColorsRes.logoColor)
    ];
    return Scaffold(
        appBar: CustomAppBar("Dashboard"),
        drawer: MainMenu(),
        body: Center(
            child: Container(
                child: SfCircularChart(
                    legend: Legend(
                      height: "2%",
                        position: LegendPosition.bottom,
                        isVisible: true),
                    series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
// ListView(
//   children: [
//     SizedBox(
//       height: 8.h,
//     ),
//     PieChart(
//       dataMap: dataMap,
//       animationDuration: const Duration(milliseconds: 800),
//       chartLegendSpacing: 70,
//       chartRadius: 20.w,
//       // colorList: colorList,
//       initialAngleInDegree: 0,
//       chartType: ChartType.ring,
//       ringStrokeWidth: 30.w,
//       centerText: "",
//       legendOptions: const LegendOptions(
//         showLegendsInRow: false,
//         legendPosition: LegendPosition.right,
//         showLegends: true,
//         legendShape: BoxShape.circle,
//         legendTextStyle: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       chartValuesOptions: const ChartValuesOptions(
//         showChartValueBackground: true,
//         showChartValues: true,
//         // showChartValuesInPercentage: false,
//         showChartValuesOutside: false,
//         decimalPlaces: 1,
//       ),
//       // gradientList: ---To add gradient colors---
//       // emptyColorGradient: ---Empty Color gradient---
//     ),
//   ],
// ),
