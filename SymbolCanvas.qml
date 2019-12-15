import QtQuick 2.12
import QtQuick.Window 2.12

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
