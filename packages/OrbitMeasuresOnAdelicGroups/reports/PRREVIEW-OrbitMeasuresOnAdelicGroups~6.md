# Review of OrbitMeasuresOnAdelicGroups (pull request #2879 at f97ba47)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 42 lines changed since `b444955`, all in the README: the four earlier small corrections are repaired, and the forms of the formal proof's statements that the README now records were compared with the repository's files and recomputed (the constant `(2^{−r_2}|d_F|^{1/2})^{j²}` is the one the proof states, and at `j = 1` it is the ratio of the lattice-sum volume to `κ_F`). One small correction remains, on the description's validation paragraph; there is no format note. The new locators into Tate and Weil 1965 could not be read, and the human reviewers have the family premise, the licence of the formal proof's repository and the unread texts to decide.

## C01 — The description's validation paragraph describes an earlier state of the checks

The last sentence of the description's validation paragraph says that the automatic checks report "only the three files of the family index, which lie outside the folder, and that the roadmap is not yet in the merge order, where it goes after its last supplier." At this head the automatic checks report nothing, and the merge order lists the roadmap directly after LogicAndDefinabilityInNumberTheory, its last supplier. A reader of the description expects two open reports that are not there.

Replace the sentence by, for instance: "The automatic checks pass; the merge order places the roadmap directly after LogicAndDefinabilityInNumberTheory." The rest of the description agrees with the head: the seven suppliers and where each stands, the two roadmaps cited without being suppliers, the two `Suggested.lean` declarations, and the sentence that the README records the form of each cited declaration of the formal proof in its own words, which this head makes true.

## Previous findings

The previous report (of `b444955`) had no finding; its four small corrections:

- C01 — repaired: line 297 reads "[Tate], §4.3: the volume `κ_F` of the norm-one idele classes … §4.4: the residue of the zeta integral"; line 191 reads "[Weil 1965], Proposition 6, §37, p. 54, and §§42–43, pp. 60–62". Neither text could be read (below).
- C02 — repaired: the three places now record the form, e.g. line 306: "is `κ_F·(2^{−r_2}|d_F|^{1/2})^{j²}·∏_{l=2}^{j} ζ_F(l)`; its case `j = 1` amounts to `μ^1(F^×\𝔸_F^1) = κ_F`". Checked against the repository and recomputed.
- C03 — repaired: all six paths now begin `src/Development/AbelianVarietyTheory/…`.
- C04 — repaired: the description lists AdicSpacesPartV among the suppliers on main and says HeightsRationalPointsAndObstructions §3.18b is "cited as it stands at the head of its open pull request, in a Check of 3.4a".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.4a *tamagawa-multiplicative-group*, recorded form of `GenLinVolume` (changed): the constant | the repository's definitions; totally complex `E` | proof: `Res ζ_E · vInv^{fDeg·j²} · ∏_{l=2}^{j} ζ_E(l)`, `vInv = |d_E|^{1/(2·fDeg)}/2`, `fDeg` = number of infinite places `= r_2`; so `vInv^{fDeg·j²} = (2^{−r_2}|d_E|^{1/2})^{j²}` | README agrees |
| same, case `j = 1` "amounts to `μ^1 = κ_F`" (changed) | general totally complex `F`; `F = ℚ(i)` | slab volume mod units for `∏ dx dy/|z|²`: `π^{r_2}R/w` per class, sum `π^{r_2}hR/w`; `κ_F = (2π)^{r_2}hR/(w|d_F|^{1/2})`; ratio `2^{−r_2}|d_F|^{1/2}`. `ℚ(i)`: `π/4 = (π/4)·(2^{−1}·2)` | holds |
| same, slab and measure (changed) | repository: `detNorm`, `haarGL`, `MatInf` | `detNorm = ∏_w |det x_w|²  = ∏_w |det x_w|_ℂ`; slab `1 ≤ detNorm < e`; Lebesgue volume with density `detNorm^{−j}`; index set the infinite places | README agrees |
| same, exponent `j²` for general `j` | Lebesgue against Tamagawa on `M_j` | Lebesgue `dx dy` on `∏_w ℂ` gives `𝒪_F` covolume `2^{−r_2}|d_F|^{1/2}`, Tamagawa gives 1; `j²` coordinates, so factor `(2^{−r_2}|d_F|^{1/2})^{j²}`; remaining `κ_F ∏_{l=2}^{j} ζ_F(l)` is `τ(GL_j) = 1` | consistent |
| 2.6 (iv), recorded form of `tamagawa_adelicHaar_eq_map_product_measure` (changed) | repository statement; `F = ℚ`, `κ` of size 2; `κ = ∅` | proof: `ν` of covolume one on `𝔸_F`, `μ` Tamagawa on `κ → 𝔸_F`, `μ` = reindexed product. `κ` of size 2: `μ = cν²`, `c = μ(D²)/ν(D)² = 1`. `κ = ∅`: point mass 1 both sides | README agrees; holds |
| 3.4a Check `GL_n → PGL_n`, "the case `j = n` of the volume formula" (changed) | `n = 2` | form at `j = 2`: `κ_F (2^{−r_2}|d_F|^{1/2})⁴ ζ_F(2)`, the volume form of `τ(GL_2) = 1`; then `τ(PGL_2) = 2·1/1 = 2` | consistent |
| 3.4a, [Tate] §§4.3, 4.4 against the statement (changed) | the measure normalisation in the README | README: `d^×x = μ^1 ⊗ d|x|/|x|`, `d|x|/|x| = [F:ℚ] dt/t` in the diagonal coordinate; citation says `dt/t` in `t = |x|`: same measure | consistent; text not read |

The rows of the previous review, of `b444955`, for the untouched statements stand as written there.

- Source locators checked against the text: the three statement and definition files of the formal proof that carry the recorded forms, at their `src/` paths, and the file defining its constants `vInv` and `fDeg`; 0 of the 4 new locators into Tate and Weil 1965 (texts not readable). The Weil 1965 locators agree with those GeometryOfNumbersAndQuadraticArithmetic §3.3 on main gives for the same statements (its README, line 912).
- Library declarations opened at the pin: none new; the changed passages name no library declaration.
- Cross-roadmap citations resolved: GeometryOfNumbersAndQuadraticArithmetic §3.3 on main; HeightsRationalPointsAndObstructions §3.18b `tamagawa_SLquotient_two` at its open head; all seven suppliers of the description located (six on main, LogicAndDefinabilityInNumberTheory open and directly before this roadmap in the merge order).
- Automatic checks: all passed. Dependency check: `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` is unchanged since `b444955`; it elaborates with the two `sorry` warnings only, and the elaborated types of both declarations are as in the previous review.
- Headlines: unchanged. (1)–(3) are not statable at the pins and the docstring says so; (4) is stated in two clauses.
- Changes outside the folder: the family index only, unchanged since `b444955`. No layer was added, removed or reordered.

Overlap check: read HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs, BaseChangeAndGaloisRepresentationsForUnitaryGroups, FiniteReductiveGroups (open), AdelicAlgebraicGroups, ReductiveGroupsPartIII, EndoscopicTransferAndUnitaryTraceComparisonPartII (main), as in the previous review; the list by results is empty; nothing shared. The change adds citations and recorded forms only and moves no ownership.

Source independence: changed passages only: 3 passages (the recorded forms at 2.6 (iv), 3.4a and the Check of 3.4a) compared with 4 files of the formal proof; none shared (prose statements of Lean signatures, paths and declaration names only); largest share Oesterle1984, 13 locators as counted in the previous review, the change adding four to Tate and Weil 1965; the arrangement was not compared again, no layer having been added, removed or reordered. Weil, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg and Humphreys could not be read.

Research link: Layers 2–3 are the Tamagawa-measure comparisons of Weil (1961, 1965), Sansuc (1981) and Oesterlé (1984), used by HermitianFormsAndLattices for `τ(U(V)) = 2`, local densities and Siegel's main theorem; Layer 4 is Steinberg's connectedness theorem (1968), used by FiniteReductiveGroups. Rests on the README's overview and Downstream consumers, and on Oesterle1984 and Sansuc1981.

## Not verifiable

- Tate's thesis in Cassels–Fröhlich, §§4.3 and 4.4 and the page range 305–347 (new locators): no open copy; not in the manifest. The section numbers agree with the standard division of the thesis as I know it, which is not a reading.
- Weil 1965, Proposition 6, §37, p. 54, and §§42–43, pp. 60–62 (new locators): recorded as uncertified (paywalled); they agree with the locators of GeometryOfNumbersAndQuadraticArithmetic §3.3.
- Weil, *Adeles and Algebraic Groups*, Chapter II, Section 2.4: a book with no open copy; not in the manifest.
- Platonov–Rapinchuk–Rapinchuk, Theorem 3.71, p. 196: a 2023 Cambridge University Press book behind a paywall.
- Steinberg, Memoirs of the AMS 80, Theorem 8.1, and Humphreys, §2.11: no legal copy found in an earlier round; not searched again.
- The formal proof: I read the statements and definitions cited, not the proofs behind them, and did not build the repository.

## Source issues

- none

## For the human reviewers

- Scope: the family index and the description say the family follows a formal proof of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026. I did not verify the proof; this roadmap's statements are standard Tamagawa theory and do not depend on it.
- Licence: the repository cited as [FormalProof] states in its README that the formalization was published without a licence and is mirrored for verification only. The README here cites six of its file paths and declaration names (lines 178–185, 299–306, 447–451), now with each statement's form in prose, and copies no code.
- Not tested: six cited texts (Weil 1961, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg, Humphreys) could not be read legally, so wording was not compared with them. The source with the largest share, Oesterle1984, was read in an earlier review.
