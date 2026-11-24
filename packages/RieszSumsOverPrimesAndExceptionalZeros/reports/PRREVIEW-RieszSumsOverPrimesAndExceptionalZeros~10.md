# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #3027 at 23a54c4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 86 lines changed since `3bddf73`. Both findings of the previous review are repaired: 1.4i now credits the formal proof with the bound for `G_1` and with a stated consequence of (b′), not with (b′), and the new sentences were recomputed against the proof's theorem and hold. The four small corrections and the format note are repaired as well. No finding remains; there is one format note, not blocking, and the standing of the formal proof as a source is left to the human reviewers as before.

## N01 — In the module docstring of `Suggested.lean` (lines 20–21), "also this roadmap's own except for that bound, which the family uses" reads as if the family used the bound for `G_1`; what it uses is 1.4i (c′). "…(1.4i (c′)), which the family uses, also this roadmap's own except for that bound" would say it.

## Previous findings

- R01 — repaired: the summary says "the formal proof proves the weaker bound `|G_{χ*}(y)| ≤ y exp(−c(log y)^(3/8))` … with `log f_E ≤ (log y)^(3/5)`, which the case `α = 31/50` implies"; (b′) is headed "*The form under a zero-free interval.*".
- R02 — repaired: "the bound for `G_1` in (a), (c) and (c′), and the consequence of (b′) written after (b′), are statements of [FormalProof]"; the summary, the Status lines of (a) and (c′) and the References entry agree.
- C01 — repaired: "(a) follows from Lemma 2.1 (i)–(ii) of Kadiri, Ng and Wong (2019) by the splitting (2.2) in their proof of Theorem 2.2"; the References give p. 3 and p. 4, which the text confirms.
- C02 — repaired: both docstrings of `Suggested.lean` now say "stated in the wider form of 2.9b".
- C03 — repaired: the module docstring says that the file of AnalyticNumberTheoryPartI states the repulsion and Linnik's theorem in the same form, as its §§1.7a and 1.7b, and that they "stay here as the record of 1.7b (i) and (iii)".
- C04 — repaired: the description now says "1.4i credited the proof with (b′) and (c′); it has a weaker (b′). 2.9b and headline (3) state its `ℚ(√−d)` count." The sections 3.3–3.4 that 0.30b no longer cites belong to ZerosOfLFunctions, which stays a supplier, so no supplier changes and the description need not say it.
- N01 — repaired: "A. Chirre, M. Valås Hagen and A. Simonič".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.4i, paragraph after (b′): the proof's statement at `x = (log 3y)^(3/ε)` | `QH.thin`: `log N ≤ A x^(ε/5)(log x)²`, `y ≥ exp(x^(ε/3))/3`, saving `exp(−c x^(ε/8))` | `y = exp(x^(ε/3))/3` exactly; range `A(3/ε)²(log 3y)^(3/5)(log log 3y)²`; saving `exp(−c(log 3y)^(3/8))` | as the README says | none |
| 1.4i: "those of (b′) at no `α`" | `α = 1/2, 3/5, 31/50, 5/8` | range needs `α ≤ 3/5`; saving needs `1 − α ≤ 3/8`, i.e. `α ≥ 5/8`; `3/5 < 5/8` | holds | none |
| 1.4i: (b′) at `α = 31/50` implies the proof's statement | `log y ≥ x^(ε/3) − log 3`; `c_ex > 1/2` | `(log y)^(31/50) ≈ x^(31ε/150)`, `31/150 > 30/150`; `c₁(log y)^(19/50) ≈ c₁x^(19ε/150)`, `19/150 > 18.75/150`; `min(c_ex, 1/2)` keeps `c_ex ∈ (0, 1/2]` | holds for `x ≥ x₀` | none |
| Summary, headline (1): the weaker bound | `log f_E ≤ (log y)^(3/5)`, every `c > 0`, trivial character | `(log y)^(3/5) ≤ A(3/ε)²(log 3y)^(3/5)(log log 3y)²` for large `y`; `(log 3y)^(3/8) ≥ (log y)^(3/8)`; from (b′): `19/50 > 3/8` | holds; `QH.thin` covers `χ = 1` (hypothesis only for `χ² = 1`, `χ ≠ 1`) | none |
| 1.4i: bound for `G_1` credited to the proof, with its method | `Formalism.ZF.GzPNT`, `gzPNT` | `∃ c K`, `y ≥ 2`, `|Gz y| ≤ K y exp(−c√log y)`; proved from `zeroFreeRegion`, `logDerivRegion`, `perron_formula`, `rectShift` | as the README says | none |
| 1.7a (a) from Kadiri–Ng–Wong Lemma 2.1 (i)–(ii) and (2.2) | `J = 1`, `θ = 0`, `w = −1`; general | `Σ c_j Re w^j = P(r,φ) + ½P(r,φ−θ) + ½P(r,φ+θ) ≥ −1/2 − 1/4 − 1/4 = −1`; `P(1,θ) + ½·J/2 + ½P(1,2θ) ≥ J/4 − 3/4`; `J = 1`: `−1 ≥ −1`, `1 ≥ −1/2` | holds; first bound sharp | none |
| `Suggested.lean`: AnalyticNumberTheoryPartI states the repulsion and Linnik's theorem in the same form | `deuring_heilbronn_repulsion`, `exists_prime_modEq_le` at this head | lines 486 and 502 there; `χ₁.IsQuadratic` there, `χ₁ ^ 2 = 1` here | as the docstring says | none |

The rows for the untouched statements stand as in the previous review, of `3bddf73`; the diff changes no statement of the README and no Lean signature (labels, Status lines, attributions and docstrings only).

- Source locators checked against the text: 3 (KadiriNgWong2019 lines 103–106, Lemma 2.1 on p. 3; lines 146–152, display (2.2) on p. 4 in the proof of Theorem 2.2; the formal proof at `Development/AutomorphicArithmetic/MeanSquareBounds/Thin.lean` line 10, `Formalism/ZeroFreeRegion/Statement.lean` lines 16–18 and `Formalism/ZeroFreeRegion/LogDerivRegion.lean`, `gzPNT`).
- Seeded sample: of its ten targets, 1.4i and 1.7a fall in the changed passages and were checked as above; the others are unchanged.
- Cross-roadmap citations resolved: AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b (README lines 945, 1047, 1073 and `Suggested.lean` lines 486, 502 at this head); the sections of FrobeniusRestrictedRieszSums and ThetaChainsAndFrobeniusPrimeSums that cite 1.4i (b), (b′), (c′) do not call (b′) a statement of the formal proof.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. The automatic checks all passed.
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`.
- Record: no layer, item or heading is removed or renumbered.
- Outside the folder: every file changed since `3bddf73` lies under `TauCetiRoadmap/`, in folders the pull request owns or in a family index.

Overlap check: as in the previous review (read AnalyticNumberTheoryPartI, QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, ZerosOfLFunctions at this head; LiCoefficientsArithmeticFormula and SpecialFunctionsGamma name none of these objects). Shared: the character prime number theorem with the exceptional term, the one-modulus repulsion and Linnik's theorem, owner AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b, restated here under `*Corollary of:*` lines; Riesz sums, owner RiemannHypothesisStatementsAndConsequences §8.4a. Nothing else is shared.

Source independence: changed passages only; 4 passages compared with 2 sources (KadiriNgWong2019, the formal proof), none shared beyond formulas and declaration names; largest share Linnik1944a/b and Bombieri1987, 4 each of about 40 locators; the diff adds, removes and reorders no layer, so the contents were not compared.

Research link: 1.7b is Linnik's theorem with the Deuring–Heilbronn repulsion (Linnik 1944; Bombieri 1987) and Gallagher's theorem (Gallagher 1970; Thorner–Zaman 2019, Th. 1.4); 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020); 2.9b adapts Thorner–Zaman 2019. Rests on the README and the texts read.

## Not verifiable

- Koukoulopoulos 2019, Iwaniec–Kowalski 2004, Lagarias–Montgomery–Odlyzko 1979, Fogels 1964, Turán 1953: publisher's pages only; not read. The text citing them is unchanged.
- Davenport 1980 and Stark 1974: settled as uncertified, cited by locator.
- Ihara–Murty–Shimura 2009: read only as quoted in arXiv:2206.00819v2.
- [Announcement]: not read.

## Source issues

- none

## For the human reviewers

- The decision on GeneralizedRiemannHypothesisFromWindowBounds was applied: this README does not name it as a consumer of 2.41a, and no section of this roadmap moved.
- The decision on published theorems was applied: no section is removed here; 1.4g (b), 1.7b (i) and (iii) keep their statements under `*Corollary of:*` lines, and AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b at this head state them.
- Licence: the attributions of 1.4i were checked against [FormalProof], read in a clone of its public GitHub repository, which carries no licence; the README cites declaration names and statements in its own words, no code.
