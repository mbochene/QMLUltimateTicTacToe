import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    id: mainBoard
    width: parent.width * 0.75
    height: parent.height-40
    color: "gray"

    anchors {
        top: parent.top
        left: parent.left
    }

    property var highlightedBoards: []

    signal reportMove(int board, int field)

    function markMove(board, field, symbol)
    {
        localBoardsRepeater.itemAt(board).markMove(field, symbol)
    }

    function swapBoardToSymbol(board, symbol)
    {
        localBoardsRepeater.itemAt(board).symbol = symbol
    }

    function prepareNewRound()
    {
        highlightedBoards = []
        whoseTurnLabel.symbol = "X"

        for(var i=0; i<9; ++i)
            localBoardsRepeater.itemAt(i).symbol = ""

        gameEngine.prepareNewGame()
    }

    Component.onCompleted:
    {
        mainBoard.reportMove.connect(gameEngine.processMove)
    }

    Rectangle {
        id: boardsFrame
        anchors.centerIn: parent
        width: parent.width < parent.height ? parent.width-20 : parent.height-20
        height: width
        color: "transparent"

        Grid {
            id: localBoards
            width: boardsFrame.width
            height: width
            columns: 3
            spacing: 0.01 * height
            property int cos: 11

            Repeater {
                id: localBoardsRepeater
                model: 9

                LocalBoard {
                    height: width
                }
            }
        }
    }
}
