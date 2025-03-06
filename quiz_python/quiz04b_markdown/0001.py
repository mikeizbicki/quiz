def compile_italic_star(line):
    result = ''
    i = 0 
    while i < len(line):
        if line[i] == '**':
            if i + 1 < len(line) and '*' in line[i+1:]:
                end = line.find('*', i+1)
                result += '<i>' + line[i+1:end] + '</i>'
                i = end + 1 
            else:
                result += '*' 
                i += 1
        else:
            result += line[i]
            i += 1
    return result
result = compile_italic_star('alpha *beta* gamma *delta')
print(result)
