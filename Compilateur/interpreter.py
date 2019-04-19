import sys

ins = open(sys.argv[1]).readlines()
ins = [l.split(" ") for l in ins]
print(ins)
ins = [[l[0], int(l[1]), int(l[2]), int(l[3])] for l in ins]

mem = [0 for i in range(1024)]
reg = [0 for i in range(32)]

adr = 0
while adr < len(ins):
	print(adr, ins[adr])
	if ins[adr][0] == "AFC":
		reg[ins[adr][1]] = ins[adr][2]
		adr += 1
	elif ins[adr][0] == "STORE":
		mem[int(ins[adr][1] / 4)] = reg[ins[adr][2]]
		adr += 1
	elif ins[adr][0] == "LOAD":
		reg[ins[adr][1]] = mem[int(ins[adr][2] / 4)]
		adr += 1
	elif ins[adr][0] == "ADD":
		reg[ins[adr][1]] = reg[ins[adr][2]] + reg[ins[adr][3]]
		adr += 1
	elif ins[adr][0] == "SOU":
		reg[ins[adr][1]] = reg[ins[adr][2]] - reg[ins[adr][3]]
		adr += 1
	elif ins[adr][0] == "MUL":
		reg[ins[adr][1]] = reg[ins[adr][2]] * reg[ins[adr][3]]
		adr += 1
	elif ins[adr][0] == "DIV":
		reg[ins[adr][1]] = reg[ins[adr][2]] // reg[ins[adr][3]]
		adr += 1
	elif ins[adr][0] == "PRINT":
		print(reg[ins[adr][1]])
		adr += 1
	elif ins[adr][0] == "DIFZ":
		reg[ins[adr][1]] = reg[ins[adr][1]] != 0
		adr += 1

	elif ins[adr][0] == "NOT":
		reg[ins[adr][1]] = not(reg[ins[adr][1]]) 
		adr += 1

	elif ins[adr][0] == "INF":
		reg[ins[adr][1]] = reg[ins[adr][2]] < reg[ins[adr][3]]
		adr += 1
	
	elif ins[adr][0] == "JMPC":
		print("JUMP to " + str(ins[adr][1]))
		adr += 1
	elif ins[adr][0] == "JMP":
		print("JUMP to " + str(ins[adr][1]))
		adr += 1

		
	
	

for i in range(32):
	print("@%04x: %04x" % (i, mem[i]))
