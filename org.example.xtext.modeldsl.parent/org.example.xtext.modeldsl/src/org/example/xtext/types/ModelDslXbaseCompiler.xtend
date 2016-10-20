package org.example.xtext.types

import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.XExpression
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable
import org.example.xtext.runtime.MyNumber

class ModelDslXbaseCompiler extends XbaseCompiler {

    override protected internalToConvertedExpression(XExpression obj, ITreeAppendable appendable) {
        val actualType = getLightweightType(obj)
        val expectedType = getLightweightExpectedType(obj);

        super.internalToConvertedExpression(obj, appendable)

        if (expectedType !== null && actualType !== null && 
            expectedType.isType(double) && actualType.isType(MyNumber)) {
            appendable.append(".doubleValue()")
        }
    }

}
