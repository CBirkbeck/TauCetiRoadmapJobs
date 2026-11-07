# Review of FormalConnectionsOpers (pull request #1056 at 19335ec)

**Verdict:** accepted

This is an incremental re-review of the 103 lines changed since 7e7e507. All of them are in `TauCetiRoadmap/FormalConnectionsOpers/README.md`:

- the ComplexComparisonPartII C−1.1 bullet (lines 55–58) and the ReductiveGroups bullet (lines 80–90) of `## Scope and ownership`;
- a new Layer 3A.5 paragraph under `### From TauCetiRoadmap.ReductiveGroups` (lines 273–280);
- §4.3's lower dictionary (lines 1431–1466);
- a new §4.3 Check (lines 1623–1629), §4.3's `*Needs:*` (lines 1640–1641), and the Examples and Dependencies of Layer 4 (lines 1689–1698).

Nothing changed in `Suggested.lean`, in `metadata.toml` or outside the folder, and the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

No findings.

## Previous findings

- R01 — repaired: lines 80–86 now read "ReductiveGroups Layer 3A.5 owns the classical topology on the complex points of every locally finite-type `ℂ`-scheme, the complex charts of every smooth one …; §4.3 … owns only the comparison of that topology and those charts on `G(ℂ)` with … C−1.1's `G^an`". The other three parts of that repair also landed:
  - Line 1433 now reads "its classical topology and smooth charts".
  - Lines 1436–1446 add the homeomorphism and atlas comparisons.
  - Lines 56–58 record that the one other topology is identified with C−1.1's in §4.3.

## Verified sound

**Gate and direction.**
- The gate run here at 19335ec reports `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head adds `build=0`.
- The dependency check run here reports `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. There is one edge more than at 7e7e507 (2427): the new `ComplexComparisonPartII C−1.1` edge from §4.3.
- In the merge order, ComplexComparisonPartII is line 43 and FormalConnectionsOpers line 44. ReductiveGroups, ComplexKahlerGeometry and ComplexManifolds are on main.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.**
- `lake env lean` on `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean` gives three `declaration uses sorry` warnings (lines 71, 130 and 160) and nothing else, with exit `0`.
- `git diff 7e7e507 HEAD -- Suggested.lean` is empty.
- I ran the `#check @name` probe (all nine declarations in one scratch file). The elaborated types are identical to the worker's `signatures.md` and to the previous review. The binders `[Algebra ℚ R]`, `reductiveCommHopfAlgProperty ℂ H`, `[CharZero F]`, `Differential.deriv ≠ 0`, `[FiniteDimensional F V]`, and `[HopfAlgebra k H] [Algebra k R]` on both loop maps are present. Nothing changed.
- The headline list and the one-tactic padding probes are carried from the earlier reviews, because no Lean statement changed.

**Library declarations opened at the pins (8).** The changed §4.3 paragraph keeps these names:
- `TauCeti.HopfAlgebra.points` at `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:56`. Its docstring and body make the underlying type `WithConv (H →ₐ[R] A)`, as line 1447 says.
- `TauCeti.smoothCommHopfAlgProperty_of_charZero` at `TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:151` and `TauCeti.HopfAlgebra.finrank_lie_eq_ringKrullDim_of_charZero` at `:178`.
- `TauCeti.Bialgebra.CounitAlgebra` at `TauCeti/Algebra/AlgebraicGroup/Tangent/Basic.lean:85`.
- Mathlib `GroupLieAlgebra` at `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:56`, `mlieBracket` at `Mathlib/Geometry/Manifold/VectorField/LieBracket.lean:70`, `LeftInvariantDerivation` at `Mathlib/Geometry/Manifold/Algebra/LeftInvariantDerivation.lean:47`, and `WithConv` at `Mathlib/Algebra/WithConv.lean:28`.

**Cross-roadmap citations resolved (7).**
- ReductiveGroups at #1676 (head `66eb91ba`, from its checkout):
  - Lines 19–25: 3A.5 owns "the classical complex-point topology, smooth charts …, the complex Lie-group structure on `G(ℂ)`". C−1.1 constructs the same topology, and "the two agree by the identity on `X(ℂ)`" is asserted there, with no target.
  - Lines 880–883: the topology for every locally finite-type `ℂ`-scheme, which on an affine presentation is the zero-locus subspace topology.
  - Lines 900–903: charts of a smooth `ℂ`-scheme "using étale coordinates and the analytic inverse theorem"; étale maps become local biholomorphisms.
  - Lines 931–933: multiplication, unit and inverse are holomorphic "because they are induced by scheme morphisms", and the chart-at-the-identity identification with Layer 2.
  - Lines 3804–3806: FormalConnectionsOpers consumes 3A.5's dictionary in §4.3, and Layer 11 consumes nothing from it. There is no cycle.
- ReductiveGroups at #1808 (`60a92ec`) and #1797 (`51ebd8a`), read through `roadmaps show --pr`. Line numbers are those of that listing, which is README line + 1. The same passage is at #1808 lines 799–801, 820 and 856, and at #1797 lines 1175–1177, 1196 and 1231. #1797 lines 29–31 call C−1.1 a consumer of 3A.5's topology.
- ReductiveGroups on main (`eaf17b1`), line 342, and at #1854 (`d723ba1`), listing line 343: 3A.5 consumes C−1.1's `.complexPoints` and states no complex Lie group. The pull request's description names #1676 as the revision to merge first, with #1808 and #1797 carrying the same passage, as the overlap rule requires.
- ComplexComparisonPartII at #848 (`d0ac71a`), listing lines:
  - Line 920: the underlying space of `X^an` is `X(ℂ)`, with the zero-locus subspace topology on each affine chart.
  - Line 922: an étale morphism becomes a local biholomorphism.
  - Lines 936–939 and 150: the F2.4 hand-off.
  - It mentions ReductiveGroups nowhere, so no supplier states the 3A.5 ↔ C−1.1 comparison that §4.3 now owns.
- §2.4 of this README supplies the two steps §4.3 cites. Lines 742–743 identify the topology on a finite affine presentation with the common-zero-set subspace topology, independent of the presentation. Lines 795–797 make an algebraic étale map a local biholomorphism by K1's manifold inverse theorem. K1 is in §4.3's `*Needs:*`.

**Ownership against open work (changed objects only).**
- The new owned object is the comparison, on `G(ℂ)`, of ReductiveGroups 3A.5's topology and charts with C−1.1's `G^an` and §2.4's atlas.
- `roadmaps grep` for 3A.5 together with C−1.1 finds only this README (lines 1463 and 1624). This roadmap is later than both suppliers, so it is a legitimate owner.
- The double construction of the classical topology by ReductiveGroups 3A.5 (#1676) and C−1.1 (#848) lies between those two roadmaps. #1676 lines 22–25 acknowledge it. This roadmap records both owners (lines 47–49 and 80–82) and builds neither.

**Sources.**
- The changed lines add or change no source locator. The new steps are comparisons of supplier carriers whose inputs are the named supplier statements above. #1676 and #848 cite SGA 1 XII §§1.1–1.2 for them.
- In the seeded sample, only F4.3 falls in the changed lines, and its changed paragraph carries no locator. §4.3's Kostant and Chevalley locators lie outside the diff and were not re-read.
- The README flags no locator as unverified. Its "uncertified" entries (now lines 1585, 1985, 2009 and 2532–2585) are paywalled works cited by locator.

**Adversarial table.**
- Rows marked "(r6)" carry forward, with their computed values, the previous report's rows for statements this diff leaves untouched. Line numbers in them are as at 7e7e507; the README has shifted by about +24 lines after line 270 and +35 after line 1440.
- The rows marked "(new)" cover every changed statement.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `Res(f′dt) = 0`, `d(t⁻¹)` (r6) | `f = Σ f_j t^j`; `t⁻¹` | `t⁻¹` coefficient of `f′` is `0·f₀ = 0`; `d(t⁻¹) = −t⁻²`; `Res(t⁻¹dt) = 1` | as stated | none |
| §1.1 `⊗^!` witness (r6) | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive | lies in `⊗^!` only | none |
| §1.2 inverse of `t + t²` (r6) | `ψ = t − t² + 2t³` | `ψ + ψ² = t + O(t⁴)` | as stated | none |
| §1.2 contravariance (r6) | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2t + 2t²` | as stated | none |
| §1.2 chain rule, residue (r6) | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `Res = 1`; `Res(t⁻²·2t dt) = 2` | unit hypothesis needed, as stated | none |
| §1.2 `Aut(O)` semidirect product (r6) | `φ = at` | `φ′(0) = a`; `Der⁺ = t²ℂ[[t]]∂` | as stated | none |
| §1.3 lattices (r6) | `U = t^M O ⊂ L = t^N O` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator (r6) | `i + j = −1` | annihilator of `{i ≥ 0}` is `tV^∨[[t]]` | as stated | none |
| §1.3 topological nilpotence (r6) | `t`, `t⁻¹`, `0` | `t^n O ⊂ t^N O`; `t^(−n)O ⊄ O` | as stated | none |
| §2.1 negative control (r6) | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | curvature `dx∧dy ≠ 0`; `∇_ξ = ξ` | hypothesis needed | none |
| §2.1 dual sign (r6) | `∇ = d + a dx` | `∇^∨ = d − a dx`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 Atiyah sequence (r6) | `M = A` | `0 → I/I² → P¹(A) → A → 0` split by the jet | as stated | none |
| §2.2 splitting Leibniz (r6) | `∇s = 1⊗s − σ(s)` | `∇(as) = a∇s + da ⊗ s` | as stated | none |
| §2.2 first Check (r6) | `A = k[x]` | `∇f = (f′ + af)dx`; wrong identification `(−1 + ax)dx` | as stated | none |
| §2.2 jet not `A`-linear (r6) | `s = 1` | `1⊗x − x(1⊗1) = ξ ≠ 0` | as stated | none |
| §2.2 char `p` PBW failure (r6) | `𝔽_p`, `(d/dx)^p` | `(d/dx)^p x^n = 0` | as stated | none |
| §2.2 order transition (r6) | `A` smooth | kernel `Sym^m Ω¹` | as stated | none |
| §2.2 symbol of `(d/dx)²` (r6) | char `0, 2, 3`; `f = x²` | `2·C(n,2) = n(n−1)`; char `2`: `f^[2](x²) = 1`, `(d/dx)²(x²) = 0` | as stated | none |
| §2.3 flatness criterion (r6) | `∇ = d + yN dx` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N` | signs agree | none |
| §2.3 Bianchi (r6) | `a = y, b = x`; `a = 0, b = x` | `0`; `dx∧dy` | as stated | none |
| §2.4 frame dictionary (r6) | `g = h⁻¹` | `g⁻¹dg = −(dh)h⁻¹` | as stated | none |
| `regularGauge` law (r6) | symbolic | `(j+1)g_(j+1) = Σ_(i≤j)(g_iA_(j−i) − B_(j−i)g_i)` | docstring exact | none |
| `regularGauge_constantCoeff_bijective` (r6) | `R = ℚ`, `𝔽_p`, `ℚ[ε]/ε²`, `0`; `n = ∅` | `g = g₀e^t`; `1 + t^p` solves `g′ = 0` over `𝔽_p` | `[Algebra ℚ R]` needed | none |
| §2.4 smoothness controls (r6) | `ℂ[x,y]/(xy)`; `ℂ[x]/x²` | cotangent ranks `2`/`1`; Krull dim `0` | as stated | none |
| §3.1 nonreduced unit (r6) | `1 + εt⁻¹` over `ℂ[ε]/ε²` | inverse `1 − εt⁻¹` | as stated | none |
| §3.1 `exp_1`, `K_N` (r6) | `ℚ`; `𝔽_p`; `GL_n` | `1/p!` absent; `g(1 + t^N X)g⁻¹ = 1 + t^N gXg⁻¹` | as stated | none |
| §3.2 descent overlap (r6) | `R = k`, `S = k[x]` | `Σ x^n y^n t^n ∉ S((t)) ⊗ S((t))` | as stated | none |
| §3.3 gauge, cocycle, left action (r6) | `1 + εx`; `𝔾_m`; `h, g` | `A + ε([x,A] − x′)`; `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹` | as stated | none |
| §3.4 `𝔾_m` classes, stabilizers (r6) | `g = c t^n e^f`; `𝔽_p` | `a ↦ a − nt⁻¹ − f′`; `t^p` horizontal over `𝔽_p` | as stated | none |
| §3A.1 non-normality (r6) | `SL₂`, `[[1,t],[0,1]]` | conjugate `[[1,t³],[0,1]]` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` (r6) | `G = 1`; `𝔾_m`; `ℂ[ε]/ε²`; `SL₂` | `u = at^n·w`; `(1−t)⁻¹t⁻¹ − t⁻¹ = (1−t)⁻¹` | holds | none |
| same, hypothesis (r6) | `reductiveCommHopfAlgProperty ℂ H` | split ⇒ Česnavičius Theorem 19 for every `R` | holds | none |
| §3A.2–3A.4 (r6) | `t⁻¹ + t`; `(λ,w)(μ,v)(ν,u)`; `Y/Q^∨`; Iwahori `SL₂` | not in `R[[t]]`; `(λ + wμ + wvν, wvu)`; `ℤ, 0, ℤ/2, ℤ`; `α(λ) = 2` | as stated | none |
| §3A.5 Cartan, Schubert, charts (r6) | `GL₁`, `SL₂`, `GL₂` | `ℂ((t))ˣ = ⊔ Oˣtⁿ`; `dim = 2`; `O²/L_k ≃ O/t^k` | as stated | none |
| §3A.6–3A.7 (r6) | `GL₂`; `PGL₂`, `α^∨/2` | `det = t²` component `2`; `[diag(t,1)]² = [diag(t,t⁻¹)]` | as stated | none |
| §4.1–4.2 opers, normalization (r6) | `PGL₂`, `ψ = t`; `[[1,u],[0,1]]` | unit in `ℂ((t))`; `u = −a` gives `b + a² + a′` | as stated | none |
| §4.3 Chevalley checks (r6) | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `ℂ[h²]`; exponents `1, 2`; `Lie(μ₂) = 0` | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` (r6) | `a = εt⁻¹` | `q = −εt⁻²` | as stated | none |
| §4.3 compact comparison `λ ↦ dλ(2πi)` (r6) | `𝔾_m`, `SL₂`, `PGL₂` | `exp_G(dλ(2πi)) = λ(1) = 1` | as stated | none |
| §4.3 lower dictionary generality (r6) | `μ_n`; `𝔾_a`; `𝔾_m × ℤ/2`; `GL_N` | `d = 0, 1, 1, N²`; Krull dims agree | holds | none |
| §4.3 Cartier citations (r6) | hypotheses at the pin | `[Field k] [CharZero k]`, `[Algebra.FiniteType k H]` | as stated | none |
| §4.3 bracket compatibility (r6) | `D, E ∈ 𝔤` | commutator at `1` is `D*E − E*D` | no minus sign | none |
| §4.3 composite is 3A.5's identification, now line 1457 (r6) | `𝔾_a`; `𝔾_m` | `D(x/(1+x)) = 1`; `D(x⁻¹) = −1`; #1676 lines 932–933 | as stated | none |
| §4.4 `SL₂`-lifts (r6) | `diag(√t, 1/√t)` | residue `−½ ∉ ℤ` | as stated | none |
| §5.1–5.4 (r6) | `ψ = t + t²`; `q = t⁻²`; `n = 2` | `{ψ,t} = −6/(1+2t)²`; `eval_q(q_(−2)) = 1`; `−y₂″ + (a′ + a² + q)y₂ = 0` | as stated | none |
| §6.1 (r6) | `𝔾_m`; `μ₂` | root of unity; `H¹(ℂ((t)), μ₂) = ℤ/2` | as stated | none |
| `exists_cyclicVector` (r6) | `V = 0`; `D = 0`; `𝔽_p(t)` | no cyclic vector for `D = 0` on `F²`; `D^p v = 0` | both hypotheses needed | none |
| §6.2–6.5 (r6) | Katz `a = 1`; `∂ + t⁻²`; `SL₂` cells; `μ_n` | det `t⁻²`; rel. dim `−2`; `ℓ = 1, 1, 2`; `H¹(μ_n) = ℤ/n` | as stated | none |
| §6.4 order bound (r6) | `g = exp(t⁻³x)` | `gauge(g⁻¹, 0) = −3t⁻⁴x`, order `−4 < −2` | as stated | none |
| §7.1–7.5 (r6) | `{x,y} = x`; `𝔤 = ℂ`; Virasoro; `I = (q_j : j < 0)`; Miura | `[dx,dy] = dx`; `−nδ_(m+n,0)`; `c = −6`; `{L₂,L₋₂} ↦ −3`; `q = u² − u′` | as stated | none |
| §8.1–8.4 (r6) | `𝔾_m`; `𝔰𝔩₂`; `κ_c` | automorphisms `ℂˣ`; `[F_x,F_y] = −F_[x,y]`; `κ₀(h,h) = 2` | as stated | none |
| Scope: §2.4 versus C−1.1 (r6) | #848 listing lines 150, 936–939 | C−1.1 hands fixed-model atlases, tangent, toric, group and gauge comparisons to F2.4 | one owner each | none |
| `polynomialLoopToFormal`, `positiveLoopToFormal` (r6) | elaborated at the pin | `↑(points ↧(LaurentPolynomial R)) →* ↑(points ↧(LaurentSeries R))`, with `[HopfAlgebra k H] [Algebra k R]` | builds | none |
| Deleted ReductiveGroups Layer 11 consumer bullet (r6) | main line 1964; #1676 line 3806 | #1676: "Layer 11 consumes no target of FormalConnectionsOpers" | correct once #1676 merges first | none |
| Scope lines 55–58: C−1.1 "alone" dropped; one other topology, identified in §4.3 (new) | `Spec ℂ[ε]/ε²`; `𝔾_m` | 3A.5: one point, no ring sheaf (#1676 Check, "does not assert a ringed-space isomorphism"); C−1.1: stalk `ℂ[ε]/ε²` (#848 Check `I=(z²)`); so 3A.5 is no second analytification. `𝔾_m`: both topologies are the hyperbola subspace | as stated, consistent with §4.3 | none |
| Scope lines 80–90: 3A.5 owns the topology, charts and `G(ℂ)`; §4.3 owns the comparison (new) | #1676; #1808; #1797; #1854; main | #1676 lines 19–21, 880–883, 900–901, 931–933; #1808 listing 799–801, 820, 856; #1797 listing 1175–1177, 1196, 1231; main line 342 and #1854 listing 343 consume C−1.1 with no Lie group `G(ℂ)` | matches every head the description names | none |
| Contract lines 273–280: 3A.5 charts are restrictions of étale coordinate maps to opens where they are injective (new) | `SL₂`, `U = D(a)`, `(a,b,c)`; `𝔾_m`, `x²` on `{Re x > 0}` | `U ≃ D(a) ⊂ 𝔸³` with `d = (1+bc)/a`; injective on `U(ℂ)`; `3 = dim 𝔰𝔩₂`. `d(x²) = 2x dx`, invertible on `𝔾_m`; image `ℂ ∖ (−∞,0]`. An implicit-function chart is a projection of a standard-étale presentation, so it has this form | a faithful reading of #1676 lines 900–901 ("étale coordinates and the analytic inverse theorem") | none |
| Contract line 279–280: "§4.3 uses … only these two descriptions" (new) | the two §4.3 steps | homeomorphism step cites "Layer 3A.5's affine description"; atlas step cites "such a chart restricts an étale coordinate map" | as stated | none |
| §4.3 lines 1436–1440: identity of `G(ℂ)` is a homeomorphism onto `G^an` via `𝔸^(N²+1)` (new) | `𝔾_m ⊂ GL₁`; `SL₂ ⊂ GL₂`; trivial group; `μ_n`; `𝔾_a ⊂ GL₂` | `{xy = 1} ⊂ ℂ²`. `{ad − bc = 1, y(ad − bc) = 1} ⊂ ℂ⁵` forces `y = 1`; projection to `ℂ⁴` has polynomial inverse. Trivial group: `{(1,1)}`. `μ_n`: `{xⁿ = 1, xy = 1}`, `n` points. `𝔾_a` via `[[1,s],[0,1]]`: `a = d = y = 1`, `c = 0`, a copy of `ℂ`. In each case 3A.5 (#1676 lines 881–882) and §2.4 (lines 742–743) give the same subspace | holds; uses neither connectedness (`μ_n`) nor reductivity (`𝔾_a`), as line 1460 says. Layer 1's generation by matrix coefficients and `det⁻¹` (line 263) makes the embedding closed | none |
| §4.3 lines 1441–1446: every 3A.5 chart lies in §2.4's maximal atlas, so the maximal atlases coincide (new) | `x²` on `{Re x > 0}`; `x²` on `ℂˣ`; `exp` on `{|Im z| < π}` and `{|Im z| < π + 0.1}`; the atlas logic | Transition of `x²` with `x` is `w ↦ √w`, derivative `1/(2√w) ≠ 0`. On `ℂˣ`, `±1 ↦ 1`, not injective, not a chart. `exp` is injective on the first strip (image `ℂ ∖ (−∞,0]`, inverse `Log`); on the second, `i(π+0.05)` and `i(−π+0.05)` collide, so "injective" is needed. If `A ⊂ M` and `A` covers, then `max(A) = M`, since `c∘m⁻¹ = (c∘a⁻¹)∘(a∘m⁻¹)` locally | as stated; local biholomorphism from §2.4 lines 795–797 (K1 inverse theorem); C−1.1 states the same (#848 listing 922) | none |
| Check lines 1623–1629: two topologies on `𝔾_m`, `μ_n`, trivial group (new) | hyperbola; chart `x`; complex conjugation | identity homeomorphism; `x` onto `ℂˣ`, transition `id`; conjugation transition `z ↦ z̄` has `∂/∂z̄ = 1 ≠ 0`, not holomorphic; `μ_n`: `d = 0`, `Fin 0 → ℂ` a point; trivial group one point | true; discriminating, since it refutes "homeomorphic implies equal atlases" | none |
| §4.3 lines 1460–1466 and Scope lines 85–86: ownership of the comparison (new) | `roadmaps grep` for 3A.5 and C−1.1 | hits only this README (lines 1463, 1624); #1676 lines 22–25 assert agreement without a target; #848 never mentions ReductiveGroups | single owner, later than both suppliers | none |
| `*Needs:*` lines 1640–1641 and Dependencies lines 1695–1698: add ComplexComparisonPartII C−1.1 (new) | depcheck; merge order | `0 problem(s)`, `2428` edges (`+1`); ComplexComparisonPartII line 43 < FormalConnectionsOpers line 44 | no upward edge | none |
| Layer 4 Examples lines 1689–1691 (new) | `𝔾_m`, `μ_n`, trivial group | the same three instances and values as the Check at lines 1623–1629 | consistent | none |

## Not verifiable

- No new items this round. The earlier reviews' items stand:
  - Kazhdan–Lusztig 1988 §4 Lemmas 6 and 8, and Kazhdan–Lusztig 1980 §2: no legal copy, and marked uncertified in the README.
  - Kostant 1963, Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985 and Rinehart 1963: cited by locator and marked uncertified.
- ReductiveGroups at #1808, #1797 and #1854, and ComplexComparisonPartII at #848, were read through `roadmaps show --pr`, not from a checkout. Their line numbers are those of that listing.

## Source issues

- none
