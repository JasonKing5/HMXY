# harmonyOS NEXT 学习 基础入门
## RelativeContainer
* 相对布局：减少嵌套，提高渲染性能。
* 锚点：每一个元素均可设置锚点（`id`）。其他元素可根据锚点元素做相对位置布局。产生依赖关系。 

![0000000000011111111.20240527155528.69084242570150504785362177542637:50001231000000:2800:80E4EF9CBF00E2706099ECD39327F360AC7788EC7891070D26D8C76D8861906F.png](screenshots/relativeContainer.png)

* 对齐方式：通过对齐方式，设置当前元素是基于锚点的上中下对齐，还是基于锚点的左中右对齐。
* `VerticalAlign` : 垂直方向
* `HorizontalAlign` : 水平方向
* `__container__`：默认RelativeContainer容器的锚点

### 细节
* 父组件必须是RelativeContainer容器
* RelativeContainer的默认id为`__container__`


* 相对于兄弟元素：不可以既上又下，既左又右。我不知道该怎么摆放自己。
* 相对于父元素：可以既上又下，可以既左又右。会拉拽或者压缩自己的尺寸。
> 但是要符合逻辑，不能逆逻辑。比如已经设置自己的顶部位置了，后来你又设置自己的底部位置却跑到了自己顶部之上。那不扯犊子了吗。

* 同一个相对规则中。可以参考于不同的锚点。
    ```typescript
    .alignRules({
        top:{anchor:'item1',align:VerticalAlign.Bottom},
        // left:{anchor:'item1',align:HorizontalAlign.Start},
        right:{anchor:'__container__',align:HorizontalAlign.End},
    })
    ```
* 若子组件某个方向上设置两个或以上alignRules时，会对给出的元素尺寸产生冲突。拉伸或者压缩。
