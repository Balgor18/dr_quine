# This code is a self duplication
CODE = '# This code is a self duplication\nCODE = %r\n\nFILENAME = %r\n\nLAUNCH = \'\'\'try:\n\twith open(FILENAME, "w") as kid:\n\t\tkid.write(CODE %% (CODE,FILENAME))\nexcept:\n\tpass\'\'\'\n\nexec(LAUNCH)'

FILENAME = 'Grace_kid.py'

LAUNCH = '''try:
	with open(FILENAME, "w") as kid:
		kid.write(CODE % (CODE,FILENAME))
except:
	pass'''

exec(LAUNCH)