# Review of QuadraticTwistSelectionOverPrimes (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 89 changed lines since `74a09b7`. The change adds origin and method labels to 2.7a–2.7d, the convention on corollaries, a *Corollary of:* line in 2.7c, the Jutila reference and a rewritten Gallagher reference. I checked the Gallagher locator in an open copy, every new method claim against the formal proof, the cited sections of AnalyticNumberTheoryPartI and RieszSumsOverPrimesAndExceptionalZeros at this head, and the build and dependency check; all are sound. Accepted with no finding and no small correction, and two format notes, neither blocking; the human reviewers have two facts about source records, nothing to decide on scope.

## N01 — The *Corollary of:* line of 2.7c names a step of its route, but the convention it follows says the line names the clauses it covers

Lines 369–371 say that AnalyticNumberTheoryPartI §1.7 supplies one step of the proof of 2.7c: the count of the primes whose twists have a zero in the box. The convention at lines 57–59, like the family index, describes the line as naming "the clauses it covers", and no clause of 2.7c follows from §1.7 alone. You could add "or the step of the route that it supplies" to the convention sentence, so that readers do not look for a clause deduced from §1.7.

## N02 — The *Origin:* of 2.7b refers to "the classical mean values of real character sums over prime moduli" without naming a source

Line 238. The family's convention asks a *particular to this proof* label to give the nearest published result where one is known, and as written a reader cannot find this one. You could name it with a locator, or drop the clause.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result | Change |
|---|---|---|---|---|---|
| 2.7a *Origin:* and References: Gallagher 1970, Theorem 7, (29) | p. 337 of the open GDZ copy | Sum over primitive characters of moduli ≤ Q of short-interval prime sums, trivial and exceptional main terms removed; factor `(δ log Q)²` | (29): `≪ h·exp(−a log x/log Q)` for `x/Q ≤ h ≤ x`, `exp(log^(1/2) x) ≤ Q ≤ x^b`; remark: reduced by `(δ log Q)²` | agrees | none |
| 2.7a (i) reciprocity on the class (sample) | `m₀ = 8`, `a₀ = 3`, `n = 3`, `q = 11, 19` | `(3/11) = 1`, `(3/19) = −1` | `−(11/3) = −(2/3) = 1`, `−(19/3) = −(1/3) = −1`; `ε = −1` | holds | none |
| 2.7a method: a unit `u ≡ 1 (mod m₀)` with `(u/s) = −1` permutes the classes | `m₀ = 8`, `s = 3`, `a₀ = 3`, `u = 17` | classes above `3` prime to `24`: `{11, 19}`; `11·17 ≡ 19 (mod 24)` | `(11/3) + (19/3) = −1 + 1 = 0`: main terms cancel | holds | none |
| 2.7a method: PNT range and use | formal proof `MSqTwist.lean` line 30, `MSqCount.lean` line 14 | `log U ≥ C log M·log(log M + 2)`, applied at `U` once, primes `≤ √U` bounded trivially | `C₀ log M log(log M + 2) ≤ log X`; `piAP X ≤ |P| + X^(1/2)` | agrees | none |
| Labels: 2.7a (iii′) is a statement of the formal proof | `twistK` (formal proof) | (iii′) for every `ε, A, B > 0` | `∀ ε A B > 0`, `s ≤ Y^A`, bound `Y^(−B)·|P|`, one exception `nstar` | agrees | none |
| 2.7b method: window passage | `c_y(n) = Λ(n) min(1, y/n)` | `∂_y min(1, y/n) = 1_{y<n}/n`; `v·D_q(v) = Σ c_v(n)κ(n)1_{n>v}(n/q)` | `BadShare.lean`: `S Z b − S Z a = ∫ D`; `(∫f)² ≤ (b − a)∫f²` per block | agrees | none |
| 2.7c method: zero count in the box | `Q = FU ≤ U^(3/2)`, `|P| ≥ U^(9/10)` | `C·Q^(1/4) ≤ C·U^(3/8)`; ratio to `|P|` is `≤ C·U^(−21/40) → 0` | `ZeroDensityBox`: primitive χ, conductor `≤ Q`, zero with `Re s > 1 − 1/400`, `|Im s| ≤ Q`: `≤ C·Q^(1/4)` | agrees; proved (`zero_density_box`) | none |
| 2.7c method: off-diagonal duality terms | distinct primitive `χ, χ′`, `Re w > 0` | product of conductors times a factor linear in the exponent's size | `PairTwist`: sum over `(U, 2U]` is `≤ 2·q·q′·(1 + ‖w‖)` | agrees | none |
| 2.7c route through §1.7 (Jutila) | `δ₀ = 1/12`, `δ₀ = 1/400`, `ε′ → 0` | exponent `(3/2)(8 + 2ε′)δ₀`: `1` at `1/12`, `0.03` at `1/400` | §1.7: `C_ε(Q^(5+ε)T^(3+ε))^(1−σ)`, at `T = Q`: `Q^((8+2ε)δ₀)` | `δ₀ < 1/12` needed, as the Check says | none |
| 2.7c *Corollary of:* line | §1.7 at `σ = 1 − 1/400`, `T = Q` | `Q^((8+2ε)/400) ≤ Q^(1/4)` for `ε ≤ 46` | the formal proof's count is a case of §1.7 | sound; covers a step, not a clause | N01 |
| 2.7d method: second step | `z = Y^(ε/5)`, `U₁ = e^z` | conductor bound `N₀·e^z` | instance: `F₂(q) = N₀U₁ = N₀e^z`; `oddM y q = q·∏_{3≤p≤y} p` | agrees | none |
| Headline 2.7a (iv) `abs_sum_jacobiSym_primes_le` | `m₀ = 8`, `s = 3` | `|P| ≥ U/(3·4·log U) = U/(12 log U)` | PNT: `|P| ∼ U/(4 log U)` | consistent | none |
| Headline 2.7c `twistSelection_fixedWidth` | `δ₀ = 1/400`, `ε = 1/2` in `TwistBounds` | `(2 + ε)/δ₀ = 2.5·400 = 1000` | README (b′): `1000 log log(FU) + C₂` | agrees | none |
| Headline 2.7d (ii) `twistSelection_two_of_conductorBound` | `F₁ = N₀`, `F₂(q) = N₀U₁` | height `N₀U₁U₂` for `j = 1` | Lean: `TwistBounds … (F₂ q * U₂)` | agrees | none |
| *Labels* paragraph against References | the two lists | formal statements: 2.7a (i′), (ii), (iii′); 2.7b (i), (ii′), (iv′); 2.7c (a′)–(c′); 2.7d (ii′) | References names the same eight; own formulations 2.7a (iv), 2.7b (iii) in both | consistent | none |

- Source locators checked against the text: 1, Gallagher 1970, Theorem 7, (29), p. 337 and the remark after it (Gallagher1970 lines 379–395, open GDZ copy).
- Formal-proof claims of the four new method labels, checked in the operator's copy: `zero_density_box`, `ZeroDensityBox`, `PairTwist`, `MollId`, `Detect` (zero count); `twist_bound`, `twistK`, `MSqCount` (2.7a); `jacobi_prime_in`, `jacobi_prime_out` (reciprocity); `bs_S_sub_S`, `bs_sq_integral_le` (2.7b); `count_bad_core` (2.7c).
- Cross-roadmap citations resolved at this head: AnalyticNumberTheoryPartI §0.17 (README line 455) and §1.7 (line 1029, citing Jutila, Theorem 1, (1.8)); RieszSumsOverPrimesAndExceptionalZeros §1.7b (line 619; (ii) proved directly, not from (29)), §§1.4e and 1.4f (lines 138 and 200); the family index's convention on corollaries (line 66).
- Diff: README only, 84 insertions and 5 deletions; no heading, layer, item or Lean declaration removed; `Suggested.lean` unchanged; no file outside the folders this pull request owns.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings only (lines 105, 127, 151, 180, 220); single `import Mathlib`, no `set_option`; no `variable` block, and none of the ten elaborated signatures has lost a binder.

Overlap check: read AnalyticNumberTheoryPartI, SieveMethodsAndPrimePatterns, ErdosProgressionPowers and ExplicitPrimeCounting (open), and RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums and GeneralizedRiemannHypothesisFromWindowBounds (main). Nothing is shared: the log-free density is owned by AnalyticNumberTheoryPartI §1.7, the one-modulus prime number theorem by RieszSumsOverPrimesAndExceptionalZeros §1.7b, both cited, and twist selection is owned only here.

Source independence: changed passages only; 7 passages compared with 3 sources. Gallagher 1970, p. 337: at most 4 consecutive words shared ("by a/the factor (δ log Q)²"). The formal proof's Lean statements behind the four method labels: no prose shared. The Announcement has no corresponding passage. Jutila 1977 was not readable. The largest share of source mentions is [FormalProof], 21 of 31. The arrangement was not compared, since no layer was added, removed or reordered.

Research link: 2.7c–2.7d select the auxiliary primes `q`, `d` of step 3 of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). Their analytic inputs are Gallagher's 1970 prime number theorem in Linnik's range and Jutila's 1977 log-free zero-density estimate. Based on the README summary, its References and the Announcement.

## Not verifiable

- Jutila 1977, *On Linnik's constant*, Theorem 1 (cited in the *Origin:* of 2.7c and in References): the sources service found only the journal's landing page, on a host in no licence class, so the text was not read. AnalyticNumberTheoryPartI §1.7 cites the same theorem as (1.8), p. 46.

## Source issues

- none

## For the human reviewers

- Neither recorded decision applies to this folder: it removes or moves no section.
- Licence: Jutila 1977 (2.7c *Origin:*, References) is not in this roadmap's sources manifest. The sources service could not classify the host of its landing page (journals.msp.org), so the text was not read.
- Licence: this roadmap's manifest records Gallagher1970 as paywalled and uncertified. RieszSumsOverPrimesAndExceptionalZeros's manifest records an open GDZ copy of the same paper (DOI 10.1007/BF01403187) as certified, and this review read that copy.
