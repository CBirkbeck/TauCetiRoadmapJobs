# Review of ComplexKahlerGeometry (pull request #1234 at d5ab208)

**Verdict:** needs changes

Incremental re-review of the 5 lines changed since `ec3dc78` (one commit, `README.md` only, K7.1 `:2101–2105`). The change is right about the transported cells but overclaims about the comparison, and that is a new P3 (R02). R01 is not repaired: this round did not touch the description, and the three AlgebraicTopology heads still claim the comparison.

## R01 (P2) — The ℂPⁿ model comparison still has a second owner at three open AlgebraicTopology heads, and no order is stated

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2101–2103`, "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2". Also the pull-request description, whose merge-order lines name only #1186 and #1398.

Claim: the folder side is unchanged and correct. The description side is still missing. All three heads have moved since the last review, and at each of them AlgebraicTopology Stage 4 item 6 still owns the homeomorphism between the sphere-quotient model and `Projectivization ℂ (Fin (n+1) → ℂ)` and the transport of `cwComplex` and its characteristic maps along it, and says that ComplexKahlerGeometry K7 consumes them. #1807 and #1854 also rewrite this roadmap's K7 to consume Stage 4.6's CW structure. #1797 does not touch this folder, so no textual conflict stops it from merging after this pull request and leaving two owners on main.

Witness: `roadmaps grep --fixed --readme-only 'CW structure and characteristic maps along it'` finds AlgebraicTopology `:1388` at #1797 (`ad233ac`), `:1095` at #1807 (`5d047eb`) and `:1077` at #1854 (`200e4f3`), and none on main. At #1807 `:2249` and #1854 `:2262`, K7 consumes Stage 4.6's CW structure.

Repair (description only, as before): add this to the merge-order paragraph: "#1797, #1807 and #1854 rebase on this pull request. Each replaces its AlgebraicTopology Stage 4 item 6 clause 'Own the homeomorphism of that carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` … along it' with a citation of ComplexKahlerGeometry K7.1 (the comparison) and K7.2 (the transported cells). #1807 and #1854 also drop their ComplexKahlerGeometry K7 hunks." Test: the description carries the sentence. After the rebases, the grep above finds no AlgebraicTopology head. A repair job that cannot edit the description leaves this to whoever can.

## R02 (P3) — "needs neither the comparison" is false on K7.1's own carrier

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2103–2105`, "The value χ(ℂPⁿ)=n+1 needs neither the comparison nor the transported cells: `TauCeti.eulerChar_complexProjectiveSpace` proves it on the sphere-quotient model that carries `cwComplex`."

Claim: the sentence is right about the transported cells. It is also right about the comparison on the sphere-quotient model. But K7.1 (`:2050`) makes `Projectivization ℂ (Fin (n+1) → ℂ)` "the single carrier". The consumer whose clause the change deleted is main AlgebraicTopology Stage 7.4 (`:1593–1594`), and it states χ on "K7.1's projective model". On that carrier, `eulerChar` cannot even be stated without the comparison, because `FiniteCWType` is missing. The comparison alone then gives `n+1`.

Witness: in a scratch probe, `#check TauCeti.eulerChar (Projectivization ℂ (Fin 3 → ℂ))` fails with "failed to synthesize `TauCeti.FiniteCWType (Projectivization ℂ (Fin 3 → ℂ))`". Given `e : Projectivization ℂ (Fin (n+1) → ℂ) ≃ₜ TauCeti.ComplexProjectiveSpace n`, `Homeomorph.eulerChar_eq e` and `eulerChar_complexProjectiveSpace` give `n + 1`.

Repair: replace the sentence with "On the sphere-quotient model the value χ(ℂPⁿ)=n+1 is pinned (`TauCeti.eulerChar_complexProjectiveSpace`). On `Projectivization ℂ (Fin (n+1) → ℂ)` it follows from the comparison alone, through `Homeomorph.finiteCWType` and `Homeomorph.eulerChar_eq`, without the transported cells." Tested on the probe: both pinned names exist (`TauCeti/Topology/CWComplex/Classical/FiniteCWType.lean:98`, `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:163`), and the proof `haveI := e.finiteCWType; rw [Homeomorph.eulerChar_eq e, TauCeti.eulerChar_complexProjectiveSpace]` elaborates with exit code 0.

## Previous findings

- R01 — not repaired: `:2101–2103` still reads "This roadmap is the single owner of that comparison". The description names only #1186 and #1398. #1797 `:1388`, #1807 `:1095` and #1854 `:1077` still own it. Carried as R01.

## Verified sound

**Gate.** The worker's run on `d5ab208` shows every check 0, including `build=0`, and `OK`. I re-ran the gate command, and every scanner and the dependency check came back 0 and `OK`. My dependency check (`--movable`) printed exactly `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Neither ComplexKahlerGeometry nor AlgebraicTopology is in `ORDER.txt`; both are on main. I traced the edges by hand. The changed sentence names no new supplier. AlgebraicTopology Stage 6 goes to K7.2's cup calculation, which `:2227` says runs "without its Stage 7 Euler-characteristic theorem". K7.1–K7.2 go to main AlgebraicTopology Stage 7.4. There is no section-level cycle.

**Outside the folder and pins.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty. `lake-manifest.json` is identical to main's (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

**Lean.** `Suggested.lean` is byte-identical to `ec3dc78`'s. `lake env lean` on it exits 0 in 14 s, with 25 `declaration uses sorry` warnings and nothing else. `signatures.md` lists the same four "looks dropped" leads as before: `dolbeaultCocycles`, `dolbeaultCoboundaries` and `DolbeaultCohomology` without `[FiniteDimensional ℂ E]`, and `lefschetzMap`. Each is the intended signature, as the previous `#check @` comparison showed, and the theorems carry the binders. The padding probe and the 25 stated headlines stand unchanged.

**The changed sentence, against the pin.** I opened these declarations:
- `TauCeti.eulerChar_complexProjectiveSpace` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/ComplexProjective.lean:68`). `#check` gives `∀ n, eulerChar (TauCeti.ComplexProjectiveSpace n) = ↑n + 1`, proved from `cwComplex n` through `cwEulerChar_cwComplex` (`:40`).
- The carrier `TauCeti.ComplexProjectiveSpace` (`TauCeti/Topology/ComplexProjectiveSpace/Basic.lean:58`) is the orbit quotient of the unit sphere of `EuclideanSpace ℂ (Fin (n+1))` by the unit scalars, so "the sphere-quotient model" is exact.
- `cwComplex : CWComplex (univ : Set (ComplexProjectiveSpace n))` (`TauCeti/Topology/CWComplex/Classical/ComplexProjective.lean:419`), with `finite_cwComplex` (`:445`), `nat_card_cell_cwComplex` (`:452`) and `finiteCWType` (`:468`).
- `eulerChar` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`) is defined through some finite CW complex homotopy equivalent to the space. `eulerChar_eq_finsum_finrank_singularHomology` (`:133`) makes it the alternating sum of singular Betti numbers over any division ring, so the χ in the sentence is the topological invariant, not a cell count of one structure.
- `FiniteCWType` (`TauCeti/Topology/CWComplex/Classical/FiniteCWType.lean:74`) has no instance on `Projectivization`. That is R02.

**The changed sentence, against main (`1bea835`) and the open heads.** On main, AlgebraicTopology `:789–792` (Stage 4.6) owns "generic quotient topology on native `Projectivization 𝕜 V`" and nothing about ℂPⁿ, so the first clause of `:2101–2103` holds. `:1593–1594` (Stage 7.4) and the table at `:2104` still consume K7.1 and K7.2. This roadmap still supplies both: K7.1's comparison at `:2092–2100` and K7.2's transport at `:2225–2226`. So deleting the "consumes" clause breaks no edge on main. #1652 (`946a78a`, `:2949`) and #1808 (`dd06ad1`, AlgebraicTopology `:2055`) take `χ(ℂPⁿ)=n+1` from the pinned theorem on the pinned model, which agrees with the new sentence. #1807 (`:2246`) and #1854 (`:2206`) consume their own Stage 4.6 cells (R01). Within the folder, `:2225` ("with Euler characteristic n+1 (`eulerChar_complexProjectiveSpace`)"), `:2227` and the Check at `:2270–2271` agree with the new text.

**Overlaps and citations.** `overlaps.md` reports no dropped id and no revision-only id. Its three conflicting heads (#1807, #1808, #1854) are the ones earlier reviews settled as description-only, apart from the Stage 4.6 clause carried in R01. At #1808, ComplexKahlerGeometry itself owns the comparison (`:2303–2319` of its README), so it has a single owner there. The citation tool's single lead, `CompactFormPair.operatorDomainV` at `:1432`, is in untouched text. An earlier review resolved it to VariationalMethods §5.1.

**Seeded sample, where it falls in the changed passage.** K7.1 carries no source locator. Its claims are the pinned declarations above, each opened at the pin. K7.2, whose transport the sentence assigns, rests on `demailly-agbook` line 13812–13813 ((15.10), `H•(Pⁿ,ℤ)=ℤ[h]/(h^(n+1))` with `h=c₁(O(1))`), which I re-read and which supports `:2228–2231`. The other sample targets (Parameter Cauchy–Green, K3.MeromorphicGermField, K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b, K5b.0, K6.0.PlanarHodge, the Fubini–Study block, K7.2.TautologicalIncidence, K7.FlatDegreeZero, K8.NilpotentCentralReduction) are in untouched text. Earlier reviews verified them, and their rows are carried below. The README flags no locator as unverified.

**Adversarial pass.** The table has 7 new rows, computed this round for the changed sentence and R01. They are followed by 72 rows carried unchanged from the previous report (marked r75 or r78) for the statements the diff leaves untouched. The previous report's two rows on the K7.1 ownership sentence are replaced by the new rows.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| χ(ℂPⁿ)=n+1 on the sphere-quotient model (`:2103–2105`) | `n=0,1,2`; wrong model "cell count of one structure" | probe `example : eulerChar (ComplexProjectiveSpace 2) = 3` and `… 0) = 1` elaborate; `nat_card_cell_cwComplex`: `n=1` cells in dims 0, 2, `χ=2=χ(S²)=1+(−1)²`; `n=2`: `b₀=b₂=b₄=1` over ℚ, `χ=3`; `eulerChar_eq_finsum_finrank_singularHomology` makes χ the Betti sum, so it is not a cell count | Pass, r80 |
| Same sentence on K7.1's carrier `Projectivization ℂ (Fin (n+1) → ℂ)` | `n=2`; with and without comparison `e` | without `e`: `#check eulerChar (Projectivization ℂ (Fin 3 → ℂ))` fails, no `FiniteCWType`; with `e`: `Homeomorph.finiteCWType e`, `Homeomorph.eulerChar_eq e` give `n+1`, exit 0; transported cells unused | Fail: R02, r80 |
| "Stage 4.6 supplies only the generic quotient topology" (`:2102–2103`) | main AlgebraicTopology `1bea835` | `:789–792` owns the quotient topology on `Projectivization 𝕜 V` for any division ring, with no ℂPⁿ comparison and no complex cells | Pass, r80 |
| Deleted "AlgebraicTopology Stage 7 consumes" clause, against main | AlgebraicTopology `:1593–1594`, table `:2104`; ComplexKahlerGeometry `:2092–2100`, `:2225–2227` | main 7.4 consumes K7.1's model and K7.2's CW structure; both still supplied here; edges AT6→K7.2 cup, K7.1/K7.2→AT7.4 acyclic; depcheck `0 problem(s)` | Pass, r80 |
| Agreement inside K7.2 (`:2225`, Check `:2270–2271`) | `n=0,2` | `Σ(−1)^k b_k`: `n=0` gives `1`; `n=2` gives `1−0+1−0+1=3=n+1`; matches `eulerChar_complexProjectiveSpace` | Pass, r80 |
| New sentence against open AlgebraicTopology heads | #1652, #1808, #1807, #1854 | #1652 `:2949` and #1808 `:2055` take χ from `TauCeti.eulerChar_complexProjectiveSpace` on the pinned model, as the sentence says; #1807 `:2246`, #1854 `:2206` consume their Stage 4.6 cells | Pass (ownership: R01), r80 |
| K7.1 single ownership against open heads (R01) | `roadmaps grep --fixed --readme-only 'CW structure and characteristic maps along it'` | hits at #1797 `ad233ac` `:1388`, #1807 `5d047eb` `:1095`, #1854 `200e4f3` `:1077`; none on main | Fail: R01, r80 |
| K5a `B_F(f,g)=B₀(f,Rg)` (`:1172–1175`, native normalisation) | `n=1`, `f=g=e^(−π(x−1)²)`; wrong model without `R` | `𝓕f(ζ)=e^(−2πiζ)e^(−πζ²)`, `B_F=∫e^(−4πiζ)e^(−2πζ²)dζ=e^(−2π)/√2`; `B₀(f,Rg)=∫e^(−π(2x²+2))dx=e^(−2π)/√2`; `B₀(f,g)=∫e^(−2π(x−1)²)dx=1/√2≠e^(−2π)/√2`, so the reflection is needed | Pass, r78 |
| K5a angular frequency (`:1258`, used at `:1181`) | `f=e^(−πx²)`; `f′` | `f̂(ξ)=𝓕f(ξ/2π)=e^(−ξ²/(4π))`; `𝓕(f′)(ζ)=2πiζ𝓕f(ζ)`, at `ζ=ξ/2π` this is `iξf̂(ξ)`, matching `σ_F(∂)=iξ` | Pass, r78 |
| K5a pairing constant of the angular-weight norms (`:1181–1183`) | `n=1`, `f=g=e^(−πx²)`, `s=0`; wrong constant `1` | `∫f̂(ξ)f̂(−ξ)dξ=∫e^(−ξ²/(2π))dξ=π√2`; `(2π)^(−1)π√2=1/√2=∫e^(−2πx²)dx=B₀(f,f)`; the duality bound `(2π)^(−1)‖f̂‖₂²=1/√2` is attained; constant `1` gives `π√2≈4.44`, so "the same C" would fail | Pass, r78 |
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

That is 79 rows: 7 new and 72 carried. Two fail: R01's row on ownership, and R02's row on the scope of the new sentence. None of the carried rows fails on the mathematics.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Griffiths–Harris ch. 0, Wells, Webster, Raghunathan and Bott–Tu are uncertified (settled) and were not opened. Their locators are in untouched text.
- The heads of #1797, #1807, #1808 and #1854 were read only through `roadmaps show --pr` (the brief gives a checkout for none of them), at the passages cited above. #1652 was read in its checkout.
- Ownership by object was checked only for the changed passage: the ℂPⁿ comparison, the transported cells and the Euler characteristic value. It was not checked against all 456 open pull requests.
- The adversarial rows check instances; they are not proofs.

## Source issues

- none
