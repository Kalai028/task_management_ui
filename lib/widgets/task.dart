import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_ui/models/task_model.dart';
import 'package:task_management_ui/screens/task_details_screen.dart';

class Task extends StatelessWidget {
  const Task({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(17.5),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: task.color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task.taskName,
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w300),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/more.png',
                  height: 25,
                ),
              ),
            ],
          ),
          Text(
            task.clientName,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.75,
            child: Text(
              task.taskDescription,
              style: GoogleFonts.roboto(
                height: 1.8,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1.2),
                ),
                child: Text(
                  task.priority,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, _createRoute(TaskDetailsScreen(task: task)));
                },
                child: Image.asset(
                  'assets/images/arrow.png',
                  height: 45,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//For page transition
Route _createRoute(Widget screenName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screenName,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const start = Offset(1, 0);
      const finish = Offset.zero;
      const curveType = Curves.ease;

      var tween =
          Tween(begin: start, end: finish).chain(CurveTween(curve: curveType));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
