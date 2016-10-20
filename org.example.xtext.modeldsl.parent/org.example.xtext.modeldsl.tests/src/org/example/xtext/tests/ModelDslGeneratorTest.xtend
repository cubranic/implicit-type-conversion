package org.example.xtext.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.TemporaryFolder
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ModelDslInjectorProvider)
class ModelDslGeneratorTest {
    @Inject public TemporaryFolder temporaryFolder
    @Inject extension CompilationTestHelper        
    
    @Test
    def generateModel() {
        '''
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
        '''.assertCompilesTo(
        '''
        MULTIPLE FILES WERE GENERATED
        
        File 1 : /myProject/./src-gen/my/model/Address.java
        
        package my.model;
        
        @SuppressWarnings("all")
        public class Address {
          private String street;
          
          public String getStreet() {
            return this.street;
          }
          
          public void setStreet(final String street) {
            this.street = street;
          }
          
          private String zip;
          
          public String getZip() {
            return this.zip;
          }
          
          public void setZip(final String zip) {
            this.zip = zip;
          }
          
          private String city;
          
          public String getCity() {
            return this.city;
          }
          
          public void setCity(final String city) {
            this.city = city;
          }
        }
        
        File 2 : /myProject/./src-gen/my/model/Person.java
        
        package my.model;
        
        import java.util.List;
        import my.model.Address;
        import org.eclipse.xtext.xbase.lib.Functions.Function1;
        import org.eclipse.xtext.xbase.lib.IterableExtensions;
        import org.example.xtext.runtime.MyNumber;
        
        @SuppressWarnings("all")
        public class Person {
          private String name;
          
          public String getName() {
            return this.name;
          }
          
          public void setName(final String name) {
            this.name = name;
          }
          
          private MyNumber age;
          
          public MyNumber getAge() {
            return this.age;
          }
          
          public void setAge(final MyNumber age) {
            this.age = age;
          }
          
          private String firstName;
          
          public String getFirstName() {
            return this.firstName;
          }
          
          public void setFirstName(final String firstName) {
            this.firstName = firstName;
          }
          
          private List<Person> friends;
          
          public List<Person> getFriends() {
            return this.friends;
          }
          
          public void setFriends(final List<Person> friends) {
            this.friends = friends;
          }
          
          private Address address;
          
          public Address getAddress() {
            return this.address;
          }
          
          public void setAddress(final Address address) {
            this.address = address;
          }
          
          public String getFullName() {
            return ((this.firstName + " ") + this.name);
          }
          
          public List<Person> getFriendsSortedByFullName() {
            final Function1<Person, String> _function = new Function1<Person, String>() {
              public String apply(final Person f) {
                return f.getFullName();
              }
            };
            return IterableExtensions.<Person, String>sortBy(this.friends, _function);
          }
          
          public Double getPoliteAge() {
            Double _doubleValue = this.age.doubleValue();
            return Double.valueOf(((_doubleValue).doubleValue() - 5));
          }
        }
        
        '''
        )
    }   
}