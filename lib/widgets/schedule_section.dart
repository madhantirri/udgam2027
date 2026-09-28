import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'glass_panel.dart';
import 'scroll_reveal.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({
    super.key,
    this.sectionKey,
    required this.onPreviousHighlights,
  });

  final Key? sectionKey;
  final VoidCallback onPreviousHighlights;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 700;
        final horizontalPadding = compact ? 22.0 : 56.0;
        return Container(
          key: sectionKey,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: compact ? 64 : 96,
            horizontal: horizontalPadding,
          ),
          color: Colors.white,
          child: Center(
            child: SizedBox(
              width: (constraints.maxWidth - horizontalPadding * 2)
                  .clamp(0.0, 1160.0)
                  .toDouble(),
              child: ScrollReveal(
                duration: const Duration(milliseconds: 700),
                slideOffset: const Offset(0, 32),
                child: GlassPanel(
                  padding: EdgeInsets.all(compact ? 24 : 42),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'UDGAM IAC 2027  /  SECOND EDITION',
                        style: TextStyle(
                          color: Color(0xFF51A8B1),
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Programme announcements\ncoming soon.',
                        style: TextStyle(
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontSize: compact ? 32 : 48,
                          height: 1.12,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'The 2027 schedule, events, and speakers will be shared by the Career Development Centre, IITRAM.',
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.6,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: onPreviousHighlights,
                        icon: const Icon(Icons.open_in_new, size: 17),
                        label: const Text('VIEW UDGAM IAC 2026 HIGHLIGHTS'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF51A8B1),
                          side: BorderSide(
                            color: const Color(0xFF51A8B1).withValues(alpha: 0.72),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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

