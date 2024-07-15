#include <cstdint>
#include <vector>

#include "colour_models.hpp"

namespace colour_picker{

    /// @brief Generates a hue lightness map buffer.
    /// @param[out] hueLightnessMap The buffer to store the hue lightness map.
    ///     The container is assumed to be empty/with the incorrect size.
    /// @param[in] width The frame width of the hue lightness map.
    /// @param[in] height The frame height of the hue lightness map.
    /// @param[in] saturationIndex The index of the hue lightness map. It is
    ///     linearly correlated with the saturation value, from 0 to
    ///     max saturation.
    /// @param[in] saturationCount The number of hue lightness maps to create.
    void GenerateHueLightnessMapRGBBuffer(
        std::vector<uint8_t>& hueLightnessMap,
        const int width, const int height,
        const int saturationIndex,
        const int saturationCount
    ){
        constexpr int rgbChannels = 3;
        hueLightnessMap.resize(width * height * rgbChannels);
        std::vector<uint8_t>::iterator hueLightnessMapIter 
            = hueLightnessMap.begin();
        for (int y = 0; y < height; ++y){
            for (int x = 0; x < width; ++x){
                uint8_t& red = *hueLightnessMapIter++;
                uint8_t& green = *hueLightnessMapIter++;
                uint8_t& blue = *hueLightnessMapIter++;
                HSLToRGB(
                    static_cast<float>(x) / width, 
                    static_cast<float>(saturationIndex) / (saturationCount - 1), 
                    1 - static_cast<float>(y) / (height - 1),
                    red, green, blue
                );
            }
        }
    }
}