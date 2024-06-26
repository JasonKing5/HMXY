import { preferences } from '@kit.ArkData'

export  default class MyPreferenceData{
  name:string
  key:string
  value:preferences.ValueType
  constructor(name: string, key: string, value: preferences.ValueType) {
    this.name = name
    this.key = key
    this.value = value
  }
}