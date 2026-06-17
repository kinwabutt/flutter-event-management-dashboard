class EventModel {
  final String title;
  final String date;
  final int vendors;
  final double collectedAmount;
  final double pendingAmount;
  final String id;
  const EventModel({
    required this.title,
    required this.date,
    required this.vendors,
    required this.collectedAmount,
    required this.pendingAmount,
    required this.id, 
  
  });

  // JSON data ko object me convert karne ke liye static method
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] as String,
      date: json['date'] as String,
      vendors: json['vendors'] as int,
      collectedAmount: json['collectedAmount'] as double,
      pendingAmount: json['pendingAmount'] as double, id: json['id'] as String,
    );
  }
}