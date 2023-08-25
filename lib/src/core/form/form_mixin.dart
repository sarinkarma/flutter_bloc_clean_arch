import 'field.dart';

mixin FormMixin {
  bool get isValid => fields.every((field) => field.isValid);

  List<Field> get fields;

  Map<String, dynamic> get values;
}
