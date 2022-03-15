#include <gtest/gtest.h>

#include "proj/a.hpp"


TEST(ATest, Hoge)
{
    EXPECT_EQ(proj::hello(), "heeloo");
}
