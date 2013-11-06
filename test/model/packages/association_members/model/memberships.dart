part of association_members;

class Membership extends ConceptEntity<Membership> {
  Association _association;
  Member _member;
  String description;

  Association get association => _association;
  set association(Association association) {
    _association = association;
    if (code == null && member != null) {
      code = '${association.code}-${member.code}';
    }
  }

  Member get member => _member;
  set member(Member member) {
    _member = member;
    if (code == null && association != null) {
      code = '${association.code}-${member.code}';
    }
  }

  Membership newEntity() => new Membership();

  String toString() {
    return '    {\n'
           '      code: ${code}\n'
           '      association.name: ${association.name}\n'
           '      member.email: ${member.email}\n'
           '      description: ${description}\n'
           '    }\n';
  }
}

class Memberships extends ConceptEntities<Membership> {
  Memberships newEntities() => new Memberships();
  Membership newEntity() => new Membership();
}

