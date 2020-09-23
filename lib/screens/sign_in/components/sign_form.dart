import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:reboot/components/custom_surfix_icon.dart';
import 'package:reboot/components/form_error.dart';
import 'package:reboot/screens/forgot_password/forgot_password_screen.dart';
import 'package:reboot/screens/home/home_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool loading = false;
  bool hide_password = true;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Esqueci a minha senha",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          DefaultButton(
            loading: loading,
            text: "Entrar",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                loginAction();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Informe o seu Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: hide_password,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Informe a sua Senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: hide_password 
              ? Icon(LineIcons.eye_slash, size: 30, color: Colors.black.withOpacity(.4))
              : Icon(LineIcons.eye,       size: 30, color: Colors.black.withOpacity(.4)),
            onPressed: () {
              setState(() {
                hide_password = !hide_password;
              });
            }
          ),
        ),
      ),
    );
  }

  Future loginAction() async {
    setState(() {
      loading = true;
    });
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, HomeScreen.routeName);
    // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
  }
}
