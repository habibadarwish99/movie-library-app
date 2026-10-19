// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:movie_library_app/main.dart';

void main() {
  testWidgets('Movie library opens with movie cards', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MovieLibraryApp());

    expect(find.text('Movie Library'), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('20 views'), findsWidgets);
  });
}
