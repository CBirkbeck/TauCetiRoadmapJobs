# Review of ThetaKernelsForUnitaryDualPairs (pull request #2907 at 3ccfcd4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 41 lines changed since `ac490de`: the three small corrections of the previous review are repaired, and the three formal-proof declarations the repair newly reports (the absolute theta sum, the Siegel–Weil formula in Weil's range, the definite case with its constant) say what the README reports, with one exception. There is one small correction (5.7a says the formal proof has the absolute sum "with no bound", and it has a seminorm bound for the same case in a declaration that 6.4a cites) and two format notes; none blocks. Six points are left to the human reviewers, five as before and one new (the family index now carries a rule for reviews of contributions).

## C01 — In 5.7a the formal proof is said to have the absolute sum for split `W` at `h = 1` "with no bound", and it has that case with a seminorm bound

A reader of the paragraph on the form of the formal proof in 5.7a (lines 1191–1196) concludes that every bound on the absolute sum is this roadmap's own: "it has only the case of split `W = Y ⊕ Y^*` … with no bound". That is exact for the declaration cited there, `GlobalTheory.Published.WeilThetaConvergence`, whose conclusion is finiteness alone. But `GlobalTheory.Published.WeilSiegelFormulaUnitary`, which 6.4a cites, has as its first clause, under the same hypotheses (`dim Y = n ≥ 1`; `r = 0` or `n + r < m`): for every basis of `E/F` there is a seminorm `ν` on the Schwartz–Bruhat space of `(V ⊗ Y)(𝔸)`, continuous in the archimedean component for each fixed finite component, with `∫_{[U(V)]} Σ_ξ |φ(g⁻¹ξ)| dg ≤ ν(φ)`. This is the bound of 5.7a ("for a fixed finite component … a continuous seminorm of the archimedean component") in the case `W` split, `h = 1`.

The smallest change: replace "with no bound" by a clause saying that the bound by a seminorm continuous in the archimedean component, in that case, is the first clause of `GlobalTheory.Published.WeilSiegelFormulaUnitary` (same file as in 6.4a). The next sentence ("That clause for arbitrary `W` and `h`, with its bound, and the majorant at `h = 1` are this roadmap's own") then stands as written.

## N01 — The References give the formal proof "at commit `e50d09817ad8`", and the family index now says its files are looked up at the first commit

Line 2235 against the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, "they are to be looked up at that first commit"). The directory `src/` differs between the two commits only by one added file, and the four files of the changed passages are identical at both, so no locator is wrong; one commit in both places would do.

## N02 — The seven format notes of the previous review stand

The change touches none of their passages: the two letters for the variable of `U(V)` in headline (3); `p`, `q`, `a` in 3.47b and 5.7d; "Propositions 4.1, 4.3–4.5" of Kudla96 (4.4 is a lemma); "the formal proof that the family follows" in the Conventions; the Hermitian form in 3.9a (iii); "characteristic zero" missing in the Summary and the docstring for split matching; "with trivial splitting character" in the Corollary of 6.4a.

## Previous findings

The previous report had no finding (P1 or P2); its three small corrections are accounted for here.

- C01 — repaired: "The formal proof states the Levi formula, as a law, under the isometries stabilising a subspace `Y′ ⊂ W`, for the functionals invariant under the Heisenberg translations by `V ⊗ Y′` … the unipotent formula rests on the route above."
- C02 — repaired: "(ii)–(iv) there are this roadmap's own, proved by the route below ((ii)–(iii) by Rallis' computation, published for orthogonal–symplectic pairs; (iv) from (i))"; Rallis 1982 now carries "there for orthogonal–symplectic pairs" in 3.21a, 3.47a and the References.
- C03 — repaired: 6.4a keeps "the proof of GQT Proposition 11.1 (ii), p. 53"; "GQT §1.7, p. 3 (the credits for Weil's convergent range)" is now in 6.13a and in the References under 6.13a.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.3b, form of the formal proof | `SiegelRule` opened; `ν = 1` | functional invariant under `ρ(z·Cyᵀ)`; `p·Cy = Cy·t` gives `l(ω(p)φ) = χ(det t)·\|N det t\|^{card α/2}·l(φ)`; no `n(B)` clause | README's new sentence agrees | none |
| 3.21a (ii)–(iv), inert case | (iv) from (i); `n = 0` | `K`-invariants exact; `ω^K = U(W)·φ₀`, so a nonzero map is nonzero at `K′`-fixed `φ₀`; `n = 0`: `θ(1) = χ̃_V∘det`, unramified | route gives (iv) from (i) as now said | none |
| 5.7a, absolute sum in the formal proof | `WeilThetaConvergence`, `WeilSiegelFormulaUnitary`; `(m,r,n) = (2,1,1)`, `(3,1,1)`, `r = 0` | hypothesis `r = 0 ∨ n + r < m`: `2 < 2` false, `2 < 3` true; sum over `M_{m×n}(E)` of `‖φ(h⁻¹ξ)‖`, integral `< ⊤`; second declaration: `≤ ν(φ)` | case and range agree; "no bound" does not | C01 |
| 6.4a, formal-proof locators | `SiegelWeilStd`; `WeilSiegelFormulaUnitary`; `n = m`, `n < m`, `2n < m` | `min(r,s) = 0`, `m, n ≥ 1`, value at `(m − n)/2`, constant `1` if `n < m` else `2`; GQT: `1` for `s₀ > 0`, `2` for `s₀ ≤ 0`; `2n < m`: coset sum equals the mean, constant `1` | agree | none |
| 6.13a, credit GQT §1.7 | GQT lines 137–142, 1617–1630, 2605 | §1.7: inner product formula, Weil's convergent range `r = 0` or `m − r > n + ε₀`, `ε₀ = 0` for `E ≠ F`; Siegel–Weil credits at Theorem 7.1 and proof of 11.1 (ii) | each locator now at the statement it credits | none |

The rows for the untouched statements stand as in the previous review, of `ac490de`.

- Source locators checked against the text: 3 passages of GQT (lines 137–142, 1617–1630, 2605) for the changed citations; of the seeded sample, 3.21a, 5.7a and 6.13a fall in the changed passages and were checked there.
- Formal-proof declarations opened at the commit of the References: `GlobalTheory.WeilM.SiegelRule`, `GlobalTheory.Published.WeilThetaConvergence`, `GlobalTheory.Published.WeilSiegelFormulaUnitary` (with `absTheta`, `absThetaInt`, `IsContSeminorm`), `GlobalTheory.ThK.Dbl.SiegelWeilStd`; the four files are identical at the first commit of that repository.
- Cross-roadmap citations: the change adds one, MetaplecticAutomorphicForms §6.4, already cited in 6.4a and resolved on main in the previous review; no supplier added or dropped.
- Dependency check: `depcheck: 136 roadmaps, 1527 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed at this head. `Suggested.lean` is unchanged, elaborates with no message and declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Outside the folder the change is in the family index only (the link to the source as published and the section "When a roadmap is wrong"); the first commit it links exists and carries `src/`.
- Pull request text: the description agrees with the head; the change alters attributions only and nothing the description states.
- Overlap check: read RowTowerAndRallisIdentities, LocalFactorsOfTwistsAndTypes, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII as in the previous review; the change adds no object, and ownership stands as recorded there (unramified unitary doubling value: MetaplecticAutomorphicForms §6.11 and AutomorphicLFunctionsAndLocalFactorsPartII §2.3; doubling series: LocalFactorsOfTwistsAndTypes §3.3); nothing else shared.

Source independence: changed passages only; 5 passages compared with 2 sources (GQT, FormalProof), none shared beyond formulas; largest share FormalProof, 80 of about 129 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The targets are the local and global theta correspondence for unitary dual pairs: Kudla's persistence (1996), J.-S. Li's and Ichino's lifts of discrete series (1990, 2020), the Siegel–Weil formula of Weil (1965) and Ichino (2007), and the Rallis inner product formula as in Gan–Qiu–Takeda; README References, GQT §1.7 and Ichino20 §1.

## Not verifiable

- Weil65 §§V–VI (5.7a, 6.4a): recorded as uncertified; cited by locator only.
- Ichino 2007 (the credit now attached to 6.13a and 6.4a): recorded as uncertified; only GQT's attribution to it was read.
- Rallis 1982 and Howe 1979 (3.21a, 3.47a): not among the texts recorded for this roadmap; that Rallis 1982 treats orthogonal–symplectic pairs rests on the README's own description.
- The formal-proof locators other than the six declarations opened in this and the previous review: not opened.

## Source issues

- none

## For the human reviewers

- Scope: the family records an unpublished formal proof announced on 20 November 2026 (Announcement, FormalProof); about 80 of about 129 locators of this README point into it.
- Scope: 3.47c, 5.7b, 6.13c and the Fock-module clauses of 3.46a state that no publication is cited and that the route is the proof; the inert case of 3.21a (ii)–(iv) is now also marked as this roadmap's own.
- Licence: the family index says the formal proof was published without a licence and is mirrored for verification only; the README reproduces its file paths and declaration names, no text.
- Scope: the roadmap extends MetaplecticAutomorphicForms and continues its section numbers (3.45–3.47c, 3.3b, 6.11) under another title; MetaplecticAutomorphicFormsPartII is a different open roadmap.
- Not tested: FormalProof has the largest share of the locators and its text was read at six declarations only; wording and arrangement were not compared with it beyond those.
- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) gains a section "When a roadmap is wrong" that says what a review of a contribution may not block; whether a roadmap index sets review rules is a project decision.
