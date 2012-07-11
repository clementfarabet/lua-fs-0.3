require 'libfs'
fs = {}
for key,val in pairs(libfs) do
   fs[key] = val
end
