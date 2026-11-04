# Review of PadicFamilies (pull request #1019 at f3b762c)

**Verdict:** accepted

Full re-review of the repaired head (998 changed lines since `ed1464b`). The six findings of the previous review are repaired (checked one by one below); the gate passes; the dependency check is clean; the three Lean headlines elaborate and survive the one-tactic probe; the seeded source sample of fifteen targets is supported at the stated locators with one weak locator (R02). Three P3 notes remain, none blocking.

## R01 (P3) — Supplier declaration names that the suppliers do not declare

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:43` (`HeckeImage.finite_local_factors`); `:91` and `:2114`, `:2338` (`IsDecentRefinement`, `secondaryPadicL`, `secondaryPadicL_flag`, `secondaryPadicL_interpolation`, `localFamilyPadicL`); `:128` (`characterEisenstein_full_interpolation`, `characterEisenstein_lowWeight_of_qExpansion`); `:1636`, `:1657` (`complexFredholmProduct`); `:2175` (`thetaDistribution`).

**Claim:** these backticked names are declarations supplied by IntegralHeckeAndGaloisDeterminants §2.2, ModularSymbolsPadicLFunctions §3.0, DirichletPadicLFunctions §5.9 and LocallyAnalyticDistributions §4.16.

**Witness:** `roadmaps grep --fixed` at the open heads finds each of these names in PadicFamilies only (`finite_local_factors` once more, in DeformationAndDerivedPatchingAlgebra's own supplier contract, not in IntegralHeckeAndGaloisDeterminants). At those heads the sections exist and state the content in prose: IntegralHeckeAndGaloisDeterminants §2.2 has the paragraph *Finite local factors* with no Lean name; DirichletPadicLFunctions §5.9 names only `characterEisenstein_stabilized_qExpansion` and states the arithmetic-family interpolation and the conditional low-weight comparison in prose; ModularSymbolsPadicLFunctions §3.0 lists "API: criticality and theta-criticality of forms, decency of a refinement", "API: the secondary p-adic L-functions, their flag, their interpolation property, the local family p-adic L-function" and "API: the map `Θ_k`" without declaration names; LocallyAnalyticDistributions §4.16 states *Characteristic series of a compact complex representative* in prose (its `algebraicSlopePartLE`, also cited here, does exist at that roadmap's line 3178).

**Repair:** cite each by section and the supplier's prose title, for example "IntegralHeckeAndGaloisDeterminants §2.2, *Finite local factors*", "DirichletPadicLFunctions §5.9 (the arithmetic-family interpolation and the conditional low-weight comparison, with `characterEisenstein_stabilized_qExpansion`)", "ModularSymbolsPadicLFunctions §3.0, *Criticality and decency*, *Secondary and family L-functions*, *The theta exact sequence*", "LocallyAnalyticDistributions §4.16, *Characteristic series of a compact complex representative*", and drop the invented backticked names. Every statement consumed is present at those sections, so no target changes.

## R02 (P3) — The EPW locator for §4.4 points to residual Selmer groups

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2508`, "See [Ochiai], §1, pp. 116–117; [EPW], §3.1–§3.2, pp. 23–27."

**Claim:** EPW §§3.1–3.2 support the Selmer complex of the nearly ordinary deformation.

**Witness:** epw lines 1082–1180 (pp. 23–25): Theorem 3.1.1 is the Λ_O-cotorsion and μ/λ statement for the one-variable Selmer group of a fixed form, and Definition 3.2.1 through Proposition 3.2.3 define finite/singular structures on the residual module over ℚ_∞. No two-variable complex, derived base change or determinant occurs in those pages.

**Repair:** keep Ochiai §1, pp. 116–117 for the local conditions, and cite SelmerIwasawaCohomology §§2.21 and 3.8–3.10 (already in *Needs*) as the construction's source; if EPW stays, cite only Definition 3.2.1(2), p. 24, for the shape of the condition at `p`.

## R03 (P3) — Scope does not record the earlier quaternionic eigenvariety instance

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:17` (ownership of the eigenvariety machine) and §§2a.9–2a.13.

**Claim:** Layer 2a owns Buzzard's gluing, base change, links and point classification (Lemmas 5.4–5.10, Construction 5.7) in general.

**Witness:** AutomorphicGaloisRepresentations §0.3 (merge order 147, before this roadmap at 153) constructs the quaternionic finite-slope family on QuaternionicModularForms' modules from the same sources, "Buzzard §5, Lemmas 5.4–5.6, Construction 5.7 and Lemmas 5.9–5.10, pp. 33–42", including primitive-link identities, cocycles, the nilpotent-kernel fibre comparison and independence of the cover.

**Repair:** add one sentence to *Scope and ownership*: Layer 2a is the general machine (arbitrary `(Pr)` module with a commuting Hecke algebra) and is the owner of Buzzard §§4–5 in that generality; AutomorphicGaloisRepresentations §0.3 is its earlier quaternionic instance, to which §2a.12 specialises. No target moves; the general statement cannot be imported from that instance.

## Verified sound

### The previous review's findings at this head

| Previous finding | Passage now | Status |
|---|---|---|
| R01 relative Robba machinery | README:15 "Relative Robba rings and realization, Herr comparison and analytic Iwasawa comparison belong to `PhiGammaModulesAndIwasawaCohomology`, §§1.1–1.2, 3.6, 4.5 and 5.4"; README:74–76 names `relativeDrig`, `affinoidHerrComparison`, `herrDerivedBaseChange`, `psiDerivedBaseChange`, `analyticIwasawaComparison`; §4.9 (line 2615) applies them and keeps only the Coleman summand, triangulation, differential vector and regulator. All five names exist at that roadmap's head (its lines 722–731, 1325, 1716, 1869). | Repaired |
| R02 weighted preparation | README:15 and :72 cite `RestrictedPowerSeries`, §§4.1–4.3, 6.2 and 6.4 and `AdicSpacesPartII`, §R0.3; §2a.2 (line 1390) keeps only the residue-disc chart application and the distinguishedness check. Headings exist on main (RestrictedPowerSeries lines 454, 469, 484, 630, 667; AdicSpacesPartII line 1769). | Repaired |
| R03 reference anchors | References are `### kt`-style headings (lines 2999–3093); gate `residue=0`. | Repaired |
| R04 API bullets as undeclared names | README:5 "The remaining targets and their APIs are specified in prose"; the only backticked names of this roadmap's own are the six declarations; gate `readme-ids-missing=0`. Supplier names remain backticked, with the name-level drift of R01 above. | Repaired |
| R05 ACC link | README:3069 links the authors' copy with the published pagination. | Repaired |
| R06 quaternionic locator | README:2737 "pp. 32–34 (p. 34 for the quaternionic Hecke image and its ordinary identification)". | Repaired |

### Gate, dependency check, folder

- Gate at f3b762c (worker's run): every counter zero, `OK`. No file outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PadicFamilies'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.
- Dependency check (my run):

```text
depcheck: 208 roadmaps, 1482 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. Supplier positions in the merge order: IntegralHeckeAndGaloisDeterminants 22, IntegralIwasawaTheory 24, NoncommutativeAndEquivariantIwasawa 25, PhiGammaModulesAndIwasawaCohomology 27, ArithmeticGaloisDuality 42, FiniteFlatGroupsAndIntegralPadicHodgeTheory 45, SelmerIwasawaCohomology 50, DeformationAndDerivedPatchingAlgebra 58, LocallyAnalyticDistributions 63, ModularCurvesPartII 70, GlobalGaloisDeformations 72, DirichletPadicLFunctions 78, AlgebraicModularFormsAndSerreWeights 84, GL2AutomorphicRepresentationsAndTransfer 85, ModularSymbolsPadicLFunctions 103, WeightsInEtaleCohomology 131, HilbertModularVarietiesAndShimuraCurves 142, SerreWeightAndLevelOptimisation 145, this roadmap 153. QuaternionicModularForms is another author's open pull request adding a new folder (allowed). On main: PadicMeasuresIwasawaAlgebras, DerivedModuleAlgebra, ModularForms, RigidAnalyticGeometry, AdicSpacesPartII, AdicSpacesPartIII, RestrictedPowerSeries; ProfiniteProPGroups under `Completed/`. Consumers only: OrdinaryAutomorphicFormsAndModularityLifting (154) cites PadicFamilies §§0a.14, 5.2–5.3, 5.8, Layer 5; OverconvergentAutomorphicForms (234), ModularIwasawaMainConjectures (347) and PadicFamiliesPartII (239) are later.
- No declared gaps (`gap:` absent from the README; no readable `design/plan.json`); no `What <Supplier> must provide` lines; nothing to check under that rule.

### Lean form

- `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean`: exactly three warnings, `declaration uses sorry` at lines 53, 89, 115; nothing else. Single `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`, two definitions with real bodies (`IsLocallyFiniteEnd`, `CompleteFlatComplex`, `HasFiniteProjectiveModel` are three), no sorry'd data.
- A scratch copy with `#check @` for all six declarations elaborates; the elaborated types agree with the README statements: §0a.19 (orbit modulo each `Iⁿ` in a finitely generated submodule), §0a.22 (unique idempotent commuting with `T`, `T` bijective on its range, factorial convergence, topological nilpotence on its kernel, under noetherian complete local `R` with finite residue field and adically complete `M`), §0a.0.2, §0a.17 (idempotent in `R[t]`, factorial convergence in the homotopy endomorphism ring, splitting with finite projective terms in `[a,b]`), §0a.25 (two complete-flat locally finite representatives, strict splittings of the degreewise limits, a derived comparison intertwining the operators, perfectness of one factor; conclusion perfectness of the other and the induced map an isomorphism). Dropped section binders: `HasDerivedCategory` is absent from `CompleteFlatComplex` and `IsLocalRing` from `HasFiniteProjectiveModel`; neither is needed by those predicates. `perfect_complex_ordinary_projector` carries an unused `HasDerivedCategory` instance; harmless (P3 note, no change needed).
- One-tactic probe: replacing each `sorry` by `simp` in a scratch copy leaves all three goals unsolved (errors at probe lines 66, 109, 136). No declaration restates a definition, mirrors a Check or computes a value. No padding.
- Headline coverage. README headlines: (a) the locally finite ordinary projector (§0a.22), (b) the perfect-complex ordinary idempotent and splitting (§0a.17), (c) representative independence of the derived ordinary factor (§0a.25): all three stated. Not statable at the pins and named in the docstring (lines 15–33): coefficient-tower gluing (§0a.18), Katz/ordinary control (Layer 0), period freeness and two-variable interpolation (Layer 1), the eigenvariety and symbol eigencurve (Layers 2a–2), the critical eigensymbol and secondary L-functions (Layer 3), family reciprocity, Euler-system divisibility and Coleman triangulation (Layer 4), totally real control and period modules (Layer 5). I confirmed at the pins that no carrier exists for these: `grep` over the pinned Tau Ceti and Mathlib finds no `Igusa`, no `igenvariet`, no `verconvergent`, no `Hida`, no `Robba`; Tau Ceti's `ModularSymbol` files are the geodesic-integral and Hecke-slash classical symbols, not family symbols. The six fully qualified names occur in no other readable roadmap.

### Library declarations opened at the pins

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest.json; the README's stated hashes agree). Every declaration named in the supplier contracts and `*Needs:*` lines exists at the pin:

| Declaration | File:line at the pin |
|---|---|
| `IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` (separated and precomplete; a fraction field of a DVR fails separatedness, as §0a.0.2's Check says) |
| `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, `eventually_isCompl_ker_pow_range_pow`, `eventually_iInf_range_pow_eq` | `Mathlib/RingTheory/Artinian/Module.lean:317`, `:308`, `:197` (Artinian plus Noetherian; no factorial convergence) |
| `LinearMap.eventually_iSup_ker_pow_eq` | `Mathlib/RingTheory/Noetherian/Defs.lean:177` |
| `Ideal.finite_quotient_pow` | `Mathlib/RingTheory/Ideal/Quotient/Index.lean:101` |
| `IsLocalRing.finite_quotient_iff` | `Mathlib/RingTheory/LocalRing/Quotient.lean:130` |
| `nonempty_sections_of_finite_cofiltered_system`, `nonempty_sections_of_finite_inverse_system` | `Mathlib/CategoryTheory/CofilteredSystem.lean:79`, `:111` |
| `Module.AEval'` | `Mathlib/Algebra/Polynomial/Module/AEval.lean:194` |
| `LocalizedModule`, `IsLocalizedModule` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean:88`, `:536` |
| `CharacterModule` | `Mathlib/Algebra/Module/CharacterModule.lean:43` (algebraic characters into `AddCircle`; §5.5 correctly says it is not a topological dual) |
| `FractionRing` | `Mathlib/RingTheory/Localization/FractionRing.lean:729` (total quotient ring; field instance only for domains, as §5.13 says) |
| `isArtinian_of_finite`, `IsArtinian.bijective_of_injective_endomorphism` | `Mathlib/RingTheory/Artinian/Module.lean:116`, `:164` |
| `LinearMap.isProj_iff_isIdempotentElem`, `LinearMap.linearProjOfIsCompl` | `Mathlib/LinearAlgebra/Projection.lean:566`, `:346` |
| `Function.Exact.linearMap_ker_eq` | `Mathlib/Algebra/Exact/Basic.lean:310` |
| `Submodule.torsionBySet`, `Module.annihilator` | `Mathlib/Algebra/Module/Torsion/Basic.lean:182`, `Mathlib/RingTheory/Ideal/Maps.lean:868` |
| `IsDedekindDomain.FiniteAdeleRing`, `MvPowerSeries` | `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:94`, `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86` |
| `Finite.exists_ne_map_eq_of_infinite`, `Nat.self_le_factorial`, `Nat.factorial_dvd_factorial`, `Function.iterate_add`, `Function.iterate_mul`, `Set.BijOn` | `Mathlib/Data/Fintype/Pigeonhole.lean:74`, `Mathlib/Data/Nat/Factorial/Basic.lean:133`, `:77`, `Mathlib/Logic/Function/Iterate.lean:72`, `:85`, `Mathlib/Data/Set/Operations.lean:320` |
| `HomologicalComplex.homologyMap`, `LinearMap.charpoly`, `LinearMap.aeval_self_charpoly`, `Submodule.mapQ`, `Module.End.pow_apply`, `Submonoid.powers`, `IsIdempotentElem` | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:329`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`, `:214`, `Mathlib/LinearAlgebra/Quotient/Basic.lean:170`, `Mathlib/Algebra/Module/LinearMap/End.lean:130`, `Mathlib/Algebra/Group/Submonoid/Membership.lean:312`, `Mathlib/Algebra/Group/Idempotent.lean:37` |
| `HeckeRing.GL2.Newform`, `HeckeRing.GL2.heckeUNat` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `TauCeti/NumberTheory/ModularForms/HeckeSlash/BadPrime/Basic.lean:54` (good-index eigenproperties only, as README:39 says) |

### Cross-roadmap citations resolved

Every cited section exists where it is cited, at the open head or on main (headings located by number): ModularCurvesPartII §§3.1, 3.5–3.7, 4.1, 4.4, 5.17, 7.1–7.6, 9.1, 11.1, 13.1–13.6, 14.1, 14.4a, 14.9, 14.12–14.15, 15.1, 17.2, 17.7; SerreWeightAndLevelOptimisation §§2.13, 3.1, 3.5–3.7, Layer 4; HilbertModularVarietiesAndShimuraCurves R18.3.1, R18.3.4–R18.3.6, R18.3.22, H1.1–H1.10, H2.2–H2.9, H3.6–H3.8, H4.8, H5.3–H5.4; GL2AutomorphicRepresentationsAndTransfer R16.6.3, R16.6.5; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 (its line 18 defines these identifiers as §§6.1–6.2); WeightsInEtaleCohomology R34.6 (its Layer 6, lines 17 and 33); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.P2, R07.P3, R07.P5; SelmerIwasawaCohomology §§2.2, 2.8, 2.10, 2.21–2.24, 3.1, 3.6, 3.8–3.11, 3.14, 3.15, 3.18–3.21, 4.9–4.12; IntegralHeckeAndGaloisDeterminants §§0.6, 1.3, 2.2, 2.3, 4.2, Layer 4; ArithmeticGaloisDuality R02.1.1, R02.2.1, R02.4, D7; GlobalGaloisDeformations §3.6; QuaternionicModularForms §0.3 (`classSet`, `finite_classSet` present); IntegralIwasawaTheory §§5.0, 6.3, 9.0 (`kubotaLeopoldtPseudomeasure`, `kubotaLeopoldt_interpolation`, `bernoulliStickelberger_dictionary`, `rationalOrdinaryControl` present); DirichletPadicLFunctions §§1.6, 5.4–5.9 (`fullEisensteinAwaySeries`, `clearedEisensteinSeries`, `integralTwistedPositiveEisensteinMeasure`, `normalizedTameEisensteinSeriesMeasure`, `principalTameEisensteinSeries` present); NoncommutativeAndEquivariantIwasawa §F.5 (`hilbertForms`, `hilbertQExpansion`, `hilbertCoefficientFamily`, both lattices, `c̄`, `C`, the specialization sequence and the Eisenstein `626/3` and `4/15` example all present at its lines 2288–2335, and its line 2310 names PadicFamilies §§5.9a–5.10 as the receiving presentation); DeformationAndDerivedPatchingAlgebra §§7.3, 7.5, 7.8 (`IsMinimal`, `CompleteFlatComplex`, `finiteDerivedHomCompletion`; its line 1900 states the §0a.0 interface); PhiGammaModulesAndIwasawaCohomology §§1.1–1.2, 3.6, 4.5, 5.4; LocallyAnalyticDistributions §§2.1, 2.3, 4.1, 4.2, 4.4, 4.8, 4.9, 4.14–4.16; on main RestrictedPowerSeries §§4.1–4.3, 6.2, 6.4, AdicSpacesPartII R0, R0.3, R1, AdicSpacesPartIII F0.1, R2.4, R2.6–R2.7, R3.1–R3.3, DerivedModuleAlgebra §§0.2, 1.T.1, 1.1, 1.E.0–1.E.1, PadicMeasuresIwasawaAlgebras §§0.1, 1, 3.1–3.3, 3a.1, 4.6, 5.1, 5.2, RigidAnalyticGeometry §§1.1, 1.3, 1.5, 6.1–6.3, 7.1–7.4, 8.3, ModularForms Layers 0, 4, 5, 8, 8G (Layers 4A/4B are the sublayers of Layer 4), ProfiniteProPGroups Layer 9 (Completed). The only unresolved items are the invented declaration names of R01. Ownership by object: the ordinary projector, local finiteness, Katz comparison, family symbols, eigenvariety machine, critical Eisenstein extensions, family reciprocity and totally real tower comparisons occur in no earlier roadmap (grep for "locally finite endomorphism", "Igusa tower", "Hida famil", "ordinary projector", "Beilinson–Kato", "Construction 5.7" across main and the open heads); the earlier hits are IntegralIwasawaTheory §9.0 (consumed), NoncommutativeAndEquivariantIwasawa §F.5 (consumed), IgusaVarietiesAndTorsionConcentration (later, 167) and AutomorphicGaloisRepresentations §0.3 (R03). Open pull requests whose files this brief does not give were not checked.

### Seeded source sample

Texts read through the sources service (line numbers are of the cached extractions): hida (Numdam), bellaiche09 (arXiv v1), buzzard (author page), epw (arXiv v1), klz (arXiv v6), kt (arXiv v2), ochiai (Centre Mersenne), sw (Numdam), dkv (Annals open PDF), pilloni (author page), deligne-ribet (author page, OCR), kato (Numdam), Stacks 05BC, 0CQG, 0B3N.

| Target | Locator checked | Result |
|---|---|---|
| 0.2 Katz limits | hida lines 390–394 (Theorem 1.1, PDF p. 11 = printed 240), 407–411 (Corollary 1.2, p. 241) | Hypothesis "N₀ ≥ 3 or p ≥ 5", `W(N;ℤ_p) = W(N₀;ℤ_p) = M̄(N;ℤ_p)` and the mod-p `Γ`-invariant quotient by `E_{p−1}−1` are as stated. |
| 0.15 primitive components | hida lines 816–835 (Proposition 3.4, Theorem 3.5, printed 252), 861–872 (Theorem 3.6, 253), 885–893 (Corollary 3.7, 253), 1302–1354 (§6 proof, 264–265) | Semisimplicity of the primitive part, `[M:K] | [𝒦:L]`, compatibility with extension of `K`, the count `d` at every `k ≥ 2`, conductor divisible by `N₀` and the converse are as stated; Hida's free closure and (3.9) are the objects §1.10 distinguishes from the raw annihilator module. |
| 2.4 local pieces | bellaiche09 lines 1253–1263 (Definition 3.15, pp. 31–32), 1266–1276 (Definition 3.16, p. 32) | `T^±_{W,ν}` finite, torsion-free, flat over Dedekind `R`; punctual algebra on the slope-`≤ν` symbols; the README's global-image fibre is the author's later correction, not in this text. |
| 2.5 nilpotent kernel | bellaiche09 lines 1286–1293 (Lemma 3.17, pp. 32–33), 1300–1302 ((19)); buzzard lines 1473–1487 (Lemma 5.10, p. 42) | Surjectivity and nilpotent kernel; Buzzard's proof is the Cayley–Hamilton argument the README reproduces. |
| 2.9 étale freeness | bellaiche09 lines 1322–1333 (Lemma 4.1), 1334–1354 (Remark 4.2), 1355–1361 (Proposition 4.3, p. 34), pp. 33–34 | The DVR lemma and its failure for a non-regular local `T` (`t² = u³`) support the étale case. |
| 3.0 preferred Eisenstein | bellaiche09 lines 667–689 (Lemma 2.11, pp. 17–18) | `dim Ext¹_f(χ₂,χ₁) = 1`, `Ext¹_f(χ₁,χ₂) = 0`, existence and uniqueness; the README's weight-two exclusion repairs the source (see Source issues). |
| 3.5 smoothness | bellaiche09 lines 793–837 (Theorem 2.16, pp. 20–21), 840–843 (Corollary 2.17) | Decent, `v_p(β) ≠ 0` for Eisenstein, `C` and `C⁰` smooth, same germ; ramification iff critical by Proposition 2.12. |
| 3.7 rank one | bellaiche09 lines 1355–1361 (Proposition 4.3), 1362–1369 (Corollary 4.4), 1372–1385 (Proposition 4.5, p. 35) | Free of finite rank at smooth points, specialisation an isomorphism, rank one at decent points computed at a nearby étale classical point. |
| 4.2 ordinary filtration | ochiai lines 149–157 (properties 4–5, p. 116); epw lines 595–609 (Theorem 2.3.4, p. 13) | `F⁺T̃ ≅ ℤ_p[[Γ]](χ̃) ⊗̂ H^ord(α̃)`, `α̃` unramified with `κ(A_p) = a_p(f_κ)`, both graded pieces free of rank one; the README's twist by `ωⁱ` and its quotient character `det/char F⁺` are the correct consequences. |
| 4.4 Selmer complex | ochiai lines 160–181 (pp. 116–117); epw lines 1082–1180 (pp. 23–25) | Ochiai supports the Selmer group and both local conditions; the EPW pages do not contain the complex (R02). |
| 4.5 Kato classes | ochiai lines 233–258 (Proposition 1.2, pp. 117–118); klz lines 2518–2527 (Theorem 8.2.3, p. 42) | `Z(r) ∈ H¹(ℚ(ζ_r),T*(1))`, norm relation with `P_q(X) = det(1 − Frob_q X; T)` for geometric Frobenius, dual-exponential formula with `L^{(p)}(f_κ,ω^{i−j},j)/((2π√−1)^{j−1}C^{(−1)^i}_{∞,κ})·δ^{dR}_κ`, all as stated. |
| 5.4 level stability | sw lines 913–918 (definition of `T₀(p)`, printed p. 30), 1105–1107 (proof of Proposition 3.3, p. 36) | `U⁰_a g U⁰_a = U⁰_a g U⁰_{a−1}` for `a ≥ 2` with `g = diag(1,p_p)`, image in level `U⁰_{a−1}`, `eH⁰(X(U⁰_a)) = eH⁰(X(U⁰_1))`, and `H⁰(X(U⁰_a)) = H⁰(X(U_a))^{G(U_a)}` (line 1100). |
| 5.7 finiteness | sw lines 1110–1127 (Corollary 3.4 and Lemma 3.5, p. 36) | Finite torsion-free over `Λ′`, semilocal and complete; proof via a free level `V = U ∩ U(ℓ)`, `ℓ ∤ 6` unramified. |
| 5.10 Λ-adic Hilbert forms | dkv lines 513–577 (§3.1, pp. 846–847); hida lines 570–584 ((2.2b), Proposition 2.1, p. 245), 643 (Theorem 2.2, p. 247); pilloni lines 326–336 (Lemma 2.1.3, p. 8); Stacks 0B3N (Divisors, Lemma 13.15) | `ν_k: T ↦ u^{k−1}−1`, specialisation to `M_k(𝔫p, χω^{1−k})`, `e = lim(∏U_𝔭)^{n!}`, `E(1,χ)` with constants `2^{−[F:ℚ]}L_p(χω,1−k)` and modulus divisible by every `𝔭 | p`; reflexive equals locally free in regular dimension ≤ 2. DDP's Definition 3.1 and Proposition 3.2 not opened (below). |
| 5.14 period modules | sw lines 1062–1089 (pp. 35–36), 1171–1190 (algebraic primes, Lemma 3.8, p. 38), 1191–1204 (§3.3) | `M_∞` and `M⁺_∞` as inverse limits along traces, Pontryagin dual to the direct-limit towers; weight-two algebraic primes dense; the roadmap's invertibility hypothesis is its own, not the source's. The placement of the `+` superscripts is lost in the Numdam OCR, so the adjoint-action assignment is checked only for internal consistency. |

Also read for the headlines: pilloni lines 294–298 (Definition 2.1.1), 299–319 (Lemma 2.1.1 and Remark 2.1.1 with the `p^{i(i+1)/2}` kernel example), 320–325 (Lemma 2.1.2), 326–336 (Lemma 2.1.3), 337–347 (Lemma 2.1.4), 362–394 (Propositions 2.2.1–2.2.2), 396–468 (Definitions 2.3.1–2.3.2, Proposition 2.3.1, Lemma 2.3.1, Lemma 2.3.2); kt lines 382–416 (Lemma 2.10, p. 9), 462–480 (Lemma 2.12, p. 10), 498–548 (Lemmas 2.13–2.14, Proposition 2.15); Stacks 05BC (More on Algebra, Lemma 28.1) and 0CQG (Lemma 99.3: `R lim` of compatible perfect systems with nilpotent kernels is perfect). The three Lean statements are Pilloni Lemma 2.1.3, Khare–Thorne Lemma 2.12 (restricted to bounded good complexes, which is where `End_{K(R)} = End_{D(R)}` holds), and Pilloni Lemma 2.3.2 with Proposition 2.2.1, at the generality of the sources.

### Computed adversarial pass

One row per statement; values on each side are mine. "Retain" means the hypothesis or convention survives the instance. Finite coefficient and matrix models test the stated implications; they do not prove the arithmetic existence theorems.

| Statement | Instance | Left / constructed | Right / competing | Result |
|---|---|---|---|---|
| 0a.0.1 minimal models | `R = ℤ₃`, disks `R→R` with `d = 1` and `d = 3` | `d=1`: contracts to 0, residue cohomology (0,0) | `d=3`: minimal, residue cohomology (1,1) | Retain: minimality = `d ≡ 0 mod m`. |
| 0a.0.2 complete-flat | sequences `(3ʲ)ⱼ` and `(1)ⱼ` in `ℤ₃^{(ℕ)}`; `ℚ₃` | `(3ʲ)` has `j < n` coordinates outside `3ⁿ`; `ℚ₃/3ⁿℚ₃ = 0` | `(1)ⱼ` has all coordinates outside `3ⁿ`; completion of `ℚ₃` is 0 ≠ `ℚ₃` | Retain restricted coefficients and separatedness (Stacks 05BC universally injective). |
| 0a.0.3 compatible models | `R_n = ℤ/3ⁿ`, differentials `3 mod 3ⁿ` | limit `ℤ₃ —3→ ℤ₃` | zero differential or free stalk would reduce to `0`, not `3 mod 9` at `n=2` | Retain coherent reduction maps (Stacks 0CQG hypotheses: surjective, nilpotent kernels). |
| 0a.1 factorial iterates | `ZMod 6`, `x ↦ 2x` | `2^{720} ≡ 4 mod 6`; `4² = 16 ≡ 4` | 2-cycle `{2,4}`: `f^{6!}` fixes both; `0 ↦ 0` | Retain `n ≥ |X|`, positive powers only. |
| 0a.2 finite projector | `ZMod 8`, `U = 2`; `U = 3` | `2³ = 8 ≡ 0`: `e = 0`, `M_ord = 0` | `3` a unit: `e = 1` | Retain unit/nilpotent cases; `e_1 = 1`. |
| 0a.3 Fitting projection | `U = diag(2,0)` on `𝔽₅²` | `range e = 𝔽₅e₁`, `ker e = 𝔽₅e₂` | `⨅ range Uⁿ = 𝔽₅e₁`, `⨆ ker Uⁿ = 𝔽₅e₂` | Agrees with `isCompl_iSup_ker_pow_iInf_range_pow`. |
| 0a.4 inverse/nilpotence | same `U`, `m = 25` | on `M_ord`, `U^{25!−1} = 2^{25!−1}`; `2^{25!} = (2⁴)^{25!/4} = 1` so inverse `= 2^{−1} = 3` | on `M_nord` `U = 0`; `ker Uⁿ` chain stabilises at `n=1 ≤ ⌊log₂ 25⌋ = 4` | Retain uniform exponent `m` on finite modules. |
| 0a.5 uniqueness | `U = diag(1,0)` on `(ZMod 2)²`, candidate `B = span(e₁+e₂)` | `Uⁿ(e₁+e₂) = e₁ ≠ 0` | actual `M_nord = span(e₂)` | Wrong complement rejected without a stability hypothesis on `B`. |
| 0a.6 naturality | `f = π₁: 𝔽₅² → 𝔽₅`, `U₁ = diag(2,0)`, `U₂ = 2` | `f e₁ (x,y) = x` | `e₂ f (x,y) = x` | Retain common threshold `n ≥ max(|M|,|N|)`. |
| 0a.7 exactness | `0→ZMod 2→ZMod 6→ZMod 3→0`, `×2` everywhere | ordinary parts `0 → {0,2,4} → ZMod 3` | `4 ↦ 1`, `2 ↦ 2`: bijective | Retain finite-level exactness. |
| 0a.8 quotients | `ZMod 9`, `U = 3`, `P = 3M` | `(M/P)_ord`: `3 = 0` on `ZMod 3`, so `0` | `M_ord = 0` since `3² = 9 ≡ 0` | Retain. |
| 0a.9 localization | `𝔽₅[X]`-module `𝔽₅²`, `X = diag(2,0)` | `M[X⁻¹] = 𝔽₅e₁` | `M_ord = 𝔽₅e₁`; `e₂/X^k = 0` | Retain `X`-localization; zero module gives 0. |
| 0a.10 quotient systems | `ℤ₃`, `J_n = 3ⁿℤ₃`; `ℂ` over `ℂ`, `U=2` | finite quotients `3ⁿ`, `⋂ = 0` | only finite-index `ℂ`-submodule is `ℂ`: no separated system | Retain finite quotients; shift on `∏𝔽₂` has no stable cofinal system. |
| 0a.11 profinite projector | `ℤ₃`, `U = 3` | `v₃(3^{n!}) = n! → ∞`, `e = 0` | `3^{n!} ≠ 0` for each `n` | Retain limit, no uniform threshold. |
| 0a.12 decomposition | `ℤ₅²`, `U = (1 1; 0 5)` | `U(1,0) = (1,0)`; `U(1,4) = (5,20) = 5·(1,4)` | `eM = ℤ₅(1,0)`, `(1−e)M = ℤ₅(1,p−1)` | Retain; `U` not nilpotent on `(1−e)M`. |
| 0a.13 naturality | `×3` on previous example | `(×3)e(x,y) = (3x,0)` | `e(×3)(x,y) = (3x,0)` | Retain continuous intertwiners. |
| 0a.14 complete local | `𝔽₂[[t]]`, `U = diag(1,t)`; `ℂ`, `U = 2` | `e = diag(1,0)`, `v_t(t^{n!}) = n!` | `2^{n!}` does not converge over `ℂ` | Retain maximal-ideal filtration, finite residue field. |
| 0a.15 profinite exactness | split `ℤ₃ → ℤ₃² → ℤ₃`, `U = 1` | ordinary sequence unchanged at each level | limit exact by finite fibres (cofiltered-system lemma: no countability needed) | Retain compactness via finite kernels. |
| 0a.16 complexes | `R² → R²`, `d = diag(0,1)`, `U = diag(1,0)` | `eC = (R —0→ R)`, `H⁰ = H¹ = R` | `eH⁰(C) = eH¹(C) = R` | Retain degreewise commuting differential. |
| 0a.17 perfect splitting (Lean) | `C = ℤ₅²[0]`, `U = (1 1;0 5)` | `e = (1 −1/4; 0 0)`; `e² = e`, `eU = Ue = e`; `e ∈ ℤ₅[U]` as the limit of `U^{n!}` whose upper-right entry `(1−5^m)/(1−5) → 1/(1−5) = −1/4` | `D = ℤ₅[0]`, `ι = (1,0)ᵀ`, `π = (1,−1/4)`, `ι∘π = e`, `π∘ι = 1` | Retain non-diagonal test; `t = 0` gives `e = 0`, `D = 0`. |
| 0a.18 coefficient tower | `R_n = ℤ/3ⁿ`, `U = diag(1,3)` | all `e_n = diag(1,0)`, compatible | limit `F_∞ = ℤ₃[0]`, rank 1 | Retain ordinary-cohomology compatibility, Chevalley cofinality. |
| 0a.19 local finiteness (Lean def) | `I = 0`, `M = 𝔽₂[X]`, `T = ×X` vs `T = 1` | orbit of 1 spans `{1,X,X²,…}`: not finitely generated | `T = 1`: span `{1}` | Definition separates the non-example; `I = ⊤` is vacuous but never used. |
| 0a.20 extensions (Pilloni Rem. 2.1.1) | `M₂ = ∏ℤ₃`, `T(a) = (0,3a₀,9a₁,…)`, `M₁ = ∏3^{i(i+1)/2}ℤ₃` | `T ≡ 0 mod 3` on `M₂`: locally finite | on `M₁` in coordinates `b_i`, `T` is the shift: orbit of `b₀` independent mod 3 | Retain bounded-torsion hypothesis in (3). |
| 0a.21 detection mod `m` | shift vs `diag(1,3)` on completed `ℤ₃^{(ℕ)}` | shift mod 3 not locally finite | `diag(1,3) ≡ diag(1,0)` mod 3, locally finite | Retain criterion both ways. |
| 0a.22 locally finite projector (Lean) | completed `⊕ℤ₃e_i`, `T e_i = 3ⁱ e_i` | `T^{n!}e₀ = e₀`; `T^{n!}e_i` has valuation `i·n!` | `e =` projection to `ℤ₃e₀`; `e² = e`, `T` bijective on `ℤ₃e₀`, `T^k e_i → 0` on the kernel | Retain pointwise limit; no `N` with `T^{N!} = e` (coordinate `i = 1` has `T^{N!}e₁ = 3^{N!}e₁ ≠ 0`). Uniqueness: a competing idempotent must agree with the limit. |
| 0a.23 functoriality | `3ℤ₃ → ℤ₃`, `T` a unit | both ordinary parts everything | cokernel `ℤ/3` is its own ordinary part | Retain. |
| 0a.24 complete flat complexes | identity disk `R→R`, `T = 1` | termwise `e = 1`, `H* = 0` | Pilloni Prop. 2.3.1: locally finite on `H*(M ⊗ᴸ k) = 0` trivially | Retain derived reading. |
| 0a.25 derived independence (Lean) | `C₀ = ℤ₃[0]`, `C₁ = ℤ₃[0] ⊕ (ℤ₃ —1→ ℤ₃)`, `T₀ = 1`, `T₁ = (1, 3)` | `e₀ = 1`, `D₀ = C₀`; `e₁ = (1,0)` since `3^{n!} → 0` on the disk, `D₁ = ℤ₃[0]` | `α`: inclusion, a quasi-isomorphism intertwining `T`; `Q(ι₀) α Q(π₁) = id` on `ℤ₃[0]` | Retain; `D₁` perfect as predicted; zero complexes give the zero case. |
| 0a.26 semilocal | `R = 𝔽₃[[t]] × 𝔽₅[[s]]`, `U = (1, s)` | `e = (1, 0)` | component ranks (1, 0): projective, not free | Retain componentwise statement. |
| 0.1 Katz functions | `E₄` over `ℤ/25`; `Δ` over `ℤ/5` | `240 ≡ 15 mod 25`, `E₄ ≡ 1 mod 5` | `Δ = q + q² + 2q³ + … ≠` constant mod 5 | Retain `q`-expansion principle with flat cokernel. |
| 0.2 divided congruences | `p = 5`, `D = (E₄−1)/5`, `γ = 6` | `6⁴ = 1296`, `D|γ − D = (1295/5)E₄ = 259E₄ ≡ 4·1 mod 5` | `D ∈ D₄^M(1;ℤ₅)` since `48Σσ₃qⁿ` is integral | Retain saturated lattice, not sums of integral weight spaces. |
| 0.3 Hecke/weight action | `f = q + 2q⁵`, `z = 6` on weight 4 | `U₅ f = 2q`; `V₅U₅ q ≠ U₅V₅ q` | `6⁴ = 1296` scalar; weight 0 trivial | Retain `a(n, f|U_p) = a(np, f)`. |
| 0.4 universal Hecke | `N = p = 11`, `S₂(Γ₁(11))` | image `ℤ₁₁`, `U₁₁ = a₁₁(11a) = 1` | `N = p = 5`: `S₂ = 0`, zero ring | Retain integral continuity and cusp/full distinction. |
| 0.5 ordinary idempotent | `Δ`, `p = 11`; `p = 2` | `τ(11) = 534612 ≡ 1 mod 11`: unit root | `X² + 24X + 2048`: `v₂` of coefficients 3, 11, slopes 3 and 8 > 0 | Retain refinement at 11; both pieces killed at 2. |
| 0.6 duality | `Δ`, `E₄Δ` at `p = 5` | `(E₄Δ − Δ)/5 = 48(Σσ₃qⁿ)Δ` integral | weight-12 projection has `a₁ = −1/5` | Retain lattice duality; constants removed on the full side. |
| 0.7 `Λ` and weights | `p = 5`, `u = 6` | `P₂ = X − 35`, `v₅(35) = 1`; `P₅ = X − 7775`, `v₅(7775) = 2` | `P₂ ≡ P₀ mod 5` but `P₂ ≠ P₀` | Retain weight congruence depth `m+1`. |
| 0.8 Jochnowitz | `p = 5`, `k = 8` | `S₁₂/S₈ = ⟨Δ⟩`; `τ(5) = 4830 ≡ 0` | `U₅Δ ≡ 0 mod 5` | Retain `k ≥ 3`. |
| 0.9 bounded weights | `p = 5` | `j(a) = 4, 5, 6, 3` for `a = 0, 1, 2, 3` | all in `[3, 6] = [3, p+1]` | Retain endpoint `p = 5` as a target. |
| 0.10 finite over `Λ` | `Λʳ`, `r = 0, 1, 2` | fibre dimensions `0, 1, 2` | generators `0, 1, 2` | Finiteness, no rank claim. |
| 0.11 control | `Λ/P₂ = ℤ₅` | inverse diamond `6²/(1+35) = 36/36 = 1` | forward `[6]_w = 36` | Retain coordinate transport `u²(1+X)⁻¹`. |
| 0.12 Eisenstein family | `p = 5`, `ψ = 1`, `k = 4` | `a₂ = 1 + 2³ = 9`; constant `(1−125)·(1/120)/2 = −31/60` | unstabilised `1/240`; `k = 2` inducing character `ω⁻² ≠ 1` | Retain stabilisation and inverse-coordinate weighting. |
| 0.13 specialisation | `Δ`, `p = 11`, `N₀ = 2` | `h = (1 − β₂V₂)Δ`, `a₂(h) = −24 − β₂ = α₂` | `α₂β₂ = 2¹¹ ≠ 0` so `α₂ ≠ −24` | Retain tame oldspace data. |
| 0.14 `q`-expansion duality | `I = Λ[ε]/ε²` | `εqⁿ` pass pointwise classicality | infinite span ≠ finite Hecke dual | Retain Hom definition for non-reduced `I`. |
| 0.15 components | `Λ × Λ` | idempotents `(1,0)`, `(0,1)` | product 0, sum 1 | Retain branches; count tested with `d = 1`. |
| 0.16 compactness | `∏ℤ₃` vs `ℚ₃` | `∏ℤ/3ⁿ`, limit `∏ℤ₃` | `ℚ₃/3ⁿ = 0`, limit 0 | Retain profinite hypothesis. |
| 0.17 odd-prime control | `11a1` at `p = 3`; `p = 2` | `a₃ = −1` unit, ordinary | `(1 ± ι)/2` needs `1/2 ∉ ℤ₂` | Retain `p` odd, separate `p = 3` construction. |
| 1.1 symbol tower | rank-one system, traces `×p` | `(1,1,…)` not compatible | identity traces: compatible | Retain trace maps. |
| 1.2 control | `ω_{2,k}` at `p = 3` | exponent `3^{2−1} = 3`; roots `u^k ζ`, `ζ³ = 1` | order-3 characters trivial on `1+9ℤ₃` | Retain finite characters. |
| 1.3 period line | `Λ = O[[X]]`, `I = (π, X)` | generic rank 1, fibre dimension 2 | free rank one: fibre dimension 1 | Retain multiplicity-one input. |
| 1.4 trivialisations | `θ′ = 2θ` over `ℤ₅` | basis `θ′⁻¹(1) = e/2` | measure `×2` | Retain opposite transformation rules. |
| 1.5 measure | `U_p{∞,a/pʳ} = Σ_b{∞,(a+bpʳ)/p^{r+1}}` | `μ(a+pʳℤ_p) = Σ_b μ(a+bpʳ+p^{r+1}ℤ_p)` after `U_p^{−r−1}` | without `U_p^{−r}` the identity fails | Retain normalisation. |
| 1.6 specialisation | `δ₆`, `j = 2` | specialise then moment: 36 | moment then specialise: 36 | Retain commuting with the chosen period. |
| 1.7 congruence module | `A = {(a,b): a ≡ b mod pⁿ}`; `ℤ/4 → ℤ/2`; `O[t]/t²`; `O[[t]]/(ϖ²t)`, `M = A/ϖ³` | `𝔭 = 0×pⁿℤ_p`, `I = pⁿℤ_p×0`, `Ψ = ℤ/pⁿ`; `Ann(2) = (2)`, `Ψ` has 2 elements; `I = 𝔭 = (t)`, `Ψ = O`; `I = (ϖ²)`, `M[𝔭]+M[I]` has constant term in `ϖO/ϖ³` and all `t`-terms, `Ψ = O/ϖ` | IKM `Ψ_A(M) = 0` in the last case | Retain finite-length hypotheses and the depth-zero distinction. |
| 1.8 congruence ideal | `A = O[x]`, `λ` evaluation at 0 | `Ann(x) = 0`, `Ann(0) = A ≠ (x)` | `η = 0`, `Ψ(A) = A/(0 + A) = 0` | Retain minimal-prime hypothesis. |
| 1.8a ordered witness | split unramified, values `1, −1` at `p = 3` | residual values `1, 2 ∈ 𝔽₃` | swapping changes the prescribed `U_p` eigenvalue | Retain ordering; Diamond's theorem not read (below). |
| 1.9 `T_Σ` | `Σ = ∅`; `Σ ⊂ Σ′` | `N(𝔞) = N(ρ̄)`, `T(𝔞) = T(𝔞)°` | surjection `T_{Σ′} → T_Σ` (EPW line 888) | Retain variance; source misprint below. |
| 1.10 branch congruences | `T_Σ = {(x,y): x ≡ y mod f}` | `Ann((0,f)) = (f,0)`, `η = fΛ` | `Ψ = Λ/f` | Retain raw-annihilator computation. |
| 1.11 period change | `θ′ = 2θ` | `L_{θ′} = 2L_θ` | basis `/2`; unit at every `℘` | Retain unit ambiguity. |
| 1.12 branch L-functions | `E_ℓ(𝔞,X) = 1 − a_ℓX + D_ℓℓ⁻¹X²` | EPW Definition 2.8.1 (line 1001–1004) literal; at weight `k` our diamond is `ε(ℓ)ℓᵏ` so `D_ℓℓ⁻¹ = ε(ℓ)ℓ^{k−1}` | weight-two-normalised diamond would give `ε(ℓ)ℓ^{k−3}`: wrong | Retain the README's weight action (line 115); `[ℓ]_cyc` distinct from `D_ℓ`. |
| 2a.1 spectral hypersurface | `φ = 0`; `φ = (1 1;0 1)` | `det = 1`, empty | `(1−T)²`, non-reduced | Retain reciprocal coordinate and nilpotents. |
| 2a.2 preparation | `F = (T − 1/5)(−5)` on the unit disc over `ℚ₅` | `= 1 − 5T`, unit, inverse `Σ(5T)ⁿ` | `T − a` with `|a| ≤ r`: degree one | Retain supplier hypotheses; `(1,p)` on `ℚ_p×ℚ_p` not multiplicative. |
| 2a.3 constant rank | `1 − uT` over `K⟨u⟩` | fibre length 1 off `u = 0`, 0 at `u = 0` | not finite over the whole disc | Retain locally constant rank. |
| 2a.4 Newton loci | `(1−T)(1−5T)` over `ℚ₅` | degree in `|T| ≤ 1`: 1 | degree in `|T| ≤ 5`: 2 | Retain radii. |
| 2a.5 strict neighbourhood | `P = 1 + uT`, `V = {|u| = 1}`, `d = 1` | `n = 0` condition gives `|u| ≥ e^{−dγ₁}` on `X` | without it, points with `|u| < s⁻¹` have empty fibre | Retain the `n = 0` inequality. |
| 2a.6 admissible cover | `P = 1`; two-root `P` | empty cover | two blocks | Retain empty case. |
| 2a.7 block polynomial | `φ = (a 1;0 a)`, `a` a unit | `Q = (1−aT)²`, `N = M` | selecting one copy: resultant 0 | Retain whole block. |
| 2a.8 Hecke image | `A²`, `φ = diag(1,2)`, char. 0 | image `A × A`, rank 2 | `End = A⁴` | Retain image algebra. |
| 2a.9 gluing | identical rank-one charts on a triple overlap | transitions `id`, cocycle `id` | spectral coordinate `a⁻¹` on all | Retain. |
| 2a.10 base change | `N = A²`, `A = K⟨u⟩`, `t = ((0,u),(0,0))`, specialise `u = 0` | `A[t]/t²` rank 2 | image on `N ⊗ K` is `K`: kernel `(t)` | Retain flatness for equality. |
| 2a.11 links | `U = a`, `α = id`, `c = U` | `αc = cα = U` | determinants equal `1 − aT` | Retain link identities. |
| 2a.12 weight space | `W` a point; constant family | one `(Pr)` module | `D_pt × W` | Retain. |
| 2a.13 points | eigenvalue 5 | coordinate `1/5`, `Tφ = 1` | coordinate 5: `Tφ = 25` | Retain reciprocal. |
| 2a.14 dimension | `A × A` over `K⟨u⟩`; `A/(u)` | components of dimension 1 | `A/(u)`: dimension 0, torsion | Retain torsion-freeness. |
| 2a.15 complex hypersurface | identity disk, `Ũ = (a,a)` | `P̃ = (1−aT)²` | zero model: 1 | Representative-dependent by design. |
| 2a.16 intrinsic support | identity disk; `K²[0]`, `U = 1` | annihilator support empty; `(1−T)` | `P̃ = (1−T)²` | Retain annihilator definition. |
| 2a.17 eigenmodule sheaf | `B = K[t]/t²` regular | generalised eigenspace dimension 2 | residue fibre dimension 1 | Retain localisation, not `⊗ κ(x)`. |
| 2.1 distributions | `p = 3`, weight 1, `γ = (1 0;3 1)`, `δ₁` | `(δ₁|γ)(1) = (1+3)·1 = 4` | multiply after transform: `(1+2·3)/(1+3) = 7/4` | Retain multiplication before the weight-zero action. |
| 2.2 family symbols | `T: K⟨T⟩ → K⟨T⟩`, specialise `T = 0` | kernel 0 before | kernel `K` after | Retain compact-support argument, `E₂` cokernel. |
| 2.3 finite slopes | `U = diag(1,5)` | slopes 0, 1: rank `≤ 0` is 1 | rank `≤ 1` is 2 | Retain non-strict bound. |
| 2.4 local pieces | Jordan block | `K[t]/t²`, length 2 | reduced: length 1 | Retain nilpotents; `N = 32`, `p = 3`: `a₃ = 0`, slopes 1/2. |
| 2.5 nilpotent kernel | 2a.10 model at `u = 0` | `K[t]/t² → K`, kernel `(t)`, `t² = 0` | same point set, different rings | Retain. |
| 2.6 eigencurves | `u = t²` chart | degree 2 over weight | fibre `K[t]/t²` | Retain global gluing with the `E₂` correction. |
| 2.7 sheaf | `B = K⟨t⟩`, `u = t²` | rank 1 over `B`, 2 over `A` | fibre dimension 2 | Retain two rank notions. |
| 2.7a cuspidal comparison | split `full = M ⊕ boundary`, localise away from boundary | full: `M` | cuspidal: `M` | Retain non-Eisenstein localisation; the length-two `E[t]/t²` module is compared, not points. |
| 2.8 classicality | `k = 0`, slope 0 vs 1; `p = 5`, `a⁵ = 6`, `|u − a| ≤ 5⁻²` | `0 < 1`; `v₅(log u) = v₅(log 6/5 + log(1+ε)) = 0` since `v₅(log 6) = 1`, `v₅(ε) ≥ 2` | algebraic weights have `v₅(log u) ≥ 1` or `log u = 0` | Retain strict bound and the global density route. |
| 2.9 étale freeness | `u = t` vs `u = t²` | lengths 1, 2 | differentials 1, 0 | Retain étale hypothesis. |
| 2.10 CMB comparison | `E` vs `E[ε]/ε²` | same points | different generalised eigenspaces | Retain reduced spaces only. |
| 3.0 preferred Eisenstein | `E₂(χ,χ)`, `χ` quadratic mod 3, `p = 5` | `χ(5) = χ(2) = −1`: roots `−1, −5`; ratio `χ_cyc` | `H¹_f(ℚ,ℚ₅(1)) = ℤ^× ⊗ ℚ₅ = 0`: extension space 0, not 1 | Exclusion required (source issue below); zero class split. |
| 3.1 criticality | `a_p = 0` | slopes `(k+1)/2` each | neither critical slope | Retain three notions. |
| 3.2 equivalences | `E₄` at `p = 5`, roots 1, 125 | ordinary refinement has constant `−31/60 ≠ 0` | `θ³` images have constant 0 | Retain: ordinary Eisenstein refinement not θ-critical. |
| 3.3 critical-slope forms | `E₄`, `p = 5` | `v(1) + v(125) = 3 = k+1` | unique critical-slope refinement | Retain (Bellaïche Prop. 2.14, lines 743–755). |
| 3.4 decency | `(ad ρ_f)^∨(1)`, cuspidal weight `k+2` | scalar summand `E(1)`: `φ = p⁻¹`; nonscalar summands: `p⁻¹·(root ratios)`, complex absolute values `p⁻¹` and `p⁻¹·1` by purity (`|α| = |β| = p^{(k+1)/2}`) | no eigenvalue 1, so `D_cris(…)^{φ=1} = 0` | Retain `H¹_f = H¹_g` for every cuspidal newform; a general crystalline `V` with `D_cris(V^∨(1))^{φ=1} ≠ 0` is outside the claim. |
| 3.4a finite-slope periods | `T_x/I = E[ε]/ε²` | period free of rank one over dual numbers | residue-only: insufficient | Retain Artinian statement. |
| 3.5 smoothness | `K[[t]]`, `u = t²` | regular, dimension 1 | `e = 2`, not étale | Retain smooth ≠ étale. |
| 3.6 theta sequence | `k = 0`, `μ(1) = 0`, `μ(zⁿ) = 1` | preimage moments `1/(n+1)`, unbounded on `n = pᵃ − 1` | bounded on `D[1]`: fails | Retain dagger model. |
| 3.7 rank one | `e = 1, 2` in `K[t]/tᵉ` | dimensions 1, 2 | residue fibre 1 | Retain decent-point rank one. |
| 3.8 generalised eigenspace | `u = tᵉ`, `e` prime to `p` | `T/(u) = K[t]/tᵉ`, socle `t^{e−1}` | socle dimension 1 | Retain tame normal form at henselian points. |
| 3.9 critical eigensymbols | `e = 2` | socle `t·φ` maps to 0 mod `t` | `e = 1`: image the classical line | Retain (Corollary 4.8). |
| 3.10 critical L-function | `k = 1`, `s = +` | `(μ|₁ι)(f) = −μ(f(−z))`; nonzero only if `σ(−1) = −1` | even `σ`: 0 | Retain sign dictionary `s_B = s(−1)^k`. |
| 3.11 vanishing | `(k+1)`-st derivative on `zʲ` | `0` for `j ≤ k` | `(k+1)! ≠ 0` at `j = k+1` | Retain range and characteristic zero. |
| 3.12 infinitely many zeros | slopes 0 and `k+1`; `log(1+T)` | difference `(n+1)(k+1)` unbounded | distinguished degrees bounded; `log` has zeros at `ζ_{pⁿ}−1` | Retain unequal-slope lemma including slope 0. |
| 3.13 two variables | `e = 2`, `Ψ = 1⊗t + t⊗1` | `(t⊗1 − 1⊗t)Ψ = t² − t² = 0` | specialise second factor at 0: `t`, the eigenvector | Retain diagonal construction. |
| 3.14 secondary functions | `L = a₀ + a₁t + a₂t²`, unit `(1+ct)` | coefficients `a₀, a₁ + ca₀` | flag invariant, coefficients not | Retain flag only. |
| 4.0.1 zeta classes | `c = 5`; `k = 2`, `r = 1`, `ℓ ∤ N` | order `c² − 1 = 24` at 0, simple poles at nonzero 5-torsion | `1 − A_ℓ/ℓ + B_ℓ/ℓ` vs `1 − A_ℓ/ℓ` for `ℓ | N` | Retain normalisation and both conductor cases. |
| 4.0.2 reciprocity | `p ∤ MN`, `r = 1`, weight 2 | quadratic factor with `p⁻¹` twice | interchange of units negates both sides | Retain order and `p`-powers. |
| 4.0.3 bound | DVR, `z = π³`, local term length 1 | `length(H¹/Oz) = 3 ≤ 3 + 1` | `z = 0`: non-torsion | Retain nonzero class and exceptional term. |
| 4.1 big representation | `det T̃ = χ⁻¹χ̃²χ̃′⁻¹` (ochiai line 136) | `T = T̃ ⊗ ωⁱ`: `det = χ⁻¹χ̃²χ̃′⁻¹ω^{2i}` | `χχ̃′` without dual fails | Retain normalisation bridge. |
| 4.2 ordinary line | `F⁺ = χ̃α̃ωⁱ`, `det` as above | `char F⁻ = χ⁻¹χ̃χ̃′⁻¹α̃⁻¹ωⁱ` | lattice `pO ⊕ 0`: quotient has `p`-torsion | Retain saturation; arithmetic unchanged. |
| 4.3 Selmer groups | trivial conditions | `H¹(ℚ_S/ℚ, A)` | Greenberg smaller | Retain Proposition A hypotheses `(F)`. |
| 4.4 Selmer complex | `[O —π³→ O]` in degrees 1, 2 | `H² = O/π³`, length 3 | inverse determinant divisor `+3` | Retain sign convention (R02 for the locator). |
| 4.5 Euler system | `C₂`, `P(X) = 1 − aσ + bσ²`, `a = 1, b = 0` | `P(σ) = ((1,−1),(−1,1))` | scalar replacement fails | Retain geometric Frobenius in the group ring. |
| 4.6 big logarithm | `M = ℤ_p` trivial | `D = ℤ_p`, `φ = 1`, kernel `ℤ_p` | image in `I⁻¹Λ`, pole possible | Retain KLZ Theorem 8.2.3 scope. |
| 4.7 reciprocity | `j = 1`, `a_p = 2`, `i = 0`, class `π³` | Euler factor `1 − 1/2 = 1/2`; length 3 = `ord(π³)` | `a_p = 1`: factor 0 | Retain Theorem B formula literally (ochiai lines 277–283). |
| 4.8 divisibility | `v_𝔭(P_τ) = 2`, `k = 3` | defect 6 | bound `n`, not `n + 6`, would be false | Retain fixed `P_τ^k` (Theorem C, lines 310–331). |
| 4.9 Coleman regulator | `α = p`; `α = 1` | `‖α⁻¹‖ = p > 1`; `α − 1 = 0` | hypotheses fail as stated | Retain restrictions; `E₄` excluded (not cuspidal). |
| 5.1 weight algebra | `F = ℚ`; real quadratic | `δ = 1`, variables `1 + 1 = 2`; `1 + 2 = 3` | `rank Z(U) = d − (d − 1 − δ_Leopoldt) = 1 + δ` | Retain. |
| 5.2 quaternionic projector | constants at `U(pᵃ)`, `a ≥ 1`; `a = 0` | `T₀(𝔭)` eigenvalue `N𝔭`, `(N𝔭)^{n!} → 0` | `N𝔭 + 1` a unit at `a = 0` | Retain positive level. |
| 5.3 Hecke algebra | constants ⊕ ordinary line | `eT` acts on the line only | keeping constants: wrong algebra | Retain (sw p. 34). |
| 5.4 level stability | `F = ℚ(√5)`, `p = 5 = π²·unit`, `a = 2` | `diag(1,π)(1 0;π² 1)` has entry `π³ ∉ (π⁴)` | `g = diag(1,p)`: conjugates `(1 0;pᵃx 1) ∈ K₀(pᵃ)` | Retain rational `p` in `T₀(p)`. |
| 5.5 duality | `ℚ₃/ℤ₃`; `ℤ/9` | duals `ℤ₃`; `ℤ/9` | algebraic `CharacterModule` ≠ topological dual | Retain continuous duality interface. |
| 5.6 freeness | `O[G]` with `G = Δ × ℤ_p`, `Δ` prime-to-`p` cyclic | ordinary summand with ranks `r_χ` depending on `χ` | free over `O[[G]]` only if all `r_χ` equal | Retain the roadmap's projective statement (source issue below). |
| 5.7 finiteness | `(π, T) ⊂ O[[T]]` | torsion-free rank 1, fibre 2 | free: fibre 1 | Retain: finiteness without freeness. |
| 5.8 control | `Sym¹`, `U = diag(1,5)` | kernel `Y` with `U^n Y = 5^n Y ≠ 0` | zero ordinary factor mod `5^m` | Retain integral contraction. |
| 5.9 density | `ζ_{pⁿ} − 1`; `ε² = 0` | infinitely many distinct kernels | `ε` invisible at points | Retain reducedness in §5.12. |
| 5.9a expansions | differential scaled by `x`, weight 5 | factor `Norm(x)^{−5}` (DR (5.2), line 1396) | covariant `Norm(x)^5` wrong | Retain direction. |
| 5.10 Λ-adic Hilbert forms | `F = ℚ`, `p = 5`, odd `χ` mod 3, `f = E + 5⁴E(5z)` | `B_{5,χ} = 81(B₅(1/3) − B₅(2/3)) = −10/3`, `L(χ,−4) = 2/3`, standard constant `626·(1/3) = 626/3 ∈ ℤ₅` | cusp `1/3`: `E(5z)|γ = −5⁻⁵E((z+2)/5)`, constant `1/3 − 625/(3125·3) = 1/3 − 1/15 = 4/15 ∉ ℤ₅` | Retain both lattices and `C`; `ν₁(T) = 6⁰ − 1 = 0`. |
| 5.11 expansions | two-component `(0, f)` | all-component list contains `a₁ = 1` | first component only: 0 | Retain every component. |
| 5.12 reducedness | `Λ × Λ` vs `Λ[ε]/ε²` | nilradical 0 | `ε ≠ 0` invisible at field points | Retain minimal-level input (dkv line 954). |
| 5.13 total fractions | `Λ × Λ` | `Frac(Λ) × Frac(Λ)` | `(1,0)` a zero divisor | Retain nonzerodivisor localisation. |
| 5.14 period modules | `T`, `T³`, `(π,T)` | generic ranks 1, 3, 1; last fibre 2 | only the first is invertible | Retain explicit rank-one hypothesis. |

Every Check I evaluated agrees with the theorem of its section and with the other Checks on the same object; the worked examples (Layers 0a, 0, 1, 2a, 3, 4, 5) agree with the targets they illustrate. No false identity, vacuous quantifier or convention conflict was found; the two cross-roadmap conventions touched here (the weight-two inverse-diamond coordinate of IntegralIwasawaTheory §9.0 and the `k−1` Hilbert weight coordinate of NoncommutativeAndEquivariantIwasawa §F.5) are transported explicitly at README lines 115–117 and 2890–2891.

## Not verifiable

- **Dasgupta–Darmon–Pollack, Definition 3.1 and Proposition 3.2, pp. 471–472** (cited in §§5.9a–5.10): the sources service found no legal copy (Annals landing page without an open PDF; the Annals `wp-content` pattern and the McGill author page returned 404; not in the operator's cache). The entry stays in the job's `needs-references.toml`. DKV §3.1 and NoncommutativeAndEquivariantIwasawa §F.5, which restate the coordinate set, were read instead.
- **Bellaïche, later author version (2011)**, §§3.1.2–3.1.4, Lemma 3.3, Definition 3.4, Proposition 3.6, Lemmas 3.7 and 3.9, Theorem 3.10, Corollary 3.12, Theorem 3.27 (cited in §§2.1, 2.2, 2.3, 2.7a, 2.10): not in the cache and not fetched this round; the previous review reported the Brandeis host unreachable. The weight-zero negative-sign `E₂` cokernel and the nice-chart potential orthonormalisability are therefore checked only against the arXiv v1 text and by the algebraic tests above.
- **Diamond, The refined conjecture of Serre, Theorems 1.1 and 6.4** (§1.8a), **Wiles 1995, Theorem 2.1** (§1.3), **Hida 1986 Inventiones, 1988 Amer. J. Math., 1988 Annals, 1989 nearly ordinary** (§§0.17, 1.2, 5.6, 5.8, 5.12), **Coleman 1996, Breuil–Emerton, Bellaïche–Chenevier** (§3.2), **Kisin Proposition 8.7** (§3.4a), **Liu's triangulation and Andreatta–Iovita–Stevens** (§4.9), **Coleman–Mazur §5.1** (§3.4a): cited through EPW, Bellaïche, SW and LZ, whose quotations I read; the primary texts were not opened this round.
- **Skinner–Wiles, the `+` superscripts in the definitions of `M_∞`, `M⁺_∞`, `H_∞`, `H⁺_∞` (p. 35)**: the Numdam OCR layer drops superscripts, so the assignment of the adjoint action in §5.5 was checked for internal consistency (dual of the pullback tower along traces carries the adjoint action), not against the printed symbols.
- **Kato §§9–11, 15, 17** (§4.0): only Proposition 8.7 and Theorems 12.4–12.5 were located; the long reciprocity proof was not re-read.

## Source issues

- **Error** in bellaiche09 at Lemma 2.11 proof, p. 17: the source says the nebentypus is nontrivial when `k = 0` because `E₂` does not exist, and infers a one-dimensional crystalline extension space; it should exclude the weight-two newforms `E₂(χ,χ)` of level `cond(χ)²` with trivial nebentypus, for which the ratio is cyclotomic and the extension space is `ℤ^×⊗ℚ_p = 0`; affects a stated result (the preferred representation does not exist for those forms; the roadmap's standing hypothesis `χ₁χ₂⁻¹ ≠ χ_cyc` repairs it).
- **Misprint** in bellaiche09 at Lemma 2.11 proof, p. 18: the source says the extension is defined by a nonzero element of `Ext¹_f(χ₂,χ₂)`; it should be `Ext¹_f(χ₂,χ₁)`; affects nothing.
- **Gap** in bellaiche09 at Theorem 2.16 proof, p. 21: the source says the local ratio `χ₂χ₁⁻¹` cannot be cyclotomic because that would force weight two and level one; for tame level `N` the exclusion instead follows from the Ramanujan bound, since `β = pα` with `αβ = ε(p)p` gives `|a_p| = (1+p)|α| = 1+p > 2√p`; affects the proof.
- **Gap** in sw at Proposition 3.3 proof, printed p. 36: the source says it suffices to prove freeness and the rank formula over `O[[G(U_a)]]` before applying `e`; the `e`-summand of a free `O[[G(U_a)]]`-module is only projective, and its ranks on the prime-to-`p` character factors differ in general (for `F = ℚ` Hida's `r(a)` depends on the component `a`), so freeness over `O[[G(U)]]` with the stated rank is not justified; the conclusion that survives is freeness over `Λ′` and Corollary 3.4; affects a stated result (the roadmap's §5.6 already treats the factorwise ranks as a target).
- **Misprint** in epw at §2.6, after Definition 2.6.3, p. 19 (epw line 894): the source says the surjection `T_Σ → T_{Σ′}` for `Σ ⊂ Σ′`; it should be `T_{Σ′} → T_Σ`, as on line 888; affects nothing.
