import 'package:qrscan/qrscan.dart' as scanner;

Future<String> scan() async{
        String barCode = await scanner.scan();
        return barCode;
}