import 'errors.dart';

getText(int indice, String type) {
  switch (type) {
    case 'erreur':
      return getErrorsText(indice);
    default:
  }
}

getErrorsText(indice) {
  String? texte;
  try {
    texte = errors[indice]!;
  } catch (e) {
    texte = "Erreur! Veuillez Réessayer!";
  }
  return texte;
}
