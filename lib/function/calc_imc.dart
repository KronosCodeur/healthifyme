double calcIMC(double poids, double taille) {
  double imc = poids / (taille * taille);
  return imc;
}

String findCategorie(double imc) {
  String resultat = "normal";
  if (imc < 18.5) {
    resultat = "Sous-poids";
  } else if (18.5 <= imc && imc < 25) {
    resultat = "Normal";
  } else if (25 <= imc && imc < 30) {
    resultat = "Sur-poids";
  } else {
    resultat = "Obésité";
  }
  return resultat;
}
