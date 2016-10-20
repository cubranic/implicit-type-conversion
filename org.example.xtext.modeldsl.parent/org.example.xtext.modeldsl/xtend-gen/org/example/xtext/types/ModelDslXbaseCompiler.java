package org.example.xtext.types;

import org.eclipse.xtext.xbase.XExpression;
import org.eclipse.xtext.xbase.compiler.XbaseCompiler;
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable;
import org.eclipse.xtext.xbase.typesystem.references.LightweightTypeReference;
import org.example.xtext.runtime.MyNumber;

@SuppressWarnings("all")
public class ModelDslXbaseCompiler extends XbaseCompiler {
  @Override
  protected void internalToConvertedExpression(final XExpression obj, final ITreeAppendable appendable) {
    final LightweightTypeReference actualType = this.getLightweightType(obj);
    final LightweightTypeReference expectedType = this.getLightweightExpectedType(obj);
    super.internalToConvertedExpression(obj, appendable);
    if (((((expectedType != null) && (actualType != null)) && 
      expectedType.isType(double.class)) && actualType.isType(MyNumber.class))) {
      appendable.append(".doubleValue()");
    }
  }
}
