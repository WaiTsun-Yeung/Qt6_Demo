import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import components.ColourPicker.ColourConverter

Rectangle{
    id: colourPicker
    property color pickedColour: colourConverter.hslToRgb(
        hueSlider.value,
        saturationSlider.value / 255,
        lightnessSlider.value
    )
    property alias hexFieldHovered: hexInput.hovered
    property alias hexFieldFocused: hexInput.focus
    color: "transparent"
    onPickedColourChanged: hexInput.text = pickedColour
    
    ColourConverter{
        id: colourConverter
    }
    Rectangle{
        id: colourBoxes
        width: parent.width
        height: parent.height - sliders.height - anchors.bottomMargin
        anchors.bottomMargin: 5
        color: "transparent"
        Rectangle {
            id: pickedColourBox
            readonly property int defaultArea: 4045
            width: Math.min(Math.max(50, height * 1.618), parent.width / 4)
            height: parent.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: colourPicker.pickedColour
            border.color: "black"
            border.width: Math.max(width * height / defaultArea, 1)
        }
        TextField{
            id: hexInput
            width: pickedColourBox.width
            height: parent.height - pickedColourBox.height
            anchors.right: pickedColourBox.right
            anchors.bottom: pickedColourBox.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            hoverEnabled: true
            validator: RegularExpressionValidator { 
                regularExpression: /^#[0-9a-fA-F]{6}$/ 
            }
            onEditingFinished: {
                const newColour = Qt.color(hexInput.text);
                if (Qt.colorEqual(newColour, pickedColour)) return;
                const [newHue, newSaturation, newLightness] 
                    = colourConverter.colorToHsl(newColour);
                hueSlider.value = newHue;
                saturationSlider.value = newSaturation * saturationSlider.to;
                lightnessSlider.value = newLightness;
            }
        }
        Image{
            id: colourGradient
            readonly property double defaultArea: 23750
            readonly property list<url> sources: [
                "../resources/colour_maps/hue_000_saturation.png",
                "../resources/colour_maps/hue_001_saturation.png",
                "../resources/colour_maps/hue_002_saturation.png",
                "../resources/colour_maps/hue_003_saturation.png",
                "../resources/colour_maps/hue_004_saturation.png",
                "../resources/colour_maps/hue_005_saturation.png",
                "../resources/colour_maps/hue_006_saturation.png",
                "../resources/colour_maps/hue_007_saturation.png",
                "../resources/colour_maps/hue_008_saturation.png",
                "../resources/colour_maps/hue_009_saturation.png",
                "../resources/colour_maps/hue_010_saturation.png",
                "../resources/colour_maps/hue_011_saturation.png",
                "../resources/colour_maps/hue_012_saturation.png",
                "../resources/colour_maps/hue_013_saturation.png",
                "../resources/colour_maps/hue_014_saturation.png",
                "../resources/colour_maps/hue_015_saturation.png",
                "../resources/colour_maps/hue_016_saturation.png",
                "../resources/colour_maps/hue_017_saturation.png",
                "../resources/colour_maps/hue_018_saturation.png",
                "../resources/colour_maps/hue_019_saturation.png",
                "../resources/colour_maps/hue_020_saturation.png",
                "../resources/colour_maps/hue_021_saturation.png",
                "../resources/colour_maps/hue_022_saturation.png",
                "../resources/colour_maps/hue_023_saturation.png",
                "../resources/colour_maps/hue_024_saturation.png",
                "../resources/colour_maps/hue_025_saturation.png",
                "../resources/colour_maps/hue_026_saturation.png",
                "../resources/colour_maps/hue_027_saturation.png",
                "../resources/colour_maps/hue_028_saturation.png",
                "../resources/colour_maps/hue_029_saturation.png",
                "../resources/colour_maps/hue_030_saturation.png",
                "../resources/colour_maps/hue_031_saturation.png",
                "../resources/colour_maps/hue_032_saturation.png",
                "../resources/colour_maps/hue_033_saturation.png",
                "../resources/colour_maps/hue_034_saturation.png",
                "../resources/colour_maps/hue_035_saturation.png",
                "../resources/colour_maps/hue_036_saturation.png",
                "../resources/colour_maps/hue_037_saturation.png",
                "../resources/colour_maps/hue_038_saturation.png",
                "../resources/colour_maps/hue_039_saturation.png",
                "../resources/colour_maps/hue_040_saturation.png",
                "../resources/colour_maps/hue_041_saturation.png",
                "../resources/colour_maps/hue_042_saturation.png",
                "../resources/colour_maps/hue_043_saturation.png",
                "../resources/colour_maps/hue_044_saturation.png",
                "../resources/colour_maps/hue_045_saturation.png",
                "../resources/colour_maps/hue_046_saturation.png",
                "../resources/colour_maps/hue_047_saturation.png",
                "../resources/colour_maps/hue_048_saturation.png",
                "../resources/colour_maps/hue_049_saturation.png",
                "../resources/colour_maps/hue_050_saturation.png",
                "../resources/colour_maps/hue_051_saturation.png",
                "../resources/colour_maps/hue_052_saturation.png",
                "../resources/colour_maps/hue_053_saturation.png",
                "../resources/colour_maps/hue_054_saturation.png",
                "../resources/colour_maps/hue_055_saturation.png",
                "../resources/colour_maps/hue_056_saturation.png",
                "../resources/colour_maps/hue_057_saturation.png",
                "../resources/colour_maps/hue_058_saturation.png",
                "../resources/colour_maps/hue_059_saturation.png",
                "../resources/colour_maps/hue_060_saturation.png",
                "../resources/colour_maps/hue_061_saturation.png",
                "../resources/colour_maps/hue_062_saturation.png",
                "../resources/colour_maps/hue_063_saturation.png",
                "../resources/colour_maps/hue_064_saturation.png",
                "../resources/colour_maps/hue_065_saturation.png",
                "../resources/colour_maps/hue_066_saturation.png",
                "../resources/colour_maps/hue_067_saturation.png",
                "../resources/colour_maps/hue_068_saturation.png",
                "../resources/colour_maps/hue_069_saturation.png",
                "../resources/colour_maps/hue_070_saturation.png",
                "../resources/colour_maps/hue_071_saturation.png",
                "../resources/colour_maps/hue_072_saturation.png",
                "../resources/colour_maps/hue_073_saturation.png",
                "../resources/colour_maps/hue_074_saturation.png",
                "../resources/colour_maps/hue_075_saturation.png",
                "../resources/colour_maps/hue_076_saturation.png",
                "../resources/colour_maps/hue_077_saturation.png",
                "../resources/colour_maps/hue_078_saturation.png",
                "../resources/colour_maps/hue_079_saturation.png",
                "../resources/colour_maps/hue_080_saturation.png",
                "../resources/colour_maps/hue_081_saturation.png",
                "../resources/colour_maps/hue_082_saturation.png",
                "../resources/colour_maps/hue_083_saturation.png",
                "../resources/colour_maps/hue_084_saturation.png",
                "../resources/colour_maps/hue_085_saturation.png",
                "../resources/colour_maps/hue_086_saturation.png",
                "../resources/colour_maps/hue_087_saturation.png",
                "../resources/colour_maps/hue_088_saturation.png",
                "../resources/colour_maps/hue_089_saturation.png",
                "../resources/colour_maps/hue_090_saturation.png",
                "../resources/colour_maps/hue_091_saturation.png",
                "../resources/colour_maps/hue_092_saturation.png",
                "../resources/colour_maps/hue_093_saturation.png",
                "../resources/colour_maps/hue_094_saturation.png",
                "../resources/colour_maps/hue_095_saturation.png",
                "../resources/colour_maps/hue_096_saturation.png",
                "../resources/colour_maps/hue_097_saturation.png",
                "../resources/colour_maps/hue_098_saturation.png",
                "../resources/colour_maps/hue_099_saturation.png",
                "../resources/colour_maps/hue_100_saturation.png",
                "../resources/colour_maps/hue_101_saturation.png",
                "../resources/colour_maps/hue_102_saturation.png",
                "../resources/colour_maps/hue_103_saturation.png",
                "../resources/colour_maps/hue_104_saturation.png",
                "../resources/colour_maps/hue_105_saturation.png",
                "../resources/colour_maps/hue_106_saturation.png",
                "../resources/colour_maps/hue_107_saturation.png",
                "../resources/colour_maps/hue_108_saturation.png",
                "../resources/colour_maps/hue_109_saturation.png",
                "../resources/colour_maps/hue_110_saturation.png",
                "../resources/colour_maps/hue_111_saturation.png",
                "../resources/colour_maps/hue_112_saturation.png",
                "../resources/colour_maps/hue_113_saturation.png",
                "../resources/colour_maps/hue_114_saturation.png",
                "../resources/colour_maps/hue_115_saturation.png",
                "../resources/colour_maps/hue_116_saturation.png",
                "../resources/colour_maps/hue_117_saturation.png",
                "../resources/colour_maps/hue_118_saturation.png",
                "../resources/colour_maps/hue_119_saturation.png",
                "../resources/colour_maps/hue_120_saturation.png",
                "../resources/colour_maps/hue_121_saturation.png",
                "../resources/colour_maps/hue_122_saturation.png",
                "../resources/colour_maps/hue_123_saturation.png",
                "../resources/colour_maps/hue_124_saturation.png",
                "../resources/colour_maps/hue_125_saturation.png",
                "../resources/colour_maps/hue_126_saturation.png",
                "../resources/colour_maps/hue_127_saturation.png",
                "../resources/colour_maps/hue_128_saturation.png",
                "../resources/colour_maps/hue_129_saturation.png",
                "../resources/colour_maps/hue_130_saturation.png",
                "../resources/colour_maps/hue_131_saturation.png",
                "../resources/colour_maps/hue_132_saturation.png",
                "../resources/colour_maps/hue_133_saturation.png",
                "../resources/colour_maps/hue_134_saturation.png",
                "../resources/colour_maps/hue_135_saturation.png",
                "../resources/colour_maps/hue_136_saturation.png",
                "../resources/colour_maps/hue_137_saturation.png",
                "../resources/colour_maps/hue_138_saturation.png",
                "../resources/colour_maps/hue_139_saturation.png",
                "../resources/colour_maps/hue_140_saturation.png",
                "../resources/colour_maps/hue_141_saturation.png",
                "../resources/colour_maps/hue_142_saturation.png",
                "../resources/colour_maps/hue_143_saturation.png",
                "../resources/colour_maps/hue_144_saturation.png",
                "../resources/colour_maps/hue_145_saturation.png",
                "../resources/colour_maps/hue_146_saturation.png",
                "../resources/colour_maps/hue_147_saturation.png",
                "../resources/colour_maps/hue_148_saturation.png",
                "../resources/colour_maps/hue_149_saturation.png",
                "../resources/colour_maps/hue_150_saturation.png",
                "../resources/colour_maps/hue_151_saturation.png",
                "../resources/colour_maps/hue_152_saturation.png",
                "../resources/colour_maps/hue_153_saturation.png",
                "../resources/colour_maps/hue_154_saturation.png",
                "../resources/colour_maps/hue_155_saturation.png",
                "../resources/colour_maps/hue_156_saturation.png",
                "../resources/colour_maps/hue_157_saturation.png",
                "../resources/colour_maps/hue_158_saturation.png",
                "../resources/colour_maps/hue_159_saturation.png",
                "../resources/colour_maps/hue_160_saturation.png",
                "../resources/colour_maps/hue_161_saturation.png",
                "../resources/colour_maps/hue_162_saturation.png",
                "../resources/colour_maps/hue_163_saturation.png",
                "../resources/colour_maps/hue_164_saturation.png",
                "../resources/colour_maps/hue_165_saturation.png",
                "../resources/colour_maps/hue_166_saturation.png",
                "../resources/colour_maps/hue_167_saturation.png",
                "../resources/colour_maps/hue_168_saturation.png",
                "../resources/colour_maps/hue_169_saturation.png",
                "../resources/colour_maps/hue_170_saturation.png",
                "../resources/colour_maps/hue_171_saturation.png",
                "../resources/colour_maps/hue_172_saturation.png",
                "../resources/colour_maps/hue_173_saturation.png",
                "../resources/colour_maps/hue_174_saturation.png",
                "../resources/colour_maps/hue_175_saturation.png",
                "../resources/colour_maps/hue_176_saturation.png",
                "../resources/colour_maps/hue_177_saturation.png",
                "../resources/colour_maps/hue_178_saturation.png",
                "../resources/colour_maps/hue_179_saturation.png",
                "../resources/colour_maps/hue_180_saturation.png",
                "../resources/colour_maps/hue_181_saturation.png",
                "../resources/colour_maps/hue_182_saturation.png",
                "../resources/colour_maps/hue_183_saturation.png",
                "../resources/colour_maps/hue_184_saturation.png",
                "../resources/colour_maps/hue_185_saturation.png",
                "../resources/colour_maps/hue_186_saturation.png",
                "../resources/colour_maps/hue_187_saturation.png",
                "../resources/colour_maps/hue_188_saturation.png",
                "../resources/colour_maps/hue_189_saturation.png",
                "../resources/colour_maps/hue_190_saturation.png",
                "../resources/colour_maps/hue_191_saturation.png",
                "../resources/colour_maps/hue_192_saturation.png",
                "../resources/colour_maps/hue_193_saturation.png",
                "../resources/colour_maps/hue_194_saturation.png",
                "../resources/colour_maps/hue_195_saturation.png",
                "../resources/colour_maps/hue_196_saturation.png",
                "../resources/colour_maps/hue_197_saturation.png",
                "../resources/colour_maps/hue_198_saturation.png",
                "../resources/colour_maps/hue_199_saturation.png",
                "../resources/colour_maps/hue_200_saturation.png",
                "../resources/colour_maps/hue_201_saturation.png",
                "../resources/colour_maps/hue_202_saturation.png",
                "../resources/colour_maps/hue_203_saturation.png",
                "../resources/colour_maps/hue_204_saturation.png",
                "../resources/colour_maps/hue_205_saturation.png",
                "../resources/colour_maps/hue_206_saturation.png",
                "../resources/colour_maps/hue_207_saturation.png",
                "../resources/colour_maps/hue_208_saturation.png",
                "../resources/colour_maps/hue_209_saturation.png",
                "../resources/colour_maps/hue_210_saturation.png",
                "../resources/colour_maps/hue_211_saturation.png",
                "../resources/colour_maps/hue_212_saturation.png",
                "../resources/colour_maps/hue_213_saturation.png",
                "../resources/colour_maps/hue_214_saturation.png",
                "../resources/colour_maps/hue_215_saturation.png",
                "../resources/colour_maps/hue_216_saturation.png",
                "../resources/colour_maps/hue_217_saturation.png",
                "../resources/colour_maps/hue_218_saturation.png",
                "../resources/colour_maps/hue_219_saturation.png",
                "../resources/colour_maps/hue_220_saturation.png",
                "../resources/colour_maps/hue_221_saturation.png",
                "../resources/colour_maps/hue_222_saturation.png",
                "../resources/colour_maps/hue_223_saturation.png",
                "../resources/colour_maps/hue_224_saturation.png",
                "../resources/colour_maps/hue_225_saturation.png",
                "../resources/colour_maps/hue_226_saturation.png",
                "../resources/colour_maps/hue_227_saturation.png",
                "../resources/colour_maps/hue_228_saturation.png",
                "../resources/colour_maps/hue_229_saturation.png",
                "../resources/colour_maps/hue_230_saturation.png",
                "../resources/colour_maps/hue_231_saturation.png",
                "../resources/colour_maps/hue_232_saturation.png",
                "../resources/colour_maps/hue_233_saturation.png",
                "../resources/colour_maps/hue_234_saturation.png",
                "../resources/colour_maps/hue_235_saturation.png",
                "../resources/colour_maps/hue_236_saturation.png",
                "../resources/colour_maps/hue_237_saturation.png",
                "../resources/colour_maps/hue_238_saturation.png",
                "../resources/colour_maps/hue_239_saturation.png",
                "../resources/colour_maps/hue_240_saturation.png",
                "../resources/colour_maps/hue_241_saturation.png",
                "../resources/colour_maps/hue_242_saturation.png",
                "../resources/colour_maps/hue_243_saturation.png",
                "../resources/colour_maps/hue_244_saturation.png",
                "../resources/colour_maps/hue_245_saturation.png",
                "../resources/colour_maps/hue_246_saturation.png",
                "../resources/colour_maps/hue_247_saturation.png",
                "../resources/colour_maps/hue_248_saturation.png",
                "../resources/colour_maps/hue_249_saturation.png",
                "../resources/colour_maps/hue_250_saturation.png",
                "../resources/colour_maps/hue_251_saturation.png",
                "../resources/colour_maps/hue_252_saturation.png",
                "../resources/colour_maps/hue_253_saturation.png",
                "../resources/colour_maps/hue_254_saturation.png",
                "../resources/colour_maps/hue_255_saturation.png"
            ]
            width: parent.width - pickedColourBox.width
            height: parent.height
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            cache: false
            source: sources[Math.round(saturationSlider.value)] 
            MouseArea{
                anchors.fill: parent
                drag.target: parent
                drag.minimumX: 0
                drag.minimumY: 0
                drag.maximumX: parent.width
                drag.maximumY: parent.height
                function selectColour(x, y){
                    hueSlider.value = x / colourGradient.width
                    lightnessSlider.value = 1 - y / colourGradient.height
                }
                onClicked: mouse => selectColour(mouse.x, mouse.y)
                onDoubleClicked: mouse => selectColour(mouse.x, mouse.y)
                onMouseXChanged: {
                    if (pressed) selectColour(mouseX, mouseY);
                }
                onMouseYChanged: {
                    if (pressed) selectColour(mouseX, mouseY);
                }
                onWheel: wheel => {
                    const scrollSpeed = 10;
                    if (wheel.angleDelta.y > 0){
                        saturationSlider.value = Math.min(
                            saturationSlider.to, 
                            saturationSlider.value + scrollSpeed
                        );
                    } else {
                        saturationSlider.value = Math.max(
                            saturationSlider.from, 
                            saturationSlider.value - scrollSpeed
                        );
                    }
                    if (pressed) selectColour(mouseX, mouseY);
                }
            }
        }
        Item{
            id: crosshairs
            width: 9 * Math.sqrt(
                colourGradient.width * colourGradient.height 
                    / colourGradient.defaultArea
            )
            height: width
            x: hueSlider.position * colourGradient.width 
                - width / 2
            y: (1 - lightnessSlider.position) * colourGradient.height 
                - height / 2
            layer.enabled: true
            Image{
                id: crosshairsIcon
                width: parent.width
                height: parent.height
                source: "../resources/crosshairs.png"
            }
        }
    }
    GridLayout{
        id: sliders
        width: parent.width
        anchors.bottom: parent.bottom
        columns: 2
        Text{
            text: "Hue"
            Layout.preferredWidth: 75
        }
        Slider{
            id: hueSlider
            from: 0
            to: 1
            value: 0
            Layout.preferredHeight: 10
            Layout.fillWidth: true
        }
        Text{
            text: "Saturation"
        }
        Slider{
            id: saturationSlider
            from: 0
            to: 255
            value: 255
            Layout.fillWidth: true
        }
        Text{
            text: "Lightness"
        }
        Slider{
            id: lightnessSlider
            from: 0
            to: 1
            value: 0
            Layout.fillWidth: true
        }
    }
}