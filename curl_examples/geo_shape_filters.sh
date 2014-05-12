#!/bin/bash

echo 'Find geoshapes enclosing given point:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "geo_shape": {
          "geometry": {
            "shape": {
              "type": "point",
              "coordinates": [-70.98738336570291, 42.32205520302108]
            }
          },
          "_cache": true
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes enclosed by given envelope:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "geo_shape": {
          "geometry": {
            "shape": {
              "type": "envelope",
              "coordinates": [
                [-70.99004745483398, 42.329171749135625],
                [-70.96095085144043, 42.312036936710626]
              ]
            }
          },
          "_cache": true
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes enclosing given envelope:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "geo_shape": {
          "geometry": {
            "shape": {
              "type": "envelope",
              "coordinates": [
                [-70.98809480667114, 42.32703808473678],
                [-70.98589539527893, 42.32626867870565]
              ]
            }
          },
          "_cache": true
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find documents with points enclosed by referenced geoshape:'
curl -XGET 'localhost:9200/examples/addresses/_search?pretty' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "geo_shape": {
          "location": {
            "indexed_shape": {
              "id": "spectacle_island-boston-massachusetts-usa",
              "type": "places",
              "index": "examples",
              "path": "geometry"
            }
          },
          "_cache": true
        }
      }
    }
  }
}'
echo
