%Programa que llama a las funciones

%Se adecua la imagen seleccionada al programa
[ nombreImagen, rutaImagen ] = uigetfile(  { '*.tiff'; ...
                                    '*.jpg'; '*.bmp';...
                                    '*.gif'; '*.*' }, ...
                                    'Seleccionar Imagen' ); 
imagenHuesped3 = imread( [ rutaImagen, nombreImagen ] );
imagenHuesped2 = rgb2ycbcr( imagenHuesped3 );
imagenHuesped = imagenHuesped2( :, :, 1);
imwrite( imagenHuesped, 'I.bmp','bmp' );
imagenHuesped = imread( 'I.bmp','bmp' );
