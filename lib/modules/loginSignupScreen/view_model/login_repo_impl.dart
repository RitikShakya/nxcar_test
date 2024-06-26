import 'package:nxcar_test/modules/loginSignupScreen/view_model/login_details_repo.dart';
import 'package:http/http.dart' as http;

class LoginSignupRepoImpl implements LoginSignupRepo {
  @override
  Future sendOtp(number) {
    var res;

    http: //api.hfnmandi.com:3001/auth/login?number=9650373038&truecaller=false&truecaller_token=abcd

    try {
      var url = Uri.http(
          "beta.api.hfnmandi.com:3001", "/auth/login", {"number": number});

      res = http.get(
        url,
      );
    } catch (e) {
      print("exception here ${e}");
    }
    return res;
  }
}
