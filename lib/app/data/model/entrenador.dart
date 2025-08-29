class Entrenador {
  final int _idTrainer;
  final String _nombre;
  final String _apellidos;
  final String _dni;
  final String _cv;
  final List<int> _actividades;

  int get idTrainer => _idTrainer;
  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get dni => _dni;
  String get cv => _cv;
  List<int> get actividades => _actividades;

  Entrenador({
    required int idTrainer,
    required String nombre,
    required String apellidos,
    required String dni,
    required String cv,
    required List<int> actividades,
  })  : _idTrainer = idTrainer,
        _nombre = nombre,
        _apellidos = apellidos,
        _dni = dni,
        _cv = cv,
        _actividades = actividades;

  factory Entrenador.fromJson(Map<String, dynamic> json) {
    return Entrenador(
      idTrainer: json['idTrainer'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      dni: json['DNI'],
      cv: json['cv'],
      actividades: List<int>.from(json['actividades']),
    );
  }
}