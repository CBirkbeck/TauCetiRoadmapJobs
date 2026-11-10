# Review of CotangentLagrangian (pull request #1651 at c1e867d)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

All six findings of the previous review are repaired (see "Previous findings"). The eight headlines in `Suggested.lean` are true as stated, sourced and not padding. Two defects remain, both in README prose; R01 is a one-sentence change of citation and R02 a one-clause change of wording.

## R01 (P2) — The `H₁ = π₁^ab` step of the Kodaira–Thurston example cites a supplier section that does not state it; the pinned Tau Ceti proves it

**Location:** `README.md:351`–352: "compute π₁ through that covering/fundamental-group correspondence, then H₁=π₁^ab using SmoothBundlesConnections B6.1’s degree-one comparison".

**Claim:** SmoothBundlesConnections B6.1 makes no statement relating `π₁` to `H₁`, and SmoothBundlesConnections says so in its own scope. The statement needed is the degree-one Hurewicz isomorphism, which the pinned Tau Ceti proves. Earlier reviews, including the previous one, resolved this citation by its heading only; the content was not opened.

**Witness:**
- On main, `SmoothBundlesConnections/README.md:59`: DGFloer "owns the degree-one Hurewicz isomorphism"; :66–68 leave the identification of degree-one singular cohomology with `Hom(π₁(M),A)` "through the Hurewicz isomorphism" to a Part II. B6.1 (:1375 onward) contains fine-sheaf acyclicity and the Čech–de Rham and Čech–singular comparisons, nothing about `π₁`.
- At the pin, `TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:705`: `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, for a path-connected `X : TopCat.{0}` and a base point, an additive equivalence from the abelianization of `FundamentalGroup X x` to the first homology of the singular chain complex. It elaborates by `#check` at the pin.

**Repair:** replace the clause by "then H₁=π₁^ab by Tau Ceti's `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`", and drop "B6.1" from that sentence (B1's quotient charts stay). No cross-roadmap edge is added. Tested on the instance: the Heisenberg lattice has abelianization ℤ² (its commutator subgroup is its centre ℤ), so `π₁^ab = ℤ² × ℤ = ℤ³`, `H₁ = ℤ³` and `b₁ = 3`, odd, as `README.md:352` says; for the torus `T⁴` the same step gives ℤ⁴ and `b₁ = 4`, even.

## R02 (P3) — The isotropic dimension count is stated without the injective-differential hypothesis

**Location:** `README.md:135`–136: "the dimension counts `2 dim N ≤ dim M` for isotropic maps and `2 dim N = dim M` for Lagrangian maps with an injective differential at some point".

**Claim:** as written, the hypothesis "with an injective differential at some point" attaches to the Lagrangian count only. The isotropic count needs it too, and the pinned theorem the sentence cites has it.

**Witness:** a constant map `ℝ³ → (ℝ², dq∧dp)` is isotropic (every tangent image is 0) and `2·3 = 6 > 2`. `TauCeti/Geometry/Symplectic/Lagrangian/Manifold.lean:258`, `IsIsotropicMap.two_mul_finrank_le`, assumes `hx : Function.Injective (mfderiv J I f x)`.

**Repair:** write "the dimension counts, for a map with an injective differential at some point, `2 dim N ≤ dim M` when it is isotropic and `2 dim N = dim M` when it is Lagrangian". The constant map above then no longer satisfies the hypothesis.

## Previous findings

- **R01 (prescribed-derivative theorem statable), repaired.** `Suggested.lean:303` states `exists_diffeomorph_opens_mfderiv_eq`; `README.md:667` names it and :669–673 give its standing hypotheses and the meaning of smoothness of `A`; the docstring bullet is narrowed to the symplectic neighborhood theorem with the subbundle reason (`Suggested.lean:132`–135).
- **R02 (manifold generating-function theorem and fixed-point dictionary statable), repaired.** `Suggested.lean:183` states the generated symplectomorphism, now with the base-point and `W`-membership clauses; :217 states the chain dictionary `exists_equiv_periodic_of_generating` for every `N ≥ 1`, of which Prop. 5.1 is `N = 1`. `README.md:443`–455 and :493–501 name both and state the graph hypothesis in words.
- **R03 (billiard periodic orbits statable), repaired.** `Suggested.lean:246`; `README.md:567`–572 names it; the docstring keeps only the twist, area and measure theorems of the next-collision map, with the reason that the map is itself the construction.
- **R04 (C1.1, C1.3, C2, C2.0, C2.1, C2.2 restated), repaired.** Every row of that table is now a citation: `README.md:51`–56, :85–95, :128–164, :171–188, :192–210, :235–290, :313–316, and the docstring's "Proved at the pins" list.
- **R05 (two headlines neither stated nor named), repaired.** `Suggested.lean:122`–127 names the Kodaira–Thurston example and the composition of correspondences with the missing carriers; both named declarations exist at the pin (`TauCeti/Analysis/InnerProductSpace/HodgeStar/Kahler.lean:80`, `TauCeti/Geometry/Manifold/FiberProduct/Equation.lean:57`).
- **R06 (citations without locator or section), repaired.** The Weinstein 1971 entry is gone and the references attribute Thm. 8.4 to Weinstein through Cannas da Silva; `README.md:349` cites UniversalCovers Stages 1–2, :353 DifferentialGeometry Layer 8, :358 ComplexKahlerGeometry K6.1. The neighbouring SmoothBundlesConnections citation is R01 above.

## Verified sound

:robot: AI review. **Full review** of the folder at `c1e867d`. No pull-request file was edited; every probe is a scratch copy.

**Scope and pins.** Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` (manifest); HEAD `c1e867dc`, `origin/main` `71c8f211`. The prescribed exclusion diff prints nothing outside the three named folders; the folder holds `README.md` and `Suggested.lean` only. None of the cited roadmaps on main changed between the main the previous review read and this one.

**Gate and dependency check.** The worker's gate reports every counter zero and `build=0`. My run of the prescribed gate reports every content counter zero and `outside-folder=4`, the four `ConvexityToric` and `IntegrableSystems` files the brief names as the pull request's own. Dependency check output: `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`; no UPWARD or CYCLE line.

**Elaboration, signatures, padding.**
- `lake env lean` on `Suggested.lean`: exit 0, eight warnings (183, 217, 246, 263, 281, 303, 340, 359), all `declaration uses sorry`.
- `#check @` on the 11 declarations from a scratch importer: every binder is present. `[CompactSpace Q]` is in the four compact headlines and absent from the point-germ Darboux theorem, the generating-function theorem and the chain dictionary, as their docstrings say; `[NeZero N]` is in the chain dictionary; `[T2Space] [SecondCountableTopology]` on `M` (and `N`) in all five C4 theorems.
- One-tactic probe: a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial` fails at all eight theorems. No padding. The three abbreviations are used by the C3/C4 statements and by HamiltonianReduction R1.

**Headlines.** Stated: the eight listed in the docstring. Not statable and named with a carrier reason: Kodaira–Thurston non-Kähler, composition of correspondences, the billiard map's twist/area/measure theorems, the symplectic neighborhood theorem, the existence half of coisotropic embedding. The first-jet relative Moser theorem is the case `M = N`, `f = id`, `A = id` of `exists_diffeomorph_opens_mfderiv_eq`. The recurrence statement is Mathlib's (`Mathlib/Dynamics/Ergodic/Conservative.lean`) and is consumed.

**Library declarations opened at the pin.** The 92 backticked names new since the previous head were located in the pinned sources (file and line), in addition to the roughly 200 `#check`ed last round. Statements compared with the README:
- `mvfderiv` (`Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:608`) is `mfderiv` with values in the target normed space; `TauCeti.mixedHessian` (`…/GeneratingFunction/MixedHessian.lean:78`) is `mvfderiv J (fun Q ↦ mvfderiv I (fun q ↦ S (q, Q)) x.1) x.2`, of type `T_Q N →L E →L ℝ`, the bilinear map `README.md:436`–437 describes; it carries no regularity hypothesis, and the headline supplies smoothness on an open `W`.
- `ModelWithCorners.pi` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean:521`) and `piChartedSpace` (`…/ChartedSpace.lean:482`) need a finite index, supplied by `[NeZero N]` on `ZMod N`.
- `TauCeti.CotangentBundle.cotangentRel_const_iff` (`…/Cotangent/Relation.lean:145`): related iff `y = w.proj ∧ z.2 = 0`, which is `README.md:92`–95.
- `IsLagrangianMap.two_mul_finrank` and `IsCoisotropicMap.finrank_le_two_mul_finrank` (`Lagrangian/Manifold.lean:265`, :272) have the hypotheses `README.md:136`–137 states (injective differential at a point; a point of the source). The isotropic sibling is R02.
- `TauCeti.GLSymplecticFin.mem_center_iff` (`LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Center.lean:112`): `m ≠ 0`, scalar with `c² = 1`, index `Fin (m+m)`, any commutative ring, as `README.md:292` says.
- `SymplecticGroup.coe_inv'`, `inv_eq_symplectic_inv`, `mem_iff'`, `transpose_mem_iff` (`Mathlib/LinearAlgebra/SymplecticGroup.lean:206`, :210, :186, :183).
- `TauCeti.IsContMDiffDistribution` (`Geometry/Manifold/Distribution.lean:269`) is a family of subspaces of `TangentSpace I x`, as the docstring's reason says.

**Sources.** Cannas da Silva, *Lectures on Symplectic Geometry* (`CannasDaSilvaLSG`); printed page = PDF page − 8.

| Sampled target | Locator | Checked |
|---|---|---|
| Fixed points and finite iterates | Prop. 5.1, p. 29 (line 1300, proof 1302–1306); Prop. 5.2, p. 30 (line 1331); exercise, p. 30 (line 1355) | Correspondence, `ξ = d_xf`, `dψ = d_xf + d_yf`; Prop. 5.2's unique nondegenerate critical point and global uniqueness hypotheses are the README's. |
| Chains of generating functions | same lines; §5.2, p. 32 (lines 1407–1414) | The cyclic sum and the critical-polygon dictionary; the general chain statement is the README's own, proved in the table below. |
| Convex planar billiards | §5.2, pp. 30–32 (lines 1361–1418) | Period 1, arclength, tangent-line convexity (p. 30, lines 1364–1366), `f = −|χ(x)−χ(y)|`, `∂_xf = v`, `∂_yf = −w` (p. 32), area preservation (line 1418). |
| Finite-volume recurrence | Thm. 5.3, p. 32 (line 1420) | Area-preserving diffeomorphism of a finite-area manifold; neighbourhood return. |
| Neighborhood germs with prescribed ambient derivative | Thm. 8.4, p. 48 (line 1974); Thm. 8.5 and proof (lines 1987–2010) | Two forms on one `M`, identity on `X`, no derivative prescription: exactly what `README.md:667`–669 says the source gives. |

Also at their locators: §4.2, pp. 23–24 (lines 1088–1148: the relation `ξ = d_xf`, `η = −d_yf`, the mixed-Hessian determinant as the local condition, the free-motion example); §§2.2–2.3, pp. 9–10 (lines 601, 634); Thm. 6.5, p. 37 (1558); Prop. 6.8, p. 39 (1639); Thm. 7.4, p. 45 (1845); Thm. 8.1, p. 46 (1875); Thm. 8.6, p. 49 (2030); Thms. 9.1 and 9.3, p. 51 (2093, 2107); the §18.1 exercise, p. 106 (4267).

**Cross-roadmap citations resolved** (main `71c8f21`, content opened, not only headings): HeegaardFloer F2.1 (`README.md:2437`; domain-local Moser :2468, pullback differentiation :2488, smooth-parameter primitive :2490), F2.6h (:3320), F3 (:3476); DifferentialGeometry Layer 4 (:402), 5.4 (:524), Layer 8 (:816); GeometricTopology §1.5 (:974); SmoothBundlesConnections B1.4 free proper quotients (:421), B2–B4 (:559–1010); LieGroups Layers 2, 7, 9 (`RepresentationTheory/LieGroups/README.md:356`, :787, :1199; its :1235 and :1422–1426 state the same C2.0/C2.1 split from the other side); ComplexKahlerGeometry K6.1 (:1274); UniversalCovers Stages 1–2 (:89, :98); ContactGeometry CG1, CG4, CG5 (:59, :121, :150); HamiltonianReduction R1, R3 (:33, :187); at this head, ConvexityToric Layer 4 (:767) and IntegrableSystems I5.2 (:534, consuming C3.1 at :544). The one citation that fails is R01.

**Overlaps and ownership.** #1187 (pin bump) conflicts in this folder; the description's merge-order block orders this pull request first. No cited id is dropped and none of this roadmap's is. `roadmaps grep` finds relative Moser, Weinstein and coisotropic neighborhoods, billiards and the chain dictionary owned only here; FukayaTheory (open) consumes C4 and C2. The degree-one Hurewicz isomorphism is Tau Ceti's at the pin and DGFloer Layer 1 extends it; this roadmap only consumes it (R01).

**Adversarial table.** `ω = dq∧dp`, `λ = p dq`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Chain dictionary (:217), proof | general `N ≥ 1` | `∂A/∂q_i = d_1S_i(q_i,q_(i+1)) + d_2S_(i−1)(q_(i−1),q_i) = p_i − p_i = 0` along a periodic sequence; conversely `hW'` gives `z_i` over `(q_i,q_(i+1))` and criticality gives `φ_i z_i = z_(i+1)`; `z_i.2 = d_1S_i` makes the base-point map injective | bijection | none |
| Chain dictionary, `N = 1` | `S = qQ+q²/2+Q²/2` on ℝ | `φ(q,p) = (p−q,−p)`, fixed only `(0,0)`; `A(q) = S(q,q) = 2q²`, critical `q = 0` | 1 ↔ 1 | none |
| Chain dictionary, `N = 2` | same `S`, both edges | periodic states `(q₀,0) ↦ (−q₀,0)`; `A = (q₀+q₁)²`, critical line `q₁ = −q₀` | line ↔ line by base points | none |
| Chain dictionary, wrong sign | `P = +∂_QS` | `φ(q,p) = (p−q,p)`: line `p = 2q` fixed against one critical point | sign pinned by `hφ` | none |
| Chain dictionary, `N = 0` | `ZMod 0 = ℤ` | no finite sum, no `pi` model | excluded by `[NeZero N]` | none |
| Generating function (:183) | free particle `S = −(q−Q)²/2t` | mixed Hessian `1/t`; `p = (Q−q)/t`, `P = p`; `φ(q,p) = (q+tp,p)`, `φ*ω = ω` | true | none |
| Generating function, `hH` needed | `S = q²+Q²` | mixed Hessian 0; relation `{p = 2q}` is no graph | excluded | none |
| Oscillator (`README.md:462`) | `S_t` | `p = (Q−q cos t)/sin t` ⇒ `Q = q cos t+p sin t`; `P = −q sin t+p cos t` | agrees | none |
| Legendre charts (`README.md:419`–425) | `dS = p dq − P dQ` | `dF₂ = p dq+Q dP`; `dF₃ = −q dp−P dQ`; `dF₄ = −q dp+Q dP` | agree | none |
| Billiard theorem (:246), `N = 3` | unit circle, vertices `0, 2π/3, 4π/3` | at angle 0, `χ' = (0,1)`: incoming unit chord `(√3/2,1/2)`, outgoing `(−√3/2,1/2)`; both sides `1/2` | law holds | none |
| Billiard law, non-example | vertices `0, π/2, π` | at angle 0: incoming `(1,0)` gives 0, outgoing `(−1,1)/√2` gives `1/√2` | fails, as `README.md:578`–580 says | none |
| Billiard theorem, `N = 2` | any table | `u_(k−1) = −u_k`, so the law reads `⟨u,χ'⟩ = 0` at both ends | double normal; a diameter exists | none |
| Billiard maximizer, `N = 4` | circle radius `R` | square `4√2R ≈ 5.66R`; doubled diameter `8R` | least period 2 | none |
| Maximizer has distinct consecutive vertices | vertices `a, a, b` | replacing one `a` by `x` off the segment `[v_(k−1), b]`: `|v_(k−1)−x|+|x−b| > |v_(k−1)−b|` | perimeter increases | none |
| Billiard generating signs | circle | `S = −2R sin((t−s)/2R)`: `∂_sS = cos((t−s)/2R) = v`, `−∂_tS = v`; `∂_s∂_tS = −sin(·)/2R < 0` | `β(s,v) = (s+2R arccos v, v)` | none |
| Billiard measure | `AddCircle L × (−1,1)` | `L · 2 = 2L` | finite, full support | none |
| Recurrence hypotheses | translation of ℝ; point mass at 0 with `f(x) = x+1` off 0 | `(0.5,0.6)` never returns in either | finiteness and full support both needed, both stated | none |
| Relative Moser (:263) | `T*S¹`, `σ₁ = (1+p²)ω`, zero section | `φ(q,p) = (q,h(p))`, `h+h³/3 = p`: `φ*σ₁ = (1+h²)h'ω = ω` | holds | none |
| Relative Darboux (:281) | `q`-axis in ℝ², `σ₁ = e^qω` | pullbacks 0; `φ(q,p) = (q,e^(−q)p)`: `φ*σ₁ = ω`, fixes the axis | holds without compactness | none |
| Relative Darboux, hypothesis needed | `Q = M = ℝ²`, `σ₁ = 2ω` | `φ = id` near `q₀` forced; `2ω ≠ ω` | necessary | none |
| Prescribed derivative (:303) | `T*S¹`, `f = id`, `A = [[1,c],[0,1]]` | `det = 1`, `A∂q = ∂q`; `Φ(q,p) = (q+cp,p)`, `Φ*ω = ω`, `dΦ = A` | true | none |
| Prescribed derivative, wrong data | `A = diag(1,2)`; `A = diag(2,1/2)` | `det 2`, excluded by `hAω`; `A∂q = 2∂q`, excluded by `hAi` | both laws discriminate | none |
| Weinstein (:340) | unit circle in ℝ² | `φ(θ,r) = (θ,(1−r²)/2)`: `φ*(dθ∧dp) = r dr∧dθ = ω` | holds | none |
| Coisotropic (:359) | `S¹ → ℝ²` Lagrangian, `S¹ → ℝ⁴` isotropic | no diffeomorphism of nonempty opens of ℝ² and ℝ⁴ | `hcj` necessary, stated | none |
| Kodaira–Thurston `b₁` (`README.md:352`) | Heisenberg lattice × ℤ; `T⁴` | abelianizations ℤ³ and ℤ⁴; `b₁ = 3`, `4` | odd, even | R01 |
| Isotropic count (`README.md:135`) | constant `ℝ³ → ℝ²` | `2·3 = 6 > 2` | false without injectivity | R02 |
| Constant-map relation (`README.md:92`) | `f ≡ y` | `p = q∘0 = 0`: `(x,0) ∼ (y,q)` for all `q`; `p ≠ 0` related to nothing | agrees with the pin | none |
| Liouville field (`README.md:330`) | `Z = p∂p` | `ι_Zω = −p dq = −λ`; `L_Zω = ω` | holds | none |
| Cosphere Reeb field (`README.md:367`) | `H = ‖p‖²/2` | `q̇ = H_p`, `ṗ = −H_q`; `λ(X_H) = ‖p‖² = 1` on `S*Q` | Reeb of `+λ` is the forward flow | none |
| Realification and `J` (`README.md:233`–239) | `M = [[X,−Y],[Y,X]]` | `MJ = [[−Y,−X],[X,−Y]] = JM` | commutes | none |
| Cartan involution (`README.md:292`) | `AᵀJA = J` | `JA = A⁻ᵀJ`, so `A⁻ᵀ = JAJ⁻¹`; `−B(X,dθX) = (2n+2)tr(XXᵀ) > 0` | holds | none |
| `canonicalForm` chart value (`README.md:762`) | `T*ℝ`, `(∂q,∂p)` | `1`; `−ω` gives −1, `2ω` gives 2 | sign pinned | none |

## Not verifiable

- Nothing: every cited passage was read in the cached copy of Cannas da Silva, and the README cites no other external source.

## Source issues

- **Misprint** in CannasDaSilvaLSG at §5.2, printed p. 32: the source says the cyclic sum of the generating function equals the sum of the side lengths; it should be minus that sum, since the generating function is minus the chord length; affects nothing.
