# 个人定制的功能类

很多功能很小或没有好用的第三方类库。定制了自己会用到的一些功能类。

----

## 1、宏文件

常用宏。

----

## 2、HorizontalScrollTableView

支持水平（左右）滚动的表格视图。实现简单，性能OK，有小瑕疵。

### 问题

1. 我觉得Cell的内容设置应该在TableView，而不是Cell里。
2. 屏幕外的第一行偶尔位置不对。虽然滚一下就OK，也不是常出现，但依然让人不爽。