import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatesTable extends StatefulWidget {
  const StatesTable({super.key, required this.character});

  final Character character;

  @override
  State<StatesTable> createState() => _StatesTableState();
}

class _StatesTableState extends State<StatesTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: AppColors.secondaryColor.withAlpha((255 * 0.5).round()),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: widget.character.points > 0
                ? AppColors.highlightColor
                : AppColors.secondaryAccent,
          ),
          SizedBox(width: 8),
          StyledText('Available points'),
          Expanded(child: SizedBox()),
          StyledHeading(widget.character.points.toString()),
        ],
      ),
    );
  }
}
