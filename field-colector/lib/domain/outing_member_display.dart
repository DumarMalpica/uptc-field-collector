import 'entities/outing.dart';
import 'entities/user.dart';

const String kUnknownMemberLabel = 'Usuario desconocido';

/// Etiqueta principal: nombre embebido → remoto → email → desconocido.
String memberDisplayLabel({
  required String id,
  OutingMember? member,
  User? resolved,
}) {
  if (member != null && member.name.isNotEmpty) return member.name;
  if (resolved != null && resolved.fullName.isNotEmpty) return resolved.fullName;
  if (member != null && member.email.isNotEmpty) return member.email;
  if (resolved != null && resolved.email.isNotEmpty) return resolved.email;
  return kUnknownMemberLabel;
}

/// Subtítulo (email) cuando la etiqueta principal es un nombre.
String? memberDisplaySubtitle({
  required String id,
  OutingMember? member,
  User? resolved,
  required String label,
}) {
  final email = (member?.email.isNotEmpty == true)
      ? member!.email
      : (resolved?.email.isNotEmpty == true ? resolved!.email : null);
  if (email == null || email.isEmpty) return null;
  if (label == email) return null;
  return email;
}
