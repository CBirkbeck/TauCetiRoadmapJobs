# Review of ModelCategories (pull request #2269 at 2a6d75e)
Folder: `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/`
**Verdict:** needs changes

## R01 (P2) — The ownership distinction requested twice is still absent

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:37–56`, “Scope and ownership”.
**Claim** The scope names only library material and the sibling Parts. The roadmaps on main that own the pointed under-category instance and the Bergner diagram instances of §3.3, §7.2 and §§7.5–7.7 are not named, so these objects have two owners.
**Witness** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:226–227` (“the pointed undercategory model structure”); main `TauCetiRoadmap/BordismFormalGroups/README.md:1663–1666,1692–1694` (projective diagram models and Reedy structures with latching/matching objects on the Bergner model). `grep GeneralizedCohomology\|BordismFormalGroups` on the README at this head: no hit.
**Repair** Add to “Scope and ownership”: “GeneralizedCohomology G2 item 1 owns the pointed simplicial-set instance on `Under Δ[0]`; §3.3 gives the construction under any object of any model category. BordismFormalGroups §F6.5 owns projective diagrams, latching and matching objects and Reedy structures for its Bergner model; §7.2 and §§7.5–7.7 give these for arbitrary combinatorial and arbitrary model categories, respectively.”

## R02 (P3) — The second Check of §3.1.2 exhibits no failure of saturation

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:541–543`: “The statement fails without a model structure: in the category of chain complexes with quasi-isomorphisms replaced by chain homotopy equivalences as the candidate class, the two classes differ”.
**Claim** The class of chain homotopy equivalences is saturated: the localization at it is the homotopy category of complexes, where a map is invertible exactly when it is a homotopy equivalence. The example is not a negative control.
**Witness** Complexes over ℤ, f : (ℤ →2 ℤ) ⟶ ℤ/2: a quasi-isomorphism, not a homotopy equivalence, and not inverted in K(ℤ), since every chain map ℤ/2 ⟶ (ℤ →2 ℤ) is 0. No non-member is inverted.
**Repair** Replace the bullet by: “The statement needs the model axioms, not only two-out-of-three: on the category with two objects and one pair of mutually inverse maps a, b, the class of identities has two-out-of-three and its localization is the category itself, where a is an isomorphism outside the class. No model structure has this class, since every isomorphism of a model category is a weak equivalence.” (Tested: identities compose and cancel to identities; a ∘ b = 1, so a is inverted; a is not an identity.)

## R03 (P3) — The former-numbering note omits this head's own renumbering

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md:1219–1221`: “Former target numbering, for consumers that cite the earlier ids: the Reedy comparison and good-filtration target formerly numbered §7.4.2 is now §7.4.1”.
**Claim** The same change moves three more ids and the note lists none: former §8.2.1 (self-enrichment, change of base) is now unnumbered prose of §8.2; former §8.2.2 (tensors, cotensors) is now §8.2.1; former §3.1.2 (homotopy category against the localization) is now unnumbered prose of §3.1, and §3.1.2 is a different statement.
**Witness** README:511 (§3.1.2 is saturation), README:1438–1445 (unnumbered paragraph, then **8.2.1** tensors). A citation of the earlier §3.1.2 or §8.2.1 now resolves silently to another statement.
**Repair** Extend the note: “the tensor and cotensor target formerly numbered §8.2.2 is now §8.2.1; the supplied self-enrichment and change of base formerly numbered §8.2.1 is now the unnumbered prose of §8.2; the comparison of the homotopy category with the localization formerly numbered §3.1.2 is now the unnumbered prose of §3.1, and §3.1.2 is now the saturation of the weak equivalences.”

## Previous findings

- R01 — not repaired: “Scope and ownership” (README:37–56) still names only library material and the sibling Parts; GeneralizedCohomology and BordismFormalGroups are unnamed. Written again as R01.
- R02 — repaired: §5.3.1 adds “one regular τ with κ ≪ τ suffices, provided C is locally τ-presentable and the condition holds at that τ”; §5.4.1 chooses κ₀ ≥ κ sharply above ρ and lists `uniformization_aux`.
- R03 — repaired: README:1219–1221 maps former §7.4.2, §7.4.1, §8.1.1, §8.3.1; KanQuillen README:976,1019,1034–1035 now cite §7.4.1. The note is incomplete for this head's further moves (new R03).
- R04 — repaired: no citation of a former id remains (siblings and #2270 PresentableInfinityCategories cite §7.4.1 and §8.2.1 as now numbered); the description's “196 numbered statements” and word counts match this head.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.1.1 route (for-every ⟹ for-some) | Any cofibrant X, fibrant Y | Without an existing good cylinder, “through every cylinder” is vacuous; `Cylinder.exists_very_good`, `PathObject.exists_very_good` supply one each. | Added inputs are needed and exist at the pin | none |
| §3.1.2 saturation | Trivial model structure on Set; two-object groupoid with W = identities; complexes over ℤ with homotopy equivalences | Set: L = identity, inverted maps = bijections = W. Groupoid: a inverted, a ∉ W. K(ℤ): (ℤ →2 ℤ) ⟶ ℤ/2 not inverted. | Statement holds; Check 2 does not fail it | R02 |
| §3.4.2 Needs (§3.1.2, §3.1) | HTT proof of Lemma A.2.4.3 | Proof opens by reducing to an isomorphism in hC (p. 833); the conclusion “weak equivalence” needs exactly saturation plus the comparison of §3.1. | Needs line matches the route | none |
| §3.5 definition locator | HTT §A.2.4 | Definition starts after the proof on p. 833 and finishes on p. 834. | pp. 833–834 correct | none |
| §4.1 Needs lines | Ken Brown bullet; derived-functor bullet | Ken Brown uses only factorization and two-out-of-three; derived functors use the localization of §3.1, not a numbered target. | Both lines consistent | none |
| §5.3.1 one-cardinal form | Set, C₀ = Set, κ = τ = ℵ₀; C₀ empty | Every finite subset of a directed poset lies in a finite subset with a top element, partial colimit in Set; generators: finite sets. Empty C₀: condition vacuous, generated by ∅. | Holds at one τ | none |
| §5.4.1 route | κ₀ ≤ ν, τ = (2^ν)⁺, β < τ, α < κ₀ | β ≤ 2^ν, so β^α ≤ (2^ν)^ν = 2^ν < τ; κ₀ ≤ ν < 2^ν < τ; α < κ ≤ κ₀ gives κ ≪ τ. | τ sharply above κ₀ and κ ≪ τ | none |
| §8.2.1 converse (cotensor side) | Sets: v = 2, X = 3, Y = 2 | Hom(Y, P) with P = 3² has 9² = 81 elements; Hom(v × Y, X) = 3⁴ = 81. Hom(1, ^v(X^Y)) ≅ Hom(v ⊗ Y, X) in general. | v ⊗ − gets the adjoint: left-closed, as §8.1 defines it | none |
| §8.2.1 tensor functor and associativity | Right-closed V | Map(v ⊗ (w ⊗ X), Y) = (Map(X,Y)^w)^v; Hom(Z, (M^w)^v) = Hom(Z ⊗ v ⊗ w, M) = Hom(Z, M^(v⊗w)). | (v ⊗ w) ⊗ X ≅ v ⊗ (w ⊗ X), as HTT p. 816 | none |
| §3.3, §7.2, §§7.5–7.7 ownership | Main GeneralizedCohomology, BordismFormalGroups | Both own instances of these constructions; README names neither. | Two owners | R01 |

Statements the diff does not touch stand as in the previous review, of `ac5fe3a`; `Suggested.lean` is unchanged since that head.

- Sources: 9 HTT locators of the changed passages read at the text: Rem. A.1.2.4 with the next paragraph (HTT line 36653, p. 808), Rem. A.1.2.8 (36729), §A.1.4 tensor paragraph (37007–37033, pp. 816–817), Ex. A.1.4.5 (37035), §A.2.2 and Rem. A.2.2.2 (37712–37735, p. 830), Lemma A.2.4.3 proof (37851, p. 833), homotopy pushouts (37872–37910), Prop. A.2.6.5 proof (38097–38100, p. 838), Cor. A.2.6.8 (38125 statement, 38133 proof, p. 839). Sampled §§3.5, 4.1, 5.3 fall in changed passages and agree.
- Pins: opened `Mathlib/AlgebraicTopology/ModelCategory/Cylinder.lean:258`, `PathObject.lean:259`, `Homotopy.lean:212` (`RightHomotopyClass.whitehead`), `BifibrantObjectHomotopy.lean:482,522,545`, `Mathlib/CategoryTheory/Localization/LocalizerMorphism.lean:187`, `Mathlib/CategoryTheory/Presentable/Uniformization.lean:61,127`, `Mathlib/CategoryTheory/SmallObject/Basic.lean:127`. The pinned Mathlib has Whitehead's direction only; no declaration states the saturation of §3.1.2, so the target is not a duplicate. Nothing in the pinned Tau Ceti states it.
- Citations: incoming citations of the moved ids resolved at this head: KanQuillen §7.4.1 (4), SimplicialCategories §8.2.1 (5) and §8.2, #2270 PresentableInfinityCategories §8.2.1 (HTT, Ex. A.1.4.5); none names a former id. Outgoing: SimplicialCategories §1.4.1, §1.4.2 exist (README:346,361).
- Headlines: the diff adds no headline (§3.1.2 is not in the README's list) and changes no Lean declaration; padding and signature checks stand from the previous review.
- Gate: the worker's gate passes every check including the build. The rerun reports only `outside-folder=9`, the sibling Parts and family index files this pull request owns (not a finding); `git diff --stat` outside the family folder is empty. Direct elaboration of `Suggested.lean`: 17 `sorry` warnings, nothing else.
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap check: read PresentableInfinityCategories, AccessibleInfinityCategories, AdjunctionsAndLocalizations, LocallyPresentableCategories, Straightening, BordismFormalGroups, StableHomotopyKTheory, GeneralAlgebraicKTheory and GeneralizedCohomology (the last for R01); shared instances belong to GeneralizedCohomology G2 item 1 and BordismFormalGroups §F6.5 (R01); nothing else shared.
- Source independence: 6 passages compared with 1 source (HTT) and the pinned Mathlib docstrings, none shared (changed passages only); largest share HTT, 97 of 109 locator strings by count; no layer added, removed or reordered, so the previous contents comparison stands.
- Research link: the roadmap states the model-categorical appendix results (Lurie 2009, Appendix A.1–A.2: Smith's recognition theorem, projective and Reedy structures) that the InfinityCategoryTheory family and the Kan–Quillen, Bergner and Bousfield-localization Parts use; rests on the README summary and HTT.

## Not verifiable

- As in the previous review: Hirschhorn Thm. 7.6.5 and May–Ponto §15.3, Adámek–Rosický ch. 2 and Hovey §5.1 (no legal text found), Crans (paywalled, locator only). The changed passages cite none of them anew.

## Source issues

- **Gap** in HTT at Lemma A.2.4.3, proof, printed page 815: the source says showing the map is an isomorphism in the homotopy category suffices; it should cite that maps inverted in the homotopy category are weak equivalences; affects the proof.

## For the human reviewers

- **Scope.** The description proposes this family as supplier for instances owned by BordismFormalGroups §F6.5 and GeneralizedCohomology G2 item 1, and records conflicting ownership in #1807; R01 concerns the missing distinction in this README.
- **Scope.** HTT supplies nearly all locators (97 of 109 strings); Layers 1–7 follow its Appendix A.1.1–A.2.9 order. The prior arrangement comparison stands because no layer changed.
- **Licence.** HTT was read from the author's page, version of 9 April 2017; `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md` References cites that PDF's numbering and pages.
- **Not tested.** Hirschhorn, May–Ponto, Adámek–Rosický, Hovey and Crans remain unavailable; wording in §§3.3, 5.3 and 7.6.1 was not compared with those texts.
- The description says three sibling `Suggested.lean` files need a Tau Ceti pin bump; this folder imports only Mathlib and elaborates at the stated pins.
