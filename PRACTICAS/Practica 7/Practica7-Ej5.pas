program ejecicio5;

const

    codigos = 1..100;

type

    camion = record
        patente: integer;
        anoFabricacion: integer;
        capacidad: real;
    end;

    vFlota = array [1..100] of camion;

    viaje = record
        codV: integer;
        codCamion: codigos;
        distKm: real;
        dest: string;
        anoViaje: integer;
        dniChofer: integer;
    end;

    lista = ^nodoLista

    nodoLista = record
        dato: viaje;
        sig: lista;
    end;

    vCamiones = array [1.100] of camionNuevo;

    procedure leerViaje (var v: viaje);
    begin
        readln(v.codV);
        if (v.codV <> -1) then begin
            readln(v.codCamion);
            readln(v.distKm);
            readln(v.dest);
            readln(v.anoViaje);
            readln(v.dniChofer);
        end;
    end;

    procedure agregarAdelante (var l: lista; v: viaje);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato:= v;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarViajes (var l: lista);
    var
        v: viaje;
    begin
        leerViaje(v);
        while (v.codV <> -1) do begin
            agregarAdelante(l,v);
            leerViaje(v);
        end;
    end;

    procedure inicializarVector (var v: vCamiones);
    var
        i: integer;
    begin
        for i:= 1 to 100 do begin
            v[i]:= 0;
        end;
    end;

    function verificarCondiciones (v: viaje; vF: vFlota): boolean;
    begin
        verificarCondiciones:= (vF[v.codCamion].capacidad > 30.5) and ((v.anoViaje - vF[v.codCamion].anoFabricacion) > 5);
    end;

    procedure procesar (var vC: vCamiones; l: lista; vF:v Flota);
    var
        i: integer;
        maxKm, minKm: real;
        maxCod, minCod: integer;
        cantViajes: integer;
    begin
        maxKm:= -1;
        minKm:= 999999;
        maxCod:= -1;
        minCod:= 999999;
        cantViajes:= 0;
        while (l <> nil) do begin
            vC[l^.dato.codCamion]:= vC[l^.dato.codCamion] + l^.dato.distKm;

            if (verificarCondiciones(l^.dato)) then cantViajes:= cantViajes + 1;

            l:= l^.sig;
        end;

        for i:= 1 to 100 do begin
            if (vC[i] > maxKm) then begin
                maxKm:= vC[i];
                maxCod:= i;
            end
            if (vC[i] < minKm) then begin
                minKm:= vC[i];
                minCod:= i;
            end;
        end;

        writeln('La patente que mas kilometros recorridos posee es: ', vF[maxCod].patente);
        writeln('La patente que menos kilometros recorridos posee es: ', vF[minCod].patente);
        writeln('La cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y mas de 5 años de antiguedad es: ', cantViajes);
    end;



var

begin

end;