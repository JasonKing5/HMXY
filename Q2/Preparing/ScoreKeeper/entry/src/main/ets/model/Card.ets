export default class Card{
  color: string
  score: number
  winGame: number
  history: number[]

  constructor(color:string,score:number,winGame: number, history: number[]) {
    this.color = color
    this.score = score
    this.winGame = winGame
    this.history = history
  }
}