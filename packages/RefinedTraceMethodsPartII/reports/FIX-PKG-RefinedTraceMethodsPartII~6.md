# FIX-PKG-RefinedTraceMethodsPartII~6: repair report

Review settled: `REV-PKG-RefinedTraceMethodsPartII~5` (two findings, both P3, both in README Checks). Both are correct and both are applied. Only `packages/RefinedTraceMethodsPartII/README.md` changed (two Check bullets). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

§1.5, last Check. The claim is right. For i = 1 the denominator is `|K_0(𝔽_q)| = |ℤ|`, which is infinite, so the quotient is undefined (KTheoryFiniteLocalFields §1.6 keeps K₀ = ℤ apart from the finite groups).

Old: "consistent with `|K_{2i−1}(𝔽_q)|/|K_{2i−2}(𝔽_q)| = q^i − 1` being prime to p".

New: the n = 1 ε-count holds "for every i ≥ 1". For i ≥ 2 the quotient is `(q^i − 1)/1`, which is prime to p. For i = 1, `K_1(𝔽_q) = 𝔽_q^×` has order q − 1, which is prime to p. The order of K₀ is never used as a divisor. Witness for q = 2: 3/1 at i = 2, and order 1 at i = 1.

Same pattern searched: every `|K_…|` quotient and every K₀ mention (README lines 99, 502, 506, 526, 811, 821, 829, 834, 840–842, 873, 881). §9.3 (line 834) already restricts the integral quotient to i ≥ 2. §9.5 (lines 867, 873) has i ≥ 2. Line 811 is about `K_{2i−1}(𝔽_q;ℤ_p) = 0` for i ≥ 1, which is true including `K_1(𝔽_q;ℤ_p) = (𝔽_q^×)^∧_p = 0`. No other occurrence divides by the order of K₀.

## F02 (P3) — applied

§6.2, second Check. The claim is right. That bullet fixes the cusp (a,b,r) = (2,5,0), where T = {1,3}, but its last clause used `W_{{1}}(k)`, which is the K₀ of the (2,3) cusp.

I kept the (2,5,0) cusp, which is the reviewer's second option and the one that matches the rest of the bullet. Old: "for the perfection of `𝔽_3[t]` already `K_0 = W_{{1}}(k) = k` has infinite length".

New: "for k the perfection of `𝔽_3[t]` the same cusp gives `K_0 = W_{{1,3}}(k) = W_2(k)`, of infinite length". The reason is that restriction maps it W(k)-linearly onto `W_1(k) = k`, and the ideals `(t) ⊋ (t²) ⊋ ⋯` of k are W(k)-submodules.

Same pattern searched: "infinite length" and "perfection of" occur nowhere else. The (2,3) Check on line 621 says `W_{{1}}(k) = k` for the (2,3) cusp, which is correct, and was left as it is.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 ε-count for n = 1 | i = 1, 2, 3 | The range 1 ≤ j′ ≤ i·1 − 1 is {}, {1}, {1,2}. Every j′ is divisible by 1, so the sum is 0 = i·0 | Pass for every i ≥ 1 | "for every i ≥ 1" made explicit |
| §1.5 finite-field order, i ≥ 2 | q = 2, i = 2; q = 3, i = 2; q = 4, i = 3 | `K_3(𝔽_2) = ℤ/3`, `K_2 = 0`, giving 3/1 = 3, odd. `K_3(𝔽_3) = ℤ/8`, `K_2 = 0`, giving 8, prime to 3. `K_5(𝔽_4) = ℤ/63`, `K_4 = 0`, giving 63, odd | Pass | Restricted to i ≥ 2 |
| §1.5 finite-field order, i = 1 | q = 2, 3, 5 | `|K_1| = q − 1` = 1, 2, 4, each prime to p = 2, 3, 5. K₀ = ℤ has no finite order | Pass. The old quotient at i = 1 was undefined | Separate i = 1 clause |
| §6.2 cusp (2,5,0) over the perfection of 𝔽₃[t] | T(2,5,0) by enumeration; k = 𝔽₃ against the perfection of 𝔽₃[t] | The values 2i + 5j with i, j ≥ 1 are the odd numbers from 7 on and the even numbers from 12 on. So S(2,5,0) = {1,2,3,4,5,6,8,10}, which has 8 elements (2·8 + 2 = 18 = 3·6), and T = {1,3}, with 2·2 = 1·1·4. For p = 3, {1,3} = {1,p}, so `W_T = W_2`. Over 𝔽₃ this is ℤ/9, length 2. Over the perfection of 𝔽₃[t], 3·(1,0) = (0,1) ≠ 0, so the exponent is 9 and not 3. That rules out the old reading "= k" | The old identification was wrong. The new one is consistent with the theorem | Replaced by `W_{{1,3}}(k) = W_2(k)` |
| §6.2 infinite length | k = perfection of 𝔽₃[t] | `R : W_2(k) → W_1(k) = k` is a surjective ring map compatible with `W(k) → W_2(k)`, so it is W(k)-linear. t^i ∉ (t^{i+1}) because t^{−1} ∉ k (its t-adic valuation would be −1 < 0). So the chain is strictly descending and the length of k is ∞, hence the length of `W_2(k)` is ∞ | Pass | Witness chain added |
| §6.2 product-ring clause (kept) | k = 𝔽₃ × 𝔽₃ | `W_2(k) = ℤ/9 × ℤ/9`, of length 2 + 2 = 4 over ℤ₃ × ℤ₃, against the field formula's 2 | Pass | None |

The Check on the same object that disagreed was the §6.2 bullet against itself. §6.2's theorem (K₀ = `W_{T(a,b,0)}(k)`) and the §1.1 Sylvester count (#T(2,5,0) = 2) now agree with that bullet.

## Checks run

- **Elaboration.** I ran `lake env lean packages/RefinedTraceMethodsPartII/Suggested.lean` from the content checkout. Exit 0, with exactly three `declaration uses 'sorry'` warnings at lines 61, 69 and 77 and nothing else. The file has no `TauCeti.*` import, so there was nothing to build.
- **Signatures.** I made one scratch copy with `#check @name` for all six declarations and elaborated it once. Exit 0. The elaborated types are:
  - `cuspCount`, `cuspTruncationSet` and `cuspCoprimeSet` each take three natural numbers.
  - `ncard_cuspTruncationSet` and `ncard_cuspCoprimeSet` keep `2 ≤ a`, `2 ≤ b` and `a.Coprime b`, with r universally quantified.
  - `card_noCyclicRepetition` keeps `1 ≤ m`.

  All six match their README statements. No binder was lost and none changed, which is expected because `Suggested.lean` was not edited.
- **Dependency check.** The `gate --depcheck` command as given in the brief printed:

  ```text
  depcheck: 245 roadmaps, 2240 edges, 0 problem(s)
  ```

  Exit 0. There is no UPWARD, CYCLE or moved line.
- **Citation leads.** The only lead was `BigWitt.TruncationSet` (README line 110), and it is a false positive. The name is declared at QWittVectors' head as `structure TruncationSet` inside `namespace TauCetiRoadmap.QWittVectors` / `namespace BigWitt` (its Suggested.lean line 71), checked with `roadmaps show`. QWittVectors comes earlier in the merge order. The resolver only searched the pinned libraries for it. No change.

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name, section number or target changed, so no other roadmap is affected.
- No source was fetched and the manifest is unchanged.
- No suspicious instructions were found in the review text.
