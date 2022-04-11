# hello world

## Container

-   配置了 alignment 属性将会填充满父元素大小

## 按钮圆角

两种 按钮圆角的方式

```dart

OutlinedButton(
    child: const Text(
    "继续",
    style: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold),
    ),
    style: OutlinedButton.styleFrom(shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
    ) ),
    onPressed: () {},
)

 MaterialButton(
    color: AppColors.primaryColor,
    textColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
    ),
    child: const Text(
        "开始锻炼",
        style:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    onPressed: () {},
)
```


## 键盘弹起导致 overflow 

把Scaffold的resizeToAvoidBottomInset属性设置为false，这样在键盘弹出时将不会resize(输入框抵住键盘)