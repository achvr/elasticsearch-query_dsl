require 'spec_helper'

describe Elasticsearch::QueryDsl::TermQuery do
  context '#to_hash' do
    let(:query) { Elasticsearch::QueryDsl::TermQuery.new }
    let(:hash)  { query.to_hash }

    it 'returns a Hash' do
      expect(hash).to be_a(Hash)
    end
  end
end
