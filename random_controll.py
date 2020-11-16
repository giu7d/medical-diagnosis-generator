import random

class random_controll :
    
    def __init__(self):
        self.rand_list = {}
    
    # add a new function to dict
    def function(self,name):
        def inner(fun):
            self.rand_list[name] = fun
            return fun
        return inner

    # get this function
    def get(self,name):
        if name in self.rand_list :
            return self.rand_list[name]
        return lambda x: name+" not found"
