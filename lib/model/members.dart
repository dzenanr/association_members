part of association_members;

class Member extends ConceptEntity<Member> {
  String lastName;
  String firstName;
  String _email;
  Memberships memberships = new Memberships(); // external relationship

  String get email => _email;
  set email(String email) {
    _email = email;
    if (code == null) {
      code = email;
    }
  }

  String get name => '${lastName}, ${firstName}';

  Member newEntity() => new Member();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    firstName: ${firstName}\n'
           '    lastName: ${lastName}\n'
           '    email: ${email}\n'
           '  }\n';
  }

  /**
   * Compares two members based on last names, then on first names.
   * If the result is less than 0 then the first member is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(Member member) {
    if (lastName != null && firstName != null) {
      int comparison = lastName.compareTo(member.lastName);
      if (comparison == 0) {
        comparison = firstName.compareTo(member.firstName);
      }
      return comparison;
    }
  }
}

class Members extends ConceptEntities<Member> {
  Members newEntities() => new Members();
  Member newEntity() => new Member();
}

