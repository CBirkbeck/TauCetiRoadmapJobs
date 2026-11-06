# Review of RelativeFarguesFontainePartII (pull request #1825 at a4f22ee)

**Verdict:** accepted

Incremental re-review of the 2 changed lines since c3b08bc (one line of `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md`, the ST02 page range in §8.4). No finding, new or carried forward: the single P3 of the previous report is repaired and the repair introduced nothing, the gate passes on this head, the dependency check reports no UPWARD or CYCLE line, the Lean file is unchanged and elaborates with `sorry` the only warning, and every target of this round's seeded sample was read at its locator.

## Previous findings

- R01 — repaired: `README.md` line 1780 now reads "ST02, §3, definition and Theorems A/B, pp. 7–9; Corollaries 3.1–3.5, pp. 9–11; Lemma 3.6, p. 11." Corollary 3.5 is ST02 line 416, after the page-11 marker at line 415; Lemma 3.6 is line 430, on the same page (footer "11" at line 451). The other locators of that line were already right (definition ST02 line 314, p. 8; Theorems A/B lines 324–326, p. 9; Corollary 3.1 line 348, p. 9; Corollaries 3.3–3.4 lines 394, 401, p. 10). The References entry (line 2291, "printed pp. 7–11") agrees. Item 3.2 of that span is a Remark (ST02 line 390), so "Corollaries 3.1–3.5" names the span by its first and last items; every item is on the pages given, so no change is asked.

## Verified sound

**The change.** `git diff --stat c3b08bc..HEAD` touches only `README.md` (1 insertion, 1 deletion); `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous report read. `git diff --stat origin/main...HEAD` outside the folder is empty. Nothing else cites the changed line: ST02 occurs in the README only at lines 1780 and 2291, and §8.4 is cited by no other target's locator.

**Gate and tooling.** I re-ran the gate on a4f22ee: every check passes (`set_option=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run on the same head additionally records `build=0`). The dependency check:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

No UPWARD or CYCLE line. The roadmap is at merge-order line 329, after its last supplier LubinTateFormalModulesAndQuasiCanonicalLifts (line 327); VectorBundlesAndIsocrystals and RelativeFarguesFontaine are at lines 114 and 117.

**Lean file.** `lake env lean` on `Suggested.lean` gives exactly three `sorry` warnings (lines 65, 87, 102) and no error. I elaborated `#check @` for all four declarations (three theorems and the instance) in a scratch copy; the elaborated types are identical to those recorded in the previous report, none lost a binder, and each still equals its README statement (§11.2 line 2168, §11.3 line 2197, §11.5 line 2230, the instance at line 41). Imports `Mathlib` only, no `set_option`, no `lemma`, no sorry'd data. The one-tactic probes and the padding check of the previous report stand, the file being unchanged.

**Seeded sample, read at the locators** (FF17 is the author copy; its PDF page = printed page + 10, confirmed at the markers for pp. 61–65, 89–93, 98–100, 117–118, 146–147, 250–251):

| Target | Source passage | Result |
|---|---|---|
| 0.2 Ramified Gauss norm calculus | FF17 lines 2562–2580 (Lemma 1.4.2, pp. 61–62), 2612–2615 (Prop 1.4.3, p. 62), 2623–2632 (Prop 1.4.5, p. 63), 2677–2678 (Prop 1.4.9, p. 64) | `N_k` independent of the uniformizer, ultrametric in sums, convolution bound in products, `|x|_ρ = sup_k N_k(x)ρ^k`, independence of the Gauss norms of `π`, multiplicativity for every `ρ ∈ [0,1]`: as stated. The shift `N_k(πx)=N_(k−1)(x)` and `N_k(φx)=N_k(x)^q` are immediate from the coefficient definition |
| 0.3 Radial limits and coefficient topology | FF17 lines 2715–2731 (Rem 1.4.12, p. 65), 2733–2737 (Prop 1.4.13), 2741–2744 (Cor 1.4.15, p. 65) | `|[ε]−1|_1 = 1` for `ε ∈ 1+m_F∖{1}` when `E ⊇ ℚ_p`; `A` complete for every `|.|_ρ`; `ρ=0` π-adic, `ρ=1` `[ϖ]`-adic, interior `([ϖ],π)`-adic: as stated. The README's "pp. 64–65" for the three items starts one page early (all three are on p. 65); the range contains them, so no change |
| 1.5 Positive period subrings | FF17 lines 3752–3760 (Def 1.10.2, pp. 89–90), 3765–3770 (Lemma 1.10.4, Prop 1.10.5, p. 90), 3789–3794 (Rem 1.10.6) | `B_I⁺` the closure of `B^(b,+)`, `B_I⁺=B^(b,+)` when `0∈I`, `v_(r′)(x) ≥ (r′/r)v_r(x)`, `B_I⁺=B_ρ⁺=B_[ρ,1)⁺=B_[ρ,1]⁺` as algebras for `ρ=min I>0`, the last not as Banach algebras: as stated |
| 1.12 Ramified Witt covectors and bivectors | FF17 lines 3850–3856 (§1.10.2, p. 92), 3877–3895 (Def 1.10.11, pp. 92–93) | `CW^u=colim_V W_(O_E,n)`, `BW(O_F)=lim_a BW(O_F/a)`, coefficient description with `liminf q^n v(a_n) > 0`, embedding in `B⁺`, universal addition polynomials: as stated |
| 2.1 Q-compatible inverse limits | FF17 lines 4053–4063 (Def 2.1.1, p. 98), 4105–4118 (Cor 2.1.4, pp. 99–100), 4119–4120 (Rem 2.1.5, p. 100) | `Q ≡ X^q mod π`, `Q(0)=0`, π-adic = separated complete, sequences with `Q(x^(n+1))=x^(n)`, perfect `𝔽_q`-algebra structure through `lim_Frob A/π`, the limit formulas for sum and product, coordinatewise product only for `Q=X^q`: as stated |
| 2.2 Reduction invariance of the Q-limit | FF17 lines 4067–4075 (Prop 2.1.2, p. 99), 4101–4102 (Lemma 2.1.3), 4121–4125 (Rem 2.1.5, p. 100) | `I` closed, `A` separated complete for `I+(π)`, reduction bijective with inverse by iterated `Q`; `x≡y mod J ⇒ Q(x)≡Q(y) mod πJ+J²`; `R ≅ W_OE(R)^(♭,Q)` by `x ↦ ([x^(1/q^n)]_Q)` for perfect `R`: as stated |
| 2.10 Lubin–Tate primitive equations | FF17 lines 4804–4809 (§2.3.2, pp. 116–117), 4812–4828 (Lemma 2.3.5, Def 2.3.6, Ex 2.3.7, p. 117) | `Q ≡ X^q mod π`, `Q ≡ πX mod X²`; `u_ε=[ε]_Q/[ε^(1/q)]_Q = P([ε^(1/q)]_Q)` with `P=Q(X)/X`, `P ≡ π mod X`, `P ≡ X^(q−1) mod π`; reduction `ε^(1−q^(−1))`; cyclotomic example `1+[α]+…+[α^((p−1)/p)]`: as stated. The README cites pp. 117–118; the items are on printed p. 117 and the parametrisation continues onto p. 118 |
| 5.2 General-field divisor criterion | FF17 lines 5900–5907 (Thm 3.5.5, p. 146) | `div f ≥ div g ⇔ f ∈ B_I g`, `div f = div g ⇔ f ∈ B_I^× g`, injection of `B_I∖{0}/B_I^×` into `Div⁺(Y_I)`: as stated; the source allows `I ⊆ [0,1]` other than `{0}`, `{1}`, the README's `I ⊆ (0,1)` follows its declared interior-only divisor convention (§3.6) |
| 5.4 Half-open Bezout theorem | FF17 lines 5911–5914 (Prop 3.5.6, p. 147), 5936–5937 (Thm 3.5.7), 5939 (Cor 3.5.8) | `(f,g)` principal iff `inf(div f, div g)` principal on `I ⊆ (0,1)`; `B_(0,ρ]` Bézout with closed ideals = principal ideals; Robba ring Bézout: as stated |
| 6.6 Full Frobenius orbit products | FF17 lines 10146–10169 (Lemma 6.2.12, pp. 250–251) | `div Π(b) = Σ_(n∈ℤ) φ^n(div b)` in `Div⁺(Y/φ^ℤ)`, reduced to `div Π_−(b) = Σ_(n<0)` through `D′+D=φ(D)` and compact-annulus support: as stated |
| 11.3 Untilts not topologically isomorphic to Cp | KT16 lines 64–66 (Thm 1.3, p. 2) | perfectoid `K` with `K^♭ ≅ ℂ_p^♭` not isomorphic to `ℂ_p` as a topological field: as stated; the Lean form was compared in the previous report |
| 4.5, 4.9, 6.11, 10.8 | read in the previous report at FF17 lines 5578–5715, 5816–5850, 10306–10327, 11078–11165 | unchanged passages; the previous report's verification stands |

**Adversarial table.** The diff changes no mathematical statement. The rows of the previous report (PRREVIEW-RelativeFarguesFontainePartII~1, 54 rows from the Conventions through the instance `fact_not_isUnit…`) carry forward unchanged for every statement, since every statement is untouched; the one changed line gets its own row:

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §8.4 locator line (the changed line) | each cited item against the ST02 page markers | footers at lines 283, 320, 362, 414, 451 read 7, 8, 9, 10, 11, so PDF page = printed page; definition line 314 → p. 8; Theorems A/B lines 324–326 → p. 9; Cor 3.1 line 348 → p. 9; Rem 3.2 line 390, Cor 3.3 line 394, Cor 3.4 line 401 → p. 10; Cor 3.5 line 416 → p. 11; Lemma 3.6 line 430 → p. 11 | "pp. 7–9", "pp. 9–11", "p. 11" all correct | none |
| Every other statement | as in the previous report | as in the previous report (e.g. §0.2 product index `5`, norm `ρ⁵/8`, `v_2(φx)=10=2v_1(x)`; §0.3 `v_r=3+2r`; §1.5 `|π^(−1)|_1=1`; §2.1 `(−2)²=4≠2`; §2.10 `Q_2(t^(1/4)) ≡ t+πt^(1/2) mod π²`; §6.6 radii `2^(−2^n)`; §11.3 `v(p)=1/p<1`) | unchanged | none |

**Cross-roadmap citations and declared gaps.** Unchanged since the previous report, which resolved every citation on main or at the open head and checked the six declared gaps against `design/plan.json`; the changed line cites no roadmap. The worker's citations tool again found nothing unresolved.

**Ownership.** Unchanged: no other roadmap on main or at the open heads listed in the brief states the strict Laurent-closure endomorphism, the exotic untilt or the Hahn-field automorphism theorem (previous report, `roadmaps grep`).

## Not verifiable

- none. ST02, FF17 and KT16 are in the cache and were read at the lines above.

## Source issues

- none new in this round. The ten FF17 items recorded in the previous report stand; the ST02 passages read here (§3, pp. 7–11) are correct as printed.
