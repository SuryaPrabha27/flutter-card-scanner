class CardScanResponse{
  String result;
  Result body;
  String responseText;

  CardScanResponse({this.result,this.body,this.responseText});

  factory CardScanResponse.fromJSON(Map<String, dynamic> json) {
    return CardScanResponse(
      result: json['result'],
      body: Result.fromJSON(json['body']),
      responseText: json['responseText'],
    );
  }
}

class Result {
  String cardholderName;
  String expiry;

  Result({this.cardholderName,this.expiry});

  factory Result.fromJSON(Map<String, dynamic> json) {
    return Result(
      cardholderName: json['Cardholders Name'],
      expiry: json['expiry']
    );
  }
}