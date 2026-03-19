program ejercicio4; 

type

    vPesos = array [1..42] of real;  // SE DISPONE

    paciente = record
        nom: string;
        ape: string;
        pesos: vPesos;
    end;

    lista = ^nodo // SE DISPONE

    nodo = record
        dato: paciente;
        sig: lista;
    end;

    function sacarMaximaSemana (v: vPesos): integer;
    var
        i: integer;
        maxPeso, aumento: real;
        maxSemana: integer;
    begin
        maxPeso:= -1;
        maxSemana:= -1;
        for i:= 2 to 42 do begin
            aumento:= v[i] - v[i-1]
            if (aumento > maxPeso) then begin
                maxPeso:= aumento;
                maxSemana:= i;
            end;
        end;
        sacarMaximaSemana:= maxSemana;
    end;

    function aumentoTotal (v: vPesos): real;
    begin
        aumentoTotal:= v[42] - v[1];
    end;

    procedure procesarPacientes (l: lista);
    begin
        while (l <>  nil) do begin
            writeln ('Paciente: ', l^.dato.nom, ' ', l^.dato.ape, ' Semana de mayor aumento: ', sacarMaximaSemana(l^.dato.pesos));
            writeln ('Aumento de peso total: ', aumentoTotal(l^.dato.pesos));
            l:= l^.sig;
        end;
    end;

var 
    l: lista;
begin
    l:= nil;
    procesarPacientes(l);
end;