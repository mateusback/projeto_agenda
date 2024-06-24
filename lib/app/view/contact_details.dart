import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';
import 'package:projeto_agenda/app/view/contact_details_back.dart';

class ContactDetails extends StatelessWidget {
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
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail'),
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
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
