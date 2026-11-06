# Review of DGFloerPartII (pull request #1799 at 9c233de)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` and `TauCetiRoadmap/DGFloerPartII/Suggested.lean`.
The gate passes every check, the dependency check reports no UPWARD or CYCLE line, the Lean file
elaborates with only its eight `sorry` warnings, and the seeded source sample checks out against
the cached texts. One finding blocks (ownership against main, not repairable inside this folder);
four are P3 repairs inside the README.

Source ids used below: `bdho-cotangent` is the base package's manifest id for the source paper
(arXiv:2404.07953v3, cached, 139 pages; printed page = page marker − 6), `hatcher-at` the base
package's id for Hatcher's *Algebraic Topology*, and "CSS" the cached text of Crowley–Schick–Steimle
(arXiv:2012.13634). This folder has no `sources.toml` yet; this review records none.

## R01 (P2) — Two owners on main: DGFloer Layer 11 still plans this roadmap's Layer 4

**Location.** `TauCetiRoadmap/DGFloerPartII/README.md` lines 32–39 ("The base roadmap … owns every
other numbered statement of the source") and the whole of Layers 1.3–1.4, 2, 3.1–3.2 and 4.

**Claim.** This roadmap owns abundance, fibered families, covering by diffeomorphisms, Lemma 6.35,
homogeneous and projective spaces, Theorem G, the homogeneous carriers, the explicit degrees, the
projective based-loop energy and the multiple-realization step of Theorem B.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main (a0ad405e): Layer 11 items 1–6 (lines
1568–1640) state the same Definitions 1.7/6.11/6.14/6.26/6.32, Propositions 6.13–6.39, Lemma 6.35
with the same seven low-rank values and the same `n ≥ 17` splitting, Theorem H and Theorem G;
Layer 1 items 7–8 (lines 384–391) state 1.3 and 1.4; Layer 5 item 7 (line 1044) states 2.1; Layer 10
item 5's bullet "Multiple realization and Theorem 5.14/Theorem B" (lines 1558–1560) states 3.1–3.2,
consuming TangentialBordism B5/B6.3 and GeneralizedCohomology G5 exactly as 3.1 does here. Only the
base's open revision (DGFloer at fc27fe2b) cuts them: its Layer 11 is reduced to 11.1–11.3 and its
Scope says "DGFloerPartII consumes this roadmap and supplies nothing to it" (that README, line 53).
The cross-PR grep for "abundant with 2-spheres", "covered by diffeomorphisms", `π₈(SO(9))`, `ΩCP`
and `V_(n,2)` finds the objects only in this folder and in DGFloer on main (and in the superseded
revision #963), so the overlap is exactly this one.

**Repair.** Nothing to edit in this folder. The pull request must land after the base's revision
that removes Layer 11 items 1–6, Layer 1 items 7–8, Layer 5 item 7 and the Layer 10 item 5
realization bullet from DGFloer; the pull request's own merge-order block already lists that
revision first. Until it lands, main would carry two plans for every target of Layer 4, which the
ownership principle forbids, so this finding is recorded as blocking and is discharged by the
sequencing alone. Every citation this README makes into the base resolves under both numberings
(checked: Layer 1 items 1–6, Layer 2, Layer 3 item 4, Layer 4 item 5, Layer 5 items 1–6, Layer 6
items 3–5, Layer 10 items 2–5, and the finite cover and torus criterion, which sit inside Layer 11
item 3 on main at line 1614 and in 11.1–11.3 at the revision head), so no citation edit is needed
after the base lands.

## R02 (P3) — The magnetic-sign Check of 3.4 contradicts the base's `ω_can = −dλ_can`

**Location.** README lines 726–732 (3.4, third Check): "`Ψ'^*_σ λ_can = (p − σ_q) dq = λ_can − π^*σ`,
so `Ψ'^*_σ ω_can = ω_can − π^*dσ` and `Ψ'_σ` carries the magnetic form `ω_can − π^*dσ` to `ω_can`;
the form `ω_can + π^*dσ` is reached by the translation by `−σ`."

**Claim.** The Check fixes the sign of the magnetic translation under the base's conventions,
which the Conventions section adopts "unchanged … the sign dictionary".

**Witness.** The base's sign dictionary is `ω_can = −dλ_can` (`TauCetiRoadmap/DGFloer/README.md`
lines 341 and 1078: `ω_can = −mextDeriv λ_can`). With it, `Ψ'^*_σ ω_can = −d(λ_can − π^*σ)
= ω_can + π^*dσ`, which is the base's own acceptance witness at line 1693 (`Ψ'^*_σ ω_can = ω_can +
π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`) and its Layer 6 item 3 statement that `Ψ'_σ` is a
symplectomorphism `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)` (line 1080). The source's magnetic form is
`ω_Q + π^*dσ` with `Ψ(p, q) = (p + σ(q), q)` (`bdho-cotangent` lines 283–285). The Check's
`ω_can − π^*dσ` is the value for `ω_can = +dλ_can`, the convention the roadmap does not use; every
sign after the `λ_can − π^*σ` step is reversed. Witness on `T*ℝ²` (a one-dimensional base has
`dσ = 0` and separates nothing): `σ = q₁ dq₂`, `π^*dσ = dq₁ ∧ dq₂`, `Ψ'_σ(q, p) = (q₁, q₂, p₁, p₂ −
q₁)`; `Ψ'^*_σ λ_can = p₁ dq₁ + (p₂ − q₁) dq₂ = λ_can − π^*σ`, and `−d` of it is `dq₁ ∧ dp₁ + dq₂ ∧ dp₂
+ dq₁ ∧ dq₂ = ω_can + π^*dσ`, as the base states; the README's `ω_can − π^*dσ` would need
`ω_can = +dλ_can`.

**Repair.** Rewrite the Check with the base's convention: "`Ψ'^*_σ λ_can = λ_can − π^*σ`, so, with
`ω_can = −dλ_can`, `Ψ'^*_σ ω_can = ω_can + π^*dσ`: `Ψ'_σ` is the symplectomorphism from
`(T*Q, ω_can + π^*dσ)` (the source's magnetic form carried by `ν`) to `(T*Q, ω_can)`; the form
`ω_can − π^*dσ` is reached by the translation by `−σ`; a translation by `+σ` applied to `ω_can −
π^*dσ` lands on `ω_can − 2π^*dσ`, not on `ω_can`. Since `π ∘ Ψ'_σ = π`, the map `H_n(U) → H_n(Q)` is
unchanged either way." Tested on `T*ℝ²`, `σ = q₁ dq₂`: `Ψ'_{−σ}^* ω_can = −d(p₁ dq₁ + (p₂ + q₁) dq₂)
= ω_can − dq₁ ∧ dq₂ = ω_can − π^*dσ`, as the repaired sentence says.

## R03 (P3) — "unit-round" names both normalizations in the 1.3 curvature Check

**Location.** README lines 388–392 (1.3, third Check): "the unit-round normalization with curvature
in `[1/4, 1]` (diameter `π`) would give period `2π` and area `4π`", against lines 357 and 370, where
"the supplied unit-round Hopf metrics" and "the unit-round Hopf normalization" are the adopted
scale with curvature `[1, 4]`, `CP¹` of radius `1/2`.

**Claim.** The Check names the plausible wrong normalization so that a reader can tell it from the
adopted one.

**Witness.** The adopted metric is the Hopf quotient of the unit sphere `S^(2d+1)` (RiemannianGeometry
R1, `TauCetiRoadmap/RiemannianGeometry/README.md` lines 281–293), with `CP¹` of radius `1/2`,
curvature `4`, period `π`, area `π`; the alternative in the Check is the scale in which `CP¹` is the
unit sphere (curvature `[1/4, 1]`, period `2π`, area `4π`, energies `× 4`). Both are called
"unit-round", so the Check as written says the adopted normalization would give period `2π`.

**Repair.** In the Check replace "the unit-round normalization with curvature in `[1/4, 1]`" by
"the radius-`1` normalization, in which `CP¹` is the unit sphere and the curvature lies in
`[1/4, 1]`". The numbers (period `2π`, area `4π`, energies multiplied by `4`) are correct for that
scale and stay.

## R04 (P3) — GeneralizedCohomology has no section G2.10

**Location.** README line 213 ("G2.10: the mapping-path replacement and raw lifting maps (consumed
by 1.1)"), line 297 (1.1 *Needs:* "GeneralizedCohomology G2.10"), lines 1.1 prose and the Layer 1
Dependencies (line 456).

**Claim.** G2.10 is a section or target of GeneralizedCohomology.

**Witness.** `TauCetiRoadmap/GeneralizedCohomology/README.md` on main: the G2 section (lines
211–405) has numbered items 1–7 and no heading, item or bold label "G2.10"; the string occurs only
inside item 7 ("First complete G2.10 (raw part after G2.1 …)", line 405) and inside G4 ("G2.10's
mapping-path carriers", line 918), as a label GeneralizedCohomology itself never defines. The base
roadmap on main cites G2.1 for this material (DGFloer line 147).

**Repair.** Cite the object by the section that holds it: "GeneralizedCohomology G2 item 7 (the
mapping-path carriers and raw lifting maps it refers to as G2.10)" in the supplier contract, the
1.1 *Needs:* line and the Layer 1 Dependencies, or cite G2.1 as the base does if the raw lifting
maps are the compact-generation interface. The dependency check is unaffected (it reads the
roadmap name).

## R05 (P3) — "finite-rank" is undefined vocabulary for a finite group

**Location.** README line 50 ("the finite-rank odd-sphere group"), lines 849–850 ("**Finite-rank
odd-sphere group (Lemma 6.35).** … from the unstable finite-rank data below … construct the
finite-rank splitting"); `Suggested.lean` lines 10 and 62 ("the finite-rank odd-sphere group",
"The finite-rank splitting").

**Claim.** Lemma 6.35 is "the finite-rank odd-sphere group".

**Witness.** The lemma says `π_(n−1)(SO(n))` is torsion for odd `n ≥ 3` (`bdho-cotangent` line
5073); the group is finite, of order at most `4` (it sits in `π_n(V_(n+2,2)) = ℤ/2 → π_(n−1)(SO(n))
→ π_(n−1)(O) ∈ {0, ℤ/2}`), so its rank is `0`, and "finite-rank data" and "finite-rank splitting"
are neither the literature's names nor defined in the roadmap. The phrase is inherited from the
base's Layer 11 wording on main (line 1615), which the base's revision drops.

**Repair.** Write "the torsion group `π_(n−1)(SO(n))` of Lemma 6.35" for the target, "the
low-rank values and the stable-plus-Stiefel splitting" for its two parts, and the same in both
docstrings of `Suggested.lean`.

## Verified sound

**Gate and build.** The worker's gate at 9c233de: every scanner zero, `depcheck=0`, `build=0`.
Rerun of the dependency check:

    depcheck: 240 roadmaps, 2296 edges, 0 problem(s)

`lake env lean` of `TauCetiRoadmap/DGFloerPartII/Suggested.lean` emits exactly eight `declaration
uses sorry` warnings (lines 37, 40, 43, 47, 51, 55, 59, 66) and nothing else, in 5.6 s. No file
outside the folder is changed (`git diff --stat origin/main...HEAD` excluding the folder is empty).
No `lemma`, no `set_option`, no `TauCeti.*` import, module header `module` / `public import Mathlib`
/ `@[expose] public section`. The README has no process words, pull-request numbers or absolute
paths.

**Signatures.** The nine elaborated types in the worker's signature file were compared with
README 4.3: `SO n` is `Matrix.specialOrthogonalGroup (Fin n) ℝ`; the seven low-rank statements
carry the groups the README lists (`0`, `ℤ/2`, `0`, `(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2` as `Subsingleton`
or `Nonempty (… ≃* Multiplicative (ZMod 2 …))`); `isOfFinOrder_pi_SO : ∀ k, Odd (k + 3) → ∀ x :
π_ (k + 2) (SO (k + 3)) 1, IsOfFinOrder x` is the README's "for every odd `n ≥ 3`, `π_(n−1)(SO(n))`
is torsion" with `n = k + 3`. The file has no section variables, so no binder can drop. Generality
of README and Lean agree.

**Padding probe.** A scratch copy stated each of the eight theorems as an `example` closed by
`first | infer_instance | simp | rfl`; all eight fail (the probe falls through to `rfl` on every
one), so none is padding. The eight statements are the statable part of Lemma 6.35, a named lemma
of the roadmap; Theorems B, G, H, I, Propositions 6.29–6.39 and the degree of 1.4 are named in the
module docstring as not statable (DG Morse/Floer carriers, `Diff(M)` with the `C^∞` topology,
mapping spaces out of spheres, a mapping degree), and the pins confirm the absences: no mapping
degree in Mathlib (grep for `mapDegree`/`Brouwer` finds only unrelated order-theory files), and
GeometricTopology Layer 3 (line 357) still plans `Diff(M)` as a topological group.

**Library declarations at the pins** (elaborated with `#check` in the probe file):
`HomotopyGroup.Pi` with the notation `π_ n X x` and its `Group` instance on `π_(n+1)`
(`Mathlib/Topology/Homotopy/HomotopyGroup.lean`; `example : Group (π_ 2 (SO 3) 1)` elaborates);
`Matrix.specialOrthogonalGroup : (n) [DecidableEq n] [Fintype n] (R) [CommRing R] → Submonoid
(Matrix n n R)` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`), whose coercion to a type carries the
subtype topology of the matrix space (`example : TopologicalSpace (SO 3)` elaborates);
`IsOfFinOrder : {G} [Monoid G] → G → Prop`; `SmoothPartitionOfUnity` and
`exists_contMDiffMap_zero_one_of_isClosed`, the latter on `[FiniteDimensional ℝ E] [IsManifold I ⊤ M]
[T2Space M] [SigmaCompactSpace M]` exactly as the supplier contract says
(`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`); `ContinuousMap.compactOpen`
(`Mathlib/Topology/CompactOpen.lean`). Tau Ceti: `TauCeti.IsAspherical (X) [TopologicalSpace X]
(x : X) : Prop` at `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`;
`HomotopyGroup.pathLoopSpaceMulEquiv` at `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:361`;
`LocalCoefficientSystem (R) [Ring R] (X : TopCat)` at `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43`.
Tau Ceti's `SpecialOrthogonal` files are the algebraic group scheme, not the topological `SO(n)`,
so no pinned declaration owns any statement of the file.

**Cross-roadmap citations resolved** (every one, on main at 3b51055/a0ad405e or at the named head):

- DGFloer on main: Layer 0 (line 413); Layer 1 items 1–6 (lines 453, 461, 612, 650, 817, 823),
  Layer 2 with `Map_*(S², Q)`, the constant-sphere section and `G × Map_*(S², G) ≅ Map(S², G)`
  (lines 901, 913, 914); Layer 3 item 4 (line 953); Layer 4 item 5 (line 995); Layer 5 items 1–6
  (lines 1009–1033); Layer 6 items 3–5 (lines 1076, 1088, 1098); Layer 10 items 2–5 (lines
  1544–1558); Layer 11's finite cover and torus criterion (inside item 3, line 1614); the
  mapping-space example `π₀ Map_*(S², S²) ≅ ℤ` (line 1673). At the revision head fc27fe2b the
  same items exist and Layer 11 is 11.1–11.3 (lines 3050–3091).
- TangentialBordism at b345f48b: B5.1–B5.7 (lines 960–1379), B6.3 "Homology realization and its
  sharp range" with the rational `SO` surjection and geometric preimages (line 2276). It consumes
  DGFloer Layer 1 (line 143), not this roadmap: no cycle.
- HomotopySpheres at 52ebd6f8: 3A.1 (line 663), 3A.2 (678), 3B.3 James map with the Bott–Samelson
  tensor algebra (859), 4A.1 (1204), 4B.2–4B.5 (1351–1379), 4B.8 stable `O`/`SO` table (1435),
  5.0 (1529), 5.1.3 (1671). It consumes DGFloer Layer 1 (lines 147, 414), not this roadmap.
- GeneralizedCohomology: G4 (line 936) with item 0 holding G4.0a/G4.0b (939–1082), items 3–5
  (Thom isomorphism, Euler, R/C/H orientations, lines 1224–1246), G5 (1373). G2.10: see R04.
- ComplexKahlerGeometry K7.1 (line 1407), K7.2 (1444), anchor `#k7-projective-torus-and-hopf-examples`
  (heading at 1405). LieGroups Layer 2 "the closed-subgroup (Cartan) theorem" (line 275).
  SmoothBundlesConnections B1.4 (421, anchor matches), B2.2 (605), B2.5 (802), B6.2 (1668), B6.3
  (1716). RiemannianGeometry R1 (179, Hopf quotient metrics at 281–293), R2 (300), R3 (347) with
  R3.3c "The n=2 Hopf comparison" for `ΩS²` (538). MorseTheory M5 (857). GeometricTopology Layer 1
  tubular neighbourhoods and collars (lines 206–219), Layer 3 `Diff(M)` with the `C^∞` topology and
  `O(n+1) → Diff(Sⁿ)` (357–388). AlgebraicTopology Stage 2 (326), Stage 4 item 4 with
  `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison` (536–565),
  Stage 6 (946), Stage 8 (1602). DifferentialGeometry Layer 10 "the Brouwer mapping degree" (877).
- Merge order: DGFloerPartII is listed (line 67) directly after HomotopySpheres (66), after
  StringOrientation (7), SmoothBundlesConnections (8) and TangentialBordism (10); every supplier is
  earlier or on main.

**Seeded source sample**, against `bdho-cotangent` (arXiv v3, printed page = marker − 6):

| Target | Source locator | Checked |
| --- | --- | --- |
| 1.1 Convenient carriers | HS 3A.1 (compact generation adjunction), DGFloer Layer 2 | HS 3A.1 is the `CompactlyGenerated` interface; the "one factor locally compact Hausdorff" hypothesis is the standard k-product criterion; Dowker's example is a correct witness |
| 1.2 Sphere model and James ring | Prop 6.18, line 4685, printed p. 107; `hatcher-at` §4.J lines 20245–20338 (James reduced product, tensor algebra), Example 3.C.7 line 12571–12579 | polynomial ring on one generator of degree `n − 1`, "not graded commutative" as the source says |
| 1.3 Homogeneous examples | Prop 6.38 proof line 5221–5227 (homogeneous metric, complex line as totally geodesic `S²`), Prop 6.39 line 5252–5256 (`HPⁿ`, quaternionic line isometric to a round `S⁴`); `hatcher-at` Stiefel manifolds line 13188 | carriers and metrics as stated |
| 1.4 Degrees of explicit maps | second proof of Prop 6.34, lines 5122–5135, printed p. 117 | `f(u, θ)` the rotation in the oriented plane `⟨p, u⟩`, two regular preimages `(u, θ)`, `(−u, 2π − θ)`, degree `1 + (−1)^(n−1)`, involution of degree `1` for odd `n` and `−1` for even |
| 2.1 Critical manifolds | Prop 6.38 proof line 5239 ("first nontrivial critical manifold `T¹_pCPⁿ`, dimension `2n − 1`, index `1`"), Prop 6.39 proof lines 5296–5304 (`C₁` contributes `H_*(T¹_pHPⁿ)` shifted by `3`) | indices `1` and `3` for `k = 1` agree with `a₁`; Ziller Thm 3 not readable (below) |
| 2.2 `ΩCPᵈ` | Prop 6.38 proof lines 5234–5236 (energy perfect by Ziller; class is `±2` times the generator) | the roadmap replaces the lacunarity by the rank count, correctly (see table) |
| 2.3 `ΩHPᵈ` | Prop 6.39 proof lines 5296–5310 | `H_(4n+2)(Ω_pHPⁿ) ≅ ℤ` from `H_(4n−1)(T¹_pHPⁿ)`, class twice a generator |
| 2.6 Sphere family | Prop 6.38 lines 5223–5233, Prop 6.39 lines 5257–5310 (partial Stiefel manifold, fibrewise degree `±2`) | matches the README's `Σ_p`, `σ_p` and `±2g` |
| 3.1 Rational realization | proof of Thm 5.14 lines 4273–4277 (Thom: `N·α = φ_*[S]`) | as stated |
| 3.3 Theorem B (= 5.14) | Thm 5.14 lines 4267–4272, printed p. 98; Thm B line 243–246; proof via Thm 5.10 (4140–4150) and Prop 5.13 (4229) | hypotheses identical: `π₂(Q) ≠ 0` or some `π_ℓ(Q)`, `ℓ ≥ 3`, with a non-torsion element; relatively compact `U` with `H_n(U; ℤ) → H_n(Q; ℤ)` nonzero; conclusion contractible almost existence |
| 3.4 Corollaries D, E | Cor D lines 265–292 (magnetic form `ω_Q + π^*dσ`, `Ψ(p, q) = (p + σ(q), q)`), Cor E line 304 | transport unchanged; the sign Check is R02 |
| 4.1 Abundance, Theorem H | Def 1.7 lines 415–423, Def 6.11 lines 4517–4523, Thm 6.12 lines 4525–4545 (`α′ = α − σ_* ev_* α` when `deg α = n`), Prop 6.13 lines 4608–4616 | definition and route identical |
| 4.3 Covering by diffeomorphisms | Defs 6.26 (4919), 6.32 (5051), Props 6.29 (4935), 6.33 (5059), 6.31 (5037), 6.34 (5063), Lemma 6.35 (5073–5094, printed p. 116) | hypotheses identical; the source prints `π₈(SO(9)) = ℤ₄` (line 5076) and the splitting "for `n ≥ 16`" with the summary "for `n ≥ 17` odd" (5078, 5093); CSS lines 221–223 give the split stabilization with kernel `ℤ/2`, CSS line 249 `π₈SO₈ = (ℤ/2)³` |
| 4.4 Homogeneous spaces | Prop 6.36 lines 5156–5200 (`H` closed of positive dimension, line 5142; `j_![G] = [H]` by Remark 2.10), Ex 6.37 lines 5201–5210 | as stated, including the `SO(2)` action class and the Pontryagin square |
| 4.6 Theorem G (= 7.1) | hypotheses lines 5354–5360, Thm 7.1 lines 5366–5372 (printed p. 123–124), Prop 7.5 (5404), Lemma 7.6 (5467), Lemma 7.7 (5503, `d ≥ 2`, `Y` `(d+1)`-connected), kernel bound line 5415, Ex 7.4 (5382) | hypotheses identical, including `ℓ = 2k − 2` / `k − 1` and the closed orientable `(n−k)`-manifold `S` |

**Adversarial table** (values computed on each side; the headline statements and every target a
finding touches are included).

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4 degree of `ev_p ∘ f` | `n = 1`, `p = e₀` | `f(e₁, θ)e₀ = cos θ e₀ + sin θ e₁` (degree `+1`), `f(−e₁, θ)e₀` winds the other way (degree `−1`); `S⁰ = ∂[−1, 1]` signs `+1` at `e₁`, `−1` at `−e₁`; total `1·1 + (−1)(−1) = 2 = 1 + (−1)⁰` | agrees | none |
| 1.4 involution degree | general `n` | antipode of `S^(n−1)`: `(−1)^n`; `θ ↦ −θ` on `S¹`: `−1`; product `(−1)^(n+1) = (−1)^(n−1)`; source: `1` for odd, `−1` for even | agrees | none |
| 1.4 `H₂(SO(3); ℤ) = 0`, `H₃(SO(4); ℤ) = ℤ²` | `SO(3) = ℝP³`, `SO(4) ≅ S³ × ℝP³` | `H_*(ℝP³) = ℤ, ℤ/2, 0, ℤ`; Künneth in degree 3: `ℤ ⊗ ℤ ⊕ ℤ ⊗ ℤ ⊕ Tor = ℤ²` | agrees | none |
| 1.4 matrix `R(p, u; θ)` | `p = e₀`, `u = e₁`, `θ = π/2` | `R e₀ = e₁`, `R e₁ = −e₀`, `R e_j = e_j` for `j ≥ 2`; `det = 1`, orthogonal; `θ = 0` gives `I`; period `2π` | agrees | none |
| 1.3 dimensions | `n = 3, 2`; `d = 1` | `dim V_(3,2) = 3 = dim SO(3)`; `V_(2,2) = O(2)` two components vs `SO(2)` one; `dim U(n)/U(n−2) = n² − (n−2)² = 4n − 4` | agrees | none |
| 1.3 curvature and periods | `CP¹` radius `1/2` | length of great circle `2π·(1/2) = π`, curvature `1/r² = 4`, area `4πr² = π`, so `ω_g = π ω_FS` with `∫ ω_FS = 1`; radius `1`: period `2π`, area `4π`, energies `× 4` | agrees, but both scales called "unit-round" | R03 |
| 1.3 quaternionic fields | `S³ ⊂ ℍ` | `⟨z, Iz⟩ = 0` (I skew), `⟨Iz, Jz⟩ = ⟨z, −IJz⟩ = ⟨z, −Kz⟩ = 0`; Radon–Hurwitz: `S^(4k+1)` has exactly one field (`4k+2 = 2·odd`, `ρ = 2`) | agrees | none |
| 1.2 ring `H_*(ΩSⁿ)` | `n = 2, 3` | `ΩS² ≃ S¹ × ΩS³`: `ℤ` in every degree, `x² ≠ 0` with `|x| = 1`; graded commutativity would give `x² = −x²`, `2x² = 0`, `x² = 0` in `ℤ`; `n = 3`: `ℤ` in even degrees | agrees | none |
| 2.1 indices (Ziller) | `CPᵈ`, `HPᵈ`, `k`-fold circle | curvature-`4` directions (`1`, resp. `3`) vanish at `mπ/2`, `0 < m < 2k`: `2k − 1` points; curvature-`1` directions (`2d − 2`, resp. `4d − 4`) at `mπ`, `0 < m < k`: `k − 1` points; index `2k − 1 + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3` | agrees | none |
| 2.2 cell degrees vs `S¹ × ΩS^(2d+1)` | `d = 1, 2` | `b_k = a_k + 2d − 1 = 2dk`; `d = 2`: cells `0, 1, 4, 5, 8, 9`; `S¹ × ΩS⁵`: `ℤ` in `4k, 4k + 1`; `a₂ − b₁ = 5 − 4 = 1` so no lacunarity | agrees | none |
| 2.2 Hopf product `π₂` | `ΩS⁵` vs `ΩS³` | `π₂(ΩS⁵) = π₃(S⁵) = 0 = π₃(CP²)`; `π₂(ΩS³) = π₃(S³) = ℤ` | the Check's wrong model is excluded | none |
| 2.3 cell degrees vs `S³ × ΩS^(4d+3)` | `d = 1, 2` | `b_k = a_k + 4d − 1 = 2k(2d+1)`; `d = 2`: `a₁ = 3`, `b₁ = 10`, `a₂ = 13`, `b₂ = 20`, gap `3`; `d = 1`: `6k − 3`, `6k`, so `ℤ` in degrees `3k` | agrees | none |
| 2.4 `CP¹` total-space sequence | `E² = H_*(S²) ⊗ H_*(ΩS²)` | only columns `0, 2`, each `ℤ` in every row; contractible total space forces `d²: E_(2,q) → E_(0,q+1)` iso for all `q` | agrees | none |
| 2.5 total degrees | `d = 2` | `E_(2,4)`: total `6 → 5`; `E_(4,1)`: `5 → 4`; `H₃(ΩCP²) = 0` so no `d₂` from `E_(2,3)` | agrees | none |
| 2.6 dimensions | `CPᵈ`, `HPᵈ` | `dim T¹_pCPᵈ = 2d − 1`, `β_*` lands in degree `2d = b₁`; `HPᵈ`: `(4d − 1) + 2 = 4d + 1`, lands in `4d + 2 = b₁` | agrees | none |
| 3.1 torsion class | `α` of order `N` | `Nα = 0 = f_*[∅]`: the statement holds with `S = ∅`; Theorem B's `π_(U*)α = b[Q]`, `b ≠ 0`, has infinite order, so `S ≠ ∅` there | agrees | none |
| 3.1 clearing denominators | general | `Σ (a_i/b_i)[f_i] ↦ α ⊗ 1`; `D = lcm(b_i)`; `Σ c_i f_(i*)[S_i] − Dα` torsion of order `m`; `N = mD`, negative `c_i` by reversing orientation | route is sound | none |
| 3.3 hypotheses | `T^r`, `ℝP³`, `S²` | `π_ℓ(T^r) = 0` for `ℓ ≥ 2` (excluded; `c°_HZ = ∞`); `π₃(ℝP³) = ℤ`; `π₂(S²) = ℤ` | agrees | none |
| 3.4 magnetic sign | `T*ℝ²`, `σ = q₁ dq₂`, `ω_can = −dλ_can` | `Ψ'^*_σ λ = p₁ dq₁ + (p₂ − q₁) dq₂`; `−d` of it `= ω_can + dq₁ ∧ dq₂ = ω_can + π^*dσ` (base line 1693); README says `ω_can − π^*dσ`, which is the value for `ω_can = +dλ_can` | contradiction | R02 |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim M + dim N`, shriek `j_!α × 1 ≠ 0`; constant spheres `σ_*[Q]` have zero reduced shriek | agrees | none |
| 4.2 degrees | `Sⁿ` even, `S^(4k−1)`, `S²` | `n + (2n − 3) = 3n − 3`; `n + (n − 2) = 2n − 2`; `Σ_p = O(2)`, `α ∈ H₃` | agrees | none |
| 4.2 Serre comparison | `B` `2n`-connected | `π_i(Ω²B) = π_(i+2)(B) = 0` for `i ≤ 2n − 2`; differentials into `E_(0,q)`, `q ≤ 2n − 3`, start at `E_(r, q−r+1)`, `2 ≤ r ≤ 2n − 2`, all zero; `(2n−1)`-connected allows `r = 2n − 1` at `q = 2n − 3` | agrees | none |
| 4.3 `π₂(SO(3))` | double cover `S³ → SO(3)` | `π₂(S³) = 0` | agrees | none |
| 4.3 `π₈(SO(9)) = (ℤ/2)²` | `SO(8) → SO(9) → S⁸` | `∂: π₈(S⁸) → π₇(SO(8)) = ℤ²` injective (tangent bundle of `S⁸`, Euler number `2`), so `(ℤ/2)³ = π₈(SO(8)) ↠ π₈(SO(9))`: exponent `2`; CSS: order `4`; hence `(ℤ/2)²`, not `ℤ/4` | agrees with README, refutes the source's `ℤ₄` | source issue |
| 4.3 Stiefel term | odd `n` | `π_(n+1)(S^(n+1)) → π_n(Sⁿ) → π_n(V_(n+2,2)) → π_n(S^(n+1)) = 0`, connecting map `χ(S^(n+1)) = 2`: `ℤ/2` | agrees (for every odd `n ≥ 1`) | none |
| 4.3 splitting below range | `n = 7, 3` | formula gives `π₆(O) ⊕ ℤ/2 = ℤ/2`, `π₂(O) ⊕ ℤ/2 = ℤ/2`; actual `0`, `0` (`S⁷`, `S³` parallelizable, so the clutching class `τ_n = 0`) | the Check's negative controls are right | none |
| 4.3 stable term | odd `n ≥ 17` | `π_(n−1)(O) = ℤ/2` iff `n − 1 ≡ 0, 1 (mod 8)`, `n − 1` even, so `n ≡ 1 (mod 8)`: `17, 25, …` give `(ℤ/2)²`, other odd `n ≥ 19` give `ℤ/2`; `n = 9` fits | agrees | none |
| 4.3 Lean torsion statement | `k = 0`, `k = 1` | `k = 0`: `Odd 3`, `π_2(SO 3)`; `k = 1`: `Odd 4` false, hypothesis excludes `π_3(SO(4)) = ℤ²` (not torsion) | hypothesis is necessary and sufficient | none |
| 4.4 `S² = SO(3)/SO(2)` | `α ∈ H₀(Ω²S²)` | `j_!: H₃(SO(3)) → H₁(SO(2))`, `[SO(3)] ↦ [SO(2)]`; `α′ ∈ H₁`, degree `1 = dim H + deg α`; `β_*α′ = x² ≠ 0` by 1.2 | agrees | none |
| 4.4 nonorientable | `SO(3)/O(2) = ℝP²` | reflection component: isotropy sign `χ = −1`, coorientation sign `−1`, product `+1` | consistent with the twisted shriek claim | none |
| 4.6 dimension bounds | `k` even, odd; `Y` a point | `n − k ≥ 2k − 1` and `n − k ≥ k` as the source states (lines 5361–5364); for `Y` a point (`k = n`) the bound fails but the source's reasoning assumes `dim Y > 0` | agrees; source gap recorded | none |
| 4.6 Example 7.4 with `Q′ = Tⁿ`, `k ≥ 3` | — | `π₂(Q) = π₂(Tⁿ # (S^k × Y)) = 0` for `k ≥ 3` and `Y` `(2k−2)`-connected; `Q` rationally essential (contains `Tⁿ` summand) | agrees with the source's line 5389–5396 | none |
| 1.1 `k`-products | Dowker's CW pair | product topology ≠ CW (= `k`) topology, so the product is not compactly generated | the Check's witness is right | none |
| 1.5 collapses | `N = ∅`; a framed point | constant map, degree `0`; degree `±1` with sign from the framing | agrees | none |

**Vacuity, context and generality.** Every target quantifies over the roadmap's objects
(`Map(S², Q)`, `Diff(M)`, `Ω_pB`, `SO(n)`); no statement is over free data. The Lean file has no
section variables. The README's "for every odd `n ≥ 3`" equals the Lean `Odd (k + 3)`. The
2.2 route avoids a false lacunarity claim (`a_(k+1) − b_k = 1`) by the rank count, which is the
correct argument. The 4.4 twisted-coefficient extension of Proposition 6.36 to nonorientable `G/H`
is scoped with `ev^*or_M` and `dim H > 0`, as the source requires.

**Ownership against open pull requests.** Checked with the cross-PR grep (456 open pull requests
at the index of 2026-11-05) for the objects, not the names: abundance, covering by
diffeomorphisms, `π_(n−1)(SO(n))` and `π₈(SO(9))`, `ΩCP`, `V_(n,2)`, the rotation family. Only
DGFloer on main (and its superseded revision #963) states them; the revision #1798 only names
DGFloerPartII as their owner. No other open pull request builds them.

## Not verifiable

- W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977),
  Theorems 3 and 8 (cited in 2.1 and the Layer 2 Dependencies): not in the sources cache
  (Springer, paywalled; this review records no manifest and fetched nothing). The index formulas
  the README attributes to Theorem 3 were recomputed from conjugate points in the table above and
  agree with the source paper's `k = 1` values.
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959), §§1–3: not in the
  cache (JSTOR); cited only as background for Layer 2.
- Milnor–Stasheff, *Characteristic Classes*, Chapter 5, and Steenrod, *The Topology of Fibre
  Bundles*, Part I §7 (Stiefel manifolds): not in the cache; the chapter and section titles match
  the use (Grassmann/Stiefel manifolds), the text was not re-read.
- The "[Jap87, Appendix A, Tables 6.VII, 6.VIII]" the source cites for Lemma 6.35 (the
  Encyclopedic Dictionary of Mathematics tables): not in the cache; the values were checked by the
  exact sequences in the table above and by CSS.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 116: the source says
  `π₈(SO(9)) = ℤ₄`; it should be `ℤ/2 ⊕ ℤ/2` (a quotient of `π₈(SO(8)) = (ℤ/2)³`, of order 4 by
  Crowley–Schick–Steimle's split stabilization); affects nothing (the lemma needs only torsion).
- **Gap** in bdho-cotangent at §7 preamble, printed page 123: the source says `ℓ`-connectivity of
  `Y` forces `n − k ≥ 2k − 1` (even `k`) or `n − k ≥ k` (odd `k`); it should add `dim Y > 0`,
  since a point is `ℓ`-connected for every `ℓ` and the bound fails for `k = n`; affects nothing.
