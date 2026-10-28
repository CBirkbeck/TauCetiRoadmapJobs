# Review of LocalFieldsRamification (pull request #617 at 9fe00eb)

**Verdict:** needs changes

## R01 (P1) — A wild step does not force noncommuting Herbrand functions

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:933`: “the two orders differ as soon as one step is wild.”

**Claim:** The two compositions necessarily differ whenever a step is wild.

**Witness:** Let K = ℚ₂, L/K be unramified quadratic, and M = L(√2). Then φ(L/K) = id and φ(M/L)(4) = 3. Both composition orders give 3, although M/L is wild.

**Repair:** Say that the order must be preserved and that the factors need not commute; delete the universal assertion. The displayed tower identities themselves have the correct order. Keep this unramified/wild tower as a negative control. If a noncommuting example is wanted, take M = ℚ₂(ζ₈), L = ℚ₂(√2): at 4 the correct composite is 9/4 and the reversed one is 2.

## R02 (P2) — Consume the pinned arithmetic and tame-Galois implementations

**Locations:** `TauCetiRoadmap/LocalFieldsRamification/README.md:405`, `:920`, `:1215`, `:1383`, `:1461`; `TauCetiRoadmap/LocalFieldsRamification/Suggested.lean:1680`, `:1721`, `:1867`, `:2005`.

**Claim:** Continuity/bundling of deep logarithms, Herbrand tower laws, local arithmetic invariance, wild inertia and the marked tame presentation remain constructions to develop here. The file builds its own wild-inertia, maximal-tame and presentation carriers.

**Witness:** At Tau Ceti a91d3aa, `WildInertia.lean:235,403,554` constructs wild inertia and proves its finite-level and Sylow descriptions; `Tame/Presentation.lean:398,437` constructs the marked equivalence and proves uniqueness.

These are paths under `TauCeti/NumberTheory/LocalField/`. Other definite overlaps are `DeepUnits/Basic.lean:70,117`, `DeepUnits/Coordinates.lean:70`, `Monogenic.lean:41`, `Eisenstein/TotallyRamified.lean:174`, `Eisenstein/PowerBasis.lean:148`, `Herbrand/Tower.lean:199,216,226`, `Herbrand/UpperQuotient.lean:264`, `Different/AlgEquiv.lean:74`, `Different/Hilbert.lean:91`, `Different/Wild.lean:90`, and `Discriminant/Basic.lean:251`. Several are already imported transitively and the one-tactic probes below close their purported targets.

**Repair:** Move the implemented mathematics to scope deferrals and exact supplier contracts; delete duplicate construction/proof targets. State genuinely new results directly on `TauCeti.wildInertiaSubgroup`, `maximalTameExtension`, `tameQuotient`, `IwasawaGroup`, the native positive-level character and their APIs. A different presentation of the same definition is not new ownership. Retain the genuinely additional general Hasse–Arf/Sen arithmetic and any genuinely additional coordinate formula after this audit. Test the replacement on the characteristic-two inseparable control and on the marked order-21 tame quotient below: the native fixed-field and marking APIs preserve both distinctions.

This is repairable updating of the existing roadmap, not a recommendation to discard or re-plan its programme. No second owner was established among the supplied sibling roadmaps; the decisive overlap is at the actual library pin.

## R03 (P2) — State the independent Sen arithmetic acceptance target

**Location:** `TauCetiRoadmap/LocalFieldsRamification/README.md:1155`: the lower-break list, Sen divisibility and upper-break integrality are deep targets, followed by “`hasseArf`, the only one of these stated in `Suggested.lean`.”

**Claim:** The new independent cyclic prime-power arithmetic theorem is part of the contract, but its Lean acceptance test is omitted without a missing-carrier explanation.

**Witness:** A scratch signature using the existing `TauCeti.IsLocalRing.lowerIndex : … → ℕ∞`, `Subgroup.zpowers`, `Module.finrank`, and integer divisibility elaborated with only its intended `sorry` warning.

**Repair:** Add the cyclic arithmetic headline on native carriers, including total ramification, residue characteristic p, degree pʳ, a generator, and the restriction j + 1 < r. One direct formulation takes b₀,b₁ with lower indices of σ^(pʲ), σ^(p^(j+1)) equal to b₀+1,b₁+1 and concludes p^(j+1) divides (b₁−b₀) in ℤ. Also make the promised complete-break-list statement explicit if retained as an independent headline. No new heavy carrier is necessary. On ℚ₂(ζ₁₆+ζ₁₆⁻¹), the lower breaks are 2,4, so 2 divides 2 and the upper breaks are 2,3; the README's abstract C₄ filtration with breaks 2,3 fails exactly this test. For r = 1 the difference range is empty. These witnesses test the added statement rather than an unrelated scalar implication.

## R04 (P3) — Delete padding from Suggested.lean

**Locations:** `TauCetiRoadmap/LocalFieldsRamification/Suggested.lean:513`, `:830`, `:1093`, `:1263`, `:1555`, `:1562`, `:1758`, `:1762`; also the closed API wrappers throughout Layers 0–3.

**Claim:** The file is an acceptance test, but contains definitional reductions, already-proved API results, elementary topology instances and admitted worked examples.

**Witness:** Twelve admitted declarations closed in a scratch copy with one tactic; the resulting copy elaborated successfully. For example `padicResidueFieldEquiv_residue` closes with `rfl`, and `coe_psiNat` with the identically named pinned theorem.

**Repair:** **Delete them from `Suggested.lean`**, leaving mathematical Checks in the README and native results in supplier contracts. Do not prove these in place. Delete the admitted `q3Sqrt3_finrank_and_totallyRamified` and `norm_four_not_mem_unitFiltration_two` worked examples and their example-only carrier/instance scaffolding. Their values, 2 = 2 and v₃(16−1) = 1 < 2, are valid README Checks. Remove the closed one-lemma wrappers and definitional statements such as `upperRamificationGroup_quotient` and `psiNat_eq_native` as well; their existing proofs are themselves witnesses. Keep only simple definitions actually needed to state retained headlines.

## R05 (P3) — Supply the required definition Checks and roadmap structure

**Locations:** `TauCetiRoadmap/LocalFieldsRamification/README.md:86`, `:273`, `:897`, `:1383`, and `:1542`.

**Claim:** The objects have sufficient discriminating tests and the README supplies the prescribed build structure.

**Witness:** The only explicit Checks block is at line 1161 (Hasse–Arf). Unit filtration, Herbrand functions, wild inertia and the Iwasawa constructions lack their own three-Check lists; the worked-examples section computes only the tame quadratic norm counterexample.

**Repair:** For every retained definition, supply at least three discriminating computed Checks and its API. For U(K,i), use ℚ₂ with U₀/U₁ of order 1, 5 ∈ U₂ but not U₃, and 2 ∉ U₀. For Herbrand, use the identity extension, an unramified extension, and ℚ₂(ζ₈) with φ(2)=3/2 and ψ(2)=3. Use the other computed controls below for retained objects. Add the opening Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layer subsections and per-layer Examples/Dependencies. Dependencies must be attached to each statement/route; preserve the explicit ordering of different/trace before the above-break norm. The existing API detail should be retained in prose rather than lost in this reshaping.

## R06 (P3) — Repair source records and obsolete locators

**Locations:** `TauCetiRoadmap/LocalFieldsRamification/README.md:226`, `:360`, `:689`, `:997`, `:1576`; no `sources.toml` is present in this folder.

**Claim:** The sources and supplier references identify the exact supporting results.

**Witness:** The References section names four books without editions/pages; many targets cite only chapters. `ClassFieldTheory.tateH` is absent on main, whose README line 646 explicitly uses native Tate cohomology instead.

**Repair:** Record each cited work once in `sources.toml`, including Fesenko–Vostokov, Serre's arithmetic book, O'Meara and LeanBridge as applicable; use precise result/section and printed-page locators at claims. Preserve `uncertified` status for inaccessible books. Replace `ClassFieldTheory.tateH` with the actual finite-Tate contract in that roadmap's Layer 0 and its Mathlib `tateCohomology` interface. Update links to completed `ProfiniteProPGroups`, `NumberFieldArithmetic` and `LocalGaloisGroups` to their actual main locations. The other six unresolved-name leads were resolved below; they are not missing declarations. Test these repairs by resolving every named object against the indicated main/head/pin, rather than substituting a remembered name.

## R07 (P3) — Remove process narrative and pull-request identifiers

**Locations:** `TauCetiRoadmap/LocalFieldsRamification/README.md:19`, `:1569`, `:1589`; `TauCetiRoadmap/LocalFieldsRamification/Suggested.lean:325`, `:393`, `:923`, `:1262`, `:1300`.

**Claim:** The specification and module comments are timeless mathematical documentation.

**Witness:** They discuss an “accepted roadmap”, “Material extracted from the former … portfolio”, “this PR”, and identifiers `#226` and `#191`. The supplied scanner nevertheless reports `prnum=0`.

**Repair:** State the present ownership directly, remove the history/contact-status narrative, and replace identifiers by roadmap name and exact section. Rewrite the module docstring as the headline acceptance-test statement, including any genuinely unstatable headlines. This is a manual style finding, not a reported gate failure.

## Verified sound

AI review by the independent reviewing agent. This is a comment-level verdict for human review, not an approval. The entire 1,609-line README and 2,143-line Lean file were read. The two files are the only changed files against `origin/main`; the requested head is exactly `9fe00eb9dfa5f3ff319f2c70042b435ca4310ae7`. Neither was edited. The main context is c9940702. The library checkout commits match the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The supplied gate reports every check zero and `OK`, including build, imports, sorry-data, set_option, outside-folder and dependency checks. An independent targeted `lake build TauCetiRoadmap.LocalFieldsRamification.Suggested` completed successfully (9,175 jobs). Direct `lake env lean` elaboration also succeeded, with 45 `declaration uses sorry` warnings and no other diagnostics. The description's count of 85 admissions is not the count at this head. No failed gate finding is being suppressed.

The requested dependency command produced exactly:

```text
depcheck: 162 roadmaps, 1176 edges, 0 problem(s)
```

Every Prerequisites block, supplier citation and dependency paragraph was read (this README uses Prerequisites rather than Needs). There is no UPWARD/CYCLE output. The ClassFieldTheory, NumberFieldArithmetic, MassFormula and LocalGaloisGroups mentions are consumers or scope boundaries, not reverse proof inputs. No declared gap was supplied. The Hasse–Arf route assigns the cyclic arithmetic and quotient-detection targets here, with arithmetic independent of the prime-degree norm-index results. The source citation does not itself make another roadmap a supplier.

All **199 named declarations** were queried with `#check @name` in one scratch copy. Comparison with the README found the standing finite/Galois/valuative hypotheses on `hasseArf`, the norm statements and tower identities, and the residue-characteristic equality on pro-p assertions. `wildInertia` retains K's valuation, topology and local-field instance. Exp/log retain the explicit local-field binders. `IsTotallyRamified` drops the unused base topology/local-field binders, while retaining the compatible algebra, finite degree and L's normalization; its arithmetic theorems carry both local-field hypotheses. No silent loss that falsifies a theorem was found. No submitted signature was changed.

The headline inventory is: finite-extension local structure and uniqueness; e·f = degree; deep-unit logarithmic structure and power classes; unramified existence/residue correspondence/norms; Eisenstein characterization and local monogenicity; upper quotient and tower compatibility; all five prime-degree graded-norm regimes and the at-break polynomial; cyclic prime-power break arithmetic and Hasse–Arf; local different/discriminant formulas; wild inertia/Sylow identification; tame character/Frobenius twist; and the marked Iwasawa presentation with its unramified coordinate. The file states Hasse–Arf and the marked presentation on genuine objects, without free-Prop stand-ins or sorry'd data. Most other listed headlines are implemented at the pin and should be cited (R02); the new Sen arithmetic is statable but missing (R03). The module does not identify any missing carrier that would justify that omission.

The source sample was **Suppliers** (README 1297) and **Contract audit** (1320). These are declaration contracts, not numbered textbook theorems: their proper locators are pinned files and declarations. The following were opened, including their assumptions:

| Contract | Pinned locator and content verified |
| --- | --- |
| Pro-p predicate | `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68`, `TauCeti.IsProP`; quantifies over open normal quotients. It does not itself include compactness or separation. |
| Sylow predicate | `TauCeti/Topology/Algebra/Group/Profinite/Sylow/Basic.lean:62`, `TauCeti.IsProPSylow`; closedness, pro-p and prime-to-p image index. |
| Existence/containment | `…/Sylow/Existence.lean:102`, `exists_isProPSylow`; `…/Sylow/Containment.lean:116`, `IsProP.exists_le_isProPSylow`; prime p and profinite topological hypotheses. |
| Normal uniqueness | `…/Sylow/Conjugacy.lean:48`, `IsProPSylow.eq_of_normal`; the normality and compact/totally disconnected hypotheses used in the companion are present. |
| Surjective transport | `…/Sylow/Functoriality.lean:52`, `IsProPSylow.map_of_surjective`; continuous surjection, compact source and Hausdorff target context. |
| Presentation | `…/Presentation/Basic.lean:210,219`, `presentedProfiniteGroup.hom_ext_of`, `existsUnique_lift`; equality on generators requires a Hausdorff target, descent requires killing relators. Closed normal closure is the defining relation subgroup. |
| Profinite integer coordinate | `…/ZHat/Basic.lean:125,154,163`, `zHat.hom_ext`, `lift_gen`, `existsUnique_lift`; the distinguished generator fixes the continuous map. |
| Algebraic/separable closure | `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:213`, `fixingSubgroup_fixedField`; closed subgroups of a normal extension, including the nonseparable ambient algebraic closure. Its proof uses the separable-closure restriction equivalence. |
| Native local-field carrier | `Mathlib/NumberTheory/LocalField/Basic.lean:46`, `IsNonarchimedeanLocalField`; extends valuative topology, local compactness and nontrivial valuation. A compatible uniformity is needed to read completeness as a `CompleteSpace` instance. |
| Deep logarithm | `TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean:117`, `deepUnitExpLogEquiv`; strict integer threshold e < (p−1)i and mixed-characteristic finite extension. |
| Prime-degree versus abelian integrality | `TauCeti/NumberTheory/LocalField/Herbrand/HasseArf.lean:137`, `UpperJump.exists_eq_intCast_of_finrank_prime`; this is only prime degree. It does not discharge the general abelian theorem. |
| Native jump/depth | `…/Herbrand/Jump.lean:42`, `UpperJump`; strict inclusion. `…/Herbrand/Basic.lean:508,514`, `psiNat`, `coe_psiNat`; the same floor used by the companion. |
| Above-break norm | `…/Norm/AfterBreak.lean:79,107`; actual norm-minus-trace congruence and graded bijectivity, prime degree and a genuine upper jump, with v > t. |
| Positive residue character | `…/UnitFiltration/RamificationGroup.lean:481,514,541`; the map, displacement formula and change of uniformizer. |
| Tame conjugation | `…/UnitFiltration/Conjugation.lean:186,211`; residue action, then its Frobenius-power specialization. |
| Maximal unramified field/Frobenius | `TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean:92,332`; union of finite unramified levels; Frobenius is the q-power lift, with separably closed ambient field for its full characterization. |
| Unramified coordinate | `TauCeti/NumberTheory/LocalField/Unramified/ZHat.lean:170,192`; topological equivalence carries arithmetic Frobenius to `zHat.gen`. |
| Inertia and restriction | `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99,159,191,218`; fixing subgroup, restriction homomorphism, quotient and its topological equivalence. |
| Frobenius-lift predicate/existence | Same file `:310,343`; equality of restriction to the chosen arithmetic Frobenius; existence follows from surjective restriction. |
| Free group/generators/lift | `TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean:60,74,124`; profinite completion of a discrete free group, canonical generators, lift to compact totally disconnected topological groups. |
| Presentation/generators/lift/congruence | `TauCeti/Topology/Algebra/Group/Profinite/Presentation/Basic.lean:87,104,154,318`; quotient by closed normal closure, lift killing the relators with T1 target, equivalence with both directions respecting relations. |
| Finite Galois levels and continuous restriction | `Mathlib/FieldTheory/Galois/GaloisClosure.lean:35` bundles finite dimension and Galois, not just normality; `Mathlib/FieldTheory/Galois/Profinite.lean:148` proves continuity of restriction to a normal intermediate field. |
| Separable intersection | `TauCeti/FieldTheory/Galois/FixedField.lean:245`; for algebraic E/K the fixing subgroup of E equals that of its intersection with the separable closure. |

Here `…` in the first group means `TauCeti/Topology/Algebra/Group/Profinite`; in the local arithmetic group it means `TauCeti/NumberTheory/LocalField`. R02 supplies further exact arithmetic/carrier locators. These are claims about the checked pins, not about a newer library.

The legal [author-hosted Fesenko–Vostokov second edition](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf#page=101) was fetched through the source service. `fesenko-vostokov` lines 4131–4189 locate III §4(4.3), printed pp. 91–92, and the unnumbered Sen proposition; lines 4192–4237 locate its proof on p. 93. The source treats complete discretely valued fields with perfect residue field; the roadmap's finite residue fields satisfy that assumption. Its h is the inverse-Herbrand convention, so the roadmap's upper-break sum uses φ = h⁻¹. The cyclic congruence input and product construction are present, and the roadmap correctly excludes the identity power from its finite break list. The extraction degrades some inequality glyphs, so no typographical erratum is inferred from those glyphs.

Ownership searches used the roadmap service's object searches and supplier display, main, the supplied open-head index, and board packages. Main `Completed/ProfiniteProPGroups/README.md:111` specifies no dependency back to this roadmap, and its Layers 0–3 supply the abstract theory; the imported definitions are native. `Completed/NumberFieldArithmetic/README.md:79,89,224` consumes local monogenicity and the same integer-indexed filtration. `TauCetiRoadmap/MassFormula/README.md:103,214,303` consumes the arithmetic and owns families, coordinates and measures. `Completed/LocalGaloisGroups/README.md:654,1084` owns the full-group rank. `TauCetiRoadmap/ProfiniteCohomology/README.md:1445,1463` supplies Kummer. `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1629,1783,2095` resolves the Euler characteristic, uniformizer reciprocity and unramified coordinate; its README 646 explains the obsolete tateH reference. Existing-main revisions returned by the index were not treated as new suppliers. No duplicate fully qualified companion declaration in a supplied sibling folder was established. MassFormula and ProfiniteProPGroups were also read as main-branch format examples.

The other three unresolved-name leads belong to the explicitly versioned external LeanBridge source, not Mathlib/Tau Ceti: `leanbridge` Ramification lines 137ff (`absoluteRamificationIndex_eq`), TraceFiltration lines 248ff (`intTrace_residue_scaling`), DiffExp lines 472ff (`differentExponent_tame`). All six named files were fetched from the author's repository at the quoted revision, scanned with zero sorry/axiom tokens, and the relevant declarations read. Basic, Ramification and DiffExp use the source's finite p-adic `PadicField` setting. Monogenicity lines 223–229 instead use finite DVRs with separable residue extension. TraceFiltration lines 62–69 and 248–252 use a finite torsion-free extension of Dedekind domains, a maximal p, a nonzero prime P above it, and pS = Pᵉ. The root LICENSE is Apache-2.0. This verifies source shape and those declarations, not a build of that external project or blanket portability to all characteristics.

All 45 admitted declarations received a one-tactic trial (rfl, simp, infer_instance, and an exact pinned lemma where identified). Twelve successes were then isolated in a second copy, which elaborated without errors or non-sorry warnings:

| Declaration in Suggested.lean | Successful one-tactic witness |
| --- | --- |
| `padicResidueFieldEquiv_residue` (513) | `rfl` |
| `card_squareClasses_natCastValuation` (830) | `exact TauCeti.card_squareClasses h2` |
| `herbrand_tower` (1060) | `exact TauCeti.LocalFieldsRamification.herbrand_tower K L M` |
| `inverseHerbrand_tower` (1072) | `exact TauCeti.LocalFieldsRamification.inverseHerbrand_tower K L M` |
| `coe_psiNat` (1093) | `exact TauCeti.LocalFieldsRamification.coe_psiNat K L n` |
| `psiNat_tower` (1101) | `exact TauCeti.LocalFieldsRamification.psiNat_tower K L M` |
| `exists_integerRing_adjoin_eq_top` (1263) | `exact TauCeti.exists_integerRing_adjoin_eq_top K L` |
| `differentExponent_eq_of_algEquiv` (1335) | `exact TauCeti.differentExponent_eq_of_algEquiv K L M e` |
| `discriminantExponent_eq_of_algEquiv` (1346) | `exact TauCeti.discriminantExponent_eq_of_algEquiv K L M e` |
| `differentExponent_eq_finsum_lowerRamificationGroup` (1356) | `exact TauCeti.differentExponent_eq_finsum_lowerRamificationGroup K L` |
| `inertia_compactSpace` (1758) | `exact isCompact_iff_compactSpace.mp (TauCeti.isClosed_inertiaSubgroup K).isCompact` |
| `inertia_totallyDisconnectedSpace` (1762) | `infer_instance` |

A failed one-tactic trial is not evidence that a statement is new. In particular, several remaining targets are library results behind different carriers or imports (R02). The two admitted Q₃ examples are padding independently of tactic success.

The adversarial table has **156 computed rows**. Q = ℚ₂; E = Q(√2); U/Q is unramified quadratic; C = Q(ζ₈); T = ℚ₃(√3); A = 𝔽₄((s))[π]/(π²+sπ+s), with ω²+ω+1=0. Values of additive valuations at zero are ∞, not 0; an infinite cardinal recorded with `Nat.card` is 0. “Pass” denotes the stated instance, not a formal proof of the general theorem. Aliases and identical restatements share the row for their mathematical statement. Where a new definition is recommended for deletion, the computations still audit its intended object.

| Statement / convention (README layer; Lean name where present) | Instances | Computed left / right or positive / negative control | Result / change |
| --- | --- | --- | --- |
| Local-field carrier and ℚp instance | ℚ₂, ℚ₃; trivially valued finite field; zero ring | residue sizes 2,3; trivial value group has no element of positive value; 0=1 prevents Field | Pass; excluded inputs cannot instantiate |
| Normalized valuation and its zero extension | Q: 2, 1, 1/2, 0 | additive 1,0,−1,∞; multiplicative canonical values exp(−1),1,exp(1),0 | Pass; keep minus-log convention |
| Valuation surjectivity | Q, n=−1,0,2 | v(2ⁿ)=−1,0,2=n | Pass; native |
| Kernel/unit equivalence | Q: 3 and 2 | v(3)=0 and 3 unit; v(2)=1 and 2 nonunit | Pass; native |
| Uniformizer equation | E: √2; Q: 2 | vE(√2)=1=vQ(2); vE(2)=2 excludes using p as πE | Pass |
| Absolute value | Q: 2,1,0 | 1/2,1,0; multiplicativity at 2·2 gives 1/4=(1/2)² | Pass |
| Valuation/divisibility | ℤ₂: 4,2 | 2 divides 4; v(2)=1 ≤ 2=v(4); 4 does not divide 2 | Pass |
| Integer-ring compactness and ideal neighbourhoods | Q, depth 0,1,2 | O/2ⁱO has sizes 1,2,4; 2ⁱ→0 | Pass |
| Spectral-norm structures/topology comparison | E/Q and identity | inherited norm(√2)=2^(−1/2), norm(2)=1/2; both topologies have the same π-adic balls | Pass; native structures |
| Valuation-extension uniqueness | E/Q; incomplete ℚ at 5 with √6 | E has one valuation class; X²−6 has two simple residue roots ±1 mod 5 | Pass; incompleteness control distinguishes uniqueness |
| Automorphism invariance/actions on O,m,k | E, σ(√2)=−√2 | valuations 1=1; σ(2)=2; residue action on 𝔽₂ is identity | Pass |
| Integer/residue algebra maps | E/Q; U/Q | 2 maps to π², 𝔽₂→𝔽₂ identity; 𝔽₂→𝔽₄ inclusion | Pass; canonical map required |
| Integer-ring torsion-free/finite/free | E/Q | basis (1,√2), rank 2; 2(a+b√2)=0 forces a=b=0 | Pass; native |
| Integral closure comparison | E/Q | √2 satisfies X²−2; 1/√2 has valuation −1 and is nonintegral | Pass |
| Tower and intermediate-field adapters | C/E/Q, identity | degrees 2·2=4; composed valuation scaling 2·2=4; identity scales by 1 | Pass; native |
| Ramification index definition/positivity | identity, U/Q, E/Q | e=1,1,2; vE(2)=2=e·vQ(2) | Pass |
| Residue degree/cardinality | identity, U/Q, E/Q | f=1,2,1; sizes 2=2¹,4=2²,2=2¹ | Pass |
| Fundamental identity | U/Q, E/Q, C/Q | e·f=1·2,2·1,4·1 = degrees 2,2,4 | Pass |
| e/f tower laws | C/E/Q | e=4=2·2; f=1=1·1 | Pass |
| Total ramification predicate/iff | E/Q and U/Q | e=degree: 2=2 true vs 1=2 false; f=1 true vs 2=1 false | Pass in both directions |
| natCastValuation and unit criterion | Q: n=1,2,4; 𝔽₂((t)): n=2 | 0,1,2; only n=1 is a unit here; cast(2)=0 in characteristic 2, so input proof unavailable | Pass; zero branch excluded |
| Absolute ramification index/comparison | Q, E | eabs=1,2 = v(2); identity product eabs·f=1,2 | Pass; no equal-characteristic value claimed |
| Absolute-index tower | C/E/Q | 4=2·2 | Pass |
| Padic integer-ring equivalence | p=2, x=4 | both ambient elements 4; 4 ∈ m² and 2² divides 4 | Pass; bridge API is padding |
| Residue equivalence and reduction | p=2, x=3; p=3, x=2 | both paths give 1 mod 2; both give 2 mod 3 | Pass; residue theorem is rfl |
| Unit equivalence/divisibility | Q: u=5, i=2,3 | 4 divisible by 4, not 8; membership true,false | Pass |
| Unit-filtration depth zero | Q: 3,2 | 3∈U₀, 2∉U₀; valuation 0 vs 1 | Pass |
| Positive membership/congruence | Q: 5, i=2,3 | v(5−1)=2; congruent 1 mod 4, not mod 8 | Pass |
| Filtration antitonicity/separation | Q: 9,5 | 9∈U₃⊆U₂; 5∈U₂\U₃; intersection contains 1, excludes both | Pass |
| Filtration compact-open/basis | Q: U₁,U₂,U₃ | indices 2,2; nested cosets shrink to 1 | Pass |
| Automorphism stability of filtration | E: 1+π, σπ=−π | both displacements have value 1 | Pass |
| Covariant depth scaling | Q→E: 5 at i=2 | vE(5−1)=4=e·2 | Pass |
| Graded pieces and indices | Q, i=0,1; ℚ₃, i=0 | orders 1,2; order 2; q−1,q respectively | Pass; distinguish additive from multiplicative |
| Uniformizer change of positive coordinate | Q depth 1, π'=3π; A, π'=ωπ | residue multiplier 1 over 𝔽₂; multiplier ω⁻¹ over 𝔽₄ | Pass |
| Teichmüller section/uniqueness | Q; ℚ₅, residue 4 | ω(1)=1; lift(4)=−1, reduction 4, (−1)⁴=1 | Pass; integer 4 itself fails torsion equation |
| Multiplicative decomposition/splitting | Q: 12 | 12=2²·3, v=2; with π'=6, unit becomes 1/3 | Pass; splitting depends on π |
| Torsion subgroup, p/prime-to-p parts | Q; ℚ₃ | μ(Q)={±1}, order 2 all 2-primary; μ(ℚ₃) order 2 prime to 3 | Pass |
| Principal units pro-p | Q | U₁/U₄ has order 8=2³; odd finite quotients have order 1 | Pass; native |
| Deep exponential/logarithm/inverses | Q, i=2, x=4; u=5 | threshold 1<2; log(exp 4)=4; exp(log 5)=5 | Pass; native |
| Exp/log continuity | Q, depth 2, xₙ=2^(n+2) | v(xₙ)=n+2; v(exp xₙ−1)=n+2→∞ | Pass; native |
| Sharp log boundary | Q, i=1, u=−1 | v(u−1)=1=e; log(−1)=0=log(1), but −1≠1 | Pass; strict threshold needed |
| Deep-unit module consequence | Q, i=2 | log U₂=4ℤ₂, rank 1=[Q:ℚ₂]; quotient by twice this lattice has size 2 | Pass; native |
| Prime-to-residue power classes | ℚ₃,n=2; Q,n=3; n=1 | counts 4=2·2; 3=3·1; 1=1·1 | Pass |
| Mixed/general nonzero-cast power classes | Q,n=2; E,n=2 | 8=2·2·2¹; 16=2·2·2² | Pass |
| Equal-characteristic power exclusion | 𝔽₂((t)), n=2 | infinitely many odd-power series square classes, Nat.card=0; cast(2)=0, so formula unavailable | Pass |
| Power-class absolute-value form | Q,n=2 | 8=2·2·(1/2)⁻¹ | Pass |
| Power-subgroup openness | Q,n=2; 𝔽₂((t)),n=2 | U₃ lies in squares; 1+t^(2j+1) is never square and tends to 1 | Pass; nonzero-cast hypothesis distinguishes |
| Finite index separate from openness | Q squares; (C₂)^ℕ dense index-two subgroup | index 8 and open; index 2 and not open in the abstract counterexample | Pass |
| Square-class spelling | Q | both subgroups contain 9 and exclude 2; quotient size 8 | Pass; native |
| Dyadic and uniformly indexed square counts | Q; E; ℚ₃ | 8=4·2¹; 16=4·2²; 4=4·3⁰ | Pass; native count |
| Deep-square containment/sharpness | Q | U₃ squares; 5∈U₂ nonsquare since 5 mod 8; threshold 3=2e+1 | Pass |
| Artin–Schreier sharpness mechanism | residue 𝔽₄ | x²+x takes (0,1,ω,ω+1) to (0,0,1,1); image index 2 | Pass; detects nonsquares 1+4c |
| Uniform square theorem in odd residue characteristic | ℚ₃, e=v(2)=0 | U₁ squares; 2∈U₀ nonsquare; threshold 1 | Pass |
| Unramified predicate and étale comparison | U/Q; E/Q | e=1 vs 2; residue separable in both; different exponents 0 vs 3 | Pass; ramification is not residue separability alone |
| Unramified tower/compositum | degrees 2,3 in fixed closure | intersection degree gcd(2,3)=1; compositum degree lcm(2,3)=6 | Pass |
| Residue Galois correspondence/Frobenius | U/Q; unramified cubic over Q | x↦x² has orders 2,3; at a generator a∈𝔽₈, inverse maps a↦a⁴≠a² | Pass; arithmetic convention discriminates |
| Frobenius congruence/Teichmüller compatibility | unramified cubic over Q | σ([a]) mod m=a²; σ([a])=[a²] | Pass |
| Existence/uniqueness in closure | Q, f=1,2,3 | unique fields of degrees 1,2,3; roots of unity orders 1,3,7 give those degrees | Pass |
| Abstract unramified equivalence/rigidity | U/Q | 2 residue automorphisms lift to 2 field automorphisms; fixing one residue map leaves 1 lift | Pass; unmarked uniqueness excluded |
| Finite unramified lattice | degrees 2 and 3 | meet 1, join 6; maximal union has infinite degree | Pass; finite lattice distinguished |
| Maximal unramified coordinate | finite levels 2,3 | arithmetic Frobenius gives 1 mod 2 and 1 mod 3; geometric gives 1 mod 2,2 mod 3 | Pass |
| Norm group, valuation identity | U/Q, x=2; E/Q, x=π | vQ(N_U 2)=vQ(4)=2=2·1; N_Eπ=−2, value 1=1·1 | Pass |
| Unramified norms on units/depths | U/Q, residue 𝔽₄/𝔽₂ | multiplicative norm y³ on 𝔽₄ˣ has image {1}; additive trace y+y² has image 𝔽₂ | Pass; successive graded surjectivity |
| Norm-equation iff | U/Q: 4 and 2; E/Q: 5 | 4 is norm, 2 is not: 2 divides 2, not 1; 5 not norm from E although f=1 divides v(5)=0 | Pass; converse needs unramifiedness |
| Totally ramified iff Eisenstein | E/Q, polynomial X²−2; identity with X−2 | e=2,degree=2; e=1,degree=1; both generators satisfy Eisenstein conditions | Pass; degree-one boundary |
| Inseparable Eisenstein extension | 𝔽₂((t))⊂𝔽₂((t^(1/2))) | e=2,f=1,degree=2, X²−t Eisenstein, derivative 0 | Pass for arithmetic; Galois/different claims excluded |
| Maximal unramified factorization | M=U(√2)/Q | degrees 2 unramified then 2 totally ramified; e=2,f=2,total degree 4 | Pass |
| Tame/wild predicates | T/ℚ₃; E/Q | 3 does not divide 2 (tame); 2 divides 2 (wild) | Pass |
| Totally tame root theorem/Galois criterion | T/ℚ₃; ℚ₂(∛2)/ℚ₂ | α²=3, μ₂ in base, Galois degree2; α³=2, μ₃ absent, nongalois degree3 | Pass in both directions |
| Local monogenicity | E/Q; U=Q(√5) | O_E=ℤ₂[√2]; O_U=ℤ₂[(1+√5)/2], while ℤ₂[√5] has index 2 | Pass; arbitrary integral generator is insufficient |
| Eisenstein orthogonality | E, coefficients (2,1), (0,0) | v(2+√2)=1=min(2,1); v(0)=∞=min(∞,∞) | Pass; zero-coefficient convention matters |
| Integer lower filtration and negative indices | C/Q | G₋₂=G₋₁=G₀=G₁ of order4; G₂=G₃ order2; G₄ order1 | Pass |
| Inertia comparison/normality/antitonicity/eventual triviality | U/Q; C/Q | U: orders 2 at −1,1 at 0; C: 4≥2≥1; all listed subgroups normal | Pass |
| Ceiling real convention | C, u=1,3/2,2 | group orders 4,2,2; ceil values 1,2,2 | Pass; left-continuous convention |
| Subgroup compatibility | H={1,5} in Gal(C/Q) | H₁=H₂=H₃=H of order2, H₄=1; intersection with Gᵢ gives same | Pass |
| Failure of lower quotient compatibility | H={1,7}, fixed field E | image of G₃={1,5} in G/H has order2; Gal(E/Q)₃ has order1 | Pass |
| Unit-quotient character/injectivity | A, break1, σπ=π+s | σπ/π−1=s/π has value1; character residue s/π²=1≠0 | Pass |
| Positive residue character/change | A, π'=ωπ | θ₁=1; θ'₁=ω⁻¹; multiplying θ by ω gives wrong value ω | Pass; native formula needed |
| Tame cyclic and wild elementary quotients | T/ℚ₃; C/Q | G₀/G₁=C₂ prime to3; C: G₁/G₂=C₂ and G₃/G₄=C₂ | Pass |
| Wild Sylow finite-level consequence | inertia S₃, p=3 | wild C₃ normal of index2; three order2 Sylows at p=2 are not normal | Pass; normality is material |
| Tame action on positive grades | inertia C₃⋊C₂, p=3, i=1 | transposition conjugates τ to τ⁻¹; residue −1 multiplies θ by −1 | Pass; different from outer Frobenius twist |
| Frobenius equivariance of θ₀ | tame quotient C₇⋊C₃, q=2 | σ τ σ⁻¹=τ²; inverse Frobenius gives τ⁴ | Pass; nonabelian convention witness |
| Herbrand domain/negative interval | identity and U/Q, u=−1,−1/2,0 | φ(u)=ψ(u)=u; u=−2 is outside typed domain | Pass |
| Herbrand integral/finite sums | C/Q, u=1,2,3,4 | φ=1,3/2,2,9/4, slopes 1,1/2,1/4 | Pass |
| Continuity/strict increase/concavity | C/Q | adjacent slopes 1≥1/2≥1/4>0; both pieces meet at φ(1)=1,φ(3)=2 | Pass |
| Inversion identities | C/Q | ψ(3/2)=2,φ(2)=3/2; ψ(2)=3,φ(3)=2 | Pass |
| Upper filtration/jump definition | C/Q | orders at 1,3/2,2,5/2 are 4,2,2,1; jumps exactly 1,2 | Pass |
| Abstract upper quotient wrapper | H normal in Gal(C/Q) | both sides are literally map(Gᵘ); at u=2,H={1,7}, image order2 | True by definition; delete padding |
| Field-theoretic upper quotient | C/E/Q at u=2,5/2 | both groups have orders 2,1 respectively | Pass; native |
| Herbrand tower and inverse order | C/E/Q, u=4 | φ_C/E(4)=5/2; φ_E/Q(5/2)=9/4=φ_C/Q(4); reverse gives φ_C/E(3)=2 | Pass for formula; R01 fixes prose |
| One wild step does not imply noncommutation | U/Q, M=U(√2), u=4 | id(φ_M/U(4))=3=φ_M/U(id(4)) | Fails prose; R01 |
| Integral ψ and floor | C/Q, n=0,1,2,3 | ψ=0,1,3,7, floors unchanged | Pass; native |
| ψ monotonicity/self lower bound | C/Q, n=1,2,3 | 1≤3≤7; n≤ψ(n): 1≤1,2≤3,3≤7 | Pass |
| Integral-depth tower | C/E/Q, n=3 | ψ_E/Q(3)=4; ψ_C/E(4)=7=ψ_C/Q(3) | Pass; native |
| Prime-degree ψ formula | E/Q, t=2, v=1,2,3 | ψ=1,2,4 = v before break, 2+2(v−2) after | Pass |
| Shifted norm inclusion | T/ℚ₃, v=1,2 | ψ(v)=2,4; N(4)=16∈U₁ but not U₂; N(10)=100∈U₂ | Pass; shift cannot be removed |
| Unramified norm equality | U/Q | ψ(i)=i; residue norm/trace images full as above | Pass |
| Tame graded norm v=t=0 | T/ℚ₃, 𝔽₃ˣ | y² maps {1,−1} to {1}; kernel/cokernel sizes 2,2 | Pass |
| Wild graded norm v=0<t | A, 𝔽₄ˣ | square map cycles ω↔ω² and fixes1; kernel/cokernel sizes1,1 | Pass |
| Positive graded norm v<t | E/Q, v=1,t=2 | N(1+π)=−1; coordinate (−1−1)/(−2)=1=1² | Pass |
| At-break polynomial | A, t=1,c=1 | y²+y at 0,1,ω,ω² gives0,0,1,1; kernel {0,1}, cokernel size2 | Pass |
| Wrong rescaling excluded | A, y=ω,c wrongly ω | true polynomial gives1; y²+ωy gives0 | Pass discrimination |
| Target-uniformizer factor | A, πK'=ωs, y=ω | output ω⁻¹=ω²=ω⁻¹·(ω²+ω) | Pass; factor necessary |
| Generator independence c^(ℓ−1) | ℓ=3, generator σ→σ² | c→2c but (2c)²=c² in characteristic3 | Pass |
| Trace-ideal formula/after-break norm | E/Q,t=2,v=3,m=4,d=3 | floors (4+3)/2=3,(5+3)/2=4; N(1+4)−1=24, Tr(4)=8, difference16∈m⁴ | Pass |
| After-break graded bijectivity | same instance | norm and trace coordinates at −8 both reduce to1 in 𝔽₂; map1↦1 | Pass; native |
| Deep norm surjectivity/indices/conductor | E/Q | at v=2 graded cokernel2; at v=3 cokernel1; unit norm index2, conductor3=t+1 | Pass |
| Cyclic complete break list | real quartic subfield of Q(ζ₁₆), generator3 | π=ζ+ζ⁻¹; v(σπ−π)=3, v(σ²π−π)=5; breaks2,4; group orders4,2 | Pass |
| Sen divisibility/upper conversion | same; r=1 | 2 divides 4−2; upper breaks2,2+(4−2)/2=3; r=1 has no differences | Pass; R03 adds acceptance target |
| Abstract false C₄ filtration excluded | README breaks2,3 | upper break5/2; 2 does not divide 1 | Pass negative control |
| Positive jump detection by cyclic quotient | C/Q, jumps1,2 | Q(i) detects1; E detects2; each quotient order2 | Pass |
| Removing unramified part | M=U(√2)/Q | G₀=G₁=G₂ of order2 both over Q and U; positive upper break2 in both | Pass |
| Hasse–Arf/nonpositive endpoints | C; U; tame quadratic; identity | jumps {1,2},{−1},{0},∅, all integral | Pass |
| Nonabelian exclusion | abstract Q₈ with grades8,8,2,2,1 | φ(3)=1+2·(2/8)=3/2; nonabelian hypothesis fails | Control only; no claim this abstract example is realized |
| Different/discriminant definitions/δ=f·d | E/Q; U/Q | d=δ=3=1·3; d=δ=0=2·0 | Pass |
| Isomorphism invariance | E with generator π or −π | both d=3,δ=3; derivative ±2π has value3 | Pass; native |
| Hilbert sum | C/Q; E/Q; identity | 3+3+1+1=8;1+1+1=3; empty support sum0 | Pass; eventual triviality makes finsum finite |
| Tame equality and wild lower bound | T/ℚ₃; Q(i)/Q; E/Q | d=1=e−1; d=2=e; d=3≥e=2 | Pass |
| Wild upper bound | Q(i)/Q; E/Q | d=2≤1+2=3; d=3=1+2; characteristic2 cast(e)=0 is excluded | Pass |
| Different tower | C/E/Q | d(C/Q)=8 = d(C/E)+e(C/E)·d(E/Q)=2+2·3 | Pass |
| Norm/discriminant of ideals | E/Q | N(mE³)=mQ³; f=1 multiplies exponent3 by1 | Pass |
| Finite-level ambient restriction | C/Q to E/Q | group orders4→2, kernel2; identity element restricts to identity | Pass |
| Algebraic versus separable closure | K=𝔽₂((t)), a²=t | every K-automorphism fixes a; a is not separable, so intersection with Ksep removes it | Pass; maximalTame must take separable part |
| Inertia, finite image | U/Q; C/Q | inertia images orders1,4, matching G₀ | Pass |
| Arithmetic lifts/coset/generation | unramified levels3, tame quotient C₇⋊C₃ | all lifts have coordinate1 mod3; adding inertia changes τ-component only | Pass |
| Wild inertia finite-level definition/image | E/Q; T/ℚ₃ | images C₂ and1, matching G₁ | Pass; native carrier preferred |
| Wild inertia closed/normal/inside inertia | E/Q; tame quotient | image order2≤2; tame image1≤2; kernels/intersections normal and closed | Pass |
| Maximal tame finite-level criterion | T/ℚ₃; E/Q | tame G₁=1, wild G₁=C₂≠1 | Pass in both directions |
| Radical description of maximal tame | Q | cube roots of2 allowed since2∤3; √2 excluded since2 divides2; m=0 excluded | Pass |
| Fixed subgroup after separable intersection | characteristic2 a²=t; separable tame cube root b³=t | wild inertia fixes a and b; intersecting its fixed field with Ksep excludes a and retains b; fixing subgroup unchanged | Pass |
| Pro-p/Sylow identification at finite inertia | S₃, p=3; trivial group | unique normal C₃ index2; trivial subgroup index1 | Pass; conjugacy/normality pins object |
| Tame inertia as prime-to-p product | p=2 | finite projection at ℓ=3 gives ℤ/3; at ℓ=7 gives ℤ/7; no nontrivial2-primary quotient | Pass |
| Tame character choice control | q=2, cubic roots | changing a root by ζ₃ leaves σ(root)/root unchanged for inertia since σ fixes ζ₃ | Pass; product coordinates additionally need compatible root-of-unity bases |
| Tame quotient/abelianness of tame inertia | C₇⋊C₃ | inertia C₇ abelian, whole group nonabelian; commutator [σ,τ] nontrivial | Pass |
| Procyclic generator lifted from inertia | same finite quotient | τ order7 generates inertia; identity has order1 and fails generation | Pass |
| Iwasawa relator/marked presentation | q=2, C₇⋊C₃ | σ τ σ⁻¹ τ⁻²=1; using inverse σ gives τ^(4−2)=τ²≠1 | Pass; arithmetic marking matters |
| Free/presented coordinate values | coordinate mod3 | χ(σ)=1,χ(τ)=0; relator maps1+0−1−0=0 | Pass; native |
| Coordinate kernel/normal closure | same quotient | kernel C₇ of order7 = normal closure of τ; σ outside | Pass |
| Marked uniqueness | same quotient | specified images of two generators leave1 homomorphism; trivial map fails σ-image1 | Pass |
| Tame inertia image/Frobenius coset | same quotient | e(I)=C₇; e(φ)∈σC₇; coordinate1 for each | Pass |
| Coordinate comparison with unramified quotient | same quotient | σ↦1 on both routes; τ↦0 on both | Pass |
| Unmarked existence versus marked existence | q=2 | inverting σ identifies the two presentations; on the chosen arithmetic generator coordinates1 and2 mod3 differ | Pass |
| Geometric translation/coordinate | q=2, mod3 | σarith↦σgeom⁻¹; geometric coordinate−1=2 mod3 | Pass |
| Q₃ worked-example carrier and irreducibility | X²−3 | a root in ℚ₃ would require2v₃(a)=1, impossible; degree2 | Pass; remove example-only Lean scaffolding |
| Q₃ worked norm counterexample | u=4 in T | vT(4−1)=2; N(4)=16; v₃(15)=1 | Pass; keep README Check |
| Supplier pro-p definition admits nonprofinite inputs | additive ℝ; finite C₃ at p=2 | ℝ has only trivial discrete quotient so predicate true; C₃ identity quotient has order3, not a2-power | Pass; use explicit profinite hypotheses in theorems |
| Supplier Sylow normal uniqueness | S₃,p=3 and2 | C₃ normal unique; three C₂ Sylows nonnormal | Pass |
| Supplier continuous-presentation extensionality | two generators into C₃ | images(1,0) determine one map; changing first image to2 changes map | Pass |
| Supplier Galois fixed-field contract | Kalg/K, K=𝔽₂((t)) | fixed field of full G includes t^(1/2); restricting to separable closure leaves base K | Pass |
| Free profinite group on no generators | empty generating type, trivial target | one word class, one homomorphism, empty relator family; group order1 | Pass |
| Presentation descent and wrong map | q=2 relator, target additive C₃; assignments (σ,τ)=(1,0),(0,1) | relator values0 and−1=2 respectively; only first assignment descends | Pass; relation hypothesis excludes wrong map |
| Presentation congruence | q=2 arithmetic/geometric relators | sending σ to σ⁻¹ transforms conjugation exponent2 to its inverse; modulo7 that inverse is4, since2·4=1 | Pass; both relation directions needed |
| Unramified restriction exactness | U/Q degree2 | absolute restriction image order2; kernel inertia; quotient order2 at this level | Pass |
| Galois finite-level carrier | E/Q and purely inseparable degree2 extension in characteristic2 | E automorphism group order2=degree; inseparable extension group order1≠degree2 | Pass; second cannot instantiate finite Galois carrier |
| Prime-away index and q=1 control | residue characteristic2 | 3 and7 admitted,2 and1 excluded; finite residue field has at least0≠1, hence q≥2 | Pass; q=1 not an available local-field input |
| ULift topology adapter | C₃ with discrete topology | lifted singletons remain clopen; connected components have size1 before and after | Pass; adapter is not a headline |

## Not verifiable

The source service was asked for every cited work. No source manifest existed to supply settled entries or alternate local texts. It returned `uncertified` for these six books after publisher/DOI lookup; no legal readable full text was obtained, and no paywall was bypassed:

- **serre-lf**, Serre, *Local Fields* (1979): the cited Chapters III–V, including IV §3 exercise 3 and V §7. The Springer/DOI route did not provide readable text. The quaternion example's specific realization and the book's exact numbering/pages are consequently not certified here; the table explicitly labels its Q₈ calculation abstract.
- **neukirch-ant**, Neukirch, *Algebraic Number Theory* (1999): Chapter II §§3–8 cited for local arithmetic. The Springer/DOI route did not provide readable text.
- **nsw**, Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields* (2008): 7.4.4 and 7.5.2–7.5.3 and the tame-presentation context. The Springer/DOI route did not provide readable text.
- **ribes-zalesskii**, Ribes–Zalesskii, *Profinite Groups* (2010): the generic profinite-group reference. The Springer/DOI route did not provide readable text; the actual supplier declarations and assumptions were checked at the pin instead.
- **serre-course**, Serre, *A Course in Arithmetic* (1973): II §3 for square classes. The Springer/DOI route did not provide readable text.
- **omeara**, O'Meara, *Introduction to Quadratic Forms* (1963): §63:1 for the dyadic square bound. The Springer/DOI route did not provide readable text.

These are limitations on certification of the cited texts, not assertions that their mathematical statements are false. They are not new requests for already-classified paywalled material. Fesenko–Vostokov and the versioned LeanBridge files were readable legally as recorded above. No README locator was explicitly marked unverified. The external LeanBridge project was not built; reading six files does not certify their entire import graph. Ownership against the supplied open-head index was checked; no claim is made about unpublished or unlisted work. No suspicious instruction from fetched data was followed.

## Source issues

- none
