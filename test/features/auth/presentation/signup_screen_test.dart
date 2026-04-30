import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ev_charging_finder/features/auth/presentation/signup_screen.dart';
import 'package:ev_charging_finder/features/auth/presentation/widgets/auth_text_field.dart';

void main() {
  testWidgets('should_containPasswordField', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SignupScreen(),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is AuthTextField && widget.label == 'Password',
      ),
      findsOneWidget,
    );
  });
}
