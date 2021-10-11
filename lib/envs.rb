class Envs
  INITIAL_LIVING_CELLS = 128

  def initial_cells(size)
    [INITIAL_LIVING_CELLS, size - INITIAL_LIVING_CELLS]
  end
end
