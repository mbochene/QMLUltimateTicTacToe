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

    SymbolCanvas {
        id: whoseTurnLabelCanvas
    }
}
