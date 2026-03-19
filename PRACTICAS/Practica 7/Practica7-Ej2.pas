procedure ejercicio2;

const   

    polizas = 1..6;

type

    cliente = record;
        codC: integer;
        dni: integer;
        ape: string;
        nom: string;
        codP: polizas;
        montoB: real;
    end;

    vMontos = array [polizas] of real;  /// SE DISPONE

    lista = ^nodoLista;

    nodoLista = record;
        dato: cliente;
        sig: lista;
    end;

    procedure leerCliente (var c: cliente);
    begin
        readln(c.codC);
        if (c.codC <> 1122) then begin
            readln(c.dni);
            readln(c.ape);
            readln(c.nom);
            readln(c.codP);
            readln(c.montoB);
        end;
    end;

    procedure agregarAdelante (var l: lista; c: cliente);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato:= c;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarLista (var l: lista);
    var
        c: cliente;
    begin
        leerCliente(c);
        while (c.codC <> 1122) do begin
            agregarAdelante(l, c);
            leerCliente(c);
        end;
    end;

    function alMenosDos (dni: integer): boolean;
    var
        dig, cont: integer;
    begin
        cont:= 0;
        while (dni <> 0) do begin
            dig:= dni MOD 10;
            if (dig = 9) then
                cont:= cont + 1;
            dni:= dni DIV 10;
        end;
        alMenosDos:= cont >= 2;
    end;

    procedure procesarClientes (l: lista; v: vMontos);
    begin
        while (l <> nil) do begin
            writeln('DNI: ', l^.dato.dni, 'Apellido: ', l^.dato.ape, 'Nombre: ', l^.dato.nom, 'Monto Total: ', l^.dato.montoB + v[l^.dato.codP]);
            if (alMenosDos(l^.dato.dni)) then begin
                writeln('El cliente: ', l^.dato.nom, ' ', l^.dato.ape, ' contiene al menos dos digitos 9 en su DNI.');
            end;
            l:= l^.sig;
        end;
    end;

    procedure eliminarCliente (var l: lista; codigo: integer);
    var
        ant, actual: lista;
    begin
        actual:= l;
        while (actual <> nil) and (actual^.dato.codC <> codigo) do begin
            ant:= actual;
            actual:= actual^.sig;
        end;
        if (actual <> nil) then begin
            if (actual = l) then
                l:= l^.sig;
            else
                ant^.sig:= actual^.sig;
            dispose(actual);
        end;
    end;

var
    l: lista;
    v: vMontos;
    codigoAEliminar: integer;
begin
    l:= nil;
    cargarLista(l);
    procesarClientes(l,v);
    readln(codigoAEliminar);
    eliminarCliente(l, codigoAEliminar);
end.