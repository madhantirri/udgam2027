import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/about_section.dart';
import 'widgets/explore_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/schedule_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _highlightsUrl = 'https://udgam-iac.iitram.in/event-highlights';
  static const _navigation = [
    'Home',
    'Schedule',
    'Events',
    'Speakers',
    'Team Udgam',
    'FAQs',
    'Contact',
  ];

  final _homeScrollController = ScrollController();
  int _activePage = 0;

  @override
  void dispose() {
    _homeScrollController.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    if (index == _activePage) {
      if (index == 0 && _homeScrollController.hasClients) {
        _homeScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
        );
      }
      return;
    }
    setState(() {
      _activePage = index;
    });
  }

  Future<void> _openPreviousHighlights() async {
    await launchUrl(
      Uri.parse(_highlightsUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  Widget _announcedPage(String title) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 700;
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            color: Colors.white,
            padding: EdgeInsets.all(compact ? 22 : 56),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(compact ? 24 : 44),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF51A8B1), width: 2),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'UDGAMIAC 2027  /  2ND EDITION',
                        style: TextStyle(
                          color: Color(0xFF51A8B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        '$title details will be announced soon.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: compact ? 30 : 46,
                          height: 1.12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Please check back for updates from the Career Development Centre, IITRAM.',
                        style: TextStyle(color: Colors.black, height: 1.6, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: _openPreviousHighlights,
                        icon: const Icon(Icons.open_in_new, size: 17),
                        label: const Text('CHECK UDGAM IAC 2026 HIGHLIGHTS'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: BorderSide(color: const Color(0xFF51A8B1).withValues(alpha: 0.78)),
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

  Widget _homePage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _homeScrollController,
          child: Column(
            children: [
              HeroSection(
                onExplore: () => _selectPage(1),
                onPreviousHighlights: _openPreviousHighlights,
              ),
              const AboutSection(),
              ScheduleSection(onPreviousHighlights: _openPreviousHighlights),
              ExploreSection(
                onContact: () => _selectPage(6),
                onPreviousHighlights: _openPreviousHighlights,
              ),
              FooterSection(
                onAbout: () => _selectPage(0),
                onEvents: () => _selectPage(2),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrentPage(int index) {
    switch (index) {
      case 0:
        return _homePage();
      case 1:
        return SingleChildScrollView(
          child: ScheduleSection(onPreviousHighlights: _openPreviousHighlights),
        );
      case 2:
        return _announcedPage('Events');
      case 3:
        return _announcedPage('Speakers');
      case 4:
        return _announcedPage('Team Udgam');
      case 5:
        return _announcedPage('FAQs');
      case 6:
        return SingleChildScrollView(
          child: FooterSection(
            onAbout: () => _selectPage(0),
            onEvents: () => _selectPage(2),
          ),
        );
      default:
        return _homePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 900;
    final veryCompact = width < 430;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 78,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: compact ? 12 : 32),
            child: Row(
              children: [
                InkWell(
                  onTap: () => _selectPage(0),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'photos/udgam_logo.png',
                        width: veryCompact ? 32 : compact ? 38 : 46,
                        height: veryCompact ? 32 : compact ? 38 : 46,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: veryCompact ? 8 : 12),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'udgam',
                                style: TextStyle(
                                  color: const Color(0xFF51A8B1),
                                  fontSize: veryCompact ? 18 : compact ? 22 : 26,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.4,
                                  height: 1.0,
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(0, veryCompact ? -5 : compact ? -7 : -8),
                                child: Text(
                                  'IAC',
                                  style: TextStyle(
                                    color: const Color(0xFF51A8B1),
                                    fontSize: veryCompact ? 8 : compact ? 10 : 12,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.2,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                              Text(
                                '2027',
                                style: TextStyle(
                                  color: const Color(0xFF51A8B1),
                                  fontSize: veryCompact ? 18 : compact ? 22 : 26,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.4,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: veryCompact ? 3 : 4),
                          Text(
                            'CDC-IITRAM • 2ND EDITION',
                            style: TextStyle(
                              color: const Color(0xFF51A8B1),
                              fontSize: veryCompact ? 7.5 : compact ? 9 : 10.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.4,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: veryCompact ? 32 : compact ? 38 : 46,
                  height: veryCompact ? 32 : compact ? 38 : 46,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset('photos/iitram_logo.png', fit: BoxFit.contain),
                ),
              ],
            ),
          ),
          Container(
            height: 54,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: width >= 900 ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  for (var index = 0; index < _navigation.length; index++)
                    TextButton(
                      onPressed: () => _selectPage(index),
                      style: TextButton.styleFrom(
                        foregroundColor: _activePage == index
                            ? const Color(0xFFD2E28A)
                            : Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: compact ? 14 : 20),
                        minimumSize: const Size(0, 50),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _navigation[index],
                            style: TextStyle(
                              fontSize: compact ? 12 : 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            height: 2,
                            width: _activePage == index ? 22 : 0,
                            color: const Color(0xFFD2E28A),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 320),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    ...previousChildren,
                    ?currentChild,
                  ],
                );
              },
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.02),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: KeyedSubtree(
                key: ValueKey<int>(_activePage),
                child: _buildCurrentPage(_activePage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
