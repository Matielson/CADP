program finalMayo2022;

const

    sectores = 1..10;

type

    producto = record
        cod: integer;
        sector: sectores;
        desc: string;
        stock: integer;
        precio: real;
    end;

    lista = ^nodoLista  /// SE DISPONE

    nodoLista = record  /// SE DISPONE
        dato: producto;
        sig: lista;
    end;

    vSectores = array [sectores] of integer;

    procedure inicializarVector (var v: vSectores);
    var
        i: integer;
    begin
        for i:= 1 to 10 do begin
            v[i]:= 0;
        end;
    end;

    procedure contarSectores (var v: vSectores; l: lista);
    begin
        while (l <> nil) do begin
            v[l^.dato.sector]:= v[l^.dato.sector] + 1;
            l:= l^.sig;
        end;
    end;

    procedure informarMaximos (v: vSectores);
    var
        max1, max2: integer;
        maxSector1, maxSector2: integer;
    begin
        max1:= v[1];
        max2:= -1;
        for i:= 2 to 10 do begin
            if (v[i] > max1) then begin
                max2:= max1;
                max1:= v[i];
                maxSector2:= maxSector1;
                maxSector1:= i;
            end
            else
                if (v[i] > max2) then begin
                    max2:= v[i];
                    maxSector2:= i;
                end
        end;
        writeln('Los dos sectores con mayor cantidad de productos en stock son: ', maxSector1, ' y ', maxSector2);
    end;

var
    l: lista;
    v: vSectores;
begin
    l:= nil;
    inicializarVector(v);
    contarSectores(v,l);
    informarMaximos(v);
end;