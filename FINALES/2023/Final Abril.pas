{
Un comercio dispone de una estructura de datos con las facturas (como máximo 2000 facturas) realizadas 
durante marzo de 2023. De cada factura se conoce el número de factura, código de cliente, código de sucursal y monto total. 
Las facturas se encuentran ordenadas por código de sucursal.

Se pide implementar un programa con un módulo que reciba la estructura que se dispone y devuelva el código de sucursal con mayor cantidad de facturas. El programa debe informar el valor retornado por el módulo.
}

program finalAbril2023;

const

type

    facturas = record
        numF: integer;
        codC: integer;
        codS: integer;
        montoTotal: real;
    end;

    vFacturas = array [1..2000] of facturas;

var

begin

end.