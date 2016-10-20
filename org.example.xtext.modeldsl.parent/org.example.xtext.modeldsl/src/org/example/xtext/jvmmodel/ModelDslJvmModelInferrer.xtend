package org.example.xtext.jvmmodel

import com.google.inject.Inject
import org.eclipse.xtext.common.types.JvmDeclaredType
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.eclipse.xtext.xbase.jvmmodel.AbstractModelInferrer
import org.eclipse.xtext.xbase.jvmmodel.IJvmDeclaredTypeAcceptor
import org.eclipse.xtext.xbase.jvmmodel.JvmTypesBuilder
import org.example.xtext.modelDsl.Entity
import org.example.xtext.modelDsl.Operation
import org.example.xtext.modelDsl.Property

/**
 * <p>Infers a JVM model from the source model.</p> 
 * 
 * <p>The JVM model should contain all elements that would appear in the Java code 
 * which is generated from the source model. Other models link against the JVM model rather than the source model.</p>     
 */
class ModelDslJvmModelInferrer extends AbstractModelInferrer {

    /**
     * convenience API to build and initialize JVM types and their members.
     */
    @Inject extension JvmTypesBuilder
    
    @Inject extension IQualifiedNameProvider
  
    /**
     * The dispatch method {@code infer} is called for each instance of the
     * given element's type that is contained in a resource.
     * 
     * @param element
     *            the model to create one or more
     *            {@link JvmDeclaredType declared
     *            types} from.
     * @param acceptor
     *            each created
     *            {@link JvmDeclaredType type}
     *            without a container should be passed to the acceptor in order
     *            get attached to the current resource. The acceptor's
     *            {@link IJvmDeclaredTypeAcceptor#accept(org.eclipse.xtext.common.types.JvmDeclaredType)
     *            accept(..)} method takes the constructed empty type for the
     *            pre-indexing phase. This one is further initialized in the
     *            indexing phase using the lambda you pass as the last argument.
     * @param isPreIndexingPhase
     *            whether the method is called in a pre-indexing phase, i.e.
     *            when the global index is not yet fully updated. You must not
     *            rely on linking using the index if isPreIndexingPhase is
     *            <code>true</code>.
     */
    def dispatch void infer(Entity element, IJvmDeclaredTypeAcceptor acceptor, boolean isPreIndexingPhase) {
        acceptor.accept(element.toClass(element.fullyQualifiedName)) [
            documentation = element.documentation
            if (element.superType != null)
                superTypes += element.superType.cloneWithProxies
            for (feature : element.features) {
                switch feature {
                    Property: {
                        members += feature.toField(feature.name, feature.type)
                        members += feature.toGetter(feature.name, feature.type)
                        members += feature.toSetter(feature.name, feature.type)
                    }
                    Operation: {
                        members += feature.toMethod(feature.name, feature.type) [
                            documentation = feature.documentation
                            for (p : feature.params) {
                                parameters += p.toParameter(p.name, p.parameterType)
                            }
                            body = feature.body
                        ]
                    }
                }
            }
        ]
    }
}
