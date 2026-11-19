# GATE-SurfaceGroupCharacterVarieties~1: answers to the human review of 833161e

One review (kim-em, 2026-11-19T00:53:07Z): seven requested changes (H01–H07) and one question for the
human reviewers (H08). The repairs are commit 9f6200e on the pull-request branch (not pushed). Pins
used for every library check: Tau Ceti 2fd255d, Mathlib 1b1ccf4 (the `lake-manifest.json` of the
branch and of main 890b66d). The review quotes Tau Ceti 0642eae and Mathlib 048fffa1; neither is an
object in the pinned clones, so the review's library claims were rechecked at 2fd255d / 1b1ccf4.

## H01 (kim-em) — applied

The comparison targets are now in the layers, each with a *Needs:* on MappingClassGroupsAndCanonicalRepresentations
(earlier in the merge order, so the supply direction is unchanged):
§3.3 adds "on `PMod_{g,n}` the restriction of `Ψ_x` is that roadmap's §0.2 outer action of
`PMod(g, 0, n)`" (lift along `Forget`; the lift fixes the punctures by §2.3; its functorial based
action is `f_{const}`). §3.5 adds the MCG-finiteness comparison: `ρ` is MCG-finite (§2.1 there)
exactly when `[ρ]` has a finite `Mod_{g,n}`-orbit. §4.1 has a new API bullet: for `k = ℂ`, `G = GL_r` and a
finite presentation, `Hom(Γ, GL_r)` and `R_r(Γ)` are the same closed subscheme of `GL_r^m`. §7.2
adds "for finitely presented `Γ`, `Hom(Γ, GL_r)//GL_r` is `M_r(Γ)`". It also adds the
NonabelianLevelStructures §5.1 identification. The Scope said this held by an unproved PGL₂ argument and the
supplier contract listed it as "Assumed". It is now a target: `𝔾_m × SL₂ → GL₂` is dominant onto
the reduced `GL₂`, so the `GL₂`- and `SL₂`-coinvariants coincide. The Scope paragraph, both supplier contracts (MCGACR
§§1.4, 2.1 added; NLS "Assumed" removed) and the Layer 3/4/7 Dependencies now say this. Ownership is not
reversed: MCGACR keeps `R_r`, `M_r`, the fixed-determinant variants and MCG-finiteness; this roadmap
keeps the general §4.1/§7.2 objects and owns the identifications.

## H02 (kim-em) — applied differently

`TauCeti.ContinuousOut` exists at the pin (`Topology/Algebra/Group/ContinuousAut/Basic.lean`, line 311).
It is now listed under "From Tau Ceti", with TeichmullerGeometry §4.2's comparison for the discrete
topology. Two sentences said "the pins have no outer automorphism group" (Scope; `Suggested.lean`
module docstring); both now say "the pins have it only for topological groups, as
`TauCeti.ContinuousOut`".
The other declarations requested are not at the pinned Tau Ceti 2fd255d: `TauCeti.SurfaceGroup.Orientable`,
`orientableWord`, `equivFreeGroup`, `freeBasis` and `TauCeti.MappingClassGroup`. Evidence:
`TauCeti/GroupTheory/` has no `SurfaceGroup` directory, and `Geometry/Diffeomorphism/` has no
`MappingClassGroup.lean`. A grep for `SurfaceGroup` or `MappingClassGroup` in `TauCeti/` finds
nothing. FreeGroupsAndLimitGroups §6.1 on main still lists `SurfaceGroup.orientable` as a target.
So they cannot be supplier contracts and §§2.1/4.3 cannot be read against them. The "From Tau Ceti"
assumptions now record that the pins have no presented surface group and no mapping class group of a
surface.

## H03 (kim-em) — applied

§4.3 is rewritten. Old: an isomorphism "through `S⁺(g, n) ≃* π₁`" onto `{∏ [A_i, B_i] = 1}`, with
an unspecified commutator. New: evaluation at MCGACR §0.1's loops `aᵢ, bᵢ, c_j` with
`[A, B] = A B A⁻¹ B⁻¹`. The section records that `S⁺(g, n)`'s generators go to the loops
`aᵢ⁻¹, bᵢ⁻¹, c_j` and gives `ρ(c_n)` explicitly for `n ≥ 1`. It adds the requested points clause:
for every topological group `H`, in particular `G^ℝ` and `G(ℂ)`, evaluation at the loops is a
homeomorphism from `Hom(π₁(Σ_g, x), H)` with the pointwise topology onto
`{∏ [A_i, B_i] = 1} ⊆ H^{2g}`, closed when `H` is Hausdorff, and onto `H^{2g+n−1}` for `n ≥ 1`.
Two Checks were added. The first pins the commutator: in `S₃`, `((2 3), (1 2), (2 3), (1 3 2))` has
`[A₁,B₁][A₂,B₂] = (1 2 3)(1 3 2) = 1` but `∏ A_i⁻¹B_i⁻¹A_iB_i = (1 3 2) ≠ 1`, computed by script.
The second is a negative control: for indiscrete `S₃` the commuting pairs are not closed. The
Conventions bullet's "isomorphic representation schemes `{∏ [A_i, B_i] = 1}`" now names both
subschemes and the map `(A_i, B_i) ↦ (A_i⁻¹, B_i⁻¹)` between them.

## H04 (kim-em) — applied

§3.3 *Needs:* changed from "§1.1; §2.1; §3.1; §3.2; …" to "§1.1; §2.1; §2.2; §2.3; §3.1; §3.2; …;
MappingClassGroupsAndCanonicalRepresentations §0.2; Mathlib
`FundamentalGroup.fundamentalGroupMulEquivOfPath`". §2.3 and MCGACR §0.2 are there for the H01
`PMod` comparison.

## H05 (kim-em) — applied

The Scope's "Not owned and not planned here" sentence no longer assigns the punctured
Dehn–Nielsen–Baer theorem to "a TeichmullerGeometry, Part II". No such roadmap is on main or open
(`roadmaps list` has only TeichmullerGeometry #1169), and `roadmaps grep 'Dehn.Nielsen.Baer'`
finds no owner of the punctured case. The sentence now reads: the smooth punctured model and the
Dehn–Nielsen–Baer theorem for punctured surfaces (injectivity of `Ψ_x` on `Mod_{g,n}` for `n ≥ 1`
and its image) are not planned here, and no target here uses either. They were not added as targets,
which would widen the scope.

## H06 (kim-em) — applied

Every line-number locator, in the README (including §4.3's two, now Sikora2012, Remark 24 and BCGGO2024, §8.1) and the
one in `Suggested.lean`, now gives theorem, section or page numbers, each read from the cached arXiv
text at the cited line. Examples:
LandesmanLitt2024 line 42 → §1.1, p. 2; lines 473–475 → Notation 1.10.3; BCGGO2024 lines 2706–2708 →
§8.1; Sikora2012 lines 459–468 → Lemma 26; line 584 → proof of Theorem 30; BohmLafuente2021
line 193 → §2, p. 5; lines 261–267 → §4, equation (4); BateMartinRohrle2005 lines 263–264 → §2.4,
p. 6; lines 302–303 → Remark 2.9. Source keys now take a comma before the locator
(`(Source, Thm 3.2, p. 41)` house form). Each References entry says that section, theorem and page
numbers are those of the arXiv version read (v4, v2, v3, v2, v3).

## H07 (kim-em) — applied

The `Suggested.lean` module docstring now opens: "The roadmap is `README.md`, which is definitive;
this file is not the roadmap. Its signatures are suggested forms, not an exhaustive checklist: …".

## H08 (kim-em) — answered

Both predicates are needed. `IsSelfAdjointLinearGroup` is a declaration of the LieGroupsPartII
roadmap (its `Suggested.lean`, line 82), not of the pinned libraries. `Suggested.lean` imports no
roadmap module, so it cannot state the Kempf–Ness headlines with that predicate and needs its own
predicate at the pins. Mathematically, the Kempf–Ness theorems are used on
`V = (M_N × M_N)^S` with the trace form (§§5.3, 6.6, 7.1, 7.2), which has no preferred orthonormal
basis. §5.4's comparison theorem shows that in finite dimension `IsRealReductiveLinearGroup` and
`IsSelfAdjointLinearGroup` agree in any orthonormal basis, so the two names describe one class of
groups with an explicit identification.

## Statement checks

- **Signatures.** No declaration signature in `Suggested.lean` changed; only the module docstring
  and one declaration docstring did. The elaborated types in the job's `signatures.md` (24
  declarations, none with a dropped section binder) therefore still apply. I compared each against
  its README statement and found no change needed. No separate `#check` file was elaborated, since
  the brief allows only the module build and the gate as Lean commands.
- **Ownership.** I compared the MCGACR §§0.1, 0.2, 1.4, 2.1 heads (#2266, d940044) and
  NonabelianLevelStructures §§5.1–5.2 (#2273, 8340c5c), read with `roadmaps show`. MCGACR §1.4 owns
  only the `GL_r`-over-`ℂ` case. TeichmullerGeometry §4.2 (#1169, 417bd27) owns `OuterAut` and its
  `ContinuousOut` comparison.
- **Citation resolver.** `roadmaps resolve` lists `LandesmanLitt2024, §1.1`,
  `BohmLafuente2021, §1` and `BateMartinRohrle2005, §2.4` as "cross-roadmap citations found
  nowhere". These are false positives: they are source keys defined under References, not
  roadmaps. Lean names found nowhere: none.
- **Sources.** No source was fetched and no `needs-references.toml` entry was added. Every converted
  locator was read from the five cached texts.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.3: `Ψ_x` on `PMod_{g,n}` = MCGACR §0.2 outer action | (1,0); (0,3); (0,2); direction | (1,0): shear fixing 0, MCGACR `f_*` = `[[1,0],[1,1]]` = `Ψ_x` (§3.3 Check). (0,3), (0,2): `PMod` trivial, both sides 1. MCGACR uses `f_*`, not `(f⁻¹)_*`; `f_{const}` = `map f` | holds; lift fixes punctures since `σ` is constant on isotopy classes (§2.3) | named `S = Σ_{g,n}`; *Needs:* §2.3 |
| §3.5: MCG-finite ⇔ finite `Mod_{g,n}`-orbit | trivial ρ; genus-2 unipotent ρ; (0,3) with `GL₁` | trivial: both orbits size 1. Unipotent: infinite under `Mod_{2,0}` and MCGACR §2.1 Check infinite. `GL₁`: `[ρ∘φ]` set = `{[ρ]}` (`PMod_{0,3}` trivial, pushes inner), `S₃`-orbit ≤ 6 | consistent | none |
| §4.1: `Hom(Γ, GL_r)` = `R_r(Γ)` | `ℤ/2 = ⟨s | s²⟩`, r = 2; `⟨s | s⟩`; `⟨ | ⟩`; `ℤ²`, r = 1 | `A^{2k} = 1 ∀k ⇔ A² = 1`; `{A = 1}` both; point both; `𝔾_m²` both. Ideal equality via tautological points of `O/I_rel` and `O/I_N` | holds | uses `s₁…s_m` (`k` is the ring) |
| §7.2: `Hom//GL_r` = `M_r(Γ)` | `Γ = ℤ`, r = 2; `ℤ/2`, r = 2; reducedness | `ℂ[tr, det^{±1}] = 𝔸¹ × 𝔾_m` (matches §7.2 Check); 3 points both (MCGACR Check). `𝔾_m` on `ℂ[x]/(x²)`: point- and coaction-invariants both `ℂ`. Negative: `μ₂/𝔽₂` on `𝔸¹`, `x` fixed by `μ₂(𝔽₂) = 1` but `x ↦ x⊗t` | holds, needs `GL_r` reduced (stated) | added "finitely presented `Γ`" |
| §7.2: `Hom(F₂, SL₂)//SL₂` = NLS §5.1 scheme | `k = ℂ`; `k = 𝔽₂`; test functions | ℂ: `𝔸³` by traces, both (Sikora Ex. 48). 𝔽₂: `𝔾_m × SL₂ → GL₂` onto over `𝔽̄₂` (square roots exist), `GL₂` reduced ⇒ injective coordinate map. `tr A` invariant for both; `x₁₂` for neither | holds in every characteristic | replaces the PGL₂ argument and the "Assumed" |
| §4.3: evaluation at loops ≅ `{∏ ABA⁻¹B⁻¹ = 1}` | (0,0),(0,1),(0,2),(0,3),(1,0),(1,1),(2,0) | point; point; `G`, `c₂ = c₁⁻¹`; `G²`, `c₃ = (c₁c₂)⁻¹`; commuting pairs; `G²`, `c₁ = [a,b]⁻¹` (= MCGACR §0.1 Check); S₃ tuple: product 1 vs `(1 3 2)` | holds | — |
| §4.3: topological clause | Hausdorff `G^ℝ`; indiscrete `S₃` | words in coordinates give continuous inverse; indiscrete `S₃`, g = 1: commuting set ∋ (1,1), ∌ ((1 2),(1 3)), not closed | closedness needs Hausdorff, homeomorphism does not | generalized to every topological group, closed when Hausdorff; negative-control Check added |
| Conventions: two relator subschemes | g = 1; g = 2 in S₃ | g = 1 both `AB = BA`; g = 2 S₃ tuple in one only | "in general different for g ≥ 2" is accurate | — |
| Scope / `Suggested.lean`: `Out` only for topological groups at the pins | Mathlib grep `OuterAut`; Tau Ceti | Mathlib: no hit. Tau Ceti: `ContinuousOut` at `Basic.lean:311`, needs `[TopologicalSpace G]` | accurate | — |
| From Tau Ceti: no surface group, no mapping class group | grep `SurfaceGroup`, `MappingClassGroup`, "mapping class" | 0 declarations; "mapping class" only in reference lists (Birman, Farb–Margalit) | accurate | — |
| Scope: punctured DNB, no target uses it | §§2.2, 2.3, 3.3, 3.5, 7.4 | each uses `Ψ_x` as a homomorphism; injectivity used only for closed `g ≥ 1` (§3.4, TeichmullerGeometry §5.4) | accurate | — |
| Locator conversions | each cited line in the cache | e.g. LL l.45 = Def. 1.1.1 (p. 2); Sikora l.572 = Thm 30; BL l.1050 = Cor. A.2; BMR l.814 = Cor. 3.42, l.861 = Thm 3.46 | every new locator names the object at the old line | — |

## Build

`lake build TauCetiRoadmap.SurfaceGroupCharacterVarieties.Suggested`: Build completed successfully (18606 jobs), 13 `declaration uses 'sorry'` warnings (one per headline), no errors.

## Gate

`gate SurfaceGroupCharacterVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable --pr 2430`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line.
