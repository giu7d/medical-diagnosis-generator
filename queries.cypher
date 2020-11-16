//-----------
//  DATA CREATION EXAMPLE
//-----------

// inserindo clima
create (:clima { nome : "frio" })

// inserindo pessoa
create (:pessoa { nome : "felipe gimenez" , idade : 22 , altura : 1.7 , peso : 60 , latitude : 150 , longitude : 140 })

// inserindo doenca
create (:doenca { nome : "gripe" , idade_min : 0 , idade_max : 110 , peso_min : 1 , peso_max : 250 , altura_min : 0.2 , altura_max : 2.5 })

// inserindo sintoma
create (:sintoma { nome : "calafrios" })

// linkando doenca e genero
match ( a :doenca { nome : "gripe"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

// linkando doenca e sintoma
match ( a :doenca { nome : "gripe"} )
match ( b :sintoma { nome : "espirros"} )
create (a)-[:sintoma{val:1}]->(b)

// linkando doenca e clima
match ( a :doenca { nome : "gripe"} )
match ( b :clima { nome : "frio"} )
create (a)-[:clima]->(b)

// linkando pessoa e genero
match ( a :pessoa { nome : "felipe gimenez"} )
match ( b :genero { nome : "masculino"} )
create (a)-[:genero]->(b)

// adicionar resposta "não sente" um sintoma
// TODO: data
match (p:pessoa {nome:"felipe gimenez"})
match (s:sintoma {nome:"falta de ar"})
create (p)-[:naosente { data : date()} ]->(s)

// adicionar resposta "sente" um sintoma

match (p:pessoa {nome:"felipe gimenez"})
match (s:sintoma {nome:"falta de ar"})
create (p)-[:sente { data : date()} ]->(s)

//-----------
//  QUERIES
//-----------

// 1. Procurando doencas com sintomas que voce sentiu
match (p:pessoa {nome:"felipe gimenez"})
match (d:doenca)-[:possui]->(s:sintoma)<-[x:sente]-(p)
where x.data >= date() - duration({days:5})
with d as doenca_provavel, count(*) as possibilidade
order by possibilidade DESC
return doenca_provavel limit 5

// 2. Randomizando uma nova perguntas

match (p:pessoa {nome:"felipe gimenez"})
match (d:doenca)
where d.peso_min <= p.peso and d.peso_max >=p.peso and d.altura_min <= p.altura and d.altura_max >=p.altura and d.idade_min <=p.idade and d.idade_max>=p.idade
match (s:sintoma)<-[:possui]-(d)-[:genero]->(gn)
where not (p)-[:sente|naosente]->(s)
with s, rand() as r
order by r
return s limit 1

// 3. sintomas que pessoas proximas a você sentiu nos ultimos 5 dias

match (p:pessoa {nome:"felipe gimenez"})
match (q:pessoa)
with p, q,p.latitude - q.latitude as x , p.longitude - q.longitude as y
where sqrt(x*x+y*y) < 30
match (q)-[ss:sente]->(s:sintoma)
where ss.data >= date() - duration({days:5})
with s, count(s) as qt
order by qt DESC
return s

// 4. doenças encontradas perto de sua região (com limite de tempo)

match (p:pessoa {nome : "felipe gimenez"})
match (q:pessoa)
with q,p.latitude - q.latitude as x , p.longitude - q.longitude as y
where sqrt(x*x+y*y) < 20
match (q:pessoa)-[:sente]->(s:sintoma)
match (s)<-[:possui]-(d:doenca)
with d , count(d) as cont
order by cont DESC
return d limit 10

// 5. Quantidade de pessoas que apresentaram algum sintoma em uma região nos ultimos 5 dias

match (p:pessoa)-[x:sente]->(s:sintoma {nome:"dor de cabeÃ§a"})
where x.data >= date() - duration({days:5}) and sqrt(((p.latitude-150)*(p.latitude-150))+((p.longitude-150)*(p.longitude-150))) < 20
with p,s,count(s) as cont
order by cont DESC
return cont