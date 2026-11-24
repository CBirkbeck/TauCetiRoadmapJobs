# Review of AdelicAlgebraicGroups (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** The roadmap folder has not changed since the previous review, of 8d0b573. The only commit since then edits the module docstring of AnalyticNumberTheoryPartIII's `Suggested.lean`, which this roadmap does not cite. There are no findings. The three small corrections of the previous review are carried as C01–C03, since nothing repaired them, and so is its question for the author. None of them blocks. Nothing is left for the human reviewers.

## C01 — The description does not mention this roadmap, although its addition is larger than three of the additions it names

A reader of the description cannot tell that AdelicAlgebraicGroups gains six subsections (1.5a, 2.6, 3.4a, 4.1a, 4.2a and 4.5a). The description's list of the largest additions names ComplexComparisonPartII, ReductiveGroups, RepresentationTheory/CharacterTheory, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions and MetaplecticAutomorphicForms, and omits this roadmap.

At this head this README's diff against main is 653 lines (621 insertions). Three of the named additions are smaller: GeometryOfNumbersAndQuadraticArithmetic (303), HeightsRationalPointsAndObstructions (256) and MetaplecticAutomorphicForms (254). A clause in that sentence would make the description right:

> "…, and AdelicAlgebraicGroups (lattice stabilizers; measures of top forms, of groups with a unipotent radical and on homogeneous spaces; `τ(G_m) = 1` and the Tamagawa numbers of groups with a unipotent radical; Ono's formula; strong approximation for any finite set of places; class-set integration and the mass)"

## C02 — [Borel] §5.5 does not state that reductive groups are unimodular, which two targets of 1.5 cite it for

Two targets cite "[Borel], §5.5, p. 20" (README lines 1016–1024): *Local unimodularity of reductive groups* and *Adelic groups of reductive groups are unimodular*. A reader who opens that locator finds only half of the argument.

Borel's Lemma 5.5 (borel lines 655–658) proves two things:

- unimodularity of the adelic and archimedean groups is equivalent to every left-invariant rational top form being right-invariant;
- `G_A` is unimodular when `G` has no rational character.

`GL_n` has a rational character (`det`), so the step it needs is `det Ad = 1` on a reductive group, and that step is not in the passage. The statements themselves are true.

Either repair works:

- cite Oesterlé, Chapter I, Proposition 5.3 and Corollaire 5.4, p. 23, which are already in the References;
- or add "with `det Ad = 1` on reductive groups" to the citation.

## C03 — Some citations in the new subsections have no locator, and one target has none at all

*tamagawa-quadratic-norm-torus* (line 4241) cites only "[Ono], as the case of *tamagawa-torus-ono* computed in the Route". Three other citations also have no theorem or page:

- [Gross] in *class-set-integration* (line 5217);
- [Kneser] and [Platonov] in *strong-approximation-any-places* (line 4619);
- [Platonov–Rapinchuk] in the same target (line 4625).

A reader cannot check these attributions. The statements are standard, and the other locators of those targets hold (Rapinchuk, Theorem 2.3, p. 12; Arthur, (2.1), p. 13).

The repair is a theorem or page for each. For the norm-one torus, Oesterlé, Chapter IV, Corollaire 3.3, p. 56, together with the computation in the Route, would do.

## Questions for the author

- *tamagawa-torus-ono* (lines 4201–4229): is the global duality for tori meant to be derived inside this target?
  - The route uses the duality of `H¹(F, X*(T))` with `H¹(Gal, T(𝔸 ⊗ F̄)/T(F̄))`, the bijectivity of `Λ_T` and the exact sequence with `Ш²` (Oesterlé IV 2.5, 2.7).
  - The *Needs:* line names only ClassFieldTheory layers 0 and 11. The bijectivity of `Λ_T` also uses layers 5 and 10.
  - ArithmeticGaloisDuality states the torus duality, but it comes after this roadmap in the merge order.
  - If the derivation belongs here, the *Needs:* line could say "proved as part of this target".
  - What stopped me: whether layers 0 and 11 are meant to be read as supplying the derived statements.

## Previous findings

- none: the previous report raised no finding (P1 or P2). Its small corrections C01–C03 are unrepaired, since the folder did not change, and are carried above under the same numbers.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 1.5 *Local unimodularity of reductive groups* (C02) | `GL₂(ℚ_p)`, `diag(p,1)`; Borel of `GL₂` as control | `Ad` on `gl₂`: eigenvalues `p, p⁻¹, 1, 1`, det `1`; on `Lie B`: `1, 1, p`, det `p`, not unimodular | true; reductive hypothesis needed; C02 locator only |
| 4.1a *tamagawa-quadratic-norm-torus* (C03) | `E/F` quadratic, `X* = ℤ` with `σ = −1` | `H¹(C₂, ℤ_−) = ker N / (σ−1)ℤ = ℤ/2ℤ`; `Ш¹ = 1` (Hasse norm theorem, cyclic); `τ = 2/1 = 2` | true; C03 locator only |
| 4.2a *strong-approximation-any-places* (C03) | `SL₂/ℚ`, `S = {2}`; Hamilton `D¹`, `S = {2}` | `SL₂(ℚ₂)` noncompact, `SL₂(ℤ[1/2])` dense in `SL₂(ℝ)×∏_{p odd}SL₂(ℤ_p)`; `D¹(ℚ₂)` compact, `D¹(ℤ[1/2])` finite, not dense | true; hypothesis needed |
| 4.5a *class-set-integration*, `mass(U′) = [U:U′]·mass(U)` (C03) | `G_m/ℚ`, `U = Ẑ^×`, `U′ = {u ≡ 1 mod 5}` | `mass(U) = 1/2`; classes `(ℤ/5)^×/{±1}`: 2, stabilizers trivial, `mass(U′) = 2 = 4·½` | true |
| 4.1 `HasWeakApproximation`, `μ₂` Check | `μ₂/ℚ`, `S = {∞,2}` | `μ₂(ℚ) = {±1}`, image `{(1,1),(−1,−1)}` in `{±1}²`: 2 of 4 points, discrete | Check true |
| 4.1 `G_m` Check | `S = {∞,2}`; away from `∞` | `ℚ^×` dense in `ℝ^××ℚ₂^×` (open in `ℝ×ℚ₂`); `ℚ^×∩Ẑ^× = {±1}`, `ℚ^×` discrete in `𝔸_f^×` | Check true |
| 4.1 torsors, Checks | `ℚ[x]/(x²−2)`, `x ↦ x⊗g`; `S₃` rules | `x² ↦ 2⊗g² = 2⊗1`; no rational point, real point `√2`; `x·gh ≠ x·hg` for transpositions; `x·h⁻¹g⁻¹ = (gh)⁻¹` rule holds | Checks true |
| 5.3 *quaternion-class-sets*, openness Check | `U = {1}` in `(D⊗𝔸_f)^×` | class set `D^×\(D⊗𝔸_f)^×`: countable acting on uncountable, infinite | Check true |
| 5.3 *definite-quaternion-stabilizers*, Checks | Hurwitz order; `ℍ⊗ℚ(√2)`; full level | `24/2 = 12`; `Z_x = 𝒪_F^× ∋ 1+√2`, infinite; `1+ni` pairwise non-proportional, `D^×/ℚ^×` infinite | true |
| 5.3 volume comparison, `U₁(9)` Check | Hurwitz level, `U₁(9)` at 3 | `81 − 9 = 72` rows; `nrd(γ−1) = 2 − t`: `4,3,2,1,0` for `t = −2..2`, `0 mod 9` only at `γ = 1`; `72/24 = 3 = (72/2)(1/12)` | true |

The rows of the previous review, of 8d0b573, for the untouched statements and the headline theorems stand as written there.

- **Change since 8d0b573.** The diff of the folder is empty. The one file changed elsewhere, `TauCetiRoadmap/AnalyticNumberTheoryPartIII/Suggested.lean`, is in one of the pull request's own folders, and this README does not cite that roadmap.
- **Source locator re-read.** [Borel] Lemma 5.5 (borel lines 655–658) was re-read for C02. No other locator lies in changed text, so no seeded target was re-read.
- **Citations.** No cross-roadmap citation is unresolved. All 50 Lean-name leads resolve:
  - those of this roadmap are declared in `Suggested.lean`;
  - `Lang.lang_surjective` is at ReductiveGroupsPartII `Suggested.lean:212`;
  - `modularCharacter_eq_one` is at line 330 and `modularCharacter_eq_adjointModulus` at line 314 of the same file;
  - `Torsor.trivial_iff_section` is at SchemeAndStackFoundations `Suggested.lean:354`.
- **Automatic checks.** Every automatic check passed on this head.
  - The dependency check printed `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)` (exit 0), with no UPWARD or CYCLE line.
  - Nothing changes outside the pull request's own folders: the diff against main that excludes them is empty.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. The file is unchanged since main.
- **Record.** No layer, heading or Lean declaration of the README on main is removed (0 removed, 6 headings added).

Overlap check: read GlobalNumberFields, OrthogonalSpinGroups, QuaternionicModularForms, SurfaceGroupCharacterVarieties and HodgeClassesForJacquetLanglands (open), and OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII and ArithmeticLocallySymmetricSpaces (main). A search of every open head for Ono's formula, `τ(R¹…)`, class-set integration, the mass and strong approximation for any finite set found these objects stated only in this pull request. Owners of the shared objects:

- the family roadmaps (DiscreteSeriesCoefficientsAndAutomorphicMetrics 7.5a, HermitianFormsAndLattices, SeesawForThetaChains, ThetaLiftsForDefiniteUnitaryGroups) cite AA §§4.5a and 4.1a under *Corollary of:*; owner AA;
- AutomorphicFormsOnReductiveGroups §7.5a owns the class-set inner product and cites AA §4.5a for the mass;
- OrbitMeasuresOnAdelicGroups 2.6 and 3.4a name AA as owner; owner AA;
- nothing else is shared.

Source independence: changed passages only, and there are none in this folder, so the comparison of the previous review stands. That review compared 20 passages with 11 sources and found none shared. Largest share: Borel, 52 of 363 locators. Contents compared with Borel §§1–8: independent.

Research link: 3.7 is the Siegel-set reduction used by Bakker–Klingler–Tsimerman (2020) for definability and by Orr (2018; Orr–Schnell 2023) for height bounds. 4.6 gives the compact quotients of Khayutin's (2019) CM equidistribution. 5.1 is the `GL₁` case of Calegari–Geraghty (2018). Rests on README 3.7, 4.6 and 5.1 and on the texts the previous review read.

## Not verifiable

- [Platonov–Rapinchuk–Rapinchuk] (Theorems 3.60, 3.63, 3.64, 3.71, 5.22, 1.34): the publisher's copy is paywalled.
- [Weil], *Adeles and Algebraic Groups* (2.6): no open copy.
- [Tate], thesis (3.4a): no legal copy found by the sources service.
- [Ono] (4.1a): JSTOR only.
- [Gross] (4.5a): publisher paywall.
- [Kneser] (4.2a): publisher paywall.
- [Orr–Schnell] (3.7): the copy found is not in an open licence class.
- [BHC] (3.7): not read.
- [Platonov] (4.2a): cited without a locator.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside the roadmap folder under review (so that no unreviewed file rides in with it), run without the pull request's list of its own folders, flagged 112 files in its other roadmap folders; those folders are the pull request's own, each reviewed separately, and the run that knows them passes.

## Source issues

- **Error** in CG (Calegari–Geraghty, arXiv:1207.4224v2) at §8.2, p. 79: the source says `π₀(X_Q)` is the maximal exponent-`p^n` quotient of the ray class group of conductor `Q`; it should be `F^×\𝔸^×/U_Q(F⊗ℝ)^{×,0}`, which maps onto the narrow class group (`Q = ∅`, `h = 3`, `p = 5`: three components, not one); affects a stated result.

## For the human reviewers

- none
