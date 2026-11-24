# Review of QuadraticTwistSelectionOverPrimes (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 89 changed lines since `b8f3652`. The folder's text is the one the previous review read; the change adds origin and method labels to 2.7a–2.7d, the convention on corollaries, a *Corollary of:* line in 2.7c, the Jutila reference and a rewritten Gallagher reference. I read Gallagher's Theorem 7 on its printed page, checked each new method claim against the formal proof's statements, resolved the cited sections of AnalyticNumberTheoryPartI and RieszSumsOverPrimesAndExceptionalZeros at this head, and ran the build and the dependency check: all sound. Accepted with no finding and no small correction; two format notes, neither blocking, and nothing for a human to decide beyond two facts about source records.

## N01 — The *Corollary of:* line of 2.7c names a step of its route, while the convention it follows says the line names the clauses it covers

Lines 369–371 say that AnalyticNumberTheoryPartI §1.7 gives one step of the proof of 2.7c, the count of the primes whose twists have a zero in the box. The convention at lines 57–59, like the family index, describes the line as naming "the clauses it covers", and no clause of 2.7c follows from §1.7 alone. Adding "or the step of the route that it supplies" to the convention sentence would keep a reader from looking for a clause deduced from §1.7.

## N02 — The *Origin:* of 2.7b refers to "the classical mean values of real character sums over prime moduli" without a source

Line 238. The family's convention asks a *particular to this proof* label to give the nearest published result where one is known; as written a reader cannot find it. You could name one with a locator, or drop the clause.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result | Change |
|---|---|---|---|---|---|
| 2.7a *Origin:* and References: Gallagher 1970, Theorem 7, (29) | printed p. 337, page image of the open GDZ scan | sum over primitive characters of all moduli `≤ Q`, short intervals, trivial and exceptional main terms removed; factor `(δ log Q)²` | (29): `≪ h·exp(−a log x/log Q)`, `x/Q ≤ h ≤ x`, `exp(log^(1/2) x) ≤ Q ≤ x^b`; remark: reduced by `(δ log Q)²` | agrees | none |
| 2.7a (i) reciprocity on the class (sample) | `m₀ = 8`, `a₀ = 3`, `n = 3`, `q = 11, 19, 43` | `(3/11) = 1`, `(3/19) = −1`, `(3/43) = −1` | `−(11/3) = 1`, `−(19/3) = −1`, `−(43/3) = −1`; one sign `ε = −1` | holds | none |
| 2.7a method: a unit `u ≡ 1 (mod m₀)` with `(u/s) = −1` permutes the classes | `m₀ = 8`, `s = 3`, `u = 17` | `(17/3) = (2/3) = −1`; `11·17 = 187 ≡ 19 (mod 24)` | `(11/3) + (19/3) = −1 + 1 = 0` | holds | none |
| 2.7a method: range of the prime number theorem | formal proof, `MSqTwist.lean` | `log U ≥ C log M·log(log M + 2)`, relative error, exceptional pair | `C₀·log M·log(log M + 2) ≤ log X`; error `A₀(e^(−c₃ log X/log M) + e^(−√(c₃ log X)))·mainAP` | agrees | none |
| 2.7a (iii′) is a statement of the formal proof (sample 2.7a) | formal proof, `MSqTwist.lean` | `(1/4)(log Y)² log m₀ ≤ log U`, `Y^(ε/6) ≤ log U ≤ Y^(ε/5)(log Y)²`, one `s*` | same three inequalities; `∃ nstar`, every `s ≠ nstar` | agrees | none |
| 2.7b method: window passage (sample 2.7b) | `c_y(n) = Λ(n) min(1, y/n)` | `∂_y min(1, y/n) = 1_{y<n}/n`, so `v·D_q(v)` has coefficients `κ·1_{(v,∞)}`, still `|·| ≤ 1` | uniformity in bounded `κ` is what 2.7b (ii) states | consistent | none |
| 2.7c method: zero count in the box (sample 2.7c) | `Q = FU ≤ U^(3/2)`, `|P| ≥ U^(9/10)` | `C·Q^(1/4) ≤ C·U^(3/8)`; share `≤ C·U^(−21/40) → 0` | `ZeroDensityBox`: primitive, conductor `≤ Q`, zero with `Re s > 1 − 1/400`, `|Im s| ≤ Q`: at most `C·Q^(1/4)` | agrees | none |
| 2.7c method: off-diagonal duality terms | distinct primitive `χ, χ′`, `Re w > 0` | product of conductors times a factor linear in `|w|` | `PairTwist`: sum over `(U, 2U]` at most `2·q·q′·(1 + ‖w‖)` | agrees | none |
| 2.7c route and *Corollary of:* through AnalyticNumberTheoryPartI §1.7 | `δ₀ = 1/12`, `1/400`; `T = Q` | exponent `(3/2)(8 + 2ε′)δ₀`: `1` at `1/12`, `0.03` at `1/400` | §1.7: `C_ε(Q^(5+ε)T^(3+ε))^(1−σ)`, at `T = Q`: `Q^((8+2ε)δ₀)`; `(8+2ε)/400 ≤ 1/4` for `ε ≤ 46` | `δ₀ < 1/12` needed; covers a step | N01 |
| References: Jutila 1977, Theorem 1 | `σ ≥ 4/5`, `T = Q` | applied at `σ = 1 − δ₀ > 11/12 ≥ 4/5` | restated by Thorner–Zaman (arXiv:2208.11123v4, lines 51–53): `Q^((6+ε)(1−σ))`, `σ ≥ 4/5`; `(Q²T)^(2+ε)` at `T = Q` gives `6 + 3ε` | consistent; theorem number unread | none |
| 2.7d method: second step (sample 2.7d) | formal proof, `PrimeSetTwoBounds.lean` | `q ≡ 3 (mod 8)`; `d ≡ 7 (mod 16)`, `d ≡ −1` modulo `q·∏ odd p ≤ z`; conductor bound `N₀e^z` | `q % 8 = 3`; `d % 16 = 7 ∧ oddM z q ∣ d + 1`; `BoxAll (N₀·exp z)` | agrees | none |
| Headline 2.7a (iv) | `m₀ = 8` | `|P| ≥ U/(3·4·log U) = U/(12 log U)` | prime number theorem: `|P| ∼ U/(4 log U)` | consistent | none |
| Headline 2.7c (b) against (b′) | `δ₀ = 1/400`, `ε = 1/2` | `(2 + ε)/δ₀ = 2.5·400 = 1000` | (b′): `1000 log log(FU) + C₂` | agrees | none |
| *Labels* paragraph against References | the two lists | 2.7a (i′), (ii), (iii′); 2.7b (i), (ii′), (iv′); 2.7c (a′)–(c′); 2.7d (ii′) | References names the same; own formulations 2.7a (iv), 2.7b (iii) in both | consistent | none |

- Source locators checked against the text: 1 (Gallagher 1970, Theorem 7, (29) and the remark after it, printed p. 337; the OCR text at Gallagher1970 lines 379–395 loses the exponent, the page image shows it). Jutila 1977 checked only through a restatement.
- Formal-proof statements opened: `ZeroDensityBox`, `zero_density_box`, `PairTwist`, `MollId`, the orthogonality theorem of `MSqTwist.lean` with its prime number theorem hypothesis, `PPset`, `oddM`, `primeSetTwoBounds`, `GoodQ`.
- Cross-roadmap citations resolved at this head: AnalyticNumberTheoryPartI §0.17 (README line 455), §0.34 (line 772), §1.7 (line 1035, citing Jutila, Theorem 1, (1.8), p. 46); RieszSumsOverPrimesAndExceptionalZeros §§1.4e, 1.4f, 1.7b (lines 138, 200, 619; its 1.7b names (ii) a one-modulus form of Gallagher's Theorem 7); the family index's convention on corollaries (line 200).
- Record: README only, 84 insertions and 5 deletions; no heading, layer, item or Lean declaration removed or renamed; `Suggested.lean` identical to the merge base; no file outside the folders this pull request owns.
- Previous review: no finding to account for; its two format notes are repeated above, the text being unchanged.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1438 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings only (lines 105, 127, 151, 180, 220); single `import Mathlib`, no `set_option`, no `variable` block; none of the ten elaborated signatures has lost a binder. The one-tactic probe was not rerun: the file is untouched.
- Pull request text: the description's general statements hold for this folder (section numbers unchanged, both labels on every section, `Suggested.lean` unchanged, no supplier added); it says nothing specific to this folder that the head contradicts.

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros, FrobeniusRestrictedRieszSums, GeneralizedRiemannHypothesisFromWindowBounds (main, at this head) and AnalyticNumberTheoryPartI; nothing shared: the log-free density estimate is owned by AnalyticNumberTheoryPartI §1.7, the one-modulus prime number theorem by RieszSumsOverPrimesAndExceptionalZeros §1.7b, both cited, and twist selection is owned only here.

Source independence: changed passages only; 7 passages compared with 3 sources (Gallagher 1970 p. 337, the formal proof's Lean statements, the Announcement); at most 4 consecutive words shared with Gallagher ("by a factor of" before the formula), none with the others; Jutila 1977 could not be read. Largest share of source mentions [FormalProof], 21 of 31. Arrangement not compared: no layer added, removed or reordered.

Research link: 2.7c–2.7d select the auxiliary primes of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026); their analytic inputs are Gallagher's 1970 prime number theorem in Linnik's range and Jutila's 1977 log-free zero-density estimate. Rests on the README's summary and References and on the Announcement.

## Not verifiable

- Jutila 1977, *On Linnik's constant*, Math. Scand. 41, 45–62, Theorem 1 (the *Origin:* of 2.7c and References): only the journal's landing page is in the sources cache, on a host in no licence class. The estimate and the bibliographic data were confirmed from Thorner–Zaman, arXiv:2208.11123v4 (its text, lines 51–53 and 1653); the theorem number was not.

## Source issues

- none

## For the human reviewers

- Neither recorded decision applies to this folder: it removes or moves no section.
- Licence: Jutila 1977 is cited in 2.7c and References but is not in this roadmap's sources manifest; its text could not be read from a classified host.
- Licence: the manifest records Gallagher1970 as paywalled and uncertified, while an open GDZ scan of the same paper (DOI 10.1007/BF01403187) is recorded for RieszSumsOverPrimesAndExceptionalZeros; this review read that scan.
