import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<List<Map<String, dynamic>>> getAllFood() {
  //   var information = _firestore
  //       .collection('foodType')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => {
  //                 "id": doc.id,
  //                 "food_type_name": doc['food_type_name'],
  //                 "image_url": doc['image_url'],
  //               })
  //           .toList());
  //
  //   return information;
  // }

  Future<List<Map<String, dynamic>>> getAllFood() => _firestore
      .collection("foodType")
      .get()
      .then((value) => value.docs.map((doc) {
        return {
          "id": doc.id,
          "food_type_name": doc['food_type_name'],
          "image_url": doc['image_url'],
        };
  }).toList());

  // Stream<List<Map<String, dynamic>>> getPopularFood() => _firestore
  //     .collection("popularFoods")
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) {
  //           return {
  //             "food_type": doc["food_type"],
  //             "food_name": doc["food_name"],
  //             "image_url": doc["image_url"],
  //             "prices": doc['prices'],
  //             "id": doc.id
  //           };
  //         }).toList());

  Future<List<Map<String,dynamic>>> getPopularFood() => _firestore
      .collection("popularFoods")
      .get()
      .then((value) => value.docs.map((doc) {
        return {
          "food_type": doc["food_type"],
          "food_name": doc["food_name"],
          "image_url": doc["image_url"],
          "prices": doc['prices'],
          "id": doc.id
        };
  }).toList());

  // Stream<List<Map<String, dynamic>>> getEachFoodType(typeOfScreen) => _firestore
  //     .collection(typeOfScreen)
  //     // .doc()
  //     // .collection('Num Bonh Jok')
  //     .snapshots()
  //     .map((snapshot) => snapshot.docs.map((doc) {
  //           return {
  //             "food_name": doc["food_name"],
  //             "image_url": doc["image_url"],
  //             "food_type": doc["food_type"],
  //             "prices": doc["prices"].toDouble(),
  //             "id": doc.id
  //           };
  //         }).toList());

  Future<List<Map<String, dynamic>>> getEachFoodType(typeOfScreen) => _firestore
      .collection(typeOfScreen)
      .get()
      .then((value) => value.docs.map((doc) {
        return {
          "food_name": doc["food_name"],
          "image_url": doc["image_url"],
          "food_type": doc["food_type"],
          "prices": doc["prices"].toDouble(),
          "id": doc.id
        };
  }).toList());

  Future<Map<String, dynamic>> getDetailFood(food_type, food_id) => _firestore
      .collection(food_type)
      .doc(food_id)
      // .collection(food_name)
      .get()
      .then((value) => {
            "food_description": value.data()?["food_description"],
            "food_name": value.data()?["food_name"],
            "image_url": value.data()?["image_url"],
            "price": value.data()?["prices"].toDouble(),
          });

  Future<List<Map<String, dynamic>>> getRoomType() => _firestore
      .collection('RoomType')
      .get()
      .then((value) => value.docs.map((doc) {
            return {
              "name": doc["name"],
              "ListRoomNum": doc["value"],
            };
          }).toList());

}
