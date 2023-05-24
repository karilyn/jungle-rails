describe('user login', () => {
  it("should load the home page", () => {
    cy.visit('/')
  })

  it("should show login form", () => {
    cy.get(".nav-item").contains("Log In").click()
    cy.get("form").should("be.visible")
  })

  it("should log in a user", () => {
    cy.get("form").within(() => {
      cy.get('input[name="login[email]"]').type("test@test.com")
      cy.get('input[name="login[password]"]').type("testing")
      .get('input[type="submit"]')
      .click()
      cy.url().should("include", "/")
    })
    cy.get(".navbar").contains("Log Out")
  })
})
