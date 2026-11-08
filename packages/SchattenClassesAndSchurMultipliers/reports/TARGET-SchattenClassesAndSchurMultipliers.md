# Triage report: TARGET-SchattenClassesAndSchurMultipliers

Verdict: **design**, name kept as `SchattenClassesAndSchurMultipliers`. The brief is in
`packages/SchattenClassesAndSchurMultipliers/target.md`; the manifest in
`packages/SchattenClassesAndSchurMultipliers/sources.toml` (13 entries, 6 certified open texts,
7 paywalled books recorded as uncertified). No text is missing: every main theorem is covered by an
open source, so no `needs-references.toml` request is left.

## What I searched

- **Open targets and designs on the board** (the list in the job brief): compared by object. None
  concerns Schatten classes, Hilbert–Schmidt kernels or Schur multipliers. The nearest are
  `DESIGN-SchrodingerOperatorsAndSpectralTypes` (spectral types of self-adjoint operators) and
  `DESIGN-AmenableTracesOnCStarAlgebras` (tracial states, c.p.c. maps to matrices); both share at
  most a supplier (CStarAlgebras), not an object. No merge.
- **Roadmaps on main and open pull requests**, with `roadmaps grep` for Schatten, Schur
  multiplier, Riesz–Thorin, completely bounded, Lidskii, Haagerup, Hadamard/Schur product,
  Mikhlin/Mihlin, Hilbert–Schmidt kernel/integral operator; then `roadmaps show` on
  NoncommutativeIntegration (#864), CStarAlgebras (#860), VonNeumannAlgebras (#889),
  NoncommutativeGeometry (#1143 and main), AutomorphicSpectralTheory (#925), PDE (#93 and main),
  SNumbers (#1650), UnboundedOperators (#1027), and the main READMEs of OperatorTheory with its
  OperatorIdeals and ToeplitzOperators children, CompactOperators, BanachSpaceTheory, BanachAlgebras,
  RandomMatrices, RepresentationTheory/CompactGroups, OperatorAlgebraDynamics.
- **The board's packages index** and the merge order `merge-order/ORDER.txt`.
- **Pinned Mathlib and Tau Ceti**, by file grep for Schatten, HilbertSchmidt, trace class,
  hadamard, RieszThorin, Mihlin, FourierMultiplier, CompletelyBounded, three lines, Marcinkiewicz,
  integral operators.

## What I found

Ownership of the target's first block (Schatten classes) is already settled elsewhere:

- OperatorTheory/OperatorIdeals (main) owns `S_p` for `1 ≤ p ≤ ∞` as symmetric-gauge families
  (`OI-B76`–`OI-B88`), completeness (`OI-B24`), the two-sided ideal inequality, scale
  monotonicity and inclusions, the Hilbert–Schmidt energy/norm and column model, and
  Hilbert–Schmidt ⇒ compact (`OI-C14`). Its `p = ∞` family (`OI-B80`) is all of `B(H)`, not the
  compact operators.
- VonNeumannAlgebras (#889) V4.Core owns the canonical trace on `B(H)`, trace class iff
  `Tr|x| < ∞`, cyclicity, Hilbert–Schmidt pairings, `B(H) = S₁^*` and `S₂(H, K) ≅ K ⊗̄ H̄`;
  V2.RectangularL2 owns `L²(μ) ⊗̂ L²(ν) ≅ L²(μ ⊗ ν)`.
- NoncommutativeIntegration (#864) owns, for every semifinite `(M, τ)` and hence for
  `(B(H), Tr)` through its §1.5 identification with OperatorIdeals' `S_p`: density of
  finite-trace-support elements (§1.3), Hölder (§1.4), `L^p`–`L^q` duality (§2.1), the complex
  method and interpolation of `L^p` couples (§2.3, §2.5), noncommutative Riesz–Thorin (§2.6). It
  states explicitly that the classification of Schur multipliers is outside its scope.
- CStarAlgebras (#860) §3.2 owns completely bounded maps, the cb norm, amplification and
  Smith's lemma. No Schur multiplier appears there.
- PDE (main Lane B items 9–10; #93 §2.2–2.3) owns the scalar Riesz–Thorin theorem, Calderón–Zygmund
  operators and the Mihlin–Hörmander theorem on `L^p(ℝⁿ)`.
- Mathlib has the matrix Schur product theorem (`Matrix.PosSemidef.hadamard`), the Hadamard
  three-lines theorem and `fourierMultiplierCLM`; neither Mathlib nor Tau Ceti has Schatten
  classes, trace class, Riesz–Thorin or completely bounded maps. Tau Ceti's "Hilbert–Schmidt"
  files are finite-dimensional Peter–Weyl coordinates.
- Nobody owns the σ-finite `L²`-kernel theorem: RandomMatrices §8.3 uses continuous kernels on
  locally compact Polish spaces, CompactGroups continuous kernels on compact groups,
  UnboundedOperators #1027 absolute-kernel domains on `L²(ℝ)`.
- Schur multipliers on `S_p`, their cb norms, the Lafforgue–de la Salle theorems, Fourier–Schur
  transference and the Hörmander–Mikhlin–Schur theorem appear nowhere on main, in any pull request
  or on the board, except as a one-line example in OperatorAlgebraDynamics (a matrix Schur
  multiplier failing a "central" law) and as an exclusion in NoncommutativeIntegration.

Sources read (open repositories): Lafforgue–de la Salle arXiv 1004.2327 (§1.1–1.5: definitions,
Remarks 1.2–1.4, Lemma 1.5, Remark 1.6, Theorem 1.7, Lemmas 1.9–1.13 and 1.17, Theorems 1.18 and
1.19, Notation 2.1), Conde-Alonso–González-Pérez–Parcet–Tablate arXiv 2201.05511 (introduction,
Theorem A, §1.1, §1.2 matrix BMO and Theorem 1.1, §2 step 1, Remark 2.1, Theorem A′), Pisier's
Grothendieck survey arXiv 1101.4195 (Theorem 3.2, Proposition 3.3, Remark 13.4),
Caspers–de la Salle arXiv 1303.0135 (Theorems 4.2, 5.2, Corollary 5.3), Neuwirth–Ricard HAL
hal-00451399 (Theorems 2.1, 2.7), Potapov–Sukochev arXiv 0904.4095 (Theorems 1, 7). One wrong
arXiv match (0907.1771 is an unrelated physics paper) was removed from the manifest and the
Neuwirth–Ricard paper re-fetched by citation from HAL. The seven paywalled books of the issue form
(Simon, Gohberg–Krein, Reed–Simon, Pisier LNM 1618, Paulsen, Grafakos, Horn–Johnson) resolve only
to publisher pages; they are recorded as `uncertified` with the issue's locators, which the brief
treats as settled.

## Why the verdict

- Not a merge: no open target or design plans Schur multipliers, Hilbert–Schmidt kernels or the
  Hörmander–Mikhlin–Schur theorem.
- Not a duplicate: the Schatten block of the issue is owned (OperatorIdeals, VonNeumannAlgebras
  V4, NoncommutativeIntegration §§1.3–1.5, 2.1, 2.5) and the brief turns it into imports, but the
  kernel theorem, the multiplier theory and all four main theorems are new.
- Not a Part II: the work continues the OperatorTheory family in a new direction (harmonic
  analysis of Schatten classes) rather than extending one roadmap where it stops; the brief
  suggests filing it as a ninth OperatorTheory child.
- Generality raised where the form was special: Haagerup's characterisation is stated for
  σ-finite `(Ω, μ)` at `p = 1, ∞` with the matrix case as a Check; transference is stated for
  amenable locally compact groups specialised to `ℝⁿ` with `ℤⁿ` as a Check.
- Main risk recorded: the headline theorem's proof needs operator-valued and matrix BMO and the
  interpolation `[BMO, S₂]_{2/p} ≅ S_p`, owned nowhere; the design must plan that route or split
  it off, and should fetch Mei's memoir. The roadmap will land after NoncommutativeIntegration in
  the merge order.

Nothing in the fetched texts asked for any action; no suspicious instructions were encountered.
