import 'package:flutter/material.dart';
import 'package:task_management_ui/models/task_model.dart';
import 'package:task_management_ui/models/task_progress_model.dart';

class TaskData {
  static List<TaskModel> taskListData = [
    TaskModel(
      id: 1,
      clientName: 'Sarath',
      taskName: 'UI/UX Design',
      taskDescription:
          'Collaborate with client Sarath on wireframe revisions for the homepage.',
      priority: 'High Priority',
      progress: [
        TaskProgressModel(
          id: 1,
          progressTitle: 'UX for App',
          progressDescription:
              'Optimize app navigation as per client feedbak for an improved user experience.',
          progressTime: '10:00 AM to 12:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Icon selections',
          progressDescription:
              'Adapt inconography to align with client preferences for a personalized touch.',
          progressTime: '12:00 PM to 1:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'UI Choices',
          progressDescription:
              'Present varied UI choices to client seeking input for brand-aligned visual elements.',
          progressTime: '2:00 PM to 3:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Micro Interactions',
          progressDescription:
              'Refine UI based on James micro interactions feedback for an enhanced user experience.',
          progressTime: '4:00 PM to 6:00 PM',
        ),
      ],
    ),
    TaskModel(
      id: 2,
      color: const Color(0xFFf8f2da),
      clientName: 'James',
      taskName: 'UI/UX Design',
      taskDescription:
          'Incorporate feedback with client James into the color palette for the mobile app design',
      priority: 'High Priority',
      progress: [
        TaskProgressModel(
          id: 1,
          progressTitle: 'UX for App',
          progressDescription:
              'Optimize app navigation as per client feedbak for an improved user experience.',
          progressTime: '10:00 AM to 12:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Icon selections',
          progressDescription:
              'Adapt inconography to align with client preferences for a personalized touch.',
          progressTime: '12:00 PM to 1:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'UI Choices',
          progressDescription:
              'Present varied UI choices to client seeking input for brand-aligned visual elements.',
          progressTime: '2:00 PM to 3:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Micro Interactions',
          progressDescription:
              'Refine UI based on James micro interactions feedback for an enhanced user experience.',
          progressTime: '4:00 PM to 6:00 PM',
        ),
      ],
    ),
    TaskModel(
      id: 3,
      clientName: 'Alex',
      taskName: 'UI/UX Design',
      taskDescription:
          'Conduct a virtual presentation with client Alex to showcase the interactive prototypes and gather input.',
      priority: 'High Priority',
      color: const Color(0xFFfa8772),
      progress: [
        TaskProgressModel(
          id: 1,
          progressTitle: 'UX for App',
          progressDescription:
              'Optimize app navigation as per client feedbak for an improved user experience.',
          progressTime: '10:00 AM to 12:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Icon selections',
          progressDescription:
              'Adapt inconography to align with client preferences for a personalized touch.',
          progressTime: '12:00 PM to 1:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'UI Choices',
          progressDescription:
              'Present varied UI choices to client seeking input for brand-aligned visual elements.',
          progressTime: '2:00 PM to 3:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Micro Interactions',
          progressDescription:
              'Refine UI based on James micro interactions feedback for an enhanced user experience.',
          progressTime: '4:00 PM to 6:00 PM',
        ),
      ],
    ),
    TaskModel(
      id: 4,
      clientName: 'Alex',
      taskName: 'UI/UX Design',
      taskDescription:
          'Conduct a virtual presentation with client Alex to showcase the interactive prototypes and gather input.',
      priority: 'High Priority',
      color: const Color(0xFF3498db),
      progress: [
        TaskProgressModel(
          id: 1,
          progressTitle: 'UX for App',
          progressDescription:
              'Optimize app navigation as per client feedbak for an improved user experience.',
          progressTime: '10:00 AM to 12:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Icon selections',
          progressDescription:
              'Adapt inconography to align with client preferences for a personalized touch.',
          progressTime: '12:00 PM to 1:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'UI Choices',
          progressDescription:
              'Present varied UI choices to client seeking input for brand-aligned visual elements.',
          progressTime: '2:00 PM to 3:00 PM',
        ),
        TaskProgressModel(
          id: 1,
          progressTitle: 'Micro Interactions',
          progressDescription:
              'Refine UI based on James micro interactions feedback for an enhanced user experience.',
          progressTime: '4:00 PM to 6:00 PM',
        ),
      ],
    ),
  ];
}
