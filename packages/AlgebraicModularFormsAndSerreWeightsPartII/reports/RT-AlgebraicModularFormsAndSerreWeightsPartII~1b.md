<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1087#issuecomment-6414888487 -->
Red team round 1 pass b (claude) of 1ef45f0

Verdict: accepted

1. **F01** (P3) Docstring claims absolute irreducibility; the statement is irreducibility over the parameter field

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean:63-64`, docstring of `smallSymmetricPower_irreducible`: "Symmetric powers through degree p-1 of the natural SL2(Fp) representation are absolutely irreducible in characteristic p."

   **Claim.** The declaration states `Representation.IsIrreducible ((standardSL2 p k).symmetricPower d)` for one field `k` of characteristic `p`; at the pin `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (Mathlib/RepresentationTheory/Irreducible.lean line 29), irreducibility over `k`, not over `k̄`.

   **Witness.** The instance `k = 𝔽_p` of the theorem asserts irreducibility over `𝔽_p` only; absolute irreducibility is recovered only by also instantiating the theorem at `k̄`. The README (§8.3, line 1110) states it correctly as "for a field k in Type of characteristic p ... is irreducible". The statement is true as typed (for every such `k`), so this is a docstring overclaim, not a mathematical defect.

   **Repair.** Replace the docstring by: "For every field `k` of characteristic `p` and `0 ≤ d ≤ p − 1`, the `d`-th symmetric power of the standard representation of `SL₂(𝔽_p)` on `k²` is irreducible over `k` (hence absolutely irreducible, the field being arbitrary)."

Checkout confirmed at head 1ef45f0 (the pull request's current head). No pass-a report exists on the pull request or in `packages/AlgebraicModularFormsAndSerreWeightsPartII/reports/` at this head (the last comment is the accepting review of 1ef45f0), so there are no pass-a findings to confirm or reject. No repair report marks a finding `not actionable in this package`.

## Verified sound

**Declarations read:** 2 of 2 (`standardSL2`, `smallSymmetricPower_irreducible`), with their section/variable context (no section variables; every binder is explicit: `p`, `[Fact p.Prime]` on the theorem only, `k : Type`, `[Field k]`, `[CharP k p]`, `d`, `hd : d ≤ p - 1`). No Lean was run (the brief forbids builds here); the signature was checked by hand against the pinned declarations: `TauCeti.stdSLRep k 2 : Representation k (SL(Fin 2) k) (Fin 2 → k)` (Restriction.lean line 44, `k : Type u`, `[CommRing k]`), `Matrix.SpecialLinearGroup.map (f : R →+* S) : SL n R →* SL n S` (line 225), `ZMod.castHom (h : m ∣ n) R [Ring R] [CharP R m]` (line 331), and `Representation.symmetricPower` with `variable {R : Type}` (SymmetricPower.lean lines 37–47), which is the reason the file keeps `k : Type`; the module docstring says so correctly. `MonoidHom.comp` types the composite. `d ≤ p − 1` is natural subtraction, harmless since `p ≥ 2`.

**Truth of the Lean statement.** `d = 0`: `Sym⁰` is the rank-one trivial representation, whose subrepresentation lattice is `{⊥, ⊤}` with `⊥ ≠ ⊤` (k is a field), so `IsSimpleOrder` holds. `p = 2, d = 1`: the natural representation of `SL₂(𝔽₂) ≅ S₃` on `k²`; `[[1,1],[0,1]]` fixes only the line `k·e₁` and `[[1,0],[1,1]]` only `k·e₂`, so no invariant line exists. `p = 3, d = 2`: binomials 1,2,1 nonzero, the unipotent-interpolation argument of §8.3 reaches all monomials. `d = p` would fail (`x^p, y^p` span an invariant subspace), and `hd` excludes it. Over a non-algebraically-closed `k` the statement is still true: `Sym^d(k²)` for `d ≤ p − 1` is the restriction of the restricted simple module `L(d)` of `SL₂`, irreducible for `SL₂(𝔽_p)` over any field of characteristic `p`.

**Headlines and padding.** Headline theorems listed from the README: integral expansion principle (§1.4), simple primary Hasse zeros (§2.3), secondary Hasse extension and spherical root (§§3.6–3.7), torsion weight shifts and the two-affine cover (§§4.3–4.4), integral residual coefficients and corrected Q₂ (§§5.6–5.7), oriented reciprocity (§6.3), integral T and Q₂ with Hasse equivariance (§§7.6–7.7), theta nonvanishing and low-weight injectivity (§§8.4, 8.6, 8.7), small symmetric powers (§8.3), saturated ordinary expansions and the Klingen comparison (§§9.2–9.4). Only §8.3 is statable at the pins (every other one needs the integral Siegel models, automorphic sheaves, BT₁ crystals, Igusa towers or formal correspondences, none of which exist in Mathlib or Tau Ceti at the pins; I grepped Tau Ceti for `Siegel`, `Igusa`, `Hasse` carriers and found only the elliptic/BT₁-free material). The module docstring names each non-statable headline with the missing carrier. `standardSL2` is the one definition the headline needs, with a real body on native carriers. No padding: no API restatement, boundary case, Check mirror or value computation is in the file.

**Duplication by object.** Tau Ceti at a91d3aa has no irreducibility theorem for symmetric powers of `SL₂` in characteristic `p` (only `Symmetric/Standard.lean:326` for the symmetric group's standard representation and the Specht material). Across main and every open roadmap pull request (`roadmaps grep`, Lean-only, for `symmetricPower`, `IsIrreducible`, `stdSLRep`, `standardSL2`): the only `SL`-related hit is `ClassicalGroups` (#1192) `Suggested.lean:756`, `restrict_specialLinear_irreducible`, which is over `ℂ` for rational representations, a different theorem. README-level object grep for the secondary Hasse invariant, genus-two theta operators, the corrected `Q₂` and the Klingen correspondence found no other owner. Ownership against open pull requests was checked by these greps (the tool covers all 367 open roadmap pull requests at their heads).

**Targets read:** 48 of 48 (every `### x.y` of Layers 1–9), plus Conventions, supplier contracts, Downstream consumers and Worked examples. **Locators verified:** 78 source windows read at the cited line numbers in the cached extractions (P20: 36; CG20: 20; Y16: 10; K75: 2; T06: 4; P12: 3; B15: 3; Stacks: 1), all supporting the claim cited (details in the table). **Pinned library locators:** 17 of 17 line numbers exact at mathlib 6b7abb3 and TauCeti a91d3aa (`Matrix.det` 63, `det_mul` 141, `legendreSym` 109, `SpecialLinearGroup.map` 225, `Representation.IsIrreducible` 29, `ZMod.castHom` 331, `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` 425 with its `[IsNoetherianRing] [IsLocalRing] [Module.Finite] (I ≠ ⊤)` hypotheses as the README states; `Representation.symmetricPower` 47, `Module.Basis.symmetricPower` 167, `stdSLRep` 44, `BinaryQuadraticForm` 94, `.discrim` 146, the `MulAction SL(2,R)` instance 194 with `eval_smul` giving `γ • f = f ∘ γ⁻¹`, `discrim_smul` 203, `degree_diagCoset_prime_pow` 54, the Γ₁ and Γ₀ prime-coset theorems 325 and 124). **Sibling citations checked:** 56 section citations resolved at the suppliers' current heads (AutomorphicBundles #1069: B2.1, B3.2–B3.4, B3.10, B4.19–B4.20, B5.10–B5.11, B5.14–B5.15, B5.19; ShimuraCompactifications #1053: C3.8–C3.9, C5.3, C5.4, C5.10, C5.12, C5.16, C5.17, C5.23; HodgeTateAndCanonicalSubgroups #1084: 0.12, 0.14–0.16, 5.1–5.2, which are indeed Hilbert `(𝒪_F/p^m)^×`-torsors as the README says; FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: R07.2.2, R07.2.21–R07.2.23, where R07.2.23 carries `farguesLF_quasiPolarisation` for `p > 2`; AbelianSchemesAndArithmeticModuli #849: A4.3, A4.7, A4.9, A4.10–A4.11; ReductiveGroupsPartII #785: RG2.3.7 `Lang.lang_surjective` with the smooth, geometrically connected, finite-type hypotheses and the `ℤ/2` counterexample the README's Check mirrors; AdelicAlgebraicGroups #792: 4.5; AlgebraicModularFormsAndSerreWeights #928: R15.1–R15.6; main: SchemeAndStackFoundations 0.6, 2.5, 2.6, 2.7, 2.19, 2.20, 4.9; AlgebraicVectorBundles L0A–L0C; ModularForms Layer 2; ClassicalArithmeticCompletion 1.17, whose statement (p odd, nonzero form, count 1 + (d/p), zero form separately) is exactly what §6.2 imports). All suppliers precede this roadmap in `merge-order/ORDER.txt` (line 276); OverconvergentAutomorphicForms (line 237) is named only as an owner, never as a `*Needs:*`.

**Dependency check** (run from the job's scratch directory, unedited README):

```
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Declared gaps.** The eight slugs in `design/plan.json` `gaps` are the eight `What <Supplier> must provide (gap:<slug>)` lines of the README (siegel-parahoric-models, siegel-rank-one-deformations, siegel-isogeny-trace-ideals, siegel-logarithmic-de-rham, open-formal-milnor, lci-fundamental-class, reduced-section-propagation, siegel-igusa-full-frames), each with a named supplier and section that exists at the supplier's head; none asks for what the pins or an earlier roadmap already provide (the Hilbert Igusa torsor of HodgeTate 5.1–5.2 is not the genus-two `GL₂` tower; the Siegel Koecher C5.23 and spherical models C5.3 are imported, the parahoric models are not there). Not raised as findings.

**Policy.** `git diff --stat origin/main...HEAD` touches only the package folder. No `lemma`, no `set_option`, no pull-request numbers, no process words in README or Lean; `theorem` throughout; every target carries a source locator (§6.2's is in its prose); both Lean names occur in the README and the README's only backticked own names are those two; imports are `import Mathlib` plus the two `TauCeti.*` modules that exist at the pin and are the ones the README lists (line 51); one module docstring in the required form; `namespace TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII`; a `/-! ## Layer 8 -/` section comment. `sources.toml` has one key per work, no local paths, all eight entries `certified`.

**Checks tested:** 61 README Checks and worked examples recomputed (table below); every one agreed with its section's formulas and with the other Checks on the same object.

### Adversarial pass table

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Lean `smallSymmetricPower_irreducible` | d=0; p=2,d=1; p=3,d=2; d=p (excluded) | lattice {⊥,⊤}, ⊥≠⊤; no common eigenline of U,L; monomials all reached; ⟨x^p,y^p⟩ invariant at d=p | true as typed; `hd` excludes the failing case |
| `standardSL2` p=3 Checks | U=[[1,1],[0,1]], L=[[1,0],[1,1]] | U·L=[[2,1],[1,1]]; (UL)x=2x+y, (UL)y=x+y; L first then U gives the same | consistent, g₂ acts first |
| `standardSL2` p=2,k=𝔽₄ | image order | 6 inside 60 | consistent |
| §1.2 Δ, M·Q | Q=x²+y², p=3; M=diag(2,1); M=diag(1,−1); T=[[1,1],[0,1]] | Δ=−4≡2, (2/3)=−1 vs det=1, (1/3)=1; diag(2,1): 2x²+y²/2, Δ=−4; diag(1,−1): −x²−y²; T·x²=x², T•x²=(x−y)², (Tᵗ)⁻¹•x²=x² (Tau Ceti `eval_smul`) | consistent |
| §1.3 index set | m=n=1; m=n=N | r∈{−2,…,2}; lower bound −2N | consistent |
| §2.2 dimensions, P¹ data | p=3 | strata dims 1,2,3; p²+1=10; degrees −1,3; λ degree 2 | consistent; CG20 line 2443–2444, 2477 |
| §2.3 Dieudonné chart | pairing ⟨e₁,e₄⟩=⟨e₂,e₃⟩=1, F e₂=−p e₃, F e₃=e₂ | ⟨Fe₂,Fe₃⟩=⟨−pe₃,e₂⟩=p=pσ⟨e₂,e₃⟩; unsigned basis gives −p; quotient Frobenius on (e₃,e₄) mod ω: columns (−Y,−Z),(0,1), det −Y; Lagrangian ⟨f₁,f₂⟩=Z−X ⇒ X=Z | consistent with P20 lines 1548–1590 |
| §2.4 Θh=0 | p=5 | h weight 4, Θ coefficient det(Q)·1 at Q=0 is 0 | consistent |
| §3.1 weights | p=3 | (p−1)(p+1)=8; heights 4→3 | consistent |
| §3.3/3.4 orders | V*=[[0,1],[0,t]] over k[[t]] | ord V_H*=ord W=1, ord Z=0; A valuation (p+1)−(p−1)=2; t⁻¹ fails, t passes | consistent |
| §3.5 local model | R/(a,y,x+bc); R/(x,y+ac) | both relations vanish; k[b,c] dim 2; k[a,b,c] dim 3, ab=0 dim 2; (1,0),(0,1) rank-one, (1,1) fails | matches P20 lines 1623, 1646–1648 |
| §3.6 gluing | k[a,b,c]/(ab) | a²,b² glue to a²+b²; 1 and 0 do not | consistent |
| §3.7 root | p=3; p=5, c=2 and 4 | weights 4 and 8; p=2 gives 3/2; Ha(G^m)^2 weight 4, t weight 4, b₀ weight 4=m₀; swapped exponents 2 and 8; t↦2t, b₀↦2²=4=−1=(2/5), h′↦2⁴=1; c=4: 4²=1 | consistent; polarization dependence excludes the h′-only model |
| §3.8 normalized pullback | [p] on μ_{p^∞}, μ_{p^∞}² | s=1: p⁻¹·p=1; s=2: p⁻²·p²=1; differential 0 | consistent with HodgeTate 0.12 |
| §4.2 congruence | p=2,n=2; p=3,n=2; ϖ²=3,m=2 | 3²−1=8, 4|8; 4³−1=63, 9|63; (1+ϖ)³−1=3ϖ+3ϖ²+ϖ³, order 3≥2; binomial step raises order by ≥1 | consistent |
| §4.3 shift | p=3,m=2,r=1,s=3 | t=rs(p−1)=6; (1+ϖ)(1−ϖ)≡1 mod ϖ² | consistent |
| §4.4 cover | p=3; k₀[t²,t³] | weights (p−1)N(p+1)=8N; t∉k₀[t²,t³], t^p∈ | consistent; Stacks 0CNF line 5242–5247 |
| §5.2 coset index | Γ̄=SL₂(ℤ),p=3; Γ(5); Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩; Γ(5)∩red₇⁻¹⟨[[0,−1],[1,−1]]⟩ | e=1, degree 4; Borel order 20, torus 4, e=5, 24/6=4, degree 20; order-3 element, conjugate by diag(3,1) is [[0,4],[5,6]]∉H, e=3, degree 12, residues 0,1 | consistent |
| §5.2 admissible counts | p=3: Q=0,x²,x²+y²; p=2 | zeros on ℙ¹(𝔽₃): 4,1,0 (−1 nonsquare); ℙ¹(𝔽₂): 3,1,1 ([1:1] kills x²+y²) | consistent |
| §5.2 integrality map | adj(M)≡u vᵗ mod p | adj Q adjᵗ ≡ Q(v)·u uᵗ; integral iff Q(v)≡0; column space of adj(M)ᵗγ⁻ᵗ unchanged | consistent |
| §5.3 Z formula, d=0 | M⁻¹=diag(p,1); M⁻¹=[[1,a],[0,p]] | (pn,r,m/p); ((n+ar+a²m)/p, r+2am, pm) | matches CG20 line 2345 |
| §5.3 constants | p=3 | U,V: 1; Z,Z₂: 4; level-35 literal: 20 | consistent |
| §5.4 X₂,U₂ | p=3: x²+y², 3(x²+y²), x² | (−1,−4),(3,8),(0,−1); mod 3: (2,2),(0,2),(0,2) | consistent |
| §5.5 relations | Z₂X₂; UX₂; M=diag(3,1),Q=x²+y² | det R=p² det Q ⇒ Δ(R)≡0; ε(pQ)=p≡0; x²+9y², Δ=−36≡0 | consistent |
| §5.6 T₂ at (3,3), S at (2,2) | p=3 | −1+pX₂+Z₂+p³V₂: (−1,3,1,27); S=p^{−2}=1/9 | matches CG20 lines 2306–2308, 2513 |
| §5.7 Q₂ cancellation | general; (2,2); (3,3), p=3 | (pT₂+(p+p³)S)p^{2−k}=p^{j−3}U₂+Z₂+p^{j+k−3}V₂+p^{j−3}+p^{j−1}, U₂+1=pX₂ ⇒ p^{j−2}X₂+Z₂+p^{j+k−3}V₂+p^{j−1}; tuples (1,1,3,3),(3,1,27,9); mod 3 (1,1,0,0),(0,1,0,0) | consistent; CG20 lines 2501–2521 |
| §6.1 neighbors | Γ(5),p=3,Q=x²; p=5 full level | 1/3≡2 mod 5 ⇒ 2x², then 4x²; worked M=[[3,5],[30,51]]: adj e₁=(51,−30), (1/3)(51x−30y)²=3(17x−10y)², coefficients (2,0,0) mod 5; x²+y² roots [2:1],[3:1] (4+1≡0, 9+1≡0) | consistent |
| §6.2 counts | p=3: x²+y², x², xy; zero form; level-35 | 0,1,2 with (−1,0,1); 4; 20,5,0 / 4,1,0; xy: 10/2 | consistent; CAC 1.17 |
| §6.3 reciprocity | M=diag(3,1); d=1, p=3 | adj=diag(1,3), product 3I acts trivially; ρ₁(3I)=3≡0; reverse (1/p)MQMᵗ sends 2x²↦6x²≡x² mod 5 | consistent |
| §7.1 kernels | ordinary, p=3 | 1+(p+1)+1=6; (p+1)(p²+1)=40 | consistent |
| §7.2 orders | d=0,r=2; d=1,r=3; r=1 | (4,0),(2,1),(0,3); (7,0),(3,1),(0,3); mixed 1+1=2<3 | consistent |
| §7.3 normalization | p=3,d=0,r=2 | 3⁴/3³=3, 3²·3/3³=1, 3³/3³=1 | consistent |
| §7.4 Hartogs | k[x,y] | punctured-plane sections k[x,y]; line: k[t,t⁻¹]⊋k[t]; 1/(xy)≠0 in H²_{(x,y)} | consistent |
| §7.5 C_r−Q₂ | general; p=3 | p^{3−k}S(p+p³)=(1+p²)p^{j−2}; 10 and 30, residues 1,0 | consistent; P20 1721/1785 orders r+2 and 1 |
| §7.6/7.7 residues | p=3, (2,2), level-35 | X₂=3,Z₂=4 ⇒ Q₂≡1; UZ_Δ=20≡2; (3,3) T₂≡Z₂−1, Q₂≡Z₂ | consistent |
| §8.1 con_d | d=2: x²⊗y²; highest-weight tensor; p=5,d=3,4 | 4/12=1/3; 4+4+4=12, /12=1; 24≡4 unit, 40≡0 | consistent |
| §8.2 Θ,θ₁ | p=7: Q=x²+y², x² | det 1 vs Δ=−4≡3; 1/3≡5 | consistent |
| §8.3 orbit/value | d=p+1 | x^p y−x y^p vanishes on 𝔽_p²; degree-d form has ≤d<p+1 zeros | consistent |
| §8.4 frames | C=[[1,1],[0,1]]; p=3, C=[[0,i],[i,0]]; (Cᵗ)⁻¹=JCJ⁻¹; B_L=g⁻¹ | CCᵗ=[[2,1],[1,1]]≠I; C^(3)=[[0,−i],[−i,0]], product I, det 1; [[d,−c],[−b,a]] both sides; F(g)=gJ⁻¹ ⇒ F′(g⁻¹A₀g)=g⁻¹F(A₀)g; JA₀J⁻¹=[[1,0],[−1,1]]; ℤ/2 Lang image one element | consistent; direction of conjugation correct |
| §8.4 scalar/vector constants | p=7,k=2; p=11,(6,2) | k(2k−1)=6; 6·9⁻¹=6·4=24≡3; j−3k=0, j−3=3, coefficient −3 | consistent with Y16 line 2140 |
| §8.5 degrees | p=5,(−1,−1),(0,0),(1,2); p=7 | pa−b=−4; max degree 0; a≥b fails; m₀=24, (p−1)m₀=144, (p−1)²=36; max summand degree p(a−b)+(p−1)b=pa−b from O(−1)⊕O(p) | consistent |
| §8.6 weights | p=5: k=2..6 | 5∤6, 5|15, k=4 Hasse, 5|5, 5∤66 ⇒ {2,6}; 24<26; k=p+1 leaves weight 2 | consistent; CG20 line 2446 |
| §8.7 range | p=7; p=11,j=6; p=5 | j∈{4,5}, degrees 26,33<50; (−4,−8), pa−b=−36; interval empty | matches CG20 Thm 8.11 (p−1>j≥4) |
| §9.1 characters | p=3,d=2,r=1 | |GL₂(𝔽₃)|=48, diagonal 4; diag(2,1)↦2²·2=8, reversed 2 | consistent |
| §9.3 frames | x³y−xy³ at (1,3) | 3−27=−24≠0, zero on all of 𝔽₃² | consistent |
| §9.4 trace | p=3,5,2 | p·p³/p³=p: 3,5,2 vs Z₂(1)=4,6,3; d=1,r=1: p²x,py then px,y | consistent with P20 lines 2765–2774 |
| Lean vs README generality | §8.3 vs declaration | both: field in Type, characteristic p, prime p, 0≤d≤p−1 | equal |

### Source locators verified (by claim)

P20: §4.1 p.16 (673); §5.1.3 (900–910, T_{p,i} double cosets); Thm 6.1.5.1(3)–(4) (1286–1292); §6.2.1 (1307); Lemma 6.3.1.1 (1338); Ha′ definition and LF (1358–1366); diagram (1434–1438); A⊗B extends Ha′² (1477); §6.3.4 (1481); rank strata (1528–1534); rank-one Dieudonné chart and X=Z (1548–1590); Lemma 6.4.2 (1609); Iwahori rings (1614–1649); Remark 6.4.1 (1652–1655); isogeny chain (1700–1705); Lemmas 7.1.1–7.1.2 (1721, 1785); §8.2 (2421–2425); §10.1 definition and t₁,t₂ (2616–2650); C₁, C₂, composite (2668–2750); Lemmas 10.3.2–10.3.4 (2760–2841); §10.4 (2842); §11.2 (3228–3233); §13.3.1 (4094–4099); Lemma 14.8.2 (4603–4617); Lemma 14.9.1 proof (4690–4694); Lemma 14.9.2 (4712); §14.9.2 (4738–4782). CG20: p.21 (877); §5.5 (1315); §6 (1406); lift A and Lemma 6.2 (1436–1442); p.49 (1906); §8 (2188); §8.3 (2266); Lemmas 8.3–8.4 (2273–2316); Z₂=UZ and Definition 8.5 (2344–2348); Q₂ (2363); Proposition 8.9 (2400); Theorem 8.10 proof with P¹, p²+1 points, O(p−1) (2431–2446); Theorem 8.11 and proof with O(−1)⊕O(p) and the SL₂(𝔽_p) step (2448–2482); Lemma 8.12 (2501–2521); Definition 8.19, Lemmas 8.20–8.21 (2773–2816). Y16: §3.9 chart (1150–1152); Proposition 3.11 (1192); Proposition 3.12 (1243); Remark 3.13 (1296–1302); Theorem 4.7 (2055–2069); Theorem 4.9 (2129–2141). K75: Lemma 13 and corollary (1673–1700); §11 (1712–1728). T06: §3.1 (1123); Proposition 3.2 (1212); comparison (1249); §3.2 (1292). P12: Definition 4.3 (717); §4.1.4/4.2.1 (760, 788). B15: Theorem 4.5.4 (3091); Theorems 6.2.2, Corollary 6.2.4 (4724–4789). Stacks: Lemma 47.9, Tag 0CNF (5242–5247).

## Not verifiable

- Elaboration of `Suggested.lean` at the pins: no Lean may be run in this pass; the signature was checked by hand against the pinned declarations (above). The accepting review and the board build are the only elaboration evidence.
- §3.5's étale-local identification of S∖SS and S_par∖SS with the rank-one Iwahori strata, and the genus-two reproof of the Iwahori local model: P20 (line 1619) cites the literature for the local model; the quotient-ring identities are checked, the étaleness of the flag morphisms is not checkable without the moduli construction.
- §7.1's finiteness over the rank-one locus (BT₁ classification of isotropic kernels at rank one) and §7.5's central multiplicity 1+p+p²+p³: consistent with P20 §7 and §14.9.2 and with the line counts, not independently derivable here.
- §9.4's identification of the marked operator with p^{3−r}U_{Kli(p),1} and the branch count p at an ordinary point: consistent with P20 lines 2616–2617 and 2765–2774; the compactified trace and frame transports are not checkable without the tower.
- §4.4's Stein-factorization descent of a power of h′ to S*: the argument via Stacks 0CNF is sound as written; whether the minimal exponent e is 0 (descent of h′ itself) is not decided by the sources and the README does not claim it.
- The P20 journal revision was not compared (the manifest says so); all P20 locators are to the author version.

## Source issues

- **Gap** in P20 at Lemma 14.8.2, printed p. 101 (line 4612–4615): the proof treats the second Hasse invariant as a section on the non-ordinary locus of the minimal compactification and lifts a power of it to the ample sheaf there; the descent from the toroidal model to the minimal one is not justified; it should descend a p-power of the section along the universal homeomorphism of the Stein factorization (Stacks Tag 0CNF), as §4.4 of this roadmap does; affects the proof.
- **Error** in Y16 at Remark 3.13, printed p. 24 (line 1296–1302): the remark claims that for k₁−k₂ = p−1 the projection of V(p−1)⊗V(2) onto V(p−3,2) splits with the same basis formula; but V(p−1)⊗V(2) is the tilting module T(p+1) ⊕ L(p−1) with L(p−3) only the socle and head of the uniserial T(p+1), and for SL₂(𝔽_p) the product St⊗V(2) is projective while V(p−3) is not, so no splitting exists; it should restrict the remark to k₁−k₂ = p−2 (where V(p−2)⊗V(2) ≅ T(p) ⊕ L(p−4) does split); affects Y16's definition of θ₁ at k₁−k₂ = p−1 (this roadmap excludes that degree, §8.1 Check at d=p−1).
- **Gap** in Y16 at Theorem 4.9, proof, printed p. 39 (line 2131–2137): the step that uses ρ_r of an upper unipotent to arrange F₀|_X ≠ 0 changes the frame by a matrix that does not preserve the dual-basis normalization B = I of Koblitz under which the local expansion (4.5) was derived; it should use a frame change in the unitary group of that normalization, a conjugate of SL₂(𝔽_p) by Lang's theorem, as §8.4 of this roadmap does; affects the proof.
- **Gap** in CG20 at Lemma 8.3, printed p. 58 (line 2290–2299): the remark that the left-coset decomposition of Γ diag(p,1) Γ for a congruence subgroup Γ of level prime to p is essentially that of SL₂(ℤ) holds when diag(p,1) normalizes the image of Γ modulo its level (Γ(N), Γ₀(N), Γ₁(N), the levels used there) but not for an arbitrary such Γ, where the double coset has e(p+1) cosets with e = [H : H ∩ gHg⁻¹] > 1 possible; it should state the normalizing hypothesis; affects nothing in CG20 (its levels satisfy it).
- **Gap** in CG20 at Theorem 8.11, proof, printed p. 62 (line 2477): the splitting of the Hodge bundle on each supersingular P¹ as O(−1)⊕O(p) is asserted without reference; it should cite Moret-Bailly's family (the extension 0→O(p)→E|_C→O(−1)→0 splits on P¹); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1ef45f0", "job": "RT-AlgebraicModularFormsAndSerreWeightsPartII~1b", "model": "fable", "worker": "fable-rt227"} -->
