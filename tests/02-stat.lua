--
--  Test that stat() returns appropriate things.
--

--
--  Load the library
--
fs = require( "libfs" );



--
--  Test that the given file is a file.
--
function ensure_is_file( name )
    info = fs.stat( name );

    if ( info.type == "file" ) then
        print( "OK\tstat(" .. name .. ").type == 'file'");
    else
        print( "FAILED\tstat(" .. name .. ").type = " .. info.type );
    end
end



--
--  Test that the given file is a directory
--
function ensure_is_directory( name )
    info = fs.stat( name );

    if ( info.type == "directory" ) then
        print( "OK\tstat(" .. name .. ").type == 'directory'" );
    else
        print( "FAILED\tstat(" .. name .. ").type = " .. info.mode );
    end
end




--
--  Now the tests.
--
ensure_is_file( "01-load.lua" );

ensure_is_directory( "/etc" );
ensure_is_directory( os.getenv( "HOME" ) );
