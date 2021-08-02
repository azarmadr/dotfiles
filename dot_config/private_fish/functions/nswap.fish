function nswap
mv $argv[1] __tmp
mv $argv[2] $argv[1]
mv __tmp $argv[2]
end
