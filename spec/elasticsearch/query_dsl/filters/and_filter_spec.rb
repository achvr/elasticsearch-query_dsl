require 'spec_helper'

describe Elasticsearch::QueryDsl::AndFilter do
  context '#to_hash' do
    it 'returns a Hash' do
      expect(subject.to_hash).to be_a(Hash)
    end
  end

  context '#to_json' do
    let(:and_filter_json)            { %({"and":[{"term":{"address_id":2}},{"term":{"user_id":3}}]}) }
    let(:and_filter_json_cache_true) { %({"and":{"filters":[{"term":{"address_id":2}},{"term":{"user_id":3}}],"_cache":true}}) }

    it 'long form with cache' do
      subject.update do
        filters do
          term{field{'address_id'}.value(2)}
          term{field{'user_id'}.value(3)}
        end
        cache true
      end
      expect(subject.to_json).to be_json_eql(and_filter_json_cache_true)
    end

    it 'long form without cache' do
      subject.update do
        filters do
          term{field{'address_id'}.value(2)}
          term{field{'user_id'}.value(3)}
        end
      end
      expect(subject.to_json).to be_json_eql(and_filter_json)
    end

    it 'short form with cache' do
      subject.update do
        term{field{'address_id'}.value(2)}
        term{field{'user_id'}.value(3)}
        cache true
      end
      expect(subject.to_json).to be_json_eql(and_filter_json_cache_true)
    end

    it 'short form without cache' do
      subject.update do
        term{field{'address_id'}.value(2)}
        term{field{'user_id'}.value(3)}
      end
      expect(subject.to_json).to be_json_eql(and_filter_json)
    end
  end

  context 'attributes' do
    it do
      top_attrs = [:cache, :_cache, :filters]
      top_attrs += Elasticsearch::QueryDsl.component_method_names(:filters)
      top_attrs += Elasticsearch::QueryDsl::component_method_aliases(:filters)
      top_attrs.each do |attr|
        expect(subject).to respond_to(attr)
      end
      filters_attrs = Elasticsearch::QueryDsl.component_method_names(:filters)
      filters_attrs += Elasticsearch::QueryDsl::component_method_aliases(:filters)
      filters_attrs.each do |attr|
        expect(subject.filters).to respond_to(attr)
      end
    end
  end
end
