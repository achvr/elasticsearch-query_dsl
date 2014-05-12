require 'spec_helper'

describe Elasticsearch::QueryDsl::GeoShapeQuery do
  let(:geo_shape_query_by_point_json) do
    {
      geo_shape: {
        geometry: {
          shape: {
            type: 'point',
            coordinates: [-70.98738336570291, 42.32205520302108]
          }
        }
      }
    }.to_json
  end
  let(:geo_shape_query_by_envelope_json) do
    {
      geo_shape: {
        geometry: {
          shape: {
            type: 'envelope',
            coordinates: [[-70.99004745483398, 42.329171749135625],
                          [-70.96095085144043, 42.312036936710626]]
          }
        }
      }
    }.to_json
  end

  it 'should support using shape syntax' do
    subject.update do
      field 'geometry'
      shape do
        type 'point'
        coordinates [-70.98738336570291, 42.32205520302108]
      end
    end
    expect(subject.to_json).to be_json_eql(geo_shape_query_by_point_json)
  end

  it 'should support using envelope shortcut syntax' do
    subject.update do
      field 'geometry'
      envelope do
        coordinates [
          [-70.99004745483398, 42.329171749135625],
          [-70.96095085144043, 42.312036936710626]
        ]
      end
    end
    expect(subject.to_json).to be_json_eql(geo_shape_query_by_envelope_json)
  end
end
