program Ejercicio3;
var
    i, legajo: integer;
    nota, notaTotal, notaIgualCero, cantNotaIgualCero: integer; 
    cantMayorSeisCinco: integer;
    presentes, cantI, cantR, aprob5, cantAprob: integer;
    cantConDiez, cantConCero, alumMaxCant1, alumMaxCant2: integer;
    legajoIgualCero, legajoIgualDiez: integer;
    cantRecursantes, cantIngresantes: integer;
    cond: char;
begin
    i:= 0;
    cantI:= 0;
    cantR:= 0;
    cantAprob:= 0;
    cantMayorSeisCinco:= 0;
    cantNotaIgualCero:= 0;
    cantConDiez:= 0;
    cantConCero:= 0;
    cantIngresantes:= 0;
    cantRecursantes:= 0;
    writeln('Ingrese el legajo del alumno: ');
        readln(legajo);
    while (legajo <> -1) do begin
        presentes:= 0;
        aprob5:= 0;
        notaTotal:= 0;
        notaIgualCero:= 0;
        writeln('Ingrese su condicion (I para ingresante, R para recursante): ');
        readln(cond);
        if (cond='I') then begin
            cantIngresantes:= cantIngresantes + 1;
        end;
        if (cond='R') then begin
            cantRecursantes:= cantRecursantes + 1;
        end;
        writeln('Ingrese la nota obtenida en cada una de las 5 autoevaluaciones: ');
        for i:= 1 to 5 do begin
            readln(nota); 
            notaTotal:= notaTotal + nota;
            if (nota>=4) then begin
                presentes:= presentes + 1;
                aprob5:= aprob5 + 1;
            end;
            if (nota=0) then begin
                notaIgualCero:= + 1;
                cantConCero:= + 1;
                legajoIgualCero:= cantConCero;
            end;
            if (nota=10) then begin
                cantConDiez:= + 1;
                legajoIgualDiez:= cantConDiez;
            end;
        end;
        writeln('Ingrese el legajo del alumno: ');
        readln(legajo);
        if((cond='I') and ((presentes / 5 * 100)>=75)) then begin
            cantI:= cantI + 1;
        end;
        if((cond='R') and ((presentes / 5 * 100)>=75)) then begin
            cantR:= cantR + 1;
        end;
        if (aprob5 = 5) then begin
            cantAprob:= cantAprob + 1;
        end;
        if ((notaTotal / 5 * 100)>6.5) then begin
            cantMayorSeisCinco:= cantMayorSeisCinco + 1;
        end;
        if (notaIgualCero >= 1) then begin
            cantNotaIgualCero:= cantNotaIgualCero + 1
        end;
    end;
    writeln('La cantidad de alumnos ingresantes en condiciones de rendir el parcial es: ', cantI, 'y el porcentaje es: ', (cantIngresantes / cantI * 100));
    writeln('La cantidad de alumnos recursantes en condiciones de rendir el parcial es: ', cantR, 'y el porcentaje es: ', (cantRecursantes / cantR * 100));
    writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ', cantAprob);
    writeln('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ', cantMayorSeisCinco);
    writeln('La cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion: ', cantConCero);
    writeln('El legajo de los alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) es: ', legajoIgualDiez);
    writeln('El legajo de los alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) es: ', legajoIgualCero);
end.
