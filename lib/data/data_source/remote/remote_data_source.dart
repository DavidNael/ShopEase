import 'package:shopease/data/network/requests/remote_requests.dart';
import 'package:shopease/data/network/responses/remote_responses.dart';
import 'package:shopease/domain/models/user_model.dart';

import '../../network/app_service/app_api.dart';
import '../../network/app_service/app_firebase.dart';

abstract class RemoteAPIDataSource {
  Future<ProductsResponse> getProducts({required ProductsRequest request});
}

class RemoteAPIDataSourceImpl implements RemoteAPIDataSource {
  final AppAPIServiceClient appServiceClient;

  RemoteAPIDataSourceImpl(this.appServiceClient);

  @override
  Future<ProductsResponse> getProducts(
      {required ProductsRequest request}) async {
    return await appServiceClient.getProducts(
      request.options,
      request.apiKey,
      request.format,
      request.show,
      request.pageSize,
      request.page,
      request.sort,
    );
  }
}

abstract class RemoteFirebaseDataSource {
  Future<UserModel> getUser({required String id});
  Future<UserModel> createUser({required UserModel user});
  Future<UserModel> updateUser({required UserModel user});
  Future<void> deleteUser({required String id});

  Future<UserModel> signInWithEmailAndPassword({required UserModel user});
  Future<UserModel> signInWithGoogle({required UserModel user});
  Future<void> signOut();
}

class RemoteFirebaseDataSourceImpl implements RemoteFirebaseDataSource {
  final AppFirebaseServiceClient appFirebaseServiceClient;

  RemoteFirebaseDataSourceImpl(this.appFirebaseServiceClient);

  @override
  Future<UserModel> getUser({required String id}) async {
    return await appFirebaseServiceClient.getUser(id: id);
  }

  @override
  Future<UserModel> createUser({required UserModel user}) async {
    return await appFirebaseServiceClient.signUpWithEmailAndPAssword(
        user: user);
  }

  @override
  Future<UserModel> updateUser({required UserModel user}) async {
    return await appFirebaseServiceClient.updateUser(newUser: user);
  }

  @override
  Future<void> deleteUser({required String id}) async {
    return await appFirebaseServiceClient.deleteUser(id: id);
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      {required UserModel user}) async {
    return await appFirebaseServiceClient.signInWithEmailAndPassword(
        user: user);
  }

  @override
  Future<UserModel> signInWithGoogle({required UserModel user}) async {
    return await appFirebaseServiceClient.signInWithGoogle(user: user);
  }

  @override
  Future<void> signOut() async {
    return await appFirebaseServiceClient.signOut();
  }
}
