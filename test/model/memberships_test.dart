import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:association_members/association_members.dart';

testMemberships() {
  var model = MembershipModel.one();
  Members members = model.members;
  Associations associations = model.associations;
  var dzenan = 'dzenanr@gmail.com';
  var readingClub = 'Books with prizes';
  group('Testing Memberships', () {
    test('Add membership', () {
      var member = new Member();
      expect(member, isNotNull);
      member.lastName = 'Ridjanovic';
      member.firstName = 'Dzenan';
      member.email = dzenan;
      var added = members.add(member);
      expect(added, isTrue);
      members.display('Add member');

      var association = new Association();
      expect(association, isNotNull);
      association.name = readingClub;
      association.description = 'reading books that won prizes';
      added = associations.add(association);
      expect(added, isTrue);
      associations.display('Add association');

      var membership = new Membership();
      expect(membership, isNotNull);
      membership.member = member;
      membership.association = association;
      membership.description = 'write a paper';
      added = member.memberships.add(membership);
      expect(added, isTrue);
      member.memberships.display('Add member membership');
      added = association.memberships.add(membership);
      expect(added, isTrue);
      association.memberships.display('Add association membership');
    });
  });
}

main() {
  testMemberships();
}

