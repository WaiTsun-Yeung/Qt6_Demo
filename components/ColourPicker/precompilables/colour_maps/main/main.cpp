#include <array>
#include <filesystem>
#include <string>
#include <cstdint>
#include <sstream>
#include <iomanip>

#include <QImage>

#include "qt_utilities.hpp"
#include "colour_maps.hpp"

int main(int argc, char *argv[])
{
    const std::array<int, 2> maxScreenSizes 
        = colour_picker::GetMaxScreenSize(argc, argv);
    // Example max screen size: 1280x720
    colour_picker::CreateHueLightnessMaps<UINT8_MAX + 1, QImage::Format>(
        maxScreenSizes[0], 
        maxScreenSizes[1],
        std::filesystem::path(__FILE__)
            .parent_path()
            .parent_path()
            .parent_path()
            .parent_path()
            / "resources" 
            / "colour_maps",
        [](const int saturationIndex){
            std::stringstream indexStream;
            indexStream << std::setfill('0') << std::setw(3) << saturationIndex;
            return "hue_" + indexStream.str() + "_saturation.png";
        },
        colour_picker::SaveImageQt<QImage::Format>,
        QImage::Format_RGB888
    );

    return 0;
}