%Verbindung zum Arduino, der an "'COM3"'
%angeschlossen ist, aufbauen
a=arduino('COM3');
t=0;
x=0;
i=1;
z=1;
b=zeros;
maximum=3000;

while(t<maximum)   
    %Analogwert von Pin 0 einlesen 
    b(i)=a.analogRead(0); 
    z=1;
    b(111)=0;
    
    %Bilden des gleitenden Mittelwertes
    while(z<31)
        b(111)=b(111)+b(z);
        z++;
    end
    b(111)=b(111)/30;
    
    %Graphen erstellen
    x=[x,b(111)];
    plot(x);
    axis([0,maximum,0,1024])
    grid
    drawnow
    if i==30
        i=1;
    end
    t++;
end
%Verbindung beenden
delete(a);
