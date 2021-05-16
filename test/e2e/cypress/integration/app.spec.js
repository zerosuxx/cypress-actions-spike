context('App', () => {
    beforeEach(() => {
        cy.visit('/');
    });

    it('renders welcome message', () => {
        cy.get('#app').contains('Hello VueTS');
    });

});
