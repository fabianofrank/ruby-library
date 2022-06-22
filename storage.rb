require_relative 'app'
require 'json'

module DataStorage
  def save_people
    data = []
    @people.each do |person|
      data << if person.instance_of?(Student)
                { class: person.class.name, id: person.id, age: person.age, name: person.name,
                  parent_permission: person.parent_permission }
              else
                { id: person.id, age: person.age, name: person.name, specialization: person.specialization }
              end
      File.write('people.json', JSON.generate(data))
    end
  end

  def load_people
    data = []
    unless File.zero?('people.json')
      JSON.parse(File.read('people.json')).each do |person|
        data << if person['class'] == 'Student'
                  Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
                else
                  Teacher.new(person['age'], person['name'], person['specialization'])
                end
      end
    end
    data
  end
end
