# StarView
手指按下并拖动即可画出一个五角星，抬起手指即可结束绘制并在下一次按下时开始绘制新的五角星。

绘制方法
---
根据五角星绘制顺序将五个定点分为point1, point2, point3, point4, point5  
通过传入的point1及point2计算出五个顶点所在圆的中心，并根据中心点、半径、夹角计算出point4  
point3关于point1到中线点所在直线与point4对称，point5则与point2对称  
通过以上方法结合勾股定理可计算出point3, point4, point5的坐标  

效果(Demo)
---
![Logo](https://raw.githubusercontent.com/FlyKite/StarView/master/demo.gif)
