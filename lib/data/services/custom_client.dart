part of 'services.dart';

class CustomClient extends http.BaseClient {
  String _inMemoryToken = '';

  void getToken() async {
    if (_inMemoryToken.isNotEmpty) return;

    _inMemoryToken = (await getUserToken())!;
    log(_inMemoryToken);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_inMemoryToken.isNotEmpty) {
      getToken();
      request.headers.putIfAbsent('Authorization', () => _inMemoryToken);
    }
    request.headers.putIfAbsent('Accept', () => 'application/json');

    return request.send();
  }

  //panggil ketika logout
  void reset() {
    _inMemoryToken = '';
  }
}
