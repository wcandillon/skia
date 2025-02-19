diagnostic(off, derivative_uniformity);
struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
  @builtin(position) sk_FragCoord: vec4<f32>,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
struct _GlobalUniforms {
  inputVal: vec4<f32>,
  expected: vec4<f32>,
  colorGreen: vec4<f32>,
  colorRed: vec4<f32>,
};
@binding(0) @group(0) var<uniform> _globalUniforms: _GlobalUniforms;
fn main(_skParam0: vec2<f32>) -> vec4<f32> {
  let coords = _skParam0;
  {
    let _skTemp0 = atanh(_globalUniforms.inputVal.x);
    let _skTemp1 = atanh(_globalUniforms.inputVal.xy);
    let _skTemp2 = atanh(_globalUniforms.inputVal.xyz);
    let _skTemp3 = atanh(_globalUniforms.inputVal);
    return select(_globalUniforms.colorRed, _globalUniforms.colorGreen, vec4<bool>((((((((_skTemp0 == _globalUniforms.expected.x) && all(_skTemp1 == _globalUniforms.expected.xy)) && all(_skTemp2 == _globalUniforms.expected.xyz)) && all(_skTemp3 == _globalUniforms.expected)) && (0.0 == _globalUniforms.expected.x)) && all(vec2<f32>(0.0, 0.25) == _globalUniforms.expected.xy)) && all(vec3<f32>(0.0, 0.25, 0.5) == _globalUniforms.expected.xyz)) && all(vec4<f32>(0.0, 0.25, 0.5, 1.0) == _globalUniforms.expected)));
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  _stageOut.sk_FragColor = main(_stageIn.sk_FragCoord.xy);
  return _stageOut;
}
