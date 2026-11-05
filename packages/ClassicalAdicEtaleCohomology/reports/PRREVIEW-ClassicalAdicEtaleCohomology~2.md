# Review of ClassicalAdicEtaleCohomology (pull request #875 at d99fe53)

**Verdict:** accepted

This is a full re-review of the repaired head (1261 changed lines since dfcb6b7). The previous review's four findings are checked first, then the whole roadmap. No P1 or P2 finding survived; the six findings below are P3 notes the author may take or leave.

**Previous findings.**

- R01 (dependency gate) — repaired. The worker's gate reports `depcheck=0`, and the dependency command run for this review returns `depcheck: 201 roadmaps, 1321 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:40` now reads "Their foundations are therefore independent of tropical geometry" and `TropicalAndBerkovichArithmetic` appears only under *Downstream consumers* (line 5772); the four `AlgebraicCurves` citations (4047, 4080, 4155, 4492) name "layer 12", which exists on main.
- R02 (empty bounded-lattice join) — repaired. README 1506: "for `k≥1` this is the ordinary sum of the lattices; the empty join is the bottom section `pᵐT`", with the negative-control Check at 1530 (`m=0`: empty join `ℤ_p`, ambient sum `0∉L_0(T)`; `m=1`: `pℤ_p`, and the join of `pℤ_p`, `p⁻¹ℤ_p` is `p⁻¹ℤ_p`). Recomputed below.
- R03 (statable finite-condition transfer) — repaired. `Suggested.lean:88` declares `aic_valuation_finite_conditions_transfer` with the three finite families, the order-preserving-and-reflecting embedding and both nontriviality instances; README 4520 states it with the same hypotheses and the Checks of 4524–4526.
- R04 (API catalogues, table, layer comments) — repaired in substance, partly in letter: the supplier table (21–38) renders; the "Provide …; …" catalogues are prose "Supporting statements" bullets; the line-87 exception is gone; `Suggested.lean` carries Layer 2, 9 and 11 section comments. What remains is R01 below.

## R01 (P3) — Own Lean-style identifiers are still backticked without a declaration

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3405` “Define `IsSurjectiveValuationMap φ` for a ring homomorphism”; likewise 745 (`Huber.IsHenselian A`), 1416 (`PreadicSpace.ZpLocalSystem(X)`), 1868 (`FormalScheme.SmallEtale X`), 2551 (`filtrationCutoff p e`), 3054 (`OrientedEtaleProduct`), 3164 (`Trait.variation σ`), 4721 (`AnalyticLCICycleClass i`), 5256 (`closedDisc(A⁺,T,b)`), 180 (`EtaleDPlus X Λ`), and the Check at 1258 (“IsTaut `T ↔ ∀ A ⊆ T`, IsCompact …”).

**Claim:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; a Check never names a Lean counterpart.

**Witness:** `Suggested.lean` declares exactly five names (`ValuationSpectrum.zariskiRiemannLocus`, `ValuationSpectrum.zariskiRiemann_cohomology_eq_zero`, `aic_valuation_finite_conditions_transfer`, `aic_valuation_section_lift`, `field_cohomological_dimension_transcendence`); none of the identifiers above is among them. The gate's `readme-ids-missing` scanner does not catch these forms.

**Repair:** name these targets in prose (“the closed-disc locus of radius `b`”, “surjective map of valuation spectra”, “the oriented étale product”, “the filtration cutoff ⌈pe/(p−1)⌉”), or keep mathematical notation without Lean identifiers; rewrite the 1258 Check in words. Applied to 3405 the sentence becomes “Call a ring homomorphism `φ : A → B` a surjective map of valuation spectra when `Spec B → Spec A` is surjective”. This is the unfinished half of the previous review's R04.

## R02 (P3) — Five works cited in the body have no References entry

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3403` “Hiroki Kato, Étale cohomology of algebraizable rigid analytic varieties via nearby cycles over general bases” (also 3493, 3541, 3572, 3582); 1614 “Achinger–Lara–Youcis, *Variants of the de Jong fundamental group*”; 1122 “Bhatt–Mathew Corollary 6.18 … Theorem 6.11”; 1749 “Berkovich (1990), §3.1 … Proposition 3.1.7, p. 51”; 4520 “A. Prestel, Einführung in die mathematische Logik und Modelltheorie, Vieweg 1986, 4.17” (also the docstring of `aic_valuation_finite_conditions_transfer`).

**Claim:** every cited work is recorded in the References and manifest.

**Witness:** the References list (5774–5827) has no entry for any of the five; the Kato paper is readable at arXiv 2011.09880v2 (Definition 3.4 and the microbial remark on its p. 14, Constructions 4.2–4.3 on p. 17, as cited), and the Achinger–Lara–Youcis construction is at arXiv 2203.11750v1 (Construction 2.1.3, Proposition 2.1.4 on p. 5).

**Repair:** add the five entries with their legal locations (arXiv ids for Kato, Achinger–Lara–Youcis and Bhatt–Mathew; the AMS Surveys volume for Berkovich 1990 and the Vieweg book for Prestel, both cited by locator alone), and record them in `sources.toml`.

## R03 (P3) — Two pairs of targets state the same theorem with different coefficient hypotheses

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4247` “`n` invertible in `C⁺`: the `p`-torsion analogue is not asserted” versus 4375 “does not require `n` to be a unit in `C⁺`” (both: proper `X → Spa(C,C⁺)`, a sheaf vanishing on the pseudo-adic closed fibre has `RΓ(X,F)=0`); and 4257 (`j_! Rg_* → Rf_* j'_!` for `n` invertible in `O_Y⁺`) versus 4385 (the same for every `n>0`).

**Claim:** a reader cannot tell which hypothesis the roadmap asserts; the weaker statements are subsumed by the stronger.

**Witness:** Zavyalov, *Some foundational results*, Proposition 9.3(1) (source lines 1110–1118, p. 26) is stated for `D(X'_ét; ℤ/nℤ)` with no invertibility; its proof uses Lemma 9.2 and Huber Prop. 4.4.3, and footnote 6 (line 1182) is the pseudo-adic-fibre remark the roadmap quotes. The invertibility hypothesis enters only Lemma 9.1(3) (lines 972–980).

**Repair:** keep 4375 and 4385, and either delete 4247 and 4257 or rewrite them as the explicit corollaries used later (naming the stronger target), removing the sentence “the `p`-torsion analogue is not asserted”.

## R04 (P3) — Two supplier declaration names are not where they are cited

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:37` “`LefschetzPencilsAndVanishingCycles`, §0.8a (`VanishingCycles.nearbyBettiCompatibility`)” (also 2434, 2438); 5613 “`AlgebraicModuliForArithmeticGeometry`, Layer 9, Section 9.7 (`relativeEmbeddedResolution`)” (also 5766).

**Claim:** cited supplier declarations exist where cited.

**Witness:** at its open head, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md` has §0.8a “Nearby-cycle and Betti comparison” with the target “Nearby-cycle and inertia comparison”, but the string `nearbyBettiCompatibility` occurs nowhere in that roadmap. `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` §9.7 opens with “Consume ResolutionOfSingularitiesCharacteristicZero §5.6's `relativeEmbeddedResolution`”: the declaration is owned by `ResolutionOfSingularitiesCharacteristicZero`, which is earlier in the merge order.

**Repair:** cite LPV §0.8a's target by its prose title, and cite `ResolutionOfSingularitiesCharacteristicZero`, §5.6, for `relativeEmbeddedResolution` (keeping AMAG §9.7 for the boundary variant if it is used). While there, the two citations written as “Tau Ceti TauCetiRoadmap/AdicSpaces#layer-1-…” (3686) and “Tau Ceti TauCetiRoadmap/JacobianChallenge#layer-b-…” (4112) are roadmap citations, not Tau Ceti declarations; write them as “`AdicSpaces`, Layer 1” (the roadmap is under `Completed/`) and “`JacobianChallenge`, Layer B”.

## R05 (P3) — Locator slip in the Huber 1993 citation

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:1026` “Étale cohomology of henselian rings and cohomology of abstract Riemann surfaces of fields, Introduction, p. 704 (GDZ OCR)”.

**Claim:** the statement `A_i` (vanishing of `Hⁱ(Spec A/J, (t_*G)|)`) is on p. 704.

**Witness:** HuberHenselian1993 (OCR) lines 61–65 carry the statement `A_i` on scan page 2, whose running head is p. 703; `B_i` begins p. 704 (line 68).

**Repair:** “Introduction, pp. 703–704”.

## R06 (P3) — The tube–fibre comparison is stated beyond its cited sources

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2963` “Let `(X, S, η, s)` be a quadruple of finite type … Then for every `F ∈ D⁺(X_et, Λ)` the natural map `RΨ_L(F) → RΨ_L^geo(F)` … is a … isomorphism”, cited to Orgogozo Théorème 5.1, Remarque 4.4 and Illusie §2.1.

**Claim:** the cited sources support finite type and arbitrary `D⁺`.

**Witness:** Orgogozo 5.1 (source lines 682–693, p. 14) is for `f, F` “comme en 1.1” (finite presentation, bounded constructible) and is truncated in degree `≤ N`, the untruncated tube–fibre statement following from the fibre-dimension bound; Remarque 4.5 (lines 664–671) extends to finite type only when the base space is noetherian. The roadmap itself states the finite-presentation form at 3142 and the noetherian-base trick at 3473.

**Repair:** the statement is true, and the roadmap already contains the route: embed an affine finite-type `X` as a closed subscheme of a finitely presented `A^N_S` and use the proper-pushforward compatibility of 2931(b) to transfer the comparison from `i_*F`; say so in the proof sketch (or cite Huber 4.2.4 as 3084 does) rather than Orgogozo 5.1 alone. Checked on `X = Spec V[x]/(πx)` below: both sides are the stalk at the origin and agree.

## Verified sound

**Head, gate, build.** The worktree is at `d99fe53f9bca1a433a6be26ac80f9392e51f17bf`, clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassicalAdicEtaleCohomology'` is empty. The worker's gate passes every check (`depcheck=0 … build=0 OK`). `lake build TauCetiRoadmap.ClassicalAdicEtaleCohomology.Suggested` completes with exactly the four `declaration uses 'sorry'` warnings (lines 70, 88, 106, 117). A scratch copy with `#check @name` for all five declarations elaborates; the printed types keep every binder: `[IsSepClosed K]`, `IsAddTorsion G`, `0 < n` (Zariski–Riemann); `[IsAlgClosed K] [IsAlgClosed L]`, `[v.IsNontrivial] [w.IsNontrivial]`, the order hypothesis `hι` and the three `Finset`s (transfer); `[IsDomain V] [ValuationRing V] [IsAlgClosed (FractionRing V)] [Algebra.FiniteType V B] [Module.Flat V B]` (lift); `ℓ.Prime`, both `cohomologicalDimensionAt.{v}` and `Cardinal.toENat` (field bound). No `set_option`, no sorry'd data, no admitted `example`, imports are `import Mathlib` plus the two Tau Ceti modules named in the docstring.

**Dependency direction.** Output of the required command (`--movable`):

```text
depcheck: 201 roadmaps, 1321 edges, 0 problem(s)
```

**Padding probe.** Each sorried theorem was tried, on scratch copies elaborated with `lake env lean`, with `simp`, `rfl`, `infer_instance` and `aesop`: all sixteen attempts fail (`unsolved goals`, `rfl failed`, `type class instance expected`, `aesop … made no progress`). None of the four statements restates a definition, mirrors a Check or computes a value; the single `def` is required to state the Zariski–Riemann theorem.

**Headline inventory.** End theorems by layer: strict-local fibres and continuity (1); henselian comparison, Zariski–Riemann vanishing, perfectoid approximation (2); local lattices, analytic coverings, rational monodromy (3); completion and inertia-equivariant nearby-cycle comparison, perverse compatibility, Bloch–Kato–Hyodo (4); valuation nearby-cycle base change, constructibility, AIC generic extension (5–6); geometric-field invariance (7); compactifications, proper supports, base change, projection (8); traces and duality at every rank (9); radial cohomology and smooth families (10); purity, cohomological dimension, affine exhaustion, frontier duality (11). Of these, the four statable at the pins are stated; the module docstring names the missing carriers for the rest (analytic étale and pro-étale sites, pseudo-adic supports, formal étale sites, nearby-cycle objects, compactifications, `Rf_!`, Tate twists, analytification). I looked for further statable headlines: the henselian-pair lemma (735) and the surjective-valuation-map equivalences (3399) are statable on Tau Ceti and Mathlib carriers but are foundational lemmas, not headlines; the tame-quotient formula (2989) needs a maximal tame extension that neither pin has.

**Pinned declarations opened** (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`):

| Declaration | File at the pin | What it says |
|---|---|---|
| `TauCeti.ValuationSpectrum` | `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73` | a structure wrapping a `ValuativeRel A` (an equivalence class of valuations); for a field, points are the valuation subrings including the trivial one |
| `basicOpen`, `instTopologicalSpace` | same, lines 106, 146 | `{v ∣ v.vle f s ∧ ¬ v.vle s 0}`; topology generated by these. For a field and `s ≠ 0` this is `{a ∈ V}` with `a = f/s`, Huber's `D(a)`; `s = 0` gives `∅` |
| `ValuativeRel.vlt` | `Mathlib/RingTheory/Valuation/ValuativeRel/Basic.lean:110` | `¬ y ≤ᵥ x`, so `vlt b 1` is `b ∈ 𝔪_V` |
| `constantSheaf` | `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64` | sheafification of the constant presheaf |
| `Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | `Ext` from the constant sheaf `ℤ` |
| `Valuation.IsNontrivial` | `Mathlib/RingTheory/Valuation/Basic.lean:591` | some value is neither `0` nor `1` |
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K` |
| `Cardinal.toENat` | `Mathlib/SetTheory/Cardinal/ENat.lean:192` | infinite cardinals go to `⊤` |
| `TauCeti.CohomologicalDimensionLE`, `cohomologicalDimensionAt` | `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131, 146` | all discrete continuous `p`-primary torsion modules in universe `max u v`; least `ℕ∞` bound |
| `TauCeti.ValuationSpectrum.spa`, `rationalSubset`, `closedPolydisc`, `classicalPoint` | `Spa/Basic.lean:101`, `Spa/RationalSubset/Basic.lean:142`, `Spa/Polydisc/Basic.lean:72, 148` | the carriers named in §§10.1–10.2 and 11.2 |
| `Valuation.IsMicrobial`, `TauCeti.IsProP`, `IsProPSylow` | `TauCeti/RingTheory/Valuation/Microbial.lean`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`, `Sylow/Basic.lean:62` | the predicates named in §§4.5, 5.3, 6.1 |
| `HenselianRing.is_henselian` | `Mathlib/RingTheory/Henselian.lean:96` | the simple-root lifting field used at 66 |

**Cross-roadmap citations resolved.** Every `(`slug`)` citation of `AdicSpacesPartII` (56 slugs), `AdicSpacesPartIII` (32), `AdicSpacesPartIV` (3), `AdicEtaleGeometry` (56), `PerfectoidSpaces` (21) and `DiamondsAndVStacks` (4) was matched by string against the roadmap at its current head (`roadmaps show`): 0 missing. On main, `EtaleCohomologyFoundations` has §§0.5–0.11, F.0.2, F.0.A0, F.2.1, F.2.5, F.3a, F.4.0, F.5, F.6, F.8, G.1–G.3 and the names `properSupports`, `supportLocalization`, `localAcyclicity`, `properBaseChange`, `compactSupportCohomology`, `smoothTrace`, `etaleExceptionalInverseImage`, `lciCycleClass`, `cycleClasses`, `finitePresentationDescent`, `constructibleDerivedDescent`, `constructibleHomContinuity`, `exists_stable_lattice_iff`, `GaloisLattice.IntegralModel.nonempty`; `SchemeAndStackFoundations` has §§0.9, 0.12–0.14, 2.1, 2.2, 2.11, 2.15, 2.16, 4.14, 4.15; `DerivedModuleAlgebra` §§1.T.1, 1.1–1.5; `DiamondsAndVStacks` D0.19 and D1; `EnhancedDerivedSheaves` §§0.1–0.4, E0, E1, E4; `PadicMeasuresIwasawaAlgebras` §5.1 “Determinant lines of perfect complexes”; `CrystallineCohomology` CR.5.1 and CR.6.1 (with the targets *Logarithmic de Rham–Witt complexes* and *Log de Rham–Witt model*); `ArithmeticGaloisDuality` R02.2.1, R02.2.3; `ArithmeticGaloisRepresentations` §1.1 `ContinuousRep`; `LefschetzPencilsAndVanishingCycles` §§0.2–0.8, 0.8a, 2.7, 2.8, 6.2 and layers LPV.1–LPV.2; `EllipticCurves` Layer 4 (Tate-curve strand); `StableReduction` Layers 1–3; `ProfiniteCohomology` Layers 9 and 11; `JacobianChallenge` Layer B; `AlgebraicCurves` Layer 12; `AdicSpaces` (under `Completed/`). The citations tool's 28 leads were all supplier names living in those roadmaps rather than in the pinned libraries; the two that resolve nowhere are R04. No upward or cyclic edge; no second owner of the four Lean declarations was found by `roadmaps grep` across main and the open heads.

**Sources: seeded sample.** Pages are the printed pages of the cited edition, located from running heads in the cached texts (Berkovich 1993: file page + 3; de Jong 1995: file page + 87; Scholze ECD: the 14 April 2026 PDF, file page = printed page; Li–Reinecke–Zavyalov: running heads).

| Target | Text inspected | Outcome |
|---|---|---|
| 1.4 | Scholze pAdicHodge Definition 8.1 p. 48, Proposition 6.7 p. 37; Berkovich 1993 Prop. 4.1.7 p. 84, Prop. 4.1.8 and Cor. 4.1.9 p. 85, Prop. 4.1.10 p. 86, Def. 4.4.2 p. 94, Prop. 4.4.5 p. 95; ECD Definition 20.1, Remark 20.3, Lemma 20.4 p. 113; Bhatt–Hansen Warning 3.2 p. 14; Hansen Prop. 2.4 p. 6 | all locators exact; the lisse/constructible definitions, the Kummer sequence (`n` invertible) and the filtered-colimit statement match the sources |
| 2.1 | Huber 1993 Math. Z. Prop. 1 p. 457 (OCR; rings of definition are the open bounded subrings, with finitely generated ideals of definition); Huber 1994 Prop. 1.3 p. 517 (author copy: the universal henselian-free rational localisation); Wedhorn Lemma 7.45 p. 67, Props. 7.48 p. 68, 7.51 p. 69, 7.52 p. 70; Gabber–Ramero Remark 5.1.9 p. 104; Stacks 09XI/09XJ | locators exact; the Gabber test with uniqueness is Stacks 09XI(5) |
| 3.5 | de Jong 1995 Definition 2.1 p. 91, Lemma 2.2(i)–(iv) pp. 91–92, Lemma 2.3 pp. 92–93, Lemma 2.4 p. 93; Achinger–Lara–Youcis Construction 2.1.3, Proposition 2.1.4 p. 5 | definition (open `U` with `f⁻¹U` a disjoint union of finite étale pieces), separatedness, base change, image a union of components, representability and quotients all as stated; the Artin–Schreier non-example is ALY's Prop. 2.1.4 (`Y → X ∉ Cov^oc_X`) |
| 3.6 | de Jong Lemma 2.6 p. 93, Lemma 2.7 p. 94, Theorem 2.9 p. 95, Theorem 2.10(i)–(iv) pp. 95–96, Remark 2.11(i) p. 96 | prodiscreteness, path isomorphisms, full faithfulness with single-orbit essential image, profiniteness of `π₁^alg` and factorisation, dense images, and the two-`ℙ¹` example (`π₁^alg = ℤ̂`, image through `ℤ`) match |
| 4.6 | CDN §2.1.1 p. 22 (semistable or base change from a subfield; `M^gp(U) = O(U_K)^×`; `R^iΨ` as derived functors of Berkovich's `Θ`; the `U/V` filtration with `V⁰=(1+ϖO)ϖ^ℤ`, `Uᵐ=1+ϖᵐO`, `Vᵐ=U^{m+1}` for `q=1`), Theorem 2.4(1)–(4) p. 23, (2.5) p. 23, Remarque 2.6 p. 24, §2.1.2 p. 24; Berkovich 1994 Prop. 4.1 p. 548 (OCR); Bloch–Kato (1.2) p. 111, Theorem (1.4), Cor. (1.4.1) p. 112; Hyodo (1.3) pp. 545–546, Theorem (1.6) p. 547, Cor. (1.7) pp. 547–548, §3 from p. 554 (OCR) | exact; the `B`/`Z` denominators and the cutoff `pe/(p−1)` are those of Theorem 2.4(2)–(4) |
| 5.3 | Illusie §4.1(d) p. 8 (amplitude `≤ 2N` for `N` bounding fibre dimensions), Theorem 3.2 and Remarks 3.3(c) p. 7; Orgogozo Théorème 5.1 p. 14, Remarques 4.4–4.5 p. 13; Gabber–Ramero (6.2.9)–(6.2.10) p. 160, Prop. 6.2.12 p. 160, Def. 6.2.16, (6.2.17), (6.2.18) p. 162, Lemma 6.2.5 p. 159, Example 6.1.4 pp. 151–152, Lemma 6.1.9 p. 153; ECD proof of Prop. 21.16 p. 126 | the tame quotient `Gal(Kᵗ/K) ≅ Hom(Γ⊗ℤ_(p)/Γ, μ)`, kernel a `p`-group, and Gauss valuation facts match; the amplitude statement uses the generic-fibre dimension via the fibre comparison (see R06) |
| 5.6 | Hansen–Scholze Theorem 4.1 pp. 19–21 (AIC valuation ring, separated finite presentation, settings (B),(C), inverse `Rj_*`), Corollary 4.2(i)–(iv) pp. 19–20, Lemma 4.3 p. 21, Theorem 4.4 p. 22 (dualizability ⇔ ULA after base change ⇔ rank-one valuation test), Corollary 4.5 pp. 22–23, Prop. 3.4 p. 14, Lemma 3.5 p. 16, Prop. 3.7 p. 17, Cor. 3.10 p. 18, Theorem 2.2 p. 9 | exact; the flat (not faithfully flat) base change in 3345 is Cor. 4.2(ii) |
| 6.2 | Kato Definition 3.4 and the microbial remark p. 14, Constructions 4.2–4.3 p. 17; Stacks 09XP, 0A45; Illusie §1.1(a)(i) p. 2; ECD Lemma 16.3 p. 93, Lemma 19.4 p. 110; Berkovich 1994 Theorem 4.9 p. 551 (OCR) | exact; Kato's Construction 4.2 is the isomorphism `RΓ(L_X, RψF) ≅ RΓ(X^a, F^a)` over a microbial valuation ring with separably closed fraction field, as the roadmap states |
| 7.3 | ECD Lemma 16.3 p. 93, Theorem 16.1 p. 92 (proof p. 93), Lemma 14.6 p. 84, Lemma 14.5 p. 83, Prop. 14.3 p. 82; Scholze–Weinstein Berkeley Prop. 4.2.5 p. 30; Conrad, *Irreducible components*, Theorem 3.2.1 p. 18 | exact |
| 8.2 | ECD §18 before Prop. 18.6 p. 103, Cor. 18.8(vi) p. 106; Fargues–Scholze proof of Theorem IV.5.3 p. 153; Zavyalov Foundations Lemma 9.1 p. 23 and Step 1 p. 24, Theorem 9.4 Step 1 p. 28; Li–Reinecke–Zavyalov Definition 4.1.3 and Remark 4.1.4 p. 30, Lemma 4.1.5 p. 30, Prop. 4.1.6 pp. 30–31, Lemma 4.1.7 p. 31, Lemmas 4.2.1–4.2.5 pp. 32–33, Lemmas 4.5.1–4.5.2 p. 41; Berkovich 1994 Lemma 2.1 p. 542, Theorem 5.1 p. 554 (OCR); Bosch–Lütkebohmert–Raynaud Theorem 2.1 p. 367 (flat admissible `X/S`, rig fibres reduced equidimensional of dimension `d`; rig-étale cover and finite rig-isomorphism to a flat model with reduced geometric fibres), 2.1′ p. 368, Props. 2.2–2.3 pp. 369–370, Lemma 2.4 p. 370 (OCR); Lütkebohmert Theorem 5.3 and Prop. 5.4 p. 197, Lemma 5.5 p. 198, Definition 5.6 and Prop. 5.7 p. 200, Lemma 5.8 p. 202, Definition 7.1 and Lemma 7.3 p. 212, Theorem 7.4 pp. 212–213, Prop. 7.5 p. 213, Lemmas 7.6–7.7 pp. 213–215 (OCR) | exact; Lütkebohmert's Definition 5.6 (open immersion into a flat projective formal curve over the image `U` with smooth rigid fibres; local version at closed special-fibre points) and Theorems 5.3, 7.4 read as 4049, 4082, 4114 and 4038 state them |
| 8.3 | Zavyalov Foundations Theorem 1.3 pp. 2–3, Prop. 9.3 pp. 26–27 with footnote 6, Theorem 9.4 Steps 1–5 pp. 28–30; ECD Theorem 19.2 and Remark 19.3 p. 108, Lemma 19.4 p. 110, Def. 22.4 p. 129, Props. 22.9 p. 132, 22.10 p. 133; Berkovich 1993 Prop. 5.2.8 p. 101 | exact; ECD Theorem 19.2 requires `nΛ=0` with `n` prime to `p` or finite cohomological dimension, Zavyalov's 9.3(1) does not (R03) |
| 8.4 | Zavyalov Foundations Lemma 9.1(1)–(3) pp. 23–25, Lemma 9.2 p. 25, Prop. 9.3(2) p. 26; Berkovich 1993 Theorem 5.3.9 p. 105, Theorem 7.7.1 p. 153; ECD Props. 22.8 p. 132, 22.23 p. 139 | exact; invertibility in `O_Y⁺` is exactly Lemma 9.1(3)'s hypothesis |
| 9.2 | Berkovich 1993 Theorem 6.2.1 p. 112 (trace, (a) flat quasi-finite, (b) `ℙ¹` degree, surjective, isomorphism for connected `X` and `n` prime to the residue characteristic), Lemma 6.2.2 p. 112, Cor. 6.2.9 p. 118, Remark 6.2.10 p. 118, Prop. 7.3.2 p. 137, Theorem 7.1.1 p. 128, Theorem 5.4.1 p. 107; ECD Theorem 24.1 p. 152, Prop. 23.10 p. 145; Huber 1993 Math. Ann. Theorem 0.2 p. 703, Lemma 2.1 pp. 705–706, Lemma 2.4 p. 706, Prop. 4.1 p. 708 (OCR, for the Zariski–Riemann statement used by the §2.4 Lean theorem) | exact; Theorem 0.2 is for a separably closed `K`, arbitrary subsets `E, F`, the subspace of `Spv K` with `E ⊆ V`, `F ⊆ 𝔪_V`, any natural `n` and any torsion `G`, which is the Lean statement |
| 10.1 | Ito §6.1 p. 31, §6.2 pp. 32–37 (Theorem 6.8 and Remark 6.9 p. 35, Lemma 6.12 p. 37), Appendix A.1 p. 46, Example A.1 p. 47; Berkovich 1993 Remarks 6.3.4 p. 121, Cor. 6.3.6 p. 122 | exact |
| 10.5 | Ito Theorem 6.8 (Huber 6.2.2) p. 35; ECD Theorem 24.1 proof p. 152; Berkovich 1993 Theorem 6.4.1 p. 125 | exact; Huber 6.2.2 and §6.3 themselves are not readable (below) |

Also checked while reading: Berkovich 1993 Theorems 6.3.2 p. 119, 6.3.5 p. 121, 7.2.1 pp. 131–132, Lemma 7.2.2 pp. 132–133, Theorem 7.3.1 p. 135, Theorems 7.4.1, 7.4.3, Cor. 7.4.4 p. 143, Theorem 7.4.9 p. 145, Cor. 7.5.3 p. 150, Theorem 7.6.1 p. 150, Remark 1.2.4 p. 16, Theorem 5.2.2 p. 98, Prop. 5.2.6 p. 100; Zavyalov Poincaré duality Theorem 1.1.3 p. 3, Lemma 5.3.2 p. 77, Theorem 5.3.3 and Remark 5.4.1 p. 78, Theorem 5.4.4 p. 79, Lemma 5.5.1 p. 81, Theorem 5.5.2 pp. 81–82, Remark A.4 p. 84, Lemmas A.7–A.8 p. 85, Cor. A.11 and Remarks A.12, A.14 p. 86, Theorem A.15, Remark A.16, Lemma A.18 p. 87, Lemma A.19 p. 88; Li–Reinecke–Zavyalov Def. 2.2.8 and Warning 2.2.9 pp. 11–12, Variant 3.1.8 to Lemma 3.1.11 pp. 22–23, Constr. 3.2.1 and Prop. 3.2.2 p. 23, 3.2.3–3.2.5 pp. 24–25, 3.3.2–3.3.8 pp. 25–26, Lemma 3.4.1 p. 27, Props. 5.1.2, 5.1.5 and Lemma 5.1.4 pp. 42–43, Def. 5.1.8–Remark 5.1.11 p. 44, Example 5.1.15 p. 45, Setup 5.2.1–Cor. 5.2.5 pp. 45–47, Theorem 5.2.7 p. 48, Theorem 5.4.2 and Cor. 5.4.3 p. 53, Notation 5.5.2–Cor. 5.5.8 pp. 54–56, Prop. 5.5.10–Lemma 5.5.14 pp. 57–58, Cor. 5.5.18–Lemma 5.5.21 p. 60, Def. 5.6.1–Theorem 5.6.13 pp. 63–65; Scholze pAdicHodge Lemma 3.16 p. 19, Cor. 3.17 p. 20, Prop. 3.7 pp. 14–15, Lemma 3.18 p. 21, Theorem 4.9 p. 25, Prop. 8.2 p. 48, Cor. 5.11 p. 34; Hansen Theorem 1.4, 1.7 p. 3, Conjecture 2.5 p. 6, Lemma 3.1 p. 10, Prop. 3.2 p. 11; ECD Lemma 7.18 p. 36, Prop. 14.9/14.10 p. 86, Lemma 17.1 p. 96, Theorem 19.5 pp. 110–112, Prop. 21.16 p. 126, Theorem 25.1 pp. 158–160, Prop. 27.2 pp. 163–164, Lemma 9.5 p. 46; Zavyalov Foundations Lemma 10.3 p. 31, Cor. 5.11 p. 12, Lemma 7.14 p. 18. All agree with the README's locators.

**Adversarial computations.** `Λ` is a nonzero finite ring of order prime to the residue characteristic unless stated; a tuple lists ranks in degrees 0, 1, 2, …

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| ZR vanishing (Lean) | `E=F=∅` | `Y = Spv K`; trivial valuation `K` is generic, in every nonempty open; constant sheaf flasque; `Hⁿ=0` for `n≥1` | holds |
| ZR vanishing | `E=K`, `F={0}`; `E=K`, `F∋1` | `Y={K}` one point, `Hⁿ=0` for `n≥1`; `Y=∅`, all cohomology `0` | holds; `F⊆𝔪` is the stated condition |
| ZR vanishing | `n=0`, `G=ℤ/2`, `Y` nonempty connected | `H⁰(Y,G)=ℤ/2` not subsingleton | `0<n` needed and present |
| ZR vanishing | `G=ℤ` | Huber Prop. 4.1: some `K,E,F` with `H¹(Y,ℤ)≠0` | `IsAddTorsion` needed and present |
| ZR topology | `K` field, `basicOpen f s` | `s≠0`: `{a∈V}` with `a=f/s`; `s=0`: `∅` | Tau Ceti topology = Huber's `D(a)` topology |
| Transfer (Lean) | `ι=id`, `E={x}`, `W=S=∅` | both sides true at `x=0`; with `E={1}` both false | holds |
| Transfer | `S={(0,x),(x,1)}`, trivial `v` on `K`, nontrivial `w` | `K`-side false (no `0<v(x)<1`), `L`-side true | nontriviality of `v` needed and present |
| Transfer | `n=0`, all families empty; `S={(1,1)}` | both true; both false (`v(1)<v(1)` fails) | holds |
| Transfer | `K=L=ℂ_p`, `ι=id`, `W={(p,x)}`, `S={(x,1)}` | `x=p` satisfies `v(p)≤v(p)`, `v(p)<1` on both sides | holds |
| Section lift (Lean) | `V=K` a field | `ResidueField V = K`, `t=s` | holds (README 4528) |
| Section lift | `V=O_C`, `B=V[x,y]/(xy−π)`, `s(x)=s(y)=0` | `B` torsion-free hence flat; `x=y=√π∈𝔪` lifts | holds, uses `C` algebraically closed |
| Section lift | `V=O_C`, `B=V/𝔪` | `s=id` exists, no `V`-algebra map `V/𝔪→V`; `B` not flat | flatness needed and present |
| Section lift | `B=V[x]/(x²−π)`, `s(x)=0` | lift `x=√π` | holds |
| cd bound (Lean) | `K=𝔽_q`, `L=K`, `ℓ∤q` | `1 ≤ 1+0` | holds |
| cd bound | `K` algebraically closed, `L=K(t)`, `ℓ≠char` | `1 ≤ 0+1` (Tsen) | holds |
| cd bound | `K` separably closed, char `p`, `L=K(t)`, `ℓ=p` | `cd_p(L)=1 ≤ 0+1` (Artin–Schreier) | holds at `ℓ = p` |
| cd bound | `K=ℚ`, `ℓ=2`, `L=ℚ(t)` | `∞ ≤ ∞+1` in `ℕ∞` | holds; `⊤` handled |
| cd bound | `trdeg` infinite | `toENat = ⊤`, right side `⊤` | holds |
| Conventions: variation | `u=[[1,1],[0,1]]`, `v=[[1,0],[1,1]]` | `uv−1=[[1,1],[1,0]]`, `vu−1=[[0,1],[1,1]]`, `(u−1)(v−1)=[[1,0],[0,0]]`; `(u−1)+(v−1)+(u−1)(v−1)=[[1,1],[1,0]]` | formula and order as stated (52, 3172) |
| Conventions: plus-unit | `C=ℂ_p`, `n=p` | unit in `C`, not in `O_C` | two scopes kept distinct |
| 1.1 `H¹(Spa(ℚ_p,ℤ_p),ℤ/p)`, `p` odd | `ℚ_p^×/p` | `ℤ/p×ℤ/p` (from `p^ℤ` and `1+pℤ_p`), dimension 2 | Check 204 correct |
| 1.4 skyscraper at a classical point | closed disc, `Λ≠0` | `{x}` constructible would make `U∖{x}` quasi-compact; the punctured disc is not | Check 486 correct |
| 1.4 `μ_ℓ` over `ℚ_p` | `ℓ∤p−1` | `μ_ℓ(ℚ_p)=1`, Galois module nonconstant | Check 554 correct |
| 1.4 constructible `j_!Λ` | disc radius ½ in disc radius 1 | strata ranks `(1,0)`; one stratum impossible on a connected space | Check 485 correct |
| 2.1 Gabber test | `ℤ_(3)`, `T²−T+3` | root `1` mod 3; discriminant `−11` not a rational square | non-example correct (687) |
| 2.1 henselian non-example | `ℚ`, 3-adic, `X²−7` | `7≡1` mod 3, simple root, no root in `ℤ_(3)` | correct (741, 767) |
| 2.1 henselization | `(ℚ, p-adic)` | `A^h=ℚ_p∩ℚ̄` countable, `Â=ℚ_p` uncountable | `A^h≠Â` (813) |
| 2.1 `A(U)` vs germs | `exp(p²T)` | `v_p(p^{2n}/n!) ≥ 2n−n/(p−1) ≥ n`, so in `ℤ_p⟨T⟩`; transcendental | Check 843 correct |
| 2.2 special subset | `S(∅|{T}/1)` in `Spa(ℤ_p[T],ℤ_p[T])` | complement `R({1}/T)`; connected spectrum | closed, not open (875) |
| 3.4 bounded lattices | rank 1, `m=0,1,2` | counts `1,3,5`; empty join `ℤ_p`, `pℤ_p`; `pℤ_p ∨ p⁻¹ℤ_p = p⁻¹ℤ_p` | R02 repaired |
| 3.5 covering definition | identity; empty; proper open of connected `X` | fibres `1`; `0`; image not a union of components | Checks 1582–1584 correct |
| 3.6 fundamental group | `M(C)`; Tate curve | trivial; topological quotient `ℤ` (deck group of `𝔾_m^an`) | Checks 1667–1668 correct |
| 3.6 non-surjectivity | two `ℙ¹` glued at `0,∞` | `π₁^alg=ℤ̂`, image `ℤ` | de Jong Remark 2.11(i) as stated |
| 3.7 degree-one criterion | split degree `d` cover; `T↦T^d` on `𝔾_m`, `d>1` prime to `p` | `d` points per classical fibre; residue extension degree `d` at the Gauss point | criterion excludes both (1754–1755) |
| 4.1 formal étale | `Spf 𝔽_p → Spf ℤ_p` | iso mod `p`; `𝔽_p` not flat over `ℤ/p²` | all-level test needed (1859) |
| 4.2 support vs tube | `Spf ℤ_p⟨T⟩`, `L={(p,T)}` | `λ⁻¹L={|T|<1}` contains `η_{1⁻}`; tube does not | distinction correct (1992–1993) |
| 4.6 classes | `ϖ_F=uϖ_K²`, chart `XY−ϖ_F` | maximal ideal `(ϖ_K,X,Y)` needs 3 generators in dimension 2 | base-change class, not semistable (2471) |
| 4.7 cutoff | `p=2,e=2`; `p=3,e=1`; `p=3,e=2` | `⌈4⌉=4`; `⌈3/2⌉=2`; `⌈3⌉=3` | 2545, 2562, 2563 correct |
| 4.7 graded pieces | `p=2,e=2,q=1` | `U¹/U²=O_Y`, `U²/U³=O_Y/Z⁰`, `U³/U⁴=O_Y`, `U⁴=0` | matches CDN 2.4(2)–(4) |
| 4.7 square | `(1+ϖ)²=1+2ϖ+ϖ²`, `v_K(2)=2` | `≡1+ϖ²` mod `ϖ³`; class of `1` in `O_Y/Z⁰` is `0` | Check 2657 correct |
| 5.1 quadruple | `Γ=ℤ×ℤ` lex, primes `0⊊𝔭⊊𝔪` | `V_𝔪` strictly henselian; `Frac(V/𝔭)` and `K` have Kummer extensions of degree `ℓ` | only `s=𝔪` (2776, 2780) |
| 5.3 amplitude | `⊔_d` of `d`-fold products of `xy=π` | `R^dΨ(ℤ/ℓ)=ℤ/ℓ(−d)` at the deepest node; generic dimension unbounded | global bound needs finite `N` (2985) |
| 5.3 Gauss valuation | `V=ℤ_(p)` | `|p+T|=1`, `|pT²+p²|=|p|`; `1/(p+T)∈V(T)`, `(p+T)/p∉V(T)` | Check 3032 correct |
| 5.3 tame quotient | `Γ=ℤ`; `Γ=ℤ_(p)`; `Γ=ℤ×ℤ` | `∏_{ℓ≠p}ℤ_ℓ(1)`; trivial (`Γ⊗ℤ_(p)=Γ`); `∏_{ℓ≠p}ℤ_ℓ(1)²` | GR 6.2.12 instances (2995) |
| 5.6 ULA skyscraper | nonfield rank-one AIC `V`, `i_*Λ` | generic restriction `0`, closed stalk `Λ` | not ULA (3276) |
| 5.6 perfectness | `Λ=ℤ/ℓ²`, `M=ℤ/ℓ` | `Tor_i(M,M)=ℤ/ℓ` for all `i` | excluded from perfect-constructible inputs (3311) |
| 6.1 surjectivity | `C⁺⊊O_C` rank two, `C⁺→O_C`; `A→A/𝔭` | `Spec O_C` misses the closed point; generic point missed | injective alone, local alone insufficient (3424–3425) |
| 6.1 equivalence | `ℤ_(p)→ℤ_p` | injective, local, torsion-free ⇒ flat ⇒ faithfully flat; `Spec` surjective | (i)⇔(ii)⇔(iii) instance |
| 6.2 `c_U` | `C⁺` rank two, `S₀={s}`, `E=j_{U*}ι_*Λ` at `𝔭_A` | left stalk `RΓ(U_S,ι_*Λ)=Λ`; `RΨ_S(j^*E)=RΨ_S(0)=0` | not an isomorphism (3498); `S₀=V(𝔭_A)` gives `U_S={η}` |
| 6.2 proper comparison | `A=O_C`, `X=ℙ¹`, `Λ=ℤ/ℓ^r`; char-`p` `C`, `Λ=𝔽_p` | `(Λ,0,Λ(−1))`; `H²(ℙ¹_C,𝔽_p)=0` | no prime-to-`p` hypothesis in (b), twist formula only for invertible `ℓ` (3514–3515) |
| 6.2 local cohomology shift | triangle `i^*i_{0*}RH→i^*E→RΨ` | `RΦ(E)=cone`, so `H^n_{X₀}=H^{n−1}(X_s,RΦE)` | 3505(c) consistent |
| 6.3 non-surjective | rank-one `V→Frac V`, `E=i_*Λ` | `RΓ(Spec V,E)=Λ`, generic pullback `0` | faithful flatness needed (3602) |
| 7.1 surjective extension | `(C,C⁺)→(C,O_C)`, rank two | image `{η}≠Spa(C,C⁺)` | not surjective (3750) |
| 7.3 connectedness | `Z=S`; `Z=S⊔S` | `Z°={η}`; `{η}⊔{η}` | (iii) both directions (3868) |
| 7.3 closures | `Z°=A⊔B` clopen | generizations of a point form a chain, so `Ā∩B̄=∅` | argument at 3862 sound |
| 8.2 compactification | closed disc; proper `ℙ¹`; open disc | boundary `1` rank-two point; `0`; `0` (partially proper) | Checks 3959–3961 correct |
| 8.2 degree-one normalisation | `ℙ¹` marked at `∞` | identity map, inverse image of `∞` is `{∞}` | 4148 instance |
| 8.3 `f_!` vs `f_*` | open disc, `Λ≠0` | `f_!Λ=0`, `f_*Λ=Λ` | 4179, 4182 correct |
| 8.3 closed disc supports | `B→Spa(C,O_C)`, `μ_n` | `H⁰_c=0`, `H²_c=ℤ/n`; Berkovich compact disc `(1,0,0)` | 4212–4213 correct |
| 8.3 vanishing on closed fibre | `C⁺` rank two, `U=Spa(C,O_C)`, `X=ℙ¹_Y`, `α` on `Λ` | both stalks at `s` zero | 4263 instance; coefficient scope is R03 |
| 8.4 projection formula | `Λ=ℤ/4`, `K=G=ℤ/2` | derived tensor has `ℤ/2` in every nonpositive degree | unbounded form needed (4369) |
| 8.6 flat trace | `T↦T²` on the disc, `p≠2`, stalk at `0` | `a↦2a` (length 2), not point count | 4462 correct |
| 9.2 trace normalisation | `c₁(O(1))` on `ℙ¹` | `Tr=1`; `O(−1)` gives `−1` | sign fixed |
| 9.2 rank-two trace | `f=j∘p`, `p:ℙ¹_η→η` | `R²f_!μ_n=j_!Λ`, `Γ(S,j_!Λ)=0`, `Hom(j_!Λ,Λ)=Λ` | 4615 correct |
| 9.3 boundary degree | `g=T−a`; `φ=T²`; `φ=T⁻¹` | `deg_D=1`, `γ_D=−1`; `N(T)=−T_target`, degree `1`; `N(T)=T_target⁻¹`, exterior degree `1` | Checks 4478–4480 correct |
| 9.3 boundary sequence | connected disc; annulus with two branches | initial term `μ_n^{1−1}=0`; `μ_n^{2−1}` | 4751 correct |
| 9.6 duality on the ball | `G=j_!ℤ/n`, `q=−2` | `H⁰(D,μ_n)=μ_n`; `Hom(H²_c(D,ℤ/n),ℤ/n)=Hom(ℤ/n(−1),ℤ/n)=μ_n` | 5092 consistent |
| 9.6 rank-two numerical pairing | closed disc over open `η`, `Λ≠0` | `RΓ(S,Rf_!Λ)=0`, `H⁰(X,Λ)=Λ` | numerical pairing excluded over the full base (5148) |
| 10.1 radial loci | `closedDisc(A⁺,T,ϖ⁻¹)` in `C⟨T⟩`; in `C⟨T/ϖ⁻¹⟩` | whole unit disc; contains `T=ϖ⁻¹` | 5276 correct |
| 10.1 punctured/annulus | `T=0`; `T=1`, radii `1,1`; `a=b` | `∅`; whole `Spa`; circle, not `∅` | 5297–5298, 5321–5322, 5326 correct |
| 10.2 strict annulus | equal radii | `a<T<a` impossible, `∅` | 5346 correct |
| 10.4 non-concentric control | `C=ℂ_3`, `Λ=ℤ/2`, `V={|9|≤|T−1|≤|3|}` | `|S|≤|3|`, `|C(½,k)S^k|≤3^{−k/2}→0`, so `1+S` is a square and `δ₂(T)↦0`; dual map `H¹_c(V)→H¹_c(A)` is `0` | 5489 correct |
| 10.4 root towers | `ℓ`-th root vs `p`-th root on `H¹(−,𝔽_ℓ)` | `×ℓ=0`; `×p` invertible | 5539 correct |
| 10.5 coefficients | `f=id`, `B=𝔽_ℓ[t]` | stalk `B`, finitely generated, infinite | `Module.Finite`, not `Finite` (5559) |
| 11.2 cd bound | `Spa(C,O_C)`; strict `m`-ball | `0`; `2m` | 5657–5658 instances |
| 11.3 frontier | annulus `0<|a|≤|b|<1`; `|b|=1` | `{η(a),η(b)'}`; `{η(a)}` | 5733–5734 correct |
| R03 duplicate | `X=ℙ¹_S`, `C⁺` rank two, `F=j'_!Λ`, `Λ=ℤ/p` | Zavyalov 9.3(1) gives `RΓ=0` for all `n`; 4247 declines to assert it | inconsistency, not falsity |
| R06 finite type | `V` strictly henselian DVR, `X=Spec V[x]/(πx)`, `n` prime to `p` | tube and fibre at the origin both `RΓ(Spec K̄^{sh},Λ)=Λ`; away from the origin both empty | statement holds; route via `i_*` into `𝔸¹` |

## Not verifiable

- **Huber 1996 (the book):** paywalled at the publisher; no local text. This affects every Huber book locator, in particular §§2.3–2.8, 3.1–3.9, 4.1–4.2 (Theorem 4.1.1(c), Props. 4.2.4–4.2.5, Cors. 4.2.6–4.2.9), 5.1–5.5, 6.1–6.3 (Theorem 6.2.2 and the §6.3 reduction used by §10.5), 7.1–7.5 (Lemma 7.2.3 behind the two §9.2 Lean theorems, Theorems 7.4.2 and 7.5.3) and 8.1–8.3. Where a public source restates a Huber result (Zavyalov, Li–Reinecke–Zavyalov, Hansen, Ito, Kato, Illusie), that restatement was checked instead and is listed above.
- **de Jong–van der Put 1996:** the EMS scan is image-only in the cache and its 533-page OCR had not run; the §§2.4–3.7 locators are cited by locator only. The facts used (`Sp(F_e)` étale fibres, Theorem 3.7.3) are standard and consistent with Huber's and Berkovich's statements that were read.
- **Berkovich 1990 (AMS Surveys 33), Prestel 1986, Bhatt–Mathew:** no legal text found or not fetched; cited by locator (R02).
- **Conrad, *Irreducible components*:** the cached author copy was read for Theorem 3.2.1 (p. 18); the sources service refused a fresh fetch of `math.stanford.edu` for lack of a licence class, so a `[[missing]]` entry was written to this job's `needs-references.toml`; it can be dropped since the text is in the cache.

## Source issues

- **Error** in HirokiKato2020 at §3.2, before Definition 3.4, printed p. 14: the source says every finite-dimensional valuation ring is microbial; it should exclude dimension zero, since a field has no height-one prime; affects nothing (Definition 3.4 assumes microbial).
