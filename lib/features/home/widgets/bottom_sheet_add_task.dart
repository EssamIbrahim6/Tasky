import 'package:flutter/material.dart';
import 'package:tasky/core/utils/assets_icons.dart';
import 'package:tasky/core/utils/validator_app.dart';
import 'package:tasky/features/auth/widgets/text_form_filde_widget.dart';
import 'package:tasky/features/home/widgets/selected_task_priority.dart';

class BottomSheetAddTask extends StatefulWidget {
  const BottomSheetAddTask({super.key});

  @override
  State<BottomSheetAddTask> createState() => _BottomSheetAddTaskState();
}

class _BottomSheetAddTaskState extends State<BottomSheetAddTask> {
  DateTime selectedDate = DateTime.now();
  int selectedPriority = 1;
  var tital = TextEditingController();
  var description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Add Task", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          TextFormFieldWidget(
            hintText: "Tital",
            controller: tital,
            validator: ValidatorApp.validateName,
          ),
          SizedBox(height: 10),
          TextFormFieldWidget(
            hintText: "Description",
            controller: description,
            validator: ValidatorApp.validateName,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _IconAddTask(
                onTap: () async {
                  await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      ) ??
                      DateTime.now();
                },
                imagePath: AppIcon.timerIcon,
              ),
              SizedBox(width: 10),
              _IconAddTask(
                onTap: () async {
                  AlertDialogPriority(
                    callback: (index) {
                      selectedPriority = index;
                    },
                  );
                },
                imagePath: AppIcon.flagIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconAddTask extends StatelessWidget {
  _IconAddTask({super.key, required this.onTap, required this.imagePath});
  String imagePath;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Image.asset(imagePath));
  }
}
