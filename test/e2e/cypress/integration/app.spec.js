context('App', () => {
    beforeEach(() => {
        cy.visit('/');
    });

    it('app exists', () => {
        cy.get('#app').should('have.length', 1);
    });

});
