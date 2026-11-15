# Review of RationalHomotopyModels (pull request #2298 at 2b7b442)

**Verdict:** accepted

## Previous findings

- none: the review of `2b7b442` raised no finding of its own (the R01 it carried was marked repaired), and the folder has not changed since.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| 3.3 `bijective_of_bijective_cohomologyMap`, degree-one generators (named in the description) | Heisenberg `Λ(x₁, y₁, z₁)`, `dz = xy`; `f : z ↦ z + x` | `d f(z) = xy = f(x) f(y)`; `f(xz) = xz`, `f(yz) = yz − dz`: identity on `H` | `f` bijective, inverse `z ↦ z − x` | Agrees; no change |
| 3.3, minimality of the target | `K → Λ(u₁, v₂)`, `du = v` | `H = K` on both sides: a quasi-isomorphism | Not surjective; `du = v ∉ A⁺ · A⁺`, so the target is not minimal | The hypothesis is needed; no change |
| 3.3 route, exact sequence at one Hirsch stage | `Λ(x₂, y₃)`, `dy = x²`; `N = Λ(x)`, `S = ⟨y⟩` | `coker(H³N → H³M) = 0`; `S / N³ = K` | `ker(H⁴N = K x² → H⁴M = 0) = K` | `0 → 0 → K → K → 0` exact; no change |
| 5.2 sign of `d₁` (named in the description) | Heisenberg Lie algebra `[X, Y] = Z`; `𝔰𝔬(3)` | `(dz)(X, Y) = −z(Z) = −1`, so `dz = −xy`; Sullivan | `𝔰𝔬(3)`: `d(ax + by + cz) = −(a yz + b zx + c xy) = 0` only for `a = b = c = 0`: not Sullivan | Agrees with "Sullivan exactly when nilpotent"; no change |
| 5.3 bracket from `d₁` | `Λ(x₂, y₃)`, `dy = x²` | `ι_sa ι_sa (x²) = ι_sa (2x) = 2` | `2 = −(−1)¹ ⟨y, s[a, a]⟩`, so `[a, a] = 2b`; odd `a` allows `[a, a] ≠ 0` | Agrees with the 6.4 row; no change |
| 6.4 `H(λX) ≅ π_*(ΩX) ⊗ ℚ` | `S²` (`𝕃(a₁)`); `S³` (`𝕃(a₂)`) | `S²`: `H = ⟨a, [a, a]⟩`, ranks `1, 1` in degrees `1, 2` | `π₂, π₃ ⊗ ℚ = ℚ` for `S²`; `S³`: `[a, a] = −[a, a] = 0`, only `π₃ ⊗ ℚ = ℚ` | Agrees with Serre's computation; no change |
| 7.2 `isFormal_of_complement` (named in the description) | `Λ(x₂, y₃)`, `dy = x²`; Heisenberg | `d(xᵏ y) = x^(k+2) ≠ 0`: `(y)` has no nonzero cocycle; criterion holds | `x(z + ax + by) = xz + b xy` closed; exact degree 2 is `⟨xy⟩`: not exact | Holds, resp. fails for every complement; no change |
| 7.3 `isFormal_of_ddc` | `dᶜ = 0`; `Λ(u₁, v₂)`, `du = v`, `dᶜ = 0` | `dᶜ = 0`: each `d`-exact `a = d(dᶜ e) = 0`, so `d = 0`: formal | `v` is `d`-exact, not `ddᶜ`-exact: hypothesis fails, yet `H = K` is formal | Sufficient, not necessary; no change |

The adversarial rows for the other statements stand as in the previous review, of `2b7b442`.

- Pull request's text: title and each sentence of the description checked against this head (new folder, 3 files, 1650 lines, 48 headings, 20 declarations). Layers 1–7, 13 headlines, six non-statable items (`Suggested.lean` lines 48–64), ten suppliers, sources: 0 contradictions, 0 unstated changes.
- Remark on the text, no change asked: "Supporting definitions" names four predicates, and the count "7 definitions" later in the description covers `positivePart`, `ExponentVector`, `standardMonomial`. "DGAInfinity (Layers 1, 3, 8)" is followed by Layers 0 and 4 under "Other boundaries".
- Sources: 12 locators checked against the text: Sullivan1977 lines 636–672 (§3, (3.3)–(3.7), p. 285), 748, 1121, 1872; Morgan1978 line 1162; Hess2007 lines 493, 556, 1093 (p. 20). The description's "Propositions (3.5)–(3.6)" follows Sullivan's later usage (Source issues).
- Citations resolved: on main, DGAInfinity Layers 0/1/3/4/8, AlgebraicTopology §§4.7, 6.2, 8.3, 8.5, GeneralizedCohomology G2.1, StableHomotopyKTheory §3.36, ComplexKahlerGeometry §6.3, DifferentialGeometry 0.1, 0.4, 1.1–1.4, 6.1. At open heads: DerivedDeRhamCohomology §2.21, ArithmeticLocallySymmetricSpaces §ALS.F.5, EllAdicHomotopyTypesAndWeights's five contracts (its README lines 67–75), AlgebraicTopologyPartII §§4.1–4.6 (no `A_PL`, no Sullivan algebra).
- Gate: the worker's gate passes every check, including the build. The rerun reports only `depcheck: NOT IN ORDER: RationalHomotopyModels (insert it after its last supplier)`, which the brief exempts. Candidate-order check: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`, no UPWARD or CYCLE.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. The `#check @` types of all 20 declarations elaborate; 11 theorems carry `CharZero`, as in the previous review.
- Remark on untouched text: SymplecticFieldTheory §0.3 also develops the free supercommutative ℚ-algebra and its universal property (noted in the previous review).

Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen, SuperconnectionsAndMathaiQuillenForms, DeRhamCohomologyAndDuality, DGAInfinity, SymplecticFieldTheory and AlgebraicTopologyPartII Layer 4. RationalHomotopyModels owns the Sullivan and polynomial-form contracts that EllAdicHomotopyTypesAndWeights consumes. DGAInfinity owns tensor coalgebras, cobar, `A∞` formality and Massey products. GeneralizedCohomology G2.1 (main) is cited for Kan–Quillen, not KanQuillen. SuperconnectionsAndMathaiQuillenForms owns only `ZMod 2`-graded supercommutativity. A grep of main and every open head for Sullivan algebras, `A_PL` and polynomial de Rham finds no other owner.

Source independence: changed passages only. The folder has 0 changed lines; the description's source list was compared with 3 sources (Sullivan1977, Morgan1978, Hess2007), and no wording is shared. The largest locator share is still Hess2007, 23 of about 80 in the earlier audit. No layer was added, removed or reordered, so the earlier result (independent arrangement) stands and contents were not compared again. FHT2001 and DGMS1975 remain unread.

## Not verifiable

- FHT2001 and DGMS1975: both settled as uncertified, so no text was read. The description's DGMS locators (§4 Definition, Theorem 4.1, p. 261, §6 Main Theorem) agree with the README but were not checked against the paper.
- Quillen 1969 Theorem I and Bousfield–Gugenheim 1976: no open text in the sources cache. The description's Quillen locators agree with README 6.4–6.5.

## Source issues

- **Misprint** in Sullivan1977 at §3, Corollary (3.6), p. 285: the source labels the bijection on homotopy classes Corollary (3.6) but calls it Proposition (3.6) on pp. 289, 310 and 319; it should use one label; affects nothing.

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text here. The comparisons for Layers 5–7 used only Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey.
- **Licence.** Earlier reviews found no public formalisation like `Suggested.lean` among the pinned libraries or open roadmaps; nothing outside them was searched. No Lean declaration has changed since.
