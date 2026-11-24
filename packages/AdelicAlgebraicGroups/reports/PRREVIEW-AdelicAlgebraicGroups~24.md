# Review of AdelicAlgebraicGroups (pull request #3027 at 71bbefa)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. The roadmap folder has not changed since the previous review, of 4a2d22f. Since then the branch has merged main and changed AnalyticNumberTheoryPartI, but only its §§1.7a–1.7b; this README cites only its §2.18a, which is unchanged and still supports the convergence factors of 2.4 and the base-change transport of 2.5. There are four small corrections and no format notes. Three are the earlier ones, unrepaired: the description, a [Borel] locator, and missing locators. The new one is that the volume identity of 4.5a and GeometryOfNumbersAndQuadraticArithmetic §3.3.4 do not say that the second is a case of the first. The earlier question for the author is carried. Nothing is left for the human reviewers.

## C01 — The description does not mention this roadmap, although its addition is larger than four of the additions it names

A reader of the description cannot tell that AdelicAlgebraicGroups gains six subsections (1.5a, 2.6, 3.4a, 4.1a, 4.2a and 4.5a). The description's sentence on the largest additions names ComplexComparisonPartII, ReductiveGroups, RepresentationTheory/CharacterTheory, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions, MetaplecticAutomorphicForms and, since the last review, AlgebraicModuliForArithmeticGeometryPartII. It omits this roadmap.

At this head the README gains 621 inserted lines against main. Four of the named additions are smaller:

- AlgebraicModuliForArithmeticGeometryPartII: 444;
- GeometryOfNumbersAndQuadraticArithmetic: 283;
- HeightsRationalPointsAndObstructions: 249;
- MetaplecticAutomorphicForms: 244.

A clause in that sentence would make it right: "…, and AdelicAlgebraicGroups (lattice stabilizers; measures of top forms, of groups with a unipotent radical and on homogeneous spaces; `τ(G_m) = 1` and the Tamagawa numbers of groups with a unipotent radical; Ono's formula; strong approximation for any finite set of places; class-set integration and the mass)".

## C02 — [Borel] §5.5 does not state that reductive groups are unimodular, which two targets of 1.5 cite it for

Two targets in 1.5 cite "[Borel], §5.5, p. 20": *Local unimodularity of reductive groups* (line 1016) and *Adelic groups of reductive groups are unimodular* (line 1022). A reader who opens that locator finds only half of the argument.

Borel's Lemma 5.5 (borel lines 655–658) proves two things:

- the unimodularity of the adelic, archimedean and related groups is equivalent to every left-invariant rational top form being right-invariant;
- `G_A` is unimodular when `G` has no rational character.

`GL_n` has a rational character (`det`), so these targets also need `det Ad = 1` on a reductive group, and that step is not in the passage. The statements themselves are true.

Either repair works:

- cite Oesterlé, Chapter I, Proposition 5.3 and Corollaire 5.4, p. 23, which are already in the References;
- or add "with `det Ad = 1` on reductive groups" to the citation.

## C03 — Some citations in the new subsections have no locator, and one target has none at all

*tamagawa-quadratic-norm-torus* (line 4241) cites only "[Ono], as the case of *tamagawa-torus-ono* computed in the Route". Three other citations have no theorem or page either:

- [Gross] in *class-set-integration* (line 5217);
- [Kneser] and [Platonov] in *strong-approximation-any-places* (line 4619);
- [Platonov–Rapinchuk] in the same target (line 4625).

A reader cannot check these attributions. The statements are standard, and the other locators of those targets hold: [Rapinchuk], Theorem 2.3, p. 12, and [Arthur], (2.1), p. 13.

The repair is a theorem or page for each. For the norm-one torus, Oesterlé, Chapter IV, Corollaire 3.3, p. 56, together with the computation in the Route, would do.

## C04 — The volume identity of 4.5a contains GeometryOfNumbersAndQuadraticArithmetic §3.3.4, and neither roadmap says so

As written, the same identity is planned twice, with no single owner and no citation between the two.

- *class-set-integration* (4.5a, line 5200) takes `G` connected reductive with `G(F_∞)/A_G(ℝ)^0` compact and proves `vol(G(F)\G(𝔸)^1) = vol(U)·vol(G(F_∞)/A_G(ℝ)^0)·mass(U)`, with `mass(U) = Σ_i |G(F) ∩ x_iUx_i^{−1}|^{−1}`.
- Take `G = SO(q)` for a totally positive form `q` over a totally real field, and `U` the integral stabilizer of a lattice. Then `A_G` is trivial and `G(F_∞)` is compact. The identity becomes GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (that README, line 1138): proper mass equals `vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f))`, each double coset weighted by the reciprocal order of its proper integral stabilizer.
- That section's *Needs:* line cites AdelicAlgebraicGroups AA.2 and AA.3 only.
- This README's ownership paragraph (line 5843) still assigns "the adelic mass identity" to GeometryOfNumbersAndQuadraticArithmetic §3.3 without saying that 4.5a now states it in general.

The smallest repair on this side is a clause in that paragraph: "§3.3.4 there is the case `G = SO(q)` of *class-set-integration* (AA.4.5a)". The matching citation of AA.4.5a from GeometryOfNumbersAndQuadraticArithmetic §3.3.4 belongs to that roadmap, which comes later in the merge order.

## Questions for the author

- *tamagawa-torus-ono* (lines 4201–4229): is the global duality for tori meant to be derived inside this target?
  - The route uses the duality of `H¹(F, X*(T))` with `H¹(Gal, T(𝔸 ⊗ F̄)/T(F̄))`, the bijectivity of `Λ_T` and the exact sequence with `Ш²` (Oesterlé IV 2.5, 2.7).
  - The *Needs:* line names only ClassFieldTheory layers 0 and 11, while the bijectivity of `Λ_T` also uses layers 5 and 10.
  - ArithmeticGaloisDuality states the torus duality, but it comes after this roadmap in the merge order.
  - If the derivation belongs here, the *Needs:* line could say "proved as part of this target".
  - What stopped me: I could not tell whether layers 0 and 11 are meant to supply the derived statements.

## Previous findings

- none: the previous report raised no finding (P1 or P2). Its small corrections C01–C03 are unrepaired, since the folder did not change, and are carried above under the same numbers. C01 is updated for the description's current list of additions.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| 1.5 *Local unimodularity of reductive groups* (C02) | `GL₂(ℚ_p)`, `diag(p,1)`; Borel subgroup as control | `Ad` on `gl₂`: eigenvalues `p, p⁻¹, 1, 1`, det `1`; on `Lie B`: `1, 1, p`, `|det|_p = p⁻¹ ≠ 1` | true; reductive hypothesis needed; C02 locator only |
| 4.1a *tamagawa-quadratic-norm-torus* (C03) | `E/F` quadratic, `X* = ℤ`, `σ = −1` | `H¹(C₂, ℤ_−) = ker N/(σ−1)ℤ = ℤ/2ℤ`; `Ш¹ = 1` (Hasse norm theorem); `τ = 2/1 = 2` | true; C03 locator only |
| 4.2a *strong-approximation-any-places* (C03) | `SL₂/ℚ`, `S = {2}`; Hamilton `D¹`, `S = {2}` | `SL₂(ℚ₂)` noncompact, `SL₂(ℤ[1/2])` dense in `SL₂(ℝ)×∏_{p odd}SL₂(ℤ_p)`; `D¹(ℚ₂)` compact, `D¹(ℤ[1/2])` finite, not dense in `SU(2)` | true; noncompactness needed |
| 4.5a `mass(U′) = [U:U′]·mass(U)` (C03) | `GL₁/ℚ`, `U = ℤ̂^×`, `U′ = {u ≡ 1 mod 5}`, and `mod 4` | `mass(U) = 1/2`; mod 5: 2 classes, trivial stabilizers, `2 = 4·½`; mod 4: 1 class, `1 = 2·½` | true; Checks of 4.5a agree |
| 4.5a volume identity against GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (C04) | `SO(x²+y²+z²)/ℚ`, `L = ℤ³` | one proper class, `|SO(ℤ³)| = 48/2 = 24`; 4.5a gives `vol = vol(K_f)·vol(SO(3)(ℝ))/24`; §3.3.4 gives proper mass `1/24` | same identity; C04 |
| 2.4 *convergence-factors*, consuming ANT I §2.18a | norm-one torus of `ℚ(i)`, `X = ℂ_η`; `G_m` | split `(1−p^{−s})⁻¹`, inert `(1+p^{−s})⁻¹`, at 2 `X^{I} = 0`, factor `1`; `r = 0`, limit `L(1,χ₋₄) = π/4 > 0`; `G_m`: `r = 1`, `Res ζ_F` | true; matches §2.18a at this head |
| 2.5 base-change transport, induction identity of ANT I §2.18a | `Res_{ℚ(i)/ℚ}G_m` against `G_m/ℚ(i)` | `L_ℚ(s, ℤ[C₂]⊗ℂ) = ζ_{ℚ(i)}(s)`; at 3: `(1−3^{−2s})⁻¹` both sides; `r = 1` both; leading coefficient `π/4` both | true |

The rows of the previous review, of 4a2d22f, for the untouched statements and the headline theorems stand as written there.

- **Change since 4a2d22f.** The diff of the folder is empty.
  - The files changed elsewhere are in the pull request's own folders, or came in with the merge of main: `.github` scripts, `umbrellas/` and ComplexCurveModuli are absent from the diff against main.
  - Of the folders that changed, this README cites only AnalyticNumberTheoryPartI, and only its §2.18a, which is unchanged (its changes are at its §§1.7a–1.7b).
  - Main has not changed this folder since the merge base `aecb53a`.
- **Source locator re-read.** [Borel] Lemma 5.5 (borel lines 655–658) was re-read for C02. No locator lies in changed text, so no seeded target was re-read.
- **Citations.** No cross-roadmap citation is unresolved. The external Lean-name leads resolve at this head:
  - `Lang.lang_surjective` is at ReductiveGroupsPartII `Suggested.lean:212`;
  - `modularCharacter_eq_adjointModulus` is at line 314 and `modularCharacter_eq_one` at line 330 of the same file;
  - `Torsor.trivial_iff_section` is at SchemeAndStackFoundations `Suggested.lean:354` and `torsorRepresentability` at line 361;
  - `IsCartanInvolution` is at ArithmeticLocallySymmetricSpaces `Suggested.lean:45`.
- **Ownership.** ANT I §2.18a was read at this head, and so were GeometryOfNumbersAndQuadraticArithmetic §3.3.4 and OrthogonalTamagawaAndLatticeMass (main) for C04.
- **Dependency check.** It printed `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)` (exit 0), with no UPWARD or CYCLE line.
- **Automatic checks.** The worker's checks all passed. My own gate run passed every check except the one set aside below.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` exits 0 with 19 warnings, all ``declaration uses `sorry` ``. The file is unchanged since main. The five declarations flagged as missing a section binder are definitions (`RestrictedHaar.box`, `AdelicPoints.InfinitePoints`, `Reduction.IsCentralCocharacter`, `Neat.algebraicPointMap`, `Neat.IsFaithfulAlgebraicPointHom`) whose bodies do not use the dropped instance, so no theorem's hypotheses are lost.
- **Record.** No layer, heading or Lean declaration of the README at the merge base is removed: 0 removed and 6 headings added.

Overlap check: the three closest-roadmap lists are unchanged since the previous review. Its reading of their scope stands: GlobalNumberFields, OrthogonalSpinGroups, QuaternionicModularForms, SurfaceGroupCharacterVarieties and HodgeClassesForJacquetLanglands (open), and OrbitMeasuresOnAdelicGroups, ReductiveGroupsPartII and ArithmeticLocallySymmetricSpaces (main). This round I searched the open heads again for Ono's formula, the mass and class-set integration, and read GeometryOfNumbersAndQuadraticArithmetic §3.3 and OrthogonalTamagawaAndLatticeMass. Owners of the shared objects:

- class-set integration and the mass: owner AA §4.5a. AutomorphicFormsOnReductiveGroups §7.5a and the family roadmaps cite it. GeometryOfNumbersAndQuadraticArithmetic §3.3.4 states its `SO(q)` case without citing it (C04).
- lattice mass formulas: owned by OrthogonalTamagawaAndLatticeMass and IntegralLattices, which consume AA.1–AA.4.2.
- OrbitMeasuresOnAdelicGroups 2.6 and 3.4a: owner AA.
- nothing else is shared.

Source independence: changed passages only. There are none in this folder, so the previous review's comparison stands: 20 passages compared with 11 sources, none shared; largest share Borel, 52 of 363 locators; contents compared with Borel §§1–8: independent.

Research link: 3.7 is the Siegel-set reduction used by Bakker–Klingler–Tsimerman (2020) for definability and by Orr (2018; Orr–Schnell 2023) for height bounds. 4.6 gives the compact quotients of Khayutin's (2019) CM equidistribution. 5.1 is the `GL₁` case of Calegari–Geraghty (2018). This rests on README 3.7, 4.6 and 5.1 and on the texts read in earlier reviews.

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

Automatic checks set aside as false positives: one check requires that a pull request change nothing outside the roadmap folder under review, so that no unreviewed file rides in with it. Run without the pull request's list of its own folders, it flagged 115 files. All of them are in the pull request's other roadmap folders, each reviewed separately, and the worker's run, which knows those folders, passes.

## Source issues

- none

## For the human reviewers

- none
