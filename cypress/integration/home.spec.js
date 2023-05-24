describe('jungle home', () => {
  it("should load the home page", () => {
    cy.visit('/')
  })

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should show two products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})