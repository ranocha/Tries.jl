using DataStructures
using Base.Test

# construction

@test typeof(OrderedDict()) == OrderedDict{Any,Any}
@test typeof(OrderedDict('a',1)) == OrderedDict{Char,Int}
@test typeof(OrderedDict([("a",1),("b",2)])) == OrderedDict{ASCIIString,Int}

# empty dictionary
d = OrderedDict(Char, Int)
@test length(d) == 0
@test isempty(d)
@test_throws d['c'] == 1
d['c'] = 1
@test !isempty(d)
empty!(d)
@test isempty(d)

# access, modification

for c in 'a':'z'
    d[c] = c-'a'+1
end

@test (d['a'] += 1) == 2
@test 'a' in keys(d)
@test haskey(d, 'a')
@test get(d, 'B', 0) == 0
@test !('B' in keys(d))
@test !haskey(d, 'B')
@test pop!(d, 'a') == 2

@test collect(keys(d)) == ['b':'z']
@test collect(values(d)) == [2:26]
@test collect(d) == [(a,i) for (a,i) in zip('b':'z', 2:26)]

