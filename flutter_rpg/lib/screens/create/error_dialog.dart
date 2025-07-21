import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.title,
    required this.description,
    required this.ctx,
  });

  final String title;
  final String description;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: StyledHeading(title),
      content: StyledText(description),
      actions: [
        StyledButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: const StyledTitle('Closed'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
