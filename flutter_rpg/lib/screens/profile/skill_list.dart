import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, this.isSaved, {super.key});

  final Character character;
  final bool isSaved;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;
  late Skill previousSkill;

  @override
  void dispose() {
    if (!widget.isSaved) {
      widget.character.updateSkill(previousSkill); // reset ke skill awal
    }
    super.dispose();
  }

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }
    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }
    previousSkill = selectedSkill;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      color: AppColors.secondaryColor,
      child: Column(
        children: [
          StyledTitle('Choose An Active Skill'),
          StyledText('Skill are unique to your vocations!'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: availableSkills.map((skill) {
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(2),
                color: selectedSkill == skill
                    ? AppColors.highlightColor
                    : Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.character.updateSkill(skill);
                      selectedSkill = skill;
                    });
                  },
                  child: Image.asset(
                    'assets/img/skills/${skill.image}',
                    width: 70,
                    height: 70,
                  ),
                ),
              );
            }).toList(),
          ),
          StyledText(selectedSkill.name),
        ],
      ),
    );
  }
}
