package org.example.xtext.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.example.xtext.modelDsl.Domainmodel
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ModelDslInjectorProvider)
class ModelDslParsingTest{

    @Inject extension ParseHelper<Domainmodel>;
    
    @Inject extension ValidationTestHelper;

	@Test 
	def void loadModel() {
		val model = '''
            import java.util.List
            import org.example.xtext.runtime.MyNumber
             
            package my.model {
             
                entity Person {
                    name: String
                    age: MyNumber
                    firstName: String
                    friends: List<Person>
                    address : Address
                    op getFullName() : String {
                        return firstName + " " + name;
                    }
                    
                    op getFriendsSortedByFullName() : List<Person> {
                        return friends.sortBy[ f | f.fullName ]
                    }
                    
                    op getPoliteAge() : Double {
                        age - 5
                    }
                }
                
                entity Address {
                    street: String
                    zip: String
                    city: String
                }
            }
    	'''.parse
		model.assertNoErrors
	}

}
