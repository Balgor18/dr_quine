import os
import sys

def sully():
	x = 5
	if x < 0: return
	if 'Sully_' + str(x) + '.py' in __file__: x -= 1
	filename = "Sully_"+str(x)+".py"
	code = 'import os\nimport sys\n\ndef sully():\n\tx = %d\n\tif x < 0: return\n\tif \'Sully_\' + str(x) + \'.py\' in __file__: x -= 1\n\tfilename = "Sully_"+str(x)+".py"\n\tcode = %r\n\ttry:\n\t\twith open(filename, "w") as file:\n\t\t\tfile.write(code %% (x, code))\n\t\tif x < 1: return\n\t\tos.system(\'python3 \' + filename)\n\texcept:\n\t\treturn\nsully()\n'
	try:
		with open(filename, "w") as file:
			file.write(code % (x, code))
		if x < 1: return
		os.system('python3 ' + filename)
	except:
		return
sully()
