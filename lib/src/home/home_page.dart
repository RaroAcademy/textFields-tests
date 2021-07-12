import 'package:aula_textfield2/src/shared/validators/text_validator.dart';
import 'package:aula_textfield2/src/shared/widgets/shared_widgets.dart';
import 'package:aula_textfield2/src/shared/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  MaskedTextController _phoneController =
      MaskedTextController(mask: "(00)00000-0000");
  MaskedTextController _bornDateController =
      MaskedTextController(mask: "00/00/0000");
  TextEditingController _emailController = TextEditingController();
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");
  FocusNode _cpfFocusNode = FocusNode();

  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bornDateController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _cpfFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro Academy",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: .0),
                Image.asset(
                  "assets/images/academy.png",
                  fit: BoxFit.cover,
                  key: new Key('raroLogo'),
                ),
                SizedBox(height: 32.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Nome",
                  controller: _nameController,
                  validator: (value) => Validators().validateName(value),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Telefone",
                  controller: _phoneController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  inputFormatters: [LengthLimitingTextInputFormatter(14)],
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validators().validateAge(value),
                  labelText: "Data de Nascimento",
                  controller: _bornDateController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "E-mail",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "CPF",
                  controller: _cpfController,
                  focusNode: _cpfFocusNode,
                  keyboardType: TextInputType.number,
                  validator: (cpf) => Validators().cpfValidator(cpf),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Senha",
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: passwordVisible,
                  suffixIcon: VisibleWidget(
                    visible: passwordVisible,
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  key: new Key('confirmPassword'),
                  labelText: "Senha",
                  controller: _confirmPasswordController,
                  validator: (value) => Validators().validatePassword(
                    value,
                    _passwordController.value.text,
                  ),
                  obscureText: confirmPasswordVisible,
                  suffixIcon: VisibleWidget(
                    visible: confirmPasswordVisible,
                    onPressed: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: 80.0),
                Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: SafeArea(
                      bottom: true,
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) => Column(
                                      key: new Key('formErroDialog'),
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Tudo certo por aqui",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                          } else {
                            if (Validators()
                                    .cpfValidator(_cpfController.value.text) !=
                                null) {
                              _cpfFocusNode.requestFocus();
                            }
                          }
                        },
                        child: Text("Criar conta"),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
