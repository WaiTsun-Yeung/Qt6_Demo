#include <cstdint>

namespace colour_picker{
    void HSLToRGB(
        const float hue, const float saturation, const float lightness,
        uint8_t& red, uint8_t& green, uint8_t& blue
    );
}