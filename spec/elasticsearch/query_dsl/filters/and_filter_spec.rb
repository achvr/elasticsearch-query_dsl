require 'spec_helper'

describe Elasticsearch::QueryDsl::AndFilter do
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
  end
end
