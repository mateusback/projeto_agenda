const createTable = '''
CREATE TABLE grades (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(200) NOT NULL,
  professor VARCHAR(200) NOT NULL,
  nota REAL NOT NULL,
  url_avatar TEXT
);
''';

const insertGrades = '''
INSERT INTO grades (nome, professor, nota, url_avatar)
VALUES ('Matemática', 'XPTO', 10.0, 'https://cdn-icons-png.flaticon.com/512/3965/3965108.png'),
       ('Programação Orientada a Objetos', 'XPTO2', 7.0, 'https://cdn-icons-png.flaticon.com/512/1269/1269070.png'),
       ('Banco de Dados I', 'XPTO3', 8.5, 'https://cdn-icons-png.flaticon.com/512/2906/2906274.png');
''';
