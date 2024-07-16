% El Patio de Pepe

esVenenosa(petunia).
esVenenosa(rosa).
esVenenosa(menta).
% los girasoles NO tienen veneno alguno (NO son venenosas --> NO lo pongo)

esVenenosa(bromadiolona). % veneno para rata
esVenenosa(arlequin).     % rana mascota de Pepe

esPlanta(petunia).
esPlanta(rosa).
esPlanta(menta).

tieneGradoVeneno(Planta,3) :-   % tiene 3 de grado de veneno
    esPlanta(Planta),             % si es planta
    esVenenosa(Planta).         % si es venenosa

tieneGradoVeneno(bromadiolona,20).
tieneGradoVeneno(arlequin,40).
tieneGradoVeneno(pepe,18).

% una planta sera comestible cuando NO sea venenosa
esPlantaComestible(Planta) :-
    esPlanta(Planta),
    not(esVenenosa(Planta)).

% algo sera heavy cuando su nivel de veneno sea mayor a 10 y menor a 30
esHeavy(Algo) :-
    tieneGradoVeneno(Algo,NivelVeneno),
    between(10, 30, NivelVeneno). % "entre" 10 y 30

% algo sera incomible cuando su nivel de veneno sea mayor a 30
esIncomible(Algo) :-
    tieneGradoVeneno(Algo,NivelVeneno),
    NivelVeneno > 30.

% una combinacion de 2 elementos es incomible si la suma de sus grados es igual a 21
combinacionIncomible(Elemento1, Elemento2) :-
    tieneGradoVeneno(Elemento1, Nivel1),
    tieneGradoVeneno(Elemento2, Nivel2),
    21 is Nivel1 + Nivel2.  % Resultado ="is" (operacion)