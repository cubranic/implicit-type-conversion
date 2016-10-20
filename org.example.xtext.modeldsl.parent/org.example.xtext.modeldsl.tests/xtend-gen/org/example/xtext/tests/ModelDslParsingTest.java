package org.example.xtext.tests;

import com.google.inject.Inject;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.junit4.InjectWith;
import org.eclipse.xtext.junit4.XtextRunner;
import org.eclipse.xtext.junit4.util.ParseHelper;
import org.eclipse.xtext.junit4.validation.ValidationTestHelper;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Extension;
import org.example.xtext.modelDsl.Domainmodel;
import org.example.xtext.tests.ModelDslInjectorProvider;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(XtextRunner.class)
@InjectWith(ModelDslInjectorProvider.class)
@SuppressWarnings("all")
public class ModelDslParsingTest {
  @Inject
  @Extension
  private ParseHelper<Domainmodel> _parseHelper;
  
  @Inject
  @Extension
  private ValidationTestHelper _validationTestHelper;
  
  @Test
  public void loadModel() {
    try {
      StringConcatenation _builder = new StringConcatenation();
      _builder.append("import java.util.List");
      _builder.newLine();
      _builder.append("import org.example.xtext.runtime.MyNumber");
      _builder.newLine();
      _builder.append(" ");
      _builder.newLine();
      _builder.append("package my.model {");
      _builder.newLine();
      _builder.append(" ");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("entity Person {");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("name: String");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("age: MyNumber");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("firstName: String");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("friends: List<Person>");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("address : Address");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("op getFullName() : String {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("return firstName + \" \" + name;");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("op getFriendsSortedByFullName() : List<Person> {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("return friends.sortBy[ f | f.fullName ]");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("        ");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("op getPoliteAge() : Double {");
      _builder.newLine();
      _builder.append("            ");
      _builder.append("age.doubleValue - 5");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("    ");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("entity Address {");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("street: String");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("zip: String");
      _builder.newLine();
      _builder.append("        ");
      _builder.append("city: String");
      _builder.newLine();
      _builder.append("    ");
      _builder.append("}");
      _builder.newLine();
      _builder.append("}");
      _builder.newLine();
      final Domainmodel model = this._parseHelper.parse(_builder);
      this._validationTestHelper.assertNoErrors(model);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
