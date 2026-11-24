# Review of LocalGainOfThetaChains (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 530 changed lines since `b8f3652`. Accepted, with no finding. The change adds Origin and method labels to the 40 sections, replaces ten formal-proof citations in 4.11, 4.15c, 4.15d and 4.17d, rewrites the attribution of 4.14f′ and the route note of 4.14c′, and adds five references; it alters no statement, heading, Check or Lean declaration. I read each new formal-proof citation against the declaration it names and each new published citation where a legal copy exists (Tange, Bannai–Kobayashi, Dipper–Doty–Stoll), and each says what the text claims. There are two small corrections (a method label with no locator, Origin labels with no theorem number) and one format note; none blocks, and nothing is left for a human to decide beyond the standing scope and licence facts.

## C01 — 4.15a carries a method label of the formal proof but names no declaration of it

The References make [FormalProof] "the reference of every target that carries a `*Method of the formal proof:*` label", and 4.15a (line 1784) is the only labelled section that gives no [FormalProof] locator, so a reader has nothing to open. The exchange inequality (b) is in [FormalProof], in the proof's own setting at the level prime, as `LemmaC_core` in `Formalism/SharpRestriction/GlobalSchurBounds/FiniteModelOfAdmissibleTransports.lean`: its hypothesis is `U∘D = T^{N_0−1}` on the new forms and its bound is `length(Sram/T^{n₀}U(Sram)) ≤ length(B_v/T^{n₀}S) + e_𝔭·(k − 1)·rank`, which is (b) with `ϖ^e = T^{k−1}`.

One sentence after the *Needs:* line naming that declaration for (b) would do. If (a) and (c) have no statement of their own in [FormalProof], the sentence could say that the label describes the argument inside that lemma.

## C02 — Four Origin labels name a published result by author and year only

The Origin labels of 4.9a (Bannai and Kobayashi 2010), 4.9b (Mumford 1969), 4.10a (Finis 2006) and 4.12 (Rallis 1982, Mínguez 2008) give no theorem or section, while 4.14c′ (Tange, Theorem 3.2) and 4.14f′ (Knapp, Corollary 9.6) do. A reader cannot find the result that "nearest published result" or "adapted from" compares with.

For Bannai–Kobayashi the result is Corollary 2.16 in the numbering of arXiv:math/0610163v4 (BannaiKobayashi2010 line 1331: for `p ≥ 5` split in `K`, the normalised translates of the theta function by torsion points of order prime to `p` are integral power series); I did not compare the published numbering. The other four labels need the theorem or section their author means.

## N01 — The six `*Sources:*` lines keep the parentheses of the tags they replace, and the Labels paragraph does not explain the label

For example "*Sources:* (Mahler; Amice) for (1)." in 4.14a and "*Sources:* (lattice model; Hecke operators of theta lifts, Rallis, Kudla; …)" in 4.12; the others are in 4.9a, 4.10a, 4.14c and 4.14f. The Labels paragraph (line 101) explains Origin, Method and Corollary-of only. Dropping the parentheses and adding a clause there would read more cleanly.

## Previous findings

The previous review had no finding. Of its remarks: the one on the description (a new roadmap DeligneLusztigTheory announced but absent) is repaired: this head has `TauCetiRoadmap/DeligneLusztigTheory/`, FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups cite it, and RepresentationTheory/CharacterTheory has no change against `main`. The folder is unchanged since that review, so its other three remarks stand and are C01, C02 and N01 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.11 (i) vs `OrbitPlaces.ValuationComposition` | `m = 2`, `s = (1, 2)` | README: column in `p^{1+2} = p^3`; formal: `ColGe` at `Σ_{j∈lifts} s_j = 3`, from `KGe` at `s(i+1)` for `i < m` | agree | none |
| 4.11 (ii) vs `Adm2InU.period_geTU` | `s = 3`, `v_p(D_Γ) = 1`, `e_𝔭 = 2` | README `e_𝔭(s − v_p(D_Γ)) = 4`; formal `y = 0 ∨ ur(s − vDG) ≤ v(y)`, `= 4`; hypotheses used tuple, residue characteristic not in `Qp μ` | agree | none |
| 4.15c vs `SelectionLemmas.Conclusion1` | rank 10, `m = 1`, one place, `t = 2`, `D = 2`, `sh = 0.25`, `S = 3` | formal `τ = m(t + D + 1) = 5`, no `e`: README's "`τ − e`"; length `len(O/p)(10·5 + 2·3·0.25·10) = 65·e_R` both | agree | none |
| 4.15c hypotheses vs `admitted` | three clauses | `TrivStab`, `FinClasses`, `y_u y_v = y_v y_u`: README "trivial stabilisers, finite classes and commuting `y_v`" | agree | none |
| 4.15c route, `e^x − 1 ≤ 2x` | `x = 1/2` | `e^{0.5} − 1 = 0.649 ≤ 1` | true | none |
| 4.15d vs `not_good_le` (tile term) | `δ = 1/2`, `u = 2`, `r = 2`, `ω₀ = 3/4` | README `(1/2)^{14}(1·(3/8)(1/2))^6`; formal `markedLow = (1/4)^7(3/16)^6`; both `≈ 2.65·10^{−9}` | agree | none |
| 4.15d window term and range | `K = r − 1 = 1`, `L₂ = 4`, `δ = 0.1`, `n′ = 100` | README `n′C(4,1)δ = 40`; formal `n·C(L₂,K)δ^K = 40`; formal hypothesis `3δ/4 ≤ p(a) ≤ δ` | agree | none |
| 4.17d vs `topsGroup` (coset shares) | index `o = 3` | profile `δ` on `A₀`, `3δ/4` off: `1/(1 + 2·0.75) = 0.4`, `0.3`; formal `(4 or 3)/(3o + 1) = 0.4, 0.3`; sum `0.4 + 2·0.3 = 1` | agree | none |
| 4.17d `Z_bad` | formal conclusion | formal `4·C_b·x^{−2}·dE·|A|·Σ_p ω_p`, any `ω ≥ 0`; README `4C_bx^{−2}δ_top|A|Σ log p/p` "for any nonnegative weights" | agree | none |
| 4.14f′ vs `subOps_int_lat` | `n = 2`, `p = 5`, `d = 12`; `n = 3`, `p = 5`, `d = 12` | formal `N0(n)·⌊log_p(2d + n − 1)⌋`, `N0 = n(n−1)/2`: `1·⌊log_5 25⌋ = 2`; `3·⌊log_5 26⌋ = 6`; label states the same exponent | agree | none |
| 4.14f′ vs `chOps_comm3` | three clauses, `j ≤ j′` | `chOps j`/`chOps j′`, `chOps j`/`chOps′ j′`, `chOps′ j`/`chOps′ j′` commute: the three commutations of (i) | agree | none |
| 4.14f′ Check vs (iii) | `k = 3`, `n = 2`, `d_S = 2` | projector `(1 + (12))/2`; (iii) allows `p^{⌊log_p 3⌋}`: `p = 2`: 2; `p ≥ 5`: 1, and `1/2` is integral | consistent | none |
| 4.14c′ route vs Tange | Theorem 3.2 | Tange2012 lines 917–926: the analogue of his Theorems 1.1 and 2.2 for `ℤ[GL_m]`, dominant weights, rational bitableaux; Thm 1.1 Corollary (ii) is the saturated truncation (line 217) | supports | none |
| 4.14c′ route vs Dipper–Doty–Stoll | abstract | DipperDotyStoll lines 14–19: a bideterminant basis of the rational `q`-Schur algebra on mixed tensor space | supports | none |
| 4.9a Origin vs Bannai–Kobayashi | Cor. 2.16 | BannaiKobayashi2010 lines 1331–1336: split `p ≥ 5`, torsion points of order prime to `p`, integral series | supports | C02 |
| 4.10a method vs `SelfDualLatticeThetaPadicIntegrality` | constant | formal `c^8 = (π̄/π)^{4n}` (`StatementD.lean` line 62); proved as `split_bound_of_xi_lemmas xiEt xiConn` | agree | none |
| 4.13 method: `Σ_a(−1)^a h_a e_{n−a} = 0` | `n = 1`; `n = 2` in `x, y` | `e_1 − h_1 = 0`; `xy − (x+y)² + (x² + xy + y²) = 0` | true | none |
| 4.15a method (c) and Check | `A = ℤ_p`, `g = p`, `h = p²`; the Check's data | `length(A/ghA) = 3 ≤ 2 + 1`; Check: left `length(ℤ_p/p²) = 2`, right `2 + 1 = 3` | true | none |
| 4.15a method (b) vs `LemmaC_core` | level prime | formal bound `length(B_v/T^{n₀}S) + ramIdx·(k − 1)·duS`; (b) with `ϖ^e = T^{k−1}`; same bound in the 4.16c label | consistent | C01 |
| 4.15b method vs `WalkSharp` | hypotheses | formal: commuting `y_v`, three inclusions with `π^{a}, π^{b}, π^{c}`, spanning with `π^{c₀}` and `|G(B)| ≤ g(B)` at `|B| = β + 1`; any commutative ring | agree | none |
| 4.17a method (ramp identity) | `p = 3`, `x = 9`, `c_e = 1` | left `(3 − 1)₊ + 0 = 2`; right `9·3/8 − (1 + 0.375) = 2` | true | none |
| 4.17b method | `y = 10` | `θ(10) = log 210 = 5.35 ≤ 10 log 4 = 13.9`; `Σ_{p<10} log p/p = 1.31 ≤ 2.30·3.30 = 7.6` | true for `y ≥ 1` | none |
| 4.9c Origin | `v_d(√−d) = 1/2` | `√−d·s₂` integral gives `v_d(s₂) ≥ −1/2`, the valuation the label states | consistent | none |
| Labels paragraph | all 40 sections | 5 with Origin only (4.9, 4.9e, 4.9f, 4.14b, 4.17), 35 with both, 0 `*Corollary of:*` lines | true | none |
| Description: ten replaced names | each name | all ten declared in the source (4.11: 2, 4.15c: 2, 4.15d: 4, 4.17d: 2); the ten new names declared in the cited files | true | none |
| Headlines (1)–(4) | `Suggested.lean` | unchanged against `main`; declares nothing; the docstring names each headline and the carriers it lacks | as before | none |

- Source locators checked against the text: the 10 [FormalProof] declarations of the changed attributions, opened and compared (4.11, 4.15c, 4.15d, 4.17d, 4.14f′); Tange Theorem 3.2 and the corollary of his Theorem 1.1; Bannai–Kobayashi Corollary 2.16; the Dipper–Doty–Stoll abstract.
- [FormalProof] locators resolved: all 62 file paths exist; 120 of the 147 declaration names are declared in a cited file, and 16 of the other 27 (names given without a path) were searched for and found; the remaining 11 were not searched for.
- Further [FormalProof] declarations opened for method labels: `WalkSharp`, `LemmaC_core`, `markedLow`, `CondA`, `N0`, `admitted`, `SelfDualLatticeThetaPadicIntegrality`, `split_place_scaled_bound`.
- Cross-roadmap citations added by the change: RepresentationTheory/CompactGroups §6.4 (on `main`, isotypic projectors, same Knapp locator); ThetaChainsOnDefiniteUnitaryGroups §3.1d (e) and IntegralWeylModulesOfGeneralLinearGroups §§0.1, 0.3a (at this head); all resolve.
- Record against the merge base: no layer, heading, statement, Check or worked example removed or renumbered; every deleted line is a provenance tag or an attribution sentence.
- Dependency check: `depcheck: 129 roadmaps, 1449 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Lean: `lake env lean` on `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Automatic checks: all pass on the worker's run; my rerun differs only in the count of files in other folders (below).

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups and GluedTargetAndDivisionInequality; nothing shared. The first and third cite this roadmap's Layer 4 targets as their owner, and the change adds no object.

Source independence: changed passages only; 9 passages compared with 4 sources (Tange2012, BannaiKobayashi2010, DipperDotyStoll, and [FormalProof], which has Lean statements and no prose), none shared beyond the standard phrase "a bideterminant basis"; largest share [FormalProof], all but 3 of the locators (62 file paths, 147 declaration names); the change adds, removes and reorders no layer, so the arrangement was not compared.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its Origin labels set it beside Rallis (1982), Mínguez (2008), Finis (2006), Bannai–Kobayashi (2010) and Tange (2012). Basis: the README's References and labels; Tange and Bannai–Kobayashi read.

## Not verifiable

- Finis (2006), Rallis (1982), Mínguez (2008), Mumford (1969) and Knapp (2002), Corollary 9.6: not read in this review (journal articles and a book with no open copy sought); what the Origin labels of 4.10a, 4.12, 4.9b and 4.14f′ say of them is unchecked. The Knapp locator is the one RepresentationTheory/CompactGroups §6.4 uses on `main`.
- The description's clause that the ten replaced declarations are "not reached by" the proof's main theorems: the ten new names occur in the kernel export and nine of the old ones do not; the string `ManyOrbitsRefined` occurs there as a name component, which fits the module of that name, and I did not resolve whether the definition itself is exported.
- The source was read in the operator's copy of the public repository, which is at a later commit than the one the References cite; the cited commit itself was not compared.
- Method labels of 4.9a–4.9d, 4.10, 4.12, 4.14, 4.14a, 4.14c–4.14h, 4.15, 4.15e, 4.15e′, 4.15f, 4.16, 4.16a, 4.16b and 4.17c: read for consistency with their sections, not traced through the formal proofs.

Automatic checks set aside as false positives: a rerun of the checks counts the files of the pull request's other roadmap folders as edits outside this folder, and every one lies in a folder the pull request owns. The citation finder lists the formal-proof declaration names as Lean names found nowhere; they are locators into [FormalProof]. The signature listing reads the word "sets" of the module docstring as a declaration; the file declares nothing and elaborates cleanly.

## Source issues

- none

## For the human reviewers

- Scope: the roadmap rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; the new labels mark 31 of its 35 non-definition sections "particular to this proof" and 4 "adapted from" published work.
- Licence: the README cites file paths and declaration names of [FormalProof] and no text of it; the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 20) says the proof belongs to its author and was published without a licence.
- The two recorded decisions of the human reviewers do not apply to this folder: it loses no section and none moves to another roadmap.
