#include "proj/a.hpp"

#include <iostream>

namespace proj
{

std::string hello()
{
    return "heeloo";
}

}  // namespace proj

int main()
{
    std::cout << proj::hello() << std::endl;
}
