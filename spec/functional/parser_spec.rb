require 'spec_helper'

RSpec.describe 'Parser Functional Test' do
  describe 'Parse Empty files' do
    let(:params) do
      {
        file_without_header: File.read('spec/fixtures/empty_file.txt'),
        file_with_header: File.read('spec/fixtures/empty_file_with_header.txt'),
        wrong_date: File.read('spec/fixtures/wrong_date.txt'),        
        order: :first_name,
        output_format: ["first_name", "city", "birthdate"]
      }
    end
    let(:parser) { Parser.new() }

    it 'parses empty file without header' do
      parsed_text = parser.main(params[:file_without_header], params[:order], params[:output_format])
      expect(parsed_text).to eq []
    end

    it 'parses empty file with header' do
      parsed_text = parser.main(params[:file_with_header], params[:order], params[:output_format])
      expect(parsed_text).to eq []
    end

    it 'parses and ignores wrong date and parses remaining text' do
      parsed_text = parser.main(params[:wrong_date], params[:order], params[:output_format])
      expect(parsed_text).to eq ["Rigoberto, New York City, 1/5/1962"]
    end

  end
end
