-- C lib
require 'libfs'

-- import all symbols
fs = {}
for key,val in pairs(libfs) do
   fs[key] = val
end

-- create convenient shortcuts
fs['ls'] = function(dir)
              local list = fs.readdir(dir or '.')
              for _,elt in ipairs(list) do
                 print(elt)
              end
              return list
           end
fs['cd'] = function(dir)
              local ok = fs.chdir(dir)
              if not ok then
                 print('cd: could not change directory to: ' .. dir)
              else
                 print('cwd: ' .. fs.cwd())
              end
           end
