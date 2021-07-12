import 'package:aula_textfield2/main.dart';
import 'package:aula_textfield2/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Send form', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final nomeField = find.widgetWithText(CustomTextField, 'Nome');
    final telefoneField = find.widgetWithText(CustomTextField, 'Telefone');
    final dataNascimentoField = find.widgetWithText(CustomTextField, 'Data de Nascimento');
    final emailField = find.widgetWithText(CustomTextField, 'E-mail');
    final cpfField = find.widgetWithText(CustomTextField, 'CPF');

    await tester.enterText(nomeField, "Iury Oliveira");
    await tester.pumpAndSettle();
    await tester.enterText(telefoneField, "31975646909");
    await tester.pumpAndSettle();
    await tester.enterText(dataNascimentoField, "01/01/1980");
    await tester.pumpAndSettle();
    await tester.enterText(emailField, "user@rarolabs.com.br");
    await tester.pumpAndSettle();
    await tester.enterText(cpfField, "12791835601");
    await tester.pumpAndSettle();

    await tester.dragUntilVisible(
      find.text('Criar conta'),
      find.byType(SingleChildScrollView),
      const Offset(0, 500.0)
    );
    await tester.pumpAndSettle();

    final passwordField = find.widgetWithText(CustomTextField, 'Senha');
    final confirmPasswordFIeld = find.byKey(Key('confirmPassword'));

    await tester.enterText(passwordField, "abc123@");
    await tester.enterText(confirmPasswordFIeld, "abc123@");

    await tester.pumpAndSettle();

    expect(find.text('Tudo certo por aqui'), findsOneWidget);
  });
}