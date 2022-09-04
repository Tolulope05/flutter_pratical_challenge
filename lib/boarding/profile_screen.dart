import 'package:flutter/material.dart';

// this is an profile screen that sets state of properties on each tap
// From Viajes Project: Last portfolio work from Julitech Solutions.

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentScreen = 0;
  bool _notificationSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Image.network(
                    "https://source.unsplash.com/random",
                    height: 130,
                    width: 90,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Camilo Carrera",
                          style: TextStyle(
                            color: Color(0xff131313),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Barcelona",
                          style: TextStyle(
                            color: Color(0xfffead0b),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "ccarrera@gmail.com",
                          style: TextStyle(
                            color: Color(0xff131313),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //navigate
                    },
                    icon: Image.network(
                      'https://source.unsplash.com/random',
                      height: 25,
                      width: 25,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 34),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = 0;
                        });
                      },
                      child: Container(
                        // width: 110,
                        height: 123,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1e372707),
                              blurRadius: 16,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: const Color(0xfffcfcfc),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: currentScreen == 0
                                  ? Colors.greenAccent
                                  : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Ver\nFavoritos",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: currentScreen == 0
                                    ? Colors.greenAccent
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = 1;
                        });
                      },
                      child: Container(
                        // width: 110,
                        height: 123,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1e372707),
                              blurRadius: 16,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: const Color(0xfffcfcfc),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.time_to_leave,
                                color: currentScreen == 1
                                    ? Colors.greenAccent
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Cambiar \nOrigen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: currentScreen == 1
                                    ? Colors.greenAccent
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentScreen = 2;
                        });
                      },
                      child: Container(
                        // width: 110,
                        height: 123,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1e372707),
                              blurRadius: 16,
                              offset: Offset(4, 4),
                            ),
                          ],
                          color: const Color(0xfffcfcfc),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              color: currentScreen == 2
                                  ? Colors.greenAccent
                                  : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Encender/\nApagar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: currentScreen == 2
                                    ? Colors.greenAccent
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              if (currentScreen == 0) Center(child: Text(" Demo Tab 1")),
              if (currentScreen == 1) Center(child: Text(" Drop down list 2")),
              if (currentScreen == 2)
                SwitchListTile(
                  title: const Text(
                    "Notificaciones",
                    style: TextStyle(
                      color: Color(0xff131313),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    "Encender/Apagar",
                    style: TextStyle(
                      color: Color(0xff131313),
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      _notificationSwitch = value;
                    });
                  },
                  value: _notificationSwitch,
                  activeColor: const Color(0xfffead0b),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
