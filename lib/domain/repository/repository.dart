import 'package:dartz/dartz.dart';
import 'package:shopease/data/network/failure.dart';
import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/domain/models/user_model.dart';

import '../models/products_model.dart';

abstract class Repository {
  Future<Either<Failure, ProductsModel>> getProducts({required ProductsRequest request});
  Future<Either<Failure, UserModel>> createUser({required UserModel user});
  Future<Either<Failure, UserModel>> updateUser({required UserModel user});
  Future<Either<Failure, UserModel>> getUser({required String id});
  Future<Either<Failure, bool>> deleteUser({required String id});
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
     { required UserModel user});
  Future<Either<Failure, UserModel>> signInWithGoogle({required UserModel user});
  Future<Either<Failure, bool>> signOut();
}
