import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statistic Chart',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: StatisticChart(),
        ),
      ),
    );
  }
}

class StatisticChart extends StatefulWidget {
  @override
  _StatisticChartState createState() => _StatisticChartState();
}

class _StatisticChartState extends State<StatisticChart> {
  String dropdownValue = 'Day';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: Card(
        color: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Statistic',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.tealAccent, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.white),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.tealAccent),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Day', 'Month', 'Year'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey,
                          strokeWidth: 1,
                          dashArray: [5],
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Color(0xff75729e),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        getTitles: (value) {
                          return '${value.toInt()}k';
                        },
                        margin: 10,
                        reservedSize: 40,
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Color(0xff68737d),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Sep';
                            case 1:
                              return 'Oct';
                            case 2:
                              return 'Nov';
                            case 3:
                              return 'Dec';
                            case 4:
                              return 'Jan';
                            case 5:
                              return 'Feb';
                          }
                          return '';
                        },
                        margin: 10,
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 3,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 0.5),
                          FlSpot(1, 1.3),
                          FlSpot(2, 1),
                          FlSpot(3, 2.8),
                          FlSpot(4, 1.2),
                          FlSpot(5, 1.8),
                        ],
                        isCurved: true,
                        colors: [Colors.teal],
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [Colors.teal.withOpacity(0.3)],
                          gradientFrom: const Offset(0, 0),
                          gradientTo: const Offset(0, 1),
                          gradientColorStops: [0.5, 1.0],
                        ),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.tealAccent,
                      ),
                      handleBuiltInTouches: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Usage Graph',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Usage Graph'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Total Usage (in kWh)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Last 7 days',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(showTitles: false),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (context, value) => const TextStyle(
                            color: Color(0xff68737d),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          getTitles: (value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Sat';
                              case 1:
                                return 'Sun';
                              case 2:
                                return 'Mon';
                              case 3:
                                return 'Tue';
                              case 4:
                                return 'Wed';
                              case 5:
                                return 'Thu';
                              case 6:
                                return 'Fri';
                            }
                            return '';
                          },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 50),
                            FlSpot(1, 20),
                            FlSpot(2, 70),
                            FlSpot(3, 30),
                            FlSpot(4, 60),
                            FlSpot(5, 65),
                            FlSpot(6, 96),
                          ],
                          isCurved: true,
                          colors: [Colors.blue],
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: EnergyUsageCard(),
        ),
      ),
    );
  }
}

class EnergyUsageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.tealAccent[700],
                child: const Icon(Icons.flash_on, color: Colors.black87),
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '924',
                    style: TextStyle(color: Colors.tealAccent, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'kWh Used',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              const VerticalDivider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              const SizedBox(width: 30),
              CircleAvatar(
                backgroundColor: Colors.tealAccent[700],
                child: const Icon(Icons.attach_money, color: Colors.black87),
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '186',
                    style: TextStyle(color: Colors.tealAccent, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'USD Spent',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Energy Usage Card'),
        ),
        body: const Center(
          child: EnergyCard(),
        ),
      ),
    );
  }
}

class EnergyCard extends StatelessWidget {
  const EnergyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        color: Colors.black87,
        elevation: 8,
        shadowColor: Colors.teal.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:  Padding(
          padding: const EdgeInsets.only(left: 16, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 140.0),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black),
                ),
                  child: const Center(
                    child: Text(
                      '17 June, 2024',
                      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Energy Usage',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                       SizedBox(height: 7),
                      Text(
                        '142.6 kWh',
                        style: TextStyle(color: Colors.tealAccent, fontSize: 36, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Icon(Icons.flash_on, color: Colors.tealAccent, size: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/