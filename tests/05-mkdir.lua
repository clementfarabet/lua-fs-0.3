--
-- Test the mkdir() call.
--
fs = require( "libfs" );



--
--  Test that a new directory is created
--
function make_dir( name )
    -- returns nil if failed, name if success.

    info = fs.stat( name );

        -- if the target directory to already exists, note it and return.
        -- but return & complain if a non-directory of that name exists!

    if info == nil then
          -- ok, doesn't exist yet.

    elseif info.type == 'directory' then
       print("OK\tDirectory already exists - " .. name );
       return name;

    else
       print("FAILED\ta file with that name already exists - " .. name );
       return nil;
       end;

    ret = fs.mkdir( name );
    if ret == nil then
       print("FAILED\tmkdir(" .. name .. ")" );
       return nil;
       end

    print("OK\tmkdir(" .. name .. ")" );

    info = fs.stat( name );
    if info.type ~= 'directory' then
       print("FAILED\tfailed to create directory - " .. name );
       return nil;
       end

    print("OK\tDirectory now exists - " .. name );

    return name;

    end       -- end make_dir

-- create a few directories in /tmp ...
-- assume there is no file called /tmp/foo

if make_dir ("/tmp/foo") then
   if make_dir ("/tmp/foo/foo") then
      if make_dir ("/tmp/foo/foo/bar") then
         print ("test 05: good!");
         end
      end
   end
