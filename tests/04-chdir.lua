--
--  Test the chdir() function.
--


fs = require( "libfs" );


--
--  Get the cwd.
--
start = fs.cwd();
if ( start ~= nil ) then
    print("OK\tcwd() = " .. start);
end


--
-- Go up ..
--
if ( fs.chdir( ".." ) ) then
    print( "OK\tchdir(..)" );

    print("OK\tcwd() = " .. fs.cwd());

    if ( fs.chdir( start ) ) then
        print( "OK\tchdir(" .. start .. ")" );
        print("OK\tcwd() = " .. fs.cwd());
    end

    if ( fs.cwd() == start ) then
	print( "OK\tback to start" );
    end
else
    printf( "FAILED\tchdir(..)\n" );
end


if ( fs.chdir( "///fsdfdsfsdfdfsdf" ) == nil ) then
     print("OK\tchdir('illegal path') == nil" );
end