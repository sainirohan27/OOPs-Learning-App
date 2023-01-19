/*import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const KEY = 'FIRST_TIME_OPEN';

class RatingService {
  late SharedPreferences _prefs;
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> isSecondTimeOpen() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      dynamic isSecondTime = _prefs.getBool(KEY) as bool;
      if (isSecondTime != null && !isSecondTime) {
        _prefs.setBool(KEY, false);
        return false;
      } else if (isSecondTime != null && isSecondTime) {
        _prefs.setBool(KEY, false);
        return true;
      } else {
        _prefs.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
    try {
      final available = await _inAppReview.isAvailable();
      if (available) {
        _inAppReview.requestReview();
      } else {
        _inAppReview.openStoreListing(
          appStoreId: 'come.example.inAppReviewFlutter',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}*/