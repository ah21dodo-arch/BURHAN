import 'package:flutter/material.dart';

void main() {
  runApp(const BurhanApp());
}

const Color navy = Color(0xFF07111F);
const Color panel = Color(0xFF101F32);
const Color gold = Color(0xFFE9B95E);
const Color teal = Color(0xFF29D6C5);
const Color muted = Color(0xFF93A6BB);

class BurhanApp extends StatelessWidget {
  const BurhanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BURHAN | بُرهان',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        fontFamily: 'sans-serif',
        colorScheme: const ColorScheme.dark(
          primary: gold,
          secondary: teal,
          surface: panel,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _header(),
                    const SizedBox(height: 28),
                    _deviceCard(),
                    const SizedBox(height: 22),
                    _scanCard(context),
                    const SizedBox(height: 28),
                    _sectionTitle('التشخيص', 'كل مكونات جهازك'),
                    const SizedBox(height: 14),
                    _diagnosticGrid(),
                    const SizedBox(height: 28),
                    _sectionTitle('أدوات بُرهان', 'متابعة وفهم حالة الجهاز'),
                    const SizedBox(height: 14),
                    _toolTile(
                      Icons.sensors_rounded,
                      'المستشعرات',
                      'قراءات المستشعرات المتاحة',
                      teal,
                    ),
                    _toolTile(
                      Icons.battery_charging_full_rounded,
                      'البطارية والطاقة',
                      'الشحن والحرارة والقراءات المتاحة',
                      gold,
                    ),
                    _toolTile(
                      Icons.security_rounded,
                      'النظام والأمان',
                      'معلومات النظام وحالة Shizuku',
                      const Color(0xFF8DABFF),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'BURHAN  •  الدليل، الحجة، الإثبات',
                        style: TextStyle(
                          color: muted,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [gold, Color(0xFF9C712E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(
            Icons.verified_rounded,
            color: navy,
            size: 29,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BURHAN',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'بُرهان · تشخيص الجهاز',
                style: TextStyle(color: muted, fontSize: 12),
              ),
            ],
          ),
        ),
        _iconButton(Icons.notifications_none_rounded),
        const SizedBox(width: 8),
        _iconButton(Icons.settings_outlined),
      ],
    );
  }

  Widget _deviceCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        gradient: const LinearGradient(
          colors: [Color(0xFF172B43), Color(0xFF0D192A)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFF203D59),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.smartphone_rounded,
              size: 37,
              color: teal,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Galaxy S25',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'SM-S9318 • Android 15',
                  style: TextStyle(color: muted, fontSize: 11),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.circle, color: teal, size: 8),
                    SizedBox(width: 6),
                    Text(
                      'متصل وجاهز للفحص',
                      style: TextStyle(color: teal, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded, color: muted),
        ],
      ),
    );
  }

  Widget _scanCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [Color(0xFF183A4A), Color(0xFF102438), navy],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(color: teal.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الفحص الشامل',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'فحص جميع المكونات المتاحة دفعة واحدة',
                      style: TextStyle(color: muted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: teal.withOpacity(0.09),
                  border: Border.all(color: teal.withOpacity(0.5)),
                ),
                child: const Icon(
                  Icons.radar_rounded,
                  size: 36,
                  color: teal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 53,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScanPage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text(
                'ابدأ الفحص الشامل',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: gold,
                foregroundColor: const Color(0xFF17130A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(color: muted, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _diagnosticGrid() {
    final items = [
      _DiagnosticItem('معلومات الجهاز', Icons.phone_android_rounded, teal),
      _DiagnosticItem('المعالج والأداء', Icons.memory_rounded, gold),
      _DiagnosticItem('الشاشة واللمس', Icons.touch_app_rounded, const Color(0xFF8DABFF)),
      _DiagnosticItem('الكاميرات', Icons.camera_alt_rounded, const Color(0xFFCB9AFF)),
      _DiagnosticItem('الصوت والاهتزاز', Icons.graphic_eq_rounded, teal),
      _DiagnosticItem('الشبكات والاتصال', Icons.wifi_rounded, gold),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: panel,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.06)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(item.icon, color: item.color, size: 25),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Text('فتح الوحدة', style: TextStyle(color: muted, fontSize: 10)),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_back_rounded, color: muted, size: 13),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _toolTile(IconData icon, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(subtitle, style: const TextStyle(color: muted, fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.chevron_left_rounded, color: muted),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Icon(icon, color: Colors.white70, size: 21),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
      decoration: BoxDecoration(
        color: const Color(0xFF091523),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.06))),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(Icons.grid_view_rounded, 'الرئيسية', true),
          _NavItem(Icons.fact_check_outlined, 'الفحوصات', false),
          _NavItem(Icons.history_rounded, 'السجل', false),
          _NavItem(Icons.settings_outlined, 'الإعدادات', false),
        ],
      ),
    );
  }
}

class _DiagnosticItem {
  final String title;
  final IconData icon;
  final Color color;
  const _DiagnosticItem(this.title, this.icon, this.color);
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavItem(this.icon, this.label, this.selected);

  @override
  Widget build(BuildContext context) {
    final color = selected ? gold : muted;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 23),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الفحص الشامل'),
          backgroundColor: navy,
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.radar_rounded, color: teal, size: 58),
              SizedBox(height: 20),
              Text(
                'جاري فحص جميع المكونات المتاحة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'يقوم محرك التشخيص الآن باختبار الأداء والمعالج والمستشعرات...',
                style: TextStyle(color: muted, height: 1.7),
              ),
              SizedBox(height: 24),
              LinearProgressIndicator(
                value: 0.68,
                color: teal,
                backgroundColor: panel,
              ),
              SizedBox(height: 12),
              Text(
                '68% جار الفحص (12/18)',
                style: TextStyle(color: teal, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
