import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_management_ui/data/task_data.dart';
import 'package:task_management_ui/models/task_model.dart';
import 'package:task_management_ui/utils/app_colors.dart';
import 'package:task_management_ui/widgets/task.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  //List for storing the dates of current month to display the date in carousel builder.
  List<DateTime> datesOfThisMonth = [];

  //When the user scrolls a specific date to the center of the screen, he will see the selected date with month and year.
  String selectedDate = DateFormat('d, MMMM yyyy').format(DateTime.now());

  //Assigning the local task data to a list
  List<TaskModel> tasks = TaskData.taskListData;

  //Setting controller for carousel to access or listen the carousel item
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    //Getting the dates of current month and assign it to the list using setstate to update the ui.
    setState(() {
      datesOfThisMonth = getDatesInCurrentMonth();
    });
    super.initState();
  }

  List<DateTime> getDatesInCurrentMonth() {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int daysInMonth = DateTime(year, month + 1, 0).day;

    List<DateTime> dates = [];
    for (int day = 1; day <= daysInMonth; day++) {
      dates.add(DateTime(year, month, day));
    }
    return dates;
  }

  void selectDate(DateTime date) {
    //When the index comes to the center of the screen, it means that we selected it.
    setState(() {
      selectedDate = DateFormat('d, MMMM yyyy').format(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        //Used nested scroll view instead of single child scroll view
        //to show or hide the header content when scrolls to increase the view port on landscape mode also.
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.7,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, John',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Organize Tasks,',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 7),
                              Text(
                                'boost productivity with us.',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/add-icon.png',
                            height: 45,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      selectedDate,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: AppColors.grey),
                  ),
                ),
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: datesOfThisMonth.length,
                  itemBuilder: (context, index, realIndex) {
                    //Checking the current index comes to the center of the screen.
                    bool isCenter = selectedDate ==
                        DateFormat('d, MMMM yyyy')
                            .format(datesOfThisMonth[index]);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _carouselController.jumpToPage(index);
                            selectDate(datesOfThisMonth[index]);
                          },
                          child: Text(
                            '${datesOfThisMonth[index].day}',
                            style: TextStyle(
                                color: isCenter
                                    ? AppColors.primaryColor
                                    : AppColors.grey,
                                fontWeight: isCenter
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: isCenter ? 20 : 14),
                          ),
                        ),
                        //Condition to hide the bullet for the last date
                        if (index != datesOfThisMonth.length - 1)
                          const Text(
                            '•',
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 22),
                          )
                      ],
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.12,
                    disableCenter: true,
                    height: 30,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: false,
                    initialPage: datesOfThisMonth
                        .indexWhere((e) => e.day == DateTime.now().day),
                    onPageChanged: (index, reason) {
                      selectDate(datesOfThisMonth[index]);
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Task(
                    task: tasks[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
