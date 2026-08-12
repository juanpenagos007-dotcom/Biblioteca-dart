//principal
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


// AGREGAR LIBRO
void agregarLibro(List<Map<String, dynamic>> libros) {
  print('\n===== AGREGAR LIBRO =====');

  String titulo = solicitarTexto('Digite el título: ');

  String autor = solicitarTexto('Digite el autor: ');

  int anio = solicitarAnio('Digite el año de publicación: ');

  Map<String, dynamic> libro = {
    'titulo': titulo,
    'autor': autor,
    'anio': anio,
  };

  libros.add(libro);

  print('\nLibro agregado correctamente.');
}

// LISTAR LIBROS
void listarLibros(List<Map<String, dynamic>> libros) {
  print('\n===== LISTA DE LIBROS =====');

  if (libros.isEmpty) {
    print('No hay libros registrados.');
    return;
  }

  for (int i = 0; i < libros.length; i++) {
    print('\nLibro ${i + 1}');
    print('Título: ${libros[i]['titulo']}');
    print('Autor: ${libros[i]['autor']}');
    print('Año de publicación: ${libros[i]['anio']}');
  }
}


//Adrian
// ACTUALIZAR LIBRO
void actualizarLibro(List<Map<String, dynamic>> libros) {
  print('\n===== ACTUALIZAR LIBRO =====');

  if (libros.isEmpty) {
    print('No hay libros registrados para actualizar.');
    return;
  }

  listarLibros(libros);

  int indice = solicitarIndice(libros);

  print('\nLibro seleccionado:');
  print('Título: ${libros[indice]['titulo']}');
  print('Autor: ${libros[indice]['autor']}');
  print('Año: ${libros[indice]['anio']}');

  print('\nIngrese los nuevos datos.');

  String titulo = solicitarTexto('Nuevo título: ');

  String autor = solicitarTexto('Nuevo autor: ');

  int anio = solicitarAnio('Nuevo año de publicación: ');

  libros[indice]['titulo'] = titulo;
  libros[indice]['autor'] = autor;
  libros[indice]['anio'] = anio;

  print('\nLibro actualizado correctamente.');
}

// ELIMINAR LIBRO
void eliminarLibro(List<Map<String, dynamic>> libros) {
  print('\n===== ELIMINAR LIBRO =====');

  if (libros.isEmpty) {
    print('No hay libros registrados para eliminar.');
    return;
  }

  listarLibros(libros);

  int indice = solicitarIndice(libros);

  print('\nLibro seleccionado:');
  print('Título: ${libros[indice]['titulo']}');
  print('Autor: ${libros[indice]['autor']}');
  print('Año: ${libros[indice]['anio']}');

  print('\n¿Está seguro de eliminar este libro?');
  print('1. Sí');
  print('2. No');

  print('Digite una opción: ');
  String respuesta = stdin.readLineSync() ?? '';

  if (respuesta == '1') {
    libros.removeAt(indice);
    print('\nLibro eliminado correctamente.');
  } else if (respuesta == '2') {
    print('\nEliminación cancelada.');
  } else {
    print('\nOpción no válida. No se eliminó el libro.');
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
