# Review of PositiveMass (pull request #2247 at 56522b9)

**Verdict:** needs changes

## R01 (P2) — 8.4's Green blow-up clause never defines A

**Location:** `TauCetiRoadmap/PositiveMass/README.md:1182`–`1184`: "For a complete scalar-flat metric satisfying the hypotheses of 8.1 (with its dimension) or 8.2–8.3 (with spin) and an identity `m = 2A`, A≥0, and A=0 gives Euclidean rigidity."

**Claim:** A is not tied to any Green function. With A := m/2 the clause just restates 8.1–8.3. The sentence also has no main verb, and 8.4 has no locator. The Green constant A and the identity `m = 2A` belong to Yamabe Y6.

**Witness:** Take two-ended Schwarzschild with m = 2 and A := 1. The hypothesis `m = 2A` holds, and "A ≥ 0" is 8.1's m ≥ 0. Yamabe `README.md:237`–`242` (main) defines A in its normalized expansion and proves `m_ADM=2A`.

**Repair:** Replace `:1182`–`1184` with "8.1–8.3 are invariant under isometries, which preserve the mass of each end (0.2), and pass to finite Riemannian covers, each end lifting to copies with the mass of the end below (0.2; Lee–Parker, Theorem 9.6 and the remark after Theorem 10.3)." Retitle the section `### 8.4 Isometry and covering invariance`. Delete ", with `m = 2A`" at `:1199`. No roadmap cites PositiveMass 8.4.

## R02 (P3) — 3.0 cites R5c outside its dimension range and keeps the locator of the deleted proof

**Location:** `TauCetiRoadmap/PositiveMass/README.md:671`: "For a closed connected smooth Riemannian k-manifold". `:679`: "`λ₁ φ^(−4/(k−2)) > 0` (Lee–Parker, Theorem 2.6, Theorem 4.1 and its proof)".

**Claim:** R5c item 1 is stated for dimension m ≥ 1, but 3.0 cites it for every k. Lee–Parker Theorems 2.6 and 4.1 supported the eigenfunction positivity proof, which this pull request moves to R5c. Neither theorem states the scalar curvature of `φ^(4/(k−2)) g`, the claim the locator is now attached to.

**Witness:** RiemannianGeometry `README.md:3401` at the head of #2222 says "Let (M,g) be a Riemannian manifold of dimension m≥1". `LeeParker1987` line 421 is Theorem 2.6, the strong maximum principle. Line 643 is Theorem 4.1, regularity for the subcritical equation.

**Repair:**
- At `:671`, write "For a closed connected smooth Riemannian k-manifold, k≥1,".
- At `:145`, write "on a closed connected manifold of positive dimension".
- At `:679`, replace the parenthesis with "(Lee–Parker, equation (1.1))".
- At `:1232`, delete "Theorems 2.6 and 4.1 (strong maximum principle, regularity and positivity),".

## R03 (P3) — 8.2's rigidity is not in Cecchini–Zeidler Theorem 3.1

**Location:** `TauCetiRoadmap/PositiveMass/README.md:1151`–`1153`: "zero mass at one end implies a global isometry with ℝⁿ (Cecchini–Zeidler, Theorem 3.1 with empty boundary and ψ=0, p. 13–15; Witten 1981, uncertified)".

**Claim:** Theorem 3.1 gives nonnegative mass, and positive mass where θ̄_ψ or η̄_ψ is positive somewhere. At ψ=0 its equality case yields only Scal ≡ 0. Flatness and the isometry with ℝⁿ are Theorem B.

**Witness:** `CecchiniZeidler2021` lines 592–596: Theorem 3.1, nonnegative and strictly positive masses. Lines 670–673: zero mass forces θ̄_ψ = η̄_ψ = 0. Lines 113–116: Theorem B, flat and isometric to Euclidean space.

**Repair:** "(Cecchini–Zeidler, Theorem 3.1 with empty boundary and ψ=0, p. 13–15, for nonnegativity, and Theorem B, p. 3, with its proof on p. 18, for the rigidity; Witten 1981, uncertified)".

## R04 (P3) — 0.1's coordinate-uniqueness bullet drops Lee–Parker Theorem 9.5's order hypothesis

**Location:** `TauCetiRoadmap/PositiveMass/README.md:257`–`259`: "Two parametrizations of the same end whose coefficient differences both decay at order t>0 differ, outside a compact set, by a Euclidean rigid motion plus an `O_2(|x|^(1−t))` error (Lee–Parker, Theorem 9.5)."

**Claim:** Theorem 9.5 assumes order greater than (n−2)/2, and its conclusion may lose an ε. The cited source therefore does not support the bullet for 0<t≤(n−2)/2, nor the error without loss. The bullet's only consumer, the invariance bullet of 0.2 at `:289`, needs only t>(n−2)/2.

**Witness:** `LeeParker1987` lines 1675–1678 assume "(9.3) holds with τ > (n − 2)/2" and conclude "possibly with τ replaced by τ − ε". For n=3 and t=1/4 the bullet asserts what the source does not.

**Repair:** At `:257`–`259`, write "Two parametrizations of the same end whose coefficient differences both decay at order t>(n−2)/2 differ, outside a compact set, by a Euclidean rigid motion plus an `O_2(|x|^(1−t+ε))` error for some small ε>0 (Lee–Parker, Theorem 9.5)". At `:289`, write "the `O_2(|x|^(1−t+ε))` errors".

## R05 (P3) — a 5.2 Check omits Scal ≥ 0

**Location:** `TauCetiRoadmap/PositiveMass/README.md:975`: "`ψ = λf` with `0≤f≤1`: `θ ≥ λ²f² − λ|df| ≥ −λ|df|`."

**Claim:** θ_ψ = Scal/4 + ψ² − |dψ|, and 5.2 does not assume Scal ≥ 0. The first inequality fails wherever Scal < 0.

**Witness:** On ℝ³ take `u⁴δ` with u = 1 + εχ, χ a bump function. Since ∫Δu = 0, somewhere Δu > 0 and Scal = −8u⁻⁵Δu < 0. At a point with Scal = −4 where f vanishes nearby, θ = −1 < 0 = λ²f² − λ|df|.

**Repair:** "`ψ = λf` with `0≤f≤1`, where Scal≥0: `θ ≥ λ²f² − λ|df| ≥ −λ|df|`."

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.2 mass, Cecchini–Zeidler (2.1), p. 6 | `(1+c r^(2−n))^(4/(n−2))δ`, n=3, c=1; `δ + ε x_i x_j/r^n` | flux `4(n−1)c|S|/(2(n−1)|S|) = 2`; Schoen–Yau 2017 p. 4 gives 1 (half); non-conformal `ε(n−1)|S|/(2(n−1)|S|) = ε/2` | holds; matches CZ line 225 |
| 0.1 uniqueness bullet | n=3, t=1/4 and t=3/4 | LP 9.5 needs τ>1/2: t=1/4 uncovered; t=3/4 covered, error `O(r^(1/4+ε))` | R04 |
| 0.4 conformal law (used by 3.0) | `φ=(2/(1+r²))^((n−2)/2)` on ℝⁿ; n=3 | Scal = n(n−1); `a_3=8`, `4/(n−2)=4`, `−(n+2)/(n−2)=−5` | holds |
| 1.3 sphere Dirac multiplicities | m=2, m=3; k=0,1 | CH (3.44), N=2: `2(k+1)` = 2, 4; CH (3.58), N=3: `(k+1)(k+2)` = 2, 6; README Checks agree | holds |
| 1.3 Clifford identities | constant v, n=3, ℓ=0 | `D(Xv) = −nv + Σx_k(c_jc_k+c_kc_j)∂_j v = −3v`; `X²=−r²`; `D²=−Σ∂_j²=Δ⁺` | holds |
| 1.4 Fredholm and end values | flat ℝⁿ, δ∈(2−n,0) and δ∈(0,1); Schwarzschild end data (1,0), (1,1) | LP 9.2(b): isomorphism exactly on (2−n,0); kernel on (0,1) the constants, dimension 1; solutions in (0,1) and ≡1 | holds |
| 2.1 harmonically flat approximation | `(1+εr^(2−n))^(4/(n−2))δ`, q<n−2 | mass 2ε→0; `‖εr^(2−n)‖^p_(L^p_(−q)) ∝ ε^p ∫ r^(p(2−n+q)−1) dr`, finite iff q<n−2 | holds; LP Lemma 10.6 (line 1850) |
| 2.2 zero-mass deformation | h=fδ at the flat metric | `div div h + Δ⁺ tr h = (1−n)Δf`; linearized conformal law `(n−1)Δ⁺f`, the same | holds; LP (8.11) and Lemma 10.7 (line 1917) |
| 2.3 volume rigidity | ℝⁿ; `S¹×ℝ^(n−1)` | ratio ≡1; `2π ω_(n−1) r^(n−1)/(ω_n r^n) → 0` | holds; the cylinder has no AE end |
| 3.0 (changed) | S², a=1, V=c; S³, a=8, V=6; a=2, V=2c; k=0 | λ₁=c; `8μ₁(Δ⁺+3/4)=6`, Scal(φ⁴g)=6 at φ=1; `2μ₁(Δ⁺+c)=2c`; k=0 point: λ₁=V(pt), outside R5c's m≥1 | the identity λ₁=aμ₁ holds; R02 |
| 3.3 logarithmic cutoff | φ_R on R≤r≤R², R=e¹⁰ | `(2π/log²R)·log R = 2π/log R = 0.628` | holds; Schoen–Yau 1979 not readable |
| 4.2 boundary mass identity | flat ℝⁿ, u constant | G_r(u)=0; limit `−(n−1)ω m|u|²/2` for inward ν (CZ line 419) | holds |
| 4.2/8.3 integrability Check | ℝ³, `u=1+(1+r²)^(−3/8)` | `Δu=(3/4)(1+r²)^(−19/8)(−r²/4−3)`; Scal≈`(3/2)r^(−11/4)`, `∫r^(−3/4)dr=∞`; flux 15 at 10⁴, 150 at 10⁸ | holds |
| 5.2 integrated estimate | flat ℝ³, u=Xv | `|∇u|²=3|v|²=|Du|²/3`, Pu=0; constants `(n−1)ω/2`, `nω/2` as in CZ (2.9)–(2.10) | holds |
| 5.2 Check ψ=λf | `u⁴δ`, u=1+εχ, at a point with Scal=−4, f≡0 nearby | θ=−1; Check's lower bound 0 | fails: R05 |
| 6.2 positivity and rigidity | two-ended Schwarzschild, m>0; ℝⁿ⊔Tⁿ | `(n−1)|S|m|v|²/2 ≥ ‖∇u‖² > 0`; the disjoint union is excluded by connectedness | holds; CZ lines 662–673 |
| 7.1 truncations | ℝⁿ, R=3, λ=1, ε=1 | boundary radius 1, H=−1, `h_λ ≥ (n−1)/2`; `supp ψ_λ ∩ supp ξ₀ = ∅` | holds; CZ lines 725–757 |
| 8.1 `exists_tendsto_mass_nonneg` | flat ℝ³, identity end; Schwarzschild c=1; n=8 | integrand ≡0 (scratch `simp` proof), m=0; m=2≥0; `hn7` excludes n=8 | holds; SY2017 Thm 5.3 (line 1886) |
| 8.1 `nonempty_isometryEquiv_of_mass_eq_zero` | flat ℝ³; ℝⁿ⊔Tⁿ | isometry = identity; the union has a mass-0 end but fails `ConnectedSpace` | holds; LP Lemma 10.7 |
| 8.2 spin positivity | ψ=0, empty boundary | `θ̄_0 = nScal/(4(n−1)) ≥ 0` iff Scal≥0, so Thm 3.1 gives m≥0; at m=0 it gives only Scal≡0 | nonnegativity holds; R03 |
| 8.3 one AE end | two-ended Schwarzschild, either end chosen | m≥0 at the chosen end; Theorem B (lines 113–116) has no finite-end hypothesis | holds |
| 8.4 Green clause | Schwarzschild m=2, A:=1; flat ℝⁿ, A:=0 | `m=2A` holds; the conclusion A≥0 is 8.1's m≥0 | R01 |

- **Previous review.** The review at `3de256b` raised no finding. The scope line its predecessor repaired, at `:25`–`28`, is unchanged here.
- **Source locators read against the text: 47.**
  - Cecchini–Zeidler: 22, Definitions 2.1/2.3/2.4 through Theorem B.
  - Lee–Parker: 18, (1.1), Theorems 2.6, 4.1, 6.5, 9.2, 9.5, 9.6, 10.1, 10.3, Lemmas 9.4, 9.7, 10.6, 10.7, Definition 8.2, (8.11).
  - Camporesi–Higuchi: (3.44) and (3.58).
  - Schoen–Yau 2017: §1 p. 4, Theorems 5.1–5.3, Proposition 5.4.
- **Library declarations opened at the pins: 11.** Mathlib `Volume/Measure.lean:36`, `SobolevInequality.lean:602`, `LeviCivita.lean:360` and `Riemannian/Basic.lean:80`. Tau Ceti `Scalar.lean:212`, `LeviCivita/Regularity.lean:25`, `Volume.lean:82` and `:93`, `Sobolev/Embedding.lean:73`, `Riemannian/Laplacian.lean:238`, and `Degree/Basic.lean` (`degreeAtRegularValue`).
- **Cross-roadmap citations resolved.**
  - R5c item 1 is at the #2222 head `7cdd446`, RiemannianGeometry `README.md:3539`. Only that open revision defines R5c. The description names #2222 and says this pull request merges after it.
  - VariationalMethods §2.3 (`:494`) and §5.1 (`:839`) on main resolve the resolver's two leads, "V2.3" and "V5.1".
  - UO-D06 is UnboundedOperators `:703`.
  - K5a's closed realization is VariationalMethods 5.1's operator (VariationalMethods `:1054`). So 3.0's UO-D06 realization and R5c's closed case are one operator.
  - RiemannianGeometry at #2222 has no supply edge to PositiveMass.
- **Gate and dependency check.** I re-ran the gate on this head: every check returned 0, and it ended `OK`. The worker's gate records `build=0`. The dependency check printed `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Lean.**
  - `lake env lean` exits 0, with `sorry` warnings only at `:128` and `:154`.
  - `#check @name` for all 7 declarations matches README 8.1, with no binder lost.
  - `simp` makes no progress on either theorem, and nothing in the file is padding.
  - This pull request does not change `Suggested.lean`.
- **Headline theorems.**
  - 8.1 is stated.
  - The docstring at `:22`–`32` names as not statable at the pins: 8.2, 8.3, 3.1's torus obstruction, and the Layer 1, 1.3 and 6.1 theory.
  - 8.4 is R01.
  - 8.1's range 3≤n≤7 is narrower than Schoen–Yau 2017 Theorem 5.3, which covers every n. The README states the range as the reach of GeometricCurrents G6, and 8.2–8.3 cover every n under spin.
- **Overlap check:** I read the scopes of Yamabe (main and #2248), MinimalSurfaces (#2226), RiemannianGeometry (main and #2222) and GeometricCurrents (main).
  - The closed-manifold first eigenfunction is owned by RiemannianGeometry R5c. PositiveMass 3.0 and Yamabe Y1 item 2 at #2248 consume it.
  - The conformal law of `φ^(4/(n−2))g` is owned by PositiveMass 0.4. Yamabe Y0 item 2 restates it, and Yamabe `:52` (main) says PositiveMass consumes Y0. Both need a Yamabe repair.
  - Boundary Gauss–Bonnet is owned by PositiveMass 3.1, and MinimalSurfaces `:81` cites it.
  - Integral-current minimization is owned by GeometricCurrents G1–G7, and PositiveMass cites it.

## Not verifiable

- Schoen–Yau 1979, *Comm. Math. Phys.* 65, §3–§5 (sampled 3.3, and 2.2): behind the Springer paywall, and marked uncertified in the README.
- Witten 1981 and Parker–Taubes 1982 (6.2, 8.2): behind the Springer paywall, and marked uncertified.
- Schoen–Yau 1979, *Manuscripta Math.* 28 (3.1): behind the Springer paywall, and marked uncertified.
- Lohkamp 1999, Proposition 6.1 (3.2, not sampled): the sources service resolved it only to a paywalled page.
- do Carmo, §4-5 (3.1): a commercial textbook with no open copy, and not in the manifest.
- Bartnik 1986: waived in the manifest, and cited only by its locator.

## Source issues

- **Misprint** in CecchiniZeidler2021 at proof of Theorem A, p. 16: the source says the distance condition defining λ₀ is between ∂X and ∂X_λ; it should be between ∂X₀ and ∂X_λ, since no X is defined in that proof; affects nothing.
- **Misprint** in SchoenYau2017 at proof of Proposition 5.4, p. 41: the source credits the truncation observation to Lohkamp with an unresolved citation mark; it should name the Lohkamp paper meant; affects nothing.
