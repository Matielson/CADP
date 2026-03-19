{Se dispone de la información de los participantes inscriptos a una carrera (a lo sumo 5000). De cada
participante se tiene DNI, nombre y apellido, categoría (1..5) y fecha de inscripción. Se pide implementar un
programa que guarde en una estructura adecuada los participantes de aquellas categorías que posean a lo sumo 50
inscriptos. Se sabe que cada participante se puede anotar en una sola categoría.}

program finalAgosto2022;

const

    categorias = 1..5;

type

    participante = record
        dni: integer;
        nom: string;
        ape: string;
        cat: categorias;
        fecha: string;
    end;

    lista = ^nodoLista;

    nodoLista = record
        dato: lista;
        sig: lista;
    end;

    vCategorias = array [categorias] of integer;

    vParticipantes = array [1..5000] of participante; /// SE DISPONE

    procedure cargarVector (var v: vParticipantes; var dimL: integer); /// SE DISPONE

    procedure inicializarVector (var vC: vCategorias);
    var
        i: integer;
    begin
        for i:= 1 to 5 do begin
            vC[i]:= 0;
        end;
    end;

    procedure contarPorCategoria (var vC: vCategorias; vP: vParticipantes; dimL: integer);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin
            vC[vP[i].cat]:= vC[vP[i].cat] + 1;
        end;
    end;

    procedure cargarLista (var l: lista; vP: vParticipantes; vC: vCategorias; dimL: integer);
    var
        i: integer;
    begin
        for i:= 1 to dimL do begin
            if (vC[vP[i].cat] <= 50) then begin
                agregarAdelante(l, vP[i]);
            end;
        end;
    end;



var
    l: lista;
    vC: vCategorias;
    vP: vParticipantes;
    dimL: integer
begin
    l:= nil;
    cargarVector (vP, dimL); // SE DISPONE
    inicializarVector(vC);
    contarPorCategoria(vC, vP, dimL);
    cargarLista(l, vP, vC, dimL);
end;