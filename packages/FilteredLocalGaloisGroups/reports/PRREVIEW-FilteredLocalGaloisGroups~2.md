# Review of FilteredLocalGaloisGroups (pull request #1795 at c05d10f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of Layers 0–3 held on the instances computed, the ten findings of the earlier review are repaired, all supplier citations resolve on main, and `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections (the README's account of what the pinned class field theory provides is out of date, three hypotheses the statements do not need, a library declaration that already does most of 2.0, and a pull-request description written for the earlier head) and two format notes, none blocking. One point is left for the human reviewers.

## C01 — `injective_artinMap` is a Tau Ceti declaration at the pin, under `[CharZero K]`, not a Layer 8 target under `ℚ_p`-algebra hypotheses

An implementer of Layer 3 reads that the injectivity of the Artin map is still to be supplied and that its hypothesis is a `ℚ_[p]`-algebra structure; neither holds at the pin. The conventions say (README line 110) "Mixed characteristic in Layer 3 is the hypothesis of ClassFieldTheory's `injective_artinMap`: `(p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]`", and 3.1, the Layer 3 dependencies and the supplier contracts call it a Layer 8 target (lines 462, 535, 654–656). At the pin, `TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/ArtinMap.lean:113` is `theorem injective_artinMap [CharZero K] : Function.Injective (artinMap K)`, and ClassFieldTheory Layer 8 on main states it "in characteristic zero". The same file has `profiniteCompletionArtinEquiv [CharZero K]` (line 129), the isomorphism of the profinite completion of `Kˣ` with `G_K^ab`, which the last sentence of 3.1 and the scope paragraph (lines 577–579) describe as merely "listed in ClassFieldTheory".

Smallest change: list `injective_artinMap` with the implemented declarations in the ClassFieldTheory contract, with its hypothesis `[CharZero K]`, and name `profiniteCompletionArtinEquiv` where 3.1 mentions the profinite completion. The four Layer 3 signatures are true as they stand (a `ℚ_[p]`-algebra forces characteristic zero); they would match the supplier more directly with `[CharZero K]` in place of `(p) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]`, which is offered, not required.

## C02 — Three hypotheses in Layer 0 are not needed by the statements or by the proofs given

In 0.3 (`map_closedDerivedSeries_solvableQuotient`, Lean line 74) `[T2Space G]` is not used: the quotient `G/G^[m+n]` is Hausdorff because `G^[m+n]` is closed, and 0.2 asks only that the source be compact and the target Hausdorff, so the image of the compact `G^[m]` is closed. In 0.5 (`topologicalClosure_commutator_eq_iInf`, Lean line 89) neither `[N.Normal]` nor `hN : IsClosed N` is used: the proof in the README (lines 179–181) uses only that `U` is open and normal, and `N·U = closure(N)·U` since `N·U` is an open, hence closed, subgroup. For an arbitrary subgroup `N` both sides are unchanged on replacing `N` by its closure. The consumers (3.4, with `N = G_K^[m]`) satisfy the extra hypotheses, so nothing breaks; dropping them, or saying in one clause that they are kept for the application, would do.

## C03 — The pin already has the isomorphism of 2.0 up to one equality of subgroups

The route of 2.0 (README lines 336–339) composes three maps and a transport, and its *Needs* line omits the declaration that does this. At the pin, `TauCeti.absoluteGaloisGroupExtendEquiv` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:330`) gives `Field.absoluteGaloisGroup L ≃ₜ* U` for any `U` with `(absoluteGaloisGroupExtend K L σ).range = U`, with `coe_absoluteGaloisGroupExtendEquiv_apply` for the compatibility, and `map_range_absoluteGaloisGroupExtend` (same file) computes the range in the separable-closure model. So `exists_continuousMulEquiv_fixingSubgroup` asks an implementer for exactly one thing: that the range is `L.fixingSubgroup` when `σ` is induced by the inclusion. Naming these two declarations in 2.0, and stating that range equality as the target, would say what is left.

## C04 — The pull-request description describes the earlier head

Five passages no longer match the folder.

- "`Z(G_K^m) = 1` for `m ≥ 2`, and `Z(G_K) = 1`" and, under Coordination, "its §3.5 takes the local case `Z(G_K) = 1` from this roadmap's Layer 3. This PR is that supplier": the head has no such target; the remark after 3.4 and the scope section say `Z(G_K) = 1` is owned by AnabelianGeometryAndNonabelianChabauty §3.5. Right text: "Layer 3 stops at `Z(G_K^m) = 1`, `m ≥ 2`; `Z(G_K) = 1` is AnabelianGeometryAndNonabelianChabauty §3.5's, and Layer 0.8 is the criterion that derives it."
- "identified with #1410's absolute upper filtration" and the first Dependencies bullet: at the head the absolute upper filtration is ClassFieldTheory Layer 7's `localAbsoluteUpperRamificationGroup`; RamificationOfCompleteDiscretelyValuedFields supplies §4a.1's agreement and §4a.2 (`ψ_{L/K}`, the open-subgroup identity, the integral formula).
- "TauCetiProject/TauCetiRoadmap#1411 (unit-filtration reciprocity)": the worked example now cites ClassFieldTheory Layer 7's `map_artinMap_unitFiltration_eq_upper`, which is on main.
- "plus the Layer 8 target `injective_artinMap`" and "That comparison has no declared name": see C01; both are Tau Ceti declarations at the pin.
- "Layer 2 has no Lean": the head states 2.0 in Lean (`exists_continuousMulEquiv_fixingSubgroup`); only 2.1–2.4 are in the README alone.

## N01 — Two Mathlib names lack their namespace

In the *Needs* line of 0.5, `exist_openNormalSubgroup_sub_open_nhds_of_one` and `closedSubgroup_eq_sInf_open` are `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one` and `ProfiniteGrp.closedSubgroup_eq_sInf_open` (`Mathlib/Topology/Algebra/ClopenNhdofOne.lean:48, 65`), stated for `ProfiniteGrp` objects rather than for a group with instances.

## N02 — Three theorems have no docstring, and Layer 3 is in `Type`

`closedDerivedSeries_antitone`, `GroupFiltration.strictMono_herbrandPsi` and `GroupFiltration.surjective_herbrandPsi` carry no docstring. The Layer 3 section takes `K : Type` and `zHat.{0}` because `TauCeti.ClassFieldTheory.artinMap` does; one clause in the conventions would say so.

## Verified sound

Earlier findings (review at f235b83), each against this head:

| Earlier finding | Passage at this head | Status |
|---|---|---|
| R01 Layer 3 binders lost | `center_solvableQuotient_eq_bot (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] (m : ℕ) (hm : 2 ≤ m)`; elaborated type keeps all four | repaired |
| R02 second owner of `Z(G_K) = 1` | "That statement is owned by AnabelianGeometryAndNonabelianChabauty … and is not a target here"; no Lean declaration | repaired |
| R03 sorry'd data | `setoid`, `quotient`, `restrict` have proved fields; 2.0 is a theorem `exists_continuousMulEquiv_fixingSubgroup` | repaired |
| R04 undeclared backticked name | `map_conj_upperRamificationGroup` no longer occurs | repaired |
| R05 pull-request numbers | none in README or Lean file | repaired |
| R06 reciprocity cited from a revision | "ClassFieldTheory Layer 7's absolute unit-filtration reciprocity `map_artinMap_unitFiltration_eq_upper`"; on main, README line 986 | repaired |
| R07 three locator slips | `Herbrand/CyclicReduction.lean`; `TauCeti.LocalFieldsRamification.upperRamificationGroup`; the `ℚ_2(μ_8)` Check cites ClassFieldTheory Layer 7's Checks | repaired |
| R08 no Checks or *Needs* | subsections 0.1–3.4 with *Needs* lines and Checks | repaired |
| R09 module warning | `module` / `public import Mathlib`; elaboration warns of `sorry` only | repaired |
| R10 three restated lemmas | `isClosed_closedDerivedSeries`, `closedDerivedSeries_zero`, `_one` absent | repaired |

Adversarial table (values computed on each side):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 recursion, `closedDerivedSeries_succ` | `S₃` discrete; `ℤ/2` indiscrete; `ℤ_p` | `S₃`: `A₃`, then `⊥`; indiscrete `ℤ/2`: `derivedSeries 1 = ⊥`, closure `⊤`; `ℤ_p`: `⊥` | holds; Checks true |
| 0.1 `SolvableQuotient G 1 = TopologicalAbelianization G` | `rfl` at the pin | `example … := rfl` elaborates | definitional, as claimed |
| 0.2 functoriality | `f` surjective, `G` compact, `G'` T2; homeomorphism | `f(cl D_n)` compact, closed, contains `D_n(G')`, inside `cl D_n(G')` | holds |
| 0.3 `map_closedDerivedSeries_solvableQuotient` | `m = 0`; `n = 0`; `G` compact non-T2 | `⊤ ↦ ⊤`; `G^[m] ↦ ⊥ = (G^m)^[m]`; quotient by closed subgroup is T2 anyway | holds; T2 unused (C02) |
| 0.4 `closedDerivedSeries_add_le` | `n = 0`; `S₃, m = 1, H = A₃, n = 1`; unshifted | `G^[m] ≤ H`; `G^[2] = ⊥ ≤ H^[1] = ⊥`; `G^[1] = A₃ ≰ ⊥` | holds; hyeon2025 lines 267–281 |
| 0.5 `topologicalClosure_commutator_eq_iInf` | `N = ⊥`; `N = G`; `N` not closed | `⋂_U cl⁅U,U⁆ ≤ ⋂ U = ⊥`; both `cl⁅G,G⁆`; `N·U = cl(N)·U` so both sides unchanged | holds; `hN`, normality unused (C02) |
| 0.6 `iInf_range_powMonoidHom_eq_bot` | `ℤ_p`; `ℤ/n`; `ℚ_p`; `ℝ/ℤ` | `⋂ p^kℤ_p = 0`; `A^n = 1`; `nℚ_p = ℚ_p`; every element divisible | holds; both negative controls true |
| 0.7 `iInf_closedDerivedSeries_eq_bot` | `ℤ_p`; `A₅` discrete | `G^[1] = ⊥`; `A₅` not solvable, `G^[n] = A₅` | holds; hypothesis needed |
| 0.8 limit criterion | abelian `G ≠ 1`; `m₀ = 0` | `Z(G^m) = G^m ≠ ⊥`, hypothesis fails; `m = 0` gives `G^0` trivial only | holds |
| 1.1 limits and jumps | `ℤ_p^×` cyclotomic filtration | `G(0+) = 1 + pℤ_p`, `G(n+) = 1 + p^{n+1}ℤ_p` | closed normal; consistent with worked example |
| 1.2 `FilteredOut`, `isFiltered_of_conj` | `S₃` constant filtration; `ℤ/4 × ℤ/2` | one class; `(a,b) ↦ (a, b + a mod 2)` sends `(1,0)` to `(1,1) ∉ ℤ/4 × 0` | holds; Checks true |
| 1.3 `GroupFiltration.quotient` | `N = G`; `ℤ/4`, `N = 2ℤ/4` | all steps trivial; `ℤ/2` for `u ≤ 0`, trivial for `u > 0` | holds; elaborated type keeps `[IsTopologicalGroup G]` |
| 1.4 `herbrandPsi`, strict monotonicity, surjectivity | `H = G`; index `f`, `G(t) = 1` for `t ≥ 0`; `ℤ/2`, `H = 1` | `ψ = id`; `(1/f)∫f = u`, variant `f·u`; `f_H = 1`, `ψ = 2u`; slope `≥ 1` | holds |
| 1.4 tower law | derivative at `u > 0`, `H' ≤ H` | `[G:G(u)H'] = [G:G(u)H]·[H:(G(u)∩H)H']` by the modular law; `f_{H'} = f_H f^H_{H'}` | holds |
| 1.5 `restrict`, `exists_isFiltered_restrict` | `H = G`; `s ∈ S`, `w = ψ_H(s)`; `s < 0` | `φ_G = id`; `α(G(s) ∩ H) = G'(s) ∩ H'`, `ψ_{H'} = ψ_H` from `[0,∞) ⊆ S`; `ψ = id` | holds |
| 2.0 `exists_continuousMulEquiv_fixingSubgroup` | `L = K`; range at the pin | `⊤`; range is the preimage of the subgroup fixing `σ(L)`, equal to `L.fixingSubgroup` under `hσ` | holds (C03) |
| 2.1 filtration `F_K` and Checks | unramified cubic; `ℚ_2(μ_8)`; `X³ − 5` over `ℚ_5` | orders 3, 1; all, `{1,5}`, 1 on `u ≤ 1`, `(1,2]`, `u > 2`; `S₃`, `C₃`, 1 | matches ClassFieldTheory Layer 7 Checks |
| 2.2 `f_H = f(L/K)`, `ψ_H = ψ_{L/K}` | unramified degree `f`; `ℚ_3(ζ_3)/ℚ_3`; non-Galois `L` | `ψ = id`; `ψ = 2u`; derivative `e·#(Γ^u∩H)/#Γ^u = [Γ:Γ^uH]/f` | holds; supplier §4a.2 states the formula |
| 2.3 descent | `m = 0`; `n = 0`; `ℚ_p`, `m = n = 1`, `ℚ_p(μ_p)` | `L = K`; trivial groups; `H^1 = G_L^ab` | holds; hyeon2025 lines 243–246, 271–275 |
| 3.1 coordinates | `(u, a)` in the kernel; `ϖ = p²` | unramified coordinate `a = 0`, then `u = 1`; coordinate `2a`, not onto | holds; `IsUniformizer` needed |
| 3.2 action and norms | `τ ∈ G_E`; inclusion `G_F ≤ G_E` | `Art_F(τx)`; `Art_E(N x)`; pin: `artinMap_congr`, `artinMap_norm` (`Local/ArtinMap.lean:397, 345`) | holds |
| 3.3 `center_solvableQuotient_succ_le` | `m = 0`; general `m` | `Z(G^1) = G^1`; `z̃` fixes each finite Galois `L ⊆ K^m` by injectivity | holds; hyeon2025 lines 878–885 |
| 3.4 `center_solvableQuotient_eq_bot` | `m = 2` route; `m = 1` | `[L·K_{nf}:L] = n`; `z_L = (Art(u)Art(ϖ)^a)^n`, in `⋂(G_L^ab)^n = 1`; `G_K^ab` abelian, fails | holds; hyeon2025 lines 871–873 |
| Summary, Mochizuki's theorem | statement | bijection from `ℚ_p`-isomorphisms to outer filtered isomorphisms, index `> 0` | mochizuki1997 lines 270–276 |
| Worked example, `ℤ_p^×` | `p` odd, `p = 2` at `u = 0`; integer `n` | `1 + pℤ_p ≠ ℤ_p^×`; `1 + 2ℤ_2 = ℤ_2^×`; `χ(Art U^(n)) = 1 + p^nℤ_p` | holds |

- Source locators read against the text: 11 in hyeon2025 (lines 133–142, 201–213, 233–246, 249–257, 267–283, 287–290, 871–885, 912–965, 966–1028), 2 in mochizuki1997 (lines 197–198, 270–276), 1 in saidi-tamagawa2022 (lines 325, 378–382).
- Library declarations opened at the pin: 38 (Mathlib 9, Tau Ceti 29), among them `injective_artinMap` (`LocalExistence/ArtinMap.lean:113`), `absoluteGaloisGroupExtend` (`FiniteExtension.lean:252`), `unramifiedCoordinate_artinMap` (`Local/Unramified.lean:407`), `IsUniformizer` (`Uniformizer.lean:53`), `zHat.lift` (`ZHat/Basic.lean:140`).
- Cross-roadmap citations resolved on main: ClassFieldTheory Layer 7 (`localAbsoluteUpperRamificationGroup`, line 929; `map_artinMap_unitFiltration_eq_upper`, line 986) and Layer 8 (line 1132); RamificationOfCompleteDiscretelyValuedFields §4a.1 fourth bullet and §4a.2; AnabelianGeometryAndNonabelianChabauty §3.5; the three completed roadmaps' links.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the roadmap folder.
- Elaboration: `sorry` is the only warning (17 declarations). One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on all 17 sorried theorems: none closed. `#check @name` on seven declarations compared with the README: only `herbrandPsi` drops `[IsTopologicalGroup G]`, harmlessly.
- Headline theorems: descent (2.3) and the map from field isomorphisms (2.4) are not statable, the absolute upper filtration having no declaration at the pin, and the module docstring says so; 3.1, 3.3, 3.4 are stated.
- Overlap check: read LocalAnabelianGeometry, FieldOfNorms, RamificationOfCompleteDiscretelyValuedFields, ClassFieldTheory, LocalFieldsRamification; nothing shared (the first two consume Layers 0–3 by name; the absolute upper filtration is ClassFieldTheory's, `ψ_{L/K}` the ramification roadmap's, `Z(G_K) = 1` AnabelianGeometryAndNonabelianChabauty's).
- Source independence: 13 passages compared with 3 sources, none shared; largest share hyeon2025, 10 of 13 locators; contents compared with hyeon2025 (§§1–6, Appendix A): independent, its §2 is split over Layers 0–2 in another order and Layer 3 proves Appendix A's proposition by another route.

Research link: Layers 0–3 are the filtered-group prerequisites of Mochizuki 1997, Thm. 4.2 and of Hyeon 2025, Thms. 1.4–1.5, and Layer 3 is Hyeon 2025, Prop. A.1 (Ladkani 1996 for the metabelian case; Saïdi–Tamagawa 2022, Prop. 1.1(ix)); rests on the README summary and on hyeon2025 and mochizuki1997 as read.

## Not verifiable

- Serre, *Local Fields*, IV §3 (the normalization of `ψ_{L/K}`): paywalled, recorded as uncertified; cited by locator only.
- Ladkani's 1996 thesis: no text available; it is cited only as the origin of the metabelian case, which hyeon2025 line 874 and saidi-tamagawa2022 line 378 confirm.

## Source issues

- **Error** in hyeon2025 at §2, "Ramification groups", the displayed definition of `ψ_{L/K}`, printed p. 6: the source says the integrand is the index of the `w`-th upper group in the whole finite Galois group; it should be its index in the inertia group, that is the same integral divided by the residue degree; affects the proof.

## For the human reviewers

- **Licence.** The References cite an unpublished master's thesis (Ladkani, Hebrew University, 1996) for attribution only; no statement rests on it and no text of it was read (README line 705).
