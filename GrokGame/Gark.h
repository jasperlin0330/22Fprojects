// Gark.h

#ifndef GARK_INCLUDED
#define GARK_INCLUDED

class Mesa;

class Gark
{
  public:
        // Constructor
    Gark(Mesa* mp, int r, int c);

        // Accessors
    int  row() const;
    int  col() const;

        // Mutators
    void move();
    bool getAttacked(int dir);

  private:
    Mesa* m_mesa;
    int   m_row;
    int   m_col;
    int   m_health;
};

#endif  // GARK_INCLUDED
