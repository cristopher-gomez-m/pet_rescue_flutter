class UserService {
  static UserService? _instance; // Cambio: Agregar '?' para permitir valor nulo
  int _userId;

  UserService._()
      : _userId = 0; // ID del usuario por defecto (0 o cualquier otro valor que desees)

  static UserService get instance {
    _instance ??= UserService._(); // Cambio: Inicializar solo si es nulo
    return _instance!;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}

