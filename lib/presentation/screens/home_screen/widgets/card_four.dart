import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardFour extends StatefulWidget {
  const CardFour({super.key});

  @override
  State<CardFour> createState() => _CardFourState();
}

int touchedIndex = -1;

class _CardFourState extends State<CardFour> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.26,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF171616),
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 0.8,
            ),
          ),
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, response) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        response?.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        response!.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              // 👈 thinner pie
              sections: showingSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 44.0 : 38.0;

      return PieChartSectionData(
        value: [40, 30, 15, 15][i].toDouble(),
        title: '${[40, 30, 15, 15][i]}%',
        radius: radius,
        color: _palette[i],
        titleStyle: TextStyle(
          fontSize: isTouched ? 14 : 12,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.85),
        ),
      );
    });
  }

  final List<Color> _palette = const [
    Color(0xFF33c67c), // Soft Blue
    Color(0xFF6c5dd3), // Amber Gold
    Color(0xFFff754c), // Muted Purple
    Color(0xFF03a9f4), // Premium Green
  ];
}
