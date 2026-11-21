# Review of SlopesOfHermitianVectorBundles (pull request #2880 at 5a7a036)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles/`
**Verdict:** needs changes

**Summary.** I recomputed every Check and worked example in Layers 1–6 and found no false statement, no missing hypothesis and no upward or cyclic supply. The one finding is about citations: no target carries a source locator. The results taken from the literature, and those taken from the formal proof, cannot be traced to a theorem and a page or to a file and a declaration. There are four small corrections (two misattributions of what another roadmap owns or consumes, dead links to roadmaps of the family that have not been filed, and one sentence of the description) and no format notes. The human reviewers have to decide on the status and licence of the formal proof, which is the only source named for Layer 5 and for 6.7–6.7b.

## R01 (P2) — No target carries an exact source locator, so none of the results attributed to the literature or to the formal proof can be traced

A reader or implementer who wants the source of a statement (its hypotheses, its normalisation, a proof to follow) has nowhere to look. A referee cannot check that a source supports a statement as written: for each of the fifteen sampled targets (1.2a, 1.3a, 1.4, 1.6, 2.3, 2.4, 3.2, 3.4a, 3.5, 4.1, 4.2, 4.3, 5.4, 5.7, 6.3a) there was no locator to verify. I searched the README for theorem, proposition, lemma and page numbers of a source and found none. The in-text attributions are names and years, such as "(Stuhler 1976; Grayson 1984)" in the route of 3.2 (line 381). The References (lines 1100–1116) give only the roadmap sections each work covers, with no journal, volume, pages, DOI or URL. The formal proof is cited as a whole: "Its slope inequality for families of maps is the source of 5.3–5.7" (line 1115), with no file or declaration. This matters most there, because 1.2a (iii), 5.3–5.7 and 6.7–6.7b have no other source.

The locators exist and are short to add. In Bost, Séminaire Bourbaki 795 (Astérisque 237, 1996, open on Numdam):
- Prop. 4.3, p. 131: 2.4 (b)–(c) for maps with `φ(E) ⊂ F`, measured by archimedean norms only;
- Prop. 4.4, p. 132: the filtered form 2.5;
- Prop. A.1, p. 148: the canonical filtration 3.2;
- Prop. A.2, pp. 148–149: its base change 3.5.

In Gaudron, Rend. Sem. Mat. Univ. Padova 119 (2008), also on Numdam:
- Lemme 6.4, p. 78: 2.4 (b) with heights at all places;
- Prop. 6.6, p. 79: the filtered inequality;
- Prop. 5.13, p. 70: the canonical filtration;
- Lemme 7.3, p. 83, with the monomial norms on p. 84: the symmetric-power slope formula of 1.7 and the norms of 1.3a (ii).

The smallest repair has four parts:
- At each target whose result appears in a source, give the theorem and page in parentheses at the claim.
- For 1.2a (iii), 5.3–5.7 and 6.7–6.7b, give the file and declaration of the formal proof.
- Where a target is the roadmap's own and its route is written out in full, say so once.
- Complete each References entry with journal, volume, pages and a DOI or open URL.

## C01 — The Bost–Gillet–Soulé comparison, and its form over a coordinate bundle, are assigned to the wrong roadmap

In Downstream consumers (line 1038) the comparison of the Fubini–Study height of a cycle with the spherical height of its Chow form "belongs to HeightsRationalPointsAndObstructions as well, and so does its form over a Hermitian coordinate bundle". HeightsRationalPointsAndObstructions, at its head (#1017), states neither: it has no spherical height or Mahler measure of a Chow form. The family's ChowFormsAndHeightsOfSubvarieties (#2891) states both, in §6.1 and §6.2. Its Scope and ownership claims them and cites this roadmap's 6.6 and 6.7a for the spherical heights. Would name ChowFormsAndHeightsOfSubvarieties §§6.1–6.2 there.

## C02 — FaltingsFinitenessAndIsogenyTheoremsPartII is called a consumer, but it comes earlier in the merge order and asks ArakelovGeometryAndAbelianHeights for these statements

The overview (line 13) and Downstream consumers (line 1036) say that FaltingsFinitenessAndIsogenyTheoremsPartII uses 2.1, 2.4 (a), 3.5, 4.5 (b2) and 1.3a (iv). At its head (#1738), that roadmap declares these needs as gaps addressed to ArakelovGeometryAndAbelianHeights (its Exact supplier contracts, README lines 1147–1153). The gaps are hermitian-maximal-slope-existence, hermitian-morphism-slope, hermitian-metric-rescaling and hermitian-symmetric-power-slope. The last asks for `μ̂_max(SymⁿĒ) ≤ n(μ̂_max(Ē) + 2 log r)` at every rank `r`. 4.5 (b2) gives that only for `r ≤ 2`: at `r = 3` its constant is `log 3 + 3 log 2 ≈ 3.18`, against `2 log 3 ≈ 2.20`. The candidate merge order puts that roadmap before this one, so as things stand it cannot consume these statements from here. Would say that it needs these statements and has asked ArakelovGeometryAndAbelianHeights for them, with the constant it asks for. The two roadmaps would then agree which of them answers the gaps, so that the maximal slope and the morphism inequality keep a single owner.

## C03 — Links and section numbers point at roadmaps of the family that have not been filed

The overview (line 13) links to `../ThetaChainsAndFrobeniusPrimeSums/README.md`, `../GluedTargetAndDivisionInequality/README.md` and `../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md`. Downstream consumers (line 1034) cites §§9.6, 5.20, 5.21, 8.9, 7.13, 7.14, 8.21, 3.8 and 8.18e of five such roadmaps. Scope and ownership (line 1046) assigns objects to BesselPoincareSeriesAndGramBounds and RowTowerAndRallisIdentities. None of these roadmaps exists on main or in an open pull request; the family index lists them as later roadmaps. Would describe them as later roadmaps of the family, without section numbers until they are filed.

## C04 — The description's validation paragraph describes a build output the head does not produce

The description says "the targeted Lake build succeeds with `sorry` as the only warning". `Suggested.lean` declares nothing, and elaborating it produces no message at all. Right text: "the targeted Lake build succeeds with no warning (`Suggested.lean` declares nothing)".

## Verified sound

| Target | Instances tried | Values computed (README / mine) | Result |
|---|---|---|---|
| 1.2a gluing lemma | (i) ℚ(i), `L = O_K`, `L′ = (2+i)⁻¹O_K`; (ii) ℚ, `L = ℤ`, `H = (4)`; basis local at one prime only | (i) `1 + 0 = −v_𝔭(1/5) = 1`; (ii) `½·(−2)·log 2 = −log 2 = deĝ`; wrong basis gives `δ = −log 5` | holds; formal proof cited without declaration (R01) |
| 1.3a symmetric powers | `Sym²(ℤ²)`; `Sym²` of two trivial lines | squared norms `1, ½, 1`; slopes `0, ½ log 2, 0 ≤ log 2`; Gaudron 2008 p. 84 gives the same monomial norms | holds; no locator |
| 1.4 degree along a map | `2·id`, `diag(1,2)` on ℤ² | `h = 0`, `0 ≤ 0`; `h = log 2`, `0 ≤ 2 log 2`, `‖Λ²φ‖ = 2 < 4` | holds; no locator |
| 1.6 large degree | ℤ², bound `−½ log 2` | exactly six: `0`, `ℚ²`, four primitive lines with `a² + b² ≤ 2` | holds; no locator |
| 2.3 image form | `id`; first projection of ℤ² | both sides `μ̂_min(Ē)`; `0 = 0` | holds; no locator |
| 2.4 Bost's inequality | ×2 on trivial line; ℚ(i) identity `Ō_K → (O_K, 2|·|)`; projection with `‖e₁‖ = e^(−c)` | `0 ≤ 0`; `0 ≤ −log 2 + log 2`, unnormalised `0 ≤ −log 2` false; (b) fails without injectivity | holds; Bost 1996 Prop 4.3 p. 131, Gaudron Lemme 6.4 p. 78 uncited |
| 3.2 HN filtration | `(ℤ,e^(−c))² ⊕ ℤ`; `ℤ ⊕ (ℤ,e^(−c))` | `0 ⊊ ℚe₁⊕ℚe₂ ⊊ ℚ³`, slopes `c > 0`; `0 ⊊ ℚe₂ ⊊ ℚ²` | holds; Bost 1996 Prop A.1 p. 148, Gaudron Prop 5.13 p. 70 uncited |
| 3.4a Galois descent | ℚ(i)/ℚ, lines `M(1,i)`, `M(1,1)` | first moves to `M(1,−i)`; second descends to `ℚ(1,1)`; both Tau Ceti names exist at pin | holds; no locator |
| 3.5 base change | ℤ² over ℚ(i), line `(1,i)`; ideal `(1+i)` | relative height `2`, normalised degree `−½ log 2`; `−½ log 2` unchanged | holds; Bost 1996 Prop A.2 pp. 148–149 uncited |
| 4.1 Minkowski over `K` | `(ℤ, ρ|·|)`; `Ō_ℚ(i)`; ℤ² | both bounds `log ρ`; `log(2/√π) ≥ 0`; `log(2/π) ≤ 0 ≤ log(4/π)`; constants match AHSM §3.1 | holds; no locator |
| 4.2 minima vs slopes | `ℤ ⊕ (ℤ,e^(−c))`; `A₂` | `λ = (e^(−c),1)` against slopes `(c,0)`: equality; `c(ℚ,2) = log(4/π) ≈ 0.242`; κ estimate rederived | holds; no locator |
| 4.3 absolute minima | rank one; `ℤ ⊕ (ℤ,e^(−c))`; ℤ² | `s = (1,2)`: constants `0`, `log 2`; ℤ²: `s = (2,2)`: `½ log 2`, `log 2` | holds; no locator |
| 5.4 rank at one place | `e₁, e₂, −e₁−e₂` in ℤ², one deleted | `e = η = 0`, `Q = (3/2)·1`; codim `0 ≤ 2·(1/3)·2 = 4/3` | holds; formal proof, no locator |
| 5.7 compression | `ϖ = 1/20`, `ϑ = 1/4`, `η = 5ϖ`, `√e = ϖ/2` | `κ = 0.2625/0.975 = 0.269`; `η′ = 1.25/0.731² − 1 = 1.34 ≤ 1.55` | holds; formal proof, no locator |
| 6.3a Fekete with error | `⌊n/3⌋` with `a₄ = 0`; `nμ + C log(n+1)`; `−n log n` | pair `(1,3)` not comparable, limit `1/3`; `(n+1)(m+1) ≤ (n+m+1)²`; `f(2n) ≥ 2n log 2` diverges | holds; de Bruijn–Erdős cited without theorem |
| Headline (1) HN | as 3.2–3.5 | polygon `(0,0),(1,c),(2,c)`; `A₂` slopes `0.0719` twice | not statable at pins (no Hermitian bundle carrier in Mathlib or Tau Ceti); docstring names it |
| Headline (2) slope inequality | 2.4; 2.5 with `φ₀(x) = x₂` into `(ℤ,e^(−a))` | `h(φ₀) = −a`, bound `a − a + 0 = 0 ≥ 0` | not statable; docstring names it |
| Headline (3) minima, tensor, Sym | `Sym²(ℤ²)`, `Sym³(ℤ³)`, `(ℤ²)^⊗m` | `0.347 ≤ log 2`, `≤ 2 log 2`, `≤ 4 log 2`; `½ log 6 ≤ 3 log 3`; `m·1.5 log 2` | not statable; docstring names it |
| Headline (4) nearly tight frame | one isometry; orthogonal sum; `Ē ⊕ L̄`; `H < 0`; zero lift | `η = 1/d` gives `H/d` against actual `H/(d+1)`; `H < 0` false; `Q = 0` gives `0 ≥ 1` | holds; not statable; docstring names it |
| 6.7a (iv) | ℙ¹ frame `a = 2`, `T = 3` | `−3.06 ≥ −7.35`; opposite sign `−0.42` false; slope `−0.77 ≥ −2.78`; 6.7 through coordinates `−10.82` | holds |
| 4.5 (C02) | ranks 2, 3 against the gap `2 log r` | (b2): `2 log 2` at `r = 2`; `3.18 > 2.20` at `r = 3` | matches gap for `r ≤ 2` only |

- Source locators checked: none present in the README; 8 statements located in Bost 1996 (lines 466–499, 775–835 of its text) and Gaudron 2008 (pp. 70, 78–79, 82–84).
- Library declarations opened at the pins (25), among them: Tau Ceti `LinearAlgebra/SymmetricPower/Basic.lean:109,191,233,243,252` and `Basis.lean:162,187,192`; `RepresentationTheory/GaloisDescent/Span.lean:41`, `Range.lean:40`; `Algebra/Module/ZLattice/Covolume.lean:273`. Mathlib `RingTheory/MvPowerSeries/GaussNorm.lean:241` (its dominance hypothesis holds at the lexicographically least maximising exponents, as claimed); also `Polynomial/GaussNorm.lean:277`, `Integrals/PosLog.lean:169`, `HaarToSphere.lean:88`, `DedekindDomain/PID.lean:167`, `PrincipalIdealDomain.lean:440`, `Analysis/Subadditive.lean:155`.
- Two cited names are not in Tau Ceti at the pin: `subspaceHeight_inf_mul_sup_le` and `IntegralQuadraticLattice.mem_iff_local`. Both are targets of DiophantineApproximationAndTranscendence §2.5 and GeometryOfNumbersAndQuadraticArithmetic §2.2.4, and are cited as such.
- Cross-roadmap citations resolved (31), on main unless a head is named:
  - ArakelovGeometryAndAbelianHeights §§1.1–1.6, 1.12–1.13;
  - DiophantineApproximationAndTranscendence §§0.2, 1.3, 2.5 (`absoluteAdelicMinima` with `2^(n(n−1)/2)`, the dual-height identity, `det Sym^r A`);
  - AdelicHeightsAndSuccessiveMinima §§2.5a, 3.1 (head of #2883);
  - SubspaceTheorem §§4.1–4.2; SuccessiveMinima §0.1; GeometryOfNumbersAndQuadraticArithmetic §§0.3, 2.2.4;
  - HermitianFormsAndLattices §§4.0 (f), (g), 4.0b (head of #2882);
  - SchemeAndStackFoundations §4.18; JacobianChallenge C.1–C.2; BanachSpaceTheory B7;
  - HeightsRationalPointsAndObstructions §§5.9b, 5.10c, 5.17–5.17f (head of #1017); AL.3.10.5; AutomorphicSpectralTheory §6.22c.
  - 9 consumer citations point at roadmaps not yet filed (C03).
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file has no declarations, so there was nothing to `#check`. Its docstring names all four headlines and the carriers they lack.
- Family index identical to its copies at the heads of #2882, #2883 and #2891; no change outside the family folder.
- Ownership: no roadmap on main, and none of the open heads I read, states `μ̂_max`, the Harder–Narasimhan filtration or the slope inequality for Hermitian vector bundles over `O_K`; this roadmap is their owner (C02 records FaltingsFinitenessAndIsogenyTheoremsPartII's gaps).

Overlap check: read AdelicHeightsAndSuccessiveMinima, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics, FaltingsFinitenessAndIsogenyTheoremsPartII, RiemannHypothesisForDirichletLFunctions (family index), ArakelovGeometryAndAbelianHeights, DiophantineApproximationAndTranscendence, HeightsAndUnits.
- Spherical heights and heights relative to a coordinate bundle are owned here; ChowFormsAndHeightsOfSubvarieties cites 6.6 and 6.7a and owns the Bost–Gillet–Soulé comparison (C01).
- Adelic heights and minima over `K` are owned by AdelicHeightsAndSuccessiveMinima, cited here.
- The `½(H_n − 1)` absolute Siegel lemma is owned by HeightsForLogSingularMetrics; it is a different statement from 4.3.
- Maximal slope, the morphism inequality and the Sym bound are owned here and requested from ArakelovGeometryAndAbelianHeights by FaltingsFinitenessAndIsogenyTheoremsPartII (C02).
- Nothing else is shared.

Source independence: 9 passages compared with 2 sources (Bost 1996: 2.4, 2.5, 3.2, 3.5 and the Sym bound of 4.5; Gaudron 2008: 2.4, 2.5, 4.5, 1.3a (ii)), none shared; the README is in English and in its own words, the sources are in French. Shares are counted from the References' section attributions, since there are no locators: largest share [FormalProof], 9 of 44 (not readable), then Bost 1996, 7 of 44. Contents compared with Bost 1996 and Gaudron 2008 (§§2–7): independent. The layer order is forced by the `*Needs:*` lines (1.5 and 1.6 before 2.1, 2.1 before 3.1, 3.3 before 4.2 and 5.1).

Research link: Layers 2–4 are Bost's slope method, used for the Masser–Wüstholz period theorem (Bost 1996, §4.3 and App. A), and its adelic form (Gaudron 2008, Lemme 6.4, Prop. 5.13, Thm 7.1); 6.4 is Chen's convergence of maximal slopes (Chen 2010). This rests on the README's References and the two texts I read.

## Not verifiable

- [FormalProof] (a GitHub repository) and [Announcement] (a PDF on alpo.ge): the sources service does not classify either host, and I did not open them. I checked 1.2a (iii), 5.3–5.7 and 6.7–6.7b by my own computation only.
- Stuhler 1976, Grayson 1984, Bost 2001, Bost–Künnemann 2010, Chen 2010, Gaudron–Rémond 2014, Borek 2005, de Bruijn–Erdős 1952, Philippon 1991 and Bost–Gillet–Soulé 1994 were not fetched: the README cites no theorem or page in them to check.

## Source issues

- none

## For the human reviewers

- Licence: the only source named for 1.2a (iii), 5.3–5.7 and 6.7–6.7b is a Lean repository (github.com/leanprover-community/riemann-hypothesis) and an announcement PDF dated 20 November 2026 (README lines 1115–1116). Neither host is classified by the sources service. The repository's licence and status were not checked.
- Scope: Layers 1–4 and 6.1–6.5 rest on refereed literature (Bost 1996 and Gaudron 2008 read). No refereed source is named for Layer 5 or for 6.7–6.7b, which serve the family's announced proof.
- Not tested: the source with the largest share of the References' attributions, [FormalProof] (9 of 44), could not be read. Wording and arrangement were not compared with it.
