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