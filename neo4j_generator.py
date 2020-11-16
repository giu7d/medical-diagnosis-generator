import random

req = 0

from neo4j import GraphDatabase
class Neo4jConnection:
    
    def __init__(self, uri, user, pwd):
        self.__uri = uri
        self.__user = user
        self.__pwd = pwd
        self.__driver = None
        try:
            self.__driver = GraphDatabase.driver(self.__uri, auth=(self.__user, self.__pwd))
        except Exception as e:
            print("Failed to create the driver:", e)
        
    def close(self):
        if self.__driver is not None:
            self.__driver.close()
        
    def query(self, query, db=None):
        global req
        req += 1
        print("req ->",req)
        assert self.__driver is not None, "Driver not initialized!"
        session = None
        response = None
        try: 
            session = self.__driver.session(database=db) if db is not None else self.__driver.session() 
            response = list(session.run(query))
        except Exception as e:
            print("Query failed:", e)
        finally: 
            if session is not None:
                session.close()
        return response



qt_doencas = 30
qt_sintomas = 15
max_sint = 8

conn = Neo4jConnection(uri="bolt://localhost:7687", user="neo4j", pwd="12345")

conn.query("match (r) detach delete r")

def meta_brac(txt):
    return "{"+txt+"}"

def meta_create(tipo,nome,descricao):
    conn.query( f"create (:{tipo}"+
        meta_brac("nome:\""+
        nome+"\", descricao:\""+
        descricao+"\"")+")")

def createLink(nome_doenca,nome_sintoma):
    x= "match (d:doenca {nome:\""+nome_doenca+"\"})\n"
    x+="match (s:sintoma {nome:\""+nome_sintoma+"\"})\n"
    x+="create (s)-[:presente]->(d)\n"
    x+="return s"
    conn.query(x)

# criando doencas
doencas = [ 
    [
        f"doenca {i}",
        f"descricao da doenca {i}"
    ] for i in range(qt_doencas)
]

# criando sintomas
sintomas = [
    [
        f"sintoma {i}",
        f"descricao do sintoma {i}"
    ] for i in range(qt_sintomas)
]

# gerando codigo de doencas
for doenca,descricao in doencas:
    meta_create("doenca",doenca,descricao)
    
# gerando codigo de sintomas
for sintoma,descricao in sintomas:
    meta_create("sintoma",sintoma,descricao)
    
# link entre doencas e sintomas
for doenca in doencas:
    doenca_nome = doenca[0]
    rn_sintomas = random.randint(1,max_sint)
    lst = []
    for random_sintoma in range(rn_sintomas):
        doing = True
        while doing :
            randn = random.randint(2,qt_sintomas-1)
            doing = randn in lst
        lst.append(randn)
        createLink(doenca_nome,sintomas[randn][0])
