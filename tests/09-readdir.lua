--
--  Test readdir
--

fs = require( "libfs" );

--
--  Test reading a directory
--
function read_dir( name )

    info = fs.stat( name );
    if ( info.type ~= 'directory' ) then
       print (name, " not a directory, is: ", info.type);
       return;
    end

    ret = fs.readdir( name );
    if ( ret == nil ) then
        print("FAILED\treaddir(" .. name .. ")" );
        return;
        end

    print("OK\treaddir(" .. name .. "), found ", ret.n, " entries:" );

    for k,v in ipairs (ret) do
       print ("  entry # ", k, " = ", v);
       end
    print ();
end


--
--  Try to read these directories, and list their contents...
--

read_dir( "/tmp");
read_dir( ".");
