expect = @chai.expect

describe 'Models.Validation', ->
  Validation = Application.Models.Validation

  describe '.addError', ->
    errors = null
    
    beforeEach ->
      errors = {}
      Validation.addError errors, 'name', 'Name is required.'

    it 'creates new attribute', -> expect(errors.name).to.exist

    it 'appends new message', ->
      expect(errors.name).to.include 'Name is required.'

  describe '.isValidEmailFormat', ->

    describe 'valid', ->
      it 'returns true', ->
        expect(Validation.isValidEmailFormat 'user@example.com').to.be.ok

    describe 'invalid', ->
      it 'returns false', ->
        expect(Validation.isValidEmailFormat 'foo-bar').to.not.be.ok

  describe '.isValidPasswordLength', ->
    describe 'valid', ->
      it 'returns true', ->
        expect(Validation.isValidPasswordLength '$ecre8').to.be.ok

    describe 'invalid', ->
      describe 'less than six characters', ->
        it 'returns false', ->
          expect(Validation.isValidPasswordLength(repeatString 5)).to.not.be.ok

      describe 'more than sixty four characters', ->
        it 'returns false', ->
          expect(Validation.isValidPasswordLength(repeatString 65))
            .to.not.be.ok