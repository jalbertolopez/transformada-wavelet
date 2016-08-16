% Transforma Wavelet Discreta mediante 
% Filtros de reconstruccion Haar o Daubechies 1

function [ pBB, pBA, pAB, pAA ] = transformWavelet( imagenRecibida )

[ m, n, ~ ] = size( imagenRecibida );
imagenRecibida = double( imagenRecibida );

filtroPasoBajo = [ 0.7071, 0.7071 ];
longuitudFiltroB = length( filtroPasoBajo );

filtroPasoAlto = [ -0.7071, 0.7071 ];
longuitudFiltroA = length( filtroPasoAlto );

convolucionesB = zeros( longuitudFiltroB );
pasoBajo = zeros( longuitudFiltroB );

for filaExterior = 1 : m
    for fila = 1 : longuitudFiltroB 
        for filaInterior = 1 : n
            
            convolucionesB( fila, ( fila - 1 ) + filaInterior ) = ...
                filtroPasoBajo( fila ) * imagenRecibida( filaExterior, ...
                filaInterior ); 
        end
    end
    sumaResultadosB = sum( convolucionesB );
    dimension = length( sumaResultadosB );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoBajo( filaExterior, j  ) = sumaResultadosB( i );
        j = j + 1;
    end
end


[ m, n ] = size( pasoBajo );

convolucionesBB = zeros( longuitudFiltroB );
pasoBajoBajo = zeros( longuitudFiltroB );

for columnaExterior = 1 : n
    for fila = 1 : longuitudFiltroB 
        for columnaInterior = 1 : m
            
            convolucionesBB( fila, ( fila - 1 ) + columnaInterior ) = ...
                filtroPasoBajo( fila ) * pasoBajo( columnaInterior, ...
                columnaExterior ); 
        end
    end
    sumaResultados = sum( convolucionesBB );
    dimension = length( sumaResultados );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoBajoBajo( j, columnaExterior  ) = sumaResultados( i );
        j = j + 1;
    end
end

pBB = pasoBajoBajo;

[ m, n ] = size( pasoBajo );

convolucionesBA = zeros( longuitudFiltroA );
pasoBajoAlto = zeros( longuitudFiltroA );

for columnaExterior = 1 : n
    for fila = 1 : longuitudFiltroA 
        for columnaInterior = 1 : m
            
            convolucionesBA( fila, ( fila - 1 ) + columnaInterior ) = ...
                filtroPasoAlto( fila ) * pasoBajo( columnaInterior, ...
                columnaExterior ); 
        end
    end
    sumaResultados = sum( convolucionesBA );
    dimension = length( sumaResultados );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoBajoAlto( j, columnaExterior  ) = sumaResultados( i );
        j = j + 1;
    end
end

pBA = pasoBajoAlto;

[ m, n ] = size( imagenRecibida );

matrizConvolucionesA = zeros( longuitudFiltroB );
pasoAlto = zeros( longuitudFiltroB );

for filaExterior = 1 : m
    for fila = 1 : longuitudFiltroB 
        for filaInterior = 1 : n
            
            matrizConvolucionesA( fila, ( fila - 1 ) + filaInterior ) = ...
                filtroPasoAlto( fila ) * imagenRecibida( filaExterior, ...
                filaInterior ); 
        end
    end
    matrizResultadosA = sum( matrizConvolucionesA );
    dimension = length( matrizResultadosA );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoAlto( filaExterior, j  ) = matrizResultadosA( i );
        j = j + 1;
    end
end

[ m, n ] = size( pasoAlto );

convolucionesAB = zeros( longuitudFiltroA );
pasoAltoBajo = zeros( longuitudFiltroA );

for columnaExterior = 1 : n
    for fila = 1 : longuitudFiltroB 
        for columnaInterior = 1 : m
            
            convolucionesAB( fila, ( fila - 1 ) + columnaInterior ) = ...
                filtroPasoBajo( fila ) * pasoAlto( columnaInterior, ...
                columnaExterior ); 
        end
    end
    sumaResultados = sum( convolucionesAB );
    dimension = length( sumaResultados );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoAltoBajo( j, columnaExterior  ) = sumaResultados( i );
        j = j + 1;
    end
end

pAB =  pasoAltoBajo ;

[ m, n ] = size( pasoAlto );

convolucionesAA = zeros( longuitudFiltroA );
pasoAltoAlto = zeros( longuitudFiltroA );

for columnaExterior = 1 : n
    for fila = 1 : longuitudFiltroA 
        for columnaInterior = 1 : m
            
            convolucionesAA( fila, ( fila - 1 ) + columnaInterior ) = ...
                filtroPasoAlto( fila ) * pasoAlto( columnaInterior, ...
                columnaExterior ); 
        end
    end
    sumaResultados = sum( convolucionesAA );
    dimension = length( sumaResultados );
    
    j = 1;
    
    for i = 2 : 2 : dimension
        pasoAltoAlto( j, columnaExterior  ) = sumaResultados( i );
        j = j + 1;
    end
end

pAA = pasoAltoAlto;

end
