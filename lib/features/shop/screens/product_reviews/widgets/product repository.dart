// Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
//   try {
//     final querySnapshot =limit == -1
//       ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
//
//       : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
//
//     final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
//     return products;
//   } on FirebaseException catch (e) {
//     throw FirebaseException(e.code, e.message);
//   } on PlatformException catch (e) {
//     throw PlatformException(code: e.code, message: e.message);
//   } catch (e) {
//     throw Exception('Something went wrong. Please try again');
//   }
// }
