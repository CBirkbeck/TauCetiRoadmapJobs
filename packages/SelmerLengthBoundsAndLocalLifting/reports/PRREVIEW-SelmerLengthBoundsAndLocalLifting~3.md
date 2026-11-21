# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at ca61597)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding. The sub-statements that rest only on the formal proof still have no locator into it, although module-level names exist. These include (G), (D1) and (D2) of 4.9c, (U)_s and (H)_s of 4.10e (0), the inputs of 4.10d (4) and the component statements of 4.10f. This head repairs every other finding of the previous round. Recomputing the Checks, examples and round bounds of the fifteen sampled sections found no false mathematics. There is one small correction (4.10e omits a PadicPeriodRings citation) and no format note. The human reviewers decide two questions: the scope, since the roadmap rests on a formal proof announced on 20 November 2026 with no written proof, and that proof's licence.

## R01 (P2) — The sub-statements that rest only on the formal proof still have no locator into it

Re-raised: R03

The README marks many sub-statements as statements of [FormalProof] whose proofs are not given here. For each of them the formal proof is the only support, and an implementer who has to port one must find it in a formalisation of about 2.7 million constants spread over some 186,000 modules:
- (G), (D1) and (D2) of 4.9c;
- the frame of 4.9d;
- the denominator bound in the clause on poles of 4.10c (2);
- the constant `800` of 4.10d (1);
- the universal part, the one-coordinate lifting and five of the seven cases of 4.10d (3);
- the inputs (a)–(c) of 4.10d (4);
- (U)_s, (H)_s, the exactness clauses of (S)_s and the converse half of (Herr)_s in 4.10e (0);
- the eleven component statements of 4.10f;
- 3.25b (2).

The body cites [FormalProof] 24 times and never names a module or declaration (for instance lines 717, 1058, 1370–1372 and 1499–1500). The description now says that these statements "cite it as a whole, without declaration-level locators". That records the choice but gives no reason the locators cannot be given, and they can: the operator's copy of the formal proof lists its modules by name, among them:
- `Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.SelmerPresentationMatrixOfGaloisCohomology`, whose name matches 3.22 (2);
- `Development.AbelianVarietyTheory.Proofs.SatakeParameters.AlternatingWordLargeSizeNumericalBounds` and `…AlternatingWordHypothesesEveryLatticeSurjection`, matching 4.10d (4);
- `Development.AbelianVarietyTheory.Proofs.SatakeParameters.CyclicWordMarkedClustersOfAtMostTwoInWindow`, matching the cluster condition of 4.10d (2).

The smallest change has two parts:
- at each of the sub-statements listed above, name the module or declaration of the formal proof that it transcribes;
- say once, in the [FormalProof] entry of the References, which release those names refer to: the GitHub repository at a stated commit, or the tarball named in the announcement.

## C01 — 4.10e uses `B_cris`, but neither its *Needs:* line nor the Layer 4 Dependencies name PadicPeriodRings §§4.1–4.3

An implementer who reads 4.10e's *Needs:* line (lines 1458–1460) is not told that the clause on poles of (Herr)_s needs `B_cris`. The route uses it twice: the denominators are "units in `B_cris`", and the class is shown to be a coboundary "in `V ⊗ B_cris`" (lines 1416–1417). The contract "From TauCetiRoadmap.PadicPeriodRings" (line 1669) already lists 4.10e (0) as a user, but the Layer 4 Dependencies (line 1586) say "PadicPeriodRings §§4.1–4.3 (4.10c, 4.10f)". Add PadicPeriodRings §§4.1–4.3 to the *Needs:* line of 4.10e, and add 4.10e to that parenthesis.

## Questions for the author

- The announcement points to tarballs of the code on its author's site, while the [FormalProof] entry gives a GitHub repository. Are these the same code, and at which commit should the module names asked for in R01 be read? I read neither. The operator's copy is a kernel export, which gives module and declaration names but no readable statements.

## Earlier findings

- R01 of the previous round (4.9a restated AnabelianGeometryAndNonabelianChabauty §4.6): **repaired**.
  - 4.9a now states that `H¹_g`, the inclusion, functoriality and the extension criterion "are the target … of AnabelianGeometryAndNonabelianChabauty §4.6" (line 644).
  - It keeps only what §4.6 lacks: the form for an extension of a character, `E`-coefficients and lattices.
  - The consumer line (1599) and the ownership sentence are corrected.
- R02 (the docstring of `Suggested.lean` gave a false reason for unstatability): **repaired**.
  - The docstring now names `TauCeti.ContCohomology.SelmerStructure.selmerGroup`.
  - It gives as the missing carrier the module `T ⊗_O B`, twisted by a character, as a continuous representation, together with the maps induced by `t ↦ t ⊗ b` (lines 33–39).
  - At the pins neither library has a topology on tensor products, `B_cris`, or crystalline representations.
- R03 (no locators into the formal proof): **not repaired**, re-raised as R01.
- C01 (Fitting ideals attributed to Mathlib): **repaired**.
  - Lines 136–138 and the new `From Tau Ceti` contract cite `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker` and `Matrix.fittingIdeal_coker_zero_eq_span_det`, all present at the pin.
  - The inclusion along an exact sequence is now part of 3.25a, with a block-triangular proof (lines 465–469).
- C02 (`n ≥ 2` in the ramified-coefficients Check): **repaired** (`n ≥ 3`, line 1286).
- C03 (ceiling in the size-conditions Check): **repaired** (`2a(11, 110) + η + 1 < 65`, line 1298).
- C04 (de Rham dimension formula credited to SelmerIwasawaCohomology §4.9): **repaired**.
  - 4.9b and 4.10g cite PadicHodgeRegulators §1.5, which states the formula for de Rham `V`.
  - The 4.10b Check cites the de Rham orthogonality that SelmerIwasawaCohomology §4.9 states.
- C05 (description): **repaired**.
  - The description now says that the copies of the family index differ and that this roadmap's entry is the same in every copy; that entry is identical in all 40 heads.
  - The sentence about the build is gone.
- C06 (GluedTargetAndDivisionInequality missing from Downstream consumers): **repaired** (lines 1597–1598). GluedTargetAndDivisionInequality §8.19e and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d both cite 3.25b (2) and 3.26.
- N01 (reference key): **repaired** ("Berger 2004").
- N02 (section ids continue SelmerIwasawaCohomology's numbering): unchanged. It is form only and is not raised again.

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result | Change |
|---|---|---|---|---|
| 3.22 | (3) at `Λ′ = O`, functor `Hom(O/λ², −)`; generators of a principal ideal of a local ring | `n = 1`, `Φ = (λ²)`, coker ≤ `#Ext¹(O/λ², k) = #k`; `a = ub`, `b = va` ⇒ `u` unit or `a = b = 0` | holds | none |
| 3.23 | `n_Q = 1`, `Φ = [e_j] − 1`, `u` of order `p^m`; `u = 1` | both sides `e(O′/ℤ_p)/(p^{m−1}(p − 1))`; `𝐅(0) = 0`, both infinite | holds | none |
| 3.24 | (2) at `p = 2`, `N = 3`; (1) Frobenius at `𝔭`, `c𝔭` | `N(N−1)/2 = 3` odd, extra term; eigenvalues `ϑ`, `ϑ^{−1}` on `T̄`, `T̄^†`, none `1` | holds | none |
| 3.25a | bordered ring; new Fitting inclusion | `v_p C(p^M, k) = M − v_p(k)`: `≥ ν + 1` below `p^{M−ν}`, `ν` there; block-triangular minor = product of block minors | holds | none |
| 3.25b | Check 1 with `I` factors; `p = 3`, `m = D = v₀ = 1`; last clause of (1) | `X_1^I` coefficient `1`, zero at `(ζ^{p^i}, ζ)`; value `1/2`; `p^{e_q}/φ(p^k) = 1/φ(p^{M_q})` | holds | none |
| 3.26 | `[F(μ_p):F] ∤ tr`; `p = 2`; `t_sr_s = 0` | `ν_s = 0`; `χ̄_cyc = 1`, `ν_s ≥ 1`; `r_s ≥ 1` forces `t_s = 0`, clause 2 void | holds | none |
| 4.9a | `K = ℚ_p`, `V = E`, `η = χ_cyc`; reversed twist; route `W′ ⊆ W` | `h¹(E(−1)) = 0 + 0 + 1 = 1`; `D_dR = Fil⁰` ⇒ `H¹_f = 0`, split; `H¹_f(E(1))` a line | holds | none |
| 4.9b | `F` imaginary quadratic, `V = E(1)`; `ψ ≠ 1`; `ℚ(i)`, `p = 3` | LHS `2`, RHS `1`; corank difference ≥ `2 − 1 = 1`; `μ_4/3 = 0`, `Cl = 1` | holds | none |
| 4.9c | `e = s = 1`; `a` against `β`; (2) round bound; `p = 7`, `N = 91` | `β = −1`; `s ≤ 2s + 1`; rest ≤ `(2t+3)λ`, total ≤ `(n+1)(5t+7)λ`; `ord₁₃7 = 12`, `[K′:K] = 24` | holds | none |
| 4.9d | `ℚ_p(u)`; `μ_n ⊕ ℚ_p(1 − k)`; (2) bound | exponent `m + v_p(u)` against `m + v_p(u) + 2`; `ℤ/p^n ⊆ H⁰(V/T)`; `2 + 3nλ ≤ 20(n+1)λ` | holds | none |
| 4.10a | `n = 2`, `h = 60`, `p = 41`; rank of `H¹_f` | `σ_i = ⌊60/40⌋ = 1`, (P3) gives `η_i ≤ 30`, `60 > 39`; rank = number of negative weights = `d` | holds | none |
| 4.10b | `I = 0`, `I = H¹_f(T′)`; new Check | corank of `H¹(W)/F_W` = `dim H¹(V) − dim H¹_f(V)` = rank `H¹_f(T′)` by exact annihilators | holds | none |
| 4.10c | span `p − 1` lattice; generator count of (1); round bound at `p = 3` | `cost(0, p−1) = 1`, `e°_U = 1`, `e° = 3`; `([K:ℚ_p] + 1)·rk`; `H`-coefficient `3.75 ≤ 4` | holds | none |
| 4.10d | (4) size Check; last sentence of (4); two-letter Check | `a(11,110) = 29.35`, `64.7 < 65 ≤ 95`; `0.438B ≥ 9 + 2log₁₁(2.2B)` at `B = 100`; `3·rk·e + 8m·e′ + 3(…)` | holds | R01 |
| 4.10e | (1) at `p = 3`, `h = 1`; `E′` bound; round bound | `e_1 = 10 + 2 + 1 = 13`; `e_1 ≤ 18h − 2` at `p = 3`; `e_s ≤ 7Hs + 7H/(p−1) ≤ 14Hs` | holds | C01, R01 |
| 4.10f | `N = 2`, `η = r′ = 1`; `4r′ ≤ N²`; exponent sum | `k = 4 + 6 = 10`; `lcm(a′,b′) ≤ N²/4`, `N − 1 ≤ N²/4`; parts sum to `k` | holds | R01 |
| 4.10g | `U = E`, `K = ℚ_p`; generator count | `2e·length(O/p)`; `μ(M) ≤ rank M + rank L_U`, `rank M ≤ [K:ℚ_p]·dim U` | holds | none |
| Headline (1) | against 3.22 (2), 3.23; statability | same hypotheses and formula; `T ⊗_O B` with continuous action absent (no topology on tensor products at the pins) | consistent; not statable | none |
| Headline (2) | against 3.26 | (H1), (H2), (H5), (H6), balance, `ν_s`, `ε′·length(O′/p)` match | consistent; not statable | none |
| Headline (3) | against 4.9d (1) | `c = 2 + Σ_u(2s + n₀ + 1 + v_p(u))` matches; no crystalline representations at the pins | consistent; not statable | none |
| Headline (4) | against 4.10c (3), 4.10e (1′) | `23(2 + H/p + log_p(H+1))`; `32(2h·s_N + 1) + s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1` match | consistent; not statable | none |

- Source locators checked: BS23-FCRYS Theorem 1.2 (Theorem 5.6 in the body; every `p`) at BS23-FCRYS line 65, which matches. I read the announcement in the operator's copy. Bloch–Kato §3 and Corollary 3.8.4 are paywalled, and I read [FormalProof] only through its module names.
- Library declarations opened at the pins: 16.
  - Tau Ceti: `FittingIdeal/Basic.lean:334, 340`, `FittingIdeal/Determinant.lean:170`, `FittingIdeal/Prod.lean` (the zeroth Fitting ideal of a product only), `ContCohomology/SelmerStructure.lean`.
  - Mathlib: `ContCohomology/Basic.lean:131`, `ContCohomology/Functoriality.lean:148`, `ContCohomology/Sha.lean:72`, `RepresentationTheory/Basic.lean:618`, `Continuous/TopRep.lean:31`, `AbsoluteGaloisGroup.lean:87`, `Perfectoid/BDeRham.lean:75`, `CMField.lean`, `SelmerGroup.lean:161`, `CyclotomicCharacter.lean`.
  - Neither library has a topological tensor product, `B_cris` or crystalline representations.
- Cross-roadmap citations resolved:
  - On main: AnabelianGeometryAndNonabelianChabauty §4.6 (the target, line 6677 of its README); PadicHodgeTheory §3.1; SelmerIwasawaCohomology §§2.1, 2.6, 2.9, 2.13, 2.17, 2.19, 2.21, 2.22, 3.0, 4.9 and 4.10.
  - At open heads: PadicHodgeRegulators §1.5 (#1498); WachLatticesOverTheCyclotomicTower §§6.9 and 6.10 (#2899).
  - Consumers: GluedTargetAndDivisionInequality §8.19e (#2922), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (#2923), CongruenceModulesOfThetaLifts §7.8 (#2921).
  - This roadmap's entry in the family index is identical in all 40 heads.
- Dependency check output: `depcheck: 171 roadmaps, 1997 edges, 0 problem(s)`.
- Automatic checks: the worker's gate passed. My rerun flags only the family index and the merge order, both set aside below.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output and exit code 0. The file declares nothing, so there is no `#check @name` to compare.
- Arithmetic: I recomputed by hand the round bounds of 4.9c (2), 4.9d (2), 4.10c (3), 4.10e (1) and (3), and the size conditions of 4.10d (4).

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, UniformWildKernelBounds and HeckeIdealsAndTaylorWilesRelations (open), and PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology and EulerSystemsAndKolyvaginSystems (main). None of them shares an object with this roadmap:
- WachLatticesOverTheCyclotomicTower supplies §§6.4–6.10 and owns no prismatic lattice at level `s`.
- CongruenceModulesOfThetaLifts and LengthBoundsInPadicFamilies consume this roadmap.
- EulerSystemsAndKolyvaginSystems §1.14 treats anticyclotomic twists of Tate modules, a different object.
- `H¹_g` and the extension criteria are owned by AnabelianGeometryAndNonabelianChabauty §4.6, which 4.9a cites.

Source independence: 3 passages compared with 2 readable sources, none shared beyond forced terms. The passages are BS23-FCRYS Theorem 1.2 against the BS23-FCRYS entry and the PrismaticCohomologyPartIII §7.22 contract, and the announcement against the [FormalProof] and [Announcement] entries. Largest share: [FormalProof], 24 of 32 in-text locators. Its prose and table of contents cannot be read. Compared by module name, its arrangement is not the roadmap's: it files the Selmer presentation under InertiaEigenvalues and the alternating-word and cluster bounds under SatakeParameters, while the roadmap groups by subject. Independent as far as visible.

Research link: Layer 4 carries the integral `p`-adic Hodge theory of Wach lattices (Wach 1996; Berger 2004), Herr's complex (Herr 1998) and prismatic `F`-crystals (Bhatt–Scholze, arXiv 2106.14735) to explicit lifting exponents for Bloch–Kato finite classes. By the README, Layers 3 and 4 are inputs to Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026). This rests on the README and BS23-FCRYS.

## Not verifiable

- [FormalProof] (3.22–3.26, 4.9c, 4.9d, 4.10a, 4.10c–4.10g): only the operator's kernel export is at hand, with module and declaration names but no readable statements.
- Bloch–Kato §3 and Corollary 3.8.4 (4.9a, 4.9b, and the PadicHodgeRegulators contract): Birkhäuser, paywalled; no legal copy found.
- Wach 1996, Berger 2004 and Herr 1998: cited as background for the objects, with no theorem locator; not fetched.

Automatic checks set aside as false positives:
- The rule that a pull request change nothing outside its roadmap folder flagged the three files of the family index, which belong to this pull request.
- The rule that every roadmap be placed in the merge order flagged this roadmap as unplaced. A new roadmap is unplaced until it is inserted after its last supplier.

## Source issues

- none

## For the human reviewers

- Scope: 24 of the 32 in-text locators point to [FormalProof], an unrefereed Lean formalisation announced on 20 November 2026. Its author writes that he "decided to only present Lean" (Announcement, p. 2); there is no written proof.
- Licence: no licence for the formal proof could be read. The README links a GitHub repository, the announcement points to tarballs on its author's site, and the operator's export carries no licence file.
- Not tested: [FormalProof] holds the largest share of locators and cannot be read as prose or as a table of contents. Wording and arrangement were checked against its module names only.
