import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:association_members/association_members.dart';

testAssociations() {
  var model = MembershipModel.one();
  Associations associations = model.associations;
  var readingClub = 'Books with prizes';
  group('Testing Associations', () {
    test('Add association', () {
      var association = new Association();
      expect(association, isNotNull);
      association.name = readingClub;
      association.description = 'reading books that won prizes';
      var added = associations.add(association);
      expect(added, isTrue);
      associations.display('Add association');
    });
    test('Update association', () {
      var association = associations.find(readingClub);
      expect(association, isNotNull);
      var description = 'reading books that won at least one prize';
      association.description = description;
      expect(association.description, equals(description));
      associations.display('Update association');
    });
  });
}

main() {
  testAssociations();
}

