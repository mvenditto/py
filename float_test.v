module py

import math

fn testsuite_begin() {
	C.Py_Initialize()
}

fn testsuite_end() {
}

fn test_float_check() {
	f := C.PyFloat_FromDouble(42.42)
	assert C.PyFloat_Check(f) == 1
	assert C.PyFloat_CheckExact(f) == 1
	C.Py_XDECREF(f)
}

fn test_float_from_double() {
	val := f64(4242.424242)
	py_f := C.PyFloat_FromDouble(val)
	assert voidptr(py_f) != C.NULL
	v_f := C.PyFloat_AsDouble(py_f)
	assert v_f == val
	C.Py_XDECREF(py_f)
}

fn test_float_from_unicode() {
	v := f64(42.42)
	s := C.PyUnicode_FromString(v.str().str)
	f := C.PyFloat_FromString(s)
	v_f := C.PyFloat_AsDouble(f)
	assert v_f == v
	C.Py_DECREF(f)
	C.Py_DECREF(s)
}