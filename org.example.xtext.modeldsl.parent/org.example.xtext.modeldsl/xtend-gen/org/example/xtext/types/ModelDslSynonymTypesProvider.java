package org.example.xtext.types;

import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.common.types.JvmType;
import org.eclipse.xtext.common.types.util.TypeReferences;
import org.eclipse.xtext.xbase.typesystem.computation.SynonymTypesProvider;
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceFlags;
import org.eclipse.xtext.xbase.typesystem.references.ITypeReferenceOwner;
import org.eclipse.xtext.xbase.typesystem.references.LightweightTypeReference;
import org.eclipse.xtext.xbase.typesystem.references.ParameterizedTypeReference;
import org.eclipse.xtext.xbase.typesystem.util.CommonTypeComputationServices;
import org.example.xtext.runtime.MyNumber;

@SuppressWarnings("all")
public class ModelDslSynonymTypesProvider extends SynonymTypesProvider {
  @Override
  protected boolean collectCustomSynonymTypes(final LightweightTypeReference type, final SynonymTypesProvider.Acceptor acceptor) {
    boolean _xblockexpression = false;
    {
      LightweightTypeReference _invariantBoundSubstitute = type.getInvariantBoundSubstitute();
      boolean _isType = _invariantBoundSubstitute.isType(MyNumber.class);
      if (_isType) {
        final ITypeReferenceOwner owner = type.getOwner();
        CommonTypeComputationServices _services = owner.getServices();
        final TypeReferences typeRefs = _services.getTypeReferences();
        ResourceSet _contextResourceSet = owner.getContextResourceSet();
        final JvmType synonym = typeRefs.findDeclaredType("double", _contextResourceSet);
        if ((synonym != null)) {
          ParameterizedTypeReference _parameterizedTypeReference = new ParameterizedTypeReference(owner, synonym);
          return this.announceSynonym(_parameterizedTypeReference, 
            ConformanceFlags.DEMAND_CONVERSION, acceptor);
        } else {
          return true;
        }
      }
      _xblockexpression = super.collectCustomSynonymTypes(type, acceptor);
    }
    return _xblockexpression;
  }
}
