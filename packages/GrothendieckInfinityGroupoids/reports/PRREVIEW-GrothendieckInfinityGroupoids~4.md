# Review of GrothendieckInfinityGroupoids (pull request #1060 at 36b3d62)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/GrothendieckInfinityGroupoids/README.md` and `Suggested.lean` at the repaired head (567 changed lines since 06ebae5). The gate passes at the head (every check 0, build OK), the dependency check passes (0 problems), and the four findings of the previous review are repaired in the text. One blocking finding remains (R01): the coglobular space of disks `stdDisks`, the carrier of the headline `piPresheaf_isWeakEquivalence_iff`, is built on four admitted lemmas, so `#print axioms stdDisks` shows `sorryAx`; all four prove at the pins in under thirty lines, tested, and the repair is given verbatim. One note (R02).

**Previous findings, finding by finding.**

| Previous | Status | Evidence at 36b3d62 |
| --- | --- | --- |
| R01 Corollary 8.11 absent | repaired in statement, see R01 below | `piPresheaf_isWeakEquivalence_iff` (`Suggested.lean` lines 458–461) with the hypothesis `IsGlobularFunctor C.toGlobularExtension stdDisks R`; `stdDisks` (182–187), `hemisphere` (166–173), `IsGlobularFunctor` (326–335); README 5.4 (lines 485–496), Conventions 114–120, 1.1 (208–225). The docstring (lines 28–32) now names only Theorem 8.7, Proposition 5.5 and Corollary 8.8 as not stated, with the reason (group and groupoid structures of Layers 3.2 and 4.1). The construction itself is the defect of R01 below. |
| R02 catalogue docstring, process leftovers | repaired | lines 7–9 say the README is the roadmap and each declaration is an acceptance test; "is not exhaustive", "All checked on zbMATH", and the "Porting guidance" section are gone (its two facts are at README 665–667). |
| R03 README shape | repaired | `## Layer k` / `### k.n` throughout (lines 167–581); every layer ends with `### Examples` and `### Dependencies`; `*Needs:*` lines name declarations (e.g. 1.2 line 232–233, 6.1 line 520–521); "## Ordering" is gone. |
| R04 Checks naming Lean, no orientation witness | repaired | 1.1 Checks (220–225) and 1.2 Checks (234–242) are prose; the `(1, 0, 1)` witness is the first Check of 1.2 (`s(u) = t(v)`, composable pair `v` then `u`), which I recomputed below. |

## R01 (P2) — `stdDisks` and `hemisphere` are data built on `sorry`: the headline's carrier is admitted

- Location: `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` lines 149–151 (`norm_hemiPoint … := by sorry`), 154–155 (`continuous_hemiPoint`), 159–162 (`hemiPoint_hemiPoint`), 176–178 (`hemisphere_hemisphere`); their consumers `hemisphere` (lines 166–173, uses `norm_hemiPoint` and `continuous_hemiPoint` in its body) and `stdDisks` (182–187, fields `σ_σ`, `τ_σ` are `hemisphere_hemisphere …`); the docstring line 25–26 ("Definitions have real bodies; only theorem statements are `sorry`") and README line 159–162 ("`Suggested.lean` builds the coglobular space of disks (`stdDisks`, 1.1)").
- Claim: `Suggested.lean` states the headline theorems against carriers that exist at the pins, with real bodies for the few definitions a headline needs and no sorry'd data. `hemisphere n ε` is a morphism of `TopCat` whose membership proof and continuity proof are admitted, and `stdDisks` is a `CoglobularObject` whose two identity fields are admitted: the carrier of `piPresheaf_isWeakEquivalence_iff` is data that depends on `sorryAx`. The four admitted statements are not headline theorems either (routine facts about `√(1 − ‖x‖²)`); they are in the file only as the proof obligations of the two definitions. The gate's `sorry-data` scanner looks for `def … := sorry` and does not see this form.
- Witness: a scratch copy of the file followed by `#print axioms stdDisks`, `#print axioms hemisphere` and `#print axioms piPresheaf_isWeakEquivalence_iff`, elaborated with `lake env lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`): each lists `sorryAx`; `GlobularExtension.ofTable_globe`, for comparison, lists only `propext, Quot.sound`. A second probe with the four lemmas proved (below) and the same `stdDisks`: `stdDisks` depends on `propext, Classical.choice, Quot.sound` only, no error, no warning except an unused simp argument. In that probe `continuous_hemiPoint` also closes with `unfold hemiPoint; fun_prop`, so it is library-trivial once stated.
- Repair: replace the four `sorry`s by these proofs (tested at the pins with the file's own signatures and the body `fun i => x i`; the extra lemma `hemiPoint_eq_of_norm_eq_one` can be inlined if preferred), delete nothing else, and keep docstring line 25–26 as it is, which then becomes true:

```lean
theorem norm_hemiPoint (n : ℕ) (ε : Bool) {x : EuclideanSpace ℝ (Fin n)} (hx : ‖x‖ ≤ 1) :
    ‖hemiPoint n ε x‖ = 1 := by
  have h0 : 0 ≤ 1 - ‖x‖ ^ 2 := by nlinarith [norm_nonneg x]
  have hx2 : ‖x‖ ^ 2 = ∑ i, ‖x i‖ ^ 2 := by
    rw [EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun i _ => sq_nonneg _)]
  have hs : ((if ε then (-1 : ℝ) else 1) * Real.sqrt (1 - ‖x‖ ^ 2)) ^ 2 = 1 - ‖x‖ ^ 2 := by
    cases ε <;> simp [Real.sq_sqrt h0]
  rw [EuclideanSpace.norm_eq, Real.sqrt_eq_one]
  simp only [hemiPoint, Fin.sum_univ_castSucc, PiLp.toLp_apply, Fin.snoc_castSucc, Fin.snoc_last,
    Real.norm_eq_abs, sq_abs, hs]
  simp only [Real.norm_eq_abs, sq_abs] at hx2
  rw [← hx2]; ring

theorem continuous_hemiPoint (n : ℕ) (ε : Bool) : Continuous (hemiPoint n ε) := by
  unfold hemiPoint
  refine (PiLp.continuous_toLp (p := 2) (β := fun _ : Fin (n + 1) => ℝ)).comp ?_
  refine Continuous.finSnoc (PiLp.continuous_ofLp (p := 2) (β := fun _ : Fin n => ℝ)) ?_
  exact continuous_const.mul
    (Real.continuous_sqrt.comp (continuous_const.sub (continuous_norm.pow 2)))

/-- On the unit sphere both signs give the same point: the last coordinate is `0`. -/
theorem hemiPoint_eq_of_norm_eq_one (m : ℕ) (ε ε' : Bool) {y : EuclideanSpace ℝ (Fin m)}
    (hy : ‖y‖ = 1) : hemiPoint m ε y = hemiPoint m ε' y := by
  simp only [hemiPoint, hy, one_pow, sub_self, Real.sqrt_zero, mul_zero]

theorem hemiPoint_hemiPoint (n : ℕ) (δ ε ε' : Bool) {x : EuclideanSpace ℝ (Fin n)}
    (hx : ‖x‖ ≤ 1) :
    hemiPoint (n + 1) ε (hemiPoint n δ x) = hemiPoint (n + 1) ε' (hemiPoint n δ x) :=
  hemiPoint_eq_of_norm_eq_one (n + 1) ε ε' (norm_hemiPoint n δ hx)

theorem hemisphere_hemisphere (n : ℕ) (δ ε ε' : Bool) :
    hemisphere n δ ≫ hemisphere (n + 1) ε = hemisphere n δ ≫ hemisphere (n + 1) ε' := by
  ext x
  apply ULift.ext
  apply Subtype.ext
  exact hemiPoint_hemiPoint n δ ε ε' (mem_closedBall_zero_iff.1 x.down.2)
```

  If `hemiPoint_eq_of_norm_eq_one` is kept, add its name to README item 1.1 (line 215–217 lists the other four).

## R02 (P3) — A quotation and a content claim about an archival letter nobody read

- Location: `README.md` lines 21–24 ("The « yoga » first appears … p. 42: an `n`-groupoid up to `n`-equivalence is « essentially the same thing » as a homotopy `n`-type") and lines 442–444 ("The 1975 letter to Breen … sets out the fundamental `n`-groupoid of a Kan complex and the comparison of homotopy groups that this layer specifies in Ara's form (Montpellier fonds, folder 134-2, pp. 42–45 …)").
- Claim: a statement in the README is the author's own words with a locator into a text that can be read; a phrase in quotation marks is a quotation. The letter is an image scan in an archive (the pull-request description says the idea "appears in a 1975 letter … mentioned in one line"); the archive host timed out for me, and the previous review did not read it either. Neither passage affects a target.
- Witness: the two passages; the archive URL could not be fetched (host timed out); nothing in Ara 2013 or Maltsiniotis 2010 is cited for either claim.
- Repair: drop the quotation marks and the content claim, keeping the pointer: "Grothendieck's 1975 letter to Breen (Montpellier fonds, folder 134-2) is the first appearance of the idea; the definitions specified here are the refereed ones of Ara 2013", and shorten lines 442–444 to that pointer, or cite a published account (Maltsiniotis's introduction to the 2022 edition of *Pursuing Stacks*, with its page) for what the letter says.

## Verified sound

**Gate and tooling.** Worker's gate at 36b3d62: every check 0 (`set_option`, `sorry-data`, `sorry-examples`, residue, imports, `readme-ids-missing`, `layer-ids`, `target-ids`, `stray-files`, `outside-folder` all 0), build of `TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` OK. Dependency check run by me on this head: `depcheck: 205 roadmaps, 1419 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The roadmap is line 13 of the merge order, right after StableHomotopyKTheory (line 12), its only roadmap supplier; HomotopyTheoryOfCategories is a consumer and not in the order. `git diff --stat origin/main...HEAD` outside the folder: empty. `metadata.toml` unchanged. No declared gaps and no `design/plan.json`: nothing to check there.

**Pins.** `lake-manifest.json` pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`; the packages directory is checked out at exactly those revisions (its reflog has been quiet since 2026-10-30 18:44). Opened at the pins: Mathlib `Topology/Category/TopCat/Sphere.lean` line 28 (`TopCat.disk n = ↧(ULift (Metric.closedBall 0 1))`), 32 (`diskBoundary`), 58 (`diskBoundaryInclusion`); `Control/ULift.lean` line 87 (`ULift.map`); `Topology/Constructions.lean` line 1379 (`continuous_uliftMap`); `Analysis/Normed/Lp/PiLp.lean` line 92 (the `CoeFun` instance, so `x i` is `ofLp x i`), 141 (`PiLp.toLp_apply`), 538 and 546 (`continuous_ofLp`, `continuous_toLp`); `Analysis/InnerProductSpace/PiL2.lean` line 145 (`EuclideanSpace.norm_eq`); `Analysis/Real/Sqrt.lean` lines 171, 177, 267 (`sqrt_eq_one`, `sq_sqrt`, `sqrt_eq_zero'`); `Data/Fin/Tuple/Basic.lean` lines 526, 539 (`snoc_castSucc`, `snoc_last`); `Algebra/BigOperators/Fin.lean` line 84 (`prod_univ_castSucc`, whose additive form is `sum_univ_castSucc`); `CategoryTheory/Localization/Predicate.lean` line 304 (`Localization.lift`); `CategoryTheory/MorphismProperty/TransfiniteComposition.lean` line 52; `CategoryTheory/ObjectProperty/FullSubcategory.lean` line 39; `Topology/Connected/PathConnected.lean` lines 117 and 158 (`ZerothHomotopy`, `ZerothHomotopy.lift`); `Topology/Homotopy/HomotopyGroup.lean` lines 441 and 489 (`HomotopyGroup`, `pi0EquivZerothHomotopy`). Tau Ceti `Topology/Homotopy/HomotopyGroup/Map.lean` line 119 (`HomotopyGroup.map (f : C(X, Y)) (hf : f x = y) : HomotopyGroup N X x → HomotopyGroup N Y y`, on the quotient, as `weTop` uses it), `AlgebraicTopology/Disk.lean` line 36 (`contractibleSpace_disk`), `Analysis/InnerProductSpace/Hemisphere.lean` line 90 (`hemisphereHomeomorph`: closed hemisphere of the unit sphere of an inner product space to the closed ball of the orthogonal complement, cited by 1.1 for its second Check). Every name of the three supplier tables elaborates (the targeted build passed, and the probe imports only `Mathlib` and `TauCeti.Topology.Homotopy.HomotopyGroup.Map`).

**Elaborated signatures.** `#check @` of all 52 declarations in a scratch copy (exit 0, `sorry` the only warnings). The worker's `signatures.md` flags `CoglobularObject.face`, `faceTo` and `Compatible` for a dropped `[Category.{v} K]`: false positives, the instance is `[inst : Category.{u_2, u_1} K]` in each elaborated type. `piPresheaf_isWeakEquivalence_iff` elaborates to `∀ (C : PseudoCoherator) (R : C.Obj ⥤ TopCat), IsGlobularFunctor C.toGlobularExtension stdDisks R → ∀ {X Y : TopCat} (f : X ⟶ Y), C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f`, with `TopCat.{0}` and presheaves in `Type 0`: the README's 5.4 statement ("for every pseudo-coherator `C` and every `R` with `IsGlobularFunctor C stdDisks R`"). `IsGlobularFunctor` has `obj_disk` as an equality of objects, which is Ara's functor under `𝔾` (ara2013 line 268–276: the triangle commutes), and `isGlobularSum` as the universal property of the image of each chosen sum. Nothing changed.

**One-tactic probe.** `isWeakEquivalence_iff`, direction (2) ⇒ (1): the single term `⟨h.1, fun n x => h.2 n _⟩` elaborates (probe), so the content is (1) ⇒ (2), Ara's Theorem 4.13 (ara2013 line 1617–1623) with `hX`, `hY` used: kept. `continuous_hemiPoint`: `unfold hemiPoint; fun_prop` closes it (probe): library-trivial, which is part of R01 rather than a separate padding note, since the definition `hemisphere` needs it. `norm_hemiPoint`, `hemiPoint_hemiPoint`, `hemisphere_hemisphere`: not one tactic (proofs above), the same status. `nonempty_of_hasPushouts`: no one-tactic proof (iterated pushouts and their universal property), a routine existence statement rather than a headline, kept or deleted at the author's discretion as the previous review said. `piPresheaf_isWeakEquivalence_iff`: Corollaries 8.9–8.11, the roadmap's end theorem. `parallel_refl`, `ofTable_globe` are proved helpers consumed by `idPair` and `identityMap`.

**Cross-roadmap citations, resolved now.** StableHomotopyKTheory at the head of pull request #1227, §2.1 "Weak homotopy equivalences of spaces" (its README lines 506–512): `IsWeakHomotopyEquivalence` ("Bijective π₀ and all positive πₙ at every basepoint"), `IsWeakHomotopyEquivalence.comp`, `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence` exist as cited; `weTop` has that body on `f.hom`. HomotopyTheoryOfCategories at the head of pull request #1521: its supplier table (README line 74) and Layer 8.6 (line 580–581) consume this roadmap's Layer 0.1 `𝔾` and prove it direct with degree `n`, two morphisms `k ⟶ n` for `k < n`, consistent with `Globe.Hom`. GeneralizedCohomology G2 and Mathlib's `HomotopicalAlgebra.ModelCategory` are named in scope only. Ownership by object (`roadmaps grep` over main and the 433 indexed heads for coglobular, globular sum, coherator, `stdDisks`, fundamental ∞-groupoid, hemisphere, `TopCat.disk`): every hit outside this roadmap is the unrelated quasi-coherator of derived categories (ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry), HomotopyTheoryOfCategories' citations of this roadmap, or HomotopySpheres' `standardClosedDiskInSphere` (a smooth embedded closed disc in a sphere, `Suggested.lean` line 369–373 at #284), which is not a hemisphere inclusion `D^n ⟶ D^{n+1}` of `TopCat`. No hemisphere inclusion on `TopCat.disk` exists at either pin. This roadmap is the owner of Layers 0–7 and of `stdDisks`.

**Sources read** (cache ids, cited as `<id> line N`): ara2013 (arXiv 1206.2941v2), henry2016 (arXiv 1609.04622v1), henry2018 (arXiv 1807.02627, fetched this round), henry2019 (arXiv 1711.00744, fetched this round), simpson1998 (arXiv math/9810059). Locators confirmed in ara2013: 1.3 (237–264: tables with `i_k > i'_k < i_{k+1}`, the sum as the colimit with `σ` on the left disk and `τ` on the right disk, dimension the greatest entry), 1.4 (265–276), 1.5.1 (278–279), 1.5.2 (280–291: `σ_i(x) = (x, √(1 − ‖x‖²))`, `τ_i(x) = (x, −√(1 − ‖x‖²))`, faithful), 1.5.3–1.5.4 (292–299), 1.6 (314–322), 1.7 (324–326), 1.8 (327–345), 1.9.1 (346–351), 1.11–1.12 (364–377, bijective on objects), 2.1 (387–408), 2.2 (411–423), 2.3 (424–430), 2.4 (431–433, "pseudo-coherator in [17] and [2]"), 2.5 (434–436), 2.6 (437–439), 2.7.1 (441–444), 2.9 (467–491), 2.10 (492–502), 2.11 (503), 2.12 (505–513, the three coherators), 2.14 (520–527), 2.15.1 (529–531), 3.2 (546–555), 3.4 (616–624: every structural map exists in every contractible globular extension), 3.5 (625–639: `κ_i` in `C₁`), 3.11 (1137), 4.2 (1214–1217), 4.3 (1218–1225), 4.5 (1255), 4.6 (1309), 4.8 (1360), 4.10 (1375), 4.11 (1401–1419, Eckmann–Hilton at 1411), 4.13 (1617–1623), 4.14 (1625–1628), 4.15 (1629–1632), 4.17 (1638–1644), 4.18 (1645–1664), 5.1 (1702–1707: formal coherator, "every coherator is a formal coherator"), 5.2 (1708–1726), 5.3 (1727–1738), 5.4 (1741–1744), 5.5 (1745–1758), 5.6 (1759), 5.8 (1771–1788), 5.10 (1803–1807), 5.11 (1808–1809), 5.12 (1844), 5.13 (1880–1901), 5.14 (1902–1912), 6.6 (2057), 8.1 (2550–2574), 8.4 (2613–2616), 8.7 (2692–2705), 8.8 (2706–2707), 8.9 (2708–2714), 8.10 (2717–2720), 8.11 (2721–2724), 8.13 (2727–2731), 8.14 (2733–2734). henry2016: 5.3.2 (3276–3278), 5.3.3 (3279–3287), 5.3.4 (3289–3291: retracts of transfinite composites of pushouts of `S^n → D^{n+1}` from `∅`), 5.3.5 (3296–3300). henry2018: §6.1 (3199), 6.1.7 (3367–3374), 6.2.5 (3531–3532), 6.3.8 (3834–3836, with `ˆ∆` the semi-simplicial sets, 3156 and 3571), Conjecture 6.4.1 (3861–3870). henry2019: 2.4.9 (1494–1496). simpson1998: Definition 3.1 (481), Proposition 5.1 (570–572), Proposition 5.3 (602–606), Corollary 6.1 (844–846), §7 Conjecture 1 (943–947). Every claim of README lines 599–624 agrees with these.

**Seeded sample.** 1.1: Ara 1.5.2 as above; the README's formulas and the Lean `hemiPoint` (side `false` = `+√`, side `true` = `−√`, `σ n := hemisphere n false`) agree with the source. 1.2: Ara 1.3 and 1.5.1; `Table` encodes `i_k > i'_k < i_{k+1}` by `bot_lt_left`, `bot_lt_right`; `Table.dim` is the sup of the top row. 1.3: Ara 1.5.4 and 1.9.1 as cited. 2.2: Ara 2.1–2.4; `AdmissiblePair.dim_le : T.dim ≤ n + 1`, `IsLifting` with `σ ≫ h = f`, `τ ≫ h = g` (Ara 2.1 line 393–407). 2.3: Ara 2.9, with the globular completion of 1.11–1.12 and "bijective on objects" (491). 2.4: Ara 2.10–2.12; the canonical coherator is Examples 2.12. 3.1: Ara 1.8 (327–339: the canonical map to the iterated fibre product is a bijection), 2.5, 5.4. 3.2: Ara 3.2, 3.4–3.5, 3.11 (every structural map exists in every contractible globular extension, so the item is stated for pseudo-coherators correctly). 4.1: Ara 4.2, 4.3, 4.5, 4.8, 4.11. 4.2: Ara 4.6, 4.13–4.15. 4.3: Ara 4.17–4.18, items (2)–(4) as listed. 5.2: Ara 5.2 (the presheaf `S ↦ Hom(F(S), X)` is globular because `F` is globular, 1718–1721). 6.1: Henry 5.3.2 and 5.3.4. 7.1: Ara 8.13 (2727–2731). 7.2: Ara 5.2 (1723–1726), 5.5, 5.6, 8.8. "Research context" (lines 595–667): verified against henry2016, henry2018, henry2019, simpson1998 as listed; the OpenAI-preprint paragraph (626–662) and the Cisinski citations are textually unchanged since the previous review, which verified them against openai2026, the comparator file and cisinski2006, and were not re-fetched.

**Adversarial pass.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `Globe.Hom.comp`, globular identities | `σ 0 ≫ σ 1`, `σ 0 ≫ τ 1`; `τ 0 ≫ σ 1`, `τ 0 ≫ τ 1` | first pair both `side _ false`, second pair both `side _ true`; `Hom m n` has 2 elements for `m < n`, 1 for `m = n`, 0 for `m > n` | Ara 1.1; Check 0.1 true | none |
| `GlobularSet.src_src`, `tgt_src` | a `2`-cell `α : u → v` | `s(u) = s(v)`, `t(u) = t(v)` | Ara 1.2; Layer 0 Example true | none |
| `face`, `faceTo` | `m = 0`, `n = 2`: `(ε ? τ 0 : σ 0) ≫ σ 1` | equals the composite with `τ 1` by `σ_σ`/`τ_σ`; `faceTo` reindexes by `eqToHom` with `n − m − 1 = 1` | the face is fixed by its first step; Check 1.1 (third) true | none |
| `hemiPoint`, `n = 0` | `hemiPoint 0 false 0`, `hemiPoint 0 true 0` | `(1 · √(1 − 0)) = 1` and `−1` in `ℝ¹` (both proved in the probe by `fin_cases`) | Check 1.1 (first) true: `σ_0 = 1`, `τ_0 = −1` | none |
| `hemiPoint`, junk value | `‖x‖ > 1` | `√(1 − ‖x‖²) = 0`, the point `(x, 0)` has norm `‖x‖ > 1` | outside the disk, excluded by `hx` in `norm_hemiPoint` and by the subtype in `hemisphere` | none |
| `norm_hemiPoint` | `x = 0`; `‖x‖ = 1` | `‖(0, ±1)‖ = 1`; `‖(x, 0)‖ = ‖x‖ = 1` | proved at the pin (probe) | R01 |
| `hemiPoint_hemiPoint`, `hemisphere_hemisphere` | all 8 sign triples `(δ, ε, ε')`; `σ_σ = (false, false, true)`, `τ_σ = (true, false, true)` | inner point has norm `1`, so `√(1 − 1) = 0` and both sides are `(y, 0)`; `σ_1 σ_0 = τ_1 σ_0 = (1, 0)` in `D²` | Check 1.1 (first) true; coglobular identities proved at the pin (probe) | R01 |
| `stdDisks` | `#print axioms` at the head; with the proofs | `sorryAx` present; absent | R01 | R01 |
| images of `σ_n`, `τ_n` | `n = 1`: `D¹ → D²` | upper and lower semicircles, union the circle, intersection `{(±1, 0)}` = boundary of each closed semicircle | Check 1.1 (second) true | none |
| `Table`, `Table.dim` | `globe n`; `(1, 0, 1)`; `(2, 0, 1)`; `(1, 1, 1)` | `dim = n`; width 1, `dim 1`; `dim 2`; rejected by `bot_lt_left` (`1 < 1` false) | Ara 1.3; Check 1.2 (second) true | none |
| `Compatible`, orientation | `(1, 0, 1)` in globular sets, `u = φ 0`, `v = φ 1` | `faceTo … false ≫ φ 0 = faceTo … true ≫ φ 1`, i.e. `s(u) = t(v)`: `v : a → b`, `u : b → c`; sum has 3 `0`-cells, 2 `1`-cells; `(2, 1, 2)`: 2, 3, 2; the mirror convention would give `s(v) = t(u)` | Ara 1.3 (256) and 3.2 (`s(v ∗ u) = s p₂`, `t(v ∗ u) = t p₁`, line 555); Check 1.2 (first) true | none |
| `GlobularSums` at `globe n` | `T = globe n` | `sum = disk n`, `incl = eqToHom`; `isGlobularSum`: one `φ`, `u = φ` unique | consistent with `sum_globe`, `incl_globe` | none |
| `nonempty_of_hasPushouts` | `K = TopCat`; width 0; width `m` | `sum (globe n) := disk n`; iterated pushouts along `σ`, `τ` | Ara 1.5.1; Check 2.1 (first) true | none |
| `Parallel` | `n = 0`; `n = 1` | `True`; `σ 0 ≫ f = σ 0 ≫ g ∧ τ 0 ≫ f = τ 0 ≫ g` | Ara 2.1 (390–392) | none |
| `AdmissiblePair.dim_le` | `(0, (1, 0, 1))`; `(0, (2))`; `idPair n` | `1 ≤ 1` admitted; `2 ≤ 1` rejected; `n ≤ n + 1` | Ara 2.3; Check 2.2 (first) true | none |
| `IsContractible` negative control | `Θ₀`, `idPair 0` | a lifting `D₁ → D₀` would be a `1`-cell of `𝔾(−, 0)`, which has none | `Θ₀` not contractible; Check 2.2 (second) and 2.3 (second) true | none |
| `IsGlobularFunctor`, wrong models | `R` constant at a point; `R` exchanging `σ` and `τ`; `R` from Ara 2.14 | `obj_disk 1` would need `TopCat.disk 0 = TopCat.disk 1` (one point versus a continuum): excluded; `map_σ` fails; all four fields hold | the predicate determines Ara's globular functors | none |
| `IsGlobularPresheaf` | terminal; empty; constant with a 2-element value; `y(D_n)` at `T = globe m` | one compatible family, one element; no family (vacuous); compatibility forces all `v_k` equal, unique `a`; `incl` is `eqToHom`, bijective | all models; Checks 3.1 and 4.3 true | none |
| `identityMap`, `iteratedIdentity` on `Π_∞^R X` | `n = 0, 1, 2` | `R(κ_0) : D¹ → D⁰` is the map to the point, so `1¹_x = x ∘ R(κ_0)` is constant at `x`; `1^{n+1}_x = 1^n_x ∘ R(κ_n)` constant by induction | the base loops of 4.3 are the constant maps | none |
| `CellJoined` in dimension 0 on `Π_∞^R X` | `a, b : D⁰ → X` | a `1`-cell `h : [−1, 1] → X` with `h(1) = a`, `h(−1) = b` (since `σ_0 = 1`, `τ_0 = −1`) | the path relation; `BijectiveOnComponents` ⇔ bijective on `π₀` | none |
| `BijectiveOnLoops` at `1^n_x` on `Π_∞^R X` | `(n+1)`-cells with both faces constant | maps `(D^{n+1}, S^n) → (X, x)`; `α ∼ β` iff some `h : D^{n+2} → X` has hemispheres `α, β`, and `D^{n+2} = (D^{n+1} × [−1, 1]) / ((y, t) ∼ (y, t') for ‖y‖ = 1)` via `(y, t) ↦ (y, t√(1 − ‖y‖²))`, a homotopy rel boundary | `π_{n+1}(Π_∞^R X, x) = π_{n+1}(X, x)` as sets, naturally; agrees with Mathlib's cube model up to `I^{n+1} ≅ D^{n+1}` | none |
| `piPresheaf_isWeakEquivalence_iff` | `[0, 1] → *`; `{0, 1} → [0, 1]`; `∅ → *`; `R` constant at a point with `* → [0, 1]` | both sides true; `π₀`: 2 versus 1, both sides false; `π₀`: 0 versus 1, both false; without `hR` every cell is a point, `π₀` is `|X|`, left side false while the right is true | the hypothesis `hR` is necessary (Layer 5 Example) and the statement holds | none |
| Theorem 8.7 / Corollary 8.11 generality | formal coherator (Ara 8.1) versus pseudo-coherator with a given globular `R` | the three rows above use only `κ_n` (3.5, 8.1) and `R`; 5.1 uses the formal coherator only to produce `K` | README 5.4 and the Lean hypothesis are what the proof uses | none |
| `weTop` | `∅ → *`; `* → {0, 1}` discrete; `𝟙 X`; `[0, 1] → *` | `π₀` map not surjective; not surjective; bijective; bijective on `π₀` and every `π_{n+1}` | not, not, is, is; equals StableHomotopyKTheory §2.1's predicate on `f.hom` | none |
| `isWeakEquivalence_iff` | (2) ⇒ (1): specialise `u := 1^n_x` | one term (probe) | content is (1) ⇒ (2), Ara 4.13 with `hX`, `hY` | none |
| 4.1 Checks | terminal ∞-groupoid; `n ≥ 2` | `π₀` a point, every `π_n` trivial; abelian by Eckmann–Hilton (ara2013 line 1411) | true | none |
| 6.1 cellular, `∂D_{n+1}` | `n = 0`: `∂D₁ = D₀ ⊔_∅ D₀` | two points, no `1`-cell | Henry 5.3.2/5.3.4; Check 6.1 true | none |
| 7.1 | homeomorphisms; `Π_∞^R` on `W_Top` | bijective on all `π`; inverted by 5.4, so `Localization.lift` applies | Ara 8.13 | none |
| 7.2 | `R, R'` globular | `n`-cells `TopCat(D^n, X)` for both (ara2013 line 1724–1726); identity not a morphism (5.6) | matches | none |
| HomotopyTheoryOfCategories 8.6 | `Globe`, degree `n` | `Hom m n` empty for `m > n`, only identities for `m = n` | direct category claim consistent | none |

## Not verifiable

- *Pursuing Stacks* (SMF 2022) and Maltsiniotis, Astérisque 301: not open access; cited without a statement, nothing depends on them.
- The 1975 letter to Breen (Montpellier fonds, folder 134-2, pp. 42–45): the archive host timed out; the quoted phrase and the content claim are R02. Not listed in `needs-references.toml`, since no target depends on it.
- The Zbl numbers in the references: not checked.
- `lean/docs/312.md`, the comparator file and the 58-file directory `lean/OAI/CategoryTheory/Globular/` at the commit, and the preprint text: not re-fetched this round (the paragraph is unchanged since the previous review, which read them); the claim that the development "defines neither `Π_∞` of a space nor any functor to or from `TopCat`" (line 640–641) is still unchecked over the whole directory.
- cisinski2006, maltsiniotis2010, henrylanari2023: not re-fetched this round; their citations are unchanged since the previous review verified them.
- Ownership against open pull requests: checked through `roadmaps grep` over the indexed heads (433 pull requests, index of 2026-10-31); sibling checkouts not in that index were not searched.

## Source issues

- **Misprint** in ara2013 at 8.1, printed page 52: the standing functor `F : 𝔾 → M` is called fibrant and weakly contractible; it should be cofibrant and weakly contractible (5.8, 5.14, and 8.1's own gloss that `i_n` is a cofibration); affects nothing.
- **Misprint** in ara2013 at the proof of Proposition 5.5, printed page 36: the lower triangle is said to commute by Proposition 5.5 itself; it should be Proposition 4.10 (the inverse image along a morphism of contractible globular extensions commutes with `ϖ_n`); affects nothing.
