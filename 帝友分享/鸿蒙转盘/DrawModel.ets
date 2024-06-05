

export default class DrawModel {
  private startAngle: number = 0;
  private avgAngle: number = 360 / 6;
  private screenWidth: number = 0;
  private canvasContext?: CanvasRenderingContext2D;


  draw(canvasContext: CanvasRenderingContext2D, screenWidth: number, screenHeight: number) {
    // if (CheckEmptyUtils.isEmptyObj(canvasContext)) {
    //   // Logger.error('[DrawModel][draw] canvasContext is empty.');
    //   return;
    // }
    this.canvasContext = canvasContext;
    this.screenWidth = screenWidth;
    this.canvasContext.clearRect(0, 0, this.screenWidth, screenHeight);
    // Translates the canvas along the X and Y axes by a specified distance.
    this.canvasContext.translate(this.screenWidth / 2,
      screenHeight / 2);

    this.drawOutCircle();

    this.drawInnerArc();
    this.drawArcText();

    this.canvasContext.translate(-this.screenWidth / 2,
      -screenHeight / 2);
  }

  /**
   * Method of drawing arcs.
   *
   * @param fillArcData fillArcData.
   * @param fillColor fillColor.
   */
  fillArc(fillArcData: FillArcData, fillColor: string) {
    if (this.canvasContext !== undefined) {
      this.canvasContext.beginPath();
      this.canvasContext.fillStyle = fillColor;
      this.canvasContext.arc(fillArcData.x, fillArcData.y, fillArcData.radius,
        fillArcData.startAngle, fillArcData.endAngle);
      this.canvasContext.fill();
    }
  }



  /**
   * Draw outer disc, small circle.
   */
  drawOutCircle() {
    // Draw outer disc.
    this.fillArc(new FillArcData(0, 0, this.screenWidth * 0.4, 0,
      Math.PI * 2),  'rgb(102,177,255)');

    let beginAngle = this.startAngle;
    // Draw small circle.
    for (let i = 0; i < 8; i++) {
      this.canvasContext?.save();
      this.canvasContext?.rotate(beginAngle * Math.PI / 180);

      if (this.canvasContext !== undefined) {
        this.canvasContext.beginPath();
        this.canvasContext.fillStyle = '#FFFFFF';
        this.canvasContext.arc(this.screenWidth * 0.378, 0, 4.1,
          0, 360);
        this.canvasContext.fill();
      }

      beginAngle = beginAngle + 360 / 8;
      this.canvasContext?.restore();
    }
  }



  drawInnerArc() {
    let colors = [
      'rgb(61,127,255)','rgb(121,189,255)'
    ];
    let radius = this.screenWidth * 0.336;
    for (let i = 0; i < 6; i++) {
      if (this.canvasContext !== undefined) {
        this.canvasContext.beginPath();
        this.canvasContext.fillStyle = colors[i%2];
        this.canvasContext.arc(0, 0, radius,
          this.startAngle * Math.PI / 180,  (this.startAngle + this.avgAngle) * Math.PI / 180);
        this.canvasContext.fill();
      }
      this.canvasContext?.lineTo(0, 0);
      this.canvasContext?.fill();
      this.startAngle += this.avgAngle;
    }
  }


  drawArcText() {
    if (this.canvasContext !== undefined) {
      this.canvasContext.textAlign = 'center';
      this.canvasContext.textBaseline = 'middle';
      this.canvasContext.fillStyle = '#FFFFFF';
      this.canvasContext.font = fp2px(14) + 'px sans-serif';
    }

    let textArrays = [
      "玉米","番茄","西瓜","苹果","樱桃","菠萝"
    ];

    let arcTextStartAngle = 34;
    let arcTextEndAngle = 26;
    for (let i = 0; i < 6; i++) {

      let startAngle = (this.startAngle + arcTextStartAngle) * Math.PI / 180
      let endAngle = (this.startAngle + arcTextEndAngle) * Math.PI / 180

      class CircleText {
        x: number = 0;
        y: number = 0;
        radius: number = 0;
      }
      let circleText: CircleText = {
        x: 0,
        y: 0,
        radius: this.screenWidth * 0.336
      };
      // The radius of the circle.
      let radius = circleText.radius - circleText.radius / 6;
      // The radians occupied by each letter.
      let angleDecrement = (startAngle - endAngle) / (textArrays[i].length - 1);
      let angle = startAngle;
      let index = 0;
      let character: string;

      while (index < textArrays[i].length) {
        character = textArrays[i].charAt(index);
        this.canvasContext?.save();
        this.canvasContext?.beginPath();
        this.canvasContext?.translate(circleText.x + Math.cos(angle) * radius,
          circleText.y - Math.sin(angle) * radius);
        this.canvasContext?.rotate(Math.PI / 2 - angle);
        this.canvasContext?.fillText(character, 0, 0);
        angle -= angleDecrement;
        index++;
        this.canvasContext?.restore();
      }

      this.startAngle += this.avgAngle;
    }
  }

  /**
   * Obtains the character string corresponding to the specified resource ID.
   *
   * @param resource resource.
   */
  getResourceString(resource: Resource): string {
    // if (CheckEmptyUtils.isEmptyObj(resource)) {
    //   // Logger.error('[DrawModel][getResourceString] resource is empty.')
    //   return '';
    // }
    let resourceString: string = '';
    try {
      resourceString = getContext(this).resourceManager.getStringSync(resource.id);
    } catch (error) {
      // Logger.error(`[DrawModel][getResourceString]getStringSync failed, error : ${JSON.stringify(error)}.`);
    }
    return resourceString;
  }

  /**
   * Draw Arc Text.
   *
   * @param textString textString.
   * @param startAngle startAngle.
   * @param endAngle endAngle.
   */
  drawCircularText(textString: string, startAngle: number, endAngle: number) {

    class CircleText {
      x: number = 0;
      y: number = 0;
      radius: number = 0;
    }
    let circleText: CircleText = {
      x: 0,
      y: 0,
      radius: this.screenWidth * 0.336
    };
    // The radius of the circle.
    let radius = circleText.radius - circleText.radius / 6;
    // The radians occupied by each letter.
    let angleDecrement = (startAngle - endAngle) / (textString.length - 1);
    let angle = startAngle;
    let index = 0;
    let character: string;

    while (index < textString.length) {
      character = textString.charAt(index);
      this.canvasContext?.save();
      this.canvasContext?.beginPath();
      this.canvasContext?.translate(circleText.x + Math.cos(angle) * radius,
        circleText.y - Math.sin(angle) * radius);
      this.canvasContext?.rotate(Math.PI / 2 - angle);
      this.canvasContext?.fillText(character, 0, 0);
      angle -= angleDecrement;
      index++;
      this.canvasContext?.restore();
    }
  }


  showPrizeData(randomAngle: number): string {
    for (let i = 1; i <= 6; i++) {
      if (randomAngle <= i * this.avgAngle) {
        // return this.getPrizeData(i);
        return i.toString()
      }
    }
    return '';
    // return new PrizeData();
  }

}

export  class FillArcData {
  /**
   * The x-axis coordinate of the center of the arc.
   */
  x: number;

  /**
   * The y-axis coordinate of the center of the arc.
   */
  y: number;

  /**
   * Radius of the arc.
   */
  radius: number;

  /**
   * The start point of the arc, in radians.
   */
  startAngle: number;

  /**
   * The end point of the arc, in radians.
   */
  endAngle: number;


  constructor(x: number, y: number, radius: number, startAngle: number, endAngle: number) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.startAngle = startAngle;
    this.endAngle = endAngle;
  }
}