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
    }
}
