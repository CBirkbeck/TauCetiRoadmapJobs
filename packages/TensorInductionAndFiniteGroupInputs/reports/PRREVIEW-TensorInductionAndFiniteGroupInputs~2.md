# Review of TensorInductionAndFiniteGroupInputs (pull request #2908 at 469aed5)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TensorInductionAndFiniteGroupInputs/`
**Verdict:** needs changes

**Summary.** Changes are needed for three P2 findings. 9.1 (j) is stated with neither a route nor a source. Jordan's theorem 8.1 is already a theorem of the pinned Tau Ceti, yet this roadmap owns it and plans its proof. 6.1 (a) restates the prime-index case of the tensor-induction trace formula that ArithmeticGaloisRepresentations §7.1 on main owns, without citing it. The rest of the mathematics holds when recomputed: the routes of 6.1 and 6.2, the Checks, and identities (a)–(i) of 9.1, which I checked by exact computation. There are six small corrections and one format note. Two things are left for the human reviewers: the provenance of the family, and the three cited texts, none of which could be read.

## R01 (P2) — 9.1 (j) is asserted for arbitrary families `t(Y)`, `Y ∈ ℂ`, with neither a route nor a source.

BesselPoincareSeriesAndGramBounds §5.18a consumes (j), but the roadmap gives an implementer neither a proof nor a place where the statement is proved in this generality. The route says only that (j) "is the quantum determinant of the Yangian of `𝔤𝔩₂`; its route is not given here" (lines 295–296). Molev–Nazarov–Olshanski 1996 is named at line 297 for "the framework", with no locator, and the References carry no Yangian source. Every other clause of 9.1 has a route, and I recomputed (a)–(i) (Verified sound). (j) is the one target with no support. Its hypothesis is also not the setting of the Yangian identities, which hold for formal series or polynomials in the spectral parameter: (j) quantifies over a family with no regularity in `Y` and claims that `q(Y)` commutes with every `t_ab(Y′)`, including `Y′ = Y ± 1` (see the question below).

The smallest change is one of two. Either give a locator, or a route, for the statement as written. Or state (j) for a polynomial family `t(u) ∈ M₂(B[u])` that satisfies the relation as an identity in `u` and `v`, which is the case the consumer needs: the matrix of line 285 has entries polynomial in `u`. In both cases, add the cited Yangian text with its locator to the References.

## R02 (P2) — Jordan's theorem 8.1 is already a theorem of the pinned Tau Ceti, yet the roadmap owns it and plans its proof.

A target of a new roadmap that the pinned library already proves is not that roadmap's work. Here Layer 8 plans that work again, including "Witt's lemma is part of this target" (line 200). The README also contradicts itself. Line 334 lists 8.1 with Witt's lemma under "This roadmap owns", and line 336 says that 8.1 "is already in the Tau Ceti library". At the pin, `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (TauCeti/GroupTheory/Perm/Jordan.lean:154) has exactly the hypotheses of 8.1: `IsPreprimitive G α`, `p.Prime`, `p + 3 ≤ Nat.card α`, `g.IsCycle`, `#g.support = p` and `g ∈ G`. `Suggested.lean` restates it at lines 112–116 and closes it with that theorem, so the declaration asks an implementer for nothing. The `*In Tau Ceti:*` line (line 181) is meant for a completed item of a roadmap already on main. ArithmeticDynamicsPartII and CertifiedPermutationComputation cite the same theorem directly.

The smallest change is to remove 8.1 from the owned list (line 334), from headline (3) of the summary and from `Suggested.lean`, and then to remove the Layer 8 target, keeping the theorem where it already stands under "Not owned here" and in the supplier contracts from Tau Ceti. CongruenceModulesOfThetaLifts §7.9, which cites "TensorInductionAndFiniteGroupInputs §8.1", would then cite the Tau Ceti theorem.

## R03 (P2) — 6.1 (a) restates, without citation, the prime-index case of the trace formula for tensor induction that ArithmeticGaloisRepresentations §7.1 on main owns.

This gives one object two owners, and the route of 6.1 (a) re-proves a statement that an earlier roadmap already makes. ArithmeticGaloisRepresentations §7.1 (main, README line 3909) asks to prove that the trace of Tau Ceti's `Subgroup.tensorInducedRepresentation` at `g` is `∏_j tr ρ(t_{i_j}⁻¹ g^{l_j} t_{i_j})`, the product over the cycles of `g` on `Γ/H`. Its standing hypothesis (line 3857) is only that `Γ` is profinite, which a finite discrete group is.

For `H` normal of prime index `l` with transversal `x^i`, the formula gives 6.1 (a) at once:
- each `h ∈ H` fixes all `l` cosets, which gives `∏_i ψ(x^{−i}hx^i)`;
- each `g ∉ H` permutes the cosets in one `l`-cycle, which gives `ψ(x^{−j}g^l x^j) = ψ(g^l)`. The conjugate is `H`-conjugate to `g^l` because `g = h′x^k` with `l ∤ k` commutes with `g^l`.

The README never mentions ArithmeticGaloisRepresentations. The smallest change has four parts:
- in 6.1 (a), replace the route by this specialisation;
- add ArithmeticGaloisRepresentations §7.1 to the *Needs:* line and to the supplier contracts;
- list the general formula under "Not owned here";
- either drop `trace_tensorInducedRepresentation_of_index_prime` from the headlines, or keep it and mark it as the specialisation that 6.1 (b) consumes.

## C01 — 6.1, 6.2 and 9.1 cite no source, and Howe 1989 is cited without a locator.

The routes of 6.1 and 6.2 and identities (a)–(i) of 9.1 hold, so no stated result is left unsupported. Still, a reader cannot place these statements in the literature. The authors named at line 297 (Capelli 1887, Howe–Umeda 1991, Molev–Nazarov–Olshanski 1996) are also missing from the References. A theorem or section locator for each target would fix this: a character-theory text for 6.1 and 6.2 (a), and the Yangian literature for 9.1. Howe 1989 also needs a section or page.

## C02 — Two citations of InductionRestriction point at the wrong layer.

The projection formula is in InductionRestriction Layer 0 ("the functorial core -- transitivity and the projection formula", line 213 of its README), not in Layer 2 as lines 117, 128 and 342 say. InductionRestriction Layer 6 is the representation ring with Artin and Brauer induction, and it does not state the orthogonality relations that lines 118, 128 and 342 attribute to it. Those relations are Mathlib's `FDRep.char_orthonormal`. Repointing the two citations fixes this.

## C03 — The centrality claim of 9.1 (c) is ClassicalGroups §6.6's theorem, but the route derives it again.

ClassicalGroups §6.6 (main, line 1070) owns the centrality of the same column-ordered determinant `A_n(u)` in `U(𝔤𝔩_n)`. The elements `E_ab` define an algebra map `U(𝔤𝔩_n) → A`, so the first clause of (c) is the image of that theorem. The route at line 290 says instead "Centrality from (a) and (b)". It would be enough to cite §6.6's centrality there. The *Needs:* line already names §6.6, but only for the determinant itself.

## C04 — 7.1 claims the decomposition for `U(n) × U(m)`, but the route has no step that gives it.

The route (lines 147–151) proves the decomposition for `GL_n(ℂ) × GL_m(ℂ)` only, and the *Needs:* line names no input for the unitary restriction. The missing input is Weyl's unitarian trick, applied to the product: Zariski density of the unitary group. Tau Ceti has it for one factor as `TauCeti.IsRationalRep.isIrreducible_comp_toUnits_iff` (RepresentationTheory/ClassicalGroups/UnitaryTrick.lean:128).

## C05 — The module docstring of `Suggested.lean` says that no library has an external tensor product of representations of two groups, but Tau Ceti has one.

Lines 38–40 list "the external tensor product of representations of two groups" among the things neither library has. The pinned Tau Ceti defines `Representation.externalTensor` (RepresentationTheory/Tensor/External.lean:85), with its character formula `Representation.char_externalTensor`. That item should come off the list. 7.1 stays unstated either way, since the README does not make it a headline.

## C06 — The description misstates what `Suggested.lean` contains.

The description says the file "states 4 headline theorems with `sorry` proofs" and that "its docstring says which other headlines are not statable". At this head three declarations use `sorry`, and the fourth is proved by the Tau Ceti theorem. The docstring says that all three headlines are statable and that 7.1 and 9.1 are not headlines. Accurate text would be: "`Suggested.lean` states the headline theorems of 6.1 and 6.2 with `sorry` and restates Jordan's theorem 8.1 from Tau Ceti; its docstring says why 7.1 and 9.1 are not stated." R02 changes the last part of that sentence.

## N01 — Line 72 uses the LaTeX macro `\overline{φ′(hx)}` inside a code span; the summary writes the same thing as `conj(φ′(hx))`.

## Questions for the author

- Does 9.1 (j) hold for a family `t(Y)` with no regularity in `Y`? The fusion argument proves `f(z)·[q(Y), t_ab(Y′)] = 0` with `z = Y + 1 − Y′`, where `f` is the scalar of `A R₁₃(z) R₂₃(z − 1) A` on `Λ²ℂ² ⊗ ℂ²`. I computed `f(z) = z(z − 2)` exactly (polynomial normalisation `R(z) = z − P`). So the argument does not give commutation with `t(Y + 1)` or `t(Y − 1)`. I found no counterexample among families supported on `{0, 1}` or on `{−1, 0, 1}` with values in `M₂(End ℂ^d)`, `d ≤ 4`, but I did not settle the question.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 6.1 (a) on `H` | transversal `x^i`, `H` normal, so `h` fixes every coset | word at `x^iH` is `x^{−i}hx^i`; product `∏ψ(F^{−i}h) = ∏ψ(F^i h)`, as `F^l` is inner | holds |
| 6.1 (a) off `H` | `g = h′x^k`, `l ∤ k`, one `l`-cycle | trace `ψ(x^{−j}g^l x^j)`; `F^k(g^l)` is `H`-conjugate to `g^l`, so trace `= ψ(g^l)` | holds (R03: owned on main) |
| 6.1 (b), sign `s` | `Ĝ = ℤ/2`, `H = 1`, `ψ = 0 − 1` | `ψ̂ = (1, −1)`; formula `0 + (+1)·s·1 + (−1)·Ind(0) = s`; without `s`: trivial character | holds; Check true |
| 6.1 (b) off `H` | `l = 2` and `l` odd | `(−1)^l s(g) = (+1)(−1)` and `(−1)(+1)`, both `−1`; Ind terms vanish | holds |
| 6.1 (b) orbits | `l = 2, 3` | `{12, 21}` is one orbit of size 2; six words, two orbits of size 3; `#₂` constant on orbits | holds |
| 6.2 (a) extension | `ℤ/4 ⊃ 2ℤ/4`, `χ′(2) = −1` | `c = ρ(x²)⁻¹A² = −1`; `A = ±i`; extensions `x ↦ ±i`, no splitting | holds; Check true |
| 6.2 (a) coset norm | DFT `l⁻¹Σζ^{ij}c_i = δ_{j0}` | inversion gives `c_i = 1` for all `i`; `S₃`: trivial extension on transpositions, mean `|1|² = 1` | holds |
| 6.2 (b) | `S₃`, `X = 1 + ρ` | values on `Hx`: `1, 1, 1`; norm `3/3 = 1`; `b = 1`, `τ₀ = 1_H` | holds |
| 6.2 (b) integrality | `ℤ/2 × ⟨x⟩`, `(1 + η̃)/√2` | values on `Hx`: `√2, 0`; norm `(2 + 0)/2 = 1`; two nonzero coefficients, not virtual | negative control true |
| 6.2 (c) | `S₃`, `Y = ω + ω²` | `⟨X|_H, Y⟩ = 2`, divisible by `l = 2`; `1_H ∉ Y`; `(1 − ζ) ∩ ℤ = 2ℤ` | negative control true |
| 6.2 Lean | quantifier order, divisibility, `b` | `∃τ₀ ∃τ ∃b` then `∀Y`; `∀ m : ℤ, ≠ l·m`; `b ∈ ℚ⟮ζ⟯ ∧ IsOfFinOrder b` | matches README |
| 7.1 dimensions | `(n,m,d) = (1,2,2), (2,2,2), (2,3,2)` | `3 = 1·3`; `10 = 9 + 1`; `21 = 18 + 3` | holds |
| 7.1 action, weights | `((g,h)·P)(X) = P(ᵗgXh)`, `b` upper triangular | left action; `Δ_i(ᵗbX) = ∏_{k≤i} b_kk·Δ_i(X)`; `P(g⁻¹X)` gives contragredient | holds (C04: unitary step) |
| 8.1 | `PGL₂(𝔽₅)` on 6 points; `PSL₃(𝔽₂)` on 7; step (4) | 5-cycle, `120 < 360`; no transposition; `(abc′)⁵ = (ac′b)` | holds; equals Tau Ceti theorem (R02) |
| 9.1 (a), (b) | `n ≤ 3`, `t ≤ 3`, random sequences with repeats, `u = 7/3, −5/2` | row form, row and column antisymmetry, four expansions: both sides equal on test polynomials | holds |
| 9.1 (c), (d), (e) | all `c, d`; all `i, l`; all `i, q, j, p`; `n ≤ 3` | commutators zero; eigenvalue `∏(u − k + 1 + ν_k)` on `x₁^p(x₁z₂ − x₂z₁)^q`; Jacobi and zero clause equal | holds |
| 9.1 (f), (g) | `y = ∂_x`, `η = z`, random integer `x, ξ`, `n ≤ 3` | all four (f) identities and (g) equal; flipping the sign in (f) or the shift in (e), (g) breaks equality | holds |
| 9.1 (h), (i) | `n = 3` (`m = 1`), `n = 4` (`m = 2`); random `P`, `Q = P⁻¹` | three border expansions equal; `E′` relations, `qdet′ = qdet`, `C′ = C`; adjoint derived from (a) | holds |
| 9.1 (j) | families on `{0,1}`, `{−1,0,1}` in `M₂(End ℂ^d)`, `d ≤ 4` | `q(0)` commuted with all entries; fusion scalar `z(z − 2)` vanishes at `Y′ = Y ± 1` | unresolved (R01, question) |
| Context of the Lean file | elaborated types of all 4 declarations | every binder the README needs is present, none dropped | sound |

- Source locators checked against the text: 0 of 4 (Howe 1989, Howe 1995 §2.1, Wielandt Theorems 9.4 and 13.2, none readable). In the seeded sample, 6.1, 6.2 and 9.1 carry no locator, and 7.1 and 8.1 cite only the unreadable texts.
- Library declarations opened at the pins: Tau Ceti Tensor/Induction/Basic.lean:265, CharacterTable/VirtualCharacter.lean:127, CharacterTable/Table.lean:114, GroupTheory/Perm/Jordan.lean:154, Tensor/External.lean:85, ClassicalGroups/UnitaryTrick.lean:128, WreathProduct/Monomial.lean:43; Mathlib GroupAction/Jordan.lean:232 and 408, RepresentationTheory/Character.lean:56, NumberField/InfinitePlace/Embeddings.lean:138, GroupTheory/Transfer.lean:146.
- Cross-roadmap citations resolved on main: InductionRestriction Layers 0, 2, 4, 5 and 6; SchurWeyl §§8.1–8.3 and Layer 6; ClassicalGroups Layers 2–3 and §6.6 (`qdet(u) = A_n(u)`, the same ordering and shifts); FiniteGroupInvariants Layer 5; AutomorphicLFunctionsAndLocalFactorsPartII §4.4; ArithmeticGaloisRepresentations §7.1. Consumers read at their open heads: FiniteReductiveGroups, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts and BesselPoincareSeriesAndGramBounds.
- Automatic checks: every check passed. Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`, with no UPWARD or CYCLE line. All suppliers are on main.
- Elaboration: `lake env lean` on `Suggested.lean` gives three warnings, `declaration uses sorry`, at lines 59, 74 and 90, and nothing else. I compared the elaborated type of each declaration (`#check @name`) against the README, without changing the file; no binder is lost.
- Computation: an exact rational check of 9.1 in the realisation `E_ab = x_a∂_{x_b} + z_a∂_{z_b}` on random polynomials, with negative controls that fail as expected. The fusion scalar was checked exactly on `(ℂ²)^{⊗3}`.
- Ownership: I found no other owner of 6.1 (b), 6.2, the case `n ≠ m` of 7.1, or 9.1 (a)–(j) other than the clause in C03, either on main or at the heads of the open pull requests. This roadmap is the owner of those.
- Overlap check: read BesselPoincareSeriesAndGramBounds, FiniteReductiveGroups, IntegralWeylModulesOfGeneralLinearGroups, InductionRestriction and ThetaChainsOnDefiniteUnitaryGroups (open), and CharacterTheory and OddOrderTheorem (main; PolynomialGaloisGroups is not on main under that name). Read by object: ArithmeticGaloisRepresentations, ClassicalGroups and AutomorphicLFunctionsAndLocalFactorsPartII. Shared objects and their owners: the tensor-induction trace formula (ArithmeticGaloisRepresentations §7.1, R03); the centrality of the Capelli determinant (ClassicalGroups §6.6, C03); the square case of 7.1 (AutomorphicLFunctionsAndLocalFactorsPartII §4.4, acknowledged in Scope); Jordan's prime-cycle theorem (Tau Ceti, R02). The open family roadmaps consume this one and own none of its objects.

Source independence: 0 passages compared with sources, since none of the three cited texts is legally readable; largest share Wielandt 1964, 2 of 4 locators; contents not compared because its table of contents was not available. Only Layer 8 cites it, and the four layers treat four unrelated subjects.

Research link: 7.1 is Howe's `(GL_n, GL_m)`-duality (Howe 1989, 1995), and 9.1 gives the Capelli and Yangian quantum-minor identities (Capelli 1887; Howe–Umeda 1991; Molev–Nazarov–Olshanski 1996), which the family's theta-lift and Bessel-period roadmaps consume. This rests on the README's text alone; the sources were not read.

## Not verifiable

- Howe 1989, *Remarks on classical invariant theory* (7.1): the sources service found only the publisher's landing page, on a host in no licence class.
- Howe 1995, *Perspectives on invariant theory*, §2.1 (7.1): no legal source found.
- Wielandt 1964, Theorems 9.4 and 13.2 (8.1): no legal source found. Mathlib's own GroupAction/Jordan.lean calls the multiple-primitivity criterion Wielandt 13.2 in its header and 13.3 at the declaration.

## Source issues

- none

## For the human reviewers

- Provenance: the description says the family follows a formal Lean proof announced 20 November 2026. The README cites no source for 6.1, 6.2 or 9.1, so these targets rest on their routes alone.
- Not tested: none of the cited texts (Wielandt 1964, which has the largest share of locators, Howe 1989, Howe 1995) could be read, so the wording and contents comparisons were not done against them.
