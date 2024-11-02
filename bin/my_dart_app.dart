import 'package:my_dart_app/my_dart_app.dart' as my_dart_app;

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchUserData() async {
  // Define the URL with 10 users to fetch
  final url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
  
  try {
    // Make the HTTP GET request
    final response = await http.get(url);
    
    // Check if the response is successful
    if (response.statusCode == 200) {
      // Decode the JSON data
      List<dynamic> users = json.decode(response.body);
      
      // Loop through each user and print the required details
      for (var user in users) {
        print('${user['uid']}: ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors
    print('Error: $e');
  }
}

void main() async {
  // Call the async function to fetch user data
  await fetchUserData();
}
