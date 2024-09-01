package glue

import io.cucumber.groovy.Hooks
import io.cucumber.groovy.Scenario
import org.testspec.core.HooksHandler
import org.testspec.core.TestSpecWorld
import org.testspec.core.util.Helper

import static io.cucumber.groovy.Hooks.After
import static io.cucumber.groovy.Hooks.Before

long scenarioEndTime, scenarioStartTime

Hooks.World {
    def world = new TestSpecWorld()
    world.binding = this.binding
    // TestSpecWorld.@_currentWorld.set(world)
    world // last statement must be the "world" object
}

Before(1) { Scenario scenario ->
    log.debug('Inside Before() hook: handling Scenario skip')
    if (HooksHandler.shouldBeSkipped(scenario.sourceTagNames)) {
        HooksHandler.skip(scenario)
    }
}

Before(2) { Scenario scenario ->
    log.debug('Inside Before() hook: providing web driver')
    scenarioStartTime = System.currentTimeMillis()

    String browser = Helper.SYSTEM_PROPERTIES['browser']
    HooksHandler.provideWebDriver(browser)
}

After { Scenario scenario ->
    scenarioEndTime = System.currentTimeMillis()
    // long scenarioDuration = scenarioEndTime - scenarioStartTime

    currentWorld.bindingUpdater?.remove() // Removes everything from the binding and stops updating it.

    HooksHandler.handleScreenShot(scenario)

    /*
    // below is not enough to make @ShouldFail work correctly,
    // we need to override the status to PASSED when the Scenario fails...
    List<String> shouldFailTags = scenario.sourceTagNames.findAll {it.toLowerCase().contains('shouldfail') }
    if (shouldFailTags) {
        assert scenario.status.name() == 'FAILED'
    }
    */

    // NOTE: any additional test evidence publishing - Elastic, Kafka, etc. - must be done via plugin
}
