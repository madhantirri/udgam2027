import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'glass_panel.dart';
import 'scroll_reveal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, this.sectionKey});

  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 760;
        final horizontalPadding = isCompact ? 22.0 : 56.0;
        final story = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ABOUT THE EVENT',
              style: TextStyle(
                color: Color(0xFF51A8B1),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Industry meets the next generation.',
              style: TextStyle(
                fontSize: isCompact ? 34 : 44,
                fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                fontWeight: FontWeight.w400,
                height: 1.12,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'UDGAM IAC is the flagship Industry–Academia Conclave by the Career Development Centre (CDC), IITRAM. It creates meaningful connections between students, academia, and industry.',
              style: TextStyle(fontSize: 17, color: Colors.black, height: 1.65),
            ),
            const SizedBox(height: 18),
            const Text(
              'The conclave bridges classroom learning and industry practice through innovation, entrepreneurship, employability, and cross-sector collaboration.',
              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.65),
            ),
          ],
        );

        return Container(
          key: sectionKey,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: isCompact ? 64 : 104,
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
                  padding: EdgeInsets.all(isCompact ? 22 : 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      story,
                      SizedBox(height: isCompact ? 40 : 56),
                      const Text(
                        'CORE OBJECTIVES',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF51A8B1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      for (final objective in const [
                        ('01', 'Facilitate industry exposure through keynotes and panel discussions.'),
                        ('02', 'Connect students with industry leaders, HRs, and startup founders.'),
                        ('03', 'Encourage student innovation through idea pitches and project showcases.'),
                        ('04', 'Enable collaboration with GIFT City, MSME, iCreate, and more.'),
                      ])
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                objective.$1,
                                style: const TextStyle(
                                  color: Color(0xFF51A8B1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child: Text(
                                  objective.$2,
                                  style: const TextStyle(color: Colors.black, height: 1.5),
                                ),
                              ),
                            ],
                          ),
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
}

