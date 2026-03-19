program final;

const

    codigos = 1..100;

type

    empleado = record
        dni: integer;
        ape: string;
        nom: string;
        codD: codigos;
        fecha: string;
        presente: boolean;
    end;

    lista = ^nodoLista

    nodoLista = record
        dato: empleado;
        sig: lista;
    end;

    procedure cargarLista (var l: lista); // SE DISPONE

    procedure procesar (l: lista);
    var
        actual: integer;
        cant, maxCant, maxDepa: integer;
    begin
        maxCant:= -1;
        maxDepa:= -1;
        while (l <> nil) do begin
            actual:= l^.dato.codD;
            cant:= 0;
            while (l <> nil) and (actual = l^.dato.codD) do begin
                cant:= cant + 1;
            end;
            if (cant > maxCant) then begin
                maxCant:= cant;
                maxDepa:= actual;
            end;
        end;
        writeln('El departamento con mas cantidad de empleados presentes durante el periodo de tiempo evaluado es: ', maxDepa);
    end;

var
    l: lista;
begin
    l:= nil;
    cargarLista(l); // SE DISPONE
    procesar(l);
end;