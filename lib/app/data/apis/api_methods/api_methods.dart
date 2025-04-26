import 'dart:convert';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_log_in_model.dart';
import '../api_models/get_sign_up_model.dart';

class ApiMethods {


//   static Future<SignupModel?> userSignup({
//     void Function(int)? checkResponse,
//     Map<String, dynamic>? bodyParams,
//   }) async {
//     SignupModel? signUpModel;
//     http.Response? response = await MyHttp.postMethod(
//       bodyParams: bodyParams,
//       url: ApiUrlConstants.endPointOfUserSignup,
//       checkResponse: checkResponse,
//     );
//     if (response != null) {
//       signUpModel = SignupModel.fromJson(jsonDecode(response.body));
//       return signUpModel;
//     }
//     return null;
//   }
//
// /// Login api.....
// static Future<LoginModel?> loginApi({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
// }) async {
//   LoginModel? loginModel;
//   http.Response? response = await MyHttp.postMethod(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfLogin,
//     checkResponse: checkResponse,
//   );
//   if (response != null) {
//     loginModel = LoginModel.fromJson(jsonDecode(response.body));
//     return loginModel;
//   }
//   return null;
// }

// /// Reset Password....
// static Future<ResetPasswordModel?> resetPasswordApi({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
// }) async {
//   ResetPasswordModel? resetPasswordModel;
//   http.Response? response = await MyHttp.postMethod(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfUpdatePassword,
//     checkResponse: checkResponse,
//   );
//   if (response != null) {
//     resetPasswordModel =
//         ResetPasswordModel.fromJson(jsonDecode(response.body));
//     return resetPasswordModel;
//   }
//   return null;
// }

  ///  Otp verify api....
// static Future<VerifyOtpModel?> otpVerifyApi({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
// }) async {
//   VerifyOtpModel? verifyOtpModel;
//   http.Response? response = await MyHttp.postMethod(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfOtpVerify,
//     checkResponse: checkResponse,
//   );
//   if (response != null) {
//     verifyOtpModel = VerifyOtpModel.fromJson(jsonDecode(response.body));
//     return verifyOtpModel;
//   }
//   return null;
// }

// ///  sent otp for Password api....
// static Future<SendOTPModel?> sentOtpForPasswordApi({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
// }) async {
//   SendOTPModel? sendOTPModel;
//   http.Response? response = await MyHttp.postMethod(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfSentOtpVerify,
//     checkResponse: checkResponse,
//   );
//   if (response != null) {
//     sendOTPModel = SendOTPModel.fromJson(jsonDecode(response.body));
//     return sendOTPModel;
//   }
//   return null;
// }

// ///  Get Profile  ...
// static Future<UserModel?> getProfile({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
// }) async {
//   UserModel? userModel;
//   http.Response? response = await MyHttp.postMethod(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfGetProfile,
//     wantSnackBar: false,
//     checkResponse: checkResponse,
//   );
//   if (response != null) {
//     userModel = UserModel.fromJson(jsonDecode(response.body));
//     return userModel;
//   }
//   return null;
// }

// ///Update Profile Api Calling.....
// static Future<UserModel?> updateProfileApi({
//   void Function(int)? checkResponse,
//   Map<String, dynamic>? bodyParams,
//   File? image,
// }) async {
//   UserModel? logInModel;
//   http.Response? response = await MyHttp.multipart(
//     bodyParams: bodyParams,
//     url: ApiUrlConstants.endPointOfUpdateProfile,
//     image: image,
//     imageKey: 'image',
//     checkResponse: checkResponse,
//   );
//
//   if (response != null) {
//     logInModel = UserModel.fromJson(jsonDecode(response.body));
//     return logInModel;
//   }
//   return null;
// }
}
