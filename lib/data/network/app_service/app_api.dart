import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shopease/app/constants.dart';
import 'package:shopease/data/network/responses/remote_responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppAPIServiceClient {
  factory AppAPIServiceClient(Dio dio, {String baseUrl}) = _AppAPIServiceClient;

  @GET("/products{options}")
  Future<ProductsResponse> getProducts(
    @Path("options") String options,
    @Query("apiKey") String apiKey,
    @Query("format") String format,
    @Query("show") String show,
    @Query("pageSize") int pageSize,
    @Query("page") int page,
    @Query("sort") String sort,
  );
}
