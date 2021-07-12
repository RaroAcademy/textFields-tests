import 'package:aula_textfield2/main.dart';
import 'package:aula_textfield2/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage should have title "Cadastro Academy"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("Cadastro Academy"), findsOneWidget);
  });

  testWidgets('HomePage should have Nome', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.widgetWithText(CustomTextField, 'Nome'), findsOneWidget);
  });

  testWidgets('HomePage should have password and confirm passowrd', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.widgetWithText(CustomTextField, 'Senha'), findsNWidgets(2));
  });

  testWidgets('HomePage should have password and confirm password', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.widgetWithText(CustomTextField, 'Senha'), findsNWidgets(2));
  });

  testWidgets('HomePage should have raro logo', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Key('raroLogo')), findsNWidgets(1));
  });

  testWidgets('HomePage should have e-mail field', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // final scroll = find.byType(SingleChildScrollView);
    // scroll.childCount();

    expect(find.textContaining('mail'), findsOneWidget);
  });

  testWidgets('Example widget with params', (WidgetTester tester) async {
    // await tester.pumpWidget(MyApp());
    // validateForm() {
    //   faz alguma coisa
    // }

    // await tester.pumpWidget(CustomFormWidget(validate: validateForm, title: 'Teste'));
  });

  testWidgets('Should not submit form with empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.dragUntilVisible(
      find.text('Criar conta'),
      find.byType(SingleChildScrollView),
      const Offset(0, 500.0)
    );

    final criarContaButton = find.text('Criar conta');

    await tester.tap(criarContaButton);
    await tester.pumpAndSettle();

    expect(find.byKey(Key('formErrorDialog')), findsNothing);    
  });
}