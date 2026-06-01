import 'package:flutter_test/flutter_test.dart';
import 'package:washora_app/main.dart';

void main() {
  testWidgets('shows Washora login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const WashoraApp());

    expect(find.text('Welcome to Washora'), findsOneWidget);
    expect(find.text('Email or phone'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
