# Review of ReductiveGroups (pull request #1797 at c36ff40)

**Verdict:** needs changes

Six findings: two P2 (a headline narrowed below its source, and a headline declared not statable that elaborates at the pins) and four P3. The gate passes, the dependency check reports no problem, the sampled locators are correct, and the ten headline statements are true as written.

## R01 (P2) — The Tits-system headline is restricted to algebraically closed fields; its source and the pins cover split groups over every field

**Location.** `TauCetiRoadmap/ReductiveGroups/Suggested.lean:197` (`theorem exists_titsSystem {k : Type v} [Field k] [IsAlgClosed k]`); README lines 2017–2021, "(Milne, Proposition 21.75, p. 448, with the quadruple of Example 21.47, p. 439, for a split reductive group): for a reductive `G` … over an algebraically closed field `k`"; README Check at lines 2143–2145.

**Claim.** The cited proposition proves the Tits system for a split reductive group `(G, T)` over any field, with `N = N_G(T)` the scheme normalizer. The headline keeps only the algebraically closed case. The Check at line 2144 ("which is why the algebraic-group theorem takes `k` algebraically closed") gives the wrong reason: what fails over `𝔽₂` is the normalizer of `T(k)`. The normalizer of the torus scheme works there.

**Witness.** In milne-iag (2017 text), lines 18098 and 18457, `G` is split over arbitrary `k`. For `GL₂/𝔽₂`: `N_G(T)(𝔽₂) = {1, s}` and `|B(𝔽₂)| = 2`, while `|BsB| = 4`. That gives `2 + 4 = 6 = |GL₂(𝔽₂)|`, so the Tits system exists over `𝔽₂`.

**Repair.** Restate the headline for a split maximal torus over any field. Use the pinned `TauCeti.HopfIdeal.IsBorel` (`Borel/Basic.lean:196`) and `BialgHom.normalizerPoints` (`DiagonalizableGroup/Normalizer/Character.lean:52`). Add the import `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Normalizer.Character`:

```lean
theorem exists_titsSystem {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    {X : Type v} [CommGroup X] (π : H.obj →ₐc[k] MonoidAlgebra k X) (hπ : Function.Surjective π)
    (hT : TauCeti.HopfIdeal.IsMaximalTorus k H.obj (TauCeti.HopfIdeal.kerOfSurjective π hπ))
    {I : TauCeti.HopfIdeal k H.obj} (hB : TauCeti.HopfIdeal.IsBorel k H.obj I)
    (hTB : I ≤ TauCeti.HopfIdeal.kerOfSurjective π hπ) :
    ∃ τ : TauCeti.TitsSystem
        (TauCeti.HopfAlgebra.points (R := k) (H := H.obj) (CommAlgCat.of k k)),
      τ.subgroupB = TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of k k) ∧
      τ.subgroupN = BialgHom.normalizerPoints π hπ := by
  sorry
```

- In README lines 2014–2028 and in the docstring, say "split reductive group over a field".
- Rewrite the `𝔽₂` Check so that it explains why `N` is the rational points of the scheme normalizer, `{1, s}` here.
- The algebraically closed case becomes a Check: there every maximal torus is split, and `N_G(T)(k)` is the normalizer of `T(k)`.

Tested: the full file with this replacement elaborates at the pins, with only `sorry` warnings. The open revision #1676 states the same form (see R06).

## R02 (P2) — `G = R(G)·G_der` is statable at the pins, but the module docstring lists it as not statable

**Location.** `Suggested.lean:68–71`: "Layer 6: `G = R(G)·G_der` … The missing carrier is that multiplication as a morphism of coordinate Hopf algebras … no pinned declaration supplies the multiplication homomorphism". README lines 1703–1705.

**Claim.** No pinned multiplication morphism is needed. The theorem can assert that a Hopf morphism exists whose underlying map is `(π_R ⊗ π_der) ∘ Δ` and that it is a central isogeny. The file already states Levi complements existentially in the same way. The defining equation determines the morphism, so the statement is not vacuous.

**Witness.** The statement below elaborates at the pins. For `GL₂`, `R = 𝔾_m` and `G_der = SL₂`, and the kernel `{(ζ, ζ⁻¹) : ζ ∈ μ₂}` is central. For the non-reductive Borel `B ⊂ GL₂`, `R(B) = B` and `B_der = U` do not commute, so no Hopf map exists.

**Repair.** Add a Layer 6 section with the theorem below. Add `TensorProduct` to the `open` line and import `Solvable.Radical.Construction` and `Derived.Basic`:

```lean
/-! ## Layer 6: the radical and the derived group -/

theorem exists_radical_mul_derived_isCentralIsogeny {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H) :
    ∃ f : H.obj ⟶ CommHopfAlgCat.of k
        ((TauCeti.FiniteTypeCommHopfAlgCat.solvableRadical H).obj ⊗[k]
          (H.obj ⧸ (TauCeti.CommHopfAlgCat.derivedDefiningIdeal (R := k) H.obj).toIdeal)),
      (∀ x : H.obj, f.hom x =
        Algebra.TensorProduct.map
          (TauCeti.FiniteTypeCommHopfAlgCat.solvableRadicalCoordinateMap H).hom.hom.toAlgHom
          (Ideal.Quotient.mkₐ k
            (TauCeti.CommHopfAlgCat.derivedDefiningIdeal (R := k) H.obj).toIdeal)
          (Coalgebra.comul x)) ∧
      TauCeti.CommHopfAlgCat.IsCentralIsogeny f := by
  sorry
```

- Give it a docstring citing Conrad, *Reductive Group Schemes*, Corollary 5.3.3, p. 164 (conrad-rgs line 6845, verified).
- Note in the docstring that Conrad's `Z` is the maximal central torus. The native radical is a central torus (`torus_solvableRadical`), and its maximality is the remaining Layer 6 target.
- Delete the Layer 6 bullet from the not-statable list.
- In the README Layer 6 bullet, name `StructureAcceptance.exists_radical_mul_derived_isCentralIsogeny`.

Tested together with R01's replacement in one copy of the file: no errors, only `sorry` warnings.

## R03 (P3) — Two new route steps use results owned on main without naming the owners

**Location.** README lines 2115–2118, the simply connected cover's *Needs*: "…; line bundles and Weil divisor classes on smooth varieties; Galois descent of morphisms". README lines 4276–4278, the 11B product step: "Every finite reduced crystallographic root pairing is the orthogonal sum of its irreducible components … so the theorem follows from the irreducible case."

**Claim.** Both routes name an input without an owner:

- The cover route (Milne 18.21–18.25) needs Weil divisor classes equal to `Pic` on smooth `G/B`, the excision surjection, and `G`-linearized line bundles with the character/Picard sequence.
- The product step needs the decomposition of a root pairing into irreducible components.

**Witness.** The owners are on main, and none of them consumes ReductiveGroups:

- SchemeAndStackFoundations §3.4 (`classGroup_picard_locallyFactorial`, excision), its README line 4789.
- EquivariantIntersectionTheory §§1.1 and 1.3, lines 267 and 311.
- RootSystems §6.1, line 1037.

**Repair.**

- Cite SchemeAndStackFoundations §3.4, the pinned `TauCeti.AlgebraicGeometry.LineBundleClass` and EquivariantIntersectionTheory §§1.1 and 1.3 in the cover's *Needs* line.
- State Milne's Proposition 18.18 sequence for a multiplicative isogeny as a Layer 7 target where §1.3's form does not match.
- Cite RootSystems §6.1 in the product step and in Layer 11's Dependencies, with the coordinate transport from real realizations that 11B already lists.
- Re-run the dependency check.

## R04 (P3) — The supplier contracts omit the roadmap suppliers of Layers 7 and 11

**Location.** README `## Exact supplier contracts` has `### From TauCetiRoadmap.SchemeAndStackFoundations` (line 397) and `### From TauCetiRoadmap.ModularCurves` (line 405) only. Layer 11's Dependencies (lines 4483–4487) also name RootSystems, LieHighestWeight, ReflectionInvariantTheory, AlgebraicTopology, DGFloer, LieGroups and SmoothBundlesConnections.

**Claim.** The house shape requires a contract subsection for each supplier, giving the sections consumed and what is assumed of them. Seven roadmap suppliers have none.

**Witness.** The README has four `### From` headings. The layers consume, among others: RootSystems §§2.1 and 3.1, LieHighestWeight §7.2, LieGroups Layers 7–8, DGFloer Layer 1 item 2, SmoothBundlesConnections B1.4 and AlgebraicTopology's based van Kampen.

**Repair.** Add one `### From TauCetiRoadmap.<X>` subsection per supplier, listing the section and its hypotheses. For example: "RootSystems §2.1: injectivity of the marked Weyl presentation for finite reduced crystallographic spanning real pairings". After R03, add EquivariantIntersectionTheory as well.

## R05 (P3) — Nagata's theorem is cited only to a remark that has no proof and is false as printed for nonsmooth groups

**Location.** README lines 2079–2082: "Nagata's theorem … (Milne, Remark 12.56, p. 249, after Proposition 12.54, p. 248, the commutative case)". The same citation appears in `Suggested.lean:230–232`.

**Claim.** The remark states the criterion without proof and refers to Demazure–Gabriel IV §3, 3.6 and to Kohls 2011. It reads "`G°` is a torus" for every algebraic group, which `μ_p` refutes. Proposition 12.54 covers only commutative groups. The target needs a locator for an actual proof.

**Witness.** milne-iag (2017 text), lines 10330–10335 (the remark, its pointer to Demazure–Gabriel and Kohls) and lines 10307–10308 (Proposition 12.54). `μ_p` is connected and linearly reductive but not a torus.

**Repair.**

- Add a proof locator. Either Kohls, *Linear Multilinear Algebra* 59 (2011), pp. 271–278, cited by its locator and recorded as uncertified if paywalled, or Demazure–Gabriel IV §3, 3.6.
- Say that the remark is used in its case of group varieties.
- Keep the `μ_p` Check as the reason smoothness is assumed.

## R06 (P3) — Five open pull requests change this folder with no stated order, and three declare `StructureAcceptance.linearlyReductive_iff_torus` differently

**Location.** The pull-request description, which names no order. `Suggested.lean:239`.

**Claim.**

- #1332, #1676, #1807, #1808 and #1854 each conflict with this head in `README.md` and `Suggested.lean`.
- #1332, #1676 and this head each add Nagata's theorem under the same fully qualified name, with different hypotheses.
- #1676 also states R01's general-field Tits system.
- The description says the seven side files were folded in with "No statement changes". At this head those files (254 declarations on main) are deleted, and ten theorems remain.

**Witness.** `roadmaps overlaps ReductiveGroups` lists the five conflicts. #1676's `Suggested.lean` line 174 declares `linearlyReductive_iff_torus … [IsAlgClosed k]`. This head's line 239 declares it over every field of characteristic `p`.

**Repair.**

- State in the description which pull request is rebased on which before either merges.
- On rebase, take over what the other already changes rather than restating it.
- Update the description to match the head.

No roadmap on main or in an open pull request cites the deleted declarations (checked with `roadmaps grep`), so the deletion breaks no citation.

## Verified sound

**Gate and dependency check.**
- The worker's gate at c36ff40 is all zero (OK).
- My re-run reports `outside-folder=47`. Every hit lies in AlgebraicTopology, GeometricTopology, IntegralLattices, QuadraticFormInvariants or LieHighestWeight, the folders the brief names as this pull request's own, so none is a finding.
- `git diff --stat origin/main...HEAD` outside the six folders is empty.
- Dependency check output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)` (no UPWARD or CYCLE line).

**Lean.**
- `lake env lean` on `Suggested.lean`: ten `declaration uses sorry` warnings, nothing else.
- A `#check @name` file for all 16 named declarations elaborated without errors. Each elaborated type matches its README statement and keeps the binders its statement needs.
- One-tactic probe (`first | rfl | simp | infer_instance | trivial | decide`) on a scratch copy: 0 of 10 theorems close, so there is no padding.
- The nine definitions (`OrderedPlane`, `permute`, `planePermutationAction`, `UnorderedPlane`, `planeBase`, `unorderedBase`, `corootWeylGroup`, `RegularSet`, `WeylQuotient`) are real-bodied, and each is needed by a headline. No `set_option`, no `lemma`, no sorry'd data.

**Sampled sources (all correct).**

| Target | Locator | Source line | Supports the statement? |
|---|---|---|---|
| §1.1 coaction/action | Jantzen §2.8, pp. 36–39 | jantzen-1985 1100–1165 | yes (no flatness needed for the equivalence) |
| §1.1 enough injectives | Jantzen §3.9, p. 60 | 1688–1707 | yes, flat `G` over any ring |
| §1.1 derived functors, cofree acyclicity, Hochschild complex | §4.2 p. 69, §4.7 pp. 72–73, §§4.14–4.16 pp. 77–79a | 1923, 2001, 2102–2160 | yes |
| §1.1 induction | §§3.3–3.7, pp. 52–58 | 1499–1647 | yes |
| §8.1 split reductive group | Conrad Def. 5.1.1, p. 136 | conrad-rgs 5651 | yes (conditions 1–3; nonempty base) |
| §8.2 pinning | Conrad Def. 6.1.1 and Rem. 6.1.2, p. 186 | 7725, 7738 | yes |
| §8.2 Borels ↔ positive systems on connected base | Prop. 5.2.3 p. 152; Cor. 5.2.7(2) p. 155 | 6355, 6476 | yes |

**Headline and changed-passage locators (all correct).**
- Milne 2017 (milne-iag; I read the iAG2017 text in the sources cache, whose numbering the README uses):

  | Statement | Page | Line |
  |---|---|---|
  | Theorem 5.14 | 102 | 4449 |
  | Theorem 17.10 | 354 | 14547 |
  | Corollary 17.97 | 383 | 15767 |
  | Definition 18.5 | 388 | 15953 |
  | Proposition 18.8 | 389 | 15978 |
  | Theorem 18.25, Remark 18.27 | 393 | 16138, 16145 |
  | Theorem 21.45 | 438 | 18041 |
  | Example 21.47 | 439 | 18098 |
  | Proposition 21.75 | 448 | 18457 |
  | Theorem 23.58 | 501 | 20637 |
  | Proposition 12.54, Remark 12.56 | 248, 249 | 10307, 10330 |
  | Theorems 4.9/4.10, 4.14, 5.34, 22.42; Corollary 22.43 | 87, 88, 107, 477, 478 | — |

- McNinch §3.1, p. 6 (line 236; stated for connected `G`, matching 6A) and (3.2.1), p. 7 (line 280).
- Conrad–Feng §12.3 and Proposition 12.3.1, p. 127 (lines 5325–5345).
- Conrad: Theorem 3.3.4, p. 98; Corollary 5.3.3, p. 164; Theorems 6.1.16–6.1.17, pp. 196–197.
- Brieskorn: setup with "irréductible" on p. 24 and Proposition 1 on p. 25 (lines 75–100), so the new product step is warranted.
- Fox–Neuwirth §7, pp. 122–126 (lines 153–218).

**Library declarations opened at the pins (24).**
- Simple connectivity, isogenies, semisimplicity: `simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean:62`, tests only central isogenies between semisimple groups, matching Milne Definition 18.5); `IsIsogeny`, `IsCentralIsogeny` (`Isogeny/Basic.lean:72,78`); `semisimpleCommHopfAlgProperty`.
- Tori and linear reductivity: `splitTorusCommHopfAlgProperty`, `torusCommHopfAlgProperty` (`Torus/Basic.lean:72,105`); `linearlyReductiveCommHopfAlgProperty`, `…_baseChange_iff` (`LinearlyReductive.lean:61,109`); `torusCommHopfAlgProperty.of_baseChange` (`Torus/Splitting.lean:51`); `torusCommHopfAlgProperty.linearlyReductive` (`MultiplicativeType/LinearlyReductive.lean:61`); `linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable` (`Solvable/LinearlyReductive.lean:86`); `charZero_of_isLinearlyReductive_of_injective_additiveHom` (`LinearlyReductive/AdditiveSubgroup.lean:39`).
- Borels, tori, Tits systems: `IsMaximalTorus` (`Torus/Maximal.lean:50`); `TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`); `bruhatCells_eq_univ` (`Bruhat/Basic.lean:434`); `bruhatCell_injective` (`Bruhat/Uniqueness.lean:35`); `IsBorel` (`Borel/Basic.lean:196`); `normalizerPoints` (`Normalizer/Character.lean:52`).
- Pinnings, radical, derived group: `Pinning` (`Pinning/Basic.lean:88`, requires `ConnectedSpace (PrimeSpectrum R)`); `solvableRadical`, `solvableRadicalCoordinateMap` (`Solvable/Radical/Construction.lean:134,140`); `derivedDefiningIdeal` (`Derived/Basic.lean:69`).
- Topology and groups: `TauCeti.FundamentalGroup.prodMulEquiv` (`AlgebraicTopology/FundamentalGroup/Product.lean:58`); `BraidGroup` (`Braid/Basic.lean`, the Artin group of type `A_{n−1}`, trivial for `n = 0, 1`).
- Mathlib: the tensor-product Hopf instance (`RingTheory/HopfAlgebra/TensorProduct.lean:30`).

**Not already proved at the pins.** None of the ten headlines is proved at the pins. I checked Lang (only abstract-group and torus Lang maps exist), Nagata (only the solvable case), the cover ("not constructed here"), the braid group and Brieskorn.

**Cross-roadmap citations resolved (21).**
- ReductiveGroupsPartII RG2.3.7 (README 5201; `Lang.lang_surjective` at `Suggested.lean` 212) is the `K = AlgebraicClosure F` case of Layer 7a's headline, as claimed.
- IntegralHeckeAndGaloisDeterminants §0.7 (#1689, lines 1114, 1145), ComplexComparisonPartII C-1.1 (#848) and AdelicAlgebraicGroups AA.3.1 (#792) state the objects Scope and ownership names. ReductiveGroups is on main, so it is the owner; their citation is theirs to make.
- SchemeAndStackFoundations §§0.7, 0.8, 1.1, 1.5, 1.13–1.15 (lines 755, 798, 2071, 2167, 2418, 2458, 2502) and §3.4 (4789).
- ModularCurves 0E and 0F (839, 886).
- RootSystems §2.1 (616), §3.1 (687) and §6.1 (1037).
- LieHighestWeight §7.2 at this head (Layer 7, `lieChevalleyRestrictionIso`).
- LieGroups Layer 7 (787) and Layer 8 (1078).
- DGFloer Layer 1 item 2.
- SmoothBundlesConnections B1.4.
- AlgebraicTopology's based van Kampen at this head (line 35).
- ReflectionInvariantTheory (main).
- EquivariantIntersectionTheory §§1.1 and 1.3.
- ChevalleyGroups (main) consumes Layer 9 rather than owning it.
- The ReductiveGroups ↔ LieGroups citations (RG Layer 7 → LG Layer 8 → RG Layer 11) predate this pull request and are acyclic by layer. 6A's mention of LieGroups is not on its *Needs* line.

**Ownership against open work.**
- Checked with `roadmaps overlaps` and `roadmaps grep` over 457 open heads: no other open roadmap owns Nagata's theorem or the simply connected cover. The only other statements of Nagata's theorem are in the two open revisions of this roadmap (R06).
- The overlap tool reports no dropped or revision-only ids.
- The citation resolver's 14 unresolved names are all this roadmap's own and are declared in `Suggested.lean`.

**Adversarial pass (values computed on each side).**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `isIso_quotient_of_isNormal` | `μ_p ⊂ μ_{p²}`; `I = 0`; `I` = augmentation; `B⁺ ⊂ SL₂` | coinvariants `k[t^p] ≅ k[s]/(s^p−1)`, `O(μ_{p²})` free of rank `p`; `B = k`, `G/G = Spec k`; `B = O(G)`; `B⁺`: coinvariants `k` but `G/B⁺ = ℙ¹` | true; normality needed | none |
| 6A `exists_levi_complement` | `𝔾_a`; torus; Borel of `GL₂`; `SL₂(W₂)` | `J` = augmentation, `k→k`; `J = 0`; coinvariants `k[a^±,d^±]`, `J=(b)` bijective, `J=(a−1)` sends `a↦1`; no `J` (McNinch 3.2.1) | true; char 0 needed | none |
| `IsMaximalTorus.exists_conjugate_eq` | `μ_p × 𝔾_m`; constant `S₃`; `SL₂/ℝ` | unique maximal torus `1×𝔾_m`, `g = 1`; maximal torus trivial; diagonal `ℝˣ` unbounded vs compact `SO₂(ℝ)`, not conjugate | true; algebraic closure needed | none |
| `exists_titsSystem` | `GL₂`; trivial group; `N_{GL₂}(T)`; `GL₂/𝔽₂` | `B∩N = T`, `W = {1,s}`, `sBs⁻¹` lower, 2 cells; `S = ∅`; `B = T` normal, `|W| = 2`, so no Tits system; scheme normalizer `{1,s}`, `2 + 4 = 6` | true but narrower than source | R01 |
| `IsParabolic.exists_levi_complement` | `P = G`; `P = B ⊂ GL₂`; `SL₂(W₂)` | `R_u = 1`, `J = 0`; `J = (b)`; parabolic in itself, no Levi | true; reductivity needed | none |
| `linearlyReductive_iff_torus` | `μ_p`; `𝔾_a`; `SL₂/𝔽_p`; `SL₂/ℚ`; norm-one torus/`𝔽_q`; trivial; `ℤ/2` over `𝔽₃` | not smooth; both false (`ke₁` no complement); both false (`⟨x^p,y^p⟩` no complement); LR, not torus, so `p > 0` needed; `q+1` vs `q−1` points, both true; both true; not connected | true | R05 locator |
| `exists_simplyConnected_centralIsogeny` | `PGL₂`; `SL₂(ℚ)→PGL₂(ℚ)`; trivial group | `SL₂→PGL₂` degree 2, kernel `μ₂`, infinitesimal in char 2, central; `diag(2,1)` has det 2, not a square, so missed on points; identity is a central isogeny | true (scheme level) | R03 route |
| `G = R(G)·G_der` (docstring) | `GL₂`; Borel of `GL₂` | `𝔾_m×SL₂→GL₂`, kernel `{(ζ,ζ⁻¹)}`, `|μ₂| = 2`, central; `B×U→B` not a homomorphism | statable | R02 |
| `lang_surjective` | `𝔾_a/𝔽₂`; `𝔾_m/𝔽₂`; `𝔾_a/𝔽₃`; constant `C₂`; transcendental `a` | `θ²−θ = 1`; `θ⁻¹θ² = θ`, `θF(θ)⁻¹ = θ²`; `η³−η = η`; Lang values all 1, other element missed; `T^q−T−a` has a root | true; connectedness needed | none |
| `nonempty_plane_braid` | `n = 0, 1, 2`; action law | point / `ℂ` / `ℂ×ℂ*`: `π₁ = 1, 1, ℤ` = `B₀, B₁, B₂`; `(σ·(τ·z))_i = z((στ)⁻¹i)` | true | none |
| `nonempty_weylQuotient_artin` | no roots; `A₁` (`±2`, `±1`); `A₁×A₁`; `A₂` | `ℂ^κ`, trivial Artin group; `y↦−y`, `ℂ*/±1 ≅ ℂ*`, `ℤ`; `(ℂ*)²`, `ℤ² = ⟨g₁,g₂ | g₁g₂=g₂g₁⟩` (not `F₂`); `Conf₃(ℂ)`, `B₃`, `(0,0,1)` fixed by a transposition | true | R03 citation |
| §1.1 coaction/action | weight-one `𝔾_m` line | at `2 ∈ ℚˣ`: multiplication by 2; 2 then 3 gives 6; 1 acts by 1 | true | none |
| §1.1 Hochschild complex | `ℤ[t^±]` weight one; trivial group, `ℤ/2` | `d⁰(1) = 1⊗(t−1)`, `d¹(t−1) = t⊗t−t⊗1−t⊗t+1⊗1+t⊗1−1⊗1 = 0`; `dⁿ = Σ_{i≤n+1}(−1)^i`: `0, id, 0`; `H⁰ = ℤ/2`, `H^{>0} = 0` | true | none |
| §1.1 induction | `C₂⊂S₃`; unit `ℤ→ℤ[t^±]` | rank 3, `(C₂(123))⁻¹ = (132)C₂`; weight one gives 0, trivial gives `ℤ` | true | none |
| §8.1 split data | split torus rank `r`; `SL₂`/`PGL₂`; `SL₂/𝔽₂` | `X = Y = ℤ^r`, no roots; root `= 2ϖ` vs root generates `X`; centre `𝔽₂[t]/(t−1)²`, length 2 | true | none |
| §8.2 pinnings | `x_α(2t)`; `Spec(k×k)` with `B⁺/B⁻`; `∏_ℕ 𝔽₃` | tangent `2E₁₂`; `Φ⁺ = {α}` vs `{−α}`, from no single `Φ⁺`; `Rˣ = ∏{±1}`, principal points force `u = 1`, `1 ≠ −1` at `U` | true | none |
| Layer 3 Checks | `(tⁿ−1)`; `(t−2)` | `Δ = (tⁿ−1)⊗tⁿ+1⊗(tⁿ−1)`, `S = −t⁻ⁿ(tⁿ−1)`; `ε = −1 ≠ 0` | true | none |
| Layer 6A Check | `𝔾_m` on `𝔾_a` weight 1 | coefficients force `aₙ = 0` for `n ≠ 0,1`, `a₁ = −a₀`, so `a = a₁(t−1) = d(a₁)` | true | none |
| Layer 7a fixed-coset Check | `F̄_qˣ`, `J = {±1}`, `q` odd | `x^{q−1} = 1` on `J`; `a^{q−1} = −1`, `σ(a) = −a`, `a^{q²−1} = 1` | true | none |
| Layer 6B Check | `GL₂/O₂` at `g = diag(2,1)`, `h = [[0,1],[1,0]]` | `(gh)(gh)ᵗ = diag(4,1) = ggᵗ`; `(gh)ᵗ(gh) = diag(1,4)` | true | none |

**Spot-checked Checks elsewhere (all hold).** Layers 4, 5, 5P (Jordan parts of `[[2,1],[0,2]]`; `x²−a` over `𝔽₂(a)`; `exp(E₁₂+E₂₃) = I+X+E₁₃/2`); Layer 9 (`binom(3,2) = 3`; `E^(1)E^(1) = 2E^(2)`; `dim Dist(G₁) = p³`); 9D (`H¹(ℤ/2,ℤ/2) = ℤ/2`; `Res_{K/k}𝔾_m`); 9E (`σ² = Frob_{2^{2m+1}}`); Layer 10 (`dim L(p) = 2`, `dim ∇(p) = p+1`); worked examples (`SL_n` at `n = 0, 1, 2`).

**Outside the sample, not checked this round.** Salvetti, Callegaro, Birman–Brendle, Fadell–Neuwirth, Dudas–Michel, Gros–Kaneda, Frenkel–Kac, Riche, Hedén, SGA 1, Conrad (adelic).

## Not verifiable

- `brieskorn-1971` (Invent. Math. 12, the primary proof of the presentation): the cached scan is image-only, and OCR is unavailable on this worker. The README cites only the Bourbaki exposé, which I read.
- Kohls 2011 and Demazure–Gabriel IV §3, 3.6 (the proofs Milne's remark names, needed for R05): not in the manifest; a publisher copy and a book. Not read.
- `waterhouse`, `borel`, `springer`: settled as uncertified. They appear only as background references, not as the locator of any claim.
- The manifest key `milne-iag` records the 2015 v2.00 text. The README cites, and I verified against, the 2017 text held in the sources cache. Its manifest entry should name the 2017 version (a manifest matter, not a README defect).

## Source issues

- **Error** in milne-iag (2017 version) at Remark 12.56, p. 249: the source says an algebraic group in characteristic `p` is linearly reductive iff its identity component is a torus and `p` does not divide the index; it should say "of multiplicative type", or restrict to smooth groups, since `μ_p` is linearly reductive and connected but not a torus; affects nothing.
- **Misprint** in conrad-rgs at Remark 6.1.2, p. 186: the source writes "that it not true"; it should be "that is not true"; affects nothing.
