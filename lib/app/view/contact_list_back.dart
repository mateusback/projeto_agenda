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

  @observable
  late Future<List<Contact>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList);
  }

  goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS);
  }

  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }
}
