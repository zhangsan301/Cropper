<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/9 0009
  Time: 上午 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Insert into Title</title>
    <link href="css/cropper.css" rel="stylesheet">
    <script src="js/cropper.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
  <body>
     <h1>Cropper Learn</h1>
     <div class="box">
       <img id="image" src="head_0.jpg">
     </div>
     <div class="small" style="overflow:hidden;width:200px;height:200px"></div>
     <button id="reset">重置</button>
     <button id="clear">清除</button>
     <button id="replace">替换</button>
     <button id="enable">解锁</button>
     <button id="disable">锁定</button>
     <button id="destroy">销毁</button>

     <button id="movex">移动x</button>
     <button id="movey">移动y</button>
     <button id="moveTox">移动到x</button>
     <button id="moveToy">移动到y</button>

     <button id="zoomG">放大</button>
     <button id="zoomS">缩小</button>

     <button id="zoomToG">放大到</button>
     <button id="zoomToS">缩小到</button>

     <button id="rotateL">逆时针旋转</button>
     <button id="rotateR">顺时针旋转</button>

     <button id="rotateToL">逆时针旋转到</button>
     <button id="rotateToR">顺时针旋转到</button>

     <button id="scalex">沿x轴翻转</button>
     <button id="scaley">沿y轴翻转</button>
     <button id="scalexy">xy轴同时翻转</button>
     <button id="scaleX" >缩放图片x坐标</button>
     <button id="scaleY">缩放图片y坐标</button>

     <button id="getData">getData</button>
     <hr>
     <div id="message"></div>
     <button id="setData">setData</button>


     <button id="getContainerData">getContainerData</button>
     <%--<button id="setContainerData">setContainerData</button>--%>
     <button id="getImageData">getImageData</button>

     <button id="getCanvasData">getCanvasData</button>
     <button id="setCanvasData">setCanvasData</button>
     <button id="getCropBoxData">getCropBoxData</button>
     <button id="setCropBoxData">setCropBoxData</button>

    <!--重要-->
    <button id="getCroppedCanvas">getCroppedCanvas</button>

     <button id="setAspectRatio">setAspectRatio</button>
     <button id="setDragMode">setDragMode</button>
     
     <button id="getImage">getImage</button>

     <script type="text/javascript">

       const image=document.getElementById("image");
       var cropper = new Cropper(image,{
         //裁剪框的比例
         //NaN任意比例
         aspectRatio: NaN,
         //视图模式
         viewMode:0,
         //开启预览效果
         preview:'.small',
         //拖拽模式
         dragMode:'move',
         //在调整窗口大小，重新渲染cropper
         responsive:true,
         //在调整窗口大小，恢复裁剪区域
         restore:true,
        //检查图片是否为跨域图片
        checkCrossOrigin:true,
        //是否开启遮罩,将未选中的地方暗色处理
        modal:true,
        //是否显示裁剪的虚线
        guides:true,
        //将选中的区域亮色处理
        highlight:true,
        //是否显示网格背景
        background:true ,
        //裁剪框是否在图片的中心
        center:true,
        //当初始化的时候,(是否自动显示裁剪框)
        autoCrop:true,
        //当初始化时，裁剪框的大小与原图的比例
        autoCropArea:0.8,
        //是否允许移动图片
        movable:true,
       //是否允许旋转图片(问题）
       rotatable:true,
       //是否允许旋转图片
       scalable:true,
       //是否允许缩放图片
       zoomable:true,
       //是否可以通过触摸的形式来放大图片（移动）
       zoomOnTouch:true,
       //是否允许用鼠标去放大或缩小图片
       zoomOnWheel:true,
       //设置鼠标控制缩放的比例
       wheelZoomRatio:0.1,
      //是否可以移动裁剪框
      cropBoxMovable:true,
      //是否可以调节裁剪框的大小
      cropBoxResizable:true,
      //设置drogMode是否可以相互切换，（双击鼠标）
      toggleDragModeOnDblclick:false,
      //设置container容器的宽w与高h
       minContainerWidth:0,
       minContainerHeight:300,
     //设置canvas的w与h
      minCanvasWidth:0,
      minCanvasWidth:0,
     //设置裁剪层
      minCropBoxWidth:0,
      minCropBoxHeight:100,

           //当插件准备完成的时候会执行
     ready:function(e)
     {
        alert("ready");
     },
     //当裁剪框开始移动的时候，会执行的函数
     cropstart:function(e){
        // alert("start");
     },
     //裁剪框在移动的时候会执行的函数(每一帧都会调用)
     cropmove:function(e){
        // alert("move");
     },
     //裁剪框移动结束的时候，执行的函数
     cropend:function(e){
        //  alert("end");
     },
     //在裁剪框发生变化的时候，才调用
     crop:function(e) {
        // alert("crop");
     }
       })

     $("#reset").on("click",function(){
       //将图像以及裁剪框重置为初始状态
        cropper.reset();
     })
     $("#clear").on("click",function(){
         //清除裁剪框
         cropper.clear();
     })
     $("#replace").on("click",function(){
         //替换的图片，"",替换的图片，boolean,是否保持原来的比例
         cropper.replace("Lain_1.png",true);
     })
     $("#enable").on("click",function(){
         //解锁,裁剪框
         cropper.enable();
     })
     $("#disable").on("click",function(){
         //锁定，裁剪框
         cropper.disable();
     })
     $("#destroy").on("click",function(){
         //销毁cropper,并在图像中将整个cropper销毁(将插件销毁)
       cropper.destroy();
     })
     $("#movex").on("click",function(){
         //销毁x坐标
         cropper.move(1,0);
     })
     $("#movey").on("click",function(){
         //销毁y坐标
         cropper.move(0,1);
     })
     $("#moveTox").on("click",function(){
        //移动到x
         cropper.moveTo(1,0);
     })
     $("#moveToy").on("click",function(){
         //移动到y
         cropper.moveTo(0,1);
     })
     $("#zoomG").on("click",function(){
         //放大
         cropper.zoom(0.1);
     })
     $("#zoomS").on("click",function(){
         //缩小
         cropper.zoom(-0.1);
     })
     $("#zoomToG").on("click",function(){
         //放大到
         cropper.zoomTo(2);
     })
     $("#zoomToS").on("click",function(){
         //缩小到
         cropper.zoomTo(0.2);
     })
     $("#rotateL").on("click",function(){
         //逆时针旋转
         cropper.rotate(-45);
     })
       $("#rotateR").on("click",function(){
          //顺时针旋转
           cropper.rotate(45);
       })
       $("#rotateToL").on("click",function(){
           //逆时针旋转到
           cropper.rotateTo(-45);
       })
       $("#rotateToR").on("click",function(){
           //顺时针旋转到
           cropper.rotateTo(45);
       })
       $("#scalex").on("click",function(){
           //沿y轴翻转
           cropper.scale(-1,1);
       })
       $("#scaley").on("click",function(){
           //沿x轴翻转
           cropper.scale(1,-1);
       })
       $("#scalexy").on("click",function(){
           //xy同时翻转
           cropper.scale(-1);
       })
       $("#scaleX").on("click",function(){
           //缩放图片x坐标
           cropper.scaleX(0.5);
       })
       $("#scaleY").on("click",function(){
           //缩放图片y坐标
           cropper.scaleY(2);
       })
       $("#getData").on("click",function(){
           //获取数据信息(裁剪)
         console.log(cropper.getData());
         $("#message").append(cropper.getData().toSource());

       })
       $("#setData").on("click",function(){
           //设置裁剪框的数据
           cropper.setData({width:300,height:100});
       })

       $("#getContainerData").on("click",function(){
           //获得container数据
         $("#message").append(cropper.getContainerData().toSource());
       })
       //没有这个set函数
       // $("#setContainerData").on("click",function(){
       //     //设置container数据
       //     cropper.setContainerData({width:500,height:500});
       //     alert("fasdf");
       // })
       $("#getImageData").on("click",function(){
           //获得image的数据
         $("#message").append(cropper.getImageData().toSource());
       })

       $("#getCanvasData").on("click",function(){
           //获得canvas数据
         $("#message").append(cropper.getCanvasData().toSource());
       })

       $("#setCanvasData").on("click",function(){
           cropper.setCanvasData({left:0,top:0,width:200,height:200});
       })
       $("#getCropBoxData").on("click",function(){
           //获得裁剪框详细数据
         $("#message").append(cropper.getCropBoxData().toSource());
       })
       $("#setCropBoxData").on("click",function(){
          //设置裁剪框数据
           cropper.setCropBoxData({left:100,top:100,width:200,height:200});
       })

       $("#getCroppedCanvas").on("click",function(){
           $("#message").append(cropper.getCroppedCanvas());
           console.log(cropper.getCroppedCanvas().toDataURL("image/jpeg"));
       })
       $("#setAspectRatio").on("click",function(){
           //修改裁剪框的长宽比例
         cropper.setAspectRatio(2/1);
       })
       $("#setDragMode").on("click",function(){
          //设置拖拽模式，none,crop,move
          cropper.setDragMode("crop");
       })
       $("#getImage").on("click",function () {
        var base64url = cropper.getCroppedCanvas().toDataURL("image/jpeg");
        $.post(
          //action的路径
          "${pageContext.request.contextPath}/ImageAction_getImage",
          //数据
           {"base64":base64url},
         //回调函数
           function(data){

           },
        //数据个数
            "json"
        )
          // alert(base64url);
       })  


     </script>











  </body>
</html>
