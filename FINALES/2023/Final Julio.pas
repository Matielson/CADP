program finalJulio2022;

const

    rubros: 1..20;

type

    producto = record
        cod: integer;
        nom: string;
        rubro: rubros;
        precio: real;
    end;
    
    lista = ^nodoLista  /// SE DISPONE

    nodoLista = record
        dato: producto;  /// SE DISPONE
        sig: lista;
    end;

    vRubros = array [rubros] of integer;

    procedure inicializarVector (var vR: vRubros);
    var
        i: integer;
    begin
        for i:= 1 to 20 do begin
            vR[i]:= 0;
        end;
    end;

    procedure contarRubros (var vR: vRubros; l: lista);
    begin
        while (l <> nil) do begin
            vR[l^.dato.rubro]:= vR[l^.dato.rubro] + 1;
            l:= l^.sig;
        end;
    end;

    procedure agregarAdelante (var l: lista2; p: producto);
    var
        nue: lista2;
    begin
        new(nue);
        nue^.dato:= p;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarLista (vR: vRubros; l: lista; var l2: lista2);
    begin
        while (l <> nil) do begin
            if (vR[l^.dato.rubro] = 10) then begin
                agregarAdelante(l2, l^.dato);
            end;
            l:= l^.sig;
        end;
    end;

var
    l: lista;
    l2: lista2;
    vR: rubros;
begin
    l:= nil;
    l2:= nil;
    inicializarVector(vR);
    contarRubros(vR, l);
    cargarLista(vR, l, l2);
end;