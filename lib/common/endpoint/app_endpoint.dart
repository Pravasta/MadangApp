import 'uri_helper.dart';

class AppEndPoint {
  final String _baseUrl;

  AppEndPoint(this._baseUrl);

  Uri getListRestaurant() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'list',
    );
  }

  Uri getDetailRestaurant(String id) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'detail/$id',
    );
  }

  Uri getSearchRestaurant(String query) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'search',
      querryParameters: {'q': query},
    );
  }

  Uri postAddReview() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: 'review',
    );
  }
}
