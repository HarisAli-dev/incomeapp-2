class TransactionDetailsModel {
  String avatarPath;
  String transactionStatus;
  String transactionDate;
  String transactionTime;
  String transactionFrom;
  int transactionAmount;
  int transactionFee;
  int transactionTotal;

  TransactionDetailsModel({
    required this.avatarPath,
    required this.transactionStatus,
    required this.transactionDate,
    required this.transactionTime,
    required this.transactionFrom,
    required this.transactionAmount,
    required this.transactionFee,
    required this.transactionTotal,
  });

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailsModel(
      avatarPath: json['avatarPath'],
      transactionStatus: json['transactionStatus'],
      transactionDate: json['transactionDate'],
      transactionTime: json['transactionTime'],
      transactionFrom: json['transactionFrom'],
      transactionAmount: json['transactionAmount'],
      transactionFee: json['transactionFee'],
      transactionTotal: json['transactionTotal'],
    );
  }
}