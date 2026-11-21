# Review of FilteredLocalGaloisGroups (pull request #1795 at c56e72f)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 110 lines changed since c05d10f; the previous review had no findings, and its four small corrections and two format notes are all repaired without introducing a new problem. The three statements the change touches (0.3 without the Hausdorff hypothesis, 0.5 for an arbitrary subgroup, the new range equality of 2.0) hold on the instances computed, and `Suggested.lean` elaborates with `sorry` as its only warning. No small correction and no format note; one point is left for the human reviewers.

## Previous findings

The previous review (of c05d10f) had no findings (no R01, …). Its small corrections and format notes, each against this head:

- C01 — repaired: "It gives `[CharZero K]`, the hypothesis of Tau Ceti's `injective_artinMap`"; the ClassFieldTheory contract lists `injective_artinMap` and `profiniteCompletionArtinEquiv` "under `[CharZero K]`" among the implemented declarations.
- C02 — repaired: `map_closedDerivedSeries_solvableQuotient [CompactSpace G] (m n : ℕ)`; `topologicalClosure_commutator_eq_iInf … (N : Subgroup G)`; README 0.3 "For `G` compact", 0.5 "`N` any subgroup".
- C03 — repaired: 2.0 names `absoluteGaloisGroupExtendEquiv`, `coe_absoluteGaloisGroupExtendEquiv_apply`, `map_range_absoluteGaloisGroupExtend`; the target left is `range_absoluteGaloisGroupExtend_eq_fixingSubgroup`, and the isomorphism is derived from it in the Lean file.
- C04 — repaired: the description now says "Layer 3 stops there; `Z(G_K) = 1` is AnabelianGeometryAndNonabelianChabauty §3.5's", cites ClassFieldTheory Layer 7 and the `[CharZero K]` declarations, and "2.0 is stated in Lean".
- N01 — repaired: "`ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one` and `ProfiniteGrp.closedSubgroup_eq_sInf_open` (… stated for `ProfiniteGrp` objects)".
- N02 — repaired: the three theorems have docstrings; the conventions say "Layer 3 takes `K : Type` and `zHat.{0}`, because Tau Ceti's `TauCeti.ClassFieldTheory.artinMap` is stated in `Type`".

## Verified sound

Adversarial table for the statements the change touches (values computed on each side):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.3 `map_closedDerivedSeries_solvableQuotient`, now without `[T2Space G]` | indiscrete `ℤ/2`, `(m,n) = (1,0)` and `(0,1)`; `S₃`, `(1,1)`; general induction | `G^[1] = ⊤`: image `⊥ = ⊤` in the trivial quotient; `⊤ ↦ ⊤`; `A₃ ↦ A₃ = (S₃)^[1]`; `π(G^[k])` compact in a Hausdorff quotient, so closed | holds |
| 0.5 `topologicalClosure_commutator_eq_iInf`, now for any subgroup `N` | `N = ⊥`; `N = G`; `N` dense, not closed; `N` not normal | `⋂_U cl⁅U,U⁆ ≤ ⋂ U = ⊥`; both `cl⁅G,G⁆`; `⁅NU,NU⁆U = ⁅N,N⁆U` needs only `U` normal; `⋂_U AU = cl A` for any subset `A` | holds |
| 0.5 standing hypotheses | compact, totally disconnected topological group | totally disconnected gives T1, a T1 topological group is Hausdorff: profinite, as the README says | in scope |
| 2.0 `range_absoluteGaloisGroupExtend_eq_fixingSubgroup` (new) | `L = K`; general `L` | `⊤ = ⊤` (index 1 by `index_range_absoluteGaloisGroupExtend`); `g` in range iff `g|K^s` fixes `σ(L)`, iff `g` fixes `L` by `hσ` and `coe_absoluteGaloisGroupRestrictEquiv_apply` | holds; not at the pin, not closed by one tactic |
| 2.0 `exists_continuousMulEquiv_fixingSubgroup` (now derived) | proof term | `absoluteGaloisGroupExtendEquiv K L σ hU` with `hU` the range equality; compatibility is `coe_absoluteGaloisGroupExtendEquiv_apply` | elaborates; statement unchanged |
| Conventions, mixed characteristic | `K ⊇ ℚ_p` | `ℚ_p → K` injective, so characteristic 0; pin: `injective_artinMap [CharZero K]` | holds |
| 3.1, identification with `profiniteCompletionArtinEquiv` | pin statement | `completion (GrpCat.of Kˣ) ≃ₜ* Field.absoluteGaloisGroupAbelianization K` under `[CharZero K]`; `(Kˣ)^ = 𝒪^× × Ẑ` for a uniformizer | consistent; 3.1 is not that declaration restated |

The rows for the untouched statements stand as in the previous review, of c05d10f.

- Source locators: the changed passages add or alter none; the changed sentences of 3.1 were set beside hyeon2025 lines 912–930.
- Library declarations opened at the pin: 8 — `absoluteGaloisGroupExtend` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:252`), `absoluteGaloisGroupExtendEquiv` (330), `coe_absoluteGaloisGroupExtendEquiv_apply` (342), `map_range_absoluteGaloisGroupExtend` (353), `absoluteGaloisGroupRestrictEquiv` (`AbsoluteGaloisGroup/Basic.lean:340`), `injective_artinMap` and `profiniteCompletionArtinEquiv` (`TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/ArtinMap.lean:113, 129`), `ProfiniteGrp.closedSubgroup_eq_sInf_open` (`Mathlib/Topology/Algebra/ClopenNhdofOne.lean:65`).
- Cross-roadmap citations: the change adds none; the tools report no unresolved citation, no dropped id and no other pull request changing this roadmap. The new Lean name `range_absoluteGaloisGroupExtend_eq_fixingSubgroup` is declared in no other roadmap, on main or open.
- Dependency check: `depcheck: 172 roadmaps, 2000 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the roadmap folder against the base.
- Automatic checks: all passed. Elaboration: `sorry` is the only warning (17 declarations). One-tactic probe (`rfl`, `simp`, unfolding, `infer_instance`, `exact?`, rewriting with `map_range_absoluteGaloisGroupExtend`) on the three changed sorried theorems: none closed.
- `#check @name` on the five declarations the change touches or cites, compared with the README: `[T2Space G]`, `[N.Normal]` and `hN` are gone as intended; the Layer 3 binders `(p) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]` are kept.
- Headline theorems: unchanged; 2.3 and 2.4 not statable (no absolute upper filtration at the pin), as the module docstring says; 3.1, 3.3, 3.4 stated.
- Pull request text read against this head: no sentence contradicted, no change left unstated.

Overlap check: read LocalAnabelianGeometry, FieldOfNorms, RamificationOfCompleteDiscretelyValuedFields, ClassFieldTheory, LocalFieldsRamification (as in the previous review; the change moves no ownership); nothing shared.

Source independence: changed passages only; 1 passage compared with 1 source (hyeon2025), none shared; largest share hyeon2025, 10 of 13 locators; the change adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 0–3 are the filtered-group prerequisites of Mochizuki 1997, Thm. 4.2 and of Hyeon 2025, Thms. 1.4–1.5, and Layer 3 is Hyeon 2025, Prop. A.1 (Ladkani 1996 for the metabelian case; Saïdi–Tamagawa 2022, Prop. 1.1(ix)); rests on the README summary and on hyeon2025 and mochizuki1997 as read.

## Not verifiable

- Serre, *Local Fields*, IV §3 (the normalization of `ψ_{L/K}`): paywalled, recorded as uncertified; cited by locator only. Untouched by the change.
- Ladkani's 1996 thesis: no text available; cited only as the origin of the metabelian case.

## Source issues

- **Error** in hyeon2025 at §2, "Ramification groups", the displayed definition of `ψ_{L/K}`, printed p. 6: the source says the integrand is the index of the `w`-th upper group in the whole finite Galois group; it should be its index in the inertia group, that is the same integral divided by the residue degree; affects the proof.

## For the human reviewers

- **Licence.** The References cite an unpublished master's thesis (Ladkani, Hebrew University, 1996) for attribution only; no statement rests on it and no text of it was read (`TauCetiRoadmap/FilteredLocalGaloisGroups/README.md`, References).
