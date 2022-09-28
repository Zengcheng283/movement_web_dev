import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

const String LocalHost = "localhost";

const int LocalPort = 4040;

const String BilibiliApi = "https://api.bilibili.com";

Future main() async {
  var server =
      await shelf_io.serve(proxyHandler(BilibiliApi), LocalHost, LocalPort);
  server.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  print('Serving at http://${server.address.host}:${server.port}');
}
