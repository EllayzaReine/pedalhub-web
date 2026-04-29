import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PedalHubApp());
}

// ── Theme ──────────────────────────────────────────────────────────────────
class AppTheme {
  static const Color darkColor = Color(0xFF090C02);
  static const Color redColor = Color(0xFFA72608);
  static const Color greenLightColor = Color(0xFFBBC5AA);
  static const Color creamColor = Color(0xFFDDE2C6);
  static const Color whiteColor = Color(0xFFFFFFFF);
}

// ── App ────────────────────────────────────────────────────────────────────
class PedalHubApp extends StatelessWidget {
  const PedalHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PedalHub — Smart Bike Sharing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppTheme.creamColor,
        colorScheme: const ColorScheme.light(
          primary: AppTheme.redColor,
          secondary: AppTheme.greenLightColor,
          surface: AppTheme.whiteColor,
          onPrimary: AppTheme.whiteColor,
          onSecondary: AppTheme.darkColor,
          onSurface: AppTheme.darkColor,
        ),
      ),
      home: const LandingPage(),
    );
  }
}

// ── Landing Page ───────────────────────────────────────────────────────────
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  // APK download link
  static const String _apkUrl =
      'https://drive.google.com/uc?export=download&id=1QSh1dgWetM8uCn_HY8Qr9VCMUEtfPA2b';

  // Questionnaire PDF link
  static const String _questionnaireUrl =
      'https://drive.google.com/uc?export=download&id=1aJO2IO4GPOXj9NLK6A80UNYi25Mivm8z';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(),
            _buildWhatIsPedalHub(),
            _buildGuideSection(),
            _buildQuestionnaireSection(),
            _buildDownloadSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // ── Hero ──────────────────────────────────────────────────────────────────
  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: AppTheme.darkColor,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppTheme.redColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.pedal_bike,
              color: AppTheme.whiteColor,
              size: 52,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'PedalHub',
            style: TextStyle(
              color: AppTheme.whiteColor,
              fontSize: 52,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Smart Bike Sharing for University Students & Staff',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.greenLightColor, fontSize: 18),
          ),
          const SizedBox(height: 36),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: AppTheme.redColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 36),
          ElevatedButton.icon(
            onPressed: () => _launchUrl(_apkUrl),
            icon: const Icon(Icons.download_rounded, size: 20),
            label: const Text(
              'Download App (APK)',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.redColor,
              foregroundColor: AppTheme.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  // ── About ─────────────────────────────────────────────────────────────────
  Widget _buildWhatIsPedalHub() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: AppTheme.whiteColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionLabel('ABOUT'),
              const SizedBox(height: 10),
              const Text(
                'What is PedalHub?',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkColor,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PedalHub is a smart bike-sharing mobile application designed for university students and staff. It allows users to borrow bicycles, apply for long-term bike loans, submit reports, and access secure authentication features for a convenient and sustainable campus transportation system.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3A3D33),
                  height: 1.75,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _featureChip(Icons.directions_bike, 'Bike Borrowing'),
                  _featureChip(Icons.face, 'Face Auth'),
                  _featureChip(Icons.report_rounded, 'Reports'),
                  _featureChip(Icons.lock_rounded, 'Secure Login'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Guide ─────────────────────────────────────────────────────────────────
  Widget _buildGuideSection() {
    final sections = [
      _GuideSection(
        icon: Icons.login_rounded,
        title: 'Getting Started — First Time Login',
        steps: [
          'Open the PedalHub mobile application.',
          'On the login screen, enter your SR-Code as both your username and default password.',
          'Upon successful login, you will be prompted to complete the initial account setup. Follow the on-screen instructions to configure your profile, including face registration for biometric authentication.',
          'Once setup is complete, you will be directed to the main dashboard.',
        ],
      ),
      _GuideSection(
        icon: Icons.calendar_month_rounded,
        title: 'Applying for a Long-Term (Semestral) Bike Loan',
        steps: [
          'From the main dashboard, navigate to the Borrowing section.',
          'Select Long-Term / Semestral as your borrowing type.',
          'Fill in the required information and submit your application.',
          'Wait for the approval notification from the designated university office.',
        ],
      ),
      _GuideSection(
        icon: Icons.flag_rounded,
        title: 'Submitting a Report',
        steps: [
          'From the main dashboard, navigate to the Report section.',
          'Select the type of report you wish to submit (e.g., damaged bike, missing bike, or incident report).',
          'Fill in the required details and attach any supporting photos if necessary.',
          'Tap Submit to send your report to the system administrator.',
          'You will receive a confirmation once your report has been successfully submitted.',
        ],
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.creamColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionLabel('GUIDE'),
              const SizedBox(height: 10),
              const Text(
                'How to Use PedalHub',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkColor,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 36),
              ...sections.map((s) => _buildGuideCard(s)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuideCard(_GuideSection section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.darkColor.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppTheme.darkColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.redColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    section.icon,
                    color: AppTheme.whiteColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    section.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: section.steps.asMap().entries.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        margin: const EdgeInsets.only(right: 14, top: 1),
                        decoration: BoxDecoration(
                          color: AppTheme.redColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '${e.key + 1}',
                            style: const TextStyle(
                              color: AppTheme.whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          e.value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF2A2D22),
                            height: 1.65,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ── Questionnaire ─────────────────────────────────────────────────────────
  Widget _buildQuestionnaireSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: AppTheme.whiteColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionLabel('EVALUATION'),
              const SizedBox(height: 10),
              const Text(
                'Help Us Improve PedalHub',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkColor,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'We value your honest feedback! Please download the evaluation questionnaire below, print it, answer all items carefully, affix your signature, and submit it to our team.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3A3D33),
                  height: 1.75,
                ),
              ),
              const SizedBox(height: 28),
              // Instruction steps
              _buildInstructionStep(
                Icons.download_rounded,
                'Download the questionnaire PDF.',
              ),
              _buildInstructionStep(
                Icons.print_rounded,
                'Print the questionnaire.',
              ),
              _buildInstructionStep(
                Icons.edit_rounded,
                'Answer all items carefully and honestly.',
              ),
              _buildInstructionStep(
                Icons.draw_rounded,
                'Affix your signature at the bottom of the form.',
              ),
              _buildInstructionStep(
                Icons.send_rounded,
                'Submit the accomplished form to our team.',
              ),
              const SizedBox(height: 32),
              // Download button
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.creamColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.greenLightColor),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppTheme.redColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.description_rounded,
                        color: AppTheme.whiteColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ISO/IEC 25010 Evaluation Form',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppTheme.darkColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'PedalHub Software Quality Questionnaire',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF5A5D52),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(_questionnaireUrl),
                      icon: const Icon(Icons.download_rounded, size: 16),
                      label: const Text(
                        'Download',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.redColor,
                        foregroundColor: AppTheme.whiteColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: AppTheme.creamColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.greenLightColor),
            ),
            child: Icon(icon, size: 18, color: AppTheme.redColor),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2A2D22),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Download ──────────────────────────────────────────────────────────────
  Widget _buildDownloadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: AppTheme.redColor,
      child: Center(
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppTheme.whiteColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone_android,
                color: AppTheme.whiteColor,
                size: 36,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ready to ride?',
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Download the PedalHub app and get started today.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.creamColor, fontSize: 16),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => _launchUrl(_apkUrl),
              icon: const Icon(Icons.download_rounded),
              label: const Text(
                'Download APK',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.whiteColor,
                foregroundColor: AppTheme.redColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Footer ────────────────────────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      color: AppTheme.darkColor,
      child: const Center(
        child: Text(
          '© 2025 PedalHub. All rights reserved.',
          style: TextStyle(color: AppTheme.greenLightColor, fontSize: 13),
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────
  Widget _sectionLabel(String text) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.redColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: AppTheme.redColor,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _featureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.creamColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.greenLightColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.redColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.darkColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

// ── Data Model ────────────────────────────────────────────────────────────
class _GuideSection {
  final IconData icon;
  final String title;
  final List<String> steps;

  const _GuideSection({
    required this.icon,
    required this.title,
    required this.steps,
  });
}
