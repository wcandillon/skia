### Compilation failed:

error: :7:17 error: unresolved type 'sampler2D'
var<private> t: sampler2D;
                ^^^^^^^^^


struct FSIn {
  @builtin(front_facing) sk_Clockwise: bool,
};
struct FSOut {
  @location(0) sk_FragColor: vec4<f32>,
};
var<private> t: sampler2D;
fn main(_stageOut: ptr<function, FSOut>) {
  {
    let _skTemp0 = sampleLod(t, vec2<f32>(0.0), 0.0);
    var c: vec4<f32> = _skTemp0;
    let _skTemp1 = sampleLod(t, vec3<f32>(1.0), 0.0);
    (*_stageOut).sk_FragColor = c * _skTemp1;
  }
}
@fragment fn fragmentMain(_stageIn: FSIn) -> FSOut {
  var _stageOut: FSOut;
  main(&_stageOut);
  return _stageOut;
}

1 error