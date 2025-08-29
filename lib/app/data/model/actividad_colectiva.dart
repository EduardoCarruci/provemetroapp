import 'package:provemetroapp/app/data/model/entrenador.dart';

class ActividadColectiva {
  final int _idActividadColectiva;
  final String _nombreActividadColectiva;
  final String _descripcion;
  final String _imagen;
  final int _entrenadorResponsable;
  final List<int> _sociosInscritos;
  final String _diaClase;
  final String _horaClase;

  late Entrenador entrenador;

  int get idActividadColectiva => _idActividadColectiva;
  String get nombreActividadColectiva => _nombreActividadColectiva;
  String get descripcion => _descripcion;
  String get imagen => _imagen;
  int get entrenadorResponsable => _entrenadorResponsable;
  List<int> get sociosInscritos => _sociosInscritos;
  String get diaClase => _diaClase;
  String get horaClase => _horaClase;

  ActividadColectiva({
    required int idActividadColectiva,
    required String nombreActividadColectiva,
    required String descripcion,
    required String imagen,
    required int entrenadorResponsable,
    required List<int> sociosInscritos,
    required String diaClase,
    required String horaClase,
  })  : _idActividadColectiva = idActividadColectiva,
        _nombreActividadColectiva = nombreActividadColectiva,
        _descripcion = descripcion,
        _imagen = imagen,
        _entrenadorResponsable = entrenadorResponsable,
        _sociosInscritos = sociosInscritos,
        _diaClase = diaClase,
        _horaClase = horaClase;

  factory ActividadColectiva.fromJson(Map<String, dynamic> json) {
    return ActividadColectiva(
      idActividadColectiva: json['_idActividadColectiva'] ?? 0,
      nombreActividadColectiva: json['_nombreActividadColectiva'] ?? '',
      descripcion: json['_descripcion'] ?? '',
      imagen: json['_imagen'] ?? '',
      entrenadorResponsable: json['_entrenadorResponsable'] ?? 0,
      sociosInscritos: (json['_sociosInscritos'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      diaClase: json['_diaClase'] ?? '',
      horaClase: json['_horaClase'] ?? '',
    );
  }
}
