program finalFebrero22023

const

type

    producto = record
        cod: integer;
        cant: integer;
    end;

    listaProductos = ^nodoLista;

    nodoLista = record
        dato: producto;
        sig: lista;
    end;

    venta = record
        numV: integer;
        montoTotal: real;
        prodVendidos: listaProductos;
    end;    

    vVentas = array [1..500] of ventas;  /// SE DISPONE

    procedure cargarVector (var v: vector; var dimL: integer); /// SE DISPONE

    function tiene5 (l: listaProductos): boolean;
    var
        cant: integer;
    begin
        cant:= 0;
        while (l <> nil) do begin
            cant:= cant + 1;
            l:= l^.sig;
        end;
        tiene5:= cant = 5;
    end;

    procedure eliminarDeVector (var v: vVentas; var dimL: integer);
    var
        i: integer;
    begin
        i:= 1;
        while (i <= dimL) do begin
            if (tiene5(v[i].prodVendidos)) then begin
                v[i]:= v[dimL];
                dimL:= dimL - 1;
            end
            else
                i:= i + 1;
        end;
    end;

var
    v: vector;
    dimL: integer;
begin
    dimL:= 0;
    cargarVector(v, dimL);
    eliminarDeVector(v, dimL);
end.