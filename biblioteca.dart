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






