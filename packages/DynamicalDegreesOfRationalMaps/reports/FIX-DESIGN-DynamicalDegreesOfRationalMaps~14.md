# FIX-DESIGN-DynamicalDegreesOfRationalMaps~14

Findings of `REV-DESIGN-DynamicalDegreesOfRationalMaps~13` (two findings, both P3).

## F01 (P3) — applied

Verified. `dangfavre2021` lines 464–465 say that `λ_k(f)` lies in `[1, +∞)` and does not depend on the big and nef class `ω`. That is §5.2. §5.3 is about birational conjugacy, the normalization lift and extension of the field. `dangfavre2021` lines 83–84 say that the dynamical degrees do not depend on the polarization and are invariant under any birational conjugacy. That backs the first item of §5.3.

What changed:
- §5.3, closing parenthesis: "dangfavre2021 lines 464–465" → "dangfavre2021 lines 83–84, for invariance under birational conjugacy", as asked.
- `plan.json` 5.3 `where` does not cite Dang–Favre, so it is unchanged.

Pattern repair. I reopened every `dangfavre2021` locator that falls in lines 461–467:
- §5.1 cited "dangfavre2021 lines 461–465" for convergence and the infimum formula. Only lines 461–463 say that (the sequence `C·deg_{k,ω}(f^n)` is sub-multiplicative, its `n`-th roots converge to their infimum, and `λ_k` is defined there). Lines 464–465 are the §5.2 facts. The README §5.1 and `plan.json` 5.1 `where` now read "lines 461–463".
- §3.5 cited "dangfavre2021 lines 464–467" for the use of Khovanskii–Teissier on dynamical degrees. Line 464 is the `[1, +∞)` statement. The log-concavity sentence and `λ_1² ≥ λ_2` are lines 465–467, so §3.5 now reads "dangfavre2021 lines 465–467". `plan.json` 3.5 does not cite Dang–Favre.
- §5.2 cites "dangfavre2021 lines 464–467" for `[1, ∞)`, independence of `ω` and log-concavity. That is exactly what those lines say, so it is unchanged.

I also reopened the other locators of §5.3: `dang2020` lines 35–46, `truong2020` lines 159–164 and 1529–1533, and `dinhsibony2005` lines 256–263. Each says what it is cited for.

## F02 (P3) — applied

Verified with a script that maps every source id mentioned in the README to the `###` section or `## Scope` heading where it appears, then compares the result with each manifest entry's `cited_for`.

Before the repair:
- `dinhsibony2005` lacked "§5.2" (§5.2 cites lines 69–70: the top dynamical degree equals the number of preimages of a generic point, which backs `λ_d = e(f)`).
- `dangfavre2021` lacked "§5.3".
- No entry listed a section that does not cite it.

What changed:
- `dinhsibony2005` `cited_for`: "§5.2" added between "§5.1" and "§5.3".
- `dangfavre2021` `cited_for`: "§5.3" added between "§5.2" and "§6.4". It stays correct after F01, because §5.3 still cites `dangfavre2021`, now at lines 83–84.

After the repair the comparison shows no difference for any of the 15 entries. It ignores mentions in References and Downstream consumers, which name a work but cite it for no claim, as in every earlier round.

## Adversarial pass on the changed passages

No statement, hypothesis, Check or target changed; only locators and manifest fields did. I recomputed the Checks of the sections whose citations changed, against the claims the new locators back.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §5.3 birational conjugacy (now backed by `dangfavre2021` lines 83–84) | Cremona `σ` of `ℙ²` conjugated by a linear `φ`; `f = id` on the cuspidal cubic with `φ = ν⁻¹` to `ℙ¹` | `(φσφ⁻¹)² = φσ²φ⁻¹ = id`, so `deg_{1,H}` runs `2, 1, 2, 1, …` and `λ_1 = 1 = λ_1(σ)`; `λ_k(id) = 1` on both sides | holds; locator replaced |
| §5.1 convergence to the infimum (now backed by lines 461–463) | morphism of `ℙ^d` of degree `a`, `1 ≤ k ≤ d − 1`; `k = 0`, `k = d` | `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k = lim (a^{nk})^{1/n}`, value at `n = 1` is `(d−k+1)^k a^k > a^k`; constant `1`, sequences `1` and `a^d`, infimum attained at `n = 1` | holds; range narrowed from 461–465 |
| §3.5 consequence for dynamical degrees (now backed by lines 465–467) | `A = O(2,1)`, `B = O(1,1)` on `ℙ¹×ℙ¹`, `k = 1`; Fibonacci map | `s_1² = 3² = 9 ≥ s_0·s_2 = 2·4 = 8`; `λ_1² = φ² ≈ 2.618 ≥ λ_0·λ_2 = 1·1` (line 467: `λ_1² ≥ λ_2`) | holds; range narrowed from 464–467 |
| §5.2 `λ_d = e(f)` (`dinhsibony2005` lines 69–70, now in `cited_for`) | squaring map of `ℙ¹`; Frobenius of `ℙ^d` | `λ_1 = 2 = [K(z):K(z²)]`; `λ_d = p^d = e(F)` | holds; manifest field only |
| §5.2 `[1, ∞)` and independence of `ω` (lines 464–467, unchanged) | Cremona; Fibonacci | `λ_k = 1 ∈ [1, ∞)`; `(1, 1.618…, 1)` | holds; none |

## Checks run

Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line. After the edits, `plan.json` still parses as JSON and `sources.toml` still parses as TOML.

Lean: the design stage has no `Suggested.lean`. Nothing was elaborated, and there was no `#check` comparison to run. No Lean command was run.

## Notes for the maintainer

- No target, Lean name, section number, statement or supplier changed, so no other roadmap's citation is affected. `gaps` stays empty.
- No source was fetched; `dangfavre2021` and `dinhsibony2005` were already in the cache. In the manifest only the two `cited_for` fields changed. `needs-references.toml` was not written.
- This round adds no construction, so there is no new ownership question. Ownership against open pull requests stands as checked in earlier rounds.
