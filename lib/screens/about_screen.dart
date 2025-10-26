import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchPrivacyPolicy(BuildContext context) async {
    final Uri url = Uri.parse(
      'https://docs.google.com/document/d/e/2PACX-1vQQkRmstLyoqKnelEZNFERBnmrJD9Nio9lkqbuK94p-U282E_SULV6Mtd7cM24BzMnfOCV-Oq5f8mHu/pub',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرابط لا يمكن فتحه حالياً')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // القيم دي بتتغير حسب حجم الشاشة
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final titleFontSize = isTablet ? 26.0 : 22.0;
    final bodyFontSize = isTablet ? 20.0 : 16.0;
    final padding = isTablet ? 24.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'حول التطبيق',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFFB6C1),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ':عن التطبيق',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A4E69),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'تطبيق "اكتب مهامك 2026" يساعدك على تنظيم يومك بطريقة بسيطة وسريعة.\n'
                  'أضف مهامك اليومية، احذفها بعد الانتهاء منها، واستمتع بواجهة عربية سهلة الاستخدام.',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: bodyFontSize),
                ),
                SizedBox(height: size.height * 0.04),
                Text(
                  ':سياسة الخصوصية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A4E69),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'نحن نهتم بخصوصيتك! لا يتم جمع أي بيانات شخصية من المستخدمين.\n'
                  'جميع المهام التي تضيفها محفوظة على جهازك فقط ولا يتم إرسالها إلى أي خادم أو جهة خارجية.',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: bodyFontSize),
                ),
                SizedBox(height: size.height * 0.02),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => _launchPrivacyPolicy(context),
                    icon: const Icon(Icons.link, color: Color(0xFF4A4E69)),
                    label: Text(
                      'عرض سياسة الخصوصية الكاملة',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: const Color(0xFF4A4E69),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.06),
                Center(
                  child: Text(
                    '© 2026 جميع الحقوق محفوظة',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: isTablet ? 16 : 14,
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
