program ejercicio14;

const
    diasMes: 1..31;
type

    prestamo = record
        nroPrestamo: integer;
        isbn: integer;
        nroSocio: integer;
        diaPrestamo: diasMes;
    end;

    prestamoNuevo = record
        isbn: integer;
        cantPrestamos: integer;
    end;

    lista = ^nodoLista

    nodoLista = record
        dato: prestamoNuevo;
        sig: lista;
    end;

    vMes = array [diasMes] of integer;

    procedure leerPrestamo (var p: prestamo);
    begin
        readln(p.isbn);
        if (p.isbn <> -1) then begin
            readln(p.nroLibro);
            readln(p.nroSocio);
            readln(p.diaPrestamo);
        end;
    end;

    procedure agregarAdelante (var l: lista; p: prestamo);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato.isbn:= p.isbn;
        nue^.dato.cantPrestamos:= 1;
        nue^.sig:= l;
        l:= nue;
    end;

    procedure cargarListaYVector (var l: lista; var v: vMes);
    var
        p: prestamo;
        isbnActual: integer;
        cantPrestamosCond: integer;
        porcentaje: real;
    begin
        cantPrestamosCond:= 0;
        cantPrestamosTotal:= 0;
        min:= 9999;
        minDia:= 9999;
        leerPrestamo(p);
        while (p.isbn <> -1) do begin
            isbnActual:= p.isbn;
            agregarAdelante(l,p);
            while (p.isbn <> -1) and (p.isbn = isbnActual) do begin
                l^.dato.cantPrestamos:= l^.dato.cantPrestamos + 1;
                v[p.diaPrestamo]:= v[p.diaPrestamo] + 1;
                if (p.nroPrestamo MOD 2 = 1) and (p.nroSocio MOD 2 = 0) then begin
                    cantPrestamosCond:= cantPrestamosCond + 1;
                end;
                cantPrestamosTotal:= cantPrestamosTotal + 1;
                leerPrestamo(p);
            end;
        end;
        for i:= 1 to 31 do begin
            if (v[i] < min) then begin
                min:= v[i];
                minDia:= i;
            end;
        end;
        porcentaje:= (cantPrestamosCond * 100) / cantPrestamosTotal;
    end;    

var

begin

end;