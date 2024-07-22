#include <cstdint>

namespace colour_picker{
    void HSLToRGB(
        const double hue, const double saturation, const double lightness,
        uint8_t& red, uint8_t& green, uint8_t& blue
    );
}