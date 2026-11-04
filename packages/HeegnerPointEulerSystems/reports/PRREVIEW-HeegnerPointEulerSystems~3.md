# Review of HeegnerPointEulerSystems (pull request #1423 at 2870127)

**Verdict:** needs changes

This is a full review of the roadmap folder at the same head the previous review read; the folder has no changed lines since that review, so its one blocking finding is re-examined first, and then every passage of the README and the acceptance file is reviewed again from scratch.

## R01 (P2) — Five README supplier contracts are still not registered as plan gaps

**Location:** `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:137`, 187, 227, 255, 257 (each “What <Supplier> must provide (gap:<slug>)”), and `packages/HeegnerPointEulerSystems/design/plan.json`, top-level `gaps`.

**Claim:** The Zhang, modified-edge, distinguished-lattice and quartic-CM/Hilbert-family routes consume declared supplier obligations.

**Witness:** The README names 16 distinct `gap:` slugs; the plan's `gaps` list has 12 entries. Eleven slugs match. These five README contracts have no plan entry: `zhang-integral-realization` (HilbertModularVarietiesAndShimuraCurves, line 137), `modified-heegner-descent` (EulerSystemsAndKolyvaginSystems, line 187), `kato-distinguished-lattice` (KatoEulerSystems, line 227), `ordinary-quartic-comparisons` and `hilbert-family-divisibility` (AutomorphicCongruences, lines 255 and 257). Conversely the plan's `jsw-propagated-specialization` entry (SelmerIwasawaCohomology) appears nowhere in the README, whose §8.36 (line 1912) proves that evaluation itself “not an imported arithmetic JSW formula”. A contract counts as declared only when the plan carries the same slug, so the routes through §§4.10, 5.3, 6.1, 6.5–6.19, 8.6a, 8.16, 8.27–8.34, 8b.5 and every Layer 8/8b consumer rest on undeclared obligations.

**Exact repair:** Add the five entries to the plan's top-level `gaps`, each with the README's owner and its `needs` sentence as written there (the README sentences are precise and separate the conclusions; adding slugs alone is not enough). Narrow the existing `zhang-level-raising` entry to the level-raised forms and marked residual representation, as README line 213 does, leaving the quaternionic multiplicity-one identifications to the new HilbertModularVarietiesAndShimuraCurves entry. Delete or restate the plan-only `jsw-propagated-specialization` entry so that plan and README name the same obligations. Test: after this, a slug-and-owner join of README against plan gives 16 matches and no unmatched entry on either side. No file in the pull request changes.

Not repaired since the previous review (no change in the folder); not a settled “not actionable” finding.

## R02 (P3) — `abelianSelmerGroup_finite` is cited as a supplier declaration that does not exist

**Location:** `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:167` (“§2.12a abelian Kummer/Selmer/Sha and `abelianSelmerGroup_finite`”), 1269 (§7.7 *Needs:*), 1309 (§7.12 *Needs:*).

**Claim:** SelmerIwasawaCohomology supplies a declaration of that name.

**Witness:** At the open head of SelmerIwasawaCohomology, its README (2660 lines) and its `Suggested.lean` contain no `abelianSelmerGroup_finite`; the project-wide `roadmaps grep` finds the string only in this README. Its §2.12a does state the finiteness of `Sel_φ(A/K)` for every number-field isogeny in prose (paragraph “Finite Selmer and reduced primary groups”), so the mathematics is owned; the backticked name is not.

**Exact repair:** Replace the backticked name at the three lines by the prose citation “SelmerIwasawaCohomology §2.12a, finiteness of `Sel_φ(A/K)` for every isogeny”. Tested: the citation then resolves to the heading at `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:676`.

## R03 (P3) — Matar–Nekovář is cited but not recorded in the sources manifest

**Location:** `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:969` (§5.7), 1014 (§6.2), 1022 (§6.3), 1032 (§6.4) and the reference entry at line 2222; `packages/HeegnerPointEulerSystems/sources.toml`.

**Claim:** Every cited work is recorded in `sources.toml` with its locator and licence class.

**Witness:** The manifest has 19 ids (`howard` … `wuthrich`); none is Matar–Nekovář, and the sources cache held no text for it until this review fetched arXiv:1808.09544v2 (open repository) into a scratch copy of the manifest. The four locators then verify (see Verified sound), so the omission is only a manifest defect.

**Exact repair:** Add an entry with id `matar-nekovar`, arXiv:1808.09544v2, `locator_scheme = "theorem"`, locators §§0.4–0.5 and Propositions 6.4–6.5, `cited_for` §§5.7, 6.2–6.4, licence class open repository. Tested on the scratch copy: the service records it and returns the line-numbered text.

## Previous findings

- R01 (previous) — not repaired: the folder is unchanged and the plan still lists 12 gaps against 16 README slugs; carried as R01 above with the additional plan-only `jsw-propagated-specialization` mismatch.

## Verified sound

**What was reviewed.** All 2261 lines of the README (130 targets, 130 `*Needs:*` lines, 60 `**Checks.**` blocks, every layer with Examples and Dependencies) and the 49-line `Suggested.lean`, which declares nothing beyond its module docstring and namespace. The outside-folder diff of the pull request against main is empty; the worktree is clean. The pins are Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`, as the README states.

**Gate and build.** The worker's gate passed every scanner. The dependency check rerun from the worktree returned `depcheck: 204 roadmaps, 1652 edges, 0 problem(s)` with no UPWARD, CYCLE or moved line; this roadmap sits at line 350 of the merge order and every cited supplier is on main (ImaginaryQuadraticClassNumber, ClassFieldTheory, EllipticCurves, PadicMeasuresIwasawaAlgebras), completed (GlobalNumberFields, Chebotarev) or earlier in the order (all others, the latest being ModularIwasawaMainConjectures at line 349). Standalone elaboration with `lake env lean` exited 0 with no output. There are no declarations, so there was nothing to `#check`, nothing to probe with one tactic, and no padding; no `lemma`, `set_option`, `sorry` or non-`import Mathlib` import is present.

**Principles.** No route-specific shortcut: every descent theorem is stated at the generality of its source (Howard's, Gross's, Zhang's, Nekovář's, BCGS, BCS, CGLS, CGS, CS) with hypotheses named at each use, and the exceptional-prime, CM, RM and dyadic cases are carried as separate targets rather than excluded. No existing roadmap is re-planned: the Picard, class-field, modular-curve, Néron, Selmer, Euler-system, height and Iwasawa theories are imported by section, and ownership of the residual pairing (EulerSystemsAndKolyvaginSystems §§1.6, 1.16), the parity theorem (SelmerIwasawaCohomology §4.28), the statistics CM divisors (ArithmeticStatisticsPartVI) and the classical conductor-one trace (EffectiveClassNumbers §2.8) is stated in Scope and ownership. No copied passages, no algorithms. Suggested.lean honestly states nothing: the pins have no modular curve, Heegner point, elliptic Selmer group or anticyclotomic family (the only Heegner hit in either pin is the Heegner-number comment in `Mathlib/Analysis/Real/Pi/Chudnovsky.lean`; Tau Ceti's Kummer and Selmer hits are in function-field and crossed-product files), so every headline group named in the docstring is unstatable, and none is forced through a stand-in.

**Headline theorems.** Named in the docstring and checked against the README: §§6.1–6.6 (Howard/Gross rank one, Sha bound, primitivity), §§6.7–6.11 and 6.18–6.19 (Zhang), §§7.11–7.13 (full finiteness and square index), §§8.9–8.12 and 8.21–8.24 (Cornut–Vatsal), §§8.30–8.37 and 8.39–8.45 (Howard B, BCGS, Castella–Sano), §§8b.6–8b.13 (BCS and CGS equalities). Each has a source theorem with matching hypotheses (table below); each is unstatable at the pins for the reason the docstring gives.

**Declared gaps.** All 16 README contracts name a supplier; none is `none`. Minimality spot checks: ArithmeticGaloisRepresentations §§6.4–6.4a contain no open-image theorem (gap `elliptic-adelic-open-image` justified); EulerSystemsAndKolyvaginSystems §4.13 gives annihilator exponents, not the cardinality divisibility (gap `classical-uniform-square-index` justified); GeometryOfNumbersAndQuadraticArithmetic §4.2 is real unitary-representation dynamics (gap `cm-local-dynamics` justified); GrossZagierAndArithmeticHeights §9.20 is the rational finite-point logarithm (gap `integral-family-logarithm` justified); BCGS Theorem 2.2.2 (bcgs line 835) is proved through Lemma 2.2.4, stated for p>3 at bcgs line 905 and invoked at line 949 (gap `self-dual-rigidity-three` justified); Howard's correction χ_ℓ is not Galois-equivariant (see Source issues), so the modified-edge treatment and gap `modified-heegner-descent` are the right design, and EulerSystemsAndKolyvaginSystems §5.10 (ordinary systems only) does not already cover it.

**Supplier citations resolved** (each heading found at the supplier's open head, or on main for roadmaps there): EulerSystemsAndKolyvaginSystems §§1.4, 1.6, 1.14, 1.16, 2.9, 3.1–3.8, 4.13, 4.18, 4.19, 5.1, 5.2, 5.10–5.13, 8.28, 8.31 (lines 813–5617; §4.19(b) at line 3381 states the common-multiple bound with `R = ℤ_p`, a fixed `t`, error independent of `t` and zero under surjectivity, exactly as §8.33 imports it); SelmerIwasawaCohomology §§0.6, 0.8, 2.3, 2.5, 2.6, 2.8, 2.10, 2.12a, 2.13, 2.15, 2.19, 2.21–2.23, 3.1–3.3, 3.5, 3.6, 3.9–3.11, 4.9, 4.12, 4.28 and Layer 4; ArithmeticStatisticsPartVI's three headings (lines 2412, 2434, 2450; the nonvanishing target indeed covers every odd p, split bad primes and no CM by the field); EffectiveClassNumbers §2.8 Classical Heegner construction (line 644); GrossZagierAndArithmeticHeights §§0a.2–0a.4, 0.5, 3.2, 8.11, 9.10, 9.14, 9.20, 9.22 and Layers 0a, 3, 4, 5; ModularIwasawaMainConjectures §§0.5, 0.10, 1.3, 1.7; PadicHodgeRegulators §§1.3, 1.9, 1.10, 8.17, 8.22; PadicHodgeTheory §3.5; GeometryOfNumbersAndQuadraticArithmetic §4.2; FaltingsFinitenessAndIsogenyTheorems R28.4.5, R28.4.6, R28.6.7; ArithmeticGaloisRepresentations §§3.5, 6.1, 6.2, 6.4, 6.4a; SerreWeightAndLevelOptimisation §§1.1, 1.3, 2.4; GL2AutomorphicRepresentationsAndTransfer Layer R17.3 (its targets R17.3.1 and R17.3.5–6 are the global transfer and multiplicity one); NeronModelsAndSemistableAbelianVarieties §§1.2, 1.10, 2.1, 2.2, 2.6, 4.3, 4.6, 5.0a, 5.0c; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.21–R07.4.25, R07.5.6a; ArithmeticGaloisDuality R02.2.2, R02.2.3, Layer R02.4, Layer D7; EllipticCurves Layers 2, 4, 6, 7; HeightsRationalPointsAndObstructions §1.7; ShimuraVarieties §§4.4, 7.14; ComplexMultiplicationAndExplicitReciprocity CM.1, CM.2, CM.4; LocalFieldsRamification Layer 0; ImaginaryQuadraticClassNumber H1.4; GlobalNumberFields Layer 11; ClassFieldTheory Layers 12, 13; Chebotarev Layer 10; PadicMeasuresIwasawaAlgebras §§1.6, 1.7, 3.1, 3a.1, Layers 4, 5; ModularCurvesPartII §§9.9, 13.1, 13.4, 17.1–17.3; HilbertModularVarietiesAndShimuraCurves Layers R18.1–R18.5, R18.2.6, R18.5.15–R18.5.18, R18.5.17a; EllipticCurveModularity Layer R29.5. KatoEulerSystems and AutomorphicCongruences are board packages without a readable supplying README; the README cites them only through declared contracts, which is correct. Ownership against open pull requests was checked through `roadmaps grep` for the distinguished lattice, the modified Heegner system and the anticyclotomic Heegner class; no other open roadmap builds them.

**Pinned declarations opened** (file and line at the pin): `TauCeti.ContinuousCohomology.map_eq_id_of_inner` (`TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297`, hypothesis `IsSmoothDiscrete`, every degree `n`); `WeierstrassCurve.nonempty_linearEquiv_tateModule`, `free_tateModule`, `finrank_tateModule` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:73`, 80, 94, hypothesis `(ℓ : K) ≠ 0`); `WeierstrassCurve.Affine.fg_point_of_numberField` (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:34`); `TauCeti.TateModule` (`TauCeti/Algebra/Module/Torsion/TateModule.lean:115`); `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71`, a subgroup of continuous cohomology, no elliptic identification); `IsDiscreteValuationRing.ideal_eq_span_pow_irreducible` (`Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:362`, `s ≠ ⊥`); `PadicInt.ideal_eq_span_pow_p` (`Mathlib/NumberTheory/Padics/PadicIntegers.lean:545`, `s ≠ ⊥`); `PadicInt.mem_span_pow_iff_le_valuation` (same file, 472, `x ≠ 0`); `PadicInt.isUnit_iff` (385); `hensels_lemma` (`Mathlib/NumberTheory/Padics/Hensel.lean:459`); `DihedralGroup.sr_mul_r` (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:97`); `IsCompact.inter_iInter_nonempty` (`Mathlib/Topology/Compactness/Compact.lean:293`); `Pi.compactSpace` (same file, 1177); `Nat.primeFactorsList` (`Mathlib/Data/Nat/Factors.lean:38`); `CommRing.Pic` and `CommRing.Pic.mapRingHom` (`Mathlib/RingTheory/PicardGroup.lean:429`, 579); `ClassGroup.equivPic` (876, needs `IsDomain`); `Module.length` (`Mathlib/RingTheory/Length.lean:30`, valued in `ℕ∞`); `MonoidAlgebra.single` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean:222`). The README's caveats on each (zero ideal excluded, `x ≠ 0`, no arithmetic Λ, no saturation) match the pinned hypotheses.

**Seeded sample.** Every target of the sample was checked at its locator for theorem number, page, hypotheses and conclusion:

| Target | Source passage | Result |
| --- | --- | --- |
| 2.3 | cornut-vatsal line 2274 (Corollary 6.6, p.64): `Tr(x) = T^l_P(x′) − x″` with `x″ = 0`, `σx′`, `(σ+σ*)x′` for `ε_P = −1, 0, 1` at `n = 1` | matches the split/ramified/inert first-step relations |
| 4.2 | howard line 874–884 (Lemma 1.7.1, p.20): coset sum over `S`, `(σ_ℓ−1)D_n P[n] = −a_ℓ D_{n/ℓ} P[n/ℓ]`, fixed modulo `I_n`; line 885–890 restriction isomorphism onto `𝒢(n)`-invariants | matches |
| 4.6 | gross line 166 ((4.1), p.241) and 170–172: `P₁ = Σ σ y₁ = Tr_{K₁/K}(y₁) = y_K`; line 249–250 `c(1)` trivial iff `y_K ∈ pE(K)` | matches |
| 5.7 | matar-nekovar line 1514–1522 (Prop. 6.4, p.30: C1–C6), 1531–1537 (Prop. 6.5: C2–C4, C6 from C5, Sah's lemma with a nontrivial homothety); gross line 448 (Prop. 9.5), 511 (Claim 10.3) | matches; the README's full-`GL₂(𝔽_p)` hypothesis gives the homothety `−I` at every odd p including 3 |
| 5.8 | howard line 183–226 (§1.1, pp.5–6: cartesian and propagated conditions, Prop. 1.1.7, Def. 1.1.8); gross line 254 (Prop. 6.2, pp.244–245) | matches |
| 6.3 | gross line 511–516 (Claim 10.3, pp.253–254); matar-nekovar Props. 6.4–6.5 as above | matches |
| 7.2 | gross line 59–72 (Prop. 2.1 and Serre remark, p.237), line 555 (§12 on abelian varieties, pp.254–255) | matches |
| 8.1 | howard line 1252–1257 (§2.3, pp.28–29): `Φ = (p+1)² − a_p²` inert, `(p − a_pσ + σ²)(p − a_pσ* + σ*²)` split; `Δ = (O_K/pO_K)^×/(ℤ/pℤ)^×` | matches exactly |
| 8.6a | bcgs line 505 (§1.2.2, pp.10–12); wuthrich line 183 (Theorem 4, p.384) and 268 (proof, pp.386–387); the Manin constant is a p-unit for p ∤ 2N and an étale isogeny pulls a Néron differential back to a unit multiple | matches; the transport formula is proved below |
| 8.13 | cgls line 1495–1499 (Remark 4.1.3, (4.4), p.28): `pr_K(κ₁^Hg) = u_K α²(β−1)² κ₀` split, `u_K α²(β²−1) κ₀` inert, same Λ-line | matches exactly |
| 8.21 | cornut-vatsal line 1289–1293 (Theorem 4.1, p.37): surjective `Pic(O_F)`-equivariant `P`-new `π: J → A`, `χ₀` with `A{ω} ≠ 0`, good `x`, `e_χ α(x) ≠ 0` in `A ⊗ ℂ`; line 1407 (Theorem 4.10, p.41); 1751 (Prop. 4.17, p.49) | matches |
| 8.22 | cornut-vatsal line 196–199 (Theorem 1.5, p.7): indefinite, `ω = 1`, `N, D, P` pairwise coprime, `L′(π,χ,1/2) ≠ 0` for `n ≫ 0` | matches |
| 8.31 | cgls line 1470–1476 (Theorem 4.1.2, pp.27–28): `E(K)[p]=0`, rank one, `X ∼ Λ⊕M⊕M`, divisibility in `Λ[1/p, 1/(γ−1)]`, in `Λ[1/p]` under corank one; line 81 defines (disc) | matches |
| 8.39 | cs line 712–716 (Prop. 3.2.3, p.14): Conjecture 3.2.2 iff `char(S/Λy∞)·char(S/Λy∞^ι) = char(X_Gr(A)_tors)` | matches |
| 8.42 | bcgs line 91–94 (Theorem A, p.2): p odd good ordinary, (Heeg), (disc), (tor), p split, rational Conjecture 1.2.10 ⇒ some `κ_n ≠ 0`; §2.1 at line 756 | matches |

Further locators opened while reading: howard Theorem A (line 56–62) and Theorem B (80–91), Lemma 1.7.3 (896–916), Prop. 1.7.4 and Theorem 1.7.5 (919–951), Lemmas 2.3.2–2.3.3 (1285–1318); gross Theorem 1.3 (63–67), Prop. 3.7 (174), Prop. 4.7 and 5.4 (242–245), Prop. 8.2 (388); zhang Theorem 1.1 (156–162), Theorem 4.3 (935–943), Theorem 6.4 (1291–1316), Theorem 7.1 (1374–1391), Lemma 8.4 (1554–1568), Theorem 9.3 (1773–1783); bcgs Lemma 1.1.5 (451–456), Theorem 1.1.6 (468), Definition 1.2.2 (495–500), Lemma 1.2.8 (682), Corollary 1.2.12 (705–712), Theorem 1.2.13 (716–718), Theorem 1.3.1 and Remark 1.3.2 (728–753), Prop. 2.2.1, Theorem 2.2.2, Lemma 2.2.4 (832–839, 905–907, 949); cgls Theorem 4.1.1 (1428), Prop. 4.2.1 (1503–1516, rational, by BCK's proof after inverting p); bck Theorem 5.2 (693–698, integral under `H⁰(G_K, ρ̄) = 0`); bcs Theorems 1.2.2, 1.2.4 (114–142), Theorem 4.2.1 (413–423); cgs Theorem C (156–157); cs Theorem C (223–227), Prop. 3.3.2 (742–749), Lemma 3.3.3 (835–842), Corollary 3.3.4 (856–870); cv-dynamics Theorem 2.9 (403–416), Corollary 2.10 (436); cornut-vatsal Theorem 1.4 (190–192), Lemma 1.1 (137), Definition 1.3 and the standing non-exceptional assumption (156–165), Lemma 2.7 (719), Theorem 5.10 (2073–2081), Lemma 6.5 (2255–2262); nekovar Theorem 7.3 (2209–2215) and the exponent `2²¹ p^{2C₀+2C₁+4C₂+4C₃+C₅+C₆}` (2303); kolyvagin-structure Theorem A and `B(E)` (56–70); zanarella Theorem 2.3.6 (639–651, `p > 4`, `L ⊇ L_s`); Gross's scan is two printed pages per OCR page (printed numbers at lines 35–36, 84–85, 252–253, 467–468), and every Gross page locator in the README falls on the right spread.

**Adversarial pass.** One row per numbered target; the values are my own computations or the source hypotheses compared with the README's.

| Statement | Instances tried and values computed | Result / change |
| --- | --- | --- |
| 0.1 | `√2 ↦ [[0,2],[1,0]]` over ℚ₅: `a+b√2 ↦ [[a,2b],[b,a]]`, integral iff `a,b ∈ ℤ₅`, order `O_E`; `[[0,10],[1/5,0]]`: entry `b/5` forces `b ∈ 5ℤ₅`, order `ℤ₅+5ℤ₅√2`; split `L×L`, `g=[[1,π⁻¹],[0,1]]`: `g⁻¹diag(a,b)g = [[a,(a−b)π⁻¹],[0,b]]`, condition `a−b ∈ πO` | sound |
| 0.2 | `ℤ+3ℤi`: index 3, discriminant `3²·(−4) = −36`; all-maximal local family gives `O_E` | sound |
| 0.3 | ℚ(√−5): `(2,1+√−5)` has norm 2 and `a²+5b²=2` has no integer solution, so nonprincipal; identity idele gives the unit class | sound |
| 0.4 | `ℓ ∤ c`: `#(O_K/ℓ)^×/(ℓ−1) = ℓ+1, ℓ−1, ℓ`; `ℓ | c`: `#(𝔽_ℓ[ε])^×/(ℓ−1) = ℓ`; ℚ(i), c=1, ℓ=3: `u=2`, kernel `4/2=2`, and `h(O₃) = 1·3·(1+1/3)/2 = 2` | sound |
| 0.5 | ℚ(√−5): `h=2`, `[K[1]:K]=2`; ℚ(i): 1 | sound |
| 0.6 | S₃ with `σ=(123)`, `τ=(12)`: `τστ⁻¹ = (132) = σ²= σ⁻¹`; abelian C₃ quotient | sound |
| 0.7 | rank `[K_P:ℚ_p] − [F_P:ℚ_p] = [F_P:ℚ_p]`: 1 for F=ℚ, 2 for quadratic `F_P` | sound |
| 0.8 | C₃: `s ↦ s⁻¹ = s²`; `27−s−s²` fixed by `s ↔ s²` | sound |
| 0.9 | `Λ={(a,b): a−b∈πO}` has basis `(1,1),(π,0)`; trace dual generated by `(π⁻¹,−π⁻¹)`; different `(π,−π)`, norm `−π²`; discriminant `det[[2,π],[π,π²]] = π²`; ℤ₂[i]: different `(1+i)² = (2i)`, valuation 2 | sound |
| 1.4 | `ξ = D/2`, `deg D = 2`: `2x−D` has degree 0, `x−D` degree −1; cusp gives `d=1` | sound |
| 1.5 | negation orbit `{1,−1}`: trace 0, selected point 1; zero quotient kills everything | sound |
| 1.6 | `ψ: E→E′`, `E(K)/tors → E′(K)/tors` injective (finite kernel) so `I′ = j·I`; `c_{ψφ} = a·c_φ`; `N=5077, D=−7`: `h=1`, one summand | sound |
| 2.1 | q=5: `(0,6),(1,5),(2,4)`, each sum 6; positive conductor `1+5` (cornut-vatsal line 2255–2262) | sound |
| 2.2 | `u=2`, two equal terms `P`: `u·Tr = 4P` versus `2P` | sound |
| 2.3 | eigenvalue 2, trivial Artin actions: split `2−1−1 = 0`, ramified `2−1 = 1` | sound |
| 2.4 | exponents `2→1→0`; q=5: 6 neighbours minus 1 predecessor leaves 5; `prˡ = P·prᵘ` | sound |
| 2.5 | δ=2: `L(0)/L(2) ≅ O/π²` cyclic, `πL(0)` gives `k²`; q=2 fibre `e₀,e₁,e₂` with `e₀+e₁+e₂ = 0`: `T(e₀) = e₁+e₂ = −e₀`; coefficient 4 ↦ −4 | sound |
| 2.6 | 𝔽₉ = 𝔽₃[i]: `i³ = −i`, `i⁹ = i`; `Fr₃² = id` | sound |
| 2.7 | `𝒩 ∩ 𝒩′ = ∅` since `a_ℓ ≡ ℓ+1 ≡ 0` versus `p ∤ q²−1`, so `q ∤ n`; residue field 𝔽_{q²} | sound |
| 3.1 | ℤ₅/5: `5e ↦ 0`, `e ↦ 1`; `R = ℤ₅[ϖ]`, `ϖ² = 5`: 5 has ϖ-length 2 | sound |
| 3.2 | trivial unramified 𝔽₅²: `T/(Fr−1)T` of dimension 2 | sound |
| 3.3 | ℤ/25 component group: 5-length 2 | sound |
| 3.4 | `5ℤ₅ ⊂ ℤ₅`: same ℚ₅-span, quotient of order 5 | sound |
| 3.5 | `25ℤ₅`: saturation ℤ₅, length 2 | sound |
| 3.6 | coordinate swap τ on ℤ₂²: `(1+τ)(1,0) = (1,1)`, `(1−τ)(1,0) = (1,−1)`, sum `(2,0)` | sound |
| 4.1 | `y² = x³−x`: 19 and 199 ≡ 3 mod 4 so supersingular, `#E(𝔽₁₉) = 20`, `#E(𝔽₁₉₉) = 200`, `a = 0`; `(−7/19) = (19/7) = (5/7) = −1`, `(−7/199) = (3/7) = −1`; `−7 ≡ 1 mod 8` so 2 splits; conductor 32; `(20)+(200) = (5)`, intersection `(25)`, product `(125)` | sound |
| 4.2 | `D = Σ_{i=1}^{d−1} iσ^i`: `(σ−1)D = d − Σ_{j<d} σ^j`; d=3 coefficients `(2,−1,−1)`; Zhang's sum to d differs by `d·1 ∈ I_ℓ` | sound |
| 4.3 | p=5: `2·id` in the image, `x = 2x ⇒ x = 0`; trivial representation has invariants of dimension 2 | sound |
| 4.4 | `χ(x,y) = (x+y,y)`: `χ(−1,1) = (0,1)`, `χ(1,1) = (2,1)`; zero map ℤ→ℤ not an equivalence | sound |
| 4.5 | Gross Prop. 4.7: `c(n) = 0 ⇔ P_n ∈ pE(K_n)`, `d(n) = 0 ⇔ P_n ∈ pE(K_n)+E(K)` | sound |
| 4.6 | `D₁ = 1`, orbit sum `= Tr_{K[1]/K} P₁ = y_K`; `d(1) = 0` | sound |
| 4.7 | `σ_ℓ ↦ σ_ℓ^u`: scalar factor `u⁻¹`, tensor factor `u`; u=2 mod 5: `3·2 = 1` | sound |
| 4.8 | `v_ϖ(p) = e`: reduction mod `p^m` needs `M(n) ≥ em`; e=2, m=1 gives 2 | sound |
| 4.9 | Gross Prop. 5.4: `ε_n = ε(−1)^{f_n}`; with `w = −ε` this is `w(−1)^{ν+1}` | sound |
| 4.10 | `k = k₀ = 𝔽₅`: identity, marking ×2 sends 1 to 2; `k = 𝔽₂₅`: `t ∉ 𝔽₅`; ϖ ↦ 0 mod ϖ | sound |
| 5.1 | `Σ_{i=1}^{ℓ} i = ℓ(ℓ+1)/2` (howard line 912–915); not integral at p=2 | sound |
| 5.2 | trivial Frobenius on 𝔽₅²: `P = (1−X)²`, `Q = X−1`, `Q(1) = 0`; `diag(1,2)` and the swap at `e₁`: `(0,2) ≠ (0,1)`; generator change `3·2 = 1`; conjugation `4·4 = 1` | sound |
| 5.3 | edge −1 over 𝔽₅: `1 ↦ 4`, both of order 5; bottom 3 stays 3; zero family gives zero edges | sound |
| 5.4 | Howard Theorem A: p odd, `p, D, N` pairwise coprime, `G_K → Aut(T)` surjective; central scalars of order `p−1` kill `H¹` | sound |
| 5.5 | `(1±τ)/2` not integral at p=2 | sound |
| 5.7 | p=3: `−2 ≡ 1`; p=2: `−2 = 0`; p=7: `−2 = 5`, `5·3 = 15 ≡ 1`; square-determinant subgroup of `GL₂(𝔽₇)` has index 2 and contains `−I` and the unipotents; fixed lines of the two unipotents are `⟨(1,0)⟩`, `⟨(0,1)⟩` | sound |
| 5.8 | ℤ/25 component length 2; lattice quotient 5ℤ₅ ⊂ ℤ₅ length 1 | sound |
| 5.9 | Tate curve `v(q) = 5`: component order 5; `μ₅ ⊂ K_v`, `v(q) = 1`: `E[5] ≠ 0`, component order 1 | sound |
| 6.1 | `Sel_{p∞} ≅ ℚ_p/ℤ_p ⊕ M ⊕ M`, `length M ≤ length(S_p/ℤ_pκ₁)` (howard line 58–62); `D ≠ −3,−4` is Howard's §1.7 setting (line 836) | sound |
| 6.2 | Gross Prop. 8.2: local triviality away from λ forces `s_λ = 0` by reciprocity; “non-CM” is implied by full `GL₂(𝔽_p)` at odd p | sound (redundant hypothesis, P3 note only) |
| 6.3 | Claim 10.3 `Sel(E/K)_p = ℤ/pℤ·δy_K`; second class excluded through the composite Kummer field | sound |
| 6.4 | MN Prop. 6.5: p ≠ 2, `D ≠ −3,−4`, `E[p]` absolutely irreducible over `G_K` ⇒ (6.3.1); full `GL₂(𝔽_p)` ⇒ image over K of index ≤ 2 ⊇ `SL₂` ⇒ absolutely irreducible; `p | D_K` and `p | N` allowed | sound |
| 6.5 | `Sha[p∞] = M⊕M`: length `2·length M ≤ 2·length(E(K)⊗ℤ_p/ℤ_p y_K)` once `S_p = E(K)⊗ℤ_p` | sound |
| 6.6 | Zanarella Theorem 2.3.6: `p > 4`, `L ⊇ L_s`, equality iff primitive; scaling by p raises the index by 1 | sound |
| 6.7 | Zhang Theorem 4.3: `loc_{q₁}c(n,m) ∈ H¹(K_{q₁},k₀)`, `loc_{q₂}c(n,mq₁q₂) ∈ H¹(K_{q₂},k₀(1))`, equal up to a fixed unit | sound |
| 6.8 | finite line `k₀` versus singular line `k₀(1)` at q; surjective `loc_q` drops the dimension by one | sound |
| 6.9 | Zhang Theorem 7.1: p ≥ 3 good ordinary, image ⊇ `SL₂(𝔽_p)`, ramified `ℓ ∥ N`; `v_𝔭(L/Ω) = length Sel + Σ t_g(ℓ)` | sound |
| 6.10 | `L^alg = L/Ω^can · η_ratio⁻¹`, unit iff locally nonzero bottom class | sound (as stated by Zhang §6) |
| 6.11 | Zhang Theorem 6.4: ♥, `N⁻` with an odd number of factors, `v_𝔭(η_g(N)/ξ_g) = Σ_{ℓ|N⁻} t_g(ℓ)`; ♥(2) alternatives at line 1313–1316 | sound |
| 6.12 | empty support ∞; `c(1) ≠ 0` gives 0; support at 6 gives 2 | sound |
| 6.13 | zero family: all primes `∤ D_KNp`; `p` never in the locus | sound |
| 6.15 | `ε_n = w_g(−1)^{ν(n)+1}` agrees with Zhang Theorem 1.2 (line 175) | sound |
| 6.18 | Lemma 8.4: `dim Sel^{ε_ν} = ν+1`, opposite `≤ ν`, `2ν+1` detecting primes; ν=1 gives 2, ≤1, 3 | sound |
| 6.19 | Theorem 1.1 / 9.3: `N⁻` squarefree even, surjective, ♠, p ≥ 5 ordinary, `p ∤ D_KN`; unit 2 keeps `1 ↦ 2 ≠ 0`; `3·2 ≡ 1 mod 5` | sound |
| 7.1 | `(12,18) ∈ ℤ²`: 2-adic depth `min(2,1) = 1`, 3-adic `min(1,2) = 1` | sound |
| 7.2 | `SL₂(ℤ_p)`: scalar commutant, determinant image `{1}`, infinite index; full image spans `M₂(ℤ_p)` | sound |
| 7.3 | `u = −1`: `v₃(−2) = 0`, `v₂(−2) = 1`; `M₂(O_𝔭)` gives `C₃ = 0`; scalars never contain `ϖ^c E₁₂` | sound |
| 7.4 | `u₀ = 2`, unramified dyadic: `M₀ = 1`, `8/2 = 4`; `v_𝔭(2) = 2`: `M₀ = 2` | sound |
| 7.5 | `Φ_ℓ Fr = −Fr Φ_ℓ` matches nekovar 7.2.4; `κ₁ = 𝔭^{C₁}δ(y)` | sound |
| 7.6 | nekovar line 2303 exponent reproduced; `(12,18)`: `C₀(2) = C₀(3) = 1`; trivial constants: `B = 0` odd, `21v(2)`, 42 if `v(2) = 2` | sound |
| 7.7 | Theorem 7.3: `p^{C(p)}` kills `S/O_pκ₁` uniformly in M; cofinal principal M suffice | sound |
| 7.8 | `|D_M| ∣ N` with all `N`-primes split in K forces `M ≠ K` | sound |
| 7.9 | constants zero outside a finite set ⇒ `Sha[p∞] = 0` there | sound |
| 7.10 | a nonzero p-primary element has a nonzero p-torsion multiple | sound |
| 7.11 | Gross Theorem 1.3 and Nekovář Theorem 3.2: rank 1 and finite Sha from a non-torsion `y_K` | sound |
| 7.12 | trivial-character case of Nekovář 3.2; height input kept separate | sound |
| 7.13 | Kolyvagin Theorem A: `#Sha ∣ d·C_K²`, `ord_ℓ d = 0` for `ℓ ∈ B(E)` (odd `ℓ ∤ disc O` with surjective `O_ℓ`-linear image); `(ℤ/5)³` has exponent 5 and order 125 | sound |
| 8.1 | p=5, `a_p=1`: inert 35, split augmentation 25; `(5−s+s²)(5+s−s²) = 25 + 2s³ − s⁴ − s² = 27−s−s²`, content 1, augmentation 25 | sound |
| 8.2 | `P₁=4, P₀=2, α=2`: `(4 − 2/2)/2 = 3/2`; split/inert initial corrections as cgls (4.3) | sound |
| 8.3 | `cor(raw[k+2]) = a_p raw[k+1] − raw[k]`, `cor(raw[k+1]) = p·raw[k+1]` (howard line 1272–1277) | sound |
| 8.4 | ℤ/7: `π = id, Φ = 5`: `q = 5`; `π = 0`, bottom 1: insoluble; `tr = id`, scalar 0 with bottom 1: `q = 1` and `q = 0` conflict | sound |
| 8.5 | ℤ/2 self-edge, bottom projection 0, trace id, scalar 1: families 0 and 1 both satisfy; difference obeys the homogeneous laws | sound |
| 8.6 | `(1,0)` nonzero with second coordinate 0 | sound |
| 8.6a | from `0 → S_src → S → C_S → 0` and `Λy_src/Λay_src ≅ Λ/(a)`: `char(S/Λy∞) = (a)char(C_S)char(S_src/Λy_src)`; from `0 → K_X → X_tors → X_src,tors → C_X → 0`: `char(X_tors)char(C_X) = char(X_src,tors)char(K_X)`; squaring and substituting the source equality gives `char(K_X)char(S/Λy∞)² = (a)²char(C_X)char(C_S)²char(X_tors)`; `y_src = 25, a = 5`: `(5²) → (5³)`, squares `(5⁴) → (5⁶)`; `f = [5]`: `char(C_S) = (5)`, `K_X = C_X` for an endomorphism of a torsion module, correction `(25)`; `diag(5,1)`: cokernel ℤ/5, determinant 5 | sound |
| 8.7 | identity preceding quotient: empty stratum; `G(n) = C₂` with trivial `G₀`: the identity character is primitive | sound |
| 8.8 | F = ℚ: one real place, sign −1; one more inert odd-exponent prime: +1 | sound |
| 8.9 | cv-dynamics Theorem 2.9 with `R` pairwise distinct modulo `P`-rational elements, compact open `G`, Haar `dg` | sound |
| 8.10 | Corollary 2.10: `Red(Gx) = C⁻¹(Gx̄)` off a finite set | sound |
| 8.11 | Theorem 5.10: `P`-new θ, `χ₀ω = 1`, good x, `n ≫ 0`; standing non-exceptional assumption at cornut-vatsal line 165 | sound |
| 8.12 | Theorem 1.4: definite, `χ₀ω = 1`, `L(π,χ,1/2) ≠ 0` for some primitive χ at every large n | sound |
| 8.13 | p=5, `u_K=1`, `α=2`, `β=5/2`: split `4·(3/2)² = 9 ≡ 4`, inert `4·(25/4−1) = 21 ≡ 1`; `u_K = 1` under (disc); `1` and `1+T` share level-zero value 1 but ratio `1+T`; `1` and `5` generate distinct lines | sound |
| 8.14 | `α_m = ξ_{(p−1)p^{m−1}}`: exponents 4 and 20 at p=5; `α_{m+1} = α_m^p` | sound |
| 8.15 | `ind(5) = 2` in ℤ₅[ϖ]; `ind₃(ϖ³) = 3` versus extended ∞; `M₀ = 3, M∞ ≤ 1` example | sound |
| 8.16 | `(5,5,5)`: `25/5 = 5`; `(5,1,1)` versus `(25,1,5)`: both ratios 5, raw products 5 and 25; `[5]` on a rank-two lattice has cokernel `(ℤ/5)²` | sound |
| 8.17 | `c_w(α) ≡ c_w mod p^m` (bcgs Lemma 1.2.8); under (Heeg) each `ℓ | N` gives two `w` with `c_w = c_ℓ`, product `∏c_ℓ²` | sound |
| 8.18 | `G = 0`, `L = R` in degree 0: fibre `R[−1]`, `H¹ = R`; unshifted cone has `H⁰ = R` | sound |
| 8.19 | inert: `p²+1−(a_p²−2p) = (p+1)²−a_p²`; split: `(p+1−a_p)²` | sound |
| 8.20 | two good places of distinct residue characteristic away from P bound torsion (cornut-vatsal Lemma 2.7) | sound |
| 8.21 | Theorem 4.1 hypotheses and conclusion as in the sample table; `e_χα(x) ≠ 0` in `A ⊗ ℂ` | sound |
| 8.22 | Theorem 1.5: `ω = 1`, `N, D, P` coprime, odd `|S|` | sound |
| 8.24 | cgls Theorem 4.1.1: `E(K)[p] = 0` ⇒ nonzero `κ₁^Hg` with class-number shifts `d(k)` | sound |
| 8.25 | p=3, r=0: `γ ↦ 4`; `v_p((1+p)^{p^r} − 1) = r+1` | sound |
| 8.26 | bcgs Theorem 1.1.6: `κ₁(α) ≠ 0` for nontrivial `α ≡ 1 mod p^m`, `m ≫ 0` | sound |
| 8.27 | `(0,1)` unchanged by identity derivative and restriction; `χ⁻¹(0,1) = (−1,1)` is a different class | sound |
| 8.28 | transverse at `ℓ | n`, unramified away from `pNn`, `Fil⁺` at `v | p` (howard Lemma 2.3.4) | sound |
| 8.29 | `α(γ) = 6`: `ι(γ) ↦ 1/6`, `6·(1/6) = 1`, `36 ≠ 1` in ℤ₅; `−1 → 24 → 4` versus `1 → 1 → 4`; `(1,2) ↦ (−1,−2)`, sum −3 | sound |
| 8.30 | howard Theorem B: `p ∤ h_K`, ordinary, Theorem A hypotheses; `X ∼ Λ⊕M⊕M`, `char(M) = char(M)^ι`, `char(M) | char(S/H)` | sound |
| 8.31 | cgls Theorem 4.1.2 in `Λ[1/p,1/(γ−1)]`, `Λ[1/p]` under corank one; `D = −3` odd but fails (disc), `u_K = 3`; `D = −7` passes | sound |
| 8.32 | bcgs Lemma 1.1.5: `(α_p−1)²(β_p−1)²` split, `(p+1)²−a_p²` inert; `(α−1)²(β−1)² = (p+1−a_p)²` | sound |
| 8.33 | bcgs Theorem 1.3.1: fixed `t`, `M, E` depending only on `T_pE`, `E = 0` under (sur); `κ̃₁ = 5³e`: length 3, `5²κ̃₁` length 5, bound uses 3; `diag(1,2)` versus the swap | sound |
| 8.34 | `A/(T²)`, `Q = A/(T³)`: `2 ≤ 3`, `4 ≤ 6`, `(T⁴) ⊃ (T⁶)`; `A/(T⁴)`: `4 ≤ 3` fails and inverting T hides it; `diag(2,3)` over 𝔽₅: invariants `(2−1)x = (3−1)y = 0` force 0, yet reducible | sound |
| 8.35 | `y² = x³+8x+2` mod 5: `x = 1, 2` give `y² = 1`, others nonsquares (2, 3, 3): 5 points, `a₅ = 1`, `b = 5`; `(1,6)` mod 25: `λ = 11·12⁻¹ = 11·23 = 3`, `2P = (7,1)`; `λ = −5·21 = 20`, `3P = (17,24)`; `λ = 9·22 = 23`, `4P = (11,14) ≠ −P = (1,19)`, and every lift of a mod-5 point differs by `E₁`, killed by 5 mod 25, so `h = 1`, `s = 5`; `y² = x³+x`: points `O,(0,0),(2,0),(3,0)`, `a₅ = 2`, `b = h = s = 1`; `j = ×5`, `locκ = 5`: `I = 5`, `C = 5`, index 25 | sound |
| 8.36 | valuations `2 + 2 + 2(1+2) + 2 = 12` versus 9 counting rational primes once; `h = 1, b = s = 5, t = 2, C = 5, #Sha = 25`: `5⁴ = 25·25·1`, `I·5 = 25·5·5` so `I = 5³`, `I² = 5⁶ = 25·5⁴` | sound |
| 8.37 | `IC = p^t b s` and `p^{2t} = #Sha·C²·∏c·h²` give `I² = #Sha·∏c·(hs)²b² = #Sha·∏c·b⁴`; anomalous example `625 = b⁴ ≠ h⁴ = 1`; with `M_r(α) = M_r + 2v(b₀)` the shift cancels in `2(M₀−M∞)`, which is what makes §8.43's `M∞ = Σv(c_ℓ)` consistent with §8.41 | sound; bcgs Corollary 1.2.12 writes `#H⁰(ℚ_p,E₀[p∞])⁴` through the identification at bcgs line 575 (Source issues) |
| 8.38 | `Λ(1,0) ⊂ Λ²` has rank 2; `y ↦ py` scales by `p²`; `y = 5`: coefficient 25; `a = γ`: `γ·γ⁻¹ = 1` | sound |
| 8.39 | cs Prop. 3.2.3 as in the sample table | sound |
| 8.40 | `(1+5^m)⁻¹ ≡ 1 mod 5^m`; `(1,0) ∈ ℤ₅²` rank one inside rank two; `5⁴ℤ₅` of index 625 | sound |
| 8.41 | `κ₁ = ϖ³`, `M∞ = 1`: `2(3−1) = 4 = length (R/ϖ²)²`; `×ϖ`: `(4,2)`, still 4; ℤ₅[ϖ]: `ind(5) = 2`, length 4 not 2; 𝔽₃²: 4 lines × 2 nonzero vectors + 0 = 9 | sound |
| 8.42 | bcgs Theorem A hypotheses as in the sample table | sound |
| 8.43 | Theorem B: `p > 3`, (sur), integral conjecture, p-optimal; `M∞ = Σ_ℓ v_p(c_ℓ) = ½Σ_w` | sound |
| 8.44 | cs Corollary 3.3.4: `index² = L_p²·Tam_E²·#X_BK` up to a unit | sound |
| 8.45 | cs Theorem C: `p > 3`, (sur), `p ∤ c_φ`, good ordinary, p unramified in K; equivalence, with inert p permitted | sound |
| 8b.1 | square-root `L_BDP` of bcgs versus single power of bcs/cgs, compared as ideals after the same extension | sound |
| 8b.2 | bck Theorem 5.2 integral under `H⁰(G_K,ρ̄) = 0`; cgls Prop. 4.2.1 in `Λ^ur ⊗ ℚ_p`; `(3)` versus `(1)` in ℤ₃⟦T⟧: lengths 1 and 0 at `(3)`, both unit after inverting 3; rescaling the line by 3 adds 2 to the square valuation | sound |
| 8b.3 | p inert in F, `D_F` odd, `D_F`-primes split in K, `ℓ ≡ −1 mod p` inert in F (bcs Prop. 5.2.1) | sound |
| 8b.4 | bcs Theorem 4.2.1: (irr_K), odd ordinary p, rational divisibilities; integral under (sur) | sound |
| 8b.5 | opposite bounds `b₁ ≤ a₁`, `b₂ ≤ a₂` with `a₁+a₂ ≤ b₁+b₂` and `(a₁,a₂) = (1,2)` force `(b₁,b₂) = (1,2)` | sound |
| 8b.6 | bcs Theorem 1.2.2(a): `p > 3`, (irr_ℚ), equality in `Λ ⊗ ℚ_p` | sound |
| 8b.7 | Theorem 1.2.2(b): (sur), equality in Λ; prime-to-p isogeny gives integral Selmer isomorphisms; `(a)²` for `ay∞` | sound |
| 8b.8 | Theorem 1.2.4(a): torsion `X_Gr`, `(L_BDP)` in `Λ^ur ⊗ ℚ_p` | sound |
| 8b.9 | Theorem 1.2.4(b): integral in `Λ^ur` | sound |
| 8b.10 | cgs Theorem C: `p ∤ 2N` Eisenstein, (Heeg), (disc), (spl), `φ|G_p ≠ 1, ω`; bcgs Theorem 1.2.13(i) | sound |
| 8b.11 | bcgs line 97–100: Eisenstein branch and `p > 3` (irr); (sur) integral through bcs | sound |
| 8b.12 | Tamagawa p-parts 5 and 25: `M∞ = 1+2 = 3`, K-product valuation 6 | sound |
| 8b.13 | cs Theorem C “in particular, if p splits” (line 227) | sound |
| Kato contract Checks | `diag(1,5)`: identity on the line, cokernel ℤ/5; `×2`: determinant 4, unit; `×5`: cokernel `(ℤ/5)²`; bottom `5e` with saturation indices 1 and 5: `5/1 = 25/5 = 5` | sound |
| AutomorphicCongruences contract Checks | `(5T)` and `(T)`: equal after inverting 5, `(5)`-valuations 1 and 0; `(T) ⊃ (T²)`; `n⁻ = O_F` has 0 factors, even | sound |

Conventions were recomputed where they recur: the arithmetic Artin convention of §0.8 is used in §§2.3, 8.1 and 8.9 (inversion of the geometric sources, the `27−s−s²` witness); the derivative sign `(2,−1,−1)` of §4.2 recurs in the Layer 4 example; the augmentation `Φ₀ = (p+1−a_p)²` of §8.1 recurs in §§8.19, 8.32 and 8.37 with the same value; the index/length conventions of §8.15 recur in §8.41 with `ind(5) = 2` over ℤ₅[ϖ]. No Check contradicts a theorem of its section or another Check on the same object.

## Not verifiable

- none. Every cited text is in the legal cache (the Matar–Nekovář preprint was fetched from arXiv into a scratch manifest copy for this review; see R03). The board-package suppliers KatoEulerSystems and AutomorphicCongruences have no readable roadmap README, and the README consumes them only through declared contracts.

## Source issues

- **Gap** in howard at Theorem 1.7.5, printed p.21 (howard lines 944–951): the source says the automorphism `χ_ℓ` of `T/I_ℓT` induces an automorphism of `H¹(K,T/I_nT)` and the corrected classes form a Kolyvagin system; it should note that `χ_ℓ = p^{−M}(a_ℓ − (ℓ+1)Fr_ℓ)` is not `G_K`-equivariant when the image is `GL₂` (`Fr_ℓ` is non-scalar), so no map on cohomology is induced; affects the proof (the roadmap works with modified local edges instead).
- **Error** in bcgs at Remark 1.2.4, printed p.12 (bcgs line 575): the source says `#(ℤ_p/(1−α_p)) = #H⁰(ℚ_p,E[p∞])`; it should be `#Ẽ(𝔽_p)[p∞]`, which exceeds `#E(ℚ_p)[p∞]` at anomalous primes (`y² = x³+8x+2`, p=5: 5 versus 1); affects a stated result (Corollary 1.2.12's fourth power, whose correct value `(#Ẽ(𝔽_p)[p∞])⁴` is the one Theorem B needs).
- **Gap** in bcgs at Theorem 2.2.2, printed p.17 (bcgs lines 835–839 and 949): the source says the exact length holds for `p ≥ 3`; it should restrict to `p > 3` or supply the rigidity of Lemma 2.2.4 at p=3, which is stated only for `p > 3`; affects the proof.
- **Gap** in bcgs at Lemma 1.2.5, printed p.12 (bcgs lines 583–608): the source says the positive and saturated ordinary lattices can be identified in the index comparison; it should keep their finite saturation index (5 in the anomalous example above); affects the proof.
- **Misprint** in bcs at proof of Proposition 5.2.1, printed p.10 (bcs lines 513 and 517): the source says Proposition 4.1.3; it should be Theorem 4.1.3; affects nothing.
