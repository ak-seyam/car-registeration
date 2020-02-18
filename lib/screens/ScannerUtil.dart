import 'package:qrscan/qrscan.dart' as scanner;

Future<String> scan() async{
        String carCode = await scanner.scan();
        return carCode;
}