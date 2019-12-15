import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    readonly property int board: fields.parent.board
    readonly property int field: modelData
    property var symbol: ""
    width: fields.width/3
    height: width
    color: "transparent"
    opacity: 0

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            mainBoard.reportMove(board, field)
        }
    }

    onSymbolChanged: {
        fieldCanvas.requestPaint()
        if(symbol != "")
            symbolPaintAnimation.start()
        else
            opacity = 0
    }

    NumberAnimation on opacity{
        id: symbolPaintAnimation
        from: 0
        to: 1.0
        duration: 600
        easing.type: Easing.InQuad
    }

    SymbolCanvas {
        id: fieldCanvas
    }
}
