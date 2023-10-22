import 'package:dartz/dartz.dart';
import 'package:shopease/data/network/failure.dart';
import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/domain/models/products_model.dart';
import 'package:shopease/domain/models/user_model.dart';
import 'package:shopease/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class UseCaseImpl implements BaseUseCase<ProductsRequest, ProductsModel> {
  final Repository _repository;
  UseCaseImpl(this._repository);
  @override
  Future<Either<Failure, ProductsModel>> getProducts(
      {required ProductsRequest input}) {
    return _repository.getProducts(request: input);
  }

  @override
  Future<Either<Failure, UserModel>> createUser({required UserModel user}) {
    return _repository.createUser(user: user);
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({required UserModel user}) {
    return _repository.updateUser(user: user);
  }

  @override
  Future<Either<Failure, bool>> deleteUser({required String id}) {
    return _repository.deleteUser(id: id);
  }

  @override
  Future<Either<Failure, UserModel>> getUser({required String id}) {
    return _repository.getUser(id: id);
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
      {required UserModel user}) {
    return _repository.signInWithEmailAndPassword(user: user);
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle(
      {required UserModel user}) {
    return _repository.signInWithGoogle(user: user);
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    return _repository.signOut();
  }
}
