import os
import sys

# determine this script file's location.
this_module_dir = os.path.abspath ( os.path.dirname( sys.modules[__name__].__file__) )

def preprocess_file( infile, outfile ):
    print infile.name
    source = infile.read()
    processed = source.replace( '// ', '//! ' )
    outfile.write( processed )

def preprocess_dir( srcDir, dstDir ):

    # delete the previous output dir.
    if os.path.isdir( dstDir ):
	for filename in os.listdir( dstDir ):
	    filepath = os.path.join( dstDir, filename )
	    (filebasename, fileext) = os.path.splitext( filepath )
	    if fileext == ".cpp" or fileext == ".h":
		os.remove( filepath )
	os.rmdir( dstDir )

    os.makedirs( dstDir )

    for filepath in os.listdir( srcDir ):
	srcfilepath = os.path.join( srcDir, filepath )
	dstfilepath = os.path.join( dstDir, filepath )
	
	if os.path.isfile( srcfilepath ):
	    (srcfilebasename, srcfileext) = os.path.splitext( srcfilepath )
	    if srcfileext == ".cpp" or srcfileext == ".h":
		srcfile = open( srcfilepath )
		dstfile = open( dstfilepath, 'w' )
		preprocess_file( srcfile, dstfile )
		dstfile.close()
		srcfile.close()

preprocess_dir( 
	os.path.join( this_module_dir, "..", "Engine", "Common" ),
	os.path.join( this_module_dir, "Code", "Engine", "Common" ) )

preprocess_dir( 
	os.path.join( this_module_dir, "..", "Engine", "FileSystem" ),
	os.path.join( this_module_dir, "Code", "Engine", "FileSystem" ) )

preprocess_dir( 
	os.path.join( this_module_dir, "..", "Engine", "Graphics" ),
	os.path.join( this_module_dir, "Code", "Engine", "Graphics" ) )

preprocess_dir( 
	os.path.join( this_module_dir, "..", "Engine", "UberTexture" ),
	os.path.join( this_module_dir, "Code", "Engine", "UberTexture" ) )


