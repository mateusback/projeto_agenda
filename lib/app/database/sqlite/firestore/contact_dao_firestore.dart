import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_agenda/app/domain/entities/contact.dart';
import 'package:projeto_agenda/app/domain/interfaces/contact_dao.dart';

class ContactDaoFirestore implements ContactDAO {
  CollectionReference? contactCollention;

  ContactDaoFirestore() {
    contactCollention = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollention!.get();
    return result.docs
        .map(
          (doc) => Contact(
            id: doc.id,
            nome: doc['nome'],
            telefone: doc['telefone'],
            email: doc['email'],
            urlAvatar: doc['url_avatar'],
          ),
        )
        .toList();
  }

  @override
  remove(id) {
    contactCollention!.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollention!.doc(contact.id).set({
      'nome': contact.nome,
      'telefone': contact.telefone,
      'email': contact.email,
      'url_avatar': contact.urlAvatar,
    });
  }
}
