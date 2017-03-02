//: Playground - noun: a place where people can play

import UIKit


class Ghost{
    
    var isAlive = true;
    var strength = 9

    func kill() {
        isAlive = false
    }
    
    func isStrong() -> Bool {
        return true
    }
}

var ghost = Ghost()
print(ghost.isAlive)
print(ghost.strength)
ghost.kill()
print(ghost.isAlive)
var strong = ghost.isStrong()
print(strong)
