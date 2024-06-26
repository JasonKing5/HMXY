//基础知识
// 基本类型 ：`string`、`number`、`boolean`、`enum`
/*

let name: string = '帝心';
let age: number = 32;
let isMale: boolean = true;
console.log(name);  //输出: 帝心
console.log(age.toString()); // 输出: 32
console.log(` My name is ${name}, and I am ${age} years old`) // 输出： My name is 帝心 , and I am 32 years old
enum Color{
  Red,
  Blue,
  Green
}
let favouriteColor: Color = Color.Red;

*/

//引用类型：Array、自定义class类
/*
let students1: Array<string> = ['帝心', '鸿蒙诗人', '不多先生', '鸿蒙之父']
let students2: string[] = ['帝心', '鸿蒙诗人','不多先生','鸿蒙之父']
class User {
  // ...
};
let user: User = new User();
*/

// 联合类型：Union 允许变量的值为多个类型
/*
let LuckyNum:number|string = 7
LuckyNum = 'seven'
*/

// 类型别名：Aliases 允许给一个类型取一个别名，方便理解和复用
/*
type Matrix = number[][];
type NullableObject = Object | null;
*/

//变量声明时可为空值
/*
let name: string | null = null;
//console. log(name.length.toString()); // Error Message:Cannot read property length of nul
// 空值安全判断
// 1、使用if/else 进行判空
if (name != null) {
  */
/* do something */
/*

}
// 2、使用空值合并表达式，?? 左边的值为null时会返回表达式右边的值
const res = name ?? '';
// 3、 在NEXT之前： 使用 ?. 可选链，如果是 null，运算符会返回 undefined。 在后续的演化中，null不能调用属性。?.运算符也不能
// let len = name?.length
*/

// 类型安全与类型推断
/*

// ArkTS是类型安全的语言，编辑器会进行类型检查，实时提示错误信息
let name : string = '帝心'
//name = 20 //Type 'number' is not assignable to type 'string'. <ArkTSCheck>
// ArkTS支持自动类型推导，没有指定类型时，ArkTS支持使用类型推断自动选择合适的类型
let meaning0fLife = 42; // meaningofLife 会被推测为 number类型
*/

// 条件语句用于基于不同的条件来执行不同的动作，根据判断条件的执行结果（true或false）来决定执行的代码块。
/*
let isValid1: Boolean = false;
if (Math.random() > 0.5) { //生成 0-1  随机数
  isValid1 = true
} else {
  isValid1 = false;
}
// 条件表达式  三目运算
let isValid2 = Math.random() > 0.5 ? true : false;
*/

// 循环语句用于重复执行相同的一组语句，提高效率、简化代码

/*
let students: Array<string> = ['帝心', '鸿蒙诗人', '不多先生', '鸿蒙之父']
// for 循环语句
for (let i = 0; i < students.length; i++) {
  console.log(students[i])
}
// while 虚幻语句
let index = 0
while (index < students.length) {
  console.log(students[index])
  index++
}
// for...of 循环语句
for(let student of students){
  console.log(student)
}
*/

//函数是一组一起执行多条语句的组合，形成可重用的代码块。通过function关键字声明要告诉编译器函数的名称、返回类型和参数以及执行的内容；
/*

function printStudentsInfo(students: string[]): void {
  for (let student of students) {
    console.log(student);
  }
}
printStudentsInfo(['帝心', '鸿蒙诗人', '不多先生', '鸿蒙之父'])
printStudentsInfo(['帝心', '鸿蒙诗人', '不多先生'])

*/

/*
// 箭头函数 / lambda表达式简化函数声明，通常用于需要一个简单函数的地方参数列表返回类型函数体
// 箭头函数的返回类型可以省略，省略时，返回类型通过函数体推断
(name: string): void => { console.log(name) };

// 函数体只有一行的情况下可以省略花括号
const printInfo = (name: string) => console.log(name);
printInfo('帝心');
// 箭头函数常用于作为回调函数
let students: string[] = ['帝心', '鸿蒙诗人', '不多先生', '鸿蒙之父']
students.forEach((student: string) => console.log(student));

*/
/*
// 函数类型将一个函数声明定义为一个类型，函数参数或者返回值
type returnType = () => string;

// 声明一个函数类型
function outerFunc(): returnType { //使用该类型作为返回类型
  let count = 0
  return (): string => {
    count++;
    return count.toString()
  }
}

let invoker = outerFunc()
console.log(invoker()) // 输出:1
console.log(invoker()) // 输出:2

*/


/*
// 闭包函数 一个函数可以将另一个函数当做返回值，保留对内部作用域的访问。
function outerFunc(): () => string {
  let count = 0
  return (): string => {
    count++;
    return count.toString() //返回一个函数
  }
}

let invoker = outerFunc()
console.log(invoker()) // 输出:1
console.log(invoker()) // 输出:2

*/

/*

// 类的声明
// ArkTS支持基于类的面向对象的编程方式，定义类的关键字为class，后面紧跟类名。类的声明描述了所创建的对象共同的属性和方法。
class Person {
  name: string = '帝心';
  age: number = 20;
  isMale: boolean = true;
}
// 类的创建
const person1 = new Person();    // new实例创建
console.log(person1.name) // 输出: 帝心
const person2: Person = { name: '帝心', age: 29, isMale: true} // 字面量创建
console.log(person2.name); // 输出: 帝心
*/

/*

// 构造器
// constructor用于实例化时进行初始化操作
class Person {
  name = 'Xiaoming'
  age: number = 20
  isMale: boolean = true

  constructor(name: string, age: number, isMale: boolean) {
    this.name = name;
    this.age = age;
    this.isMale = isMale;
  }
}

const person = new Person('帝心', 32, false);      //通过传入参数实例化
console.log(person.name) // 输出：帝心

*/

class Person {
  name: string = '帝心';
  age: number = 20;
  isMale: boolean = true;

  constructor(name: string, age: number, isMale: boolean) {
    this.name = name;
    this.age = age;
    this.isMale = isMale;
  }

  printInfo() {
    if (this.isMale) {
      console.log(`${this.name}is a boy, and he is ${this.age}years old`);
    } else {
      console.log(`${this.name}is a girl, and she is ${this.age}years old`);
    }
  }
}

// const person: Person = new Person('帝心', 28, true);
// person.printInfo() // 帝心 is a boy, and he is 28 years old

/*

class Person {
  // 可见性修饰符包括：private、protected和public默认可见性为public
  public name: string = '帝心';
  private _age: number = 20;
  isMale: boolean = true;

  constructor(name: string, age: number, isMale: boolean) {
    this.name = name;
    this.age = age;
    this.isMale = isMale;
  }

  // 私有变量通过getter和setter进行访问控制
  get age(): number {
    return this._age
  }

  set age(age: number) {
    this._age = age
  }
}

const person: Person = new Person('帝心', 28, true);
// console.log(person._age.toString()) // 无法直接访问私有属性
console.log(person.age.toString()) // 无法直接访问私有属性
*/


// #### 继承

// 子类继承父类的特征和行为，使得子类具有父类相同的行为。ArkTS中允许使用继承来扩展现有的类，对应的关键字为extends。

class Employee extends Person {
  // 在演化版本中要求属性给初始化值。否则用 ? 表示可空
  department: string = '教学部'

  constructor(name:string,age:number,isMale:boolean,department:string) {
    super(name,age,isMale)
    this.department = department
  }

  // 重写父类方法
  public printInfo(): void {
    super.printInfo()
    console.log(`working in ${this.department}`)
  }
}

const person: Person = new Person('帝心', 28, true)
// 父类行为
person.printInfo(); // 输出: 帝心 is a boy, and he is 28 years old

const employee:Employee = new Employee('帝心',32,true,'鸿蒙教研组')
//子类行为
employee.printInfo() // 输出： 帝心 is a boy, and he is 32 years old working in 鸿蒙教研组