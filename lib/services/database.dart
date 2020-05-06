import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smd/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference smdCollection = Firestore.instance.collection('kitReport');

  Future<void> updateUserData(String openingKit,
  String receivedKit,
  String fixedKit,
  String returnedFixedKit,
  String kitFixedNotRetruned,
  String irreparableKit,
  String closingKit,
  ) async {
    return await smdCollection.document(uid).setData({
      'a.openingKit': openingKit,
      'b.receivedKit': receivedKit,
      'c.fixedKit': fixedKit,
      'd.returnedFixedKit': returnedFixedKit,
      'e.kitFixedNotRetruned': kitFixedNotRetruned,
      'f.irreparableKit': irreparableKit,
      'g.closingKit': closingKit,
    });
  }

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  addData(kitReportObj) async {
    if (isLoggedIn()) {
      smdCollection.add(kitReportObj).catchError((e) {
        print(e);
      });
    }else{
      print('You need to be logged in');
    }
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      openingKit : snapshot.data['openingKit'],
      receivedKit: snapshot.data['receivedKit'],
      fixedKit: snapshot.data['fixedKit'],
      returnedFixedKit: snapshot.data['returnedFixedKit'],
      kitFixedNotRetruned: snapshot.data['kitFixedNotRetruned'],
      irreparableKit : snapshot.data['irreparableKit'],
      closingKit: snapshot.data['closingKit']
    );
  }


  // get user doc stream
  Stream<UserData> get userData {
    return smdCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}