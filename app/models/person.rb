require 'date'
class Person
  def initialize(first_name:, city:, birthdate:, last_name:nil)
    @first_name = first_name
    @city = city
    @birthdate = format_date(birthdate)
    @last_name = last_name
  end

  def format output_format
    final_output = ""
    output_format.each do |key|
      val = self.public_send(key)      
      val = DICT[val.to_sym] if DICT[val.to_sym]
      final_output += val + ", "
    end
    final_output.chomp(", ")
  end
  
  attr_reader :first_name, :city, :birthdate, :last_name

  private
  def format_date date_str
    Date.parse(date_str).strftime(DATE_FORMAT)
  end

end
