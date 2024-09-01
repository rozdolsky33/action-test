// This file must have a valid groovy syntax!
// it has *.conf extension only because Geb framework scans entire resources/ dir for groovy files and we do not want that
// TODO: find a way to prevent Geb from scanning this file, then change the extension to *.groovy

import org.testspec.core.TestSpecException
import org.testspec.core.util.WebDriverHelper
import org.openqa.selenium.remote.AbstractDriverOptions
import org.openqa.selenium.remote.RemoteWebDriver
import org.openqa.selenium.WebDriver

import software.amazon.awssdk.services.devicefarm.DeviceFarmClient
import software.amazon.awssdk.services.devicefarm.model.CreateTestGridUrlRequest
import software.amazon.awssdk.services.devicefarm.model.CreateTestGridUrlResponse
import software.amazon.awssdk.regions.Region

import java.awt.Desktop

application = 'demo'
suite = 'smoke'
component = 'misc'

waiting {
    includeCauseInMessage = true
    timeout = 5 // seconds
    retryInterval = 0.5
    slow { timeout = 10 }
    reallyslow { timeout = 20 }
}

baseDir = System.getProperty('user.dir')
baseNavigatorWaiting = true

// To run the tests with all browsers just run “./gradlew testspec”

environments {
    String browserCliParam = System.getProperty('browser')?.toLowerCase()
    Map browserParams = WebDriverHelper.parseBrowserArg(browserCliParam)

    localhost {
        // https://googlechromelabs.github.io/chrome-for-testing/
        if (browserParams.name in WebDriverHelper.SUPPORTED_BROWSERS) {
            // See: http://code.google.com/p/selenium/wiki/ChromeDriver
            driver = {
                WebDriver webDriver = WebDriverHelper.supplyDriver(browserParams.name)
                // Map<String,String> extraProperties = [:] // user could add more
                // WebDriver webDriver = WebDriverHelper.createLocalDriver(browserCliParam, extraProperties)
                webDriver.manage().window().maximize()
                // manage().window().setSize(new Dimension(1900,1080))
                webDriver // must be the last statement in this closure!
            }
        } else {
            throw new TestSpecException("Unsupported browser! Supported: ${WebDriverHelper.SUPPORTED_BROWSERS}")
        }
    }

    saucelabs {
        // https://saucelabs.com/platform/platform-configurator#/
        driver = {
            if (browserParams.name !in WebDriverHelper.SUPPORTED_BROWSERS) {
                throw new TestSpecException("Unsupported browser! Supported: ${WebDriverHelper.SUPPORTED_BROWSERS}")
            }
            String className = "org.openqa.selenium.${browserParams.name.toLowerCase()}.${browserParams.name.capitalize()}Options"
            Class clazz = ClassLoader.forName(className)
            AbstractDriverOptions options = clazz.getDeclaredConstructor().newInstance()

            options.setPlatformName(browserParams.os) // like: "macOS_11.00" "Windows_10"
            options.setBrowserVersion(browserParams.version)

            Map<String, Object> sauceOptions = [:]
            sauceOptions.put('username', System.getenv('SAUCE_USERNAME'));
            sauceOptions.put('accessKey', System.getenv('SAUCE_ACCESS_KEY'));
            sauceOptions.put('name', 'TestSpec'); // TODO: use app name from this file?

            options.setCapability('sauce:options', sauceOptions);
            URL url = new URL('https://ondemand.us-west-1.saucelabs.com/wd/hub');

            RemoteWebDriver webDriver = new RemoteWebDriver(url, options);

            if (Desktop.desktopSupported && Desktop.desktop.isSupported(Desktop.Action.BROWSE)) {
                Desktop.desktop.browse(new URI("https://app.saucelabs.com/tests/${webDriver.sessionId}"))
            }

            webDriver // must be the last statement in this closure!
        }
    }

    amazonfarm {
        // AWS device farm setup adds extra 1 min to total execution time
        // https://docs.aws.amazon.com/devicefarm/latest/testgrid/getting-started-migration.html
        driver = {
            if (browserParams.name !in WebDriverHelper.SUPPORTED_BROWSERS) {
                throw new TestSpecException("Unsupported browser! Supported: ${WebDriverHelper.SUPPORTED_BROWSERS}")
            }
            List<String> awsMandatoryParameters = ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY', 'AWS_PROJECT_ARN']
            if (!awsMandatoryParameters.every { System.getenv(it) }) {
                throw new RuntimeException("""When executing tests on amazonfarm, following env properties must be set: $awsMandatoryParameters
                AWS_ACCESS_KEY_ID = ${System.getenv('AWS_ACCESS_KEY_ID')?'set':'not set'}                
                AWS_SECRET_ACCESS_KEY = ${System.getenv('AWS_SECRET_ACCESS_KEY')?'set':'not set'}                
                AWS_PROJECT_ARN = ${System.getenv('AWS_PROJECT_ARN')?'set':'not set'}                
                """)
            }

            String region = System.getenv('AWS_REGION') ?: 'us-west-2'
            DeviceFarmClient client = DeviceFarmClient.builder()
                    .region(Region.of(region)).build();
            CreateTestGridUrlRequest request = CreateTestGridUrlRequest.builder()
                    .expiresInSeconds(180)
                    .projectArn(System.getenv('AWS_PROJECT_ARN'))
                    .build();
            CreateTestGridUrlResponse response = client.createTestGridUrl(request);
            URL testGridUrl = new URL(response.url()) // You can now pass this URL into RemoteWebDriver.

            AbstractDriverOptions options = WebDriverHelper.createOptionsFor(browserParams.name)

            WebDriver webDriver = new RemoteWebDriver(testGridUrl, options)
            // TODO: build a link to amazonfarm execution video
            webDriver // must be the last statement in this closure!
        }
    }

}
