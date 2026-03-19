program ejercicio1;

const

    generos = 1..5;

type

    persona = record;
        dni: integer;
        ape: string;
        nom: string;
        edad: integer;
        codG: generos;
    end;

    vGeneros = array [generos] of integer;

    lista = ^nodoLista

    nodoLista = record;
        dato: persona;
        sig: lista;
    end;


    procedure leerPersona (var p: persona);
    begin
        readln(p.dni);
        if (p.dni <> 33555444) then begin
            readln(p.ape);
            readln(p.nom);
            readln(p.edad);
            readln(p.codG);
        end;
    end;

    procedure inicializarVector (var v: vGeneros);
    var
        i: integer;
    begin
        for i:= 1 to 5 do begin
            v[i]:= 0;
        end;
    end;

    procedure agregarAdelante (var l: lista; p: persona)
    var
        nue: lista;
    begin
        new (nue);
        nue^.dato:= p;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarListaYVector (var l: lista; var v: vGeneros);
    var
        p: persona;
    begin
        repeat
            leerPersona(p);
            v[p.codG]:= v[p.codG] + 1;
            agregarAdelante(l, p);
        until (p.dni = 33555444);
    end;

    function masPares (num: integer): boolean;
    var
        dig, pares, impares: integer;
    begin
        pares:= 0;
        impares:= 0;
        while (num > 0) do begin
            dig:= num MOD 10;
            if (dig MOD 2 = 0) then
                pares:= pares + 1
            else
                impares:= impares + 1;
            num:= num DIV 10;
        end;
        masPares:= pares > impares;
    end;

    function devolverCantPersonas (l: lista): integer;
    var
        cant: integer;
    begin
        cant:= 0
        while (l <> nil) do begin
            if (masPares(l^.dato.dni)) then
                cant:= cant + 1;
            l:= l^.sig;
        end;
        devolverCantPersonas:= cant;
    end;

    procedure informarCodigos (v: vGeneros);
    var
        i: integer;
        max1, max2: integer;
        maxCant1, maxCant2: integer;
    begin
        maxCant1:= -1;
        maxCant2:= -1;
        max1:= -1;
        max2:= -1;
        for i:= 1 to 5 do begin
            if (v[i] > maxCant1) then begin
                maxCant2:= maxCant1;
                max2:= max1;
                maxCant1:= v[i];
                max1:= i;
            end
            else begin
                if (v[i] > maxCant2) then begin
                    maxCant2:= v[i];
                    max2:= i;
                end;
            end;
        end;
        writeln(max1, ' ', max2);
    end;

    procedure eliminarDni (var l:lista; dni: integer);
    var
        ant, actual: lista;
    begin
        actual:= l;
        while (actual <> nil) and (actual^.dato.dni <> dni) do begin
            ant:= actual;
            actual:= actual^.sig;
        end;
        if (actual <> nil) then begin
            if (actual = l) then begin
                l:= l^.sig;
            end
            else
                ant^.sig:= actual^.sig;
            dispose(actual);
        end
    end;

var
    v: vGeneros;
    l: lista;
    dniAEliminar: integer;
begin
    l:= nil;
    inicializarVector(v);
    cargarListaYVector(l, v);
    writeln('La cantidad de personas cuyo DNI tiene mas digitos pares que impares es: ', devolverCantPersonas);
    writeln('Los 2 codigos de genero mas elegidos son: ');
    informarCodigos(v);
    readln(dniAEliminar);
    eliminarDni(l, dniAEliminar);
end.