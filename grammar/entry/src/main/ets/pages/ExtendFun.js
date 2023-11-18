"use strict";
struct ExtendFun extends   {
    constructor() { }
    build() {
            .height('100%');
    }
}
function sizeColor(fs, fc) {
    
  
        .fontSize(fs)
        .fontColor(fc);
}
function textStyle(fs, fc) {
    
  
        .sizeColor(fs, fc)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold);
}
function btnStyle(click) {
    
  
        .fontSize(40)
        .width(150)
        .height(50)
        .onClick(() => {
        click();
    });
}
//# sourceMappingURL=ExtendFun.js.map