# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://bedu-admin:hola123@bedu-cluster.0fhlu.mongodb.net/?authSource=admin&replicaSet=atlas-x7e8us-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
result = client['sample_airbnb']['listingsAndReviews'].aggregate([
    {
        '$match': {
            'amenities': {
                '$in': [
                    re.compile(r"wifi(?i)"), re.compile(r"ethernet(?i)")
                ]
            }
        }
    }, {
        '$count': 'arbnb\'s conacceso a wifi o ethernet'
    }
])