import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shopease/data/mapper/mapper.dart';
import 'package:shopease/domain/models/user_model.dart';
import 'package:shopease/domain/repository/repository.dart';

import '../../domain/models/products_model.dart';
import '../data_source/local/local_data_source.dart';
import '../data_source/remote/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests/remote_requests.dart';

class RepositoryImpl extends Repository {
  final RemoteAPIDataSource _remoteAPIDataSource;
  final RemoteFirebaseDataSource _remoteFirebaseDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteAPIDataSource,
    this._remoteFirebaseDataSource,
    this._localDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, ProductsModel>> getProducts(
    { required ProductsRequest request}) async {
    /// Get Cached Data
    // try {
    //   final response = await _localDataSource.getHomeData();
    //   return Right(response.toDomain());
    // } catch (cacheError) {
    //   if (kDebugMode) {
    //     print("Cache error is: $cacheError");
    //   }
    // }
    /// Get Data from API
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteAPIDataSource.getProducts(request: request);
        if (response.error == null) {
          // _localDataSource.saveHomeDataToCache(response); //Save To Cache
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.error,
              response.error?.message ?? ResponseMessage.defaultError));
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From API: $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> createUser({required UserModel user}) async {
    if (await _networkInfo.isConnected) {
      try {
        final createdUser =
            await _remoteFirebaseDataSource.createUser(user: user);
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return Right(createdUser);
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From Firebase (Create User): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser({required String id}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteFirebaseDataSource.deleteUser(id: id);
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return const Right(true);
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From Firebase (Delete User): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser({required String id}) async {
    if (await _networkInfo.isConnected) {
      try {
        final user = await _remoteFirebaseDataSource.getUser(id: id);
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return Right(user);
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From Firebase (Get User): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
   {required UserModel user,}
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final currentUser = await _remoteFirebaseDataSource
            .signInWithEmailAndPassword(user: user);
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return Right(currentUser);
      } catch (e) {
        if (kDebugMode) {
          print(
              "Error Getting Data From Firebase (SignIn With Email&Pass): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle({required UserModel user}) {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteFirebaseDataSource.signOut();
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return const Right(true);
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From Firebase (SignOut): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({required UserModel user}) async {
    if (await _networkInfo.isConnected) {
      try {
        final updatedUser =
            await _remoteFirebaseDataSource.updateUser(user: user);
        // _localDataSource.saveHomeDataToCache(response); //Save To Cache
        return Right(updatedUser);
      } catch (e) {
        if (kDebugMode) {
          print("Error Getting Data From Firebase (Update User): $e");
        }
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        DataErrorSource.noInternetConnection.getFailure(),
      );
    }
  }
}
