class DemoData {
  final String title;
  final String category;
  final String subtitle;
  final int price;
  final String date;
  final bool isUrgent;
  final bool isNecessary;
  final bool isHobby;
  bool isSwitched;

  DemoData({
    required this.title,
    required this.category,
    required this.price,
    required this.date,
    this.subtitle = "",
    this.isSwitched = false,
    bool isUrgent = false,
    bool isNecessary = false,
    bool isHobby = false,
  }) : assert(
         (isUrgent ? 1 : 0) + (isNecessary ? 1 : 0) + (isHobby ? 1 : 0) <= 1,
         'Only one of isUrgent, isNecessary, or isHobby can be true',
       ),
       this.isUrgent = isUrgent,
       this.isNecessary = isNecessary,
       this.isHobby = isHobby;
}
