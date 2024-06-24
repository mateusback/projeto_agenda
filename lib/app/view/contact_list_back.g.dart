// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactListBack on _ContactListBack, Store {
  late final _$listAtom = Atom(name: '_ContactListBack.list', context: context);

  @override
  Future<List<Contact>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  bool _listIsInitialized = false;

  @override
  set list(Future<List<Contact>> value) {
    _$listAtom.reportWrite(value, _listIsInitialized ? super.list : null, () {
      super.list = value;
      _listIsInitialized = true;
    });
  }

  late final _$_ContactListBackActionController =
      ActionController(name: '_ContactListBack', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ContactListBackActionController.startAction(
        name: '_ContactListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContactListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
