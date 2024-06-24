import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/view/contact_form.dart';
import 'package:projeto_agenda/app/view/contact_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
      },
    );
  }
}
