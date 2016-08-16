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