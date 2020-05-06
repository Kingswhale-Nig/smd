class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final int openingKit;
  final int receivedKit;
  final int fixedKit;
  final int returnedFixedKit;
  final int kitFixedNotRetruned;
  final int irreparableKit;
  final int closingKit;

  UserData(
      {this.uid,
      this.openingKit,
      this.receivedKit,
      this.fixedKit,
      this.returnedFixedKit,
      this.kitFixedNotRetruned,
      this.irreparableKit,
      this.closingKit});
}
