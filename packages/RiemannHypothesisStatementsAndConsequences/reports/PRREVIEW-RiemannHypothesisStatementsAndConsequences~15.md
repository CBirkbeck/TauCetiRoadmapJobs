# Review of RiemannHypothesisStatementsAndConsequences (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 15 lines changed since `2ac59b9`: the method line of 8.4a now says which parts of the inversion, the explicit formula and the linear bound the formal proof has, the remark of 8.4a (b) is scoped to this roadmap, and the reference entry lists 9.2. The four declarations of the formal proof that the new sentence cites exist at the cited commit under the cited paths and names and state what the sentence says, so there is no finding and the folder is accepted. One small correction (the description, carried over) and one format note (carried over) remain, neither blocking; one decision of the human reviewers was applied, and nothing new is left for them.

## C01 — The description does not say that the linear bound of 8.4a (b) became a remark

The description lists the places where "the formal proof's form is the statement and the stronger form a remark", and for the Riesz remainder it names only "the bound `C·y²` for the remainder of the Riesz sum (GeneralizedRiemannHypothesisFromWindowBounds 0.4)". The same change is made in this roadmap: the size clause of 8.4a (b) (README line 294) states only `‖rieszRemainder ψ y‖ ≤ C_ψ y²`, and the bound `C′_ψ y`, which the clause stated on `main`, is the remark of line 303. The description's one sentence on this roadmap ("RiemannHypothesisStatementsAndConsequences cites them and a new supplier, AnalyticNumberTheoryPartIII §8.2a, which now hold some of its routes and Checks") does not mention it, so a reader does not learn that a clause of 8.4a lost a bound.

Text that would be right: "… and the bound `C·y²` for the remainder of the Riesz sum (RiemannHypothesisStatementsAndConsequences 8.4a (b) and GeneralizedRiemannHypothesisFromWindowBounds 0.4)".

## N01 — `Deduction.ch_balance` is cited without its file

In the method line of 8.8a (line 463) `Deduction.ch_balance` is still the only [FormalProof] declaration cited without a path; the four declarations this change cites carry theirs. It is in `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean`.

## Previous findings

- The previous review (at `2ac59b9`) had no finding (no R-numbered remark). Its other remarks:
- C01 (description) — not repaired: the description is unchanged; it names the bound `C·y²` only at "GeneralizedRiemannHypothesisFromWindowBounds 0.4" (C01 above).
- C02 (reference entry omits 9.2) — repaired: "The form it has of each statement of 8.4a, 8.8a, 9.2, 9.3, 9.4, 10.2 and 10.3 that cites it is recorded at that statement."
- N01 (`Deduction.ch_balance` without its file) — not repaired: line 463 is unchanged (N01 above).
- Question on 9.5 (where the zero-free reading stands) — answered from the texts, now readable: it is Bach's (`bach1990` lines 253–254, p. 360); Belabas, Diaz y Diaz and Friedman use the hypothesis by name in §2 (`belabas2008` lines 148, 235–236). The entry's "with Bach (1990)" covers this; no remark.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 8.4a (a) inversion, which the new sentence says [FormalProof] has for `y ≥ 1` | `a = δ₁`, `c = 2`, `y = 2` and `y = 1/2`; the formal `Schi` at `q = 1`, `y = 1` | `rieszSum = 2/1 − 1 = 1`; residues of `2^s/(s(s−1))`: `2` at `1`, `−1` at `0`, sum `1`. `y < 1`: both `0`. `Schi 1 1 = Λ(1)·0 = 0` | holds |
| New sentence: the inversion in [FormalProof] | `PerronChi` (`Formalism/LandauZeroFreeBounds/LogDerivRegionChiOf.lean` line 17), `Perron` (`Formalism/ZeroFreeRegion/SmallHeightLogDeriv.lean` line 66) | Both: `1 ≤ y`, `1 < σ₀`, integrability on the line and sum `= (1/2π)∫`; kernel `y^w/(w(w−1))`; coefficients `Λ(n)χ(n)` for any character mod `q`, resp. `Λ(n)` (`Formalism.Sz`) | supported |
| New sentence: explicit formula "in truncated forms … zeros near `Re s = 1` and an error term" | `ExplicitS` (`…/JacobiCharacterSums/DeuringHeilbronnM.lean` line 53), `SmoothChi` (`LogDerivRegionChiOf.lean` line 38) | `ExplicitS`: zeros with `Re ρ > 1 − κ`, `|Im ρ| ≤ T + 1`, error `C((MT)^C y^(−κ/2) + log y · log²(MT)/T)`. `SmoothChi`: `χ ≠ 1`, at most one real zero, error `C y exp(−c√log y)`, `q ≤ exp(c√log y)` | supported |
| New sentence and remark: the linear bound "only for the trivial character of `ℚ`" | search of the source for norm bounds on `Schi`, `Gchi`, `gChi` | For characters: `C y²` for `y ≥ 1` (`…/LandauTheorems/GchiGrowth.lean` line 38) and bounds on ranges tied to a parameter `x`; none of the form `C_χ y` for all `y ≥ 1`. Remainder at `ψ = 1`, `y = 1`: `1 + γ = 1.577` | supported |
| Remark: "no later statement of this roadmap uses it" | every occurrence of `C′_ψ` in the README | Lines 191, 204, 303 only, all in 8.4a | holds |

The rows for the untouched statements stand as in the previous review, of `2ac59b9`.

- **Source locators checked against the text:** 4 new [FormalProof] citations, each path and fully qualified name read at commit `40e56ba` in a copy the operator holds (`PerronChi.lean` line 283, `Perron.lean` line 262, `PNTExplMain.lean` line 15, `SiegelWalfiszAPOfSiegelLower.lean` line 20), with the four predicates they prove; all four names are in the list of declarations reached by the main theorems. From the seeded sample, 8.4a falls in the changed passages (rows above); 9.2 only through the reference entry. For 9.5, `bach1990` lines 253–254 and `belabas2008` lines 148, 235–236.
- **Library declarations opened at the pin:** none; the change names no library declaration.
- **Cross-roadmap citations resolved at this head:** 2 in the changed sentence (ExplicitZetaBounds §6.1a, ZerosOfLFunctions §8.2), both unchanged since `2ac59b9`; no supplier folder this passage cites changed since then. The family index (changed since `2ac59b9`) says "The explicit formula, only in truncated forms", which agrees with the new sentence.
- **Record:** no heading, layer or Lean declaration removed, renumbered or retitled; `Suggested.lean` unchanged.
- **Automatic checks:** all passed. Dependency check output: `depcheck: 122 roadmaps, 1392 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else.
- **Overlap check:** read ZerosOfLFunctions, GeneralizedRiemannHypothesisFromWindowBounds and LFunctions at the sections the changed passages cite; nothing shared beyond what the previous reviews record (the explicit formula and the Euler–Kronecker constant: owner ZerosOfLFunctions §8.6a, cited here). No open pull request changes this roadmap or drops an id it cites.
- **Source independence:** changed passages only: 2 passages (the new sentence of the method line of 8.4a, the remark of 8.4a (b)) compared with 1 source ([FormalProof], Lean code, 4 declarations and their 4 predicates), none shared; largest share [FormalProof], a code repository cited by file and declaration name; arrangement not compared, no layer being added, removed or reordered.
- **Research link:** 9.2–9.5 and the Riesz remainders of 8.4a are the statements in which the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, announced 20 November 2026) is stated; 9.7–9.9 are the classical conditional consequences (Littlewood 1928; Titchmarsh 1986, Ch. XIV; Lagarias–Odlyzko 1977; Carneiro–Chandee–Milinovich 2015). Rests on the README's Summary and References.

## Not verifiable

- That no file of [FormalProof] states the linear bound for a nontrivial character: searched for norm bounds on `Schi`, `Gchi` and `gChi` across the source, not read file by file.
- The other sources of the sample (Robinson 1944, Ihara 2006, Ihara–Murty–Shimura 2009, Lagarias–Odlyzko 1977, Littlewood 1928, the books): outside the changed passages; as in the previous reviews.

## Source issues

- none

## For the human reviewers

- Decision applied (a section stated in full in a general roadmap may leave the family): unchanged since the previous review; the routes and Checks of 3.2a and 8.8 and one definition of 8.4a (b) are in AnalyticNumberTheoryPartIII §8.2a and ZerosOfLFunctions §§8.6a, 8.7a; statements stay.
- Not tested: the source cited most is [FormalProof], a code repository; its wording was compared at the cited declarations only.
