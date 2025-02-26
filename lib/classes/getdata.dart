import 'dart:convert';

import 'package:http/http.dart' as http;

class Getdata {
  var phonenumber;
  void loaddata() async {
    final Url = Uri.https('test2-20d77-default-rtdb.firebaseio.com',
        'test-list1tDnKF_ZMWMWZiEMCyj4ZFI7tSMHJuWtqDQ1zwbOxQAo.json');

    try {
      final response = await http.get(Url);

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        //print(response.body);
        // Check if responseData is not null and is a valid JSON object
        if (responseData != null && responseData is Map<String, dynamic>) {
          final Map<String, dynamic> data = responseData;

          // Now you can iterate through each entry and process the data...
          for (final entry in data['Form Responses 1'].entries) {
            final Map<String, dynamic> item = entry.value;
            if (phonenumber == item['Phone number']) {
              phonenumber = item['Phone number'];
            }
          }
        } else if (responseData == null) {
          print("Response body is empty.");
        } else {
          print("Response body is not a valid JSON object.");
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      print("An error occurred: $error");
    }
  }

  // ignore: non_constant_identifier_names
  String data(PhoneNumber) {
    phonenumber = PhoneNumber;
    loaddata();
    return phonenumber;
  }
}
