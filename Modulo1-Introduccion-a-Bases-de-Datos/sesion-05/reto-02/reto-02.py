# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://bedu-admin:hola123@bedu-cluster.0fhlu.mongodb.net/?authSource=admin&replicaSet=atlas-x7e8us-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'number_of_reviews': {
        '$gte': 50
    }, 
    'review_scores.review_scores_rating': {
        '$gte': 80
    }, 
    'amenities': re.compile(r"ethernet(?i)"), 
    'address.country_code': 'BR'
}
project={
    'number_of_reviews': 1, 
    'review_scores.review_scores_rating': 1, 
    'amenities': re.compile(r"ethernet(?i)"), 
    'amenities.$': 1, 
    'address.country_code': 1
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter,
  projection=project
)