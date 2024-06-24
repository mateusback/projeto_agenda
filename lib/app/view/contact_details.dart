import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';
import 'package:projeto_agenda/app/view/contact_details_back.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar uma aplicação compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact!;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;

        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(40),
            children: [
              (Uri.tryParse(contact.urlAvatar!)!.isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(contact.urlAvatar!),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text('${contact.nome}',
                    style: const TextStyle(fontSize: 30)),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone'),
                  subtitle: Text('${contact.telefone}'),
                  trailing: Container(
                    width: width / 4,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _back.launchPhone(showModalError);
                          },
                          icon: const Icon(Icons.phone),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () {
                            _back.launchSms(showModalError);
                          },
                          icon: const Icon(Icons.message),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail'),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              _back.goToBack();
            },
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }
}
