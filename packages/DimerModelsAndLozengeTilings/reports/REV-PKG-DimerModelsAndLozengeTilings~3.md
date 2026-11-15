<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6899141561 -->
Review (claude) of 68fc304

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) four `cited_for` records in the manifest omit sections that cite the work

   - **Location.** `packages/DimerModelsAndLozengeTilings/sources.toml`, the `cited_for` lists of
     aggarwal2023, sheffield2005, kos2006 and kenyon2009. The repair report of round 3 says of this
     pattern: "No other work's record is incomplete".
   - **Claim.** Each record lists every README section that cites the work (as the gorin2021 record
     does since the last repair).
   - **Witness.** A section-by-section comparison of the README with the manifest:
     aggarwal2023 is cited in 5.3 (README line 1398), not listed; sheffield2005 in 5.3 (line 1399),
     not listed; kos2006 in 2.1 (line 678), 4.6 (line 1284) and 8.3 (line 1752), none listed;
     kenyon2009 in 1.6 (line 633), 2.10 (line 906), 3.1 (line 939), 4.6 (line 1284), 6.1 (line 1486),
     7.2 (line 1629), 7.3 (line 1652), 10.1 (line 2050) and 10.2 (line 2083), none listed.
   - **Repair.** Edit the four lists only (no key, locator or other field changes):
     - aggarwal2023: "4.4, 5.4, 6.1 Gibbs measures, …" → "4.4, 5.3, 5.4, 6.1 Gibbs measures,
       translation invariance, slope".
     - sheffield2005: "4.2, 4.3, 4.6, 5.4 invariant events, …" → "4.2, 4.3, 4.6, 5.3, 5.4 invariant
       events, ergodicity, face property".
     - kos2006: "2.10 gauge and magnetic invariance" → "2.1, 2.10 the flow form of the height
       function; gauge and magnetic invariance"; "5.2-5.3 dimer Gibbs measures" → "4.6, 5.2-5.3 dimer
       Gibbs measures"; "8.4-8.5 torus correlations and Fourier form" → "8.3-8.5 the torus partition
       function, torus correlations and Fourier form".
     - kenyon2009: "1.2, 1.5 dimer coverings" → "1.2, 1.5, 1.6 dimer coverings; the boundary slopes of
       Exercise 13"; "2.3, 2.5 heights and flows" → "2.3, 2.5, 2.10 heights and flows; reweighting
       leaves planar Boltzmann measures unchanged"; "2.8, 3.2 flips and …" → "2.8, 3.1, 3.2 Boltzmann
       measures, flips and Kasteleyn's theorem on the honeycomb"; "5.1-5.4 …" → "4.6, 5.1-5.4 Gibbs
       measures and the lozenge instance"; "6.2-6.4 …" → "6.1-6.4 slope, corners, edges, the fibre
       argument corrected in 6.4"; "7.1, 8.2-8.5 …" → "7.1-7.3, 8.2-8.5 torus counts, torus measures
       and their limits, signs, eigenvalues"; add "10.1-10.2 Gibbs measures as limits of Boltzmann
       measures on growing graphs".
     Tested on the instances that refute the claim: after the edit every section in the witness is
     covered; the records of okounkov-reshetikhin2003 (9.6, 9.7), cohn-kenyon-propp2001 (2.8),
     kenyon1997 (3.2, 3.3, 8.1, 8.3, 8.4, 9.3, 9.4), gorin2021, thurston1990 (2.9) and georgii2011
     (4.2, 4.6, 5.4) already agree with the README and need no change.

One finding, P3 (0 blocking). The four repairs of round 2 are all in place and correct. No statement
of `packages/DimerModelsAndLozengeTilings/README.md` or `Suggested.lean` was found false, vacuous or
unowned; the elaboration passes with `sorry` as the only warning; the dependency check reports no
problem. The one repair asked for is in `sources.toml`: the pattern of round 2's F04 (a
bibliographic record that leaves out sections citing the work) was repaired for gorin2021 only, and
four other records still have it.

## Round 2 findings, one by one

- **F01 (Layer 7 dependency line): repaired.** README lines 1682–1683: "Layers 1, 2, 4 (the weak
  topology of 4.4, for 7.3), 5, 6; Mathlib `ProbabilityTheory.uniformOn` and the compactness of
  `ProbabilityMeasure`." The `*Needs:*` lines of 7.1 (1.5, 2.5), 7.2 (7.1, `uniformOn`) and 7.3
  (4.4, 5.3, 5.4, 6.1, 7.2, compactness) have exactly this union. The other nine layer lines were
  compared with the unions of their `*Needs:*` lines: each contains its union.
- **F02 (gorin2021 Section 3.3 in 7.3): repaired.** README lines 1654–1655: "gorin2021 Section 13.4,
  lines 4689–4694, for the weighted torus computation of its Theorem 4.11 read as a local limit".
  gorin2021 line 4689 is the heading of Section 13.4 and lines 4690–4694 say that the torus
  computation of Lecture 4 (Theorem 4.11, line 1853) is such a local limit. "Section 3.3" remains
  only in 7.1 (lines 1353–1392), for the torus itself.
- **F03 (the "empty cylinders" Check of 5.4): repaired.** README lines 1458–1460: "for `F ≠ ∅` the
  window `E` contains the three edges of a face, on which a plane tiling has an edge, so neither
  cylinder contains the empty configuration and both have mass `0`; for `F = ∅`, `ω = ω'`".
  Recomputed in the table below.
- **F04 (georgii2011 bibliography line): repaired.** README line 2185: "for 4.2, 4.6 and 5.4". The
  same pattern in the manifest was repaired for gorin2021 and is still present in four records:
  R01.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from
the content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message. Imports:
`import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant`). No `set_option`, `#eval`, `#print`, `#synth`, `lemma`, `opaque`,
`True` placeholder, sorried data or admitted `example`; no line over 100 characters. The file is
unchanged since round 2.

**Signatures.** `#check @name` for all 57 declarations appended to a scratch copy and elaborated
once: exit 0, no error. The elaborated types agree with the README statements; the two Layer 4
theorems carry `[Countable Γ] [Infinite Γ] [Countable I] [DecidableEq I] [Finite S]
[DiscreteTopology S] [DiscreteMeasurableSpace S]`, properness, `X`, `γ` and `γ.IsEquivariant`
in their own signatures. Nothing lost, nothing changed.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | aesop | decide | (exact?; done)`
on a scratch copy: 17 of 17 fail (17 errors, one per theorem). No padding: no boundary-case
theorem, no mirrored Check, no value computation; every definition and instance is used by a
headline statement.

**Headline theorems (README lines 18–28) against `Suggested.lean`.** 1.5 `tilingSubgraph_bijOn`;
2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9 `thurston_tileable_iff`; 3.2
`partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6 `gibbsInvariant_isExtreme`,
`gibbsInvariant_extreme_iff_ergodic`; 5.4 `lozengeGibbsInvariant_isExtreme`,
`lozengeGibbs_extreme_iff_ergodic`; 6.3 `slopeEdge_ergodicGibbs_equiv`,
`two_ergodicGibbs_of_slopeEdge`; 7.3 `torusLimit_mem_gibbsInvariant_slope`; 8.3
`torus_partitionFunction_eq`; 9.5 `exists_ergodicGibbs_of_slope`; 9.7
`incompleteBetaProcess_exists_unique`; 10.2 `localLimit_isLozengeGibbs`. 5.3 is named in the module
docstring as not stated separately, with its reason (it is 4.6 for the constructed dimer
specification; the general theorem and the lozenge instance are both stated).

**Names.** All 57 Lean names occur in the README (script over both files: none missing). Checks:
every numbered target has at least three and a `*Needs:*` line; ten layers, each ending with
Examples and Dependencies.

**Remarks that need no change.** (i) The `locator` fields of the manifest and the References lines
list the principal locators of each work, not every cited line range (kos2006 lines 728–740 and
gorin2021 lines 405–458 are cited in the text and lie outside the listed ranges); the text carries
the exact locators. (ii) 9.2, first Check, says `W_{π/2}` contains every odd `n ≥ 2`; `n = 1` is in
it as well (`π/2 > 1`), and the Check is true as written. (iii) The route of 4.6(b) does not use
equivariance of `γ`; the hypothesis is the one of sheffield2005 Lemma 3.2.2 and is kept.

### Adversarial table (values computed this round)

Rows for the fifteen sampled targets, the headline theorems and the passages the repairs changed.
Rows of round 2 that carry computed values (brute force over eight torus sizes for 7.1, 8.2, 8.3,
8.4; the numerics of 9.7 at slope `(0.3, 0.45)`) were relied on where marked "r2".

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions: `ρ`, heights | `ρ` on `e₁,e₂,e₃`; `M₁`, `M₃` | `ρ(1,0)=(0,1)`, `ρ(0,1)=(−1,−1)`, `ρ(1,1)=(−1,0)`, `ρ³(x,y)=(x,y)`; `ρ⁻¹w=(w₂−w₁,−w₁)`, `H_{M₁}(ρ⁻¹w)+w₁=w₂=H_{M₂}`; `M₁`: increment along `e₃` is `1−0=1=x+1−x` | agree |
| Conventions: restricted Leibniz witness | `A=[[1,2,0],[0,1,3],[4,0,1]]` | `det=1+24=25`; adjugate `[[1,−2,6],[12,1,−3],[−4,8,1]]`; `det[[12,−3],[1,6]]/625=75/625=3/25`; `25·3/25=3=A(1,2)` | agree |
| Conventions: `G_w` at `(1,1,1)` | `d=0`, `d=(0,−2)` | inner `φ`-integral is `1/a` for `|a|>1`, `a=1+e^{iθ}`, on `|θ|<2π/3`: `G(0)=(2π)⁻¹·2π/3=1/3`; for `d=(0,−2)` it is `−a` on `|a|<1`: `−(2π)⁻¹(2π/3−√3)=√3/(2π)−1/3` | agree |
| 1.2 `hexGraph` | neighbours of `W(0)`; 6-cycle at `0`; `B(1,−1)` | `(0,3)∈W(0),B(0)`; `(0,1)∈W(0),B(−e₂)`; `(e₁,2)∈W(0),B(e₁)`; cycle edges `(0,3),(0,2),((−1,0),1),((−1,−1),3),((0,−1),2),(0,1)` each in the two named faces; `W(0)∩B(1,−1)={(1,0)}` | true; vertex adjacency would join `W(0)`, `W(e₁)` (same colour) |
| 1.5 `tilingSubgraph_bijOn` | `R=∅`, `{W(0)}`, `R₆` | `∅`: one tiling (`M=∅`), one subgraph; `{W(0)}`: none, none (an isolated vertex has no neighbour); `R₆`: `T_a`, `T_b` and two matchings of the 6-cycle | true |
| 1.6 row tilings | `ε=1_{[0,∞)}`; column reading with `ε=1_{{0}}` | `W(x,y)` has `((x,y),1)` or `((x,y),3)`, `B(x,y)` has `((x,y+1),1)` or `((x,y),3)`, by `ε_x`; `τ_{e₁}M_ε={((x',y),1):ε_{x'−1}=1}∪…=M_{σε}`; column reading leaves `B(x,0)` uncovered (`ε₁=0`, `ε₀=1`) | true |
| 2.1 `IsSimplyConnectedRegion` | `{W(0)}`; `R_ring`; hexagon shelling | ring faces recomputed from the faces at `0,e₁,e₃`: 6 white, 6 black, as listed; cochain `1` on `((k,0),2)`, `((k,0),3)`, `k≥1`: `B(k,0)`: `1+0=1`; `W(k,0)`: `0+1=1`; `W(0)`: `0+1≠0`; shelling steps add vertices `e₂,−e₁,−e₃,−e₂` then two edges | true; ring is the negative control |
| 2.5 `tilingOfHeight_bijOn` | `(a,b,a+b)` round `W(v)`; `⌊(x+y)/2⌋`; `x+y`; row tiling | triples `(0,0,0),(1,0,1),(0,1,1)` select exactly `(v,3)`, `(v,1)`, `(v+e₁,2)`; `⌊(x+y)/2⌋`: `e₃`-increment `1`, no type 3; `x+y`: increment `2`, excluded; `ε=[x odd]`: `H=⌊x/2⌋`, at `x=−1`: `−1` | true |
| 2.5 Lipschitz bound | `(a,b)=(2,1),(−1,3),(−2,−1)` | `min(a,b)` steps `e₃` plus the rest: `≤2`; `≤3`; `≤0` | true |
| 2.6 heights on regions | `{W(0)}`; `R₆` with `H(1,0)=0`; `T` on the ring | height functions `(H(e₁),H(e₃))∈{(0,0),(0,1),(1,1)}` = three free tilings; `T_a`: `H(0)=0`, `T_b`: `H(0)=−1`, both `0` at `(1,1),(0,1)` and `−1` at `(−1,0),(0,−1),(−1,−1)`; ring: `0+0−1=−1` round `W(0)` | true |
| 2.7 boundary heights | `R₆`; `R_strip`; `W(0)∪B(1,1)` | hexagon boundary: `c₀=1` only on `((−1,0),3)` and `((0,−1),3)`, loop sum `0`; strip: `M₃` gives `0`, `M₂` gives `1` on `y=1`; wedge: no interior edge, no tiling | true; connectedness needed for infinite regions |
| 2.8 flips | flip at `v`; choice of `v` | `H(v+e_k)=H(v)=H(v−e_k)+1` gives `(v,3),(v−e₁,1),(v−e₂,2)∈M`, lowering `H(v)` gives `(v,1),(v,2),(v−e₃,3)`; at a maximum of `H−H_min` with `H(v)` maximal `H(v+e_k)=H(v)`, and `v₁+v₂` minimal gives `H(v−e_k)=H(v)−1` | true |
| 2.9 `thurston_tileable_iff` | `R₆'`; `{W(0)}`; `H=min_u(h(u)+ρ(u,·))` | `R₆'`: `h=(0,0,0,0,1,1,1,1)` consistent on the 8 boundary edges, `h(1,1)−h(2,1)=1>0=ρ`; `W(0,0)`, `W(1,0)` both adjacent only to `B(1,0)`; `{W(0)}`: `0+0−1≠0`; for a positive edge `u→v`, `ρ(w,u)≤ρ(w,v)≤ρ(w,u)+1`, so `H` is a height function | true |
| 3.2 `partitionFunction_eq_abs_det` | `R₆`, weights `(a,b,c)`; `R₆'` | rows recomputed `[c,0,a],[b,a,0],[0,c,b]`, `det=abc+abc`; `R₆'`: `[[1,0,0],[1,0,0],[1,1,1]]`, `det=0`, no tiling, both sides `0` | true |
| 3.3 `lozenge_correlation_eq_det` | `R₆`; `n=0`; repeated face | `K⁻¹=½[[1,1,−1],[−1,1,1],[1,−1,1]]`; `det[[½,½],[−½,½]]=½`=mass of `T_a`; `n=0`: `Z/Z=1=1·det(∅)`; `W(0)–B(0)`, `W(−e₁)–B(0)`: equal rows, `0`, event empty; `K⁻¹(g,f)=A⁻¹(σg,f)` from `Σ_g K(f,g)A⁻¹(σg,f'')=δ` | true |
| 4.1 tail σ-algebra | `I` finite; `I=∅`; trivial action on a point | `Λ=I`: `𝓕_∅` trivial; `I=∅`: properness holds, `Ω` a point, statements trivial; trivial action: stabiliser infinite, not proper, event of mass `½` | true; properness needed |
| 4.4 weak topology | `1_{[n,∞)}`; Bernoulli against `(δ₀+δ₁)/2`; trivial σ-algebra on `{0,1}` | cylinder on `E⊂[−m,m]` sees zeros for `n>m`; two-point functions `¼` against `½`; trivial σ-algebra: trace on `{0̄,1̄}` has 2 sets, Borel has 4 | true; discrete σ-algebra needed |
| 4.6 `gibbsInvariant_isExtreme` | `μ=aμ₁+bμ₂`; `I=∅` | `dμ₁/dμ≤1/a`, invariant, tail-measurable version by 4.2, then `∫γ_Λ(C|·)f dμ=∫γ_Λ(f1_C|·)dμ=∫f1_C dμ`; `I=∅`: both sets `{δ}` | true |
| 5.2 cylinder identities | `ℤ`; `C₆` | `ℤ`: completion sets singletons; `C₆`, `F` all edges: masses `½,½`; gauge multiplies both matchings by `∏g(v)` | true |
| 5.4 `IsLozengeGibbs` (repaired Check) | `δ_∅`, `F={(0,3)}`, `ω=M₃`; `2δ_{M₃}` | `E⊇` edges of `W(0)`, `B(0)`; `M₃∈[M₃]_E`, so the cylinder is not empty; `∅` fails `η(0,3)=true`: `δ_∅[ω]_E=0=δ_∅[ω']_E`; `F=∅`: `ω=ω'`; `2δ_{M₃}` has mass `2` | true; both extra clauses needed |
| 5.4 face and iff | `ν₃=(δ_{M₁}+δ_{M₂}+δ_{M₃})/3` | invariant, Gibbs; `{M=M₁}` invariant of mass `⅓`: not ergodic, not extreme | consistent with sheffield2005 Lemma 3.2.2 |
| 6.1 `slope` | `δ_{M_k}`; `ρ_*`; `ν₃` | `(1,0),(0,1),(0,0)`; `ρ` sends types `1→2→3→1`: `slope(ρ_*μ)=(1−s−t,s)`, at `δ_{M₁}`: `(0,1)`; `ν₃`: `(⅓,⅓)` | agree |
| 6.3(c) measures on `Φ₂` are Gibbs | `ω∉Φ₂`, `η∈Φ₂∩[ω]_E` | `η'=η` off `F`, `ω'` on `F` is a plane tiling (faces meeting `F` have all edges in `E`), finite change of `η`, so `η'=η` by (b) and `ω'=ω`; if `ω≠ω'` both cylinders miss `Φ₂`: `0=0` | true |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | `s=0,½,1` | `rowCode(e₁+ᵥω)(x)=ω((x−1,0),1)=σ(rowCode ω)(x)`; `s=1`: `{δ_{M₁}}↔{δ_{1̄}}`; `s=0`: `{δ_{M₃}}↔{δ_{0̄}}` | true |
| 6.3 `two_ergodicGibbs_of_slopeEdge` | `s=½` | `P(ε₀=ε₁=1)`: `¼` against `(½+¼)/2=⅜`; `β_s(A)=(β(A)+β(σ⁻¹A))/2=β(A)∈{0,1}`; `(s,0)↦(1−s,s)↦(0,1−s)` under `ρ` | true |
| 7.1–7.3 torus | floor tiling; `n=0`; `(½,0)` | `⌊ax/n₁+by/n₂⌋`: increments `≤a/n₁+b/n₂≤1`; `n=0`: infinite set, `uniformOn=0`, one term of the sequence; `C(2m−k,m−j)/C(2m,m)→2^{−k}`; slope `⌊ns⌋/n→s` | true |
| 8.1 `twistedKasteleyn` | `1×1`; `1×2` unit and signed | `1×1`: `w₃+(−1)^b w₁+(−1)^a w₂`, `(1,1,2)`: `K₁₁=0`; `1×2` unit by 8.5: `3·1=3`, `(2−i)(2+i)=5`, `1·(−1)=−1`, `(−i)(i)=1`; signed weight: `K₀₀=[[0,1],[1,2]]`, `K₀₁=[[0,−1],[1,2]]`, `K₁₀=[[−2,1],[1,0]]`, `K₁₁=[[−2,−1],[1,0]]`, dets `−1,1,−1,1` | agree; seam convention pinned |
| 8.2 sign formula | `2×2`, `a=b=0` | exponents `h₁h₂+3h₁+3h₂`: `+,−,−,+,+,−` on `(0,0),(1,0),(0,1),(2,0),(0,2),(1,1)`; `1−2−2+1+1−2=−3` (counts: r2) | agree with `det K₀₀` |
| 8.3 `torus_partitionFunction_eq` | all parities; `1×1`; `2×2`; `1×2` signed | `Σ_{ab}ε_{ab}(−1)^{ah₂+bh₁}` is `2` for `h` even-even and `−2(−1)^{a₀h₂+b₀h₁}` otherwise, total `−2(−1)^{h₁h₂+h₁+h₂}=2`; `1×1`: `(2w₁+2w₂+2w₃)/2`; `2×2`: `(3+5+5+5)/2=9`; signed: tilings `−1,1,1,−1,1`, sum `1=(−1+1+1+1)/2` | true; `ε` = table (3.4) of gorin2021 |
| 8.4 torus correlations | `2×2`, weights `(2,3,5)` | eigenvalues `5+3z+2/w`: `10·6·4·0=0`; `68·8=544`; `58·18=1044`; `26·50=1300`; `Z=1444`; `5·380/2888=25/38` (`c_{ab}`: r2) | agree |
| 9.1 row kernel | arc `|w₃+w₂e^{iθ}|<w₁` | `cos θ=(w₁²−w₂²−w₃²)/(2w₂w₃)=−cos θ₁`, arc `π±θ₁`; `(2π)⁻¹∫e^{imθ}=(−1)^m sin(θ₁m)/(πm)`; `m=0`: `θ₁/π` | agree with the angle formula |
| 9.2 good sizes | `θ=π/2`; `2π/3` | even `n`: distance `0`; odd: `π/(2n)>n^{−3/2}`; `n=4`: `π/12≈0.262>0.125`; if `n,n+1∉W_θ` then `|j−kn|=O(√n)` with `k=j'−j`, so `θ/π` is within `O(n^{−½})` of an integer | (a) true with `n+1` |
| 9.6–9.7 kernel | diagonal; vertical pair; row; `ξ=e^{πi/3}` | `∮dz/z` across `(0,1)`: `s`; `K(v₁;v₂)=−(1−s)+t`; `K(v₂;v₁)=s−Im ξ/π`; row: `(ξ^m−ξ̄^m)/(2πim)=|ξ|^m sin(πsm)/(πm)`; `1/9+(1/3)(1/3−√3/(2π))=2/9−√3/(6π)`; (a) at the vertical pair: `G(0,−2)=−K(v₂;v₁)`, `G(0)=−K(v₁;v₂)`; `s=½` row: `¼−1/π²≈0.149` | agree with 9.3 |
| 9.7(f), uniqueness | two tilings with `X={(0,y):y≤0}` | row offsets `c_x`: `a'_x=1⇒c_x=0`, `a_x=1⇒c_{x+1}=0`, so one nonempty row of each consecutive pair fixes the offset; `H=1` and `H=y` on rows `y≥1` are both height functions over `H=1_{x>0}` | true; Aggarwal's remark fails |
| 10.1–10.2 | sign of the shift; `H=min(0,x,y)` | `(M−v_N)∩E={e:e+v_N∈M}` = the Lean event; `H(e_k)=0=H(−e_k)+1`: flip at `0`, `δ_{M_c}` not Gibbs; swap on `F+v_N` maps tilings of `R_N` to tilings once the faces meeting `F+v_N` lie in `R_N` | convention pinned; (d) true |
| Layer 7 dependency line (repaired) | union of `*Needs:*` of 7.1–7.3 | `{1.5,2.5}∪{7.1}∪{4.4,5.3,5.4,6.1,7.2}` → Layers `1,2,4,5,6` | agree |
| 7.3 locator (repaired) | gorin2021 lines 4689–4694, 1853 | heading of Section 13.4; torus computation named as a local limit; Theorem 4.11 at line 1853 | supported |

### Sources: the seeded sample, read at the locators

Eight texts read; thurston1990 and georgii2011 are settled as uncertified. The author flagged no
locator as unverified.

- 1.2: gorin2021 lines 690–700 (hexagonal dual, bipartite, tilings as perfect matchings); kenyon2009
  lines 95–113 (dimer coverings, the honeycomb as prototype). Supported.
- 1.6: gorin2021 lines 4638–4642 (extreme slope: one proportion zero); kenyon2009 Exercise 13, line
  891. Supported.
- 2.1: aggarwal2023 lines 338–341 (`V(R)`, `F(R)`, simple connectivity, boundary); gorin2021 lines
  454–457 (consistency of the local rule); kos2006 lines 177–181 (flux independent of the path).
  Supported.
- 2.5: aggarwal2023 lines 384–399; gorin2021 lines 447–458; kenyon2009 Section 2.2, lines 353–385.
  Supported.
- 2.6: aggarwal2023 lines 380–401 (free tilings and height functions); gorin2021 lines 511–514.
  Supported.
- 2.7: aggarwal2023 lines 403–407 (boundary height independent of the tiling); gorin2021 lines
  511–514. Supported.
- 3.3: gorin2021 Theorem 3.5 (lines 1281–1288) and its proof from line 1294; kenyon2009 Corollary 3
  (lines 557–565, with the Jacobi lemma); kenyon1997 Theorem 6 (lines 362–373). Supported.
- 4.1: sheffield2005 lines 1341–1344 (tail events as the intersection over finite sets).
  Supported.
- 4.4: gorin2021 Definition 13.1 and Lemma 13.2 (lines 4509–4519); aggarwal2023 lines 412–418.
  Supported.
- 5.2: kos2006 lines 195–202; kenyon2009 lines 781–809; gorin2021 Definition 13.4 (lines
  4534–4537). Supported.
- 5.4: aggarwal2023 lines 412–420; kenyon2009 lines 869–878; sheffield2005 Lemma 3.2.2 (lines
  1367–1371: the equivalence and the face property); gorin2021 Definition 13.6 and Lemma 13.7
  (lines 4556–4582), Exercises 13.3 and 13.9 (4520, 4583–4585); kenyon2009 lines 825–835. Supported.
- 6.1: aggarwal2023 lines 421–431 and 453–456; gorin2021 Definition 13.10 and Remark 13.11 (lines
  4590–4627); kos2006 lines 203–205; kenyon2009 lines 829–832. Supported.
- 6.3: sheffield2005 Theorem 9.5.1 (lines 6195–6198); gorin2021 lines 4638–4642; kenyon2009
  Exercise 13. Supported.
- 8.1: gorin2021 Definition 3.9 (lines 1452–1457); kenyon1997 Section 4.1 (lines 380–390).
  Supported.
- 8.3: gorin2021 Theorem 3.10 and table (3.4) (lines 1458–1472: the README's rule for `ε_{ab}`
  reproduces the four columns); kenyon2009 equation (3), line 724 (odd `n`, minus sign on `Z₁₁`);
  kenyon1997 Lemma 7 (lines 392–396); kos2006 lines 657–666. Supported.

Further locators opened outside the sample, all as cited: gorin2021 Theorem 1.4 (521), Corollary
1.5 (613), 756, 1199, Proposition 3.7 (1416), Theorem 4.10 (1847), Theorem 4.11 (1853), Theorem 6.1
(2269–2279), Exercise 6.2 (2281), Corollary 6.3 (2287), 4494, 4744, Corollary 13.16 (4762);
kenyon2009 428, Theorem 2 (504), 665, Lemma 4 (682), Lemma 5 (698), 845, 860–866, 976–980, 1011;
kos2006 187–192, 239, Theorem 2.1 (215–220), Theorem 4.3 (714), 728–735; kenyon1997 85–93, Lemma 8
(401–406); sheffield2005 303, Lemma 3.2.1 (1352); aggarwal2023 Example 1.1 (370), Definitions
1.2–1.3 (463–476), equation (1.2) (491–507), Theorem 1.5 (568–574); okounkov-reshetikhin2003
Definition 4 (965–968), Theorem 2 (993), equation (36) (1076); cohn-kenyon-propp2001 Section 1.4
(341, 404–412).

### Library declarations opened at the pins

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the revisions of `lake-manifest.json`). Opened, with
the line where the declaration stands, all as the README says: `SimpleGraph.fromRel` 135,
`SimpleGraph.toSubgraph` 574, `isPerfectMatching_iff` 254, `Walk.darts` 123, `Set.BijOn` 318,
`Relation.ReflTransGen` 374, `arrowAddAction` 101, `VAddInvariantMeasure` 51, `ErgodicVAdd` 31,
`ErgodicSMul` 43, `Ergodic` 49, `MeasurePreserving` 44, `uniformOn` 60, `Measure.real` 102,
`Measure.bind` 235, `MeasurableSpace.comap_mono` 121, `measurable_id''` 233, `Matrix.submatrix`
457, `Matrix.det_apply` 66, `measurableCylinders` 275, `isPiSystem_measurableCylinders` 335,
`univ_mem_measurableCylinders` 345, `generateFrom_measurableCylinders` 366, `cylinderEvents` 409,
`cylinderEvents_mono` 415, `cylinderEvents_le_pi` 418, `Filtration.cylinderEventsCompl` 534,
`isSetRing_measurableCylinders` 57, `IsPiSystem.comap` 106,
`exists_measure_symmDiff_lt_of_generateFrom_isSetRing` 86, `Kernel` 55, `Kernel[𝓑, 𝓧]` notation 70,
`IsMarkovKernel` 138, `Kernel.comp` 50, `Kernel.comap` 152, `Kernel.id` 111, `Kernel.IsProper` 47,
`isProper_iff_inter_eq_indicator_mul` 57, `IsProper.setLIntegral_eq_comp` 73, `Kernel.Invariant`
39, `mulShift` 150, `Subshift` 233, `MulSubshift` 253, `isOpen_cylinder` 214, `isClosed_cylinder`
219, `measure_zero_or_one_of_measurableSet_limsup` 229 and its `_atTop` form 290, the
`CompactSpace (ProbabilityMeasure E)` instance 176, `tendsto_measure_of_isClopen_of_tendsto` 362,
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem` 829, `infinitePi_map_piCongrLeft` 494,
`iIndepFun_infinitePi` 124, `iIndepFun_iff_iIndep` 231, `iIndepFun.precomp` 323,
`Subtype.borelSpace` 188, `Pi.borelSpace` 645, `DiscreteMeasurableSpace.toBorelSpace` 673,
`Bool.borelSpace` 697, `Bool.instMeasurableSpace` 26 (`⊤`), `Pi.compactSpace` 1175,
`Function.compactSpace` 1178, `IsSimplyConnected` 137, `existsUnique_continuousMap_lifts` 489,
`AddCircle.isCoveringMap_coe` 32, `tendsto_integral_exp_inner_smul_cocompact` 177. Tau Ceti:
`invariantMeasuresOfMeasureUnivEq` 75, `ErgodicSMul.iff_mem_extremePoints` 239,
`exists_smul_invariant_ae_eq` 53, `ergodicSMul_iff_forall_smul_invariant` 68,
`isExtreme_setOf_measure_eq_zero` 40, `tailFamily` 42, `tailProcess` 47, `arrayTail` 43,
`det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv` 160,
`det_mul_det_submatrix_adjugate` 54, `Matrix.gibbsState` 61, `ergodic_shift_infinitePi_const` 63,
`TauCeti.IsPerfectMatching`.

Duplication by object: a search of both pinned libraries for Kasteleyn, lozenge and dimer finds only
Mathlib's four-functions file (Fortuin–Kasteleyn–Ginibre). No target is proved at the pin.

### Cross-roadmap citations resolved

On main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788: infinite discrete `Γ`,
finite `S`, at least two positive weights); FactorRigidity §8.3 "Bernoulli enlargements and the
descent lemma" (line 767); TensorProductCombinatorics §1.1 "The lattice, rhombi and hives" (line
465); RandomMatrices §8.3 and §8.4 (lines 1183, 1253); GraphConnectivityAndFlows §6.7 (line 753,
finite bipartite multigraphs with a perfect-matching predicate). At its open head:
ClassicalErgodicTheory §0.3 item 2 (the Bernoulli action `(g • x) h = x (g⁻¹ * h)` on `G → α`) and
§1.4 item 2 (mixing for infinite countable groups). All are scope deferrals: no `*Needs:*` line
names a roadmap, and the package declares no gap (`design/plan.json`: `"gaps": []`).

### Dependency check

    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Duplication and overlap audit

The overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no id
is defined only by an open revision, no second copy (main has no folder of this name). Searches
over the open heads and main, by object: Kasteleyn (only the Potts–Fortuin–Kasteleyn identity of
TemperleyLiebOperatorAlgebras), lozenge, dimer, discrete sine, tileability (no match), Gibbs
measure (ClassicalErgodicTheory §8.4 and §8.6, Bowen's property of an invariant measure of a map;
PDE, a renormalised measure), tail σ-algebra (Exchangeability and
ProbabilisticAndMetricNumberTheory, both `ℕ`-indexed), determinantal (PointProcesses, continuous
spaces). In Lean files: `Subshift`, `Specification`, `TriEdge`, `hexGraph`, `IsTiling`,
`torusMeasure` occur in no other roadmap under this namespace; `incompleteBeta` of
SpecialFunctionsEiLiErfIncompleteGamma is the real incomplete beta function, a different object
from the contour-integral kernel `incompleteBetaKernel`. No declaration of `Suggested.lean` has the
fully qualified name of a declaration in a roadmap I could read.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, Exchangeability,
ProbabilisticAndMetricNumberTheory, StochasticCalculus; Bernoulli action of a countable group on
`G → α`: VonNeumannAlgebras on main for finite `S`, also built by the open ClassicalErgodicTheory,
this roadmap keeps the proper-action variant 4.3 and says how it differs; `ℕ`-indexed tail
σ-algebra: Tau Ceti `tailProcess`, cited and identified with 4.1; nothing else shared.

### Shape and style

Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib, From Tau Ceti),
How to read the build, ten layers, Downstream consumers, Worked examples, References. No LaTeX
delimiters, pull-request numbers, dates, machine paths, HTML anchors, field lists or
target-numbering tables (a search for process words returns nothing but the remark on kenyon2009 in
6.4, which is a statement about a source). No layer is named after a source.

### Copyright, licences and scope

Wording: 16 passages set beside the texts at their locators (the fifteen sampled targets and the
repaired sentence of 7.3; among them the definitions of 2.1, 2.6, 4.1, 5.2 and 6.1 and the
docstrings of `IsLozengeGibbs` and `twistedKasteleyn`). None reproduces a source sentence or follows
one clause by clause; what coincides is forced (the increment condition `∈ {0,1}`, the formula of
Theorem 3.5, the four-determinant identity). Arrangement: gorin2021 has the largest share, 47 of
158 locators; its lectures 1, 2, 3, 4, 6 and 13 are used; Layer 4 has no counterpart there, and
Layers 5, 6 and 10 draw on Lecture 13 while standing before and after Layers 7–9 (Lectures 3, 4,
6), so no run of layers maps one to one onto a run of lectures. Reuse: table (3.4) of gorin2021 is
restated as a rule; the unit-hexagon matrix of 3.1 coincides with the worked example of gorin2021
lines 722–744 (to the humans, below).

Source independence: 16 passages compared with 6 sources, none shared; largest share gorin2021, 47
of 158 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Theorem 6, Lemma 7 and Lemma 8: the sentences are readable, the displayed formulas are
  lost in the text extraction; the identities were checked by computation instead.
- gorin2021 Definition 3.9 refers to a figure for the sides of the fundamental domain; the pairing
  of `a` with the seam crossed by type-2 lozenges was confirmed on the `1 × 2` torus
  (`det K₁₀ = −1`, `det K₀₁ = 5`), not from the figure.
- The restricted Leibniz sums `c_{ab} = (60, 100, 150, 190)` of 8.4 and the numerics of 9.7 at slope
  `(0.3, 0.45)` were not recomputed this round; round 2 computed them and the surrounding
  arithmetic (determinants, `Z = 1444`, `25/38`, the three ratios) was recomputed here.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 863–866: the source says there is a unique ergodic Gibbs measure for every slope admitting an invariant measure and deduces ergodicity from extremality in a slope fibre; it should restrict uniqueness to interior slopes, and fibre-extreme measures need not be ergodic; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require type-1 lozenges in one of every two consecutive rows (two tilings share the positions `{(0,y) : y ≤ 0}`); affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The 3 × 3 unit-hexagon matrix and its column-swap remark in README 3.1 (lines 953–955) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.
- **Licence.** The field `Specification.comp_eq` (`Suggested.lean` lines 305–307) states consistency of a specification as a public Gibbs-measure formalisation may also do; no such repository was opened.
- **Scope.** Interior uniqueness, the variational principle and Aggarwal's theorem are left to DimerModelsAndLozengeTilingsPartII (README lines 129–137), which no pull request or package carries yet.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "68fc304fa86b092a09fd6fe90b0706b8d4b5a58c", "job": "REV-PKG-DimerModelsAndLozengeTilings~3", "model": "fable", "worker": "chris-x79"} -->
