import 'package:envied/envied.dart';
part "env.g.dart";

@Envied(path: 'scripts/env/.env')
abstract class Env {
  //varNameに設定する名前は「.envファイル」内に記載している「キーの名前」を記入する
  @EnviedField(varName: 'Example_APIKEY', obfuscate: true)
  static String pass1 = _Env.pass1;
}
