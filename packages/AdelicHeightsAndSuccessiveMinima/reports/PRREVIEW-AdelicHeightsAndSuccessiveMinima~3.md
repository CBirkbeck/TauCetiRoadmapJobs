# Review of AdelicHeightsAndSuccessiveMinima (pull request #2883 at 66a59fa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** Accepted, with no finding: every new claim of this round holds on the instances I computed and every new citation resolves, namely that the logarithm of `adelicHeight` is the Arakelov height of a point for `O(1)` with Fubini–Study metrics, that `|det A|_𝔸` is `TauCeti.deltaL` when the `A_v` have entries in `K`, that DiophantineApproximationAndTranscendence §2.8 gives the comparison `μ l ≤ λ (d l)`, and that 3.1 yields §2.5's fixed-field basis estimate. Four small corrections and one format note remain, none blocking: the description still describes an earlier head, the family index credits this roadmap with the duality and extension behaviour it cites from §2.5, the index still differs between the family's pull requests, and the new Arakelov comparison is a target whose supplier no *Needs:* line names. The human reviewers are asked again about the family's end theorem.

## C01 — The description still describes an earlier head

The description is unchanged since the previous review, and three of its sentences are false at this head. A reader of the pull request therefore gets the wrong deliverables and the wrong suppliers.

- The second paragraph ends "Its headline theorems are these." and nothing follows. It would read: "Its headline theorems are the values of the subspace height at `A = 1` and on the whole space, and the two halves of Minkowski's second theorem over `K` for balanced bodies."
- "`Suggested.lean` states 6 headline theorems …" names `adelicSubspaceHeight_span_image` and `adelicSubspaceHeight_eq_mul_euclideanDual`, which the file does not declare. It also says the docstring names headlines that are not statable, but the docstring (lines 12–14) says both headlines are statable. It would read: "`Suggested.lean` states 4 headline theorems with `sorry` proofs (`adelicSubspaceHeight_one`, `adelicSubspaceHeight_top` and the two halves of Minkowski's second theorem over `K`) and 4 definitions with real bodies; its docstring lists the clauses of 2.5a and 3.1 it does not state."
- "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first." It would read: "Its suppliers, DiophantineApproximationAndTranscendence (§§0.0, 2.5, 2.8), SubspaceTheorem (§§4.1–4.2) and ArakelovGeometryAndAbelianHeights (§§1.12, 1.14), are all on main." The last of these is new at this head.

## C02 — The family index credits this roadmap with the duality and the behaviour under extension

The index's entry (family `README.md`, lines 56–58) describes this roadmap as "adelic heights of vectors and subspaces for an adelic presentation, with their duality and behaviour under extension". So a reader of the index looks here for the dual-height identity and the extension invariance. This roadmap's README says the opposite. Line 188 says that the invariance under finite extension and the dual-height identity "are DiophantineApproximationAndTranscendence §2.5", and that "2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity and adds nothing to them". The previous head's entry was accurate, and adopting the siblings' index replaced it. Every copy of the index in the family carries the inaccurate entry.

The entry would read, for instance: "names for the adelic heights of vectors and subspaces of an adelic presentation, written out over every finite extension, with their elementary properties, and Minkowski's second theorem over number fields for balanced bodies."

## C03 — The family index still differs between the family's pull requests

The description says the index "is carried, with identical content, by every pull request of the family". I compared `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` at the heads of the 40 open pull requests that carry it, and found six different texts:
- 15 heads, this one among them, share this text, including #2877, #2880 and #2924;
- 17 heads, including #2882, #2894 and #2898, share a second text, which differs from this one in 24 lines and three passages: the paragraph on the formal proof the family follows (lines 9–17 here), the rule that a section keeps its number (lines 34–36), and the entry for ChowFormsAndHeightsOfSubvarieties (lines 117–119);
- 4 heads share a third text, and 4 heads have texts of their own.

Whichever of these pull requests merges after another conflicts with it, or silently replaces its index. Either carry one index across the family, or name in the description the pull request whose index is meant to be kept and drop the sentence about identical content.

## C04 — The new comparison with the Arakelov height is a target, but no *Needs:* line names its supplier

The *Standard data* bullet of 2.5a (lines 45–48) now asks, under "Provide:", for the identification of `log adelicHeight A x` with the height `h_ℒ̄` of ArakelovGeometryAndAbelianHeights §1.12, and for `A = 1` with the Fubini–Study degree of its §1.14. Neither 2.5a's *Needs:* line (lines 77–78), the Dependencies of Layer 2 (line 95) nor the supplier contracts name ArakelovGeometryAndAbelianHeights. So an implementer reading the dependencies does not learn that this clause needs §1.12's height of points. In addition, neither the list of what 2.5a owns (line 186) nor the docstring's list of unstated clauses (Suggested.lean, lines 36–38) mentions the clause.

The statement itself is true. For `K = ℚ`, `A_2 = diag(2, 1)`, all other `A_v = 1` and `x = e₁`, `adelicHeight A x = 1·|2|₂ = 1/2`. The saturated line `ℚe₁ ∩ Λ` is `½ℤ·e₁`, so the dual line bundle `x^*O(1)` has degree `−log 2`, which is the same value. The smallest repair is to add "ArakelovGeometryAndAbelianHeights §§1.12, 1.14 (the comparison only)" to the *Needs:* line and the Dependencies, and a `### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` line to the contracts. If the sentence is meant as a remark rather than a target, it could instead be moved out of the list under "Provide:".

## N01 — Symmetry is implied by balancedness

In 3.1 (line 103) and in the lower bound of `Suggested.lean` (`hBsymm`, line 129), symmetry follows from balancedness with `a = −1`. It could be dropped, or kept with a word that it is implied.

## Previous findings

- C01 — not repaired: the description still ends its second paragraph with "Its headline theorems are these." and still lists `adelicSubspaceHeight_span_image` and `adelicSubspaceHeight_eq_mul_euclideanDual` among 6 headline theorems (C01 here).
- C02 — partly repaired: the index now equals that of 14 sibling heads, including #2877, #2880 and #2924, but 17 others carry another text. This roadmap's entry now reads "with their duality and behaviour under extension" (C02 and C03 here).
- N01 — not repaired: "compact, convex, symmetric, with `0` in its interior, and **balanced over the completions**" (line 103); `hBsymm` is kept at line 129 (N01 here).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.5a, `log adelicHeight A x = h_ℒ̄(x)` (Arakelov §1.12) | `ℚ`, `A_2 = diag(2,1)`, `x = e₁`; `ℚ`, `n = 1`, `A_∞ = 2` | `log(1·½) = −log 2` vs `deg x^*O(1) = −log 2`; `log 2` vs dual of `(ℤ, |2·|)`: `log 2` | holds |
| 2.5a, `A = 1` case vs §1.14 Fubini–Study degree `/[K:ℚ]` | `ℚ`, `x = (1,1)`; `ℚ(i)`, `x = (1,1)` | `log √2 = ½ log 2` vs `½ log 2 / 1`; `log √2` vs `log 2 / 2` | holds |
| 2.5a, `|det A|_𝔸 = TauCeti.deltaL (v ↦ A_v)` for `A_v` over `K` | `ℚ`, `A_∞ = 2`; `ℚ(i)`, `A_∞ = 2`; constant `A_v = g`, `det g = 3` | `2` vs `2`; `2^(2/2) = 2` vs `2`; `deltaL = 3·⅓ = 1` vs principal `1` | holds |
| 2.5a change of basis vs §2.5 change of variables | DAT line 1054 (EF Lemma 7.3(i)); `ℚ`, `A = 1`, `g = [[1,1],[0,1]]`, `x = e₂` | §2.5: `H(L∘φ)(x) = H(L)(φx)`; here `g⁻¹x = (−1,1)`, `g(−1,1) = e₂`: both `1` | analogue as stated |
| 2.5a (sample), Check 1 | `ℚ`, `n = 2`, `A_∞ = diag(1, e^(−c))`, `x = e₂` | `e^(−c)` vs `e^(−c)`; whole space `e^(−c) = |det A|_𝔸` | holds |
| 2.5a "names for adelicSymmetricPowerHeight" | DAT lines 1319–1323; `ℚ(i)`, `A = 1`, `x = (1,1)` | §2.5: Euclidean at ∞, `[K:ℚ]`-normalised: `√2^(2/2) = √2`; 2.5a: `√2` | same height |
| 2.5a, cited §2.5 paragraphs | DAT lines 1319–1331, 1347–1353 | extension invariance in the first; `absoluteAdelicMinima` and dual identity in the second | located |
| 3.1, `μ` read from SubspaceTheorem §4.2 | §4.2 lines 846–848; `ℤ ⊂ ℚ`, `B = [−1,1]` | §4.2: inf over `t > 0`, junk `0` for `l ≥ card ι`; Lean `μ 0 = 1`, `μ 1 = sInf ∅ = 0` | agrees |
| 3.1, DAT §2.8 gives `μ l ≤ λ (d l)` | DAT lines 1777–1780; `ℚ(i)`, `𝓞²`, polydisc | j-th (1-based) among first `D(j−1)+1` = 0-based index `≤ d·l`; `μ₁ = 1 ≤ λ₂ = 1` | holds |
| 3.1, upper bound + attainment give §2.5's fixed-field estimate | `ℚ`, `n = 1`, `A_∞ = 2`; `ℚ`, `A_3 = 3` | `μ₀ = 2`, `2·1 ≤ 2·1`, `H_A(1) = 2`; `Λ = ⅓ℤ`, `⅓·2 ≤ 2·⅓`, `H_A(⅓) = ⅓ = |det A|_𝔸` | holds |
| 3.1 (sample), Check 2 | `ℚ`, `ℤ²`, closed unit disc | `μ₀ = μ₁ = 1`; lower `2²/2!·1 = 2`, middle `π`, upper `4`: `2 ≤ π ≤ 4` | holds |
| Bombieri–Vaaler Thm 3, (3.16), Thm 6 (sample) | BombieriVaaler1983 lines 325–356, 511, 517–523 | Thm 3 p. 18: open, convex, symmetric, bounded `S_v`; (3.16) p. 22; Thm 6 p. 23 | match lines 122–126 |
| C02, index entry vs scope | family README lines 56–58; README line 188 | entry: "duality and behaviour under extension"; scope: both DAT §2.5's | contradicts |
| C03, family index | 41 copies (40 heads and this one) | 6 distinct texts: 15, 17, 4, and 4 singletons; this vs the 17: 24 lines differ | diverges |
| C04, supplier of the new clause | lines 45–48, 77–78, 95, 186, 192–208 | §1.12, §1.14 cited in the clause; absent from *Needs:*, Dependencies, contracts and scope | omitted |

The rows of the previous review for the four theorems of `Suggested.lean`, the remaining Checks of 2.5a and 3.1 and the negative controls stand as in the previous review of `3fc2cd2`: the diff changes no Lean statement and no Check.

- Source locators checked against the text: 3 (BombieriVaaler1983, Theorem 3 p. 18, condition (3.16) p. 22, Theorem 6 p. 23).
- Library declarations opened at the pins: Tau Ceti `Height/Twisted/Determinant.lean:45` (`deltaL`), `Height/Twisted/Basic.lean:182` (`twistedHeight`), `Global/Places/Basic.lean:82, :252` (`Place`, `normAbs`), `MinkowskiSecond.lean:626, :728`, `Extraction/Basic.lean:106`, `ApproximationDomain.lean:224`, `Adeles/Extension.lean:184`, `Ideles/Norm/Basic.lean:283`.
- Cross-roadmap citations resolved: DAT §0.0, §2.5 (twisted height, `deltaL`, both paragraphs on adelic heights), §2.8 (`siegelBasisExtraction`) on main; SubspaceTheorem §4.2 on main; ArakelovGeometryAndAbelianHeights §§1.12, 1.14 on main; GlobalNumberFields Layers 6, 8 on main and at #1339; SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.1, 4.3, 4.3a at #2880.
- Automatic checks: all passed in the worker's run; my own run flags only the three family-index files as outside the folder (set aside below). Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else. The diff changes one docstring sentence only, so the elaborated types compared with the README in the previous review are unchanged.
- No file outside the roadmap folder and the family index changes.

Overlap check: I read SlopesOfHermitianVectorBundles (#2880), SubspaceTheorem (main), DiophantineApproximationAndTranscendence §§0.0, 2.5 and 2.8 (main), GlobalNumberFields Layers 6 and 8 (main and #1339), ArakelovGeometryAndAbelianHeights §§1.12 and 1.14 (main) and ChowFormsAndHeightsOfSubvarieties §6.2 (#2891). SuccessiveMinima and HeightsForLogSingularMetrics (#2894) stand as in the previous review. Shared objects and their owners:
- the height `H_A`, its extension invariance, the absolute minima and the dual identity: DAT §2.5, cited here;
- the `K`-minimum, and Minkowski's theorem over `K` for approximation bodies: SubspaceTheorem §4.2, cited here;
- the real Minkowski halves: DAT §0.0, realised in Tau Ceti and cited;
- the extraction lemma: DAT §2.8, realised in Tau Ceti and cited;
- the height `h_ℒ̄` of a point: ArakelovGeometryAndAbelianHeights §1.12, cited here (C04 asks for its *Needs:* entry).

ChowFormsAndHeightsOfSubvarieties §6.2 defines heights of cycles in the projective space of a Hermitian bundle by intersection numbers. It neither cites nor restates 2.5a, and 2.5a states only the comparison of its own height with §1.12's for points. SlopesOfHermitianVectorBundles consumes 2.5a and 3.1.

Source independence: changed passages only. 7 changed passages were compared with 1 source (BombieriVaaler1983) and with the roadmap texts they cite, and none is shared. The passages are the new sentences of 2.5a on names, on the Arakelov height and on the determinant product, the citation paragraph of 2.5a, the definition sentence of 3.1, the §2.8 comparison sentence, and the fixed-field remark. The only common wording is the name of DAT's target "fixed-field adelic basis estimate". The largest share is still BombieriVaaler1983, 2 of 3 locators. The arrangement was not compared again, because the diff adds, removes and reorders no layer.

Research link: 3.1 is Bombieri and Vaaler's adelic Minkowski second theorem (1983, Theorems 3 and 6), extended to bodies balanced over the completions; SlopesOfHermitianVectorBundles uses it for the successive minima of Hermitian vector bundles. 2.5a names the twisted height of Roy and Thunder's absolute Siegel lemma (1996). This rests on the README's References and on Bombieri–Vaaler.

## Not verifiable

- Roy and Thunder, An absolute Siegel's lemma (1996): not in this roadmap's manifest. An earlier round found only GDZ's cover sheet and a paywalled DOI, and I did not search again. The roadmap cites it only through DAT §2.5, so the constant of the fixed-field estimate in the remark of 3.1 (lines 133–136) was not compared with Roy and Thunder's.
- Bombieri and Gubler, Heights in Diophantine Geometry (2006), Appendix C.2: only the publisher's page is available; it is cited only through SubspaceTheorem §4.2.

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder flags the three files of the family index (`README.md`, `Suggested.lean`, `metadata.toml` of RiemannHypothesisForDirichletLFunctions), which belong to this pull request.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–17) takes the Riemann hypothesis for Dirichlet L-functions as its end theorem and follows a formal proof by Levent Alpöge announced on 20 November 2026. It links a remark and a GitHub repository, and gives no refereed source.
- This sub-roadmap's own mathematics rests on Bombieri–Vaaler (1983), Roy–Thunder (1996), Bombieri–Gubler (2006) and on roadmaps on main. It does not depend on that announcement.
- Two roadmaps will carry two proofs of Minkowski's second theorem over `K`, by the same route: SubspaceTheorem §4.2 on main for approximation bodies, and 3.1 here for all balanced bodies (README lines 99, 130–145).
