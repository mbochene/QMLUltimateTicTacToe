import QtQuick 2.12
import QtQuick.Window 2.12
import mytype.Game 1.0

Rectangle {
    id: whoseTurnLabel
    property var symbol: "X"
    height: width
    color: "transparent"
    anchors {
        left: mainBoard.right
        right: parent.right
        top: whoseTurnText.bottom
    }

    onSymbolChanged:
    {
        if(labelSymbolChangeAnimation.running)
            labelSymbolChangeAnimation.stop()

        labelSymbolChangeAnimation.start()
    }

    SequentialAnimation {
        id: labelSymbolChangeAnimation
        NumberAnimation {
            target: whoseTurnLabel
            property: "opacity"
            from: 1.0
            to: 0
            duration: 300
        }
        ScriptAction {
            script: {
                whoseTurnLabelCanvas.requestPaint()
            }
        }
        NumberAnimation {
            target: whoseTurnLabel
            property: "opacity"
            from: 0
            to: 1.0
            duration: 300
        }
    }

    SymbolCanvas {
        id: whoseTurnLabelCanvas
    }
}
