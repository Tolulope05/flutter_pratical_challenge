// import 'dart:convert';

// var googleMapsApiKey = "YOUR_API_KEY";
// get http => null;

// class GoogleMapPlaces {
// // <script src="https://gist.github.com/mbaka-bilal/dc781021e76ec60e2f4a4ceac2893509.js"></script>

// //geocoding base url
//   static const String geocodingBaseUrl =
//       "https://maps.googleapis.com/maps/api/geocode/json";
//   static const String googlePlaceDetailsBaseUrl =
//       "https://maps.googleapis.com/maps/api/place/details/json";

//   //convert lat, lng to address, sessionToken can be ignored, used to group requests for easier tracking in google console

//   Future<Map<String, dynamic>> reverseGeoCode(
//       String latitude, String longitude, String sessionToken) async {
//     Uri requestUrl = Uri.parse("${geocodingBaseUrl}?latlng=$latitude,$longitude"
//         "&key=$googleMapsApiKey&sessiontoken=$sessionToken");

//     //if you want addresses without the numbers is in it, but i observed that the results becomes limited, please dm me if you
//     //find a way around this.
//     //&result_type=street_address&location_type=ROOFTOP

//     var response = await http.get(requestUrl).timeout(Duration(seconds: 30));

//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       return result;
//     }
//     return {};
//   }

//   //get the first formatted address,
//   String formattedAddress = result["results"][0]["formatted_address"];
//   //get the place id.
//   String placeId = result["results"][0]["place_id"];

// //get users address from latitude and longitude
//   Future<Map<String, dynamic>> getUsersCountry(
//       String latitude, String longitude) async {
//     Uri requestUrl = Uri.parse(
//         "${AppUrl.geocodingBaseUrl}?latlng=$latitude,$longitude"
//         "&result_type:country&key=$googleMapsApiKey&sessiontoken=getCountry");

//     var response = await http.get(requestUrl);

//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       return result;
//     }
//     return {};
//   }

// //or use place id (recommended by google)
//   Future<Map<String, dynamic>> placeDetails(
//       String placeId, String sessionToken) async {
//     Uri requestUrl = Uri.parse("${googlePlaceDetailsBaseUrl}?place_id=$placeId"
//         "&key=$googleMapsApiKey&sessiontoken=$sessionToken");

//     var response = await http.get(requestUrl);
//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       return result;
//     }
//     return {};
//   }

// //get the current latitude and longitude from the response
// //I used the placeID and not longitude and latitude in my code the response might be the same.
//   Map<String, dynamic> location =
//       placeDetails["result"]["geometry"]["location"];
//   final lat = location["lat"];
//   final long = location["lng"];

// //TOO lazy to create a model class for the responses so i just picked the ones i needed, check their documentation for the
// //full response.
// }
