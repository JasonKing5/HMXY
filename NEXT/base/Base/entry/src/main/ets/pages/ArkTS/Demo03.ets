// 通过export导出一个文件的变量、函数、类等

export class Person {
  name: string = '帝心';
  age: number = 20;
  isMale: boolean = true;

  //省略构造器内容

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

//Page.ets

/*
import { Person } from'./Person';
const person = new Person('帝心',20,true)
person.printInfo()// 输出: 帝心 is a boy ,and he is 20 years old
*/
