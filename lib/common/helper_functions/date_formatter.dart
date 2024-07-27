import 'package:intl/intl.dart';

String formatDateDifference(DateTime publishedDate) {
  final now = DateTime.now();
  final difference = now.difference(publishedDate).abs();
  final hours = difference.inHours;
  final minutes = difference.inMinutes % 60;
  final days = difference.inDays;

  if (difference.inDays < 1) {
    if (hours < 1) {
      if (minutes < 1) {
        return 'Just now';
      }
      return '$minutes min ago';
    }
    return '$hours${hours == 1 ? ' hr' : ' hrs'} ${minutes} min ago';
  } else if (difference.inDays < 6) {
    return '${days} days ago';
  } else {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(publishedDate);
  }
}
