/*
 宝石总是出现在外部长方形的四边上，
 所以将问题分解为让角色行走在长方形的长和宽上两部分，会简化问题。
 */
let e = Expert()
let c = Character()
//记录已收集的宝石数量
var collectedGems = 0
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
    for i in 1 ... 6 {
        collectAndCount()
        c.jump()
    }
    c.turnRight()
    for i in 1 ... 2 {
        collectAndCount()
        c.jump()
    }
    c.turnRight()
}