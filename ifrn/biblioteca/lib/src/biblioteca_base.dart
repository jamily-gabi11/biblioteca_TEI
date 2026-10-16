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
  Boolean disponivel;
}

class Emprestimo {
  Livro livro;
  DateTime dataEmprestimo;
  DateTime dataDevolucao;

  Emprestimo(this.livro, this.dataEmprestimo, this.dataDevolucao);
}

Usuario bibliotecario = Usuario('joao', ['bibliotecario']);

class Biblioteca {
  /// Menu de opções do módulo exemplo.
  /// TODO: Adapte ao seu módulo, mas mantenha o nome da propriedade como `menu` para que o código do binário funcione corretamente.
  static List<Map<String, dynamic>> menu = [
    { 'titulo': 'Cadastrar livro', 'permissao': 'bibliotecario', 'metodo': cadastrarLivro },
    { 'titulo': 'Listar livros', 'permissao': null, 'metodo': listarLivros },
    { 'titulo': 'Registrar emprestimo ', 'permissao': 'bibliotecario', 'metodo': registrarEmprestimo },
    { 'titulo': 'Registrar devolução', 'permissao': 'bibliotecario', 'metodo': registrarDevolucao },
  ];

  static final List<String> livros = [];


static void cadastrarLivro() {
    print('Digite o titulo do livro: ');
    String? nome = stdin.readLineSync();
    print('Digite o autor do livro: ');
    String? autor = stdin.readLineSync();
    print('Digite se o livro está disponível: ');
    String? disponivel = stdin.readLineSync();
    
    if (nome != null && nome.isNotEmpty && autor != null && autor.isNotEmpty && disponivel != null && disponivel.isNotEmpty) {
      var livro = Livro(nome, autor, disponivel = true);
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
      print('Informações cadastradas:');
      for (int i=0; i<informacoes.length; i++) {
        print('- $i: ${informacoes[i]}');
      }
    }
  }

  static void registrarEmprestimo() {
    print('Digite o título do livro que deseja emprestar:');
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      livros.add(input);
      print('Livro emprestado.');
    } else {
      print('Nenhum livro foi emprestado.');
    }
  }

  static void registrarDevolucao() {
    print('Digite o título do livro que deseja devolver:');
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      livros.add(input);
      print('Livro devolvido.');
    } else {
      print('Nenhum livro foi devolvido.');
    }
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
