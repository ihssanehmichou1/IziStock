import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izistock/utils/formatters/formatter.dart';

class UserModel{
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.username,
  required this.email,
  required this.phoneNumber,
  required this.profilePicture,
});

  /// Helper Functions to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper Functions to format phone Number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first name and last name.
  static List<String> nameParts(fullName) => fullName.split("");
  /// Static function to generate a username from the full name.
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase(): "";

    String camelcaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelcaseUsername";
    return usernameWithPrefix;
  }
  /// static function to create an empty user model.
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert UserModel to a Map structure for storing data in Firestore.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      // Return a default UserModel instance if data is null
      return UserModel(
        id: '', // Provide default values for all fields
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );
    }
  }


}