package victoria.adidas.runners.pet.createPet;

import com.privalia.qa.utils.BaseGTest;
import io.cucumber.testng.CucumberOptions;


/**
 * This is the runner class responsible of running the included *.feature files in the project.
 * Glue files can be specified in the {@link CucumberOptions} annotation
 *
 * Here you can also create your own TestNG hooks or even configure parallel tests execution.
 * For more info on these topics check:
 * https://testng.org/doc/documentation-main.html#annotations
 * https://cucumber.io/docs/guides/parallel-execution/#testng
 */
@CucumberOptions(plugin = {
                "json:target/CreatePetAPI.json",
                "html:target/CreatePetAPI.html",
                "junit:target/CreatePetAPI.xml"
        }, features =
        {
                "src/test/resources/features/pet/createPet/create_pet_api.feature"
        },
        glue = "classpath:victoria.adidas.glue")
public class CreatePetAPI extends BaseGTest {


}
