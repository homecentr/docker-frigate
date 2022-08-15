const path = require("path");
const axios = require("axios");
const { DockerComposeEnvironment } = require("testcontainers");

describe("Frigate container should", () => {
    var frigateContainer;
    var composeEnvironment;

    beforeAll(async () => {
        const composeFilePath = path.resolve(__dirname, "..");

        composeEnvironment = await new DockerComposeEnvironment(composeFilePath, "docker-compose.yml")
            .withBuild()
            .up();

        frigateContainer = composeEnvironment.getContainer("image_1");
    });

    afterAll(async () => {
        await composeEnvironment.down();
    });

    it("Listen on web ui port", async () => {
        // Arrange
        const port = frigateContainer.getMappedPort(5000);
        const url = `http://localhost:${port}/`

        // Act
        const response = await axios.get(url);

        // Assert
        expect(response.status).toBe(200);
    });
});