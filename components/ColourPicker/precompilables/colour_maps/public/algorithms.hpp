#include <type_traits>
#include <array>
#include <numeric>

namespace colour_picker{
    #ifndef ALGORITHMS_HPP
    #define ALGORITHMS_HPP
        
        /// @brief Creates an array of indices from 0 to length - 1.
        /// @tparam IntegralType The type of the indices.
        /// @tparam length The length of the array.
        /// @return An array of indices from 0 to length - 1.
        template<
            typename IntegralType, 
            size_t length, 
            std::enable_if_t<std::is_integral_v<IntegralType>, bool> = true
        > std::array<IntegralType, length> CreateIndexArray(){
            std::array<IntegralType, length> indexArray;
            std::iota(indexArray.begin(), indexArray.end(), 0);
            return indexArray;
        }

    #endif // ALGORITHMS_HPP
}