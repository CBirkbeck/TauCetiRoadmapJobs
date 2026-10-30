# Review of StableReduction (pull request #898 at af52087)

**Verdict:** accepted

This head repairs every finding of the previous review except the shape note it was allowed to leave. The acceptance test now consumes the pinned carriers and states one headline that is statable at the pin; every cited library name but one resolves at the pins, every cross-roadmap citation resolves, the gate passes, the dependency check is clean, and the adversarial pass found no false statement. The remaining findings are P3.

**Repair status of the previous review's findings.**

- R01 (P2, redeclared carriers): repaired. `TauCetiRoadmap/StableReduction/Suggested.lean` is now 58 lines, imports only `TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic`, declares no definition, and states `exists_regular_proper_model` on `TauCeti.Model`. The docstring names the six end goals and the Layer 6–7 milestones as not statable and says which carrier each lacks (`StableFamily`, pointed families, `PrestableMap`, `HasNodalReduction`, the numerical type of a model); the Mathlib commit is gone.
- R02 (P3, padding): repaired. No proved `example`, no API lemma, no value computation remains.
- R03 (P3, inventory versus pin, process text): repaired. The dated inventories are replaced by `## Exact supplier contracts` (README lines 182–333); the audit sentence, the Mathlib pull-request numbers and the Zulip advice are gone; the "What the pins lack" list (lines 325–333) no longer names anything that exists at the pin (checked item by item below).
- R04 (P3, Jacobian criterion hypothesis and owner): repaired. Lines 641–656 state the algebraically closed residue field of Deligne–Mumford §2 and the perfect residue field of Stacks Remark 55.18.2, name NeronModelsAndSemistableAbelianVarieties §3.1 and §§3.8–3.9 for the statement's and proof's inputs, and place the criterion downstream of both roadmaps.
- R05 (P3, 0E6N locator): repaired. Lines 420–432 cite 0E6N for Lemma 109.19.1, Definition 109.19.2 and Lemma 109.19.3, and the lci formula to Stacks Lemma 48.29.2 and Lemma 48.17.11; both verified below.
- R06 (P3, README shape): not done, as permitted; restated as R03 below.

## R01 (P3) — Genus, Euler degree and the canonical bundle exist at the pin and are not cited

**Location.** `TauCetiRoadmap/StableReduction/README.md` lines 282–289 ("Shared foundations with the Jacobian challenge": `InvertibleSheaf`, `Scheme.Modules.Cohomology`, `SchemeWeilDivisor.relativeDegree`), the J-A2 and J-B rows (lines 305–306: "deg L = χ(L) − χ(𝒪)", "Define g = dim H¹(𝒪) once"), the J-B / SR-2 row ("no independent smooth ω"), line 432 ("agrees with the Jacobian roadmap's ω_{X/k}").

**Claim.** The paragraph says it lists the beginning of the shared lane at the pin, and the contract rows and Layer 2 treat the genus, the Euler-characteristic degree and the smooth-curve ω as objects still to be defined by the Jacobian roadmap. At the pinned Tau Ceti they exist: `AlgebraicGeometry.Scheme.genus` (`TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`, `dim_k H¹(X, 𝒪_X)` under a finite-dimensionality instance), `TauCeti.AlgebraicGeometry.InvertibleSheaf.eulerDegree` (`LineBundle/Degree.lean:70`, `χ(L) − χ(𝒪)` through degree-2 truncated Euler characteristics), `TauCeti.AlgebraicGeometry.canonicalBundle` (`LineBundle/SerreDuality.lean:59`, built from Weil differentials, with `eulerDegree_canonicalBundle` at line 168 giving `2g − 2` on a proper curve). Layer 2's "Define arithmetic genus" (line 416) and the ω comparison (line 432) have pinned objects to compare with, and an implementer reading the contracts would build a second genus and a second degree.

**Witness.** `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64` versus README line 306; `LineBundle/SerreDuality.lean:12–30` (Weil-differential construction, no Kähler identification, no base change) versus README line 432.

**Repair.** Add to the "Shared foundations" paragraph: the genus `AlgebraicGeometry.Scheme.genus` in `Cohomology/Genus.lean` (over a field, guarded by finite dimensionality of `H¹`), the Euler-characteristic degree `InvertibleSheaf.eulerDegree` in `LineBundle/Degree.lean`, and the canonical bundle `canonicalBundle` with `eulerDegree_canonicalBundle` in `LineBundle/SerreDuality.lean` (a Weil-differential representative; not yet identified with Kähler differentials and without base change). In Layer 2, make the family genus `HasGenus f g` specialise to `Scheme.genus` on fibres, and make the dualizing-sheaf comparison on smooth fibres a comparison with `canonicalBundle`; in the J-B row, replace "Define g = dim H¹(𝒪) once" by "extend `Scheme.genus`".

## R02 (P3) — One wrong fully qualified name and one section label

**Location.** `TauCetiRoadmap/StableReduction/README.md` line 265 ("relative effective Cartier divisors `AlgebraicGeometry.IsRelativeEffectiveCartier`"); line 665 ("Follow Stacks §§53.23–53.25" linked to tag 0E7N).

**Claim.** The predicate is declared inside `namespace AlgebraicGeometry.Scheme.IdealSheafData` (`TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Relative.lean:57–63`), so its name is `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`; the supplier paragraph's promise "every declaration named … exists … in the file given" fails for this one name. Tag 0E7N is Algebraic Curves §25 only (`stacks-0E7N` line 2909); §§23–24 are separate sections.

**Witness.** `Relative.lean:57` (`namespace AlgebraicGeometry.Scheme.IdealSheafData`), `:63` (`def IsRelativeEffectiveCartier`); `stacks-0E7N` lines 2628, 2748, 2909 (sections 23, 24, 25).

**Repair.** Write `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`. Either label the link "§53.25 (with §§53.23–53.24)" or link the section range from the chapter.

## R03 (P3) — README shape: no `## Scope and ownership`, deferrals scattered, two deferrals without a named section

**Location.** `TauCetiRoadmap/StableReduction/README.md`, whole file; in particular lines 641–656 (the Jacobian criterion "in a Part II of this one"), lines 786–788 ("connect it to the pushforward curve class once Chow groups of one-cycles exist"), line 11 ("does not yet claim").

**Claim.** The README still predates the house shape (no `## Scope and ownership`, `## Conventions` under another title, no `### k.n` subsections, no `*Needs:*` lines, one global Checks list). Two deferrals are not stated as ownership: the curve–Jacobian criterion goes to "a Part II of this one" (StableReductionPartII is in the merge order after NeronModelsAndSemistableAbelianVarieties, so the direction is right, but no section is named), and the one-cycle comparison in Layer 11 is left to "once Chow groups … exist" with no owner. The Néron roadmap at its open head still cites "StableReduction Layer 7 (the curve–Jacobian criterion)" in its §6.14 and its downstream list; that citation is now stale on the consumer's side, which a `## Scope and ownership` entry here would make visible. "Does not yet claim" is process wording.

**Witness.** Néron README (open head, read through the roadmap index) §6.14 and its downstream-consumers list name Layer 7 for the criterion; this README line 655: "never as a Layer 7 target".

**Repair.** Add `## Scope and ownership` listing: the curve–Jacobian criterion is left to StableReductionPartII (statement after NeronModelsAndSemistableAbelianVarieties §§3.1, 3.9); the one-cycle class comparison is left to the roadmap owning Chow groups of one-cycles (SchemeAndStackFoundations, Chow groups layer) and this roadmap's degree is the polarization degree; drop "yet". The full restructuring (subsections, `*Needs:*` lines, per-definition Checks) can wait for the next revision that touches the layers.

## R04 (P3) — A stronger Layer 4–5 statement is statable at the pin

**Location.** `TauCetiRoadmap/StableReduction/Suggested.lean` lines 42–57; README lines 542–547 (Layer 4 resolution) and 554–562 (Layer 5).

**Claim.** The stated headline (a regular proper model exists) is the corollary of Stacks Lemma 55.8.3 (`stacks-0C2U` lines 2818–2829): every model of a smooth curve admits a resolution, which is again a model. With `TauCeti.Model` and `TauCeti.Model.Hom` at the pin, the lemma itself is statable: for every proper `M : TauCeti.Model R K C toK` there is a proper `P` with regular stalks and a morphism `P ⟶ M` of models; the stated existence follows by applying it to `TauCeti.Model.closure`. The common-resolution form Layer 8 needs (two regular proper models are dominated by a third) is statable the same way. Neither is an end goal, so this is a suggestion, not a defect.

**Repair.** Optionally add the resolution statement (and the common-resolution statement) with `sorry`, keeping the existence theorem as its corollary or deleting it.

## Verified sound

**Gate and build.** The worker's gate at af52087 passes every check (`gate.md`: build, depcheck, stray-files, set_option, imports, prnum, residue all 0). I elaborated `TauCetiRoadmap/StableReduction/Suggested.lean` with `lake env lean` from the worktree: exit 0 in 2.7 s, output the `#check` line (`IsProper.eq_valuativeCriterion : @IsProper = ValuativeCriterion ⊓ @QuasiCompact ⊓ @QuasiSeparated ⊓ @LocallyOfFiniteType`) and the single warning `declaration uses sorry` at line 50. Pull-request scope: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StableReduction'` is empty.

**Dependency check**, run as instructed with `--movable`:

```
depcheck: 205 roadmaps, 1401 edges, 0 problem(s)
```

No UPWARD or CYCLE line. StableReduction is on main and not in the merge order; the check places it after its last supplier.

**Signature check.** A scratch copy with `#check @TauCetiRoadmap.StableReduction.exists_regular_proper_model` elaborates to `∀ (R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K] (C : Scheme) (toK : C ⟶ Spec K) [IsProper toK] [SmoothOfRelativeDimension 1 toK], ∃ M : TauCeti.Model R K C toK, M.IsProper ∧ ∀ x, IsRegularLocalRing (M.total.presheaf.stalk x)`: no binder is lost, and it equals README lines 554–562 (a smooth proper curve, no connectedness, a proper model with regular total space). Nothing changed.

**One-tactic probe.** On the scratch copy, `first | rfl | simp | infer_instance | trivial | exact ⟨_, inferInstance, fun _ ↦ inferInstance⟩` fails (unsolved goal, instance `IsRegularLocalRing` not found): not padding. The file has one sorried theorem and no other declaration.

**Headline theorems.** The end goals (README lines 34–64): classical stable reduction, uniqueness, pointed stable reduction, stable maps, the stable-map API, the valuative interface; plus Layer 7's nodal reduction with the degree bound and Layer 6's Artin–Winters conclusion. Grep of the pinned Tau Ceti for `AtWorstNodal`, `StableFamily`, `PrestableFamily`, `PrestableMap`, `HasNodalReduction`, `DualGraph`, `ofModel`/`numericalType`: no file. So none of them is statable at the pin, and the docstring says so with the missing carrier for each. The one stated headline is the one Layer 5 milestone statable on `TauCeti.Model`.

**Library declarations opened at the pins** (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`; file and line):

| README name (line) | At the pin |
| --- | --- |
| `TauCeti.AlgebraicGeometry.RelativeDimensionLE`, `PureRelativeDimension` (231–233) | `Morphisms/RelativeDimension.lean:84`, `Morphisms/PureRelativeDimension.lean:79` |
| `TauCeti.AlgebraicGeometry.FamilyOfCurves` (234–236): proper, flat, lfp, relative dimension ≤ 1 | `Curves/Family.lean:56`, extends exactly `IsProper, Flat, LocallyOfFinitePresentation, RelativeDimensionLE 1` |
| `TauCeti.genericFiber`, `specialFiber`, `genericFiberIsoFiberGenericPoint` (236–239) | `AlgebraicGeometry/Fibers.lean:43, 55, 248` |
| `TauCeti.FiniteDVRExtension` (239–243): maximal ideal of the integral closure over `m_R`, `IsLocalization.AtPrime` | `DVRExtension/Basic.lean:85–108` (`prime.IsMaximal`, `prime.LiesOver (maximalIdeal R)`, `IsLocalization.AtPrime localRing prime`) |
| `FiniteDVRExtension.nonempty_binaryCofan` (244) | `DVRExtension/CommonRefinement.lean:113` |
| `TauCeti.Model` (245–248): flat, lfp, qc, qs, generic-fibre iso; `Model.Hom`; `Model.IsProper` | `Model/Basic.lean:44–57, 109, 72` |
| `Model.baseChangeFunctor` (249), `Model.subsingleton_hom` into a separated model (250–251) | `Model/BaseChange.lean:254`; `Model/Uniqueness.lean:43` (`[IsSeparated N.toBase] : Subsingleton (M ⟶ N)`) |
| `TauCeti.fittingIdeal`, `Scheme.Modules.fittingIdeal`, pullback (252–256) | `RingTheory/FittingIdeal/Basic.lean:343`; `Modules/FittingIdeal/Basic.lean:80`; `Modules/FittingIdeal/Pullback.lean` |
| `AlgebraicGeometry.Scheme.singularLocus` over an affine base (256–258) | `Curves/SingularLocus.lean:76`: `Fitt₁(Ω_{X/R})` for `X` over `Spec R`, flat, lfp, pure relative dimension 1 |
| `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` (258–260) | `RingTheory/Syntomic/StandardSyntomic.lean:81` |
| `TauCeti.NodeAlgebra` (260–261) | `RingTheory/Node/Basic.lean:37` |
| `TauCeti.Model.closure`, `isProper_closure` (261–264) | `Model/Closure.lean:141, 192` (closed immersion into the generic fibre of a qc lft `P → Spec R`; proper when `P` is) |
| `TauCeti.NodeAlgebra.isRegularLocalRing_stalk_blowup_iff` (266–268) | `Blowup/Node.lean:258`: blowup of `xy = πⁿ⁺²` regular iff `n ≤ 1` |
| `TauCeti.NumericalType`, `arithmeticGenus`, `Pic`, degree, `torsion` (269–273) | `NumericalType/Basic.lean:114, 320`; `Picard/Basic.lean:204, 294`; `Picard/Torsion/Basic.lean:45` |
| `exists_chain_or_fork_or_exceptional`, `IsMinimal.multiplicity_mul_abs_intersection_le` (273–278) | `NumericalType/Classification.lean:215`; `NumericalType/MultiplicityBound.lean:796` |
| `finrank_torsion_le_arithmeticGenus`, `g ≥ 2`, `ℓ > 768g − 768` (278–281) | `Picard/Torsion/Genus.lean:116`: `(hg : 2 ≤ T.arithmeticGenus) … (hℓ : 768 * T.arithmeticGenus - 768 < ℓ)` |
| `InvertibleSheaf`, `Scheme.Modules.Cohomology`, `SchemeWeilDivisor.relativeDegree` (282–289) | `LineBundle/Basic.lean:57–59`; `Cohomology/Basic.lean:61` (namespace `TauCeti.AlgebraicGeometry.Scheme.Modules`); `WeilDivisor/Scheme/Degree.lean:40` |
| Mathlib: `Scheme.Hom.fiber`, `IsQuasicoherent`, `IsFinitePresentation`, `Scheme.Hom.smoothLocus`, `IdealSheafData`, `ValuativeCommSq`, `Existence`, `Uniqueness`, `IsProper.eq_valuativeCriterion`, "future projects: DVRs over a Noetherian base", `integralClosure.isDedekindDomain`, `IsIntegralClosure.isNoetherian`, `IsRegularLocalRing`, `IsProper (Proj.toSpecZero 𝒜)`, the four `Geometrically*` classes, the eleven morphism classes | `Fiber.lean:37`; `Quasicoherent.lean:253, 269`; `Morphisms/Smooth.lean:300`; `IdealSheaf/Basic.lean:64`; `ValuativeCriterion.lean:53, 78, 83, 28–29`; `DedekindDomain/IntegralClosure.lean:234, 152`; `RegularLocalRing/Defs.lean:51`; `ProjectiveSpectrum/Proper.lean:372` (needs `Algebra.FiniteType (𝒜 0) A`); `Geometrically/{Connected,Reduced,Irreducible,Integral}.lean`; one file each under `Morphisms/` |
| "Mathlib has no syntomic morphisms, no projective morphisms and no relative Proj" (224–225) | grep of `Mathlib/AlgebraicGeometry/` for `syntomic`, `IsProjective`, a relative `Proj`: none |

The "What the pins lack" list (325–333) was checked against the same tree: no at-worst-nodal predicate, dual graph, relative dualizing sheaf, ampleness, prestable/stable family, marking, stable map, general blowup of an ideal sheaf (`Blowup/` has only `AffineCharts.lean` and `Node.lean`), intersection theory, regular/minimal model theory, or numerical type of a model exists there. The only pinned objects the list does not mention are the field-level genus, Euler degree and canonical bundle of R01.

**Cross-roadmap citations, resolved now.**

| Citation (README line) | Resolved at |
| --- | --- |
| AlgebraicVectorBundles L2A (319–323, 440) | main `AlgebraicVectorBundles/README.md:306–327` ("### L2A — structured linear schemes", "shared input interface for StableReduction Layer2's relative Proj"); open head (rev 1221) line 154 maps label L2A to its Layer 6 and line 489 names "StableReduction (Layer 6 for relative Proj)". Direction: supplier earlier. |
| JacobianChallenge Layers A–F, contract J-C (290–318) | main `JacobianChallenge/README.md:111, 135, 143, 218, 332, 448`; line 171 names "StableReduction's contract J-C". |
| NeronModelsAndSemistableAbelianVarieties §3.1, §§3.8–3.9 (648–653), §2.8 `KodairaConfiguration` (946–950), consumes Layers 0–7 (951–953) | open pull request #852 (read through the roadmap index): "### 3.1 The semistable reduction predicate", "### 3.8 The degree-zero Picard scheme of a semistable curve", "### 3.9 The Picard identity component is the Néron identity component", "### 2.8 Geometric component groups by type" with `KodairaConfiguration`; its supplier paragraph "From TauCetiRoadmap.StableReduction" lists Layers 0–7. The roadmap is earlier in the merge order; this README cites it only as a deferral and a consumer, never on a supply line (depcheck clean). |
| EllipticCurves `ReductionSymbol` kept until a geometric comparison (946–947) | main `EllipticCurves/README.md:865–866`. |
| StableReductionPartII (655, "a Part II of this one") | merge order line 292, after Néron (line 46); no readable folder. |

**Ownership.** `roadmaps grep` over main and the 436 open heads for `PrestableMap|IsStableMap|stable maps (to|of genus)`, `NumericalType|numerical type`, `HasNodalReduction|stable reduction theorem|minimal regular model`, `relative dualizing sheaf`, `at-worst-nodal`: on main every hit is this roadmap; at open heads, HyperellipticCurves (rev 1707 lines 54, 132–135, 972), EllipticKTheory (rev 1489 lines 113, 317–320), RelativeJacobiansAndIntegralCurveModels (#1232, lines 63, 78), Néron and Néron Part II all cite StableReduction as the owner and define none of these objects. SchemeAndStackFoundations on main (lines 90–102) and at rev 1276 (lines 94–106) defers finitely generated relative Proj, projective morphisms, stable families, blow-ups, strict transforms, arithmetic-surface intersection numbers and polarised descent to StableReduction Layers 0–4, keeping only the arbitrary-graded-algebra relative Proj with a comparison. No second owner. Ownership against open pull requests without files in this brief was checked only through the roadmap index.

**Sources read at the text (23 locators).**

| README claim (line) | Source and locator | Result |
| --- | --- | --- |
| Lemma 55.8.3: a model of a smooth curve has a resolution, which is a model (558–559) | `stacks-0C2U` lines 2818–2829: condition (4) of Lipman via Lemma 8.2 and J-2; any resolution is a modification, iso over the normal locus | matches; the lemma needs only "smooth curve" (integral), not `H⁰ = K` |
| Proposition 55.8.6 (559): closure in `ℙⁿ_R` is a projective model (Lemma 8.1), resolve, contract | `stacks-0C2U` lines 2787–2794, 2853–2859 | matches; `H⁰(C,𝒪_C) = K` is a hypothesis of 8.4–8.6 only (minimal models), not of the regular-model step |
| Stacks' notion of model: flat finite type with a generic-fibre iso; morphisms induce the identity on `V` (159–165, 245–248) | `stacks-0C2U` lines 2770–2775 | `TauCeti.Model` adds quasi-separated, which proper models have |
| 0A26: a proper scheme of dimension ≤ 1 over a field is projective (555–556) | `stacks-0A26` lines 4253–4257, Lemma 43.4 | matches |
| 0E6N: Lemma 109.19.1 (flat, base change), Definition 109.19.2, Lemma 109.19.3 (Gorenstein ⇒ invertible) (420–425) | `stacks-0E6N` lines 865–918 | matches, numbering included |
| Lemma 48.29.2: `ω = ∧ᶜ𝒩 ⊗ ∧ᵈΩ_{P/Y}|_X` for an lci morphism through an immersion into smooth proper `P`, `Y` Noetherian (425–430) | `stacks-0E9Z` lines 3650–3668 (`f^!𝒪_Y = (∧ᶜN ⊗ ∧ᵈΩ_{P/Y}|_X)[d−c]`, `N` the normal sheaf) | matches the README's `det(Ω_{P/S})|_X ⊗ det(𝒩_{X/P})` |
| Lemma 48.17.11: `f^!𝒪_Y` invertible for lci (430–431) | `stacks-0E9Z` lines 2357–2360 | matches |
| Theorem 55.18.1 with `B_g = (2g−2)(ℓ^{2g})!`, first two primes `> 768g`, genus 0 and 1 forms, simultaneous form (631–640) | `stacks-0CDN` lines 3943–3973 | matches |
| Remark 55.18.2: perfect residue field (645) | `stacks-0CDN` lines 3976–3979 | matches |
| Deligne–Mumford §2 standing assumption and Theorem 2.4 (643–646); Corollary 2.7 (972) | `deligne-mumford-numdam` lines 492–497 ("residue field (assumed algebraically closed)"), 556, 678–681 | matches |
| `ℓ > 768g`, `C(K') ≠ ∅`, `Pic(C_{K'})[ℓ] ≅ (ℤ/ℓ)^{2g}` (616–619) | `stacks-0CDN` lines 3904–3910 | matches |
| Example 14.1: `xy = πⁿ`, blowup chart `x'y' = πⁿ⁻²`, regular iff `n ≤ 1` (535–538, 850–854) | `stacks-0CDN` lines 3574–3595 | matches |
| Numerical type Definition 3.1 (578–586), `Pic(T)` Definition 4.1 (594–598) | `stacks-0CDN` lines 257–266, 514–531 | matches |
| Prestable Definition 20.1 (469–471) | `stacks-0E6N` lines 922–925 | matches |
| Lemma 21.1 (`m ≥ 2`, genus ≥ 1, no rational tail ⟺ `ω^m` generated) and Lemma 22.1 (genus ≥ 2, `ω` ample) (472–476) | `stacks-0E6N` lines 982–985, 1095–1099 | matches |
| Lemma 23.4 (0E8A): `𝒪_Y = c_*𝒪_X`, `R¹c_*𝒪_X = 0` universally, fibrewise contraction, unique (683–685) | `stacks-0E6N` lines 1323–1332 | matches |
| Theorem 24.3 (0E98) two forms (34–40, 635–640) | `stacks-0E6N` lines 1444–1453 | matches |
| Algebraic Curves §20 (0C58) nodal families; §§23–25 contraction (665, 963) | `stacks-0E7N` lines 2157–2158, 2628, 2748, 2908–2909 | matches (R02 for the label) |
| Knudsen II §1 contraction with Main Lemma 1.6, §2 stabilization, §3 clutching (508, 977–979) | `knudsen-ii` (open journal scan, OCR) lines 31–54, 280, 423, 630 | matches |
| Behrend–Manin Prop. 3.10, Lemmas 3.11–3.12 on page 22 (803) | `behrend-manin` lines 872–912 | matches, including `L = ω_C(Σxᵢ) ⊗ f^*M^{⊗3}` and "at most one component to be contracted" |
| Fulton–Pandharipande stability and the `(1,0,0)` remark (987, 814–817) | `fulton-pandharipande` lines 238–252 | matches |
| Chapter numbers 53, 55, 109, 48 | `stacks-0CDN` lines 4041–4043, 4104 | matches |

**Adversarial table.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_regular_proper_model` (Lean 50) | `C = ∅` | `∅ → Spec R` flat, lfp, qc, qs, proper; generic fibre `∅ ≅ ∅`; regularity vacuous | true, not vacuous for `C ≠ ∅` | none |
| same | `C = ℙ¹_K` | `ℙ¹_R`: smooth over `R`, hence regular; proper; generic fibre `ℙ¹_K` | true | none |
| same, beyond Stacks' `H⁰ = K` | `C = ℙ¹_{K'}`, `K'/K` separable of degree 2, as a `K`-scheme (smooth of relative dimension 1 since `Spec K' → Spec K` is étale) | `ℙ¹_{R'}` with `R'` the integral closure (finite over `R`): proper, regular, generic fibre `ℙ¹_{R' ⊗_R K} = ℙ¹_{K'}` | true; Lemma 55.8.3 applies to any smooth (integral) curve | none |
| same, disconnected | `C = ℙ¹_K ⊔ ℙ¹_K` | disjoint union of two models; qc since finite | true (README 558–559) | none |
| same, hypothesis needed | `y² = xᵖ − t` over `K = 𝔽_p(t)`, regular but not smooth | excluded by `SmoothOfRelativeDimension 1`; without smoothness Lemma 8.2's finite normalization can fail over a non-Japanese `R` | hypothesis necessary and present | none |
| same, base | `R` a field | excluded: Mathlib's `IsDiscreteValuationRing` is not a field | n/a | none |
| same, context | `[IsProper toK] [SmoothOfRelativeDimension 1 toK]` are instance binders of the theorem, not section variables | `#check` output above | in scope | none |
| `TauCeti.Model` versus README 159–165 | non-quasi-separated flat lfp `X → Spec R` | excluded by field `quasiSeparated`; README now says "quasi-compact and quasi-separated" | agree | none |
| `Model.subsingleton_hom` (250–251) | two model morphisms `M → N`, `N` separated | both induce the identity on the generic fibre; `M` flat so the generic fibre is schematically dense; at most one | "determined by its generic fibre" is exact | none |
| Numerical-type genus `1 + Σ mᵢ(wᵢ(gᵢ−1) − aᵢᵢ/2)` (590) | `m=(1,1), w=(2,2), g=(1,1), A=[[−2,2],[2,−2]]` | axioms: symmetric, off-diagonal `2 ≥ 0`, connected, `−2·1+2·1 = 0`, `2 ∣ ±2`; genus `1 + (0+1) + (0+1) = 3` | agrees with README 860–862 | none |
| same | `w = (1,2)`, same `m, g, A` | `w₁ = 2 ∣ 2, −2` ✓; genus `3`; `e₀ ↦ (a₀₀/w₀, a₀₁/w₁) = (−2, 1)`, `e₁ ↦ (2, −1)`; `Pic ≅ ℤ²/⟨(−2,1)⟩ ≅ ℤ` | agrees with README 863–865 (division by the destination weight `wⱼ`) | none |
| same | `w=(1,1), A=[[−1,1],[1,−1]], g=(1,1)` | halves `1/2 + 1/2`, genus `2`; `Σ mᵢaᵢᵢ = −2` even | agrees with README 865–866 | none |
| Evenness of `Σ mᵢaᵢᵢ` (591) | general type | `Σᵢ mᵢ² aᵢᵢ = −2 Σ_{i<j} mᵢmⱼaᵢⱼ`, `mᵢ² ≡ mᵢ (mod 2)` | even | none |
| same, `n = 1` | one component | `m₁a₁₁ = 0 ⇒ a₁₁ = 0`; genus `1 + m₁w₁(g₁−1)`; `m₁=2, w₁=1, g₁=0` gives `−1` | negative genus possible, as README 592–593 says | none |
| `Pic(T)` weighted versus `Coker(A)` (594–600) | first example | `ℤ²/⟨(−1,1)⟩ ≅ ℤ` versus `ℤ²/⟨(−2,2)⟩ ≅ ℤ ⊕ ℤ/2` | different groups, injection `eⱼ ↦ wⱼeⱼ` | none |
| `finrank_torsion_le_arithmeticGenus` bound (279–281) | `g = 2`: pin needs `ℓ > 768`, Stacks `ℓ > 1536` | pin's hypothesis `768g − 768 < ℓ` is weaker than `768g < ℓ` | README states the pin's form correctly | none |
| `pₐ = Σ g_v + b₁(Γ)` (395–399, 855–859) | two smooth components, one node: `b₁ = 0`; cycle of `r` rational curves: `V = E = r`, `b₁ = 1`; one-component nodal rational curve: loop, `b₁ = 1`; empty graph: `b₁ = 0 − 0 + 1 = 1` | `g₁+g₂`; `1`; `1`; spurious `1` | matches the normalization sequence; nonemptiness required and required by README 858–859 | none |
| `deg(ω|_E) = 2g(Ẽ) − 2 + #branches` (433–437) | rational tail `−2+1 = −1`; bridge `−2+2 = 0`; cycle of `r` rationals: each `0`, sum `0 = 2·1−2`; one-node rational curve `−2+2 = 0` | agree with README 867–869 | sound | none |
| Single-marking contraction `B = ω(s₁+⋯+sₙ)` (508–516) | stable `(n+1)`-pointed fibre, `2g−2+n > 0`, remove `p` | `deg B|_E = (2g_E − 2 + flags(E)) − [p ∈ E] ≥ 1 − 1 = 0`; zero iff `E` rational with three flags one of which is `p`: a tail with one retained marking or a bridge with none; `p` smooth lies on one component | at most one such component; whole-curve contraction needs `(g,n+1) = (0,3)`, excluded by `2g−2+n > 0` | none |
| Stable-map vertex inequality (789–795) | `deg(ω(Σs) ⊗ F^*L^3)|_E = 2g_v − 2 + val + n_v + 3d_v` | `d_v ≥ 1 ⇒ ≥ −2 + 3 = 1`; `d_v = 0` is pointed stability | agree | none |
| Excluded types when forgetting a marking (814–817) | `d = 0`: `2g − 2 + n' > 0` fails for `(0, n' ≤ 2)` and `(1, 0)`; `d > 0`: never | matches `fulton-pandharipande` line 251 | agree | none |
| Genus-zero nonuniqueness (880–882) | `T₁T₂ = πT₀²` in `ℙ²_R` | chart `xy = π` regular; special fibre two lines `E₁ + E₂`, `(E₁+E₂)·E₁ = 0`, `E₁·E₂ = 1 ⇒ E₁² = −1` | two contractions to two smooth models | none |
| Node regularity (850–854) | `R[x,y]/(xy − πⁿ)` at `(π,x,y)` | `n ≥ 2`: `πⁿ ∈ m²`, `dim m/m² = 3 > 2`; `n = 1`: `π = xy ∈ m²`, `dim m/m² = 2` | regular iff `n ≤ 1`; blowup chart thickness `n − 2`, matching `isRegularLocalRing_stalk_blowup_iff` (`n+2 ↦ n`, regular iff `n ≤ 1`) | none |
| `HasNodalReduction` versus `SemistableFamily` (116–127, 623–626) | Stacks "has semistable reduction" = some proper at-worst-nodal model | the README keeps the two notions apart and names the Chapter 55 one `HasNodalReduction` | agree | none |
| Genus-zero and genus-one forms (627–630) | Theorem 18.1 (1), (2) | degree-2 separable extension with `C_{K'} ≅ ℙ¹_{K'}`; smooth genus-one or cycle of rational curves | agree | none |
| Simultaneous form from `K'`-rational `ℓ`-torsion (635–640) | genus ≥ 2 | the choice of `K'` in `stacks-0CDN` lines 3906–3907 depends only on `K'`; every maximal ideal of `R'` then works | agree with Theorem 18.1(3) | none |
| Curve–Jacobian criterion deferral (641–656) | forward direction for a regular model with reduced nodal special fibre over an arbitrary DVR | Néron §3.8–3.9 prove `Pic⁰ = N⁰` semi-abelian without residue-field hypothesis; the converse (descent of a stable model) is DM 2.4 under algebraically closed residue field | the README's hypothesis statement is exact; no cycle (Layer 7 cites nothing from Néron on a supply line) | R03 note |
| Contraction descent hypotheses (461–466) | proper surjective, `𝒪_Y = c_*𝒪_X` universally, separated target, constant on geometric fibres | same as Lemma 23.4's use and Behrend–Manin Lemma 2.2 (`behrend-manin` line 888) | no overclaim | none |
| Valuative-criterion inventory (208–212) | `IsProper.eq_valuativeCriterion` elaborates to `ValuativeCriterion ⊓ QuasiCompact ⊓ QuasiSeparated ⊓ LocallyOfFiniteType` | the file's "Future projects" line 28–29 matches README 211–212 | agree | none |

**Declared gaps.** None declared (no `design/plan.json`); the README states no `gap:` contract. No `*Needs:*` line cites a later roadmap.

## Not verifiable

- Artin–Winters, Topology 10 (1971): paywalled publisher; cited only as a general reference without a locator, so no claim depends on it.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*; Mumford–Fogarty–Kirwan; Gieseker: background references without locators; not fetched.
- Deligne–Mumford via the Centre Mersenne page the README links: the service classifies that host as unknown; the Numdam copy of the same article was read instead, so nothing is missing.
- StableReductionPartII: in the merge order but with no readable folder, so the deferral of the curve–Jacobian criterion to it could be checked only for direction.

## Source issues

- none
