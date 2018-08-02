from tempfile import TemporaryFile
outfile = TemporaryFile()

x = np.arange(10)
np.save(outfile, x)

outfile.seek(0) # Only needed here to simulate closing & reopening file
np.load(outfile)
array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

#!/usr/bin/python3

def toggle ():
    f = open("/tmp/hwmtoggle", "r+")
    a = int(f.read(1))
    f.seek(0,0)
    f.write("0") if bool(a) else f.write("1")
    return(a)

if (__name__ == "__main__"):
    a = toggle()
    print("Hello, the content is: ", a)
