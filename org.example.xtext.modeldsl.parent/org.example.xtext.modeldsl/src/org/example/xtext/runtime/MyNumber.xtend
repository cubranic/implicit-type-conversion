package org.example.xtext.runtime

class MyNumber {
    private val Double value
    
    new(Double value) {
        this.value = value
    }
    
    def double doubleValue() {
        return value.doubleValue
    }
}