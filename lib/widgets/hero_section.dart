import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'glass_panel.dart';
import 'scroll_reveal.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onExplore,
    required this.onPreviousHighlights,
  });

  final VoidCallback onExplore;
  final VoidCallback onPreviousHighlights;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 600;
    final horizontalPadding = isCompact ? 24.0 : 72.0;
    final panelWidth = (MediaQuery.sizeOf(context).width - horizontalPadding * 2)
      .clamp(260.0, 760.0)
      .toDouble();

    return SizedBox(
      width: double.infinity,
      height: (MediaQuery.sizeOf(context).height * 0.82)
          .clamp(600.0, 860.0)
          .toDouble(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'photos/iitram-bg.jpg',
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.22),
          ),
          ColoredBox(
            color: Colors.black.withValues(alpha: 0.1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 44),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: panelWidth,
                child: ScrollReveal(
                  duration: const Duration(milliseconds: 750),
                  slideOffset: const Offset(0, 28),
                  child: GlassPanel(
                    padding: EdgeInsets.all(isCompact ? 22 : 34),
                    borderRadius: 18,
                    tintColor: Colors.white.withValues(alpha: 0.86),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'FLAGSHIP EVENT BY CDC, IITRAM  /  2ND EDITION',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'UDGAM',
                              style: TextStyle(
                                fontSize: isCompact ? 52 : 96,
                                fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                                fontWeight: FontWeight.w400,
                                height: 0.95,
                                color: Colors.black,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, isCompact ? -10 : -18),
                              child: Text(
                                'IAC',
                                style: TextStyle(
                                  fontSize: isCompact ? 22 : 36,
                                  fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF51A8B1),
                                  height: 0.95,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Industry–Academia\nConclave 2027',
                          style: TextStyle(
                            fontSize: isCompact ? 23 : 32,
                            height: 1.25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'BRIDGING INNOVATION AND INDUSTRY',
                          style: TextStyle(fontSize: 12, color: Color(0xFF51A8B1)),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: [
                            FilledButton.icon(
                              onPressed: onExplore,
                              icon: const Icon(Icons.arrow_downward, size: 18),
                              label: const Text('ABOUT UDGAMIAC 2027'),
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFD2E28A),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
                                textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: onPreviousHighlights,
                              icon: const Icon(Icons.open_in_new, size: 16),
                              label: const Text('UDGAM 2026 HIGHLIGHTS'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                                side: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.4),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                                textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
