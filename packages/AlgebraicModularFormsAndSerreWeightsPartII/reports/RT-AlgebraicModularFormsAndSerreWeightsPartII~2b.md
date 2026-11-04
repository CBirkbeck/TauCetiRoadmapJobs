<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1087#issuecomment-6635531676 -->
Red team round 2 pass b (claude) of bdd8ecc

Verdict: needs_changes

1. **F01** (P2) ShimuraCompactifications is cited by section labels that do not exist at its head

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:13` "ShimuraCompactifications §§C5.3 and C5.16"; :87 "§§C3.8–C3.9 … §§C5.3–C5.4, C5.10 and C5.12 … §C5.16 … C5.17 … C5.23"; :89 "(gap:siegel-parahoric-models)" under a section named "C5"; the same labels in the *Needs:* and Dependencies lines of §§1.1, 1.3, 1.4, 2.1–2.3, 3.5, 3.7, 4.1, 4.4, 7.1–7.3, 7.5, 8.1–8.2, 8.4–8.7, 9.4 (about 40 occurrences), and `design/plan.json` `gaps[0].section` = "C5".

   **Claim.** The cited targets are ShimuraCompactifications §§C3.8–C3.9, C5.3, C5.4, C5.10, C5.12, C5.16, C5.17, C5.23 and Layer "C5".

   **Witness.** ShimuraCompactifications at its open head f51ec79 (#1053) numbers its targets `k.n` and says so (its README: "Internal references `k.n` name target `n` of Layer `k`"); the strings `C5.3`, `C3.8` and the like occur nowhere in that README (its only `C`-labels are ComplexComparisonPartII's). The worker's citation resolver reports all nine labels as found nowhere (11 leads). The content cited does exist under other numbers: 7.3 `IntegralToroidalModel` (spherical integral models), 7.4 `formalCompletion` (formal cusp charts), 7.10 `strata_detect_geometricComponents`, 7.12 `logKodairaSpencer`, 7.16 `IntegralMinimalModel` with `O_{M^min}=π_*O_{M^tor}`, 7.17 `hodgeLine_ample`, 7.23 `siegel_koecher` with arbitrary `O`-modules, 4.9 `pushforward_boundaryIdeal`, 4.10 `cohomology_iso`. Unlike AutomorphicBundles, whose README carries an explicit letter-to-layer mapping ("B5.n = 12.(n+1)" etc.), ShimuraCompactifications carries none, so neither the intake nor a reviewer can map the declared gap "C5" or the nine citations to the supplier.

   **Repair.** Throughout the README and in `design/plan.json` `gaps[0].section`, replace: `C5.3`→`7.3`, `C5.4`→`7.4`, `C5.10`→`7.10`, `C5.12`→`7.12`, `C5.16`→`7.16`, `C5.17`→`7.17`, `C5.23`→`7.23`, `C3.8–C3.9`→`4.9–4.10`, `§C5 (gap:siegel-parahoric-models)`→`Layer 7 (gap:siegel-parahoric-models)`, and the contract heading sentence at :87 accordingly ("§§4.9–4.10 supply boundary-ideal pushforward and coherent-cohomology comparison under same-level refinements …; §§7.3–7.4, 7.10 and 7.12 supply …; §7.16 supplies the minimal model π with O_X*=π_*O_X; 7.17 … ; 7.23 …"). Tested on the instance that refuted the original: after the replacement every label resolves to a `### k.n` heading of the head f51ec79 whose statement is the one the README describes (checked for all nine).

2. **F02** (P3) The all-prime duality route defines its unit on the compactified special fiber, where G^D and LF are not defined

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:362` "On the special fiber of the spherical Siegel model, smooth and hence reduced, the composite of λ* and LF on (det ω_(G^D))^(p−1), for the universal principal polarization, is multiplication by a unit u."

   **Claim.** The composite is an endomorphism of a line bundle on the whole special fiber X₁ (by Conventions :19, X is the toroidal compactification and G its semiabelian family).

   **Witness.** At a boundary point G is semiabelian, G[p] is quasi-finite and not a BT₁, and neither the Cartier dual G^D nor the Fargues map LF of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.21 (defined for a BT₁ over an 𝔽_p-scheme) exists there; u is defined only over the abelian interior. Nothing in the conclusion needs the boundary: the specialization point E₁×E₂ is interior, and the interior ordinary locus is dense in the smooth interior.

   **Repair.** Replace the quoted sentence by: "On the abelian interior of the special fiber of the spherical Siegel model, which is smooth and hence reduced, the composite of λ* and LF on (det ω_(G^D))^(p−1), for the universal principal polarization of the abelian family, is multiplication by a unit u." In the same paragraph replace "hence u=1 everywhere" by "hence u=1 on the whole interior", and in the Check at :369 replace "on the whole special fiber" by "on the whole abelian interior". Instance: at a torus-rank-one boundary point the original sentence has no referent; the repaired sentence excludes it and still covers the interior point (E₁×E₂, tame level) used next.

3. **F03** (P3) Pinned locator of `Module.Basis.symmetricPower` is off

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:45` "`Module.Basis.symmetricPower` in TauCeti/LinearAlgebra/SymmetricPower/Basis.lean, line 167".

   **Claim.** The definition is at line 167.

   **Witness.** At the pinned Tau Ceti, line 162 of that file is `noncomputable def _root_.Module.Basis.symmetricPower : Basis (Sym κ n) R (Sym[R]^n M)`; line 167 is the last line of the docstring of the following theorem `Module.Basis.symmetricPower_apply`.

   **Repair.** Replace "line 167" by "line 162".

## Round-1 findings at this head

| Finding | Status | Witness at bdd8ecc |
|---|---|---|
| a/F01 (P2) descent exponent positive | repaired | `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:587` "for every positive integer N divisible by m·p^e"; API bullet at :596 "for every positive integer N′"; negative-control Check at :607 (N=0 gives the unit section, empty zero set). |
| a/F02 (P2) `standardSL2` admits p=0 | repaired | `Suggested.lean:90` `def standardSL2 (p : ℕ) [Fact p.Prime] (k : Type) [Field k] [CharP k p]`; README :1123 "For a prime p and a field k of characteristic p"; negative control at :1136 (p=0, k=ℚ, ZMod 0=ℤ, infinitely many unipotents). Body unchanged; the theorem at :97 supplies the instance. |
| a/F03 (P1) superspecial jet | repaired, recomputed independently | README :1157 states the x^(d−2)(det E)^(k+2) first-order coefficient (1−k)/D·(d(d−1)t₁₁F₀+2(d−1)t₁₂F₁+2t₂₂F₂), D=d(d+1); hypothesis at :1153 "k≢1 modulo p". I recomputed it from Y16 line 1277–1279 (the three connection formulas on δ_n), Y16 line 1013 (with B=I, h·c₁₁=t₂₂, h·c₁₂=h·c₂₁=−t₁₂, h·c₂₂=t₁₁ to first order, h∈m²) and the §8.1 contraction: the x^(d−2) coefficients of con_d(δ_m⊗g) are 4/N for (m,g)=(2,x²), −2(d−1)/N for (1,xy), 2d(d−1)/N for (0,y²), N=2d(d+1). Collecting: t₁₁F₀ gets 2d(d−1)(1−k)/N; t₁₂F₁ gets (d−1)(4−2(k₁+k)+2d)/N=4(d−1)(1−k)/N; t₂₂F₂ gets 4(d−k₁+1)/N=4(1−k)/N. All three agree with :1157. Checks at :1162–1167 recomputed: d=4,k=2 gives −12/20=−3/5; mod 11 the triple (−12/20,−6/20,−2/20) is (6,3,1) since 5⁻¹=9 and 10⁻¹=10; mod 7, −3/5≡5. §8.7 (:1218) now cites k=2≢1, no (6,2) exception. |
| a/F04 (P1) p=2 secondary duality | repaired differently; sound (see S02 for one wording defect) | README :360–370: at odd p FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.23 (its head 9856719 states `farguesLF_quasiPolarisation` for p>2 only, R07.2.23 line "Prove `farguesLF_quasiPolarisation` for `p > 2`"); at every p the composite LF∘λ* is a unit u on the smooth special fiber, u=1 on the dense ordinary locus (λ*Ha(G^D)=Ha(G), LF(Ha(G))=Ha(G^D), Ha(G^D) a generator), hence u=1, then specialize at (E₁×E₂)[p]; *Needs:* gained §2.2 and the spherical model; Checks at :369–370 (p=2 value; k[ε] negative control). The route mirrors P20 line 1368–1372 with density replacing the smooth-stack input. |
| a/F05 (P2) finiteness and fan | repaired | README :898 "with the fan of its source chosen equal to the fan Σ of the trace projection, Σ″=Σ as in P20 §14.9.2 … p₁ is proper and quasi-finite, hence finite … p₂ is proper, and no finiteness of it is asserted"; star-subdivision Check at :909; same fan condition in the §7.3 API bullet :946 and in gap:siegel-parahoric-models (README :89 and `design/plan.json` `gaps[0].needs`, identical text). P20 line 4747 (Σ=Σ″) and 4752 (p₁ finite, generically étale) support it. |
| a/F06 (P2) arbitrary-level coset degree absent | repaired | `Suggested.lean:71–82` `relIndex_conj_diag_eq_tameIndex_mul`; README :655 names it with the same hypotheses (p prime, p∤N, Γ(N)≤Γ̄) and the same two indices; N=1 and N=p Check at :678; contracts for `CongruenceSubgroup.Gamma`, `toGL`, `mapGL`, `unitOfCoprime`, `pointwiseMulAction`, `relIndex`, `diagGL` at :39 and :53. Truth and carriers checked below. |
| b/F01 (P3) absolute-irreducibility docstring | repaired | `Suggested.lean:94–96` "irreducible over `k`; since `k` is arbitrary, taking `k` algebraically closed gives absolute irreducibility". |

No repair introduced a mathematical error. One repair (a/F04) introduced the wording defect S02; the new theorem is correct as typed (table below).

## Verified sound

**Declarations read:** 3 of 3 (`relIndex_conj_diag_eq_tameIndex_mul`, `standardSL2`, `smallSymmetricPower_irreducible`), with their context: no section `variable`, no `include`, every binder explicit in the signature; `open Matrix`, `open scoped MatrixGroups Pointwise` (the `SL(2, ℤ)` notation and the `Subgroup.pointwiseMulAction` instance, which is scoped to `Pointwise` at Mathlib `Algebra/Group/Subgroup/Pointwise.lean:434`). Imports: `import Mathlib` plus three `TauCeti.*` modules that exist at the pin and are the three the README lists at :55. No `set_option`, no `lemma`, no `#eval`, no `True` placeholder, no sorry'd data (the one `def` has a real body). No Lean was run (the brief forbids it); the binder audit is by hand against the pinned sources, and the repair report's `#check @` output for the three declarations was compared with the README statements: equal generality in each case.

**Targets read:** 48 of 48, plus Conventions, the supplier contracts, Downstream consumers and Worked examples.

**Carriers of the new theorem at the pins.** `CongruenceSubgroup.Gamma N` is `SLMOD(N).ker` (`CongruenceSubgroups.lean:41`); `SpecialLinearGroup.map` (`SpecialLinearGroup.lean:225`), `toGL` (`GeneralLinearGroup/Defs.lean:273`), `mapGL S = toGL.comp (map (algebraMap R S))` (:317); `ZMod.unitOfCoprime {n} (x : ℕ) (h : Nat.Coprime x n) : (ZMod n)ˣ` (`ZMod/Basic.lean:794`), so `hpN : p.Coprime N` is the right hypothesis and `N = 0` is excluded (a prime is not coprime to 0); `TauCeti.diagGL : (ι → kˣ) →* GL ι k` with `ι` implicit (`Diagonal/Basic.lean:100`), so `(ι := Fin 2)` is well formed; `ConjAct G` acts on `G` by `g • h = g h g⁻¹` (`ConjAct.lean:130`) and on `Subgroup G` through `pointwiseMulAction` (`a • S = S.map (toMonoidEnd a)`, :425), so `toConjAct g • K = gKg⁻¹`; `Subgroup.relIndex H K` is the index of `H ⊓ K` in `K`, junk 0 at infinite index (`Index.lean:58–63`). Tau Ceti's own Hecke degree uses the same orientation, `(toConjAct g • H₂).relIndex H₁` (`HeckeRing/Basic.lean:902–908`).

**Truth of `relIndex_conj_diag_eq_tameIndex_mul` as typed.** Let g=diag(p,1). γ=[[a,b],[c,d]]∈Γ lies in gΓg⁻¹ iff g⁻¹γg=[[a,b/p],[pc,d]] lies in Γ, iff p∣b and red_N(g⁻¹γg)=g_N⁻¹red_N(γ)g_N∈H (Γ is the full preimage of H since Γ(N)≤Γ). Reduction SL₂(ℤ)→SL₂(ℤ/N)×SL₂(𝔽_p) is onto and sends Γ onto H×SL₂(𝔽_p) (its image contains {1}×SL₂(𝔽_p) because Γ(N)→SL₂(𝔽_p) is onto); Γ∩gΓg⁻¹ is the preimage of (H∩g_NHg_N⁻¹)×B⁻ with B⁻ the lower-triangular subgroup of index p+1. Hence [Γ:Γ∩gΓg⁻¹]=e(p+1), finite, so no `relIndex` junk value is reached; `mapGL ℚ` is injective on SL₂(ℤ) (`mapGL_injective`, FaithfulSMul ℤ ℚ), so the left side is this index. Instances: N=1 (ZMod 1 trivial, GL₂ trivial, right index 1, left index [SL₂(ℤ):Γ₀(p)]=p+1: 3 at p=2, 4 at p=3); Γ=SL₂(ℤ), any N: g_N normalises SL₂(ℤ/N), e=1; N=35, p=3, Γ=Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩: |Stab|=20, Stab⟨(1,1)⟩∩Stab⟨(3,1)⟩ is the split torus of order 4, e=5, left side 20; N=7, p=3, H=⟨[[0,−1],[1,−1]]⟩ of order 3: the conjugate of the generator by diag(3,1) is [[0,4],[5,6]] mod 7, outside H, so e=3 and the left side is 12; N=p is excluded by `Coprime`. The theorem is not in Tau Ceti: `HeckeRing/GL2/DiagonalCosetDegree.lean` has `degree_diagCoset_eq_Gamma0_index` (full level, `(Gamma0 N).index`) and the private `natDiagGL_conj_relIndex_eq_Gamma0_index`; the Γ₀/Γ₁ coset theorems at `Gamma0/Diagonal/PrimeCosets.lean:124` and `Gamma1/CoprimeCosets.lean:325` are decompositions, not an arbitrary-subgroup index. Not padding: no one-tactic route from these.

**Truth of `smallSymmetricPower_irreducible` as typed.** `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (`Irreducible.lean:29`): d=0 gives the rank-one trivial representation with lattice {⊥,⊤}, ⊥≠⊤; p=2,d=1: [[1,1],[0,1]] fixes only k·e₁, [[1,0],[1,1]] only k·e₂, no common line; p=3,d=2: binomials 1,2,1 nonzero, every monomial reached; d=p: ⟨x^p,y^p⟩ invariant, excluded by `hd`. `k : Type` is forced by `variable {R : Type}` in `TauCeti/RepresentationTheory/SymmetricPower.lean:37`.

**Adversarial pass (README targets; values on both sides).**

| Target | Instances tried | Values | Result |
|---|---|---|---|
| 1.1 | j=k; j=k+1; M=0; chart t=0 over O/ϖ² | ranks 1,2; H⁰=0; t·(O/ϖ²)[t]→(O/ϖ²)[t] injective, quotient O/ϖ² flat | consistent; exact sequence 0→H⁰/ϖ^m→H⁰(E₀/ϖ^m)→H¹[ϖ^m]→0 from O-flatness of ω⊗I_D |
| 1.2 | Q=x²+y², p=3; M=diag(2,1); diag(1,−1); T=[[1,1],[0,1]] | Δ=−4≡2, (2/3)=−1 vs det=1, (1/3)=1; 2x²+y²/2, Δ=−4; −x²−y²; T·x²=x², T•x²=(x−y)², (Tᵗ)⁻¹•x²=x² (Tau Ceti `eval_smul`: γ•f=f∘γ⁻¹) | consistent; M·Q=Q∘Mᵗ=(Mᵗ)⁻¹•Q |
| 1.3 | (1,−1,1); m=n=1; m=n=N | qζ⁻¹q′, Δ=−3; r∈{−2..2}; lower bound −2N | consistent |
| 1.4 | X₁⊔X₂, (0,1); constants ϖ, 1/ϖ; M=0 | expansions (0,1); ϖ∈ϖH⁰, 1/ϖ excluded; all 0 | consistent (conditional on AutomorphicBundles 12.16) |
| 2.1 | μ_p²⊕(ℤ/p)²; I_(1,1)²; torus rank 1 + supersingular E | ranks 2,0,1 | consistent |
| 2.2 | p=3 | dims 1,2,3 (P20 line 1536 prints 3−r: source misprint); 10 superspecial points; E-degrees −1,3; λ degree 2=p−1 (CG20 line 2444, 2477) | consistent |
| 2.3 | pairing ⟨e₁,e₄⟩=⟨e₂,e₃⟩=1, Fe₂=−pe₃, Fe₃=e₂ | ⟨Fe₂,Fe₃⟩=⟨−pe₃,e₂⟩=p=pσ⟨e₂,e₃⟩; ker(F mod p)=⟨e₁,e₂⟩; quotient F on (e₃,e₄): columns (−Y,−Z),(0,1), det −Y; ⟨f₁,f₂⟩=Z−X | consistent |
| 2.4 | p=5 | h weight 4, Θh=det(0)·1=0 | consistent |
| 3.1 | p=3; I_(1,1) | weight 8; height 4→3; for local-local height 2 the map V*: D/ω→ω is an isomorphism (ker V=im F=ω) | consistent |
| 3.2 | p=2 (E₁×E₂)[2]; k[ε] | u=1 on ordinary locus; 1+ε≠1 over k[ε] | sound on the interior; S02 for wording |
| 3.3/3.4 | V*=[[0,1],[0,t]] | ord V_H*=ord W=1, ord Z=0; A valuation (p+1)−(p−1)=2 | consistent |
| 3.5 | R/(a,y,x+bc); R/(x,y+ac) | k[b,c] (P20 line 1623); k[a,b,c] with branches a=0,b=0 (P20 line 1647–1648) | consistent |
| 3.6 | k[a,b,c]/(ab) | a²,b² glue to a²+b²; 1 and 0 do not | consistent |
| 3.7 | p=3; p=5, c=2,4 | weights 4, 8; p=2: 3/2; t↦ct, b₀↦c^((p−1)/2)b₀=(c/p)b₀: 2²=4=−1, 4²=1; h′↦c^(p−1)=1; ord h′=2·ord V_H*=2, ord b₀=1 | consistent |
| 3.8 | [p] on μ_(p^∞); id; L=μ_p⊕(ℤ/p)² (degree p³) | s=1, p⁻¹·p=1; s=0; L+G^m[p]=G[p] so quotient kernel is full p-torsion; mixed Lagrangian μ_p⊕ℤ/p: L+G^m[p]≠G[p], hypothesis fails as it should | consistent with HodgeTate 0.12 Checks |
| 4.1/4.2 | p=2,n=2; p=3,n=2; ϖ²=3 | 8∈4ℤ; 63∈9ℤ; (1+ϖ)³−1=2ϖ³+ϖ⁴, order 3 | consistent |
| 4.3 | p=3,m=2,r=1,s=3 | t=6; (1+ϖ)(1−ϖ)≡1 mod ϖ² | consistent |
| 4.4 | N=0; N>0; k₀[t²,t³]⊂k₀[t]; S* fibers | unit section vs V(h′); t∉, t^p∈; π⁻¹(S*)=S so fibers of π|_S are fibers of π, geometrically connected; Stacks line 5246–5247 gives per-element p-powers, uniform on finitely many module generators in characteristic p | consistent |
| 5.1 | d=1, diag(p,1); K/O; d=0 orbit indicator | px,y; 1/p+O killed by p; nonconstant regular function excluded on a proper connected model | consistent |
| 5.2 | see the theorem rows; adj(M)≡v uᵗ | adj Q adjᵗ≡Q(u)·v vᵗ, integral iff Q(u)≡0; diag(p,1)→[1:0], x²↦x²/p; diag(1,p)→[0:1], x²↦px² | consistent |
| 5.3 | p=3 constants | U,V:1; Z,Z₂:4; level 35: 20; UV=1, VU kills primitive indices | consistent |
| 5.4 | p=3: x²+y², 3(x²+y²), x² | (X₂,U₂)=(−1,−4),(3,8),(0,−1); mod 3 (2,2),(0,2),(0,2) | consistent |
| 5.5 | M=diag(3,1), Q=x²+y² | x²+9y², Δ=−36≡0 | consistent |
| 5.6 | S scalar; (3,3), p=3; (2,2) | S=p^(j+k−6) (CG20 line 2513; similitude p² to power −3 times p^(j+k)); (−1,3,1,27); S=1/9 | consistent |
| 5.7 | general | (pT₂+(p+p³)S)p^(2−k)=p^(j−3)(U₂+1)+Z₂+p^(j+k−3)V₂+p^(j−1)=p^(j−2)X₂+…; (2,2): (1,1,3,3); (3,3): (3,1,27,9) | consistent with CG20 line 2516–2521 |
| 6.1 | Γ(5), p=3, M=[[3,5],[30,51]] | det 3; adj e₁=(51,−30); (1/3)(51x−30y)²=3(17x−10y)²≡2x² mod 5; second step 4x² | consistent |
| 6.2 | p=3: x²+y², x², xy, 0 | 0,1,2,4; level 35: ×5 | consistent with CAC 1.17 and CG20 line 2805–2815 |
| 6.3 | M=diag(3,1); d=1 | adj=diag(1,3), product 3I acts trivially on forms, ρ₁(3I)=0 mod 3 | consistent |
| 7.1 | ordinary p=3; superspecial | kernels 1+4+1=6 vs degree 40; ℙ¹(k) of α_p-lines at rank 0 | consistent; P20 line 4747–4752 |
| 7.2/7.3 | (d,r)=(0,2),(1,3); r=1 | orders (4,3,3),(7,4,3); mixed 2<3; normalised 3,1,1 at p=3 | consistent; P20 Lemma 7.1.1 condition d+2r≥2+r (line 1721) |
| 7.4 | k[x,y] | punctured-plane sections k[x,y]; 1/(xy)≠0 in H²; depth 2 on CM thickenings | consistent |
| 7.5 | (2,2),(3,3), p=3 | C_r−Q₂=p^(3−k)(p+p³)p^(j+k−6)=(1+p²)p^(j−2): 10, 30; residues 1,0 | consistent; P20 line 1721, 1785 |
| 7.6/7.7 | p=3 (2,2), level 35; (3,3)→(5,5) | X₂=3,Z₂=4, Q₂≡1; UZ_Δ=20≡2; Z₂≡1 both weights; T≡U at k≥3 | consistent |
| 8.1 | d=2; highest-weight tensor; p=5, d=3,4 | con₂(x²⊗y²)=4/12=1/3; numerator 2d(d−1)+4(d−1)+4=2d(d+1); 24≡4 unit, 40≡0 | consistent |
| 8.2 | p=7: x²+y², x² | det 1 vs Δ≡3; 1/3≡5 | consistent; CG20 Prop. 8.9 at line 2403 has p−2>d, the README's d=p−2 rests on Y16 Remark 3.13 for r=p−2 only |
| 8.3 | d=p+1 | x^p y−xy^p vanishes on 𝔽_p² | consistent |
| 8.4 | see F03 row; C=[[1,1],[0,1]]; p=3, C=[[0,i],[i,0]]; ℤ/2 | CCᵗ=[[2,1],[1,1]]; C^(3)Cᵗ=I, det 1; Lang image of size 1 | consistent; K75 line 1684–1687 gives the condition F(C)=C^(−t) |
| 8.5 | p=5 (−1,−1),(0,0); p=7 | pa−b=−4; 0; m₀=24, steps 144 and 36; Krull needs the proper ideal, propagation needs Z_red to meet every component of S (ample descended power) | consistent |
| 8.6 | p=5, k=2..6; k=p+1 | permitted {2,6}; 24<26; Θ(hG)=hΘG since h has expansion 1, reduces to weight 2 | consistent; CG20 Thm 8.10 (line 2426) omits k≠p−1 |
| 8.7 | p=7; p=11, j=6; p=5 | degrees 26,33<50; (−4,−8), −36; empty range; after b₀: pj−2−(p−1)m₀<0 | consistent; CG20 line 2449 range p−1>j≥4 |
| 9.1 | p=3, d=2, r=1 | 48 and 4; diag(2,1)↦8, reversed 2 | consistent; P20 Hecke indexing T_(ℓ,2)=diag(ℓ,ℓ,1,1), T_(ℓ,1)=diag(ℓ²,ℓ,ℓ,1) at line 907 |
| 9.2/9.3 | f=1; f=1/3; x³y−xy³ at (1,3) | 1 on 48 frames; 1/3 not integral; −24≠0 | consistent |
| 9.4 | ordinary point, p=2,3,5; level 35 | #L=p·p³=p⁴ (lines H′⊄H₁^⊥: p³; z choices per H′: (p²−p)/(p−1)=p); normalized trace p⁴/p³=p: 2,3,5 vs Z₂(1)=3,4,6; 3,4,20→0,1,2 mod 3 | consistent with P20 line 2622, 2765–2774 |

**Locators verified:** 66 windows re-read at the cited lines (P20: 27; CG20: 14; Y16: 12; K75: 2; T06: 4; P12: 3; B15: 3; Stacks: 1), each supporting the claim it is cited for; the repaired passages' new locators (Y16 line 1013, 1277–1279, 2126, 2140; P20 line 4738–4752; K75 line 1676–1700) are exact. **Pinned library locators:** 22 line numbers checked at Mathlib 6b7abb3 and Tau Ceti a91d3aa; 21 exact (`Matrix.det` 63, `det_mul` 141, `legendreSym` 109, `SpecialLinearGroup.map` 225, `IsIrreducible` 29, `castHom` 331, `Gamma` 41, `toGL` 273, `mapGL` 317, `unitOfCoprime` 794, `pointwiseMulAction` 425, `relIndex` 62, `iInf_pow_smul_eq_bot_of_isLocalRing` 425, `Representation.symmetricPower` 47, `stdSLRep` 44, `BinaryQuadraticForm` 94, `.discrim` 146, the `MulAction SL(2,R)` instance 194, `discrim_smul` 203, `degree_diagCoset_prime_pow` 54, the Γ₁ and Γ₀ theorems 325 and 124, `diagGL` 100), one off (S03).

**Sibling citations checked (resolved now, at the heads the roadmap service shows):** AutomorphicBundles #1069 fd74684: B2.1=3.1, B3.2=5.3, B3.3=5.2, B3.4=5.4, B3.10=5.10, B4.19=11.19, B4.20=11.20, B5.10=12.11 (geometric Hecke operators), B5.11=12.12 (convolution), B5.14=12.15 (vector Fourier–Jacobi), B5.15=12.16 (expansion principle), B5.19=12.20 (Hecke on Fourier–Jacobi coefficients), through the mapping note that README states for consumers; each resolved statement is the one cited. ShimuraCompactifications #1053 f51ec79: S01. HodgeTateAndCanonicalSubgroups #1084 d6aad63: 0.12 (normalized multiplicative determinant pullback, with the [p] on μ_(p^∞) Check), 0.14–0.16, 5.1–5.2 (Hilbert `(𝒪_F/p^m)^×`-torsors, as the README says). FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 9856719: R07.2.2, R07.2.21 (LF:(det ω_G)^(p−1)≅(det ω_(G^D))^(p−1), LF(Ha(G))=Ha(G^D)), R07.2.22, R07.2.23 (`farguesLF_quasiPolarisation` for p>2). AbelianSchemesAndArithmeticModuli #849 bb1d12a: A4.3, A4.7, A4.9, A4.10, A4.11. ReductiveGroupsPartII #785: RG2.3.7 with `Lang.lang_surjective` (the resolver's "found nowhere" lead for this name is a false positive: it is the supplier's proposed name, not a pinned declaration). AdelicAlgebraicGroups #792: 4.5. AlgebraicModularFormsAndSerreWeights #928: R15.1–R15.6 through its stated identifier note. On main: SchemeAndStackFoundations 0.6, 2.5, 2.6, 2.7, 2.19, 2.20, 4.9; ClassicalArithmeticCompletion 1.17; ModularForms Layer 2; AlgebraicVectorBundles L0A–L0C. OverconvergentAutomorphicForms #1422 Layers 5–6 (ownership only). All suppliers precede this roadmap in `merge-order/ORDER.txt` (line 276; latest supplier HodgeTateAndCanonicalSubgroups at 234).

**Dependency check** (unedited README, `--movable`):

```
depcheck: 207 roadmaps, 1779 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Declared gaps.** The eight slugs of `design/plan.json` `gaps` are the eight `What <Supplier> must provide (gap:<slug>)` lines of the README with identical `needs` text (the siegel-parahoric-models text now carries the fan condition in both). Each names a supplier and a section; the sections exist at the heads except for the label defect S01 (section "C5" of siegel-parahoric-models). None asks for what the pins or an earlier roadmap provide (ShimuraCompactifications 6.16–6.17 compactify Pilloni's Klingen correspondence over ℚ_p only, so the integral parahoric request stands). Not raised.

**Ownership.** `roadmaps grep` over main and all 444 open heads: Lean-only `relIndex` hits are KleinianGroups, ProfiniteProPGroups and AdelicAlgebraicGroups, none a diagonal-coset index at arbitrary tame level; no hit for `standardSL2`, `smallSymmetricPower`, `tameIndex`, or a symmetric-power irreducibility theorem; README-only "tame index" has no hit. Tau Ceti's Hecke-degree files state the full-level and Γ₀ degrees only. No declaration of `Suggested.lean` carries the fully qualified name of a declaration in a readable roadmap.

**Policy.** `git diff --stat origin/main...HEAD`: 10 files, all under `packages/AlgebraicModularFormsAndSerreWeightsPartII/`. No `lemma`, no `set_option`, no pull-request number, no process narrative in README or Lean (the only "Lemma" strings are source citations). Every target has a locator. The three backticked own names in the README are exactly the three declarations; the module docstring names the unstatable headlines with their missing carriers and matches the README summary.

**Checks tested:** 63 (the table), all consistent with their section's formulas and with the other Checks on the same object.

## Not verifiable

- Fresh elaboration of `Suggested.lean` and the mechanical `#check @` binder audit: forbidden here; the worker's signature extraction failed (object-file error unrelated to this package), so the repair report's quoted `#check` output and the pinned sources were compared by hand.
- §2.2's splitting E|_C≅O(−1)⊕O(p) and the p²+1 superspecial points per component: CG20 line 2443–2444 and 2477 assert them without reference; not derivable here.
- §3.5's étale-local identification with the Iwahori strata and §7.1's finiteness over the rank-one locus: consistent with P20 line 1616–1649 and 4752, not checkable without the moduli construction.
- §3.7's ord_C(V_H*)=ord_C(V_L*)=1 at generic points of Z_red (hence ord h′=2): asserted by P20 Remark 6.4.1 (line 1652–1654) without proof; the README owns it; not independently derivable here.
- §9.4's identification with p^(3−r)U_(Kli(p),1): consistent with P20 line 2616–2617; the compactified trace is not checkable without the tower.
- K75's displayed singularity equations (lines 1724, 1727–1728 are missing from the extraction); the prose supports the cited use.
- The P20 journal revision was not compared; all P20 locators are to the author version.

## Source issues

- **Misprint** in P20 at §6.4, printed p. 35 (line 1536): the source says the rank-r strata have dimension 3−r; it should be r+1 (ordinary locus of dimension 3); affects a stated result.
- **Error** in CG20 at Theorem 8.10, printed p. 61 (line 2426–2429): the source says p+1≥k and p∤k(2k−1) suffice for scalar theta injectivity; it should also exclude k=p−1, where the nonzero Hasse invariant has zero theta; affects a stated result.
- **Misprint** in Y16 at proof of Theorem 4.7, printed p. 38 (line 2066): the source says the lower-right first-order Hasse–Witt entry is b₂₂; it should be t₂₂, as in the determinant displayed next; affects the proof.
- **Error** in Y16 at (4.5) and proof of Theorem 4.9, printed p. 39 (line 2124–2140): the source says the first-order coefficients are −(k₁−3k₂)/2, −(k₁−3k₂)/2 and −(k₁−3) on t₁₁F₀, t₁₂F₁, t₂₂F₂; recomputing from (3.35) with the adjugate connection and the second transvectant gives (1−k₂)(d(d−1), 2(d−1), 2)/(d(d+1)) up to one unit, and the displayed reference vector δ₀⊗ω₁²−½δ₁⊗ω₁ω₂+δ₂⊗ω₂² is not the highest-weight vector of the contraction; affects the proof.
- **Gap** in P20 at proof of Lemma 14.8.2, printed p. 101 (line 4612–4616): the source says powers of the second Hasse invariant lift to sections of the ample sheaf on the minimal compactification; the second Hasse invariant is defined on the toroidal model and its descent to the minimal model is not justified; it should descend a p-power first (Stacks Tag 0CNF); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bdd8ecc73e8217e9b429c6a27d9fb53977220a28", "job": "RT-AlgebraicModularFormsAndSerreWeightsPartII~2b", "model": "fable", "worker": "chris-x9"} -->
