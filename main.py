from neo import Neo4jConnection

uri = "bolt://18.235.249.224:37463"
user = "neo4j"
pwd = "telephones-writings-endings"
neo_connection = Neo4jConnection(uri=uri,user=user,pwd=pwd)
neo_connection.query("match (r) detach delete r")

csv_folder = "./csv/"

csv_data = {
    "clima" : [],
    "genero" : [],
    "pessoa" : [],
    "doenca" : [],
    "sintoma": [],
    "link-pessoa-sintoma":[],
    "link-doenca-genero" : [],
    "link-doenca-sintoma" : [],
    "link-doenca-clima" : [],
    "link-pessoa-genero" : []
}

def read_csv(name):
    x = csv_data[name]
    with open(f"{csv_folder}{name}.csv","r") as csv:
        x += [ i.replace("\n","").split(",") for i in csv.readlines()]
        if not x[-1] : x.pop(-1)
        
def create_node(node_name):
    datas = csv_data[node_name]
    titles = datas[0]
    for index in range(1,len(datas)):
        code = []
        for field,data in zip(titles,datas[index]):
            try: data = eval(data)
            except: data = f'"{data}"'
            code += [f'{field} : {data}']
        code = "{ "+" , ".join(code)+" }"
        code = f'create (:{node_name} {code})\n'
        neo_connection.query(code)

def create_match(file_x,x,letra='a'):
    code = f'{letra} :{file_x} '
    code+= '{ nome : "'+x+'"}'
    code = f'match ( {code} )\n'
    return code

def create_links(link_name):
    file_x,file_y = link_name.split("-")[1:3]
    data = csv_data[link_name]
    for index in range(1,len(data)):
        print(data[index])
        x,y,z = data[index]
        if exist(x,file_x) and exist(y,file_y):
            code = create_match(file_x,x)
            code += create_match(file_y,y,"b")
            code += f'create (a)-[:{z}]->(b)\n'
            neo_connection.query(code)

def exist(field,file_name):
    x = [ i[0] for i in csv_data[file_name]]
    if field in x : return True
    else:
        print(f"!!! não existe {field} em {file_name}.csv")
        return False



# load csv
for i in csv_data:
    read_csv(i)

for i in csv_data:
    if "link" in i: operacao = create_links
    else: operacao = create_node
    operacao(i)
