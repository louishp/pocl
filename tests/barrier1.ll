declare void @barrier(i32 %flags)

define void @barrier1() {

barrier:
  call void @barrier(i32 0)
  ret void
}