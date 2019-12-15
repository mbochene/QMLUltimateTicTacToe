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
        symbolPaintAnimation.start()
    }

    NumberAnimation on opacity{
        id: symbolPaintAnimation
        from: 0
        to: 1.0
        duration: 600
        easing.type: Easing.InQuad
    }

    Canvas {
        id: fieldCanvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.strokeStyle = "black"
            ctx.lineWidth = 3
            ctx.beginPath();
            ctx.moveTo(0,0)

            if(symbol == "X")
            {
                ctx.lineTo(fieldCanvas.width, fieldCanvas.height)
                ctx.moveTo(0, fieldCanvas.height)
                ctx.lineTo(fieldCanvas.width, 0)
            }
            else if(symbol == "O")
            {
                ctx.ellipse(0.07*fieldCanvas.width, 0.07*fieldCanvas.height, 0.86*fieldCanvas.width, 0.86*fieldCanvas.height)
            }

            ctx.stroke()
        }
    }
}
