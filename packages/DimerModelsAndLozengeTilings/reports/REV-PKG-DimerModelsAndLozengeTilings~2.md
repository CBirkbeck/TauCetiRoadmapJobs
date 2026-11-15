<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6898405333 -->
Review (claude) of 9318f6e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Layer 7 dependency line omits Layer 4

   - **Location.** `packages/DimerModelsAndLozengeTilings/README.md` line 1680, Layer 7
     `### Dependencies`: "Layers 1, 2, 5, 6."
   - **Claim.** Layer 7 depends on Layers 1, 2, 5 and 6 only.
   - **Witness.** The same layer's target 7.3, line 1662: "*Needs:* 4.4, 5.3, 5.4, 6.1, 7.2; Mathlib
     compactness of `ProbabilityMeasure`", and 7.2 (line 1632) needs Mathlib
     `ProbabilityTheory.uniformOn`. Layer 6's line, by contrast, lists Layer 4.
   - **Repair.** Replace the line by "Layers 1, 2, 4 (the weak topology of 4.4, for 7.3), 5, 6; Mathlib
     `ProbabilityTheory.uniformOn` and the compactness of `ProbabilityMeasure`." No `*Needs:*` line
     changes; the dependency check is unaffected (it reads no intra-roadmap layer lines).

2. **F02** (P3) "gorin2021 Section 3.3" is cited in 7.3 for a statement it does not contain

   - **Location.** README 7.3, lines 1651–1653: "(kenyon2009 Section 5.4, lines 844–866; kos2006
     Theorem 2.1, lines 215–220, whose existence half this is, without the ergodicity of the limit;
     gorin2021 Section 3.3)".
   - **Claim.** gorin2021 Section 3.3 supports "every weak limit point of the torus measures is a
     translation-invariant Gibbs measure of the prescribed slope".
   - **Witness.** gorin2021 Section 3.3 (lines 1353–1504) sets up torus tilings and proves the
     four-determinant count (Theorem 3.10); it has no limit and no Gibbs property. The torus as a source
     of local limits is gorin2021 lines 4689–4694.
   - **Repair.** Replace "gorin2021 Section 3.3" in that parenthesis by "gorin2021 lines 4689–4694, for
     the torus computation read as a local limit". 7.1 keeps its citation "gorin2021 Section 3.3, lines
     1353–1392" for the torus itself, which is correct.

3. **F03** (P3) a Check of 5.4 calls two nonempty cylinders "empty"

   - **Location.** README 5.4, Checks, lines 1458–1459: "(a plane tiling has an edge in every face, so
     both cylinders are empty unless `F = ∅`, when `ω = ω'`)".
   - **Claim.** For plane tilings `ω`, `ω'` and `F ≠ ∅`, the cylinders `[ω]_E` and `[ω']_E` are empty.
   - **Witness.** `[ω]_E = {η | ∀ e ∈ E, η e = ω e}` contains `ω`. What the Check needs: `E` contains
     the three edges of a face, on which `ω` is not identically `false`, so the empty configuration is
     in neither cylinder and the point mass gives both mass `0`.
   - **Repair.** Write "(a plane tiling has an edge in every face, so for `F ≠ ∅` neither cylinder
     contains the empty configuration and both have mass `0`; for `F = ∅`, `ω = ω'`)". Tested on
     `ω = M₃`, `F = {(0,3)}`, `E` the five edges of `W(0)` and `B(0)`: `[M₃]_E ∋ M₃` is not empty, and
     the empty configuration fails `η(0,3) = true`, so its point mass gives the cylinder `0`.

4. **F04** (P3) the bibliography line for georgii2011 misses the 5.4 citation

   - **Location.** README References, lines 2181–2183: "cited by bibliographic data, Theorem 14.15, for
     4.2 and 4.6".
   - **Claim.** georgii2011 is cited for 4.2 and 4.6 only.
   - **Witness.** README 5.4 line 1436 ("georgii2011 Theorem 14.15") and `Suggested.lean` line 373, both
     added by the repair of F03; `sources.toml` already records "4.2, 4.6, 5.4".
   - **Repair.** Write "for 4.2, 4.6 and 5.4".

Four findings, all P3 (0 blocking). The four repairs of round 1 are all in place and correct. No
statement of `Suggested.lean` or of the README was found false, vacuous or unowned; the elaboration
passes with `sorry` as the only warning; the dependency check reports no problem. The four repairs
asked for here are a layer dependency line, one locator, the wording of one Check and one
bibliography line.

## Round 1 findings, one by one

- **F01 (scope clause for ClassicalErgodicTheory): repaired.** `packages/DimerModelsAndLozengeTilings/README.md`
  lines 100–102 now read "and the Bernoulli action of a countable discrete group `G` on `G → α` for
  any measurable `α` and probability law, with its mixing for infinite `G`, which
  ClassicalErgodicTheory §0.3 (item 2) and §1.4 (item 2) build". Resolved at the open head of
  ClassicalErgodicTheory: §0.3 item 2 constructs the action `(g • x) h = x (g⁻¹ * h)` on `G → α` for
  every countable discrete `G`; §1.4 item 2 proves mixing for infinite countable `G`. It is a scope
  deferral only: no `*Needs:*` line names it and the dependency check has no edge to it.
- **F02 (`Subshift` docstring): repaired.** `Suggested.lean` lines 259–261: "Mathlib's
  `SymbolicDynamics.FullShift.MulSubshift` (additively `SymbolicDynamics.FullShift.Subshift`) is the
  case `I = Γ`". At the pin, `Mathlib/Dynamics/SymbolicDynamics/Basic.lean` line 253 is
  `structure MulSubshift` and line 233 is `structure Subshift … [AddMonoid G]`.
- **F03 (face property locator): repaired.** README 5.4, lines 1435–1438: "(sheffield2005 Lemma
  3.2.2, lines 1367–1371, for the face property and the equivalence; georgii2011 Theorem 14.15;
  gorin2021 Definition 13.6 and Lemma 13.7 … for the two notions of ergodicity)"; the two Lean
  docstrings (lines 372–374 and 382–386) follow. sheffield2005 lines 1367–1371 state both the
  equivalence (extreme in the invariant Gibbs measures iff ergodic) and the face property.
- **F04 (gorin2021 lines 4638–4642): repaired.** README 6.2, lines 1512–1513, now cites "gorin2021
  Exercises 13.3 and 13.9, lines 4520–4526 and 4583–4585"; 1.6 (lines 632–633) and 6.3 (lines
  1544–1545) attach lines 4638–4642 to the definition of an extreme slope, which is what those lines
  contain. No other occurrence of the old locator remains.

The repaired patterns were searched for in the rest of the package; that search produced R04 below
(the bibliography line for georgii2011 was not updated with the 5.4 citation) and nothing else.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean` from the
content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184, 198,
234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message. Imports:
`import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant`). No `set_option`, `#eval`, `#print`, `#synth`, `lemma`, `opaque`,
sorried data or admitted `example`; no line over 100 characters.

**Signatures.** `#check @name` for all 57 declarations on a scratch copy, elaborated once. Every
theorem carries its hypotheses in its own signature; `gibbsInvariant_isExtreme` shows `[Group Γ]
[Countable Γ] [Infinite Γ] [MulAction Γ I] [Countable I] [DecidableEq I] [Finite S]
[TopologicalSpace S] [DiscreteTopology S] [MeasurableSpace S] [DiscreteMeasurableSpace S]`, the
properness hypothesis, `X`, `γ`, `γ.IsEquivariant`. Nothing lost, nothing changed since round 1.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | (exact ⟨fun _ h => h.1, by simp⟩) | aesop`
on a scratch copy: 17 of 17 fail. No padding: no boundary-case theorem, no mirrored Check, no value
computation; each of the 40 definitions and instances is used by a headline statement.

**Headline theorems (README summary, lines 18–28) against `Suggested.lean`.** 1.5
`tilingSubgraph_bijOn`; 2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9
`thurston_tileable_iff`; 3.2 `partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6
`gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic`; 5.4
`lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic`; 6.3
`slopeEdge_ergodicGibbs_equiv`, `two_ergodicGibbs_of_slopeEdge`; 7.3
`torusLimit_mem_gibbsInvariant_slope`; 8.3 `torus_partitionFunction_eq`; 9.5
`exists_ergodicGibbs_of_slope`; 9.7 `incompleteBetaProcess_exists_unique`; 10.2
`localLimit_isLozengeGibbs`. 5.3 is named in the module docstring as not stated separately, with its
reason; it is 4.6 applied to the specification of 5.2, and both the general theorem and the lozenge
instance are stated. I agree with round 1 that it is not an absent headline.

**Names.** All 57 Lean names occur in the README; every backticked name the README attributes to
this roadmap is declared (script over both files: none missing in either direction).

**Remarks that need no change.** (i) `slopeEdge_ergodicGibbs_equiv` carries `0 ≤ s ≤ 1`; for `s`
outside `[0,1]` both sets are empty and the statement holds trivially, so the hypotheses only exclude
the vacuous range the README also excludes. (ii) The route of 4.6(b) does not use equivariance of
`γ` (invariant densities have tail-measurable versions by 4.2, then 4.6(a)); the hypothesis is the
one under which the sources state the theorem (sheffield2005 Lemma 3.2.2) and under which `𝒢(γ)` is
invariant, and is kept.

### Adversarial table (computed values)

Rows for the sampled targets, the headline theorems, the passages the repairs changed, the sections
round 1 summarised without values, and the targets of the findings. Rows of round 1 that carried
computed values (2.5, 2.7, 2.9, 3.3, 4.5, 8.3 on ten torus sizes, 9.1, 9.5, 9.6–9.7 numerics, 10.2)
were relied on and spot-checked where marked "again".

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1 faces, edges, `ρ` | `W(0)`, `B(0)`, `ρ` on `(0,0),(1,0),(1,1)`; reflection | `ρ(1,0)=(0,1)`, `ρ(1,1)=(−1,0)`, so `ρ(W(0))={(0,0),(0,1),(−1,0)}=W(−e₁)`; `ρ(e₂)=(−1,−1)=−e₃`, `ρ(e₃)=−e₁`; swap sends `W(0)` to `{(0,0),(0,1),(1,1)}=B(0)`; Lean `TriFace.edges` white `⟨v,0⟩,⟨v+(1,0),1⟩,⟨v,2⟩` = README | agree |
| 1.1 six faces at a vertex | `v = 0` | `W(0), W(−e₁), W(−e₃), B(0), B(−e₂), B(−e₃)` each contain `0`; no seventh (a face `W(u)` contains `0` iff `u ∈ {0,−e₁,−e₃}`) | true |
| 1.2 `hexGraph`, the 6-cycle | faces at `0`, edge by edge | `(0,3)∈W(0),B(0)`; `(0,2)∈B(0),W(−e₁)`; `((−1,0),1)∈W(−e₁),B(−e₃)`; `((−1,−1),3)∈B(−e₃),W(−e₃)`; `((0,−1),2)∈W(−e₃),B(−e₂)`; `(0,1)∈B(−e₂),W(0)`; `W(0)∩B(1,−1)={(1,0)}`, no common edge | true; vertex-adjacency would join `W(0)`, `W(e₁)` |
| 1.3 `3|R| = 2|E°| + |E∂|` | `{W(0)}`; `R₆` | `3 = 0 + 3`; `18 = 12 + 6` | true |
| 1.3 boundary of `Faces(V)` | `V` = 7 vertices of `R₆`; `V={(0,0),(1,0)}` | `Faces(V) = R₆` (e.g. `W(0,−1)` needs `(1,−1) ∉ V`); Aggarwal's boundary = 6 neighbours of `0` = `∂R₆`; second `V`: `Faces = ∅`, hypothesis fails; general argument via the 6-cycle of faces at a vertex | true with the stated hypothesis |
| 1.6 row tilings | `ε=1_{[0,∞)}`; column reading with `ε=1_{{0}}` | `B(x,y)` has edges `((x,y),2), ((x,y+1),1), ((x,y),3)`, exactly one selected by `ε_x`; column reading leaves `B(x,0)` uncovered (`ε₁=0`, `ε₀=1`) | true |
| 2.1/2.3 `R_ring`, holes | the 12 faces listed; `Q={W(0)}`; five faces at `0` | neighbours of `W(0)`: `B(0,0), B(0,−1), B(1,0)`, all in the ring; dual-path cochain sums to `±1` on `∂Q`; for the five faces, `B(e₁)` shares `(e₁,2)` with `W(0)` and is in neither set; finite `R`: a finite complementary component is such a `Q` | true; hypothesis sharp |
| 2.6 the tiling `T` of `R_ring` | six edges, twelve faces | `(0,2)`: `B(0,0),W(−1,0)`; `((1,1),1)`: `W(1,1),B(1,0)`; `((0,−1),3)`; `((−1,−1),3)`; `((1,0),1)`: `W(1,0),B(1,−1)`; `((1,1),2)`: `B(1,1),W(0,1)`; each ring face once; round `W(0)`: `0 + 0 − 1 = −1` | true; no height function |
| 2.8 flip, `IsFlip` (again) | `T_a` at `v = 0` | `{(0,3),(−e₁,1),(−e₂,2)} ↦ {(0,1),(0,2),(−e₃,3)} = T_b`; black partners `B(0),B(−e₃),B(−e₂) ↦ B(−e₂),B(0),B(−e₃)`, a 3-cycle | true |
| 3.2 Kasteleyn (again) | hexagon; `R_ring` with `T`, `T'` | `det[[c,0,a],[b,a,0],[0,c,b]] = abc + abc = 2abc`; `T'` checked edge by edge (six lozenges, twelve faces), `T`, `T'` alternate round the 12-cycle, partners differ by a 6-cycle (odd): `det = 1 − 1 = 0 ≠ 2` | true; simple connectivity needed |
| 4.1–4.2 tail events | trivial action on a point; properness | `F = F' = {i}`: stabiliser finite, orbit infinite, so `I` infinite or empty; `μ(A Δ γ_kC_k) = μ(A Δ C_k) < 2^{−k}`, `limsup` in every `𝓕_{Λ_nᶜ}`; trivial action: event of mass `1/2`, tail trivial | true; properness and `Infinite Γ` needed |
| 4.6(a) | independent specification, `f = 2·1_{ω(0)=1}` | `∫γ_Λ(C)f dμ = ∫γ_Λ(f1_C) dμ = ν(C)` for exterior-measurable `f`; the non-tail `f` gives coordinate `0` law `δ₁ ≠ Bern(1/2)` | true; tail hypothesis needed |
| F01 clause (changed) | `G = ℤ`, `x = 1_{{0}}`, `g = 1` | ClassicalErgodicTheory: `(1•x)(h) = x(h−1)`; 4.3: `(γω)(i) = ω(γ⁻¹i)`: both `1_{{1}}` | same action; 4.3 differs as stated |
| F03 (changed) 5.4 face and iff | `ν₃ = (δ_{M₁}+δ_{M₂}+δ_{M₃})/3` | in `lozengeGibbsInvariant`; face gives each `δ_{M_k}` Gibbs; `{M = M₁}` invariant of mass `1/3`: not ergodic, not extreme | consistent with sheffield2005 3.2.2 |
| F04 (changed) extreme slopes | `(s,0)`, `(0,t)`, `(s,1−s)`, `(1/3,1/3)` | proportions `(s,0,1−s)`, `(0,t,1−t)`, `(s,1−s,0)` have a zero; `(1/3,1/3,1/3)` none | edges = Gorin's extreme slopes |
| 5.2 cylinder identities | `ℤ` with `F` finite; `C₆`; any `E ⊇ F` | endpoints of `F` covered from inside are the same for `ω` and `ω'` (they agree off `F`), so swapping `ω`|F for `ω'`|F maps matchings to matchings: `μ[ω]_E/w(ω∩F) = μ[ω']_E/w(ω'∩F)`; `ℤ`: singletons; `C₆`: masses `1/2, 1/2` | true; gauge factor `∏g` over the same endpoints |
| 5.4 `IsLozengeGibbs` Checks | `δ_∅`; `2δ_{M₃}`; `M₃`, `F={(0,3)}` | `δ_∅[ω]_E = 0 = δ_∅[ω']_E` for `F ≠ ∅` (cylinders are not empty sets: R03); `2δ_{M₃}` has mass `2` | clauses needed; wording R03 |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | `s = 0, 1/2, 1, 2`; `rowCode` | `rowCode(e₁ +ᵥ ω)(x) = ω((x−1,0),1) = σ(rowCode ω)(x)`; (b): `H'` nondecreasing on vertical lines and equal to the constant `H_M` far up and down, so `M' = M`; `s = 2`: both sets empty | true |
| 6.3 `two_ergodicGibbs_of_slopeEdge` | `s = 1/2`; `ρ` | `P(ε₀=ε₁=1)`: `1/4` (Bernoulli) against `(1/2 + 1/4)/2 = 3/8` (`β_s`); `β_s(A) = β(A) ∈ {0,1}`; `(s,0) ↦ (1−s,s) ↦ (0,1−s)` | true |
| 6.4 | `ν₃`; `sδ_{M₁} + (1−s)δ_{M₃}` | slope `(a₁,a₂)` forces `a = (1/3,1/3,1/3)`; the second lies over `(s,0)` and is a proper combination of corner measures | true: fibres are not faces |
| 7.1 heights and counts | brute force, sizes `(1,1),(1,2),(2,1),(2,2),(2,3),(3,2),(3,3),(1,3)` | tilings `3, 5, 5, 9, 17, 17, 42, 9`; type counts `n₂h₁`, `n₁h₂` in every tiling; attained height changes exactly `n₂a + n₁b ≤ n₁n₂`; `2×2`: `1,2,2,1,1,2` for `(0,0),(1,0),(0,1),(2,0),(0,2),(1,1)` | true |
| 7.2 Checks | `2×2` | height change `(1,0)`: 2 tilings; unit weights: `Σh₁·count = 6`, slope `6/(9·2) = 1/3` | agree |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | `n = 0`; `s = 2`; `φ` constant `3`, `(1/3,1/3)`; slope | `n = 0`: infinite set, `uniformOn = 0`, one term; `s = 2`: `⌊2n⌋₊ > n`, set empty, limit `0`, so the triangle hypotheses are needed; `H = ⌊(x+y)/3⌋` admits a flip at `x+y ≡ 2`, so a fixed torus measure is not Gibbs and `StrictMono` is needed; `μ_n{(0,1)∈M} = n·h₁/n² = ⌊ns⌋/n → s` | true |
| 8.1 `twistedKasteleyn` (Lean matrix transcribed) | `1×1`; `1×2`; `2×2`, unit weights | `1×1`: `w₃+(−1)^b w₁+(−1)^a w₂`, `(1,1,2)`: `K₁₁ = 0`; `1×2`: `det K₀₀, K₀₁, K₁₀, K₁₁ = 3, 5, −1, 1`; `2×2`: `−3, 5, 5, 5` | agree with the Checks; seam convention pinned |
| 8.2 sign formula | all tilings of the eight sizes, random integer weights of both signs | `Σ_M (−1)^{h₁h₂+(n₂+1+b)h₁+(n₁+1+a)h₂} w(M) = det K_{ab}` for all four `(a,b)` in all eight sizes | true |
| 8.3 `torus_partitionFunction_eq` (again) | the eight sizes, unit and random signed weights | unit: `3, 5, 5, 9, 17, 17, 42, 9` on both sides; random: `7, 6, 3, 27, −34, 462, 3984, 22` on both sides | true |
| 8.4 torus correlations | `2×2`, type-3 lozenge at `W(0)`; weights `(1,1,1)` and `(2,3,5)` | unit: `c = (−1,1,1,3)`, `(1+1+1+3)/18 = 1/3` = exact; `(2,3,5)`: `det K₀₀ = 0`, `c = (60,100,150,190)`, dets `0, 544, 1044, 1300`, `Z = 1444`, formula `5·380/2888 = 25/38` = brute force | true; complementary minors needed |
| 8.5 Fourier diagonalisation | `2×2` unit; `3×3` unit; wrap-around | `(3)(1)(1)(−1) = −3`; `(2+i)(2−i)(i)(−i) = 5`; `3×3`: `det K₀₀ = 0` by brute force and by `1+ω+ω̄ = 0`; `z·f(n₁−1,y) = (−1)^a f(0,y)`, `w⁻¹f(x,0) = (−1)^b f(x,n₂−1)` | true |
| 9.2 good sizes | `θ = π/2`; `θ = 2π/3`; general | even `n`: distance `0`; odd `n`: `π/(2n) > n^{−3/2}`; `n = 4`: `π/12 ≈ 0.262 > 0.125`; `n = 3`: `0`; if `n, n+1 ∉ W_θ` then `j' − j = θ/π + O(n^{−1/2})` is an integer, impossible for large `n`; with `n+2` the integer is near `2θ/π`, possible at `π/2` | (a) true; Gorin's `n+2` false |
| 9.2(b) Riemann sums | grid `π(2k+a)/n₁` | grid angles are `πj/n₁`, so `|θ − θ₀| > n₁^{−3/2}` at both zeros; nearest terms contribute `O(n^{3/2}/n²) → 0` | true; one good coordinate suffices |
| 9.3 `μ^w` | `w = (1,1,1)`, type-1 at `(0,0)`, `(0,1)` | `u = (0,0),(0,1)`, `v = u − e₂`: `det[[G(0,−1),G(0,−2)],[G(0,0),G(0,−1)]] = 1/9 − (1/3)(√3/(2π) − 1/3) = 2/9 − √3/(6π) ≈ 0.1303`; inverse identity `w₃G(d)+w₁G(d−e₂)+w₂G(d+e₁) = [d=0]` from `P̂/P̂ = 1` | true; agrees with 9.7 |
| 9.4 | type-3 lozenges at `0`, `d`; `ν₃` | covariance `w₃²(G(0)² − G(d)G(−d)) − w₃²G(0)² = −w₃²G(d)G(−d)`; `ν₃`: `1/3 ≠ 1/9` | true |
| 9.6 `incompleteBetaKernel` (again, by hand) | `v₁=v₂`; `(0,0),(0,1)` | `∮dz/z` across `(0,1)`: `2iπs/(2πi) = s`; across `(−∞,0)`: `−(1−s)`; `K(v₁;v₂) = −(1−s) + t = −(1−s−t)`; `K(v₂;v₁) = s − Im ξ/π`; at `ξ = e^{πi/3}`: `−1/3`, `1/3 − √3/(2π)`; product gives `2/9 − √3/(6π)` | agree with 9.3 |
| 10.1 `LocalConvergence` | sign of the shift; `R₆ + v_N` | `(−v +ᵥ ω)(e) = ω(v +ᵥ e)`, so the Lean event is the README's `τ_{−v_N}`; `R₆ + v_N`: limit `(δ_{T_a}+δ_{T_b})/2`; with `+v_N` the window sits at `2v_N` from the hexagon, limit `δ_∅`; `E = ∅`: `ν(univ) = 1` | convention pinned |
| 10.2 Check 3 | `H = min(0,x,y)` | increments in `{0,1}` along `e₁,e₂,e₃`; `H(e_k) = 0 = H(0) = H(−e_k) + 1` | flip available; `δ_{M_c}` not Gibbs |

### Sources: the seeded sample, read at the locators

Eight texts read; thurston1990 and georgii2011 are settled as uncertified. The author flagged no
locator as unverified.

- 1.1: aggarwal2023 lines 324–337 (vertex set `ℤ²`, the six neighbour vectors, the two kinds of
  triangular faces); gorin2021 lines 405–420 (the six directions of the grid). Supported.
- 1.2: gorin2021 lines 690–700 (the dual hexagonal lattice, bipartite; tilings as perfect matchings);
  kenyon2009 lines 95–113 (dimer coverings, honeycomb). Supported.
- 1.3: aggarwal2023 lines 338–341 (`V(R)`, `F(R)`, simple connectivity of `F(R)`, the boundary as
  vertices adjacent to an outside vertex). Supported; the README's convention is its own and the
  comparison is an API item, checked above.
- 2.3: kenyon2009 lines 360–367 (divergence-free flows and path-independent heights). Supported as
  the cited duality; the statement is proved in the README.
- 2.8: gorin2021 lines 756–782 and the footnote at 765–769; kenyon2009 lines 537–550;
  cohn-kenyon-propp2001 Section 1.4 (from line 341; join and meet at lines 404–412). Supported.
- 3.2: gorin2021 Theorem 2.1 (714–717), Theorem 3.1 (1218–1219); kenyon2009 Theorem 2 (504) and
  lines 537–550; kenyon1997 Theorem 2 (184–186). Supported.
- 5.2: kos2006 lines 195–202; kenyon2009 lines 781–809; gorin2021 Definition 13.4 (4534–4537).
  Supported.
- 5.4: aggarwal2023 lines 412–420; kenyon2009 lines 869–878 (reweighting leaves planar Boltzmann
  measures unchanged); sheffield2005 Lemma 3.2.2 (1367–1371); gorin2021 4556–4582, Exercises 13.3 and
  13.9 (4520–4526, 4583–4585); kenyon2009 825–835. Supported.
- 6.3: sheffield2005 Theorem 9.5.1 (6195–6198); gorin2021 4638–4642 (extreme slopes); kenyon2009
  Exercise 13 (891). Supported.
- 7.3: kenyon2009 lines 844–866; kos2006 Theorem 2.1 (215–220). Supported. "gorin2021 Section 3.3"
  does not contain the statement: R02.
- 8.1: gorin2021 Definition 3.9 (1452–1457); kenyon1997 Section 4.1 (380–390). Supported.
- 8.5: gorin2021 Claims 4.1–4.2 (1545–1600) and (4.8) (1895); kenyon2009 lines 729–763; kos2006
  lines 668–679. Supported.
- 9.2: gorin2021 lines 1748–1806 (Lemma 4.7 at 1766 does say `n` or `n + 2`, as the README reports);
  kos2006 lines 691–708; kenyon2009 lines 945–952. Supported.
- 9.3: gorin2021 Theorem 4.11 (1853–1871), Corollary 13.14 (4695–4723); kos2006 Theorem 4.3
  (714–725); kenyon2009 lines 958–975. Supported.
- 10.1: aggarwal2023 lines 568–580; gorin2021 lines 4530–4541; kenyon2009 lines 786–793. Supported.

### Library declarations opened at the pins

Mathlib at `2fd255d`, Tau Ceti at `1b1ccf4` (the pins of round 1, unchanged). Opened again this
round, all as the README says: `SymbolicDynamics.FullShift.mulShift` 150, `Subshift` 233,
`MulSubshift` 253, `isOpen_cylinder` 214, `isClosed_cylinder` 219; `SimpleGraph.fromRel` 135;
`SimpleGraph.toSubgraph` 574; `isPerfectMatching_iff` 254; `uniformOn` 60; `arrowAddAction` 101;
`cylinderEvents` 409, `cylinderEvents_mono` 415, `cylinderEvents_le_pi` 418;
`Filtration.cylinderEventsCompl` 534; `IsExtreme` 63; `ErgodicVAdd` 31, `ErgodicSMul` 43;
`Pi.borelSpace` 645, `DiscreteMeasurableSpace.toBorelSpace` 673; `iIndepFun_infinitePi` 124;
`infinitePi_map_piCongrLeft` 494; `Kernel.comap` 152; `Kernel.Invariant` 39; `Kernel.IsProper` 47,
`isProper_iff_inter_eq_indicator_mul` 57, `IsProper.setLIntegral_eq_comp` 73; `Kernel.id`
(`Mathlib/Probability/Kernel/Basic.lean` 111); the `CompactSpace (ProbabilityMeasure E)` instance
(Prokhorov.lean 176, under `[T2Space E] [BorelSpace E]`);
`tendsto_measure_of_isClopen_of_tendsto` 362, `IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`
829; `IsPiSystem.comap` 106; `exists_measure_symmDiff_lt_of_generateFrom_isSetRing` 86;
`Pi.compactSpace` 1175, `Function.compactSpace` 1178; `measure_zero_or_one_of_measurableSet_limsup`
229; `IsCoveringMap.existsUnique_continuousMap_lifts`; `AddCircle.isCoveringMap_coe` 32;
`tendsto_integral_exp_inner_smul_cocompact`. Tau Ceti: `invariantMeasuresOfMeasureUnivEq` 75,
`ErgodicSMul.iff_mem_extremePoints` 239, `exists_smul_invariant_ae_eq` 53,
`ergodicSMul_iff_forall_smul_invariant` 68, `isExtreme_setOf_measure_eq_zero` 40, `tailFamily` 42,
`tailProcess` 47, `tailProcess_eq_iInf_tailFamily` 64,
`det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv` 160 (hypothesis
`IsUnit A.det`, as the README says), `det_mul_det_submatrix_adjugate` 54, `Matrix.gibbsState` 61,
`TauCeti.IsPerfectMatching`.

Duplication by object: a search of both pinned libraries for Kasteleyn, lozenge and dimer finds only
the four-functions file of Mathlib (Fortuin–Kasteleyn–Ginibre). The one same-name lead of the
library near-matches, `slope`, is Mathlib's affine slope of a function, a different object in a
different namespace.

### Cross-roadmap citations resolved

On main: VonNeumannAlgebras target V8.BernoulliArbitraryDiscrete (README line 2788: infinite discrete
`Γ`, finite `S`, two positive weights); FactorRigidity §8.3 "Bernoulli enlargements and the descent
lemma" (line 767); TensorProductCombinatorics §1.1 "The lattice, rhombi and hives" (line 465);
RandomMatrices §8.3 and §8.4 (lines 1183, 1253); GraphConnectivityAndFlows §6.7 (line 753). At its
open head: ClassicalErgodicTheory §0.3 item 2 and §1.4 item 2. All are scope deferrals; the package
names no roadmap supplier and declares no gap (`design/plan.json`: `"gaps": []`).

### Dependency check

    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Duplication and overlap audit

The overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no id
is defined only by an open revision, no second copy. Searches over the open heads and main, by
object: Kasteleyn (only the Potts–Fortuin–Kasteleyn identity of TemperleyLiebOperatorAlgebras),
lozenge, dimer, discrete sine, tileability (no match), Gibbs specification (no match), tail
σ-algebra (Exchangeability and ProbabilisticAndMetricNumberTheory, both for `ℕ`-indexed processes),
determinantal (no probabilistic match). No declaration of `Suggested.lean` has the fully qualified
name of a declaration in a roadmap I could read. Ownership against open pull requests was checked
through the roadmap search over the open heads.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, Exchangeability,
ProbabilisticAndMetricNumberTheory, StochasticCalculus; Bernoulli action of a countable group on
`G → α`: VonNeumannAlgebras on main for finite `S`, also built by the open ClassicalErgodicTheory,
this roadmap keeps the proper-action variant 4.3 and says so; `ℕ`-indexed tail σ-algebra: Tau Ceti
`tailProcess` (from Exchangeability), cited; PointProcesses places determinantal processes and
infinite-volume Gibbs processes outside its scope; the `IsGibbsMeasure` of ClassicalErgodicTheory
§8.4 is Bowen's property of an invariant measure of a map, a different object; nothing else shared.

### Shape and style

Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib, From Tau Ceti),
How to read the build, ten layers each ending with Examples and Dependencies, Downstream consumers,
Worked examples, References. Every numbered target has at least three Checks. No LaTeX delimiters,
pull-request numbers, dates, machine paths, HTML anchors, field lists or target-numbering tables (a
search for process words returns only "round" and "around" in their geometric sense). No layer is
named after a source. The layer lines agree with the `*Needs:*` lines except in Layer 7 (R01).

### Copyright, licences and scope

Wording: 13 passages set beside the texts at their locators this round (1.3 against aggarwal2023
338–341; 2.3 against kenyon2009 360–367; 2.8 and 3.2 against gorin2021 756–782 and kenyon2009
537–550; 5.2 against kos2006 195–202 and kenyon2009 799–809; 5.4 and 4.6 against sheffield2005
1367–1371; 6.2 against gorin2021 4520–4526; 7.3 against kenyon2009 860–866; 8.1 against gorin2021
1452–1457; 9.2 against gorin2021 1766–1780; 10.1 against aggarwal2023 568–580; the docstrings of
`IsLozengeGibbs` and `twistedKasteleyn`). None reproduces a source sentence; the longest shared run
is six words about a 3-cycle being even (kenyon2009 line 541), which the mathematics forces.
Arrangement: gorin2021 has the largest share, 47 of 158 locators; its lectures 1, 2, 3, 4, 6 and 13
are used, Layer 4 has no counterpart there, Layers 5, 6 and 10 draw on Lecture 13 and stand before
and after Layers 7–9 (Lectures 3, 4, 6), so no run of layers maps one to one onto a run of
lectures. Reuse: the unit-hexagon matrix of 3.1 coincides with gorin2021 lines 722–744 (reported to
the humans in round 1 and again below); table (3.4) of gorin2021 is restated as a rule.

Source independence: 13 passages compared with 5 sources, none shared; largest share gorin2021, 47
of 158 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Lemma 7 (lines 392–396) and Section 4.1: the sentences are readable, the displayed
  formulas are lost in the text extraction; the four-determinant identity was checked by brute force
  instead.
- gorin2021 Definition 3.9 refers to a figure for the sides of the fundamental domain; the pairing of
  `a` with `n₁` was confirmed by the computation on the `1 × 2` torus (`det K₁₀ = −1`,
  `det K₀₁ = 5`), not from the figure.
- gorin2021 lines 1748–1763: the display defining `W_θ` is interleaved with page markers; Lemma 4.7
  at line 1766 is readable.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, lines 1766–1780: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–866: the source says there is a unique ergodic Gibbs measure for every slope of the closed triangle and deduces ergodicity from extremality in a slope fibre; it should restrict uniqueness to interior slopes, and fibre-extreme measures need not be ergodic; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require type-1 lozenges in the rows (two tilings share the positions `{(0,y) : y ≤ 0}`); affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The 3 × 3 unit-hexagon matrix and its column-swap remark in README 3.1 (lines 953–955) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.
- **Licence.** The field `Specification.comp_eq` (`Suggested.lean` lines 305–307) states consistency of a specification as the public GibbsMeasure project linked from `Mathlib/Probability/CondVar.lean` line 22 may also do; that repository was not opened.
- **Scope.** Interior uniqueness, the variational principle and Aggarwal's theorem are left to DimerModelsAndLozengeTilingsPartII (README lines 129–137), which no pull request or package carries yet.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9318f6ea8d0577ddf48bddeee1a5594540611353", "job": "REV-PKG-DimerModelsAndLozengeTilings~2", "model": "fable", "worker": "chris-x30"} -->
