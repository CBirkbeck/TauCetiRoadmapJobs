# Review of AuxiliaryAlgebraAndAnalysisForThetaLifts (pull request #3175 at d9a72b0)
Folder: `TauCetiRoadmap/ShortGRH/AuxiliaryAlgebraAndAnalysisForThetaLifts/`
**Verdict:** needs changes

**Summary.** Needs changes: the seven stated results (1.1–3.2) are true as written, checked on degenerate and small cases (including that `#κ ≥ 7` in 3.2 (b) cannot be dropped), but sibling roadmaps of this pull request cite this roadmap for six results it does not state, and ten library declarations named in the closing lists and in 2.2 do not exist at the pins. No section gives a source or locator, `Suggested.lean` states none of the headlines although all are statable at the pins, and the branch edits three files outside the roadmap folders. There are three small corrections and three format notes, and a licence question and the scope of the family's source are left to the human reviewers.

## R01 (P1) — Eight `*Needs:*` entries in four sibling roadmaps cite this roadmap for six results it does not state

An implementer who follows these entries finds nothing here, so the results have no owner. Six entries name this roadmap with no section, for results that none of 1.1–3.2 contains:
- HolomorphicDiscreteSeriesOfUnitaryGroups, lines 286 and 844: "measures below a fibre measure: images, composition of two maps".
- The same roadmap, line 815: "uniqueness of disintegrations of quadric measures".
- SiegelWeilAndRallisFormulasOnUnitaryGroups, line 749: "Hermite forms over products of valuation rings".
- The same roadmap, lines 1129 and 1276: "partner algebra" and "finite Fourier analysis".

Two more entries cite §2.2 for the Smith normal form of an arbitrary square matrix over a valuation domain, together with the reduction of a matrix with more rows than columns: CompositeThetaLiftsAndShortForms line 401 and OneSidedPrimeSumBoundsAndAdmissibleData line 216. Section 2.2 states only (a)–(c) for `g ∈ GL_n(F)`. The Smith normal form appears only inside its *Method* (line 199), and only for invertible matrices.

The smallest repair is to state these results here. For the Smith normal form, add a part to 2.2: every `m × n` matrix over a valuation ring `O` equals `L·D·R` with `L ∈ GL_m(O)`, `R ∈ GL_n(O)` and `D` diagonal with entries forming a divisibility chain. The pointer of 2.2 already names `New.IsValuationPair.smith_normal_form`. Add a section for each of the five other results, in the form the consumers' glosses give. Alternatively, repoint each entry to a section that states the result.

## R02 (P2) — Ten library declarations named in "What the library already provides" and in 2.2 do not exist in the pinned Mathlib or Tau Ceti

These lists tell a reader and the family's consumers that results are available when they are not. I searched the whole pinned source of both libraries for the last component of each name and found no declaration. The names are:
- `TauCeti.taylorSeries_inj` (line 334).
- `AlgebraicGeometry.Scheme.Modules.isSheaf_bigPresheaf_fpqcTopology` and `TauCeti.AlgebraicGeometry.Descent.existsUnique_pullback_map_eq_of_mem_fpqcTopology` (lines 340–341). The pin has only the pseudofunctor `TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor`, not fpqc descent.
- `MvPowerSeries.C_dvd_iff_dvd_coeff` (line 345). Only the one-variable `PowerSeries.C_dvd_iff_dvd_coeff` exists, in `TauCeti/RingTheory/PowerSeries/Dvd.lean:34`.
- `TauCeti.prod_one_add_pow_mul_eq_sum_gaussianBinomial` and `TauCeti.card_submodule_finrank_eq_gaussianBinomial` (lines 350–351). Neither pinned library mentions Gaussian binomials.
- `TauCeti.fittingIdeal_eq_mul_of_exact` (line 354).
- `PowerSeries.norm_coeff_rescale_exp_mul_pow_le` (line 360).
- `TauCeti.one_add_norm_pow_mul_norm_fourier_le_of_tsupport_subset` (line 365).
- `HeckeRing.GLn.mul_comm_fullHeckeRing` (2.2, line 224).

For the same reason, the parenthesis "both ingredients are in the library, see the next list" (line 316) is false.

Repairs:
- Move to "Results taken from other roadmaps" with their owners on main:
  - fpqc descent: SchemeAndStackFoundations §1.1.
  - The product formula for Fitting ideals: PadicMeasuresIwasawaAlgebras §6.6, where `TauCeti.fittingIdeal_eq_mul_of_exact` is a proposed name.
  - The `q`-binomial theorem and the subspace count: ArithmeticStatisticsPartIV §3.2, which states both.
- Drop `TauCeti.taylorSeries_inj`: `Complex.taylorSeries_eq_of_entire'` already gives the uniqueness.
- In 2.2, name `HeckeRing.GLn.commSemiringHeckeRing` (`TauCeti/NumberTheory/HeckeRing/GLn/TransposeAntiInvolution.lean:112`).
- The multivariate divisibility criterion, the coefficient bound for `exp(xX)` and the Fourier decay bound have no owner. State each as a target here or cite an owner.

## R03 (P2) — No section gives a source or a locator, so none of the seven results can be checked against the literature

Each *Origin* line reads "adapted from the published theory of …" and names no work. The README has no reference list. The only cited work is `[ShortProof]`, a Lean repository. The project requires every statement to carry an exact locator into a legal source. A reader also cannot tell which parts are the published theorem and which are the formal proof's own generalisations: the weights of 1.3, arbitrary valuation rings and semirings in 2.2, the bound form of 3.2.

`[ShortProof]`'s own files carry references. For example, its file `Lib/General/Algebra/MultivariatePolynomials.lean` names Alon (1999) and Ball–Serra (2009) for 1.3.

The repair is to give each section the published theorem it adapts, with a theorem and page locator, and to label a generalisation that no source states as the family's convention allows ("particular to this proof" or "this roadmap's own formulation"). Candidate sources, which I have not opened at a locator:
- 1.1: Amitsur's paper on the characteristic polynomial of a sum of matrices.
- 1.2: Brauer's theorem that the Cartan matrix is non-singular (cited elsewhere in the library through RepresentationTheory/ModularCharactersAndBlocks §3.1).
- 1.3: the two papers above.
- 3.2: Hua's book on the classical domains.

## R04 (P2) — `Suggested.lean` states none of the headline theorems, although every one is statable at the pins, and its docstring does not say why

A formal acceptance test is missing for a roadmap whose seven targets are all elementary to state. I wrote 1.1 (a), 1.1 (b), 1.3, 2.1, 2.2 (a), 3.1 (b) and 3.2 (b) against the pinned Mathlib alone, with no extra definitions. It elaborates with only `sorry` warnings:
- `Matrix.charpoly`, the range of `algebraMap B A` and `Submodule.span` for 1.1.
- `MvPolynomial`, `RingHom.ker (MvPolynomial.eval z) ^ d` and weights in `ℚ` for 1.3.
- `Module.Dual`, `CompactSpace` and `NormedField` for 2.1.
- `GL n F` and `ValuationSubring` for 2.2 (a).
- An integral over `n → ℂ` with `(A + Aᴴ).PosDef` for 3.1 (b).
- A `lintegral` over `ι → κ → ℂ` for 3.2 (b).

Parts 2.2 (b), (c) and 1.2 need short real definitions: a Hecke function and its operator on `K`-fixed vectors, and the class `𝒞` through `ModuleCat` and short exact sequences.

The repair is to state these theorems. If the author keeps any part out, the module docstring should name it and the carrier that is missing.

## R05 (P2) — The branch changes three files outside the roadmap folders

The changes are a hand-added line in the "Roadmaps" list of the top-level `README.md`, and the regenerated `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md`. CONTRIBUTING.md says a roadmap pull request touches only its own directory and that the sync bot regenerates the roadmap list after merge. The umbrella files say they are generated and synced daily ("do not edit it by hand"), and main receives them through automatic sync commits. Committing them here only creates conflicts with other open pull requests. The repair is to drop these three files from the branch and let the generators rebuild them after merge.

## C01 — The summary's map of where each result is used names consumers that do not cite the section

Followed from the consumers' side, half of the map is not there. Five consumers named in the summary do not cite this roadmap at all:
- CongruencesOfTwistedThetaLifts, for 1.1. It takes Amitsur's formula from IntegralHeckeAndGaloisDeterminants §0.5.
- GaloisRepresentationsOfUnitaryEigenforms, for 2.1 and 2.2. Its §2.2 uses Auerbach's lemma in its method, line 313, but its *Needs:* line reads "none".
- SelmerBoundsForAnticyclotomicTwists, for 2.1.
- AbelianSchemesWithThetaStructuresAndTheirCohomology, for 3.1.
- RemainingAndMainTermsOfSecondMoments, for 3.2.

WeilRepresentationsOnBanachSpacesOfData does cite §2.2 (c), but not §3.1. Either add the citations to those consumers' *Needs:* lines, or drop the names from the summary.

## C02 — 3.1 (a) is tied to the Ostrowski–Taussky inequality, although it has a one-line proof

The *Needs:* line of 3.1 (line 258) makes (a) wait on EigenvalueAndSingularValueInequalities §4.2. However, if `Ax = 0` then `x*(A + Aᴴ)x = 2 Re(x*Ax) = 0`, so `x = 0` because `A + Aᴴ > 0`. The *Needs:* line could say that this supplier is needed only for the route the *Method* line describes.

## C03 — The description says replaced background entries cite "that section", but the eight entries of R01 do not

The sentence "the `ShortGRH background (…)` entries whose declarations are stated by a background section are replaced by a citation of that section" does not hold for this roadmap. Six replaced entries name no section, and two cite §2.2 for a statement it does not make. Once R01 is repaired the sentence becomes true. Until then, "Known limits" should say that these entries await their sections.

## N01 — The `[ShortProof]` pointer of 3.1 lists `Matrix.IsAccretive` and `Matrix.IsAccretive.det_ne_zero`

These names sit in Mathlib's namespace but exist in neither pinned library. Saying once that pointer names are `[ShortProof]`'s, or prefixing them as the `New.` names are, avoids a search in Mathlib.

## N02 — In 1.3 the hypotheses force `#T = ∏ κ_u`, not only `≥`

The quotient by the ideal generated by `X_u^{κ_u} − g_u` is spanned by the monomials with `α_u < κ_u`, so it has at most `∏ κ_u` common zeros. A Check saying so would stop a reader from looking for an example with more points.

## N03 — A suggested negative-control Check for 3.2 (b)

With one row, `G = 1`, `S = 1` and `c = 0`, the integral equals `π^{#κ}/#κ!`. At `#κ = 6` this is about `1.335 > 1`, while at `#κ = 7` it is about `0.599`. So `#κ ≥ 7` cannot be dropped.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result / change |
|---|---|---|---|
| 1.1 (a) | `B = ℤ`, `A = ℚ`, `ρ(w) = [[0,1],[−2,3]]`; `n = 0` | `χ = X² − 3X + 2`; `v = 3 − w` gives `ρ(v)ρ(w) = 2·1`, `F = det = 2`; `n = 0`: `F = 1`, zero ring | true |
| 1.1 (b) | `e₁₂/2`, `e₂₁` (nilpotent, sum has `χ = X² − 1/2`); `n = 2` | the product has `χ = X(X − 1/2)`, so it is not in the span; `det(X+Y) = detX + detY + trX·trY − tr(XY)` keeps integrality | true; needs Λ closed under products (given) |
| 1.1 (b) route | descending induction in `A[t]/(t^e)` | `1 − t(X+Y) = (1 − tY)(1 − tX)(1 − tZ)` with `Z` of order `≥ 2j+2 > j`: each factor is in the image of `B[t]` | true for any spanning set |
| 1.2 | `Δ = S₃ × ⟨z⟩`, `ℓ = 3`, `z ↦ −1`; `z` of `ℓ`-power order | Cartan matrix `[[2,1],[1,2]]`, det 3; `φ(t)²φ(s) = φ(t)φ(s)² = 1` gives `φ(t)³ = 1`; `𝒞 = {0}`, `τ = 0` forces `φ(0) = 1` | true |
| 1.2, closure of `𝒞` | `z = su`, Jordan decomposition | fixed vector ⟺ `s` has eigenvalue 1 ⟺ some composition factor has one; closed under sub and quotient | true |
| 1.3 | one variable `κ = k`; `κ = (1,2)`, points `(0,0),(0,1)`, `d = 2`; `ι = ∅` | `deg f ≥ dk`, so cost `≥ d`; 6 monomials of cost `< 2` against 6 jet conditions, only `f = 0`; `d = 0` holds and `d ≥ 1` is vacuous | true; `#T = ∏κ_u` forced (N02) |
| 2.1 | `n = 0`; `K = L = ℝ`, unit circle of forms on `ℝ²` | empty basis; max of `‖φ(det)‖` on compact `𝒜ⁿ` is non-zero (forms span `U*`); Cramer ratio `≤ 1` | true |
| 2.2 (a) | `O = ℤ_p`, `g = [[1,p],[0,p²]]`; `n = 1` | `g` and `ᵗg` both have elementary divisors `(1, p²)`; `n = 1`: `ᵗg = g` | true |
| 2.2 (b) | `k[[t]]` with `k` infinite; general `KhK` | `diag(t,1)K` has infinitely many cosets (degenerate support); `#(KhK/K) = #(K\KhK)` via `θ(x) = ᵗx⁻¹` and (a) | true |
| 2.2 (c) | convolution on `G/K` | `(f∗f′)(ᵗx) = (f′∗f)(x)` by `g ↦ ᵗg`; `f∗f′` is bi-`K`-invariant, so it equals `f′∗f` | true, any commutative semiring `A` |
| 3.1 (a) | `A = [[1,2],[−2,1]]`; `n = 0` | `A + Aᴴ = 2I`, `det A = 5`; `n = 0`: `det = 1` | true (C02) |
| 3.1 (b) | `n = 1`, `Re α > 0`; `n = 0` | `∫exp(−α|x|² + αa x̄) = π/α` (no `bc` term); `n = 0`: `1 = 1`; congruence `A = Pᴴ diag(1 + is_j) P` exists | true |
| 3.2 (a) | `s = ∅`; `k = 1`, `#s = 1`; general one row | equality; `γπm^{−r}/(r|σ|²) ≤ γπm^{−r}/|σ|²`; `∫(1+|y|²)^{−(r+1)} = π^k(r−k)!/r! ≤ π^k/k!` | true |
| 3.2 (b) | `ι = ∅`; `#κ = 6, 7` with one row | equality; `π⁶/6! ≈ 1.335 > 1` and `π⁷/7! ≈ 0.599 ≤ 1`; Jacobian of `X ↦ SX` is `|det S|^{2#κ}` | true; hypothesis sharp (N03) |
| Results taken, Ostrowski–Taussky form | `Θ + Θᴴ ≥ H ≥ 0` | `det(H/2) ≤ det((Θ+Θᴴ)/2) ≤ |det Θ|`, so `det H ≤ 2ⁿ|det Θ|` | true |
| Results taken, `q`-identity | `dim W = 2` | `1 − (q+1)X + qX² = (1−X)(1−qX)` | true; "in the library" false (R02) |
| Results taken, `exp` integrality | `exp(aX)`, `v(a) = 1/(p−1)` | `v(aⁿ/n!) = s_p(n)/(p−1) ≥ 0` | true |
| §2.2 as cited by consumers | Smith normal form of an arbitrary or rectangular matrix | not stated in 2.2 (only invertible `g`, inside the Method) | R01 |
| `Suggested.lean` | the seven probe statements | elaborate at the pinned Mathlib, `sorry` warnings only | R04 |

- Source locators checked: 0 (the README gives none); 3 files of `[ShortProof]` read for wording (HolomorphicIntegrals, MatrixNormBounds, MultivariatePolynomials).
- Library declarations opened: 66 names that the README gives as library declarations were looked up at the pins. 56 were found with their file and line, for example `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459`, `TauCeti/Probability/Distributions/Gaussian/ProperComplex/PDF.lean:219` and `TauCeti/Analysis/Convex/AffineNormalization.lean:85`. 10 are absent (R02).
- Cross-roadmap citations resolved: 14 sections on main (EigenvalueAndSingularValueInequalities §4.2, IntegralHeckeAndGaloisDeterminants §0.5, ModularCharactersAndBlocks §3.1, AutomorphicFormsOnReductiveGroups §3.5, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (c), RestrictedPowerSeries §§1.1, 2.4, ArithmeticStatisticsPartIV §3.2, GroebnerGeometry §4.10, DeligneWeightsAndPurity §0.5, AdelicAlgebraicGroups §4.4, ArcTopologyAndDescent §0.1, LieGroups §9.2, PadicMeasuresIwasawaAlgebras §6.4) and one sibling section (IdelicReciprocityCountsAndCyclotomicClassGroups §3.1); all exist and say what is claimed.
- Consumers: 14 citations of this roadmap in 7 sibling READMEs read; 8 point to nothing stated here (R01).
- Dependency check: `depcheck: 115 roadmaps, 1308 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Automatic checks: the only failure is the change outside the folders (R05); all others pass.
- Elaboration: `Suggested.lean` elaborates with no messages; it declares nothing, so there is no `#check @name` signature to compare. The probe file of seven statements elaborates with `sorry` warnings only.
- Duplication: Auerbach's lemma, the Ostrowski–Taussky inequality, Amitsur's formula, Higman's criterion and Hua's integral are absent from both pins. AutomorphicFormsOnReductiveGroups §3.5 (local fields, `A = ℂ`) and ModularCharactersAndBlocks §3.1 imply only special cases, and the README names both.

Overlap check: read ShortGRH (the family index), OneSidedPrimeSumBoundsAndAdmissibleData and, on main, RiemannHypothesisForDirichletLFunctions; nothing shared (OneSided consumes §2.2, see R01; the open revision of ReductiveGroups states Gelfand's trick for finite groups `G^F`, a different object). Ownership against open pull requests was checked by search for each of the seven objects.

Source independence: 6 passages compared with 1 source (`[ShortProof]`: the docstrings of the declarations named in 2.1, 1.3 (statement and *Origin*), 3.2 (a), 3.2 (b) and the module docstring of the 3.2 file); longest shared run 8 words including the formula ("at which each `X_u^{κ_u}` agrees with a polynomial"), none copied. There is no source with a share of locators (0 locators). The layers (algebra, linear algebra, analysis) group seven files of `[ShortProof]`'s `Lib/General` by subject and not in a source's order: independent.

Research link: the results are auxiliary inputs of `[ShortProof]`, a formal proof of GRH rewriting Alpöge's (announced November 2026), entering its covolume comparison of theta lifts. Each is classical in origin (Amitsur; Brauer; Alon 1999, Ball–Serra 2009; Auerbach; Gelfand; Hua). This rests on the README, the family index and `[ShortProof]`'s file headers.

## Not verifiable

- 1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2 (the seeded sample): no source or locator is given, so there is no text to check the theorem number, page or hypotheses against (R03). I checked the mathematics directly instead (table above).
- The licence text of `[ShortProof]`: only its README's statement was read (see below); the `LICENSE`, `NOTICE` and `ATTRIBUTION.md` files were not opened.

## Source issues

- none

## For the human reviewers

- Licence: the README was drafted from `[ShortProof]`'s Lean source (github.com/lsernau/grh-lean) and names its files and declarations. That repository states Apache 2.0, with per-folder `NOTICE` and `ATTRIBUTION.md` files. Whether attribution is owed was not settled.
- Scope: the family follows an unrefereed formal proof of GRH, announced November 2026 (family index, lines 10–22). The seven results are classical in origin, but whether their generalisations here are published is unestablished (R03).
