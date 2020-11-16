import neo as neo_connection
import random_controll
import random

# =============================================================================
# funtion to connect on database
neo = neo_connection.Neo4jConnection(
    uri="bolt://54.86.15.220:32823",
    user="neo4j",
    pwd="reveille-survivals-pond")

# =============================================================================
# controll random (to simulate random data)
rnd = random_controll.random_controll()

# create a random name
@rnd.function("person_name")
def person_name():
    min_len , max_len , name = 2 , 10 , ""
    name_len = random.randint(min_len,max_len)
    chars = [ ord('a') + i for i in range(26) ]
    while name_len - len(name):
        char = random.randint(0,len(chars)-1)
        name += chr(chars[char])
    return name

# create a random age
@rnd.function("person_age")
def person_age():
    min_val , max_val = 2 , 100 
    return random.randint(min_val,max_val)

# create a random weight
@rnd.function("person_weight")
def person_weight():
    min_val , max_val = 3 , 200 
    return min_val + random.random() * (max_val - min_val)

@rnd.function("person_tall")
def person_tall():
    min_val, max_val = 0.20 , 2
    return min_val + random.random() * (max_val - min_val)
    
@rnd.function("geo_position")
def geo_position():
    pos = [[-3,-3],[4,5],[-5,6],[6,-5],[0,0],[8,8]]
    x,y = pos[random.randint(0,len(pos)-1)]
    dx , dy = random.random()*2 - 1 , random.random()*2 - 1
    x , y = x+dx, y+dy
    return [x,y]

# =============================================================================
# definitions of models to each node (and how to generate random data)

@neo.node("Pessoa")
def pessoa():
    return {
        "name" : person_name ,
        "age" : person_age ,
        "weight" : person_weight,
        "tall" : person_tall,
        "geo" : geo_position
    }


# =============================================================================
# example / tests
print(neo.random("Pessoa"))
print(neo.random("Pessoa"))
print(neo.random("Pessoa"))
print(neo.search_random("Pessoa"))

