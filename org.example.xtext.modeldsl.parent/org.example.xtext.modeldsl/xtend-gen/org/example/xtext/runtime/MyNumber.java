package org.example.xtext.runtime;

@SuppressWarnings("all")
public class MyNumber {
  private final Double value;
  
  public MyNumber(final Double value) {
    this.value = value;
  }
  
  public Double doubleValue() {
    return this.value;
  }
}
