import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:association_members/association_members.dart';

testMembers() {
  var model = MembershipModel.one();
  Members members = model.members;
  var robert = 'rwm@gmail.com';
  var ogden = 'ogdenr@gmail.com';
  var anne = 'anned@gmail.com';
  group('Testing Members', () {
    test('Add member', () {
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Mantha';
      member.firstName = 'Robert';
      member.email = robert;
      var added = members.add(member);
      expect(added, isTrue);
      members.display('Add member');
    });
    test('Update member', () {
      var member = members.find(robert);
      expect(member, isNotNull);
      var email = 'robert.mantha@gmail.com';
      member.email = email;
      expect(member.email, equals(email));
      members.display('Update member');
    });
    test('Add member, update member, remove member', () {
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Daneault';
      member.firstName = 'Anne';
      member.email = anne;
      var added = members.add(member);
      expect(added, isTrue);

      var name = 'Anne Marie';
      member.firstName = 'Anne Marie';
      expect(member.firstName, equals(name));

      var length = members.length;
      members.remove(member);
      expect(members.length, equals(--length));

      members.display('Add member, update member, remove member');
    });
  });
}

main() {
  testMembers();
}

