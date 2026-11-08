# GATE-CohomologyComparisonsPartII~4

Review comments on pull request #1364, head `8858e49`; repairs committed as `c9807db1`.

## H01 (roed-math) — answered

The fibre in §2.2, `f_r(a,b)=((1−p^(−r)φ)a, bc(a)−sp_r(b))` on `A⊕F^rRΓ_dR→A⊕C`, is Besser's cone description (BesserI line 741–745, Proposition 6.3) and the form AM (3.12) uses (AM line 1322); the §2.2 Checks (`V=ℤ_p`, `r=0`: `f(a,b)=(0,a−b)`, `H⁰=ℚ_p` on the diagonal) pin the component order and the sign. PadicHodgeRegulators' `(a,b)↦(a−bc(b),(1−φ/pⁿ)b)` on `FⁿRΓ_dR⊕RΓ_rig(K₀)→RΓ_rig(K)⊕RΓ_rig(K₀)` is the same fibre after swapping the two summands and negating the `RΓ_rig(K)` coordinate, an isomorphism `(a,b;h₁,h₂)↦(b,a;−h₂,h₁)` of fibres that changes the sign of the de Rham-coordinate classes `[(0,c)]` in its η Check; no change here, the adapter belongs with the consumer.

## H02 (roed-math) — answered

Of the four contracts, this roadmap now owns one in full and one in part; the other two have other natural owners.

- **rigid-negative-weights: owned, stated.** §2.1 (README line 326), §2.2 (line 344) and §2.3 (line 364) now take every integer weight `r`, with `F^r=F^0` the whole de Rham complex for `r≤0`, which the `relative-hodge` contract already supplies for `r∈ℤ`; the factor `p^(−r)φ` and the `K₀/K` scalar conventions are unchanged. Old: `r≥0`, `r,s≥0`. New: `r∈ℤ`, `r,s∈ℤ`, with the sentence that BesserI states the construction for `r≥0` (BesserI line 721) and that no further input enters for `r<0`; the product sketch records `F^r·F^s⊂F^(r+s)` for all integers. A new §2.2 Check computes `V=ℤ_p`, `r<0`: `f(a,b)=((1−p^|r|)a,a−b)` is bijective, so every `H^q_rsyn` vanishes, whereas `F^r=0` would give `H¹=ℚ_p`. The consumer can cite §§2.1–2.3 for every weight and drop the hypothesis.
- **normalized-syntomic-boundary: owned only in its coordinate part.** §3.4 (line 457) now states that the undivided rational fibre has the presentation `Fib((p^r−φ,can))`, that `ω_Q` acts by `(p^r, id, p^r)` between the undivided and divided presentations, and hence `ω_Q∘δ_U=p^r·δ_D` for the two quotient boundaries, with a Check at `X=Spec(ℤ_p)`, `r=1` (line 467). This is the §3.3 leg `(p^r,id)` of ω read on the quotient presentation (EN line 193–243) and needs no new source. The remaining parts are not here: the isomorphism for `i≤r−1` and injection for `i=r` on quasi-compact formal semistable schemes is CN Corollary 3.16 (CN line 1704–1718), whose carrier (CN's formal-scheme syntomic cohomology, Proposition 3.12 and Lemma 3.17) this roadmap does not construct, and the exponential square is NN Proposition 4.13 (NN line 2790–2794), proved through the syntomic descent spectral sequence of NN Theorem 4.8, which the `rational-descent` contract reserves to the base owner together with NN Theorem A, Proposition 4.6 and Corollary 4.11 (CohomologyComparisons §4.8). CohomologyComparisons' head states neither statement; PadicHodgeRegulators should keep both as hypotheses or point the exponential square at the base owner.
- **dagger-syntomic-filtration: declined.** The Huber–Kings complex on a weak formal completion with the tube-ideal filtration is a different carrier from Besser's compactification-filtered fibre, and its source (HK2011) is not among this roadmap's sources. The nearest existing owners are AdicSpacesPartIV §F1 (weak completions, dagger de Rham complexes) and ColemanIntegration §L3.Fb.1, whose modified complex uses dagger-algebra forms on tubes `|h_i|>λ` with the form-degree filtration `F^nΩ^j=Ω^j` for `j≥n`, not the tube-ideal filtration; neither states the Huber–Kings carrier or its comparison. PadicHodgeRegulators is its only consumer and should own it or keep it as a hypothesis; the Scope section here deliberately keeps a single rigid syntomic producer.
- **semistable-period-descent: declined.** §5.2 is the classical-pair adapter for one model over `V`, with uniformizer change through the imported Hyodo–Kato law; this roadmap has no potentially semistable carrier. Descent from a finite semistable realization field to base-field potentially semistable coordinates, with restriction and normalized trace, is a statement on `D_pst` and NN's `C_pst(D)→C(D)` (NN line 690–705), whose carriers are CohomologyComparisons §§4.10–4.12 (proper rigid `C_st` comparison over `K`; `D_pst(V)=H¹_HK` for proper curves without semistable reduction over `K`) and PadicHodgeTheory §3.3 (filtered `(φ,N,Gal(L/K))`-modules with descent data). The gap should be re-pointed at those sections or owned by the consumer.

## Other changes

- The resolver flagged "TsujiNearby §4" (README line 539) as a roadmap citation; reworded to "TsujiNearby, proof of Theorem 4.2 in its §4". `roadmaps resolve` now lists no cross-roadmap citation or Lean name found nowhere.
- Downstream consumers (line 923): the PadicHodgeRegulators bullet notes the rigid syntomic fibre in every integer weight.
- `Suggested.lean` is unchanged: it declares nothing, so there was no `#check` signature comparison to run.

## Adversarial pass on the added or changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §2.2 fibre for `r<0` on `X=Spec ℤ_p` | `r=−1`, `p=2`; `r=−2`, `p=3` | `f(a,b)=((1−2)a,a−b)` bijective; `f(a,b)=((1−9)a,a−b)` bijective; `H⁰=H¹=0` | holds; wrong model `F^r=0` gives `H¹=ℚ_p` | Check added |
| §2.2 fibre for `r<0`, `X_k` empty (`Spec K`) | `r=−1` | fibre `=F^(−1)RΓ_dR=RΓ_dR(Spec K)=K` | agrees with existing empty-`X_k` Check and BesserI Remark 6.4 | none |
| §2.3 product `F^r·F^s⊂F^(r+s)` | `r=−1,s=2`; `r=s=−1` | `F^0·F^2⊂F^2⊂F^1`; `F^0·F^0⊂F^0=F^(−2)` | holds | sketch sentence added |
| §2.3 unramified presentation for `r<0` | `K=K₀`, point, `r=−1` | `Fib((1−p)·id: ℚ_p→ℚ_p)` acyclic, agrees with §2.2 value | holds | none |
| §3.4 `ω_Q=(p^r,id,p^r)` is a chain map | point, `r=1`, `p=2` | `g_D(2x)=((1−½)2x,2x)=(x,2x)=(id,·2)∘g_U(x)=((2−1)x,2x)` | holds; `(p,id,id)` fails since `can(px)=p·can(x)` | bullet and Check added |
| §3.4 `ω_Q∘δ_U=p^r·δ_D` | point, `r=1`, `b=1` | `ω_Q[(0,1)]=[(0,p)]=p·δ_D(1)`, nonzero as `(0,p)∉im g_D` | holds | Check added |
| §3.4 identity at `r=0` | point, `r=0` | `ω=id`, quotient `RΓ_dR/F⁰=0`, both boundaries zero | consistent with existing `r=0` Check | none |

## Ownership and citations

Ownership against the open pull requests listed in the brief was checked for the four contracts by object (dagger syntomic complex, Bloch–Kato boundary, potentially semistable descent) with `roadmaps grep`; only PadicHodgeRegulators mentions them. Citations of CohomologyComparisons, PadicHodgeTheory and ColemanIntegration were checked at their open heads (#1064 `248dcf1`, #1062 `c1968e3`, #1043 `c35168f`), the other suppliers on main `ffac513`, sources by line in the cache.

## Build and gate

```
lake build TauCetiRoadmap.CohomologyComparisonsPartII.Suggested
✔ [8976/8976] Built TauCetiRoadmap.CohomologyComparisonsPartII.Suggested (12s)
Build completed successfully (8976 jobs).
```

```
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for CohomologyComparisonsPartII. Commit `c9807db1`, not pushed.
