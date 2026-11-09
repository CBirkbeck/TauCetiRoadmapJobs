# Review of NoncommutativeGeometry (pull request #1143 at 6509d68)

**Verdict:** needs changes

This incremental re-review covers the 53 lines changed since 84ba014: 45 in `TauCetiRoadmap/NoncommutativeGeometry/README.md` and 8 in the module docstring of `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean`. No file outside the folder changed.

- The new text restricts the linear Dixmier trace to dilation-invariant ω. It carries that hypothesis through N5 and N7, and cites Carey–Rennie–Sukochev–Zanin (CRSZ below) for the general ω. Every value in it was recomputed, and the mathematics is correct.
- One new defect: the new reference bullet drops the parity hypothesis of CRSZ Theorem 16 (R03).
- The two findings carried from r24 are still open. Their repairs lie outside the README: in OperatorKTheory #866 and in the pull-request description.
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates. Its only warning is the single `sorry`.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r24 R01 (r23 R02, r22 R01, r21 R01, r20 R01); not repaired.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1831: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. Its `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 defines `A_θ=C(𝕋)⋊_αℤ` and "the canonical trace `τ=HaarIntegral∘E` using D2's expectation";
- 2326 consumes "K7's rotation algebras with their K-groups".

`roadmaps grep --fixed 'τ=HaarIntegral∘E'` still hits #866:1784.

**Repair.** Unchanged. This roadmap is on main, so it is earlier than #866 and may not cite it. The README already takes the only admissible direction and needs no edit.
- State in the description that this pull request merges before #866.
- #866 replaces 1783–1784, and the presentation bullet after them, by a citation of NoncommutativeGeometry N6. It rewrites 2324–2326 as consumption of N6.
- **Test:** afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — The description describes an earlier head and states no merge order

Carried from r24 R02 (r23 R04, r22 R02, r21 R03, r20 R03). The description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864";
- a build report for head 84190a1e.

**Witness.**
- `git diff --stat origin/main...HEAD` lists `Suggested.lean`. This head changes it again, at 29–35.
- README writes `x⊠_u y` and `x⊠_s y` (1680).
- No *Needs:* line names AlgebraicKTheory.
- #864 is not open.
- #1187 conflicts with this pull request in this folder's `Suggested.lean` (`overlaps.md`).

**Repair.** Rewrite the description for this head.

Contents:
- N1.Tensor consumes the pinned Banach and locally convex projective tensors.
- N1.Cyclic consumes the pinned bounded coboundary, currying and dual actions.
- N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core.
- N4 proves additivity of `dixmierTrace` on positive operators and builds the linear Dixmier trace for dilation-invariant ω.
- N5's Hochschild-class theorem holds for every dilation-invariant ω (Connes IV.2 Theorem 8; CRSZ Theorem 16).
- N6 builds `A_θ` on Tau Ceti's full crossed product.
- N7 consumes HilbertModules H1–H3.
- `Suggested.lean` states only `bijective_matrixExtension`.

Merge order:
- #866 merges after this pull request (R01).
- #1187 rebases after it.

Drop the #864 line and the build report for 84190a1e.

## R03 (P3) — The CRSZ reference bullet drops the parity hypothesis of Theorem 16

**Location.** README 1874–1877: "Theorem 16, p. 9: for a smooth spectral triple with `(1+D²)^(−p/2)` in the logarithmic ideal and a Hochschild p-cycle … the Dixmier trace of `Σγa₀[D,a₁]⋯[D,a_p](1+D²)^(−p/2)` is the Chern-character value".

**Claim.** CRSZ proves the identity for every smooth spectral triple.

**Witness.**
- carey-rennie-sukochev-zanin line 504 assumes a QC∞ triple "which is even or odd according to whether p is even or odd".
- Line 451 sets Γ=1 for odd triples.
- The bullet states neither, and its `γ` is undefined for an odd triple.
- N5 itself (README 1379, "of the module's parity") is correct.

**Repair.** Read "for a smooth spectral triple whose parity is that of p (γ=1 when p is odd), with `(1+D²)^(−p/2)` in the logarithmic ideal, …".

**Test:** the bullet then carries both hypotheses of carey-rennie-sukochev-zanin lines 504–509 and the convention of line 451.

## Previous findings

- R01 — not repaired: README 50–56 still says "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ`". #866 is unchanged at 1377338a, with `A_θ` and `τ=HaarIntegral∘E` at 1783–1784 and "K7's rotation algebras" at 2326. Carried as R01.
- R02 — not repaired: the description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged" and "which merge first: #864". Carried as R02.

The repair reply on 6509d68 answered both findings, with reasons: the README is right as it stands, and the description is outside the editable files. It did not mark either `not actionable in this package`, so both are carried and nothing is re-raised.

## Verified sound

**Gate, dependency check, build and signatures.**
- `gate … --base origin/main` at 6509d68, run here: every scanner 0, `OK`. The worker's run, with `build=0`, agrees.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty. `git diff --stat 84ba014 HEAD` touches only README.md (45 lines) and Suggested.lean (8 lines).
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. The only warning is `declaration uses sorry` at 64:8.
- The Lean diff touches only the docstring (29–35). `bijective_matrixExtension` is unchanged, and its elaborated type in `signatures.md` still matches README 691–696, with `[Nonempty ι]` present and no `variable` block. The one-tactic probe of r23 still applies, so it is not padding.
- Headlines are unchanged, and the not-statable list still matches the Summary. The new docstring clause, which says the pin lacks a complex-linear Dixmier trace for dilation-invariant ω, is correct: the pin has only the real-valued `dixmierTrace` (below).

**Library declarations opened at Tau Ceti 2fd255d.**

| File | Declaration (line) | What it says |
| --- | --- | --- |
| `Analysis/OperatorIdeal/Family/DixmierTrace.lean` | `dixmierTrace` (91) | real-valued; Dixmier's trace on positive T, the trace of `|T|` in general, 0 outside `L^(1,∞)` |
| same | `dixmierTrace_smul` (159) | `Tr_ω(cT)=‖c‖Tr_ω(T)`; at c=−1 this gives the pinned value 1 for T and −T in the new Check |
| same | `dixmierTrace_eq_of_tendsto` (150) | convergent means give the same value for every ω, as used by "for every dilation-invariant ω" |
| same | `dixmierTrace_modulus` (226) | `Tr_ω(|T|)=Tr_ω(T)` |
| `Analysis/Normed/Order/GeneralizedLimit.lean` | `IsDilationInvariant` (177) | `∀ f k, 0<k → ω (f.dilate k) = ω f` |
| same | `IsDilationInvariant.map_dilate` (189) | the unfolding lemma |
| same | `exists_isDilationInvariant` (309) | such ω exist |
| `Analysis/OperatorIdeal/Family/Logarithmic.lean` | `kyFanLogMean` (79) | `K_(N+1)(T)/log(N+2)`, which is exactly CRSZ's normalisation `(log(2+n))⁻¹Σ_(k≤n)μ(k)` (carey-rennie-sukochev-zanin lines 178–186) |

`grep` over the pinned Tau Ceti finds no linear or complex-valued Dixmier functional, so N4 building it duplicates nothing.

**Sources.**

The seeded draw (`shuf --random-source` seeded by 6509d68) covers all 15 single-line parenthetical locators. Those in the changed passages, or that they depend on, were read:
- Connes IV.2, Definition 2, p. 312 (README 1189): connes94 11754–11760. ✓
- IV.2, Proposition 4, p. 313 (1282): connes94 11789–11793. ✓
- CRSZ Definition 2 and Example, p. 4 (1878): carey-rennie-sukochev-zanin 168–188. ✓ Dilation semigroup σ_k; Dixmier traces from dilation-invariant extended limits, additive on positives.

The locators the diff adds were read as well:
- IV.2, Proposition 3(b), p. 312 (1215): connes94 11765–11767. ✓
- IV.2, p. 312, the limits (1390–1392): connes94 11728–11746. ✓ L is a positive form with L(1)=1, zero on `C_0(R*₊)`, composed with `M(f)(λ)=(log λ)⁻¹∫₁^λ f du/u`. The scale invariance for every µ>0 is at 11731–11734.
- Theorem 8, p. 315 (1390): connes94 11865–11877. ✓ λ_n, γa₀ in the even case, and the cycle evaluation independent of ω.
- CRSZ Theorem 16, p. 9 (1393, 1874): carey-rennie-sukochev-zanin 504–509. ✓ apart from R03:
  - (b) `(1+D²)^(−p/2)∈M_(1,∞)` gives every Dixmier trace;
  - (a) `(1+D²)^(−p/2)∈L_(1,∞)` gives every normalised trace (normalised at line 199);
  - summability is defined at 452–453.
- The journal data in the bullet, J. Spectral Theory 6 (2016), 1–41, is confirmed at ems.press (DOI 10.4171/JST/116). The bullet cites the arXiv v1 numbering it read.

The other sampled targets lie in untouched text, verified by r23 (items 1–15).

**Mathematics of the change.**
- The narrowing to dilation-invariant ω is what the route needs. Additivity on positives, which N4 proves only for dilation-invariant ω, is what makes `T=T₊−T₋+i(…)` well defined.
- Connes' limits are dilation-invariant for every integer k, not only for the duplication (γ). The step function of the k-fold dilated sequence is exactly `θ_(1/k)f_α`, and `M(θ_µf)−M(f)→0`. Values are in the table.
- CRSZ's unnormalised `Ch(c)=½Tr(FΓ∏_(k=0)^p[F,a_k])` (line 473) agrees with N5's λ_n-normalised statement. On the circle, `½Tr(F[F,z⁻¹][F,z])=2=Tr(z⁻¹[F,z])`, and λ_n multiplies both sides.
- N5's `|D|⁻ⁿ` and CRSZ's `(1+D²)^(−p/2)` differ by a trace-class operator, which every Dixmier trace kills.
- The r24 remark (N5 and N7 used the linear Tr_ω without the ω hypothesis) is resolved at 1382–1384 and 1650–1652. N4 1216–1218 states the convention for all later layers.

**Ownership.**
- SpectralManifolds #1158 (b1e8fb72) builds its trace as Ω∘M and proves dilation invariance "so this is an N4 trace" (README 109). It consumes N4–N5 (7, 21), so the narrowing breaks no consumer.
- CompactQuantumMetricSpaces #1155 consumes only N5's spectral triples (938, 951, 999).
- `overlaps.md` lists no dropped or revision-only id. `citations.md` lists nothing missing.

**Adversarial pass.** The rows for changed statements were computed in a pure-Python scratch script. Rows marked r24 are carried from the r24 report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| N4 linear Dixmier trace (1212–1218) | T=−diag(1/(j+1)); finite-dimensional H | linear −1, pinned `‖−1‖·1=1`; finite-dim: every operator has finite rank, both 0 | true | none |
| N4 new Check (1249–1254) | T=diag(1/(j+1))⊕(−diag(1/(j+1))); M=10³, 10⁵, 10⁶ | pinned `2H_M/log(2M+1)`=1.9695, 1.9810, 1.9840, tending to 2; linear `1−1=0` | true | none |
| N5 ω-hypothesis, Connes' limits (1388–1392) | k=2, 3; a random ±1 sequence | `f_(σ_kα)=θ_(1/k)f_α` at all 50 000 test points; `|M(θ_(1/2)f)−M(f)|`=0.1061 and 0.0601 at λ=10³ and 10⁵, against the bound `2log2/logλ`=0.2007 and 0.1204 | dilation-invariant | none |
| N5 via CRSZ (1392–1393) | circle D=diag(k+1/2) | `½Tr(F[F,z⁻¹][F,z])`=2.0, `Tr(z⁻¹[F,z])`=2; `Σ_(|k|<K)(|D|⁻¹−(1+D²)^(−1/2))`=2.544387 at K=10³ and 10⁵ (trace class) | true | none |
| N5 absolute-value Check (1420–1427) | positive part `2/(2j+1)`, N=10³, 10⁵, 10⁶ | means 1.284, 1.171, 1.142, tending to 1; linear `Tr_ω(D⁻¹)=1−1=0`; with `|D|⁻¹` the value is 2 | true | none |
| N7 ω-hypothesis (1650–1653) | r23 lattice values | `Tr_ω(|D|⁻²)`: 0.14616 and 0.14853, tending to `1/(2π)`=0.15915; nonzero modes vanish through the trace property of the linear functional | true | none |
| CRSZ reference bullet (1870–1880) | carey-rennie-sukochev-zanin 451–453, 504–509 | (b) and (a) as stated; parity condition of 504 absent | imprecise | R03 |
| Suggested.lean docstring (29–35) | pin grep | only `dixmierTrace … : ℝ` (DixmierTrace.lean 91) | true | none |
| `A_θ` ownership (50–56) | #866 at 1377338a | 1783 `A_θ=C(𝕋)⋊_αℤ`; 1784 `τ=HaarIntegral∘E` | two owners | R01 |
| N4 additivity target (r24) | consecutive differences at n=10³, 10⁵ | 5.0·10⁻⁶ and 1.75·10⁻⁸ | true | none |
| N4 negative controls (r24) | S∉L^(1,∞); T=−S | `0≠0+1`; `0≠1+1` | true | none |
| N4 doubled-index Check (r24) | N=10⁶ | `2H_N=28.7855`, `σ_N(S+T)=27.3992`; means 2.0836 and 1.9832 | true | none |
| N3 odd character, index direction, Tr′ domain, doubling (r24) | ℓ²(ℤ), z; a=2; `Te_k=e_(−k−1)` | `λ₁=−0.886227(1+i)`, pairing −1; `½Tr(F(FT+TF))=1`; FT+TF=0; `sin(3π/2)=−1` | true | none |
| N5 circle Check (r24) | M=10³, 10⁵, 10⁶ | `σ_(2M)`=17.74253, 26.95287, 31.55804; means 2.334, 2.208, 2.175 | true | none |
| `bijective_matrixExtension` (r24) | ℚ against M₂(ℚ), n=0, 1; ι=∅ | `HC⁰` 1 vs 1; `HC¹` 0 vs 0; ι=∅ gives `HC⁰(0)=0≠1`, so `[Nonempty ι]` is needed | true | none |
| Sample 1, p-summability (r24) | Hardy, a=z | `μ([F,z])=(2,0,…)` | true | none |
| `Tr_ω(diag(1/(j+1)))=1` (r24) | N=10³, 10⁶ | 1.08348 and 1.04178 (recomputed here) | true | none |
| Torus conventions, cross property, cyclic sign, Diophantine, Heisenberg, Bott, p-triangle, column constants, ω-dependence, weak-class constants, Hardy reductions, projection, weighted shifts (r24) | as in r24 | `U₂U₁=𝐞(θ)U₁U₂`; 4, 2, 2.828427; `(bφ)(e₁₂,e₂₁)=1`; 0.5365; 16.981582i; 0.801154i; `9>5`; residuals ≤10⁻¹⁷; 0.743683 and 0.756317; 1.99854≤2; `Wσ₃W=−σ₃`; `ses⁻¹=p`; ζ(1.1)=10.5844 | true | none |

## Not verifiable

- None. Every locator in the changed passages was read in the cached legal texts connes94 and carey-rennie-sukochev-zanin (arXiv v1).

## Source issues

- **Misprint** in carey-rennie-sukochev-zanin at Definition 2, p. 4: the source says a dilation-invariant extended limit is a state on l∞ invariant under every σ_k. Read literally, this admits evaluation at index 0, for which the Example's Tr_ω is not additive. It should require the state to vanish on c₀ (to extend the limit). Affects nothing.
