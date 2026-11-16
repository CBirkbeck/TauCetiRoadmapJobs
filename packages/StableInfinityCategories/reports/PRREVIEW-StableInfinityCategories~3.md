# Review of StableInfinityCategories (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/StableInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/StableInfinityCategories/Suggested.lean` lines 8, 10, 11, 12 (imports of `…Quasicategory.CategoricalEquivalence`, `.InitialVertex`, `.Limit`, `.TerminalVertex`); `README.md` lines 206–207 ("`SSet.IsTerminalVertex`, `SSet.IsInitialVertex`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.catInfty` …, `SSet.QCat.IsCategoricalEquivalence`").

**Claim:** R01 of the two previous reviews, not repaired: the file is unchanged. The gate fails (`imports=4`, `build=9`), and the "From Tau Ceti" contract names six declarations the pin does not have.

**Witness:** Pinned Tau Ceti `2fd255d`: `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`.

**Repair:** At this pin keep `import Mathlib` alone and the six declarations of Layers 3 and 5 (`HomologicalTStructure`, `exists_equiv_tStructure`, `admissibleMorphism_ιHeart_eq_top`, `shortExact_iff_exists_distinguished`, `isHomological_of_iso_truncLE_truncGE`, `full_faithful_Γ₀`); that subset elaborates on a scratch copy with `sorry` as the only warning. Delete the other 27 declarations and name their headlines in the docstring under "Not statable at the pins", the missing carriers being `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.QCat.IsCategoricalEquivalence`. In the README remove those names and `SSet.catInfty` from "From Tau Ceti" and from the *Needs:* lines, and each sentence "The `Suggested.lean` declaration is …" for a deleted name. The file can return unchanged once main's pin has the four modules; the pin is outside this folder.

## R02 (P2) — Objects owned by roadmaps on main are planned again, and the scope section names none of the owners

**Location:** `README.md` lines 57–79 (`## Scope and ownership`): the only roadmap on main it names is "GeneralizedCohomology §G2"; targets §1.1.3, §6.1.1, §6.1.3, §6.3.1–§6.3.4, §7.3.5, §7.4.1, §7.5.2, §9.1.1, §9.4.2, §11.4.1, and the core of §12.2.1 (line 2544: "is constructed here").

**Claim:** R02 of the previous review, not repaired. Stability, `Ind_κ` of a small stable ∞-category, the quotient C/D with its universal property, mapping formula and approximation `C/D → Ind(C) → Ind(E) → E`, `Ind(C) → Ind(C/D)`, `Sp(C)` as the loop tower with its stability, tower limits as `fib(1 − s)`, the coproduct criterion and the page-one homological core have owners on main.

**Witness:** Main `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2042, 2192–2196, 2201–2204, 2264–2271; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 1205, 1296, 1660, 1700; `TauCetiRoadmap/StableHomotopyKTheory/README.md` line 2650.

**Repair:** Add to `## Scope and ownership`: "Stated by roadmaps on main, and only cited: BordismFormalGroups §F6.5 (pointed and stable ∞-categories in the pushout–pullback form; `Ind_κ` of a small stable ∞-category; the stable quotient C/D, its exact universal property, its filtered mapping-space formula and the approximation `C/D → Ind(C) → Ind(E) → E`; the localization `Ind(C) → Ind(C/D)`); EnhancedDerivedSheaves §E3.3 (`exact_preservesColimits_iff_coproducts`), §E2:towers.1 (`derivedTowerLimit`), §E5:presentability.2 (`stabilization`, `stabilization_stable`, `omegaInfinity`, `sigmaInfinity`, `spectra`), §E5:presentability.3 (`indVerdierLocalization`); StableHomotopyKTheory §7.23 (the homological core with first page 1 and indices `p − r ≤ p − 1 ≤ p ≤ p + r − 1`)." Delete §6.1.1, the fiber formula of §6.1.3, §6.3.1–§6.3.4, the localization and kernel assertions of §9.4.2, assertions (1)–(2) of §11.4.1 and "is constructed here" in §12.2.1, and cite those sections in the *Needs:* lines that used them. A statement that is kept says in one clause how it differs: §1.1.3 (the form of HA, Def. 1.1.1.9, identified with main's by §2.2.1), the Milnor sequence for Ext groups, the excisive-functor model of `Sp(C)` (§7.2–§7.4, identified with main's loop tower by §7.5.2), assertion (3) of §11.4.1. Moving ownership to this family instead takes a revision of the roadmaps on main, which this pull request does not contain.

## R03 (P3) — The second Check of §2.1.2 computes the wrong fiber

**Location:** `README.md` lines 666–667: "the connective spectra are closed under cofibers and contain 0, but the fiber of 𝕊 ⟶ 0 is 𝕊[−1], which is not connective".

**Claim:** The fiber of `𝕊 ⟶ 0` is 𝕊, which is connective, so the Check as written does not separate the connective spectra from a stable subcategory.

**Witness:** §1.1.2: a fiber of `g : X ⟶ Y` is a pullback square `W ⟶ X ⟶ Y` with zero corner; for `Y = 0` the pullback of `𝕊 ⟶ 0 ⟵ 0` is 𝕊. The fiber of `0 ⟶ 𝕊` is `Ω𝕊 = 𝕊[−1]`.

**Repair:** Replace "the fiber of 𝕊 ⟶ 0 is 𝕊[−1]" by "the fiber of 0 ⟶ 𝕊 is 𝕊[−1]" (π₋₁ of it is ℤ, so it is not connective).

## R04 (P3) — SpectralSequencesAndConvergence §7.4 is consumed without a supplier contract

**Location:** `README.md` lines 2741–2742: "TauCetiRoadmap.SpectralSequencesAndConvergence §7.4 (conditional convergence to the colimit and the half-plane criterion, for exact couples in `ModuleCat ℤ`)"; `## Exact supplier contracts`, lines 154–302.

**Claim:** R06 of the previous review, partly repaired: the *Needs:* line of §12.4.2 now names the supplier, but the contracts have subsections only for Mathlib, Tau Ceti, the earlier Parts and ModelCategoryTheory, so what is assumed of §7.4 is stated nowhere.

**Witness:** Main `TauCetiRoadmap/SpectralSequencesAndConvergence/README.md` lines 1767–1770: §7.4 is stated for an abelian category "with countable products and coproducts, exact sequential colimits, and replete", not for `ModuleCat ℤ`; line 1796 is the criterion used.

**Repair:** Add after "From TauCetiRoadmap.ModelCategoryTheory": "### From TauCetiRoadmap.SpectralSequencesAndConvergence — §7.4: for a cohomological exact couple in an abelian category with countable products and coproducts, exact sequential colimits and replete, conditional convergence to the colimit (`A^(+∞) = 0 = RA^(+∞)`) together with `RE_∞ = 0` gives strong convergence to `A^(−∞)`. Used in §12.4.2 for the couple `Aˢ = Ext(Z, Fₛ)` in `ModuleCat ℤ`, which satisfies these hypotheses."

## R05 (P3) — The contract still cites Part PresentableInfinityCategories §4.5 for the closure of local objects under limits

**Location:** `README.md` lines 293–294: "its truncated objects (§7.5); the closure of local objects under limits (§4.5); Postnikov completeness (§6.4 …)".

**Claim:** R08 of the previous review, partly repaired: the *Needs:* line of §2.3.4 is corrected and §2.3.4 proves the closure itself, but the contract entry remains and cites a section that states something else.

**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/PresentableInfinityCategories/README.md` line 459: "### 4.5 The pullback criterion for left exact localizations".

**Repair:** Delete "the closure of local objects under limits (§4.5); " at lines 293–294.

## R06 (P3) — The Checks of §1.1.1 repeat two bullets and contain a sentence without a subject

**Location:** `README.md` lines 341–350: "See also the Checks of Part InfinityCategoryFoundations §1.2. A Kan complex Z with one vertex x modeling K(ℤ, 2) is not: …"; "- Δ[1] is not: …"; "- The nerve of sets is not: …".

**Claim:** R13 of the previous review, partly repaired: the three new bullets were added in front of the old ones. "is not" has lost its predicate, the K(ℤ, 2) example is attached to the Δ[1] bullet, and Δ[1] and the nerve of sets are each treated twice.

**Witness:** Lines 339–341 and 346–350 give the same two examples with the same conclusions (∅ initial, ∗ final; 0 initial, 1 final, not equivalent).

**Repair:** Delete lines 346–350 and replace lines 342–345, after "(Conventions).", by a fourth bullet: "- A Kan complex Z with one vertex x modeling K(ℤ, 2) is not pointed: x is a zero object of hZ, while Map(x, x) ≃ ΩZ is a circle, so x is neither an initial nor a terminal vertex. A definition read in the homotopy category would accept it."

## R07 (P3) — §12.1.4 cites Part LimitsAndKanExtensions §7.6.2 for the pointwise form, which is §7.6.3

**Location:** `README.md` lines 2526–2527: "§7.4.2 (HTT, Lemma 4.3.2.13) and §7.6.2 (HTT, Def. 4.3.3.2, Prop. 4.3.3.5, the pointwise form)"; route, lines 2503–2504: "with the pointwise values of Part LimitsAndKanExtensions §7.6".

**Claim:** The route uses the pointwise values of a Kan extension along a functor that is not a full inclusion; the cited target is the comparison for full inclusions.

**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md` line 966: "**7.6.2. Full inclusions.**" (HTT, Prop. 4.3.3.5); line 969: "**7.6.3. The pointwise form.**" (Kerodon, Prop. 7.3.2.11).

**Repair:** Write "§7.4.2 (HTT, Lemma 4.3.2.13), §7.6.2 (HTT, Prop. 4.3.3.5, full inclusions) and §7.6.3 (the pointwise form, dually)", and in the route "with the pointwise values of Part LimitsAndKanExtensions §7.6.3".

## R08 (P3) — The third assertion of §11.4.1 does not say where X lives

**Location:** `README.md` lines 2359–2361: "and that an object X is compact exactly when every map from X to a small coproduct factors, up to homotopy, through a finite subcoproduct (HA, Prop. 1.4.4.1, p. 154)".

**Claim:** The source states the criterion for an object of a stable ∞-category with small colimits; the sentence carries neither hypothesis, and "between such" in the clause before it refers to functors.

**Witness:** HA line 5813: assertion (3) begins with a stable ∞-category admitting small colimits and an object X of it.

**Repair:** Replace by "and that an object X of a stable ∞-category with small colimits is compact exactly when every map from X to a small coproduct factors, up to homotopy, through a finite subcoproduct".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2 cofiber functor (sample) | N(Ab), `2 : ℤ → ℤ`; C^op | cofib = ℤ/2; maps cofib(f) → Z = maps Y → Z killing X = maps f → (0 → Z); HA lines 576–580, 636–657, 677 | holds | none |
| §2.2.1 pushout–pullback (sample, headline) | Δ[0]; N(Ab) | both sides true; ℤ/2 → 0 → 0 is a pushout, its pullback is 0: both sides false; HA line 1193 | iff both ways | R01 |
| §2.3 exact functors (sample) | τ≥0; F = Σ; f = 3 on 𝕊 | image of HZ[−1] → 0 → HZ is 0 → 0 → HZ; triangle iso needs a = b = c and a = −c in ℤ/3, a = ±1: none; HA lines 1309–1315, 3699, 5945 | holds | none |
| §5.2 unnormalized chains (sample) | constant object at A; Δ[0] | d(1) = d₀ − d₁ = 0, d(2) = id, H₀ = A; unsigned sum gives 2·id; HA lines 2197–2200, 2219–2223 | holds | none |
| §5.4 Alexander–Whitney (sample) | n = 2, p = 1 | components F(d₁, id), F(id, d₀); d ∘ AW₁ = F(d₀,d₀) − F(d₁,d₁); back vertex twice gives 2F(d₀,d₀) − F(d₀,d₁) − F(d₁,d₀); HA lines 2413–2466 | chain map | none |
| §6.3 Verdier quotients (sample, headline) | D = 0; D = C; torsion; even Euler characteristic | W = equivalences; C/D ≃ ∗; colim of ℤ along n is ℚ; χ(𝕊 ⊕ 𝕊) = 2, C/D = 0; NS lines 827–859 | holds | R02 |
| §7.1 excisive functors (sample) | id of S; constant at S⁰ | pushout S¹, pullback ΩS¹ ≃ ℤ ≠ S⁰; constant squares are pullbacks, value at ∗ not final; HA lines 5309–5343 | holds | none |
| §7.2 spectrum objects (sample) | Δ[0]; N(Set); HZ[−1] | Sp = Δ[0]; X(K) = ΩX(ΣK) = ∗; value at S⁰ is ∗, at S¹ is K(ℤ, 0); HA lines 5350–5354, 5538–5543 | holds | none |
| §7.6 spectra (sample) | (S⁰, ∗, ∗, …); inclusion of S^fin_∗ | ΩX(S¹) = ∗ ≠ S⁰; pushout S¹, pullback ℤ ≠ S⁰; HA line 5675 | holds | none |
| §10.2 stable P_Σ (sample) | FinSet; Δ[0]; Σ^∞₊ ∘ j(c) | F(n) = F(1)ⁿ gives Sp; F = 0; value at ∅ is 𝕊 ≠ 0; j(c) ⊔ j(c′) at ∅ is two points | holds | none |
| §10.4 universal property (sample) | FinSet, D = Sp; Δ[0] | both sides ≃ Sp, generator n ↦ 𝕊ⁿ; both sides a zero object; local maps for the empty family force F(∅) = 0 | holds | none |
| §11.2 accessible t-structures (sample) | (C, 0), (0, C); Sp≥0 | C and 0 presentable; limit of HZ along p has π₋₁ = ℤₚ/ℤ, so Sp≥0 is not closed under limits; HA lines 6027–6042 | holds | none |
| §11.4 coproduct criteria (sample) | 𝕊; ⊕ over ℕ of 𝕊 | π₀ of a sum has finite support; identity of the infinite sum factors through no finite subsum; HA lines 5809–5816 | holds with the source's hypothesis | R02, R08 |
| §12.1 Dold–Kan, Tot, replacement (sample, headline) | C = Δ[0]; n = 1; constant X; I discrete | both Δ[0]; Tot₁ = X⁰ ×_X¹ X⁰ with fiber N¹[−1]; Totₙ = Y; Πⁿ = ∏ X(s), one map σ∘β ⟶ (σ, β); HA lines 2950–2998 | holds | R01, R07 |
| §12.3 convergence (sample, headline) | X(k) = ⊕ over j > k of HZ; Sp^op | E_r(0,0) = ⊕ over j ≥ r of ℤ, E_∞ = 0 = π₀ colim; lim¹ = ℤₚ/ℤ, not compatible; HA lines 2036–2089 | holds | none |
| §1.7.1 triangulation (headline) | Δ[0]; N(Ab); rotation of X = X → 0 | zero category; Σ ≃ 0, hypothesis fails; last map −id, distinguished by TR1, TR2; HA line 1008 | holds | none |
| §3.1.1 `exists_equiv_tStructure` (headline) | (D, 0); (D, D); Mathlib fields | X′ = X, X″ = 0; id_Z ∈ Hom(Z, Z[1][−1]) = 0 forces Z = 0; `le n X ⇔ le 0 (X⟦n⟧)`; `ge_one_le` from `leZero_shift` at X⟦1⟧ | bijection | none |
| §3.3.1 `shortExact_iff_exists_distinguished` (headline) | 0 → X → 0; X = X → 0 | not short exact and triangle forces X = 0; short exact and distinguished | holds; not padding | none |
| §5.3.2 `full_faithful_Γ₀` (headline) | coordinate ring R of S², tangent P | R ⊕ Pⁿ ≅ R^(2n+1), N₁ = P not free; `Γ₀ ⋙ N₁ ≅ toKaroubi`; five probes fail | holds; not padding | none |
| §6.2.2 products (headline) | ι = ∅ | product Δ[0], stable; right side of `isExact_lift_iff` vacuous, left side true | holds | R01 |
| §7.5.3 loop criterion (headline) | Δ[0]; N(Ab); Lean vertices | Ω = id; Ω ≃ 0; (δ 1, δ 0) = (0,1), (δ 0, δ 1) = (1,0), (δ 0, δ 0) = (1,1), (δ 1, δ 1) = (0,0) | holds | R01 |
| §8.1 left completion (headline) | (C, 0); (0, C); F(0) = HZ | Ĉ = 0, C≥∞ = C; Ĉ = C, C≤−∞ = C; τ≤0 F(−1) = 0 ≠ HZ; C⁺ = `t.plus` | holds | none |
| §9.2, §9.3 freeness, localizations (headline) | ∅; unpointed S⁰; E = Δ[0] | Σ^∞₊ ∅ = 0; Σ^∞₊ S⁰ = 𝕊 ⊕ 𝕊, π₀ = ℤ²; Fun(Δ[0], Sp) = Sp | holds | none |
| §10.1.1 limit-preserving functors (headline) | 𝒫 = S; 𝒫 = Δ[0]; constant 𝕊 | Sp; value 0; value at ∅ is 𝕊 ≠ 0; SAG lines 4213–4224 | holds | none |
| §12.2.1 spectral sequence (headline) | X(0) = HZ; Mathlib core at b = p − 1, page r + 1 | E₁(0,0) = E₁(1,0) = ℤ, d₁ iso; i₀..i₃ = p−r, p−1, p, p+r−1; degree −p−q; positions (1,−1), (−1,0) | holds | R02 |
| §12.4.2 Bousfield–Kan | s = p, t = −q; couple `Aˢ = Ext(Z, Fₛ)` | π_(−p−q)(Nᵖ[−p]) = π_(−q) Nᵖ; lim = lim¹ = 0; `A^(−∞) = A^(−1)` = Ext(Z, Tot X); d = 1 gives Milnor | colimit end | R04 |
| §6.1.3 Milnor sequence | HZ tower along p; zero maps; constant tower | lim π₀ = 0, lim¹ = ℤₚ/ℤ = π₋₁; 1 − s = id, limit 0; diagonal Y | holds | R02 |
| §2.1.2 stable subcategories | 𝕊 ⟶ 0; 0 ⟶ 𝕊; ∅ | fiber 𝕊; fiber 𝕊[−1], π₋₁ = ℤ; empty subcategory has no zero object | Check false | R03 |
| §2.3.4 exact localizations | unit u, retraction r | (u ∘ r) ∘ u = u and maps LX → LX = maps X → LX give u ∘ r = id | holds | R05 |
| §1.1.1 pointed | N(Set); Δ[1]; one-vertex K(ℤ, 2) | Map(∗, ∅) = ∅; 0 ≄ 1; Map(x, x) ≃ S¹ | holds | R06 |

- Previous review at `7e04598`: R01 not repaired (R01); R02 not (R02); R03 repaired (§1.7.1, §2.3.3 use `Equivalence.hasShift`, `commShiftOfIntertwining`); R04 repaired; R05 repaired; R06 partly (R04); R07 repaired; R08 partly (R05); R09 repaired; R10 repaired; R11 repaired (`NOTES.md` gone); R12 repaired; R13 partly (R06).
- Source locators: 138 HA, 3 NS and 1 SAG statement–page pairs compared mechanically with the texts, none on a wrong page; 47 statements read at the locator (HA lines 576–680, 889, 985, 1187–1196, 1309–1318, 1713–1727, 1764–1768, 1885–1897, 2019–2089, 2197–2223, 2413–2529, 2624–2685, 2830–2863, 2950–2998, 3699–3701, 5309–5370, 5538–5543, 5675, 5707–5715, 5809–5818, 5945–5949, 6027–6042; NS lines 821–877; SAG lines 4210–4224).
- Library declarations opened at the pin: Tau Ceti `CategoryTheory/Shift/Autoequivalence.lean:356`, `:373`, `:423`, `:485`; `Shift/Intertwining.lean:411`, `:478`; `Algebra/Homology/SpectralObject/Abutment.lean:44–92`; `ModuleCat/Tower/Basic.lean:170`, `:174`, `:347`; `AlgebraicTopology/DoldKan/Monoidal.lean:271`, `:312`; `Quasicategory/FullSubcategory.lean:53`; `SimplicialSet/WeaklyContractible.lean:75`. Mathlib `SpectralObject/HasSpectralSequence.lean:67`, `:143`, `:303`; `SpectralObject/SpectralSequence.lean:479`, `:587`; `Triangulated/SpectralObject.lean:245`; `TStructure/Basic.lean:256–262`; `TStructure/AbelianSubcategory.lean:185`, `:298`; `Triangulated/Triangulated.lean:371`; `Shift/Basic.lean:591`.
- Cross-roadmap citations: 143 distinct sibling section ids resolved at this head, all present, each quoted HTT, HA or SAG number found in the cited target; 8 ModelCategoryTheory ids resolved at that pull request's head; SpectralSequencesAndConvergence §7.4 and StableHomotopyKTheory §7.23 resolved on main.
- Gate: FAIL (`imports=4`, `build=9`); every other check 0. Dependency check: `depcheck: 261 roadmaps, 2596 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder.
- Elaboration: the file cannot be elaborated at the pin (R01). A scratch copy of the Layer 3 and Layer 5 declarations with `import Mathlib` elaborates with `sorry` as the only warning; the six `#check` types agree with the README statements, nothing changed. 25 one-tactic probes (`simp`, `rfl`, `infer_instance`, `constructor <;> infer_instance`, `aesop`) fail on the five theorems. The 27 declarations of Layers 1, 2, 6, 7 and 12 were reviewed by reading.
- Pull request text: no sentence about this folder is contradicted by the head (README 33,740 words against "33.7k"); the description states the pin gap of R01 and the overlap of R02.
- Overlap check: read KanQuillen, EnrichedLocalization, SimplicialCategories, QuasicoherentSheavesOnPrestacks, EnhancedDerivedSheaves (main and its open revision), BordismFormalGroups (main), StableHomotopyKTheory (main), SpectralSequencesAndConvergence (main); shared: stability, `Ind_κ`, the stable quotient, its approximation and Ind-completion (owner BordismFormalGroups §F6.5), tower limits, the coproduct criterion, `Sp(C)` and its stability (owner EnhancedDerivedSheaves), the page-one homological core (owner StableHomotopyKTheory §7.23), all R02; Boardman's theorems (owner SpectralSequencesAndConvergence §7.4, cited, R04); QuasicoherentSheavesOnPrestacks consumes §11.1.1 as stated; nothing shared with the ModelCategoryTheory Parts.
- Source independence: 47 passages compared with 3 sources (HA, NS, SAG), longest shared run 6 words, none copied; largest share HTT, 479 of 740 locators, all of them back-references in supplier citations, so its contents were not compared; the targets' own source is HA, 236 locators; contents compared with HA Ch. 1: Layers 1, 5 and 7 run beside §§1.1.1–1.1.2, §1.2.3 and §1.4.2 in the order the *Needs:* lines force, Layers 2–4, 6, 8 and 12 split and regroup §§1.1.3–1.2.4, Layers 9–11 regroup §§1.4.3–1.4.4 with NS and SAG: independent.
- Research link: Layers 1–3 and 7–11 are the stable ∞-categories, t-structures and spectra of Lurie (2017, HA Ch. 1); Layer 6 and §9.4 are the Verdier quotients that Nikolaus–Scholze (2018) use for the Tate construction; §10.1 is the form Lurie (2018, SAG §1.3.2) uses for sheaves of spectra. Rests on the README's references and the texts read.

## Not verifiable

- Boardman, Def. 5.10 and Thm. 7.1: no legal copy was read; §12.4.2 was checked against the reading of Def. 5.10 in SpectralSequencesAndConvergence §7.4 on main.
- BBD, Thm. 1.3.6: not read (cited by locator only); checked against the pinned Mathlib's `AbelianSubcategory` file.
- Bousfield–Kan, Ch. X and XI: paywalled, not read.
- Kerodon, Prop. 7.3.5.1 (tag 0300) and Stacks, Tags 08TC and 0919: not fetched.
- The Tau Ceti definitions `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.QCat.IsCategoricalEquivalence` and `SSet.catInfty` are absent at the pin: their bodies were not read, and the Lean statements built on them were not elaborated.
- The homological core of §12.2.1 (`r₀ = 1`, indexed by ℤ) was checked on its endpoint inequalities and on one example, not elaborated.

## Source issues

- **Gap** in HA at Lemma 1.1.3.3, p. 30: the source says a full subcategory closed under cofibers and translations is a stable subcategory; it should assume the subcategory nonempty, the empty one having no zero object; affects a stated result.
- **Misprint** in HA at the proof of Proposition 1.2.1.17, p. 44: the source says the opposite of the left completion is the spectrum objects of C≤0; it should be the spectrum objects of the opposite of C≤0; affects nothing.
- **Misprint** in HA at the proof of Proposition 1.2.2.14 (i), p. 53: the source says the target of the differential is a quotient of the homotopy of X(p−2r, p−r) in degree p+q; it should be degree p+q−1; affects nothing.
- **Misprint** in HA at the proof of Proposition 1.2.2.14 (iii), p. 53: the source says the image is taken in the homotopy of X(p−1, p+r); it should be X(p−1, p+r−1), as in Construction 1.2.2.6; affects nothing.

## For the human reviewers

- Ownership: the description asks the maintainers to choose the owner of the generic stable ∞-categorical material among this family, BordismFormalGroups §F6.5 with EnhancedDerivedSheaves (main), and the open revision of GeneralizedCohomology; R02 applies the rule that main owns.
- Pin: the description says the files elaborate against Tau Ceti `8b9f13d993`; that commit was not available to this review, and a pin bump lies outside the folder (R01, raised a third time).
- Licence: HA and SAG are author PDFs on math.ias.edu that are not published books (HTT is); they were read as author-page copies. BBD, Boardman and Bousfield–Kan were not read.
