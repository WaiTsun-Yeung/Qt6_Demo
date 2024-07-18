#include <cstdint>

#include <QColor>

#include "ColourConverter.hpp"
#include "colour_models.hpp"

namespace colour_picker{
    QColor ColourConverter::hslToRgb(
        const float hue, const float saturation, const float lightness
    ){
        uint8_t red, green, blue;
        HSLToRGB(hue, saturation, lightness, red, green, blue);
        return QColor(red, green, blue);
    }
}