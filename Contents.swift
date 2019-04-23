import UIKit

//Bai 1
func DrawTG(n: Int) {
    for i in 1...n {
        var str = ""
        for j in i..<n {
            str += "  "
        }
        for k in 1...(i * 2 - 1) {
            str += "* "
        }
        print(str)
    }
}

// Bai 2
func FindValueAtN(n: Int)->Int {
    if n == 0 {
        return 0
    }
    else if (n == 1 || n == 2) {
        return 1
    }
    else {
        return (FindValueAtN(n: ( n - 1)) + FindValueAtN(n: (n - 2)))
    }
}

var n = 11
print("Gia tri tai vi tri \(n) la:  \(FindValueAtN(n: n))")

//Bai 3
func ConvertToLaMa(n: Int)->String {
    if (n >= 1000 || n <= 0) {
        print("Hay nhap so nho hon 1000")
    }
    
    var str = ""
    
    // Lay hang tram
    switch (n / 100) {
    case 1:
        str += "C"
        break
    case 2:
        str += "CC"
        break
    case 3:
        str += "CCC"
        break
    case 4:
        str += "CD"
        break
    case 5:
        str += "D"
        break
    case 6:
        str += "DC"
        break
    case 7:
        str += "DCC"
        break
    case 8:
        str += "DCCC"
        break
    case 9:
        str += "CM"
        break
    default:
        str += ""
    }
    
    //Lay hang Chuc
    switch ((n % 100) / 10) {
    case 1:
        str += "X"
        break
    case 2:
        str += "XX"
        break
    case 3:
        str += "XXX"
        break
    case 4:
        str += "XL"
        break
    case 5:
        str += "L"
        break
    case 6:
        str += "LX"
        break
    case 7:
        str += "LXX"
        break
    case 8:
        str += "LXXX"
        break
    case 9:
        str += "XC"
        break
    default:
        str += ""
    }
    
    // Lay hang don vi
    switch (n % 10) {
    case 1:
        str += "I"
        break
    case 2:
        str += "II"
        break
    case 3:
        str += "III"
        break
    case 4:
        str += "IV"
        break
    case 5:
        str += "V"
        break
    case 6:
        str += "VI"
        break
    case 7:
        str += "VII"
        break
    case 8:
        str += "VIII"
        break
    case 9:
        str += "IX"
        break
    default:
        str += ""
    }
    
    return str
}

//Bai 5
let Num = ["khong", "mot", "hai", "ba", "bon", "nam", "sau", "bay", "tam", "chin"]
let tram = "tram"
let nghin = "nghin"
let van = "van"

func ReadUnder100(n: Int)-> String {
    var str = ""
    if n < 10 {
        return Num[n]
    }
    str = n / 10 == 1 ? "Muoif" : Num[n / 10] + " Muoi"
    
    if n == 10 {
        return "Muoif"
    }
    str += " "
    if (n / 10 != 0) && (n % 10 == 1) {
        str += "mot'"
    }
    else if (n / 10 == 4) && (n % 10 == 4) {
        str += "bon"
    }
    else if (n / 10 != 0) && (n % 10 == 4) {
        str += "tu"
    }
    else if (n / 10 == 5) {
        str += "lam"
    }
    else if (n % 10 != 0) {
        str += Num[n % 10]
    }
    return str
}

func ReadHundred(n: Int)-> String{
    var str = ""
    if n < 100 {
        return ReadUnder100(n: n)
    }
    if n < 1000 {
        str += Num[n/100] + " " + tram
        if n % 100 == 0{
            return str
        }
        if n % 100 < 10 && n % 10 != 0 {
            str += " " + "linh" + " " + Num[n % 10]
        }
        else {
            str += " " + ReadUnder100(n: n % 100)
        }
    }
    return str
}

func ReadThousand(n: Int)-> String {
    var str = ""
    if n < 1000 {
        return ReadHundred(n: n)
    }
    if n < 10000 {
        if n % 1000 == 0 {
            return Num[n/1000] + " " + nghin
        }
        else {
            str += Num[n/1000] + " " + nghin + " " + ReadHundred(n: n % 1000)
        }
    }
    return str
}


func ReadNumber(n: Int)-> String {
    var str = ""
    if n >= 1000000 {
        return "Qua gioi han cho phep"
    }
    if n < 10000 {
        return ReadUnder100(n: n)
    }
    if n % 10000 == 0 {
        return ReadUnder100(n: (n / 10000)) + " " + van
    }
    else {
        str += ReadUnder100(n: (n / 10000)) + " " + van + " " + ReadThousand(n: (n % 10000))
        
    }
    return str
}

// Bai 6
func IsNiceNumber(n: Int)->Bool {
    var sum = 0
    for i in 1...(n / 2 + 1) {
        if n % i == 0 {
            sum += i
        }
    }
    if sum == n {
        return true
    }
    return false
}

func ListNumberNice(n: Int)-> String {
    var str = ""
    if n == 0 || n == 1 {
        return ""
    }
    for i in 2...n {
        if IsNiceNumber(n: i) {
            str += "\(i) "
        }
    }
    return str
}
