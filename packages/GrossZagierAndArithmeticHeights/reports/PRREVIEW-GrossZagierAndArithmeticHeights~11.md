# Review of GrossZagierAndArithmeticHeights (pull request #1487 at a638fad)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired and the repairs introduce no finding. Section 6.20a now takes the canonical model of the GSpin Shimura variety from the abelian-type section of ShimuraVarieties, with Deligne's Proposition 2.3.10 as the Hodge-type witness, and the Borcherds product has one owner, with its integral extension left to ComplexMultiplicationAndExplicitReciprocityPartII §4.2a. There is one small correction and no format note. The locators into the Yuan–Zhang–Zhang book remain unread and are left to the human reviewers.

## C01 — For even p the centre of GSpin(U) is larger than 𝔾_m, so "the centre Res_(F₀/ℚ) 𝔾_m" in 6.20a names the central torus, not the centre

The new sentence of 6.20a (line 1983) says the weight cocharacter has "values in the centre Res_(F₀/ℚ) 𝔾_m". For p = 2 and the reduced-norm space of B, the case 6.20 uses, GSpin(U) is the group of pairs (b₁, b₂) with equal reduced norms, and its centre is the group of scalar pairs (a, b) with a² = b², which is 𝔾_m × μ₂; for every even p the centre of GSpin(U) contains the scalars 𝔾_m with finite index greater than one. The argument is unaffected, since the weight does take values in the scalars and the Galois action on them is the one used. Write "the central torus Res_(F₀/ℚ) 𝔾_m of scalars". (The previous report used the same phrase.)

## Previous findings

- R01 — repaired: line 1983 cites "ShimuraVarieties §§6.7 and 8.1" and says "The datum (G′, D′) is of abelian type … (Del79 Proposition 2.3.10, pp. 272–273)"; line 2010 and the supplier row (5461) cite §6.7. The repair raises only C01.
- R02 — repaired: the scope paragraph (5396) says item (e) owns the product "on each connected component of the complex GSpin Shimura variety" and that its extension over an integral model "is not a target here"; Downstream consumers (5393) names §4.2a.
- C01 (previous) — repaired: the locator of 8.11 (line 4695) reads "Erratum items 1, 2 and 16", and 8.14 (line 4717) cites "items 2 and 5".
- C02 (previous) — repaired: lines 192 and 5445 now say "the rationality and reciprocity action of special points in the canonical-model condition `CanonicalModel` of §4.4".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 6.20a carrier: abelian type | F₀ real quadratic, p = 1; p = 2; p = 4; p = 6 | p = 1: G′ = Res B^×, derived Res SL₁(B), type A₁; p = 2: A₁ × A₁; p = 4: D₃ = A₃; p = 6: D₄, vector node, D^ℝ; Spin simply connected | abelian type; Del79 lines 1161–1168 give a Hodge-type cover with simply connected derived group for A, B, C, D^ℝ |
| 6.20a carrier: not Hodge type for F₀ ≠ ℚ | [F₀ : ℚ] = 2 | weight (1, 0) in Res 𝔾_m; conjugate (0, 1) ≠ (1, 0); a rational closed immersion carrying it to a rational scalar forces invariance | sound; centre wording C01 |
| 6.20a carrier at F₀ = ℚ | p = 3 | Hodge type, its own witness; §6.7 of ShimuraVarieties covers every abelian-type datum of its §P.1 | §6.7 alone suffices |
| ℚ-simple factors | p = 2, discriminant square and nonsquare d | square: adjoint Res PB^× × Res PB^×, h nontrivial in both; nonsquare: F₀(√d) totally real since d > 0 at every real place | Deligne's construction applies factor by factor |
| 8.11 root-number convention | erratum item 2 | yzz-erratum-pku lines 13–20: η_v(−1) removed from Σ(A, χ); README: ε ≠ χ_v(−1) | agrees |
| 8.14 sign condition | erratum items 2 and 5; λ² | yzz-erratum-pku lines 33–42: ε = χ(−1)ε(B), ratio of the two conventions η(−1); README: λ(K_v/F_v, ψ_v)² = η_v(−1) | agrees |
| 6.20a(e) ownership | §4.2a of ComplexMultiplicationAndExplicitReciprocityPartII at its open head | line 525 takes the product and Z(f) = c_f(0,0)·c₁(ω) from §6.20a(e), proves only descent, metric identity, vertical support; maximal lattice at line 505 | one owner; the two texts agree |
| `canonicalHeightRat_exists_unique` | elaborated signature | K, Field, AdmissibleAbsValues, DecidableEq, W, IsElliptic; unchanged by the diff | as README §0.2 |

The rows for the statements the diff does not touch stand as in the previous review, of `9489bba`.

- Source locators checked against the text: 3 (Del79 Proposition 2.3.10, printed pp. 272–273, with Table 2.3.8 and Théorème 2.7.20; yzz-erratum-pku items 2 and 5). No target of the seeded sample falls in a changed passage.
- Cross-roadmap citations resolved: ShimuraVarieties §6.7 (`TauCetiRoadmap/ShimuraVarieties/README.md` line 1897, every abelian-type datum of §P.1) and §4.4 (`TauCeti.Shimura.CanonicalModel`, line 1198) on main; ComplexMultiplicationAndExplicitReciprocityPartII §4.2a at its open head (lines 523–541, 942, 1060, 1076), which cites §6.20a(e)–(f) of this roadmap and constructs no product of its own.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: one warning, `declaration uses sorry` at line 43. The file is unchanged since the previous head, so the one-tactic probe of the previous review stands.
- Pull request text: the title and description still describe the head (a new roadmap; no section, declaration or supplier roadmap added or removed by this change); nothing to correct.

Overlap check: read GrossZagierAndArithmeticHeightsPartII, HeegnerPointEulerSystems, MetaplecticAutomorphicForms, RankOneConverse, AutomorphicCongruences (open) and HilbertModularVarietiesAndShimuraCurves, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors (main), as in the previous review; nothing shared. Outside the lists, the orthogonal Borcherds product over ℚ: owner this roadmap (§6.20a(e)), cited by ComplexMultiplicationAndExplicitReciprocityPartII §4.2a, which keeps the integral extension.

Source independence: changed passages only; 3 passages compared with 2 sources (Del79, yzz-erratum-pku), none shared beyond formulas; largest share gz86, 157 of 427 linked locators; the diff adds, removes and reorders no layer, so the contents comparison with gz86 stands: independent. The Yuan–Zhang–Zhang book could not be read.

Research link: Layers 6–8 prove the formulas of Gross–Zagier (1986), Yuan–Zhang–Zhang (2013) and Cai–Shu–Tian (2014); §6.20a is Yuan–Zhang–Zhang (2009) with Borcherds (1998, 1999); Layer 9 is Bertolini–Darmon–Prasanna (2013) and Brooks (2015), as used by Skinner (2020) and Jetchev–Skinner–Wan (2017). Rests on the README's sources and the texts read.

## Not verifiable

- `yzz-book` (waived): the locators of 6.20 into its §§4.2–4.3, Theorem 1.2 and Theorem 1.3 (8.11, 8.14), Theorem 7.4 (2.12) and Theorems 3.17, 3.22, 5.7, 7.8 were not read; the erratum's items 2 and 5 were read, the book pages they correct were not.
- `yzz-draft` (waived), `argos` and `blr` (uncertified): not read.
- McGraw03 (Math. Ann. 326): paywalled; the rationality statement of 6.20a(f)(ii) was not compared with it.
- The description's sentence on review and red-team rounds: not checkable from the files.

## Source issues

- none

## For the human reviewers

- Not tested: `yzz-book` is waived, so its 30 locators (for example `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` lines 1977 and 4695) were never compared with its text; the second-largest proof source of Layers 6–8.
- Licence: Del79 is read from a scan of the published article on the Institute for Advanced Study's publications site, and YZZ09 from archive.ymsc.tsinghua.edu.cn; the source manifest classes both as institutional copies.
