var i = 0;
var go_forward;

bg_gradient_animation();

function bg_gradient_animation() {
if(i <= 0)
  go_forward = true;
if(i >= 100)
  go_forward = false;
  
if(go_forward)
  i+=0.5;
else
  i-=0.3;

  h1.style['background-image']=`linear-gradient(to right,  #2b2b2b ${i-10}%,#fff ${i}%,#2b2b2b ${i+10}%`;

requestAnimationFrame(bg_gradient_animation);
}