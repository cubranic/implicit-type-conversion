package org.example.xtext.types

import org.eclipse.xtext.xbase.typesystem.computation.SynonymTypesProvider
import org.eclipse.xtext.xbase.typesystem.references.LightweightTypeReference
import org.eclipse.xtext.xbase.typesystem.computation.SynonymTypesProvider.Acceptor
import org.example.xtext.runtime.MyNumber
import org.eclipse.xtext.xbase.typesystem.references.ParameterizedTypeReference
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceFlags

class ModelDslSynonymTypesProvider extends SynonymTypesProvider {
    
    override protected collectCustomSynonymTypes(LightweightTypeReference type, Acceptor acceptor) {
        if (type.invariantBoundSubstitute.isType(MyNumber)) {
            val owner = type.owner
            val typeRefs = owner.services.typeReferences
            val synonym = typeRefs.findDeclaredType("double", owner.contextResourceSet)

            if (synonym !== null) {
                return announceSynonym(
                    new ParameterizedTypeReference(owner, synonym),
                    ConformanceFlags.DEMAND_CONVERSION,
                    acceptor)
                
            }
            else return true
        }
        super.collectCustomSynonymTypes(type, acceptor)
    }
    
}