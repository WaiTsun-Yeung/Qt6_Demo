#ifndef COLOUR_CONVERTER_HPP
#define COLOUR_CONVERTER_HPP

    #include <QObject>
    #include <QColor>
    #include <QQmlEngine>

    namespace colour_picker{
        class ColourConverter: public QObject{
            Q_OBJECT
            QML_ELEMENT
            public:
                Q_INVOKABLE static QColor hslToRgb(
                    const float hue, const float saturation, 
                    const float lightness
                );
        };
    }

#endif // COLOUR_CONVERTER_HPP