const createTable = '''
CREATE TABLE grades (
  id INT PRIMARY KEY,
  nome VRCHAR(200) NOT NULL,
  professor VRCHAR(200) NOT NULL,
  nota DOUBLE NOT NULL,
  url_avatar TEXT
);
''';

const insertGrades = '''
INSERT INTO grades (nome, professor, nota, url_avatar)
VALUES ('Matemática', 'XPTO', 10.0, 'https://cdn.pixabay.com/photo/2016/11/29/12/54/black-1869220_960_720.jpg'),
       ('Programação Orientada a Objetos', 'XPTO2', 7.0, 'https://cdn.pixabay.com/photo/2016/11/29/12/54/black-1869220_960_720.jpg'),
       ('Banco de Dados I', 'XPTO3', 8.5, 'https://cdn.pixabay.com/photo/2016/11/29/12/54/black-1869220_960_720.jpg');
''';
