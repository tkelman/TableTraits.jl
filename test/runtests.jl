using TableTraits
using NamedTuples
using Base.Test

immutable MyType
end

@testset "TableTraits" begin

table_array = [@NT(a=1), @NT(a=2)]
other_array = [1,2,3]

@test isiterabletable(table_array)
@test !isiterabletable(other_array)

@test_throws ErrorException getiterator(MyType())

iter = getiterator(table_array)
@test TableTraits.column_names(iter) == [:a]
@test TableTraits.column_types(iter) == [Int]
@test TableTraits.column_count(iter) == 1

iter2 = getiterator(other_array)
@test_throws ErrorException TableTraits.column_names(iter2)
@test_throws ErrorException TableTraits.column_types(iter2)
@test_throws ErrorException TableTraits.column_count(iter2)

end
