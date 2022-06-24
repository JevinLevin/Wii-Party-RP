import os
l = os.listdir()
l.remove("rename.py")
for i in l:
	os.rename(i, str(int(i.split("out")[1].split(".")[0]) - 1) + ".jpg")