diagnostic(off, derivative_uniformity);
struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
  @builtin(position) sk_FragCoord: vec4<f32>,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
struct _GlobalUniforms {
  colorGreen: vec4<f32>,
  colorRed: vec4<f32>,
};
@binding(0) @group(0) var<uniform> _globalUniforms: _GlobalUniforms;
fn main(_skParam0: vec2<f32>) -> vec4<f32> {
  let coords = _skParam0;
  {
    var f: f32 = f32(_globalUniforms.colorGreen.y);
    var i: i32 = i32(_globalUniforms.colorGreen.y);
    var b: bool = bool(_globalUniforms.colorGreen.y);
    var f1: f32 = f;
    var f2: f32 = f32(i);
    var f3: f32 = f32(b);
    var i1: i32 = i32(f);
    var i2: i32 = i;
    var i3: i32 = i32(b);
    var b1: bool = bool(f);
    var b2: bool = bool(i);
    var b3: bool = b;
    return select(_globalUniforms.colorRed, _globalUniforms.colorGreen, vec4<bool>((((((((((f32(f1) + f32(f2)) + f32(f3)) + f32(i1)) + f32(i2)) + f32(i3)) + f32(b1)) + f32(b2)) + f32(b3)) == 9.0)));
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  _stageOut.sk_FragColor = main(_stageIn.sk_FragCoord.xy);
  return _stageOut;
}
