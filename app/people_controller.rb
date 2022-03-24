require 'date'
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    output = []
    order = @params[:order]
    output_format = @params[:output_format] || ["first_name", "city", "birthdate"]
    p = Parser.new()
    output += p.main(@params[:percent_format], order, output_format)
    output += p.main(@params[:dollar_format], order, output_format)
  end

  private

  attr_reader :params
end
