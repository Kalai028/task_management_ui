import 'package:flutter/material.dart';
import 'package:task_management_ui/models/task_progress_model.dart';
import 'package:task_management_ui/utils/app_colors.dart';

class TaskModel {
  const TaskModel({
    required this.id,
    this.color = AppColors.primaryColor,
    required this.clientName,
    required this.taskName,
    required this.taskDescription,
    required this.priority,
    required this.progress,
  });

  final int id;
  final Color color;
  final String clientName;
  final String taskName;
  final String taskDescription;
  final String priority;
  final List<TaskProgressModel> progress;
}
