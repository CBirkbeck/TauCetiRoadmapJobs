# PKG-AmenableTracesOnCStarAlgebras: package report

Deliverables: `packages/AmenableTracesOnCStarAlgebras/README.md` (2045 lines, eight layers,
40 numbered sections as in the accepted design), `packages/AmenableTracesOnCStarAlgebras/Suggested.lean`
(18 headline theorems, 23 supporting definitions and instances), `packages/AmenableTracesOnCStarAlgebras/metadata.toml`
(`topic = "math.OA"`, as `TauCetiRoadmap/CStarAlgebras/metadata.toml` and
`TauCetiRoadmap/VonNeumannAlgebras/metadata.toml`), `packages/AmenableTracesOnCStarAlgebras/sources.toml`
(header comment now points at `README.md`; no entry changed, no new source). `design/plan.json`
is unchanged: its `gaps` list stays empty, because every supplier section the package consumes
already states what is consumed (checked below).

## Headline theorems

| Headline (README) | Status | Lean name |
|---|---|---|
| Connes–Kirchberg, (a) ⇔ (b) ⇔ (c): amenable iff a hypertrace exists in one/every faithful representation (§4.4) | stated, for each faithful `π` | `isAmenableTrace_iff_exists_isHypertrace` |
| Connes–Kirchberg, (a) ⇔ (f) ⇔ (g): u.c.p. extension of `π_τ` into `π_τ(A)''` (§4.4) | stated, for each faithful `π` | `isAmenableTrace_iff_exists_ucp_extension` |
| Connes–Kirchberg, (a) ⇔ (d): `μ_τ` bounded by the minimal (spatial) norm on `A ⊙ Aᵒᵖ` (§4.4) | stated, with the spatial norm on Mathlib's `H ⊗[ℂ] K` via `TensorProduct.mapL` | `isAmenableTrace_iff_norm_sum_le` |
| Connes–Kirchberg, (e): bimodule representation `π_τ × π_τᵒᵖ` min-bounded (§4.4) | not statable: the right GNS representation `π_τᵒᵖ` is a README construction (§1.4), not a carrier at the pins | — |
| Connes's Følner condition, sufficiency (§4.5) | stated | `isAmenableTrace_of_isFoelnerTrace` |
| Connes's Følner condition, equivalence in general position (§4.5) | stated | `isAmenableTrace_iff_isFoelnerTrace` |
| Tracial von Neumann algebras: amenable iff injective (§4.6) | stated (with local instances making `M.toStarSubalgebra` a C*-algebra with the operator order) | `isAmenableTrace_iff_isInjective` |
| Uniform amenable iff `π_τ(A)''` injective (§5.2 (i) ⇔ (ii)) | stated, unital and nonunital | `isUniformAmenableTrace_iff_isInjective` |
| §5.2 (iv): `τ''` amenable on `M_τ` | not statable: the vector trace as a positive functional on `π_τ(A)''` is a README construction (§1.4) | — |
| Nuclear ⇒ every tracial state uniform amenable (§5.3) | stated | `isUniformAmenableTrace_of_isNuclearMap_id` |
| Exact: AT ⇔ UAT ⇔ `π_τ : A → M_τ` nuclear ⇔ `M_τ` injective (§5.4) | stated, exactness taken in its nuclear-embedding form (CStarAlgebras C7.1) | `isAmenableTrace_tfae_of_isNuclearMap` |
| Faces (with convexity): AT and UAT are faces of `T(A)` (§3.3, §6.2) | stated | `isAmenableTrace_convexCombination_iff`, `isUniformAmenableTrace_convexCombination_iff` |
| Tensor permanence (§3.5) | not statable: no minimal C*-tensor product `A ⊗min B` as a C*-algebra at the pins (CStarAlgebras' acceptance file records the same) | — |
| Commutative algebras: all traces QD and UAT (§7.1) | stated | `isQuasidiagonalTrace_of_commute` |
| AF algebras: all traces QD and UAT (§7.2) | stated | `isQuasidiagonalTrace_of_isAF` |
| Amenable groups via `C*_r(Γ)` (§7.3) | stated, (i)–(iv) | `amenable_tfae_generatedCStarAlgebra` |
| QD algebra ⇒ QD tracial state (§8.1) | stated | `exists_isQuasidiagonalTrace_of_isQuasidiagonal` |
| Separable + faithful QD trace ⇒ QD algebra (§8.3) | stated | `isQuasidiagonal_of_isQuasidiagonalTrace` |
| Rosenberg (§8.4) | stated | `amenable_of_isQuasidiagonal_generatedCStarAlgebra` |
| Subalgebras of simple unital AF algebras (§8.5) | stated, including the normalized-restriction form | `subalgebra_isAF_simple` |

Not counted as headlines (README targets only): the reformulations of §3.2, pullback (§3.4),
normalized restriction (§6.3, used inside `subalgebra_isAF_simple`), descent to `π_τ(A)` (§6.4),
ideal extension (§6.5), the tracial-state API of Layer 1, the toolkit of Layer 2, weak nuclearity
(§5.1), the existence of a tracial state on a nonzero unital AF algebra (§7.2) and the hyperfinite
clause (§5.2 (v), §5.4), which is (ii) composed with VonNeumannAlgebras V13b's injective ⇔
hyperfinite theorem.

Definitions in `Suggested.lean`, each only because a headline needs it: `IsTracialState` (the
`0`-KMS predicate of `TauCeti.CStarAction.trivial`, a specialisation of the pinned notion, not a
second definition of it), `IsFaithfulTrace`, `gnsVonNeumannAlgebra` (`VonNeumannAlgebra.adjoin`
of the range of Mathlib's GNS representation), `Mat`, `matrixTrace`, `matrixTwoNorm`,
`IsAmenableTrace`, `IsQuasidiagonalTrace`, `IsUniformAmenableTrace`, `AdmitsFaithfulAmenableTrace`,
`IsHypertrace`, `IsFoelnerTrace`, `IsInjective`, `IsNormalState`, `IsNuclearMap`, `IsAF`,
`generatedCStarAlgebra`, `IsQuasidiagonalSet`, `IsQuasidiagonal`, and four instances with real
proofs (`isClosed_vonNeumannAlgebra`, `starOrderedRing_vonNeumannAlgebra`,
`isClosed_generatedCStarAlgebra`, `starOrderedRing_generatedCStarAlgebra`). `IsInjective`,
`IsNormalState`, `IsNuclearMap`, `IsAF`, `IsQuasidiagonalSet`, `IsQuasidiagonal` and
`generatedCStarAlgebra` restate, on native carriers and in this roadmap's namespace, the notions
of VonNeumannAlgebras V13a/V4, CStarAlgebras C6.1/C8.1, CStarClassification §2.1 and
OperatorAlgebraDynamics D2.FreeGroups, because another roadmap's module cannot be imported; no
fully qualified name coincides with a declaration of a roadmap I can read (those live in
`TauCetiRoadmap.CStarAlgebras`, `TauCetiRoadmap.VonNeumannAlgebras`,
`TauCetiRoadmap.CStarClassification`, `TauCetiRoadmap.OperatorAlgebraDynamics`). Amenability of
groups is Tau Ceti's `TauCeti.Amenable` itself. No `def` has a `sorry` body; no `set_option`; the
imports are `Mathlib` and the three Tau Ceti modules actually used
(`TauCeti.Analysis.CStarAlgebra.Action.KMS.Basic`, `TauCeti.Analysis.VonNeumannAlgebra.Adjoin`,
`TauCeti.GroupTheory.Amenable.Basic`).

## Corrections relative to the design (and why)

1. **R01 of the accepted review (P3), applied.** The §3.1 Check claiming that an unnormalized
   trace "would wrongly exclude `tr_n`" is replaced by the dilation negative control: for every
   tracial state `τ`, `φ_m(a) = τ(a)·1_m/m` recovers `τ` exactly through `Tr_m` with defect
   `≤ ‖a‖‖b‖(1/m + 1/m²)`, so the unnormalized definition would admit the canonical trace of
   `C*_r(F₂)`; normalized recovery rejects these maps (`tr_m φ_m(1) = 1/m`). Values computed in
   the table below.
2. **Exact case, nuclearity target (my own first draft, caught in the adversarial pass).** As a
   map into `B(L²(A,τ))`, `π_τ` is nuclear for every tracial state of an exact algebra (extend
   along a faithful nuclear representation by Arveson's theorem), so a TFAE item "`π_τ` nuclear"
   with target `B(L²)` would make every trace of `C*_r(F₂)` amenable. The Lean item and the README
   now say nuclear *as a map into `M_τ`*, with a Check on `C*_r(F₂)`. The design's wording was
   already "`π_τ : A → M_τ`"; the README now makes the target explicit and adds the route detail.
3. **Locators for injectivity.** brown2006 Theorem 3.2.2 lists hyperfiniteness as (5), for
   separable unital `A` (brown2006 line 989); §4.6 and §5.2 and the Lean docstrings now say so
   instead of citing (5) as injectivity; schafhauser2020 lines 82–84 is cited only for II₁
   factors.
4. **Hypertrace definition** now in the commutation form `ψ(π(a)T) = ψ(Tπ(a))`, matching the Lean,
   with the unitary form of brown2006 Definition 3.1.1 as the proved equivalent.
5. **Følner condition** written in the orthonormal-family form (Hilbert–Schmidt commutator and
   normalized compressed trace as finite sums), matching the Lean predicate and §2.3; the forward
   direction is stated for any unital representation (faithfulness not needed), as in the Lean.
6. **Reduced group C*-algebra** pinned concretely as the C*-algebra generated by the left-regular
   unitaries of `lp (fun _ : Γ => ℂ) 2`, as in OperatorAlgebraDynamics D2.FreeGroups;
   amenability is `TauCeti.Amenable` with the discrete topology.
7. **Downstream consumers on main** (FactorRigidity, TemperleyLieb, NoncommutativeIntegration) are
   now named as "Part II" consumers, since a roadmap on main cannot consume a later one.
8. Supplier Lean names of other roadmaps (`schwarz`, `stinespring`, `cp_radonNikodym`,
   `multiplicativeDomain_iff`, `isQuasidiagonal_iff_exists_matrix_maps`, `IsNuclearContraction`,
   `tomiyama`, V5's tracial-state predicate) are now cited in prose by section, so that no
   backticked name of the README can be mistaken for an undeclared declaration of this roadmap.
9. Small additions from the review's computed table: the positive-shift detail of the separation
   argument (§1.7), the auxiliary `ℂ^q` remark (§2.4, a gap in brown2006's proof of Lemma 3.1.4),
   the zero-weight block remark (§1.6, an error in brown2006's proof of Lemma 2.5), new Checks in
   §1.4 (nonunital `c₀`), §3.5, §4.4, §4.5, §4.6 (`H = 0`), §5.1, §5.2 (interval averages),
   §6.1, §6.4, §6.5, §7.3 (`S₃`, trivial group) and §8.5 (simplicity needed).

## Duplication sweep: removals

- **Canonical trace of `C*_r(Γ)` as a faithful tracial state** (design §7.3, "prove that the
  canonical trace … is a faithful tracial state"): owned by OperatorAlgebraDynamics
  D2.FreeGroups ("D2's coefficient expectation specializes to the faithful tracial state
  `τ(x)=⟨δ_1,xδ_1⟩`"), on main. Deleted here, cited in Scope and in the supplier contracts; §7.3
  keeps only the GNS identification `M_{τ_Γ} = L(Γ)`.
- **Discrete-group amenability and the non-amenability of `F₂`** (design: AmenableGroups Layers
  2–3): at the pinned Tau Ceti as `TauCeti.Amenable` (`TauCeti/GroupTheory/Amenable/Basic.lean`),
  `TauCeti.Amenable.of_lpTop` (`TauCeti/GroupTheory/Amenable/Linfty.lean`) and
  `TauCeti.not_amenable_freeGroup` (`TauCeti/GroupTheory/Amenable/FreeGroup.lean`). The
  AmenableGroups supplier subsection is replaced by these pinned declarations.
- **Amenability of `Γ` ⇔ injectivity of `L(Γ)`** (design §7.3 condition (vi)): FactorRigidity
  §2.2 (relative amenability at `Λ = {1}`, on main) and VonNeumannAlgebras V13b (injectivity of
  group algebras of amenable groups). Removed from the list of equivalent conditions; §7.3 says
  that condition (v) is injectivity of `L(Γ)` by §5.2 and cites both owners.
- Kept and distinguished, not removed: VonNeumannAlgebras V13b's hypertraces on `B(L²M)` and its
  operator-form Følner criterion for injective finite von Neumann algebras (projection form for
  II₁ factors) are different objects from §4.1's C*-hypertraces and §4.5's projection Følner
  condition for a C*-algebra in general position; Scope says so, and the §4.5 Check on `ℂ²`
  agrees with V13b's Check on `ℂ²` with a non-uniform trace. CStarAlgebras C6.2 (nuclear ⇔ `A**`
  injective) gives an alternative route to the injectivity clause of §5.3, now cited there.
  CStarClassification CL3 §3.4 identifies `T(A)` of a unital AF algebra with a state space but does
  not state nonemptiness, so §7.2 keeps its existence argument.
- Searched by object in the pinned Mathlib and Tau Ceti: normalized matrix trace or 2-norm on
  `CStarMatrix` (absent; Tau Ceti's Frobenius product is unnormalized on `Matrix`), closed trace
  kernel on nonunital algebras (absent; `LinearMap.traceRadical` is algebraic and unital), tensor
  functional, right GNS representation, vector trace (absent), amenable/quasidiagonal traces,
  hypertraces, nuclear maps, quasidiagonality (absent; `rg` on both trees). Mathlib has no
  minimal C*-tensor product; it has the Hilbert tensor product used in `isAmenableTrace_iff_norm_sum_le`.

## Ownership against open work

The 218 open roadmap pull requests listed for this job, and main, were searched with
`roadmaps grep` by object: `amenable trace`, `hypertrace` (main only: VonNeumannAlgebras,
Subfactors, FactorRigidity, all von Neumann hypertraces), `quasidiagonal trace`,
`uniform(ly)? amenable`, `Connes.{0,3}Kirchberg`, `faithful amenable` (no match anywhere),
`trace kernel` (only unrelated arithmetic uses), `AF.embedding` and `Rosenberg`
(CStarClassification mentions both only as background: it attributes "the analytic AF-embedding
theorem" to CStarAlgebras C9, whose sections contain no AF-embedding or Rosenberg statement, and
uses Rosenberg's theorem in a Check), `canonical trace` (CompactQuantumMetricSpaces and
HeisenbergImprimitivity: canonical traces of twisted lattice algebras, their own objects;
CategoricalOperatorAlgebras: bimodule traces). The vocabulary-closest heads in
`scratch/overlaps.md` (CStarClassification, CompactQuantumMetricSpaces, CategoricalOperatorAlgebras,
QuantumFoundations, AnalyticNumberTheoryPartII) own none of this roadmap's objects
(QuantumFoundations has no tracial-state, amenability, hypertrace or quasidiagonality content).
This roadmap is the owner of trace-level approximation theory: nothing on main or in an open head
states it. The overlap inventory reports no open pull request changing this roadmap, no dropped
cited id and no id defined only by an open revision.

## Supplier citations re-resolved

All cited sections were opened at main (CStarAlgebras C2.1, C2.8, C4.1, C4.2, C5.1, C5.2, C5.4,
C6.1, C6.2, C6.5, C7.1, C8.1–C8.4, C9.1, C9.7; VonNeumannAlgebras V0–V6, V13a, V13b.SpatialNorm,
V13b; OperatorAlgebraDynamics D2, D2.FreeGroups; FactorRigidity §2.2; BanachSpaceTheory B1) and at
the head of CStarClassification's pull request (CL2 §2.1, CL3 §3.4, §3.5, and its `IsAF`). The
resolver (`roadmaps resolve` on the package README, main ab06c8c, 429 heads) reports no
cross-roadmap citation and no Lean name found nowhere; it does not inspect the pinned Lake
packages, so every backticked Mathlib and Tau Ceti name of the README was grepped as a
declaration in the pinned trees: all found (the only unmatched tokens are notation such as
`tr_m`, `AT_QD` and source keys).

## Sources

No new source was needed or fetched; `scratch/needs-references.toml` was not created. The three
cached texts were reopened where a locator was changed or added: brown2006 lines 895–914
(Theorem 3.1.7, general position, Følner condition (3)), 973–992 (Theorem 3.2.2, (5) is
hyperfiniteness, (6) weak nuclearity), 1030–1048; schafhauser2020 lines 69–89 (necessary
conditions, Theorem A, II₁-factor remark). The waived (`connes1976`, `brown-ozawa2008`,
`paulsen2002`, `pedersen2018`) and uncertified (`kirchberg1993`) citations are kept by locator
and were not reopened. Brown's standing separable unital hypotheses (brown2006 lines 357–359) are
why every general statement names its own route.

## Binder probe

All 41 declarations of `Suggested.lean` were checked with `#check @name` in one scratch copy of
the file, elaborated once. Every elaborated signature carries exactly the binders its README
statement needs: unitality (`CStarAlgebra A`) on the Layer 4 statements and §8.1, `NonUnitalCStarAlgebra`
elsewhere; the order classes; injectivity of `π`/`ρ`/`ι`; `IsTracialState` on every trace;
`SeparableSpace A`, `SeparableSpace H` and the general-position hypothesis on
`isAmenableTrace_iff_isFoelnerTrace`; faithfulness and normality on `isAmenableTrace_iff_isInjective`;
`DecidableEq Γ` (for `lp.single`) and the discrete topology on the group statement; `Nontrivial A`
on §8.1 and §8.5. The predicates `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace` carry no
`StarOrderedRing A` binder, which their bodies do not use. Changes made after the probe: none
needed; the probe was run after the two corrections that elaboration forced (`Module ℂ ↥M` was not
found on the `SetLike` coercion of a `VonNeumannAlgebra`, so the carrier is `M.toStarSubalgebra`;
the subtype order instance needs `𝕜 := ℂ` supplied explicitly, given by the two
`starOrderedRing_*` instances).

## Elaboration

Command: `lake env lean <absolute path of packages/AmenableTracesOnCStarAlgebras/Suggested.lean>` from
the content checkout (all three Tau Ceti object files were present). Outcome: exit code 0;
exactly 18 messages, all `warning: declaration uses 'sorry'`, one per theorem (lines 157, 166,
179, 203, 210, 256, 274, 288, 298, 321, 329, 345, 357, 392, 432, 440, 448, 462); no other
message.

## Dependency check

    tauceti-roadmap --conf <conf> gate --depcheck packages/AmenableTracesOnCStarAlgebras/README.md --name AmenableTracesOnCStarAlgebras --order merge-order/ORDER.txt --movable --content <content checkout>

Output:

    depcheck: 229 roadmaps, 2060 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Suppliers named: CStarAlgebras, VonNeumannAlgebras,
OperatorAlgebraDynamics, FactorRigidity, BanachSpaceTheory (on main), CStarClassification
(earlier in the merge order, directly above this roadmap). No prohibited supplier is cited.

## Adversarial pass

Notation: `tr_n = Tr/n`; AT, QD, UAT the three trace classes. Every row records the instances and
the values computed on each side.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `IsTracialState` (0-KMS of trivial action) | zero algebra; `M_2` with `tr_2`, `Tr`, `x ↦ x₁₁` | zero algebra: every functional has norm 0 ≠ 1, so no tracial state; `‖tr_2‖ = tr_2(1) = 1`, `‖Tr‖ = 2`; `x₁₁` at `e₁₂e₂₁` vs `e₂₁e₁₂`: 1 vs 0 | correct; Checks kept |
| `matrixTrace`, `matrixTwoNorm` | `k = 0, 1, 2` | `tr_0 = 0⁻¹·0 = 0` (junk value equals the convention); `tr_1(1) = 1`; `tr_2(1) = 1`, `tr_2(e₁₁) = 1/2`, `‖e₁₁‖₂ = 0.7071`; unnormalized `‖1‖ = √2 > 1` | correct |
| `IsAmenableTrace` vs wrong normalization (R01) | `M_2`, `a = e₁₂`, `b = e₂₁`, `φ_m(x) = τ(x)1_m/m` | `Tr_m φ_m(ab) = 1/2 = τ(ab)`; operator and normalized 2-defects `1/(2m)`; unnormalized HS defect `1/(2√m)`; normalized unit error `1 − 1/m`, unnormalized `0` | normalized definitions reject the dilations; Check replaced |
| `IsUniformAmenableTrace` | `C(𝕋)`, roots of unity; interval averages on `C[0,1]` | dual-norm error of root-of-unity measures = 2 for all `n`; averages recover Lebesgue exactly, defect at `f(t)=t` is `1/(12n²)` | pointwise vs dual-norm recovery distinguished |
| `IsHypertrace` | `ℂ²` diagonal on `ℂ²`, `τ = (t, 1−t)`; vector state at `(1,1)/√2` | `ψ(T) = tT₁₁ + (1−t)T₂₂`: `ψ(1) = 1`, `ψ(dT) = ψ(Td)`; vector state: `ψ′(e₁₁e₁₂) = 1/2`, `ψ′(e₁₂e₁₁) = 0` | centrality excludes the arbitrary extension |
| `isAmenableTrace_iff_exists_isHypertrace` | `M_n`, `π = id`; `ℂ1 ⊆ B(H)`; `C*_r(F₂)` | `tr_n` amenable (`φ = id`) and `tr_n` the unique hypertrace; every state of `B(H)` a hypertrace for `id_ℂ`; F₂: both sides false | both directions agree |
| `isAmenableTrace_iff_exists_ucp_extension` | `ℂ⊕ℂ`, `τ = pr₁`, `π` diagonal on `ℂ²` | `L² = ℂ`, `M_τ = ℂ`; `Φ(T) = T₁₁`: `Φ(1) = 1`, `Φ(π(a,b)) = a = π_τ(a,b)`; hypertrace `T ↦ T₁₁` | both sides true |
| `isAmenableTrace_iff_norm_sum_le` | `M_2`, `a = e₁₂`, `b = e₂₁`; `ℂ⊕ℂ`, `pr₁`; `C*_r(F₂)`, `aᵢ = uᵢ`, `bᵢ = uᵢ*` over the 4 generators and inverses | `|τ(ab)| = 1/2 ≤ ‖π(e₁₂)⊗ρ(e₂₁ᵒᵖ)‖ = 1`; `pr₁`: `1 ≤ 1` (equality); F₂: `Σ τ(aᵢbᵢ) = 4` vs spatial norm `= ‖Σ λ(uᵢ)‖ = 2√3 ≈ 3.46` (Fell absorption, Kesten) | inequality fails exactly for the non-amenable trace |
| `IsFoelnerTrace`, `isAmenableTrace_of_isFoelnerTrace` | `C(𝕋)` on `L²(𝕋)`, `eᵢ = zⁱ`, `a = z` | defect terms `‖(1−P)z·z^{n−1}‖² = 1`, `‖(1−P)z̄·z⁰‖² = 1`, total `2 < εn` for `n > 2/ε`; `n⁻¹Σ⟪zⁱ, zⁱ⁺¹⟫ = 0 = τ(z)` | Følner sequence; sufficiency holds without faithfulness |
| `isAmenableTrace_iff_isFoelnerTrace` | `ℂ²` diagonal, `τ = (1/3, 2/3)`; `M_n ⊆ B(ℂⁿ)` | rank-one `P` with compressed trace `1/3`: `‖[e₁₁,P]‖²_HS = 2·(1/3)(2/3) = 4/9`; `P = 1`: trace `1/2`; so no Følner net though `τ` is amenable; `H` finite-dimensional so `π(A) ∩ K(H) ≠ 0`; `M_n`: `P = 1` works | general-position hypothesis necessary for the converse only |
| `isAmenableTrace_iff_isInjective` (vN) | `M_n`; `L∞[0,1]`; `L(F₂)`; `H = 0` | `M_n`: identity projection, norm 1, `tr_n` amenable; `L∞`: abelian, both true; `L(F₂)`: both false; `H = 0`: zero map of norm `0 ≤ 1`, no tracial state, vacuous | agrees; forward direction (injective ⇒ AT) uses neither faithfulness nor normality, noted in README |
| `isUniformAmenableTrace_iff_isInjective` | `C*(F₂)` regular trace; nonunital `c₀` with `Σ2^{-n}δ_n`; `M_n` | `C*(F₂)`: AT true, UAT false, `L(F₂)` non-injective; `c₀`: `‖1̂ − ê_m‖² = 2^{-m}`, `M_τ = ℓ∞` injective, UAT true; `M_n` both true | agrees for unital and nonunital `A` |
| `isUniformAmenableTrace_of_isNuclearMap_id` | `K(ℓ²)`; CAR; zero algebra | `K(ℓ²)`: equal rank-one traces `c` with `Nc ≤ 1` for all `N`, so `c = 0` and no tracial state (vacuous); CAR rank-one projection of first factor: trace `1/2`, UAT; zero algebra: no trace | no existence claim; true where non-vacuous |
| `isAmenableTrace_tfae_of_isNuclearMap` | `C*_r(F₂)`; `C(X)`; `C*(F₂)` | F₂ reduced: inclusion nuclear (exact), all four items false, while `π_τ` into `B(ℓ²)` is nuclear (would have made the TFAE false: corrected); `C(X)`: all true; `C*(F₂)`: hypothesis fails (AT true, injective false) | target `M_τ` fixed in Lean and README |
| `isAmenableTrace_convexCombination_iff`, UAT version | `C*_r(F₂) ⊕ ℂ`, `γ = t(τ′∘pr₁) + (1−t)pr₂`, `0 < t < 1`; `M_2 ⊕ M_2` | `γ` not AT; RHS: `τ′∘pr₁` not AT (its pullback along `x ↦ (x,0)` is `τ′`, norm 1); `M_2⊕M_2`: both sides true for every `t` | both directions agree; `s` strictly inside `(0,1)` |
| `isQuasidiagonalTrace_of_commute` | `C[0,1]`, Lebesgue, `f(x) = x` | Riemann sum `(n+1)/(2n) → 1/2 = ∫f` | correct |
| `isQuasidiagonalTrace_of_isAF` | CAR; `K(ℓ²)`; `C(Cantor)` | CAR: `τ(e₁₁⊗1⊗⋯) = 1/2`, exact recovery at every stage; `K(ℓ²)` AF, no trace (vacuous); Cantor: probability measures, QD | correct |
| `amenable_tfae_generatedCStarAlgebra` | trivial group; `S₃`; `ℤ`; `F₂` | trivial: `C*_r = ℂ`, all true; `S₃`: `Tr(λ_e) = 6`, `Tr(λ_g) = 0`, `τ = Tr/6`, all true; `ℤ`: `τ(λ_n) = [n = 0] = ∫zⁿ`, all true; `F₂`: items 2 and 4 false because `τ_{F₂}` exists (D2.FreeGroups) and is not AT, items 1 and 3 false | non-vacuous ∀-items; convention `λ_gM_fλ_g* = M_{L_gf}` gives Tau Ceti's left invariance |
| `exists_isQuasidiagonalTrace_of_isQuasidiagonal` | `C(𝕋)`; `SO₂`; zero algebra | Lebesgue as cluster point; `SO₂` nonunital, no trace (`s₁s₁* + s₂s₂* = 1` forces `τ(f⊗·) = 0`), excluded by unitality; zero algebra excluded by `Nontrivial` | hypotheses necessary |
| `isQuasidiagonal_of_isQuasidiagonalTrace` | `ℂ⊕ℂ`, `(1/2,1/2)`; Toeplitz | constant faithful approximant `diag(a,b)`, `‖a‖ = ‖φ(a)‖`; Toeplitz: rank-one projection has trace 0, no faithful trace, not QD | faithfulness necessary; any universe has a separable Hilbert space |
| `amenable_of_isQuasidiagonal_generatedCStarAlgebra` | `ℤ`; `F₂`; finite `Γ` | `C(𝕋)` QD and `ℤ` amenable; `F₂` not amenable so `C*_r(F₂)` not QD; finite: finite-dimensional, QD | correct |
| `subalgebra_isAF_simple` | `M_3` corner in `M_4 ⊆ CAR`; `C(𝕋) ⊆ C(Cantor) ⊆ CAR`; `B = ℂ⊕ℂ` (not simple); `A = 0`; `B = M_n`, `A = ℂ` | corner: `τ∘ι = (3/4)tr_3`, `c = 3/4`, normalized `tr_3` faithful UAT; Cantor: dyadic arcs of length `2^{-m}` get mass `2^{-m}`, Lebesgue; `ℂ⊕ℂ`, `pr₁∘id` not faithful (`c = 1`); `A = 0` excluded; `M_n`: `c = 1/n`, normalized `id_ℂ` | simplicity and nontriviality necessary; trace-preserving form is `c = 1` |
| New Checks: §1.4, §3.5, §6.1, §6.4 | `c₀`; `e₁₁⊗e₁₁ ∈ M_2⊗M_2`; `γ = (1,0)`, `τ = (0,1)`; `K = {0} ⊆ [0,1]` | `‖1̂ − ê_m‖² = 2^{-m}`; product trace `1/4`, 2-norm `1/2`; `sτ ≤ γ` at `(0,1)` gives `s ≤ 0`; constant extension sends `1 ↦ 1` | consistent with their sections |
| §1.5 contraction bound | `c = diag(1,0)`, `x = e₁₂` | `‖x − cxc‖₂ = 0.7071 ≤ 2‖x‖‖c−1‖₂ = 1.414` | holds |
| §2.4 Ozawa map | `h = diag(1/3, 2/3)` on `ℂ²` | `q = 3 > dim H = 2`; `min`: `tr_3(φ(e₁₂)φ(e₂₁)) = 1/3 ≤ tr_3 φ(e₁₁) = 1/3`; `max` would give `2/3` | auxiliary `ℂ^q` needed; min correct |

Context row: every statement's standing hypotheses were confirmed in the elaborated binders (Binder
probe above). Unused hypotheses (P3 notes, not defects): `hτ` in
`isAmenableTrace_of_isFoelnerTrace` is not needed by the proof route (the compressions are
approximants whatever `τ` is); kept because the README states the theorem for tracial states.

## Suspicious passages

None: no fetched or supplier text contained instructions.
