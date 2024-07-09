#include <array>

#include <QGuiApplication>
#include <QScreen>

namespace colour_picker{
    /// @brief Gets the maximum screen size of all screens.
    /// @param[in] argc The number of command line arguments.
    /// @param[in] argv The command line arguments.
    /// @return The maximum screen size as a 2-element array, where the first
    ///     element is the width and the second element is the height.
    std::array<int, 2> GetMaxScreenSize(int argc, char *argv[]){
        QGuiApplication app(argc, argv);
        const QList<QScreen*> screens = app.screens();
        std::array<int, 2> maxScreenSizes{};
        for (const QScreen* screen : screens)
        {
            const QSize size = screen->size();
            if (size.width() > maxScreenSizes[0])
                maxScreenSizes[0] = size.width();
            if (size.height() > maxScreenSizes[1])
                maxScreenSizes[1] = size.height();
        }
        return maxScreenSizes;
    }
}