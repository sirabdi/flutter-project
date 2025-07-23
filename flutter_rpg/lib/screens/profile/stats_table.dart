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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: AppColors.secondaryColor,
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
        ),

        Table(
          children: widget.character.statsAsFormattedList.map((stat) {
            return TableRow(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withAlpha((255 * 0.5).round()),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: StyledTitle(stat['title']!),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: StyledTitle(stat['value']!),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.character.increaseStat(stat['title']!);
                      });
                    },
                    icon: Icon(Icons.arrow_upward, color: AppColors.textColor),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.character.decreaseStat(stat['title']!);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
