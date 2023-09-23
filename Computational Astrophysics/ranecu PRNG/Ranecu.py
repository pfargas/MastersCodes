"""ranecu method for generating random numbers"""


def ranecu(iseed1, iseed2, num=10):
    """Definition of ranecu method for generating random numbers.
    This is a linear congruential generator (LCG) with two seeds.
    The method is described in the paper by F. James, Comp. Phys. Comm. 60 (1990) 329-344.

    Args:
        iseed1 (int): first seed
        iseed2 (int): second seed
        num (int, optional): Number of random numbers. Defaults to 10.

    Returns:
        list[float]: list of random numbers U(0,1)
    """
    result = []
    for _ in range(num):
        I1 = iseed1 // 53668
        iseed1 = 40014 * (iseed1 % 53668) - I1 * 12211
        # iseed1 = 40014*(iseed1-I1*53668)-I1*12211
        if iseed1 < 0:
            iseed1 = +2147483563

        I2 = iseed2 // 52774
        iseed2 = 40692 * (iseed2 % 52774) - I2 * 3791
        # iseed2 = 40692*(iseed2-I2*52774)-I2*3791
        if iseed2 < 0:
            iseed2 = +2147483399

        z = iseed1 - iseed2
        if z < 1:
            z = z + 2147483562
        result.append(z / 2.147483563e9)
    return result


if __name__ == "__main__":
    seed1 = 348713
    seed2 = 738131
    print(ranecu(seed1, seed2, 10))
