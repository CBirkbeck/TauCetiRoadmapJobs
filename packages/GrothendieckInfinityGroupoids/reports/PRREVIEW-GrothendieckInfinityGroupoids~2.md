# Review of GrothendieckInfinityGroupoids (pull request #1060 at 06ebae5)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/GrothendieckInfinityGroupoids/README.md` and `Suggested.lean` at the repaired head. The gate passes (every check 0, build OK), the dependency check passes (0 problems), and ten of the eleven findings of the previous review are repaired. One blocking finding remains (R01): the roadmap's central corollary is statable at the pins and is absent from `Suggested.lean`; a probe at the pins builds the missing carrier in about forty lines. Three notes (R02–R04).

**Previous findings, finding by finding.**

| Previous | Status | Evidence at 06ebae5 |
| --- | --- | --- |
| R01 headline absent | partly | Theorem 4.18 (1)⇔(2) is stated (`isWeakEquivalence_iff`, line 360); the docstring names Theorem 8.7 and Corollaries 8.8–8.11 as "not stated" with a reason (lines 27–32). The reason does not hold for Corollary 8.11: see R01 below. The docstring opening still describes a signature catalogue: R02. |
| R02 `set_option` | repaired | gate `set_option=0`. |
| R03 weak homotopy equivalences | repaired | README 54–55, 107–109, 138–144 cite StableHomotopyKTheory §2.1; the nonexistent Tau Ceti paths are gone; `weTop` (lines 375–382) is declared as that predicate's body. |
| R04 table-indexed extensions | repaired | `GlobularExtension` (lines 207–214) has no bijectivity field; README 79–87 says `TopCat` is one and reports Remark 2.6 as Ara wrote it (ara2013 line 437–439). |
| R05 gluing orientation | repaired | README 70–74 and `Compatible` (lines 176–178): source face on the left disk (`castSucc`, `false`), target face on the right (`succ`, `true`), Ara 1.3 (ara2013 line 254–264). |
| R06 `π_n` off by one | repaired | README 99–104: `π_n(X, x) = π_n(X, 1^{n−1}_x)`. |
| R07 process narrative | repaired | no pull-request links or pin narrative remain; the "Porting guidance" section is now two timeless sentences (a leftover, R02). |
| R08 README shape | partly | three Checks per item, a locator per item, supplier contracts, how-to-read, downstream consumers are present; the `### k.n` prose form and the per-layer `### Examples` / `### Dependencies` are not (R03). |
| R09 padding | repaired | `σ_comp_σ`, `τ_comp_σ`, `piPresheaf_isGlobular`, `localizedFunctor` deleted. |
| R10 disks of a table | repaired | `sum_globe`, `incl_globe` (lines 195–196), `ofTable_globe` (230); `idPair` is typed through `eqToHom` (270–271). |
| R11 two locators | repaired | README 241–243 (free globular extension), 91–92 and Lean 276–279 (pseudo-coherator attribution, ara2013 line 433). |

## R01 (P2) — Corollary 8.11 is statable at the pins and absent from `Suggested.lean`

- Location: `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` lines 27–32 ("Not stated here: Ara's Theorem 8.7 and Corollaries 8.8–8.11 … that coglobular space is data Layer 1.1 constructs on Mathlib's `TopCat.disk`, which this file does not build"); `README.md` lines 375–379 (the same reason).
- Claim: a headline theorem is omitted only when a carrier in its statement does not exist at the pins and is not a simple definition with a real body on native carriers; a headline that is statable but absent is a defect. Corollary 8.11 (`Π_∞^R f` is a weak equivalence of ∞-groupoids iff `f` is a weak homotopy equivalence, ara2013 line 2721–2724) is the roadmap's end theorem (Summary, lines 9–11; Layer 5.4), and nothing it mentions is missing: `weTop`, `PseudoCoherator.IsWeakEquivalence` and `piPresheaf` are already in the file; the coglobular space of disks is an explicit formula on `TopCat.disk`.
- Witness: a probe file elaborated at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`, `lake env lean`, `sorry` the only warning) with the file's own declarations followed by the construction below: `hemiPoint`, `norm_hemiPoint`, `continuous_hemiPoint`, `hemisphere n s hs : TopCat.disk.{0} n ⟶ TopCat.disk.{0} (n + 1)`, `hemisphere_hemisphere`, `stdDisks : CoglobularObject TopCat.{0}` (every proof real, 69 lines with docstrings, library inputs `WithLp.toLp`, `Fin.snoc`, `Real.sqrt`, `EuclideanSpace.norm_eq`, `Fin.sum_univ_castSucc`, `PiLp.continuous_toLp`, `Continuous.finSnoc`, `continuous_uliftUp`), a six-line predicate `IsGlobularFunctor` (Ara 1.4, ara2013 line 268–276), and the theorem whose elaborated type is `∀ (C : PseudoCoherator) (R : C.Obj ⥤ TopCat), IsGlobularFunctor C.toGlobularExtension stdDisks R → ∀ {X Y : TopCat} (f : X ⟶ Y), C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f`. The hypothesis `IsGlobularFunctor` is necessary, not decoration: for `R` constant at a point, `(piPresheaf C R).obj X` is the constant presheaf with value the underlying set of `X`, which satisfies `IsGlobularPresheaf` (a compatible family is a constant family), and its `π₀` is the set of points of `X`, not `π₀(X)`; so the iff fails for `X = [0, 1]` and `f : [0, 1] → *`. Generality: Ara §8 fixes a formal coherator (5.1, line 1702) and a globular `K`, and the proofs of 8.2–8.7 use only the units `κ_n` of 8.1 (line 2569–2572, from contractibility) and `K`; for a given globular `R` the statement on a `PseudoCoherator` is what the source proves, and README line 116 already says every statement about `Π_∞` is made for an arbitrary such `R`.
- Repair: add to `Suggested.lean`, under a `/-! ## Layer 5 -/` comment, the construction tested in the probe and the theorem:

```lean
/-- `(x, s·√(1 − ‖x‖²))` in `ℝ^{n+1}`. -/
noncomputable def hemiPoint (n : ℕ) (s : ℝ) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin (n + 1)) :=
  WithLp.toLp 2 (Fin.snoc (α := fun _ => ℝ) (WithLp.ofLp x) (s * Real.sqrt (1 - ‖x‖ ^ 2)))

theorem norm_hemiPoint (n : ℕ) (s : ℝ) (hs : s ^ 2 = 1) (x : EuclideanSpace ℝ (Fin n))
    (hx : ‖x‖ ≤ 1) : ‖hemiPoint n s x‖ = 1 := by
  have h0 : 0 ≤ 1 - ‖x‖ ^ 2 := by nlinarith [norm_nonneg x]
  have hx2 : ‖x‖ ^ 2 = ∑ i, ‖x i‖ ^ 2 := by
    rw [EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun i _ => sq_nonneg _)]
  rw [EuclideanSpace.norm_eq, Real.sqrt_eq_one]
  simp only [hemiPoint, Fin.sum_univ_castSucc, PiLp.toLp_apply, Fin.snoc_castSucc, Fin.snoc_last,
    Real.norm_eq_abs, sq_abs, mul_pow, hs, one_mul, Real.sq_sqrt h0]
  simp only [Real.norm_eq_abs, sq_abs] at hx2
  rw [← hx2]; ring

theorem continuous_hemiPoint (n : ℕ) (s : ℝ) : Continuous (hemiPoint n s) := by
  unfold hemiPoint
  refine (PiLp.continuous_toLp (p := 2) (β := fun _ : Fin (n + 1) => ℝ)).comp ?_
  refine Continuous.finSnoc (PiLp.continuous_ofLp (p := 2) (β := fun _ : Fin n => ℝ)) ?_
  fun_prop

/-- The hemisphere inclusion `D^n → D^{n+1}`, `x ↦ (x, s·√(1 − ‖x‖²))`, `s = ±1`
(Ara 2013, Examples 1.5.2). -/
noncomputable def hemisphere (n : ℕ) (s : ℝ) (hs : s ^ 2 = 1) :
    TopCat.disk.{0} n ⟶ TopCat.disk.{0} (n + 1) :=
  TopCat.ofHom
    { toFun := fun x => ⟨⟨hemiPoint n s x.down.1, by
        rw [Metric.mem_closedBall, dist_zero_right,
          norm_hemiPoint n s hs _ (mem_closedBall_zero_iff.1 x.down.2)]⟩⟩
      continuous_toFun := continuous_uliftUp.comp (Continuous.subtype_mk
        ((continuous_hemiPoint n s).comp (continuous_subtype_val.comp continuous_uliftDown)) _) }

theorem hemiPoint_hemiPoint (n : ℕ) (s s' s'' : ℝ) (hs : s ^ 2 = 1)
    (x : EuclideanSpace ℝ (Fin n)) (hx : ‖x‖ ≤ 1) :
    hemiPoint (n + 1) s' (hemiPoint n s x) = hemiPoint (n + 1) s'' (hemiPoint n s x) := by
  have h : Real.sqrt (1 - ‖hemiPoint n s x‖ ^ 2) = 0 := by
    rw [norm_hemiPoint n s hs x hx]; simp
  show WithLp.toLp 2 (Fin.snoc (α := fun _ => ℝ) _ (s' * Real.sqrt (1 - ‖hemiPoint n s x‖ ^ 2))) =
    WithLp.toLp 2 (Fin.snoc (α := fun _ => ℝ) _ (s'' * Real.sqrt (1 - ‖hemiPoint n s x‖ ^ 2)))
  rw [h, mul_zero, mul_zero]

theorem hemisphere_hemisphere (n : ℕ) (s s' s'' : ℝ) (hs : s ^ 2 = 1) (hs' : s' ^ 2 = 1)
    (hs'' : s'' ^ 2 = 1) :
    hemisphere n s hs ≫ hemisphere (n + 1) s' hs' = hemisphere n s hs ≫ hemisphere (n + 1) s'' hs'' := by
  ext x
  apply ULift.ext
  apply Subtype.ext
  exact hemiPoint_hemiPoint n s s' s'' hs x.down.1 (mem_closedBall_zero_iff.1 x.down.2)

/-- The coglobular space of disks and hemisphere inclusions (Ara 2013, Examples 1.5.2). -/
noncomputable def stdDisks : CoglobularObject TopCat.{0} where
  disk := TopCat.disk
  σ n := hemisphere n 1 (by norm_num)
  τ n := hemisphere n (-1) (by norm_num)
  σ_σ n := hemisphere_hemisphere n 1 1 (-1) (by norm_num) (by norm_num) (by norm_num)
  τ_σ n := hemisphere_hemisphere n (-1) 1 (-1) (by norm_num) (by norm_num) (by norm_num)

/-- `R` is a globular functor from `C` to `(K, D)` (Ara 2013, 1.4): it matches disks and faces
up to a family of isomorphisms and preserves globular sums. -/
def IsGlobularFunctor (C : GlobularExtension) {K : Type u} [Category.{v} K]
    (D : CoglobularObject K) (R : C.Obj ⥤ K) : Prop :=
  ∃ e : ∀ n, R.obj (C.disks.disk n) ≅ D.disk n,
    (∀ n, R.map (C.disks.σ n) ≫ (e (n + 1)).hom = (e n).hom ≫ D.σ n) ∧
    (∀ n, R.map (C.disks.τ n) ≫ (e (n + 1)).hom = (e n).hom ≫ D.τ n) ∧
    ∀ (T : Table) (Y : K) (φ : ∀ k, D.disk (T.top k) ⟶ Y), D.Compatible T φ →
      ∃! u : R.obj (C.ofTable T) ⟶ Y, ∀ k, R.map (C.incl T k) ≫ u = (e _).hom ≫ φ k

/-- **Layer 5.4.** Ara 2013, Corollary 8.11: `Π_∞^R f` is a weak equivalence of ∞-groupoids of
type `C` iff `f` is a weak homotopy equivalence. -/
theorem piPresheaf_isWeakEquivalence_iff (C : PseudoCoherator) (R : C.Obj ⥤ TopCat.{0})
    (hR : IsGlobularFunctor C.toGlobularExtension stdDisks R) {X Y : TopCat.{0}} (f : X ⟶ Y) :
    C.IsWeakEquivalence ((piPresheaf C R).map f) ↔ weTop f := by
  sorry
```

  Then: rewrite docstring lines 27–32 so that only what is genuinely not statable stays there (Theorem 8.7 as an isomorphism of groups, and Proposition 5.5 / Corollary 8.8 on the groupoids `ϖ_n`, both of which need the composition operations of Layer 3.2 for the group and groupoid structures); name `stdDisks` in Conventions line 112–116 and item 1.1, `IsGlobularFunctor` in Conventions line 87–88 and item 5.1, and `piPresheaf_isWeakEquivalence_iff` in item 5.4; replace README lines 375–379 accordingly. If the author prefers Ara's hypothesis verbatim, add that `C` is a formal coherator (`∀ D : PseudoCoherator.{u, v}, ∃ R', IsGlobularFunctor C.toGlobularExtension D.disks R'`) as a further hypothesis; the proof does not use it once `R` is given.

## R02 (P3) — `Suggested.lean` still describes itself as a signature catalogue, and two process leftovers

- Location: `Suggested.lean` lines 7–10 ("This file is not the roadmap and is not exhaustive … suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap library"); `README.md` line 148–149 ("`Suggested.lean` pins names and signatures for the central objects and is not exhaustive"); line 458 ("All checked on zbMATH or arXiv."); lines 445–454 (a section titled "Porting guidance").
- Claim: the module docstring says that the roadmap is `README.md`, that the file states the roadmap's headline theorems against the pinned APIs, and which headlines are not statable and what each lacks; the README is timeless and carries no advice to future contributors.
- Witness: the quoted lines. The file's headlines are Theorem 4.18 (1)⇔(2) and, after R01, Corollary 8.11; `GlobularSums.nonempty_of_hasPushouts` (Ara Examples 1.5.1, ara2013 line 278–279: a cocomplete category under `𝔾` is a globular extension) is a routine existence statement rather than a headline, kept or deleted at the author's discretion.
- Repair: replace lines 7–10 by the acceptance-test sentence (the roadmap is `README.md`; this file states the headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions they need); delete "is not exhaustive" at README 148–149 and the sentence at 458; fold the two facts of "Porting guidance" (what the development contains, that it is a cited source under Apache 2.0) into the Research context paragraph and delete the section.

## R03 (P3) — README shape: numbered items instead of prose subsections, no per-layer Examples and Dependencies

- Location: `README.md` lines 157–371 (items `**0.1**` … `**7.2**` as bold-numbered paragraphs with `*Needs:*` entries such as `M`, `L1`, `L2.1`), line 381 ("## Ordering").
- Claim: layers are `### k.n <topic>` prose subsections whose `*Needs:*` line names the declarations and targets the statement and route use, and every layer ends with `### Examples` and `### Dependencies`.
- Witness: `*Needs:* M.` (line 161), `*Needs:* L1.` (210), `*Needs:* L3.1, M.` (341) name no declaration; no layer has `### Examples` or `### Dependencies`; the per-layer dependencies live in one "Ordering" paragraph.
- Repair: turn each item into a `### k.n` subsection (the text can stay), expand each `*Needs:*` to the declarations and targets actually used (for 0.1: `CategoryTheory.Category`, `Functor.IsEquivalence`; for 6.1: `MorphismProperty.TransfiniteCompositionOfShape`, `IsPushout`, Layer 3.1's free models), and close each layer with `### Examples` (the Checks' worked cases) and `### Dependencies` (the layer's suppliers), deleting "## Ordering".

## R04 (P3) — Checks that name Lean declarations, and no two-term witness for the gluing orientation

- Location: `README.md` line 185 ("`faceTo` of side `ε` …"), line 194 ("`Table.dim (2, 0, 1) = 2` and the sum of `Table.globe n` is `D_n`"), line 211 ("by `GlobularSums.nonempty_of_hasPushouts`"), line 221 ("(`GlobularExtension.idPair`)").
- Claim: a Check says in prose what is computed and never names or claims a Lean counterpart; a convention is pinned by one two-term example whose value is computed.
- Witness: the four lines. The orientation of Conventions lines 70–74 is stated but no Check computes it; the discriminating instance is the table `(1, 0, 1)`: a map out of its globular sum is a pair of `1`-cells whose left member goes `b → c` and right member `a → b`, the source of the left equal to the target of the right (ara2013 line 553–555: `s(v ∗ u) = s(p₂)`, `t(v ∗ u) = t(p₁)`), and the mirror convention would give left `a → b`, right `b → c`.
- Repair: write the four Checks in prose ("the face of side `ε` from `D_m` to `D_n`", "the dimension of the table `(2, 0, 1)` is `2`", "since `TopCat` has pushouts", "is admissible in every globular extension"), and add that two-term witness as a Check of 1.2.

## Verified sound

**Gate and tooling.** Worker's gate at 06ebae5: every check 0, build of `TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` OK. Dependency check run by me: `depcheck: 205 roadmaps, 1419 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the folder (the diff against `origin/main` excluding the folder is empty); `metadata.toml` has `topic = "math.AT"`. The roadmap is line 13 of the merge order, right after StableHomotopyKTheory (line 12), its only roadmap supplier. HomotopyTheoryOfCategories is not in the merge order (a consumer, not a supplier). No declared gaps and no `design/plan.json`: nothing to check there.

**Pins.** `lake-manifest.json` pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`; the shared packages directory is at those revisions. Opened at the pins: Mathlib `Topology/Category/TopCat/Sphere.lean` line 28 (`TopCat.disk n = ↧(ULift (Metric.closedBall 0 1))`), 32 (`diskBoundary`), 58 (`diskBoundaryInclusion`); `CategoryTheory/Localization/Predicate.lean` line 304 (`Localization.lift`); `CategoryTheory/MorphismProperty/TransfiniteComposition.lean` line 52 and `CategoryTheory/Limits/Shapes/Preorder/TransfiniteCompositionOfShape.lean` line 45 (`TransfiniteCompositionOfShape`); `AlgebraicTopology/ModelCategory/Basic.lean` line 43 (`HomotopicalAlgebra.ModelCategory`); `Topology/Connected/PathConnected.lean` line 117 (`ZerothHomotopy`); `Topology/Homotopy/HomotopyGroup.lean` line 489 (`pi0EquivZerothHomotopy`); `Analysis/InnerProductSpace/PiL2.lean` line 145 (`EuclideanSpace.norm_eq`); `Topology/Constructions.lean` line 1019 (`Continuous.finSnoc`); `Analysis/Normed/Lp/PiLp.lean` lines 538, 546 (`continuous_ofLp`, `continuous_toLp`). Tau Ceti `AlgebraicTopology/Disk.lean` line 36 (`TauCeti.TopCat.contractibleSpace_disk`), `Analysis/InnerProductSpace/Hemisphere.lean` line 90 (`TauCeti.hemisphereHomeomorph`, on an abstract inner product space, not on `TopCat.disk`), `Topology/Homotopy/HomotopyGroup/Map.lean` line 119 (`HomotopyGroup.map`). A `#check` probe of all 32 names in the three supplier tables elaborated; the only misses were my own wrong namespace for `TransfiniteCompositionOfShape` (it is `CategoryTheory.TransfiniteCompositionOfShape` and `CategoryTheory.MorphismProperty.TransfiniteCompositionOfShape`, both present) and the two Tau Ceti names before importing their modules (both resolve with `import TauCeti.AlgebraicTopology.Disk` and `import TauCeti.Analysis.InnerProductSpace.Hemisphere`). No hemisphere inclusion `TopCat.disk n ⟶ TopCat.disk (n + 1)` exists at either pin (hence R01's construction).

**Elaborated signatures.** The worker's `signatures.md` flags `CoglobularObject.face`, `faceTo`, `Compatible` for a dropped `[Category.{v} K]`: false positives, the instance is `[inst : Category.{u_2, u_1} K]` in each elaborated type. My probe's `#check @` of `GlobularSums.mk`, `AdmissiblePair.mk`, `PseudoCoherator.identityMap`, `IsWeakEquivalence`, `isWeakEquivalence_iff`, `weTop`, `piPresheaf`, `nonempty_of_hasPushouts` agrees with the README statements (hypotheses `hX`, `hY` present on Theorem 4.18; `[HasPushouts K]` present on 1.2); nothing changed.

**One-tactic probe.** `isWeakEquivalence_iff`: the direction (2) ⇒ (1) closes with the single term `⟨h.1, fun n x => h.2 n _⟩` (probe elaborated), so the file's content is (1) ⇒ (2), which is Ara's Theorem 4.13 (ara2013 line 1617–1623, 1665–1666): kept, not padding. `nonempty_of_hasPushouts`: no one-tactic proof (it needs the iterated pushouts and their universal property), judged by reading; see R02 for its status. `parallel_refl` and `ofTable_globe` are proved helpers consumed by `idPair` and `identityMap`.

**Cross-roadmap citations, resolved now.** StableHomotopyKTheory at the head of pull request #1227 (`85481d5`), §2.1 "Weak homotopy equivalences of spaces" (its README lines 506–512): `IsWeakHomotopyEquivalence` ("Bijective π₀ and all positive πₙ at every basepoint"), `IsWeakHomotopyEquivalence.comp`, `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence` exist as cited; `weTop` has that body. HomotopyTheoryOfCategories at `792c2cf`: README lines 74, 81 and 580 cite this roadmap's Layer 0.1 for `𝔾` and prove it direct in 8.6; Layers 7–8 own direct, inverse and Reedy categories. GeneralizedCohomology on main: "## G2. A concrete spectral model" (line 211) exists as the model-structure owner named in scope. Ownership by object (`roadmaps grep` over main and the 433 open heads for coherator, globular sum/extension/set, globe category, homotopy hypothesis, fundamental ∞-groupoid): every hit outside this roadmap is the unrelated quasi-coherator of derived categories (ComplexComparisonPartII, SchemeKTheoryOperations, AlgebraicModuliForArithmeticGeometry) or HomotopyTheoryOfCategories' citations of this roadmap. This roadmap is the owner of Layers 0–7.

**Sources read** (cache ids, cited as `<id> line N`): ara2013 (arXiv 1206.2941v2), henry2016 (arXiv 1609.04622v1), maltsiniotis2010 (arXiv 1009.2331v1), henrylanari2023 (TAC 39 no. 26), simpson1998 (arXiv math/9810059v1), openai2026 (paper.pdf at commit 7ef5c0cc), cisinski2006 (Astérisque 308, the author's page copy, fetched this round), openai2026-comparator (`lean/ComparatorChallenges/GrothendieckElementaryExpansion.lean` at the commit, fetched this round). Locators confirmed in ara2013: 1.1 (187), 1.2 (209), 1.3 (237–264), 1.4 (265–276), 1.5.1–1.5.4 (278–299), 1.6 (314–322), 1.7 (324), 1.8 (327–345), 1.9.1 (346–351), 1.11 (364), 1.12 (375–377), 2.1 (387–408), 2.2 (411–423), 2.3 (424–430), 2.4 (431–433), 2.5 (434), 2.6 (437–439), 2.7.1 (441–444), 2.9 (467–491), 2.10 (492–502), 2.11 (503), 2.12 (505–513), 2.14 (520–527), 2.15.1 (528–531), 3.2 (546–555), 3.11 (1137), 4.2 (1214), 4.3 (1218), 4.5 (1255), 4.6 (1309), 4.8 (1360), 4.10 (1375), 4.11 (1401–1419, Eckmann–Hilton at 1411), 4.13–4.15 (1617–1632), 4.17 (1638), 4.18 with items (2)–(4) (1645–1664), 5.1 (1702), 5.2 (1708–1726, the adjunction and the underlying globular set), 5.3 (1727–1738), 5.4 (1741), 5.5 (1745), 5.6 (1759), 5.8 (1771–1788), 5.10 (1803), 5.11 (1808), 5.14 (1902), 8.1 (2550–2574), 8.4 (2613), 8.7 (2692–2705), 8.8–8.11 (2706–2724), 8.13 (2727), 8.14 (2733). henry2016: 5.3.2 (3276), 5.3.3 (3279–3287, weak equivalences "in the sense of [3, 4.17 and 4.18]"), 5.3.4 (3289, retracts of arbitrary cellular objects), 5.3.5 (3296), 5.3.13 (3476), §5.1 (2941). cisinski2006: note 2 on page xiii (243–244, 284–287: `Hot` identified with the localization of spaces at weak homotopy equivalences), Définition 3.3.2 (6787), Définition 4.1.3 (8014), Remarque 4.1.9 citing [96, 1.3.7] (8083), Définition 4.1.12 (8108), Remarque 4.1.13 citing [96, remarque 1.5.4] (8113), Théorème 4.2.15 (8419), Corollaires 4.2.18–4.2.19 (8448, 8469), 4.2.20 (8478). maltsiniotis2010: "Gr-pseudo-coherator" (969–977). henrylanari2023: journal data and abstract (5–13). openai2026: Theorem 1.1 (44–51, `s_n` the source inclusion), Corollary 5.1 (919–926), Corollary 5.2 (987–990), the route through Henry's Theorem 5.1.2 and Corollary 5.3.13 (1014–1030). openai2026-comparator: `Table.attach` (128), `AdmissiblePair.height ≤ n + 1` (272–275), `IsCoherator` (308–310), `Model` as presheaf with an `IsPullback` per attachment (321–328), `J` as the Yoneda image of the source inclusion (354–356), cellular presentations as `TransfiniteCompositionOfShape` with boundary attachments (358–384), `unit` by `Classical.choose` (396–397), `Loops`, `Components`, `HomotopyGroup` (412–422), `WeakEquivalence` (460–463), the theorem (469–476), universes `Type v` throughout. Every claim of README lines 406–443 agrees with these.

**Seeded sample.** "Research motivation" (15–24): Conjecture 8.14 as stated; the Breen letter is not verifiable (below). "In scope" (32–48): each layer's objects are Ara's §§1–5, 8 and Henry 5.3.2 as cited. "Not in this roadmap" (50–55): Cisinski 3.3.2 and 4.1.12 are basic localizers and test categories as cited; Maltsiniotis 2005 is cited without a statement; the three roadmap owners resolve as above. "Lean prototypes" (373–379): accurate about what the file states; the reason for the omission is R01. "The elementary expansion assertion" (398–404): Henry 5.3.3, 5.3.4, 5.3.5, 5.3.13 and Henry–Lanari verified. "The OpenAI preprint" (406–443): verified against the paper and the comparator file as listed.

**Adversarial pass.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `Globe.Hom.comp`, globular identities | `σ 0 ≫ σ 1`, `σ 0 ≫ τ 1`; `τ 0 ≫ σ 1`, `τ 0 ≫ τ 1` | both of the first pair reduce to `side _ false`, both of the second to `side _ true`; `Hom m n` has 2 elements for `m < n`, 1 for `m = n`, 0 for `m > n` | Ara 1.1; README Check 0.1 true | none |
| `GlobularSet.src_src`, `tgt_src` | presheaf `X` on `Globe` | `s_k ∘ s_{k+1} = s_k ∘ t_{k+1}`, `t_k ∘ s_{k+1} = t_k ∘ t_{k+1}` | Ara 1.2 | none |
| `face`, `faceTo` | `m = 0`, `k = 1`: `(ε ? τ 0 : σ 0) ≫ σ 1` | equals the same composite with `τ 1` by `σ_σ`/`τ_σ`; `faceTo h ε` reindexes by `eqToHom` | the face is determined by its first step, Ara's `σ^n_m`, `τ^n_m` | none |
| `Table`, `Table.dim` | `globe n`: `dim = n`; `(1, 0, 1)`: `dim 1`; `(2, 0, 1)`: `dim 2`; `(1, 1, 1)` | last rejected by `bot_lt_left` (`1 < 1` false) | Ara 1.3 (`i_k > i'_k < i_{k+1}`, dimension the greatest entry) | none |
| `Compatible`, orientation | `(1, 0, 1)` in globular sets: `φ₀, φ₁ : D₁ → Y` with `s ∘ φ₀ = t ∘ φ₁` | sum has 3 `0`-cells, 2 `1`-cells; `(2, 1, 2)`: 2, 3, 2; left cell `b → c`, right cell `a → b` | Ara 1.3 and 3.2 (`s(v ∗ u) = s p₂`, `t(v ∗ u) = t p₁`); README Checks 1.2 true | R04 (witness as a Check) |
| `GlobularSums` at `globe n` | `T = globe n` | `sum = disk n`, `incl = eqToHom`; `isGlobularSum`: for a single `φ`, `u = φ` unique | consistent fields | none |
| `nonempty_of_hasPushouts` | `K = TopCat` (`HasPushouts`); width 0 | choose `sum (globe n) := disk n`; wider tables by iterated pushouts | true (Ara 1.5.1); not a one-tactic statement | R02 (status note) |
| `Parallel` | `n = 0`: `True`; `n = 1`: `σ 0 ≫ f = σ 0 ≫ g ∧ τ 0 ≫ f = τ 0 ≫ g` | Ara 2.1 (line 390–392) | matches | none |
| `AdmissiblePair.dim_le` | `(n, T) = (0, (1, 0, 1))`: `1 ≤ 1` admitted; `(0, (2))`: `2 ≤ 1` rejected; `(1, (2))`: admitted | Ara 2.3; `(τ_n, σ_n)` admissible with no lifting in `Θ` (2.7.3) | matches | none |
| `idPair`, `IsContractible` negative control | `Θ₀`, `n = 0`: `(1, 1) : D₀ → D₀` | `dim = 0 ≤ 1`; a lifting `D₁ → D₀` would be a `1`-cell of `D₀`, which has none | README Check 2.2 true; `Θ₀` not contractible | none |
| `IsGlobularPresheaf` | terminal; empty; constant with value a 2-element set; `y(D_n)` at `T = globe m` | one compatible family, one element; no compatible family (vacuous); compatibility forces all `v_k` equal, unique `a`; `incl` is `eqToHom`, bijective | all are models; README Checks 3.1 and 4.3 true; for `Θ₀` the models are globular sets (Ara 1.9.1) | none |
| `identityMap`, `iteratedIdentity` | `n = 0`: `κ₀ : D₁ ⟶ D₀` with `σ 0 ≫ κ₀ = 𝟙`, `τ 0 ≫ κ₀ = 𝟙` (after `eqToHom`) | `1^0_x = x`, `1^1_x = X(κ₀)(x)` | Ara 8.1 (`κ_n σ_{n+1} = 1`), 4.11 (`k⁰_{n−1}`) | none |
| `BijectiveOnComponents` | constant 2-point presheaf `→` terminal; `𝟙` | surjective; not injective (`a ∼₀ b` needs a `1`-cell with `src = a`, `tgt = b`, but `src = tgt`); identity bijective | README Check 4.3 true | none |
| `BijectiveOnLoops` | terminal `→` terminal; `𝟙 X` | one loop class each way; identity | trivially bijective | none |
| `isWeakEquivalence_iff` | (2) ⇒ (1): specialise `u := 1^n_x` | one term (probe) | content is (1) ⇒ (2), Ara 4.13/4.18 with `hX`, `hY` present | none |
| `weTop` | `∅ → *`; `* → {0, 1}` discrete; `𝟙 X`; `[0, 1] → *` | `π₀` map not surjective; not surjective; bijective; bijective on `π₀` and all `π_n` | not, not, is, is a weak equivalence; equals StableHomotopyKTheory §2.1's predicate | none |
| `piPresheaf`, hypothesis on `R` | `R` constant at a point, `X = [0, 1]` | `(Π X)(S) = |X|` for every `S`: globular, `π₀ = |X|`, infinite, while `π₀(X)` is a point | Corollary 8.11 needs `R` globular; the probe statement carries it | R01 |
| `stdDisks` (probe) | `n = 0`: `σ₀, τ₀ : D⁰ → [−1, 1]`; `σ_n ≫ σ_{n+1}` vs `σ_n ≫ τ_{n+1}` | points `1`, `−1` (`‖x‖ = 0`, `√1 = 1`); `‖σ_n x‖² = ‖x‖² + (1 − ‖x‖²) = 1`, so the last coordinate `±√(1 − 1) = 0` on both sides | README Check 1.1 true; coglobular identities proved at the pin | R01 |
| Theorem 8.7 / Corollary 8.11 generality | `C` a formal coherator (Ara 8.1) vs a pseudo-coherator with a given globular `R` | proofs of 8.2–8.7 use `κ_n` (8.1) and `K` only; formal-coherator property used only to produce `K` (5.2) | README's "arbitrary such `R`" and the probe statement are what Ara proves | none |
| Conventions `π_n` | `n = 1`: `1`-cells `x → x`; `n = 2`: `2`-cells `1_x → 1_x` | Ara 4.11: `π_n(G, x) = π_n(G, k⁰_{n−1}(x))` | matches | none |
| 5.3's standing hypotheses | `M = Top` (Quillen) | all objects fibrant; disks cofibrant and weakly contractible (Ara 5.10) | matches 5.14/8.1 | none |
| 6.1 cellular, `∂D_{n+1}` | `n = 0`: `∂D₁ = D₀ ⊔_∅ D₀` two points | Ara 5.8 (`S^n = D_n ⊔_{S^{n−1}} D_n`), Henry 5.3.2 | README Check 6.1 true | none |
| 7.2 independence | `R, R'` globular | `n`-cells `TopCat(D^n, X)` for both (Ara 5.2 line 1724–1726); `ϖ_n` equal (5.5); identity not a morphism (5.6) | matches | none |
| HomotopyTheoryOfCategories 8.6 | `Globe` with degree `n` | `Hom m n` empty for `m > n`, only identities for `m = n` | direct category claim consistent | none |

## Not verifiable

- *Pursuing Stacks* (SMF 2022) and Maltsiniotis, Astérisque 301: not open access; cited without a statement, nothing depends on them.
- The 1975 letter to Breen (Montpellier fonds, folder 134-2, pp. 42–45) and the quoted phrase « essentially the same thing » (README lines 21–23, 489–491): image scans in an archive, not read. A quotation from a text nobody on the project has read should be a paraphrase without quotation marks.
- The Zbl numbers in the references (line 458 "All checked on zbMATH or arXiv"): not checked.
- `lean/docs/312.md` and the 58-file directory `lean/OAI/CategoryTheory/Globular/` at the commit: not re-fetched this round (the previous review read `312.md` and the comparator's `.json`); the claim that the development "defines neither `Π_∞` of a space nor any functor to or from `TopCat`" (line 420–421) was not checked over the whole directory.
- Ownership against open pull requests: checked through `roadmaps grep` over the indexed heads (433 pull requests, index of 2026-10-31); sibling checkouts not in that index were not searched.

## Source issues

- **Misprint** in ara2013 at 8.1, printed page 52: the standing functor `F : 𝔾 → M` is called fibrant and weakly contractible; it should be cofibrant and weakly contractible (5.8, and 8.1's own gloss that `i_n` is a cofibration); affects nothing.
- **Misprint** in ara2013 at the proof of Proposition 5.5, printed page 36: the lower triangle is said to commute by Proposition 5.5 itself; it should be Proposition 4.10 (the inverse image along a globular functor commutes with `ϖ_n`); affects nothing.
