[
    {
        '$lookup': {
            'from': 'users', 
            'localField': 'email', 
            'foreignField': 'email', 
            'as': 'usuario'
        }
    }, {
        '$addFields': {
            'objeto_usuario': {
                '$arrayElemAt': [
                    '$usuario', 0
                ]
            }
        }
    }, {
        '$project': {
            'nombre_usuario': '$objeto_usuario.name', 
            'email': '$objeto_usuario.email', 
            'contraeña': '$objeto_usuario.password'
        }
    }, {}
]