# Review of TensorInductionAndFiniteGroupInputs (pull request #2908 at f441f16)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. This head repairs the previous round's three findings. 9.1 (j) now has a route that holds: the fusion scalar is exactly `z(z − 2)`, and the opposite-algebra family covers the two values of `Y′` the first argument misses. Layer 8 is gone in favour of the Tau Ceti theorem, and 6.1 (a) is derived from ArithmeticGaloisRepresentations §7.1. I recomputed 6.1, 6.2 and 7.1 by hand and 9.1 (a)–(j) by exact computation, and everything holds. There is one small correction (6.1 (b), 6.2 and Howe 1989 still have no locator) and one format note, neither blocking. The provenance of the family is left for the human reviewers.

## C01 — 6.1 (b) and 6.2 still cite no source, and Howe 1989 is still cited without a locator.

I checked the routes of 6.1 (b) and 6.2 (a)–(c), and they are complete, so no stated result is left unsupported. Still, a reader cannot find either statement in the literature, and 7.1's first reference ("Trans. Amer. Math. Soc. 313 (1989)", line 160 and References) cannot be checked against a page. Three locators would settle this: one for the tensor induction of virtual characters, one for the extension of invariant characters across a cyclic quotient of prime order (a character-theory text), and a section or page for Howe 1989. The part of the earlier remark about 9.1 is settled: 9.1 now cites MNO with exact locators.

## N01 — The layers are numbered 6, 7 and 9, and the README never says why there are no Layers 0–5 or 8; one clause in the guide to the layers, saying that these are the numbers under which the family's roadmaps cite them, would answer the reader who looks for the missing ones.

## Earlier findings

- R01 — repaired. 9.1 (j) now has a route: the fusion of `R(1) = 2Π₁₂`, the scalar `f(z) = z(z − 2)` of `Π₁₂R₁₃(z)R₂₃(z − 1)Π₁₂`, and the family `Y ↦ t(−Y)` in the opposite algebra, for which "The two exceptional sets are disjoint" (line 269). It cites MNO Propositions 2.4, 2.5, (2.7.3) and Theorem 2.10, and I checked all three parts (Verified sound). The previous round's question, whether `q(Y)` commutes with `t(Y ± 1)` for a family with no regularity in `Y`, is answered by this route.
- R02 — repaired; it was deferred as D01, which this head resolves (below).
- R03 — repaired. The route of 6.1 (a) now begins "This is the case of a normal subgroup of prime index of the trace formula for tensor induction of ArithmeticGaloisRepresentations §7.1" (line 44). The *Needs:* line, the scope, the supplier contracts and the docstring of `trace_tensorInducedRepresentation_of_index_prime` cite it as well.
- C01 — partly repaired: 9.1 now cites MNO. The rest is C01 above.
- C02 — repaired: "InductionRestriction Layers 0, 2, 4, 5" and "Mathlib's `FDRep.char_orthonormal`" (line 119).
- C03 — repaired: "the centrality of `A_n(u)` (ClassicalGroups §6.6; …) gives the first clause" (line 253).
- C04 — repaired: the unitarian trick is now a step of the route of 7.1, through `TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary`, applied in `g` and then in `h` (lines 153–158).
- C05 — repaired: the docstring of `Suggested.lean` now names `Representation.externalTensor`.
- C06 — repaired: the description now names the three `sorry`'d declarations and says why 7.1 and 9.1 are not stated.
- N01 — repaired: line 74 reads `conj(φ′(hx))`.

## Deferred findings

- D01 — resolved: Layer 8 and its Lean restatement are gone. The scope cites the Tau Ceti theorem, and CongruenceModulesOfThetaLifts now cites that theorem instead of §8.1.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 6.1 (a) on `H` | `ℤ/4 ⊃ 2ℤ/4`, `x = 1`, `ψ(2) = −1`; `S₃ ⊃ A₃`, `ψ = ω` | `ψ̂(2) = (−1)(−1) = 1`, transfer `ψ(0) = 1`; `ψ̂(c) = ω(c)ω(c⁻¹) = 1` | holds |
| 6.1 (a) off `H` | `ℤ/4`, `g = 1`; route step `x^i = g^jh′` | `ψ̂(1) = ψ(2) = −1`, transfer `V(1) = 2`, `ψ(2) = −1`; `x^{−i}g^lx^i = h′⁻¹g^lh′` | holds |
| 6.1 (a) via AGR §7.1 | `h ∈ H` fixes all cosets; `F^l` inner | `∏ψ(F^{−i}h) = ∏ψ(F^{l−i}h)`; Lean's `x^i h x^{−i}` gives the same product | holds |
| 6.1 (b), sign | `ℤ/2`, `H = 1`, `ψ = 0 − 1` | `ψ̂ = (1, −1)`; formula `0 + s + (−1)·Ind(0) = s`; without `s`, the trivial character | holds; Check true |
| 6.1 (b), induced terms | `ℤ/2`, `H = 1`, `ψ₁ = 2`, `ψ₂ = 1` | `(4, 2) + (1, −1) − (4, 0) = (1, 1) = ψ̂` | holds |
| 6.1 (b), `l = 3` | `ℤ/3`, `H = 1`, `ψ = 0 − 1` | `ψ̂ = (−1, −1, −1)`; `(−1)³·s·1` with `s = 1`; two orbits of size 3, both vanishing | holds |
| 6.2 (a) extension | `ℤ/4 ⊃ 2ℤ/4`, `χ′(2) = −1` | `c = ρ(x²)⁻¹A² = −1`; `A = ±i`; extensions `x ↦ ±i`, no splitting | holds; Check true |
| 6.2 (a) coset norm | DFT `l⁻¹Σζ^{ij}c_i` | equals `δ_{j0}` for all `j` iff `c_i = 1` for all `i`; equals `0` for all `j` iff all `c_i = 0` | holds |
| 6.2 (b) | `S₃`, `X = 1 + ρ`; `ℤ/3`, `H = 1`, `X = ε` | coset values `1, 1, 1`, norm `1`, `b = 1`; `|ε(x)|² = 1`, `b = ζ ∈ ℚ(ζ)` | holds |
| 6.2 (b) integrality | `ℤ/2 × ⟨x⟩`, `(1 + η̃)/√2` | coset values `√2, 0`; norm `1`; two nonzero coefficients, not virtual | negative control true |
| 6.2 (c) | `S₃`, `Y = ω + ω²`; `ℤ/3`, `Y = 1` | `⟨X|_H, Y⟩ = 2`, `2 ∣ 2`, `1_H ∉ Y`; `⟨ε|_1, 1⟩ = 1`, `3 ∤ 1`, `τ₀ = 1 ∈ Y` | holds |
| 6.2 Lean | binders, quantifier order | `∃τ₀ ∃τ ∃b` before `∀Y`; `b ∈ ℚ⟮ζ⟯ ∧ IsOfFinOrder b`; `∀ m : ℤ, ⟨X|_H, Y⟩ ≠ l·m` | matches README |
| 7.1 dimensions | `(n, m, d) = (1,2,2), (2,2,2), (2,3,2)` | `3 = 1·3`; `10 = 9 + 1`; `21 = 18 + 3` | holds |
| 7.1 action, weights | `P(ᵗgXh)`, `b` upper triangular | linear forms `≅ ℂⁿ ⊗ ℂ^m`, both standard; `Δ_i(ᵗbX) = ∏_{k≤i}b_kk·Δ_i(X)`; `Δ_λ` has weight `λ` | holds |
| 7.1 unitary step | Tau Ceti `Unitary.lean:124`, in `g`, then in `h` | polynomial in `(g, h)` vanishing on `U × U` vanishes on `GL × GL`; same invariant subspaces and intertwiners | holds |
| 9.1 (a), (b) | `n = 2, 3`, sequences with repeats, `u = 7/3` | row form, column antisymmetry, first and third expansions: equal on test polynomials | holds |
| 9.1 (c) | all `c, d`, `n = 2, 3`; `n = 2` by hand | `[qdet, E_cd] = 0`; both commutators `E12E22 − E12E11 − 2E12`; only `σ = 1` survives on `v` | holds |
| 9.1 (d), (e) | all `i, l` and `i, q, j, p`, `n = 2, 3` | both sides equal; zero clause holds; `qdet(u)` in place of `qdet(u + 1)` fails | holds |
| 9.1 (f) | four identities, `y = ∂_x`, `η = z`, `n = 2, 3` | equal; flipping the sign in the first, or the shift `w − 1 → w` in the third, fails | holds |
| 9.1 (g) | random integer `x, ξ`, `n = 2, 3` | `qdet(u+1)C₂(u−1) + C_Y(u+1)C_X(u−1) = C_YY(u)C(u)`; with `−` instead of `+`, fails | holds |
| 9.1 (h) | `n = 3` (`m = 1`), `n = 4` (`m = 2`), random `e, e′, v` | three border expansions equal; last sign flipped fails | holds |
| 9.1 (i) | random `P`, `Q = P⁻¹`, `n = 2, 3`; adjoint by hand | `E′` relations hold, `qdet′ = qdet`, `C′ = C`; `Px` for `Qx` fails; adjoint follows from row form | holds |
| 9.1 (j) | `f(z)` on `(ℂ²)^{⊗3}` at `z = 0, 1, 2, 3, −1, 5/2`; `t = u + E`, `𝔤𝔩₂`, `Y = 4/7` | `f = 0, −1, 0, 3, 3, 5/4 = z(z − 2)`; both matrix identities hold, `q = qdet(Y + 1)`; `t(Y)^T𝐉t(Y+1)` fails | holds |
| 9.1 (j), opposite family | `s(Y) = t(−Y)` in `B^op`; exceptional sets | relation from `(−u, −v)`, `(−v, −u)`; `q_s(−Y−1) = q(Y)`; `{Y ± 1}`, `{Y, Y + 2}` disjoint | holds |
| Lean context | `#check @name` for all three | elaborated types carry every README hypothesis; none dropped; `simp_all` leaves 6.1 (b) open | sound |

- Source locators checked against the text: MolevNazarovOlshanski1996 (1.1.1) line 677, Propositions 2.3–2.5 lines 1247–1344, Proposition 2.7 (2.7.3) lines 1346–1357, Remark 2.8 lines 1386–1396, Theorem 2.10 Steps 1–5 lines 1409–1487, Remark 2.11 lines 1488–1519.
- Library declarations opened at the pins: Tau Ceti `LinearAlgebra/Matrix/GeneralLinearGroup/PolynomialFunctions/Unitary.lean:124`, `RepresentationTheory/Tensor/Induction/Basic.lean:265` (no trace lemma in that directory), `CharacterTable/VirtualCharacter.lean:127`, `CharacterTable/Table.lean:114`, `GroupTheory/Perm/Jordan.lean:154`, `Tensor/External.lean:85`, `ClassicalGroups/WeylModule/Basic.lean:545`. Mathlib `Algebra/Star/Unitary.lean:127`, `NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138`, `RepresentationTheory/Character.lean:248`, `GroupTheory/GroupAction/Jordan.lean:370, 408`, `GroupTheory/Transfer.lean:146`.
- Cross-roadmap citations resolved on main: InductionRestriction Layers 0, 2, 4, 5 and 6, whose ids and subjects are also kept at the head of InductionRestriction's open revision; SchurWeyl §§8.1–8.3 and Layer 6; ClassicalGroups Layers 2, 3 and §6.6, where `A_k(u)` has the same column order and shifts as `qdet(u)`; ArithmeticGaloisRepresentations §7.1; AutomorphicLFunctionsAndLocalFactorsPartII §4.4, the square case only. Consumers resolved at their open heads: FiniteReductiveGroups §5.11 (d), (e); ThetaKernelsForUnitaryDualPairs §3.46 (iii); ThetaLiftsForDefiniteUnitaryGroups §2.1; BesselPoincareSeriesAndGramBounds §§5.13d, 5.18a, 5.18e (its *Needs:* line for 5.18a lists 9.1 (b), (c), (e)–(j), as the README says).
- Automatic checks: every check passed, so none was set aside. Dependency check output: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`, with no UPWARD or CYCLE line. All suppliers are on main, and the merge order places the roadmap at position 444.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly three warnings, `declaration uses sorry`, at lines 59, 74 and 90. The elaborated types match the README.
- Computation: exact rational arithmetic in pure Python. 9.1 (a)–(i) were checked on the realisation `E_ab = x_a∂_{x_b} + z_a∂_{z_b}`, applied to random polynomials. 9.1 (j) was checked on `(ℂ²)^{⊗3}` and on `t(u) = u + E` for `𝔤𝔩₂`. Every negative control failed, as it should.
- Ownership: there is no second owner of 6.1 (b), 6.2, the case `n ≠ m` of 7.1 or 9.1, on main, at the open heads, or in Tau Ceti. Tau Ceti has no trace formula for tensor induction, no Cauchy decomposition and no quantum determinant at the pin.

Overlap check: I read BesselPoincareSeriesAndGramBounds, FiniteReductiveGroups, IntegralWeylModulesOfGeneralLinearGroups, InductionRestriction and RepresentationTheory (open), and CharacterTheory, ClassicalGroups and RepresentationTheory (main), and by object ArithmeticGaloisRepresentations and AutomorphicLFunctionsAndLocalFactorsPartII. The shared objects and their owners are:
- the trace formula of 6.1 (a): ArithmeticGaloisRepresentations §7.1, cited;
- the centrality in 9.1 (c) and the Capelli determinant: ClassicalGroups §6.6, cited, and IntegralWeylModulesOfGeneralLinearGroups also consumes it from there;
- the square case of 7.1: AutomorphicLFunctionsAndLocalFactorsPartII §4.4, cited in the scope.

The family's open roadmaps consume this one and own none of its objects.

Source independence: 9 passages compared with 1 source (the README's prose for 9.1: its notation, (a), (c), (j) and their routes, and the Layer 9 introduction and the 9.1 docstring sentence, against MolevNazarovOlshanski1996 §§1.1, 2.3–2.11). Nothing is shared beyond formulas. The largest share of the locators is MolevNazarovOlshanski1996's, 11 of 13. Contents compared with MolevNazarovOlshanski1996 (§§0–7: Yangian, quantum determinant, twisted Yangians, Sklyanin determinant, quantum contraction): independent. Only Layer 9 touches its §2, and the items of 9.1 do not follow its sequence. Howe 1989 and 1995 could not be read.

Research link: Layer 7 is Howe's `(GL_n, GL_m)`-duality (Howe 1989, 1995), the input of the compact theta correspondence in the family. Layer 9 is the quantum-minor calculus of the Yangian of `𝔤𝔩_n` and its Capelli evaluation (Molev–Nazarov–Olshanski 1996, §2), which the family's Bessel-period roadmap consumes. This rests on the README and on MolevNazarovOlshanski1996 §2.

## Not verifiable

- Howe 1989, *Remarks on classical invariant theory* (7.1): the sources service, given the DOI, found only the AMS landing page, on a host in no licence class. The README gives no locator to check in any case.
- Howe 1995, *Perspectives on invariant theory*, §2.1 (7.1): the sources service found no legal copy.

## Source issues

- **Misprint** in MolevNazarovOlshanski1996 at Proposition 2.4, proof, p. 24 (line 1329): the source says that multiplying (2.4.1) by `A_N` on the left proves (2) a second time; it should say that this proves (3), the equality with `A_N T_N ⋯ T_1 A_N`; affects nothing.

## For the human reviewers

- Provenance: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–13) and the description say that the family follows a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions, announced on 20 November 2026. 6.1 (b) and 6.2 cite no published source.
