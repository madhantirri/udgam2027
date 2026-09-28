import 'package:flutter/material.dart';

import 'glass_panel.dart';
import 'scroll_reveal.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.onAbout,
    required this.onEvents,
    this.sectionKey,
  });

  final VoidCallback onAbout;
  final VoidCallback onEvents;
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 700;
        final horizontalPadding = isCompact ? 22.0 : 56.0;
        final brand = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 10,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.all(3),
                  color: const Color(0xFFD2E28A),
                  child: Image.asset('photos/udgam_logo.png', fit: BoxFit.contain),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'udgam',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF51A8B1),
                        letterSpacing: -0.4,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: const Text(
                        'IAC',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF51A8B1),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const Text(
                      '2027',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF51A8B1),
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Industry–Academia Conclave\nCareer Development Centre, IITRAM',
              style: TextStyle(color: Colors.white, height: 1.55),
            ),
          ],
        );
        final explore = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            _buildFooterLink('About UDGAMIAC', onAbout),
            _buildFooterLink('Events', onEvents),
          ],
        );
        final festival = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('IITRAM CONTACT', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('(079) 67775488 / 99', style: TextStyle(color: Colors.white)),
            SizedBox(height: 8),
            Text('office@iitram.ac.in', style: TextStyle(color: Colors.white)),
            SizedBox(height: 8),
            Text('www.iitram.ac.in', style: TextStyle(color: Colors.white)),
          ],
        );

        return Container(
          key: sectionKey,
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.symmetric(
            vertical: 52,
            horizontal: horizontalPadding,
          ),
          child: Center(
            child: SizedBox(
              width: (constraints.maxWidth - horizontalPadding * 2)
                  .clamp(0.0, 1200.0)
                  .toDouble(),
              child: ScrollReveal(
                duration: const Duration(milliseconds: 700),
                slideOffset: const Offset(0, 32),
                child: GlassPanel(
                  padding: EdgeInsets.all(isCompact ? 22 : 36),
                  tintColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isCompact)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            brand,
                            const SizedBox(height: 32),
                            explore,
                            const SizedBox(height: 28),
                            festival,
                          ],
                        )
                      else
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: brand),
                            const SizedBox(width: 48),
                            Expanded(child: explore),
                            const SizedBox(width: 48),
                            Expanded(child: festival),
                          ],
                        ),
                      const SizedBox(height: 40),
                      Divider(color: const Color(0xFFD2E28A).withValues(alpha: 0.56)),
                      const SizedBox(height: 20),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined, size: 18, color: Color(0xFFD2E28A)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Institute of Infrastructure, Technology, Research And Management (IITRAM), Near Khokhara Circle, Maninagar (East), Ahmedabad, Gujarat 380026',
                              style: TextStyle(color: Colors.white, fontSize: 13, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        '© 2027 Career Development Centre (CDC), IITRAM — Industry–Academia Conclave',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooterLink(String text, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
              foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 36),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(text),
      ),
    );
  }
}
