import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../models/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    Weather? weather =  Provider.of<WeatherProvider>(context).weatherData;
    String? city = Provider.of<WeatherProvider>(context).city;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff334d4d),
        title: const Text('WEATHER APP'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ));
            }, 
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: weather == null ? const Center(
        child: Text(
          'There is no weather 😔, Start searching now 🔍',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            color:  Color(0xff006666),
            fontWeight: FontWeight.w500,
          ),
        ),
      ) : Container(
        color: weather.getImage() == 'assets/images/rainy.gif'? const Color(0xff22292f) : Colors.white,
        child: Column(
          children: [
            Image.asset(
              weather.getImage(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.4,
            ),
            Text(
              city!,
              style: const TextStyle(
                color: Color(0xff006666),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather.date,
              style: const TextStyle(
                color: Color(0xff006666),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${weather.temp.toInt()}',
                  style: const TextStyle(
                    color: Color(0xff006666),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${weather.maxTemp.toInt()}',
                      style: const TextStyle(
                        color: Color(0xff006666),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${weather.minTemp.toInt()}',
                      style: const TextStyle(
                        color: Color(0xff006666),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Text(
              weather.weatherStateName,
              style: const TextStyle(
                color: Color(0xff006666),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),   
            ),
          ],
        ),
      ),
    );
  }
}