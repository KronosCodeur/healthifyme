import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthifyme/constants/colors.dart';
import 'package:healthifyme/function/calc_imc.dart';
import 'package:healthifyme/screen/home.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);
  final String routeName = '/info';
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController poids = TextEditingController();
  TextEditingController taille = TextEditingController();
  double imc = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Information",
          style: GoogleFonts.poppins(
              color: secondary, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: poids,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Entrez votre poids",
                    hintStyle: GoogleFonts.poppins(
                        color: primary.withOpacity(0.5), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primary, width: 2)),
                    enabled: true,
                  ),
                ),
                Gap(30),
                TextFormField(
                  controller: taille,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Entrez votre taille",
                    hintStyle: GoogleFonts.poppins(
                        color: primary.withOpacity(0.5), fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primary, width: 2)),
                    enabled: true,
                  ),
                ),
                Gap(50),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                              taille: double.parse(
                                  taille.text.replaceAll(",", ".")),
                              poids:
                                  double.parse(poids.text.replaceAll(",", ".")),
                              imc: calcIMC(
                                  double.parse(poids.text.replaceAll(",", ".")),
                                  double.parse(taille.text
                                      .replaceAll(",", "."))) as double),
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
                        "Calculer",
                        style:
                            GoogleFonts.poppins(color: secondary, fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
