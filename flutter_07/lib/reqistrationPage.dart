import 'package:flutter/material.dart';
import 'package:flutter_07/resultPage.dart';

class ReqistrationPage extends StatefulWidget {
  const ReqistrationPage({super.key});

  @override
  State<ReqistrationPage> createState() => _ReqistrationPageState();
}

class _ReqistrationPageState extends State<ReqistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final surname = surNameController.text;
      final phone = phoneController.text;
      final email = emailController.text;
      final login = loginController.text;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Проверьте введённые данные'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Имя: $name'),
              Text('Фамилия: $surname'),
              Text('Телефон: $phone'),
              Text('Email: $email'),
              Text('Логин: $login'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Отмена'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      name: name,
                      surname: surname,
                      phone: phone,
                      email: email,
                      login: login,
                    ),
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Успешно зарегистрирован',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                );
              },
              child: Text('Ок'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация'),
      centerTitle: true, backgroundColor: Colors.amber,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                label: 'Имя',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: surNameController,
                label: 'Фамилия',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите фамилию';
                  }
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: phoneController,
                label: 'Телефон',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  }
                  if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
                    return 'Только цифры и +';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите email';
                  }
                  if (!RegExp(
                    r'^[\w\.\+\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return 'Некорректный email';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: loginController,
                label: 'Логин',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите логин';
                  }
                  if (value.length < 4) {
                    return 'Минимум 4 символа';
                  }
                  return null;
                },
              ),

              buildTextField(
                controller: passwordController,
                label: 'Пароль',
                obscureText: true,
                onChanged: (_) {
                  _formKey.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Минимум 6 символов';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Добавьте хотя бы одну цифру';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: confirmPasswordController,
                label: 'Повтор пароля',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Повтор пароля';
                  }
                  if (value != passwordController.text) {
                    return 'Пароли не совпадают';
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Text('Зарегестрироваться', )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
