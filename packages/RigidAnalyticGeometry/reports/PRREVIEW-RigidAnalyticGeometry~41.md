# Review of RigidAnalyticGeometry (pull request #1854 at 56715a5)

**Verdict:** needs changes

Eleven findings: one P1, four P2, six P3. The biggest change needed is in `Suggested.lean`. The pinned Tau Ceti already contains this roadmap's affinoid library (`TauCeti/RingTheory/Affinoid/`, `TauCeti/Topology/GTopology/`, `TauCeti/AlgebraicGeometry/Rigid/`). The file re-declares that library's carriers and restates 17 theorems it already proves. Meanwhile it omits two headlines that the same library now makes statable.

## R01 (P1) — Two-way supply with AdicSpacesPartII and AdicSpacesPartIII

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 33, the supplier row "AdicSpacesPartII R0.3–R0.5 and R1.7". Line 34, the supplier row "AdicSpacesPartIII R3.1–R3.7". Lines 807–808: "Source: [Huber-FR] Proposition 4.5; Part II R1.7." Line 476: "Sources: [BGR] 8.2; [Kiehl-AB]; Part III R3.1." Lines 742–743: "share Part III's cohomology implementation".

**Claim.** This roadmap takes Part II and Part III as suppliers. Its own `## Downstream consumers` section (lines 868–881) lists the same two roadmaps as its consumers. At least three section pairs supply each other:

- §8.3 ↔ Part II R1.7. The full faithfulness and quasi-separated equivalence of §8.3 is Huber-FR Proposition 4.5. Huber-FR line 1448 says parts (i)–(iv) "follow from the proof of (4.3)", which is the ringed-site finality.
- Layer 5 ↔ Part III R3.1.
- §7.5 ↔ Part III R3.6.

**Witness.**

- AdicSpacesPartII README on main, R1.7, lines 9819–9820: the functor is "Supplied by RigidAnalyticGeometry §§8.2–8.3", while "this roadmap supplies the additional ringed-site finality".
- Same file, line 9853: *Needs:* "*classical-points-constructible-density* (RigidAnalyticGeometry §8.2)".
- AdicSpacesPartIII README, line 10115: "*Needs:* … RigidAnalyticGeometry Layer 5".
- Same file, line 11042: "*Needs:* RigidAnalyticGeometry §7.5".

The supplier row also cites R1.7 for "adic morphisms and adic analytification". Those are Part II R0.6 and R1.3; R1.7 is the rigid–adic comparison, which this roadmap supplies.

The dependency check prints "depcheck: 239 roadmaps, 2359 edges, 0 problem(s)". It does not report cycles among roadmaps that are already on main, so this one is visible only by reading the citations.

**Repair.** Make this roadmap a pure supplier of Part II and Part III:

1. In §8.3, either state Huber-FR Proposition 4.3 (ringed-site finality, p. 541) as this roadmap's own target and have Part II R1.7 cite it, or move §8.3's full faithfulness, equivalence and affinoid detection to Part II. Remove "Part II R1.7" from §§8.2–8.3 and from the supplier row.
2. Move the comparisons with Part II's adic constructions (§1.3 with R0.3/R0.5, §1.4 with R0.3, §2.2 with R0.4) to Part II R0.9. That section already holds the carrier bridge.
3. Replace the "Supplier contract: Part III …" blocks (§§1.3, 2.3, 7.1, 7.3, 7.4, 8.4) with deferrals under `## Scope and ownership`.
4. Move §7.5 to Part III R3.6, whose own text says the proof shares Part III's cohomology implementation.
5. Remove "Part III R3.1" from Layer 5.

Afterwards, neither supplier row should name Part II or Part III. On the refuting instance: once R1.7 no longer appears in §8.3, the edge §8.3 → R1.7 → §8.3 is gone.

## R02 (P2) — Suggested.lean re-declares carriers that pinned Tau Ceti already defines

**Location.** `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` declares:

- line 57: `IsAffinoidAlgebra`
- line 115: `pointNorm`
- line 122: `supSeminorm`
- line 209: `IsPresentationRing`
- line 252: `IsSlopeLE`
- line 260: `IsSlopeDecomposition`

In the README, the section "Existing library interfaces" (lines 110–123) cites none of Tau Ceti's affinoid modules. Line 104 still calls `TauCeti/RingTheory/Affinoid/` a "suggested home".

**Claim.** Each of these is already a pinned Tau Ceti definition, with the same or a more general body:

| Suggested.lean | Pinned definition |
|---|---|
| `IsAffinoidAlgebra` | `TauCeti.IsAffinoidAlgebra`, `TauCeti/RingTheory/Affinoid/Basic.lean:30`. Identical body; `TauCeti.isAffinoidAlgebra_iff` (line 35) is `Iff.rfl`. |
| `pointNorm`, `supSeminorm` | `TauCeti.pointNorm`, `TauCeti.supSeminorm`, `…/Affinoid/SupSeminorm.lean:96,103`. Same spectral-norm body. |
| `IsSlopeLE` | `Polynomial.IsSlopeLE`, `TauCeti/Analysis/Normed/Unbundled/Slope.lean:64`. Identical body; the probe proves the iff with `Polynomial.isSlopeLE_iff.symm`. |
| `IsSlopeDecomposition` | `ContinuousLinearMap.IsSlopeDecomposition`, `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean:51`. Its first field is Mathlib's `Submodule.IsTopCompl` (`Mathlib/Topology/Algebra/Module/Complement.lean:82`), which is exactly the conjunct `∃ h : IsCompl M₁ M₂, Continuous (projectionOnto …)`. |
| `IsPresentationRing π S` | Only characterises `S = (Subring.unitClosedBall _).map π.toRingHom`. That is the native object used in `…/Affinoid/PowerBounded.lean:135`. |

**Witness.** In a scratch copy, each local definition was compared with its pinned counterpart. `IsAffinoidAlgebra K A ↔ TauCeti.IsAffinoidAlgebra K A` is `(TauCeti.isAffinoidAlgebra_iff K A).symm`, and the `IsSlopeLE` iff closes as shown in the table.

**Repair.**

- Add `public import`s of the `TauCeti.RingTheory.Affinoid.*` modules used. Delete the six local definitions and state everything on `TauCeti.IsAffinoidAlgebra`, `TauCeti.supSeminorm` and `(Subring.unitClosedBall _).map π.toRingHom`. `IsStrictRadius` and `weightedTate` go with R06.
- In the README, add a `From Tau Ceti` contract that names these declarations and their files (and the `TauCeti/Topology/GTopology/*` and `TauCeti/AlgebraicGeometry/Rigid/Affinoid/*` modules for §6.1 and Layers 3–4). Backticked names of this roadmap's own must become the qualified Tau Ceti names.
- §7.2 should point to `Polynomial.IsSlopeLE`, `ContinuousLinearMap.IsSlopeDecomposition` and `.exists_projection`. LocallyAnalyticDistributions cites those names from §7.2 (its README table row "§4.16 Numerical h-slope decomposition"), so §7.2 must keep pointing at them.

Tested: the restated theorems elaborate on the pinned carriers.

## R03 (P2) — Kiehl's almost noetherianity is AdicSpacesPartIII's, but is stated here as a headline

**Location.** `Suggested.lean` lines 219–237 declare `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete`. The module docstring (lines 23–24) lists "Kiehl's almost noetherianity and its noetherian corollary" as headlines. README §2.3, line 386, opens with "Supplier contract: Part III R3.6, *almost-noetherian-integral-affinoid-modules*".

**Claim.** The README itself says Part III owns this theorem, yet the acceptance test states it as this roadmap's own headline. That gives one object two owners.

**Witness.** AdicSpacesPartIII README line 11150 owns *almost-noetherian-integral-affinoid-modules* (Kiehl-E §5, Satz 5.1). Line 11176 names its declarations `IntegralAffinoidPresentation.almost_noetherian` and `.fg_of_discrete`. Its *Needs:* list only Tau Ceti and Mathlib.

**Repair.** Delete both theorems (and `IsPresentationRing`) from `Suggested.lean` and drop them from the docstring. In README §2.3, cite Part III's target as a deferral under Scope; this is consistent with R01. Statement and source are otherwise sound: Kiehl-E line 878 (Satz 5.1, p. 212) matches, for the ring `π(Tₙ°)`.

## R04 (P2) — Two headlines are statable at the pins but absent; the docstring says one of them is not statable

**Location.** `Suggested.lean` lines 27–28: "classical Tate acyclicity (Layer 5), which needs the affinoid space `Sp A` with its rational subdomains and structure presheaf". §8.2 (classical points constructibly dense in `Spa(A,A°)`, Huber-CV Corollary 4.2) is neither stated nor named.

**Claim.** Both carriers exist at the pinned Tau Ceti:

- `TauCeti.AffinoidSubdomain.presheaf` (`TauCeti/AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:130`).
- `TauCeti.AffinoidSubdomain.weakGTopology` with `.grothendieckTopology` (`…/Rigid/Affinoid/Site.lean`; that file says "No sheaf condition is asserted here").
- `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237`).
- Mathlib's `IsConstructible` (`Mathlib/Topology/Constructible.lean:175`).

**Witness.** These two statements elaborate under `lake env lean` with only the `sorry` warning:

- `Presheaf.IsSheaf (AffinoidSubdomain.weakGTopology (K := K) (A := A)).grothendieckTopology (AffinoidSubdomain.presheaf (K := K) (A := A))`, under `[Fact (TauCeti.IsAffinoidAlgebra K A)]`.
- `∀ T, IsConstructible T → T.Nonempty → ∃ m, maximalSpectrumToSpa K hA m ∈ T`.

**Repair.** State both with `sorry`:

- Tate's theorem as the sheaf condition (Bosch §4.3 Theorem 10, BGR 8.2.1/1).
- Huber-CV Corollary 4.2 (p. 473), under `hA : TauCeti.Huber.IsTopologicallyFiniteType (algebraMap K A)`.

Then rewrite the docstring's not-statable list: what still lacks a carrier is the rigid category, coherent sheaves, analytification and `r`.

## R05 (P2) — §6.3: the Kiehl properness definition and its composition law are not supported by the cited sources

**Location.** README lines 547–553: "over each admissible affinoid of the base, the inverse image has two finite affinoid covers … Prove its local nature on the base, composition and base-change laws … Sources: [Bosch] §6.3; [Kiehl-E] §2."

**Claim.**

- Both cited definitions take inner covers over *some* admissible affinoid cover of the base: Kiehl-E Definition 2.3 (line 500, p. 202) and Bosch Definition 6.3/8 (line 4956, p. 131). The "each affinoid" version is equivalent only through Temkin's results (Temkin Corollary 4.5, p. 18, with Theorem 5.1).
- Neither cited source proves the composition law. Bosch (lines 4964–4968) says it is "quite difficult" and needs formal models (Lütkebohmert when the valuation is discrete, Temkin in general). Lines 57–58 put formal models outside this roadmap, and no supplier is named.

**Witness.** Bosch p. 131, after Definition 8: proving that a composite of proper maps is proper uses properness of formal models, Sect. 8.4, with references [L] and [Te].

**Repair.**

1. Define Kiehl properness as in Kiehl-E Definition 2.3, with an existing admissible affinoid cover of the base. With that definition, locality on the base and base change are elementary.
2. Either drop the composition law, or cite Temkin Corollary 4.5 (p. 18) and name the roadmap that owns the Berkovich or formal-model input.
3. State the every-affinoid form, if it is kept, as a separate theorem with Temkin's locator.

Checked on `ℙ¹ → Sp K`: `{|z|≤1} ⋐ {|z|≤|ϖ|⁻¹}` via the generator `ϖz`, with `|ϖz| ≤ |ϖ| < 1`. The pair satisfies Definition 2.3.

## R06 (P3) — Padding: 17 of the 20 theorems are already proved in pinned Tau Ceti

**Location.** `Suggested.lean` lines 72–201, 214–217 and 275–281.

**Claim.** In a scratch copy, each of the following closes with a single `exact` of a pinned lemma; the `IsAffinoidAlgebra`-only ones also close on the file's own carrier through `isAffinoidAlgebra_iff`. Paths below are under `TauCeti/RingTheory/Affinoid/` unless given in full.

| Suggested.lean theorem | Pinned lemma |
|---|---|
| `isNoetherianRing` | `TauCeti.IsAffinoidAlgebra.isNoetherianRing`, `FiniteQuotient.lean:43` |
| `isJacobsonRing` | `MaximalSpectrum.lean:53` |
| `exists_finite_injective` | `NoetherNormalization.lean:163` |
| `finite_residue` | `finite_quotient_of_isMaximal`, `MaximalSpectrum.lean:46` |
| `height_eq_ringKrullDim_of_isDomain` | `KrullDimension.lean:97` |
| `weightedTate_isAffinoid_iff` | `TauCeti.isAffinoidAlgebra_isRestricted_iff_pow_eq_norm`, `Polyradius.lean:68` |
| `bddAbove_pointNorm` | `bddAbove_range_pointNorm`, `SupSeminorm.lean:302` |
| `exists_pointNorm_eq_supSeminorm` | `MaximumModulus.lean:156` |
| `supSeminorm_pow` | `SupSeminorm.lean:360`, with `hn.ne'` |
| `supSeminorm_eq_zero_iff` | `SupSeminorm.lean:385` |
| `exists_uniform_valueGroup_exponent` | `exists_supSeminorm_pow_eq_norm`, `ValueGroup.lean:79` |
| `isClosedEmbedding_of_finite_injective` | `FiniteMap.lean:61`; the pinned lemma only needs a noetherian source |
| `powerBounded_iff` | `PowerBounded.lean:169` |
| `topologicallyNilpotent_iff` | `PowerBounded.lean:197` |
| `mem_iff_supSeminorm_le_one_of_isReduced` | `mem_iff_supSeminorm_le_one_of_isReduced_quotient`, `PowerBounded.lean:250`, with `hϖu.isRegular.left` |
| `integral_iff_supSeminorm_le_one` | `AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one`, `PowerBounded.lean:135` |
| `IsSlopeDecomposition.exists_projection` | `ContinuousLinearMap.IsSlopeDecomposition.exists_projection`, `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean:89` |

Even on its own carrier, `exists_projection` only unpacks a conjunct of the definition.

**Witness.** The probe file elaborated with no error; its only `sorry` warnings were for the R04 statements.

**Repair.** Delete these 17 theorems, `IsStrictRadius` and `weightedTate` from `Suggested.lean`. The README keeps the statements as targets and names the pinned declarations (R02). After this, R03 and R04, the file holds `banachFunctionAlgebra` (BGR 6.2.4/1; not at the pin, and true as stated: on `K⟨T⟩/(T²)`, `‖T‖ > 0 = C·|T|sup`, so the `[IsReduced A]` binder is needed) and the R04 statements.

## R07 (P3) — Gate, statement-hygiene: `letI` inside two signatures

**Location.** `Suggested.lean` line 84: `(letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A)`. Line 167: `(hfin : letI := φ.toRingHom.toAlgebra; Module.Finite A B)`.

**Claim.** The gate flags both lines (rule statement-hygiene, P3).

**Witness.** Gate output: "line 84: P3 `letI` in the signature of theorem `exists_finite_injective`" and "line 167: … `isClosedEmbedding_of_finite_injective`".

**Repair.** Use Mathlib's `AlgHom.Finite` (`Mathlib/RingTheory/Finiteness/Defs.lean:193`): `π.Finite` and `(hfin : φ.Finite)`. Tested: the closed-embedding statement with `(hfin : φ.Finite)` elaborates and closes with the pinned lemma. Both theorems are deleted under R06 in any case.

## R08 (P3) — Gate, outside-folder: two files outside the pull request's listed folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Claim.** This pull request changes these two files, but neither folder is among the roadmap folders the pull request declares as its own.

**Witness.** The gate run with this review's folder exclusions prints exactly these two `outside-folder:` lines. The diff stat shows two files changed, 4 insertions and 4 deletions.

**Repair.** Either declare both folders as roadmap folders of this pull request, so that each gets its own review, or move those two hunks to a separate pull request.

## R09 (P3) — Conflict with #1808 over this folder, with no stated order

**Location.** The pull request description: "#1808 is independent of this pull request."

**Claim.** #1808 also revises `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `Suggested.lean`, differently from this head, and the two heads conflict in both files.

**Witness.** The overlap report says #1808 and #1854 conflict in both files. #1808's README opens with `# Roadmap: rigid analytic geometry` and a `**Summary.**` paragraph, and links `../../Completed/AdicSpaces/README.md`. This head has none of those.

**Repair.** Say which of the two pull requests is rebased on the other, and do not restate what that one already changes. Several items of R10 and R11 are already done at #1808's head.

## R10 (P3) — README shape and build order

**Location.**

- Line 1: `# Rigid analytic geometry`, with no `**Summary.**` paragraph.
- The supplier table sits inside `## Scope and ownership`. There is no `## Exact supplier contracts` with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections, and no `## How to read the build`.
- No layer ends with `### Examples` and `### Dependencies`, and the file has no `*Needs:*` line. The only dependency information is the five coarse items at lines 842–857.
- Checks are paragraphs, not bullets, and definitions have no API bullet lists.
- §7.1 item 4 (line 594) uses "the rigid–adic functor `r` of §8.3", and dependency item 5 transports all of Layer 7 "through the ringed-site equivalence". So Layer 7 needs Layer 8.

**Claim.** This is not the house shape, and one layer depends on a later one.

**Witness.** The same file at #1808's head already has the `# Roadmap:` title, the Summary and an `## Exact supplier contracts` section.

**Repair.**

- Adopt the house shape, rebasing on #1808 for what it already does.
- Add per-layer `### Examples` and `### Dependencies`, and a `*Needs:*` line per target that lists only what that target needs.
- After R01's moves, Layer 7 no longer uses §8.3. If any item still does, move it after §8.3.

## R11 (P3) — Locators and supplier citations

**Location and claim.**

- §6.2 (lines 510–534) asserts the rigid category, gluing, fibre products and quasi-separated base extension with no locator at all.
- §7.3 cites "[Kiehl-AB]" and "[Conrad] §§1–2" without theorem numbers.
- §8.2 says constructible subsets "are determined by their classical traces". That is Huber-CV Corollary 4.3, which is not cited.
- Line 33 links `../AdicSpaces/README.md`, which does not exist; AdicSpaces is under `Completed/`.
- Lines 131–132 attribute "the Zariski-dense maximum locus of a nonzero Tate series" to RestrictedPowerSeries §§2.4 and 5. Those sections state maximum modulus at a finite-extension point (§2.4) and no density statement.

**Witness.**

- Conrad line 554: Lemma 2.1.4 (p. 12) is the identity principle.
- Kiehl-AB line 601: Definition 2.3 (p. 270); line 615: Satz 2.4 (p. 271).
- Huber-CV line 823: Corollary 4.3 (p. 473).
- Bosch line 4057: §5.3 Definition 4 (rigid K-space); line 4099: Proposition 6 (gluing morphisms).

**Repair.**

- Cite those numbers.
- Change the link to `../../Completed/AdicSpaces/README.md`.
- Either state the maximum-locus density here with its own locator, or drop it from §0.1.

## Verified sound

**Gate and build.**

- Gate rerun at this head: `set_option=0 … statement-hygiene=2 … outside-folder=2 … build=0 FAIL`. The two failures are R07 and R08.
- `lake env lean` on `Suggested.lean`: the only warnings are 20 "declaration uses `sorry`" warnings.
- `#check @name` on all 29 declarations: every elaborated type matches the README. Nine binders are dropped, all instance binders (`CompleteSpace K`, `IsUltrametricDist K`) on definitions whose bodies are meaningful without them. Tau Ceti's own `pointNorm` and `IsSlopeLE` take the same bare binders, and every theorem carries the hypotheses. No change needed.

**Dependency check.** `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD line, and every supplier is on main: RestrictedPowerSeries, PadicFunctionalAnalysis, CompactOperators, SchemeAndStackFoundations, AdicSpaces (Completed), AdicSpacesPartII and AdicSpacesPartIII. LocallyAnalyticDistributions (merge order line 44), AdicSpacesPartIV and AdicEtaleGeometry are cited only as consumers or deferrals. The cycle the tool does not report is R01.

**Cross-roadmap citations resolved (24).**

- RestrictedPowerSeries §§2.4, 4, 5, 5.2, 5.3 (nearest points), 5.4 and 6.
- PadicFunctionalAnalysis Layers 0–2, §§1.2, 1.4, 2.2 and 2.4.
- CompactOperators Layers 0–3, §3.1, and `IsCompletelyContinuous` (README line 110).
- SchemeAndStackFoundations §0.20 (line 1302) and §0.21 (line 1394).
- AdicSpacesPartII:
  - R0.3 (line 1769), including rational localisation (line 340)
  - R0.4 (line 2270)
  - R0.5, *completed-tensor-banach-module* (line 2789)
  - R0.9 (line 4071)
  - R1.1, R1.7 (line 9806), R1.9
- AdicSpacesPartIII:
  - R3.1–R3.4
  - R3.6 (line 10472), *affinoid-completed-field-extension* (line 11077)
  - R3.7 (line 11218)
- AdicSpacesPartIV F1.1 (line 2998) and R5.7 (line 2165).
- LocallyAnalyticDistributions §4.16, at its open head (table row and §4.16 interface consume §7.2).

No id cited here is dropped by an open pull request (overlap report), and no Lean name of this file duplicates a fully qualified name in another readable roadmap (`roadmaps grep` of the six definitions found only this roadmap's own versions on main, at #1808 and here).

**Pinned library declarations opened (34).** Mathlib:

- `MvPowerSeries.IsRestricted` and `.subring` (`Restricted.lean:47,159`)
- `MvPowerSeries.gaussNorm` (`GaussNorm.lean:58`)
- `Submodule.projectionOnto` (`LinearAlgebra/Projection.lean:125`)
- `Submodule.IsTopCompl` and `projectionL` (`Complement.lean:82,219`)
- `AlgHom.Finite` (`Finiteness/Defs.lean:193`)
- `IsConstructible` (`Topology/Constructible.lean:175`)

Tau Ceti:

- `MvPowerSeries.norm_eq_gaussNorm` (`TateAlgebra/Basic.lean:216`) and the `NormMulClass` instance (line 583)
- `TauCeti.Huber.IsPowerBounded` (`Huber/PowerBounded.lean:121`), `IsBounded` (`Huber/Bounded.lean:109`), `powerBoundedSubring` (line 456), `topologicallyNilpotentIdeal` (line 598)
- `MvPowerSeries.isNoetherianRing_isRestricted_subring` (`Groebner.lean:427`) and `isJacobsonRing` (`TateAlgebra/Jacobson.lean:122`)
- the 17 lemmas of R06 and the five definitions of R02
- `AffinoidSubdomain.presheaf`, `weakGTopology`, `maximalSpectrumToSpa`
- `TauCeti.Ring.IsJapanese` (`Japanese.lean:125`)

None of them contains `sorry`.

**Sources checked at their locators (sample and findings).**

| Source | Locators | What they support |
|---|---|---|
| Conrad | Theorem 1.1.1 (line 156, p. 4), Theorem 1.1.3 (line 201, p. 5), Lemma 1.1.5 (line 274, p. 6), Lemma 2.1.4 (line 554, p. 12), Lemma 2.1.5 (line 570, p. 12); lines 135–136 | §1.2 excellence and height formula, §1.3 field extension, §7.3 identity principle. Lines 135–136 confirm that Kiehl's char-`p` excellence has no restriction on `[k:k^p]`, matching §1.2. |
| Kiehl-E | Definition 1.1 and Satz 1.2 (p. 198), Lemma 1.3 (p. 198), Satz 1.4 (p. 199), Definitions 2.1/2.3 (p. 202), Satz 2.6 (p. 205), Theorem 3.4 (p. 206), Satz 3.5 (p. 209), Theorem 3.7 (p. 210), Satz 5.1 (p. 212) | §7.1 items 1–3, §7.4, §7.5, §2.3. |
| Kiehl-AB | Definition 2.3 (p. 270), Satz 2.4 (p. 271) | The §7.3 quasi-Stein contract. |
| FK | Proposition B.1.3(1) (line 10032, p. 236) | The boundedness of `A₀[f]` that the reduced-quotient argument of §2.3 needs; arXiv v5 numbering. |
| Huber-CV | Theorem 4.1 (p. 472), Corollary 4.2 (p. 473) | §8.2: `L_A` as defined there. |
| Huber-FR | Proposition 4.5 (p. 543) | §8.3 (i)–(v). |
| Bosch | Definition 6.3/6 (p. 131), the `ε ∈ √|K×|` form; Definition 6.3/8 (p. 131); Theorem 6.3/9; Proposition 5.1/5 (G0–G2) | §6.3 and §6.1. |
| Urban | 2.3.1 (p. 1706) | The annihilator-root convention of §7.2 agrees with Urban's `Q*` convention. |
| Temkin | Corollary 4.5 (p. 18) | Used for R05. |

**Adversarial pass (values computed on each side).**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `IsAffinoidAlgebra` | `K` (n=0); `K[X]`; `0`; `K×K` | `T₀ = K`, identity is onto ✓; in `K[X]`, `1−cX` with `0<|c|<1` is not a unit, though it would be in any affinoid (`|cX|sup<1`), so not affinoid ✓; zero map onto `0` ✓; `K⟨T⟩/(T(T−1)) ≅ K×K` ✓ | sound, = pinned | R02 |
| `isNoetherianRing`, `isJacobsonRing` | `K⟨T⟩/(T²)`; `0` | both properties hold; pinned lemmas close | true | R06 |
| `exists_finite_injective` | `K`; cusp `K⟨X,Y⟩/(Y²−X³)`; `0` | `d=0`; `d=1`, free of rank 2 on `1,Y`; `0` excluded by `[Nontrivial A]` (no injection into `0`) | true | R06, R07 |
| `finite_residue` | `ℚ_p⟨T⟩/(T²−p)` | residue `ℚ_p(√p)`, dimension 2 | true | R06 |
| `height_eq_ringKrullDim_of_isDomain` | `K⟨T⟩` at `(T)`; `K⟨T⟩×K` | height 1 = dim 1; non-domain: height of `K⟨T⟩×0` is 0 ≠ 1, so the hypothesis is needed | true (Conrad 2.1.5) | R06 |
| `weightedTate_isAffinoid_iff` | n=0; `ρ=p^(−1/2)`; `ρ=2`, p odd | both sides true; `m=2, c=p`; `2^m ∉ p^ℤ`, both sides false | true | R06 |
| `pointNorm` / `supSeminorm` | `ℚ_p⟨T⟩/(T²−p)`, `f=T`; zero algebra | `|√p| = p^(−1/2)`; `⨆ ∅ = 0` | as the Checks say | R02 |
| `exists_pointNorm_eq_supSeminorm` | `K⟨T⟩`, `p+T²` | attained at `T=1`: `|1+p| = 1` = Gauss norm; at `0`: `|p|` | true | R06 |
| `supSeminorm_pow` | zero algebra, `n=0`; `(1,0)∈K×K` | `|1|sup = 0` vs `0^0 = 1`, so `0<n` is needed; `1 = 1` | true | R06 |
| `supSeminorm_eq_zero_iff` | `T∈K⟨T⟩/(T²)`; `(1,0)` | 0 and nilpotent; 1 and not nilpotent | true | R06 |
| `exists_uniform_valueGroup_exponent` | `ℚ_p⟨T⟩/(T²−p)`; `0` | `|T|sup² = |p|`; `m=1, c=0` | true | R06 |
| `isClosedEmbedding_of_finite_injective` | `K⟨X⟩ → cusp`; a quotient map | closed image; not injective, so not an embedding | true | R06, R07 |
| `powerBounded_iff`, `topologicallyNilpotent_iff` | `T/ϖⁿ ∈ K⟨T⟩/(T²)`; `1` | power-bounded with `|·|sup = 0`, though the norms are unbounded; `|1| = 1`, so power-bounded and not topologically nilpotent | true | R06 |
| `banachFunctionAlgebra` | `K×K` with the max norm and with twice the max norm; `K⟨T⟩/(T²)` | `C = 1` and `C = 2`; non-reduced: `‖T‖ > 0 = C·0`, so `[IsReduced]` is needed | true | kept |
| `mem_iff_supSeminorm_le_one_of_isReduced` | `ℤ_p ⊂ ℚ_p`, `ϖ=p`; `ℚ_p⟨T,S⟩/(S²−p²T)`; `ϖ=p²` in `ℤ_p` | `𝔽_p` reduced, `B = A°`; `B/pB = 𝔽_p[T,S]/(S²)` and `S/p ∈ A°∖B`; non-reduced yet `B = A°` (sufficient, not necessary) | true | R06 |
| `IsPresentationRing`, `integral_iff…` | `A=K`; `K⟨T⟩/(T²)` | `S = K°`: integral ⇔ `|a| ≤ 1`; `T/ϖ` nilpotent, so integral, and `|·|sup = 0` | true | R02, R06 |
| `exists_fg_smul_le_of_presentation` | `K=ℂ_p`, `N=𝔪`; `N=0` | `N' = x𝒪` with `ε<|x|<1` (`|cm| < ε < |x|`); `N' = 0` | true | R03 |
| `isNoetherian_of_presentation_of_discrete` | `ℚ_p` (ρ=1/p); `ℂ_p` | hypothesis ⇔ discrete value group; `ℂ_p` fails it | true | R03 |
| `IsSlopeLE` | `X−c` with `|c|<r=1`; `1−cT`; `Q=0`; `A=0` | root `c` fails; root `1/c` passes; root `0` fails; vacuous | true, = pinned | R02 |
| `IsSlopeDecomposition` | `U = c·id` with `|c| = r`; `U = 0` | `(M,0)` with `Q = X−c`; `(0,M)`, since `Q(0)` is a unit and `P(0)·id` is bijective | true, = pinned | R02, R06 |
| Tate acyclicity (Layer 5) | Laurent cover; an infinitely generated free module | Čech exact after tensoring a bounded exact flat complex; statement elaborates on the pin | statable | R04 |
| Constructible density (§8.2) | rank-two point just below the Gauss point | `{x}` is proconstructible but not constructible (by Cor 4.3, it has no classical trace); statement elaborates | statable | R04 |
| §8.3 equivalence | two closed discs glued along the open disc | not quasi-separated; the Gauss and rank-two points are doubled in `r(X)` | true (Huber-FR 4.5); uses Prop 4.3 | R01 |
| §6.3 properness | `ℙ¹`; unit disc over `K` | `{|z|≤1} ⋐ {|z|≤|ϖ|⁻¹}`; not inner in itself (not finite) | sound for those instances | R05 |
| §7.1 Banach lemmas | `h: ΣaₙTⁿ ↦ ΣaₙϖⁿTⁿ`; `id−h`; `f = e = id_K` | `‖h−h_N‖ = |ϖ|^N`, `c = 1`; image `T·K⟨T⟩`, cokernel `K`; `f−e = 0`, so the bound is at most 1 | true | R10 |
| §7.3 identity principle | axes `XY=0`; skyscraper at 0; `ℙ¹` | `Y ≠ 0` vanishes on `X≠0`, so normality is needed; nonzero sections vanish on `|T|=1`; a member of the exhaustion equals `ℙ¹`, not affinoid | true | R11 |
| §7.4 base change | `ℙ¹_A`, `𝒪(−2)`; ideal of `P` twisted by `𝒪(−1)` over `K⟨t⟩` | `M¹ = A`, base change gives `A⟨f/g⟩`; `H⁰ = 0`, while on the fibre `I_P|ℙ¹_K = 𝒪(−P)⊕k_P` twisted has `H⁰ = K` | true | R01 |
| §7.5 filtrations | `a=0`; `a=1`; `Sp A` in degree 0 | `R_n = 0` for `n ≥ 1`; `R_n = M`; `R_n = aⁿM`; the uniform shift `e = k₀+m` from Kiehl's null system also covers `n < k₀` | true | R01 |
| §2.2 multiplicativity | annulus `XY=c`; `K⟨T⟩/(T²)` | domain with `|XY| = |c| < 1 = |X||Y|`, `Ã` not a domain; `Ã = K̃` is a domain, so multiplicative but not a norm | consistent with "iff reduced and `Ã` a domain" | — |
| §1.3 completed field extension | `M=A`, `L=K`; `M = K⟨T⟩/(T)` | both sides `A`; both sides `L` | true (Conrad 1.1.5) | — |
| §0.1 Checks | `p+T²`; `p+T+pT²` | max 1 at `T=1`, `|p|` at 0; reduction `T` | true | R11 (supplier) |

## Not verifiable

**BGR** (manifest: uncertified, paywalled, no legal text): §0.2 (2.3.2/7, 3.5.1–3.5.3, 3.5.3/1–2, 4.1/3–4, 4.4/2, 5.3.1/1); §1.1 (3.7.5, 6.1.3); §1.3 (6.1.1); §1.4 (6.1.4–6.1.5, 7.2); §1.5 (6.1.5); §2.1 (3.8.1/7, 6.2.2/4); §2.2 (3.8, 3.8.3/7, 6.2.1–6.2.4); §2.3 (6.3.1/4–6, 6.3.4–6.3.5); Layers 3–4 (Chapters 7–8); Layer 5 (8.2); §6.1 (9.1, 9.1.2–9.1.3); and the BGR locators in the Suggested.lean docstrings. These were checked only for mathematical content. Their numbering is corroborated where open sources cite it:

- Conrad lines 574–575 (BGR 6.1.2/2, 5.2.6/1).
- Huber-CV lines 749–751 and 761 (BGR 6.1.1/3, 6.1.3/1, 6.1.2/3).
- Temkin line 788 (BGR 9.6.2/2).

## Source issues

- **Error** in KiehlE at Satz 5.1, p. 212: the source says that for discretely valued `k` every submodule is finite over *any* `V`-subalgebra `B₀` defining the topology. It should restrict to `B₀` a quotient of `V⟨X₁,…,Xₙ⟩`: in `K⟨T⟩`, `B₀ = V+ϖV⟨T⟩` defines the topology, but its ideal `ϖV⟨T⟩` is not finitely generated. Affects nothing; this roadmap uses `B₀ = π(Tₙ°)`.
