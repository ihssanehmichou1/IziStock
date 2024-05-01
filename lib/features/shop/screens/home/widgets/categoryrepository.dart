// Future<List<CategoryModel>> getSubCategories(String categoryId) async {
//   try {
//     final snapshot = await _db
//         .collection("Categories")
//         .where('ParentId', isEqualTo: categoryId)
//         .get();
//     final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
//     return result;
//   } on FirebaseException catch (e) {
//     throw FirebaseException(e.code, e.message);
//   } on PlatformException catch (e) {
//     throw PlatformException(code: e.code, message: e.message);
//   } catch (e) {
//     throw Exception('Something went wrong. Please try again');
//   }
// }
