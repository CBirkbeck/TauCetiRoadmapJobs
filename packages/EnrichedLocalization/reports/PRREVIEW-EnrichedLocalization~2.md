# Review of EnrichedLocalization (pull request #2269 at ac5fe3a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/`
**Verdict:** needs changes

## R01 (P1) — The acceptance test still does not build

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/Suggested.lean:4 — `public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence`.

**Claim:** Previous R01 remains: the imported module and its predicate are absent at the pin. The worker's import/build failures reproduce in the targeted build and direct elaboration.

**Witness:** The targeted build reports the missing source module. Pinned `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60` supplies the realization-based weak-equivalence instance instead.

**Repair:** Import `TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence`, open scoped `SSet.modelCategoryQuillen`, and replace `SSet.IsWeakHomotopyEquivalence` by `HomotopicalAlgebra.WeakEquivalence`; align the README convention and supplier contract. This substitution elaborates all three declarations and their explicit signature checks with only the intended `sorry` warning.

## R02 (P1) — The ordinary category of enriched categories still has no supplier

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:101 — “`CategoryTheory.EnrichedCat.category` … the carrier of `Cat_S`”; Suggested.lean:21 repeats the availability claim.

**Claim:** Previous R02 remains for the ordinary category instance: the cited Tau Ceti module is absent and the sibling assumes it. Mathlib already supplies the bundled type and bicategory, so those must be reused.

**Witness:** Pinned `Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:32,112` defines EnrichedCat and its bicategory, but no EnrichedCat.category. PR #2269, `TauCetiRoadmap/ModelCategoryTheory/SimplicialCategories/README.md:886`, assumes that missing ordinary-category instance.

**Repair:** Reuse Mathlib's `EnrichedCat`, `EnrichedFunctor.id` and `EnrichedFunctor.comp` (CategoryTheory/Enriched/Basic.lean:313,322). Assign only the missing ordinary category instance to an explicit target in SimplicialCategories §5.1, then cite it here. Correct the README/docstring attribution and the claim that the Dwyer–Kan API exists at the pin.

## R03 (P2) — The simplicial constructions still have two owners

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:9 — “Maps in `hCat_S` are computed through chunks and path objects”; §§1.1–2.2 and 4.4.

**Claim:** Previous R03 remains: citing BordismFormalGroups for the new proof does not remove the independently planned simplicial chunks, localization, product/homotopy-colimit and diagram-limit constructions.

**Witness:** Main `TauCetiRoadmap/BordismFormalGroups/README.md:1624` owns chunks, :1641 internal Hom, :1655 localization, :1675 the Grothendieck comparison and :1741 diagram homotopy limits.

**Repair:** Make this a Part II extension with the boundary: “BordismFormalGroups §F6.5 supplies these constructions for simplicial enrichment. The targets here extend them to excellent monoidal bases.” Import its precise sub-lanes in the supplier contracts; keep only the additional generality as new targets.

## R04 (P2) — The three-index repair still concludes with the old comparison

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:1028 — “both … are then homotopy right Kan extensions of the same diagram on B”.

**Claim:** Previous R05 is only partly repaired. E now has domain T, but no replacement diagram on B is defined. SimplicialCategories §3.4.3 applies to B and requires pointwise equivalences; it does not establish this new comparison.

**Witness:** For two-point A₀, Y₀ = Y₁ = *, Y∞ = X = 2 and C = *, E(∞,0,0) has four points; Map(W(0),X) has two. Main `TauCetiRoadmap/BordismFormalGroups/README.md:1784` supplies the derived T-comparison.

**Repair:** Replace the B-conclusion by: “Set G(a) = Map(C,Z(a)), G′(c) = Map(W(c),X), and let πₐ, π꜀ project T to Aᵒᵖ. The projection α:E → πₐ*G is a pointwise trivial fibration; evaluation gives β:E → π꜀*G′. The comma-category contractions of BordismFormalGroups §F6.5 identify R Ran(πₐ)E with G and R Ran(πₐ)(π꜀*G′) with G′. Evaluation at (a,a,a) and the diagonal weak-exponential equivalence show R Ran(πₐ)β is an equivalence, yielding G ≃ G′.” This gives 4 ≅ 2 × 2 in the witness without asserting 4 → 2 is invertible. Cite that supplier in the Needs line and remove the obsolete B argument.

## R05 (P3) — The inline constructions still lack APIs and Checks

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:389 — “with categorical mapping cylinder M”; :756 — “has a cosimplicial resolution”.

**Claim:** Previous R08 remains: neither construction has its basic API and three discriminating Checks.

**Witness:** The mapping cylinder of id_* is [1], with one nonidentity arrow. In simplicial sets the constant cosimplicial point has degree-one latching map 2 → 1, so it is not Reedy cofibrant.

**Repair:** For M, state functoriality in squares, both inclusions and j restricted to D = id; test id_* giving [1], ∅ → D giving D, and * → {0,1} giving exactly one arrow to the chosen point. For Γ, state cofibrancy of Γ(c,0), weak-equivalence structure maps and augmentation-compatible morphisms; test Δ[•] resolving *, the rejected constant point (2 → 1), and the constant empty resolution (∅ → ∅).

## R06 (P3) — Put the restored Grothendieck API in a list

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:441 — “The API: a natural transformation …”.

**Claim:** Previous R07's mathematical content is restored, but the required API bullet list is still absent: three independent facts are embedded in one paragraph.

**Witness:** README.md:441–444 contains induced functoriality, the projection property and transition compatibility as semicolon-separated prose; the Checks list starts at :446.

**Repair:** Keep the existing three facts and locator, placing induced functoriality, the πₐ property and transition compatibility in three separate API bullets before Checks. For the terminal diagram on 0 < 1, π₁ still sends all three arrows to id.

## R07 (P3) — The changed coend display fails the TeX gate

**Location:** TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:767 — the code span beginning `L(X) = ∫^{c, n} X(c)_n ·` continues on the next line.

**Claim:** The worker's and rerun gate's `tex` rule flags the TeX superscript in this split code span.

**Witness:** Both gate outputs contain `tex: line 767`; the closing backtick is on README.md:768.

**Repair:** Keep the complete formula on one physical line inside one code span: `L(X) = ∫^{c, n} X(c)_n · Γ(c, n)`. Wrap the surrounding prose instead.

## R08 (P3) — The description omits the newly consumed supplier

**Location:** Pull-request description, “**Consumed from other roadmaps:** none.”

**Claim:** The description is contradicted by the new BordismFormalGroups dependency in the proof of §4.3.1.

**Witness:** `TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/README.md:1023` explicitly imports the three-index comparison from BordismFormalGroups §F6.5.

**Repair:** Replace the sentence by: “Consumed from other roadmaps: BordismFormalGroups §F6.5 supplies the three-index derived-right-Kan-extension comparison used by EnrichedLocalization §4.3.1.” Update the overlap paragraph to reflect the ownership boundary once R03 is repaired.

## Previous findings

- R01 — not repaired: Suggested.lean:4 still imports the absent WeakHomotopyEquivalence module; all three declarations retain its predicate.
- R02 — not repaired: README.md:101 and Suggested.lean:21 still claim the ordinary-category API is pinned. Mathlib has the bundled type and bicategory; the repair must reuse those and supply only the missing instance.
- R03 — not repaired: §§1.1–2.2 and 4.4 still plan the simplicial constructions; :1023 adds a proof citation without an ownership boundary.
- R04 — repaired: §3.3.2 assumes small colimits and a resolution, and excludes finite sets by the countable-coproduct Check. With Γ given, the Hom-set right adjoint needs no small-limit construction.
- R05 — partly repaired: :1022–1024 defines T and E with compatible variance; :1028–1029 still concludes through an unspecified diagram on B.
- R06 — repaired: §2.2.3 lists both identities and the nonidentity arrow in W(p), giving three arrows for the terminal diagram on 0 < 1.
- R07 — partly repaired: §2.2.3 supplies all three requested API facts, but :441–444 does not put them in the required API list.
- R08 — not repaired: §2.1.3 and §3.3.1 still introduce the mapping cylinder and resolution without their API lists and three Checks.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §2.2.3 Groth(p), W(p) | Terminal diagram on 0 < 1 | Objects: 2; arrows: 3; W: 3 | [1] has 2 identities and 1 transport arrow | agrees | Previous R06 repaired |
| §2.2.3 functoriality and π₁ | Constant * → constant {0,1}, choosing 0 | Transport 0 → 1 maps to transport (0,0) → (1,0) | π₁ sends every transport to id₀ | agrees | R06: list format only |
| §2.2.3 restriction compatibility | Constant {0,1} on 0 < 1 | π₁ restricted to fiber 0 sends x ↦ x | p₀₁π₀ sends x ↦ x | equal on objects and arrows | API content repaired |
| §3.3.2 coend and adjunction | C = *; M = Set; Γ constant 1; X discrete 2 | L(X) = 2; Hom(2,2) has 4 elements | Hom(X,R(2)) has 4 elements | agrees | Small colimits added |
| §3.3.2 negative Check | Finite sets; all maps weak equivalences/cofibrations; fibrations isomorphisms | Proposed L(ℕ) would have finite size m | Adjunction would require 2^m = 2^ℵ₀ | impossible | Previous R04 repaired |
| §4.3.1 theorem | A₀ two points; Y₀ = Y₁ = *; Y∞ = X = 2 | Z∞ = 2² has 4 points | Z₀ × Z₁ has 2 × 2 = 4 points | agrees | Theorem retained |
| §4.3.1 three-index E | Same instance; (a,b,c) = (∞,0,0) | E has 4 points; α:4 → 4 | β evaluates 4 functions at one point: 4 → 2 | α invertible; β not | R04 |
| §4.3.1 derived repair | Same instance; Q = {a = ∞} | Q nerve: tree with 5 vertices, 4 edges | lim over Q of G′(c) has 4 elements | derived comparison 4 ≅ 4 | R04 replacement |
| §2.1.3 mapping cylinder | id_*; ∅ → D; * → discrete 2 | Respectively [1], D, 3 objects with 1 nonidentity arrow | Retraction fixes D; reverse mixed homs empty | distinguishes cylinder | R05 |
| §3.3.1 resolution | Γ = Δ[•], constant *, constant ∅ | Degree-one latching maps: 2 ↪ Δ[1], 2 → 1, ∅ → ∅ | Cofibrations: yes, no, yes | distinguishes Reedy cofibrancy | R05 |
| IsLocal | S = {∅ → *}; Z = *, ∅ | Mapping tests: * → *, ∅ → * | Weak equivalences: yes, no | distinguishes locality | R01 import repair |
| localEquivalences | Same S; f:∅ → * | For local Z, restriction is Z → * | Both contractible; every f is local equivalence | agrees | R01 import repair |
| exists_localizedModelCategory | S empty / S = {∅ → *} | Weak equivalences: ordinary / all maps | Fibrant objects: Kan / contractible Kan | expected localizations | R01 blocks elaboration |
| Carrier and ownership contracts | Pinned enriched modules; simplicial specialization | Requested ordinary-category instances: 0; proposed simplicial-construction owners: 2 | Needed: 1 instance supplier, 1 construction owner | fails | R02–R03 |

Untouched mathematical rows stand as in the previous review of 3bceb5a.

- Sources: changed seeded sections §2.2, §3.3 and §4.3 checked against HTT Def. A.3.5.11, Rem. A.3.6.11, Lemma A.3.6.14, Prop. A.3.6.15 and Dug01a Prop. 2.3, Def. 3.2, Prop. 3.4, §9.5; previous R08's cylinder checked at HTT line 41561.
- Pins: 10 declaration sites opened—ModelCategory (Mathlib/AlgebraicTopology/ModelCategory/Basic.lean:43), KanComplex (AlgebraicTopology/SimplicialSet/KanComplex.lean:40), pre (CategoryTheory/Monoidal/Closed/Basic.lean:241), IsSmall (CategoryTheory/MorphismProperty/IsSmall.lean:35), isLocal (CategoryTheory/Localization/Bousfield.lean:55), weak-equivalence instance (TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60), EnrichedCat/bicategory (Mathlib/CategoryTheory/Enriched/EnrichedCat.lean:32,112), enriched id/comp (CategoryTheory/Enriched/Basic.lean:313,322).
- Suppliers: 54 explicit target IDs resolve at head (22 ModelCategories, 6 KanQuillen, 26 SimplicialCategories); changed §8.3 coend citation resolves; §4.3's B-versus-T contract remains R04.
- Headlines: representability, tensor/homotopy-colimits, localization, Dugger presentation and diagram homotopy limits; localization is the sole Lean theorem, the other four remain named with missing carriers in the docstring.
- Gate: worker `tex=1 imports=1 build=3 FAIL`; rerun reproduces tex/import hits; separate targeted build and direct elaboration both exit 1 at the missing import.
- Signature/padding probes: 3/3 `#check @…` commands elaborate after R01's substitution; smallness and monomorphism hypotheses remain explicit; `simp` does not close the sole theorem.
- Scope: 0 unauthorized outside-folder changes; rerun `outside-folder=9` lists only the three expressly authorized sibling folders and family-index files, so those lines are false positives under this brief.
- PR text: new roadmap, 2 files, 0 removed Lean declarations; the added BordismFormalGroups supplier contradicts the description (R08).

Dependency-check output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`.

Overlap check: read PresentableInfinityCategories, Straightening, LimitsAndKanExtensions, InfinityCategoryFoundations and PresheavesAndCompletions (#2270), and BordismFormalGroups, StableHomotopyKTheory and EnhancedDerivedSheaves on main; simplicial chunks/localization/products/diagram limits belong to BordismFormalGroups F6.5; quasicategorical comparisons to LimitsAndKanExtensions and PresentableInfinityCategories; stable and sheaf specializations to StableHomotopyKTheory and EnhancedDerivedSheaves. No additional shared construction was identified in the other scopes; R03 persists.

Source independence: changed passages only—6 passages compared with 2 sources, with no copied expression or reused material identified; HTT has the largest share, 196 of 218 explicitly named locator groups before References. No layer was added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- Submitted signatures cannot elaborate beyond the absent import; the successful scratch substitution is repair evidence, not a passing build of this head.
- Published Dugger pagination was not compared separately; source checks use the README's legal arXiv v1 text.

## Source issues

- **Misprint** in HTT at Lemma A.3.6.14, printed p. 902 (HTT line 41929): the source says G has domain A; it should have domain Aᵒᵖ for pullback along π; affects a stated result.
- **Gap** in HTT at Proposition A.3.6.15 proof, printed p. 903 (HTT lines 41968–41980): the source says its two-index pullback supplies both comparison diagrams; it should use compatible variance and justify the derived comparison, for example through separate indices c ≤ b ≤ a; affects the proof.

## For the human reviewers

- DK80 §7 remains uncertified because only the paywalled publication was resolved; the source's wording and arrangement were not inspected. HTT, the dominant source, and its contents were readable in the previous review.
