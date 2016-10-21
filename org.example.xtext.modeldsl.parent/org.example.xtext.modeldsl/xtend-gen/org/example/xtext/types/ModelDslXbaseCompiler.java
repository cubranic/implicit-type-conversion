package org.example.xtext.types;

import org.eclipse.emf.common.util.EList;
import org.eclipse.xtext.common.types.JvmIdentifiableElement;
import org.eclipse.xtext.common.types.JvmOperation;
import org.eclipse.xtext.common.types.JvmTypeParameter;
import org.eclipse.xtext.xbase.XAbstractFeatureCall;
import org.eclipse.xtext.xbase.XExpression;
import org.eclipse.xtext.xbase.compiler.Later;
import org.eclipse.xtext.xbase.compiler.XbaseCompiler;
import org.eclipse.xtext.xbase.compiler.output.ITreeAppendable;
import org.eclipse.xtext.xbase.typesystem.references.LightweightTypeReference;
import org.example.xtext.runtime.MyNumber;

@SuppressWarnings("all")
public class ModelDslXbaseCompiler extends XbaseCompiler {
  @Override
  protected void doConversion(final LightweightTypeReference left, final LightweightTypeReference right, final ITreeAppendable appendable, final XExpression context, final Later expression) {
    if ((right.isType(MyNumber.class) && left.isType(double.class))) {
      final XExpression normalized = this.normalizeBlockExpression(context);
      if (((normalized instanceof XAbstractFeatureCall) && 
        (!(context.eContainer() instanceof XAbstractFeatureCall)))) {
        final XAbstractFeatureCall featureCall = ((XAbstractFeatureCall) normalized);
        boolean _isStatic = featureCall.isStatic();
        if (_isStatic) {
          final JvmIdentifiableElement feature = featureCall.getFeature();
          if ((feature instanceof JvmOperation)) {
            EList<JvmTypeParameter> _typeParameters = ((JvmOperation) feature).getTypeParameters();
            boolean _isEmpty = _typeParameters.isEmpty();
            boolean _not = (!_isEmpty);
            if (_not) {
              appendable.append("(double)");
              expression.exec(appendable);
              return;
            }
          }
        }
      }
      appendable.append("(");
      expression.exec(appendable);
      appendable.append(")");
      appendable.append(".");
      appendable.append("doubleValue()");
    } else {
      super.doConversion(left, right, appendable, context, expression);
    }
  }
}
