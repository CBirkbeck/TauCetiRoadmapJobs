# Review of TensorInductionAndFiniteGroupInputs (pull request #2908 at 5e8e41b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of 6.1, 6.2, 7.1 and 9.1 was recomputed (by hand for Layers 6 and 7, and by an exact computation with differential operators for 9.1 (a)–(h) and (j), `n ≤ 4`), and none failed; the supplier citations resolve on main and the Lean file elaborates with `sorry` as its only warning. There are one small correction (the pull request's description omits a supplier) and three format notes, none blocking. Two things are left to the human reviewers: the formal proof that Layers 6 and 9 are attributed to could not be read, so its locators, its licence and the wording against it are unchecked, and it is not a refereed source.

## C01 — The description lists four supplier roadmaps; the README consumes five

A reader of the description expects the README's supplier contracts to stop at four roadmaps. The description says "The suppliers are Mathlib, Tau Ceti and four roadmaps on main: InductionRestriction, SchurWeyl, ClassicalGroups and ArithmeticGaloisRepresentations", but the head has a fifth contract, "From TauCetiRoadmap.CharacterTheory" (§0.2, the Hermitian form of the pairing, used in 6.2 (a); README line 404, and the *Needs:* line of 6.2, line 158). CharacterTheory is on main, so nothing is wrong with the dependency: the text would read "five roadmaps on main: …, ArithmeticGaloisRepresentations and CharacterTheory (§0.2)".

The validation sentence of the same paragraph is also written for an earlier state: at this head the candidate merge order lists the roadmap (after its suppliers), and the only files changed outside the folder are the three of the family index.

## N01 — Layers 7 and 9 have no statement in `Suggested.lean`, although the docstring says 9.1 is statable

The module docstring calls 7.1 and 9.1 "not headlines" and states neither; it also says the identities of 9.1 "are statable there". These are the sign-and-shift identities where a formal statement would catch most (a wrong shift in (d) or (e) is invisible in prose). Would the author state one or two of them, for example the centrality of `qdet(u)` (9.1 (c)) and the Jacobi identity (9.1 (e)), in an arbitrary `ℂ`-algebra? The same question for the explicit expression of 6.1 (b), which the Summary gives as part of headline (1) and the docstring lists as statable and not stated.

## N02 — The last Check of 9.1 uses a model that is not faithful for `n ≥ 3`; a third set of variables makes it so

With `E_{ab} = x_a∂_{x_b} + z_a∂_{z_b}` the polynomials in `x, z` contain only the `GL_n`-types `V_λ` with `ℓ(λ) ≤ 2`. For `n = 3`, `qdet(2)` has eigenvalue `(2 + λ₁)(1 + λ₂)·λ₃`, so it acts by `0` on all of them while it is nonzero in `U(𝔤𝔩₃)`: an identity checked in this model for `n = 3` is checked modulo a nonzero kernel. Adding a third set, `E_{ab} = x_a∂_{x_b} + z_a∂_{z_b} + t_a∂_{t_b}`, gives every polynomial type for `n = 3`. I reran the row form and column antisymmetry of (a), the expansions of (b), (c)–(h) and (j) for `n = 3` in that model: no failure. The Check could say "three sets of variables for `n = 3`".

## N03 — 9.1 (j) does not say over which `u, v` the exchange relation is assumed

"with `(u − v)·[t_{ab}(u), t_{cd}(v)] = …` for all indices" quantifies the indices only (line 290). The route uses the relation at `(Y + 1, Y)`, `(Y, Y + 1)`, `(Y + 1, Y′)`, `(Y′, Y)` and their negatives; "for all `u, v ∈ ℂ` and all indices" would say it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.1 (a), trace on `H` | `h ∈ H`, transversal `x^i`; `ℤ/2 ⊃ 1` | `∏ψ(x^{−i}hx^i)`; equals `∏ψ(F^i h)` since `F^l` is conjugation by `x^l ∈ H` | holds | none |
| 6.1 (a), trace off `H` | `g ∉ H`, one `l`-cycle; `x^i = g^jh′` | `x^{−i}g^lx^i = h′⁻¹g^lh′`, so trace `ψ(g^l)`; class function on `Ĝ` via `y = h″g^j` | holds | none |
| 6.1 (b), explicit formula | `l = 2` and `l` odd, `g ∉ H`; `Ĝ = ℤ/2`, `ψ = −1` | `(−1)^l s(g) = −1` both cases; `ℤ/2`: left `(1, −1)`, right `s = (1, −1)`; without `s`: `(1, 1)` | holds | none |
| 6.1 (b), orbit sums | shift by `j` on a non-constant word | `∏_iψ_{w_{i+j}}(F^ih) = (⊗ψ_{w_i}∘F^i)(F^{−j}h)`, sum over `j` is `Ind` at `h` | holds | none |
| Lean `trace_tensorInducedRepresentation_of_index_prime` | binders against 6.1 (a); `conjNormal (x^i) h = x^ihx^{−i}` | `H.Normal`, `l.Prime`, `index = l`, `x ∉ H`, transversal `range x^i`; trace on finite-dimensional `⨂_{G⧸H} V` | agrees with README | none |
| Lean `tensorInducedClassFunction_mem_virtualCharacters` | `ψhat` fixed on `H` by `hin`, off `H` by `hout` (`g^l ∈ H`) | hypotheses determine `ψhat` completely; conclusion membership in `virtualCharacters ℂ G` | not vacuous, agrees | none |
| 6.2 (a) | `Ĝ = ℤ/4`, `H = 2ℤ/4`; count of extensions | `c = ρ(x²)⁻¹A² = −1`, `A = ±i`, `A² = −1 = ρ(x²)`; `⟨Ind χ′, Ind χ′⟩ = l` forces `l` distinct `χ̃ε^j` | holds | none |
| 6.2 (a), coset orthogonality | Fourier inversion over `ℤ/l` | `l⁻¹Σ_iζ^{ij}c_i = 0` for all `j` gives `c_i = 0`; `= δ_{j0}` gives `c_i = 1` | holds | none |
| 6.2 (b), (b′) | `S₃ ⊃ A₃`, `X = 1 + ρ`; `H = 1`, `Ĝ = ℤ/l`; `(1 + η̃)/√2` | `X = 1` on transpositions, norm `3·1/3 = 1`; `σ(b)σ(b)‾ = 1`; non-integral: norm `(2 + 0)/2 = 1`, two coefficients `1/√2` | holds; integrality needed | none |
| 6.2 (c) | `S₃`, `Y = ω + ω²` | `⟨X|_H, Y⟩ = 2 ≡ 0 mod 2`, `1_H ∉ Y`; mod `(1 − ζ)`: pairing `≡ b·m_Y(τ₀)`, `(1 − ζ) ∩ ℤ = lℤ` | holds; condition needed | none |
| Lean `exists_rootOfUnity_mul_extension_eq_on_coset` | each clause against 6.2 (b), (b′), (c) | coset `h·x`; `b ∈ ℚ⟮ζ⟯`, `IsOfFinOrder b`; `l ∤` as `∀ m : ℤ, … ≠ l·m`; constituent as pairing `≠ 0` | agrees with README | none |
| 7.1, action and decomposition | left action; `x_{ij}`; `(n, m, d) = (1,2,2), (2,2,2), (2,3,2)` | `x_{ij} ↦ Σg_{ki}h_{lj}x_{kl}`: standard ⊗ standard; `3 = 1·3`, `10 = 9 + 1`, `21 = 18 + 3` | holds | none |
| 7.1, highest weight line | upper Borels, torus | `Δ_i(ᵗgXh) = (g_1⋯g_i)(h_1⋯h_i)Δ_i`; `Δ_λ` has weight `(λ, λ)`; agrees with the square case on main after `g ↦ ᵗg⁻¹` | holds | none |
| 9.1 relation | `T(u) = u + E` | both sides `(u − v)(δ_{bc}E_{ad} − δ_{da}E_{cb})`; same index pattern as MNO line 1448 relation | holds | none |
| 9.1 (a), (b) | `n = 2` by hand; `n = 3, 4`, 60 index pairs each | row form minus column form `= E₁₁ − E₂₂ − [E₁₂, E₂₁] = 0`; 0 failures | holds | none |
| 9.1 (c) | `n = 2` against `E₁₂`; highest weight vector; `n ≤ 4` all `E_{cd}` | both commutators `E₁₂E₂₂ − E₁₂E₁₁ − 2E₁₂`; only `σ = 1` survives: `∏(u − k + 1 + ν_k)`; 0 failures | holds | none |
| 9.1 (d), (e) | `n = 2` by hand, four sign cases of (e); `n ≤ 4` all indices | (d): difference `0`; (e): `±qdet(u + 1)` with sign `ε(i,q)ε(j,p)`; `j = p`: `E₁₂ + [E₂₂, E₁₂] = 0`; 0 of 256 fail | holds | none |
| 9.1 (f), (g) | `n = 1` by hand; `n ≤ 4`, `y = ∂_x`, `η = z` | `n = 1`: `[E₁₁, y₁] = −y₁`; (g) `ξ₁y₁x₁η₁ = η₁y₁ξ₁x₁`; 0 failures (6208 instances of each move identity at `n = 4`) | holds | none |
| 9.1 (h) | `m = 0` by hand; `n = 3` (12), `n = 4` (60 each) | `m = 0`: `T_{ee}(u)T_{e′e′}(u − 1) − E_{e′e}E_{ee′}`, the definition; 0 failures | holds | none |
| 9.1 (i) | `t = 1, 2`; `QP = 1` | star of two-term minor is row form of `M^b_a(w̄)` with both swaps; `[E′, E′]` reduces by `(QP)_{ba′} = δ` | holds | none |
| 9.1 (j) | entries `(1,1)`, `(1,2)`, `(2,1)`; `f(z)`; exceptional sets; the matrix of (g) | `t₁₁(u)t₂₁(v) = t₂₁(u)t₁₁(v)` at `u − v = 1`; `f = z(z − 1) − z = z(z − 2)`; `{Y ± 1}` and `{Y, Y + 2}` disjoint; `q = −C_{YY}C`, 0 of 16 relations fail | holds | none |

- Source locators checked against the text: 6 of MNO (Propositions 2.4, 2.5, 2.7 with (2.7.3), Theorem 2.10 with Steps 1–5, Remark 2.11; MolevNazarovOlshanski1996 lines 1321–1511). 32 locators of the formal proof and 2 of Howe not read.
- Library declarations opened at the pins: `TauCeti.virtualCharacters` (CharacterTable/VirtualCharacter.lean:127), `TauCeti.irreducibleCharacters` (CharacterTable/Table.lean:114), `Subgroup.tensorInducedRepresentation` (Tensor/Induction/Basic.lean:265), `eq_of_mem_rationalFunctions_of_forall_unitary` (PolynomialFunctions/Unitary.lean:124), `alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (Perm/Jordan.lean:154), `TauCeti.schurFunctor` (WeylModule/Basic.lean:545), `Representation.externalTensor` (Tensor/External.lean:85); Mathlib `FDRep.char_orthonormal` (Character.lean:248), `pow_eq_one_of_norm_eq_one` (Embeddings.lean:138), `MonoidHom.transfer` (Transfer.lean:146), `Unitary.toUnits` (Star/Unitary.lean:127).
- No pinned declaration states the trace of a tensor-induced representation, the extension of a stable character across a cyclic quotient, a column-ordered determinant or the duality of 7.1 (searched by object).
- Cross-roadmap citations resolved on main: InductionRestriction Layers 0, 2, 4, 5, 6, 7 with the three named items; SchurWeyl Layer 6, §§8.1–8.3; ClassicalGroups §§2.2, 2.3, 3.1, 3.3, 6.6 (determinant and the `u(u + 2)` Check); ArithmeticGaloisRepresentations §7.1 (trace formula, Asai count); CharacterTheory §0.2; AutomorphicLFunctionsAndLocalFactorsPartII §4.4. Consumer citations in FiniteReductiveGroups and BesselPoincareSeriesAndGramBounds at their open heads cite §§6.1, 6.2 and 9.1 of this roadmap.
- Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder other than the family index.
- Elaboration: `sorry` the only warning (three declarations). Elaborated types compared with the README statements with `#check`-level signatures: no binder lost, nothing changed. One-tactic probe (`simp`) closes none of the three.
- Automatic checks: all passed at this head.
- Overlap check: read BesselPoincareSeriesAndGramBounds, IntegralWeylModulesOfGeneralLinearGroups, FiniteReductiveGroups (open) and AutomorphicLFunctionsAndLocalFactorsPartII §4.4 (main); the square case `n = m` of 7.1 is owned by AutomorphicLFunctionsAndLocalFactorsPartII §4.4, the rectangular and unitary forms by this roadmap (Scope and ownership says so); the Capelli determinant and its centrality by ClassicalGroups §6.6; the first three consume this roadmap and own none of its objects.

Source independence: 5 passages compared with 1 source (MolevNazarovOlshanski1996: the definition of the minors, routes (c) and (j), the reference entry, the docstring), none shared beyond formulas; largest share FormalProof, 32 of 40 locators, text and contents not readable; contents compared with MolevNazarovOlshanski1996 §2 only: independent.

Research link: 7.1 is the `(GL_n, GL_m)`-duality of Howe (1989, 1995); 9.1 (c), (j) are the quantum determinant of Molev–Nazarov–Olshanski (1996); Layers 6 and 9 are stated as inputs of Alpöge's formal proof (2026) of the Riemann hypothesis for Dirichlet L-functions. Rests on the README's references and on MolevNazarovOlshanski1996 §2.

## Not verifiable

- The 32 locators into [FormalProof] (file and declaration names in Layer 6, 7.1, 9.1 and Scope and ownership), and the paragraph "The form of the formal proof": the repository could not be read through the sources service (the cited file paths returned "not found" on the branches tried, and its host is in no licence class).
- Howe 1989 and Howe 1995 §2.1 (7.1): the publisher's page is in no licence class; no other legal copy was looked for. The statement of 7.1 was checked independently of them.
- The Check of 6.1 on the permutation modules of `GL₂(𝔽_{2^l})`: an instance of 6.1 (a), not recomputed.

## Source issues

- none

## For the human reviewers

- **Scope.** The source named for 6.1, 6.2 and 9.1 is [FormalProof], a Lean formalization announced 20 November 2026 (README References), not a refereed text; 7.1 and 9.1 (c), (j) also cite Howe 1989/1995 and Molev–Nazarov–Olshanski 1996.
- **Licence.** The licence of the [FormalProof] repository was not established, and `Suggested.lean` could not be compared with it for adapted declarations.
- **Not tested.** [FormalProof] has 32 of the README's 40 source locators; its text and layout could not be read, so wording and arrangement were checked against MolevNazarovOlshanski1996 only. 9.1 gives its source as "[FormalProof], clause by clause".
