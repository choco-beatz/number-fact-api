class Trivia {
  String fact;
  int number;
  bool found;
  String type;

  Trivia(
      {required this.fact,
      required this.number,
      required this.found,
      required this.type});

  factory Trivia.fromJson(Map<String,dynamic> json){
    return Trivia(fact: json['text']??'', number: json['number']??'', found: json['found']??'', type: json['type']??'');
  }
}
