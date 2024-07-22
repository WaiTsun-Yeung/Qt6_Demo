#include <cstdint>

#include <QColor>
#include <QVariant>
#include <QList>

#include "ColourConverter.hpp"
#include "colour_models.hpp"

namespace colour_picker{
    QColor ColourConverter::hslToRgb(
        const double hue, const double saturation, const double lightness
    ){
        uint8_t red, green, blue;
        HSLToRGB(hue, saturation, lightness, red, green, blue);
        return QColor(red, green, blue);
    }
    QList<QVariant> ColourConverter::colorToHsl(const QColor& color){
        float tempHue, tempSaturation, tempLightness;
        color.getHslF(&tempHue, &tempSaturation, &tempLightness);
        return {tempHue, tempSaturation, tempLightness};
    }
}