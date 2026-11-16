# FIX-PKG-MotivicStructuresInModuliOfCurves~8

Repair of the three findings of `REV-PKG-MotivicStructuresInModuliOfCurves~7` (all P3). All three were verified against the cached sources and applied, together with two further occurrences of the same patterns. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Verified against the page markers of the cached bfp text: §11.4 starts at bfp line 1618 (p. 1362); Example 7.7 is at line 713 (p. 1339) and Example 7.9 at line 742 (p. 1340); Propositions 8.6–8.7 are at lines 934 and 947 (p. 1345) and end at line 994 (p. 1346); §11.3 starts at line 1572 (p. 1361) and ends on p. 1362; Theorem 11.5 is at lines 1628–1637 (p. 1362).

Old → new in `packages/MotivicStructuresInModuliOfCurves/README.md`:
- §3.1: "§11.4, pp. 1361–1362" → "p. 1362".
- §8.7: "pp. 1338–1340" → "pp. 1339–1340".
- §8.11: "pp. 1344–1346" → "pp. 1345–1346".
- §9.9: "§11.3, pp. 1360–1361" → "pp. 1361–1362".
- §9.10: "pp. 1362–1363" → "p. 1362".

Manifest (`sources.toml`):
- `petersen-genus-one`: `locator` "Theorem 1.1 and Corollary 1.2" → "Theorems 1.1 and 1.3; Corollary 1.2". Theorem 1.3 is at petersen-genus-one line 207 and is cited in §2.7.
- `canning-larson`: `locator` gains "§3.1" and "Lemmas 10.11 and 10.12", and `cited_for` gains "5.2". §3.1 is at canning-larson line 679, Lemma 10.11 at line 2031 and Lemma 10.12 at line 2041. The review could not find the two lemmas because its plain search missed them.

Pattern sweep: I checked the other 43 BFP page locators against the page markers myself. One more is off by one. §8.12 cited "§8.4 and Remark 8.11, pp. 1348–1351" and now cites "pp. 1349–1351": the four-point general-position count starts at bfp line 1100 (p. 1349), and p. 1348 holds only the non-reduced and five-singularity cases. The other ranges agree. For example, "Propositions 8.1–8.2, pp. 1341–1343" is right because Proposition 8.2 ends at line 852 (p. 1343), and "Proposition 8.8, pp. 1346–1350" is right because its proof ends at line 1171 (p. 1350).

## F02 (P3) — applied

Verified. Take the loop divisor of `M̄_{3,11}` at `k = 8`. It contributes `H⁶(M̄_{2,13})`, which none of the cited inputs covers: §10.1 stops at degree 3, §§9.8 and 10.9 are odd, §12.9 covers degrees 13–15, and §10.4 does not apply because `2·16 − 6 = 26 > 14`. CLP covers it by citing CLP-H11 (clp lines 538–540), which is not a target here.

Old → new in §12.10:
- Route: the clause "polynomials … by §§12.9, 10.9, 9.8 and 10.1 and … §3.6" becomes a factor-by-factor argument. It lists the normalizations `M̄_{2,n+2}`, `M̄_{1,a} × M̄_{2,b}` (`a ≤ 12`) and `M̄_{0,a} × M̄_{3,m}` (`m ≤ n − 1`). Odd degrees come from §§9.8, 4.7, 10.9, 12.9 and 3.6. Even degrees are tautological, hence Tate (§0.1), by §2.6, §3.3 and §4.3. Genus-three factors are handled by induction on `n`.
- *Needs:* now lists §§0.1, 0.4, 2.6, 3.3, 3.6, 4.3, 4.7, 5.3, 5.4, 9.8, 10.9, 12.9 and the declared gap `dm-stack-cycle-class` (§10.5, the parallel case, cites the same gap). §§10.1 and 10.4 are dropped because the route no longer uses them.
- New Check: `H⁶(M̄_{2,13})` (covered by §4.3, `r = 3`) and `H⁶(M̄_{3,5})` at `n = 6`, `k = 8`. The second is outside §§10.1–10.4 (`2·11 − 6 = 16 > 14`) and is the `n = 5` step of the induction.

The review's repair kept §10.1 in *Needs:* although its clause does not use it; I removed it. The review's list also covers only genus-three factors through the induction. I checked that §10.4 is not a substitute: it covers `M̄_{3,m}` in all even degrees only for `m ≤ 1`, so the induction is needed for `m ≥ 5`.

Same pattern elsewhere: the §11.1 route ("boundary terms are controlled by §§4.7, 10.9, 9.8 and 10.1") used `H¹³` of genus-one boundary factors in the degree-fifteen case (the loop divisor `M̄_{1,n+2}`) without citing where it comes from. I added the missing step, from CLP's proof of Corollary 2.9 (clp lines 347–356). For a genus-one factor, `W₁₃H¹³(M_{1,m}) = 0` by §3.2 because `S₁₄ = 0`, so by §0.4 its `H¹³` is `L` times a quotient of `H¹¹` of its normalized boundary, which §§2.9 and 4.7 make a sum of copies of `S₁₂`. Genus-zero factors have no odd cohomology (§2.6). §11.1's *Needs:* gains §§2.6 and 3.2. The other boundary-term routes (§§4.3, 10.4, 10.9, 12.1, 12.2) name inputs for every factor they use.

## F03 (P3) — applied

Verified: `{L⁶}` in degree twelve is CLP-H11 Theorem 1.2 (clp-h11 line 49). No target here states it. The even-degree targets are §§2.6, 3.3, 4.3, 10.1–10.4 and 12.9 (degree 14).

Old → new, §4.11 Check: "in degree twelve it is `{L⁶}`" → "in degree eleven `{S₁₂}` (§§4.7 and 10.9); in degree thirteen `{L S₁₂}` and in degree fourteen `{L⁷}` (§12.9)". The Check also shows that neither list is empty: `H¹³(M̄_{1,12})^ss ≅ (L S₁₂)^{⊕11}` (§3.6), and the top class of `M̄_{0,10}` spans a copy of `L⁷` (§2.6). I searched the README for other even-degree claims without a target. The only other one, `H¹²(M̄_{4,3})` in the §9.7 Checks, is covered by §9.7.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §12.10 boundary list | normalizations of the boundary divisors of `M̄_{3,n}` | loop `(2, n+2)`; separating `g₁ + g₂ = 3`: `(1, a)×(2, b)` with `a = |A| + 1 ≤ n + 1 ≤ 12`; `(0, a)×(3, m)` with `|A| ≥ 2`, so `a ≥ 3` and `m = |B| + 1 ≤ n − 1` | complete; genus at most 3; genus-three factors have fewer markings | stated in route |
| §12.10 even inputs | `H⁶(M̄_{2,13})` at `n = 11`, `k = 8` | `d = 16`; §10.4 needs `2d − 6 = 26 ≤ 14`, fails; §4.3 with `r = 3 ≤ 10` gives `RH⁶`, a sum of copies of `L³` | holds | new Check |
| §12.10 genus-three induction | `m = 0, 1, 5` | `m ≤ 1`: `d = 6, 7`, §10.4 covers every even degree since `2d − k′ ≤ 14`; `m = 5`: `d = 11`, `H⁶`: `2d − 6 = 16 > 14`, not §10.3 (`g = 3 < 10`); needs `n ≥ 6` (`|A| = n − 4 ≥ 2`), `k = 8 ≤ d = 12` | induction needed from `m = 5`; base `n ≤ 1` has no genus-three factor | new Check |
| §12.10 odd inputs | `k′ = 1…9, 11, 13, 15`; `g′ = 0…3` | `≤ 9`: §9.8; 11: §§10.9 and 4.7 (nonzero only for `g′ = 1`, `n′ ≥ 11`); 13: §12.9, every pair; 15, `g′ ≥ 2`: §12.9; 15, `g′ = 1`, `a ≤ 12`: §3.6, with weight-15 pieces `L² S₁₂` and `S₁₆`, the latter first at 15 flags; `g′ = 0`: §2.6 | holds | — |
| §12.10 hard Lefschetz range | `n = 11` | `d = 17`; `k ≤ 17` gives boundary degree `k − 2 ≤ 15` | holds | — |
| §11.1 degree-15 boundary | `H¹³(∂̃M̄_{2,n})` | Künneth: odd factor of degree 11 or 13 (`≤ 9` vanish), even complement of degree 2 or 0; `H¹¹(M̄_{2,b}) = 0` (§10.9); so the terms are `H¹¹(genus one) ⊗ H²` and `H¹³(single factor)` | holds | route clause |
| §11.1 genus-one `H¹³` | `m = 12, 13` | `m = 12`: `H¹¹(∂̃) = S₁₂^{66}` (`binom(12,2)` divisors `M̄_{1,11} × M̄_{0,3}`) maps onto `(L S₁₂)^{11}` (§3.6); `m = 13`: `78·11 + 286·1 = 1144 ≥ 429` | consistent | — |
| §4.11 Check, degree 11 | `M̄_{1,11}` | `H¹¹ ≅ S₁₂`, rank 2; `S₁₂` is simple as a Hodge structure because a rank-one rational Hodge structure has even weight | holds | — |
| §4.11 Check, degree 13 | `M̄_{1,12}` | coefficient of `L` in `11 + 11L` (§3.6, first Check) is `11` | nonempty | — |
| §4.11 Check, degree 14 | `M̄_{0,10}` | `dim = 10 − 3 = 7`; `H¹⁴ = ℚ(−7) = L⁷` | nonempty | — |
| F01 pages | bfp page markers | page `N` is journal page `1322 + N` (header line 5: pp. 1323–1365; line 40 prints "1323" on page 1); lines 713→1339, 742→1340, 934/947→1345, 994→1346, 1572→1361, 1617→1362, 1618/1628→1362, 1100→1349 | five wrong pages confirmed, plus §8.12 | fixed |

## Checks

- `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output, 12 s. The file is unchanged: `import Mathlib`, its docstring and an empty namespace. With no declarations there is nothing to `#check @name` against the README. No `TauCeti.*` import, so nothing needed building.
- Dependency gate (`gate --depcheck … --movable`):

```text
depcheck: 237 roadmaps, 2244 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The only supplier reference added is the gap `dm-stack-cycle-class` of MotivesAndAlgebraicCycles. It is already declared in `design/plan.json` and in the README's supplier contracts, so the `gaps` list is unchanged.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `sources.toml` parses with 26 entries, one key per work; no new key was added and nothing was fetched.

## Gate failures

None listed for this job.

## For the maintainer

- No Lean name changed, and no section, layer or target was renumbered, so no citation in another roadmap is affected.
- The CLP-H11 even-degree theorem (`H¹²(M̄_{g,n})^ss` a sum of copies of `L⁶`; its Theorem 1.2) stays outside this roadmap. Nothing here depends on it any more: §4.11 no longer asserts it, and §12.10 gets its even inputs from §§2.6, 3.3, 4.3 and induction.
- No passage of the review's text was suspicious; it was treated as claims to verify.
- Ownership against open pull requests: unchanged this round. No object was added, only routes, Checks and locators.
