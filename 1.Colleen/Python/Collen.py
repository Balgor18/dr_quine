# Outside of code

def code():
	return '# Outside of code\n\ndef code():\n\treturn %r\n\ndef colleen():\n\t# inside a function\n\tprint(code() %% (code()))\n\ncolleen()'

def colleen():
	# inside a function
	print(code() % (code()))

colleen()
