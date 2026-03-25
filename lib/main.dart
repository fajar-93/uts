import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menu = [
    {"icon": Icons.send, "title": "Transfer"},
    {"icon": Icons.account_balance, "title": "BRIVA"},
    {"icon": Icons.water_drop, "title": "PDAM"},
    {"icon": Icons.phone_android, "title": "Pulsa"},
  ];

  final List<Map<String, dynamic>> gridMenu = [
    {"icon": Icons.add, "title": "Top Up"},
    {"icon": Icons.credit_card, "title": "BRIZZI"},
    {"icon": Icons.receipt, "title": "Tagihan"},
    {"icon": Icons.send, "title": "Transfer"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Stack(
        children: [
  
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.pink]
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BRImo",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Row(
                        children: [
                          Icon(Icons.notifications, color: Colors.white),
                          SizedBox(width: 10),
                          Icon(Icons.help, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Selamat Sore, Fajar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 20),

               Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                
                    child: ListView(
                      children: [

                        ///  SALDO REKENING UTAMA
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Saldo Rekening Utama",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 10),
                              Row(
                                children: List.generate(
                                  6,
                                  (index) => Container(
                                    margin: EdgeInsets.only(right: 4),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.white),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Semua Rekeningmu",
                                      style:
                                          TextStyle(color: Colors.white)),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.white, size: 14)
                                ],
                              )
                            ],
                          ),
                        ),

                        /// MENU UTAMA 
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: menu.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(item['title'])),
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Colors.blue[50],
                                      child: Icon(item['icon'],
                                          color: Colors.blue),
                                    ),
                                    SizedBox(height: 5),
                                    Text(item['title'],
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: 16),
                      ]
                    )
                  )
                )

              ]
            )
          )
        ]
      )
    );
  }
}