import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {this.textAlign, super.key});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.quicksand(
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {this.textAlign, super.key});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: textAlign,
      style: GoogleFonts.quicksand(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text, {this.textAlign, super.key});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: textAlign,
      style: GoogleFonts.quicksand(
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
