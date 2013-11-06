part of association_members;

class Association extends ConceptEntity<Association> {
  String _name;
  String description;
  Memberships memberships = new Memberships(); // internal relationship

  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }

  Association newEntity() => new Association();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    name: ${name}\n'
           '    description: ${description}\n'
           '  }\n';
  }
}

class Associations extends ConceptEntities<Association> {
  Associations newEntities() => new Associations();
  Association newEntity() => new Association();
}

