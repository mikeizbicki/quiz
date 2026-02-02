def compile_italic_underscore(line):
    newline = ''
    is_italic = False
    for x in line:
        if x == '_' and not is_italic:
            newline = newline + '<i>'
            is_italic = True
        elif x == '_' and is_italic:
            newline = newline + '</i>'
        else:
            newline = newline + x 
    return newline
result = compile_italic_underscore('_alpha_ beta _gamma delta')
print(result)
