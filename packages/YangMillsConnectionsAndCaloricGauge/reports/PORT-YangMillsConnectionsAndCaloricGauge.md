# PORT-YangMillsConnectionsAndCaloricGauge

Branch: `roadmap/yang-mills-connections-and-caloric-gauge`.
Head commit: `a69a7e72e1d7a386a24337ccd2a73976bdfda8a1`.
Base: `697bab2`; the initial worktree status was empty. The commit adds only
`TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/{README.md,Suggested.lean,metadata.toml}`.

## Draft pull request body

Builds the analytic theory of Yang–Mills connections on Euclidean space at the critical
regularity, for an arbitrary compact matrix structure group, up to the caloric gauge of Oh and
Tataru. Starting from Mathlib's unitary groups and Tau Ceti's weak derivatives and homogeneous
Sobolev space, it develops critical Sobolev maps into the group and their homotopy classes on
annuli; rough connections on open subsets of `ℝ^d`, `d ≥ 3`, with their gauge action and
patching; Uhlenbeck's Coulomb gauge on balls and punctured balls for every compact group; the
good global gauge and the topological class of a connection with `L^{d/2}` curvature;
characteristic numbers and the `SU(2)` instanton number; harmonic Yang–Mills connections on
`ℝ⁴` with regularity, decay, the sharp energy gap and the ground-state energy; the covariant
elliptic and parabolic linear theory in homogeneous Sobolev and Besov spaces on `ℝ⁴`; the
Yang–Mills heat flow in the local caloric gauge with the Dichotomy and Threshold Theorems; and
the caloric manifold as a `C¹` split submanifold of the Banach space `ℋ`, with its tangent spaces
and the nonlinear div–curl decomposition. These are the inputs a roadmap for the hyperbolic
Yang–Mills equation needs (finite-energy and caloric initial data, the threshold below twice the
ground-state energy), and none of them is built in Mathlib, Tau Ceti or another roadmap; the
closed-manifold `SU(2)` theory stays with FourManifolds and InstantonFloerTheory, and the closed
Riemannian Yang–Mills energy with SmoothBundlesConnections, Part II.

## Validation

- Build: `lake build TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge.Suggested` ends with
  `Build completed successfully (18239 jobs).` (module line
  `✔ [18238/18239] Built TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge.Suggested (5.4s)`).
  Warnings: **0** (the file declares nothing, so there is no `sorry` warning either).
- Gate summary line:
  `gate YangMillsConnectionsAndCaloricGauge: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), exact output:

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found
  nowhere.

## Roadmaps this one depends on that are still pull requests

None. Every supplier is on main: PDE, SmoothBundlesConnections, CharacteristicClasses,
RiemannianGeometry, DifferentialGeometry, AlgebraicTopology, LieGroups
(`TauCetiRoadmap/RepresentationTheory/LieGroups`) and Yamabe. FourManifolds and
InstantonFloerTheory (open pull requests, later in the merge order) are named only in Scope and
ownership and in two Checks, as the owners of the closed-manifold `SU(2)` theory; neither supplies
anything here, and the depcheck does not count them as suppliers. The open revision
SmoothBundlesConnections keeps B3.1,
B4.1 and B4.2; the roadmap cites them as on main. No id this README cites is dropped by an open
pull request (`scratch/overlaps.md`), and the roadmap is new, so it drops no id others cite.

## What moved from the Lean to the README

Nothing. The accepted `Suggested.lean` states no declaration, and the accepted review decided that
no headline is statable at the pins with only a few simple definitions. I re-examined that
decision headline by headline (gauge invariance of finite energy, Uhlenbeck's lemma, the good
global gauge, the topological class, characteristic numbers, the Bogomol'nyi bound, the instanton
number, the energy gap and ground state, the covariant linear theory, the heat flow theorems, the
caloric manifold) and keep it: every one of them is stated on rough connections whose
coefficients lie in the vector-valued local Sobolev classes `W^{k,p}_loc(X; V)` and gauges in the
`G`-valued critical class built on them (requested of PDE as `vector-valued-wkp`), or on the
realised homogeneous spaces `Ḣ^σ`, `ℓ¹L²`, `ℋ` of Layer 8, none of which exists at the pins.
The pins have the predicate `TauCeti.HasWeakFDerivOn` and the scalar `TauCeti.W1p`, `TauCeti.Wkp`
and `TauCeti.D1p0`; stating a headline through raw weak-derivative hypotheses would be the ad hoc
encoding the rules exclude, and a smooth-only version would be the restricted special case they
also exclude.

The only Lean change is the module docstring, made accurate: it now names, for each headline
group, the carrier actually missing (the vector-valued classes and the rough-connection and gauge
classes built on them, rather than "weak curvature", which is a formula once those classes
exist), and mentions `TauCeti.HasWeakFDerivOn`, `TauCeti.W1p`, `TauCeti.Wkp`, `TauCeti.D1p0`,
`ContinuousMap.Homotopic`, `HomotopyGroup` and `Manifold.IsSmoothEmbedding` for what the pins do
supply. Imports remain `import Mathlib` only (after `module`).

Mechanical binder audit: the declaration inventory is 0 definitions, 0 instances, 0 theorems,
0 structures, 0 opaque declarations, so the list of `#check @name` lines for the file's own
declarations is empty and nothing changed. Separately, to pin every library name the README
cites, I put `#check @name` for all 42 of them (26 Mathlib, 16 Tau Ceti, among them
`Orientation.formHodgeStar`, `TauCeti.D1p0.sobolevEmbeddingL`, `HomotopyGroup.bijective_hurewicz`,
`Manifold.IsImmersion.isDiffImmersionAt`, `ContDiffAt.toOpenPartialHomeomorph`) into a temporary
version of the module with the needed Tau Ceti imports and built it once with the brief's build
command: all 42 elaborated, no error; the temporary file was then reverted. The Tau Ceti names in
modules without prebuilt oleans (`TauCeti.Wkp.dense_contDiffOn_representatives`,
`TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le`,
`TauCeti.exists_norm_iteratedFDeriv_le_div_pow_of_smul_eq`, `TauCeti.W1p.morreyRepresentative`,
`TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt`, `TauCeti.Wkp`) were checked in the pinned
source instead: `Analysis/Sobolev/Wkp/MeyersSerrin.lean` line 291, `Analysis/Fourier/MihlinHormander.lean`
line 300, `Analysis/Calculus/IteratedFDeriv/Homogeneous.lean` line 40,
`Analysis/Sobolev/W1p/Morrey.lean` line 156, `Analysis/Sobolev/Morrey.lean` line 181,
`Analysis/Sobolev/Wkp/Basic.lean` line 145, all in `namespace TauCeti`.

## Supplier replacements and duplication removals

No target of the package duplicates a pinned declaration or another roadmap, so no target was
deleted. Supplier citations were made exact:

1. **Tau Ceti suppliers added** to Exact supplier contracts (with file, hypotheses and use):
   `TauCeti.Wkp.dense_contDiffOn_representatives` (Meyers–Serrin density on arbitrary open sets,
   the scalar content of PDE §1.2 used in §2.2, now in §2.2's *Needs*);
   `TauCeti.exists_eLpNorm_fourierMultiplierCLM_le_of_norm_iteratedFDeriv_le` with
   `TauCeti.exists_norm_iteratedFDeriv_le_div_pow_of_smul_eq` (Mihlin–Hörmander for `L²`
   multipliers and Mihlin's condition for degree-0 homogeneous symbols, which bound `R_iR_j` on
   `L² ∩ L^p`, exactly what §4.3's div–curl estimate uses on test functions; now in §4.3's
   *Needs*); `HomotopyGroup.bijective_hurewicz` (the Hurewicz theorem for spaces in `Type`, used in
   §6.4's Hopf-degree route together with AlgebraicTopology §8.3; now in §6.4's *Needs*).
2. **AlgebraicTopology citations** "Stage 6, item 5" and "Stage 8, item 3" replaced by the
   section numbers §6.5 and §8.3 everywhere (Scope, contracts, §5.6, §6.4, Layer 5 and 6
   Dependencies). AlgebraicTopology on main maps Stage 6 items 0–5 to §§6.0–6.5 and Stage 8 items
   1–16 to §§8.1–8.16, so the content is unchanged; the Scope line now says that AlgebraicTopology
   owns the sphere comparison and the Hurewicz theorem in every universe, the `Type` case being
   Tau Ceti's.
3. **DifferentialGeometry names** made exact: `extDeriv` "on manifolds" (Mathlib's `extDeriv` is
   on normed spaces) became `TauCeti.mextDeriv`; the bare `wedgeWith` and `mextDeriv` in the
   contract became `TauCeti.RoughForm.wedgeWith` and `TauCeti.mextDeriv` (both at the pin,
   `Geometry/Manifold/DifferentialForm/Wedge/Basic.lean` line 238 and `ExtDeriv.lean` line 145).
4. The LieGroups contract heading now names its folder:
   `From TauCetiRoadmap.RepresentationTheory.LieGroups` (depcheck still resolves it).

Duplication sweep by object (main and every open roadmap pull request, `roadmaps grep`, plus the
listed heads): Yang–Mills heat flow, caloric gauge, frequency envelopes, split submanifolds,
div–curl, instanton number and improved Kato inequality have no other owner. The neighbours, and
how the kept variants differ (recorded in Scope and ownership):

- FourManifolds §5.3 (open, later in the order) states Uhlenbeck's Coulomb gauge on the unit
  Euclidean 4-ball for `SU(2)`, the case `G = SU(2)`, `d = 4` of §4.1 here, and the BPST
  solution on `S⁴`; this roadmap, earlier in the order, owns the general Euclidean statements and
  the BPST potential on `ℝ⁴`. Already in the package's Scope; kept.
- InstantonFloerTheory IF1 (open, later), which SmoothBundlesConnections' scope names with
  FourManifolds for the energy comparisons and BPST: added a clause that it consumes
  FourManifolds' `SU(2)` core and nothing of it is planned here.
- HamiltonianReduction R5 (main: `H^s`, `s > 1`, gauge groups and Coulomb slices over a closed
  surface) and SeibergWittenTheory SW4 (main: the abelian Sobolev gauge group and global Coulomb
  gauge on a closed four-manifold): added a clause that the critical classes `G^{2,d/2}_loc`,
  `d ≥ 3`, on Euclidean domains are a different setting.
- LocalVariationalFieldTheory Layer 5 (main: jet-level Yang–Mills Euler–Lagrange and Noether
  identities): added to the SmoothBundlesConnections bullet; §7.1 states only the weak equation
  for rough potentials.
- Yamabe Y2 item 1 constructs `D^{1,2}(ℝⁿ)`; at the pin that carrier is `TauCeti.D1p0`, which §8.1
  consumes directly; §8.1 owns only the characterization of its image in `L⁴` and the coefficient
  specialisation, which Yamabe does not state.

Ownership against open pull requests was checked through `roadmaps grep` over all 438 open heads
and by reading the FourManifolds and InstantonFloerTheory heads given in the brief.

## Fixes made as an upstream reviewer

1. The trailing lines of the six supplier-gap blocks ("Used in §§4.1; required location: …") were
   process residue with a grammatical slip (`§§4.1`); each now says in prose which sections consume
   the gap and where in the supplier it belongs, in the form of the open-PR models.
2. The `inhomogeneous-besov-partition` gap's explanation was restated neutrally and checked: PDE
   §7.1 on main defines `P_0 = χ(D)`, `P_j = ψ(2^{−j}D)` for `j ≥ 1` with `ψ = χ(·/2) − χ`, whose
   sum telescopes to `χ(ξ) + 1 − χ(ξ/2)`, equal to `0 + 1 − 1 = 0` at `|ξ| = 2`; so PDE's claim
   `Σ_{j≥0} P_j = I` is false and the gap is a real one.
3. The `compact-su2-subalgebra` gap now says in which inner product root lengths are measured (the
   dual of the prescribed one on the Lie algebra of a maximal torus).
4. §1.5 (definition of `F^±`) and §4.3 (the restriction norm `ℓ¹W^{1,p}(B)`) stated their API in
   running prose; both now list it as bullets, with no change of content (§1.5 adds the defining
   property `⋆F^± = ±F^±`).
5. The Scope corrections of items 2–3 of the previous section, and long Scope lines reflowed.

## Adversarial mathematics pass

One row per statement; "✓" means both sides were computed and agree.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Gauge action sign `O·A = Ad(O)A − O;x` (Conventions) | `U(1)`, `A = i x₁dx₂`, `O = e^{iφ}`; `SU(2)`, `O = exp(x₁i)exp(x₂j)`, `A = 0` | `O·A = A − i dφ`, `F₁₂ = i` both; `dR = R∧R` so `F[R] = 2R∧R`, `F₁₂[R](0) = 2[i,j] = 4k`, `F[−R] = 0` | ✓ chosen sign flat on pure gauges | none |
| `F` normalisation, `⟨F∧F⟩` factor (Conventions) | `F₁₂ = F₃₄ = X` | all-index sum `8|X|²` vs `|F|² = 2|X|²`; ¼ of it `2|X|²` | ✓ ¼ needed | none |
| Hodge star orientation | `dx¹²` | `dx¹² ∧ dx³⁴ = vol`, so `⋆dx¹² = dx³⁴` | ✓ | none |
| `Φ : ℍ → M₂(ℂ)` algebra map onto `SU(2)` | `Φ(i)Φ(j)`, `Φ(j)Φ(k)`, `det Φ(x)` | `diag(i,−i)·[[0,1],[−1,0]] = [[0,i],[i,0]] = Φ(k)`; `Φ(j)Φ(k) = Φ(i)`; `det = |x|²`; columns orthogonal | ✓ | none |
| §1.1 `𝔰𝔲(2)` Check | `i,j,k` matrices | `|i|² = −tr(−1) = 2`; `ij = k`, `[i,j] = 2k`, `[j,k] = 2i` | ✓ | none |
| §1.1 `T² ⋊ ℤ/2` non-example | weights `1, 2` | `ad = 0` so invariant; permutation swaps `e₁, e₂`, `1 ≠ 2` | ✓ excluded | none |
| §1.2 polar retraction Check | `M_t = [[1,t],[0,1]]` | `P = U*M_t = (4+t²)^{−1/2}[[2,t],[t,t²+2]]`, `det P = 1`, distance² `4+t²−2√(4+t²)`; at `t=1`: `0.528 < 1` | ✓ Gram–Schmidt not nearest | none |
| §1.2 `U(1)` derivative | `dπ(1)(a+ib)` | `ib` | ✓ projection onto `iℝ` | none |
| §1.3 Leibniz correction | `SU(2)`, `X = i`, `g = exp(πk/4)`, `Y = j` | `Ad(g)i = j`; `[O;1, Ad(O)Y] = [j,−i] = 2k = Ad(g)2k`; source form `Ad(g)[j,j] = 0` | ✓ corrected rule right | none |
| §1.4 Cartan form integral | frame `(e₂,e₃,e₄)` at `e₁` | `dΦ ↦ (k,i,j)`; `tr θ³ = 3tr(kij) − 3tr(kji) = −6 − 6 = −12`; `∫ = −12·2π² = −24π²`; `ω_f` gives `−8π²` | ✓ | none |
| §1.4 C5a.3 normalisation | `k = 2`, `B_P = tr` | `∫₀¹t = ½`, `∫₀¹(t²−t)/2 = −1/12`; image `tr(A dA + ⅔A³)`; at `θ = −θ_R`: `⅓tr θ_R³`; with `1/k!`: `−4π²` | ✓ | none |
| §1.5 self-duality and pointwise Bogomol'nyi | `X(dx¹²+dx³⁴)`, `X dx¹²`, `X = 0` | `|F|² = 2|X|²`, `⋆⟨F∧F⟩ = 2|X|²` (equality); `|X|²` vs `0` (strict); all `0` | ✓ | API as bullets |
| §1.6 `γ₀` and cubic bound | `𝔰𝔲(2)`, `−tr`; BPST point `λ(i,j,k)`; `𝔤 = 0`; abelian | `|[k,i]|² = |2j|² = 8`, ratio `√2`; `|ω|² = 6λ²`, `⟨ω¹,[ω²,ω³]⟩ = 4λ³`, `24√2|λ|³ = (2√6/3)√2(6λ²)^{3/2}`; `0`; `0` | ✓ sharp | none |
| §1.6 factor maximum, orthogonality | `𝔰𝔲(2)⊕𝔰𝔲(2)`, `−tr ⊕ −4tr`; cross term `c` | `γ₀ = max(√2, √2/2) = √2` (sum `3√2/2`, rms `√5/2`); `⟨[(j,0),(k,0)],(0,i)⟩ = 4c ≠ 0 = −⟨(k,0),[(j,0),(0,i)]⟩` | ✓ | none |
| §2.1 critical class not in `C⁰` | `exp(log log(1/|x|)X)`, `d = 4` | `∫dr/(r log²)`, `∫dr/(r log⁴)` finite | ✓ | none |
| §2.1 vortex non-example | `d = 3`, `e^{iθ}` | `∫ρ^{−3}dx = ∫ρ^{−2}dρ = ∞` | ✓ | none |
| §2.4 top-order qualification | `O = exp(√L i)`, `B = √L j`, `L = log(1/r)` | `∫|∂O|⁴ ∝ ∫₁^∞L^{−2}dL = 1`; rotating part of `∂_r(Ad(O)B)` `∝ 1/r`, `∫dr/r = ∞`; constant `B`: `∝ 1/(r√L)`, finite | ✓ | none |
| §2.5 exterior class | `Φ(x/|x|)`, `d = 4` | `∫_{|x|>R}|x|^{−4} = 2π²∫dr/r = ∞` | ✓ excluded | none |
| §3.1 dilation | `A_λ = λA(λ·)` | `∫λ^d|F(λx)|^{d/2} = ∫|F|^{d/2}`; `d = 3`, `L²`: factor `λ^{1/2}` | ✓ | none |
| §3.3 Lebesgue margin | eight balls at `±(1−ε)e_j` in `ℝ⁴` | distance² `≤ max(a², 1−a+a²) < 1`; centres `≥ √2a`; `B_ℓ(0)` inside iff `ℓ ≤ ε` | ✓ margin needed | none |
| §3.4 BPST concentration | `‖F‖²_{L²(B_r)}` | `48π²[1/6 − (1+R)^{−2}/2 + (1+R)^{−3}/3] = 8π²r⁴(r²+3)/(r²+1)³`, small `r`: `24π²r⁴` | ✓ | none |
| §4.1 `U(1)` Neumann gauge | `Ã = A − i dφ` | `Δφ = −i∂A`, `∂_νφ = −i x·A`, compatibility by Gauss | ✓ | none |
| §4.1 linearisation | `O = e^ψ`, `A = 0` | `Ã ≈ −dψ`: `Δψ = 0`, `∂_νψ = 0` ⇒ constants | ✓ | none |
| §4.2 monopole | charge `n`, `d = 3` | `∫_{S_r}|F|^{3/2} ≥ |2πn|^{3/2}/(4πr²)^{1/2}`; `∫dr/r = ∞` | ✓ | none |
| §4.3 div–curl identity | symbols | `(2πi/|ξ|²)[ξ_iξ_jξ_kû_k + ξ_i|ξ|²û_j − ξ_iξ_jξ_kû_k] = 2πiξ_iû_j`; gradient case `−4π²ξ_iξ_jφ̂` | ✓ | Tau Ceti suppliers added |
| §4.3 `p = 1` failure, extra-data Check | Newtonian potential; `A_n = n^{−3/2}sin(nx₁)i dx²` | `‖∇u_ε‖₁ ≥ c_d|S^{d−1}|log(1/2ε)`; `‖A_n‖_{W^{1,2}} ≈ n^{−1/2}`, `‖∂²A_n‖_{4/3} ≈ n^{1/2}` | ✓ | none |
| PDE gap `inhomogeneous-besov-partition` | `|ξ| = 2` | PDE §7.1 sum `χ + 1 − χ(·/2) = 0`; consistent partition `1` | ✓ gap real | wording |
| PDE gaps Neumann, div–curl, Hardy | ball, `d ≥ 2`; `p = d/2` | compatibility `∫Δu = ∫∂_νu`; no Neumann harmonic 1-fields on a ball (`H¹ = 0`); Hardy constant `p/(d−p) = 1` at `p = d/2` | ✓ | wording |
| §5.1 BPST good representative | `O = Φ(x̄/|x|)` | `dO O⁻¹ = Im(dx̄ x)/|x|²` (real part `0`), so `Φ(Im(x̄dx))/|x|² = −O;x`; remainder `O(|x|^{−3})` | ✓ | none |
| §5.4 good representative needed | `A = −2x₁ i dx¹`, `b = j dx²/(1+|x|²)` | `F[A] = 0`; `F₁₂[A+b] = −2x₁j/(1+|x|²)² − 4x₁k/(1+|x|²)`, `k`-part `∫r dr = ∞`; `b ∈ Ḣ¹` | ✓ | none |
| §5.4 `G × G` quotient | `G = {±1}`; `O(4)` | two constant gauges, one class; `r∘L_u∘r = R_ū` swaps the `π₃(SO(4))` summands | ✓ | none |
| §6.1 cut-off factor | `η' = M` near `3e₂` | `∂₁(x₁/|x|)(3e₂) = 1/3`; `k`-part `−2Mβ/3·…`, linear in `M` | ✓ factor needed | none |
| §6.3 Bogomol'nyi integrated | `I₊ = I₋ = 1`; `F = 0`; BPST | `ℰ − |χ| = 2min = 2`; `0`; `ℰ = χ = 8π²` | ✓ | none |
| §6.4 instanton number sign | `Φ(x/|x|)`; BPST `Φ(x̄/|x|)` | degree `1` ⇒ `c₂ = −1`, `χ = −8π²`; conjugation degree `(−1)³ = −1` ⇒ `c₂ = 1`, `χ = ℰ = 8π²` | ✓ consistent with §1.4, §6.3 | none |
| §7.1 harmonic Checks | `(i/2)(x₁dx₂−x₂dx₁)`; `iψ(x₁)dx¹²` | `F₁₂ = i`; `∂^ℓF_ℓ2 = iψ' ≠ 0` | ✓ | none |
| §7.4 Weitzenböck sign, Kato chain | self-dual BPST; `u = 48^{1/4}/(1+r²)` | `Δ(1+r²)^{−1} = −8(1+r²)^{−3}` in `ℝ⁴`; `(√6/3)√2·√48 = 8`; centre `½Δ|F⁺|² = 48·(−32)/2 = −768`, pairing `(2√6/3)√2·48^{3/2} = 768`; from `|∇F|² ≥ 3/2|∇|F||²`: `Δ|F|^{1/2} ≥ −(√6/3)γ₀|F|^{3/2}` | ✓ minus sign | none |
| §7.5 energy gap constant | Yamabe `a₄ = 6`, `Y(S⁴) = 12(8π²/3)^{1/2} = 8√6π` | `8√6π‖F⁺‖ ≤ 2√6γ₀‖F⁺‖²` ⇒ `‖F⁺‖ ≥ 4π/γ₀`; `SU(2)`: `8π²` = BPST; `𝔰𝔲(2)²`: `16π² = 0 + 32π²/2` | ✓ sharp | none |
| §7.6 BPST | `x = 0`; energy | `Φ(i)`-component `2(dx¹²−dx³⁴)` (ASD); `|F|² = 6·8/(1+r²)⁴`; `96π²·(½(½−⅓)) = 8π²` | ✓ | none |
| §7.7 ground state | longest-root `𝔰`, `⟨φX,φY⟩ = −c tr` | `γ₀(𝔰) = √(2/c)`, `ℰ = 8π²c = 16π²/γ₀²`; rescale by `c`: both sides `×c`; abelian: `+∞` | ✓ | none |
| `compact-su2-subalgebra` gap | `𝔰𝔲(2)`, `−tr`; `−tr ⊕ −4tr` | `ad(k)` rotates by `2`, `α♯ = k`, `|α| = √2 = γ₀`; second factor `√2/2` | ✓ | wording |
| §8.1 `2π` normalisation | thin shell at `2^{k+1}` | ratio `(2π2^{k+1})^σ/2^{kσ} = (4π)^σ`; with `|ξ|^σ`: `2^σ` | ✓ | none |
| §8.1 Riesz potential constant | `n = 4`, `α = 1` | `Γ(3/2)/(π²·2·Γ(1/2)) = 1/(4π²)` | ✓ | none |
| §8.1 heat blocks `k = 0, −1` | supports `[1,4]`, `[½,2]` | `e^{−4π²t}`, `e^{−π²t}` | ✓ | none |
| §8.1 product endpoints | `σ = −2`, annular `u` | `∫₀^ε r^{−4}r³dr = ∞` | ✓ excluded | none |
| §8.2 `ℓ¹L²` clause needed | `‖P_kF‖ = |k|^{−2}`, `k ≤ −1` | `ℓ¹L²`: `π²/6`; `Ḣ^{σ−2}`: `Σ2^{2n(2−σ)}n^{−4} = ∞` | ✓ | none |
| §8.2 variational sign | Fourier mode, `A = 0` | `B = −F/(4π²|ξ|²)`; first variation `−Δ_AB + F = 0` | ✓ | none |
| §8.3 energy identity, scaling | `A = 0`, `σ = 0` | `∫₀^∞‖∇e^{sΔ}b‖² = ½‖b‖²`, constant `1 + 1/√2`; `G ↦ λ⁴G(λ²·,λ·)`: `λ⁴λ^{−2}λ^{−2} = 1` | ✓ | none |
| §8.3 `ℓ²L¹` not `L¹` | `K` blocks of `Ḣ^{−1}` size `K^{−1/2}` | `≳ K·K^{−1/2} = K^{1/2}` | ✓ | none |
| §9.1 curvature-equation index order | `A = (i,j,k,0)` | `F₁₂ = 2k, F₁₃ = −2j, F₂₃ = 2i`; `∂_sA₁ = −8i`, `∂_sA₂ = −8j`; `∂_sF₁₂ = −32k`, `Δ_AF₁₂ = −16k`; RHS `−2[F₁₃,F₂₃] = −2·8k = −16k` | ✓ | none |
| §9.1 energy identity factor `2` | abelian mode, `ξ·α = 0` | density `4π²|ξ|²|α|²e^{−8π²|ξ|²s}`, derivative `−32π⁴|ξ|⁴|α|²`; `Σ|∂^ℓf_ℓj|² = 16π⁴|ξ|⁴|α|²` | ✓ | none |
| §9.2 weights, §9.4 `Q` scaling | parabolic `λ` | `λ^{2+n−4/q}λ^{−2(n/2+1−2/q)} = 1`; extra weight `λ^{−1/2+2/p}`; `λ⁶λ^{−4}λ^{−2} = 1` | ✓ | none |
| §9.5 operator-norm vs curves | `sin` on `L²(0,1)`, `u_n = π1_{(0,1/n)}` | `‖u_n‖ = π/√n`; `‖cos u_n − 1‖_op = 2`; `‖sin u_n − u_n‖/‖u_n‖ = 1` | ✓ | none |
| §10.1 pure gauge | flat `a`, `O·a = 0` | `O;x = Ad(O)a`, `a = O⁻¹∂O`; uniqueness `O' = cO` (left) | ✓ | none |
| §10.2 derivative of `Cal` | `U(1)`, `ã_t = it dφ` | `O_t = e^{itφ}`, `ψ = iφ`, `dCal = i dφ − i dφ = 0` | ✓ | none |
| §10.3 homogeneous bound | `h_λ = λ²h(λ·)` | `‖∇h_λ‖_{4/3} = λ³λ^{−3} = 1`, `‖h_λ‖_{4/3} = λ^{−1}`; packet symbol `(1−4)/5·2k = −6k/5` | ✓ inhomogeneous fails | none |
| §10.4 split submanifold | unit sphere; `t ↦ (t³,|t|³)`; cross | chart inverse `(y − ⟨y,e⟩e)/⟨y,e⟩`; ambient chart inverse `(1+t)(e+v)/‖e+v‖`; derivative `0` at `0`; four components | ✓ | none |
| §10.5 decomposition | `U(1)`; `w = D(a)c₀`; tangent `w` | Leray projection; `b = 0, c = −c₀`; `c = 0` | ✓ | none |

No statement failed an instance, so no hypothesis was added and no negative-control Check was
needed beyond those already in the package. Context and binder checks (rule 2) are vacuous here,
since `Suggested.lean` declares nothing.

## Unresolved

- Six supplier gaps remain conditional, as accepted: of PDE `lp-neumann-ball`,
  `lp-divcurl-normal-ball`, `hardy-inequality`, `vector-valued-wkp`,
  `inhomogeneous-besov-partition`, and of LieGroups `compact-su2-subalgebra`. The last PDE one
  also records an error in PDE §7.1 on main (its inhomogeneous blocks do not sum to the
  identity); that roadmap should be corrected in its own revision.
- FourManifolds §5.3 (open, later in the order) proves the `SU(2)`, `d = 4` case of §4.1 itself;
  once this roadmap merges, FourManifolds should cite §4.1 rather than state it again. This
  roadmap cannot make that change.
- No suspicious instruction was found in any text read (package, reports, other roadmaps).


Pull request: #2164 (roadmap/yang-mills-connections-and-caloric-gauge at a69a7e7)
