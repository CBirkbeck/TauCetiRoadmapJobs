<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6637759751 -->
Red team round 2 pass b (claude) of 77cce8f

Verdict: needs_changes

1. **F01** (P1) §2.5 is false: a cusp can have two lifts within (1+δ)ρ_X of z₀

   **Location.** `packages/GeometricFreyMazur/README.md` §2.5, statement: "fixed distinct cusps c₀,c in one component and a fixed lift z₀ of c₀ admit at most one lift z of c with d(z₀,z)≤(1+δ)ρ_X"; proof route: "Their relative matrix reduces to the upper triangular cusp normalizer. Its relevant lower entry is O(p^(8δ))".

   **Claim.** For every 0<δ<δ₀ and all large p, at most one lift of c lies within (1+δ)ρ_X of z₀ (BT16 Proposition 12(a)).

   **Witness.** In the compact (2,3,p) tiling let σ=γ_p(U), S=γ_p(S), z₀=iy_p. For b=3, c≡2/3 mod p and any a, the two p-vertices w=σ^aSσ^bS·z₀ and w′=σ^(a−c)Sσ^(−b)S·z₀ have cusp labels (ab−1,b) and −(ab−1,b): the same cusp c≠c₀. They are distinct: with g=σ^aSσ^bS and g′=σ^(a−c)Sσ^(−b)S, w=w′ exactly when g⁻¹g′=Sσ^(−b)Sσ^(−c)Sσ^(−b)S lies in the stabilizer ⟨σ⟩ of z₀; that element is conjugate to σ^(−c)Sσ^(−2b)S, whose real trace is 2cos(cθ)cos(2bθ)−sin(cθ)sin(2bθ)cos(2θ)/sin²θ (θ=π/p), hyperbolic (p=101: trace 164.8). Both lie at distance d with cosh d=1+2sinh²(2log y_p)sin²(πb/p), so d=2log p+2log 3−2log π+o(1) (p=101: 9.1321; p=211: 10.6101; p=1009: 13.7411), which is ≤(1+δ)ρ_X=(1+δ)(2log p+O(1)) for every fixed δ>0 and large p. With M=SU^bS=[[−1,0],[3,−1]] and M′=SU^(−b)S, both of height 3, MM′⁻¹=L(−6) is not upper triangular mod p: the source's step "γ_p(MM′⁻¹)∈Ξ⟨σ_p⟩" (BT16 line 634) drops the two stabilizer factors σ^a, σ^(a−c), which differ by σ^c with c of size p.

   **Repair.** Replace the §2.5 statement by: "For fixed 0<δ<1/8 and sufficiently large p, distinct cusps c₀,c in one component and a lift z₀ of c₀ have at most C_δp^(16δ) lifts z of c with d(z₀,z)≤(1+δ)ρ_X; for d(z₀,z)<ρ_X there is at most one." Replace the proof route by: "Write each such lift as σ^aγ_p(M)iy_p by §2.3. Two lifts σ^aγ_p(M)iy_p and σ^(a′)γ_p(M′)iy_p have the same cusp exactly when (M′⁻¹M)₂₁≡(a−a′)c′m₂₁ mod p, where c′,m₂₁ are the lower-left entries of M′,M. For c≠c₀ both c′ and m₂₁ are nonzero integers of absolute value <p, so a−a′ mod p, hence the lift, is determined by M′; there are O(p^(16δ)) matrices M′ of height ≤C_δp^(4δ). For radius <ρ_X two lifts z,ξz would give d(z,ξz)<2ρ_X, below the systole." Replace the §2.5 Checks by: "At p=101, b=3, c=68, the p-vertices σ^aSσ³S·iy_p and σ^(a−68)Sσ^98S·iy_p are two distinct lifts of the cusp (3a−1,3), each at distance 9.1321 from iy_p; the count bound allows them, a uniqueness claim does not." and "For two lifts σ^aγ_p(M)iy_p, σ^(a′)γ_p(M′)iy_p with M=M′ and a≠a′, the congruence forces c′m₂₁≡0, hence M upper triangular and the lift equal to iy_p itself, so c=c₀: a lift of a different cusp with the same M has a unique rotation index." Keep the δ<1/8 Check only if a step still uses it; §2.5 no longer does.

2. **F02** (P1) §2.6 is false: the intersection of two cusp balls is not in one small ball

   **Location.** `packages/GeometricFreyMazur/README.md` §2.6, statement: "distinct cusps c₀,c satisfy B(c₀,(1/2+δ)ρ_X)∩B(c,(1/2+δ)ρ_X)⊂B(u,δρ_X+C) for a suitable u"; proof route "Lift the lens through the unique-lift result".

   **Claim.** For small δ and large p the intersection of the two cusp balls in X(p) lies in one ball of radius δρ_X+C (BT16 Proposition 12(b)).

   **Witness.** Take c₀,c,z₀,w,w′ of S01 and the midpoints m of z₀w and m′ of z₀w′. Both lenses B(z₀,R)∩B(w,R) and B(z₀,R)∩B(w′,R), R=(1/2+δ)ρ_X, are nonempty (d(z₀,w)=d(z₀,w′)≤(1+2δ)ρ_X) and contain m, m′, so the images m̄,m̄′ lie in B(c₀,R)∩B(c,R). If d(m,ξm′)≤ε:=2(δρ_X+C) for some ξ∈Ξ, then d(z₀,ξz₀)≤d(z₀,m)+ε+d(m′,z₀)=d(z₀,w)+ε=2log p+O(1)+ε<2ρ_X−O(1) for δ<1/2, so ξ=1; but d(m,m′)=2log p−O(1) (p=101: 8.8444; p=211: 10.3225; p=1009: 13.4535) exceeds ε for small δ. Hence d_X(m̄,m̄′)>2(δρ_X+C): no ball of radius δρ_X+C contains both.

   **Repair.** Replace the statement by: "For sufficiently small fixed δ>0 and large p, distinct cusps c₀,c satisfy B(c₀,(1/2+δ)ρ_X)∩B(c,(1/2+δ)ρ_X)⊂⋃_(i≤n)B(u_i,δρ_X+C) with n≤C_δp^(32δ); each u_i is the image of the midpoint of z₀ and a lift z_i of c with d(z₀,z_i)≤(1+2δ)ρ_X, and lies within C of an order-2 vertex." Replace "Lift the lens through the unique-lift result, taking its δ parameter twice as large" by "Lift a point of the intersection to x̃ with d(z₀,x̃)≤(1/2+δ)ρ_X and choose a lift z of c with d(x̃,z)≤(1/2+δ)ρ_X; then d(z₀,z)≤(1+2δ)ρ_X, so z is one of the C_δp^(32δ) lifts of §2.5 at parameter 2δ. Apply the midpoint-lens bound to each such z." Add the Check: "At p=101 the two lifts of S01 give two lens midpoints 8.8444 apart in H; for ε<2log p−O(1) no deck element brings them within ε, so the single-ball form fails while the union of two balls holds."

3. **F03** (P2) the lens is used in its single-ball form downstream; §2.7, §3.6, §5.4, §5.8 and two worked examples must use the union form

   **Location.** `packages/GeometricFreyMazur/README.md`: §2.7 proof route "the lens theorem puts x near an adjacent order-2 vertex" and the exponent 24δ; §3.6 proof route "Use cusp double cosets and unique lifts to encode each nearby bicusp"; §5.4 proof route "If at least two overlap, the midpoint lens places the point within δ₃ρ_X+O(1) of that diagonal"; worked example "Multiplicity estimates with independent scales": "the unique-lift midpoint-lens bound gives a lens of radius δ₃ρ_X+O(1). The two coordinate lens centres agree"; worked example "The big-diagonal bound": "Second, the two-cusp lens puts each factor within O(Bδρ_X) of a marked order-two vertex."

   **Claim.** Each route derives its conclusion from §2.5–§2.6 as stated.

   **Witness.** With the corrected §2.6, a point (x,y)∈S in the overlap of two product balls around diagonal bicusps (c₁,c₁),(c₂,c₂) has x∈B(u_i,·) and y∈B(u_j,·) with possibly i≠j; for i≠j it is within O(δ₃ρ_X) of (ū_i,ū_j), which by S02 is ≈ρ_X from the diagonal, so "within δ₃ρ_X+O(1) of that diagonal" does not follow. BTE's own proof of Proposition 4.2 (BTE lines 161–162) uses the same single-lens step. §3.6 does not need lift uniqueness: BT16 lines 769–803 use double cosets of cusps in X(p), where the stabilizer factors are absorbed. §2.7's count survives because a second lift z of a cusp within (1/2+δ)ρ_X of x̃ is within (1+3δ)ρ_X of the first, z=σ^kγ_p(M)z₁ with h(M)≤Cp^(12δ), and the angle constraint from d(z,x̃)≤(1/2+δ)ρ_X with d(z,z₁)≥ρ_X−O(1) leaves p^(O(δ)) rotation indices k; the exponent 24δ is not derived.

   **Repair.** §2.7: state "at most C_δp^(Aδ) cusps for an absolute A" and replace the route sentence by "If x is within (1/2+δ)ρ_X of two cusps, their lifts z₁,z are within (1+2δ)ρ_X of each other; by §2.3 (at 2δ) z=σ^kγ_p(M)z₁ with h(M)≤Cp^(8δ), and d(z,x̃)≤(1/2+δ)ρ_X with d(z,z₁)≥2log p−O(1) confines the direction of z at z₁ to an angle p^(−1+O(δ)), so at most p^(O(δ)) values of k occur for each M." §3.6: delete "and unique lifts". §5.4 and the first worked example: after "the midpoint lens places the point within δ₃ρ_X+O(1) of that diagonal" insert "or within δ₃ρ_X+O(1) of one of at most p^(O(δ₃)) points (ū_i,ū_j) with i≠j; bound the cycle volume in those balls by gap:relative-point-ball-volume at R=(1/2+δ₃)ρ_X, which gives p^(−1+O(δ₃)) times the volume in the enlarged ball, the same order as the diagonal-tube term." Second worked example: replace "the two-cusp lens puts each factor within O(Bδρ_X) of a marked order-two vertex" by "the union-of-lenses bound of §2.6 puts each factor within O(Bδρ_X) of one of p^(O(Bδ)) marked order-two vertices; the three-cusp reconstruction is applied to each choice, so the final count acquires another p^(O(Bδ)) factor absorbed by A₄." Re-derive the exponent bookkeeping of §5.4 (the choice (B+2)δ₃<1) with the added factor.

## Round-1 repairs at this head

| Earlier finding | Status | Witness at this head |
|---|---|---|
| r1a F01 (P1) cusp star needs 2p triangles | repaired | `packages/GeometricFreyMazur/README.md` §1.5 proof route: "p fundamental domains Δ₂,₃,ₚ around it, that is 2p incident triangles of Σ, each of angle π/p … 2p·π/p=2π"; new Check at p=7 (seven triangles fill π, fourteen fill 2π). Recomputed: 14·π/7=2π. |
| r1a F02 (P2) surface gap hypotheses | repaired | README line 78 and `design/plan.json` `cyclic-surface-resolution-and-contraction` are byte-identical (checked by script) and separate "normal projective surface … 1/n(1,a)", "smooth connected projective surface, extend §4.13 `bertini_smoothness`" and "smooth projective surface, Castelnuovo contraction". The two round-1 counterexamples (ℙ² over ℂ[ε]/ε², ℙ²⊔ℙ²) are excluded by "smooth connected". `bertini_smoothness` resolves on main (`roadmaps resolve`: nothing unresolved). |
| r1a F03 (P3) §3.4 and §6.3 Checks | repaired | §3.4 now has the tangent-plane Check plus two computed Checks on the H×H lift with R(z)=−z̄; recomputed: −conj(1+i)=−1+i, so (1+i,−1+i)∈T̄₁ and (1+i,1+i)∉T̄₁; c₂∘c₂=id; two-factor conjugation gives (−1+i,−1+i) on the diagonal. §6.3's third Check: B=ℙ¹, n=1, h=id, f=squaring then normalization of the j-line component of H₁: φ=f has degree 2, φ(1)=φ(−1). |
| r1a F04 / r1b F02 (P3) BT16 line 537 | repaired | §2.1 cites "BT16 lines 533–534"; BT16 line 533 begins "Definition. For M ∈ SL₂(Z), denote by h(M) the maximum absolute value of its entries" (line 534). |
| r1b F01 (P3) §2.1 one Check | repaired | §2.1 has three Checks; recomputed: J has Frobenius norm √4=2 and operator norm 2 (eigenvalues 2,0), height 1; inverse of [[2,1],[1,1]] is [[1,−1],[−1,2]], height 2; diag(2,1)⁻¹=diag(1/2,1) height 1; J²=2J height 2=2·1·1. |
| r1b F02 (P3) lines 746, 1280 | repaired (applied differently, correctly) | §3.5 cites BT16 line 747 = "Remark 16." §5.7 cites line 1283, which carries the claim actually cited (Hecke correspondence preserves h_Y and the two metrics compare away from the cusps, lines 1283–1290). The point-ball worked example cites line 1330 = "It remains to bound E." |

No repair introduced a new error: the new Checks were recomputed above; the gap split keeps the three applications (X×X and Z(p), both satisfying "smooth connected" or "normal with isolated 1/n(1,a) points").

## Findings

## Verified sound

Read in full: `packages/GeometricFreyMazur/README.md` (1639 lines), `packages/GeometricFreyMazur/Suggested.lean` (93 lines, 3 declarations), `design/plan.json`, `sources.toml`, the repository README and CONTRIBUTING, the two round-1 reviews and the round-1 repair report. Counts: 3 declarations read and compared with the worker's elaborated signatures (no dropped binder; Lean not run, read-only rule); 66 numbered targets plus the Conventions definition read; 62 source locators verified against the cached texts (54 BT16, 6 BTE, 2 ABR96; BLR90 settled uncertified); 71 README Checks and 3 supplier-contract Checks recomputed (values below and in the earlier passes' tables, which I re-ran where a computation was involved); 70 sibling section citations resolved (12 supplier roadmaps); 28 pinned declarations located at the pins (Mathlib `master` and Tau Ceti `main` as recorded in `lake-manifest.json`).

Dependency check (run on this head, unchanged output):

```text
depcheck: 208 roadmaps, 1712 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. GeometricFreyMazur is line 289 of the merge order; its open-head suppliers are earlier (ComplexComparisonPartII 39, AbelianSchemesAndArithmeticModuli 41, InverseGaloisAndArithmeticFundamentalGroups 44, NeronModelsAndSemistableAbelianVarieties 47, ModularCurvesPartII 72, CongruenceSpectralGap 143); the others are on main. `roadmaps resolve`: no unresolved cross-roadmap citation and no Lean name found nowhere. Policy: the diff touches only `packages/GeometricFreyMazur/`; no pull-request numbers, process words, `lemma`, `set_option`, `#eval` or placeholder in README or Lean.

### Suggested.lean, with context and computed instances

| Declaration | Context in scope | Instances and values | Result |
|---|---|---|---|
| `gonality k K` (def) | `[Field k] [Field K] [Algebra k K]`; body `sInf{n ∣ ∃ f transcendental, FiniteDimensional (adjoin k {f}) K, finrank = n}` | K=k(t), f=t: finrank 1, set ∋1, no 0 (finite-dimensional ⇒ finrank ≥1): value 1. K=k: no transcendental f, set empty, `Nat.sInf ∅=0`; no `FunctionField` instance exists, so no headline applies. Genus-one and hyperelliptic K over algebraically closed k: 2. For `FunctionField k K` the image of `RatFunc.X` is transcendental with K finite over k(X), so the set is nonempty and the value equals the proper-model gonality. | Real body on native carriers; matches README Conventions and its four Checks |
| `full_monodromy` (theorem) | k alg. closed char 0, k⊂RatFunc k⊂K scalar tower, `FunctionField k K`, `gonality k K < N`, `W.IsElliptic`, `W.j ∉ range (algebraMap k K)`, p prime, 5<p, 800N<7p; `letI` ZMod-module on `torsionBy … p`; g additive automorphism with `LinearMap.det`=1 | E[p](K̄)≅(ℤ/p)² has a finite basis, so `det` is the genuine determinant (fallback 1 unused). Identity g ← identity σ. Constant curve y²=x³+x over ℂ(t): image {I} misses the transvection [[1,1],[0,1]] of det 1; excluded by j∉k. N=2: p=229 gives 1600<1603, p=227 gives 1589<1600 fails. N≤1 vacuous (gonality ≥1). 5<p is implied (p≥229) — note only. Image ⊆SL₂ since μ_p⊂k; equality is §8.3 with D≥p from §8.2 and 7D/800>N | True as typed at README §9.6 generality |
| `geometric_frey_mazur` (theorem) | `∃ M` before `∀ k K …`, same tower, both curves elliptic with j∉k, p prime, M<p, e an additive equivalence with "Q=σP → eQ=σ(eP)" for all σ,P,Q | For each P the point Q:=σP is p-torsion, so the clause is the usual intertwining. `TauCeti.Isogeny`'s `MapsInfinity` makes the source coordinate ring integral over the pullback image, which excludes the constant map (image a field) — every element is a genuine nonconstant pointed K-morphism W→W′. Legendre curve over ℂ(t), W′=W, e=id, N=2: identity isogeny. Descent: σf=χ(σ)f with χ=±1 (rank-one Hom), f[p]=λΨ equivariant ⇒ χ=1 since f[p] invertible and p odd | True as typed at README §9.8 generality |

Headline coverage: §9.6 and §9.8 are the headlines statable at the pins and both are stated; the nine not-statable headline families are named in the module docstring with their missing carrier (Z(p) and strata, Symⁿ, modular cycles, compact congruence curve, resolution/contraction). §8.2 and §8.4 are elementary auxiliary targets by the README's scope line, not headlines. No padding.

### Targets: instances and values (fresh pass, beyond the round-1 tables)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §1.2 triangle matrices | p=7, 101 | det U_p=cos²θ+b(1−b)=1 with b(1−b)=sin²θ; tr(SU_p)=1; y₇=1.7251 both from b and from y+1/y=1/sin(π/7); (1−b)p²/π²=1.000646 at p=101 | sound |
| §1.3 witness | p=7, 11 exact; p=1009, 1013, 10007, 10009 numerically | M₇=[[8,21],[35,92]], det 1, tr 100; M₁₁=[[23,33],[154,221]], det 1, tr 244; general det=1 and tr=2+2p² by expansion; tr γ_p(M_p)/p²=0.68388, 0.68388, 0.68392, 0.68392 against 27/(4π²)=0.68392 in both residue classes | sound |
| §1.4 | p=7 | 2arcosh(47/2)=7.6994, 4log 7=7.7836 | sound |
| §1.5 star | p=7 | side (i,iy_p) ⟂ unit circle at i, so cusp-to-opposite-side distance = log y_p; 2p triangles of angle π/p fill 2π | sound (repaired) |
| §1.6 comparison | disc of radius r | complete metric of the radius-tanh(r/2) disc at its centre is coth(r/2) times the ambient; Schwarz–Pick for disc→Y | sound |
| §1.7 compact lower bound | L≤4log p+C, R_b=(log p)/2, R_s=(log p)/4 | ≤8+o(1) deep visits; outside: coth(r/2)−1=O(p^(−1/4)), times L = o(1); inside: cosh r(s)=cosh r_min cosh s ⇒ r≥|s|, ∫(coth(r/2)−1)=O(1) | sound |
| §1.8 | p=101, y=1/2, 1, 1/4 | |q|=0.969374, 0.939686, 0.984568; 2artanh(0.969374)=4.163618 | sound |
| §2.2 | M=[[2,1],[1,1]] | cosh d(i,Mi)=7/2; h(M)≤√(2cosh R)≤C_δp^(4δ) | sound (weaker than needed, true) |
| §2.3 | w=σ^aSσ^bS·iy_p | is of the form σγ_p(M)iy_p with M=SU^bS of height b | sound |
| §2.5 | p=101, b=3, a=10, c=68 | two distinct lifts of cusp (29,3), both at distance 9.1321 from iy_p; relative word has trace 164.8 | **S01** |
| §2.6 | same | lens midpoints 8.8444 apart (p=101), 10.3225 (211), 13.4535 (1009); forced ξ=1 | **S02** |
| §2.7 | second lift z of a cusp near x̃ | d(z,z₁)≥2log p−O(1), direction confined to angle p^(−1+O(δ)) ⇒ p^(O(δ)) rotation indices | true with exponent "Aδ"; **S03** |
| §3.6 route | BT16 lines 769–803 | double cosets of cusps in X(p); stabilizer factors absorbed in N(H) | statement sound; route wording **S03** |
| §4.1 tube | matched distances 3R/2 | midpoints at 3R/4 | sound |
| §4.4 | p=7, d=1, R=1/2 | displacements 0, 0.980099, 1.645565, 1.961531, 1.961531, 1.645565, 0.980099; three below 1 | sound |
| §5.4 route | overlap of balls at (c₁,c₁),(c₂,c₂) | x∈lens_i, y∈lens_j with i≠j is near (ū_i,ū_j), ≈ρ_X from the diagonal | route broken; statement unverified; **S03** |
| §5.6 | p=7 | g=3, s=24, ratio 7 | sound |
| §5.8 worked example | D∈|L⊠L| on X×X | Σ_g mult=2d|G₀|, Deg=4dK, ratio 3p/(p−6)=21 at p=7 | sound |
| §8.1 | D=1 | (21/100)(π/3)/(8π)=7/800; ABR96 line 17 prints 7/800·D_Γ | sound |
| §8.2 | p=2,3,5,7 | S₃⊃A₃ index 2; Q₈ index 3; Borel index p+1; S_d has no order-p element for d<p | sound |
| §8.4 | 𝔽₅, diag(2,3), A=[[0,1],[1,0]], χ=−1 | both sides [[0,3],[2,0]] | sound |
| §9.1 | Legendre j | j(2)=1728, j(3)=21952/9; diag(1,3) at p=7: 3∉{1,2,4} | sound |
| §9.2–9.4 | h=af, χ=±1 | deg h=a²deg f; χ(σ)f[p]=f[p], f[p] invertible, p odd ⇒ χ=1 | sound |
| §9.6 | N=2 | 7·229=1603>1600>1589=7·227 | sound |
| §9.7 extension | f, f∨ over U | f∨∘f=[deg f] on U by separatedness; kernel ⊂E[deg f] finite étale; finite surjective between regular schemes ⇒ flat | sound |
| §10.1–10.5 | g<N; 1/3(1,1), 1/3(1,2), 1/p(1,p−1); C²=−2, C·E=1,2 | gon≤g+1≤N<N+1; chains [3], [2,2], p−1 (−2)-curves; −1, 2 | sound |

### Suppliers, pins and gaps

Pinned declarations located at the pins with the hypotheses the README states: `AddSubgroup.torsionBy` (Torsion/Basic.lean:972), `torsionBy.zmodModule` (:1010), `AddMonoidHom.toZModLinearMap` (ZMod.lean:81), `WeierstrassCurve.Affine.Point.map` (Affine/Point.lean:823, needs `f.injective`, an `S`-algebra map), `LinearMap.det` (Determinant.lean:173, fallback 1), `FunctionField` (FunctionField.lean:58, `FiniteDimensional F⟮X⟯ K`), `Matrix.SL2.commutator_eq_top` (SpecialLinearGroup.lean:804, a≠0, a²≠1), `Matrix.ProjGenLinGroup` (:41), `mk_eq_mk_iff` (:64), `ProjectiveSpecialLinearGroup` (:33), `toPGL` (:113), `toPGL_injective` (:120), `norm_eq_sup_sup_nnnorm` (Normed.lean:87), `norm_entry_le_entrywise_sup_norm` (:106); Tau Ceti `closure_range_toSpecialLinearGroup_eq_top_of_field` (Transvection.lean:595), `Isogeny` (Basic.lean:139) with `MapsInfinity` (:72, integrality of the source coordinate ring over the pullback image), `existsUnique_map_eq_iff_galoisFixed` (Descent.lean:117), `Hom.degree_zsmul` (Hom.lean:63), `FiniteHolomorphicMap` (Degree.lean:133), `degree` (:120), `degree_comp` (:434), `ramificationDivisor` (Ramification.lean).

Sibling sections resolved at the open heads or on main: ModularCurvesPartII §§1.2, 1.3, 2.3, 3.9, 3.14, 4.1, 4.6–4.10, 5.7 (`projectiveLevelCurve`, two components, p>3, [−1] retained), 5.13, 5.16, 6.1, 8.4 (`complexConjugationComparison`), 8.5 (`genericBaseChangeAndLevelCompatibility`), 9.13 (cyclic filter, ψ(4)=6 against 7); ComplexComparisonPartII C−1.1–C−1.3, C1.9, C2.2, C4.1–C4.5, C5.4, C6.2; InverseGaloisAndArithmeticFundamentalGroups IG.0.3, IG.1.3, IG.3.1; AbelianSchemesAndArithmeticModuli A1.6, A1.8, A3.1–A3.5, A3.7, A3.8, A6.1, A6.6, A6.7, A6.20, A6.25, A6.34; NeronModelsAndSemistableAbelianVarieties §§1.3, 1.8; CongruenceSpectralGap §5.3 at its open head (λ′₁≥21/100 for every congruence subgroup, clipped at 1/4, curvature −1); on main: SchemeAndStackFoundations §§0.8, 0.9, 0.11, 1.17 (`finiteGroupQuotient_projective`, Noetherian base), 3.2, 4.11–4.13 (`resolution_of_curves`, `bertini_smoothness`), 5.1–5.3, 5.9–5.10; AlgebraicCurves Layers 3, 4, 5, 7, 12 (12A–12E inside Layer 12); ModularCurves §§0D, 0E, 2C, 5B, 5C; FuchsianOrbifolds Layers 0–5; ComplexKahlerGeometry K3, K6.1; RiemannianGeometry R7.0, R8; JacobianChallenge exists on main.

Gaps: the eleven slugs in `design/plan.json` carry the same `needs` text as the README (compared by script), each with a named supplier and section; none asks for what the pins or main provide (AlgebraicCurves on main has no gonality; SchemeAndStackFoundations §1.17 has no free-locus or relative-cycle statement; FuchsianOrbifolds has no translation-length or lens formula; RiemannianGeometry has no singular-metric Li–Yau; ComplexKahlerGeometry K6.1 has no hyperbolic tube or point-ball inequality). Not raised.

Ownership: `roadmaps grep` over the open heads and main for "Frey–Mazur", "Bakker", "singular bicusp", "diagonal quotient surface" finds only ModularCurvesPartII's imported projective-level sections and citations of other Bakker papers; the board package ModularCurvesPartIII is an import index naming GeometricFreyMazur as owner. No second owner of Z(p), its strata, the geometric theorem or a `gonality` declaration. Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep` at their indexed heads.

## Not verifiable

- BLR90 §1.2 Proposition 8 and §1.4 Proposition 2: settled uncertified, cited by locator alone.
- Whether the statements of §2.7, §3.6, §5.4 and §5.8 remain true after S01–S02: their proofs as written depend on the single-lens form; I give the corrected routes in S03 but did not redo the exponent bookkeeping of §5.4 and the big-diagonal worked example with the extra cross-lens term.
- The lower-order constant in ρ_X=2log p+O(1): the witnesses of S01–S02 are asymptotic (every fixed δ>0, p large), which is the statements' own quantifier order; at p=101 only the upper bound ρ_X≤8.8503 (from M₁₀₁) is computed.
- Elaboration was not re-run (read-only rule); the worker's signatures file was used.

## Source issues

- **Error** in BT16 at Proposition 12(a), printed p. 723: the source says a cusp c≠c₀ has at most one lift within (1+δ)ρ_X of a lift of c₀; two distinct lifts exist (the pair of S01, at distance 2log p+2log 3−2log π+o(1)); affects a stated result.
- **Error** in BT16 at proof of Proposition 12(a), printed p. 724 (BT16 line 634): the source says γ_p(MM′⁻¹)∈Ξ(p)⟨σ_p⟩ follows from z,z′ being Ξ(p)-translates; the stabilizer factors σ,σ′ of Lemma 11(a) are dropped, and in the example of S01 MM′⁻¹=L(−6) is not upper triangular mod p; affects the proof.
- **Error** in BT16 at Proposition 12(b), printed p. 723: the source says the intersection of two cusp balls of radius (1/2+δ)ρ_X lies in one ball of radius δρ_X+O(1); it lies in a union of p^(O(δ)) such balls, two of whose centres are 2log p−O(1) apart in the example of S02; affects a stated result.
- **Gap** in BT16 at Proposition 12(c) proof, printed p. 725 (BT16 lines 672–677): the source says part (a) places x within δρ_X+O(1) of a point over q₂; this uses the single-ball form of (b); it should use the union of lenses and the angular count of S03; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, printed p. 4 (BTE lines 161–162): the source says a point in two balls centred at bicusps on the diagonal is within δ₃ρ_X+O(1) of the diagonal, by BT16 Proposition 12(b); it should also handle points near pairs of distinct lens images, by a point-ball volume estimate; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "77cce8f96a1bd0f00d470770c9917623d75d54cb", "job": "RT-GeometricFreyMazur~2b", "model": "fable", "worker": "chris-x17"} -->
