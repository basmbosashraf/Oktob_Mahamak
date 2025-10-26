import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const StatisticsScreen({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    final int pendingTasks = totalTasks - completedTasks;
    final double completedPercentage =
        totalTasks == 0 ? 0 : (completedTasks / totalTasks) * 100;

    // القيم دي بتتغير حسب حجم الشاشة
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
    final double titleFont = isTablet ? 28 : 24;
    final double bodyFont = isTablet ? 20 : 16;
    final double padding = isTablet ? 24 : 16;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إحصائيات المهام',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isTablet ? 22 : 18,
          ),
        ),
        backgroundColor: const Color(0xFFFFB6C1),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(isTablet ? 24 : 20),
                    child: Column(
                      children: [
                        Text(
                          'إجمالي المهام: $totalTasks',
                          style: TextStyle(
                            fontSize: titleFont,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4A4E69),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Text(
                          'المهام المكتملة: $completedTasks',
                          style: TextStyle(
                            fontSize: bodyFont,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Text(
                          'المهام المتبقية: $pendingTasks',
                          style: TextStyle(
                            fontSize: bodyFont,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        LinearProgressIndicator(
                          value:
                              totalTasks == 0 ? 0 : completedTasks / totalTasks,
                          backgroundColor: Colors.grey[300],
                          color: const Color(0xFFFFB6C1),
                          minHeight: isTablet ? 16 : 12,
                        ),
                        SizedBox(height: size.height * 0.015),
                        Text(
                          'تم إكمال ${completedPercentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: bodyFont,
                            color: const Color(0xFF4A4E69),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(
                    'عودة للمهام',
                    style: TextStyle(fontSize: bodyFont),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB6C1),
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 30 : 20,
                      vertical: isTablet ? 16 : 12,
                    ),
                    textStyle: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
