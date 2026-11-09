# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 3cac94e)

**Verdict:** accepted

This is an incremental re-review of the 9 lines changed since afb8391. Only `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` changed, in five hunks:

- the repair of the previous R01;
- a new Check in §R18.4.35;
- three subscript/superscript groupings, in §R18.4.20, §R18.4.30 and §R18.4.31.

`Suggested.lean` is byte-identical, and nothing changed outside the folder. Each changed passage was checked against its source and recomputed. No finding remains.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` at 3cac94e.

## Findings

None.

## Previous findings

- R01 — repaired: README:4296 now reads “In the raw tensor formula the `n_i` are nonnegative integers and the `d_i` and `b` are integers; negative determinant exponents are inverse line powers over the rational coefficient field.”

The settled item recorded in the previous report's own “Previous findings” (ArithmeticFuchsianGroups §1.2 not citing this roadmap) is unchanged. ArithmeticFuchsianGroups is still at 5fdb26da with 0 occurrences of this roadmap's name. It stays settled, for the reason the previous report rechecked: the edit belongs in that folder, and this roadmap (merge-order line 161) cannot cite ArithmeticFuchsianGroups.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's gate at 3cac94e has every rule at 0, including `build=0`, and reports `OK`. I reran it on this head and got the same result: `gate HilbertModularVarietiesAndShimuraCurves: set_option=0 blob=0 latex=0 … dirty=0 outside-folder=0 source-material=0 OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 236 roadmaps, 2296 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line. This roadmap is at merge-order line 161. The edge count rose from 2293 because other roadmaps changed. No `*Needs:*` line of this roadmap is in the diff.
- **Elaboration.** `lake env lean` on `Suggested.lean`, run from the worktree root, exits 0 with no output in 3.9 s. The file is unchanged since afb8391. It contains `module`, `public import Mathlib`, the docstring and an empty namespace. The docstring names each headline group and the carrier it lacks. There is no `set_option` and no `sorry`.
- **Signature comparison.** The worker's signature file failed with “unexpected end of input”. The cause is that its generated last line is `#check @for`, where the word “for” was taken from the docstring. The file declares nothing, so there is no `#check @` comparison to make, and the one-tactic padding probe is vacuous.
- **Outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the folder lists nothing.

### The changed passages and their locators

The seeded sample falls in the changed passages at four “Theorem” targets: §R18.4.20, §R18.4.30, §R18.4.31 and §R18.4.35. The remaining sampled labels fall in untouched text, which earlier reviews verified.

| README line | Target | Change | Checked at |
| --- | --- | --- | --- |
| 3819 | §R18.4.20 Theorem (large-image Taylor–Wiles datum) | `R_(S∪Q_n)^□,θ` → `R_(S∪Q_n)^{□,θ}` (twice) | MS19 §4.2 opens at line 1074 (p.22). MS19 defines the framed ring with determinant `ψε⁻¹` as one superscript `□,ψ` (lines 1118–1120, p.23). The forgetful map is formally smooth of dimension `j=4|Σ|−1` (line 1131). Lemma 4.10 is at line 1146 (p.24); its conditions (1)–(2) and the surjection `R_loc[[x₁,…,x_g]]↠R^{□,ψ}_{F,S∪Q_n}` (line 1159) match the README. The README's `θ=ψε⁻¹` is MS19's determinant. The span pp.22–24 is exact. |
| 4174 | §R18.4.30 Theorem | `M_∞(σ_ps,O)` → `M_∞(σ_{ps,O})` | MS19 writes `σps_O`, and Proposition 4.20(3) (line 1481) puts `M∞(σps_O)` on `R^ps`. Proposition 6.10 is at line 1875 (p.37) and Propositions 6.11–6.12 at lines 1910–1930 (p.38). Lemmas 5.1, 5.2, 5.3 are at lines 1568 (p.31), 1591 (p.32), 1622 (pp.32–33). The cited pp.31–33 and pp.37–38 are exact. This also clears the remark the previous report made on README:4174. |
| 4196 | §R18.4.31 Theorem | `M_∞,K_0(w)(St_k)→M_∞,K(St_k)²` → `M_{∞,K_0(w)}(St_k)→M_{∞,K}(St_k)²` | MS19 puts the level in the subscript of `M∞,K` (line 1345). The proof of Theorem 6.5 (lines 1931–1958, p.38) proves that `π_*: M∞,K0(p)^q(St_F)→M∞,K^q(St_F)^⊕2` is surjective (line 1946), then `H₁(X_K0(p),F)_m→H₁(X_K,F)_m^⊕2` (line 1957). The grouping and the locator “Proof of Theorem 6.5, p.38” are exact. |
| 4296 | §R18.4.35 standing hypothesis | the R01 repair | Every parameter of the formula at README:4288 is now typed: `n_i` nonnegative, `d_i` and `b` integers. A search for `d_{i` finds nothing. Sai09 Lemma 3 is at line 1274 (p.30), with `q₀=(2g−1)(w−2)` at line 1286. Lemma 4 is at line 1389 (p.32), continuing past the p.33 marker at line 1408. |
| 4304 | §R18.4.35 new Check | added | Recomputed in the adversarial table below. Correct. |

A search of every code span in the README for comma-separated sub- or superscripts finds no remaining ambiguous one. The only two hits, `T_v,S_v` and `S_∞=O[[y₁,…,y_r,w₁,…,w_j]]`, are lists.

### Adversarial pass

The rows for untouched statements carry forward, each with the values computed in the report that made it:

- the previous report at afb8391: five rows;
- the report at 388e2e6: twelve rows;
- the report at 7c9252d: sixty rows. These include the headline rows, recomputed here in summary:
  - §R18.3.8 definite Ihara: MS19 p.35 step with `k=(1 1;0 1)`; `ω⁻¹kω=(1 ϖ⁻¹;0 1)∉H`.
  - §§R18.4.32–R18.4.33 Ihara with saturation: `x↦(x,0)`, cokernel O.
  - §R18.5.15 Čerednik–Drinfeld: discriminant 6, `v=2`, invariants 1/2 and 0.
  - §H6.5 worked Check: `x³−3x+1`, `l=7`, `p=19`, discriminant 81, roots 3, 7, 9 mod 19.

The folder outside the 9 changed lines is byte-identical to afb8391. New rows for every changed statement:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §R18.4.20 framed fixed-determinant ring `R_(S∪Q_n)^{□,θ}` and dimension count | `|Σ|=2` (one l-adic place and q); MS19 lines 1118–1132 | `j=4·2−1=7` (4 frame entries per place, less 1 for the scalars commuting with an absolutely irreducible `ρ̄`). `dim R_∞=(r+7−g+1)+g=r+8` and `dim S_∞=dim O+r+j=1+r+7=r+8`, which are equal. The superscript `□,θ` is a single label: framed, with determinant θ. | Correct |
| §R18.4.30 `M_∞(σ_{ps,O})` flat over the regular `R_ps` | `R_ps=O[[X,Y₁,P,R]]/(X²Y₁−π)` (§R18.4.19) | `π=X²Y₁∈𝔪²`, so `𝔪=(X,Y₁,P,R)` has 4 generators and `dim=5−1=4`; the ring is regular. Its special fibre is `k[[X,Y,P,R]]/(X²Y)`, which is MS19 line 1889. `σ_{ps,O}` is the O-lattice whose reduction `σ_{ps,k}` sits in `0→1_k→σ_{ps,k}→St_k→0` (README:3866). | Correct |
| §R18.4.31 trace `M_{∞,K_0(w)}(St_k)→M_{∞,K}(St_k)²` | MS19 line 1946; degeneracy matrix at `Nw=2`, `a_w=−2`, trivial central character | With trivial central character, composing with the pullback gives `[[Nw+1, T_w],[T_w, Nw+1]]`, with determinant `3²−(−2)²=5`. So on the m-part the trace is trivially surjective unless `l=5`, the level-raising prime. That is where the patched argument has content. The source and target levels are in the same order as in MS19. | Correct |
| §R18.4.35 hypothesis (repair) | the formula at README:4288 | Symbols are `n_i`, `d_i`, `b`, all typed. The twist `b=1/2`, which would give `r=2−2−1=−1` for `n₁=2, d₁=−1`, is now excluded by the typing. | Correct |
| §R18.4.35 new Check: `n₁=2, d₁=−1, b=1` | rank-two `V₁` of weight one; `b=1/2` with `q=5`, `ℓ=3` | `End V₁≅V₁⊗V₁⊗det⁻¹=(Sym²V₁⊕∧²V₁)⊗det⁻¹=Sym²V₁⊗det⁻¹⊕1`, ranks `4=3+1`, so `Sym²V₁⊗det⁻¹` is the trace-zero part. Its weight is `2−2=0`; `(1)` gives `r=−2`, and H¹ on the proper curve has weight −1. The raising convention would give 2 and 3, so the Check distinguishes the two. A half twist needs the Frobenius eigenvalue `5^(−1/2)`, but `5≡2 (mod 3)` is a non-square, so `√5∉ℚ₃`. | Correct |
| §R18.4.35 existing Check `g=2,w=4` (same section, rechecked against the new Check) | `q₀=(2g−1)(w−2)` | `q₀=6`, `a=(g−1)(w−2)=2`, `H^7` has weight 7, and `7−2a=3=w−1`. This is consistent with the raw-weight convention of the new Check, where `(b)` lowers the weight by `2b`. | Correct |

### Citations, overlaps, ownership

- **Overlaps.** No other open pull request changes this roadmap, and no cited id is dropped. AlgebraicTopology Layer 6 (README:46, 3607, 3615) exists only in the AlgebraicTopology revision #1652. The pull request's merge-order paragraph names #1652, as the rule requires.
- **No heading or section id changed.** Consumers' citations are therefore unaffected:
  - QuaternionArithmetic at 6f0692a7: 20 occurrences of this roadmap's name.
  - HilbertModularVarietiesAndShimuraCurvesPartII: 19 occurrences, including the §§R18.4.1–R18.4.27 ranges, unaffected.
- **Resolve leads.** The six Lean names in the worker's citations list are at README:78, 95, 101, 133 and 1314. Earlier reviews resolved them, and none is in a changed line.
- **Ownership.** The changed lines add no object: one Check and four notation groupings. Ownership was checked against the open roadmap pull requests whose files the brief supplies. There is nothing new to place.

## Not verifiable

- **Del80 Corollaries 3.3.4–3.3.6** (§R18.4.35) and **EGS15 Lemma 4.1.1** (§R18.4.22) are not in the source cache. Their locators are unchanged and were not rechecked here.
- **Tay02, PRR23 §1.4.2 and the Voi21 printed pages** are as in the previous reviews: an image-only scan, a paywalled edition and a paywalled host respectively. None is cited in a changed line.
- **Earlier source issues.** The three items of earlier reports (the MS19 p.35 misprint `g(xω)`, the CDN20 §1.2 ball centres, the KW09 Lemma 7.2 gap) stand and were not rechecked here.

## Source issues

- **Misprint** in MS19 at §4.2, p.23: the source says the unframed fixed-determinant ring imposes `det ρ=ψ` while the framed ring imposes `ψε⁻¹`, with a formally smooth forgetful map between them; it should be `det ρ=ψε⁻¹` for both, since `ψ` does not lift `det ρ̄`; affects nothing.
