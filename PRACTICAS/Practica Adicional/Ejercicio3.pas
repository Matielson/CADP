program Ejercicio3;
var
    tanque: char;
    ancho, largo, alto, radio: real;
    volumenR, volumenC, volumenPromC, volumenPromR: real;
    cantTanq, cantTanqR, cantTanqC: integer;
    cantTanqMenoresUnoCuatro, cantTanqMenoresOchocientos: integer;
    maxTanqVendido1, maxTanqVendido2: real;
    maxVolumenTanq1, maxVolumenTanq2: real;
    volumenTotalC, volumenTotalR: real;
    
begin
    maxVolumenTanq1:= -1;
    maxVolumenTanq2:= -1;
    cantTanq:= 0;
    cantTanqC:= 0;
    cantTanqR:= 0;
    volumenPromC:= 0;
    volumenPromR:= 0;
    volumenTotalC:= 0;
    volumenTotalR:= 0;
    cantTanqMenoresUnoCuatro:= 0;
    cantTanqMenoresOchocientos:= 0;
    repeat
        volumenR:=0;
        volumenC:=0;
        writeln('Ingrese el el tipo de tanque (R para rectangulares y C para cilindricos): ');
        readln(tanque);
        writeln('Ingrese el alto (metros) del tanque: ');
        readln(alto);
        writeln('Ingrese el ancho (metros) del tanque: ');
        readln(ancho);
        writeln('Ingrese el largo (metros) del tanque: ');
        readln(largo);
        writeln('Ingrese el radio (metros) del tanque: ');
        readln(radio);
        /// CALCULO EL VOLUMEN DE CADA TIPO
        if (tanque='C') then begin
            cantTanqC:= cantTanqC + 1;
            volumenC:= (3.14 * radio * radio * alto);
            volumenTotalC:= volumenTotalC + volumenC
        end;
        if (tanque='R') then begin
            cantTanqR:= cantTanqR + 1;
            volumenR:= (ancho * largo * alto);
            volumenTotalR:= volumenTotalR + volumenR;
        end;
        
        /// CALCULO EL VOLUMEN MAXIMO DE CADA TIPO
        
        if (volumenR>maxVolumenTanq1) then begin
            maxVolumenTanq2:= maxVolumenTanq1;
            maxVolumenTanq1:= volumenR;
        end;
        if (volumenC>maxVolumenTanq1) then begin
            maxVolumenTanq2:= maxVolumenTanq1;
            maxVolumenTanq1:= volumenC;
        end;
        if (volumenR>maxVolumenTanq2) then begin
            maxVolumenTanq2:= volumenR;
        end;
        if (volumenC>maxVolumenTanq2) then begin
            maxVolumenTanq2:= volumenC;
        end;
        
        /// CALCULO EL VOLUMEN PROMEDIO DE TODOS LOS TANQUES CILINDRICOS
        
        if (cantTanqC>=1) then begin
            volumenPromC:= (volumenTotalC / cantTanqC);
        end;
        if (cantTanqR>=1) then begin
            volumenPromR:= (volumenTotalR / cantTanqR);
        end;
        
        /// CALCULO LA CANTIDAD DE TANQUES CUYO ALTO SEA MENOR A 1.40 metros
        
        if (alto<1.40) then begin
            cantTanqMenoresUnoCuatro:= cantTanqMenoresUnoCuatro + 1
        end;
        
        /// CALCULO LA CANTIDAD DE TANQUES CUYO VOLUMEN SEA MENOR A 800 METROS CUBICOS
        
        if ((volumenC<800) or (volumenR < 800)) then begin
            cantTanqMenoresOchocientos:= cantTanqMenoresOchocientos + 1
        end;
    until(tanque='Z');
    writeln('El volumen de los dos mayores tanques vendidos es: ', maxVolumenTanq1, ' y ', maxVolumenTanq2);
    writeln('El volumen promedio de todos los tanques cilindricos vendidos es: ', volumenPromC);
    writeln('El volumen promedio de todos los tanques rectangulares vendidos es: ', volumenPromR);
    writeln('La cantidad de tanques cuyo alto es menor a 1.40 metros es: ', cantTanqMenoresUnoCuatro);
    writeln('La cantidad de tanques cuyo volumen es menor a 800 metros cubicos es: ', cantTanqMenoresOchocientos);
end.
