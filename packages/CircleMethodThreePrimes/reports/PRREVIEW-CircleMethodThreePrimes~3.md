# Review of CircleMethodThreePrimes (pull request #1803 at b48dc9c)

**Verdict:** accepted

Incremental re-review of the 29 lines of `TauCetiRoadmap/CircleMethodThreePrimes/README.md` changed since 237a60c (`Suggested.lean` is unchanged since that head). Both findings of the previous review are repaired, the repairs introduce no new problem, the gate passes and the dependency check is clean. No finding remains.

## Previous findings

- R01 — repaired: lines 27–28 own "the Ramanujan sum on native carriers, with the properties §1.16 of `AutomorphicSpectralTheory` does not state"; lines 48–50 and 105–109 cite `S(n, 0; q)` with its divisor formula and values; lines 188–192 give the one-clause difference and the identification as an API bullet with the `q = 12` witness; lines 198–199 and 209 carry the `*Needs:*` and Dependencies.
- R02 — repaired: lines 297–299 add the third Check (`q = 2`, `a = 1`: `|ψ(x; 2, 1) − x| ≤ C x (log x)^{−A}` against the false `x/2` variant); line 324 reads "`SiegelWalfiszBound`, Layers 0.1, 0.2 and 2.1; `AnalyticNumberTheoryPartI` §0.32 for `ψ(x; q, a)`".

## Verified sound

**The changed passages against their supplier.** `AutomorphicSpectralTheory` is not on main; it is an open pull request adding a new roadmap folder, at merge-order line 88 against this roadmap's 270, so citing it is downward supply. At its head, §1.16 "Kloosterman sums and hyperbolic Laplacians" (its README line 1282) defines `S(m, n; c) = Σ_{d ∈ (ℤ/cℤ)^×} e((md + n d̄)/c)` for `c ≥ 1` with `e(x) = exp(2πix)`, and its "Checks of the finite sum" are `S(m, n; 1) = 1`, `S(0, 0; c) = φ(c)`, `S(m, 0; p) = p − 1` if `p ∣ m` and `−1` otherwise, and `S(m, 0; c) = Σ_{d ∣ (m, c)} μ(c/d) d`: exactly what README lines 48–50 and 109 attribute to it. Its API list (frequency symmetry, reality, the slash commutation, `Δ_k y^s`) and Checks state neither multiplicativity in the modulus, nor `|S(m, 0; c)| ≤ gcd(m, c)`, nor the vanishing at `p^k`, `k ≥ 2`, `p ∤ m`, so the three reasons line 189–191 gives for keeping `ramanujanSum` are accurate. Its `Suggested.lean` at the same head contains no Kloosterman or Ramanujan declaration (grep), as line 109 says, so `ramanujanSum` (Lean line 60, `(q : ℕ) (n : ℤ) : ℂ`, the sum over `b ∈ range q` coprime to `q` of `e(bn/q)`) clashes with no declaration and is the "native carriers" specialisation line 188 describes. `CharacterSumsOverFiniteFields` (#1712) README lines 47–48 and 1918–1931 defer the same integer-modulus sum to §1.16, consistent with the ownership stated here.

**The new Check.** `ψ(x; 2, 1)` omits exactly the prime powers `2^k ≤ x`, `k ≥ 1`, each with `Λ = log 2`, and there are `⌊log₂ x⌋` of them, so `ψ(x; 2, 1) = ψ(x) − log 2 · ⌊log₂ x⌋` (line 297) is exact; `φ(2) = 1`. Computed at `x = 10`: `ψ(10) = 7.8320`, `ψ(10; 2, 1) = 5.7526`, three omitted terms `2, 4, 8`.

**Consistency of the edited lines with the rest of the README.** 3.1 `*Needs:*` (line 301: 0.1; `AnalyticNumberTheoryPartI` §0.32) and 3.2 `*Needs:*` (lines 313–314: `SiegelWalfiszBound`; 0.2, 2.1, 3.1; Mathlib) are now covered by Layer 3's Dependencies (line 324). Layer 0's Dependencies (line 209) names §1.16 "for the identification in 0.2" only; the Ordering paragraph's "Layers 0 and 1 need only Mathlib" (line 454) describes the build inputs, and since the supplier declares no Lean name the build of Layer 0 does import only Mathlib: consistent. The export contract (line 145) is unchanged and names only this roadmap's declarations.

**Gate and dependency check.** The worker's gate at b48dc9c: every check 0, `build=0`, OK. Run by me: the plain gate reports `depcheck=1 NOT IN ORDER: CircleMethodThreePrimes (insert it after its last supplier)` because the configured merge order does not list this roadmap yet; the same gate with `--order` and the job's merge-order candidate (which lists it at line 270) reports every check 0, OK. The dependency check:

```
depcheck: 243 roadmaps, 2455 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The overlaps scan lists no open pull request changing this roadmap, no dropped id it cites and no id it drops; `roadmaps resolve` has one lead, `SieveVaughan.vaughan_identity`, which exists at the head of `SieveMethodsAndPrimePatterns` (#1495, its `Suggested.lean` line 294), as in the previous round.

**Elaboration.** `lake env lean` on `Suggested.lean` at head: 18 `declaration uses sorry` warnings, nothing else (20 s). The file is byte-identical to the head the previous review read, so the 28 elaborated signatures compared there with the README (no `variable` block, no lost binder) stand; `ramanujanSum : ℕ → ℤ → ℂ` (signatures) is the carrier line 188 states.

**Sources.** The two edited targets cite Davenport Chapter 26 (closed, carried below) and `AutomorphicSpectralTheory` §1.16 (resolved above). The seeded sample outside the changed passages was checked in the previous round and is carried.

**Adversarial table.** Rows for the changed statements are computed this round; the rest carry forward from the previous report (r2), whose values were recomputed there.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.2 identification `ramanujanSum q n = S(n, 0; q)` (new) | `q = 12`, `n = 1, 2, 3, 4, 6, 0`; `q = 1`; `q = 0` | unit sum over `b ∈ {1, 5, 7, 11}`: `0, 2, 0, −2, −4, 4`; divisor formula `∑_{d ∣ (n, 12)} d μ(12/d)`: `0, 2, 0, −2, −4, 4`; supplier's `S(n, 0; 12)` is the same sum over `(ℤ/12)^×`; `q = 1`: both `1`; `q = 0`: `ramanujanSum = 0`, supplier undefined (`c ≥ 1`), excluded by the `q ≥ 1` on line 191 | holds | none |
| 0.2 "none of which §1.16 states" (new) | the supplier's four API bullets and four finite-sum Checks | multiplicativity, `|c_q(n)| ≤ gcd(n, q)`, `c_{p^k}(n) = 0` absent from all eight | holds | none |
| `SiegelWalfiszBound` third Check (new) | `q = 2`, `a = 1`, `x = 10` | `ψ(10; 2, 1) = 7.8320 − 3 log 2 = 5.7526`; `x/φ(2) = 10`, `x/2 = 5`; asymptotically `ψ(x; 2, 1) ∼ x`, so `|ψ(x; 2, 1) − x/2| ∼ x/2 ≰ C x (log x)^{−A}` | holds; three discriminating Checks now | none |
| 0.1 `expTwoPiI`, `distInt`, geometric bound, orthogonality | as r2 | as r2 | holds (r2) | none |
| 0.2 Checks, multiplicativity, prime-power vanishing, `gcd` bound, junk modulus | as r2 | as r2 | holds (r2) | none |
| 1.1 type I, 1.2 type II | as r2 | as r2 | holds (r2) | none |
| 2.1 `primeExpSum` Checks, the `N q^{−1/2}` term, `q > N`; 2.2 Parseval | as r2 | as r2 | holds (r2) | none |
| 3.1 prime powers sharing a factor with `q`; `psiAP` Checks; first two `SiegelWalfiszBound` Checks | as r2 | as r2 | holds (r2) | none |
| 3.2 major-arc form | as r2 | as r2 | holds (r2) | none |
| 4.1–4.9 (integral representation, arcs, minor arcs, singular series, singular integral, major arcs, asymptotic formula, Vinogradov, adapter) | as r2 | as r2 | holds (r2) | none |

**Policy.** No `set_option`, no `lemma`, no sorry'd data, no `Mathlib.<submodule>` import, no pull-request number, no LaTeX delimiter, no process narrative in the edited lines; no source passage is copied.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, 3rd ed., Chapter 26 (cited at 0.2): closed; chapter titles only, from catalogue records, as in the previous round.
- Vaughan, *The Hardy–Littlewood Method*; Iwaniec–Kowalski §§13.5, 19.4; Vinogradov 1937; Vaughan 1977: unchanged since the previous round and not re-examined (closed or not online).

## Source issues

- none
