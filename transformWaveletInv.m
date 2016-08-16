% Función que realiza la Transformada Discreta Wavelet Inversa
% utilizando los filtros de reconstrucción Haar o Daubechies 1 ( db1 )

function imagenReconstruida = transformWaveletInv( pBB, pBA, pAB, pAA )

    filtroPasoBajo = [ 0.7071 , 0.7071 ];
    longuitudFiltroB = length( filtroPasoBajo );

    filtroPasoAlto = [ 0.7071 , -0.7071 ];
    longuitudFiltroA = length( filtroPasoAlto );

    pasoBajoBajo = pBB;
    [ nbb, mbb ] = size( pasoBajoBajo );

    pasoBajoAlto = pBA;
    [ nba, mba ] = size( pasoBajoAlto );

    pasoAltoBajo = pAB;
    [ nab, mab ] = size( pasoAltoBajo );

    pasoAltoAlto = pAA;
    [ naa, maa ] = size( pasoAltoAlto );

    tPasoBB = zeros( longuitudFiltroB );
    
    posicion = 1;

    for i = 1 : nbb
        for j = 1 : mbb
            tPasoBB( posicion , j ) = pasoBajoBajo( i , j );
        end
        posicion = posicion + 2;
    end

    [ m, n ] = size( tPasoBB );

    convolucionesBB = zeros( longuitudFiltroB );
    pasoBajoBajo = zeros( longuitudFiltroB );

    for columnaExterior = 1:n
        for fila = 1 : longuitudFiltroB 
            for columnaInterior =1:m

                convolucionesBB( fila , (fila-1) + columnaInterior ) = ...
                    filtroPasoBajo( fila ) * tPasoBB( columnaInterior, ...
                    columnaExterior); 
            end
        end
        matrizResultados2 = sum( convolucionesBB );
        dimension = length( matrizResultados2 );

        j = 1;

        for i = 1 : dimension
            pasoBajoBajo( j , columnaExterior  ) = matrizResultados2( i );
            j = j + 1;
        end
    end

    [ nbb , mbb ] = size(pasoBajoBajo);

    t2PasoBB = zeros( longuitudFiltroA );

    posicion = 1;

    for i = 1 : nbb
        for j = 1 : mbb
            t2PasoBB( i , posicion ) = pasoBajoBajo( i , j );
            posicion = posicion + 2;
        end
        posicion = 1;
    end

    [ m , n ] = size( t2PasoBB );

    convolucionesB = zeros( longuitudFiltroB );
    pasoBajo1 = zeros( longuitudFiltroB );

    for filaExterior = 1 : m
        for fila = 1 : longuitudFiltroB 
            for filaInterior = 1 : n

                convolucionesB( fila , ( fila - 1 ) + filaInterior ) = ...
                    filtroPasoBajo( fila ) * t2PasoBB( filaExterior, ...
                    filaInterior ); 
            end
        end

        matrizResultados1 = sum( convolucionesB );
        dimension = length( matrizResultados1 );

        j = 1;
    
        for i = 1 : dimension
            pasoBajo1( filaExterior , j  ) = matrizResultados1( i );
            j = j + 1;
        end
    end

    posicion = 1;

    tPasoBA = zeros( longuitudFiltroA );

    for i = 1 : nba
        for j = 1 : mba
            tPasoBA( posicion , j ) = pasoBajoAlto( i , j );
        end
        posicion = posicion + 2;
    end

    [ m , n ] = size( tPasoBA );

    convoluciones2 = zeros( longuitudFiltroB );
    pasoBajoAlto = zeros( longuitudFiltroB );

    for columnaExterior = 1 : n
        for fila = 1 : longuitudFiltroA 
            for columnaInterior = 1 : m

            convoluciones2( fila , ( fila - 1 ) + columnaInterior ) = ...
                    filtroPasoAlto( fila ) * tPasoBA( columnaInterior, ...
                    columnaExterior); 
            end
        end

        matrizResultados2 = sum( convoluciones2 );
        dimension = length( matrizResultados2 );

        j = 1;

        for i = 1 : dimension
            pasoBajoAlto( j , columnaExterior  ) = matrizResultados2( i );
            j = j + 1;
        end
    end

    [ nba , mba ] = size(pasoBajoAlto);

    t2PasoBA = zeros( longuitudFiltroB );

    posicion = 1;

    for i = 1 : nba
        for j = 1 : mba
            t2PasoBA( i , posicion ) = pasoBajoAlto( i , j );
            posicion = posicion + 2;
        end
        posicion = 1;
    end

    [ m , n ] = size( t2PasoBA );

    convolucionesB = zeros( longuitudFiltroA );
    pasoBajo2 = zeros( longuitudFiltroA );

    for filaExterior = 1:m
        for fila = 1 : longuitudFiltroB 
            for filaInterior =1:n

                convolucionesB( fila , ( fila - 1 ) + filaInterior ) = ...
                    filtroPasoBajo( fila ) * t2PasoBA( filaExterior, ...
                    filaInterior ); 
            end
        end

        matrizResultados1 = sum( convolucionesB );
        dimension = length( matrizResultados1 );

        j = 1;
    
        for i = 1 : dimension
            pasoBajo2( filaExterior , j  ) = matrizResultados1( i );
            j = j + 1;
        end
    end

    tPasoAB = zeros( longuitudFiltroB );
    posicion = 1;

    for i = 1 : nab
        for j = 1 : mab
            tPasoAB( posicion , j ) = pasoAltoBajo( i , j );
        end
        posicion = posicion + 2;
    end

    [ m , n ] = size( tPasoAB );

    convoluciones3 = zeros( longuitudFiltroA );
    pasoAltoBajo = zeros( longuitudFiltroA );

    for columnaExterior = 1 : n
        for fila = 1 : longuitudFiltroB 
            for columnaInterior = 1 : m

                convoluciones3( fila , ( fila - 1 ) + columnaInterior ) = ...
                    filtroPasoBajo( fila ) * tPasoAB( columnaInterior, ...
                    columnaExterior); 
            end
        end

        matrizResultados2 = sum( convoluciones3 );
        dimension = length( matrizResultados2 );

        j = 1;

        for i = 1 : dimension
            pasoAltoBajo( j , columnaExterior  ) = matrizResultados2( i );
            j = j + 1;
        end
    end

    [ nab , mab ] = size(pasoAltoBajo);

    t2PasoAB = zeros( longuitudFiltroA );

    posicion = 1;

    for i = 1 : nab
        for j = 1 : mab
            t2PasoAB( i , posicion ) = pasoAltoBajo( i , j );
            posicion = posicion + 2;
        end
        posicion = 1;
    end

    [ m , n ] = size( t2PasoAB );

    convolucionesB = zeros( longuitudFiltroA );
    pasoBajo3 = zeros( longuitudFiltroA );

    for filaExterior = 1 : m
        for fila = 1 : longuitudFiltroA 
            for filaInterior = 1 : n

                convolucionesB( fila , ( fila - 1 ) + filaInterior ) = ...
                    filtroPasoAlto( fila ) * t2PasoAB( filaExterior, ...
                    filaInterior ); 
            end
        end

        matrizResultados1 = sum( convolucionesB );
        dimension = length( matrizResultados1 );

        j = 1;

        for i = 1 : dimension
            pasoBajo3( filaExterior , j  ) = matrizResultados1( i );
            j = j + 1;
        end
    end

    tPasoAA = zeros( longuitudFiltroA );
    posicion = 1;

    for i = 1 : naa
        for j = 1 : maa
            tPasoAA( posicion , j ) = pasoAltoAlto( i , j );
        end
        posicion = posicion + 2;
    end

    [ m , n ] = size( tPasoAA );

    convoluciones4 = zeros( longuitudFiltroA );
    pasoAltoAlto = zeros( longuitudFiltroA );

    for columnaExterior = 1 : n
        for fila = 1 : longuitudFiltroA 
            for columnaInterior = 1 : m

            convoluciones4( fila , ( fila - 1 ) + columnaInterior ) = ...
                    filtroPasoAlto( fila ) * tPasoAA( columnaInterior, ...
                    columnaExterior); 
            end
        end

        matrizResultados4 = sum( convoluciones4 );
        dimension = length( matrizResultados4 );

        j = 1;

        for i = 1 : dimension
            pasoAltoAlto( j , columnaExterior  ) = matrizResultados4( i );
            j = j + 1;
        end
    end

    [ naa , maa ] = size(pasoAltoAlto);

    t2PasoAA = zeros( longuitudFiltroA );

    posicion = 1;

    for i = 1 : naa
        for j = 1 : maa
            t2PasoAA( i , posicion ) = pasoAltoAlto( i , j );
            posicion = posicion + 2;
        end
        posicion = 1;
    end

    [ m , n ] = size( t2PasoAA );

    convolucionesB = zeros( longuitudFiltroB );

    pasoBajo4 = zeros( longuitudFiltroB );

    for filaExterior = 1 : m
        for fila = 1 : longuitudFiltroA 
            for filaInterior = 1 : n

                convolucionesB( fila , ( fila - 1 ) + filaInterior ) = ...
                    filtroPasoAlto( fila ) * t2PasoAA( filaExterior, ...
                    filaInterior ); 
            end
        end

        matrizResultados1 = sum( convolucionesB );
        dimension = length( matrizResultados1 );

        j = 1;

        for i = 1 : dimension
            pasoBajo4( filaExterior , j  ) = matrizResultados1( i );
            j = j + 1;
        end
    end

    matrizResultante = pasoBajo1 + pasoBajo2 + pasoBajo3 + pasoBajo4;

    imagenReconstruida = matrizResultante;

    end
