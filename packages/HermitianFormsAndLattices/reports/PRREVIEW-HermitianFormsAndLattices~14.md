# Review of HermitianFormsAndLattices (pull request #3027 at 6f088b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 1217 changed lines since `b8f3652`. It checked that this head repairs the previous review's finding (the targets of 0.2 and 7.2 are restored as statements to prove, with their scope entries), the passages changed since then (0.2, 2.5, 5.1, 5.3 (c), 5.4, 6.5, 7.2, the scope and the supplier contract), the fifteen seeded sections against Kirschmer, Borel, Rapinchuk and Serre and against the general-roadmap sections they cite, the dependency check and the elaboration of `Suggested.lean`. No finding remains, so the folder is accepted. There is one small correction, not blocking (0.2 still describes ReductiveGroups §9D.1 as restricted to characteristic `≠ 2`, which it no longer is at this head), and one question about the description. The human reviewers' decision on published theorems was applied to 3.4 and 5.3; nothing else is left for a human.

## C01 — 0.2 describes ReductiveGroups §9D.1 as a statement in characteristic `≠ 2`, but at this head §9D.1 is stated over every field

A reader of 0.2 is told that the structure of `U(V)` in characteristic two, for a field `E`, has no home and is "this roadmap's own formulation" (Origin, line 310), and that the `*Corollary of:*` line covers the clauses only "when `E` is a field of characteristic `≠ 2`" (line 327). At this head ReductiveGroups §9D.1 opens "Let `k` be a field, `K/k` a separable quadratic field extension" (its line 6032), with no restriction on the characteristic, and its route treats characteristic two explicitly (line 6049). So the four clauses of the `*Corollary of:*` line are corollaries of §9D.1 in characteristic two as well.

The same description stands in four more places: the Origin of 0.2 (lines 309–311), the `*Corollary of:*` line itself ("for a separable quadratic field extension in characteristic `≠ 2`", line 323), "Owned here" ("for a field `E` of characteristic `≠ 2` the clauses …", line 4254) and the supplier contract "From TauCetiRoadmap.ReductiveGroups" (line 4507). The smallest change is to drop "in characteristic `≠ 2`" from the description of §9D.1 in these places and "of characteristic `≠ 2`" from the clause that says when the corollary applies. What stays this roadmap's own in 0.2 is then the word outer, absolute almost simplicity for `n ≥ 2`, the centre, the section `s_x`, and the whole structure for `E = F × F`. Whether the Origin keeps "published for a field `E` of characteristic `≠ 2`" for the printed source is the author's to say.

## Questions for the author

- Does the description say that this roadmap gains PotentialAutomorphyDworkMotivesPartII §0.7 as a supplier (used in 1.5), that 5.3's target becomes the bound `h_E·N^{[E : ℚ]}` for the congruence levels of a unimodular lattice, and that 3.4 now states the coherence criterion in dimension one? The previous review asked for a sentence on these. The part of the description I could read (through the first paragraph of "General theorems first") names this roadmap only for 7.1 and ThetaSeries Layer 9; the copy I was given breaks off there, so I could not check the rest.

## Previous findings

- R01 — repaired. 0.2 again has the structure as its target: "Prove that `U(V)` is connected reductive, with centre `U(1)` embedded as scalars; for a field `E` it is an outer form of `GL_n` split by `E`" (line 329), with the clauses of §9D.1 named in a `*Corollary of:*` line and "their reductive structure" back in "Owned here" (line 4254). 7.2 again has the genus average as its target: "Prove that the genus average … has, at every totally positive definite `T`, the Fourier coefficient `α_∞(L, T)·∏_v α_v(L, T)`" (line 4163); the mean-value identity is now "*The form of the formal proof.*", and "the Fourier coefficients of their genus averages (7.2)" is in "Owned here" (line 4284).
- C01 — repaired. 5.1's Origin now reads "adapted from Borel (1963), §2.1 and Proposition 2.3 … the classes in the genus of a rational quadratic form as the double cosets of its adelic orthogonal group" (line 2274), which is what Borel line 283–320 states; the Kirschmer §10.1 locator is gone from the Origin and from the References.
- C02 — not checked in full: see the question above.
- N01 — repaired. The Conventions now say "the route written here proves it, beside the deduction from the theorem that its `*Corollary of:*` line names" (line 236), and 2.5's Origin says "(f) is adapted from weak approximation, Platonov and Rapinchuk (1994), Chapter 7: here for `U(V)`" (line 835).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.2 target (restored) | `n = 0, 1`; characteristic two; `E = F × F` | `n = 1`: `SU` trivial, `s_x = id`; `n = 0`: `det` not onto; char 2: `Tr h(x, y) = 0` for all `x, y` forces `h = 0`; split: `U(1) ≅ G_m`, `det` rational | holds | none |
| 0.2 `*Corollary of:*` line | ReductiveGroups §9D.1 at this head | §9D.1: "Let `k` be a field", no characteristic hypothesis (line 6032); 0.2 says characteristic `≠ 2` | description out of date | C01 |
| 1.1 (seeded) | `𝔽_4/𝔽_2`; `ℚ(i)`: `⟨1⟩ ⊥ ⟨2⟩`; split extension of a pair `(f_1, f_2)` | `(1, 1)` isotropic, `1 + 1 = 0`; `2 = N(1 + i)`; `f_1` maps `W_1 ∩ W_2^⊥` onto `W_1′ ∩ W_2′^⊥`, so `g ∈ GL(V_1)` exists; Kirschmer Thm 2.1.4 (line 406) | supported | none |
| 2.1 (seeded) | `ℚ_3(i)`: `⟨1, 1⟩`, `⟨1, 3⟩` | `−1` a norm: hyperbolic; `−3` of odd valuation: anisotropic; Kirschmer Thm 3.2.3, Cor. 3.2.4 (line 995–1013) | supported | none |
| 2.2 (seeded) | `ℂ/ℝ`: `⟨1, −1⟩`; split real place, `n = 3` | `(1, 1)` isotropic, signature `(1, 1)`, `det = −1 = (−1)^q`, Witt index `min(1, 1) = 1`; split: `⌊3/2⌋ = 1` | holds | none |
| 2.3 (seeded) | split, `⟨1, 1⟩`; `n = 3` | `−1 = N((1, −1))`, so `⟨1, 1⟩ ≅ H`; Witt index 1, kernel `⟨1⟩`; MetaplecticAutomorphicForms §3.2a states `A ⊕ A^∨`, `GL(A)` | supported | none |
| 2.5 (seeded; Origin changed) | (d) `S = {v}` split, `n = 2`; totally definite, `S = ∞`; (f) `g = −1` | `SL_2(F_v)` noncompact: applies; `SU(V)(F)` discrete in `SU(V)(𝔸_f)`: fails, as the Check says; `1 + ζg = 1 − ζ` invertible for `ζ ≠ 1`; Rapinchuk Thm 2.3, p. 12 (line 565–571) | supported | none |
| 3.3 (seeded) | `n = 1`, `ℚ(i)/ℚ` | torsor classes of `U(1)`: `F^×/N(E^×)`; `⟨1⟩`, `⟨3⟩` differ at `3` (odd valuation, inert); injectivity is the Hasse norm theorem | holds | none |
| 4.0 (seeded) | rank one, `h(e, e) = ϖ`, inert | `L^∨ = ϖ^{−1}L`, `𝔳(L)O_E = ϖO_E = 𝔄^n`; `N(𝔄)^n = ϖ²O_F ≠ 𝔳(L)`; GeometryOfNumbersAndQuadraticArithmetic §§2.2.6, 2.7.4 state the cited clauses | holds | none |
| 4.3 (cites §2.7.5 (d)) | `ℚ_2(i)`, hyperbolic plane | every `h(x, x) ∈ 2ℤ_2`, scale `O_E`: no modular line; §2.7.5 (d) at this head: rank one or two | agrees | none |
| 4.4 (seeded) | `ℚ(√−3)`, `V = ⟨1, 2⟩` at `3` | `(−2, −3)_3 = (−2/3) = 1`: `V_3` hyperbolic, so `L_3` not norm-maximal; Kirschmer L. 3.5.2 one genus (line 1529) | supported | none |
| 4.11 (seeded) | `ℚ(i)`, `L = O_E ⊕ 2O_E`, `U = E(1, 1)` | `M = ⟨8⟩`, `#A_M = 64`; `[O_E² : M ⊕ M′] = 64`, `[O_E² : L] = 4`, index `16`; `64·64 = 16·16²` | holds | none |
| 4.13 (seeded) | `ℚ(√−5)`, `M = (2, 1 + √−5)`, `B = 2`; `ℚ(i)` | `λ_n(O_K) ≤ n/(√n·|d_K|^{−1/n}) = √n·rd(K)`; sizes `2, 2√5, √6` ≤ `16·√20·2 ≈ 143.1`; `ℚ(i)`: bound `16·2 = 32 < 1000` | holds | none |
| 5.1 Origin (changed) | Borel §2.1, Prop. 2.3 | lattices from localizations (line 285–287); double cosets of `O(F)` ↔ classes in the genus (line 318–320) | supported | none |
| 5.2 (seeded) | `ℚ(√−3)`, `n = 1, 2, 3`; (e) `ℓ = 5`, `n = 2` | `6, 72, 1296` divide `24, 5760, 2903040`; `[E(ζ_5) : E] = 4 > 2`; Serre Thm 2′, §2.2 (line 464); Borel Thm 5.1 (line 608) | supported | none |
| 5.3 (c), totally definite dropped | `S = {w}` and `S = ∞ ∪ {w}`, indefinite `V` | `SU(V)(F_w)` noncompact gives density in the adeles off `S` in both cases; §2.4.7 (c) at this head has no definiteness hypothesis | holds, matches home | none |
| 5.4 `*Corollary of:*` (b) | §2.4.8 (b) at this head | "if `n ≥ 2`, every class of the special genus … chain of `w`-neighbours"; the quotation agrees | agrees | none |
| 5.9 (seeded) | `F = ℚ`; `ℚ(ζ_12)/ℚ(√3)`, `n = 16`, `n = 4` | ideals of norm `m` in degree `d`: at most `m^{log₂ d}` (`1` for `ℚ`); `16^{1/2} = 4 ≥ 1`; `n = 4`: `𝔭` odd at one inert place, product formula forbids | holds | none |
| 6.1a (seeded) | (a) `n = 1`, inert, `a = 0, 1, 2`; split `n = 1`; (b) `q = 3`; (c) `q = 2`, `n = 2` | `1 + 1/q`, `0`, `1 + 1/q` by direct count; split `(1 − 1/q)(a + 1)`; `2`, `8/3`, `4/3`, `16/9`; `3·(3/2) = 9/2`; Kirschmer Thm 4.2.4, p. 52, L. 4.2.9, p. 55 | supported | none |
| 6.4c (seeded) | exponents; `n = N_0 = 1` | `l + (s + l + 2)/2 + 2s = (5s + 2 + 3l)/2`; formal form `(1 + l) + l/2 + (s + l + 2)/2 + 2(2s + 1) = (9s + 8 + 4l)/2`; both sides `m_j·m_s` | holds | none |
| 6.5 Origin (changed) | `2k < n` against §6.4b | MetaplecticAutomorphicForms §6.4b states the mean value and covolumes for `2n < m`; the range `n ≤ 2k ≤ 2n − 2` is labelled adapted | consistent | none |
| 7.2 target (restored; seeded) | `ℚ(√−3)`, `L = O_E²`, `k = 1`; `T = 0` | `r(L, 1) = 6 + 6 = 12`, one class, `|U(L)| = 72`; `T = 0` at inert `2`, `N = 1`: `10/8 = 5/4`, not stable | holds | none |
| 7.2, form of the formal proof | `k = 1`, `n = 3` | `2k < n` holds; a case of 6.5 (a) and of §6.4b (a) | holds | none |
| `hermitian_congr_iff_forall_place`, `exists_hermitian_localizations_iff` (docstrings changed) | elaboration; complex place | types unchanged; at a complex or split place every determinant is a norm, so only inert real and nonsplit finite places count | ok | none |

- Source locators checked against the text: 12 (Kirschmer Thm 2.1.4, Thm 3.2.3, Cor. 3.2.4, L. 3.5.2, Thm 4.2.4, L. 4.2.9; Borel §2.1, Prop. 2.2, Prop. 2.3, Thm 5.1; Rapinchuk Thm 2.3, p. 12; Serre §2.2, Thm 2′). Kirschmer L. 3.5.3, L. 4.2.5, Cor. 5.1.4 and Thm 5.4.14 were located at their numbers and pages, not reread.
- Library declarations: none opened anew; the three declarations of `Suggested.lean` use Mathlib's `HeightOneSpectrum.adicCompletion`, `InfinitePlace.Completion` and `Algebra.TensorProduct.map`, and elaborate.
- Cross-roadmap citations resolved at this head: GeometryOfNumbersAndQuadraticArithmetic 2.2.6, 2.4.7, 2.4.8, 2.5.7, 2.7.4, 2.7.5, 2.7.7, 2.9.3a, 2.9.4a, 2.9.4b, 2a.1–2a.5, 3.2.9, 4.4.13; ReductiveGroups §9D.1; ReductiveGroupsPartII RG2.3.5a; MetaplecticAutomorphicForms §§3.2a, 6.4b; FiniteGroupInvariants §10.2a; AdelicAlgebraicGroups §4.2a; ThetaSeries §§9.1 (9A), 9.2 (9B); PotentialAutomorphyDworkMotivesPartII §0.7 (on `main`).
- Record comparison: no layer or heading is removed, retitled or added; one supplier heading is added. 0.2 and 7.2 keep their targets. The general clauses of 3.4 and 5.3 are in GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7, which state them in full (decision).
- Supplier changes since the previous review that this roadmap quotes: §2.4.7 (c) and §2.4.8 (b) lost "totally definite" and the quotations in 5.3 and 5.4 follow; §2.7.5 (a) now covers every place and 4.3 still cites (d) correctly; §9D.1 lost its characteristic hypothesis (C01).
- Automatic checks: every check passed. Dependency check output: `depcheck: 129 roadmaps, 1444 edges, 0 problem(s)`. Elaboration of `Suggested.lean`: two `sorry` warnings, lines 66 and 113, nothing else. `hermitian_congr_iff_forall_place_of_cm` is proved from the first theorem and says so; the three elaborated types keep every binder and agree with README 3.1 and 3.2.
- Headline theorems: Landherr's theorem (3.1, 3.2) is stated; `τ(U(V)) = 2`, the mass formula and Siegel's main theorem are named in the module docstring with the carriers they lack.
- Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, GeometryOfNumbersAndQuadraticArithmetic. The general Hermitian theory (Witt, local and global classification, Landherr, special genera, neighbours, local densities) is owned by GeometryOfNumbersAndQuadraticArithmetic and cited here through `*Corollary of:*` lines; `τ(G_m) = 1` and quotient measures are owned by OrbitMeasuresOnAdelicGroups; ThetaLiftsForDefiniteUnitaryGroups only consumes (its line 3104 names this roadmap as owner of Hermitian spaces, lattices and genera).

Source independence: changed passages only; the 1080 added lines were compared mechanically (runs of 7 words) with 6 sources (Kirschmer, Cho, Rapinchuk, Jacobson, Borel, Serre) and 8 passages were read beside their locators; nothing is shared beyond titles and forced phrases (the longest, 10 words, names the classes in the genus of a rational quadratic form, Borel line 39); largest share Kirschmer, 39 citations in the layers; contents not compared, because the change adds, removes or reorders no layer.

Research link: Layers 5–7 are the Hermitian mass formula, local densities and Siegel's main theorem (Shimura 1964, 1997; Gan–Hanke–Yu 2001; Weil 1965; Braun 1941), used by the family's theta lifts on definite unitary groups in the formal proof of GRH for Dirichlet L-functions; rests on the README's overview and labels and on Kirschmer 2016, Chapter 4.

## Not verifiable

- Scharlau (1985), Chapters 7 and 10 (1.1, 3.1, 5.9); Platonov–Rapinchuk (1994, 2023), §2.3.3, Propositions 2.35 and 2.36, Chapter 7 (0.2, 2.5, 3.3); O'Meara (1963), §§81–82 (4.0); Nikulin (1980), Propositions 1.4.1 and 1.5.1 (4.11); Cassels (1959), Chapter V, Lemma 8 (4.13): no legal copy among the texts available; the clauses were checked by computation and through Kirschmer or the home sections.
- Shimura (1964, 1997), Gan–Yu (2000), Gan–Hanke–Yu (2001), Hironaka (1998), Jacobowitz (1962), Landherr (1936), Minkowski (1887), Weil (1965), Braun (1941), Cohen–Resnikoff (1978): not opened; 4.4, 6.1a and 7.2 were checked through Kirschmer's statements and quotations of them.
- The `*Method of the formal proof:*` labels and the names of the formal proof's declarations: the formalisation was not opened.
- The description of the pull request beyond the first paragraph of "General theorems first": the copy read breaks off there.

## Source issues

- none

## For the human reviewers

- The decision on published theorems in the general roadmaps was applied: 3.4's criterion for every `n` and 5.3's clauses (a)–(c) are cited from GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7, which state them in full at this head. 0.2 no longer needs it.
