# Review of ClassFieldTheory (pull request #1215 at 95ba181)

**Verdict:** needs changes

Eight findings: two P2 and six P3. This is an incremental re-review of 69 changed lines since edbf5e9. The previous consumer identifier failures are repaired; seven previous findings remain. The new out-of-folder edit also fails the gate. The PR worktree was not edited.

## R01 (P2) — Local cohomology finiteness still omits invertibility

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:79`, :167 and :871. The contract still promises “finiteness of H⁰, H¹, H² of a finite smooth discrete module” and describes the smoothness argument of `finite_H` as an instance.

**Claim.** Previous R03 remains: finiteness requires `(n : F) ≠ 0`; `finite_H` takes smoothness explicitly. The cited perfectness theorem also needs its characteristic-zero hypothesis. This affects the consumer contract modified at :149–170.

**Witness.** For F = 𝔽₂((t)), A = ℤ/2, the classes t⁻¹, t⁻³, … are independent in H¹ = F/(x²−x), so H¹ is infinite. `TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean:97` explicitly requires `(n : F) ≠ 0`.

**Repair.** State the invertibility condition and explicit smoothness argument. Scope `tateDualityPairing_perfect_mixed` to characteristic zero, or cite `tateDualityPairing_perfect` with `IsUnit (n : F)`, finiteness, discrete topology, smoothness and the degree-two trivialization. Add the equal-characteristic negative control.

**Test of repair.** The condition excludes ℤ/2 over 𝔽₂((t)), since 2 = 0, and keeps ℤ/2 over ℚ₂, where #H¹ = 8. Correction to r7: prime-to-characteristic perfectness is already supplied by `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean:242`; it needs no new owner.

## R02 (P2) — Equal-characteristic unit-filtration reciprocity still has two owners

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:176` and :997: the upper-numbering theorem stays here in every characteristic.

**Claim.** Previous R04 remains. FunctionFieldArithmetic also owns the same finite-level comparison. A boundary asserted only here does not resolve that overlap.

**Witness.** PR #1474, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1116`, states Art(Uʳ) = Gʳ for every finite abelian equal-characteristic extension; :1113 states the conductor consequence. This is the same object as this roadmap's Layer 7.

**Repair.** Retain ClassFieldTheory as owner of the general finite-level theorem; have FunctionFieldArithmetic §4.2 import it by this roadmap and section, and cite the native conductor characterization. Resolve the absolute form together with R05. Record the coordination in the PR description, without adding a reverse supplier edge.

**Test of repair.** For y²−y = t⁻¹ over 𝔽₂((t)), both passages give Art(U¹) = C₂ = G¹ and Art(U²) = 1 = G², with conductor 2. One cited theorem supplies both uses, including the wild case.

## R03 (P3) — State the open conductor comparison instead of repackaging the native sum

**Location.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:118` and :131; `TauCetiRoadmap/ClassFieldTheory/README.md:1005`.

**Claim.** Previous R05 remains. The sum and maximum are still acceptance targets around a new spelling of character conductor. The substantive missing interface is the equality with the native Artin conductor; the README itself already identifies that route.

**Witness.** `TauCeti/NumberTheory/LocalField/Discriminant/Conductor.lean:58` proves Σχ a(χ) = δ. `TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:130` identifies fixed-field conductors with a(χ). The new conductor differs through its reciprocity-based minimum.

**Repair.** State `galoisCharacterConductorExp_eq_artinConductorExponent` with the finite abelian valued-extension hypotheses as the acceptance target. Delete the sum and maximum declarations from `Suggested.lean`; retain their mathematical statements as README consequences of that comparison and the native theorems.

**Test of repair.** In ℚ₂(ζ₁₂)/ℚ₂, the comparison gives 0,0,2,2; the native sum gives δ = 4 and the maximum is 2. The conditional reduction tested in r7 remains valid. This is an ownership/interface finding: the fresh one-tactic probe does **not** prove either present theorem without the missing comparison.

## R04 (P3) — The Checks still do not distinguish upper from lower numbering

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:1022`–:1050, Layer 7 Checks.

**Claim.** Previous R06 remains. The listed examples let a lower-numbering replacement pass; none has different lower and upper integer depths before the last nontrivial group.

**Witness.** For ℚ₃(ζ₉)/ℚ₃ at n = 2, Art(U²) = G² = 1, while G₂ has order 3. Character conductors 0,1,2,2,2,2 sum to 9; the lower-numbering substitutes sum to 13.

**Repair.** Add this negative-control Check, recording the images at n = 2, discriminant exponent 9, and maximum conductor 2.

**Test of repair.** Lower group orders at 0,1,2,3 are 6,3,3,1. Herbrand sends lower break 2 to upper break 1. Thus the proposed Check accepts upper numbering and rejects lower numbering.

## R05 (P3) — Conflicting revisions still have no stated integration order

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:997`, `Suggested.lean:89`, and the PR description.

**Claim.** Previous R07 remains. The overlap tool still reports conflicts with #617 and #1411. The description names neither an order nor a rebase plan, and #1411's absolute unit-filtration target is absent here.

**Witness.** PR #1411, `TauCetiRoadmap/ClassFieldTheory/README.md:1452`, names `map_unitFiltration_normResidue`; :1460 also gives `closure_map_artinMap_unitFiltration`. PR #617 changes this README; both conflicts are reproduced by the overlap check.

**Repair.** State which revision is rebased on which and reconcile their overlapping targets. Adopt one finite-level name or document its old → new correspondence. Keep the absolute theorem as a precise Layer 7 target or name its owner in Scope; do not silently lose it while integrating #1411.

**Test of repair.** At ℚ₃(ζ₉), n = 2, both finite formulations give the trivial subgroup. The absolute statement must project to that subgroup at this quotient. An explicit integration order and preserved absolute target resolve both overlapping changes.

## R06 (P3) — Missing locators and the incomplete discriminant supplier citation remain

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:226`–:495 (§§2.1–2.7), :1616–1762 (§§5.1–5.8), :990 (new unit-normalization target), and :1511 (discriminant route).

**Claim.** Previous R08 is only partly repaired: Serre's *Local Fields* now has a settled manifest entry, but locators at the sampled claims are unchanged. The new valuation-compatibility argument also has no locator or precise named inputs. NumberFieldArithmetic §4.2 supplies localization, but not the whole completed-place exponent formula used next.

**Witness.** Reciprocity direction is at milne-cft line 4822 (III Theorem 3.1, p. 107); Frobenius at line 4641 (III Proposition 1.9, p. 102). `Completed/NumberFieldArithmetic/README.md:1714` supplies §5.10's residue-degree-weighted exponent formula.

**Repair.** Put exact locators beside the mathematical claims, using the verified source list below; §2.4's primary papers need theorem/page locators or a supporting readable replacement. Keep NumberFieldArithmetic §4.2 for localization and add §§5.9–5.10 for completed differents and exponents. Name the profinite supplier at :131. For :990, cite the native cyclotomic theorem and give locators or pinned inputs for the root-extraction and valuation argument.

**Test of repair.** The exponent formula gives 4 = 2·2 for ℚ₂(ζ₁₂)/ℚ₂, not 2. The unit normalization gives 4⁻¹ = 7 mod 9 over ℚ₃, matching the native arithmetic convention. These are the statements the supplied locators must support.

## R07 (P3) — README structure and process narrative are unchanged

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:3`, :497, :565, :816, :1604, :1613, :1753 and :1868.

**Claim.** Previous R09 remains: the file uses Purpose and numbered top-level headings, a “Frozen public interface,” no per-target Needs for the open layers, and no closing Examples/Dependencies subsections. It still describes future naming/implementation stages.

**Witness.** At :1753, “The arithmetic tests should be added only after the following supplier maps have stable names”; at :1604 it announces three errors but lists four. Layer 4 :816 labels a degree-two Check as its sole target.

**Repair.** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers, and Downstream consumers headings. Give open targets individual Needs; retain APIs and discriminating Checks. Remove process sentences, make the degree-two item a Check, correct the count, and remove or pin the external implementation repositories.

**Test of repair.** The layer inventory has two layers containing open headlines (7 and 13), now seven theorem statements. Their prerequisites can be assigned individually without introducing a later-layer dependency. The four listed failure modes remain four after the prose correction.

## R08 (P3) — A repair edits a folder outside this PR's authorized scope

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:3` and :245–1931; the outside-folder diff has 62 additions and 50 deletions in this file.

**Claim.** The brief authorizes ClassFieldTheory, GlobalQuadraticForms and QuadraticFormInvariants only. The LocalGaloisGroups migration is therefore an outside-folder gate failure, even though it addresses previous R02.

**Witness.** The worker gate reports `outside-folder=1`, naming `Completed/LocalGaloisGroups/Suggested.lean`. The prescribed diff excluding the three declared folders reports exactly that file.

**Repair.** Land the consumer migration in a separately scoped change and rebase this PR onto it, so the migration remains present in the resulting tree but disappears from this PR's base diff. Do not merely revert it and restore the broken references.

**Test of repair.** The native Kummer, H² and cyclotomic calls now resolve; the five extracted consumer checks elaborate. Keeping those changes through the base preserves their behavior while making the out-of-folder diff empty. Full consumer elaboration has the environment limitation recorded below.

## Previous findings

- R01 — repaired: GlobalQuadraticForms imports native Hasse-norm and Hilbert-reciprocity modules and resolves the renamed inputs at Suggested.lean:61–77. The prescribed targeted build passes.
- R02 — repaired: Completed/LocalGaloisGroups uses native names at :245–1931 and the restored general cyclotomic target at :345. Five extracted checks elaborate; full consumer verification is limited by absent roadmap object files. Its placement causes new R08.
- R03 — not repaired: README:79–82, :167–168 and :871–875 still omit invertibility/characteristic hypotheses and misdescribe smoothness. Repeated as R01, correcting the earlier claim that prime-to-characteristic duality had no native supplier.
- R04 — not repaired: README:176–177 and :997 retain general upper-numbering ownership, while FunctionFieldArithmetic §4.2 still owns its equal-characteristic instance. Repeated as R02.
- R05 — not repaired: Suggested.lean:118 and :131 still state the sum and maximum; the reciprocity-to-Artin-conductor comparison is only a proof-route sentence at README:1010. Repeated as R03.
- R06 — not repaired: README:1022–1050 retains the same seven Checks; ℚ₃(ζ₉) and a separating upper/lower calculation are absent. Repeated as R04.
- R07 — not repaired: The description still states no order for #617/#1411; README:997 has only the finite-level target under a different name. Repeated as R05.
- R08 — partly repaired: Serre's Local Fields now has the settled key serre-local-fields. The claim-level locators and NumberFieldArithmetic route at README:1511 remain unchanged. Repeated as R06.
- R09 — not repaired: Purpose, Frozen public interface, numbered headings, layer-wide prerequisites and the stable-name process sentence remain at README:3, :497, :565 and :1753. Repeated as R07.

## Verified sound

This review checked the changed passages and their dependents; it did not restart the previous full review. The 15 seeded targets (§§2.1–2.7 and §§5.1–5.8) are unchanged. Their mathematical rows below are carried from r7 with per-row attribution; §2.6 and §5.3 were also reread because they use the new cyclotomic headline.

**Gate and elaboration.**

- HEAD is 95ba181f2cd8e2fe9daf50a1bb923d6105938751. The tracked worktree remains clean.
- The worker's gate has all checks zero except `outside-folder=1`; `build=0`.
- Rerunning the prescribed standalone gate reports `outside-folder=6` and no other nonzero check. Five paths are in the explicitly authorized GlobalQuadraticForms and QuadraticFormInvariants folders; those are scope-filter false positives, not additional findings. The remaining path is R08. This invocation did not run a build; the prescribed targeted build was run separately.
- `lake build TauCetiRoadmap.ClassFieldTheory.Suggested TauCetiRoadmap.GlobalQuadraticForms.Suggested` succeeds (21,158 jobs). Lake emits module-system advisory warnings as well as admitted-theorem warnings in its build graph.
- Direct elaboration of ClassFieldTheory's `Suggested.lean` exits 0 with exactly seven `sorry` warnings and no others. No sorry'd data, `set_option`, or admitted examples occur in that file.
- A scratch `#check @name` run for all eight declarations exits 0. All field, topology, local-field, finite-dimensional, valued-extension, Galois and abelian binders match the signatures. The new theorem intentionally lacks `ValuativeExtension ℚ_[p] F`, retains `Module.Finite ℚ_[p] F`, the unit condition and the lift equation, and has no lost section hypothesis.
- The one-tactic probe tried `rfl`, `simp`, `infer_instance`, and the pertinent native cyclotomic/sum theorem. All seven goals remain admitted. The native unit theorem cannot discharge the new statement without establishing valuation compatibility. Probe-generated unused-tactic warnings are not warnings from the submitted file.
- Five extracted closed consumer checks (Kummer, H² of μₙ, general unit normalization, its ℚₚ specialization, and its uniformizer specialization) elaborate against the new target and native APIs.

**Dependency check output:**

```text
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassFieldTheory is an existing roadmap on main; it is not an unresolved new entry in ORDER. Its cited suppliers remain Mathlib, Tau Ceti, ProfiniteCohomology, LocalFieldsRamification, GlobalNumberFields and NumberFieldArithmetic. No supplier gap is declared. The new material adds no upward supplier.

**Headline inventory.** Seven open statements are present: the general unit cyclotomic normalization (:73), unit-filtration reciprocity (:89), local discriminant sum (:118), local conductor maximum (:131), principal ideal theorem (:146), global discriminant product (:157), and global conductor lcm (:171). The only supporting definition is the reciprocity-based character conductor (:105). All are statable at the pins. The module docstring retains the inventory of already-native headline theorems instead of replacing them with stand-ins; R03 concerns which remaining comparison should be tested.

**Pinned evidence reopened in this round.** The pins are Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5 and Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, confirmed against the actual checkouts and manifest. The following are 18 declarations or definitions inspected at those pins; paths are library-relative.

| File and line | Declaration or constraint checked |
|---|---|
| `Mathlib/NumberTheory/LocalField/Basic.lean:46` | `IsNonarchimedeanLocalField` includes compatible valuative topology, local compactness and nontrivial valuation; it does not assert compatibility with an arbitrary algebra structure. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294` | `localCyclotomicCharacter_artinMap_padic`: inverse on units. |
| same file :311 | `localCyclotomicCharacter_artinMap_unit`: explicit `ValuativeExtension` assumption. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean:271` | `abelianizedLocalCyclotomicCharacter_artinMap_norm`: norm compatibility, with valued-extension and separability hypotheses. |
| same file :364 | `localCyclotomicCharacter_artinMap_padic_uniformizer`: value 1. |
| `TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean:189` | `muNRep_ρ_apply_eq_self`: requires a primitive root in F and nonzero exponent. |
| same file :456 | Native `muNRepIsoTrivialFp`, a coefficient isomorphism, not a bare equality of dimensions. |
| `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:156` | `h2EquivZModOfMuNRepIso`: requires exponent invertibility and a coefficient isomorphism. |
| `TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean:97` | `finite_H`: invertibility and explicit smoothness. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean:242` | `tateDualityPairing_perfect`: prime-to-characteristic form. |
| same file :280 | `tateDualityPairing_perfect_mixed`: characteristic-zero specialization. |
| `TauCeti/NumberTheory/LocalField/Herbrand/ArtinConductor.lean:69` | Native Artin conductor is the attained upper-filtration minimum. |
| `TauCeti/NumberTheory/LocalField/Discriminant/Conductor.lean:58` | Native character-sum discriminant theorem. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:121` | Conductor bound iff upper group is trivial. |
| same file :130 | Conductor of the kernel's fixed field equals Artin conductor. |
| `TauCeti/NumberTheory/ClassFieldTheory/Global/HasseNorm/Basic.lean:170` | Cyclic Hasse norm theorem in placewise form; the native theorem at :154 supplies its idelic form. |
| `TauCeti/NumberTheory/ClassFieldTheory/Global/Reciprocity.lean:248` | Abelian idele-class norm index. |
| `TauCeti/NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65` | Hilbert product formula consumed by GlobalQuadraticForms. |

The new valuation argument is mathematically sound: for each prime ℓ ≠ p, Hensel root extraction makes the principal units ℓ-divisible to all depths. A discrete additive valuation therefore vanishes on them, and also on torsion units. If its restriction to ℚₚ were trivial, algebraicity would force it to be trivial on F. If v(p) were negative, v(1−p) = v(p) would contradict 1−p being a p-adic unit. Hence v(p) > 0, giving the claimed compatible valuation. This reasoning covers p = 2 as well. R06 asks that the roadmap supply the precise references/inputs, not that it weaken the theorem.

**Cross-roadmap checks.** The updated GlobalQuadraticForms citation resolves to its README:99–103 and §§3.3, 4.2–4.4, 5.1; its Lean checks :61–77 and closed Hasse-norm checks :79–101 use the cited native objects. LocalGaloisGroups' changed contract resolves to its Lean :319–367, :417–499 and :1927. NumberFieldArithmetic §4.2 (:1123), §5.9 and §5.10 (:1714) were compared with the global proof route. LocalFieldsRamification Layer 3 (:724) supplies the upper filtration, Hasse–Arf and discriminant theory. ProfiniteCohomology's main-branch scope and supplier inventory were read. Two main-branch roadmaps, ProfiniteCohomology and NumberFieldArithmetic, supplied the shape comparison.

Object searches used `roadmaps grep` over main/open heads and the board packages, together with pinned-source searches for the cyclotomic comparison, valuation compatibility and conductor formulas. The new unit theorem belongs to this roadmap's existing reciprocity contract; LocalGaloisGroups consumes it. The same fully qualified name in #617/#1411 is an overlapping revision of this roadmap, covered by R05. FunctionFieldArithmetic's second ownership is R02. No additional distinct owner of the new valuation-free cyclotomic theorem was found. The overlap check reports no dropped supplier IDs or IDs defined only by an open revision.

**Source evidence.** No source manifest was edited. These cached passages were reopened to verify the surviving locator finding and the affected conventions:

| Claim | Exact legal-cache locator and result |
|---|---|
| Tate theorem, §2.4 | milne-cft line 3911, II Theorem 3.11, printed p. 84; subgroup H¹ vanishing and cyclic H² of subgroup order, with restriction generating as explained at line 3919. |
| Fundamental-class scaling and direction, §§2.3/2.5 | milne-cft line 4833 and line 4822, III Theorem 3.1, printed p. 107; scaled inflation and inverse Artin direction. |
| Frobenius, §§2.6/5.3 | milne-cft line 4641, III Proposition 1.9, printed p. 102; Frobenius maps to the uniformizer class before inversion to Artin. |
| Principal ideal theorem, §5.7/Layer 13 | milne-cft line 7252, V Theorem 3.17, printed p. 161. |
| Noncyclic Hasse failure, §5.7 | milne-cft line 10642, VIII Remark 3.2, printed p. 234; 25 for ℚ(√13,√17). |
| Global conductor formulas | milne-cft line 7423 and line 7436, V Theorem 3.27 and Remark 3.28, printed p. 165; product and lcm, with the omitted proof recorded below. |

The unchanged source checks for §§2.1–2.2, §2.7 and §§5.1–5.8 otherwise retain r7's evidence, including kopp-lagarias lines 128, 160 and 174 (Theorems 1.1–1.3, pp. 3–4). The settled serre-local-fields entry repairs the earlier manifest omission; it does not certify its unread text.

**Fresh adversarial calculations for the changed statements.** Each row includes actual values; no truth claim is inferred from a `sorry` build.

| Statement | Instances | Values on both sides / wrong model | Result | Change |
|---|---|---|---|---|
| New `cyclotomicCharacter_artinMap` | F = ℚ₃, u = 4 | χ(Art(4)) = 7 mod 9; N(4)⁻¹ = 4⁻¹ = 7 mod 9; geometric convention gives 4 | correct inverse | add precise locator, R06 |
| same | F = ℚ₂, u = −3 | modulo 16, u = 13 and u⁻¹ = 5; both sides 5, whereas the wrong direct-unit formula gives 13 | p = 2 and sign separated | none |
| same | unramified quadratic F/ℚ₃, scalar u = 4 | N(u) = 16, inverse = 4 mod 9; cyclotomic value 4; omitting norm gives 7 | degree dependence correct | none |
| same | F = ℚ₂(i), u = i; u = 1 | N(i) = 1 and χ(Art(i)) = 1; N(1) = χ(Art(1)) = 1 | torsion and identity | none |
| same, unit hypothesis | F = ℚ₂(i), x = 1+i | v_F(x) = 1 additively, so excluded; N(x)⁻¹ = 1/2 is not a 2-adic unit | hypothesis necessary | none |
| Automatic valuation compatibility in new proof route | ℚ₃; unramified quadratic over ℚ₃; ℚ₂(i) | v_F(p) = 1,1,2 respectively; v_F(u) = 0 for p-adic units in all three; v_F(pᵐu) = m,m,2m | positive multiple, not necessarily equal normalized valuations | locator/input issue R06 |
| Principal-unit root step | p = 2, ℓ = 3; p = 3, ℓ = 2 | 3³ ≡ 3 mod 8; 2² ≡ 4 mod 9; Hensel lifts roots since derivatives are units; v(u) lies in every ℓᵏℤ, hence equals 0 | root and discreteness argument holds | none |
| New unit theorem's universe | p = 0 or 1; characteristic-2 F | prime hypothesis false for 0,1; an injective ℚₚ-algebra map would give 2 ≠ 0 and 2 = 0 in characteristic 2 | invalid cases excluded | none |
| Renamed `h2EquivZModOfMuNRepIso` contract | F = ℚ₂, n = 2, T ≅ μ₂; T = 0 | #H²(T) = 2 = #ZMod 2 in first case; #H²(0) = 1 ≠ 2, but no coefficient isomorphism exists | no arbitrary-coefficient overclaim | none |
| Renamed `muNRep_ρ_apply_eq_self` | μ₃ over ℚ₇; μ₃ over ℚ₂ | first action sends ζ to ζ (coordinate 1 → 1); second Frobenius sends ζ to ζ² (1 → 2), with no primitive root in ℚ₂ | primitive-root hypothesis discriminates | none |
| Renamed ℚₚ uniformizer specialization | p = 2 and p = 3 | χ(Art(p)) = 1 = RHS; unramified coordinate remains 1 in additive ℤ̂ | ramified cyclotomic and unramified coordinates distinct | none |
| Changed consumer Kummer/H² references | F = ℚ₂, n = 1 and 2 | power-class/H¹ orders 1 = 1 and 8 = 8; H²/ZMod orders 1 = 1 and 2 = 2 | native migration preserves meaning | none |
| Updated GlobalQuadraticForms supplier paragraph | ℚ(i)/ℚ, a = 2 and −1 | N(1+i) = 2: global/local true; −1: global/local false at ∞; idele-class norm index 2 = degree 2 | cited norm objects agree | none |
| Hasse–Arf control used by retained R04 | ℚ₃(ζ₉), n = 2 | Art(U²) = G² = 1, but lower G₂ has order 3; 0+1+4·2 = 9 versus 0+1+4·3 = 13 | distinguishes intended object | R04 |
| Retained R01 counterexample | 𝔽₂((t)), trivial ℤ/2 | distinct odd negative exponents give infinitely many independent classes; predicted finite H¹ is false; 2 = 0 violates repaired assumption | original claim fails | R01 |

**Unchanged adversarial rows carried from r7.** The Change column maps r7's findings to this report's numbering. These are prior computations, not claims of a new full review.

| Statement | Instance | Values computed (each side) | Result | Change / provenance |
|---|---|---|---|---|
| `normResidue_map_unitFiltration` | L = K, any n | LHS ⊥ in trivial Gal^ab; RHS ⊥ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₂(i), n = 1, 2 | Art(U¹) = G (−1 not a sum of two squares), G¹ = G; Art(U²) = 1 = G² | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₂(√2), n = 2, 3 | 5 ≢ ±1 mod 8 so Art(U²) = G = G²; Art(U³) = 1 = G³ | holds; G^{n−1} model fails | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₃(ζ₃), n = 0 | Art(−1) inverts ζ₃: image G = G⁰ = G₀ (order 2) | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₃(ζ₉), n = 2 | Art(U²) = 1, G² = 1; lower G₂ has order 3 | holds; lower-numbering model fails | R04; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | unramified degree 2, n = 0 | Art(U⁰) = 1 = G⁰; using Kˣ for U⁰ gives order 2 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | 𝔽₂((t)), y² − y = t⁻¹ | Art(U¹) = C₂ = G¹; Art(U²) = 1 = G² | holds; two owners | R02; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| `galoisCharacterConductorExp` | trivial χ; ℚ₂(i); ℚ₂(√2); ℚ₅(μ₅) | 0; 2; 3; 1 | determined | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same, wrong models | geometric Art; lower numbering at ℚ₃(ζ₉) order-3 χ | same kernel, same value (normalization invisible); 2 vs 3 | lower model excluded only by R04's Check | R04; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same, junk value | sInf ∅ | never reached: the norm group is open, so U^n ⊆ N for large n | none | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| local Σ formula | L = K | δ = 0; Σ = 0 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₂(i) | δ = 2 (disc −4); 0 + 2 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₂(ζ₁₂), e = f = 2 | δ = f·d = 4; 0 + 0 + 2 + 2 (fixed fields ℚ₂, ℚ₂(ζ₃), ℚ₂(i), ℚ₂(√3)) | holds; d alone gives 2 | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ₃(ζ₉) | δ = 9 (disc 3⁹); 0 + 1 + 2·4 = 9; lower model gives 13 | holds | R04; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| conductor = max | ℚ₅(μ₅); ℚ₃(ζ₉) | c = 1 = max, Σ = 3; c = 2 = max | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| principal ideal theorem | K = ℚ | H = ℚ; (2) principal | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ(√−5), 𝔭 = (2, 1+√−5) | 𝔭² = (2) = ((1+i)²), so 𝔭𝒪_H = (1+i); K(i) = K(√5) unramified (discs −4, 5 coprime) | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| global product half | ℚ(i), v = 2 and v = 3 | 2 = 0 + 2; 0 = 0 + 0 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ(ζ₈), v = 2 | 8 = 0 + 2 + 3 + 3 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same | ℚ(ζ₅), v = 5 | 3 = 0 + 1 + 1 + 1 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| global lcm half | ℚ(ζ₈) | max 3 gives (8); ∞: ℚ(i) has (4)∞, so ∞ ∈ (8)∞ | holds; product gives 8 | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| same, real clause | ℚ(√2) | ∞ ∉ (8); both characters lack ∞ | both sides false | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.1 level | C₂ sign action on ℤ | A^{1} = ℤ, A^{C₂} = 0 | correct | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.1 finiteness | G = ℤ discrete, V = 0 | index ∞; excluded by `CompactSpace` | binder needed | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.2 range axiom | C₄; C = ℤ vs C = 0 | image {0, ¼, ½, ¾} vs {0} | excludes zero model | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.2 / 2.7 res, cor | degree 2, x = ⅓ | res x = ⅔; cor(⅓) = ⅓ | distinct multipliers | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.3 inflation | u₂ into C₄ layer | inf u₂ = 2u₄: ½ = 2·¼ | scaled | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.3 corestriction | U′ of index 2 | cor u(U′,V) = [U:U′]·u = 2u; [U′:U] meaningless | correct index | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.4 Tate | C₂, C = ℤ trivial | H¹ = 0; H² = ℤ/2; gives Ĥ⁰ = ℤ/2 ≅ Ĥ², Ĥ⁻¹ = 0 = Ĥ¹ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.5 direction | C₄, class of π | Nak(σ) = π, Art(π) = σ; geometric gives σ³ | discriminating | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.6 / 5.3 Frobenius | ℚ₂(ζ₅), x = 2 | 2 has order 4 mod 5; ζ₅ ↦ ζ₅² vs geometric ζ₅³ | discriminating | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.6 cyclotomic | ℚ₃, u = 4 | χ_cyc(Art(4)) = 4⁻¹ = 7 mod 9; geometric gives 4 | discriminating | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 2.7 ring class | cubic K, ℤ + f𝒪_K | index f² ≠ f | quadratic description is not general | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.1 trivial layer | U/U | N = id; quotient 1; Art = 1 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.2 cyclic generator | C₄, v(a) = 1 vs 2 | orders 4 vs 2 on both sides | iff discriminates | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.4 local quadratic | ℚ₂(i), a = 2, −1 | N(1+i) = 2 so 1; −1 non-norm so τ | both directions | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.4 global | ℚ(i): ℓ = 3, 5; ℚ(√5): ℓ = 2, 11 | τ, 1; τ (2 ≢ ±1 mod 5), 1 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.5 cyclotomic | ℚ(ζ₅): 2, 3, 11; ℚ(ζ₈): 3, 5, 7 | ζ₅², ζ₅³, ζ₅; ζ₈³, ζ₈⁵, ζ₈⁷ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.6 towers | ℚ(√5) ⊂ ℚ(ζ₅), ℓ = 2, 11; C₄ ⊃ C₂ | τ, 1; Ver(g) = g² vs quotient gC₂ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| 5.7 Hasse failure | ℚ(√13,√17), x = 25 | (17/13) = (4/13) = 1, 13 ≡ 8² mod 17; D₂ order 2; local everywhere true, global false | holds | locator R06; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 10 lift criterion | same field | local degrees ≤ 2, lcm 2 < 4 = #H²(G, C_L) | image index 2 | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 12 meet formula | two D₄ over one biquadratic B | G = D₄ ×_{V₄} D₄ of order 16, G′ = ⟨(r², r²)⟩, G^ab order 8 vs B of degree 4 | caveat correct | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 8 conductor | ℚ₂, U(K,1)·⟨2⟩ | U⁰ = U¹ (𝔽₂ˣ = 1), so N = ℚ₂ˣ and conductor 0 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 5 finiteness | 𝔽₂((t)), A = ℤ/2 | H¹ ≅ F/℘F infinite; README says finite | false as written | R01; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 5 Euler | ℚ₂: 𝔽₂; 𝔽₃; 0 | 8 = 2·2·2¹; 3 = 3·1·2⁰; 1 = 1·1·2⁰ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 5 dual action | ℚ₂, ℤ/3 with Frob = −1 | #H⁰ = 1; dual has Frob = (−1)(−1) = 1 so #H⁰ = 3 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 5 invariant | unramified cubic over ℚ₇, χ(Frob) = ⅓ | inv(7 ∪ δχ) = ⅓; geometric gives ⅔ | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 9 inseparable | 𝔽₂((s)) over 𝔽₂((t)), t = s² | index 1 vs [L:K] = 2; no ι exists | binder needed | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 9 degrees | unramified quadratic; ℚ₂(i) | deg_K = 2·deg_L; deg_K = deg_L; both index 2 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 13 ring class | ℤ + 2ℤ[i]; ℚ(ζ₇ + ζ₇⁻¹) | disc −16, h = 2/(1·2) = 1; Minkowski bound (6/27)·7 = 14/9 < 2 | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 12 admissibility | ℚ(i), modulus 1 and (4) | Cl = 1 but Art(3) ≠ 1; (ℤ/4)ˣ/±1 = 1 | rejection correct | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |
| Layer 14 | (−1, −1) over ℚ; p = 3, q = 7 | ramified at {2, ∞}: ½ + ½ = 0; (7/3)(3/7) = −1 = (−1)^{1·3} | holds | none; carried from [r7](packages/ClassFieldTheory/reports/PRREVIEW-ClassFieldTheory~7.md) |

The carried table has 52 rows; the fresh table has 15. The row about an unattained minimum records why the empty-set junk value is unreachable rather than supplying a numerical example. The remaining rows retain the concrete values from r7.

## Not verifiable

- Full direct elaboration of `Completed/LocalGaloisGroups/Suggested.lean` stops at the absent object file for `TauCetiRoadmap.ProfiniteCohomology.Suggested`; the ProfiniteProPGroups and LocalFieldsRamification roadmap objects are absent too. This is not evidence of a new source error. The prescribed targeted build does not include that consumer. The five extracted changed checks were verified separately; a complete consumer build remains unverified.
- **neukirch-ant** remains settled as uncertified, including V Theorem 6.2 and VI §7. **artin-tate** remains waived, including Chapter XIV §4 Theorem 1 and §6. **serre-local-fields** remains settled as uncertified, including IV §1, VI §2 and XV §2. The manifest and available legal cache were inspected; these texts were not requested again.
- The unchanged references to Tate 1952, Nakayama 1957, NSW, Serre's *Galois Cohomology*, Milne ADT, Cox, Weil 1951, Tate (Corvallis) and Cassels–Fröhlich retain r7's unverified status. They were not fetched again in this incremental review. No new external source was introduced by the diff, and none was guessed to support the added automatic-compatibility argument.
- Only the supplied open-head index and readable main/open-head files were used for ownership; no claim is made about unlisted or inaccessible work.

## Source issues

- **Gap** in milne-cft at V Theorem 3.27, printed p. 165: the source says the discriminant product follows from local theory and leaves its proof out; it should give the local deduction or a precise proof reference; affects the proof.
