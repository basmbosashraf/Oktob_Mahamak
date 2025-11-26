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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            // 🧾 كارت الإحصائيات
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
                      value: totalTasks == 0 ? 0 : completedTasks / totalTasks,
                      backgroundColor: Colors.grey[300],
                      color: const Color(0xFFFFB6C1),
                      minHeight: isTablet ? 16 : 12,
                    ),
                    SizedBox(height: size.height * 0.015),
                    Text(
                      'تم إكمال %${completedPercentage.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: bodyFont,
                        color: const Color(0xFF4A4E69),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04),

            Card(
              color: const Color(0xFFFFEEF4),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(isTablet ? 24 : 20),
                child: Column(
                  children: [
                   
                    Text(
                      'قال رسول الله ﷺ:',
                      style: TextStyle(
                        fontSize: bodyFont,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // ✅ Scroll داخلي للحديث فقط
                    SizedBox(
                      height: isTablet ? 200 : 180,
                      child: SingleChildScrollView(
                        child: Text(
                          '«الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنْ الْمُؤْمِنِ الضَّعِيفِ، وَفِي كُلٍّ خَيْرٌ، احْرِصْ عَلَى مَا يَنْفَعُكَ، وَاسْتَعِنْ بِاللَّهِ وَلَا تَعْجَزْ، وَإِنْ أَصَابَكَ شَيْءٌ فَلَا تَقُلْ: لَوْ أَنِّي فَعَلْتُ كَانَ كَذَا وَكَذَا، وَلَكِنْ قُلْ: قَدَرُ اللَّهِ وَمَا شَاءَ فَعَلَ، فَإِنَّ "لَوْ" تَفْتَحُ عَمَلَ الشَّيْطَانِ»',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isTablet ? 20 : 16,
                            height: 1.8,
                            color: const Color(0xFF4A4E69),
                            fontFamily: 'NotoNaskhArabic',
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                      'رواه مسلم (2664)',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: isTablet ? 16 : 13,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
