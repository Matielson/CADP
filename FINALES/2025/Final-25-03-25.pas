program final;

const

    sucursales = 1..5;

type

    factura = record
        numF: integer;
        codS: sucursales;
        montoTotal: real;
    end;

    vFacturas = array [1..1000] of factura;

    procedure eliminarSucursales (var v: vFacturas; sucursal: integer; var dimL: integer);
    var
        i: integer;
        monto: real;
    begin
        while (i <= dimL) do begin25
            if (v[i].codS = sucursal) then begin
                monto:= monto + v[i].montonTotal;
                v[i]:= v[dimL];
                dimL:= dimL - 1;
            end
            else    
                i:= i + 1;
        end;
    end;

var
    codigoAEliminar: integer;
begin
    readln(codigoAEliminar);
    eliminarSucursales(codigoAEliminar);
end;