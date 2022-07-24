import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example_app/data/models/login_model.dart';
import 'package:example_app/data/models/random_list_model.dart';
import 'package:example_app/data/webclient.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Repository{
   Future<RandomListModel> viewRandomList({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final RandomListModel productList = RandomListModel.fromJson(response);
    return productList;
  }
   Future<LoginModel> login({required String url,required data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }
}