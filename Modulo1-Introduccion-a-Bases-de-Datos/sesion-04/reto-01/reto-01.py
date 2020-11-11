# Requires the PyMongo package.
# https://api.mongodb.com/python/current

#pregunta 1
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'date': 1, 
    'name': 1, 
    'text': 1
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)

#pregunta 2
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1, 
    'cast': 1, 
    'year': 1
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)

#pregunta 3
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'name': 1, 
    'password': 1
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)