describe('jungle app', () => {
  it("should load the home page", () => {
    cy.visit('/')
  })

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should show two products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it ("should navigate to product detail page", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
  })
})