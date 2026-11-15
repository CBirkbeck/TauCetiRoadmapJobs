# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 66e58fc)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 66e58fc: the folder is byte-identical to the head the previous review read. This report has no findings. What moved since then is outside the folder (main, the merge order, four sibling heads), and that is what was re-checked.

## Previous findings

- none: the previous report, of 66e58fc, has no findings. The items it recorded as settled (repairs owed by ArithmeticStatisticsPartVII and ArithmeticStatisticsPartIII in their own pull requests; DAVENPORT-51 and LANG-WEIL-54 unread) are unchanged and are not re-raised.

## Verified sound

**Adversarial table (computed this round, for statements the Downstream-consumers lines cite).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.4 `SieveVaughan.vaughan_identity` | (U,V,n) = (2,3,30), (1,1,8), (4,4,49), (3,2,9), (0,0,6), (5,2,1), (2,5,0) | terms: 0+log 2−log 2+0=0=Λ(30); 0+3log 2−0−2log 2=log 2; 0+2log 7−0−log 7=log 7; log 3; 0; 0; 0 | holds, zero cutoffs and n=0, 1 included |
| same, exhaustive | 0≤U,V≤7, 0≤n<200 | 12 800 triples, 0 failures at tolerance 10⁻⁹ | holds |
| §2.9 `SieveTaper.sharp_additive_largeSieve` | x=(0,¼,½,¾), δ=¼, M=−2, a=(1,i,−1,2); same x, M=3, a=(1,1,1,1); x=(0.1,0.6), δ=½, a=(1,−1); one point, δ=1, a=(2+i) | 28≤49; 16≤28; 4≤6; 5≤5 | holds; equality at H=1, δ=1 |
| §0.4 `SieveGram.sum_norm_inner_sq_le_of_row_le` | x=(1,−1,2), y=((1,0,1),(0,2,1),(1,1,0)) | inner products 3, 0, 0; row sums 4, 8, 5; 9 ≤ 8·6 = 48 | holds |
| §3.1 `SieveDistribution.primeCountAP` | (x,q,a) = (20,4,3), (10,0,7), (10,0,4), (10,1,0), (1.5,3,2) | 4 (primes 3, 7, 11, 19); 1; 0; 4; 0 | q=0 is equality, as ExplicitPrimeCounting's contract reads it |

The rows for the other statements stand as in the previous review, of 66e58fc.

- Gate rerun on this head: every check 0, ending `outside-folder=0 source-material=0 OK`; the worker's `gate.md` adds `build=0`. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the diff outside the folder is empty.
- Dependency check output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 43 `declaration uses sorry` warnings and nothing else, as before.
- Suppliers: all 17 roadmaps under `## Exact supplier contracts` are on main 4d169a9 (14 active, GlobalNumberFields, ArithmeticDirichletSeries, Chebotarev and RealAlgebraicGeometry completed). The citation resolver lists 0 cross-roadmap citations found nowhere; its 62 Lean-name leads are this roadmap's own declarations, plus `Decomposition.IsAbsolutelyAlmostSimple`, which is ReductiveGroupsPartII `Suggested.lean:253` on main.
- Consumer lines `README.md:4128–4134` re-resolved at the sibling heads that moved: ExplicitZetaBounds (cea8938) `README.md:407–411`, `:2703` takes §2.9 and §2.6; ExplicitPrimeCounting (62095a2) `:468–477` takes the forbidden-residue sieve "not an input of §0.1" and §3.1 `primeCountAP`; ErdosProgressionPowers (fb24264) `:1531–1533` applies the §0.4 diagonal/off-diagonal form; ExplicitCharacterSumsAndSieves (a1e357d) `:275–284` takes §§1.3, 2.9. ArithmeticStatisticsPartV `:61` and CircleMethodThreePrimes `:44` take §5.6 and §2.4.
- Pull request text against the head: the title, the summary block and the prose name nothing the head contradicts (new roadmap, three files, suppliers on main, 0 outside-folder paths, build with `sorry` only); 13 phrases of the summary block were located in the README.
- Seeded sample and source locators: no passage changed, so none of the 15 sampled targets falls in a changed passage; they were not re-read. The two source items below were re-opened at KED-chap-largesieve line 478 and KED-ANT-16 line 535.
- Remark, no change requested here: ErdosProgressionPowers `README.md:700–701` (fb24264) still names `SieveGram.sum_norm_inner_sq_le_max_row` and `SieveGram.sum_norm_inner_sq_le_of_diag_offdiag`, which this roadmap states as README targets without Lean declarations (`README.md:4131` says so); that list is its own repair. The merge order places ErdosProgressionPowers (line 53) and ArithmeticStatisticsPartV (56) before this roadmap (57) although both name it as a supplier; this README names them only as consumers.

Overlap check: read ProbabilisticAndMetricNumberTheory, ExplicitCharacterSumsAndSieves, ArithmeticStatisticsPartV, CircleMethodThreePrimes, ErdosProgressionPowers, AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, ClassicalArithmeticCompletion; odd-squarefree quadratic large sieve: AnalyticNumberTheoryPartII §5.29 (cited at `README.md:15`, `:2260`); number-field quadratic reciprocity: ClassicalArithmeticCompletion §§1.57, 1.66 (cited); forbidden-residue large sieve, Selberg weights, Vaughan's identity, Bombieri–Vinogradov, §0.4 Gram inequalities, joint spins and Cₘ: this roadmap, each cited by the others; ProbabilisticAndMetricNumberTheory shares nothing.

Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again because no layer was added, removed or reordered.

## Not verifiable

- DAVENPORT-51 (DOI 10.1112/jlms/s1-26.3.179) and LANG-WEIL-54 (DOI 10.2307/2372655): cited in `README.md` (5 occurrences), no entry among the 39 ids of the manifest, no text in the sources cache; not re-requested this round, since the previous round's fetch ended "no legal source found" for both.
- Settled and cited by locator: uncertified FIMR-ERRATUM-2015, BGS-10, DFI-1997, SCHNEIDER-11; waived CHEN-73-CN, HR-SIEVE, HR-1974, RICHERT-1969, KM-16RANK-published, KM-KERNEL-PUBLISHED.
- ArithmeticStatisticsPartVII and ArithmeticStatisticsPartIII have no checkout among the sibling heads given to this review; their citations were not re-resolved this round.

## Source issues

- **Error** in KED-chap-largesieve at Lemma 15.4 (Duality), §15.2 (HTML chapter, line 476): the source says the duality holds for any real constant C; it should be for C ≥ 0, since with no column index and C < 0 the hypothesis is vacuous and the conclusion fails; affects nothing.
- **Misprint** in KED-ANT-16 at the proof of Lemma 16.5, §16.3 (HTML chapter, line 535): the source says the frequency is a₁ over (q₁ + a₂/q₂); it should be the sum a₁/q₁ + a₂/q₂; affects nothing.

## For the human reviewers

- **Licence.** DAVENPORT-51 and LANG-WEIL-54 are cited by locator in `README.md` but have no `sources.toml` entry and no legal copy was found; a ruling (waive, or name a legal copy) is pending.
