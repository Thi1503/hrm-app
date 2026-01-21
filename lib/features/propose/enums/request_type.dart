enum RequestType {
  explanation('EXPLANATION'),
  leave('LEAVE'),
  ot('OT'),
  remote('REMOTE');

  final String value;
  const RequestType(this.value);

  @override
  String toString() => value;
}
