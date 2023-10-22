import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopease/domain/models/user_model.dart';

class AppFirebaseServiceClient {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final String _usersCollectionName = 'users';
  Future<UserModel> getUser({required String id}) async {
    final user =
        await _firebaseFirestore.collection(_usersCollectionName).doc(id).get();
    return UserModel.fromJson(user.data()!);
  }

  Future<UserModel> signUpWithEmailAndPAssword({
    required UserModel user,
  }) async {
    final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    final newUser = user.copyWith(id: userCred.user!.uid);
    await createUser(user: user);
    return newUser;
  }

  Future<void> createUser({required UserModel user}) async {
    await _firebaseFirestore
        .collection(_usersCollectionName)
        .doc(user.id)
        .set(user.toJson());
  }

  Future<UserModel> updateUser({required UserModel newUser}) async {
    await _firebaseFirestore
        .collection(_usersCollectionName)
        .doc(newUser.id)
        .update(newUser.toJson());
    return newUser;
  }

  Future<void> deleteUser({required String id}) {
    return _firebaseFirestore.collection(_usersCollectionName).doc(id).delete();
  }

  Future<UserModel> signInWithEmailAndPassword(
      {required UserModel user}) async {
    final userCred = await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
    return getUser(id: userCred.user!.uid);
  }

  Future<UserModel> signInWithGoogle({required UserModel user}) {
    throw UnimplementedError();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
