local ok, _ = pcall(require, 'banana')
if not ok then
	require('banana')
end
