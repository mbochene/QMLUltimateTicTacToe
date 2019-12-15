import QtQuick 2.12
import QtQuick.Window 2.12
import mytype.Game 1.0

Rectangle {
    id: resetButton
    height: 0.1 * mainBoard.height
    color: "#CCCCCC"
    anchors {
        left: mainBoard.right
        right: parent.right
        bottom: parent.bottom
    }

    Text {
        text: "RESET"
        width: 0.5 * parent.width
        height: 0.5 * parent.height
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        color: "black"
        minimumPointSize: 8
        font.pointSize: 60
    }

    MouseArea {
        id: resetMouseArea
        anchors.fill: parent

        Component.onCompleted:
        {
            resetMouseArea.clicked.connect(mainBoard.prepareNewRound)
        }
    }
}
