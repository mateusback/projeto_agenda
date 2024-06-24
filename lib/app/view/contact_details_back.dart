import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact? contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context)!.settings.arguments as Contact;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
