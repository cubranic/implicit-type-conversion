package org.example.xtext.runtime;

@SuppressWarnings("all")
public class MyNumber {
  private final Double value;
  
  public MyNumber(final Double value) {
    this.value = value;
  }
  
  public double doubleValue() {
    return this.value.doubleValue();
  }
}
