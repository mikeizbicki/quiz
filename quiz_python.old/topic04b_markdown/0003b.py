def compile_bold_stars(line):
    start = line.find('**')
    if start == -1 or len(line) < 4:  
        return line

    end = line[start + 2:].find('**')
    if end == -1:  
        return line

    end = end + start + 2  
    return line[:start] + '<b>' + line[start + 2:end] + '</b>' + line[end + 2:]
result = compile_bold_stars('alpha **beta** gamma **delta')
print(result)

