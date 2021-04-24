class Signature {
  final String title;
  final double value;
  // final String description;
  // final String type;
  // final String expireDate;
  // final bool automaticRenovation;
  //
  //   Signature(this.title,  this.value,  this.description,this.type,
  //  this.expireDate, this.automaticRenovation);

  Signature(
    this.title,
    this.value,
  );

  @override
  String toString() {
    return 'Signature{title: $title, value: $value}';
  }
}
