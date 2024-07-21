import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_ui/models/task_model.dart';
import 'package:task_management_ui/utils/app_colors.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final TaskModel task;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          //Used nested scroll view instead of single child scroll view
          //to show or hide appbar when scrolls to increase the view port on landscape mode also.
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              surfaceTintColor: AppColors.bgColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: const Text('Task Details'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/chat.png',
                    height: 20,
                  ),
                )
              ],
            ),
          ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.clientName,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.2),
                      ),
                      child: Text(
                        widget.task.taskName,
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 1.2),
                      ),
                      child: Text(
                        widget.task.priority,
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'Additional Information',
                  style: TextStyle(color: AppColors.grey, fontSize: 15),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.task.taskDescription,
                  style: const TextStyle(color: AppColors.lightGrey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Task Progress',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.task.progress.length,
                  itemBuilder: (context, index) {
                    var progress = widget.task.progress[index];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.mediumGrey,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: index ==
                                      0 //To show colored box for first item only as given UIs
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: index == 0
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: screenWidth * 0.64,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  progress.progressTitle,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  progress.progressDescription,
                                  style: const TextStyle(color: AppColors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  progress.progressTime,
                                  style: const TextStyle(
                                      fontSize: 13, color: AppColors.lightGrey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
