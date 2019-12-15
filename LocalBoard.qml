import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    readonly property int board: modelData
    property var symbol: ""
    property bool isHighlighted: mainBoard.highlightedBoards.includes(board)
    width: 49/150 * localBoards.width
    color: isHighlighted ? "red" : "white"
    opacity: 1

    border {
        color: "black"
        width: 3
    }

    function markMove(field, symbol)
    {
        fieldsRepeater.itemAt(field).symbol = symbol;
    }

    Behavior on color {
        ColorAnimation {
            duration: 500
            easing.type: Easing.OutQuad
        }
    }

    onSymbolChanged: {
        if(boardSymbolChangeAnimation.running)
            boardSymbolChangeAnimation.stop()

        boardSymbolChangeAnimation.start()

        for(var i=0; i<9; ++i)
        {
            fieldsRepeater.itemAt(i).symbol = "";
        }
    }

    SequentialAnimation {
        id: boardSymbolChangeAnimation
        NumberAnimation {
            target: localBoardsRepeater.itemAt(board)
            property: "opacity"
            from: 1.0
            to: 0
            duration: 600
        }
        ScriptAction {
            script: {
                boardCanvas.requestPaint()
            }
        }
        NumberAnimation {
            target: localBoardsRepeater.itemAt(board)
            property: "opacity"
            from: 0
            to: 1.0
            duration: 600
        }
    }

    Grid {
        id: fields
        anchors.fill: parent
        columns: 3

        Repeater {
            id: fieldsRepeater
            model: 9

            Field {}
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
            else if(symbol == "X")
            {
                ctx.moveTo(0, 0)
                ctx.lineTo(boardCanvas.width, boardCanvas.height)
                ctx.moveTo(0, boardCanvas.height)
                ctx.lineTo(boardCanvas.width, 0)
            }
            else if(symbol == "O")
            {
                ctx.ellipse(0.07*boardCanvas.width, 0.07*boardCanvas.height, 0.86*boardCanvas.width, 0.86*boardCanvas.height)
            }

            ctx.stroke()
        }
    }
}
