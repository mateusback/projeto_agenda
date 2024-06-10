import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/database/sqlite/dao/grades_dao_impl.dart';
import 'package:projeto_agenda/app/domain/entities/grades.dart';
import 'package:projeto_agenda/app/navigation/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<List<Grades>> _buscarMaterias() async {
    return GradesDaoImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscarMaterias(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Grades> list = futuro.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Portal de Horas"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.GRADES_FORM);
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              body: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  var disciplina = list[i];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(disciplina.urlAvatar ?? ''),
                    ),
                    title: Text(disciplina.nome ?? ''),
                    subtitle: Text(disciplina.nota.toString() ?? ''),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
