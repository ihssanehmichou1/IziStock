import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:izistock/data/repositories/user/user_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Functions to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async{
    try{
       await _db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code);
    } on FormatException catch (e){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}