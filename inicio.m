%Programa que llama a las funciones

%Se adecua la imagen seleccionada al programa
[ nombreImagen, rutaImagen ] = uigetfile(  { '*.tiff'; ...
                                    '*.jpg'; '*.bmp';...
                                    '*.gif'; '*.*' }, ...
                                    'Seleccionar Imagen' ); 
imagen3 = imread( [ rutaImagen, nombreImagen ] );
imagen2 = rgb2ycbcr( imagen3 );
imagen = imagen2( :, :, 1);
imwrite( imagen, 'I.bmp','bmp' );
imagen = imread( 'I.bmp','bmp' );
 
%Aplicando la transformada Wavelet a la imagen
[ BB, AB, BA, AA ] = transformWavelet( imagen );