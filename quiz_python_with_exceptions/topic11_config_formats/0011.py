import tomllib

contents = '''
title = "TOML Example"

[owner]
name = "Tom Preston-Werner"
dob = "1979-05-27T07:32:00-08:00"

[database]
enabled = true
ports = [ 8000, 8001, 8002 ]
data = [ ["delta", "phi"], [3.14] ]
temp_targets = { cpu = 79.5, case = 72.0 }

[servers]

[servers.alpha]
ip = "10.0.0.1"
role = "frontend"

[servers.beta]
ip = "10.0.0.2"
role = "backend"
'''
data = tomllib.loads(contents)

a = len(data['owner'])
print('a=', a)

b = len(data['owner']['name'])
print('b=', b)

c = len(data['owner'][0])
print('c=', c)

d = len(data['owners']['dob'])
print('d=', d)

e = len(data['database']['data'])
print('e=', e)

f = data['servers']['beta']['ip'][3]
print('f=', f)
