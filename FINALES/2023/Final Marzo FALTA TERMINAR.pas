program finalMarzo2023;
const

    dimFE = 2000;
    dimFF = 2000;

type

    facturas = record
        numF: integer;
        codC: integer;
        montoTotal: real;
    end;

    vFacturasE = array [1..2000] of facturas;  // SE DISPONE

    vFacturasF = array [1..2000] of facturas;  // SE DISPONE

    function buscarZona (v: vFacturasE; dimL: integer): integer;
    var

    begin
        while (i <= dimL) and (v[i] < 444) do begin
            i:= i + 1;
        end;
        if ()
    end;

    procedure actualizarVector (var vE: vFacturasE; var vF: vFacturasF; var dimLE: integer; dimLF: integer);
    var
        i: integer;
        zona: integer;
    begin
        i:= 1;
        if (dimLE + 1 <= dimFE) then begin
            while (i <= dimLF) and (vF[i].numF < 444) do begin
                i:= i + 1;
            end;
            if (vF[i].numF = 444) then begin
                zona:= buscarZona(vE, dimLE);
            end;
        end;
    end;

var

begin

end.