import 'dart:io';

void main() {
  List<Map<String, dynamic>> libros = [];

  int opcion = 0;

  while (opcion != 5) {
    print('\n================================');
    print('      GESTIÓN DE BIBLIOTECA');
    print('================================');
    print('1. Agregar libro');
    print('2. Listar libros');
    print('3. Actualizar libro');
    print('4. Eliminar libro');
    print('5. Salir');
    print('================================');

    print('Digite una opción: ');
    String entrada = stdin.readLineSync() ?? '';

    int? opcionIngresada = int.tryParse(entrada);

    if (opcionIngresada == null) {
      print('\nERROR: Debe ingresar un número.');
      continue;
    }

    opcion = opcionIngresada;

    switch (opcion) {
      case 1:
        agregarLibro(libros);
        break;

      case 2:
        listarLibros(libros);
        break;

      case 3:
        actualizarLibro(libros);
        break;

      case 4:
        eliminarLibro(libros);
        break;

      case 5:
        print('\nPrograma finalizado.');
        break;

      default:
        print('\nERROR: Opción no válida.');
    }
  }
}






// SOLICITAR TEXTO
String solicitarTexto(String mensaje) {
  while (true) {
    print(mensaje);
    String texto = stdin.readLineSync() ?? '';

    texto = texto.trim();

    if (texto.isEmpty) {
      print('ERROR: Este campo no puede estar vacío.');
    } else {
      return texto;
    }
  }
}

// SOLICITAR AÑO
int solicitarAnio(String mensaje) {
  while (true) {
    print(mensaje);
    String entrada = stdin.readLineSync() ?? '';

    int? anio = int.tryParse(entrada);

    if (anio == null) {
      print('ERROR: Debe ingresar un número.');
    } else if (anio <= 0) {
      print('ERROR: El año debe ser mayor que 0.');
    } else {
      return anio;
    }
  }
}

// SOLICITAR ÍNDICE
int solicitarIndice(List<Map<String, dynamic>> libros) {
  while (true) {
    print('\nDigite el número del libro: ');
    String entrada = stdin.readLineSync() ?? '';

    int? numero = int.tryParse(entrada);

    if (numero == null) {
      print('ERROR: Debe ingresar un número.');
    } else if (numero < 1 || numero > libros.length) {
      print('ERROR: El número del libro no existe.');
    } else {
      return numero - 1;
    }
  }
}