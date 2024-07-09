#include <vector>
#include <cstdint>
#include <filesystem>
#include <functional>
#include <execution>
#include <string>
#include <array>
#include <algorithm>

#include "algorithms.hpp"

namespace colour_picker{
    void GenerateHueLightnessMapRGBBuffer(
        std::vector<uint8_t>& hueLightnessMap,
        const int width, const int height,
        const int saturationIndex,
        const int saturationCount
    );

    #ifndef COLOUR_MAPS_HPP
    #define COLOUR_MAPS_HPP
        /// @brief Creates hue lightness maps for a range of saturation values.
        /// @tparam saturationCount The number of saturation values to create.
        ///     The colour maps generated will have linearly-spaced saturation 
        ///     values from 0 to max saturation.
        /// @tparam ImageFormatType The type of the format specifier 
        ///     of the image. This is dependent on the library 
        ///     used to save the image. E.g., Qt.
        /// @param[in] width The frame width of the colour maps.
        /// @param[in] height The frame height of the colour maps.
        /// @param[in] outputDirectory The directory to save the colour maps to.
        /// @param[in] outputFileNameGenerator A function that generates 
        ///     the file name for the colour map given the saturation index.
        /// @param[in] SaveImage A function that saves the image buffer 
        ///     to a file.
        /// @param[in] imageFormat The format specifier of the image.
        template<size_t saturationCount, typename ImageFormatType>
        void CreateHueLightnessMaps(
            const int width, const int height,
            const std::filesystem::path& outputDirectory,
            const std::function<std::string(const int)>& 
                outputFileNameGenerator,
            const std::function<
                void(
                    const uint8_t*, const int, const int, const int,
                    const std::filesystem::path&, const ImageFormatType
                )
            >& saveImage,
            const ImageFormatType imageFormat = NULL
        ){
            constexpr int rgbChannels = 3;
            const std::array<int, saturationCount> indexArray
                = CreateIndexArray<int, saturationCount>();
            std::array<uint8_t, saturationCount> dummyOutput;
            std::array<std::vector<uint8_t>, saturationCount> hueLightnessMaps;
            std::transform(
                std::execution::par_unseq,
                hueLightnessMaps.begin(),
                hueLightnessMaps.end(),
                indexArray.begin(),
                dummyOutput.begin(),
                [
                    width, 
                    height, 
                    rgbChannels,
                    &outputDirectory, 
                    &outputFileNameGenerator,
                    &saveImage,
                    &imageFormat
                ](
                    std::vector<uint8_t>& hueLightnessMap,
                    const int saturationIndex
                ){
                    GenerateHueLightnessMapRGBBuffer(
                        hueLightnessMap,
                        width, 
                        height, 
                        saturationIndex,
                        saturationCount
                    );
                    saveImage(
                        hueLightnessMap.data(),
                        width, 
                        height, 
                        rgbChannels,
                        outputDirectory 
                            / outputFileNameGenerator(saturationIndex),
                        imageFormat
                    );
                    return 0;
                }
            );
        }
    #endif // COLOUR_MAPS_HPP
}