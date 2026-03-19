program final;
type
    cliente = record
        dni:integer;
        fecha:string;
        monto:real;
    end;

    cliNuevo = record
        dni:integer;
        cantidad:integer;
        montoTotal:real;
    end;

    lista = ^nodo; // SE DISPONE ORDENADA POR DNI
    nodo = record
        dato:cliente;
        sig:lista;
    end;

    lista2 =  ^nodo2;
    nodo2 = record
        dato:cliNuevo;
        sig:lista2;
    end;

    procedure agregarAdelante (var l2: lista2; dni, cantidad: integer; monto: real);
    var
        nue: lista2;
    begin
        new(nue);
        nue^.dato.dni:= dni;
        nue^.dato.cantidad:= cantidad;
        nue^.dato.montonTotal:= monto;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarLista (var l: lista);  /// SE DISPONE

    procedure cargarLista2 (l: lista; var l2: lista2);
    var
        dniActual: integer;
        montoTotal: real;
        cantCompras: integer;
    begin
        while (l <> nil) do begin
            dniActual:= l^.dato.dni;
            montoTotal:= 0;
            cantCompras:= 0;
            while (l <> nil) and (dniActual = l^.dato.dni) do begin
                montoTotal:= montoTotal + l^.dato.monto;
                cantCompras:= cantCompras + 1;
                l:= l^.sig;
            end;
            if (cantCompras > 5) then begin
                agregarAdelante(l2,dniActual, cantCompras, montoTotal);
            end;
        end;
    end;

var
    l: lista;
    l2: lista2;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l);
    cargarLista2(l, l2);
end.