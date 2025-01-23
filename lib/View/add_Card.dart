import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

bool isCardsPage = true;
int selectedAccount = 1;
class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2; // Set the initial selected index to 'Wallet'
    InputBorder borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromRGBO(63, 141, 136, 1)),
      borderRadius: BorderRadius.circular(10),
    );
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/statistics');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/wallet');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/profile');
      }
    }

    String orientation = MediaQuery.of(context).orientation.toString();
    double mqw = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    double mqh = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none, // Allows the children to overflow
      children: [
        const Image(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.cover,
        ),
        const Image(
          image: AssetImage('assets/images/design.png'),
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Connect Wallet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Container(
                width: mqw * 0.11,
                height: mqh * 0.05,
                margin: EdgeInsets.only(right: mqw * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(63, 141, 136, 1),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.notification_add_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: mqh, // Set the height to the screen height
              width: double.infinity,
              margin: EdgeInsets.only(top: mqh * 0.04),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: mqw * 0.05, vertical: mqh * 0.02),
                    height: mqh * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: mqw * 0.43,
                          height: mqh * 0.04,
                          decoration: BoxDecoration(
                            color:
                                isCardsPage ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              child: Text(
                                "Cards",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: mqw * 0.04,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isCardsPage = true;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                            width: mqw * 0.43,
                            height: mqh * 0.04,
                            decoration: BoxDecoration(
                              color: isCardsPage
                                  ? Colors.transparent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isCardsPage = false;
                                });
                              },
                              child: Text(
                                "Accounts",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: mqw * 0.04,
                                ),
                              ),
                            )))
                      ],
                    ),
                  ),
                  isCardsPage
                      ? Column(
                          children: [
                            Stack(
                              children: [
                                Center(
                                    child: Container(
                                  width: mqw * 0.7,
                                  height: mqh * 0.2,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromRGBO(87, 227, 185, 1),
                                          Color.fromRGBO(2, 127, 135, 1),
                                        ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                                Center(
                                    child: Image(
                                        alignment: Alignment.bottomCenter,
                                        width: mqw * 0.8,
                                        height: mqh * 0.26,
                                        image: const AssetImage(
                                            'assets/images/Cards.png'))),
                                SizedBox(
                                  height: mqh * 0.24,
                                  width: mqw * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: mqw * 0.18),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("6219",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text("6219",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text("6219",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text("6219",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: mqw * 0.21,
                                            right: mqw * 0.03),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Names",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'IBM Plex Mono',
                                                )),
                                            SizedBox(
                                              width: mqw * 0.1,
                                            ),
                                            Text("Date",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: mqw * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'IBM Plex Mono',
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mqw * 0.07, vertical: mqh * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Add your Debit Card",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: mqw * 0.05,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      'This card must be connected to a bank account under your name',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: mqw * 0.035,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: mqh * 0.02),
                                    child: customFields(mqw,mqh,'Name on Card','Name')
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child:
                                      customFields(mqw, mqh, 'Debit Card Number','Debit Card Number'),
                                      ),
                                      SizedBox(width: mqw * 0.02),
                                      Expanded(
                                        flex: 1,
                                        child:
                                      customFields(mqw, mqh, 'CVV','CVV'),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: mqw * 0.04),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,child: customFields(mqw, mqh, 'EXPIRATION MM/YY','EXPIRATION')),
                                      SizedBox(width: mqw * 0.02),
                                      Expanded(
                                          flex: 1,
                                          child: customFields(mqw, mqh, 'ZIP','ZIP')),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAccount = 1;
                                  });
                                },
                              child: accounts(mqw, mqh,
                                  'assets/images/bank.png',
                                  'Bank Link',
                                  'Connect your bank account to deposit & fund',
                                  1)

                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAccount = 2;
                                  });
                                },
                              child: accounts(mqw, mqh,
                                  'assets/images/currency.png',
                                  'Micro Deposits',
                                  'Connect bank in 5-7 days',
                                  2)
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAccount = 3;
                                  });
                                },
                              child: accounts(mqw, mqh,
                                  'assets/images/paypal.png',
                                  'Paypal',
                                  'Connect your paypal account',
                                  3)
                            ),
                            SizedBox(
                              height: mqh * 0.1,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mqw * 0.4, vertical: mqh * 0.02),
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                        color: Color.fromRGBO(63, 141, 136, 1)),
                                  ),
                                ),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Color.fromRGBO(63, 141, 136, 1),
                                      fontSize: mqw * 0.04),
                                ))
                          ],
                        )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromRGBO(63, 141, 136, 1),
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        )
      ],
    );
  }

Widget customFields(double mqw, double mqh, String hintText, String labelText) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(63, 141, 136, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(63, 141, 136, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: mqw * 0.04,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: mqw * 0.04,
        ),
        labelText: labelText,
      ),
    );

  }
  Widget accounts(double mqw, double mqh, String imagePath, String title, String subtitle, int selectedAcc) {
    return Container(
      decoration: BoxDecoration(
        color: selectedAccount == selectedAcc ? Colors.green[50]: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),

      ),
      padding: EdgeInsets.symmetric(
          horizontal: mqw * 0.05, vertical: mqh * 0.02),
      height: mqh * 0.13,
      margin: EdgeInsets.symmetric(
          horizontal: mqw * 0.05, vertical: mqh * 0.01),
      width: mqw * 0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              width: mqw * 0.1,
              height: mqh * 0.05,
              color:  selectedAccount == selectedAcc ?  const Color.fromRGBO(63, 141, 136, 1) : Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(left:  mqw * 0.04,right: mqw * 0.13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: mqw * 0.05,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: mqw * 0.4,
                    child: Text(subtitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: mqw * 0.03,
                        )),
                  ),
                ],
              ),
            ),
            selectedAccount == selectedAcc ? Icon(Icons.check_circle,
              color: const Color.fromRGBO(63, 141, 136, 1),
              size: mqw * 0.1,) : Container(),
          ],
        ),
      ),
    );
  }
}
