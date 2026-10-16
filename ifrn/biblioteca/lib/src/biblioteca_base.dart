import 'dart:io';

import 'package:usuarios/usuarios.dart';

/// Módulo exemplo.
/// TODO: Adapte para algo específico do seu módulo.

class UsuarioBiblioteca {
  Usuario usuario;
  List<Emprestimo> livrosEmprestados = [];
  
  UsuarioBiblioteca(this.usuario);
}

class Livro{
  String titulo;
  String autor;
  bool disponivel;

  Livro (this.titulo, this.autor, this.disponivel);
}

class Emprestimo {
  Livro livro;
  DateTime dataEmprestimo;
  DateTime dataDevolucao;

  Emprestimo(this.livro, this.dataEmprestimo, this.dataDevolucao);
}

class Biblioteca {
  /// Menu de opções do módulo exemplo.
  /// TODO: Adapte ao seu módulo, mas mantenha o nome da propriedade como `menu` para que o código do binário funcione corretamente.
  static List<Map<String, dynamic>> menu = [
    { 'titulo': 'Cadastrar livro', 'permissao': 'bibliotecario', 'metodo': cadastrarLivro },
    { 'titulo': 'Listar livros', 'permissao': null, 'metodo': listarLivros },
    { 'titulo': 'Registrar emprestimo ', 'permissao': 'bibliotecario', 'metodo': registrarEmprestimo },
    { 'titulo': 'Registrar devolução', 'permissao': 'bibliotecario', 'metodo': registrarDevolucao },
  ];

  static final List<Livro> livros = [];


static void cadastrarLivro() {
    print('Digite o titulo do livro: ');
    String? titulo = stdin.readLineSync();
    print('Digite o autor do livro: ');
    String? autor = stdin.readLineSync();
    print('Digite se o livro está disponível (S/N): ');
    String? disponivel = stdin.readLineSync();
    
    if (titulo != null && titulo.isNotEmpty && autor != null && autor.isNotEmpty && disponivel != null && disponivel.isNotEmpty) {
      var livro = Livro(titulo, autor, disponivel[0].toLowerCase() == "s");
      livros.add(livro);
      print('Livro cadastrado.');
    } else {
      print('Nenhum livro foi cadastrado.');
    }
  }

  static void listarLivros() {
    if (livros.isEmpty) {
      print('Nenhum livro cadastrado.');
    } else {
      print('livros cadastrados:');
      for (int i=0; i<livros.length; i++) {
        print('- $i: ${livros[i].titulo},''- $i: ${livros[i].autor},');
      }
    }
  }

  static void registrarEmprestimo() {
    /*print('Digite o título do livro que deseja emprestar:');
    String? titulo = stdin.readLineSync();
    if ( titulo!= null && titulo.isNotEmpty) {
      emprestimos.add(livro);
      print('Livro emprestado.');
    } else {
      print('Nenhum livro foi emprestado.');
    }*/
  }

  static void registrarDevolucao() {
    /*print('Digite o título do livro que deseja devolver:');
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      livros.add(input);
      print('Livro devolvido.');
    } else {
      print('Nenhum livro foi devolvido.');
    }*/
  }

  static void excluir() {
    print('Digite o título do livro que deseja excluir:');
    String? input = stdin.readLineSync() ?? '';
    int? index = int.tryParse(input);
    if (index != null && index >= 0 && index < livros.length) {
      livros.removeAt(index);
      print('Livro excluído com sucesso.');
    } else {
      print('Livro não encontrado.');
    }
  }
}
