import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    id: mainBoard
    width: parent.width * 0.75
    height: parent.height-40

    anchors {
        top: parent.top
        left: parent.left
    }

    color: "gray"

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

            Repeater {
                model: 9

                LocalBoard {
                    height: width
                }
            }
        }
    }
}
