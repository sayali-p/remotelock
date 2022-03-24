class Parser
  def initialize
  end

  def main input, order_by, output_format
    persons = parse(input)
    persons = sort(persons, order_by)
    format(persons, output_format)
  end

  private

  def parse input
    persons = []
    rows = (input || "").split("\n");
    if rows.length > 0
      formatter = rows.first.split(" ")[1]
      column_names = rows.shift.split(formatter).map(&:strip).collect(&:to_sym)
      rows.each_with_index do |row, i|
        tokens = row.split(formatter).map(&:strip)
        begin
          new_person = Person.new(**column_names.zip(tokens).to_h)
          persons << new_person
        rescue Exception => e
          print("Error in creating Person. Exception is #{e.message}")
        end
      end
    end
    persons
  end

  def sort persons, order_by
    persons.sort_by { |person| person.public_send(order_by) }
  end

  def format persons, output_format
    formatted_persons = []
    persons.each do |person|
      formatted_persons << person.format(output_format)
    end
    formatted_persons
  end

end
