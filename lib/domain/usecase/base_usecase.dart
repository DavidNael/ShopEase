import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/user_model.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> getProducts({required In input});
  Future<Either<Failure, UserModel>> createUser({required UserModel user});
  Future<Either<Failure, UserModel>> updateUser({required UserModel user});
  Future<Either<Failure, bool>> deleteUser({required String id});
  Future<Either<Failure, UserModel>> getUser({required String id});
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required UserModel user,
  });
  Future<Either<Failure, UserModel>> signInWithGoogle({
    required UserModel user,
  });
  Future<Either<Failure, bool>> signOut();
}
