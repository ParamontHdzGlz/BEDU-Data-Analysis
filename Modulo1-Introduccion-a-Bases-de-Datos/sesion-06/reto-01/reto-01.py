# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://bedu-admin:hola123@bedu-cluster.0fhlu.mongodb.net/?authSource=admin&replicaSet=atlas-x7e8us-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
result = client['sample_airbnb']['listingsAndReviews'].aggregate([
    {
        '$match': {
            'property_type': re.compile(r"house|home(?i)"), 
            'bedrooms': {
                '$gte': 1
            }
        }
    }, {
        '$addFields': {
            'costo_recamara': {
                '$divide': [
                    '$price', '$bedrooms'
                ]
            }
        }
    }, {
        '$group': {
            '_id': '$address.country', 
            'costo_promedio': {
                '$avg': '$costo_recamara'
            }
        }
    }, {
        '$project': {
            'costo_promedio': {
                '$trunc': [
                    '$costo_promedio', 2
                ]
            }
        }
    }
])