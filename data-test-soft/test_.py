import serial, time

print("Welcome...")
macoser = serial.Serial(port='COM6',baudrate=57600) # apertura de puerto
time.sleep(1) # retardo
macoser.flushInput()
macoser.flushOutput()
print("connected to: "+macoser.portstr)

old_time = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] # de 0 a 7, canal 1 al 8, almaceno tiempos anteriores de muestra
new_time = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0] # de 0 a 7, canal 1 al 8, almaceno tiempos actuales de muestra
channel_sampled = [0,0,0,0,0,0,0,0] # si es uno se muestrea canal, sino es cero
sample_order = [0,0,0,0,0,0,0,0] # número de muestra

macoser.write(b'*A;') # envio primer dato para realizar muestra de canal 1
while True:
    rawString = macoser.read_until(b';')
    start_end_Chars = b"*",b";" 
    for x in start_end_Chars: # Se sacan caracteres incio y fin de msj
        rawString = rawString.replace(x,b"")
    channel_Chars = b"1:",b"2:",b"3:",b"4:",b"5:",b"6:",b"7:",b"8:"
    for x in channel_Chars:
        if x == b"1:":
            old_time[0] = new_time[0]
            if(-1 != rawString.find(x)):
                channel_sampled[0] = 1
                sample_order[0]+=1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[0] = float(rawString[a+2:b])
            else:
                channel_sampled[0] = 0
                old_time[0] = 0.0
                new_time[0] = 0.0
                sample_order[0] = 0
        if x == b"2:":
            old_time[1] = new_time[1]
            if(-1 != rawString.find(x)):
                channel_sampled[1] = 1
                sample_order[1]+=1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[1] = float(rawString[a+2:b])
            else:
                channel_sampled[1] = 0
                old_time[1] = 0.0
                new_time[1] = 0.0
                sample_order[1] = 0

        if x == b"3:":
            old_time[2] = new_time[2]
            if(-1 != rawString.find(x)):
                sample_order[2]+=1
                channel_sampled[2] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[2] = float(rawString[a+2:b])
            else:
                channel_sampled[2] = 0
                old_time[2] = 0.0
                new_time[2] = 0.0
                sample_order[2] = 0

        if x == b"4:":
            old_time[3] = new_time[3]
            if(-1 != rawString.find(x)):
                sample_order[3]+=1
                channel_sampled[3] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[3] = float(rawString[a+2:b])
            else:
                channel_sampled[3] = 0
                old_time[3] = 0.0
                new_time[3] = 0.0
                sample_order[3] = 0
        if x == b"5:":
            old_time[4] = new_time[4]
            if(-1 != rawString.find(x)):
                sample_order[4]+=1
                channel_sampled[4] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[4] = float(rawString[a+2:b])
            else:
                channel_sampled[4] = 0
                old_time[4] = 0.0
                new_time[4] = 0.0
                sample_order[4] = 0
        if x == b"6:":
            old_time[5] = new_time[5]
            if(-1 != rawString.find(x)):
                sample_order[5]+=1
                channel_sampled[5] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[5] = float(rawString[a+2:b])
            else:
                channel_sampled[5] = 0
                old_time[5] = 0.0
                new_time[5] = 0.0
                sample_order[5] = 0
        if x == b"7:":
            old_time[6] = new_time[6]
            if(-1 != rawString.find(x)):
                sample_order[6]+=1
                channel_sampled[6] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[6] = float(rawString[a+2:b])
            else:
                channel_sampled[6] = 0
                old_time[6] = 0.0
                new_time[6] = 0.0
                sample_order[6] = 0
        if x == b"8:":
            old_time[7] = new_time[7]
            if(-1 != rawString.find(x)):
                sample_order[7]+=1
                channel_sampled[7] = 1
                a = rawString.index(x)
                b = rawString.index(b",",a)
                new_time[7] = float(rawString[a+2:b])
            else:
                channel_sampled[7] = 0
                old_time[7] = 0.0
                new_time[7] = 0.0
                sample_order[7] = 0
        for i in range(8):
            if(sample_order[i]==10):
                if(i==0): # inicia muestreo canal 2
                    macoser.write(b"*C;") 
                if(i==1): # inicia muestreo canal 3
                    macoser.write(b"*E;")
                if(i==2): # inicia muestreo canal 4
                    macoser.write(b"*G;")
                if(i==3): # inicia muestreo canal 5
                    macoser.write(b"*I;")
    if(sample_order[4]==1000):
        macoser.write(b"*T;")
        print("1SPS a partir de ",sample_order[4]," muestras del canal 5")
    if(new_time[4]>=2640.0 and new_time[4]<=2641.0): # 2640 seg = 44 min
        macoser.write(b"*Q;") # retoma 10 muestras por segundo
        print("10SPS a partir de ",new_time[4]," segundos muestreando el canal 5")
    for i in range(8):
        if(channel_sampled[i] == 1):
            if(new_time[i]-old_time[i]<=0.0):
                print("Canal ",i+1," con muestras ",sample_order[i]-1,
                      " y ",sample_order[i]," con tiempos "
                      ,old_time[i]," y ",new_time[i]," menores o iguales")
        if(new_time[i]>=2700.0): # corta muestreo a los 45 min de tomar datos de cada canal
            if(i==0):
                macoser.write(b"*B;")
            if(i==1):
                macoser.write(b"*D;")
            if(i==2):
                macoser.write(b"*F;")
            if(i==3):
                macoser.write(b"*H;")
            if(i==4):
                macoser.write(b"*J;") # end sampling
    
    
    
    
    



                
