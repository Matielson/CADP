program Ejercicio1;
var
    i, codigo, cantInversion, codigoMaxEmpresa: integer;
    montoInversion, aux, maxMontoInversion, montoPromedio, empresaMasDeCincuenta: real;
begin
    maxMontoInversion:= -1;
    empresaMasDeCincuenta:= 0;
    repeat
        aux:= 0;
        writeln('Ingrese el codigo de la empresa: ');
        readln(codigo);
        writeln('Ingrese la cantidad de inversiones que tiene la empresa ingresada: ');
        readln(cantInversion);
        writeln('Ingrese el monto de cada inversion: ');
        for i:= 1 to cantInversion do begin
            readln(montoInversion);
            aux:= aux + montoInversion;
        end;
        if (aux > 50000) then begin
            empresaMasDeCincuenta:= empresaMasDeCincuenta + 1;
        end;
        if (aux > maxMontoInversion) then begin
            maxMontoInversion:= aux;
            codigoMaxEmpresa:= codigo;
        end;
        montoPromedio:= aux / cantInversion;
        writeln('Resultado del analisis: Empresa ', codigo, ' Monto promedio: ', montoPromedio);
    until(codigo=100);
    writeln('El codigo de la empresa con mayor monto total invertido es: ', codigoMaxEmpresa, 'con: $', maxMontoInversion);
    writeln('Hay ', empresaMasDeCincuenta, 'empresas con inversiones por mas de $50000')
end.
