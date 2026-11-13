# Review of PrestableInfinityCategories (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/`
**Verdict:** needs changes

## R01 (P2) — Tau Ceti declarations cited as supplied are absent at the pinned Tau Ceti

**Location:** `README.md` line 49 and lines 96–101 ("From Tau Ceti"), and the `Suggested.lean` docstring lines 22–24: "Tau Ceti already has limits and colimits in quasicategories (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`), fully faithful functors (`SSet.IsFullyFaithful`), the ∞-category of ∞-categories (`SSet.catInfty`)".
**Claim:** At the pin (`lake-manifest.json`, TauCeti `2fd255d`) five cited declarations and five cited files do not exist: `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`Quasicategory/Limit.lean`), `SSet.IsFullyFaithful` (`Quasicategory/FullyFaithful.lean`), `SSet.catInfty` (`Quasicategory/CatInfty.lean`), `CategoryTheory.NatTrans.fibration_whiskerRight_forget_addCommGrpCat_of_epi` (`SimplicialGroup/Fibration.lean`); `SSet.kanComplex_of_addGroup` is cited at `SimplicialGroup/Basic.lean`, which does not exist.
**Witness:** Pinned `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `KanComplex/` holds `HomotopyGroup`, `MooreComplex`, `PtSimplex`, `SimplicialGroup.lean` (`kanComplex_of_addGroup` at line 214). No occurrence of the five names in the pinned tree.
**Repair:** Merge after the Tau Ceti pin contains these declarations, then recheck the six names and paths at that pin. To merge at the present pin instead: remove the five declarations from line 49, from "From Tau Ceti" and from the docstring, cite for each notion the Part section that owns it, and cite `SSet.kanComplex_of_addGroup` at `TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/SimplicialGroup.lean`.

## R02 (P3) — `isNoetherianObject_of_exact` is Mathlib's `ObjectProperty.prop_X₂_of_exact`

**Location:** `Suggested.lean` lines 67–72; `README.md` §1.1.1, bullet "For a sequence X′ → X → X″ that is exact only in the middle, X is Noetherian when X′ and X″ are … `isNoetherianObject_of_exact`" and its *Needs:* line.
**Claim:** The declaration is one library lemma applied to the first headline, and the README restates, with the same route through the two images, what Mathlib proves for every Serre class.
**Witness:** `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:62`, `prop_X₂_of_exact : S.Exact → P S.X₁ → P S.X₃ → P S.X₂`. Probe at the pin elaborates: `haveI := isNoetherianObject_isSerreClass A; ⟨(isNoetherianObject (C := A)).prop_X₂_of_exact hS h₁.1 h₃.1⟩`.
**Repair:** Delete it from `Suggested.lean`. In §1.1.1 replace the bullet's route and Lean name by: "For a sequence exact only in the middle this is Mathlib's `ObjectProperty.prop_X₂_of_exact` applied to the Serre class of Noetherian objects (SAG, Cor. C.6.8.3, p. 2086)", and add that lemma to "From Mathlib".

## R03 (P3) — `isLocalizingSerreClass_kernel` is not a headline and its Serre half is a Mathlib instance

**Location:** `Suggested.lean` lines 74–86 (`IsLocalizingSerreClass`, `isLocalizingSerreClass_kernel`); `README.md` §1.2.1: "The route: exactness makes the kernel closed under subobjects, quotients and extensions".
**Claim:** The Summary's headline list has no statement about localizing Serre classes, so the definition serves no headline; the Serre half of the theorem is already an instance at the pin and the README does not cite it.
**Witness:** `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:70`, `instance (F : D ⥤ C) [PreservesFiniteLimits F] [PreservesFiniteColimits F] : (P.inverseImage F).IsSerreClass`; probe `example … [PreservesFiniteLimits F] [PreservesColimitsOfSize.{v, v} F] : F.kernel.IsSerreClass := inferInstance` elaborates.
**Repair:** Delete both declarations from `Suggested.lean` and the two backticked names from §1.2.1. In the route write: "the Serre-class part is Mathlib's instance for `ObjectProperty.inverseImage` (`Functor.kernel` is `IsZero.inverseImage F`); what remains is closure under small coproducts, by `IsClosedUnderColimitsOfShape.inverseImage`", and list both in "From Mathlib".

## R04 (P3) — the Summary's stable-envelope headline differs from §2.3.2 and fails for the empty ∞-category

**Location:** `README.md` lines 27–28: "An ∞-category is prestable exactly when it embeds, fully faithfully and preserving finite colimits, into a stable ∞-category with image closed under extensions (SAG, Cor. C.1.2.3)."
**Claim:** This is condition (c‴) of SAG, Prop. C.1.2.2 without its standing hypothesis (pointed with finite colimits), not Cor. C.1.2.3.
**Witness:** C = ∅ ⊆ Sp: fully faithful, preserves every finite colimit of ∅ (there is none), image vacuously extension-closed; ∅ is not pointed, so not prestable. §2.3.2's form excludes it: the image must contain the empty colimit 0.
**Repair:** "An ∞-category is prestable exactly when it embeds fully faithfully into a stable ∞-category with essential image closed under finite colimits and extensions (SAG, Cor. C.1.2.3)."

## R05 (P3) — HTT 4.4.5.4 is a Definition, not a Proposition

**Location:** `README.md` line 111, "retracts (§2.2, HTT, Prop. 4.4.5.4)", and the *Needs:* line of §6.1.2, "Part PresheavesAndCompletions §2.2.1 (HTT, Prop. 4.4.5.4)".
**Claim:** The locator names a statement that does not exist.
**Witness:** HTT line 14432 is "Definition 4.4.5.4" (idempotents, weak and strong retraction diagrams); Part PresheavesAndCompletions §2.2.1 cites it as "HTT, Def. 4.4.5.4 (2), (3), p. 322".
**Repair:** Write "HTT, Def. 4.4.5.4" in both places.

## R06 (P3) — §3.3.2 uses, without a supplier, that the strict limit of a tower of Kan fibrations is the limit in S

**Location:** `README.md` §3.3.2: "modeled by a tower of Kan fibrations whose strict limit is the ∞-categorical limit X(a) = lim Xₙ(a) (ModelCategoryTheory, Part SimplicialCategories §4.2, HTT, Cor. A.2.9.25)".
**Claim:** The cited statement gives only invariance of limits of towers of fibrations under objectwise weak equivalence; the identification of that limit with a homotopy limit, and of homotopy limits with limits in S, is not in the *Needs:* line.
**Witness:** Part SimplicialCategories §4.2.2: an objectwise weak equivalence of such diagrams "induces a weak equivalence of colimits; dually for limits of towers of fibrations". §2.4.3 cites Part LimitsAndKanExtensions §3.2 for the same step for pushouts; §3.3.2 does not.
**Repair:** After the citation add: "a tower of fibrations of fibrant objects is injectively fibrant (Part SimplicialCategories §4.2.1), so its limit is the homotopy limit (§3.2.1), which is the limit in S (Part LimitsAndKanExtensions §3.2.1, HTT, Thm. 4.2.4.1)", and add these three items to the *Needs:* line.

## R07 (P3) — `Groth∞^comp` and `Groth∞^ch` are defined without Checks

**Location:** `README.md` §7.3.2: "Let `Groth∞^comp` ⊆ `Groth∞^lex` be the full subcategory on the complete objects (§3.3), and `Groth∞^ch` ⊆ `Groth∞^lex` the full subcategory on the anticomplete objects (§7.2)."
**Claim:** Two definitions carry no Check; every definition has at least three.
**Witness:** §7.3 has no `**Checks.**` list; the only instance is in the Layer 7 Examples.
**Repair:** Add to §7.3.2: "**Checks.** Mod_ℤ^cn lies in both subcategories and completion fixes it (§7.2). Sp≥0 lies in `Groth∞^comp` and not in `Groth∞^ch`; it is the completion of Ind(Sp^fb_≥0), which lies in `Groth∞^ch` and not in `Groth∞^comp`, since a complete object is its own completion and the two are not equivalent (Layer 7 Examples); so neither subcategory contains the other. Sp lies in neither, and its completion Δ[0] is also the completion of Δ[0]: on all of `Groth∞^lex` completion is not fully faithful, so the restriction to anticomplete objects is needed."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 Serre class (SAG C.6.8.2, line 76209) | Ab: ℤ, ℚ, 0; 0→ℤ→ℤ→ℤ/2 | Sub(0) has one element; ⅟(n!)ℤ strictly increasing in ℚ; all three terms Noetherian. `inferInstance` fails at pin | sound, not in Mathlib |
| §1.1 middle-exact form (C.6.8.3) | ℤ/2→ℤ⊕ℤ/2→ℤ; ℤ→ℤ⊕ℚ→ℚ | first gives Noetherian, second not; closes by `prop_X₂_of_exact` | R02 |
| §1.2 localizing class (C.5.1.2, line 73408) | torsion, finite, divisible, torsion-free groups; ι empty | ker(−⊗ℚ) ✓; ⊕ℕ ℤ/2 infinite; ℤ⊂ℚ; ℤ→ℤ/2; empty coproduct 0 agrees with `ContainsZero` | sound; R03 |
| §1.3.1 TFAE (C.6.8.4, line 76226) | X = 0; ℚ in Ab; R = k[x₁,…] in Mod_R | 0: sSup∅ = ⊥ = ⊤, empty coproduct epi, J a point; ℚ: all hold; R: sSup = ⊥ ≠ ⊤, no epi, no diagram | three forms agree |
| §1.3.2 Ind, compact = Noetherian (C.6.8.7–9, lines 76253–76292) | Ab; zero category; Mod_R, R = k[x₁,…] | ℤ both; ⊕ℕℤ, ℚ neither; R compact not Noetherian (category not locally Noetherian); `simp`, `inferInstance` fail | sound |
| §2.1 prestable (C.1.2.1, line 71089) | Δ[0], N(Ab), S∗, Sp≥0, ∅ | Σ = 0 on N(Ab); π₀Map(S⁰,S⁰) = 2 points vs ℤ; fib(0→Hℤ) = 0 so pullback, not pushout; ∅ fails (a) | definition determines object |
| §2.2 SW (C.1.1.1, C.1.1.7, lines 71001, 71052) | Sp≥0, N(Ab), finite pointed spaces | bounded-below spectra (⊕Σ⁻ⁿHℤ excluded); 0; colim πₖ(Sᵏ) = ℤ vs 2 points | sound |
| §2.3 envelope criteria (C.1.2.2, C.1.2.3, lines 71106, 71173) | C = ∅; "some ρ" ⇒ (c) | §2.3.2: image lacks 0, both sides false. Summary form: right side true, left false. fib(ρf) is an extension of ρY by ρZ | §2.3 sound; R04 |
| §3.1 connective parts (C.1.2.9, line 71195) | N(Ab), Sp≥0 | N(Ab): ρ : C → 0 not fully faithful, all three fail; Sp≥0: SW bounded below, Sp(C) = Sp | sound |
| §3.2 heart (C.1.2.11, line 71282) | Sp≥0, Sp | ΩΣHℤ = Hℤ ≠ 0 so ΣHℤ not discrete; heart of Sp is 0; cofib(2) = H(ℤ/2) discrete, cofib(Hℤ→0) = ΣHℤ not | sound |
| §3.3.2 completeness of P_Σ | route inputs | Cor. A.2.9.25 as stated in the supplier gives invariance only | R06 |
| §4.1 Grothendieck prestable (C.1.4.1, line 71366) | S∗, Sp, N(Ab) | S∗: Ω commutes with filtered colimits, not prestable (each condition includes prestability); Sp: D≤0 = 0 closed | sound |
| §4.3 localizing ⇔ left exact localization (C.2.3.3, C.2.3.8, lines 71810, 71833) | Σ(Mod_ℤ^cn); p-invertible objects; L = id, L = 0 | ℤ→0→Σℤ breaks two-of-three; ℤ→ℚ→ℚ/ℤ breaks (iii); C₀ = 0 and C₀ = C | sound |
| §5.1 `Groth∞`, stabilization (C.3.0.5, C.3.1.1, lines 72227, 72237) | Σ on Sp≥0; Sp≥0 ⊆ Sp; Ω∞ | fib(0→Hℤ) = 0, fib(0→ΣHℤ) = Hℤ; Sp(Σ) = Σ right t-exact; Ω∞ sends Σ⁻¹Hℤ→0→Hℤ to 0→0→Hℤ | sound |
| §5.3 filtered colimits (C.3.3.1, C.3.3.5, lines 72437, 72562) | hypotheses against source | "small filtered", closure in `Pr^L`, preservation by both inclusions all present | sound |
| §5.4 separated quotient, completion (C.3.6.1, C.3.6.3, lines 72739, 72785) | Sp, Sp≥0, D = C non-separated | Sp: C^sep = Ĉ = Δ[0]; Sp≥0: both identity; LX = 0 for X ≠ 0 ∞-connective | sound |
| §6.1 compact generation (C.6.1.1, C.6.1.3, lines 75362, 75366) | Sp≥0, Δ[0] | S compact in Sp≥0 and in Sp; hypotheses "small idempotent-complete with finite colimits" present | sound |
| §7.3 anticomplete models, completion equivalence (C.5.5.9, C.5.9.2, lines 74253, 75248) | Sp≥0, Mod_ℤ^cn, Sp | Ind(Sp^fb_≥0) ↦ Sp≥0, not equivalent (S compact, untruncated); Mod_ℤ^cn fixed; Sp ↦ Δ[0], Sp not anticomplete | sound; R07 |
| §8.2 almost compact closure (C.6.4.5, C.6.4.6, line 75572) | Mod_ℤ^cn; R = k[x,yᵢ]/(xyᵢ); Sp | Ann(x) = (y₁,y₂,…) not finitely generated, (a) fails; Sp: every object almost compact | sound |
| §8.4 recognition (C.6.7.1, line 76131) | Mod_ℤ^cn, Sp, Sp≥0, Δ[0] | Mod_ℤ^cn, Δ[0]: all four hold; Sp: coherent, not anticomplete, only truncated object 0; Sp≥0: S untruncated, all four fail | sound |
| §9.1 locally Noetherian prestable (C.6.9.1, C.6.9.3, lines 76334, 76342) | Mod_ℤ^cn, Sp, k[x₁,…] | almost compact ⇔ all πₙ finitely generated; Sp: heart 0, all πₙ = 0; heart Mod_R not locally Noetherian | sound |
| §9.2 recognition (C.6.9.7, C.6.9.8, lines 76357, 76414) | Sp, Mod_R^cn with R Noetherian | Sp: τ≤n = 0, (a), (b), (c) all hold; finitely generated modules have finite free resolutions | sound |
| §4.6 Ω∞ preserves sifted colimits (HA 1.4.3.9, p. 153) | statement against source | Sp≥0 → S, sifted colimits; not stated by Part StableInfinityCategories | sound, owned here |
| Supplier contract "From Tau Ceti" | 12 cited names at pin `2fd255d` | 7 found, 5 absent, 1 wrong path | R01 |
| HTT locators | 88 statement labels | 87 exist with the cited kind; 4.4.5.4 is a Definition | R05 |

- Source locators: SAG, 71 statement-and-page pairs matched against the text, 0 mismatches; 34 statements read for hypotheses. HA, 28 labels found. HTT, 88 labels, 87 found.
- Library: 37 Mathlib names of "From Mathlib" resolve by `#check` at the pin; instance `Quasicategory ((ihom A).obj X)` at `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean:157`.
- Cross-roadmap: 192 citations of sibling Parts resolve to a heading and numbered item; 10 citations of ModelCategoryTheory Parts (ModelCategories §3.5.1–3, SimplicialCategories §3.2.1, §4.2.2, §6.4.1, KanQuillen §1.2.1, §1.3.3, §5.1.1, §5.3.1) resolve at the head of its pull request.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`. Gate at 04df60e: every check passed. No change outside the family folder.
- Elaboration of `Suggested.lean`: seven `sorry` warnings, nothing else. The nine `#check` types were compared with the README: no binder lost; `IsLocalizingSerreClass` is defined for any abelian A (README: Grothendieck abelian).
- One-tactic probe: `isNoetherianObject_of_exact` closes (R02); the Serre half of `isLocalizingSerreClass_kernel` is `inferInstance` (R03); `inferInstance` and `simp` fail on the Serre-class, local finite presentability and compact = Noetherian statements.
- Overlap check: read EnrichedLocalization, KanQuillen, SimplicialCategories, ModelCategories, AnalyticStacks, EnhancedDerivedSheaves, BordismFormalGroups; nothing shared. GeneralAlgebraicKTheoryPartII §1.2 uses additive ∞-categories in an E∞ description inside a K-theory target and owns no definition; owner of the definition: this roadmap §2.4.2.
- Source independence: 9 passages compared with 2 sources (SAG, HA), longest shared run 8 words, none copied; largest share SAG, 329 of 796 locators; contents compared with SAG Appendix C: independent (Layer 1 draws on C.5.1 and C.6.8, Layer 4 on C.1.4, C.2.3, C.4.3, C.5.2, Layer 7 on C.3.2, C.5.5, C.5.9).

## Not verifiable

- The five Tau Ceti declarations of R01 at the newer commit the description names: it is not the pin and was not read.
- HTT and HA statements other than HA Prop. 1.4.3.9: existence and kind of each label checked, hypotheses not read (they are locators of supplier Parts).
- Kerodon, Def. 6.2.1.1: not opened.

## Source issues

- **Misprint** in SAG at Rem. C.6.1.2, p. 2062: the source says left exactness of filtered colimits follows from a remark of HA whose number is printed as unresolved; it should be a resolved reference, for instance HTT, Ex. 7.3.4.4 for compactly generated ∞-categories; affects nothing.
- **Misprint** in SAG at Warning C.6.9.6, p. 2089: the source says the counterexample is the heart of the module category of R; it should be the prestable ∞-category of connective R-modules, whose heart is locally Noetherian; affects nothing.

## For the human reviewers

- Scope: the source with the largest share, SAG (329 of 796 locators), and HA are author's PDFs (versions of 3 February 2018 and 18 September 2017), not published; HTT is published. Every prestable target has SAG Appendix C as its only source.
- Licence: SAG, HA and HTT were read from the author's page at math.ias.edu; no licence is stated on the files.
- The description asks for a separate Tau Ceti pin bump; this folder's `Suggested.lean` builds at the present pin, but its README cites declarations that exist only after the bump (R01).
- The description leaves to the maintainers the ownership conflict with BordismFormalGroups §F6.5, EnhancedDerivedSheaves and pull request #1807; no object of this folder was found in those texts.
