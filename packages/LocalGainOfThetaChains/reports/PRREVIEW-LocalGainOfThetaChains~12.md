# Review of LocalGainOfThetaChains (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 530 changed lines since `74a09b7`. Accepted, with no finding. The change adds Origin and method labels, replaces ten formal-proof citations in 4.11, 4.15c, 4.15d and 4.17d, rewrites the attribution of 4.14f′ and the route note of 4.14c′, and adds five references. I checked every changed attribution against the formal proof at its cited commit and its kernel export, and read the new published sources where a legal copy exists (Tange, Mínguez, Bannai–Kobayashi, Dipper–Doty–Stoll); each says what the text claims. There are three small corrections (a method label with no locator, Origin citations with no theorem number, and a paragraph of the description written for an earlier head) and one format note. None blocks, and nothing is left for a human to decide beyond the standing scope and licence facts.

## C01 — 4.15a carries a method label of the formal proof but names no declaration of it

The References make [FormalProof] "the reference of every target that carries a `*Method of the formal proof:*` label". 4.15a (line 1784) is the only labelled section with no [FormalProof] locator, so a reader has nothing to look up. In [FormalProof] the exchange inequality (b) appears in the proof's own setting at the level prime as `Formalism.MainNotions.product_first_zeroth_parts.LemmaC_core` (`Formalism/SharpRestriction/GlobalSchurBounds/FiniteModelOfAdmissibleTransports.lean`, present in the kernel export). Its bound is `length(Sram/T^{n₀}U(Sram)) ≤ length(B_v/T^{n₀}S) + e_𝔭(k − 1)·rank`, which is (b) with `ϖ^e = T^{k−1}`. `hecke_ramified_lattice_stable_length` applies it for 4.16c.

The smallest fix would be one sentence after the *Needs:* line naming that declaration as (b) for `U_v, D_v` at the level prime. If (a) and (c) have no separate statements in [FormalProof], it could add that the label describes the argument inside that lemma.

## C02 — Several Origin labels name a published result without saying which theorem

The Origin labels of 4.9a (Bannai and Kobayashi 2010), 4.9b (Mumford 1969), 4.10a (Finis 2006) and 4.12 (Rallis 1982, Mínguez 2008) give only an author and a year. By contrast, 4.14c′ (Tange, Theorem 3.2) and 4.14f′ (Knapp, Corollary 9.6) say which theorem is meant. As written, a reader cannot find the result the label compares with.

From the texts I could read:
- Mínguez: Théorème 1 of the introduction, proved as Corollaire 6.3, p. 718 (Minguez2008 line 73).
- Bannai–Kobayashi: §2.3, Corollary 2.16, in the numbering of arXiv:math/0610163v4 (BannaiKobayashi2010 line 1331). I did not check the published numbering.

For Finis, Rallis and Mumford, the theorem or section meant would need to be added.

## C03 — The description announces a new roadmap, DeligneLusztigTheory, that this head does not contain

The description says the pull request adds "a new general roadmap, DeligneLusztigTheory, 22 more (below)", and that RepresentationTheory/CharacterTheory is unchanged. The head is different on both counts:
- no folder of that name exists and no roadmap cites it;
- FiniteReductiveGroups takes Deligne–Lusztig induction from ReductiveGroups and Green's theory from RepresentationTheory/CharacterTheory (its README, lines 49–53);
- `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` is among the changed files.

This concerns other folders, not this one. The paragraph headed "A new general roadmap" and the sentences that cite it would need rewriting to describe where this head places that theory.

## N01 — The six new `*Sources:*` lines keep the parentheses of the tags they replace and are not explained with the other labels

For example, "*Sources:* (Mahler; Amice) for (1)." in 4.14a, and "*Sources:* (lattice model; Hecke operators of theta lifts, Rallis, Kudla; …)" in 4.12. The others are in 4.9a, 4.10a, 4.14c and 4.14f. The Labels paragraph (line 101) explains Origin, Method and Corollary-of, but not this label. Dropping the parentheses, and mentioning the label in that paragraph, would read more cleanly.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.11 (i) vs `OrbitPlaces.ValuationComposition` | `m = 2`, `s = (1, 2)` | README: column in `p^3`; formal: `ColGe` at `Σ_j s_j = 3` over `SizeData₂.lifts` | agree | none |
| 4.11 (ii) vs `Adm2InU.period_geTU` | `s = 3`, `v_p(D_Γ) = 1`, `e_𝔭 = 2` | README `e_𝔭(s − v_p(D_Γ)) = 4`; formal `ur(s − vDG) = ramIdx·(s − vDG) = 4` | agree | none |
| 4.15c vs `SelectionLemmas.Conclusion1` | rank 10, `m = 1`, one place, `sh = 0.25`, `S = 3`, `τ = 5` | README `e_R·10·(5 + 1.5) = 65e_R`; formal `len(O/p)·(dτ + 2S·Sig·d) = 65e_R`; exceptional count `⌊2.5⌋ = 2` both | agree | none |
| 4.15c hypotheses | `admitted` clauses | formal: trivial stabilisers, finite classes, commuting `y_v`; proved from the first two by `stability_of_trivial_stabilisers` | as stated | none |
| 4.15d vs `not_good_le` (marked tile) | `δ = 1/2`, `u = 2`, `r = 2`, `ω₀ = 3/4` | README `(1/2)^{14}(3/16)^6`; formal `markedLow = ((1/4))^7(3/16)^6`; both `≈ 2.65·10^{−9}` | agree | none |
| 4.15d window term | `K = r − 1 = 1`, `L₂ = 4`, `δ = 0.1`, `n′ = 100` | README `n′C(4,1)δ = 40`; formal `n·C(L₂,K)δ^K = 40`; `CondA` = at most `K` tops per window | agree | none |
| 4.17d vs `topsGroup` (coset shares) | index `o = 3` | profile `δ` on `A₀`, `3δ/4` off: shares `1/2.5 = 0.4` and `0.3`; README `4/(3o+1) = 0.4`, `3/(3o+1) = 0.3` | agree | none |
| 4.17d `Z_bad` | formal conclusion | formal `4·C_b·x^{−2}·dE·|A|·Σω`; README `4C_bx^{−2}δ_top|A|Σ log p/p`, any nonnegative weights | agree | none |
| 4.14f′ vs `subOps_int_lat` | `n = 2`, `p = 5`, `d = 5^5`; `n = 3`, `d = 12` | formal `N0(n)⌊log_p(2d+n−1)⌋` = 5; 6. README (iii) with `d_S = d`: 5; 3 | 5 = Check's denominator `5^5` | none |
| 4.14f′ vs `chOps_comm3` | three clauses | `chOps j`/`chOps j′`, `chOps j`/`chOps′ j′`, `chOps′ j`/`chOps′ j′` commute for `j ≤ j′` = the three commutations of (i) | agree | none |
| Description: ten removed names | each name | all ten in the source at the commit; none in the kernel export; all ten new names in it | true | none |
| All [FormalProof] locators | 148 names, 62 paths | 148 in the export; 62 paths exist at the cited commit | resolve | none |
| 4.14c′ route vs Tange | Thm 3.2, Corollary | Tange2012 lines 925–950: rational bitableaux, saturated truncations of `Z[GL_m]` | supports | none |
| 4.14c′ route vs Dipper–Doty–Stoll | abstract | DipperDotyStoll lines 18–23: bideterminant basis of the rational `q`-Schur algebra on mixed tensor space | supports | none |
| 4.12 Origin vs Mínguez | Théorème 1 | Minguez2008 lines 73–80: type-II Howe correspondence explicit in Langlands parameters | supports | C02 (locator) |
| 4.9a Origin vs Bannai–Kobayashi | Cor. 2.16 | BannaiKobayashi2010 lines 891–893, 1331–1336: integrality at split `p ≥ 5` (proved for CM abelian varieties) | supports | C02 (locator) |
| 4.10a method vs `split_place_scaled_bound` | `n = 1` | proved as `split_bound_of_xi_lemmas xiEt xiConn` (étale, connected); `c⁸ = (π̄/π)^4 = (c²)^4`, `c² = π̄/π` | consistent | none |
| 4.13 method: `Σ_a(−1)^a h_a e_{n−a} = 0` | `n = 2`, variables `x, y` | `xy − (x+y)² + (x²+xy+y²) = 0` | true | none |
| 4.15b method vs `WalkSharp` | count | formal exceptional count `Σ_B m^{β+1}g(B)`; label `m^{β+1}·g(B)` per `B` | agree | none |
| 4.15f method | `D_p = 2`, `c = 24` | `p^{D_p}diag(B)^{−1}(diag(B) + w^cR) = p²(1 + w^{20}R′)`, `c − 2D_p = 20 > 0`: unit determinant | true | none |
| 4.16c Origin ("(b) with `|Λ_0|` is this roadmap's own") | formal statements | `CongruenceLatticeLengthBound` sums `a_max/k + 2Wt + k + a⁻` per place; sharp form only per place in `SecondBranchInclusionLength` | true | none |
| 4.15a method vs `LemmaC_core` | (b) | formal `len(Sram/T^{n₀}U·Sram) ≤ len(B_v/T^{n₀}S) + e(k−1)·duS` = (b) with `ϖ^e = T^{k−1}` | consistent | C01 |
| 4.17b method | `y = 30` | `θ(30) ≈ 22.59 ≤ 30 log 4 ≈ 41.59`; `Σ_{p<30} log p/p ≈ 2.30 ≤ log 30(1 + log 30) ≈ 14.97`; `a/x = b` (`a := x·b`) | true | none |
| 4.17a method (ramp identity) | `x = 125`, `p = 5`, `c₁ = 3`, `c₃ = 0.5` | left `22 + 0.5 + 0.0417 = 22.542`; `γ_LTx − Σmin = 26.042 − 3.5 = 22.542` | true | none |
| 4.9d method | `p = 5` | `2` invertible mod `5` (division by 2); proof imports unitary substitution, odd-period folding, norm-one units | consistent | none |
| 4.12 Origin vs body | (b) for `∇` | body: `∇` inclusion is the roadmap's own, `Δ` proved as `restWeylEdge`; Origin says the same | agree | none |
| 4.14 Origin | `p = 5`, even top `α = 120` | `γ_LT(5)·120 = 120·5/24 = 25`; `1/5 + 1/125 + … = 0.20833` | consistent with (a) | none |
| 4.16 method | `s = 7`, `v_p(D_Γ) = 1`, `e = 2` | period exponent `e(s − v_p(D_Γ)) = 12`, as 4.11 (ii) | consistent | none |
| 4.14b, 4.17 (definitions) | labels | Origin only, no method label | as the Labels paragraph says | none |
| Labels paragraph | all 40 sections | 5 with Origin only (4.9, 4.9e, 4.9f, 4.14b, 4.17), 35 with both; 0 Corollary-of lines | true | none |
| Headlines (1)–(4) | `Suggested.lean` | unchanged; declares nothing; docstring names each with the carriers it lacks | as before | none |

- Source locators checked against the text: 10 [FormalProof] declarations of the changed attributions (4.11, 4.15c, 4.15d, 4.17d, 4.14f′) read at the cited commit; Tange Thm 3.2 and Corollary; Mínguez Théorème 1; Bannai–Kobayashi Cor. 2.16; Dipper–Doty–Stoll abstract.
- Formal proof declarations also opened to check method labels: `split_place_scaled_bound`, `WalkSharp`, `LemmaC_core`, `CongruenceLatticeLengthBound`, `stability_of_trivial_stabilisers`, `select`, `markedLow`, `CondA`, `N0`, `degIn`, `ur`.
- Cross-roadmap citations added by the change: RepresentationTheory/CompactGroups §6.4 (on main, cites the same Knapp locator); ThetaChainsOnDefiniteUnitaryGroups §3.1d (e) and IntegralWeylModulesOfGeneralLinearGroups §0.1, unchanged; no unresolved citation.
- Record against the merge base: no layer, heading, statement, Check or worked example removed; every deleted line is a provenance tag or an attribution sentence.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Lean: `Suggested.lean` unchanged; `lake env lean` exit 0, no message; it declares nothing, so there are no signatures to compare and no one-tactic probe to run.
- Automatic checks rerun: all pass except the one on files outside the folder (below).

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties; nothing shared. Each cites this roadmap's sections as their owner, the change adds no object, and no roadmap states Tange's or Mínguez's theorem.

Source independence: changed passages only; 10 passages compared with 5 sources (Tange2012, Minguez2008, BannaiKobayashi2010, DipperDotyStoll, [FormalProof] Lean statements without prose), at most 3 consecutive words shared ("a bideterminant basis"); largest share [FormalProof], 105 of 108 locators; the change adds, removes and reorders no layer, so the arrangement was not compared.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026). The new Origin labels place it beside Rallis (1982) and Mínguez (2008) on Hecke compatibility, Finis (2006), Bannai–Kobayashi (2010) and Tange (2012). Basis: README References and Origin labels; three of these read.

## Not verifiable

- Finis (2006), Ann. of Math. 163: no legal copy found (the publisher's page is in no open class); the 4.10a Origin's description of it is unchecked.
- Rallis (1982), Amer. J. Math. 104: paywalled; the 4.12 Origin's "for orthogonal–symplectic pairs" unchecked.
- Knapp (2002), Corollary 9.6, p. 560: book, not openly available; the same locator is cited by RepresentationTheory/CompactGroups §6.4 on main.
- Mumford (1969), bi-extensions of formal groups: no open copy sought further; 4.9b Origin unchecked.
- Method labels of 4.14a, 4.14c–4.14h, 4.15, 4.15e, 4.15e′, 4.16a, 4.16b, 4.17c: read for consistency with their sections; not traced through the formal proofs.

Automatic checks set aside as false positives: the rerun of the checks counts 118 changed files in other folders as edits outside this folder, and every one lies in a folder this pull request owns. The citation finder lists the formal-proof declaration names as Lean names found nowhere; they are locators into [FormalProof], and all 148 are in its export. The signature listing reads the word "sets" in the module docstring as a declaration; the file declares nothing and elaborates cleanly.

## Source issues

- none

## For the human reviewers

- Scope: the roadmap rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper. The new labels mark 31 of its 35 non-definition sections "particular to this proof" and 4 "adapted from" published work.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 11) says the proof belongs to its author and was published without a licence; the README cites its file paths and declaration names, no text of it.
- The two recorded decisions of the human reviewers do not apply to this folder: it loses no section and none moves to another roadmap.
