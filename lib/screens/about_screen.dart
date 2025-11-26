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
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final titleFontSize = isTablet ? 26.0 : 22.0;
    final bodyFontSize = isTablet ? 18.0 : 16.0;
    final padding = isTablet ? 24.0 : 16.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFB), 
      appBar: AppBar(
        title: const Text(
          'حول التطبيق',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFFB6C1),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.pinkAccent.withOpacity(0.3),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- كارت عن التطبيق ---
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              shadowColor: Colors.pinkAccent.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'عن التطبيق',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4A4E69),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.info_outline, color: Color(0xFF4A4E69)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'تطبيق "اكتب مهامك 2026" يساعدك على تنظيم يومك بطريقة بسيطة وسريعة.\n'
                      'أضف مهامك اليومية، احذفها بعد الانتهاء منها، واستمتع بواجهة عربية سهلة الاستخدام.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: bodyFontSize),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --- كارت سياسة الخصوصية ---
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              shadowColor: Colors.pinkAccent.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF4A4E69),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.privacy_tip_outlined, color: Color(0xFF4A4E69)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'نحن نهتم بخصوصيتك! لا يتم جمع أي بيانات شخصية من المستخدمين.\n'
                      'جميع المهام التي تضيفها محفوظة على جهازك فقط ولا يتم إرسالها إلى أي خادم أو جهة خارجية.',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: bodyFontSize),
                    ),
                    const SizedBox(height: 8),
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
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            Center(
              child: Column(
                children: [
                 // const Icon(Icons.favorite, color: Color(0xFFFFB6C1)),
                //  const SizedBox(height: 6),
                  Text(
                    '© 2026 جميع الحقوق محفوظة',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: isTablet ? 16 : 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
