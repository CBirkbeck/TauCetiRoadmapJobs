# Review of ComplexKahlerGeometry (pull request #1234 at ec3dc78)

**Verdict:** needs changes

Incremental re-review of the 11 lines changed since `5577d7d` (one commit, `README.md` only). R02 is repaired. R01 is half repaired: the folder now names K7.1 as the only owner and describes AlgebraicTopology correctly as it is on main. The three open AlgebraicTopology revisions still claim the same object, though, and nothing states an order against them. The repair introduced no new defect.

## R01 (P2) — The ℂPⁿ model comparison still has a second owner at three open AlgebraicTopology heads, and no order is stated

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2101–2104`, "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2: AlgebraicTopology Stage 4.6 supplies only the generic quotient topology on `Projectivization`". Also the pull-request description, whose merge-order lines name only #1186 and #1398.

Claim: the folder half of the previous R01 is done and matches main. The other half is not. At their current heads, #1797, #1807 and #1854 still give AlgebraicTopology Stage 4 item 6 ownership of the same homeomorphism `[v]↦[v/‖v‖]` and of the transport of `cwComplex` and its characteristic maps. Each says ComplexKahlerGeometry K7 consumes them. #1807 and #1854 also rewrite this roadmap's K7.1–K7.2 to consume Stage 4.6. #1797 does not touch this folder, so no textual conflict will stop it from merging after this pull request. Main would then have two owners, each naming the other as consumer. The previous repair's own test still fails.

Witness: `roadmaps show AlgebraicTopology --pr 1797` (head `df89c5d`), `README.md:1385–1389`: "Own the homeomorphism of that carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` … and the transport of the CW structure … ComplexKahlerGeometry K7 consumes that topology and this cell structure." Same at #1807 (`cabeb14`) `:1092–1096` and #1854 (`f9b2a10`) `:1067–1071`.

Repair: nothing more in the folder; its sentence at `:2101–2104` is the right half. Add this to the description's merge-order paragraph: "#1797, #1807 and #1854 rebase on this pull request. Each replaces its AlgebraicTopology Stage 4 item 6 clause 'Own the homeomorphism of that carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` … along it' with a citation of ComplexKahlerGeometry K7.1 (the comparison) and K7.2 (the transported cells); #1807 and #1854 also drop their ComplexKahlerGeometry hunks." Test, on the instance that refuted the previous repair: the description carries the sentence. After the rebases, `roadmaps grep --fixed --readme-only 'CW structure and characteristic maps along it'` should find no AlgebraicTopology head. Today it finds #1797 `:1388`, #1807 `:1095` and #1854 `:1070`, and nothing on main. If a repair job cannot edit the description, this is the only item left for whoever can.

## Previous findings

- R01 — partly repaired: `:2101–2104` now reads "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2". The description still states no order for #1797, #1807 or #1854, which still own the comparison. Carried as R01.
- R02 — repaired: `:1172` reads "compare the Fourier-side bilinear pairing", and `:1181–1183` reads "separately to the angular-weight norms `〈ξ〉^s` below, with the pairing constant their frequency convention fixes". `grep -n course` matches only three URLs (`:2320`, `:2823`, `:2840`).

## Verified sound

**Gate.** The worker's run on `ec3dc78`: every check 0, `OK`. My re-run of the gate command gives the same counts (all 0, `OK`). My dependency check (`--movable`) printed exactly: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Neither ComplexKahlerGeometry nor AlgebraicTopology is in `ORDER.txt`; both are on main. The check does not see cycles between roadmaps on main, so I traced the edge the new sentence describes by hand. AT Stage 4.6's generic topology goes to K7.1. AT Stage 6 goes to K7.2's cup calculation, which `:2225–2226` says runs "without its Stage 7 Euler-characteristic theorem". K7.1–K7.2 go to AT Stage 7.4. There is no section-level cycle.

**Outside the folder and pins.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty. `lake-manifest.json` is identical to main's (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`) and unchanged since `5577d7d`.

**Lean.** `Suggested.lean` is byte-identical to `5577d7d`'s (`git diff --stat` is empty). `lake env lean` on it exits 0 in 16 s with 25 `declaration uses sorry` warnings and nothing else. `signatures.md` lists 35 entries. Two of them, `on` and `in`, are docstring words the tool misread. Its four "looks dropped" leads are `dolbeaultCocycles`, `dolbeaultCoboundaries` and `DolbeaultCohomology` without `[FiniteDimensional ℂ E]`, and `lefschetzMap`. Each is the intended signature; the theorems about them carry those binders. This is unchanged from the previous review's `#check @` comparison. Its padding probe (no theorem closes in one tactic) and its list of 25 stated headline theorems also stand, since nothing in the Lean file or the pins changed.

**Changed passage 1: K5a Euclidean duality (`:1172–1183`).** The deletion leaves both objects defined in place: `B_F` and `B₀` at `:1173–1174`, and the angular weight `〈ξ〉^s` at `:1258–1260`, which is below `:1181` as the new text says. The phrase "the pairing constant their frequency convention fixes" holds. The angular transform is the native one in the variable `ζ=ξ/(2π)` (`:1258–1259`): `f̂(ξ)=𝓕f(ξ/2π)=∫e^(−ix·ξ)f(x)dx`. With Lebesgue `dξ` this gives `B₀(f,g)=(2π)^(−n)∫f̂(ξ)ĝ(−ξ)dξ`, so the constant is `(2π)^(−n)`, against `1` natively. The values are in the table. Native normalisation at the pin: `Real.fourierChar_apply` (`Mathlib/Analysis/Complex/Circle.lean:232`, `𝐞 x = exp(2πix)`) and `VectorFourier.fourierIntegral` (`Mathlib/Analysis/Fourier/FourierTransform.lean:81`, kernel `e(−L v w)`). The space is `BesselPotentialSpace` (`Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47`).

**Changed passage 2: K7.1 ownership sentence (`:2101–2104`), against main (`623f5d6`).** In AlgebraicTopology `README.md:789–792`, Stage 4.6 owns the "generic quotient topology on native `Projectivization 𝕜 V`" and says "ComplexKahlerGeometry K7 consumes that topology". Nothing there owns a ℂPⁿ comparison, so clause 1 is right. At `:1593–1594`, Stage 7.4 says: "`chi(CP^n)=n+1`. The complex-projective check consumes ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure." The dependency table at `:2104` reads "7 Euler characteristic | 2--6 and ComplexKahlerGeometry K7 for CPⁿ". So clause 2 is right too. K7.2's transport sentence (`:2224–2225`, "Transport them to the `Projectivization` carrier through K7.1's comparison") is what the new sentence refers to.

Pinned declarations opened: Mathlib `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`) and Tau Ceti's copy (`TauCeti/Topology/Algebra/Projectivization.lean:90`), the clash `:2075` records. Also `TauCeti.ComplexProjectiveSpace.cwComplex` (`Topology/CWComplex/Classical/ComplexProjective.lean:419`), `cellMap` (`:271`), `finite_cwComplex` (`:445`), `nat_card_cell_cwComplex` (`:452`), and `TauCeti.eulerChar_complexProjectiveSpace` (`AlgebraicTopology/Cellular/EulerCharacteristic/ComplexProjective.lean:68`, proved from `cwComplex n`).

Remark: clause 2 is right on main, but no open AlgebraicTopology head keeps it. At #1652 (`946a78a`, `README.md:2943–2949`) and #1808 (`b71fe82`, `:2053–2056`), Stage 7.4 takes `χ(ℂPⁿ)=n+1` from the pinned `TauCeti.eulerChar_complexProjectiveSpace`. #1797, #1807 and #1854 use their own Stage 4.6 cells instead. Revisions are cited as they are on main, so this is not a finding. Whichever revision merges should update this clause.

**Cross-roadmap citations resolved this round.** Main AlgebraicTopology `:267–271`, `:789–792`, `:1593–1594`, `:2104`. At open heads, AlgebraicTopology at #1797, #1807, #1808, #1854, #1652 and #1187 (#1187 keeps main's text). ComplexKahlerGeometry at #1807 (`:2249–2251`) and #1854 (`:2262–2264`), which consume Stage 4.6's CW structure. The citation tool's single lead, `CompactFormPair.operatorDomainV` at `:1432`, is untouched text. The previous review resolved it to VariationalMethods §5.1 at #1028's head (false positive). `overlaps.md` reports no dropped or revision-only ids. Its three conflicting heads (#1807, #1808, #1854) are the ones the previous reviews settled as description-only, apart from the Stage 4.6 clause carried in R01.

**Seeded sample, where it falls in the changed passages.** For K5a, re-read in `hormann-steinbauer-distributions`: lines 3750–3761 (cache page 277 = printed p. 90; (4.7) `(∂₁⋯∂_n)^k E_k=δ` with `E_k∈C^(k−2)`; Theorem 4.22), 3763–3772 (cutoff, finite order `N`, `E_(N+2)`) and 1522–1526 (Theorem 1.70, point support). These support `:1048–1052` and `:1069–1070`. For K7.2, which carries the transport the sentence assigns, re-read in `demailly-agbook`: 13812–13813 ((15.10), `H•(Pⁿ,ℤ)=ℤ[h]/(h^(n+1))`, `h=c₁(O(1))`), 15486–15487 ((8.8), `H^(p,p)=ℂ` for `p≤n` and zero off the diagonal) and 14688–14694 ((4.4), `(i/2π)d′d″log`, `∫ω^n=1`). All support. The other sample targets (Parameter Cauchy–Green, K3.HolomorphicStalk, K3.MeromorphicGermField, K5a.DistributionLocalStructure, K5b, K5b.0, K5b.1, K6.0.PlanarHodge, K6.0.PlanarLaplacian, K6.1.RelativeIntegration, the Fubini–Study block, K7.2.TautologicalIncidence and K7.2.RationalQuartic) are in untouched text. The previous review verified them with source lines (its seeded-sample table), and their rows are carried below.

**Adversarial pass.** 5 new rows, computed this round for the changed statements, then 69 rows carried from the previous review (marked r75) for the statements the diff leaves untouched, re-read against the unchanged text.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| K5a `B_F(f,g)=B₀(f,Rg)` (`:1172–1175`, native normalisation) | `n=1`, `f=g=e^(−π(x−1)²)`; wrong model without `R` | `𝓕f(ζ)=e^(−2πiζ)e^(−πζ²)`, `B_F=∫e^(−4πiζ)e^(−2πζ²)dζ=e^(−2π)/√2`; `B₀(f,Rg)=∫e^(−π(2x²+2))dx=e^(−2π)/√2`; `B₀(f,g)=∫e^(−2π(x−1)²)dx=1/√2≠e^(−2π)/√2`, so the reflection is needed | Pass, r78 |
| K5a angular frequency (`:1258`, used at `:1181`) | `f=e^(−πx²)`; `f′` | `f̂(ξ)=𝓕f(ξ/2π)=e^(−ξ²/(4π))`; `𝓕(f′)(ζ)=2πiζ𝓕f(ζ)`, at `ζ=ξ/2π` this is `iξf̂(ξ)`, matching `σ_F(∂)=iξ` | Pass, r78 |
| K5a pairing constant of the angular-weight norms (`:1181–1183`) | `n=1`, `f=g=e^(−πx²)`, `s=0`; wrong constant `1` | `∫f̂(ξ)f̂(−ξ)dξ=∫e^(−ξ²/(2π))dξ=π√2`; `(2π)^(−1)π√2=1/√2=∫e^(−2πx²)dx=B₀(f,f)`; the duality bound `(2π)^(−1)‖f̂‖₂²=1/√2` is attained; constant `1` gives `π√2≈4.44`, so "the same C" would fail | Pass, r78 |
| K7.1 ownership sentence (`:2101–2104`) against main AlgebraicTopology | Stage 4.6 `:789–792`; Stage 7.4 `:1593–1594`; table `:2104`; cell count `n=0,2` | 4.6 owns only the generic `Projectivization 𝕜 V` topology; 7.4 consumes K7.1's model and K7.2's CW structure; `cwComplex`: `n=2` has cells in dimensions 0, 2, 4, so `χ=3=n+1`; `n=0` has one 0-cell, `χ=1`; the edges AT6→K7.2→AT7 are acyclic | Pass, r78 |
| K7.1 single ownership against open heads (R01) | `roadmaps grep --fixed --readme-only 'CW structure and characteristic maps along it'` | hits at #1797 `:1388`, #1807 `:1095`, #1854 `:1070`; none on main or at any other open head | Fail: R01 |
| `newlander_nirenberg` | `n=0`; `M=ℂ`, `J=i` | `E=0`: `M` discrete, `φ` constant, intertwining vacuous; `φ=id`, `dφ∘i=i∘dφ` | Pass, r75 |
| `dolbeault_grothendieck_polydisc` | `n=0`; `r₀≤0`; `n=1`, `p=q=0` | point: forms of degree ≥1 vanish, `ψ=0`; `ball c r₀=∅`; `φ=f dz̄` needs `∂̄u=f`, the whole-plane Cauchy–Green solution | Pass, r75 |
| `exists_mixed_parameter_dbar_solution` | `u=z̄`; `u=z`; `Q=∅` | `(Du(1)+i·Du(i))/2=(1+i(−i))/2=1=∂̄z̄`; `(1+i·i)/2=0`; vacuous | Pass, r75 |
| `weierstrass_preparation` | `f=w²−z`, `n=1`; `d=0` | `d=2`, `a₀=−z`, `a₁=0`, `u=1`; `u=f`, `f(0,0)≠0`, empty sum, polynomial `1` | Pass, r75 |
| `weierstrass_preparation_unique` | `f=w²−z` | `u′P′=P` forces `u′=1`, `a′=a` by uniqueness of division (3820–3823) | Pass, r75 |
| `weierstrass_division` | `g=w²−z`, `f=w³` | `w³=w·(w²−z)+zw`, `q=w`, `r=zw`, degree `1<2` | Pass, r75 |
| `ruckert_nullstellensatz` | `k=0`; `f₁=z²`, `g=z` | `g≡0` near `x`, `m=1`; `z²=1·z²`, `m=2` | Pass, r75 |
| `oka_coherence` | `f=(z₁,z₂)`; `k=0` | relations generated by `(z₂,−z₁)`, `m=1`; zero module, `m=0` | Pass, r75 |
| `cartan_coherence_reducedIdeal` | `f₁=z²` on ℂ; `(zw)²` on ℂ² | reduced ideal `(z)`, not `(z²)`; gradient of `(zw)²` vanishes on all of `V` | Pass, r75 |
| `riemann_extension` | `1/z`; `sin z/z`; `k=0` | unbounded, excluded by `hbdd`; extends by `1`; `A=U` forces `U=∅` | Pass, r75 |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | `spanFinrank 0=dim 0`; `𝔪=(z)`, dimension 1 | Pass, r75 |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z,w}` | `w²−z³` irreducible: roots `±z^(3/2)∉ℂ{z}` | Pass, r75 |
| `hartogs_extension_across_point` | dim 1; ℂ² | `1/z` excluded by `2≤finrank`; every holomorphic function on `ℂ²∖{0}` extends | Pass, r75 |
| `complexBesselSymbol(_temperate)` | `z=0,2,it`, real `s`, `‖ζ‖=2` | `1`; `1+‖ζ‖²`; modulus `exp(Re((it/2)log(…)))=1`; `(1+‖ζ‖²)^(s/2)`; wrong symbol `1+‖ζ‖` gives `3` not `5` | Pass, r75 |
| `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` | ℂ; ℂ×; `q=0` | `h dz` is ∂̄-closed of type `(1,0)`, excluded by the type projection; `dz̄/z̄=∂̄log|z|²`, class 0, while `∮dz̄/z̄=−2πi`; coboundaries `⊥`; `B⊆Z` by `∂̄²=0` | Pass, r75 |
| `finiteDimensional_dolbeaultCohomology` | `M=ℂ` | `H^(0,0)` = entire functions, infinite-dimensional: compactness needed and present | Pass, r75 |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf `S¹×S³` | `h^(0,0)=1=h^(1,1)`, `h^(1,0)=0=h^(0,1)`; `h^(0,1)=1=h^(2,1)`, `h^(1,0)=0=h^(1,2)` | Pass, r75 |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ`; `p+1>n` | `∫ω>0`, not exact, excluded by `hexact`; `α=0`, `γ=0` | Pass, r75 |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; `ℂ/Λ` `k=1`; `k>2n` | `1=0+1+0`; `2=1+1`; `0=0` | Pass, r75 |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(0,1)=1≠0=h^(1,0)`, not Kähler (`H²(M;ℝ)=0`) | Pass, r75 |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; annulus | `b₁=3`, `N_J≠0`; `b₁=1`, has boundary, excluded by `I.Boundaryless` | Pass, r75 |
| `lefschetzMap`, `hard_lefschetz` | `j=0`; ℂP² `k=0`; `S²×S²` | identity; `1↦[ω]²`, `∫ω²=1≠0`; `(aσ₁+bσ₂)²=2ab σ₁σ₂`, `σ₁²=0`; degree `k+2(n−k)=2n−k` | Pass, r75 |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0`; `n=1` | `(0,0)↦1`, `(1,1)↦0`; `(1,1)↦1`, `(1,0)↦0`, `(2,2)↦0` by `p≤n` | Pass, r75 |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=0`; `n=2` | `b₀=1`, `b₂=0`; `b₀=b₂=b₄=1`, odd and `b₆` zero, `χ=3=n+1` | Pass, r75 |
| `integralCupPow`, `integralCohomology_complexProjectiveSpace` | `n=0`; `S²∨S⁴`; `u=2g` | `H²(pt)=0` so `u=0`, `u⁰=1` generates `H⁰=ℤ`, all `j>0` vanish; `u²=0` fails `k=2`; `m↦2mg` not surjective, fails `k=1` | Pass, r75 |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `4=2·2`; `0=0`, `0=0` | Pass, r75 |
| `IsKahler`, `polydisc` | `(ℂ,dx∧dy,i)`; `r=−1`; `n=0` | `ω(v,iv)=|v|²>0`, closed, `N=0`; `ball=∅`; a point | Pass, r75 |
| K1 Checks | `z↦2z`, `z↦z̄`, `z↦iz`; `φ=z̄`, `z²`, `|z|²`; `G=v²−z`; `{w=z²}`, `{z²=w³}`, `{|z|=1}`; `∂_z` | `4`, `−1`, `1`; `φ_z̄=1`, `0`, `z`; `∂_vG(1,1)=2`, `F=√(z+w)`; `dw−2z dz≠0`, `2z dz−3w² dw=0` at 0, `J∂_y=−∂_x`; `J∂_z=i∂_z`, `(u+iJu)/2=∂_z̄` | Pass, r75 |
| K3 Checks: node and cusp | `t↦(t(t²−1),t²−1)`; `t↦(t³,t²)` | `z²=t²(t²−1)²=(t²−1)²(1+(t²−1))=w²+w³`; `t=±1↦0`; `t⁶=t⁶` | Pass, r75 |
| K3.MeromorphicGermField example | `e(z)=2z` | `1/z↦1/(2z)`, back along `w↦w/2`: `1/w`; `1+z↦1+2z`, value `1` | Pass, r75 |
| K4 Checks: Chern connection, frame change | `h=e^(−|z|²)`; `g=e^z`; `g=2` | `A=∂log h=−z̄ dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz`; `h′=4h`, `A′=A` | Pass, r75 |
| K4 Checks: monodromy | `d−a dz/z` | parallel sections `cz^a`, positive loop `e^(2πia)`; `a∈ℤ`: gauge `z^a` | Pass, r75 |
| K4.ComponentwiseFiniteRankAssembly | `ℂ⊔ℂ`, ranks 0 and 2; empty base | fibres `0` and `ℂ²`, no single `F`; zero objects | Pass, r75 |
| K4.P frame convention | `s=e_i s_i=e_j s_j`, `e_j=e_i g_ij` | `s_i=g_ij s_j`: `g_ij` carries `j`- to `i`-coordinates, as `:791` says | Pass, r75 |
| K4.P segment and `c₁` | point; ℂP¹; `ℂ/Λ` | `0→0→0→0→0`, `exp(2πi·):ℂ→ℂ×` onto with kernel ℤ (`exp` alone: `2πiℤ`); `c₁(O(±1))=±1`, inverse cocycle gives `∓1`; `H¹(𝒪)=ℂ`, `Pic⁰=ℂ/(ℤ+τℤ)≅Hom(Λ,U(1))`, `c₁` not injective | Pass, r75 |
| K4.P `F_M` | ℂP¹; `ℝP²`; `S¹`; `S²` | both sides ℤ, `O(1)↦+1`; `H¹(ℝP²;ℤ)=0` so the Bockstein is injective, `c₁(L_ℂ)=β(w₁)≠0`; `H¹(S¹;ℂ_const)=ℂ` versus acyclic `C⁰_ℂ`; `H¹(S²;ℤ/2)=0` misses `O(k)` | Pass, r75 |
| K4.P exactness route | chart ball | simply connected and locally path-connected, so the lifting lemma applies to `exp` onto `{z≠0}` | Pass, r75 |
| K5a.DistributionLocalStructure | `m=2,3`; `u=∂_zδ⊗1` | `D²t_+=δ`, `t_+²/2∈C¹`; `z·u=−δ⊗1=(−1)¹1!u_(1)` | Pass, r75 |
| K5a Checks: density, tests, Sobolev | `x↦−x`; `y=2x`; delta on `Sⁿ`, `S¹` | `|dx|` fixed, `dx` negated; `∫φdy=2∫φdx`; `∫(1+‖ζ‖²)^s dζ<∞` iff `s<−n/2`, `s<−1/2` on `S¹`, weight `(…)^(2s)` moves it to `s<−n/4` | Pass, r75 |
| K5a.ComponentwiseCompact | compact `M` with components `C`; empty `M` | components open, disjoint, cover: finite subcover contains each; zero spaces, empty eigenbasis | Pass, r75 |
| K5b.0 | `H=I` | `|dz|²=2`; `dz♯=2∂_z`; `∂̄*`: `(p,q)→(n−q,n−p)→(n−q+1,n−p)→(p,q−1)`; `σ(Δ_∂̄)=½σ(Δ_d)` | Pass, r75 |
| K5b Checks: volume, adjoint, stars | ℂ, ℂ²; `f dz̄`; `*dz` | `(i/2)dz∧dz̄=dx∧dy`, `ω²/2!=dx₁dy₁dx₂dy₂`; `Δ_∂̄g=−2∂_z∂_z̄g=−½Δ_flat g`, symbol `½|ξ|²`; `*dz=dy−i dx=−i dz` type `(1,0)`, `barStar dz∝dz̄` | Pass, r75 |
| K6.0 Checks | ℂP¹ scaled by `√π`; `H=diag(1+z₂+z̄₂,1)` | `H=(1+π|u|²)^(−2)`, `|H−1|≤2π|u|²`; `dω=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass, r75 |
| K6.0.PlanarHodge: star table | `α∧*β=⟨α,β⟩dx∧dy` | `dx∧*dx=dx∧dy` ⇒ `*dx=dy`; `dy∧(−dx)=dx∧dy` ⇒ `*dy=−dx`; `*1=dx∧dy`, `*(dx∧dy)=1`; `*dz=dy−i dx=−i dz`, `*dz̄=dy+i dx=i dz̄`; wrong model `*dx=−dy` gives `dx∧*dx=−dx∧dy` | Pass, r75 |
| K6.0.PlanarHodge: `δ=−*d*` | `α=P dx+Q dy`; `h dx∧dy`; `m=2` sign | `*α=P dy−Q dx`, `d*α=(P_x+Q_y)dx∧dy`, `δα=−(P_x+Q_y)`; `*h=h`, `*dh=h_x dy−h_y dx`, `δ(h dx∧dy)=h_y dx−h_x dy`; `(−1)^(2(k+1)+1)=−1` for every `k`, Tau Ceti's `(−1)^(m(k+2)+1)` on `(k+1)`-forms likewise | Pass, r75 |
| K6.0.PlanarHodge Checks | `x dx+y dy`; `x dy` | `δ=−(1+1)=−2`, `d=(0−0)dx∧dy=0`; `d=dx∧dy`, `δ=−(0+0)=0` | Pass, r75 |
| K6.0.PlanarLaplacian: degrees 0, 1, 2 | `u`; `P dx+Q dy`; `h dx∧dy` | `δdu=−(u_xx+u_yy)`, `dδu=0`; `dδα=−(P_xx+Q_xy)dx−(P_xy+Q_yy)dy`, `δdα=(Q_xy−P_yy)dx−(Q_xx−P_xy)dy`, sum `−(P_xx+P_yy)dx−(Q_xx+Q_yy)dy` using `P_xy=P_yx`; `dδ(h dx∧dy)=d(h_y dx−h_x dy)=−(h_xx+h_yy)dx∧dy` | Pass, r75 |
| K6.0.PlanarLaplacian: Wirtinger and Mathlib sign | `u`; `h=x²+y²`; `u=|x|³` | `4∂_z∂_z̄=∂_x²+∂_y²` so `Δ_H u=−4∂_z∂_z̄u`; Mathlib `Δh=D²h(1,1)+D²h(I,I)=2+2=4`, `Δ_H h=−4`, `δ(h dx∧dy)=2y dx−2x dy`; `u_xx=6|x|`, `u_yy=0`, `Δ_H u=−6|x|`, `u∈C²∖C³` since `u'''` jumps at `0` | Pass, r75 |
| K6.0.PlanarLaplacian: energy identity | compactly supported `u`; `α` | `∫ū Δ_H u=−∫ū Δu=∫|∇u|²≥0`; `⟨(dδ+δd)α,α⟩=‖δα‖²+‖dα‖²` by adjointness (`integralTopForm_inner_mextDeriv_eq_inner_codifferential`, one factor compactly supported); on ℂ `Δ_H=Δ_d=2Δ_∂̄`, `−4∂∂̄=2·(−2∂∂̄)` | Pass, r75 |
| K6.0.Planar: empty `U`; hypotheses | `U=∅`; `U` open in ℂ | `RoughForm` on the empty subtype is a singleton, every identity holds; `U` boundaryless, T2, σ-compact, as the adjointness theorem needs | Pass, r75 |
| K6.1 Checks | elliptic curve; Hopf; annulus; `S²×S²` | `2=1+1`; `b₁=1` odd; `b₁=1` with boundary; `σ₁²=0` | Pass, r75 |
| K6.1.RelativeIntegration (ii), cone | `d²`; `(ψdx,Ψ|_U)` on `[−1,1]`; `(dx,0)` | `(δδa,(δa)|_U−δ(a|_U)+δδb)=(0,0)`; `d(Ψ,0)=(ψdx,Ψ|_U)`, pairing `1−(1−0)=0`, the wrong sign gives `2`; `d(dx,0)=(0,dx|_U)≠0`, `(∫dx,0)([1,2])=1` | Pass, r75 |
| K6.1.RelativeIntegration (ii), pairing | `c=∂e+c_U`, cocycle `(a,b)` | `a(∂e)+a(c_U)−b(∂c_U)=(δa)(e)+(a|_U−δb)(c_U)=0` | Pass, r75 |
| K6.1.RelativeIntegration (iii) | `N=ℝ`, `K=[−1,1]`, `[−3,3]`; `S¹` | `∫ψ=1` both; `2π`, reversal negates both sides | Pass, r75 |
| K7.1 comparison (R01) | `v=(3,4)`, `2iv`; `(1,i)`; `n=1`, `(0,1)` | `(3/5,4/5)`, `i(3/5,4/5)`, chart `4/3`; chart `i` versus `−i` for the conjugate map; value `0` in the chart `v₁≠0` | Pass (ownership: R01), r75 |
| Fubini–Study | `w=(1,i)/√2`; `z=(1,0)`; `c=2`; `diag(1,2)`; `∫_(ℂP¹)` | `−w₁w̄₂/(r²π)=−(1/√2)(−i/√2)/(4π)=i/(8π)`; `H_z(v,v)=1/π`; `|c|⁴=16` cancels; `4/π`; `∫(1/π)(1+|w|²)^(−2)dλ=1` | Pass, r75 |
| K7.2 cohomology Checks | `n=0,1,2` | `u=0`, `u⁰=1`; `h^(2,2)(ℂP¹)=0`; `S²∨S⁴`; `Σ(−1)^k b_k=n+1` | Pass, r75 |
| K7.2.TautologicalIncidence | overlap; `d=2`, `k=1`; `k<0`; `exp(v₁)` | `a′=az_k`, `z′_i=1/z_k`; `(t·F)=t⁻¹F`; `F(v)=tF(tv)→0`; no homogeneity | Pass, r75 |
| K7.2.RationalQuartic | `n=1,2` | `(a,b,c,d)↦(a,b,0,c,d)`; pair sums of `{0,1,3,4}`: `0,1,2,3,4,5,6,7,8`; `10−9=1`, `x₀x₃−x₁x₂↦s⁴t⁴−s⁴t⁴=0` | Pass, r75 |
| Genus dictionary and normal form | `ℂ/(ℤ+τℤ)`; `[[0,2],[−2,0]]`; `[[1,0],[0,1]]` | cup matrix `[[0,1],[−1,0]]`, det `1`; det `4`, image of `ω(x,−)` is `2ℤ`; `ω(e₁,e₁)=1` not alternating | Pass, r75 |
| K7.FlatDegreeZero | `ρ=exp(aλ)`; square torus; holonomy | `u=α`, `v=αx−βy`, recovers `α+iβ`; `exp(πix)` gives `−1`, `1`; `(λ,v)~(0,ρ(λ)⁻¹v)` | Pass, r75 |
| K8.NilpotentCentralReduction | `H₃(ℝ)`, `H₃(ℂ)` | `log(1,1,1)=X+Y+½Z` (`(g−I)²=xyZ`), `exp(X+Y)` has `z=½∉ℤ`; `A=exp(ℝZ)`, `Γ∩A≅ℤ`, `G/A≅ℝ²`; `Γ∩A=ℤ[i]`, fibre `τ=i` | Pass, r75 |
| K8 Checks: Frölicher | Iwasawa; torus; Hopf | `3+2=5>4`; `d₁[φ₃]=−[φ₁∧φ₂]≠0` in `E₁^(2,0)`; `2n=b₁`; `0+1=1=b₁` and `1+1+1+1=4=Σb_k` | Pass, r75 |
| K8 adapter: reindexing | `(p,q)=(0,0),(1,0),(n,n)`; page `r′=r+1` | native `(p′,q′)=(2p+q+1,−p−1)`, total `p′+q′=p+q`; graded piece `F_(q′+1)/F_(q′)=G_(−p)/G_(−p−1)=F^p/F^(p+1)`, so `E₁^(p,q)=H^(p+q)(F^p/F^(p+1))=H^(p,q)_∂̄`; native `d_(r′)` has shape `(r′,1−r′)`: `(p′+r′,q′+1−r′)` is new `p=−q′−1+r′−1=p+r`, new `q=p′+r′−2(p+r)−1=q−r+1`; `(3,−2)→(5,−3)` is `E₁^(1,0)→E₁^(2,0)` | Pass, r75 |
| K8 adapter: finiteness and stable page | `a=−n−1`, `b=0`, `q′=−p−1` | `G_(−n−1)=F^(n+1)=0` (no type `(r,s)` with `r>n`), `G_0=F^0=A` (all `r≥0`); monotone since `F` decreases; conditions `q′−r′+2≤a` ⇔ `r′≥n−p+2`, `b≤q′+r′−1` ⇔ `r′≥p+2`, i.e. `r≥max(p,n−p)+1`; `n=0`: `E₁=E_∞`; `n=1`: `E₂=E_∞`; `n=3`: `p=0,3↦4`, `p=1,2↦3`, so `E₄=E_∞` everywhere | Pass, r75 |
| K8 adapter: `d₁` and the wrong filtration | Iwasawa `φ₃`; constant `c` | `∂̄φ₃=0`, `dφ₃=∂φ₃=−φ₁∧φ₂≠0`, connecting map of `F^p/F^(p+2)` lifts a `∂̄`-closed form and applies `d≡∂` mod `F^(p+2)`; `∂c=0`; filtering by the second index gives `d₁=∂̄`, which kills `[φ₃]` | Pass, r75 |
| K8 adapter: Hodge filtration and convergence | `k=0`; `p=k+1`; Kähler `k=1`, `p=1` | `F^0A=A`, `F^(k+1)A^k=0`; `E_∞^(p,q)=F^pH^(p+q)/F^(p+1)H^(p+q)` by `GradedOfFinite` with `pq.2+1=−p`, `pq.2=−p−1`; on a torus `F^1H^1=H^(1,0)`, dimension `g`, `E_∞^(1,0)=E₁^(1,0)` | Pass, r75 |
| K8 adapter: Frölicher inequality | torus `n=1`; Hopf; Iwasawa; Riemann surface genus `g` | `b₁=2=1+1`; `b₁=1=0+1`, `b₂=0=0+0+0`, `b₃=1=1+0`; `b₁=4<5`, `E_∞^(1,0)⊕E_∞^(0,1)` has dimension 4; `b₀=1=h^(0,0)`, `b₁=2g=g+g`, `b₂=1=h^(1,1)`, the candidates `∂:E₁^(0,0)→E₁^(1,0)` (zero on constants) and `∂:E₁^(0,1)→E₁^(1,1)` (forced zero by the equality), `E₁^(2,0)=0` as `p=2>1`, so `E₁=E₂=E_∞`; equality iff all `d_r=0` needs finite `h^(p,q)` (K5b) | Pass, r75 |
| K8 adapter: comparison theorem hypotheses | base dimension 0; general | both base-degree filtrations have `F_a=G_a=⊥`, `F_b=G_b=⊤` for the same `a≤b` (base degree between `0` and the base dimension), as `isIso_homologyMap_of_isIso_spectralSequence_page` requires; the inclusion of invariant forms is a `filtrationFunctorMap` since it preserves base degree | Pass, r75 |

That is 74 rows (5 new, 69 carried). None fails on the mathematics; R01's row fails on ownership.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorems 2.3.4–2.3.5: uncertified (settled), not opened. The second-edition numbering is assumed, as before.
- Griffiths–Harris ch. 0, Wells, Webster, Raghunathan and Bott–Tu: uncertified (settled), not opened. Their locators are in untouched text.
- The heads of #1797, #1807, #1808, #1854, #1652 and #1187 were read through `roadmaps show --pr` only (the brief gives a checkout for none of the first four), at the passages cited above.
- Ownership by object was checked for the two changed passages: the ℂPⁿ comparison (R01) and the Euclidean Bessel-pairing normalisation, which K5a owns as before. It was not checked against all 459 open pull requests.
- The adversarial rows check instances; they are not proofs.

## Source issues

- none
