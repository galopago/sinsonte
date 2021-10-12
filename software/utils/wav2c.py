import sys
import soundfile as sf
import matplotlib.pyplot as plt
from pathlib import Path

# *************************************************************
#                                 wav2c.py
# take a sound file (.wav) and convert to C (.h) include file.
# to play sounds stored in flash!
#
# *************************************************************

#print(type(sys.argv))
#print('The command line arguments are:')
#for i in sys.argv:
#    print(i)

if(len(sys.argv)<3):
	sys.exit("some arguments missing. Correct usage: wav2c.py inputfile outpufile")	

soundfile = sys.argv[1]
coutfile = sys.argv[2]
data_in, datasamplerate = sf.read(soundfile)
# This means stereo so extract one channel 0
if len(data_in.shape)>1:
    data_in = data_in[:,0]

# If you want to show sound file graph
#plt.plot(data_in)
#plt.ylabel(soundfile)
#plt.show()

import samplerate
converter = 'sinc_best'  # or 'sinc_fastest', ...
desired_sample_rate = 44100.0
ratio = desired_sample_rate/datasamplerate
data_out = samplerate.resample(data_in, ratio, converter)

# just for debug
#print(data_out)

maxValue = max(data_out)
minValue = min(data_out)
print("length", len(data_out))
print("max value", max(data_out))
print("min value", min(data_out))
vrange = (maxValue - minValue) 
print("value range", vrange)

#getting output file without extension
coutfile_path = Path(coutfile)
coutfile_path_wo_ext = coutfile_path.with_suffix('')

ccode = "/*    File "+soundfile+ "\r\n *    Sample rate "+str(int(desired_sample_rate)) +" Hz\r\n */\r\n"
ccode += "#define WAV_DATA_"+str(coutfile_path_wo_ext)
ccode += "_LENGTH "+str(len(data_out))+" \r\n\r\n"
ccode += "const uint8_t WAV_DATA"
ccode += "_"+str(coutfile_path_wo_ext)
ccode += "[] = {\r\n    "
maxitemsperline = 16
itemsonline = maxitemsperline
firstvalue = 0
lastvalue = 0
for v in data_out:
    # scale v to between 0 and 1
    isin = (v-minValue)/vrange   
    v =  int((isin * 255))
    vstr = str(v)
    if (firstvalue==0):
        firstvalue= v
    lastvalue = v
    ccode+=vstr
    itemsonline-=1
    if (itemsonline>0):
        ccode+=','
    else:
        itemsonline = maxitemsperline
        ccode+=',\r\n    '
        
# keep track of first and last values to avoid
# blip when the loop restarts.. make the end value
# the average of the first and last. 
end_value = int( (firstvalue + lastvalue) / 2)
ccode+=str(end_value)+'    \r\n};'

# just for debug
#print(ccode)

#writting to output file
output_file=open(coutfile,'w')
if not output_file:
		sys.exit("error creating output file")	
output_file.write(ccode)
output_file.close()

print("Data written to",coutfile)
