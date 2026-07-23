import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_report_system/app.dart';

void main() {
  testWidgets('App shell renders without crashing smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MedicalReportApp()));

    // Verify that the navigation rail or dashboard title exists.
    expect(find.text('Dashboard'), findsWidgets);
  });
}
