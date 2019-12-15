import QtQuick 2.12
import QtQuick.Window 2.12
import mytype.Game 1.0

Window {
    visible: true
    width: 750
    height: 600
    title: qsTr("Ultimate Tic Tac Toe")
    minimumWidth: 750
    minimumHeight: 600

    MainBoard {
        id: mainBoard
        anchors.leftMargin: 20
        anchors.topMargin: 20
    }

    Game {
        id: gameEngine
        Component.onCompleted: {
            gameEngine.markMove.connect(mainBoard.markMove)
            gameEngine.highlightPermittedBoards.connect(mainBoard.highlightBoards)
            gameEngine.markLocalWin.connect(mainBoard.swapBoardToSymbol)
            gameEngine.globalWin.connect(mainBoard.showEndRound)
        }
    }
}
