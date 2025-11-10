import 'package:flutter/material.dart';
import '../models/feedback_model.dart';

class FeedbackProvider with ChangeNotifier {
  final List<FeedbackModel> _feedbacks = [];

  List<FeedbackModel> get feedbacks => List.from(_feedbacks);

  void addFeedback(FeedbackModel feedback) {
    _feedbacks.add(feedback);
    notifyListeners();
  }

  void removeFeedback(String id) {
    _feedbacks.removeWhere((feedback) => feedback.id == id);
    notifyListeners();
  }

  Map<String, double> getAverageRatings() {
    Map<String, double> averages = {};
    Map<String, List<int>> ratingSums = {};

    if (_feedbacks.isEmpty) return averages;

    for (var feedback in _feedbacks) {
      feedback.ratings.forEach((category, rating) {
        if (!ratingSums.containsKey(category)) {
          ratingSums[category] = [];
        }
        ratingSums[category]!.add(rating);
      });
    }

    ratingSums.forEach((category, ratings) {
      if (ratings.isNotEmpty) {
        final sum = ratings.reduce((a, b) => a + b);
        averages[category] = sum / ratings.length;
      }
    });

    return averages;
  }
}