# Review of ComplexKahlerGeometry (pull request #1234 at af80ecf)

**Verdict:** needs changes

Three findings, all P3; none is blocking. The gate passes, `Suggested.lean` elaborates with only its 27 `sorry` warnings, and the four folder findings of the previous review (its R02–R05) are repaired. Its R01 (merge order with #1807, #1808 and #1854) was answered in the repair reply as a change to the pull-request description, outside the folder; the reason is correct (README 7.1 agrees with AlgebraicTopology on main, `TauCetiRoadmap/AlgebraicTopology/README.md:1594`), so it is not raised again.

## R01 (P3) — Nomizu's theorem is owned in 8.2 without a locator or a reference

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md:3389–3390` (8.2, a sampled section): "Own Nomizu's real de Rham comparison for compact nilmanifolds and Sakane's Dolbeault comparison for compact complex parallelizable nilmanifolds."

**Claim.** Nomizu's theorem is named by its colloquial name only: no theorem number or page in 8.2 or 8.3, and no entry under `## References`. Sakane's theorem has its number only in `## References` (`:3554`), not at the claim.

**Witness.** `grep -n -i nomizu README.md` returns line 3389 and line 3440 ("Nomizu/Sakane induction") only. angella-iwasawa line 256 (Theorem 2.1, p. 5) states it and attributes it to Nomizu, Theorem 1 (bibliography entry at line 973); sakane-parallelisable line 102 (Theorem 1, p. 189).

**Repair.** After the quoted sentence add: "(Nomizu, *On the cohomology of compact homogeneous spaces of nilpotent Lie groups*, Ann. of Math. (2) 59 (1954), 531–538, Theorem 1, as restated in Angella, Theorem 2.1, p. 5: for a simply connected nilpotent G with lattice Γ the inclusion of the left-invariant forms into the forms of Γ\G is a quasi-isomorphism; Sakane, Theorem 1, p. 189, for the Dolbeault comparison)", and add the Nomizu entry to `## References`. Tested on the Iwasawa manifold: the invariant complex gives `b₁=4` (angella-iwasawa line 701), the value 8.2 states.

## R02 (P3) — The Hopf negative control of 6.1 names a monomial that already contains the factor it then lists as the coefficient

**Location.** `README.md:2418–2419`: "(its `z̄₁dz₁∧dz₂∧dz̄₂` coefficient is `−(i/2)|z|⁻⁴z̄₁`)".

**Claim.** As written the factor `z̄₁` is counted twice. The coefficient of `dz₁∧dz₂∧dz̄₂` in `dω` is `−(i/2)|z|⁻⁴z̄₁`; the coefficient of `z̄₁dz₁∧dz₂∧dz̄₂` is `−(i/2)|z|⁻⁴`.

**Witness.** `d(|z|⁻²)=−|z|⁻⁴Σ_k(z̄_k dz_k+z_k dz̄_k)`, so `dω=(i/2)d(|z|⁻²)∧Σ_j dz_j∧dz̄_j` has the term `−(i/2)|z|⁻⁴z̄₁ dz₁∧dz₂∧dz̄₂`. At `z=(1,0)` the value is `−i/2`; the product of the two quoted expressions would be `−(i/2)z̄₁²|z|⁻⁴`.

**Repair.** Write "(its `dz₁∧dz₂∧dz̄₂` coefficient is `−(i/2)|z|⁻⁴z̄₁`)". At `z=(1,0)` this is `−i/2≠0`, which is what the control needs.

## R03 (P3) — Fifteen numerals are fused to the preceding word

**Location.** `README.md:1002` "Theorem4.29", `:1007` "item0", `:1551`, `:1552`, `:1587` "equal1", `:1553` "by0", `:1602` "avoid0", `:1605` "Dimension0", `:1764` "order0", `:2340`, `:2343` "at0", `:2962` "Layer4", `:3199` "from0", `:3223` "degree0", `:3239` "dimension1".

**Claim.** Each is a word and a number run together; three of them are citations ("Theorem4.29" of Demailly, "StableReduction Layer4", "RealAnalyticGeometry R3.2 item0"), which a search for "Theorem 4.29", "Layer 4" or "item 0" misses.

**Witness.** `grep -n -oE '\b(equal|by|avoid|order|degree|[Dd]imension|Theorem|Layer|item|at|from)[0-9]+\b' README.md` returns exactly these 15 hits; `:1016` in the same section writes "Theorem 4.31" with the space.

**Repair.** Insert the space in each: "Theorem 4.29", "item 0", "equal 1", "by 0", "avoid 0", "Dimension 0", "order 0", "at 0", "Layer 4", "from 0", "degree 0", "dimension 1". After the edit the grep above returns nothing.

## Previous findings (review of 2b571fb)

- **R01 (merge order with #1807, #1808, #1854) — answered, not raised again.** Description-only; see the first paragraph.
- **R02 (dropped heading anchors) — repaired.** `:365–368`: "K1 is now Layer 1, K2 is now Layer 2, … K8 is now Layer 8; 'Conventions and suppliers' is now Conventions and Exact supplier contracts, and 'Order and references' is now How to read the build and References." The overlap scan still lists the three `#k2-…`, `#k5-…`, `#k7-…` anchors; the sentence is the old → new mapping the rule asks for.
- **R03 (one wrong page, five missing locators) — repaired.** `:3344` and `:3541` "(10.8), p. 226"; `:571` (I (3.29), p. 28); `:746`, `:749`, `:752`, `:763` (IV (6.13)–(6.15), p. 216; IV (5.17), p. 209; IV (5.21), p. 211; V (11.7), p. 268), each read again this round (demailly-agbook lines 10742, 10439, 10512, 13215); `:1117–1120` (V §8 and §11 with the own-statement mark); `:1138–1140` (V (12.1)–(12.4)); `:1143` (Koszul–Malgrange, pp. 102–109, and the own-route mark); `:1167` (own statement).
- **R04 (torsion term) — repaired.** `:2392`: "`[D'_E,τ*]−[∂̄_E,bar(τ)*]`".
- **R05 (abbreviations, two process sentences) — repaired.** No `SBC`, `PDO`, `AT`, `GT`, `Riem`, `RQFT` or `DG` abbreviation remains; `:1606` reads "This theorem uses no hyperfunction or renormalization theorem"; the QFT sentence is gone from 3.3.

## Verified sound

**Gate and dependencies.**
- The worker's gate at this head: every scanner 0, `build=0`, `OK`.
- Dependency check: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds only the five roadmap files that main has.
- The thirteen supplier roadmaps of `## Exact supplier contracts` are on main (f8836c4): ComplexManifolds, ComplexTori, DifferentialGeometry, DeRhamCohomologyAndDuality, SmoothBundlesConnections, PDE, PseudodifferentialOperators, AlgebraicTopology, GeometricTopology, RealAnalyticGeometry, StableReduction, LieGroupoidsPoisson, and under `Completed/` RealAlgebraicGeometry, ContourIntegration, HopfRinow, HodgeStructures.
- Cross-roadmap citations resolved on main this round: AlgebraicTopology Stage 4 item 6 (`README.md:789–790`, generic quotient topology), item 7 `simplicialRealizationCW` (`:817`), `cwSubcomplexNeighborhoods` (`:755`), Stage 6 items 3–5 (`:1180`, `:1515`, `:1560`), Stage 7's use of K7.1/K7.2 (`:1594`), Stage 8 items 7 and 12 (`:1811`, `:2061`); SmoothBundlesConnections B2.2–B2.4 (`:605`, `:693`, `:776`), B5, B6.0–B6.2; DeRhamCohomologyAndDuality's consumer lines for K6.1 (`:75`, `:695–700` on main; `:121`, `:1312` at its open head #2085: both say K6.1 consumes §§2.4, 3.1–3.3, 4.1, as 6.4 does). The worker's citation scan lists no unresolved citation; its two Lean leads are module paths whose files exist at the pin.

**Ownership against open pull requests** (by object, `roadmaps grep`).
- Holomorphic exponential sequence and `Pic_hol≃H¹(M,𝒪×)` (4.5): ComplexComparisonPartII at #848 still lists them in its own scope (`README.md:93–96`, `:3998`). ComplexComparisonPartII is not on main and this roadmap is, so it cannot be cited from here and the citation is #848's to make; this was answered as description-only in an earlier round and is not raised again.
- Finite-rank Runge operator (2.2) and planar two-form exactness (5.6): GlobalHolomorphicFunctions at #992 states them (`README.md:1428`, `:2488`) and names K2 and K5a as consumers. It is not on main; main's copy of this roadmap cites it by a permalink, which this head removes by stating 2.2 here. Same rule, same conclusion.
- Hard Lefschetz, Weierstrass preparation, Newlander–Nirenberg, Koszul–Malgrange: no second owner found.

**Lean.**
- `lake env lean` on `Suggested.lean` (12 s): 27 `declaration uses sorry` warnings, nothing else. 27 theorems, 7 definitions with real bodies, one module docstring, no `set_option`, no sorried data. The file is unchanged since the head the previous review read.
- `#check @name` for all 34 declarations elaborated in a scratch copy; each type was compared with its README statement. Compactness and Hausdorffness are in scope for the K5b, K6.1, K7 and K8 statements, `[I.Boundaryless]` for `newlander_nirenberg`, `hodge_theorem_deRham`, `even_finrank_deRhamCohomology_odd` and `hard_lefschetz`; the definitions `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap` need no finiteness. Nothing changed.
- One-tactic probe: each `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide | (exact?; done) | sorry`. 25 fall through to `sorry`; the other two (`finrank_dolbeaultCohomology_serre`, `finrank_dolbeaultCohomology_symm`) hit the heartbeat limit in `whnf` and close nothing. No padding.
- Headlines: the 27 names of the Summary (`:17–29`) are the 27 theorems of the file; the docstring names 14 groups of targets that are not statable, each with the missing carrier.

**Library declarations opened at the pins** (Tau Ceti 2fd255d9).
- `SmoothTwoForm.Compatible`, `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:231`: a structure with fields `invariant` and `tames`, so `IsKahler` includes positivity on complex lines and the zero form is excluded.
- `SmoothForm.codifferential`, `TauCeti/Geometry/Manifold/Riemannian/Codifferential.lean:88`, and `hodgeStar`, `…/Riemannian/HodgeStar.lean:73` and `:296`: the star uses `o.fact_finrank_tangentSpace x`, so an orientation indexed by `Fin m` forces `m` to be the dimension at every point; `hodge_theorem_deRham` has no junk case with `m` different from the dimension on a nonempty manifold.
- `Manifold.Orientation`, `TauCeti/Geometry/Manifold/Orientation/Basic.lean:32`.
- `complexHodgeStar_mem_typeSubmodule_iff`, `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean:219` (type `(p,q)` to `(m−q,m−p)` when the real dimension is `2m`, as 5.1 says); `hodgeStar_hodgeStar`, `…/HodgeStar/Basic.lean:236` (sign `(−1)^(kl)`).
- `Projectivization.instTopologicalSpace` is declared both at `TauCeti/Topology/Algebra/Projectivization.lean:90` and at `Mathlib/Topology/Algebra/Projectivization.lean:44`, as 7.1 and the docstring say.
- `MontelSpace` and `ContinuousLinearEquiv.toCompactConvergenceCLM`, `Mathlib/Analysis/LocallyConvex/Montel.lean:46` and `:104` (the latter needs `[T1Space E]`, which 5.3 supplies as "the native Hausdorff hypothesis").
- `isInvolutiveComplexDistribution_eigenspace_I_iff` and `…_neg_I_iff`, `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.lean:27–29`.
- A scripted pass over the 475 distinct backticked tokens of the README: every identifier is found at a pin, is one of this file's 34 names, or is a target of a cited roadmap (`RoughDensity`, `deRhamHom`, `deRhamEquiv`, `homotopyOperator` in DifferentialGeometry; `cwSubcomplexNeighborhoods`, `simplicialRealizationCW` in AlgebraicTopology).

**Sources read at the text (the seeded sample).**
- 1.4: Webster is uncertified (see below); the converse direction is the pinned `nijenhuis_ofComplexManifold`.
- 2.2: rainer-advanced-complex-analysis line 1295 (Theorem 10.3, printed p. 24: the reconstruction formula with `∂ψ/∂ζ̄`, on a domain) and line 1338 (Theorem 11.1, p. 25: approximation on K equivalent to no relatively compact component of `U∖K`); line 1630 (Theorem 12.2, p. 31) for 5.6.
- 2.5: demailly-agbook line 10742 (IV (6.15), p. 216), 10439 (IV (5.17) Leray, p. 209), 10512 (IV (5.21), paracompact, p. 211), 13215 (V (11.7), p. 268).
- 3.4: lines 3872 (II (2.7), p. 81), 3931 (II (2.10), p. 82), 4286 (II (3.19), p. 89), 4742 (II (4.22), p. 97), 4842 (II (4.29), p. 99) and 4929 (II (4.31), p. 100), the last two inside §4.4 (line 4825).
- 4.3: no external locator; the comparison is marked as the roadmap's own.
- 4.5: lines 13017 (V (8.2), p. 264), 13040 (V (9.2), p. 264), 13051 (V (9.5), p. 265), 15569 (VI (9.1), p. 314), 10201–10206 (IV (4.11)–(4.12), p. 204), 10232 (IV (4.15), p. 205).
- 5.1 and 5.3: pinned declarations only, opened above; the Montel statement is marked as the roadmap's own.
- 5.9: lines 14858–14868 (VI (5.2)–(5.3), p. 300: the complex-linear star of type `(n−q,n−p)` and `d''*=−⋆d'⋆`) and 15370–15374 (VI §7, p. 309: `D*_E=−⋆D_E⋆` and the principal part of `Δ''_E`).
- 5.10: lines 15385 (VI (7.2), p. 309), 15390 (VI (7.3), p. 310), 15523 (VI (8.12), p. 313).
- 6.2: lines 14323–14352 (VI (3.1)–(3.5), p. 291), 14386 (VI (3.9), p. 292), 879 (I (3.1), p. 20).
- 7.4: knutson-borel-weil lines 64–72 (the Theorem of §1, p. 1: sections of the dual of the tautological line are `V*`).
- 7.5: no external source; every value recomputed in the table.
- 7.8: berwick-evans-tripathy line 287 (Remark 2.1, p. 6: degree-zero lines as flat unitary lines, with the character of `π₁`).
- 8.2: angella-iwasawa lines 693–724 (§§4.1–4.2, p. 13: `b₁=4`, `h^(1,0)=3`, `h^(0,1)=2`); sakane-parallelisable line 102 (Theorem 1, p. 189).

**Adversarial pass.** 45 rows, values computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 holomorphy test | `z̄`, `z²`, `|z|²` | `φ_z̄=1`; `0`; `z`, zero only at 0 | Pass |
| 1.3 eigenbundle convention | `u=∂_x` | `(u−iJu)/2=∂_z`, `J∂_z=i∂_z` | Pass |
| `newlander_nirenberg` (1.4) | `n=0`; standard ℂ | discrete M, constant φ; `φ=id` | Pass |
| 2.2 FiniteRankRunge | annulus `{2≤|z|≤3}` in `{|z|<4}`, `f=1/z` | `sup_L|f|=2/3`; `|∮|=2π` over length `4π` gives `≥1/2>2ε/3` iff `ε<3/4` | Pass |
| 2.2 pole pushing | W ⊄ Ω; W ⊆ Ω bounded | `b∈W∖Ω`, `(z−b)⁻¹` holomorphic on Ω; closure of W in `W∪K⊆Ω` compact, excluded by filled-in | Pass |
| `exists_mixed_parameter_dbar_solution` | `f=1`; `Ω=∅` | `u=z̄`: `(1+i·(−i))/2=1`; vacuous | Pass |
| `dolbeault_grothendieck_polydisc` | `r_k≤0`; `n=0` | empty domain; one point, no `(p,q+1)`-form | Pass |
| 2.4 `DolbeaultCohomology` | ℂ×, `dz̄/z̄`; `q=0`; `p>n` | `=∂̄log|z|²`, class 0, while `∮=−2πi`; coboundaries `⊥`; range of the type projection 0 | Pass |
| 2.5 Dolbeault theorem | ℂP¹, `(p,q)=(1,0)` | `h^(1,0)=0`, no holomorphic 1-form | Pass |
| `weierstrass_preparation`, `_division` | `w²−z`, `w³`; `d=0` | `d=2`, `u=1`, `a=(−z,0)`, `w³=w(w²−z)+zw`; `u=f`, empty sum | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f(x)≠0`; `f=z²`, `g=z` | `g=0` near x, `m=1`; `m=0`, `h=1/f`; `m=2`, `h=1` | Pass |
| `riemann_extension` | `k=0`; `1/z` | zero set U, `hA` forces `U=∅`; excluded by `hbdd` | Pass |
| `hartogs_extension_across_point` | ℂ; ℂ² | `1/z` excluded by `2≤finrank`; extension exists | Pass |
| 3.4 reduced ideal | `{zw=0}` vs `(zw)²` | `Sing={0}`; gradient of `(zw)²` vanishes on all of V | Pass |
| 4.2 Chern connection | `h=e^(−|z|²)` | `A=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy` | Pass |
| 4.3 monodromy | `d−a dz/z` on ℂ× | parallel `cz^a`, `M(γ)=e^(2πia)`; inverse convention `e^(−2πia)` | Pass |
| 4.5 exponential sequences | point; elliptic curve; `ℝP²` | kernel of `exp(2πi·)` is ℤ; `H¹(𝒪)=ℂ`, `c₁` not injective; Bockstein injective since `H¹(ℝP²;ℤ)=0` | Pass |
| 5.1 star and density | `*²` on degree k; chart `x↦−x`; `y=2x` | `(−1)^(k(m−k))=(−1)^(kl)`; `|dx|` fixed, `dx↦−dx`; `∫φdy=2∫φdx` | Pass |
| 5.2 nonextension | `φ_ε` on `‖x−εe₁‖≤cε` | `‖x‖≤(1+c)ε`, integral `≥C′ε^n exp((1+c)^(−2)ε^(−2))` against `Cε^(−N)` | Pass |
| 5.3 Montel | `M` a point, rank r | section space `𝕜^r`, bounded sets relatively compact | Pass |
| 5.4 Bessel symbol | `z=2`, `‖ζ‖=2`; point delta | `1+4=5`; `∫(1+‖ζ‖²)^s<∞` iff `s<−n/2` | Pass |
| 5.6 PlanarTwoForms | `h=1` | `u=z̄/(2i)`, `d(u dz)=(1/2i)·2i dx∧dy` | Pass |
| 5.7 realification | `a_+(u,u)=Q+i‖u‖²` | `Re((1−i)a_+)=Q+‖u‖²≥(Q+λ‖u‖²)/λ≥(c/λ)‖u‖²_(H¹)` | Pass |
| `hodge_theorem_deRham` | S¹; `M=∅`; `m≠dim` | `d*(f dθ)=(−1)^(1·2+1)f′=−f′`, harmonic line; all spaces 0; no orientation exists on nonempty M | Pass |
| 5.9 K5b.0 | `f dz̄` on ℂ | `|dz̄|²=2`, `∂̄*(f dz̄)=−2f_z`, `Δ_∂̄g=−½Δ_flat g`, symbol `½|ξ|²` | Pass |
| `finrank_dolbeaultCohomology_serre` (5.10) | Hopf; `p>n`, `q=n` | `h^(0,1)=1=h^(2,1)`; without `hp`: `0≠h^(0,0)=1` | Pass |
| 6.1 normal coordinates | ℂP¹ chart scaled by `√π`; `diag(1+z₂+z̄₂,1)` | `H=(1+π|w|²)^(−2)`, `|H−1|≤2π|w|²`; `dω(0)≠0` | Pass |
| 6.1 Kähler identities | `[Λ,d]`, `[L,d*]`; `[Λ,L]` on ℂ | `i(∂̄*−∂*)=−(d^c)*`, `d^c`; `1` at `k=0`, `−1` at `k=2` | Pass |
| 6.1 Hopf control | coefficient of `dz₁∧dz₂∧dz̄₂` at `z=(1,0)` | `−i/2`; the text's monomial carries an extra `z̄₁` | Fail, R02 |
| 6.1 Nakano bound | `e^(−|z|²)`, `u=dx∧dy` | `iΘ=2ω`, `[iΘ,Λ]u=2u=ka` | Pass |
| 6.2 planar star | `dz`, `dz̄`; `x dx+y dy`; `h=x²+y²` | `*dz=−i dz`, `*dz̄=i dz̄`; `δ=−2`; `δ(h dx∧dy)=2y dx−2x dy`, `Δ_H h=−4` | Pass |
| `del_delBar_lemma`, `finrank_dolbeaultCohomology_symm`, `even_…_odd` (6.3) | elliptic Kähler form; Hopf; annulus | `∫ω>0`, not exact; `h^(1,0)=0≠1`; `b₁=1` with boundary | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹, `k=2`; finite set | `0+1+0=1`; `b₀=|M|=h^(0,0)` | Pass |
| `hard_lefschetz` | `k=n`; `S²×S²` | identity; `(aσ₁+bσ₂)²=2ab≠0`, `σ₁²=0` | Pass |
| Hodge–Riemann sign | `dz`, `dz̄` on a curve; `dz₁∧dz₂` | `i·dz∧dz̄=2dx∧dy`; `−i·dz̄∧dz=2dx∧dy`; `i²·(−1)·dz₁∧dz₂∧dz̄₁∧dz̄₂=4dvol` | Pass |
| 7.1 model comparison | `(3,4)`, `2i(3,4)`; `(1,i)` | chart value `4/3` both; i, conjugate map gives `−i` | Pass |
| 7.2 Fubini–Study | `w=(1,i)/√2`; `diag(1,2)` | `r=2`, `h(e₁,e₂)=i/(8π)`; `H_z(2v,2v)=4/π` | Pass |
| projective cohomology (7.3), three Lean statements | `n=0`; `n=1`, `p=q=2`; `n=2` | `u=0`, `u⁰` generates; `h^(2,2)=0`; Betti `1,0,1,0,1`, `χ=3` | Pass |
| 7.4 incidence blowup | chart change `i→k`; `k=1` | `a′=az_k`, `z′_i=1/z_k`; `F(tv)=t⁻¹F(v)` forces `F=0` | Pass |
| 7.5 rational quartic | `n=1`; `n=2` | image `{b₂=0}`, dimension 4 of 5; pair sums of `{0,1,3,4}` give `0..8`, kernel `x₀x₃−x₁x₂`, `10−9=1` | Pass |
| `finrank_dolbeaultCohomology_complexTorus` | `n=0`; `n=2`; `p>n`; `L=ℤ⊂ℂ` | `1`; `1+4+1=6=C(4,2)`; `0=0`; not a full lattice, excluded | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; `M=∅` | `2=2`, `b₁=4`; `0=0` | Pass |
| 7.8 FlatDegreeZero | gauge a; curvature; `ρ(m+ni)=(−1)^m` | `|σ(1)|=e^(u−u)=1`, `Re(aτ)=v`; `iF′=φω+Δ_d(−2Gφ)ω/2=0`; `f=e^(πix)`, `f(z+1)=−f` | Pass |
| `finrank_deRhamCohomology_le_sum_dolbeault` (8.1) | Iwasawa; Hopf; `k>2n` | `4≤3+2`; `1≤0+1`; `0≤0` | Pass |
| 8.2–8.3 Iwasawa, Heisenberg | `dφ₃=−φ₁∧φ₂`; `x=y=z=1` | `d₁[φ₃]≠0`; `log=X+Y+½Z`; Nomizu unlocated | Pass; locator R01 |

## Not verifiable

- Webster, Hörmander (ALPDO I), Wells, Griffiths–Harris, Raghunathan and Koszul–Malgrange are recorded as uncertified; their locators were not opened. 1.4's route therefore rests on Webster's paper by its citation alone.
- Nomizu's 1954 paper was not read; R01's locator is the one Angella's Theorem 2.1 gives for it.
- demailly-agbook's cached extraction drops overlines, so `bar(τ)*` at VII (1.2) and VI (6.15) was checked by bidegree, not by the printed symbol.
- #1807, #1808 and #1854 were not reopened this round; #848 was read through `roadmaps show`, #992 and #2085 at the checkouts the brief gives.
- The table rows check instances; they are not proofs.

## Source issues

- none
