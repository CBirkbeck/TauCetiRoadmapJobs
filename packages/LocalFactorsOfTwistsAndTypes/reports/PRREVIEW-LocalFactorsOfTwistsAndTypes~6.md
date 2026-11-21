# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at f835aed)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and no new one arises. Section 4.1 now states Bernstein's theorem as a result apart from its clauses, with an owner in characteristic zero (AutomorphicSpectralTheory §7.0b) and the formal proof's form; the five small corrections and the format note are repaired as well, and every locator the repair added that could be read (11 into the formal proof, 4 into Henniart 2002) says what the text says. There are no small corrections and no format notes. Three new locators in 2.1 (Morris, Bushnell–Kutzko, Moy–Prasad) could not be read; the family's premise and one licence fact remain for the human reviewers.

## Previous findings

- R01 — repaired: "Besides these clauses it uses Bernstein's theorem, which no clause of 4.1 states: a product of two irreducible unitarisable representations is irreducible", with AutomorphicSpectralTheory §7.0b and `BernsteinUnitaryProductIrreducible`; (vi) carries the two other cases.
- C01 — repaired: Downstream consumers names ThetaKernelsForUnitaryDualPairs §§3.47, 5.7d, 6.11 and the base-change roadmap's §§10.29a, 10.30, 10.34, 14.2, 15.1; AutomorphicSpectralTheory §3.6c and LevelOneAutomorphicFormsForClassicalGroups now "assume" the hypothesis.
- C02 — repaired: 6.4 gives the supercuspidal single-rank form to `GlobalTheory.Published.LocalConverseGL`, and Henniart's Théorème 1.1 as "the statement for generic `π_i` with the ranks `1 ≤ r ≤ n − 1`".
- C03 — repaired: 3.3 (d) names `Pointwise`, `SmallCorner` with `Count`, `GenFun`, and `Heis` for the coordinates; 7.2 (iii) names `GlobalTheory.LFun.Bounded.converges`; 3.4 names `norm_le_of_isSatVecGL`; 4.1 locates (vi).
- C04 — repaired: (i) in the form `L(𝔪′)` is "the classification recalled in Henniart 2002, §2.8, p. 596, with §2.6, p. 595"; Morris, Bushnell–Kutzko and Moy–Prasad now carry theorem numbers (not readable, see Not verifiable).
- C05 — repaired: the description says the build and the dependency check pass and names SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4 as a supplier still open; it no longer names ArithmeticGaloisRepresentations.
- N01 — repaired: `1_{1}` in 3.1 and `1_{ℓ = m}` in 3.4.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 3.3 (d), formal locators | `Pointwise`, `Count`, `GenFun` read; `c = q^{2ℓ(g₀)+2(n−1)a⁺}`, `l = |a| + ℓ(g₀)` | `len ≤ |a|+l+j ⇔ Small(a⁺+⌊j/2⌋, 2a⁺+j)`; count `q^{2(l+Ne)+f}`; `jFac = (1−X)(1+qX)/(1−(q^{N+1}X)²)`, `q^{N+1}X = y` | equal to README | none |
| 3.4 (i), added locator | `n = 1`; `α` and `α⁻¹` | formal: `‖β‖ ≤ N(w)^{(n−1)/2}` for a fixed eigenvector with bounded coefficient; `n = 1`: `≤ 1` both ways, `|α| = 1` | holds | none |
| 4.1, Bernstein's theorem | `u(St, 2) × χ` on `GL₅`; AutomorphicSpectralTheory §7.0b | formal form: both factors smooth, irreducible, unitarisable, any nonarchimedean `F`; §7.0b: finite products of blocks irreducible and exhaust the unitary dual | covered; outside (ii) as stated | none |
| 4.1 (vi), formal forms | `j ∈ {−1, 0, 1}`; unramified twists | `TotallyDisjoint…`: no `σ ≅ σ′ν^j`, `|j| ≤ 1`; `Unlinked…`: no `σ ≅ σ′·unr(α)`, `α ∈ ℂ^×`; `ν^j = unr(q^{−j})`, so the second hypothesis implies the first | holds | none |
| 4.1 (i), form `L(𝔪′)` | `n = 2`: `[χ] + [χν]` against `[χ, χν]` | Henniart §2.8: nonzero multisets of essentially square-integrables ↔ irreducibles by Langlands quotients; §2.6: these ↔ pairs `(ρ, n)`; the two multisegments give `χν^{1/2}∘det` and a twist of `St` | holds | none |
| 6.4, formal form and attribution | `n = 2`; non-generic `τ`; Henniart 2002 §§1.4, 1.9 | formal: `CharZero`, cuspidal on `GL_{m+1}`, all `τ` of `GL_m`; no Whittaker functional makes both integrals `0`; §1.4 Remark: `L = 1`, `γ = ε`; §1.9: generic, `r = 1, …, n−1` | holds | none |
| 7.2 (iii), added locator | `n = 1`; `κ = (n−1)/2` | formal: at most `r` parameters of norm `≤ N(w)^κ` give summability and nonvanishing for `κ + 1 < Re s`; `κ + 1 = (n+1)/2`; `n = 1`: `Re s > 1` | holds | none |
| Downstream consumers | 17 cited sections at main or their open heads | each cites the stated section of this roadmap (2.1; 3.3, 3.4; 4.1 (ii)–(iv), (vi); 6.3; 6.4; 6.5; 7.1; 7.2); §3.6c and LevelOne state the hypotheses of 5.1, 6.6 | holds | none |
| 2.1, added locators | Morris 4.15, 7.12; Bushnell–Kutzko 8.1; Moy–Prasad 6.7 | texts not readable | not verified | none |

The rows of the previous review, of `d6f67f5`, for the statements this change does not touch stand as they are there. ThetaKernelsForUnitaryDualPairs §5.7d uses (ii) for `Z(Δ_α)` times a character, which the new wording "(ii) for products of two representations `Z(Δ)`" covers.

- Source locators checked against the text: 4 published (Henniart 2002 §1.4 pp. 589–590, §1.9 p. 592, §2.6 p. 595, §2.8 p. 596) and 11 into the formal proof (`Heis`, `Pointwise`, `SmallCorner`, `Count`, `GenFun`, `norm_le_of_isSatVecGL`, `TotallyDisjointProductIrreducible`, `UnlinkedProductIrreducible`, `BernsteinUnitaryProductIrreducible`, `LocalConverseGL` with `HasPairEps`, `LFun.Bounded.converges`); every file and declaration exists.
- Library declarations opened at the pins: none new; `Suggested.lean` is unchanged since `d6f67f5`.
- Cross-roadmap citations resolved: AutomorphicSpectralTheory §§3.6c, 7.0b (main); at open heads FiniteReductiveGroups §§6.0, 6.3, BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.29a, 10.30, 10.34, 14.2, 15.1, ThetaKernelsForUnitaryDualPairs §§3.47, 5.7d, 6.11, ThetaLiftsForDefiniteUnitaryGroups §§3.3, 5.2, RowTowerAndRallisIdentities §5.1, LevelOneAutomorphicFormsForClassicalGroups Conventions.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`. Nothing outside the folder changes except the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 123); signatures compared with 3.4 (i), no binder lost; no `set_option`, no sorried data.
- Pull request text read against this head: no sentence contradicted; the three open suppliers it names are the three the README cites.
- No layer added, removed or reordered; the arrangement was not compared again.

Overlap check: read BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities (open); SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII, EndoscopicTransferAndUnitaryTraceComparison (main). The open family roadmaps consume 2.1, 3.3, 3.4, 4.1, 6.3–6.5, 7.1, 7.2 and own none; `rec` and segments are owned by SmoothRepresentationsOfLocalGroups; pair factors over `p`-adic fields by EndoscopicTransferAndUnitaryTraceComparison §10.29, cited; coarse local transfer by AutomorphicLFunctionsAndLocalFactorsPartII §10.2, cited; Bernstein's theorem and the unitary classification by AutomorphicSpectralTheory §7.0b, now cited.

Source independence: changed passages only; 4 passages compared with 1 published source (Henniart 2002) and 11 statements with the formal proof; none shares wording beyond what the mathematics forces. Largest share: the formal proof, now 27 of about 60 locators; arrangement not compared again (no layer added, removed or reordered). Henniart 1993, Jacquet–Piatetski-Shapiro–Shalika 1983, Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read.

Research link: 6.4 is the local converse theorem of Jacquet–Liu (2018) and Chai (2019); 6.5 is Henniart's uniqueness of the local Langlands correspondence (1993, 2002) behind Harris–Taylor (2001); 4.1 is Zelevinsky (1980). Layers 3 and 7 serve the formal proof of Alpöge (2026). Rests on the README's references and the four texts read.

## Not verifiable

- Morris 1993, Theorems 4.15 and 7.12, and Moy–Prasad 1996, Proposition 6.7 (2.1): paywalled, no legal copy found.
- Bushnell–Kutzko 1998, Definition 8.1 (2.1): the publisher's page refused the request; no legal copy found.
- Henniart 1993, Théorème 1.1 and its corollary: paywalled; read only as recalled in Henniart 2002 §§1.4, 1.9.
- Jacquet–Piatetski-Shapiro–Shalika 1983 (6.1, 6.2, 6.3, 6.5) and Harris–Kudla–Sweet 1996, §6 (7.1): no legal copy found.
- Whether the Props under `GlobalTheory.Published` in the formal proof are proved there or assumed was not checked for the four read in this round.

## Source issues

- none

## For the human reviewers

- **Scope.** The family follows a formal proof announced on 20 November 2026; 3.3, 3.4 (ii), 7.1 (local formula) and 7.2 cite only that proof, which is not a refereed publication (README, References, the entry [FormalProof]).
- **Licence.** The formal proof's repository says it "was published without a license". `integralGL` has the same one-line body as its `GlobalTheory.SplitWeil.KO`, and `heckeT` the same diagonal as `Formalism.UG.diagJ`; names and binders differ (`Suggested.lean`, lines 85–103).
- **Not tested.** Six published sources could not be read (listed under Not verifiable); wording was not compared with them, and the theorem numbers added in 2.1 for three of them are unchecked.
