import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'glass_panel.dart';
import 'scroll_reveal.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({
    super.key,
    required this.onContact,
    required this.onPreviousHighlights,
    this.sectionKey,
  });

  final VoidCallback onContact;
  final VoidCallback onPreviousHighlights;
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    const destinations = [
      (title: 'Schedule', subtitle: 'Two-day programme details', icon: Icons.calendar_month_outlined),
      (title: 'For Students', subtitle: 'Benefits and opportunities', icon: Icons.school_outlined),
      (title: 'For Companies', subtitle: 'Partnership opportunities', icon: Icons.business_outlined),
      (title: 'Pitch Your Idea', subtitle: 'Innovation competition', icon: Icons.lightbulb_outline),
      (title: 'FAQs', subtitle: 'Answers to common questions', icon: Icons.quiz_outlined),
      (title: 'Contact Us', subtitle: 'Get in touch with CDC', icon: Icons.mail_outline),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 700;
        final horizontalPadding = compact ? 22.0 : 56.0;
        return Container(
          key: sectionKey,
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: compact ? 64 : 96,
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
                  padding: EdgeInsets.all(compact ? 22 : 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NAVIGATE',
                        style: TextStyle(
                          color: Color(0xFF51A8B1),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Explore the conclave',
                        style: TextStyle(
                          fontSize: compact ? 34 : 48,
                          fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Find programme information, participation opportunities, and ways to work with us.',
                        style: TextStyle(color: Colors.black, height: 1.6, fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      LayoutBuilder(
                        builder: (context, gridConstraints) {
                          final columns = gridConstraints.maxWidth >= 900
                              ? 3
                              : gridConstraints.maxWidth >= 560
                                  ? 2
                                  : 1;
                          final cardWidth =
                              (gridConstraints.maxWidth - (columns - 1) * 14) / columns;
                          return Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            children: [
                              for (var i = 0; i < destinations.length; i++)
                                SizedBox(
                                  width: cardWidth,
                                  child: _DestinationButton(
                                    destination: destinations[i],
                                    onPressed: destinations[i].title == 'Contact Us'
                                        ? onContact
                                        : () => showDialog<void>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(destinations[i].title),
                                                content: const Text(
                                                  'Information for UDGAMIAC 2027 will be announced by the Career Development Centre, IITRAM.',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context),
                                                    child: const Text('Close'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 56),
                      const Divider(color: Color(0xFF51A8B1)),
                      const SizedBox(height: 36),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 20,
                        spacing: 30,
                        children: [
                          SizedBox(
                            width: compact ? constraints.maxWidth - 48 : 620,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PARTNER WITH UDGAMIAC',
                                  style: TextStyle(
                                    color: Color(0xFF51A8B1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Put your organisation in the conversation.',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Connect with emerging talent, academic leaders, and industry innovators.',
                                  style: TextStyle(color: Colors.black, height: 1.5),
                                ),
                              ],
                            ),
                          ),
                          FilledButton.icon(
                            onPressed: onContact,
                            icon: const Icon(Icons.arrow_forward, size: 18),
                            label: Text(
                              compact ? 'SPONSORSHIP ENQUIRY' : 'ENQUIRE ABOUT PARTNERSHIP',
                            ),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: onPreviousHighlights,
                            icon: const Icon(Icons.open_in_new, size: 16),
                            label: const Text('UDGAM IAC 2026 HIGHLIGHTS'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF51A8B1),
                              side: BorderSide(
                                color: const Color(0xFF51A8B1).withValues(alpha: 0.7),
                              ),
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
        );
      },
    );
  }
}

class _DestinationButton extends StatefulWidget {
  const _DestinationButton({required this.destination, required this.onPressed});

  final ({String title, String subtitle, IconData icon}) destination;
  final VoidCallback onPressed;

  @override
  State<_DestinationButton> createState() => _DestinationButtonState();
}

class _DestinationButtonState extends State<_DestinationButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF51A8B1).withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: GlassPanel(
          padding: EdgeInsets.zero,
          borderRadius: 14,
          tintColor: _isHovered ? Colors.white : Colors.white.withValues(alpha: 0.9),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Icon(widget.destination.icon, color: const Color(0xFF51A8B1), size: 24),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.destination.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.destination.subtitle,
                            style: const TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward,
                      size: 16,
                      color: _isHovered ? const Color(0xFF51A8B1) : const Color(0xFF51A8B1).withValues(alpha: 0.7),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}