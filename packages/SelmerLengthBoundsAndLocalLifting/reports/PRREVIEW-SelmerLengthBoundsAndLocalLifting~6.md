# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at 3dce36e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The statements sampled in all fifteen sections agree with the declarations of the formal proof that the README names (hypotheses, ranges and constants), and recomputing the Checks, worked examples and round bounds found no false mathematics. There is one small correction (4.10c (3) is called the form of the formal proof but names no declaration of it) and one format note, neither blocking. The human reviewers decide the scope (the roadmap rests on a Lean formalisation announced on 20 November 2026, with no written proof) and that formalisation's licence.

## C01 — 4.10c (3) is labelled "the form of the formal proof" but names no declaration of it

Every other clause the README attributes to [FormalProof] gives a file and a declaration; 4.10c (3), which is headline (4) of the Summary, gives none (line 1080; its route ends with "Sources: … [FormalProof]", line 1146). A reader who wants to compare the exponent `2e_W + e_U` with the formal statement has nothing to open, while the ramified analogue 4.10e (1) names `coreLiftB` in the same file.

The declarations exist: in `Formalism/SharpRestriction/LevelLetterCocycles/LiftingTheory.lean`, `Formalism.MainNotions.LiftingTheory.coreLiftA` (for an unramified base and odd `p`, a surjection of crystalline lattices lifts finite classes after the exponent `ePA`, defined there as twice a cokernel exponent plus a kernel exponent) and `Formalism.MainNotions.LiftingTheory.LiftTheoremCaseA`. Name them at 4.10c (3), as 4.10e (1) does for case B.

## N01 — Some declarations of the formal proof are cited by name only, without the file

About fifteen declarations are given without a path, for example `GlobalTheory.T.wachModule_uniqueness_characterisation`, `GlobalTheory.T.xiQuotient_invariants_lift_rationally`, `GlobalTheory.NL.exists_cocycle_solution_conv` and `arc_single_type_bound` (lines 882, 961–962, 1120–1122, 1388–1398, 1561–1566). All of them are in the source, most in a file named after the declaration, but in a tree of 175,000 files the path saves a search; the other 72 citations give it.

## Questions for the author

- The References entry says the declaration names are those of the `src/` tree at commit `8c90877ceaa694974526e0aab9aaaf6ea0f5099e`. The copy of the source I could read states that it is `src/` at commit `e50d09817ad81469f737e8f637561e6ccf86c670`. Every path and declaration the README names exists in that copy, so the question is only which commit the entry should state, or whether the two trees are identical. I could not compare the commits: the repository's history was not readable through the sources service.

## Verified sound

| Statement | Instances tried | Values computed (README / mine or source) | Result | Change |
|---|---|---|---|---|
| 3.22 | (3) against `GlobalTheory.SelFun.KernelRep`; Check `Hom(O/λ², −)`; `(H6)` remark | complete Noetherian local, finite residue field, three hypotheses, `Φ` non-unit entries: same; `n = 1`, coker ≤ `#k`; dual eigenvalues inverse, none `1` | holds | none |
| 3.23 | against `TwSys.SelPoly`; `Φ = [e_j] − 1`, `u` of order `p^m`; `u = 1` | length = valuation of `F(u − 1)`: same; `e(O′/ℤ_p)/(p^{m−1}(p−1))` both sides; `F(0) = 0` infinite | holds | none |
| 3.24 | (2) cocycle identity; `p = 2`, `N = 3`; (4a) rank identity; against `ResSel.FirstHalf`, `ChooseH` | `ω(γ^N) = Nω + εN(N−1)/2·μω₀`; `3` odd; `dim ℒ(k) − h⁰ = rank ℒ − rank H⁰`; `H⁰ = H¹ = H² = 0`; corank `0` iff `ν = 0` | holds | none |
| 3.25 | against `ResSel.ResBound`, `StepTwo.Start`; direction `μ`; `R = 0` | `4rR + 2 < p^M`, degree `≤ 4rR`, adjugate or `a = 0`: same; `μ(φ_a) = −1`, `μ(γ_a) = −σβ_a`; `n_Q ≤ e` | holds | none |
| 3.25a | against `StepTwo.idl`, `Step`, `Grow`; binomial valuations | `𝔞_ν = (p^ν)·𝔪`; `N = 2(ν_λ+1)w + 2`, `N + 2r ≤ p^{M−ν−1}`, `M ≥ ν + 2`: same; `v_p C(p^M, k) = M − v_p(k)` | holds | none |
| 3.25b | (2) against `exists_level_order_exponents_small_valuation_determinants`; Check 1; `p = 3`, `m = D = v₀ = 1` | second kind, `1 ≤ k ≤ M`, `e_q < k`, `p^{e_q}/φ(p^k) ≤ ε`, every primitive `ζ`: same; zero at `(ζ^{p^i}, ζ)`; `1/2` | holds | none |
| 3.26 | against `partAT`, `TwAll.goodTwistExistsAllCoprimePowers`; `#Q`; sign of twist | one `ν`, bound `ν + ε`, all powers prime to `p`: same; `#Q ≤ 2·2R`; `T ⊗ ψ^m = T ⊗ ψ_{u^{−m}}^{−1}` | holds | none |
| 4.9a | (4) against `RamifiedCoefficientChains.ExtCrys`; `K = ℚ_p`, `V = E`, `η = χ_cyc` | finite cocycle iff extension crystalline: same; `h¹(E(−1)) = 1`, `D_dR = Fil⁰`, `H¹_f = 0` | holds | none |
| 4.9b | `F` imaginary quadratic, `V = E(1)`; `V = E` | left side `1 + 1 = 2`, right `r[F:ℚ]/2 = 1`; `rank ℒ_v − rank H⁰ = 1 − 1 = 0` | holds | none |
| 4.9c | against `LocalSituation.n0`, `mN`, `rI`, `cLL`, `cTB`, `TBeAt`, `Loc.Good`; `a` vs `β`; round bound; `p = 7`, `N = 91` | every term of `c` same; `(e+2)s + v_p(e) + e/(p−1) ≤ a`, `s ≤ 2s+1`; total `≤ (n+1)(5t+7)λ`; `7` has order `12` mod `13` | holds | none |
| 4.9d | against `LocalSituation.c0`, `H0at`; `ℚ_p(u)`; split counterexample | `2 + Σ(m + v_p(u))`: same; exponent `m + v_p(u)` vs bound `+2`; `ℤ/p^n ⊆ H⁰(V/T)` with `0` a weight | holds | none |
| 4.10a | `n = 2`, `h = 60`, `p = 41`; `h_i ≤ p − 2`; supplier §6.9 | `σ_i = ⌊60/40⌋ = 1`, `30 + 4 + 6 < 41`; `σ_i = 0`; (1c), (3), (4), (P3)–(P5) present there | holds | none |
| 4.10b | `I = 0`, `I = H¹_f(T′)` | corank `dim H¹(V) − dim H¹_f(V)` = rank `H¹_f(T′)`; defect `0` | holds | none |
| 4.10c | (1) against `H1fGeneratorBound`; span `p − 1` lattice; round bound at `p = 3`; interval Check | `([K₀:ℚ_p]+1)·rk`, `K = K₀`: same; `cost = 1`, `e°_U = 1`, `e° = 3`; `11.25H/p + 9 + 4log`; cup product nonzero as `b ≡ 1` | holds | C01 |
| 4.10d | (4) against `SetCS`, `ThmC`, `prv_twenty_five`; exponent coefficients; size Check | `32, 4, 10, 4, 3/2, 25`, (S1), (S2), `p ≥ 11`, `n` even: same; `0.257 ≤ 32/121`, `13.4 + 9.8δ`; `29.35`, `64.7 < 65` | holds | none |
| 4.10e | (1) against `LIFT.eU`, `ePB`; (3) against `thmA`, `boundA`, `expLift`; `p = 3`, `h = 1`; `p = 5` Check | same formulas; `e_s ≤ 7Hs + 7H/(p−1)`; `e_1 = 10 + 2 + 1 = 13`, `≤ 18h − 1`; valuations `3` and `2` | holds | none |
| 4.10f | against `ElementDenominator.thmT`, `rPrime`, `TheoremTClosing.main`; `N = 2`, `η = r′ = 1` | `C(HN² + N³) < p`, `4r′ ≤ N²`, `C(Nr′ + η(N + r′))`, `C ≥ 40`: same; `10`, `15 ≤ 35`, `k = 200` | holds | none |
| 4.10g | against `ArcTheoremGlobal`, `PushoutSpanLengthBound`; `U = E`, `K = ℚ_p` | `e·(rank H¹_f(L_U^†) + rank L_U)·length(O/p)`: same; `(1 + 1)e` | holds | none |
| Headline (1) | against 3.22 (2), 3.23 | same hypotheses and formula; no topology on `T ⊗_O B` at the pins | consistent; not statable | none |
| Headline (2) | against 3.26 | (H1), (H2), (H5), (H6), balance, `ν_s`, `(ν_s + ε′)·length(O′/p)` match | consistent; not statable | none |
| Headline (3) | against 4.9d (1) | `c = 2 + Σ_u(2s + n₀ + 1 + v_p(u))` matches | consistent; not statable | none |
| Headline (4) | against 4.10c (3), 4.10e (1′) | `23(2 + H/p + log_p(H+1))`; `32(2h·s_N + 1) + s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1 ≥ e_{s_N} + ⌊log_p N⌋` | consistent; not statable | C01 |

- Source locators checked against the text: all 72 file-and-declaration pairs of the README exist in the copy of [FormalProof] that the operator holds, and so do the 15 declarations cited by name only. I opened and compared the statements of 31 of them (those in the table).
- Library declarations opened at the pins: Tau Ceti `RingTheory/FittingIdeal/Basic.lean:334, 340`, `FittingIdeal/Determinant.lean:170`, `ContCohomology/SelmerStructure.lean:69, 97`, `LocalField/Unramified/Inertia/Basic.lean:112`; Mathlib `ContCohomology/Sha.lean:72`, `RepresentationTheory/Basic.lean:618`, `Continuous/TopRep.lean:31`, `AbsoluteGaloisGroup.lean:87`, `CMField.lean:70`, `Perfectoid/BDeRham.lean:75, 88`, `DedekindDomain/SelmerGroup.lean:161`, `FreeModule/PID.lean:383`. Neither library has `B_cris` or crystalline representations.
- Cross-roadmap citations resolved: 56 section and layer ids in 15 roadmaps on main (two of them completed), each found under its heading; PadicHodgeRegulators §§1.1, 1.4, 1.5 and 1.8 and WachLatticesOverTheCyclotomicTower §§6.4, 6.5, 6.9 and 6.10 at their open heads, statements read; AnabelianGeometryAndNonabelianChabauty §4.6, the target read at line 6677 of its README.
- Dependency check: `depcheck: 170 roadmaps, 1992 edges, 0 problem(s)`.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: no output, exit code 0; it declares nothing, so there is no signature to compare and no one-tactic probe to run.
- The description's prose agrees with the head: it adds a roadmap, declares nothing in Lean, and names both open suppliers.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, GluedTargetAndDivisionInequality and LocalGainOfThetaChains (open), and PadicHodgeTheory, EulerSystemsAndKolyvaginSystems and PhiGammaModulesAndIwasawaCohomology (main); nothing shared. WachLatticesOverTheCyclotomicTower owns §§6.4–6.10 and no lattice at level `s`; the three family roadmaps consume this one; the scalar trick of 3.24 (4b) cites EulerSystemsAndKolyvaginSystems §1.6; QuadraticTwistSelectionOverPrimes selects quadratic twists analytically, a different object.

Source independence: 31 passages compared with 1 source ([FormalProof], Lean code), none shared; largest share [FormalProof], 75 of 79 locators; contents compared with the directory tree of [FormalProof]: independent (the roadmap's two layers are by subject, the source files the same material under unrelated directory names). Bloch–Kato and BS23-FCRYS were not opened this round.

Research link: Layer 4 gives explicit lifting exponents for Bloch–Kato finite classes (Bloch–Kato 1990) through Wach lattices (Wach 1996, Berger 2004), the Herr complex (Herr 1998) and prismatic `F`-crystals (Bhatt–Scholze, arXiv:2106.14735); Layers 3 and 4 are steps of Alpöge's formal proof (2026). Rests on the README and on [FormalProof].

## Not verifiable

- Bloch–Kato §3 and Corollary 3.8.4 (4.9a, 4.9b, 4.10c, 4.10g): paywalled; read only through PadicHodgeRegulators §1.5, which cites the same locator.
- BS23-FCRYS Theorem 1.2 (4.10e (0), 4.10f): not opened this round.
- The commit of [FormalProof]: the readable copy states another commit than the README (see the question above).
- The sub-statements of [FormalProof] that the README marks "not given here" were checked for existence and, where sampled, for their statement; their proofs were not read.

## Source issues

- none

## For the human reviewers

- Scope: 75 of the 79 source locators point to [FormalProof], a Lean formalisation announced on 20 November 2026; no written proof or refereed source states the theorems of Layer 3 or the lifting theorems of 4.10c–4.10g.
- Scope: some cited declarations take published theorems as hypotheses, for example `GlobalTheory.TheoremTClosing.main` (4.10f) assumes Props named `BhattScholzeCrystallineLattices` and `FontaineBcris`; I did not trace where the formal proof discharges them.
- Licence: I found no licence statement for [FormalProof] in the copy read; the README cites file paths and declaration names only, and no declaration of `Suggested.lean` is adapted from it (the file declares nothing).
- The family index, carried by this pull request, says "The family follows the formal Lean proof"; this folder's own layers are organised by subject.
