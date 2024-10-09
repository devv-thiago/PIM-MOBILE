import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urban_green/shared/style/colors.dart';
import 'package:urban_green/shared/style/fontstyle.dart';

class CustomizedTextForm extends StatelessWidget {
  final String label;
  final String? title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters; // Ajuste aqui

  const CustomizedTextForm({
    super.key,
    required this.label,
    this.title,
    this.controller,
    this.validator,
    this.inputType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return title == null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60, // Ajuste a altura conforme necessário
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: inputType,
                  controller: controller,
                  validator: validator,
                  inputFormatters: inputFormatters, // Adicione aqui
                  decoration: InputDecoration(
                    labelText: label,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: AppColors.color1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title ?? "",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: AppColors.color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 80, // Ajuste a altura conforme necessário
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: inputFormatters, // Adicione aqui
                  keyboardType: inputType,
                  controller: controller,
                  validator: validator,
                  decoration: InputDecoration(
                    fillColor: AppColors.color3,
                    labelText: label,
                    labelStyle: CustomizedFontStyle.paragraph1,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: AppColors.color1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
