program final; 

type

    venta = record
        num: integer;
        cantP: integer;
        tipoPago: string;
    end;

    lista = ^nodoLista;

    nodoLista = record
        dato: venta;
        sig: lista;
    end;

    lista2 = ^nodoLista2;

    nodoLista2 = record
        dato: venta;
        sig: lista2;
    end;

    procedure agregarAdelante (var l2: lista2; v: venta);
    var
        nue: lista2;
    begin
        new(nue);
        nue^.dato:= v;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure agregarAtras (var l2, ult: lista2; v: venta);
    var
        nue: lista2;
    begin
        new(nue);
        nue^.dato:= v;
        nue^.sig:= nil;
        if (l = nil) then
            l:= nue;
        else
            ult^.sig:= nue;
        ult:= nue;
    end;

    function tieneMasPares (num: integer): boolean;
    var
        dig, pares, impares: integer;
    begin
        while (num <> 0) do begin
            dig:= num MOD 10;
            if (dig MOD 2 = 0) then begin
                pares:= pares + 1;
            end
            else
                impares:= impares + 1;
            num:= num DIV 10;
        end;
    end;

    procedure cargarListaNueva (var l2: lista2; l: lista);
    begin
        while (l <> nil) do begin
            if (tieneMasPares(l^.dato.cantP)) then begin
                if (l^.dato.tipoPago = 'Efectivo') then begin
                    agregarAdelante(l2,l^.dato);
                end
                else
                    agregarAtras(l2,ult,l^.dato);
            end;
        end;
    end;

var

begin

end.