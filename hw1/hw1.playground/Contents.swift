import UIKit

let roundSignsGlob = 2
print(quadraticPrint(a: 1, b:3, c:-4))
print(rightTringlePrint(a: 6, b:8))
print(depositPrint(sum: 1000, percent:10, years:5))

func quadraticPrint(a: Double, b:Double, c:Double) -> String{
    if(a==0){
        return "No result"
    }
    let d: Double = b*b-4*a*c
    if(d<0){
        return "No result"
    }
    else if(d==0){
        return DoubleToString(value: -b/(2*a), roundSignes: roundSignsGlob)
    }
    else {
        let x1 = (-b+sqrt(d))/(2*a)
        let x2 = (-b-sqrt(d))/(2*a)
        return "x1 = " + DoubleToString(value: x1, roundSignes: roundSignsGlob) + " x2 = " + DoubleToString(value: x2, roundSignes: roundSignsGlob)
    }
}

func rightTringlePrint(a: Double, b:Double) -> String{
    if(a<=0 || b<=0){
        return "No result"
    }
    let c: Double = sqrt(a*a+b*b)
    let S: Double = (a*b)/2
    let P: Double = a+b+c
    return "c = " + DoubleToString(value:c, roundSignes:roundSignsGlob) + " | S = " + DoubleToString(value:S, roundSignes:roundSignsGlob) + " | P = " + DoubleToString(value:P, roundSignes:roundSignsGlob)
}

func depositPrint(sum: Double, percent:Double, years:Int) -> String{
    if(sum<=0 || percent<0 || years<=0){
        return "No result"
    }
    else{
        var currSum = sum
        for _ in 1...years{
            currSum += currSum*percent/100
        }
        return "Total sum: " + DoubleToString(value:currSum, roundSignes:roundSignsGlob)
    }
}

func DoubleToString(value:Double, roundSignes:Int)->String{
    return String(format: "%.\(roundSignes)f", value)
}
