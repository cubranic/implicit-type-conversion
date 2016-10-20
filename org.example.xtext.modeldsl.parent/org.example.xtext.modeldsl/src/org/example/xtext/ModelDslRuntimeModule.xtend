/*
 * generated by Xtext 2.10.0
 */
package org.example.xtext

import org.eclipse.xtext.xbase.typesystem.computation.SynonymTypesProvider
import org.example.xtext.types.ModelDslSynonymTypesProvider
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.example.xtext.types.ModelDslXbaseCompiler

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
class ModelDslRuntimeModule extends AbstractModelDslRuntimeModule {
    def Class<? extends SynonymTypesProvider> bindSynonymTypesProvider() {
        return typeof(ModelDslSynonymTypesProvider)
    }
    
    def Class<? extends XbaseCompiler> bindXbaseCompiler() {
        return typeof(ModelDslXbaseCompiler);
    }
    
}
