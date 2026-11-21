# Review of EuclideanJordanAlgebras (pull request #2834 at d4be516)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every identity, Check, worked example and proof route I recomputed in the README is correct, the 30 theorems of `Suggested.lean` are true as elaborated in the degenerate cases I tried (zero algebra, `ℝ`, `ℝ²`, spin factors, `Herm₂`), and both blocking findings of the previous review are repaired. There are three small corrections and three format notes, none blocking. Faraut–Korányi, which carries 25 of the 32 source locators, could not be read, so those locators and the comparison of wording and arrangement with that book are left to the human reviewers, together with the Tau Ceti pin.

## C01 — Two of the four Tau Ceti modules that are absent at the pinned Tau Ceti carry no commit, and the opening says "Tau Ceti has" them

An implementer working at the pinned Tau Ceti (`2fd255d`) finds `TauCeti/Algebra/Jordan/` with `Derivation.lean` only, so the *Needs:* lines of §1.3, §2.1 and §2.2 point at declarations that cannot be opened there. The supplier contracts repair this for two modules ("The modules `Peirce` and `TraceForm` are Tau Ceti commits `9dee29bbef` and `cd517a2511`", line 844), and I confirmed on Tau Ceti's main branch that those commits exist and that the cited declarations say what the README assumes: `peirceSpace R c μ` is the `μ`-eigenspace of `LinearMap.mulLeft R c`, `traceForm R a b = mulTrace R (a * b)` with `mulTrace` the trace of `L_a`, and `traceForm_assoc` is `traceForm (a*b) c = traceForm b (a*c)`. Two modules are left out of that sentence: `TauCeti.Algebra.Jordan.Basic` (`mul_mul_mul_sub_add_add_eq_zero`), which is also new in commit `9dee29bbef`, and `TauCeti.Algebra.AlbertAlgebra.Compact` (`TauCeti.CompactAlbertAlgebra`), which is on Tau Ceti's main branch and not at the pin.

The smallest change: extend the sentence at line 844 to the four modules and say that they are later than the Tau Ceti commit this repository pins; and in the opening (line 29) say the same in a clause, since "Tau Ceti has the Peirce decomposition at one idempotent, the trace form …" is true of its main branch and not of the pin.

## C02 — In `simple_rank_one` the simplicity hypothesis is implied by the rank hypothesis

`simple_rank_one (hs : IsSimpleJordan J) (hr : rank J = 1)` (line 255 of `Suggested.lean`) holds without `hs`: `rank J = 1` gives a Jordan frame with one member, which is `1`; so `1` is primitive, and by §2.1 `J = J_1(e) = ℝ e`. The statement is true as written and agrees with §6.3; the hypothesis only hides that rank one already forces `J ≅ ℝ`. Either drop `hs`, or keep it and say in §6.3 that every Euclidean Jordan algebra of rank one is `ℝ`.

## C03 — The name "Koecher's theorem" is not in the source cited for it

§4.3 and the summary call the statement on unital order isomorphisms Koecher's theorem and cite Westerbaan–Westerbaan–van de Wetering, Proposition 36. That proposition (WWvdW2019 line 476) states and proves exactly this result, with the same route through sharp elements and orthogonality, but gives it no name and no attribution. Add a locator for the attribution, or say that the name is this roadmap's.

## N01 — The scope section does not name the roadmap it delimits itself against

The first bullet of "Scope and ownership" refers to "the roadmap on the mathematical foundations of quantum systems (its §1.6, §1.8, §2.1 and §2.3)" (line 799). That is QuantumFoundations, and the four sections exist at its open head with the content described; naming it lets a reader find it.

## N02 — Three Faraut–Korányi citations remain by chapter only

§1.1 ("Chapter II"), §5.1 and §5.2 ("Chapter I") give no result number, unlike the other twenty-two citations of the book. A result number for power-associativity, for the characteristic function with its transformation law, and for the Lie algebra of `G` would complete the set.

## N03 — The docstring of `spectralTrace` says "`0` when there is none"

Read after "every primitive idempotent", "none" looks like "no primitive idempotent"; the body returns `0` when no linear functional with value `1` at every primitive idempotent exists. "and `0` when no such functional exists" says what the definition does.

## Earlier findings

- R01 (the square root and the spectral trace were `sorry`; `sqrt` had lost its ring structure): repaired. Both are definitions by choice with their instances in the signature; `sqrt` elaborates to `{J : Type u_1} → [NonAssocCommRing J] → J → J`, and the two products on `ℝ` now give two functions.
- R02 (Tau Ceti modules absent at the pin): partly repaired; the commits are named for two of the four modules (C01). The sections that used the octonion and Hurwitz material are gone.
- C01, C04 (Hurwitz, Baez): the sections were removed with the rank-three classification; nothing left to correct.
- C02 (chapter-only citations): repaired except for three (N02).
- C03 (shared statements with the JB setting): repaired in substance, "The statements the two roadmaps share (the fundamental formula, Jordan inverses, `P(x) C ⊆ C`, …) are kept here on the carrier without a norm"; the roadmap is still not named (N01).
- C05 (continuity): repaired; `continuousOn_seqProd` is joint continuity on `C × J`, as §7.3 states.
- C06 (description): repaired; LieGroups Layer 2 is named and the pin is mentioned.
- N01, N02 (imports, docstrings, layer comments, Lean names in the README): repaired.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 homomorphisms, subalgebras, products | `t ↦ (t,0)`, `ℝ → ℝ²`; squares ⇒ products | image of `1` is `(1,0) ≠ e`; `2xy = (x+y)² − x² − y²` | holds | none |
| §0.2 models; `IsSpinFactor` | `Herm₂(ℝ)`; indefinite `b`; `Spin_1`; `n = 0` | `E∘X = X/2`, `X∘X = 1`; `(−1,0)+(1,0)=0`; `(t+u)(s+v)`, `(t−u)(s−v)`; inverse of `2` is `0` | holds; Lean product equals README product | none |
| §1.1 powers; `jpow` | zero ring; `ℂ` over `ℝ` | `x⁰ = 1 = 0`; `m_i = X²+1`, span of powers has dimension 2 | holds | N02 |
| §1.2 `spectralResolution`, `_unique` | zero algebra; `(2,2,−1)` in `ℝ³` | `n = 0`, empty sum; `p_2 = (1,1,0)`, `p_(−1) = (0,0,1)`, injective coefficients | holds | none |
| §1.3 `formallyReal_iff_exists_associativeForm` | zero ring; `ℂ`; `Herm₂(ℂ)` | both sides true; `1²+i²=0`; `Tr L_c = 1+½·2 = 2 ≥ 1` | holds | C01 (supplier) |
| §2.1 Peirce subalgebras; `IsPrimitive` | `q` with `p∘q = q` | `(p−q)² = p−2q+q`, `q∘(p−q) = 0`: Lean form equals README form | holds | C01 (supplier) |
| §2.2 Peirce decomposition of a system | `Herm₂(ℂ)`, `x = diag(2,−3)`; projections | `P(x)`: `4, −6, 9`; `L_x`: `2, −½, −3`; `4L_iL_j`: `1` on `J_ij`, `0` elsewhere | holds | C01 (supplier) |
| §2.3 `rank`, `card_frame`, `isGreatest_rank`, `spectralFrame` | zero algebra; `ℝ³`; `Spin_n` | frame set `{0}`, both ranks `0`; `3`; `2` | holds; Lean rank equals README rank | none |
| §2.4 `spectralTrace`, `spectralTrace_frame` | zero algebra; `ℝ³`; `Spin_n`, `u = 0` | chosen functional is `0`; `tr 3`, `det −4`; eigenvalue `t` twice, `tr = 2t`, `det = t²` | holds; functional unique since primitives span | N03 |
| §2.5 `sqrt`, `sqrt_spec` | `(4,0)` in `ℝ²`; `1`; `(3,(0,2))` | `(2,0)`, `(−2,0)` not in cone; `sqrt 1 = 1`; inverse `(3,(0,−2))/5`, `det 5` | holds | none |
| §3.1 `quadratic`, `fundamentalFormula` | route steps 1, 2 on `J_ij`; `Herm_n(K)` | `(λ_i+λ_j)/(2λ_iλ_j) = (λ_i⁻¹+λ_j⁻¹)/2`; derivative `−1/(λ_iλ_j)`; `P(x)y = xyx` | holds | none |
| §3.2 `spectralTrace_assoc`, `_pos` | derivation `[L_x,L_z]`; frame | `tr(x∘(z∘y)) = tr(z∘(x∘y))`; `B(x,x) = Σλ_i²` | holds | none |
| §3.3 `squares_selfDual`, `squareCone` | zero algebra; `Herm₂(ℝ)`; spin | `C = {0} = univ ∋ 1`; `a,d ≥ 0, ad ≥ b²`; `t ≥ ‖u‖`; `b(c,y²) = b(y_1,y_1)+½b(y_½,y_½)` | holds | none |
| §3.4 `Homogeneous` | `ℝ²`, `x=(2,3)`; `P(√y)P(√x)⁻¹` | `P((√2,√3))e = (2,3)`; `P(x^(−½))x = e`, `P(√y)e = y` | holds | none |
| §3.5 supports and faces | `[[1,1],[1,1]]`; `P((1,0))C` | support `½[[1,1],[1,1]]`; face `ℝ≥0 × 0`; source read | holds | none |
| §4.1 order-unit norm | `u = 2p − e`; `e/2` in `Herm₂(ℂ)` | `L_u = P(p) − P(e−p)`; `½ ≤ 1/√2 ≤ √2·½` | holds; supplier section found | none |
| §4.2 states and densities | `Spin_2`, `c = ½(1,(1,0))`, `x = (3,(0,2))` | `c∘x = ½(3,(3,2))`, `B(c,x) = 3 ∈ [1,5]` | holds; supplier sections found | none |
| §4.3 `effects`, `koecher` | `x ↦ (2x_1,x_2)`; `diag(1,½)`; uniqueness in §5.3 | not unital, not Jordan; `diag(0,½)` below both; source read | holds | C03 |
| §5.1 characteristic function | orthant; `g = diag(2,½)`; dimension 0 | `φ = 1/∏x_i`, minimizer `(1,…,1)`; `φ(ge₀) = 1`, `ge₀ ≠ e₀`; `φ = 1` | holds | N02 |
| §5.3 `koecherVinberg` | `V = 0`; `C = (−∞,0]`, `e < 0`; PSD at `e = diag(2,1)`; item 3 | `m = 0`; `xy/e`, squares `≤ 0`; `diag(1,0)² = diag(½,0)`; `L_(x³) = 3L_xL_(x²) − 2L_x³` | holds, unique by `koecher` | none |
| §6.1 `simpleDecomposition` | zero algebra; `ℝ⊕Herm₂(ℂ)` | no minimal ideal, empty sum internal; two ideals, `τ = B`, `2B` | holds | none |
| §6.2 `exists_peirceConstant` | `Herm₂(ℂ)`, spin `u=(0,w)`; `w = e−c_i−c_j+u`; table | `u² = ½B(u,u)e`; `w² = e`; `r(2r−1)`, `3+8·3 = 27` | holds | none |
| §6.3 `simple_rank_one`, `simple_rank_two` | rank 1; `Spin_1`; `Herm₂(ℂ)` | frame `{1}`, `J = ℝe`; `≅ ℝ²` not simple, so `n ≥ 2`; `≅ Spin_3`, `d = 2` | holds | C02 |
| §7.1 effect and sequential effect algebras | `[0,u]`; `a & 1` | `a+u ≤ u ⇒ a = 0`; `a|0 ⇒ a|1`, `a&1 = 1&a = a`; axioms agree with vdW2020 lines 553–558 | holds | none |
| §7.2 `commute_mulLeft_iff_exists_frame` | item 1 on `J_ij`; Pauli; item 4 identity | `((λ_i+λ_j)/2)² − (λ_i²+λ_j²)/2 = −¼(λ_i−λ_j)²`; `σ_x` against `0`; `2B(b∘q,b∘p) = ½B(b_½,b_½)` | holds | none |
| §7.3 `seqProd_*` (eleven) | `ℝ`; `p`, `q` in `Herm₂(ℂ)`; `a = diag(1,¼)`; `a = 0`; `p&p` | `3/8`; `p/2`, `q/2`; `[[½,¼],[¼,⅛]]`, `5/16`; `0 = 0`; `p²` | holds; source read | none |

- Source locators checked against the text: 5 (van de Wetering Proposition 3.9, Theorem 4.2, Proposition 4.3; Westerbaan–Westerbaan–van de Wetering Proposition 36; Lourenço Proposition 31); 27 not readable (below).
- Library declarations opened at the pin: Mathlib 12 (`IsFormallyReal`, `Mathlib/Algebra/Ring/IsFormallyReal.lean` 105; `two_nsmul_lie_lmul_lmul_add_add_eq_zero`; `SymAlg.sym_mul_sym`, `Algebra/Symmetrized.lean` 171; `ProperCone.innerDual`, `Analysis/Convex/Cone/InnerDual.lean` 55; `Matrix.charpoly_mul_comm`, 279; `hasDerivAt_exp_smul_const`, 382; `IsStarProjection`; `IsExposed`; `intrinsicInterior`; `Matrix.IsHermitian.eigenvalues`, `spectral_theorem`; the two matrix scopes); Tau Ceti 10 found (the seven Lie-subgroup names, `jordanInnerDerivation`, `derivationLieAlgebra`, `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`), 4 modules absent at the pin and read on Tau Ceti's main branch (C01).
- Cross-roadmap citations resolved: CompactQuantumMetricSpaces §0.1–0.3 (`IsOrderUnitNorm`, `stateSpace`, state restriction and extension), LieHighestWeight Layer 8 ("The formally real Albert supplier"), LieGroups Layer 2, VonNeumannAlgebras §12.J (Maps, Enriched), CStarAlgebras C2.4, all on main; QuantumFoundations §1.6, §1.8, §2.1, §2.3 at its open head.
- Dependency check: `depcheck: 173 roadmaps, 2003 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (30). The elaborated type of all 48 declarations was compared with the README: every theorem keeps the seven instances of the carrier; every definition binds what its body uses.
- One-tactic probe on a copy (`rfl`, `simp`, `simp` with all definitions unfolded, `infer_instance`, `exact?`): closes none of the 30 theorems. Every headline of the summary is stated; additivity of `&` (axiom 1) is linearity and is rightly absent.
- Duplication: no roadmap on main or open, and neither pinned library, states the spectral theorem for Jordan frames, Koecher–Vinberg, effect algebras or the sequential product.
- The automatic checks all passed at this head.

Overlap check: read QuantumFoundations, CompactQuantumMetricSpaces (the third list is empty); QuantumFoundations §1.6 states the fundamental formula, Jordan inverses and `U_a(A₊) ⊆ A₊` on the JB carrier of a Segal system, this roadmap on the finite-dimensional carrier without a norm, each its own owner as the scope section says; order-unit spaces and states are owned by CompactQuantumMetricSpaces Layer 0 and consumed here.

Source independence: 7 passages compared with 3 sources, none shared; largest share Faraut–Korányi, 25 of 32 locators; contents not compared with Faraut–Korányi, whose text and table of contents could not be read (by the README's own locators the layers do not run in the book's order: Layer 2 draws on its Chapters IV, III and II, Layer 5 on I and III, Layer 6 on III and IV).

Research link: The sequential-product layer states van de Wetering (2020), Proposition 3.9 and Theorem 4.2, in finite dimension; Koecher's theorem is Westerbaan–Westerbaan–van de Wetering (2019), Proposition 36; the faces of §3.5 are those Lourenço (2021) uses for error bounds on symmetric cones. Rests on the three texts read.

## Not verifiable

- Faraut–Korányi, *Analysis on Symmetric Cones*: all 25 locators, including those of the sampled §1.1, §2.1, §2.2, §2.4, §3.1, §3.3, §3.4, §5.3, §6.1 and §6.3; no legal copy (the publisher's page refused). The statements themselves were recomputed as in the table.
- Foulis–Bennett (§7.1) and Gudder–Greechie (§7.1): paywalled, cited by locator only; the five sequential axioms were compared with their restatement in van de Wetering, Theorem 4.2.
- §0.1 and §0.2 cite no external source; their Mathlib names were opened at the pin.

## Source issues

- none

## For the human reviewers

- **Pin.** The README builds on four Tau Ceti modules (`Algebra/Jordan/Basic`, `Peirce`, `TraceForm`, `AlbertAlgebra/Compact`) that are on Tau Ceti's main branch and absent at the pinned commit `2fd255d` (C01). Whether to advance the pin first is yours.
- **Not tested.** Faraut–Korányi carries 25 of 32 locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Licence.** `README.md`, "Provenance", names `euclidean-jordan` (the author's own, stated Apache-2.0) as a source to reuse and `jordanalgebra` (no licence, prior work only). Neither repository was opened; `Suggested.lean` was not compared with either.
- **Ownership.** LieHighestWeight Layer 8 (main) plans the spectral decomposition and three-element frames of the compact Albert algebra; §6.4 here proves the general theorems and leaves Layer 8's targets in place. QuantumFoundations §1.6 (open) states JB versions of §3.1 and §3.4.
