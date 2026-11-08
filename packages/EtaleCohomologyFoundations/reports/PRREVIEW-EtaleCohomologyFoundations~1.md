# Review of EtaleCohomologyFoundations (pull request #1891 at 6f02163)

**Verdict:** needs changes

Fifteen findings: five blocking (P2) and ten P3. No statement was found false. The blocking problems are a failing gate (sorry'd data), two blocks that restate objects already in the pinned Tau Ceti library, headline theorems that can be stated at the pins but are missing, and a point count that two open roadmaps both own.

## R01 (P2) — Gate fails: sorry'd data in nine definitions and instances

**Location.** `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` lines 99–107, 127–137, 140–150, 201–203, 235–236, 295–300, 319–323, 409–415, 418–422.

**Claim.** The gate reports `sorry-data=9`. The affected declarations are:
- the `Category (Compactification f)` instance (`id_comp`, `comp_id` and `assoc` are `sorry`);
- `Compactification.baseChange` and `Compactification.denseReplacement`;
- `instance nagataCompactification … := sorry` and `instance EtaleFundamentalGroup.small … := sorry`. These are unproved `Prop` instances that typeclass search would hand to every consumer;
- `ContinuousRep.ofCharacter`, `ContinuousRep.baseChange`, `IntegralModel.toContinuousRep` and `IntegralModel.smul`.

A tenth `sorry` is inside a theorem's statement: `quasiCompact := by sorry` in the `let` of `denseReplacement_specialFiber_empty` (line 181).

**Witness.** Re-running the gate at this head gives the nine `sorry-data` lines (rule: no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`), with status FAIL.

**Repair.** Most of these declarations go once R02, R03 and R07 are applied. For what remains:
- State `nagataCompactification` as a `theorem` on Tau Ceti's carrier: `theorem nagataCompactification … : Nonempty (TauCeti.Compactification f) := by sorry`.
- Delete `EtaleFundamentalGroup.small`. `infer_instance` cannot prove it (tested: `failed to synthesize Small.{u, u+1} (EtaleFundamentalGroup x)`), and it is not a headline.
- If the roadmap's own `Compactification` is kept against R02, the Category laws are provable. Tested on a copy: `@[ext]` on `Compactification.Hom`, then `id_comp _ := Compactification.Hom.ext (Category.id_comp _)` and likewise for `comp_id` and `assoc`. That copy elaborates.

## R02 (P2) — §§G.1–G.3 restate Tau Ceti's proved compactification package

**Location.** README lines 7 and 66–93 ("This roadmap owns scheme compactification objects, Nagata existence and coherent common refinements"), §G.3 lines 172–197; `Suggested.lean` lines 76–222.

**Claim.** The pinned Tau Ceti already has, with proofs:
- the carrier, its category and the dense full subcategory;
- dense replacement, its flat base change, morphism properness, uniqueness of maps out of dense sources, common refinements, and cofilteredness;
- both README Checks that are mirrored in Lean (the dual-number section and the special fibre).

The README states all of these as targets to build. `Suggested.lean` redeclares them with sorried laws, under names that collide with the library's. Only Nagata existence is absent from Tau Ceti: its `Cofiltered.lean` docstring defers to it.

**Witness.** At Tau Ceti `2fd255d`, under `TauCeti/AlgebraicGeometry/Compactification/`:
- `Basic.lean:58` `abbrev Compactification`, `:223` `DenseCompactification`, `:115` `instance proper`;
- `Uniqueness.lean:45` `hom_unique`, `Refinement.lean:97` `commonRefinement`, `Cofiltered.lean:67` `IsCofiltered (DenseCompactification f)` given `Nonempty`;
- `DenseReplacement/Basic.lean:73,238`, `DenseReplacement/DualNumber.lean:48`, `SpecialFiber.lean:45`.

**Repair.**
1. In Scope and the supplier contracts, cite these Tau Ceti files and declarations, with a "From Tau Ceti" row listing them.
2. Reduce §§G.1 and G.3 to what Tau Ceti lacks. G.2 Nagata stays, together with whatever the refinement comparison principle needs beyond `Refinement.lean`.
3. In `Suggested.lean`, `import TauCeti.AlgebraicGeometry.Compactification.Cofiltered`, keep only `nagataCompactification` as in R01, and delete lines 76–197 and 205–222.

Tested on a scratch file: Nagata stated on `TauCeti.Compactification` elaborates, and `IsCofiltered (TauCeti.DenseCompactification f)` then follows by `have := nagataCompactification f; inferInstance`. `denseCompactification_cofiltered` is therefore a one-step consequence.

Add one old → new line per renamed id (for example `denseCompactification_hom_unique` → `TauCeti.Compactification.hom_unique`). ComplexComparisonPartII (README lines 816–817, 2570–2571) and NeronModelsAndSemistableAbelianVarieties (README lines 175–176, 1344, 1436) cite these names.

## R03 (P2) — §F.4.0 restates Tau Ceti's `ContinuousRep`, integral models and the stable-lattice theorem

**Location.** README lines 1186–1239 and line 13 ("Section F.4.0 supplies `ContinuousRep`, its `Iso`, `ofCharacter` and `baseChange`, `ContinuousRep.exists_stable_lattice_iff`, and `GaloisLattice.IntegralModel`…"); `Suggested.lean` lines 255–435.

**Claim.** The pinned Tau Ceti already proves all of the following:
- `TauCeti.ContinuousRep` with `Iso`, `ofCharacter`, `baseChange`, `baseChangeSelfIso`, `baseChangeTransIso` and `nonempty_iso_ofCharacter_iff`;
- `TauCeti.GaloisLattice.IntegralModel` with `toContinuousRep`, homothety (`MulAction Eˣ`), `genericFiberIso`, the instance `IntegralModel.nonempty` and `IntegralModel.exists_pow_le`;
- the stable-lattice criterion `Subgroup.isCompact_closure_iff_exists_stable_lattice`.

The README also uses `TauCeti.GaloisLattice.IntegralModel.genericFiberIso` as the generic-fibre isomorphism of the roadmap's *own* `GaloisLattice.IntegralModel`. That does not typecheck: the Tau Ceti map is defined on Tau Ceti's structure over `TauCeti.ContinuousRep`. So the README builds a second carrier that is incompatible with the one it consumes.

**Witness.** Tau Ceti `RepresentationTheory/Continuous/`:
- `ContinuousRep.lean:82,318,340,391,434,464`;
- `IntegralModel.lean:72,211,242,258`;
- `StableLattice.lean:133`.

`#check` at the pin: `exists_pow_le` has exactly the roadmap's statement (lines 429–433).

**Repair.**
1. Replace §F.4.0's carrier and its operations by supplier contracts on these Tau Ceti declarations. Keep only what Tau Ceti lacks, for instance saturation, dual lattices and the matrix form, as targets.
2. Delete `Suggested.lean` lines 255–435.
3. Add old → new lines for `ContinuousRep.exists_stable_lattice_iff`, `GaloisLattice.IntegralModel` and the other renamed ids. InverseGaloisAndArithmeticFundamentalGroups (README lines 308, 818–839), ArithmeticGaloisRepresentations (README lines 599, 1075), AutomorphicFormsOnReductiveGroups (README line 45) and ErdosProgressionPowers (README lines 538–539) cite them.

## R04 (P2) — Headline theorems statable at the pins are missing; the not-statable list is wrong and not itemised

**Location.** `Suggested.lean` lines 42–43: "The sheaf-theoretic targets of the README require the derived, constructible and adic carriers it specifies and are absent from this file."

**Claim.** Several headline theorems need only Mathlib's `Sheaf.H` on `X.smallEtaleTopology` and `Scheme.EllAdicCohomology`, not the derived carriers:
- the étale cohomological-dimension bound (§F.3.0);
- affine Artin vanishing (§F.3);
- finiteness of `Hⁱ(X, ℤ/n)` for proper `X` over a separably closed field (§F.3);
- vanishing of ℓ-adic cohomology above `2 dim X` (§§F.4.3–F.4.4).

None of them is stated. The docstring also names no individual headline and no missing carrier.

**Witness.** A scratch file with `import Mathlib` only elaborates all four statements with `sorry` as the only warning, for example: `theorem etaleFiniteness … [IsProper f] (n : ℕ) (hn : (n : k) ≠ 0) (i : ℕ) : Finite (((constantSheaf X.smallEtaleTopology AddCommGrpCat.{u}).obj (AddCommGrpCat.of (ULift (ZMod n)))).H i)`.

**Repair.** Add the four theorems, each with its README locator. The tested forms are:
- dimension bound: `Subsingleton (F.H q)` for `F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u}` with `∀ U (s : F.obj.obj U), ∃ n : ℕ, (n : k) ≠ 0 ∧ n • s = 0` and `2 * topologicalKrullDim X < q`, for `X` locally of finite type and quasi-compact over separably closed `k`;
- Artin vanishing: the same with `[IsAffine X]` and `topologicalKrullDim X < q`;
- finiteness: as quoted in the witness;
- ℓ-adic: `Subsingleton (X.EllAdicCohomology ℓ q)` for `(ℓ : k) ≠ 0` and `2 * topologicalKrullDim X < q`.

Then replace the sentence at lines 42–43 by a list of the headlines that cannot be stated, each with what is missing at the pins:
- `lisseMonodromyEquiv`: an equivalence as data, which needs a category of locally constant sheaves;
- proper and smooth base change: no pullback map on `Sheaf.H` and no `Rf_*`;
- Künneth, `Rf_!`, `f^!`, duality and smooth purity: no `RΓ`, `Rf_!` or `f^!` on étale sites;
- perverse `t`-structures: no `Dᵇ_c`;
- Gauss–Bonnet: no Chern classes.

## R05 (P2) — The point count has two owners: `Scheme.Hom.pointCount` here and `extensionPointCount` in WeilConjectures

**Location.** README line 11 ("The zeta series … belongs to WeilConjectures, a downstream consumer that forms it from `Scheme.Hom.pointCount`") and lines 1297–1309; `Suggested.lean` lines 475–483.

**Claim.** At the head of its open pull request, WeilConjectures defines its own count of points over the degree-`r` extension and builds its zeta series from that. It does not use `Scheme.Hom.pointCount`. Two open roadmaps therefore define the same object, and the README makes a false claim about its consumer.

**Witness.** WeilConjectures (#1208 head), `Suggested.lean` line 55: `def extensionPointCount {k : Type} [Field k] [Finite k] (p : ℕ)`; line 63 `def zetaSeries` uses it. Its README line 188 says `extensionPointCount` "takes the cardinality of this actual Hom type".

**Repair.** Choose one owner. This roadmap is earlier in the merge order, so the natural choice is to keep `Scheme.Hom.pointCount` and have the PR description's merge-order paragraph state that WeilConjectures replaces `extensionPointCount` by it. Until that happens, change line 11 to describe WeilConjectures as it actually is. The alternative is to delete `pointCount`, keep only Tau Ceti's `Scheme.Hom.numberOfRationalPoints` here, and cite WeilConjectures as the owner of the count.

## R06 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean` lines 69–72, 159–191, 213–222, 302–306, 325–345, 360–368, 455–461 and 519–536.

**Claim.** Several declarations mirror README Checks, follow from the library in one term or a few rewrites, or are basic API lemmas rather than headline theorems:
- Check mirrors: `denseReplacement_dualNumber_section`, `denseReplacement_specialFiber_empty`, `ofCharacter_iso_iff`, `baseChange_self_iso`, `baseChange_trans_iso` and `uniformizer_zpowers_no_stable_lattice`. The README Checks name each of them.
- One-term closures: `Compactification.Hom.proper` and `denseCompactification_cofiltered`.
- Short consequences of library lemmas: `projectiveTraceOfRetract_eq_contract` and `projectiveTrace_independent`.
- API lemmas: `Scheme.isInvertibleOn_iff_ne_zero` and `frobeniusFixedField_card`.

**Witness.**
- `Compactification.Hom.proper` closes by `(IsProper.comp_iff (g := D.p)).mp (h.comm_p ▸ C.proper)`.
- `projectiveTrace_independent` closes in three rewrites with Mathlib's `LinearMap.trace_comp_comm'`.
- The right-hand side of `_eq_contract` is by definition Tau Ceti's `LinearMap.projectiveTrace R P u`. Four rewrites with `projectiveTrace_eq_trace`/`_cyclic` prove it. All three were tested on scratch copies.

**Repair.** Delete these declarations from `Suggested.lean`; the README keeps each statement as a target or Check. Also remove the backticks from the README names that no longer exist in Lean, so the gate's name check stays clean.

## R07 (P3) — `Suggested.lean` works as a definition catalogue: unused definitions, a name catalogue, and catalogue framing

**Location.** `Suggested.lean`:
- lines 11–14: "suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap";
- lines 61–65, 226–253, 449–453: definitions;
- lines 540–655: a trailing comment that lists intended names.

**Claim.** No stated theorem uses `MonoidHom.weilGroup`, `EtalePath`, `VanishingCycles.geometricFrobenius` or `Scheme.IsInvertibleOn` (the last is used only by a padding lemma). `EtaleFundamentalGroup` is used only by the sorried `Small` instance. The rule is that definitions appear only where a headline needs them. The 115-line comment is a catalogue of names that repeats the README. The docstring presents the file as a set of suggestions rather than as the roadmap's acceptance test.

**Witness.** A search of the file for `weilGroup`, `EtalePath` and `geometricFrobenius` finds only their own declarations and docstrings. Lines 563–568 list `VanishingCycles.constructibleEtale, VanishingCycles.finiteEtaleGaloisCategory, …` with no declarations.

**Repair.**
- Delete those definitions; the README keeps them with their API and Checks.
- Delete lines 540–655.
- Rewrite the module docstring as "Étale cohomology foundations: target signatures": README.md is the roadmap; the file states the headline theorems against the pinned APIs; then the not-statable list from R04.

## R08 (P3) — The projective trace is cited from AdicSpacesPartIII §R3.8, but it is a pinned Tau Ceti declaration

**Location.** README line 53 (`AdicSpacesPartIII | §R3.8 / LinearMap.projectiveTrace, …_eq_trace, …_baseChange, …_cyclic`), lines 1871 and 1923–1924; `Suggested.lean` lines 511 and 558–559.

**Claim.** All four names exist, with proofs, at the pinned Tau Ceti. A roadmap supplier is therefore cited for what the library already provides.

**Witness.** `TauCeti/LinearAlgebra/Trace/Projective.lean:72` `noncomputable def projectiveTrace` (in `namespace LinearMap`), `:96` `projectiveTrace_cyclic`, `:118` `projectiveTrace_eq_trace`, `:158` `projectiveTrace_baseChange`.

**Repair.** Move these four to the "From Tau Ceti" contracts with that file. Keep AdicSpacesPartIII §R3.8 only for what it adds beyond them, or drop the row.

## R09 (P3) — `ν : X_proet → X_et` is cited from SchemeAndStackFoundations §2.10, which supplies it only at an open revision; the sentence is garbled

**Location.** README line 1405: "Using the comparison `ν:X_proet→X_et` of SchemeAndStackFoundations §2.10 with the pro-étale structure of §2.17, construct and finite-torsion comparison." Also line 1439 and line 19.

**Claim.** On main, SchemeAndStackFoundations §2.10 defines only the fppf→étale, étale→Nisnevich and Nisnevich→Zariski comparisons, and §2.17 has no `ν` either. Only the open SchemeAndStackFoundations revision at #1656 adds `Scheme.toProEt` and `ν^* ⊣ ν_*` to §2.10. Yet the PR description says this PR "depends on no open roadmap PR". In addition, "construct and finite-torsion comparison" is missing its object.

**Witness.** SchemeAndStackFoundations README on main, lines 3631–3656 (§2.10): `epsilonFppfEtale`, `aX`, `etaleToNisnevich`, `nisnevichToZariski`. At #1656 head, its README line 470: "§2.10 / `Scheme.toProEt`, `Scheme.proetalePushforward` | `ν^* ⊣ ν_*`…".

**Repair.** Name that SchemeAndStackFoundations revision in the PR description's merge-order paragraph as a revision this PR must merge after. Alternatively, cite main's §2.17 and state the construction of `ν` here as a target. Rewrite the sentence, for example: "…construct `K_pro` and the finite-torsion comparison `ν^*`".

## R10 (P3) — Dropped ids that another roadmap cites, with no old → new lines

**Location.** On main, README lines 919 and 923 define `VanishingCycles.numberOfRationalPoints` and `VanishingCycles.numberOfRationalPoints_pullback`, and `Suggested.lean` declares `GaloisLattice.IntegralModel.nonempty_iso_genericFibre`. This pull request drops all three.

**Claim.** WeilConjectures (open, #1208) consumes `VanishingCycles.numberOfRationalPoints` from §F.10.1, so that citation breaks when this pull request merges.

**Witness.** WeilConjectures README line 114 at its head: "EtaleCohomologyFoundations §§`F`.10.1–`F`.10.2b | `VanishingCycles.frobeniusFixedPoints`, `VanishingCycles.numberOfRationalPoints`, …".

**Repair.** Add old → new lines to the README:
- `VanishingCycles.numberOfRationalPoints` → Tau Ceti `Scheme.Hom.numberOfRationalPoints` / `Scheme.Hom.pointCount`;
- `…_pullback` → `Scheme.Hom.numberOfRationalPoints_pullback`;
- `nonempty_iso_genericFibre` → `TauCeti.GaloisLattice.IntegralModel.genericFiberIso`.

## R11 (P3) — Scope defers to a roadmap that does not exist (FourierDeligneTransform)

**Location.** README line 11: "Kernel transforms, the Artin–Schreier and Kummer sheaves and the Fourier–Deligne transform belong to FourierDeligneTransform"; also lines 13 and 421–422.

**Claim.** No roadmap of that name exists on main, among the open roadmap pull requests, or on the board, so these objects have no owner.

**Witness.** `roadmaps grep --fixed FourierDeligneTransform` matches only this README, at lines 11, 13 and 421.

**Repair.** Name an existing owner by section, or own the Artin–Schreier and Kummer sheaves here as a target: they are the Lang-torsor case of §F.0.3's rank-one construction. Otherwise drop the sentence and the consumer-list entry.

## R12 (P3) — Several statements are narrower than their sources or than the README itself

**Location and claim.**
- **§0.8 (line 857).** "for a separated finitely presented `f:X→S` between qcqs schemes, compactifiable … define `Rf_!` once". Stacks 0F7H/0F7I use only separated finite type over a qcqs base, and the README itself states §F.2.7 (line 1062) and §F.5 (lines 1693–1694) for every compactifiable `f`.
- **§F.2.6 (lines 948–950).** The ordinary Künneth formula requires `K,L∈Dᵇ_ctf`, but Stacks Lemma 59.97.9 holds for every `E ∈ D(X_et, ℤ/n)` and `K ∈ D(Y_et, ℤ/n)`.
- **§§F.4.1/F.4.3 (lines 1358–1360, 1434–1437).** `(Λ, I)` is not assumed complete, while BS §6.5 fixes `R` complete for the `m`-adic topology. The invertibility hypothesis is also placed in the definition of `AdicSystem`, against the convention at line 25.

**Witness.** `stacks-0F7H` line 1650: `f` "finite type separated … with `Y` quasi-compact and quasi-separated". `stacks-0F1P` lines 9935–9938: arbitrary `E`, `K`, coefficients `ℤ/nℤ`. `bhatt-scholze-proetale` lines 2294–2295: "a noetherian ring `R` complete for the topology defined by an ideal".

**Repair.**
- §0.8: write "separated finite-type", or simply "compactifiable".
- §F.2.6: state Künneth for all `K ∈ D(X,Λ)` and `L ∈ D(Y,Λ)`, with finite `Λ` killed by an invertible `n`, and keep `Dᵇ_ctf` only for the perfectness clauses.
- §§F.4.1/F.4.3: state the comparison with `D_cons(X_proet, Λ̂)`, where `Λ̂ = lim Λ/Iⁿ`, and move `IsInvertibleOn` to the theorems.

## R13 (P3) — Two locators do not support their claims

**Location and claim.**
- **§F.0.A1 (lines 498–500).** "SGA 1 … Exposé X, Lemma 3.6, pp. 214–215" is Abhyankar's lemma: tamely ramified composita become unramified. It supports none of §F.0.A1's claims, such as `|I_y| = e` under a separable residue extension or the orbit counts.
- **§F.4.6 (line 1556).** "(Bhatt–Scholze §§5–6.)" is given for constructing the continuous `G_k`-action on geometric cohomology. Those sections state nothing about Galois actions.

**Witness.** `sga1` line 8468: "Lemme 3.6 (Lemme d'ABHYANKAR)". `stacks-09ED` lines 15570–15577: `|D| = ef = |I|·|Aut(κ(m)/κ)|`, which is the actual input for `|I| = e`. The section titles of BS §§5–6 (`bhatt-scholze-proetale` lines 1580–2757) cover pullback, pushforward, constructible complexes and the six functors.

**Repair.**
- §F.0.A1: replace the SGA 1 X 3.6 locator by Stacks, More on Algebra, Lemmas 15.114.1–15.114.4 (09EA–09ED) and the proof of Lemma 15.114.5 (09EE).
- §F.4.6: add a source that states the continuity and functoriality of the Galois action. Keep BS §§5–6 only for passing operations through realization.

## R14 (P3) — The supplier table cites inconsistent pins and a Mathlib pull request

**Location.** README line 46 ("Mathlib, pinned at `6b7abb3c…`"), line 47 (Tau Ceti `9b58aa7`), line 48 ("Tau Ceti, pinned at `a91d3aa…`"), and line 1219 (a Mathlib link at `6b7abb3`, "Adopt … as it develops, including Mathlib #44365").

**Claim.** The lake-manifest pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, which line 49 itself states. The other three rows cite stale pins. Line 1219 also waits on a Mathlib pull request and cites it by number.

**Witness.** `lake-manifest.json`: `TauCeti 2fd255d997f4…`, `mathlib 1b1ccf4b088b…`.

**Repair.** Merge the four pin rows into one row at the manifest pins, link Mathlib files at `1b1ccf4`, and delete the "Mathlib #44365" clause.

## R15 (P3) — The README departs from the house shape

**Location.** README line 1 ("# Étale cohomology foundations") and line 13 (the consumer list inside Scope). There is no `## How to read the build` and no `## Downstream consumers`.

**Claim.** The house shape needs `# Roadmap: <lower-case title>`, a build-order paragraph and a downstream-consumers section. The README's lines 33 and 37–42 partly do that job, scattered across Conventions and the supplier preamble.

**Witness.** `grep '^## '` on the README lists Scope, Conventions, Exact supplier contracts, the § sections and References only.

**Repair.** Retitle the README "# Roadmap: étale cohomology foundations". Add `## How to read the build` (move lines 33 and 37–42 there) and `## Downstream consumers` (move line 13 there). Keep every section label unchanged, since other roadmaps cite them.

## Verified sound

**Gate and dependency check.**
- The gate was re-run at this head: every check passes except `sorry-data=9` (R01). The worker's run reports `build=0`, and a scratch copy of `Suggested.lean` elaborates with `sorry` as the only warning.
- Dependency check output: `depcheck: 245 roadmaps, 2470 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. EtaleCohomologyFoundations is line 57 of the merge order, and every supplier it names is on main.

**Elaborated signatures (all 46 declarations).** The worker's `#check @name` dump was compared with the README. The five flagged binder losses are:
- `[IsTopologicalGroup Γ]` dropped from `ContinuousRep.Iso`, `ofCharacter`, `baseChange` and `toContinuousRep`;
- `[IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O E]` dropped from `IntegralModel.smul`.

None of these binders is needed by the declaration's type or body, so nothing changes, and R03 deletes all five in any case.

**Cross-roadmap citations resolved on main.**
- SchemeAndStackFoundations §§0.3, 0.8, 0.9, 0.12–0.14, 0.21, 0.23, 0.23a, 0.29, Layer 1, 2.1, 2.2, 2.5, 2.7, 2.9–2.11, 2.15–2.17, 4.11 and 5.3–5.5 exist. The names `SchemeFrobenius.absoluteFrobenius`, `…schemeFrobeniusTwist`, `…relativeFrobenius`, `…iteratedSchemeFrobenius`, `…qPowerFrobenius`, `universalHomeomorphismEtaleEquivalence`, `Sheaf.H.pullback`, `muEtale`, `relativeProj`, `normalBundle`, `deformationToNormalCone` and `projectiveBundle_dual_convention` all occur there. The exception is `ν`, which §2.10 lacks (R09).
- EnhancedDerivedSheaves §§0.1–0.4 and all six `ClassicalDerived.*` names; DerivedModuleAlgebra §§0.I.1, 0.2, 1.T.1, 1.1–1.5 and 1.E.0; AdicSpacesPartIII R3.8; PadicMeasuresIwasawaAlgebras §5.1 `projectiveDeterminant`.
- DGAInfinity "Layer 5"; StableReduction "Layer 4"; ModularCurves 0D and 4D, with `isNoetherianRing_algebra_iff` and `maximalIdeal_eq_map`; AlgebraicCurves Layers 8 and 12; BelyiMaps 12.5–12.6; GrothendieckEulerForms Layers 2 and 5; PerfectoidSpaces P5.10 and P7.15; ProfiniteArithmetic (Completed).
- That is 13 supplier roadmaps resolved. The citations tool found no cross-roadmap citation that resolves nowhere.

**Library declarations opened at the pins.**
- *Mathlib* (`#check` in a scratch file): `Scheme.pointSmallEtale`, `Scheme.isConservative_pointSmallEtale`, `GrothendieckTopology.Point.{sheafFiber, comap, sheafFiberComapIso}`, `HasEnoughPoints`, `Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (`AlgebraicGeometry/Sites/AffineEtale.lean:149`), `Scheme.AffineEtale.sheafEquiv`, `MorphismProperty.Over.{map, pullback}`, `Functor.sheafPullback`, `Functor.IsDenseSubsite.sheafEquiv`, `Sheaf.H` (`CategoryTheory/Sites/SheafCohomology/Basic.lean:57`), `Sheaf.IsConstant`, `Topology.IsConstructible`, `ObjectProperty.{IsSerreClass, isoModSerre, IsTriangulated, HasInducedTStructure}`, `DerivedCategory.TStructure.t`, `Triangulated.TStructure.bounded` (`TStructure/Basic.lean:262`), `ShiftedHom`, `Pseudofunctor`, `Bicategory.Adj`, `Scheme.Modules.pseudofunctor`, `TwoSquare`, `mateEquiv`, `PreGaloisCategory.{functorToContAction, IsFundamentalGroup}`, `AlgHom.IsArithFrobAt`, `MonoidHom.eqLocus`, `zpowersHom`, `Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology` (`AlgebraicGeometry/Sites/ElladicCohomology.lean:64,76`), `PadicAlgCl`, `ModObj`, `IsSchemeTheoreticallyDominant.of_isPullback`, `Ideal.Quotient.stabilizerHom_surjective`, `Ideal.card_inertia_eq_ramificationIdxIn`, `ValuationSubring.inertiaSubgroup`, `IsNonarchimedeanLocalField.isCompact_closedBall`, `Submodule.IsLattice`, `FiniteField.coe_frobeniusAlgEquivOfAlgebraic_iterate`, `IsProper.comp_iff` (`Morphisms/Proper.lean:126`), `LinearMap.trace_comp_comm'` (`LinearAlgebra/Trace.lean:265`).
- *Tau Ceti* (by file and line): `FiniteEtaleScheme.fiber`, `galContinuousMulEquivAutFiber`, `Scheme.Hom.numberOfRationalPoints` (`RationalPoint/Count.lean:43`) and `_pullback` (`:58`), `AlgEquiv.fromSpecFixedFieldEquiv` (`RationalPoint/FixedField.lean:212`), `numberOfRationalPoints_fixedField_eq_natCard` (`:256`), `CategoryTheory.Sheaf.Torsor` and `NonabelianH1` (`Sites/NonabelianCohomology/Torsor.lean:61`), `TauCeti.genericFiber` and `specialFiber` (`AlgebraicGeometry/Fibers.lean:43,55`), `TauCeti.Place.{stabilizer_eq_decompositionSubgroup, decompositionQuotientInertiaEquiv, card_inertiaSubgroup}`, `TauCeti.inertiaSubgroup` (`LocalField/Unramified/Inertia/Basic.lean:112`), `inertiaTameCharacter` (`Tame/Character.lean:401`), `inertiaPadicTameCharacter`, `Representation.baseChange`, plus the compactification, `ContinuousRep`/`IntegralModel` and trace files cited in R02, R03 and R08.

**Sampled sources.** These locators were checked against the text and found correct:
- **Compactification objects:** Stacks §38.32 (0ATT: quasi-compact open immersion into a proper `X̄`, density not assumed, `stacks-0F41` lines 4322–4341), Lemma 38.32.1 (0ATU), Theorem 38.33.8 (0F41: qcqs `S`, separated finite type, lines 4710–4715), and the reduction via Limits 32.9.6, 32.5.4, 32.10.1 and 32.8.6 (lines 4716–4727).
- **Scheme Frobenius:** §33.36 Frobenii, Definitions 33.36.1 and 33.36.4, Lemmas 33.36.2–33.36.6, Remark 33.36.11 (`stacks-03SM` lines 3181–3319).
- **Finite Tate twists:** the Kummer input 03PL is Lemma 59.28.1 (`stacks-03PL` line 1410).
- **Constructible derived continuity:** 09YQ is Theorem 59.51.3 (line 3458), and §59.73 is "More on constructible sheaves".
- **Mayer–Vietoris:** §59.46 closed immersions, §59.79 supports, 04DZ = Theorem 59.45.2 (line 3033).
- **Extension by zero:** Definition 59.70.1 and Lemma 59.70.5 (03S6) at lines 5235–5312.
- **Künneth:** Lemmas 59.97.6–59.97.9 (0F1I, 0F1J, 0F1N, 0F1P) and 0F12 = Lemma 59.96.5, used in the proof of 0F1P (lines 9514–9941). See R12 for generality.
- **Henselian traits:** 09ED and 09EE, Definition 0BU4, Lemma 0BU5 and Remark 0BU8 (`stacks-09ED` lines 15538–15775). SGA 7 II, Exposé XIII 0.2.5, printed p. 5 (`ias-number12` line 2551), and Rappel 1.1.3, printed pp. 6–7 (lines 2589–2601). Illusie 2006 §1.1, pp. 1–2 (`illusie-2006` lines 9–57).
- **Decomposition and inertia:** SGA 1 V §2, pp. 92–96 (`sga1` lines 3788–3979). Note that SGA 1 identifies the stabiliser of a geometric point with inertia without any separability hypothesis (line 3807); the README's added hypothesis is harmless. SGA 1 IX 6.1 and 6.4, pp. 195–196 (lines 7733–7817).
- **Rational realization:** BS Definition 6.8.3, Proposition 6.8.4(4)–(6), Lemma 6.8.13, Proposition 6.8.14 and Lemma 7.4.10 (`bhatt-scholze-proetale` lines 2778–2923, 3346).
- **Regular-immersion classes:** LRZ Proposition 3.2.5 (pp. 24–25), Definition 3.3.2 (p. 25) and Lemma 3.4.1 (pp. 27–28) (`lrz-relative-poincare` lines 1277–1498).
- **Lower shriek:** Stacks 0F7H–0F7L, 0G2A, 0G2C, 0GL5 and 0GLE exist as cited (`stacks-0F7H` lines 1650–2201).

**Ownership against open pull requests.** Checked by object with `roadmaps grep`/`roadmaps show`:
- point counts and zeta (R05);
- `ContinuousRep`/`IntegralModel` consumers (R03);
- the compactification-name consumers (R02);
- Artin–Schreier sheaves and Fourier–Deligne (R11);
- the pro-étale `ν` (R09);
- AdicCoefficientsAndComparisons' scope: v-stack adic coefficients, which cite this roadmap and are not a second owner.

The other closest roadmaps (EtaleDualityAndPerverseSheaves, ClassicalAdicEtaleCohomology, LefschetzPencilsAndVanishingCycles) were not read in full.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `nagataCompactification` | `A¹_k → Spec k`; doubled-origin line; `S = ⊔_ℕ Spec k` | `P¹` exists / instance needed; not separated ⇒ excluded by `[IsSeparated f]`; `S` not compact ⇒ excluded, as Stacks requires qcqs | true, matches 0F41 | R01, R02 (theorem on Tau Ceti carrier) |
| `compactificationCommonRefinement`, `…_cofiltered` | `C₁ = C₂ = (A¹⊂P¹)` | closure of the diagonal image in `P¹×_k P¹` ≅ `P¹`, dense / maps to both | true | R02, R06 |
| `denseCompactification_hom_unique` | dense `P¹` into `P¹ ⊔ P¹`; non-dense source `P¹ ⊔ pt` | dense: maps land in the first copy, so 1 map; non-dense: 2 maps differing on `pt` | true; density needed | R02 |
| `Compactification.Hom.proper` | `C.p = h ≫ D.p`, `D.p` separated | closes by `IsProper.comp_iff` | true, one term | R06 |
| `Scheme.isInvertibleOn_iff_ne_zero` | `k = 𝔽₂`, `ℓ = 2, 3, 0`; `X = ∅` | `ℓ=2`: not a unit / `2=0` (false/false); `ℓ=3`: true/true; `ℓ=0`: false/false; `X=∅`: true / false, so `[Nonempty X]` is needed | true | R06 |
| `exists_stable_lattice_iff` | `n=1`, `E=ℚ_ℓ`: `K=⟨ℓ⟩`, `K=ℤ_ℓ^×`; `n=0` | `⟨ℓ⟩`: closure not compact / no lattice (`ℓ·ℓᵃℤ_ℓ ≠ ℓᵃℤ_ℓ`); `ℤ_ℓ^×`: compact / `ℤ_ℓ` stable; `n=0`: true / `L=0` | true | R03 (in Tau Ceti) |
| `IntegralModel.nonempty` | `O` compact open DVR in `E`, `Γ` compact | `πⁿO` open compact, closure of `{0}` ⊂ ∩`πⁿO` = 0, so `E` is a local field; lattice exists | true | R03 |
| `IntegralModel.exists_pow_le` | `Λ=ℤ_ℓ`, `Λ'=ℓ³ℤ_ℓ` | `a=3`: `ℓ³ℤ_ℓ ⊆ Λ'`, `ℓ⁶ℤ_ℓ ⊆ Λ`; `a=2` fails the first inclusion | true | R03 (identical in Tau Ceti) |
| `frobeniusFixedField_card` | `k=𝔽₂`, `r=2`; `r=0` | `#𝔽₄ = 4 = 2²`; `r=0`: fixed field is `𝔽̄₂`, `Nat.card = 0 ≠ 1`, so `hr` is needed | true | R06 |
| `rationalPoints_finite` | `A¹_{𝔽₂}`, `L=𝔽₄`; `⊔_ℕ Spec 𝔽₂` | 4 points; infinitely many without `QuasiCompact` | true; hypothesis needed | none |
| `pointCount`, `…_eq_numberOfRationalPoints` | `A¹_{𝔽_q}`, `r=2`; `Spec 𝔽_{q²}`, `r=1,2`; `E` a second model of `𝔽_{q²}` | `q²`; `0`, `2` (as in the README Check); `E ≅_k` splitting field ⇒ equal counts | true | R05 (ownership) |
| `frobeniusFixedPoints` | `X = Spec 𝔽_{q²}`, `L = 𝔽̄_q`, `r = 1, 2`; `X = A^∞` | 2 embeddings swapped by Frobenius: fixed 0 = `pointCount 1`, fixed 2 = `pointCount 2`; infinite sets give `Nat.card` 0 on both sides | true | none |
| `projectiveTraceOfRetract_eq_contract`, `…_independent` | `R=ℤ`, `P=ℤ`, `i=(id,0)`, `r=pr₁`, `u=5` | `tr [[5,0],[0,0]] = 5` / contraction 5 | true | R06, R08 |
| `MonoidHom.weilGroup` | `G=Γ=Ẑ`, `π=id`, `Φ` = geometric Frobenius | `{(Φⁿ,n)} ≅ ℤ`, generated by `(Φ,1)`; the subspace topology is discrete in `n` with profinite fibres | true | R07 (unused) |
| `EtaleFundamentalGroup` | `S = Spec K`, `Ω = K^sep` | `Aut(fiber x) ≃ₜ* Gal(Ω/K)` (Tau Ceti `galContinuousMulEquivAutFiber`) | true | R07 |
| Probe headlines (R04) | elaboration at the pins | 4/4 elaborate with `import Mathlib`; truth: SGA 4 X/XIV, Th. finitude; the ℓ-adic case via `RΓ(X_proet, ℤ_ℓ) = R lim RΓ(X, ℤ/ℓⁿ)` with finite groups, so `lim¹ = 0` | statable | R04 |
| Tate twists (§F.0.3) | `Λ=ℤ/12`, `N=24`; `Λ=ℤ/p` on `Spec 𝔽_p` | `μ₂₄/μ₂₄^{12} ≅ μ₁₂` via `x ↦ x²`, valid when 6 is invertible; `μ_p(𝔽̄_p) = {1}`, so `Λ(1) = 0` | true | none |
| Scheme Frobenius Checks | absolute Frobenius on `Spec 𝔽_{p²}` | `x ↦ xᵖ` is not `𝔽_{p²}`-linear; its square is `x^{p²} = id` | true | none |
| Decomposition/inertia (§F.0.A1) | `z ↦ z⁶` over `ℂ` at 0; README `𝔽₂(u)[[t]]`, `α²−tα−u` | `e = 6`, `I = μ₆`; `e = 1`, `f = 2` inseparable, `ef = |I|·|Aut| = |I|·1` ⇒ `|I| = 2 ≠ e` | true; separability essential | R13 (locator) |
| Constructible derived continuity (§0.6) | `X = lim Xᵢ`, a complex in `[a,b]` | finitely many attaching maps descend (09YQ for each Ext); an infinite sequence has no common stage | true | none |
| Mayer–Vietoris (§0.7) | `P¹ = U ∪ V`, `K = Λ` | `H¹(U∩V) = Λ(−1)` maps onto `H²(P¹) = Λ(−1)`; swapping `U`, `V` changes the sign | true | none |
| Extension by zero (§0.7) | `h: Spec ℂ → Spec ℝ`; `Z = ∅` | `h_!Λ = h_*Λ = Λ[C₂]`, rank 2; `F → F → 0` | true | none |
| Künneth (§F.2.6) | `X = Y = A¹_k`; unbounded `E` on a point | `Λ⊗Λ = Λ = RΓ(A²)`; Stacks 0F1P allows any `E, K` | true, but narrower than the source | R12 |
| Henselian traits (§F.3a) | `R = ℤ_p^{sh}`; henselization of `𝔽_p(x)[t]` | `Gal(s̄/s) = 1` ⇒ `I = Gal(η̄/η)`; `k(s̄) = 𝔽_p(x)^{alg} ⊋ 𝔽_p(x)^{sep}`, inseparable, as in SGA 7 0.2.5 | true | none |
| Tame character (§F.3a) | `R′ = R[π^{1/2}]`, `p ≠ 2` | `π^{1/ℓⁿ} = (π′^{1/ℓⁿ})²`, so `t_ℓ|_{I′} = 2·t′_ℓ`; level `n`: `θ` = Kummer ratio (09EE proof) | true | none |
| Pro-étale comparison (§F.4.3) | `Spec 𝔽̄_p`, `Kₙ = ℤ/ℓⁿ` | `K_pro = ℤ_ℓ`, `Rν_* K_pro = ℤ_ℓ = R lim Kₙ` | true | R09 |
| Rational realization (§F.4.5) | nodal `P¹/(0∼∞)`, loop multiplier `ℓ`; normal `X` | no `ℓᵃℤ_ℓ` is stable (`ℓ·ℓᵃℤ_ℓ = ℓ^{a+1}ℤ_ℓ`); BS 7.4.10 gives `π₁^{proét} = π₁` | true | none |
| Continuous actions (§F.4.6) | `Spec 𝔽_q`, `ℚ_ℓ(1)` | geometric Frobenius acts by `q⁻¹` | true | R13 (locator) |
| Normalized classes (§0.9) | `P¹`, `c₁(O(1))`; `r = 0, 1` | trace `+1`; `r=0`: empty sum, empty `P(E)`; `r=1`: one summand `i = 0` | true | none |
| Regular-immersion classes (§0.9) | `Z = V(y²−x³, t) ⊂ A³` | `(y²−x³, t)` is a regular sequence of codim 2, so `H⁴_Z(Λ(2))`; LRZ Def 3.3.2 constant term `c_c` | true | none |
| Smooth-boundary purity (§0.10) | `r = 0, 1, 2`, `F = Λ²` for `r = 1` | `r=0`: `F_x` in degree 0; `r=1`: rank 2 in degrees 0, 1; `r=2`: ranks 1, 2, 1 | true | none |
| Frobenius convention (§F.0.A2) | `𝔽₂`, `μ₅` | arithmetic: `ζ ↦ ζ²`; geometric: `ζ ↦ ζ³` (`2·3 ≡ 1 mod 5`) | true | none |
| Perverse aisles (§F.8) | `Λ[1]` on a curve; `i_*Λ[1]` for a line in `A²` | generic costalk `H⁻¹ ≠ 0` allowed (`m < −1` vanish); closed costalk `Λ(−1)[−1]`, `H¹` allowed (`m < 0` vanish); `i_*Λ[1]` passes both conditions | true | none |
| `Rf_!` domain (§0.8) | separated finite-type, not finitely presented `f` over a non-noetherian qcqs `S` | Stacks 0F7H defines it / README excludes it, while §F.2.7 and §F.5 include it | inconsistent | R12 |

## Not verifiable

- **SGA 4** (Exposés VI, VIII, IX, XII, XIV–XVIII), **SGA 4½** ([Cycle], [Th. finitude], [Rapport], [Sommes trig.]) and **SGA 5**. The sources service found no legal copy (Springer paywall for DOI 10.1007), and the IAS publications index returned HTTP 403. The SGA 4/4½ parts of the "Finite Tate twists", "Normalized algebraic classes" and "Smooth-boundary purity" samples are therefore unchecked. For smooth-boundary purity no accessible source was checked at all; the formula was checked mathematically (table).
- **Huber (1996)**, Proposition 2.4.4, Corollary 2.4.6 and Theorem 3.9.1: paywalled book, cited by locator only.
- **Fujiwara (2002)**, §1.1, Lemma 1.1.1 and Definition 1.1.2: the Project Euclid landing page has no PDF link. LRZ (read) says the proof of Fujiwara's Lemma 1.1.1 applies to its Proposition 3.2.5 (`lrz-relative-poincare` line 1298).
- **Bhatt–Scholze:** read as arXiv 1309.1198v2. Its numbering was not compared against the Astérisque 369 print that the README cites.
- **Not sampled and not fetched:** Stacks 09BT (pro-étale chapter), Milne's *Abelian Varieties* §15, BBD, ILO, Juteau, DDT, Ribet and BHKT.

## Source issues

- none
