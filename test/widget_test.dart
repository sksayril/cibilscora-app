import 'package:flutter_test/flutter_test.dart';
import 'package:cibilscora_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CibilScoreApp());
    expect(find.text('CIBIL'), findsOneWidget);
  });
}
