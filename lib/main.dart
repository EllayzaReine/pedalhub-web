import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PedalHubApp());
}

class PedalHubApp extends StatelessWidget {
  const PedalHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PedalHub — Smart Bike Sharing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A6B3C)),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context),
            _buildWhatIsPedalHub(),
            _buildGuideSection(),
            _buildDownloadSection(context),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A6B3C), Color(0xFF2D9E5F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Logo / Icon
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(Icons.pedal_bike, color: Colors.white, size: 52),
          ),
          const SizedBox(height: 24),
          const Text(
            'PedalHub',
            style: TextStyle(
              color: Colors.white,
              fontSize: 52,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Smart Bike Sharing for University Students & Staff',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 36),
          ElevatedButton.icon(
            onPressed: () => _launchUrl(
              'https://drive.google.com/uc?export=download&id=1QSh1dgWetM8uCn_HY8Qr9VCMUEtfPA2b',
            ),
            icon: const Icon(Icons.download_rounded, size: 20),
            label: const Text(
              'Download App (APK)',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1A6B3C),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatIsPedalHub() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: Colors.white,
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
                  color: Color(0xFF1A1A1A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PedalHub is a smart bike-sharing mobile application designed for university students and staff. It allows users to borrow bicycles, apply for long-term bike loans, submit reports, and access secure authentication features for a convenient and sustainable campus transportation system.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF555555),
                  height: 1.75,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  _featureChip(Icons.directions_bike, 'Bike Borrowing'),
                  const SizedBox(width: 12),
                  _featureChip(Icons.face, 'Face Auth'),
                  const SizedBox(width: 12),
                  _featureChip(Icons.report, 'Reports'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuideSection() {
    final sections = [
      _GuideSection(
        icon: Icons.login_rounded,
        title: 'Getting Started — First Time Login',
        color: const Color(0xFF1A6B3C),
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
        color: const Color(0xFF2563EB),
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
        color: const Color(0xFFD97706),
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
      color: const Color(0xFFF5F7F2),
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
                  color: Color(0xFF1A1A1A),
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
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: section.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(section.icon, color: section.color, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...section.steps.asMap().entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    margin: const EdgeInsets.only(right: 12, top: 1),
                    decoration: BoxDecoration(
                      color: section.color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${e.key + 1}',
                        style: const TextStyle(
                          color: Colors.white,
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
                        color: Color(0xFF444444),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: const Color(0xFF1A6B3C),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.phone_android, color: Colors.white70, size: 40),
            const SizedBox(height: 16),
            const Text(
              'Ready to ride?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Download the PedalHub app and get started today.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('YOUR_APK_LINK_HERE'),
              icon: const Icon(Icons.download_rounded),
              label: const Text(
                'Download APK',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1A6B3C),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      color: const Color(0xFF111111),
      child: const Center(
        child: Text(
          '© 2025 PedalHub. All rights reserved.',
          style: TextStyle(color: Colors.white38, fontSize: 13),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF1A6B3C),
        fontWeight: FontWeight.w700,
        fontSize: 12,
        letterSpacing: 2,
      ),
    );
  }

  Widget _featureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7F3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFB8DFC8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF1A6B3C)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF1A6B3C),
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

class _GuideSection {
  final IconData icon;
  final String title;
  final Color color;
  final List<String> steps;
  const _GuideSection({
    required this.icon,
    required this.title,
    required this.color,
    required this.steps,
  });
}
