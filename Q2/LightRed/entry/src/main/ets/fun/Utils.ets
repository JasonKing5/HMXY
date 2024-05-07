
// 准备一个功能函数。你给我一个字符串。我给你拆分，截取。返回一个数组。[作者，题目]
export  function  fromToAuthorAndSubject(from:string) :string[]{
  // 00《123》555          ['00','123》']
  // todo： 有时候获取的作者或者题目是空的。那就用 || 短路一下，给个默认值
  let author :string =  from.split('《')[0] || '帝心'   //'00'
  let temp :string = from.split('《')[1]  || '细的雅痞'   //  '123》'
  // 截取目标字符串。多种方式。
  // let subject:string = temp.substring(0,temp.length-1)    //'123'
  let subject:string = temp.substring(0,temp.indexOf('》'))    //'123'

  return [author,subject]
}