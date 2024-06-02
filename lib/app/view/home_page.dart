import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projeto_agenda/app/database/script.dart';
import 'package:projeto_agenda/app/navigation/routes.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<List<Map<String, dynamic>>> _buscarMaterias() async {
    try {
      var path = await getDatabasesPath() + 'grades.db';
      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createTable);
          db.execute(insertGrades);
        },
      );
      return db.query('grades');
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscarMaterias(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var list = futuro.data!;
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
                      backgroundImage:
                          NetworkImage(disciplina['url_avatar'] ?? ''),
                    ),
                    title: Text(disciplina['nome'] ?? ''),
                    subtitle: Text(disciplina['nota'] ?? ''),
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
