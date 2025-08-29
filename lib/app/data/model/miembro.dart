class Miembro {
  final int _idPersona;
  final String _nombre;
  final String _apellidos;
  final String _dni;

  int get idPersona => _idPersona;
  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get dni => _dni;

  Miembro({
    required int idPersona,
    required String nombre,
    required String apellidos,
    required String dni,
  })  : _idPersona = idPersona,
        _nombre = nombre,
        _apellidos = apellidos,
        _dni = dni;

  factory Miembro.fromJson(Map<String, dynamic> json) {
    return Miembro(
      idPersona: json['idPersona'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      dni: json['DNI'],
    );
  }
}