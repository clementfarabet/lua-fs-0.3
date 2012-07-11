--
--  Test that we can successfully chmod() files.
--


fs = require( "libfs" );


--
--  1.  Get the current mode.
--  2.  Attempt to change it.
--  3.  Get the new mode and verify it worked.
--  4.  Change back to original mode and verify that succeeded.
--  5.  Done.

function test_chmod( name, mode )
   local original;
   local nstat;
   local stat;

   -- Get original details.
   stat = fs.stat( name );
   if ( stat == nil ) then
        print("FAILED\t1st stat(" .. name .. ")" );
        return;
   end;

   -- Save original mode away.
   original = stat.mode;


   -- Now attempt to change it
   fs.chmod( name, mode );

   --- Get the new mode, so we can see if it worked.
   nstat = fs.stat( name );
   if ( nstat == nil ) then
        print("FAILED\t2nd stat(" .. name .. ")" );
        return;
   end;

   -- Test that the change worked.
   if ( nstat.mode == mode ) then
	print("OK\tchmod(" .. name .. "," .. mode .. ")" );
   else
	print("FAILED\tchmod(" .. name .. "," .. mode .. ") got '" .. nstat.mode .. "'  expected '" .. mode .. "'" );
   end

   -- Now reset to original mode.
   fs.chmod( name, original );

end


--
--  Different files and modes to try.
--

test_chmod( "07-chmod.lua", 755 );
test_chmod( "07-chmod.lua", 600 );
test_chmod( "07-chmod.lua", 555 );
test_chmod( "07-chmod.lua", 777 );
