--
--  Test we can remove directories successfully.
--

--
--  NOTE:  This relies upon the directories having
-- been created by 05-mkdir.lua
--
--



fs = require( "libfs" );


--
--  Test that a directory can be removed.
--
function remove_dir( name )

    info = fs.stat( name );
    if (info == nil) then
       print ("Directory ", name, " does not exist!");
       return;
       end

    if ( info.type == 'directory' ) then
          print("OK\tstat(" .. name .. ").type=='directory'" );
    end

    ret = fs.rmdir( name );
    if ( ret == nil ) then
        print("FAILED\trmdir(" .. name .. ")" );
        return;
    else
        print("OK\trmdir(" .. name .. ")" );
    end

    info = fs.stat( name );
    if ( info == nil ) then
          print("OK\tDirectory gone - " .. name);
    end

end


--
--  Try to remove these directories.
--
remove_dir( "/tmp/foo/foo/bar" );
remove_dir( "/tmp/foo/foo" );
remove_dir( "/tmp/foo" );
