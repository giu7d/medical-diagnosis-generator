match (r) detach delete r7

create (:clima { nome : "frio" })

create (:clima { nome : "seco" })

create (:clima { nome : "quente" })

create (:clima { nome : "umido" })

create (:genero { nome : "masculino" })

create (:genero { nome : "feminino" })

create (:pessoa { nome : "felipe gimenez" , idade : 22 , altura : 1.7 , peso : 60 , latitude : 150 , longitude : 140 })

create (:pessoa { nome : "danielli gimenez" , idade : 19 , altura : 1.64 , peso : 40 , latitude : 20 , longitude : 20 })

create (:pessoa { nome : "pessoa com gripe" , idade : 22 , altura : 1.76 , peso : 70 , latitude : 145 , longitude : 145 })

create (:pessoa { nome : "pessoa quase com gripe" , idade : 29 , altura : 1.8 , peso : 85 , latitude : 144 , longitude : 150 })

create (:doenca { nome : "gripe" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "alergia" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "amigdalite" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "pneumonia" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "asma" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "otite" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "bronquite" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:doenca { nome : "sinusite" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

create (:sintoma { nome : "calafrios" })

create (:sintoma { nome : "cansaço excessivo" })

create (:sintoma { nome : "chiado no peito" })

create (:sintoma { nome : "congestão nasal" })

create (:sintoma { nome : "dificuldade para respirar" })

create (:sintoma { nome : "diminuição da audição" })

create (:sintoma { nome : "dor de cabeça" })

create (:sintoma { nome : "dor de garganta" })

create (:sintoma { nome : "dores no corpo" })

create (:sintoma { nome : "dores no peito" })

create (:sintoma { nome : "dor no ouvido" })

create (:sintoma { nome : "espirros" })

create (:sintoma { nome : "fadiga" })

create (:sintoma { nome : "falta de ar" })

create (:sintoma { nome : "febre" })

create (:sintoma { nome : "fraqueza" })

create (:sintoma { nome : "gânglios linfáticos inchados" })

create (:sintoma { nome : "manchas de pus nas amígdalas" })

create (:sintoma { nome : "mau hálito" })

create (:sintoma { nome : "náusea" })

create (:sintoma { nome : "vômitos" })

create (:sintoma { nome : "perda de apetite" })

create (:sintoma { nome : "secreção nasal" })

create (:sintoma { nome : "secreções no ouvido" })

create (:sintoma { nome : "tosse seca" })

create (:sintoma { nome : "tosse com catarro" })

create (:sintoma { nome : "tosse com muco" })

create (:sintoma { nome : "tosse com sangue" })

match ( a :pessoa { nome : "felipe gimenez"} )
match ( b :sintoma { nome : "dor de cabeça"} )
create (a)-[:sente {data:date("2020-11-15")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "calafrios"} )
create (a)-[:sente {data:date("2020-11-15")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "cansaço excessivo"} )
create (a)-[:sente {data:date("2020-11-14")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "dores no corpo"} )
create (a)-[:sente {data:date("2020-11-14")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "espirros"} )
create (a)-[:sente {data:date("2020-11-13")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:sente {data:date("2020-11-13")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "perda de apetite"} )
create (a)-[:sente {data:date("2020-11-12")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "secreção nasal"} )
create (a)-[:sente {data:date("2020-11-11")}]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :sintoma { nome : "tosse seca"} )
create (a)-[:sente {data:date("2020-11-11")}]->(b)

match ( a :pessoa { nome : "pessoa quase com gripe"} )
match ( b :sintoma { nome : "espirros"} )
create (a)-[:sente {data:date("2020-11-11")}]->(b)

match ( a :pessoa { nome : "pessoa quase com gripe"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:sente {data:date("2020-11-10")}]->(b)

match ( a :pessoa { nome : "pessoa quase com gripe"} )
match ( b :sintoma { nome : "perda de apetite"} )
create (a)-[:sente {data:date("2020-11-10")}]->(b)

match ( a :pessoa { nome : "pessoa quase com gripe"} )
match ( b :sintoma { nome : "secreção nasal"} )
create (a)-[:sente {data:date("2020-11-10")}]->(b)

match ( a :pessoa { nome : "pessoa quase com gripe"} )
match ( b :sintoma { nome : "tosse seca"} )
create (a)-[:sente {data:date("2020-11-10")}]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "alergia"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "asma"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "sinusite"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "alergia"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "asma"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "sinusite"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "calafrios"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "cansaço excessivo"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "dores no corpo"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "espirros"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "perda de apetite"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "secreção nasal"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "tosse seca"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "calafrios"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "dificuldade para respirar"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "dores no peito"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "fraqueza"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "náusea"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "vômitos"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "tosse seca"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "tosse com catarro"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :sintoma { nome : "tosse com sangue"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "calafrios"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "congestão nasal"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "diminuição da audição"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "dor de cabeça"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "dor no ouvido"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "perda de apetite"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "secreção nasal"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :sintoma { nome : "secreções no ouvido"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :sintoma { nome : "dor de garganta"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :sintoma { nome : "gânglios linfáticos inchados"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :sintoma { nome : "manchas de pus nas amígdalas"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :sintoma { nome : "mau hálito"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "chiado no peito"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "dificuldade para respirar"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "fadiga"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "falta de ar"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "febre"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :sintoma { nome : "tosse com muco"} )
create (a)-[:possui]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "gripe"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "alergia"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "alergia"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "amigdalite"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "pneumonia"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "asma"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "asma"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "otite"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "bronquite"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "sinusite"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

match ( a :doenca { nome : "sinusite"} )
match ( b :clima { nome : "seco"} )
create (a)-[:clima]->(b)

match ( a :pessoa { nome : "felipe gimenez"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

match ( a :pessoa { nome : "danielli gimenez"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

match ( a :pessoa { nome : "pessoa com gripe"} )
match ( b :genero { nome : "feminino"} )
create (a)-[:genero]->(b)

