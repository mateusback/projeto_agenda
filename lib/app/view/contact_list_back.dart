import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';
import 'package:projeto_agenda/app/domain/services/contact_service.dart';
import 'package:projeto_agenda/app/my_app.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  //lista de contatos
  @observable
  late Future<List<Contact>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList);
  }

  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
