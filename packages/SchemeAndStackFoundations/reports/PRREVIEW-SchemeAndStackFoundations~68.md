# Review of SchemeAndStackFoundations (pull request #1808 at 96c1f61)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/SchemeAndStackFoundations/` is byte-identical to `dc47c7e`, the head the previous review read: `git diff dc47c7e HEAD` on the folder is empty. All line numbers below are therefore those of the previous report.

Outside the folder, this pull request's ModularCurves revision has changed. It now takes the strict henselization from the pinned Tau Ceti and restates `ArtinianTestAlgebra` in its own acceptance file. This bears on R02, R05 and R07, and repairs R14.

The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The gate fails on eight rules.

Thirteen of the fourteen previous findings stand and are written again under their old numbers. R05 is raised from P3 to P2, because one headline it called unstatable, the Hodge index theorem, is statable at the pins.

## R01 (P1) — the acceptance test imports another roadmap's module and states theorems on its `sorry`'d `rank` and `determinantObj`

- **Status.** Not repaired.
- **Location.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`:
  - line 2: `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`;
  - lines 2041–2043: `abbrev isFiniteLocallyFreeOfRank … := TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFreeOfRank X r E`, used as a hypothesis at lines 2054 and 2066;
  - lines 2758–2762: `K0.det`.
- **Claim.** Three problems remain:
  - The hypothesis unfolds to `rank ⟨E, h⟩ = const r`, where `rank` is `sorry`. It is unprovable, so `vectorBundleDegree_add_of_shortExact` and `vectorBundleDegree_pullback` cannot be used.
  - `K0.det` mentions `sorry`'d data.
  - The import breaks the gate's `imports` rule.
- **Witness.** `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` lines 167–169 read `noncomputable def rank … : LocallyConstant X ℕ := by sorry`. The gate's `imports` rule fails at line 1 on this head.
- **Repair** (as before):
  - Drop the import.
  - State constant rank on Mathlib carriers, in the pattern of `IsPseudoCoherentSheaf` (lines 67–73): local isomorphism with `SheafOfModules.free (ULift (Fin r))` on an open cover.
  - Move `K0`, `K0.det`, `K0.toG0` and `finiteLocallyFreeExact` to README §5.7 as targets.
  - Rewrite README lines 402–405.

## R02 (P2) — `Suggested.lean` and the README re-plan objects that the pinned Tau Ceti proves; the pull request's own ModularCurves revision now treats them as pinned

- **Status.** Not repaired. The change outside the folder makes this finding sharper.
- **Location.**
  - `Suggested.lean`, the strands listed previously:
    - `Henselization` (175–241) and `StrictHenselization` (254–409);
    - `Ring.IsJapanese`/`IsNagata`, `IsGRing` and `IsCatenary`;
    - `FlatAnnihilator`, `SchemeFrobenius` (697–1095) and `NormalSchemes`;
    - single declarations at 1206–1229, 1673, 2149–2155 and 2624–2666.
  - Docstring lines 17–21: "The strict henselization of a local ring (§0.12a, `StrictHenselization`) … are stated here as this roadmap's targets; ModularCurves consumes them."
  - README line 234: "Owned here for others. Henselization of pairs (§0.12, `Henselization.algebra`)".
- **Claim.** Each object exists at the Tau Ceti pin with real data and `sorry`-free proofs. This roadmap still defines its own carriers for them.

  ModularCurves, in this same pull request, now consumes the pinned construction. Its `Suggested.lean` imports `TauCeti.RingTheory.StrictHenselization.*` (lines 23–27, 72–73) and names `TauCeti.StrictHenselization.algebra R Ω` as the strict henselization (line 96). Its README (lines 102–103 and 127–130) routes to §0.12a only "the clauses … that Tau Ceti does not prove", and says that "the construction and the properties Tau Ceti proves stay pinned".

  So the two folders of this pull request disagree about who owns the construction, and this docstring's consumer claim is false at this head.
- **Witness.** Re-checked at the pin; `grep sorry` over each file is empty:
  - `TauCeti/RingTheory/StrictHenselization/Algebra.lean:75 def algebra` and `Lift.lean:166 existsUnique_lift`;
  - `RingTheory/Henselization/Lift.lean:130`;
  - `AlgebraicGeometry/Grassmannian/Basic.lean:189 chartι`;
  - `AlgebraicGeometry/Frobenius/Relative.lean:84 relativeFrobenius`;
  - `RingTheory/Flat/Annihilator.lean:67`.

  The other files of the previous list are unchanged, since the pin is unchanged.
- **Repair** (as before):
  - Delete these declarations from `Suggested.lean`.
  - In the README, cite each object under `From Tau Ceti` with its full name and file.
  - Keep as targets of §0.12a only what the pin lacks: the separably closed residue field, Noetherianity with the 06LJ completion clauses, and the colimit at a prime. This is exactly the list ModularCurves now routes here.
  - Correct line 234 and docstring lines 17–21.

## R03 (P2) — `sorry` in the bodies of definitions and instances (gate `sorry-data`, 25 hits)

- **Status.** Not repaired.
- **Location.** `Suggested.lean` lines 721, 824, 881, 900, 915, 1286, 1710, 1712, 1723, 1739, 1753, 1820, 2249, 2269, 2308, 2360, 2638, 2726–2765. For example, line 1286 `def smallEtale_compose …` discharges its `ObjectProperty.lift` proof obligation with `sorry`.
- **Claim.** The principles forbid `sorry` in a `def`, `abbrev`, `instance` or `opaque`.
- **Witness.** On this head the gate's `sorry-data` rule finds 25 hits, the same list as the worker's run.
- **Repair** (as before):
  - R01 and R02 remove the hits at 721–915, 2638 and 2745–2765.
  - For the rest, discharge the proof fields, or move the definition and every theorem that mentions it to the README as a target with its intended signature.

## R04 (P2) — AbundanceStatement and CommRingFactorizationSystems are cited as suppliers; both are on the do-not-cite list and neither is on main

- **Status.** Not repaired.
- **Location.** README lines 431–434 (supplier-table rows), 821–824, 3634, 4913, 5845, 5934, 5940, 6836, 7420–7540 and 7656 (AbundanceStatement); lines 1627 and 1631 (CommRingFactorizationSystems).
- **Claim.** These two roadmaps may never be cited as suppliers. So the characteristic-zero inputs of §§5.9–5.10 and the affine criterion of §0.23 have no permitted owner.
- **Witness.**
  - The gate's `dropped` rule has 39 hits.
  - The content repository's main (`1bea835`) has no folder for either roadmap.
  - `roadmaps list` shows "#545 AbundanceStatement (new)" and "#453 CommRingFactorizationSystems (new)".
- **Repair** (as before):
  - Delete the AbundanceStatement rows and the `*_abundanceComparison` and `*_abundanceSpecialization` targets. State the characteristic-zero cases here, on §5.10's characteristic-free `Chow.NumericallyEquivalent`.
  - State the affine universal-homeomorphism criterion of §0.23 as a target here, under Stacks 04DF.

## R05 (P2) — a headline that is statable at the pins is absent, and the module docstring does not account for the headlines

- **Status.** Not repaired. Re-assessed from P3 to P2.
- **Location.** `Suggested.lean` lines 14–22 (module docstring). README Summary, lines 16–23: "… Grothendieck–Riemann–Roch, the Hodge index theorem and the Weil bound …". README §5.10 line 7509: "Prove `hodge_index`: for `H` ample and `D` with `D · H = 0`, `D² ≤ 0` …".
- **Claim.**
  - The docstring still lacks the required form ("<title>: target signatures"; README.md is the roadmap). It names none of the unstated headlines and none of their missing carriers. Its consumer sentence is false (R02).
  - The previous report's witness was also wrong. It said there is no ample predicate at the pins: a search for `class IsAmple` misses Tau Ceti's `structure IsAmple`.
  - With the pinned carriers, `hodge_index` is statable and elaborates. It is an end theorem of Layer 5, and it is absent.
- **Witness.**
  - `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71 structure IsAmple (a : LineBundleClass X)`.
  - `Cohomology/EulerCharacteristic.lean:105 Scheme.Modules.eulerCharBelow`.
  - A scratch file defines the pairing `(L·M) = χ(O) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹⊗M⁻¹)` with `eulerCharBelow … 3`, then states `hodge_index`. It elaborates with exit 0 and `sorry` as the only warning.
- **Repair.**
  - Add to `Suggested.lean` the pairing on `InvertibleSheaf X` with that real body, using `InvertibleSheaf.dual` and `tensorProduct` from Tau Ceti's `LineBundle/Dual.lean` and `LineBundle/TensorProduct.lean`.
  - Add `hodge_index` with these hypotheses: `[IsAlgClosed k]`, proper, smooth, geometrically integral, `topologicalKrullDim X = 2`, `(LineBundleClass.mk H).IsAmple` and `pairing D H = 0`, concluding `pairing D D ≤ 0`.
  - Tested on `ℙ¹×ℙ¹` with `χ(O(a,b)) = (a+1)(b+1)`:
    - `D = O(1,−1)`, `H = O(1,1)`: `pairing D H = 1 − 0 − 0 + χ(O(−2,0)) = 0`;
    - `pairing D D = 1 + χ(O(−2,2)) = −2 ≤ 0`;
    - `pairing H H = 1 + χ(O(−2,−2)) = 2`.
  - For each remaining headline (Keel–Mori, Grothendieck duality, the Brauer class, Picard torsors, Schlessinger, GRR), search the pins by object, not by `class`. Then state the headline, or name the missing carrier in the docstring.
  - Rewrite the docstring in the required form and drop its consumer sentence.

## R06 (P3) — 101 admitted `example`s, and a convention that announces them

- **Status.** Not repaired.
- **Location.** `Suggested.lean` lines 84–2724, for example line 225 `example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry`. README Conventions item 5, lines 277–278: "with some Checks as `example`s".
- **Claim.** An admitted example tests nothing.
- **Witness.** On this head the gate's `sorry-examples` rule finds 101 hits. Elaboration gives 244 `sorry` warnings.
- **Repair.** Delete every admitted `example`. Rewrite Conventions item 5 and the *Lean:* lines.

## R07 (P3) — padding: one-tactic theorems and definitions that no headline needs, among them `Formal.ArtinianTestAlgebra`, which ModularCurves now restates for itself

- **Status.** Not repaired.
- **Location.**
  - The one-tactic theorems listed previously: `relativeFrobenius_fst`, `_snd`, `_unique`, `iteratedSchemeFrobenius_zero`, `_succ`, `qPowerFrobenius_eq_iterated`, `absoluteFrobenius_base` and `universalHomeomorphismEtaleEquivalence_functor`.
  - Unused definitions, including `Formal.ArtinianTestAlgebra` (line 2197).
- **Claim.** These declarations restate definitions, close in one tactic, or are used by no theorem.

  The ModularCurves change removes the only stated reason for keeping `ArtinianTestAlgebra`. ModularCurves' `Suggested.lean` line 809 now declares a field-for-field identical `ArtinianTestAlgebra`. Its module docstring (lines 141–145) and the structure's docstring (lines 803–807) say that only "the parameter structure" is restated, because the file "imports no other roadmap". So this file's copy has no consumer and no theorem.
- **Witness.** The nine fields at `SchemeAndStackFoundations/Suggested.lean:2197–2206` and `ModularCurves/Suggested.lean:809–818` are identical.
- **Repair.** Delete these declarations; the README keeps them as targets. Drop "`Formal.ArtinianTestAlgebra`" from docstring line 20.

## R08 (P3) — statement hygiene (gate, 11 hits) and related form defects

- **Status.** Not repaired.
- **Location.**
  - `Nonempty (_ ≃ _)` conclusions: lines 222, 1549, 1558 and 2131.
  - `letI` in a signature: lines 817, 1706, 2069, 2493 and 2676–2677.
  - `[Fintype k]`: line 2794.
  - The global `instHasDerivedCategoryModules` (1692), `_root_.IsAzumaya.*` (1943, 1954), `sorry` inside statements (2068, 2677) and `∃! …, True` (713).
- **Claim.** These are unchanged since the previous report. Line 1549's `Nonempty (… ≃ {m // …})` says only that two types have the same cardinality.
- **Witness.** `Nonempty (ℤ/p^∞ ≃ ℚ)` holds, so the form cannot tell the torsion submodule from any other countable set.
- **Repair** (as before):
  - State the canonical maps as `LinearEquiv`, `AddEquiv` or `MulEquiv`.
  - Use instance binders instead of `letI`, and `[Finite k]` with `Nat.card k`.
  - Move the derived-category instance into the statements that need it.
  - Rename the `IsAzumaya` theorems into this roadmap's namespace.

## R09 (P3) — TeX-only syntax in §§0.28–0.29 (gate `tex`, 65 hits)

- **Status.** Not repaired.
- **Location.** README lines 1929–2084, for example line 2015: "`= X^{(p/S)} = X ×_{S,F_S} S`, with projections π₁ to X and π₂ to S".
- **Claim.** `_{…}` and `^{…}` are written outside code spans.
- **Witness.** The gate's `tex` rule has 65 hits.
- **Repair.** Put the formulas in code spans or write them in Unicode. After R02, most of §0.29 becomes a citation.

## R10 (P3) — backticked names presented as this roadmap's own but declared nowhere in `Suggested.lean` (gate, 15 hits)

- **Status.** Not repaired.
- **Location.** README §0.30, lines 2103–2130 (`isNormalScheme_iff_forall_affineOpens`, `codimensionOneMap_comp`, `ramificationIdxAt_pos`, …), and line 1327 (`isReduced_iff_R0_S1`).
- **Claim.** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`.
- **Witness.** The gate's `readme-ids-missing` rule has 15 hits. Most of these names are at the pin, for example `TauCeti/AlgebraicGeometry/Scheme/Normal.lean`.
- **Repair.** Cite the pinned names with their files. Set the README-only names in italics.

## R11 (P3) — locators

- **Status.** Not repaired. All six items are unchanged:
  - (a) §0.8, lines 859–864: six fibre properties are cited only to Stacks 0576/0578/0579, which treat geometric reducedness.
  - (b) Line 3781: "Lemma 35.8.8" links tag 03DR, which is Section 35.8. The lemma is 0GN7, and it does not cover fpqc.
  - (c) Line 1423: "§2.8, pp. 6–7" for the (S_n)-quasi-excellence definition, which is §2.10, p. 7.
  - (d) `Suggested.lean` line 1275: "Definition 66.18.1 (03ED)" should be 66.18.2 (03G0).
  - (e) Lines 337 and 378 give Mathlib `6b7abb3c76` and Tau Ceti `a91d3aaf`, not the pins `1b1ccf4b` and `2fd255d9`.
  - (f) Line 1676: repleteness also needs Bhatt–Scholze 2014, Proposition 3.2.3(1).
- **Witness.** As in the previous report: `stacks-project` lines 154398, 154430 and 142526; `cesnavicius-2021` line 268; `stacks-project` line 254522; `bhatt-scholze-2014` line 798.
- **Repair.** As listed in each item.

## R12 (P3) — files outside the pull request's folders

- **Status.** Not repaired.
- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Claim.** Neither folder is one of this pull request's own, and the description does not name them.
- **Witness.** `git diff --stat origin/main...HEAD`, excluding the 15 own folders, lists exactly these two files, one line each.
- **Repair.** Remove both edits from this pull request (they belong with the pull request that changes those roadmaps), or name the two folders in the description.

## R13 (P3) — conflicting open heads with no stated order

- **Status.** Not repaired, and now with a third pull request.
- **Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request".
- **Claim.** Three other open pull requests change this roadmap and conflict with this head, and the description orders none of them:
  - #1276 conflicts in this folder's `README.md` and `Suggested.lean`;
  - #1656 conflicts in the same two files;
  - #1854 also changes SchemeAndStackFoundations and conflicts with this head in nine other folders.
- **Witness.** `scratch/overlaps.md` lists all three conflicts. `roadmaps list` shows #1854 changing SchemeAndStackFoundations, ArithmeticDirichletSeries and SymplecticGeometry.
- **Repair.** State which of #1276, #1656, #1854 and this pull request rebases on which.

## Previous findings

- R01 — not repaired: line 2 `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`; line 2043 `TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFreeOfRank X r E`.
- R02 — not repaired: `Suggested.lean` lines 254–409 still declare `StrictHenselization`; docstring lines 17–21 "stated here as this roadmap's targets; ModularCurves consumes them". ModularCurves now cites `TauCeti.StrictHenselization.algebra`.
- R03 — not repaired: gate `sorry-data` 25 hits, for example line 1286 `def smallEtale_compose`.
- R04 — not repaired: README line 431 "AbundanceStatement §4A / items 2–4 (Roktim Mascharak, …)"; gate `dropped` 39.
- R05 — not repaired: docstring lines 14–21 unchanged; `hodge_index` absent although statable (re-assessed to P2).
- R06 — not repaired: gate `sorry-examples` 101; Conventions item 5 "with some Checks as `example`s".
- R07 — not repaired: `Formal.ArtinianTestAlgebra` (2197) and the one-tactic Frobenius theorems are still present.
- R08 — not repaired: gate `statement-hygiene` 11 hits at the same lines.
- R09 — not repaired: gate `tex` 65 hits, for example line 2015 "`X^{(p/S)} = X ×_{S,F_S} S`".
- R10 — not repaired: gate `readme-ids-missing` 15, for example `isNormalScheme_iff_forall_affineOpens`.
- R11 — not repaired: line 1423 "§2.8, pp. 6–7"; line 3781 "Lemma 35.8.8 … tag/03DR"; line 337 "`6b7abb3c76`".
- R12 — not repaired: the same two one-line edits in `Completed/ArithmeticDirichletSeries` and `SymplecticGeometry`.
- R13 — not repaired: the merge-order paragraph is unchanged and names neither #1276 nor #1656; #1854 is now also an unordered conflict.
- R14 — repaired: README line 628 is unchanged. ModularCurves (README lines 123–126) now maps its former "Layer 0G, the relative Grassmannian … → SchemeAndStackFoundations §0.3a". AlgebraicModuliForArithmeticGeometry §1.3's citation of "ModularCurves §0G" (its README line 255) therefore resolves to §0.3a, and the consumer sentence is supported.

## Verified sound

**Gate.**
- Re-run on this head with `--base origin/main`. `FAIL` with `tex` 65, `sorry-data` 25, `sorry-examples` 101, `imports` 1, `statement-hygiene` 11, `dropped` 39, `readme-ids-missing` 15 and `depcheck` 0. These are identical to the worker's counts.
- `outside-folder` is 29 here. 27 files are in this pull request's own folders (including `AlgebraicTopology/TopologicalGroupFundamentalGroup.lean`); the other 2 are R12's.
- The worker's targeted build passed (`build=0`).

**Dependency check.** `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` from the worktree: exit 0 in 74 s, 244 `declaration uses sorry` warnings and no other message.

**Signatures.**
- The worker's signature dump had failed with "unknown module prefix". I re-ran the same scratch file (`Suggested.lean` plus 249 `#check @…` lines) from the worktree: exit 0.
- The elaborated types are unchanged, because the file and the pins are unchanged.
- Spot-read against the README: `Curve.vectorBundleDegree_pullback` keeps `IsIntegral`, `IsProper` and the dimension-one hypotheses; `weil_bound` keeps `[Fintype k]` (R08); `Formal.ArtinianTestAlgebra` takes `[CommRing k]` with no perfectness (R07).

**Outside-folder changes checked.**
- Every section of this README that the pull request's other folders cite exists here. That is 21 distinct ids: §§0.3, 0.3a, 0.7, 0.8, 0.9, 0.12a, 0.14, 0.17, 0.20, 0.21, 1.1, 1.13, 1.17, 1.23, 2.6, 2.7, 4.2, 4.8, 4.12, 4.13 and 4.15.
- The newly added named citations resolve here: `supports_localization_triangle` (line 3676), `serre_affineness_criterion` (3646), `completionFunctor` (5589), *henselian_finiteEtale_equivalence* (1217) and *affine_fpqc_descent* (2223).
- Each topic ModularCurves now routes here is present in the section it names:
  - §1.1: affine, finite locally free and closed subschemes;
  - §1.17: torsors, equivalence relations and invariant affine opens;
  - §1.23: finite inertia and coarse spaces;
  - §0.3a: charts, universal quotient, base change, rank one and Plücker;
  - §0.21: the regular locus;
  - §4.13: miracle flatness.
- AlgebraicCurves line 80 names §4.15 here as an owner it does not consume. There is no cycle.

**Seeded sample.** The folder is unchanged, so this is a spot-check, not a re-review. Stacks number/tag pairs were matched against `stacks-project` (the book text):
- §0.16: 10 of 10, including Lemma 10.105.2 = 02IH (line 32520).
- §1.1: 3 of 3. §1.10: 2 of 2. §2.10: 1 of 1. §4.4: 18 of 18.
- §4.10: Section 30.25 = 0886 (line 125771), Theorem 30.27.1 = 088E (line 126117), Remark 30.27.2 = 088F (line 126178), and three more.
- §5.8: Section 42.66 = 02UO (line 183059).
- §2.18: 13 of 14; see the remark below.
- Bhatt–Scholze 2017 for §0.24: Definition 3.1 and Definition 3.2 on p. 10 (`bhatt-scholze-2017` lines 438, 441); Lemma 3.4 on pp. 10–11 (line 448); Theorem 3.7 on p. 11 (line 500); Proposition 3.13 on p. 13 (line 563).
- Morel–Voevodsky for §2.12: §3.1, Proposition 1.1 on p. 95 and Definition 1.2 on pp. 95–96 (`morel-voevodsky` lines 1765, 1774–1778). Proposition 1.1's finite-family, Noetherian-base hypotheses match `isNisnevichCovering_iff_henselization`.

**Remarks on untouched text** (not findings; no change requested in this round):
- §2.18, README line 4176: "Theorem 36.15.3 (09IP)". 09IP is the tag of Section 36.15; Theorem 36.15.3 is 09IS (`stacks-project` line 147581).
- §4.13, line 5850: *miracle_flatness* is planned without citing Tau Ceti's `TauCeti.Algebra.flat_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/MiracleFlatness.lean:72`). That declaration is `sorry`-free and is the same statement (Stacks 00R4).

**Library declarations opened at the pins.** Tau Ceti:
- `LineBundle/Ample.lean:71`;
- `IntersectionNumber/Basic.lean:111`;
- `Cohomology/EulerCharacteristic.lean:105`;
- `LineBundle/Dual.lean:44` and `LineBundle/TensorProduct.lean:65`;
- `StrictHenselization/Algebra.lean:75` and `Lift.lean:166`;
- `Henselization/Lift.lean:130`;
- `Grassmannian/Basic.lean:189`;
- `Frobenius/Relative.lean:84`;
- `Flat/Annihilator.lean:67`;
- `RegularLocalRing/MiracleFlatness.lean:72`.

**Overlaps and ownership.**
- No id this README cites is dropped by an open pull request, none is defined only by an open revision, and no id this pull request drops is cited elsewhere.
- The closest roadmaps in vocabulary (#1840, #1796, #853, #1743, #1754) own none of the objects of §§0.3a, 0.12a or 4.2 (checked with `roadmaps grep` for strict henselization, relative Grassmannian and Artinian coefficient or test algebras). #853 consumes §4.2 from here (its README line 97). #1743 declares a supplier gap on §0.21 here (its README line 80); that is its contract, not a finding of this review.
- Inside this pull request, ModularCurves restates only the parameter structure `ArtinianTestAlgebra` (R07).

**Adversarial table.** The rows for unchanged statements are carried forward from the previous report (r50); every statement in the folder is unchanged. New rows are marked "r68".

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| r68 `hodge_index` (probe, R05) | `ℙ¹×ℙ¹`, `χ(O(a,b)) = (a+1)(b+1)`; `D = O(1,−1)`, `H = O(1,1)` | `D·H = 1 − 0 − 0 − 1 = 0`; `D² = 1 + χ(O(−2,2)) = −2 ≤ 0`; `H² = 1 + 1 = 2 > 0` | statable at the pins, absent: R05 |
| r68 `Formal.ArtinianTestAlgebra` | `k = ℤ`; `k = 0`; `k = 𝔽_p(t)` | `ℤ ≅ A/𝔪_A` would be a field ⇒ empty; `ker = ⊤ ≠ 𝔪_A` ⇒ empty; `A = k`, `residue = id`, `ker = 0 = 𝔪` ⇒ object exists for imperfect `k` | only fields occur; perfectness missing (R07); duplicated in ModularCurves:809 |
| r68 §2.12 `IsNisnevichCovering` | `{Spec ℂ → Spec ℝ}`; `{Spec ℂ ⊔ Spec ℝ → Spec ℝ}` | residue extension ℂ/ℝ nontrivial ⇒ étale but not Nisnevich; the ℝ-component gives an isomorphism ⇒ Nisnevich | sound |
| r68 §0.24 `Scheme.IsPerfect` | `𝔽_p`; `𝔽_p[t]`; `𝔽_p[ε]/ε²` | Frobenius bijective; `t ∉ image` ⇒ not perfect; `ε ↦ 0` ⇒ not injective, consistent with `IsPerfect.isReduced` | sound |
| r68 §5.8 `hirzebruch_riemann_roch` | `ℙ¹`, `E = O(n)` | `deg((1+nh)(1+h))₁ = n + 1 = χ(O(n))` | sound |
| §0.6 `coherent_hartogs` (r50) | 𝔸² ∖ 0; 𝔸¹ ∖ 0 | depth 2 ⇒ Γ = k[x,y]; depth 1 ⇒ k[x,x⁻¹] ≠ k[x] | sound |
| §0.6 `reflexive_extension_of_depth` (r50) | `k[x,y,z,w]/(xw)`; two planes in 𝔸⁴ | CM depth 3 ⇒ `j_*O_U = O_X`; depth 1 ⇒ `k[z,w] × k[x,y] ≠ O_X` | sound |
| §0.6 `IsReflexive` (r50) | ℤ/2 on Spec ℤ; `(x,y) ⊂ k[x,y]` | double dual 0 ≠ ℤ/2; `I^∨∨ = k[x,y] ≠ I` | sound |
| §0.8 `flat_over_dedekind` (r50) | `S ⊔ 𝔸¹_S` over `k[t]`; `k[t]/(t²)` | flat; `t`-torsion ⇒ not flat (excluded) | sound |
| §0.8 `quasi_sections` (r50) | generic point of 𝔸¹; separable closed point | not closed ⇒ excluded; section after `Spec L` | sound |
| §0.11 `field_extension_descent` (r50) | ℙ¹_k; `∐_ℕ Spec k` | `Γ = k`; `k^ℕ ⊗ k' ≠ k'^ℕ` | qcqs needed, present |
| §0.11 `unramified_criteria` (r50) | `k[x]/x²`; ℂ/ℝ; `𝔽_p(t^(1/p))` | Ω ≠ 0; Ω = 0; Ω ≠ 0 | sound |
| §0.19 `quasiExcellent_cm_sn` (r50) | `k[ε]/ε²`; n = 0 | CM; (S_0) vacuous | sound |
| §0.27 `element_annihilator_flat_baseChange` (r50) | ℤ/4 → ℤ/2; ℤ/4 → (ℤ/4)² | non-flat fails; (2) = (2) | sound; dup (R02) |
| §1.3 `IsAlgebraicSpace` (r50) | constant {0,1}; `h_X` | F(∅) has 2 points ⇒ not a sheaf; space | sound; dup |
| §1.3 `EtaleAtlas` (r50) | `h_∅ → h_{Spec k}` | not surjective | sound |
| §1.19 `IsDeligneMumford` (r50) | Bμ_p/𝔽_p; BG; B𝔾_m | Lie(μ_p) ≠ 0 ⇒ not DM; DM; not DM | sound |
| §1.24 `galois_descent_affine` (r50) | L = k; discontinuous χ; finite L/k | B = A; excluded; all actions | sound |
| §1.24 `CrossedModule` (r50) | SL₂ → PGL₂; id on S₃ | ker μ₂; Peiffer fails | sound |
| §2.9 `mu S n` (r50) | μ_p/𝔽_p; μ₁; μ₂(ℚ) | `1+ε` on `𝔽_p[ε]/ε^p`; 0; {±1} | sound |
| §2.9 `bigSheaf_fullyFaithful` (r50) | Frobenius on 𝔾_a | not O-linear | sound |
| §2.14 `brownGersten_vanishing` (r50) | square-only counterexample | `F(∅) ≃ A[1] ≠ 0` | reduced condition present |
| §2.14 `nisnevich_cohomological_dimension` (r50) | Spec k; Spec ℝ | `H^q_Nis = 0`; `H²_ét(𝔾_m) = ℤ/2`, `H²_Nis = 0` | sound |
| §2.17 `IsReplete` (r50) | Spec ℚ, μ_(ℓ^n) tower; Type | lim = 0; Type replete | sound; dup |
| §3.1 `isAffine_or_isProper` (r50) | 𝔸¹; ℙ¹ | affine not proper; proper not affine | sound |
| §3.1 `genus_baseChange` (r50) | ℙ¹_L, [L:k] = 2; `y² = x^p − t` | dim 2 over L; genus (p−1)/2 | sound |
| §4.4 `schlessinger_hull` (r50) | `h_{k[[t]]}/±`; `k[[t,s]]` | H2 fails; not a hull | sound |
| §4.4 `schlessinger_prorepresentable` (r50) | `h_R`; one-point functor | RS holds; Λ | sound |
| §4.17 `IsStrictNormalCrossings` (r50) | V(xy); nodal cubic; (C̃,E,E) | codim 1,1,2; singular; rejected | sound |
| §5.6 `Chow.intersect` (r50) | doubled origin; ℙⁿ | handled by 0FF3; `ℤ[h]/(h^(n+1))` | sound |
| §5.6 `graphPullback` (r50) | constant ℙ¹ → p; pr₁ | `f*[p] = 0`; `[{p}×ℙ¹]` | sound |
| `Henselization.existsUnique_lift` (r50) | I = ⊤; ⊥; (ℤ,(5)) | 0; R; ℤ[1/2] yes, ℤ[1/5] and ℤ×ℤ no | sound; dup |
| `StrictHenselization.existsUnique_lift` (r50) | `𝔽_p`, `Ω = F̄_p` | `R^sh = F̄_p`, unique | sound; dup |
| `artinBootstrap` (r50) | F = U = h_X | space | matches 04S6(3) |
| `IsAzumaya.exists_etale_matrix_splitting` (r50) | M_d(A); ℍ/ℝ; d = 0 | B = A; ℍ⊗ℂ ≅ M₂(ℂ); d > 0 forced | sound; R08 |
| `grothendieck_existence` (r50) | I = 0; ℙ¹ over k[[t]] | levels X; O(n) | sound |
| `algebraize_hom` (r50) | maps 0, 1 on levels 0, 1 | not compatible | sound |
| `alteration_theorem` (r50) | X = Spec k, Z = ⊤ | support ∅ | sound |
| `weil_bound` (r50) | ℙ¹/𝔽_q; `y²=x³+x`/𝔽₃; `y²=x³−x`/𝔽₅ | q+1; \|4−4\| = 0 ≤ 2√3; \|8−6\| = 2 ≤ 2√5 | sound; R08 |
| `relativeFrobenius_smooth_rank` (r50) | 𝔸¹_k; 𝔸¹ ⊔ 𝔸² | rank p; ranks p, p² | sound; dup |
| `relativeFrobenius_etale_isIso` (r50) | 𝟙 over 𝔽_p[t] | relative iso, absolute not | sound; dup |
| `brauer_functionField_curve_trivial` (r50) | k(t), k = k̄; ℝ(t) | 0; (−1,−1) ≠ 0 | `IsAlgClosed` needed, present |
| `vectorBundleDegree_pullback` (r50) | X = Y, f = 𝟙, E = O | `rank := sorry` ⇒ unprovable | R01 |
| `lineBundleClass_spec_equiv_pic` (r50) | R = ℤ | Pic ℤ = 0, but `Nonempty (≃)` only cardinality | R08 |
| `localCohomology_degreeZero` (r50) | ℤ, (p), ℤ/p^∞ ⊕ ℤ | `Nonempty (ℤ/p^∞ ≃ ℚ)` holds | R08 |
| `IsQuasiExcellentRing.isNagata` (r50) | field; `MvPolynomial ℕ k` | both; neither | sound; dup |
| `unibranch_finite_components` (r50) | eventually constant 𝔽₂-sequences | component not open | local Noetherianity present |
| `isAffine_of_H1_vanishing` (r50) | ∅; ℙ¹ | Spec 0 affine; H¹(O(−2)) ≠ 0 | sound |

## Not verifiable

- Kisin 2017 (JAMS), §§3.1.1 and 3.2.1 (§1.24): no legal copy was found, as in the previous report.
- de Jong 1996 (§§4.17–4.20) and Hartshorne 1977 (§5.10): settled as `uncertified`, so they are cited by locator only.
- Fulton 1998, Propositions 8.1.1–8.3 (§5.6) and Theorem 15.2 (§5.8): Springer, paywalled, not in the manifest.
- Gabber–Kelly and Schlessinger 1968: not fetched in this incremental round.
- Seeded targets §1.25 (Galois gerbs), §3.4 (Picard groups) and §4.14 (Hilbert and Quot schemes) cite no Stacks number/tag pair that the matcher could read. They were not re-read in this round, because the folder is unchanged.

## Source issues

- none
