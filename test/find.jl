
@testset "unit tests" begin
    @testset "rse_sum" begin
        #@test rse_sum([1,5,7]) == 13
        @test rse_sum(1:36) == 666

        @test_throws AssertionError rse_sum([NaN, 3, 2])
    end

    @testset "rse_mean" begin
        @test rse_mean([1, 2, 3]) == 2
        @test rse_mean([1, 3, 6]) ≈ 3.333 atol = 1e-3

    end
end

@testset "integration test" begin

    data1 = [1, 2, 3]
    data2 = [4, 5, 6]

    # Expected result
    expected_mean_of_sum = 10.5

    sum1 = rse_sum(data1)
    sum2 = rse_sum(data2)

    # Actual result
    actual_mean_of_sum = rse_mean([sum1, sum2])

    # Test
    @test actual_mean_of_sum == expected_mean_of_sum

end
