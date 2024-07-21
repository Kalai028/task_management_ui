class TaskProgressModel {
  TaskProgressModel(
      {required this.id,
      required this.progressTitle,
      required this.progressDescription,
      required this.progressTime});

  final int id;
  final String progressTitle;
  final String progressDescription;
  final String progressTime;
}
