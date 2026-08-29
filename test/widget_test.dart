import 'package:flutter_test/flutter_test.dart';

import 'package:unidades_neonatais/main.dart';

void main() {
  testWidgets('App boots and shows the splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NeonatalApp());

    expect(find.text('Unidades Neonatais'), findsOneWidget);
    expect(find.text('Cuidando do início da vida'), findsOneWidget);

    // Let the splash screen's navigation timer complete so it doesn't leak
    // into the next test.
    await tester.pump(const Duration(milliseconds: 1600));
  });
}
