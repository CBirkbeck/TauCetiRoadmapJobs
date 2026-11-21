# Review of HamiltonJacobiAndConservationLaws (pull request #2801 at 9fa1382)

**Verdict:** accepted

**Summary.** Accepted: the three findings and the small correction of the previous review are repaired, and the repairs introduce no new problem; there are no findings, no small corrections and no format notes. The new Check of §3.3 was recomputed (the range `|x| ≤ 4t` in it is right, and the `t/16` of the previous review was wrong), the entropy-pair equivalence of §6.1 is true with a locally Lipschitz flux `q`, and the new existence statement for the Cauchy problem elaborates and matches §4.5. Evans' book, which carries most of the locators, still could not be read, so its locators (including the two notes added in this round) and the arrangement of Layer 5 are left to the human reviewers.

## Previous findings

- R01 — repaired: "when `g` is semiconcave or `H` is uniformly convex it is semiconcave in the sense of Evans, and for `H` of class `C²` it is the only such solution that is", with the `H = p⁴`, `g = |x|` Check in §3.3.
- R02 — repaired: "`q : ℝ → E` locally Lipschitz with `q' = η' f'` almost everywhere".
- R03 — repaired: `exists_isViscositySolution_evolutionEquation` is stated, with `∀ x, |H x 0| ≤ C₀`, `UniformContinuous g`, `∀ x, |g x| ≤ M`; the module docstring names it ("with existence of its solution (§4.5)").
- C01 — repaired: "This layer assumes only that `g` is Lipschitz; it need not be bounded below."
- The two questions of the previous review are answered in the locators: "Evans, §10.2, Theorem 1, there for bounded uniformly continuous solutions" and "Evans, §3.4.5, Theorem 6, there for `p, q > 0`"; the description says both are from memory.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Summary, Hopf–Lax sentence against §3.3 | `g` semiconcave (Lemma 3 bullet); `H` uniformly convex (Lemma 4 bullet); `H = p⁴`, `g = |x|` | constants `C` and `1/(θt)`, both `≤ C'(1 + 1/t)`; the excluded case has neither hypothesis | agrees with §3.3 | none |
| §3.3 new Check | `H = p⁴`, `g = |x|`, `d = 1` | `p = (q/4)^{1/3}`, `L = 3(|q|/4)^{4/3}`, `L'(q) = (q/4)^{1/3}`; `y = 0` minimal iff `|x| ≤ 4t`; second difference `6t(|z|/(4t))^{4/3}`, exponent `4/3 < 2` | true as written | none |
| §3 opening | `g = ‖x‖` (bounded below), `g = −‖x‖` (not) | both admitted by "need not be bounded below"; `−‖x‖ − t/2` finite | consistent with the layer's Checks | none |
| §6.1 entropy pairs, with `q` locally Lipschitz | `f = 0`; Burgers stationary jumps with `η = u²`, `q = 2u³/3` | `f = 0`: `q` constant, both sides `0`; jump `1 → −1`: `(4/3)∫φ(t,0) dt ≥ 0`; jump `−1 → 1`: `−(4/3)∫φ(t,0) dt < 0` | holds; Cantor flux excluded | none |
| Lean `exists_isViscositySolution_evolutionEquation` against §4.5 | `d = 0`; `H = 0`; constants `±(M + C₀t)`; `T < 0`; Lipschitz `g` barriers | `u = g − H(0,0)t`; `u = g`, `∂ₜφ = 0` at extrema; `C₀ + H(x,0) ≥ 0` gives `|u| ≤ M + C₀T`; vacuous; `|H(x,p)| ≤ C₀ + NK` | holds; hypotheses equal §4.5's | none |
| §4.3 Cauchy bullet and §5.5 N-wave bullet (locator notes only) | statements unchanged | the notes narrow what the source is cited for; the roadmap's statements are as checked before | consistent | none |

The rows for the untouched statements stand as in the previous review, of `9e27a20`.

- Source locators checked against the text: 0 in this round; the two changed locators are to Evans, which could not be read (below).
- Library declarations opened at the pin: none new; the new Lean statement uses only `UniformContinuous`, `ContinuousOn`, `Set.Ici`, `Set.Icc`, `Set.Ioi` and the file's own `IsViscositySolution`, `evolutionEquation`.
- Cross-roadmap citations: none added or changed; the overlap computation lists no dropped or missing id.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing is changed outside the folder.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 16 `sorry` warnings and nothing else; no `set_option`, no sorry'd data; the elaborated type of the new theorem carries every binder of its statement.
- One-tactic probe on the new theorem (`rfl`, `trivial`, `simp`, `infer_instance`, `aesop`): none closes.
- Pull request text against the head: the description lists "uniqueness and existence for the Cauchy problem", the locator notes and the `|x| ≤ 4t` correction; nothing contradicted or left unstated.

Overlap check: read OptimalControlAndHamiltonJacobi, ConvexAnalysisAndDuality, CompressibleEulerEquations, OptimalTransport, PDE (as in the previous review; the change touches no shared object); shared with OptimalControlAndHamiltonJacobi: the finite-horizon value function, dynamic programming, the Hamilton–Jacobi–Bellman theorem and comparison for continuous functions, owner OptimalControlAndHamiltonJacobi, consumed here by section; shared with ConvexAnalysisAndDuality: the gradient of the conjugate under strict and strong convexity, left to the human reviewers; nothing shared with the others.

Source independence: changed passages only; 4 changed passages read (the Summary sentence, the §3.3 Check, the §6.1 bullet, the docstring of the new theorem), none comparable with a readable source, since the only source at their locators is Evans; largest share Evans, 35 of 50 locators; contents not compared with Evans, whose text and table of contents could not be read. No layer was added, removed or reordered.

Research link: Layer 4 is the first-order viscosity theory of Crandall–Lions (1983), Crandall–Evans–Lions (1984) and Ishii (1987), the base of the second-order theory of Crandall–Ishii–Lions (1992); Layer 6 is Kružkov's (1970) entropy theory, the scalar foundation of Dafermos (2016). Rests on the README's references and on Crandall–Ishii–Lions.

## Not verifiable

- Evans, *Partial Differential Equations*, §10.2, Theorem 1 (that it is stated for bounded uniformly continuous solutions) and §3.4.5, Theorem 6 (that it assumes `p, q > 0`): no legal copy; the one fetch attempted in this round failed on the network. The author states that both notes are from memory.
- The other texts listed as not verifiable in the previous review (Crandall–Evans–Lions 1984, Ishii 1987, Kružkov 1970, Bardi–Evans 1984, Bardi–Capuzzo-Dolcetta 1997, and the arrangement against Evans' contents) stand as there; the change does not touch their locators.

## Source issues

- none

## For the human reviewers

- Not tested: Evans' book carries 35 of the 50 locators; its text and contents could not be read. The author states that §5.1–§5.5 follow the order of Evans §3.4.1–§3.4.5, and that no dependency forces the order of §5.4 and §5.5.
- Not tested: the two locator notes added in this round (README §4.3, Cauchy bullet; §5.5, N-wave bullet) are, by the author's statement, written from memory without the book.
- Ownership: §1.1 states the gradient of the conjugate under strict and uniform convexity; ConvexAnalysisAndDuality (open, 4.2–4.3) plans the general form. Neither is on main; the author asks the maintainers to name the owner.
- Ownership: this roadmap consumes OptimalControlAndHamiltonJacobi (open) for §4.3 and §4.6, so it merges after it; both define first-order viscosity sub- and supersolutions, one for a single equation and one for a general `F`.
