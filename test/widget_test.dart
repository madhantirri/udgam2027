// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:udgam_2027/main.dart';

void main() {
  testWidgets('solid header shows all navigation and second edition', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const UdgamApp());

    expect(find.text('Udgam'), findsOneWidget);
    expect(find.text('IAC'), findsOneWidget);
    expect(find.text(' 2027'), findsOneWidget);
    expect(find.text('2ND EDITION'), findsOneWidget);
    for (final label in ['Home', 'Schedule', 'Events', 'Speakers', 'Team Udgam', 'FAQs', 'Contact']) {
      expect(find.text(label), findsAtLeastNWidgets(1));
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('schedule navigation slides to announcement page', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const UdgamApp());
    await tester.tap(find.text('Schedule').first);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 550));

    expect(find.text('Programme announcements\ncoming soon.'), findsOneWidget);
    expect(find.text('VIEW UDGAM IAC 2026 HIGHLIGHTS'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('mobile navigation slides to Team Udgam page', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const UdgamApp());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Schedule'), findsAtLeastNWidgets(1));
    expect(tester.takeException(), isNull);
    await tester.drag(find.byType(SingleChildScrollView).first, const Offset(-230, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Team Udgam'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 550));
    expect(find.text('Team Udgam details will be announced soon.'), findsOneWidget);
    expect(find.text('CHECK UDGAM IAC 2026 HIGHLIGHTS'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping active Home returns the landing page to its hero', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const UdgamApp());
    await tester.drag(find.byType(SingleChildScrollView).first, const Offset(0, -1800));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home').first);
    await tester.pumpAndSettle();

    expect(find.text('UDGAMIAC'), findsOneWidget);
    expect(find.text('FLAGSHIP EVENT BY CDC, IITRAM  /  2ND EDITION'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
