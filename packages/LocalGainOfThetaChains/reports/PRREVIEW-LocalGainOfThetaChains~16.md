# Review of LocalGainOfThetaChains (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 130 lines changed since `3f8c596`. Accepted, with no finding. The change makes the formal proof's forms the statements in three places (the price of 4.9e (b), the depth property of 4.15, the exponent of 4.14f′ (iii)) and keeps the stronger forms as remarks; I recomputed the new lemma `P^{ex}_j(v) ≤ P_j(v)` from the windows of the supplier, checked the equivalence claimed in the remark of 4.15, followed the new price through 4.14 and 4.17a, and opened every newly cited declaration of [FormalProof] at the cited commit. There are one small correction (carried over) and three format notes; none blocks. Nothing new is left for a human to decide beyond the standing scope and licence facts.

## C01 — Two Origin labels still name a published result by author and year only

The labels of 4.9b (Mumford 1969, line 265) and 4.12 (Rallis 1982, line 781) give no theorem or section, so the result that "adapted from" compares with cannot be opened. The other labels of this kind have locators. A theorem or section number in each would settle it.

## N01 — The six `*Sources:*` lines keep the parentheses of the tags they replace

For example "*Sources:* (Mahler; Amice) for (1)." in 4.14a (line 1031); the others are in 4.9a, 4.10a, 4.12, 4.14c and 4.14f. Dropping the parentheses would read more cleanly, and a clause in the Labels paragraph could say what the label is.

## N02 — 4.16 restates the served data with fewer conditions than 4.9e (c) now has

"Let served data as in 4.9e be given: … a set `𝒱_p` of places above `p`, empty unless `p` is of split type, with Hecke types and depth data" (line 1896) is covered by "as in 4.9e", but the list that follows omits what (c) now adds (inert in `ℚ(√−q)`, Hecke type `1` or `r_G`, `P^{ex}_j(v) ≤ P_j(v)`). "served data as in 4.9e (c), with depth data such that …" would not invite a reader to take the shorter list as the hypotheses.

## N03 — In the route of 4.17a the top window is cited as §2.3 of the supplier; it is in §2.3b

"`w̃_j(τ_s) − a⁻_{τ_s} ≤ b′/x + ϑ` (the top window of ThetaChainsOnDefiniteUnitaryGroups §2.3)" (line 2193): the three windows of the step weights are defined in §2.3b, which the new lemma of 4.9e (b) cites correctly.

## Previous findings

The previous review had no finding. Of its remarks: its C01 (the sentence of 4.12 matching (c1), (c2) to `MassRatio₂` and `PointsLemma`) is repaired: the sentence now names the diagram values and caps, the loss of the second engine and the missing floor, which is what `gB`, `gA` and `de` of the cited file say. Its C02 (two Origin labels without locators) is not repaired and is C01 above. Its N01 is unchanged and is N01 above. Its N02 no longer applies: the passage with the constant `C_P` is replaced by the definition of the price.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.9e (b) price vs `G.Pr` | both branches | formal, `p ≥ p0`: `Σ_{odd tops}(fillG − b_s) + Pr1·nP·(w″ + etaSz + cG + Nm)`; else `rG·(Nv(2b′ + cG) + nP(…))`; `fillG = fill − κ_j`; README the same with `Pr1 = 1`, `η_s = ϑ` | agree | none |
| 4.9e (b) `P^{ex} ≥ 1` | `n′ = 2`, `r_H = 1`, `j = 1` | summand `w̃_j + λ_{k−1} ≥ w̃_1 + λ_{k−1} > 0` (Conventions, line 150); last term `(n′/2)·j(t+1) = t + 1 ≥ 1` | holds | none |
| 4.9e (b) lemma, `r_H = 1` | `n′ = 2`, odd position a top; a thin place | top: `P^{ex} = w̃_j − a⁻ + j(t+1)`, `P = w̃_j − a⁻ + 2(w″+ϑ+c_G+N_m)`; thin: `P^{ex} ≤ w″+ϑ+c_G+N_m`, `P = 2(w″+ϑ+c_G+N_m)` | `P^{ex} ≤ P` | none |
| 4.9e (b) lemma, `r_H = r_G` | `r_G = 2`, `n′ = 2`, odd top | `P^{ex} ≤ 4b′ + c_G − a⁻ + 2N_m`; `P = 4b′ + 2c_G + 4(w″+ϑ+c_G+N_m)`; top bound `3b′/2 + b′/x + b′/4 ≤ 2b′` at `x = 4`: equality | `P^{ex} ≤ P` | none |
| 4.9e (b) lemma, negative control | odd position a thick place, no top | `P^{ex} ≥ w̃_j ≈ b`; `P = 2(w″+ϑ+c_G+N_m)` with `w″ = b/(X′|A|)`: fails, so "positions in `A`" is needed; thick places lie in `cσ_dA` (supplier §0.6 (ii)) | hypothesis used | none |
| 4.9e (b) remark `P′ ≤ P` | `r_H = 1`, `n′ = 2`, odd top | `P′ = w̃_j + κ_j − a⁻ + j(t+1)`; `P − P′ ≥ 2N_m − κ_j − N_m ≥ 0` (`κ_j ≤ N_m`) | holds | none |
| 4.9e lemma vs [FormalProof] | statements | `PriceBoundLargePrimes 1`, `PriceBoundSmallPrimes`: exact `Pr ≤ G.Pr` at `GIdx` primes under `SizesAt`, `LatTied`, `rG < k`, `2 ≤ x`; third conjunct of `SmallResidueCharComparison` | as cited | none |
| 4.9e (b), (c) `𝔵_v`, `g_j` vs `G.Sv`, `G.gainP` | definitions | `Sv = ⌈Σ_j max 0 (gU − Pr − max(g0, 0))⌉`; `gainP = Σ_{VV} max(gU − Pr, max(g0, 0)) + Σ_{rest} max(g0, 0)`, `0` above `X″` | agree | none |
| 4.14 `𝔵_v ≤ mγ_LTΣα_s` | `P_j = 1`; `γΣα ≤ 1` | each term `≤ (γΣα − P_j)₊ ≤ γΣα − 1` when positive, using `P_j ≥ P^{ex}_j ≥ 1` at served places; sum `0` or `≤ mγΣα − m`, ceiling adds `< 1` | holds | none |
| 4.14 vs `LowTermBound` | hypotheses | any `PRn ≥ Conclusion₂` (the exact exponent), excess `≥ Σ_j max(Gn − PRn − G0n, 0)`; proved by `lift_bound_of_integrality`; `UAt_of` takes `PRn = G.Pr` | as cited | none |
| 4.12 (c1), (c2) sentence | exponents | `MassRatio₂`: `gv − alEven + Σ g0v − dG`; `PointsLemma`: `gv + Σ g0v − dG`; `gv = gB` (diagram `al`, `cap`, less `de`), `g0v = gA` (not floored) | sentence now exact | none |
| 4.14f′ (iii) | `p = 5`, `n = 2`: `d_S = 5⁵`; `d_S = 2` | `⌊log_5(2·5⁵ + 1)⌋ = ⌊log_5 6251⌋ = 5` = denominator exponent of the symmetriser; `d_S = 2`: (iii) gives `1`, sharper form `⌊log_5 3⌋ = 0`, true denominator `2`, a unit | (iii) true, weaker than the remark | none |
| 4.14f′ vs `subOps_int_lat`, `PW.IntP` | exponents | `N0 n·log_p(2·degIn d S + n − 1)`, `N0 n = n(n−1)/2`, `AdmissibleDVR` has `5 ≤ p`; `kapC p n d = C(n,2)·log_p(d + n − 1)` over `ℚ_p` with the total degree of the chain | as cited | none |
| 4.14g (1) | `n = k − 1` | exponent `((k−1)(k−2)/2)·⌊log_p(2d + k − 2)⌋` is (iii) at `n = k − 1`; `d ≤ 8(s+2)a`, `s ≤ a`: `log_p(16(s+2)a + k) ≤ C·lg_p(8a + k)` | agrees with (iii) | none |
| 4.15 definition vs `GoodRankK` | definition | formal: `u : 𝒪ⁿ → Ntgt`, `M : n × I` over `𝒪`, `Σ_i M_{ji}·⟨F_i, u x⟩ = π^D·x_j`; `(1 − κ)·dim ≤ n`; `LPprime` has `4(D + 1) ≤ cStar` | agree | none |
| 4.15 remark (equivalence) | `n = 1`, `N = 2`, `M = (1, 1)`, values `(1, p − 1)`; `n = 2`, `N = 3`, rows `(p−1, 1−p)`, `(−1, 1)`, `(1, p−1)`, `D = 1` | `n = 1`: index 1 has valuation `0 ≤ D`. `n = 2`: rows 1, 2 singular; rows 1, 3 have `det = p(p−1)`, `p·A⁻¹` integral. In general `n` of the rows form a basis of the lattice they span | equivalent | none |
| 4.17a route, price within `ℒ(p)` | `r_H = 1`; `r_H = r_G` | per top: `b′/x + ϑ + C(w″+ϑ+4Sc+N_m)·log x/δ_top`; `ϑ ≤ w″`, `Sc`, `N_m` powers of `x`, below `b^{1/2}`; `r_G`: `w″ = b′/(x|A|) ≤ b′x^{−ε/8}`, total `≤ C·r_G·b′·log x` | within `ℒ(p)` | N03 |
| 4.17 served data meet 4.9e (c) | hypotheses of the lemma | candidates: split type, inert in `K` and `ℚ(√−q)`; good places have positions in `A`; types `1`, `r_G`; `p ≥ 5` by `InertFreeUpTo 4` | lemma applies | none |

The rows for untouched statements stand as in the previous review, of `3f8c596`.

- Source locators checked against the text: 27 declarations of [FormalProof] opened at the cited commit `40e56ba` (`G.Pr`, `G.Sv`, `G.gainP`, `G.LatTied`, `GIdx`, `PriceBoundLargePrimes`, `PriceBoundSmallPrimes` and their two proofs, `SmallResidueCharComparison`, `numeric_comparison_of_constants`, `LowTermBound`, `lift_bound_of_integrality`, `UAt_of`, `PW.IntP`, `kapC`, `PW.Top.intP`, `subOps_int_lat`, `N0`, `AdmissibleDVR`, `GoodRankK`, `LPprimeAt`, `LPprime`, `gB`, `gA`, `de`, `MassRatio₂`, `PointsLemma`); every cited path exists and every name is in the namespace the README gives.
- Cross-roadmap citations resolved at this head: FrobeniusRestrictedRieszSums §0.6 (ii) (line 537), ThetaChainsOnDefiniteUnitaryGroups §2.3 (c), §2.3b (windows, lemma (f)), §2.3c (`η_s := ϑ`, line 840), §2.1 (`SizeTheta`: `m(t + 1)ϑ ≤ w″`; `w″ := b′/(x|A|)`).
- Seeded sample: 4.13, 4.14, 4.14g and 4.15 lie in changed passages and are checked above; the other targets are untouched.
- Record against the merge base: no layer, heading, Check or worked example removed or renumbered; 4.9e, 4.15 and 4.14f′ keep their ids and subjects.
- Files changed outside the folder: all lie in folders of the family that the pull request owns.
- Dependency check: `depcheck: 67 roadmaps, 874 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two citations added to the `*Needs:*` line of 4.9e are sections of suppliers the roadmap already had.
- Lean: `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Automatic checks: all pass.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups and GluedTargetAndDivisionInequality; nothing shared. The change adds no object; the sibling roadmaps cite 4.9e and 4.15 by section only.

Source independence: changed passages only; 8 passages compared with 1 source ([FormalProof], which has Lean statements and no prose), none shared; largest share [FormalProof], all but a handful of the locators; the change adds, removes and reorders no layer, so the arrangement was not compared.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its Origin labels set it beside Rallis (1982), Mínguez (2008), Finis (2006), Bannai–Kobayashi (2010) and Tange (2012). Basis: the README's References and labels; Tange, Mínguez and Bannai–Kobayashi read.

## Not verifiable

- Finis (2006), Lemmas 3.8 and 3.9 (the locator of 4.10a): no legal copy was found, as in the previous review.
- Rallis (1982), Mumford (1969) and Knapp (2002): not read, as in the previous review.
- That the proofs `price_bound_large_primes` and `price_bound_small_primes` compile was not checked; their statements and the first lines of their proofs were read.
- The sharper exponent of the remark in 4.14f′ and the route that gives it are untouched text and were not recomputed.

Automatic checks set aside as false positives: the citation finder lists the formal-proof declaration names as Lean names found nowhere; they are locators into [FormalProof]. The signature listing reads the word "sets" of the module docstring as a declaration; the file declares nothing and elaborates cleanly.

## Source issues

- none

## For the human reviewers

- Scope: the roadmap rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; its labels mark 31 of its 35 non-definition sections "particular to this proof" and 4 "adapted from" published work.
- Licence: the README cites file paths and declaration names of [FormalProof] and no text of it; the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the proof belongs to its author and was published without a licence.
- The price of 4.9e (b), `DepthBound` of 4.15 and the exponent of 4.14f′ (iii) are now the formal proof's forms, each weaker than the statement on `main`, which stays as a remark; the description says so.
- The two recorded decisions of the human reviewers do not apply to this folder: it loses no section and none moves to another roadmap.
