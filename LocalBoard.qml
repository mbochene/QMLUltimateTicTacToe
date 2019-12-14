import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    readonly property int board: modelData
    property var symbol: ""
    property bool isHighlighted: false
    width: 49/150 * localBoards.width
    color: isHighlighted ? "red" : "white"

    border {
        color: "black"
        width: 3
    }

    Behavior on color {
        ColorAnimation {
            duration: 250
            easing.type: Easing.InOutQuad
        }
    }

    Canvas {
        id: boardCanvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.strokeStyle = "black"
            ctx.lineWidth = 3
            ctx.beginPath();
            /*
            ctx.moveTo(2, 2);
            ctx.lineTo(boardCanvas.width-1, 1)
            ctx.lineTo(boardCanvas.width-1, boardCanvas.height-1)
            ctx.lineTo(1, boardCanvas.height-1)
            ctx.lineTo(2, 2)
*/
            if(symbol == "")
            {
                var i
                for(i=1; i<3; ++i)
                {
                    ctx.moveTo(i*boardCanvas.width/3, 2)
                    ctx.lineTo(i*boardCanvas.width/3, boardCanvas.height)
                    ctx.moveTo(2, i*boardCanvas.height/3)
                    ctx.lineTo(boardCanvas.width, i*boardCanvas.height/3)
                }
            }
            ctx.stroke()
        }
    }
}
