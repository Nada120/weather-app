import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';
import '../provider/weather_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff334d4d),
        title: const Text('SEARCH A CITY'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/searching.gif',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              onFieldSubmitted: (value)  async {
                WeatherService service = WeatherService();
                Weather? weather = await service.getWeather(cityName: value);
                if (weather == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(snackBar());
                }
                else {
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context, listen: false).city = value;
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff006666),
                  ),
                ),
                label: const Text('Enter City Name'),
                labelStyle: const TextStyle(color: Color(0xff006666)),
                suffixIcon: const Icon(
                  Icons.search, 
                  color: Color(0xff006666),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

SnackBar snackBar() {
  return const SnackBar(
    content: Text('Please Enter correct city'),
    backgroundColor: Color(0xff800000),
  );
}