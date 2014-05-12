#!/bin/bash

echo 'Find geoshapes enclosing given point:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "point",
          "coordinates": [-70.98738336570291, 42.32205520302108]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given linestring:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "linestring",
          "coordinates": [
            [-70.99571228027344, 42.328410301001064],
            [-70.96816062927245, 42.31013278063333]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given polygon:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "polygon",
          "coordinates": [
            [
              [-70.99571228027344, 42.328410301001064],
              [-70.96816062927245, 42.31013278063333],
              [-70.95897674560547, 42.32104916050047],
              [-70.98386764526367, 42.33399403994019],
              [-70.99571228027344, 42.328410301001064]
            ]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given polygon with a hole:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "polygon",
          "coordinates": [
            [
              [-70.99528312683105, 42.33050426119193],
              [-70.99425315856934, 42.320287614049185],
              [-70.98790168762207, 42.31349675069181],
              [-70.97777366638184, 42.30689558309938],
              [-70.96412658691406, 42.30670515453065],
              [-70.95829010009764, 42.31521040216135],
              [-70.9511661529541, 42.32676046508905],
              [-70.9507369995117, 42.33412093733701],
              [-70.96515655517578, 42.33545334454516],
              [-70.97888946533203, 42.337293289044],
              [-70.99013328552246, 42.3357071331938],
              [-70.99528312683105, 42.33050426119193]
            ],
            [
              [-70.9910774230957, 42.329235202730786],
              [-70.99348068237303, 42.32714120029391],
              [-70.9907341003418, 42.31984337436276],
              [-70.98429679870605, 42.316987472919024],
              [-70.97906112670898, 42.3243490886139],
              [-70.97906112670898, 42.32910829547648],
              [-70.98524093627928, 42.33164639191572],
              [-70.9910774230957, 42.329235202730786]
            ]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes enclosing given multipoint:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "multipoint",
          "coordinates": [
            [-70.98635673522949, 42.32466638027291],
            [-70.96489906311035, 42.32219146289536]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given multilinestring:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "multilinestring",
          "coordinates": [
            [
              [-70.99579811096191, 42.32428563009011],
              [-70.97888946533203, 42.32428563009011]
            ],
            [
              [-70.97373962402342, 42.32168377550236],
              [-70.95537185668945, 42.32168377550236]
            ]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given multipolygon:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "multipolygon",
          "coordinates": [
            [
              [
                [-70.99270820617676, 42.328156482907914],
                [-70.99039077758789, 42.31832024305584],
                [-70.98369598388672, 42.31787598947991],
                [-70.98103523254395, 42.322318384103525],
                [-70.98223686218262, 42.329552469746424],
                [-70.99270820617676, 42.328156482907914]
              ]
            ],
            [
              [
                [-70.96996307373047, 42.32314336571585],
                [-70.97906112670898, 42.311909994764285],
                [-70.97640037536621, 42.30854593989868],
                [-70.96438407897949, 42.31298899314741],
                [-70.95168113708496, 42.33101187740732],
                [-70.95605850219727, 42.33253470147381],
                [-70.96052169799805, 42.33215399891373],
                [-70.96996307373047, 42.32314336571585]
              ]
            ]
          ]
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
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "envelope",
          "coordinates": [
            [-70.99004745483398, 42.329171749135625],
            [-70.96095085144043, 42.312036936710626]
          ]
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
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "envelope",
          "coordinates": [
            [-70.98809480667114, 42.32703808473678],
            [-70.98589539527893, 42.32626867870565]
          ]
        }
      }
    }
  },
  "fields": ["name", "pin"]
}'
echo

echo 'Find geoshapes intersecting given circle:'
curl -XGET 'localhost:9200/examples/places/_search?pretty' -d '{
  "query": {
    "geo_shape": {
      "geometry": {
        "shape": {
          "type": "circle",
          "coordinates": [-70.97588539123535, 42.32282606637588],
          "radius": "1500m"
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
    "geo_shape": {
      "location": {
        "indexed_shape": {
          "id": "spectacle_island-boston-massachusetts-usa",
          "type": "places",
          "index": "examples",
          "path": "geometry"
        }
      }
    }
  }
}'
echo
