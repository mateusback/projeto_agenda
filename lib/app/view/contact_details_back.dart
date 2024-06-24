import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact? contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context)!.settings.arguments as Contact;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  Future<void> _launchApp(
      String? url,
      Function(BuildContext context) showModalError,
      BuildContext context) async {
    if (url == null || url.isEmpty) {
      showModalError(context);
      return;
    }

    final Uri? urlParsed = Uri.tryParse(url);

    if (urlParsed == null) {
      showModalError(context);
      return;
    }

    try {
      final bool canLaunch = await canLaunchUrl(urlParsed);
      if (canLaunch) {
        await launchUrl(urlParsed);
      } else {
        showModalError(context);
      }
    } catch (e) {
      showModalError(context);
    }
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${contact?.telefone}', showModalError, context);
  }

  launchSms(Function(BuildContext context) showModalError) {
    _launchApp('sms:${contact?.telefone}', showModalError, context);
  }

  launchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${contact?.email}', showModalError, context);
  }
  //aula 33 - Criando projeto no firebase
}
