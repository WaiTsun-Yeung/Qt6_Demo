#include <array>
#include <cstdint>
#include <filesystem>

#include <QImage>

namespace colour_picker{
    std::array<int, 2> GetMaxScreenSize(int argc, char *argv[]);

    #ifndef QT_UTILITIES_HPP
    #define QT_UTILITIES_HPP
        /// @brief Saves an image buffer to a file using Qt.
        /// @tparam ImageFormatType The type of the format specifier 
        ///     of the image. This is dependent on the library used 
        ///     to save the image. In this case, it is Qt.
        /// @param[in] imageBuffer The buffer containing the image data.
        /// @param[in] width The frame width of the image.
        /// @param[in] height The frame height of the image.
        /// @param[in] bytesPerPixel The number of bytes per pixel.
        /// @param[in] outputFilePath The path to save the image to.
        /// @param[in] imageFormat The format specifier of the image.
        template<typename ImageFormatType>
        void SaveImageQt(
            const uint8_t* imageBuffer,
            const int width, const int height, const int bytesPerPixel,
            const std::filesystem::path& outputFilePath,
            const ImageFormatType imageFormat = NULL
        ){
            const QImage image(
                imageBuffer, 
                width, 
                height, 
                bytesPerPixel * width,
                imageFormat
            );
            image.save(QString::fromStdString(outputFilePath.string()));
        }
    #endif // QT_UTILITIES_HPP
}