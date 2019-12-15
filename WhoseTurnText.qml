import QtQuick 2.12
import QtQuick.Window 2.12
import mytype.Game 1.0

Rectangle {
    id: whoseTurnText
    height: 0.1 * mainBoard.height
    color: "transparent"
    anchors {
        left: mainBoard.right
        right: parent.right
        top: parent.top
    }

    Text {
        text: "WHOSE TURN"
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        color: "black"
        minimumPointSize: 8
        font.pointSize: 60
    }
}
