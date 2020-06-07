/*
 宝石总是出现在外部长方形的四边上，
 所以将问题分解为让角色行走在长方形的长和宽上两部分，会简化问题。
 */
let e = Expert()
let c = Character()
//记录已收集的宝石数量
var collectedGems = 0
//角色在长边的步数
var lengthSteps = 1
//角色在宽边的步数
var widthSteps = 0
//收集宝石并记录收集的个数
func collectAndCount() {
    if c.isOnGem {
        c.collectGem()
        collectedGems += 1
    }
}
world.place(e, facing: north, atColumn: 0, row: 4)
world.place(c, facing: south, atColumn: 4, row: 6)
e.turnLock(up: true, numberOfTimes: 2)
//直到收集完所有宝石才结束
while collectedGems < totalGems {
    // 角色在长边上
    if lengthSteps != 7 {
        lengthSteps = lengthSteps + 1
    } else if lengthSteps == 7 {
        //角色在宽边上时
        //记录角色在宽边上的每一步
        widthSteps = widthSteps + 1
        //角色位于长边转向宽边的顶点，需要转弯
        if widthSteps == 1 {
            c.turnRight()
        }else if widthSteps == 3 {
            //角色位于宽边转向长边的顶点，需要转弯并重新记录长边和宽边的步数
            c.turnRight()
            lengthSteps = 2
            widthSteps = 0
        }
    }
    collectAndCount()
    c.jump()
}
