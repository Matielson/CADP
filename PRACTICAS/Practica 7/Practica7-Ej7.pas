program ejercicio7;

const

type

    vNotas = array [1..24] of real;

    alumno = record
        numA: integer;
        ape: string;
        nom: string;
        correo: string;
        anoIngreso: integer;
        anoEgreso: integer;
        notas: vNotas;
    end;

    lista = ^nodoLista

    nodoLista = record
        dato: alumno;
        sig: lista;
    end;

    procedure leerAlumno (var a: alumno);
    var
        i: integer;
        notaAux: integer;
    begin
        readln(a.numA);
        if (a.numA <> -1) then begin
            readln(a.ape);
            readln(a.nom);
            readln(a.correo);
            readln(a.anoIngreso);
            readln(a.anoEgreso);
            for i:= 1 to 24 do begin
                readln(notaAux);
                pos := i;
                while (pos > 1) and (a.notas[pos-1] < notaAux) do begin
                    a.notas[pos] := a.notas[pos-1];
                    pos := pos - 1;
                end;
                a.notas[pos] := notaAux;
            end;
        end;
    end;

    procedure agregarAdelante (var l: lista; a: alumno);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato:= a;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarLista (var l: lista);
    var
        a: alumno;
    begin
        leerAlumno(a);
        while (a.numA <> -1) do begin
            agregarAdelante(a);
            leerAlumno(a);
        end;
    end;

    function calcularPromedio (v: vNotas): real;
    var
        i: integer;
        sumaNotas: real;
    begin
        sumaNotas:= 0;
        for i:= 1 to 24 do begin
            sumaNotas:= sumaNotas + v[i];
        end;
        calcularPromedio:= sumaNotas / 24;
    end;

    function soloImpares(num: integer): boolean;
    var
        dig: integer;
        todosImpares: boolean;
    begin
        todosImpares := true;
        while (num > 0) and (todosImpares) do begin
            dig := num MOD 10;
            if (dig MOD 2 = 0) then
                todosImpares := false;
            num := num DIV 10;
        end;
        soloImpares := todosImpares;
    end;

    procedure informarAlumno (a: alumno);
    begin
        writeln('Apellido: ', a.ape, ' Nombre: ', a.nombre, ' Direccion de correo electronico: ', a.correo);
    end;

    procedure procesar (l: lista);
    var
        cantCOndicion2: integer;
        minAnos1, minAnos2: integer;
        minAlumno1, minAlumno2: alumno;
    begin
        cantCondicion2:= 0;
        while (l <> nil) do begin
            if (l^.dato.anoIngreso = 2012) and (soloImpares(l^.dato.numA)) then begin
                cantCondicion2:= cantCondicion2 + 1;
            end;
            anosEnRecibirse:= (l^.dato.anoEgreso - l^.dato.anoIngreso);
            if (anosEnRecibirse < minAnos1) then begin
                minAnos2:= minAnos1;
                minAnos1:= anosEnRecibirse;
                minAlumno2:= minAlumno1;
                minAlumno1:= l^.dato;
            end
            else
                if (anosEnRecibirse < minAnos2) then begin
                    minAnos2:= anosEnRecibirse;
                    minAlumno2:= l^.dato;
                end;
            writeln('El promedio del alumno: ', l^.dato.ape, ' ', l^.dato.nom, ' es: ', calcularPromedio(l^.dato.notas));
            l:= l^.sig;
        end;
        writeln('Alumnos mas rapidos en recibirse: /n', informarAlumno(minAlumno1), '/n', informarAlumno(minAlumno2));
        writeln('La cantidad de alumnos ingresantes 2012 cuyo numero de alumno esta compuesto unicamente por digitos impares son: ', cantCondicion2);
    end;

    procedure eliminarAlumno (var l: lista; num: integer);
    var
        ant, act: lista;
    begin
        act:= l;
        while (act <> nil) and (num <> act^.dato.numA) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act <> nil) then begin
            if (act = l) then begin
                l:= l^.sig;
            end
            else
                ant^.sig:= act^.sig;
            dispose(act);
        end;
    end;




var
    l: lista;
    numAlumnoAEliminar: integer;
begin
    l:= nil;
    cargarLista(l);
    procesar(l);
    readln(numAlumnoAEliminar);
    eliminarAlumno(numAlumnoAEliminar);
end.