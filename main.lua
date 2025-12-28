-- Daily Project 1
-- 28 December 2025
-- Alexander Kirchberger

-- See number of layers and check if the correct number of arguments
numLayers = tonumber(arg[1],10)
if numLayers == nil then 
  print("Number of layers not an integer")
  return 1
end

if #arg ~= ((4*numLayers)+1) then
  print("Incorrect number of arguments")
  return 1
end

-- Parse and check layers
layers = {}
for i = 1,numLayers,1 
do
  layers[i] = {}
  layers[i][1] = tonumber(arg[(4*(i-1))+2],10)
  layers[i][2] = tonumber(arg[(4*(i-1))+3],10)
  layers[i][3] = tonumber(arg[(4*(i-1))+4],10)
  layers[i][4] = tonumber(arg[(4*(i-1))+5])
  
  if (0 > layers[i][1]) or (layers[i][1] > 255) or (0 > layers[i][1]) or (layers[i][2] > 255) or (0 > layers[i][3]) or (layers[i][3] > 255) or (0 > layers[i][4]) or (layers[i][4] > 1) then
    print("Values out of range")
    return 0
  end
end

-- Print for the simple case of 1 layer
if numLayers == 1 then
  print("Red", tostring(layers[1][1]))
  print("Green", tostring(layers[1][2]))
  print("Blue", tostring(layers[1][3]))
  print("Alpha", tostring(layers[1][4]))
  return 0
end

final = layers[1]
-- apply layers one after another
for i = 1,(numLayers-1),1
do
  temp = final[4]
  final[4] = layers[i+1][4] + (1-layers[i+1][4])*layers[i][4]
  final[1] = ((final[1]*temp*(1-layers[i+1][4])) + layers[i+1][1]*layers[i+1][4])/final[4]
  final[2] = ((final[2]*temp*(1-layers[i+1][4])) + layers[i+1][2]*layers[i+1][4])/final[4]
  final[3] = ((final[3]*temp*(1-layers[i+1][4])) + layers[i+1][3]*layers[i+1][4])/final[4]
end

print("Red", tostring(final[1]))
print("Green", tostring(final[2]))
print("Blue", tostring(final[3]))
print("Alpha", tostring(final[4]))
return 0

