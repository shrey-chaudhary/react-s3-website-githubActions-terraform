import { render, queryByAttribute } from '@testing-library/react';
import App from './App';

test('renders bpoilerplate heading', () => {
  const getById = queryByAttribute.bind(null, 'id');

  const dom = render(<App />);
  const heading = getById(dom.container, 'heading');
  expect(heading).toBeInTheDocument();
});
