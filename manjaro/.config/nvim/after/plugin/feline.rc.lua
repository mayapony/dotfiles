local status, feline = pcall(require, 'feline')
if (not status) then
  print('feline is not installed')
  return 
end


feline.setup()
