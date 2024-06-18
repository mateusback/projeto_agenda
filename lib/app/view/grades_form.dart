import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_agenda/app/view/grades_form_back.dart';

class GradesForm extends StatelessWidget {
  GradesFormBack? _back = null;

  Widget textField(
      {required String label,
      required String hint,
      String? maskFormat,
      TextInputType? keyboardType,
      String? initValue}) {
    var mask = MaskTextInputFormatter(mask: maskFormat);
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      initialValue: initValue == 'null' ? '' : initValue,
      keyboardType: keyboardType,
      inputFormatters: mask != null ? [mask] : [],
    );
  }

  @override
  Widget build(BuildContext context) {
    _back = GradesFormBack(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de Horas'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                textField(
                    label: 'Nome',
                    hint: 'Informe o nome da matéria',
                    initValue: _back!.grade!.nome.toString()),
                textField(
                    label: 'Professor',
                    hint: 'Informe o nome do professor',
                    initValue: _back!.grade!.professor.toString()),
                textField(
                    label: 'Nota',
                    hint: 'Informe a nota da matéria',
                    maskFormat: '##.##',
                    keyboardType: TextInputType.number,
                    initValue: _back!.grade!.nota.toString()),
                textField(
                    label: 'Endereço Icone',
                    hint: 'Informe o endereço do ícone da matéria',
                    initValue: _back!.grade!.urlAvatar.toString()),
              ],
            ),
          ),
        ));
  }
}
