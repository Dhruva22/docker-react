import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import App from './App';

describe('App Component', () => {
  it('renders the initial count of 0', () => {
    render(<App />);
    
    // Check that the text "Count is 0" is visible on the screen
    const countText = screen.getByText(/Count is 0/i);
    expect(countText).toBeInTheDocument();
  });

  it('increments count when the button is clicked', async () => {
    render(<App />);
    
    // Find the button and click it
    const button = screen.getByRole('button', { name: /count is/i });
    await userEvent.click(button);

    // Verify that the count updated to 1
    const updatedCountText = screen.getByText(/Count is 1/i);
    expect(updatedCountText).toBeInTheDocument();
  });
});