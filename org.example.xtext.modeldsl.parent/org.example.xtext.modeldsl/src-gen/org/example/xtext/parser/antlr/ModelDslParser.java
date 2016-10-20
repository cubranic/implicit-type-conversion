/*
 * generated by Xtext 2.10.0
 */
package org.example.xtext.parser.antlr;

import com.google.inject.Inject;
import org.eclipse.xtext.parser.antlr.AbstractAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.example.xtext.parser.antlr.internal.InternalModelDslParser;
import org.example.xtext.services.ModelDslGrammarAccess;

public class ModelDslParser extends AbstractAntlrParser {

	@Inject
	private ModelDslGrammarAccess grammarAccess;

	@Override
	protected void setInitialHiddenTokens(XtextTokenStream tokenStream) {
		tokenStream.setInitialHiddenTokens("RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT");
	}
	

	@Override
	protected InternalModelDslParser createParser(XtextTokenStream stream) {
		return new InternalModelDslParser(stream, getGrammarAccess());
	}

	@Override 
	protected String getDefaultRuleName() {
		return "Domainmodel";
	}

	public ModelDslGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}

	public void setGrammarAccess(ModelDslGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}
