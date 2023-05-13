import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthifyme/constants/colors.dart';
import 'package:healthifyme/function/calc_imc.dart';
import 'package:healthifyme/screen/info_creen.dart';
import 'package:healthifyme/shared/imc_info_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {super.key,
      required this.taille,
      required this.poids,
      required this.imc});
  final String routeName = '/home';
  final double taille;
  final double poids;
  final double imc;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    MySharedPreferences.setPoids(20.0);
    getData();
    super.initState();
  }

  void getData() async {
    setState(() async {
      taille = widget.taille;
      poids = widget.poids;
      imc = widget.imc;
    });
  }

  double taille = 0.0;
  double poids = 0.0;
  double imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              color: secondary, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Info(
              value: poids.toString(),
              name: "Poids",
            ),
            Gap(20),
            Info(
              value: taille.toString(),
              name: "Taille",
            ),
            Gap(20),
            Info(
              value: imc.toStringAsFixed(1),
              name: "IMC",
            ),
            Gap(20),
            Info(value: findCategorie(imc), name: "Categorie"),
            Gap(50),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoScreen(),
                    ));
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Modifier",
                    style: GoogleFonts.poppins(color: secondary, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key, required this.value, required this.name});

  final String value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$name",
          style: GoogleFonts.poppins(color: primary, fontSize: 20),
        ),
        Text(
          "$value",
          style: GoogleFonts.poppins(color: primary, fontSize: 20),
        ),
      ],
    );
  }
}
