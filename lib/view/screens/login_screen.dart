import 'package:flutter/material.dart';
import 'package:market/view/widgets/base_app_bar.dart';
import 'package:market/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  //
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(appBar: AppBar(), title: "Login"),
        body: SingleChildScrollView(
          child: buildLoginForm(context),
        ));
  }

  Form buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            "assets/store.png",
            height: 200,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 360),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                controller: _emailController,
                //todo this is simple validator ,must convert to email validator
                validator: (value) =>
                    value?.isEmpty ?? false ? "please enter username " : null,
                decoration: const InputDecoration(
                  label: Text("username"),
                  hintText: "Enter your username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Container(
              constraints: const BoxConstraints(maxWidth: 360),

              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _passwordController,
                validator: (value) =>
                    value?.isEmpty ?? false ? "please enter password " : null,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("password"),
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: _onLogin,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: context.watch<LoginViewModel>().loginState ==
                        LoginState.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
              ))
        ]),
      ),
    );
  }

  _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginViewModel>().onLogin(
          context: context,
          email: _emailController.text,
          password: _passwordController.text);
    }
  }
}
