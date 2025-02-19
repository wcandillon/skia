diagnostic(off, derivative_uniformity);
struct VSIn {
  @builtin(instance_index) sk_InstanceID: u32,
};
struct VSOut {
  @location(1) @interpolate(flat) id: i32,
  @builtin(position) sk_Position: vec4<f32>,
};
fn fn_i(_stageIn: VSIn) -> i32 {
  {
    return i32(_stageIn.sk_InstanceID);
  }
}
fn main(_stageIn: VSIn, _stageOut: ptr<function, VSOut>) {
  {
    let _skTemp0 = fn_i(_stageIn);
    (*_stageOut).id = _skTemp0;
  }
}
@vertex fn vertexMain(_stageIn: VSIn) -> VSOut {
  var _stageOut: VSOut;
  main(_stageIn, &_stageOut);
  return _stageOut;
}
