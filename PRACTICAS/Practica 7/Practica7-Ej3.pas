program ejercicio3;

type

    viaje = record;
        numV: integer;
        codA: integer;
        dirO: string;
        dirD: string;
        kmRecor: real;
    end;

    lista = ^nodoLista;

    nodoLista = record;
        dato: viaje;
        sig: lista;
    end;

    lista2 = ^nodoLista2;

    nodoLista2 = record;
        dato: viaje;
        sig: lista2;
    end;

    procedure insertarOrdenado (var l: lista2; v: viaje);
    var
        nuevo: lista2;
        act, ant: lista2;
    begin
        // Creo el nuevo nodo a insertar en la lista
        new(nuevo);
        nuevo^.dato:= v;
        nuevo^.sig:= nil;

        // 1er Caso: Lista vacia, asigno pi al nuevo nodo
        if (l = nil) then begin
            l:= nuevo;
        end
        // Si no esta vacia, arranco a buscar la posicion donde va el elemento. Aparecen las variables puntero ant y act.
        else begin
            ant:= l;
            act:= l;
            while (act <> nil) and (act^.dato.numV < v.numV) do begin
                ant:= act;
                act:= act^.sig;
            end;

            // Una vez salimos del while: o se termino la lista, o encontramos el elemento. Preguntamos ambos casos
            // y actualizamos punteros.

            if (act = l) then begin // Va como primero de la lista (ya es menor al primero)
                nuevo^.sig:= l;
                l:= nuevo;
            end
            else                    // Esta en el medio o el final.
                ant^.sig:= nuevo;
                act^.sig:= act;
        end;
    end;

    procedure ProcesarAutos (l: lista; var l2: lista2);
    var
        codActual: integer;
        kmsActual: real;
        codMax1, codMax2: integer;
        maxKms1, maxKms2: real;
    begin
        maxKms1 := -1;
        maxKms2 := -1;
        codMax1 := -1;
        codMax2 := -1;
        while (l <> nil) do begin
            codActual:= l^.dato.codA;
            kmsActual:= 0;
            while (l <> nil) and (l^.dato.codA = codActual) do begin
                kmsActual:= kmsActual + l^.dato.kmRecor;
                if (l^.dato.kmRecor > 5) then
                    insertarOrdenado(l2, l^.dato);
                l:= l^.sig;
            end;
            if (kmsActual > maxKms1) then begin
                maxKms2:= maxKms1;
                maxKms1:= kmsActual;
                codMax2:= codMax1;
                codMax1:= codActual;
            end
            else
                if (kmsActual > maxKms2) then begin
                    maxKms2:= kmsActual;
                    codMax2:= codActual;
                end;
        end;
        writeln('Los dos codigos de auto que mas kilomrtros recorrieron son: ', codMax1,  ' y ', codMax2);
    end;

var

begin

end.