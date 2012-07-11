--
--  Test we can find the cwd.
--

fs = require( "libfs" );


cwd = fs.cwd();

print("OK\tcwd() = " .. cwd );


--
-- Does this agree with the system?
--
local Hnd, ErrStr = io.popen("pwd");

if Hnd then
    for Line in Hnd:lines() do
        if ( cwd == Line ) then
             print( "OK\tcwd() and system(pwd) agree\n");
        end
    end
    Hnd:close()
else
    print("io.popen not available");
end
