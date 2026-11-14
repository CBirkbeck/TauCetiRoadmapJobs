# Review of ModelCategories (pull request #2269 at ac5fe3a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/`
**Verdict:** needs changes

## R01 (P2) — The ownership distinction requested previously is still absent

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:37–56`, “Scope and ownership”.
**Claim** The scope still omits the existing owners of the pointed under-category and Bergner diagram instances of §§3.3, 7.2 and 7.5–7.7. The general statements need an explicit distinction from these instances.
**Witness** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:226–227` owns the pointed under-category model; main `TauCetiRoadmap/BordismFormalGroups/README.md:1663–1666,1692–1694` owns projective and Reedy diagram structures on the Bergner model.
**Repair** Add: “GeneralizedCohomology G2 item 1 owns the pointed simplicial-set instance on `Under Δ[0]`; §3.3 gives the construction under any object of any model category. BordismFormalGroups §F6.5 owns projective diagrams, latching and matching objects and Reedy structures for its Bergner model; §7.2 and §§7.5–7.7 give these for arbitrary combinatorial and arbitrary model categories, respectively.”

## R02 (P3) — The repaired route still invokes an unstated one-cardinal criterion

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:869–872`: “For generation use §5.3 at one cardinal”.
**Claim** §5.3.1 still requires the condition for all sufficiently large regular τ. The single-cardinal implication requested previously is absent; both §5.4 routes need it. Also, `uniformization` alone supplies no bound κ₀ ≥ κ.
**Witness** README:842–845 quantifies over all sufficiently large τ; HTT line 38098 fixes one suitable τ. `Mathlib/CategoryTheory/Presentable/Uniformization.lean:127–131` returns one cardinal without a prescribed lower bound.
**Repair** Append to §5.3.1: “For the reverse implication, one regular τ with κ ≪ τ suffices if C is locally τ-presentable and the condition holds at τ (HTT, proof of Prop. A.2.6.5, PDF p. 838).” In §5.4.1 write: “Obtain ρ from `IsCardinalAccessibleCategory.uniformization`; choose regular κ₀ ≥ κ sharply above ρ and apply `uniformization_aux`, then choose τ = (2^ν)⁺ with ν ≥ κ₀ above the bounds for local presentability and the criterion for D₀. Apply the one-cardinal implication of §5.3.1.” Include `uniformization_aux` in *Needs*. This gives κ₀ ≤ 2^ν < τ and β^α ≤ 2^ν < τ for β < τ, α < κ₀.

## R03 (P3) — Renumbering §7.4.2 breaks its consumers

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:1160`: “**7.4.1.** Prove the comparison with Lurie's definition and the induction principle”.
**Claim** Former §7.4.2 has become §7.4.1 without an old-to-new mapping. Existing citations now name an absent target.
**Witness** At this head of #2269, `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/README.md:263,865` still cites ModelCategories §7.4.2 for Reedy categories and good filtrations.
**Repair** Add: “Former target numbering: §7.4.1 is now the supplied vocabulary in §7.4; §7.4.2 is now §7.4.1; §8.1.1 is now §8.1; §8.3.1 is now §8.3.” This resolves the two surviving §7.4.2 citations to the good-filtration target.

## R04 (P3) — The description omits the target-numbering changes

**Location** Pull request description, “What is in it” and “Relation to existing roadmaps”.
**Claim** The description does not disclose the replacement of ModelCategories §7.4.2 by §7.4.1 or the removal of the supplied-vocabulary labels §7.4.1, §8.1.1 and §8.3.1, although consumers cite these ids.
**Witness** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:1151,1160,1341,1413` contains the replacement target and three unnumbered supplied-vocabulary passages; `TauCetiRoadmap/ModelCategoryTheory/KanQuillen/README.md:865` retains the former target citation.
**Repair** Add to the description: “ModelCategories moves the Reedy comparison and good-filtration target from §7.4.2 to §7.4.1. The former supplied-vocabulary targets §7.4.1, §8.1.1 and §8.3.1 are now unnumbered material in §§7.4, 8.1 and 8.3; the README records their former numbering.”

## Previous findings

- R01 — not repaired: “Scope and ownership” still lists only library material and sibling Parts; GeneralizedCohomology and BordismFormalGroups remain unnamed.
- R02 — partly repaired: §5.4.1 now names `uniformization_aux`, but §5.3.1 still says “for all sufficiently large regular τ”; the one-cardinal implication is missing.
- R03 — repaired: Summary: “The preimage of a perfect class under a functor preserving filtered colimits is perfect”.
- R04 — repaired: `le_transfiniteCompositions_pushouts` retains `hgen` and drops `hS`; weak saturation follows from the intersection defining `weakSaturation`.
- R05 — repaired: The description now says LocallyPresentableCategories leaves this material to HigherToposTheory and its deferral needs repointing.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.4 `le_transfiniteCompositions_pushouts` | Sets; κ = ℵ₁; S = injections; inclusion 2 → 5 | Three pushouts of ∅ → 1 give sizes 2 → 3 → 4 → 5; composite is the original inclusion. | Generation implies saturation; removal of `hS` valid | none |
| §3.3 under-category model | Trivial model on sets under 2; map (2 → 2) → (2 → 1) | Underlying fold is cofibration and fibration, not weak equivalence; under-category gives the same three truth values. | Classes agree | R01 ownership |
| §§5.3–5.4 criterion and preimage | Identity of Set; κ = ℵ₀; τ = (2^ℵ₀)⁺; X = {0,1} | A = B = P(X) has 4 objects, colimit X has 2; β^n ≤ 2^ℵ₀ < τ. | Mathematical test holds; one τ does not supply the written quantifier | R02 |
| §5.4.2 intersection route | Set; subcategories {∅}, Set; κ = ℵ₀; τ = ℵ₁ | Intersection = {∅}; generator {∅}; colimit of every nonempty constant ∅ diagram = ∅. | One-cardinal implication needed in route | R02 |
| Summary and §5.5 preimage of perfect class | F : Set → Set constant at 1; W = bijections | F(∅) = 1, so F fails initial-colimit preservation; filtered colimits preserved; F⁻¹W = all maps, generated by finite maps. | Filtered-colimit hypothesis suffices | none |
| §7.2 projective model | Discrete two-object J; trivial model on Set | Cof = all pairs; Fib = all pairs; W = pairs of bijections; llp against W = all pairs. | Product model | R01 ownership |
| §7.4 supplied Reedy structure and renumbered §7.4.1 | Δ; one-object monoid ℕ, W₁ = identities, W₂ = all | [1] → [0] lowers 1 to 0; ℕ has empty strict object relation, but endomorphism 1 would require d < d. | Extra endomorphism condition excludes wrong model | R03, R04 numbering |
| §§7.5, 7.7 latching, matching and Reedy classes | Discrete two-object J; trivial model on Set | L = ∅, M = 1; relative maps = component maps; (WC) and (WF) both equal pairs of bijections. | Reedy = product; both trivial-class identities hold | R01 ownership |
| §7.6.1 stage extension | Walking arrow 0 → 1, adding 1; X(0) = 2 | L₁ = 2, M₁ = 1; extensions with X(1) = 3 number 3² = 9, as do factorizations 2 → 3 → 1. | Renumbered prerequisite supplies filtration | none |
| §7.6.2 chain filtration | Walking arrow, adding 1 | No positive nonidentity chains at 1: S = ∅; X(∅) = Δ[1]; join pushout also Δ[1]. | Initial and final terms coincide | none |
| §8.1 supplied monoidal vocabulary | Finite sets; A = 2, B = 3, C = 2 | Hom(A×B,C) has 2⁶ = 64 elements; Hom(B,C^A) has 4³ = 64; A⊔∅ has 2 elements. | Cartesian closed; coproduct alternative fails | none |
| §8.2 dependency on §8.1 | Set enrichment, v = ∅, X = 2 | Tensor ∅×2 = ∅; cotensor 2^∅ = 1; swapped conventions give different cardinalities. | Orientation retained | none |
| §8.3 supplied coend | Discrete two-object J; F-values 1,2; G-values 1,1 | Coend has 1×1 + 2×1 = 3 points; end has (1×1)(2×1) = 2. | Coequalizer/coproduct orientation retained | none |

Untouched statement rows stand as in the previous review of `3bceb5a`.

- Sources: 13 numbered HTT locators and the coend passage checked in the changed passages and their prerequisites, including sampled §§5.4 and 8.1; HTT lines 37508, 38056–38124, 38345–38367, 38823–38959, 36799–36865, 39387–39397.
- Pins: opened `Mathlib/CategoryTheory/Presentable/Uniformization.lean:61,127`, `Presentable/SharplyLT/Lemmas.lean:62,75`, `AlgebraicTopology/Reedy/Basic.lean:45,64`, `CategoryTheory/Monoidal/Closed/Basic.lean:46`, `Monoidal/Cartesian/Basic.lean:222`, `Limits/Shapes/End.lean:289`; no new library duplicate introduced.
- Signatures: all 36 actual declarations checked with `#check @name`; required binders retained, only the intended `hS` removed. The worker's 38-name list includes two docstring words, `exists` and `with`, which are not declarations.
- Padding: the changed theorem does not close with `rfl`, `infer_instance`, `simp` or `exact hgen`; the remaining headline and padding checks stand from the previous review.
- Gate: worker reports every check passed; rerun reports only `outside-folder=9`, all explicitly permitted sibling/family files (false positive); no disallowed outside change. Targeted build and direct elaboration pass with 17 `sorry` warnings only.
- Dependency output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE. Changed internal citations resolve; two incoming citations fail as in R03. The description's LocallyPresentableCategories claim resolves against #1926, README:82–84.
- Overlap check: read PresentableInfinityCategories, AccessibleInfinityCategories, AdjunctionsAndLocalizations, LocallyPresentableCategories, Straightening, BordismFormalGroups, StableHomotopyKTheory, EnhancedDerivedSheaves, and GeneralizedCohomology; shared instances belong to GeneralizedCohomology G2 item 1 and BordismFormalGroups §F6.5 (R01); the other scopes distinguish ordinary from ∞-categorical results or consume the model-category foundations.
- Source independence: 6 changed mathematical passages compared with HTT and pinned Mathlib, no copied expression or reused material found (changed passages only); largest share remains HTT, 69 of 76 locators as counted previously. No layer added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- Prior source limitations persist: Hirschhorn Thm. 7.6.5 and May–Ponto §15.3 (legal text not found), Adámek–Rosický ch. 2 and Hovey §5.1 (legal text not found), Crans (paywalled locator only); no newly required inaccessible text.

## Source issues

- **Misprint** in HTT at Definition A.2.6.12, printed page 825: the source says W consists of morphisms in C; it should be morphisms in the presentable category A just introduced; affects nothing.
- **Error** in HTT at Definition A.2.9.1, printed page 835: the source says identity isomorphisms and well-foundedness on distinct objects suffice; it should also exclude nonidentity endomorphisms in either factorization class, as the one-object monoid ℕ shows; affects a stated result.
- **Misprint** in HTT at §A.2.9, coend definition, printed page 847: the source says the target admits small limits; it should be small colimits for the displayed coequalizer of coproducts; affects nothing.
- **Misprint** in pinned Mathlib at `CategoryTheory/Limits/Shapes/End.lean:288` (no printed page): the source says the declaration constructs an end; it should say coend; affects nothing.

## For the human reviewers

- **Scope.** The description proposes this family as supplier for instances owned by BordismFormalGroups §F6.5 and GeneralizedCohomology G2 item 1, and records conflicting ownership in #1807; R01 concerns the missing distinction in this README.
- **Scope.** HTT supplies 69 of 76 locators; Layers 1–7 follow its Appendix A.1.1–A.2.9 order. The prior arrangement comparison stands because no layer changed.
- **Licence.** HTT was read from the author's page, version of 9 April 2017; `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:1449–1454` cites that PDF's numbering and pages.
- **Not tested.** Hirschhorn, May–Ponto, Adámek–Rosický, Hovey and Crans remain unavailable from the previous review; wording in §§3.3, 5.3 and 7.6.1 was not compared with those texts.
- The description says three sibling `Suggested.lean` files need a Tau Ceti pin bump; this folder imports only Mathlib and passes its targeted build at the stated pins.
