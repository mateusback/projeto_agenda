import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GradesForm extends StatelessWidget {
  const GradesForm({super.key});

  Widget textField(
      {required String label,
      required String hint,
      String? maskFormat,
      TextInputType? keyboardType}) {
    var mask = MaskTextInputFormatter(mask: maskFormat);
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: keyboardType,
      inputFormatters: mask != null ? [mask] : [],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                textField(label: 'Nome', hint: 'Informe o nome da matéria'),
                textField(
                    label: 'Professor', hint: 'Informe o nome do professor'),
                textField(
                    label: 'Nota',
                    hint: 'Informe a nota da matéria',
                    maskFormat: '##.##',
                    keyboardType: TextInputType.number),
                textField(
                    label: 'Endereço Icone',
                    hint: 'Informe o endereço do ícone da matéria')
              ],
            ),
          ),
        ));
  }
}
