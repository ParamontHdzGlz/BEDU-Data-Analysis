from pymongo import MongoClient

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

#pregunta 1
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'name': 'Greg Powell'
}

result = client['sample_mflix']['movies'].find(
  filter=filter
)

#pregunta 2
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$or': [
        {
            'name': 'Greg Powell'
        }, {
            'name': 'Mercedes Tyler'
        }
    ]
}

result = client['sample_mflix']['comments'].find(
  filter=filter
)

#pregunta 3
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'num_mflix_comments': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=1

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)

#pregunta 4
client = MongoClient('mongodb+srv://bedu-admin:ITwM5axQtih9jEve@bedu-cluster.0fhlu.mongodb.net/test?authSource=admin&replicaSet=atlas-x7e8us-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=5

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)