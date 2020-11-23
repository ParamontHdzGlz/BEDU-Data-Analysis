# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://bedu-admin:hola123@bedu-cluster.0fhlu.mongodb.net/?authSource=admin&replicaSet=atlas-x7e8us-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true')

#pregunta 1
filter={
    'house_rules': re.compile(r"no *part(y|ie)(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#pregunta 2
filter={
    'house_rules': re.compile(r"pets? *(allowed|permitted)(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#pregunta 3
filter={
    'house_rules': re.compile(r"not? *smok(er?|ing)(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#pregunta 4
filter={
    'house_rules': re.compile(r"not? *smok(er?|ing).*not? *part(y|ie)(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)