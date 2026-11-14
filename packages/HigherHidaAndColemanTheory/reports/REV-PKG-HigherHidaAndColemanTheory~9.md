<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6869597558 -->
Review (claude) of 0b988ee

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) §9.8 re-proves, and mirrors in a Check, what an earlier roadmap states

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1538: "Prove from the trace divisibilities of §14.9 that T_p,2 and U_Kli(p),2 have only eigenvalues of positive valuation"; the Check at line 1545; the closing remark, line 1549; *Needs*, line 1540.

   **Claim:** The hyperspecial half of Pilloni-Singular §14.9 (the integral operator `p⁻³T′_(p,2)` on the p-rank-at-least-one locus, its ordinary trace divisibilities, the restriction across codimension two) is proved inside this route, with no supplier.

   **Witness:** AlgebraicModularFormsAndSerreWeightsPartII, `README.md` line 924 (§7.2 "Ordinary trace divisibility", first Check `4+0, 2+1, 0+3`), line 942 (§7.3, Lemma 14.9.1, spherical half), line 969 (§7.4).

   That roadmap is open and stands at line 249 of the merge order; this one is line 255.

   The Check at line 1545 computes `(p⁴,1),(p²,p),(1,p³)` with products `p⁴,p³,p³`: the same values as that roadmap's §7.2 Check at `d=0, r=2`. `grep AlgebraicModularForms` on this README finds nothing. The Klingen half (`U_Kli(p),2` on the coefficient twisted by `I⁻³`) is not in that roadmap: its §7.3 is cited as the "spherical half", so that half stays here.

   **Exact repair:**

   - Line 1538: replace the quoted sentence (through "on these cohomologies") by: "At hyperspecial level the integral operator p⁻³T′_(p,2) on the formal p-rank-at-least-one locus is AlgebraicModularFormsAndSerreWeightsPartII §7.3, resting on the ordinary trace divisibilities of its §7.2, and the restriction from X to that locus, bijective on H^0 and injective on H^1 modulo every p^n, is its §7.4. Prove the Klingen counterparts: U_Kli(p),2 acts on the coefficient twisted by I^(−3) over the p-rank-at-least-one locus of X_Kli(p), and restriction to that locus is bijective on H^0 and injective on H^1 modulo every p^n (Pilloni-Singular, Lemmas 14.9.1, 14.9.2 and 14.9.2.1, pp. 103–105). Deduce that T_p,2 and U_Kli(p),2 have only eigenvalues of nonnegative valuation on these cohomologies" (the last word is R02).
   - Delete the Check at line 1545; three Checks remain.
   - Line 1549: after "the ordinary-point trace divisibilities of §14.9, pp. 103–106," insert "the spherical ones being AlgebraicModularFormsAndSerreWeightsPartII §7.2,".
   - Add `AlgebraicModularFormsAndSerreWeightsPartII §7.2; §7.3; §7.4` to the §9.8 *Needs* line and the Layer 9 Dependencies. Add a contract subsection `### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII` with one bullet per section, and one clause in Scope and ownership.

   **Repair test:** line 249 is before line 255, so the dependency check stays free of UPWARD lines. At `d=0, r=2` the cited §7.2 gives `4,3,3 ≥ 3`, which is what the deleted Check computed.

2. **F02** (P2) §9.8 route: "positive valuation" is false; the source proves nonnegative

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1538: "T_p,2 and U_Kli(p),2 have only eigenvalues of positive valuation on these cohomologies, so that the Hecke parameters of π_p have valuations 0, 0, k+1, k+1".

   **Claim:** Every eigenvalue of the two operators has valuation greater than 0.

   **Witness:** Pilloni-Singular line 4719–4720 (proof of Proposition 14.9.1, p. 103): the argument assumes `v(α)<0` and derives `f=0`; valuation 0 is not excluded.

   Valuation 0 occurs on the classes the route is about. By Proposition 5.1.5.1 (Pilloni-Singular line 946–948) the `U_Kli(p),2`-eigenvalue on a Klingen line is `α+β`, and Corollary 14.9.1 gives `v(α)=v(β)=0`. At `p=3` with `(α,β,γ,δ)=(1,1,9,9)`, the roadmap's own example of §9.5, `α+β=2` is a unit. Read as "greater than 0" the sentence contradicts that example. The source's word is a gallicism ("positive" for "nonnegative"): source issue below.

   **Exact repair:** write "nonnegative valuation" (already in the R01 replacement text).

   **Repair test:** on `(1,1,9,9)` the values `α+β=2` and `α+β+γ+δ=20` have valuation 0 at `p=3`, which "nonnegative" admits, and the Newton polygon with slopes `0,0,k+1,k+1` needs only integrality.

3. **F03** (P3) §2.8, third Check: the instance does not satisfy the factorization hypothesis it is said to agree with

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 487: "that of the outer pair, K+−({b,c},∅;O)^ord=RΓ^ord(X,O) for X={a} with T=id, is also 𝔽₂[0], consistently with (c)".

   **Claim:** The equality of the inner and outer ordinary objects on the three-point instance illustrates (c).

   **Witness:** (c) gives inner ≃ outer only when T factors through `(p″2)*F″(D+)`. Here `D+={b,c}` has ideal generated by the idempotent `e_a`, so `F″→F″(D+)` kills the components at b and c, and its pullback by σ kills the component at c, since `σ⁻¹{b,c}={c}`. But `T(f)(c)=f(b)≠0`.

   So T does not factor, and only the first conclusion of (c), `K+−(D+,D−;F)^ord≃RΓ^ord(X,F)`, applies to this instance. The agreement of the inner object `K(∅,∅)^ord=𝔽₂[0]` with it is a computed coincidence. The values in the Check are correct; I recomputed them (table below).

   **Exact repair:** replace "is also 𝔽₂[0], consistently with (c)." by "is also 𝔽₂[0]. Of (c), this instance satisfies the hypotheses of the first conclusion only: the factorization fails at c, where the pullback of F″(D+) vanishes while T(f)(c)=f(b), so the agreement of the inner object with RΓ^ord(X,O) is a computed value here, not an application of the second conclusion."

4. **F04** (P3) two page slips for BP-Coleman

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 874: "(BP-Coleman, Theorem 5.4.3, pp. 108–109; Theorem 5.4.12, p. 112)"; line 843: "(BP-Coleman, Example 3.3.9 and Definition 3.3.10, pp. 39–40)".

   **Witness:** BP-Coleman line 5105 (p. 109 begins), line 5109 (Theorem 5.4.3), line 5132 (its proof ends), line 5146 (p. 110 begins). BP-Coleman line 1884 (p. 40 begins), line 1890 (Example 3.3.9), line 1906 (Definition 3.3.10), line 1944 (p. 41 begins).

   **Exact repair:** "Theorem 5.4.3, p. 109" at line 874; "Example 3.3.9 and Definition 3.3.10, p. 40" at line 843. The citation "§5.4.1 and Theorem 5.4.3, pp. 108–109" on line 843 is correct (§5.4.1 begins at BP-Coleman line 5092, p. 108) and stays.

5. **F05** (P3) manifest: two source issues and several cited results are not recorded

   **Location:** `packages/HigherHidaAndColemanTheory/sources.toml`, source `BP-Coleman`, `cited_for` (ends "Source issues/E7", "Conventions") and `locator`; source `BP-Hida`, `locator`; source `Pilloni-Singular`, `locator`.

   **Witness:** E13 and E14 (`README.md` line 1599–1600) are BP-Coleman issues; `grep "E13\|E14" sources.toml` finds nothing. The last repair added "Source issues/E15" to BP-Hida for the same reason.

   Cited in the README and absent from the `locator` strings:

   - BP-Coleman: §§2.4–2.6 and Lemma 5.9.10 (line 61), Lemma 6.6.2 (line 112), Conjecture 6.8.1 (line 22), §3.4, Lemma 3.5.11 and Corollary 5.3.4 (line 843), Lemma 3.3.24 (line 852).
   - BP-Hida: Remark 2.1.20 (line 372), Lemma 2.10.1 (line 473), §2.1 and §2.5 (line 349), Proposition 2.3.13 (line 421).
   - Pilloni-Singular: §13.3.2 (line 1497).

   **Exact repair:**

   - BP-Coleman: add `"Source issues/E13", "Source issues/E14"` to `cited_for`. Add to `locator`: "§§2.4–2.6, 3.4; Lemmas 3.3.24, 3.5.11, 5.9.10, 6.6.2; Corollary 5.3.4; Conjecture 6.8.1" (the string is 867 characters now, so it stays under 1000).
   - BP-Hida: add "§§2.1, 2.5; Remark 2.1.20; Lemma 2.10.1; Proposition 2.3.13" to `locator`.
   - Pilloni-Singular: add "§13.3.2, p. 90" to `locator`.

Five findings: two P2, three P3. All six findings of round 8 are repaired. Both P2 findings are in the §9.8 proof route that the last repair rewrote. The four reviewed files were not edited, and no manifest entry was added (all four sources were already recorded and readable).

## Previous findings (round 8)

| Prior finding | Repaired passage in `packages/HigherHidaAndColemanTheory/README.md` | Status |
|---|---|---|
| F01 (P1): §2.8(c) cross-containments exchanged | Line 477: "the cross-containments p2*D′+⊆p1*D″+ and p1*D′−⊆p2*D″− hold in Cbar"; third Check rewritten; §8.2 cites Proposition 6.2.3; E15 added | **Repaired.** Direction read against BP-Hida line 1581 (Proposition 2.10.4), line 3152–3153 (Proposition 6.2.3) and line 3192 (proof of Theorem 6.2.9). One imprecision in the new Check: R03. |
| F02 (P2): §9.8 large-weight step unowned | §9.5, line 1475: "Let π_p be an irreducible smooth complex representation of GSp₄(ℚ_p) with π_p^Kli(p)≠0"; §9.8 route through the tower representation of AutomorphicBundlesPartII §4.4 | **Repaired**, with two defects in the new route text: R01, R02. |
| F03 (P3): Hecke action on `M_Kli` promised | The sentence is gone from line 1536 | **Repaired.** |
| F04 (P3): invented supplier name | Line 220: "§6.3: Cartier separation of two effective Cartier divisors on any scheme" | **Repaired.** |
| F05 (P3): BP-GL2 §2.1 page | Line 1424: "§2.1, p. 4" and the same in `sources.toml` | **Repaired** (BP-GL2 line 111, 114). |
| F06 (P3): title and process word | Line 1: "# Roadmap: higher Hida and Coleman theory"; line 7 "This roadmap owns"; line 51 "This roadmap needs" | **Repaired.** |

None was marked not actionable. No maintainer notes were left for this roadmap.

Pattern sweep for the repaired patterns:

- A source misprint restated: recurs once in the text the repair added (R02).
- A route input with no owner: recurs as an owned input left uncited (R01).
- A manifest entry missing for a new source issue: recurs for E13 and E14 (R05).
- Page ranges: all `kind number, p. N` pairs of the README were checked by script against the page markers of the four cached texts; 19 leads, 2 slips (R04).
- Supplier names: the five named supplier declarations exist at their heads. Process words: none.

## Verified sound

### Coverage

Read all of `README.md` (1601 lines, 66 numbered sections in nine layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the nine `gaps` of `design/plan.json`. The passages changed by the last repair (§2.8(c) and its Check, §8.2, §9.5, §9.8, E15, the contracts) were reviewed in full. The fifteen sampled sections and the headlines were read against the sources again. For text outside these, the round-8 rows with computed values were relied on, and a number of them were recomputed (table).

### Principles

No route-specific shortcut (every genus, every prime, quasi-split abelian type, singular weights kept). No second plan of a roadmap on main. No upward supply, no algorithm, no sorried data, no `set_option`. Roadmap and source texts were treated as data; none asked for an action.

### Seeded source sample (15 of 15 read; the author flagged no locator as unverified)

| Target | Text read | Outcome |
|---|---|---|
| §2.2 | BP-Hida line 374–376 (Def. 2.1.15, p. 8), 429–437 (Def. 2.1.19, Remark 2.1.20, p. 9), 444–451 (2.1.24), 456–461 (2.1.26, p. 10) | Supported; pages 8–10 correct. |
| §3.7 | BP-Hida line 2677–2688 (Cor. 4.5.4–4.5.5, p. 52) | Supported, with the twist by −ν. |
| §4.2 | BP-Hida line 1268 (Prop. 2.8.2, p. 25), 2800–2810 (Prop. 5.2.5, p. 54) | Equal torus parts required; supported. |
| §4.4 | BP-Hida line 2845–2856 (Prop. 5.2.7, p. 55), 2930–2940 (Lemma 5.4.2, p. 57) | Supported. |
| §4.6 | BP-Hida line 2876 (Prop. 5.3.3), 2891–2911 (Thm 5.3.5, p. 56), 2941–2953 (Remark 5.4.3, p. 57) | Supported. |
| §4.8 | BP-Hida line 2957–2977 (Thms 5.5.1–5.5.2, p. 57) | Supported: adjoint `w0·t⁻¹`, partner `w0M·w·w0`, weight `−w0Mκ−2ρ_nc`, cuspidal. |
| §5.3 | BP-Coleman line 1064, 1098–1101 (p. 23), 4669 (Prop. 5.1.4, p. 100), 4963–4968 (Cor. 5.3.4, p. 106), 5109–5132 (Thm 5.4.3), 5236–5250 (Thm 5.4.12, p. 112) | Supported; one page slip (R04). |
| §5.6 | BP-Coleman line 2450 (Thm 4.1.7, p. 51), 5377 (Thm 5.6.1, p. 115), 5458–5494 (Thms 5.7.1–5.7.2), 5551 (Thm 5.7.3, p. 119), 1456, 1489 | Supported. |
| §6.9 | BP-Coleman line 7416 (Thm 6.6.1, p. 161), 7557, 7603, 7660–7672 (Thms 6.7.1–6.7.3, pp. 164–167) | Supported, including torsion-freeness over a domain. |
| §6.10 | BP-Coleman line 7754–7760 (§6.9, p. 169), 3780 (§4.4.41, p. 80), 3926–3939 (p. 84), 4102–4108 (Prop. 4.4.53(2), p. 87) | Supported. |
| §8.1 | BP-Hida line 3139–3182 (§§6.2.1–6.2.8, pp. 61–62) | Supported: Props 6.2.3, 6.2.7, the formal support of §6.2.8. |
| §8.3 | BP-Hida line 3246–3291 (Props 6.2.12–6.2.14, Thm 6.2.15, pp. 63–64) | Supported, with E8 for the inversion. |
| §8.4 | BP-Hida line 3302–3306 (Cor. 6.2.17, Remark 6.2.18, p. 64) | Supported; rational only. |
| §9.1 | BP-Hida line 1734–1769 (§3.1, pp. 33–34); BP-Coleman line 6548–6556 (§5.14.3, p. 141) | Supported; table recomputed. |
| §9.2 | BP-Coleman line 6536–6547 (§5.14.2, p. 141); BP-GL2 line 61–106 (Thms 1.1–1.4, pp. 2–3), 114 | Supported. |

Also read for the repairs: BP-Hida line 1576–1586, 1637–1730, 3150–3157, 3183–3207; Pilloni-Singular line 923–968 (§5.1.5), 1698 (§7.1), 3293–3303 (Thm 11.3.1), 4653–4687 (Lemmas 14.8.3–14.8.4, Prop. and Cor. 14.9.1), 4702–4731, and line 82–96 (Thm 1.1).

### Adversarial table (sampled targets, headlines, targets touched by findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.2 strict contraction | Frobenius on ℙ¹, `D−=V(t)`; identity with Cartier D; irreducible Cbar | `(t^p)¹⊂(t)^p`, so `D−≤(1/p)(pD−)`. `(u^a)⊄(u^b)` for a<b. A proper closed set has empty interior, so compact forces ∅ or everything | Holds |
| §2.8(c) containment | Three points, σ(a)=a, σ(b)=a, σ(c)=b; Siegel pairs | `σ⁻¹{b,c}={c}`, `σ⁻¹{c}=∅`; stated `∅⊆∅` true, exchanged `{c}⊆∅` false. Siegel: `p1*D+,ε ≥ p2*D+,ε′` | Holds |
| §2.8 third Check | Same instance | `T(f)=(f(a),f(a),f(b))`, `T²(f)=(f(a),f(a),f(a))`; inner and outer both `𝔽₂[0]`; factorization fails at c | Values right; wording **R03** |
| §3.7 | GL₂, k=2, t=diag(1,3) | `ν_id(κ)=(−1,−1)`, `ν_id(κ)(t)=1/3`; twist by −ν multiplies by 3: `p·p⁻¹U_naive=U_naive` | Holds |
| §3.2 unit part | GL₂, k=2, p=3, t=diag(2,3) | `ν_id(t)=1/6`, `ν_long(t)=1/9`, `c_long=3/2`, `n_long=1` | Holds |
| §4.2 | Equal versus different torus parts | Source asserts the quasi-isomorphism only for equal torus parts (line 2800) | Scoped correctly |
| §4.4, §4.5 | `R=C⁰(T′,ℤ_p)[0]`; ν(u)=u^k | `M=Λ′[0]`; `[u]↦u^(−k)` | Holds |
| §4.6 (headline) | κ=κ_w(ν_alg), χ finite | `ν=−w⁻¹w0M(κ+ρ)−ρ` on both sides; `−ν` evaluation as in Remark 5.4.3 | Holds |
| §4.8 (headline) | g=1; g=2, w=s1 | g=1: id pairs with long, degrees `0+1=d=1`. g=2: `ℓ(w*)=3−1=2`, ranges [1,3] and [0,2] | Holds |
| §4.9, §8.4 (headlines) | g=1, 2, 3 | g=1: `M_id^0` in [0,1], refined to degree 0; g=3: rational `[ℓ(w),6]`. Fibres at maximal ideals of `Λ[1/p]` give the perfect amplitude | Holds |
| §5.3 | Pair (U′,Z′) inside (U,Z) | Cor. 5.3.4 hypotheses `T(U)∩Z⊆U′⊆U`, `U′∩Tᵗ(Z)⊆Z′∩U′⊆Z` are the inclusions of §5.2 for the s-th power | Holds |
| §5.6 | d=0; GL₂ | Point: F×F→F. GL₂: id cuspidal [0,0], canonical [0,1]; long cuspidal [0,1], canonical [1,1] | Holds |
| §5.8 (headline) | GL₂, k=2 and k=1 | k=2: `Cκ+={id}`, threshold 2 for U_naive. k=1: both chambers, [0,1] | Holds |
| §6.7 | GSp₄, w=1, v=s0, t₂ | `a_an=(3,3;0)` pairs to −3; `ν_v=(2−k₁,4−k₂;k₁+k₂)` pairs to −3; thresholds 0 and 3 | Holds |
| §6.9 | `A=F⟨t⟩`, complex `A→tA` | `H⁰=0`, `H¹=A/(t)`; fibre at t=0 has `H⁰=H¹=F` | Holds; no flatness claimed |
| §6.10 | Unit double coset; `E₁₂`, `E₂₁` | Zero assignment sends unit to 0. `E₁₂E₂₁=diag(1,0)≠diag(0,1)` | Holds |
| §3.8 Hecke relation | ℓ=3, ℓ=2 | `(ℓ+1)²=(ℓ²+ℓ)+(ℓ+1)`: `16=12+4`, `9=6+3` | Holds |
| §7.1, §7.5 (headlines) | Acyclic family; `H¹` only; `t:A→A` | Empty Z, E; nonempty support; image (t) with fibre F against specialized image 0 | Holds |
| §7.6, §8.5 (headlines) | κ=(5,3;−8) | `A_w=(0,2),(−2,2),(3,−3),(−5,−3)`, central −8. With (−½,−½;−½): 3,4,4,8. With (0,−1;−1): 6,6,11,11. BP-Coleman line 6555–6556 agrees | Holds |
| §8.1 | Pairs at ε, ε′, 0 | Proof of Thm 6.2.9 maps support `(D+,ε′,D−,ε)` to `(D+,ε,D−,ε′)`: (b) with inner pair ε | Holds |
| §8.3 | u=1+p, k=0, 1 | `[u]↦(1+p)^(−k)`: 1 and `(1+p)⁻¹` | Holds |
| §9.1 | ν=(0,−2); ν=(1,1−k); general ν | (5,3), (5,1), (2,−2), (0,−2); `κ_0=κ_1=(k+2,2)`; `κ_1=(3−ν₂,ν₁+1)`, `κ_2=(2−ν₁,ν₂)`; duals (5,3)↔(0,−2), (5,1)↔(2,−2) | Holds |
| §9.2 | k=2, 0, 1 | U_naive bounds (1,k); normalized by `p^(−min(1,k))`; thresholds `k−1` and `1−k` (BP-GL2 line 94–95); none at k=1 | Holds |
| §9.5 refinement | (1,1,9,9) at p=3; all 1; `a,b,b,c` | Products 1,9,9,81, eigenvalue 1/3 isolated. No isolated root. `P(a)=1`, `P(b)=P(c)=0` | Holds |
| §9.5 criterion | (1,1,p,p); (1,1,9,9); (σ,σχ₂,σχ₁,σχ₁χ₂) | `γ/α=p`: excluded. Ratios 1, 9, 1/9: applies. Ratio set `{χ₁^±1,χ₂^±1,(χ₁χ₂)^±1,(χ₁/χ₂)^±1}`, closed under inversion; `αδ=βγ=σ²χ₁χ₂` | Holds |
| §9.6(4) | k=0, k=3 | Third-term slopes ≥k−2, ≥k+1 on `H⁰`: (−2,1), (1,4). `H⁰` iso and `H¹` injective below k+1 from the long exact sequence | Holds |
| §9.8 route, dévissage | V=0; W generated by `V^Kli(p)` | `W^(GSp₄(ℤ_p))=V^(GSp₄(ℤ_p))⊆V^Kli(p)⊆W`; exact invariants, five lemma along a composition series | Holds |
| §9.8 route, valuations | k=0, 1, 3 | Ratios 0, ±(k+1): 1 occurs only at k=0. Products 0, k+1, k+1, 2k+2 | Holds for k≥1 |
| §9.8 route, eigenvalues | (1,1,9,9), p=3 | `α+β=2`, valuation 0 | **R02** |
| §9.8 route, spherical inputs | d=0, r=2 | `4+0, 2+1, 0+3`: the values of the earlier roadmap's §7.2 | **R01** |
| §9.8 (headline) | k=0; p=2 | Threshold `k+2r−3=1` contains slope 0; torsion statement from k=4 at p=2 (Thm 1.1(2): k>p+1) | Statement holds |
| §9.9 | n=2, ν=(4,2,0) | `ν+ρ=(5,2,−1)`; (−3,−5,2), (0,−5,−1), (0,−2,−4), each M-dominant | Holds |

### Library declarations opened at the pin

- `Module.End`: `Mathlib/Algebra/Module/LinearMap/End.lean:33`.
- `zpow_sub₀`: `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402`.
- `HasDerivedCategory` and `DerivedCategory`: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74` and `:87`.
- `CondensedMod` and its `Abelian` instance: `Mathlib/Condensed/Module.lean:41` and `:43`.
- `CondensedMod.IsSolid`: `Mathlib/Condensed/Solid.lean:83`, with its limiting docstring at 74–81.

All are as the README states. These six are the only backticked identifiers in the README, and none is presented as this roadmap's own. A search of the pinned Tau Ceti and Mathlib for Shimura varieties, Igusa towers and Iwasawa algebras finds no carrier.

### Duplication and ownership

All 23 supplier roadmaps were resolved at main or at their open heads. Every cited section heading exists (about 115 distinct citations, checked by script against the heading lines). Statements were opened for the citations the repair added:

- AutomorphicBundlesPartII §4.4: smooth tower representation, invariants recover finite level, admissible, exact invariants in characteristic zero.
- SmoothRepresentationsOfLocalGroups §SR.2.2: normalised induction and its transitivity. §SR.3.1: Howe finite length, cuspidal support. §SR.3.4: the Iwahori block criterion. §SR.4.5: the spin polynomial.
- ShimuraCompactifications §4.10.

The named supplier declarations exist: `HeckeImage.derived_hom_finite`, `coherentChambers`, `upperShriek_structureSheaf_iso_shift`, `relativeDualizingModule_smooth`, klingen-positive-hecke.

Ownership of the new §9.5 criterion: `roadmaps grep` finds no roadmap stating Pilloni's Proposition 5.1.5.2. SmoothRepresentationsOfLocalGroupsPartII §5.4 (open, merge order line 294, later) states the irreducibility criterion for split adjoint groups; GSp₄ is not adjoint and that roadmap is later, so the GSp₄ statement stays here. One uncited earlier owner: R01.

`scratch/overlaps.md` lists no dropped id, no id defined only by an open revision, no second copy and no conflicting head. The former-numbering table of Layer 5 keeps the ids PadicFamiliesPartII cites (its §5.5 and §5.8 citations use the former numbering).

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms (and AlgebraicModularFormsAndSerreWeightsPartII, SmoothRepresentationsOfLocalGroupsPartII); shared objects:

- the spherical integral `T_p,2` with its trace divisibilities and codimension-two restriction: owner AlgebraicModularFormsAndSerreWeightsPartII §§7.2–7.4 (R01);
- the valuations of Klingen Hecke parameters: this roadmap's §9.8 route for F=ℚ, PadicFamiliesPartII §4.6 for totally real F, later in the order;
- the Klingen BGG intertwining for F=ℚ: owner this roadmap §9.6(4); PadicFamiliesPartII's scope paragraph still describes the earlier exponent here;
- the away-p Hecke action on `M_Kli`: owner PadicFamiliesPartII §3.4;
- individual coherent Hecke operators and the tower representation: owner AutomorphicBundlesPartII §§3.13, 4.4;
- analytic coefficient sheaves: owner OverconvergentAutomorphicForms §§8.6–8.7.

### Supplier order

    depcheck: 240 roadmaps, 2187 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The roadmap is line 255 of the merge order. No forbidden roadmap is cited.

### Declared gaps

All nine slugs appear in `design/plan.json` and under `## Exact supplier contracts` with the same supplier and section. Each names a supplier and asks for an extension the supplier does not state. None is vague, unowned or already provided. No dependency is written as supplied that should have been a gap; the one uncited supplier (R01) exists.

### Shape, Lean form and padding

Summary, scope, conventions, contracts, build guide, nine layers each ending in Examples and Dependencies, consumers, references: present. 24 blocks have an API list and 37 have Checks; every definition has at least three. No LaTeX delimiters, pull-request numbers, paths, HTML anchors or process words.

`lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace. It declares nothing, so the one-tactic probe and the `#check @name` comparison have empty domains; there is no padding.

Headline theorems (README line 281): §4.6, §4.8, §4.9, §8.4, §5.8, §7.1, §7.5, §7.6, §8.5, §9.8. Each is named in the module docstring with the carrier it lacks. None is statable: each needs Siegel or abelian-type Shimura varieties, Igusa towers or supported coherent cohomology, which the pins lack.

### Copyright, licences and scope

Wording: the fifteen sampled statements and seven further passages (§2.8(c), the §9.5 criterion, the §9.8 route against Pilloni-Singular line 4660–4667, the §7.1 definition of E against BP-Coleman line 7757–7760, the §9.8 statement against Theorem 1.1, E15, the module docstring) were set beside the sources at their locators. No shared run beyond formulas and standard names (the longest is five words). One source word was carried over with its wrong sense: R02.

Arrangement: BP-Coleman has 62 of 132 source mentions. Its contents (BP-Coleman line 20–46, 70–73) against Layers 5–7:

- Layer 5 draws on source §§4.5–4.6, 5.4, 5.1/5.3, 5.4, 5.9, 4.1/5.6/5.7/2.7, 5.5/5.7/5.8, 5.12, in that order.
- Layer 6 draws on §§6.3, 4.4/6.6, 6.4, 6.1, 6.5, 6.2, 6.5, 6.8, 6.6–6.7, 6.9.
- Layer 7 follows §§6.9–6.10, where the *Needs* lines of §§7.2–7.6 force the order.

No one-to-one run that the dependencies leave free. Reuse: no table, figure or data taken over.

Source independence: 22 passages compared with 4 sources, none shared; largest share BP-Coleman, 62 of 132 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- The journal paginations of BP-Hida and Pilloni-Singular: the README cites the author editions only, and those were read.
- Reference [24] of Pilloni-Singular, to which the proofs of Propositions 5.1.5.1–5.1.5.2 defer: not opened. The README cites Pilloni and gives its own route, whose algebra I checked.

## Source issues

- **Misprint** in BP-Hida at §2.11, standing assumptions before Remark 2.11.1, p. 31: the source says the first-projection pullback of D′+ lies in the second-projection pullback of D″+; it should be the second-projection pullback of D′+ inside the first-projection pullback of D″+, and symmetrically for D−; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5, paragraph before Proposition 5.1.5.2, p. 22: the source says the Klingen quadruple satisfies equality of the products of the first two and of the last two parameters; it should be the outer product equal to the middle product, as on p. 21; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, p. 102: the source says the two operators have only eigenvalues of positive valuation; it should be nonnegative valuation, which is what the proof on p. 103 shows; affects a stated result.
- **Gap** in Pilloni-Singular at Lemma 14.8.3, proof, p. 102: the source says the claim follows from Lemma 5.1.5.2, which assumes four distinct products, though the valuations allow two to coincide; it should use only that the unit product is isolated; affects the proof.

## For the human reviewers

- Licence: BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`licence_class = "author-page"` in `packages/HigherHidaAndColemanTheory/sources.toml`); BP-Coleman's locator edition is an unpublished 180-page revision of arXiv:2110.10251.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0b988ee4c7ad2ac73831869d1c23369bd1ead45c", "job": "REV-PKG-HigherHidaAndColemanTheory~9", "model": "fable", "worker": "chris-x55"} -->
