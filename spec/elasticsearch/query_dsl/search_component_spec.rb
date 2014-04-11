require 'spec_helper'

describe Elasticsearch::QueryDsl::SearchDefComponent do
  context '#to_hash' do
    let(:filter) { Elasticsearch::QueryDsl::AndFilter.new }

    it 'returns a Hash' do
      expect(filter.to_hash).to be_a(Hash)
    end
  end

  context '#to_json' do
    let(:filter) { Elasticsearch::QueryDsl::AndFilter.new }

    it "has 'and' at the top" do
      expect(filter.to_json).to have_json_path('and')
      expect(filter.to_json).to have_json_type(Array).at_path('and')
    end

    it 'is associated with methods' do
      filter_container = Elasticsearch::QueryDsl::FilterContainer.new
      filter_container.update do
        and_filter do
          term{field{'address_id'}.value(2)}
          term{field{'user_id'}.value(3)}
        end
      end

      puts "JSON: #{filter_container.to_json(:pretty => true)}"

      expect(filter.to_json).to have_json_path('and')
      expect(filter.to_json).to have_json_type(Array).at_path('and')
    end
  end

  context 'attributes' do

  end
end
