import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeapp/Model/transaction_details_model.dart';

class TransactionDetails extends StatefulWidget {
  final TransactionDetailsModel transactionDetails;
  const TransactionDetails({super.key, required this.transactionDetails});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

bool isMenuOpen = false;

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    String orientation = MediaQuery.of(context).orientation.toString();
    double mqw = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;
    double mqh = orientation.substring(12) == "portrait" ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width;
    String status = widget.transactionDetails.transactionStatus;
    return Stack(
      clipBehavior: Clip.hardEdge, // Allows the children to overflow
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
            title: Center(
              child: Text(
                'Transaction Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mqw * 0.05,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: mqw * 0.07,
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
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                    size: mqw * 0.07,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: mqh,
              width: double.infinity,
              margin: EdgeInsets.only(top: mqh * 0.04),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mqw * 0.05, vertical: mqh * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: mqw * 0.2,
                      height: mqh * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(image: AssetImage('assets/images/donut.png')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: mqh * 0.02),
                      width: mqw * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: status == "Income"
                            ? Color.fromRGBO(236, 249, 248, 1)
                            : Color.fromRGBO(254, 239, 238, 1),
                      ),
                      child: Text(
                        status,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: status == "Income"
                              ? Color.fromRGBO(63, 141, 136, 1)
                              : Color.fromRGBO(255, 0, 21, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "\$ ${widget.transactionDetails.transactionTotal.toString()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: mqw * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: mqw * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        isMenuOpen
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = false;
                                  });
                                },
                                icon: const Icon(Icons.keyboard_arrow_up))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = true;
                                  });
                                },
                                icon: const Icon(Icons.keyboard_arrow_down)),
                      ],
                    ),
                    isMenuOpen
                        ? Expanded(
                          child: SizedBox(
                              height: mqh * 0.44,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Status"),
                                      Text(status,
                                          style: TextStyle(
                                            color: status == "Income"
                                                ? Color.fromRGBO(63, 141, 136, 1)
                                                : Color.fromRGBO(255, 0, 21, 1),
                                            fontSize: mqw * 0.04,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      status == "Income" ? Text("From") : Text("To"),
                                      Text(
                                        widget.transactionDetails.transactionFrom,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Time"),
                                      Text(
                                        widget.transactionDetails.transactionTime,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Date"),
                                      Text(
                                        widget.transactionDetails.transactionDate,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 0.5,
                                    width: mqw * 0.9,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      status == "Income"
                                          ? Text("Earnings")
                                          : Text("Spending"),
                                      Text(
                                        "\$ ${widget.transactionDetails.transactionAmount}",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Fee"),
                                      Text(
                                        "-\$ ${widget.transactionDetails.transactionFee}",
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 0.5,
                                    width: mqw * 0.9,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total"),
                                      Text(
                                        "\$ ${widget.transactionDetails.transactionTotal}",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: mqh * 0.02,
                                  ),
                          
                                ],
                              ),
                          ),
                        )
                        : Container(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: mqw * 0.25, vertical: mqh * 0.02),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                                color: Color.fromRGBO(63, 141, 136, 1)),
                          ),
                        ),
                        child: Text(
                          'Download Receipt',
                          style: TextStyle(
                              color: Color.fromRGBO(63, 141, 136, 1),
                              fontSize: mqw * 0.04),
                        ))
                  ],
            
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
