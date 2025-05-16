// import 'package:intl/intl.dart';
//
// import '../../features/auth/data/models/auth.dart';
// import '../util/toast.dart';
//
// class Tools {
//   static String formattedDate(DateTime timeStamp) {
//     String formattedDate = DateFormat('yyy-MM-dd')
//         .format(DateTime(
//         timeStamp.year, timeStamp.month, timeStamp.day, timeStamp.hour,
//         timeStamp.minute, timeStamp.second));
//     return formattedDate;
//   }
//
//   static bool isValidSignup(AuthModel auth) {
//     if (auth.name == '') {
//       ShowToast.errorToast(message: 'Please, enter your name');
//       return false;
//     }
//     if (!isValidEmail(auth.email)) {
//       ShowToast.errorToast(
//           message: 'Please, enter your valid email');
//       return false;
//     }
//     if (auth.password == '') {
//       ShowToast.errorToast(message: 'Please, enter your password');
//       return false;
//     }
//     if (auth.confirmPassword == '') {
//       ShowToast.errorToast(message: 'Please, confirm your password');
//       return false;
//     }
//     if (auth.password != auth.confirmPassword) {
//       ShowToast.errorToast(message: 'password doesn\'t match');
//       return false;
//     }
//     return true;
//   }
//
//   static bool isValidSignIn(AuthModel auth) {
//     if (!isValidEmail(auth.email)) {
//       ShowToast.errorToast(
//           message: 'Please, enter your valid email');
//       return false;
//     }
//     if (auth.password == '') {
//       ShowToast.errorToast(message: 'Please, enter your password');
//       return false;
//     }
//     return true;
//   }
//
//   static bool isValidEmail(String email) {
//     // Regular expression pattern for validating email addresses
//     // final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//
//     RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//
//     return emailRegExp.hasMatch(email);
//   }
//
// }
