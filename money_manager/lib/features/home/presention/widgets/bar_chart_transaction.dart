import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class BarChartTransaction extends StatefulWidget {
  final HomeController controller;
  const BarChartTransaction({required this.controller, super.key});

  @override
  State<StatefulWidget> createState() => BarChartTransactionState();
}

class BarChartTransactionState extends State<BarChartTransaction> {
  final Color dark = const Color.fromRGBO(168, 47, 225, 1);
  final Color normal = const Color.fromRGBO(182, 0, 245, 0.41);
  final Color light = const Color.fromRGBO(217, 148, 241, 0.41);

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff939393), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Fev';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Abr';
        break;
      case 4:
        text = 'Mai';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Ago';
        break;
      case 8:
        text = 'Set';
        break;
      case 9:
        text = 'Out';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dez';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color(
        0xff939393,
      ),
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: leftTitles,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 15,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    List<BarChartGroupData> data = [];
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    for (int i = 0; i < months.length; i++) {
      if (widget.controller.chartBar[months[i]] != null) {
        data.add(getBarChartGroupData(
            months[i], widget.controller.chartBar[months[i]], i));
      }
    }
    return data;
  }

  BarChartGroupData getBarChartGroupData(
      String month, Map<String, dynamic> data, int index) {
    return BarChartGroupData(
      x: index,
      barsSpace: 8,
      barRods: [
        BarChartRodData(
          toY: data['valueCost'] + data['valueEntrance'],
          rodStackItems: [
            BarChartRodStackItem(0, data['valueCost'], dark),
            BarChartRodStackItem(
                data['valueCost'], data['valueEntrance'], normal),
            BarChartRodStackItem(data['valueEntrance'],
                data['valueEntrance'] + data['valueCost'], light),
          ],
          borderRadius: BorderRadius.circular(25),
        )
      ],
    );
  }
}
