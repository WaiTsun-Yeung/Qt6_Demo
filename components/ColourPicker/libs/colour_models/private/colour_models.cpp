#include <stdexcept>
#include <cstdint>
#include <cmath>

namespace colour_picker{
    /// @brief Converts a hue, saturation, and lightness value to an RGB value.
    /// @param[in] hue A modulo value on a colour wheel, 
    ///     where 0 is red, 1/3 is green, 2/3 is blue, etc.
    /// @param[in] saturation The intensity of the colour. The lower the value,
    ///     the closer to grey the colour will be. The range is [0, 1]. 
    /// @param[in] lightness The brightness of the colour. The lower the value,
    ///     the closer to black the colour will be. The higher the value, the
    ///     closer to white the colour will be. The range is [0, 1].
    /// @param[out] red The red component of the RGB value.
    /// @param[out] green The green component of the RGB value.
    /// @param[out] blue The blue component of the RGB value.
    void HSLToRGB(
        const double hue, const double saturation, const double lightness,
        uint8_t& red, uint8_t& green, uint8_t& blue
    ){
        if (hue < 0. || hue > 1.)
            throw std::invalid_argument("Hue must be in the range [0, 1].");
        if (saturation < 0. || saturation > 1.)
            throw std::invalid_argument(
                "Saturation must be in the range [0, 1]."
            );
        if (lightness < 0. || lightness > 1.)
            throw std::invalid_argument(
                "Lightness must be in the range [0, 1]."
            );
        const double chroma 
            = (1. - std::abs(2. * lightness - 1.)) * saturation;
        const double hueScaled = hue * 6.;
        const double x 
            = chroma * (1 - std::abs(std::fmodf(hueScaled, 2.) - 1.));
        const double m = lightness - chroma * 0.5;
        switch (static_cast<int>(hueScaled)){
            case 0: [[fallthrough]]; case 6:
                red = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                green = static_cast<uint8_t>((x + m) * UINT8_MAX);
                blue = static_cast<uint8_t>(m * UINT8_MAX);
                break;
            case 1:
                red = static_cast<uint8_t>((x + m) * UINT8_MAX);
                green = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                blue = static_cast<uint8_t>(m * UINT8_MAX);
                break;
            case 2:
                red = static_cast<uint8_t>(m * UINT8_MAX);
                green = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                blue = static_cast<uint8_t>((x + m) * UINT8_MAX);
                break;
            case 3:
                red = static_cast<uint8_t>(m * UINT8_MAX);
                green = static_cast<uint8_t>((x + m) * UINT8_MAX);
                blue = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                break;
            case 4:
                red = static_cast<uint8_t>((x + m) * UINT8_MAX);
                green = static_cast<uint8_t>(m * UINT8_MAX);
                blue = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                break;
            case 5:
                red = static_cast<uint8_t>((chroma + m) * UINT8_MAX);
                green = static_cast<uint8_t>(m * UINT8_MAX);
                blue = static_cast<uint8_t>((x + m) * UINT8_MAX);
                break;
            default:
                throw std::invalid_argument("Hue must be in the range [0, 1].");
        }
    }
}