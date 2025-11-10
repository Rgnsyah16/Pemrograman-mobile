class FeedbackModel {
  final String id;
  final String nama;
  final String nim;
  final String prodi;
  final Map<String, int> ratings;
  final String saran;
  final DateTime createdAt;

  FeedbackModel({
    required this.id,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.ratings,
    required this.saran,
    required this.createdAt,
  });

  double get averageRating {
    if (ratings.isEmpty) return 0;
    final total = ratings.values.reduce((a, b) => a + b);
    return total / ratings.length;
  }
}