# Review of GrossZagierAndArithmeticHeights (pull request #1487 at c3a16ba)

**Verdict:** needs changes

## R01 (P1) — The local intersection sum is not the Néron symbol

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:3650`, §7.46a(5): “the sum is the finite Néron symbol of 2.5”. The same sentence defines i as a normalized intersection length and j as a vertical intersection pairing.

**Claim:** This identifies an intersection coefficient with the signed logarithmic symbol. It contradicts §2.5 and the minus-logarithm conversion retained in §7.47(4). The vertical term also needs the same ramification normalization as the horizontal term for the asserted extension independence.

**Witness:** README:815 gives corrected intersection 1/2 and symbol −log(q)/2. With q=5 and e=1, i+j=1/2, whereas the symbol is approximately −0.804719. README:3682 multiplies the intersection coefficients by −log N_v.

**Exact repair:** Define both i and j as intersection coefficients divided by e(H_w/F_v). Say that their sum is the normalized finite intersection coefficient; its Néron-symbol value on degree-zero divisors is −(i+j)log N_v. Apply that conversion also to the preceding claim about the degree-one admissible pairing. Keep §7.47's explicit negative logarithms, rather than applying them twice.

**Repair test:** In §2.5's two-component example, V=C₁/2, horizontal intersection 0 and vertical intersection 1/2 give −log5/2 after the repair. Under a ramified quadratic extension the raw corrected intersection becomes 1; division by e=2 gives the same value. More generally log(q_w)/[H_w:F_v]=log(N_v)/e, exactly the normalization in §2.5.

## R02 (P1) — Replace the obsolete CM supplier contracts

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:123`, also :155, :205, :126 and :5275: “`idealAction.picardEquiv`, `idealAction.degree_eq_norm`” and “§1.3 (`cmPeriodPairings`, `cmHodgeEigenspaces`)”.

**Claim:** The claimed declarations and section no longer supply these inputs at the resolved CM head. This is supplier drift, not absence of the mathematics from the project. The named ring-class Galois law is used already in §0a.1, so a reader cannot implement that route from its stated contract.

**Witness:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:338`, :354 and :561 now contain twisting, Serre-tensor periods and coefficient bounds, respectively. The four flagged names are absent. `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:87` owns the full-order CM dictionary and reciprocity.

**Exact repair:** Repoint the proper-ideal lattice, degree, unit and full-order reciprocity imports to ImaginaryQuadraticClassNumber H3.1, together with the already cited ClassFieldTheory Layer 13. Cite the actual Lie/Hodge/period comparison in ComplexMultiplicationAndExplicitReciprocity §1.2, retaining its hypotheses, rather than nonexistent §1.3 names. For the supersingular level-pair order, cite SerreWeightAndLevelOptimisation §2.6 directly; current CM §5.2 itself consumes that owner. Update the repeated *Needs* and layer summaries consistently. Do not rebuild these objects here.

**Repair test:** H3.1 includes all quadratic orders and the actual unit kernels: D=−3 has six units, rather than two; O=Z+3Zi has an invertible principal ideal 3O of norm 9. These retain §0a.2's exceptional-unit and norm-degree cases. At supersingular level N=1 the supplied order has reduced discriminant p; at prime-to-p level N it has discriminant Np. CM §1.2 supplies the marked differential/eigenspace comparison used for the periods in §9.4.

## R03 (P2) — Retire the three remaining fulfilled supplier gaps

**Location:** `packages/GrossZagierAndArithmeticHeights/design/plan.json:4`, :10 and :16: `polarized-skeleton-green`, `ideal-zeta-genus-factorization`, `normalized-e2-family`. The matching actual imports are README:106, :131 and :139. None of these slugs remains in the README.

**Claim:** All three active entries ask for objects the README now correctly imports. They therefore fail the minimality requirement for declared gaps. This is not an objection to conditional contracts or to unfinished supplier implementations.

**Witness:** TropicalAndBerkovichArithmetic §§2.10–2.13, 3.1–3.3, 6.6–6.8 supply skeleton/Green/curvature; AnalyticNumberTheoryPartI §§2.8, 2.10, 2.25 supply ideal-zeta/genus factorization; AutomorphicSpectralTheory §1.30 and pinned E2 declarations supply the Eisenstein contract.

**Re-raised: r2b F01 in FIX-RT-GrossZagierAndArithmeticHeights~2.** The reason recorded at `packages/GrossZagierAndArithmeticHeights/reports/FIX-RT-GrossZagierAndArithmeticHeights~2.md:49` was that the Tropical supplier copy was unavailable and both locations still declared the gap. The explicitly supplied Tropical head is readable now, and README:106 already imports its precise sections. That reason no longer applies. The other two entries are newly checked here.

**Exact repair:** Delete these three entries from the active `gaps` array. Keep the README's resolved imports and its owned arithmetic-normalization/derivative adapters. No new target, change to a supplier, or stronger replacement gap is needed.

**Repair tests:** Tropical §6.6 gives μ=ds/2 on a genus-one circle of length 2 and g(s)=s²/4−s/2+1/6, with mean zero; §6.8 preserves curvature mass under simultaneous length/log-metric rescaling. AnalyticNumberTheoryPartI §2.10 includes {1,−4} and {5,−3}; at norm 2 the latter has both character values −1. Mathlib's E2 q-expansion has coefficients 1,−24,−72; subtracting 3/(πy) gives E2*(i)=0. The continued weight-two family remains in AutomorphicSpectralTheory §1.30. Removing the gaps removes none of those inputs.

## Previous findings

The preceding review had one finding, R01: “Retire the fulfilled regulator gap.” **Repaired.** The active plan has only the three entries discussed above, with no `point-kummer-logarithm`. README:5715 now says “PadicHodgeRegulators §1.9 supplies the abelian point Kummer/exponential/logarithm comparison at arbitrary reduction”. I reread that supplier at `TauCetiRoadmap/PadicHodgeRegulators/README.md:605`: its point-completion domain, de Rham quotient and quotient/isogeny naturality cover the contract. For the Tate curve with period 5, logarithms of [6] and [36] are 55 and 110 modulo 125; projection on the first factor gives 55, addition gives 40. This round reviews the whole folder, despite the unchanged Git head in the change context.

## Verified sound

**Scope and gate.** Read both roadmap files, the normative repository README and CONTRIBUTING, and main-roadmap examples ImaginaryQuadraticClassNumber and Completed/LocalGaloisGroups. The requested head matches; no changes outside this folder appear in the PR diff, and the worktree is clean. The supplied full gate passes all scanners and the targeted build. Its result is `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, with every other counter zero and final `OK`. No route restriction, computational procedure, sorry'd data, option override or competing roadmap import was found. Classical specializations retain their hypotheses alongside the general quaternionic targets; the explicit bad-prime and wild branches have not been replaced by good-prime formulas.

The separately executed dependency check returned, verbatim:

    depcheck: 204 roadmaps, 1639 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The result checks roadmap-level direction, not the truth of a supplier contract; R02 is a contract defect despite that passing result. I reviewed the *Needs* lines, including the intentionally nonnumerical construction order §§6.56–6.61 and §§7.39–7.82. No additional coarse supplier cycle was established.

**Lean acceptance test and headlines.** Direct `lake env lean` elaboration succeeded with only the intended `sorry` warning. A separate scratch copy checked the fully elaborated type of the sole declaration, `canonicalHeightRat_exists_unique` at Suggested.lean:43. It retains K, Field, admissible absolute values, DecidableEq, W and ellipticity; no binder disappears. Its scalar-first tensor convention agrees with README §0.2 after tensor commutation. The actual restriction is q(1⊗P)=canonicalHeight(P), not an arbitrary scalar hypothesis.

The headline inventory is: rational canonical-height extension (§0.2); Poincaré and Faltings–Hriljac comparisons (§§1.1,2.12); strict GL₂ realization (§3.4); half-weight central value and coherent Waldspurger period (§§5.2–5.3); projected kernel and Fourier-height identities (§§8.1,8.6); the shared marked CM-point comparison (§8.8); YZZ/CST and their ring-class/elliptic specializations (§§8.11,8.14–8.19); the algebraic-point subgroup theorem and eigenlogarithm nonvanishing (§§9.2,9.13); weight-two anticyclotomic special values and their logarithmic comparisons (§§9.11–9.22). The statable rational-height headline is present. Suggested.lean:11–26 names the remaining groups and their missing arithmetic models, CM/Jacobian/automorphic, logarithm, measure and Abel–Jacobi interfaces. No stand-in was substituted.

On copies of the only admitted theorem, `simp`, `rfl`, `infer_instance`, and `exact W.canonicalHeightQuadratic` all failed. The last term has type QuadraticMap Z W.Point R, not the asserted unique rational extension. These expected scratch errors are not build failures of the PR. No padding finding follows. No Lean process was left running.

**Pinned declarations opened (15).** Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pin-relative file | Declarations and implication |
| --- | --- |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341` | `canonicalHeightQuadratic`; `_apply`:350; `neronTatePairing`:368; `_apply`:377; `_self`:384. Ellipticity is explicit; the pairing is half polarization of the x-height. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127` | `QuadraticForm.baseChange`, `baseChange_tmul`:131, `QuadraticMap.baseChange_ext`:158. The first changes a ring-valued form; the last gives uniqueness, not the missing R-valued rational-extension existence. |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean:60` | `EisensteinSeries.E2`, normalized by 2ζ(2). |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Summable.lean:107` | `hasSum_qExpansion_E2`: constant 1 and coefficients −24σ₁(n). |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Transform.lean:229` | `E2_slash_action`: the quasimodular defect is explicit, not an assertion that E2 itself is modular. |
| `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:76` | `AbstractMeasure.amiceTransform`; `amiceTransformEquiv`:157 restricts its coefficients to Z_p. This agrees with the broader-coefficient inverse being a supplier contract. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `AbelianVariety` bundles a group scheme, properness and geometric integrality; it does not bundle a Poincaré height or an analytic logarithm. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean:85` | `TangentSpace` is the Zariski tangent space with declared scalar structure; this is not an algebraic-group logarithm map. |

Object searches covered quadratic scalar extension, Poincaré/Faltings–Hriljac heights, canonical-height pairings, regulators, CM moduli/reciprocity, Shimizu/toric periods, graph measures, genus characters, E2 and the point logarithm. No different readable roadmap's Lean file was found declaring the sole theorem's fully qualified name.

**Ownership and citation resolution.** The seven supplied resolver leads reduce to four stale CM names (R02) and three resolved supplier names: `CanonicalModel.special_action` and `special_rational` are in ShimuraVarieties §4.4, README:1068–1069; `SerreTate.homCriterion` is in AbelianSchemesAndArithmeticModuli A4.10, README:2377. They are roadmap contracts, not claims that these names already exist at the pins. Roadmap lookup was used for those citation resolutions, with main preferred where present; these suppliers are not on main and their indexed open text was inspected. Ownership comparisons against open work are restricted to the supplied readable heads; no claim is made for open work whose files were not supplied.

The following resolved object boundaries explain why the remaining constructions belong here or are correctly imported:

| Object | Owner and resolved location | Comparison |
| --- | --- | --- |
| All-order ideal action, full-order CM dictionary and actual units | ImaginaryQuadraticClassNumber H3.1, README:83–89 on main | The cyclic-level adapter remains here; foundational names must be repaired as R02. |
| Graph Green kernel and model curvature | TropicalAndBerkovichArithmetic §§6.6–6.8, README:2204–2304 | Circle/point graph, genus-one, refinement and simultaneous scale conventions agree; §2.3 is the arithmetic adapter. |
| Partial ideal zeta/genus factorization | AnalyticNumberTheoryPartI §§2.8,2.10,2.25, README:1027,1134,1351 | Includes trivial discriminant and ramified Euler factors; the signed Rankin congruence is additional here. |
| V-kernel and Eisenstein families | AutomorphicSpectralTheory §§0.39–0.45,1.14–1.15,1.30, README:711–783,1159,1180,1510 | The source integrals/specializations stay there; the uniform derivative and finite-part adapters stay here. |
| Supersingular curve versus level-pair orders | CM §5.2, README:779–791, refers to SerreWeightAndLevelOptimisation §2.6 | Curve order maximal; level-pair order Eichler. Repoint the import, as R02. |
| Point Kummer/logarithm diagram | PadicHodgeRegulators §1.9, README:605–625 | All reduction types and products covered; §9.5's p-new/cusp/root comparisons remain additional. |
| Integral modular quotients and ordinary coordinates | AbelianSchemesAndArithmeticModuli A4.9–A4.10 | Hom-lifting equality and polarization conditions are on actual Artin bases, including p=2. |
| Heegner family and Euler-system arithmetic | HeegnerPointEulerSystems README:9,15 | Explicitly consumes this roadmap's §§0a.2–0a.4 and heights; no reverse supplier edge added. |
| Holomorphic half-integral-weight formulas | HalfIntegralWeightModularForms scope and §5.1 | Distinct from §5.2's weight-one-half Maass normalization; not an owner of that specific central-value comparison. |
| Curve-square Arakelov extension | `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md:1726` | Its design consumes the present height/skeleton comparison; it is not used as a prerequisite here. |

General heights remain with HeightsRationalPointsAndObstructions; the mixed-source Poincaré line, curve symbol and normalization comparisons are the additional targets here. The existing classical Gross–Zagier formula remains an EffectiveClassNumbers §2.8 import; §8.6 is the stronger Fourier-height identity and §§8.15/8.19 the stated conductor/ramified-level extensions. Search hits alone were not treated as duplicate mathematics.

**Seeded source audit (15 targets).** The legal cached text was used; poorly extracted formulas in Waldspurger pp.184–185 and Gross–Zagier pp.244,271–272 were also read in the cached PDF images. Printed pagination, rather than extraction-page markers, determines the locators. “Supported” below concerns the stated hypotheses and normalization, not a formal verification of a published proof.

| Target | Source locator inspected | Result |
| --- | --- | --- |
| 2.13 | yuan-bigness-pku line 4011, Appendix A.6, pp.118–119 | Positive-genus local admissible metric statement applies. Real descent is the conjugation-invariance/uniqueness consequence, not an extra real-place factor. |
| 3.4 | cst line 202, §1.2 p.4; yzz-book §1.2.1 pp.2–3 and yzz-draft Theorem 3.2.6/Lemma 3.2.7 pp.87–88 | Public statement supports the simple parametrized quotient, strict endomorphism field and rational realization. The two precise YZZ locators remain waived, not newly certified. |
| 5.1 | waldspurger line 418, II.1 Theorem 1 p.184 and II.2 Proposition 3 pp.185–187; gqt line 141, §1.7 pp.3–4 | Split Shimizu identification/factorization and convergence distinction supported. The separate split (3,1) calculation is retained. YZZ comparison locators remain waived. |
| 6.2 | gz86 line 2075, IV §3 (3.3d–e), pp.278–281 | Polynomial and q-integral agree. For t≥a>0, differentiating gives polynomial powers times exp(−xt); x=1+u gives the asserted fixed-order tail. No t=0 bound inferred. |
| 6.30 | gz86 line 1820, IV §1 pp.271–272 | Unnormalized trace, μ(e)ε(e), e and N/e powers agree. Lower-level removal is conditional on the newform orthogonality/projection argument, as stated. |
| 6.34 | gz86 line 2258, IV §4 (4.3), pp.282–283 | Negative-index sign reversal and norm-congruence hypotheses retained. The D=−3 positive/negative control distinguishes the sign. |
| 7.18 | gz86 line 895, II §4 (4.1), p.248 | CM partial-zeta sum, unit and level factors agree; primitive Eisenstein normalization retained. |
| 7.59 | gz86 line 1454, III §7 Proposition (7.3)(2), p.262, referring to III (4.2), p.257 | Hom lattice and degree Nb/Na supported, including the ideal denominator. |
| 7.81 | gz86 line 755, II (3.4)–(3.5), p.244 | Norm expression supported; roadmap correctly repairs the printed bc coefficient. Values 11 versus 12 below distinguish them. |
| 7.71 | gz86 line 1000, II (5.7), p.251 | Diagonal finite part and u·r_A(m) stabilizer multiplicity supported. The neighboring (5.6) constant has the sign issue recorded below. |
| 7.89 | gz86 line 1529, III (8.5)(1), p.264; conrad line 2989, Theorem 10.5(1), pp.134–139 | Inert sum excludes b−=0 and retains (u r_A(m)/2)ord_p(m). Conrad explicitly uses the modified GZ intersection, as does this target. |
| 9.2 | fuchs-pham line 77, Theorem 2.2 p.2; bsw line 423, Theorems 3.1–3.2 pp.9–10 | Algebraic point, logarithm domain and nonzero logarithm hypotheses retained. Connected-component passage uses a multiple; does not assert the original point lies in the identity component. |
| 9.6 | prasanna line 398, Theorem 2.3 p.910; line 490, Theorem 2.4 p.912, with §2.1 p.907 | Squarefree level, rational differential structure, primitive lattice, p>k+1 and excluded bad factors retained. No integral JL map inferred. |
| 9.8 | brooks line 1584, §6.4 p.4224; line 1735, Lemma 7.5 p.4229; bdp line 1107, Remark 2.6/Proposition 2.7 p.1063 | Weight-zero-cycle specialization is the degree-zero divisor; AJ equals the formal logarithm on its differential evaluation. The roadmap uses Fil¹, correcting Brooks's displayed full-cohomology shorthand. |
| 9.18 | jsw line 1370, §5.1.5 Propositions 5.1.6–5.1.7, pp.34–35 | p-optimal quotient, residual and good-reduction hypotheses, cotangent comparison and p-unit normalization agree. The underlying general Néron-model source remains uncertified. |

**Computed adversarial record.** There are 290 rows below, one for each numbered target, in README build order. The table records a value, domain exclusion or explicit scalar/rank computation for each target; it is not a claim to compute every global L-value. Symbols H,B,a denote fixed nonzero height/pairing/coefficient values when a row tests homogeneity. Rows about projections, zero inputs and scalar factors certify only that part of the statement. “Agrees” means the displayed test agrees with the claim; the other findings and source-access limits still apply. The actual E37 calculation used E:y²+y=x³−x and P=(0,0): #E(F11)=17, t(17P)=5640481/5106896≡22 mod121, and log(P)≡22/17=44 mod121. No inherited numerical result is being substituted for that computation.

| Target (README line) | Instances | Computed sides or discriminating values | Result / change |
| --- | --- | --- | --- |
| §0a.1 (151) | c=d; Q(i), c=1,d=3; C3 inversion | kernel size 1; class numbers 1,2 give relative degree 2; g maps to g²≠g | Agrees; retain. |
| §0a.2 (177) | D=−3,N=1; ideal (2) | automorphism count 6, not 2; kernel order and ideal norm both 4 (noncyclic (2) excluded for cyclic level) | Agrees; retain. |
| §0a.3 (207) | order conductor c versus c+1 | B∩R=O_c passes; B∩R=O_(c+1) fails equality | Agrees; retain. |
| §0a.4 (231) | C3 arithmetic/geometric Artin | exponents 1 and −1=2; applying both gives 0 | Agrees; retain. |
| §0a.5 (263) | fine level 3; automorphism −1 | −1 acts by 2≠1 on Z/3; level 2 instead gives 1=1 | Agrees; retain. |
| §0.1 (303) | q(nP)=n²H; rank 0 | half polarization (4H−H−H)/2=H; empty determinant 1 | Agrees; retain. |
| §0.2 (326) | r=0,1/2,1,2; torsion P | q(r⊗P)=0,H/4,H,4H; torsion value 0 on both sides | Agrees; retain. |
| §0.3 (354) | s=1; central zero | Γ_C(1)=2/(2π)=1/π; completed derivative √N L′/π | Agrees; retain. |
| §0.4 (370) | D=−7,−4,−3 | unit counts 2,4,6; u=1,2,3; inverse squares 1,1/4,1/9 | Agrees; retain. |
| §0.5 (399) | C3; ζ=2 in F7 | ζ inverse 4; 2·4=1, while 2²=4≠1 | Agrees; retain. |
| §0.6 (422) | two real components | full period 2Ω₀, identity period Ω₀; ratio 2 | Agrees; retain. |
| §0.7 (436) | real quadratic character; split place | λ²=−1 respectively 1; volume scale 4 gives pairing scale 16 | Agrees; retain. |
| §0.8 (468) | inert prime coefficient; split prime | quadratic Euler coefficient 0 respectively 2a; character product agrees | Agrees; retain. |
| §0.9 (493) | fixed orbit of size 3 | trace 3P, average P; quadratic heights 9H and H | Agrees; retain. |
| §0.10 (507) | pairing scales 2 and 3; rank r | bilinear value 6B; scaling form by 2 gives determinant 2^r det | Agrees; retain. |
| §0.11 (521) | [H:K]=3,[K:Q]=2 | H-relative height 3H_K; K-relative height 2H_absolute | Agrees; retain. |
| §0.12 (533) | D=−23,N=2,C3 | Fricke class 0→2→0; inverse convention would first give 1 | Agrees; retain. |
| §1.1 (563) | elliptic principal polarization; dual −P | Poincaré diagonal H; negating dual point gives −H | Agrees; retain. |
| §1.2 (591) | M=Q(√5), basis 1,√5 | trace Gram diag(2,10); dual basis 1/2,√5/10 gives diag(1,1) | Agrees; retain. |
| §1.3 (621) | isogeny [2] | degree 4 and pulled-back diagonal height 4H | Agrees; retain. |
| §1.4 (635) | C3 eigencharacters ζ and ζ⁻¹ | product 1 permits B; matched ζ,ζ gives ζ²≠1 and B=0 | Agrees; retain. |
| §1.5 (663) | C2 fixed vector; zero module | trace 2x divided by 2 is x; zero maps to zero | Agrees; retain. |
| §2.1 (688) | squared metric versus norm | −log(norm²)=2(−log norm); tensor product gives sum, not product | Agrees; retain. |
| §2.2 (716) | g=1,2 | g orthonormal summands divided by g have total mass 1 in both cases; g=0 excluded | Agrees; retain. |
| §2.3 (743) | circle length 2; point graph | g(0)=1/6,g(1)=−1/12, mean 0; point kernel 0 and measure mass 1 | Agrees; retain. |
| §2.4 (765) | line degree 2; degree 0 | curvature mass 2 respectively 0, equal to degree·mass(μ) | Agrees; retain. |
| §2.5 (792) | two-component matrix [−2,2;2,−2]; P1 example | corrected intersection 1/2 gives −log(q)/2; P1 intersection −1 gives +log p | Agrees; retain. |
| §2.6 (823) | degree-zero divisor; one point | Green equation masses 0−0=0 and 1−1=0 | Agrees; retain. |
| §2.7 (850) | multiply metric by exp(1) | curvature unchanged; normalization shifts by 1, excluding the wrong constant | Agrees; retain. |
| §2.8 (864) | mean-zero kernel versus g+1 | means 0 and 1; only first satisfies normalization | Agrees; retain. |
| §2.9 (891) | weak normalization on degree 2 | mean correction −2 versus −1 for degree 1; degree-zero correction 0 | Agrees; retain. |
| §2.10 (924) | g=1,2 | dualizing curvature mass 0 respectively 2, equal to 2g−2 | Agrees; retain. |
| §2.11 (951) | P1 divisors (1)−(2), (0)−∞ | squared-norm symbol −2log2, equal to log of squared absolute ratio | Agrees; retain. |
| §2.12 (982) | principal divisor; multiplication [2] | global product-formula sum 0=height 0; quadratic scale 4 on both sides | Agrees; retain. |
| §2.13 (996) | conjugation-invariant metric; asymmetric candidate | conjugate norms 1,1 descend; values 1,2 fail invariance | Agrees; retain. |
| §2.14 (1023) | ramification index 2 | residue-normalized coefficient 1/2; multiplying back by 2 gives 1 | Agrees; retain. |
| §2.15 (1048) | one complex place, two embeddings | embedding sum 2a equals weighted-place value 2a; extra doubling gives 4a | Agrees; retain. |
| §3.1 (1084) | odd bounds (a,b)=(2,1); dyadic (4,2,k=2) | odd lower expression −1/2; dyadic expression 1; dropping dyadic term changes bound | Agrees; retain. |
| §3.2 (1126) | Hodge degree d; cover degree 2 | normalized class degree 1; pullback degree 2 | Agrees; retain. |
| §3.3 (1155) | zero morphism; ξ degree 1 | normalization subtracts 0; constant c subtracts c·1, giving 0 | Agrees; retain. |
| §3.4 (1185) | coefficient degree 1,2; multiplicity 2 | rank-two dimensions 2,4 match 2dim A; multiplicity 2 instead gives 4,8 | Agrees; retain. |
| §3.5 (1208) | parametrization followed by [2] | differential factor 2c, degree 4d; constants alone are excluded | Agrees; retain. |
| §3.6 (1235) | degree 2, volume 2 | normalized composition 1; unnormalized composition 2 | Agrees; retain. |
| §3.7 (1265) | e=1,p=3 and p=2 | 1<2 true; 1<1 false, so dyadic boundary is excluded | Agrees; retain. |
| §3.8 (1279) | c divides 6d; d=1 | allowed c=1,2,3,6; c=5 fails divisibility | Agrees; retain. |
| §3.9 (1293) | ω=2πif dz | iω∧conj(ω)=8π² norm(f)² dxdy | Agrees; retain. |
| §3.10 (1307) | isogeny degree 2 at p=5 | 2 is a p-unit, so valuations of transported unit factors remain 0 | Agrees; retain. |
| §3.13 (1321) | two components versus one | c∞=2 versus 1; Ω_full=c∞Ω₀ in both cases | Agrees; retain. |
| §4.1 (1344) | central character product −1 | equivariance gives l=−l, hence l=0 in characteristic 0 | Agrees; retain. |
| §4.2 (1371) | two quaternion alternatives | local Hom dimensions (1,0) or (0,1), sum 1 | Agrees; retain. |
| §4.3 (1385) | zero vector | unnormalized toric form 0; quotient 0/0 is not used | Agrees; retain. |
| §4.4 (1413) | conductor exponents c<n at nonsplit place | incompatible fixed/eigen line dimension 0; admissibility excludes it | Agrees; retain. |
| §4.5 (1440) | unramified spherical datum | normalized local factor 1; empty exceptional-place product 1 | Agrees; retain. |
| §4.6 (1454) | nonzero one-dimensional toric line | nonzero functional has rank 1; zero vector evaluates 0 and is excluded | Agrees; retain. |
| §4.7 (1468) | q=3 spherical; real weight 2 | Whittaker norm 9/2 and α=1; real norm 1/(8π²), α=1/4 | Agrees; retain. |
| §5.1 (1504) | binary (m,r)=(2,0); split ternary (3,1) | anisotropic converges; 3−1=2 is not >2, so ordinary convergent-range theorem does not cover split case | Agrees; retain. |
| §5.2 (1533) | d=±1; form scaled by 2 | gamma arguments have real parts 1/4,3/4; coefficient square and norm both scale 4 | Agrees; retain. |
| §5.3 (1560) | vectors scaled 2,3; torus volume scaled 4 | bilinear sides scale 6; two periods scale 16 | Agrees; retain. |
| §5.4 (1587) | one local toric Hom zero | period and normalized factor both 0; nonvanishing conclusion requires all factors nonzero | Agrees; retain. |
| §5.5 (1601) | new vector scaled 2 | period square scale 4; normalized local quotient compensates by 1/4 | Agrees; retain. |
| §5.6 (1615) | Whittaker characters ψ and ψ⁻¹ | unipotent multipliers multiply to 1; ψ with ψ gives ψ² instead | Agrees; retain. |
| §6.1 (1646) | k=2 exponential seed | integral y²exp(−4πmy)=2/(4πm)³; normalizing factor returns 1 | Agrees; retain. |
| §6.2 (1677) | terminating orders 0,1,2 at t=1; q0 derivative | polynomials 1,0,−1/2; q0′(1)=−exp(−1) | Agrees; retain. |
| §6.3 (1700) | correspondence of degree 2 | pushforward degree 2; normalization by 2 gives degree 1 | Agrees; retain. |
| §6.4 (1727) | component degrees (1,−1) | total degree 0 but both component degrees nonzero; componentwise condition is stronger | Agrees; retain. |
| §6.5 (1754) | empty proper truncation; exponential growth | empty sum 0; exp(p^(4n)) defeats polynomial majorant, hence excluded | Agrees; retain. |
| §6.6 (1782) | I(s)=s | I(0)=0 but I′(0)=1; central vanishing does not imply derivative vanishing | Agrees; retain. |
| §6.7 (1807) | one mismatched local sign | product of local signs −1; changing that sign gives +1 | Agrees; retain. |
| §6.8 (1832) | constant 1 on orbit size 3 | average 1; unnormalized sum 3 | Agrees; retain. |
| §6.9 (1857) | one versus two zero local factors | derivatives of s and s² at 0 are 1 and 0 | Agrees; retain. |
| §6.10 (1882) | inert p=11 in Q(√−3) | Euler series 1+11^(−2s)+…; norm-11 coefficient 0 | Agrees; retain. |
| §6.11 (1909) | torsion divisor class | all height coefficients 0; cusp form 0 | Agrees; retain. |
| §6.12 (1921) | degree-two trace | trace of pullback constant 2; normalized trace 1 | Agrees; retain. |
| §6.13 (1933) | oldform f(q²), level divisible by 2 | odd coefficients 0 although even coefficient a2 can be 1 | Agrees; retain. |
| §6.14 (1945) | scalar residue c=2 modulo 7 | inverse 4 gives 2·4=1; using 2 gives 4 | Agrees; retain. |
| §6.15 (1957) | bijection of two ramified ideal indices | two summands a+b become b+a; sum unchanged | Agrees; retain. |
| §6.16 (1969) | D=−3, n=3 and −3 | paired genus signs (1,−1) and (1,1) | Agrees; retain. |
| §6.17 (1996) | zero index with w=6 | r(0)=1/6; it is not the positive-ideal count 0 | Agrees; retain. |
| §6.18 (2008) | z=i; first two q coefficients | E2*(i)=0; E2(i)=3/π; coefficients −24,−72 | Agrees; retain. |
| §6.19 (2034) | p=2, exponent 1 | [[1,1/4],[1,1]]·(1/3)[[4,−1],[−4,4]]=I | Agrees; retain. |
| §6.20 (2046) | F=Q constant coefficient | factor 1/2 retained; doubling would give 1 | Agrees; retain. |
| §6.21 (2073) | q=2 auxiliary integral | j=−1/7, not 0 | Agrees; retain. |
| §6.22 (2098) | Q2(i), discriminant exponent 2 | wild correction retains exponent 2; tame replacement exponent 1 differs | Agrees; retain. |
| §6.23 (2123) | first admissible shell versus outside support | admissible shell can contribute q^(−a); forbidden shell contributes 0 | Agrees; retain. |
| §6.24 (2135) | product s·u(s), u(0)=2 | derivative 2; differentiating a second vanishing factor would give 0 | Agrees; retain. |
| §6.25 (2149) | nontrivial discriminant character of order 2 | character at negative test element −1; forgetting it gives +1 | Agrees; retain. |
| §6.26 (2161) | inert prime | odd norm coefficient 0 on both ideal and Rankin sides | Agrees; retain. |
| §6.27 (2173) | k=1, Re(s)=2 and 3/2 | 2>3/2 is inside convergence half-plane; equality is excluded | Agrees; retain. |
| §6.28 (2185) | r_A(m)=0 versus 1 | CM intersection support empty versus nonempty; disjointness iff zero tested in both directions | Agrees; retain. |
| §6.29 (2197) | Mellin exponent 2 | ∫y exp(−4πmy)dy=(4πm)^(−2), fixing 4π | Agrees; retain. |
| §6.30 (2209) | N=2,k=1,s=1 | e=1 coefficient 1/2; e=2 coefficient −ε(2)/8; normalized trace would introduce another index | Agrees; retain. |
| §6.31 (2221) | N=37,k=1,s=2 | scalar 1369/(32π³); convolution 37·3+1=112 retains nonzero summand | Agrees; retain. |
| §6.32 (2246) | D=−7; rows [1:1],[2:2] | inverse products both 1 mod7; direct products 1,4 differ; coset count 8 | Agrees; retain. |
| §6.33 (2258) | t=2 prime discriminants | ordered sign choices 2²=4; quotienting prematurely gives 2 | Agrees; retain. |
| §6.34 (2283) | D=−3, divisors of n=±3 | ε(3,1),ε(3,3)=(1,−1); ε(−3,1),ε(−3,3)=(1,1) | Agrees; retain. |
| §6.35 (2295) | n=3 and −3, D=−3 | signed derivative sum 2log3; negative-index ordinary signed sum 2 | Agrees; retain. |
| §6.36 (2320) | coprime m=2,n=3 | divisors of 6 are 1,2,3,6, matching four pairs; m=n=2 fails pair uniqueness | Agrees; retain. |
| §6.37 (2332) | cusp denominator M=2, coprime auxiliary modulus | leading scale 1/4; logarithmic term log(1/2), not log2 | Agrees; retain. |
| §6.38 (2344) | constant torus-pair kernel, volume 3 | outer integral 3; normalized inner average 1 | Agrees; retain. |
| §6.39 (2373) | spherical local inputs | local normalized factors 1; global remaining ratio L_ad/(2ζ), not L_ad/ζ | Agrees; retain. |
| §6.40 (2387) | degree 4, N=±1; positive N=1,3 | both (1±i)^(−4)=−1/4; positive choices have moduli 1/4 and 1/100 | Agrees; retain. |
| §6.41 (2399) | coefficient i in conjugate-linear slot | conjugation gives −i; failing to conjugate gives i | Agrees; retain. |
| §6.42 (2416) | U2 acting on q² | result q; coefficient index 2→1, not 1→2 | Agrees; retain. |
| §6.43 (2428) | one prime discriminant | two ordered contributions; imaginary phase −i retained rather than +1 | Agrees; retain. |
| §6.44 (2440) | two Weyl terms at zero index | constant coefficient a+b; deleting one leaves a | Agrees; retain. |
| §6.45 (2452) | positive versus negative Fourier frequency | positive terminating contribution and negative q-integral differ; zero-frequency branch separate | Agrees; retain. |
| §6.46 (2464) | D=−3,n=−3 | σ(−3)=2; δ(3)R(3)=2·1=2 | Agrees; retain. |
| §6.47 (2476) | boundary Eisenstein against cusp form | cuspidal constant term 0 makes boundary contribution 0 | Agrees; retain. |
| §6.48 (2488) | α=β=1 boundary exponents | endpoint contribution 1; deleting boundary gives 0 | Agrees; retain. |
| §6.49 (2500) | nontrivial finite character on C2 | sum 1+(−1)=0; trivial character gives 2 and needs exclusion | Agrees; retain. |
| §6.50 (2512) | W0(s)=2^(−s)a | W0′(0)=−a log2; corrected derivative 0 | Agrees; retain. |
| §6.51 (2537) | torsion CM class | height-series coefficients 0 and cuspidal projection 0 | Agrees; retain. |
| §6.52 (2549) | four Hodge terms; d=2 | sign pattern +,−,−,+ gives constant cancellation 0; retained archimedean coefficient −1 | Agrees; retain. |
| §6.53 (2561) | N=2,n=1,l=1,mδ=3 | index equation 2·1+1=3; dropping N gives 2≠3 | Agrees; retain. |
| §6.54 (2573) | n=6 | log6=log2+log3; only corresponding valuation terms 1,1 occur | Agrees; retain. |
| §6.55 (2585) | a/s+b−a/s | finite part b; taking separate totalized values loses b | Agrees; retain. |
| §6.57 (2597) | good inert place, valuation 1 | derivative log q, not 0; arithmetic partner log q | Agrees; retain. |
| §6.58 (2615) | nonzero Fourier mode | pole coefficient 0 for that mode; possible constant-mode residue retained | Agrees; retain. |
| §6.59 (2627) | even and odd valuation 2,3 | parities 0,1; inert norm has even valuation only | Agrees; retain. |
| §6.60 (2639) | one versus two zero Euler factors | s·2 has derivative 2; s²·2 has derivative 0 | Agrees; retain. |
| §6.61 (2651) | d=2 | archimedean projection constant −γ−log(4π), not twice this | Agrees; retain. |
| §6.56 (2663) | linear projection with correction K | Pr(I′)=Pr(main)−2K; K=1 gives subtraction 2 | Agrees; retain. |
| §6.62 (2675) | k=1 terminating branch | degree-zero polynomial; all higher coefficients 0 | Agrees; retain. |
| §6.63 (2692) | k=1,s=1 | reflected parameter −1; applying reflection twice returns 1 | Agrees; retain. |
| §6.64 (2704) | central parameter 0 | holomorphic value may have constant term 1; cuspidality does not follow from regularity | Agrees; retain. |
| §6.65 (2716) | k=1,s=0 | functional-equation partner 2; centre 1 fixed | Agrees; retain. |
| §6.66 (2728) | k=1,D=−7 | central coefficient 8π²/√7 | Agrees; retain. |
| §6.67 (2740) | negative index −3, D=−3 | negative divisor sum 2; substituting positive sum 0 deletes a real term | Agrees; retain. |
| §6.68 (2752) | weight 2, root sign −1 | central equation L(1)=−L(1) gives 0; order can be 1 or 3 | Agrees; retain. |
| §6.69 (2764) | k=1,h=u=1 | prefactor (2π)²·2/√δ=8π²/√δ | Agrees; retain. |
| §6.70 (2789) | h=u=N=N1=1 | cusp prefactor h/(2u²)·N1/N=1/2 | Agrees; retain. |
| §6.71 (2801) | zero constant term versus nonzero constant term | Mellin constant-tail integral 0 versus divergent unregularized integral | Agrees; retain. |
| §6.72 (2813) | D=−7, zero endpoint | δ(0)r(0)=2·(1/2)=1 | Agrees; retain. |
| §6.73 (2825) | nontrivial C2 genus character | sum 1−1=0; compatible trivial branch gives 2 | Agrees; retain. |
| §6.74 (2839) | unit boundary coefficients | product 1·1=1, not 0 | Agrees; retain. |
| §6.75 (2851) | test vector scaled 2 | definite period scales 2; its square and norm scale 4 | Agrees; retain. |
| §6.76 (2863) | k=1 derivative normalization | 8π²/√δ remains; omitted unit factor u=3 changes height coefficient by 9 | Agrees; retain. |
| §6.77 (2875) | period scaled 2; zero period | square-class multiplier 4 is a square; zero has no multiplicative square class | Agrees; retain. |
| §6.78 (2893) | u=3 coefficient a=1 | height coefficient 9, matching u²a | Agrees; retain. |
| §7.1 (2916) | square-zero thickening in characteristic 2 | Q=1+ε has Q³=1+ε=Q; length(O/π^r)=r | Agrees; retain. |
| §7.2 (2943) | q=3,s=1 | first lifting length 2; third inert length 6 versus ramified 8 | Agrees; retain. |
| §7.3 (2986) | isogeny and its negative; zero morphism | nonzero maps remain distinct in actual Hom; zero degree 0 is excluded from isogenies | Agrees; retain. |
| §7.4 (3015) | one versus two local zeros | s derivative 1; s² derivative 0, requiring both S2 places | Agrees; retain. |
| §7.5 (3051) | nonzero coherent kernel orthogonal to π | projection 0; kernel itself need not be 0 | Agrees; retain. |
| §7.6 (3069) | Q3(√3),Q2(i),split | lattice indices 3,4,1; full equality fails in first two | Agrees; retain. |
| §7.7 (3081) | n=v(ad)+1 | norm-shell admissibility fails, count 0; boundary n=v(ad) retained | Agrees; retain. |
| §7.8 (3093) | ramified quadratic discriminant exponents 1 and 2 | wild shell correction differs by one valuation unit | Agrees; retain. |
| §7.9 (3105) | archimedean δ=1 | logδ=0; δ=2 gives log2 | Agrees; retain. |
| §7.10 (3117) | valuation n=1 versus 2 | linear local correction c logq versus 2c logq | Agrees; retain. |
| §7.11 (3129) | a/s+b multiplied by 1+cs | finite part b+ca, not b | Agrees; retain. |
| §7.12 (3157) | valuation 0,r=1,q=3 | diagonal auxiliary value 1/(q−1)=1/2 | Agrees; retain. |
| §7.13 (3182) | reduced-norm valuation 2 | division multiplicity 2/2=1 | Agrees; retain. |
| §7.14 (3194) | degree-zero same-component divisor | component degree 1−1=0, vertical contribution 0 in stated specialization | Agrees; retain. |
| §7.15 (3206) | q=2 special test function | nonzero auxiliary integral 1/7 distinguishes zero theta datum | Agrees; retain. |
| §7.16 (3218) | λ=−1,k=0 | derivative kernel value (log2)/2 | Agrees; retain. |
| §7.17 (3245) | generic PSL2 stabilizer | effective stabilizer order 1; unreduced SL2 count 2 gives wrong double | Agrees; retain. |
| §7.18 (3257) | N=2,s=2 | level multiplier 1/(1+2²)=1/5 | Agrees; retain. |
| §7.19 (3269) | tangent scaled by t | finite part shifts by log norm(t); t=1 gives 0 shift | Agrees; retain. |
| §7.20 (3294) | D=−3,u=3 | tensor-normalizing exponent 1/3, not 1 | Agrees; retain. |
| §7.21 (3319) | N=1 versus N=2 at p∤2 | pair order discriminant p versus 2p; second is not maximal globally | Agrees; retain. |
| §7.22 (3331) | connected versus étale degree-two kernel | component indices (1,0) versus (0,1) | Agrees; retain. |
| §7.23 (3343) | six nonzero Hom representatives | quotient by ± gives 3, not 6 | Agrees; retain. |
| §7.25 (3368) | q=2, δ=1/4, n=1/4 | 2n log2+(1/2)logδ=0 | Agrees; retain. |
| §7.26 (3391) | inert singular term a log norm(t) | subtracting same term leaves finite remainder b, not infinity | Agrees; retain. |
| §7.27 (3403) | ramified different exponent 2 | retained extra valuation 2; dropping different changes length by 2 | Agrees; retain. |
| §7.28 (3415) | ramification index e=2 | normalized differential length Ω/2; pulling back doubles it to Ω | Agrees; retain. |
| §7.29 (3440) | horizontal M, diagonal N | full M+N−diagonal; M=2,N=1,diagonal=1 gives 2 | Agrees; retain. |
| §7.30 (3452) | split diagonal in stated convention | extended value 0, not the nonsplit self-term | Agrees; retain. |
| §7.31 (3464) | norm valuation 2 | local division multiplicity 1 | Agrees; retain. |
| §7.32 (3476) | zero determinant versus unit norm | singular input omitted; unit indicator 1 at norm 1 and 0 at norm π | Agrees; retain. |
| §7.33 (3488) | adjunction-normalized tangent | log-singular term cancels, residual correction 0 in normalized test | Agrees; retain. |
| §7.34 (3500) | only diagonal orbit survives before omission | after omission sum 0; counting it gives 1 | Agrees; retain. |
| §7.35 (3512) | inert v=1; ramified v=1,different=1 | lengths (1+1)/2=1 and (1+1)/2=1 | Agrees; retain. |
| §7.36 (3524) | m=2,s=2 | Hecke eigenvalue 2²+2^(−1)=9/2; σ1(2)=3 differs | Agrees; retain. |
| §7.37 (3541) | rational t=2 | log norm product 0: real log2 plus 2-adic −log2 | Agrees; retain. |
| §7.38 (3553) | eta tangent power u=3 | g=(cΔz)³; 1/u log norm(g) recovers log norm(cΔz) | Agrees; retain. |
| §7.40 (3565) | D=−7,p=3,q=23 | pq=69≡−1 mod7; q=11 gives 33≡5 and fails | Agrees; retain. |
| §7.41 (3593) | vertical correction and orthogonal divisor | component pairing 0; uncorrected degree vector (1,−1) is nonzero | Agrees; retain. |
| §7.43 (3605) | six diagram isomorphisms | half count 3 agrees with multiplicity normalization | Agrees; retain. |
| §7.46 (3617) | tangent π versus π⁻¹ | self lengths 1 and −1; pole cannot be silently truncated to 0 | Agrees; retain. |
| §7.46a (3642) | matrix [−2,2;2,−2], e=1,q=5 | i+j=1/2 but §2.5 symbol=−log5/2≈−0.804719 | R01 |
| §7.47 (3670) | same matrix; volume 3; two local zeros | −(i+j)log5=−log5/2; constant outer average 3; derivative(s²)=0 | R01 normalization consistency |
| §7.48 (3743) | d=2 Hodge term | archimedean coefficient −d/2=−1 | Agrees; retain. |
| §7.49 (3755) | split maximal-level diagonal | proper term 0 and extended diagonal 0 | Agrees; retain. |
| §7.50 (3767) | inert v=1,3 | lengths (v+1)/2=1,2 | Agrees; retain. |
| §7.51 (3779) | ramified v=1,different exponent 2 | normalized multiplicity (v+d)/2=3/2; tame replacement gives 1 | Agrees; retain. |
| §7.52 (3791) | q=2 | n=−1/7,c=−2log2/7,d=0 | Agrees; retain. |
| §7.53 (3803) | ramification degree 2 | raw intersection doubles, normalized value divides by 2 and is unchanged | Agrees; retain. |
| §7.54 (3815) | cusp width 10 | first exponential exp(−πY/5); dividing by exp(−Y) grows, so width-independent bound fails | Agrees; retain. |
| §7.55 (3833) | m=1 | ± representatives divided by 2 give one identity correspondence | Agrees; retain. |
| §7.56 (3858) | two unit generators ±1 | generator count 2, ideal count 1; quotient is necessary | Agrees; retain. |
| §7.57 (3870) | intersection length 1,residue q | local height −logq, matching negative-intersection convention | Agrees; retain. |
| §7.60 (3882) | j=1728 | 2^6·3^4=5184 in tangent normalization | Agrees; retain. |
| §7.61 (3894) | principal ideal a=tO, b=t | Nb/Na=1; t=2 gives 4/4=1, not 4 | Agrees; retain. |
| §7.62 (3919) | D=−7,p=7,q=2 | n=14, v7(n)=1; the lattice calculation gives 3−2=1 | Agrees; retain. |
| §7.45 (3947) | congruence n=1,2 | inert indices p,p³; ramified indices p,p²; common p^n guess fails | Agrees; retain. |
| §7.59 (3959) | a=tO,b=t; t=2 | identity morphism degree 1 equals Nb/Na=4/4 | Agrees; retain. |
| §7.24 (3971) | CM-linear versus new anti-CM map | b−=0 gives liftable diagonal; b−≠0 enters new-Hom count | Agrees; retain. |
| §7.42 (3996) | degree prime to p | étale lifting multiplicity 1; p-divisible degree is excluded | Agrees; retain. |
| §7.58 (4008) | p=3,t=2 | inert total 1+3+9=13; split 3+4+6=13; ramified 1+3+9=13 | Agrees; retain. |
| §7.39 (4043) | two isomorphisms, residue degree 2 | −(2/2)·2logp=−2logp | Agrees; retain. |
| §7.44 (4055) | split prime and r_A(m)=0 | intersection multiplicity 0; the r_A(m)>0 diagonal branch is excluded | Agrees; retain. |
| §7.63 (4067) | tensor exponent 6, root stabilizer | scaling tangent π changes tensor by π^6 and normalized log by log normπ | Agrees; retain. |
| §7.65 (4095) | d=2 | full local decomposition retains −E*, since −d/2=−1 | Agrees; retain. |
| §7.66 (4107) | split pair of conjugate primes | two half-log terms sum to full log, which cancels the diagonal correction | Agrees; retain. |
| §7.67 (4119) | e=2, raw lattice length 2 | normalized intersection 1; omitting 1/e gives 2 | Agrees; retain. |
| §7.69 (4131) | N=2,γ=[1,1;2,3] | wγw⁻¹=[3,−1;−2,1], both det1 and lower-left 0 mod2 | Agrees; retain. |
| §7.70 (4143) | C3 versus C2 square map | square fibre sizes 1 and 2; class pair cannot be recovered uniquely in C2 | Agrees; retain. |
| §7.72 (4168) | inert valuations 1,3 | local lengths 1,2; zero anti-CM component excluded | Agrees; retain. |
| §7.73 (4180) | v_p(DNb−)=2 | ramified local length 2 | Agrees; retain. |
| §7.74 (4192) | two extra automorphisms at one layer | half count (2/2)=1; no new automorphisms gives 0 | Agrees; retain. |
| §7.75 (4204) | D=−7,p=3,q=23,a=O,b=j | Nb=69,n=483; 0+3·161=483=69·7 | Agrees; retain. |
| §7.76 (4230) | cotangent self value 0, correction −1 | modified value 1; identifying the two pairings loses 1 | Agrees; retain. |
| §7.77 (4258) | good-place analytic and arithmetic term logq | difference logq−logq=0; neither term separately vanishes | Agrees; retain. |
| §7.78 (4270) | e=2, raw i0=−6 | normalized correction −3 | Agrees; retain. |
| §7.79 (4282) | N=2 | κ_N=−4 in stated normalization; residues cancel in the four-term kernel | Agrees; retain. |
| §7.68 (4300) | four resolvent residues κ,−κ,−κ,κ | total residue 0; adding constant 1 changes prescribed cusp limit by 1 | Agrees; retain. |
| §7.80 (4325) | C2 genus-orbit square map | square fibre size 2; treating it as bijective gives 1 | Agrees; retain. |
| §7.81 (4337) | D=−7,N=2,τ=(-1+i√7)/4,γ=[1,1;2,3] | n=2·abs(τ−2)²=11; roadmap polynomial 11; printed GZ polynomial 12 | Agrees; retain. |
| §7.82 (4349) | resolvent parameters s=2,s0=1 | spectral difference s(s−1)−s0(s0−1)=2 | Agrees; retain. |
| §7.71 (4367) | D=−3,m=1,u=3,r(1)=1 | diagonal stabilizer count 3; finite-part term 3g, not 0 or g | Agrees; retain. |
| §7.83 (4392) | six new Hom elements | new intersection half count 3; liftable elements excluded | Agrees; retain. |
| §7.84 (4404) | u=1,δ=2 | orbit multiplier 2; an additional ± quotient would give 1 | Agrees; retain. |
| §7.85 (4416) | u=3,raw self-count 6 | normalized diagonal count 6/2=3, not 1 | Agrees; retain. |
| §7.86 (4430) | nonsplit different contribution d and −d | sum 0; deleting either leaves ±d | Agrees; retain. |
| §7.87 (4442) | tangent normalized constant C | same C in both archimedean terms cancels; changing one by 1 leaves 1 | Agrees; retain. |
| §7.88 (4454) | γ=id, equal CM points | hyperbolic n=0; retained diagonal would violate the off-diagonal n>0 restriction | Agrees; retain. |
| §7.89 (4466) | inert m=p²,u=r_A(m)=1 | diagonal term (1/2)·1·1·2=1; formula without it gives 0 | Agrees; retain. |
| §7.90 (4478) | ramified m=p²,u=r_A(m)=1 | diagonal term 1·1·2=2 | Agrees; retain. |
| §7.91 (4490) | split r_A(m)=2,κ=1 | κ/r=1/2; r=0 branch does not form 0/0 | Agrees; retain. |
| §7.92 (4502) | D=−3,u=3, one level-prime intersection | local J=−3; disjoint branch gives 0 | Agrees; retain. |
| §7.93 (4514) | inert residue degree 2 and h/2 places | sum (h/2)·2logp=h logp | Agrees; retain. |
| §7.94 (4541) | m=2,s=2 | eigenvalue 9/2; replacing it by σ1(2)=3 changes archimedean expression | Agrees; retain. |
| §7.95 (4553) | u=3 | 2u²=18, not 2 | Agrees; retain. |
| §7.96 (4565) | λ=0,κ=1,σ1(m)=1 | constant −λ+2κ=2; printed −λ−2κ gives −2 | Agrees; retain. |
| §7.97 (4577) | m=1 and one split level prime | correction +uh logp; zero correction misses it | Agrees; retain. |
| §7.98 (4589) | D=−7,N=2,m=p=3 | δ(6)R(2)ord3(18)=1·2·2=4; finite term −4log3 | Agrees; retain. |
| §7.99 (4601) | ramified different exponent 2 | norm parameter retains two valuation units, unlike tame exponent 1 | Agrees; retain. |
| §7.100 (4613) | u=3, positive ideal counts both 1 | multiplier u² is 9 when D∤n and 18 when D divides n | Agrees; retain. |
| §7.101 (4625) | two prime discriminants | 2² ordered choices; genus quotient counts 2, not 4 | Agrees; retain. |
| §7.102 (4637) | r_A(m)=0 | diagonal term 0; remaining finite expression retains −u²σ′ contributions | Agrees; retain. |
| §7.103 (4649) | u=3, one counted orbit | coefficient −2u²=−18 | Agrees; retain. |
| §7.104 (4661) | two genus classes with equal kernel a | orbit sum 2a; probability average a | Agrees; retain. |
| §7.105 (4673) | D=−3,n=3 | δ(3)=2; using unramified value 1 loses half the count | Agrees; retain. |
| §7.106 (4685) | spectral difference 2; h orbit points | summed constant 2h | Agrees; retain. |
| §7.107 (4697) | resolvent pole coefficient hσκ | subtracting hσκ/(s−1) leaves finite part; pole coefficient is not 0 individually | Agrees; retain. |
| §7.108 (4709) | u=3,r_A(m)=1 | extra diagonal coefficient 2hu r=6h | Agrees; retain. |
| §7.109 (4721) | one complex place | two embeddings give 2a; one place weighted 2 also gives 2a | Agrees; retain. |
| §8.2 (4744) | C3 over F7,ζ=2; characteristic 3 | vector (1,2,4) shifts to (4,1,2)=4v; in F3 trace of 1 is 0 so averaging excluded | Agrees; retain. |
| §8.3 (4781) | one, two mismatched local signs | global products −1,+1; odd parity is necessary | Agrees; retain. |
| §8.4 (4795) | ω=2πif dz; map followed by [2] | area factor 8π²; differential square and degree both multiply by 4 | Agrees; retain. |
| §8.5 (4809) | D=−7,N=11,A=[1,−1;22,−8] | A²+7A+14I=0; lower-left 22 divisible by 11 | Agrees; retain. |
| §8.6 (4841) | u=3,m=1,a1=1 | height coefficient u²a1=9; u=1 would give 1 | Agrees; retain. |
| §8.7 (4855) | L=Q(i),base B=1 | B(ix,iy)=−1; Hermitian alternative +1; trace of base value 1 is 2 | Agrees; retain. |
| §8.8 (4889) | orbit size 3, quotient followed by [2] | point 6Q, height 36H, log 6l; basepoint correction 3T | Agrees; retain. |
| §8.10 (4946) | χ(t)=ζ of order 3 | toric scalar ζ⁻¹; multiplying by χ gives 1 | Agrees; retain. |
| §8.9 (4966) | K=Q(i),h=1 | completed L(1,η)=1/4; volume 1/2; volume-height factor 1/4 | Agrees; retain. |
| §8.12 (4980) | one local Hom dimension 0 | global Heegner functional and α both 0; identity 0=0 gives no L′ information | Agrees; retain. |
| §8.1 (4996) | projector onto first coordinate, I′=(2,7),Z=(1,3) | Pr(I′)=2=2Pr(Z); unprojected second coordinates 7≠6 | Agrees; retain. |
| §8.11 (5018) | CST versus YZZ base-height/volume conversion | two conversion factors give 2/8=1/4; torus scale 4 gives square scale 16 | Agrees; retain. |
| §8.13 (5032) | nonzero matching test vectors versus zero vector | nonzero α permits cancellation; zero vector gives 0=0 and cannot detect derivative | Agrees; retain. |
| §8.14 (5046) | one ramified common prime; degree d=2 | ramification factor 1/2; archimedean factor (8π²)² | Agrees; retain. |
| §8.15 (5060) | D=−4,c=1,u=2; class number 3 | 8π²/(4·2)=π²; H-relative height is 3 times K-relative | Agrees; retain. |
| §8.16 (5082) | local ratio factors 1/2,9/2,4 | combined multiplier 9; empty set product 1 reproduces base formula | Agrees; retain. |
| §8.17 (5096) | polarization scaled 2; vector scaled 2 | both height sides scale 2; vector quadratic sides scale 4 | Agrees; retain. |
| §8.18 (5126) | two coefficient embeddings, each order 1 | total order 2=dim A; orders 3,3 would give 6 | Agrees; retain. |
| §8.19 (5140) | map [2], height initially 3, degree initially 2 | new ratio 12/8=3/2 equals 3/2 | Agrees; retain. |
| §8.20 (5162) | positive constant times height; torsion | height 0 gives derivative 0; positive height gives positive derivative | Agrees; retain. |
| §9.1 (5187) | e=1,p=3 and 2; free ranks 1→3→2 | inequality true at 3, false at 2; quotient rank 2 versus nonsaturated 3R⊂R of length 1 | Agrees; retain. |
| §9.2 (5212) | A1×A2, W=Lie A1; torsion point | subgroup A1×0 has Lie dimension 1; nonzero torsion log 0 excluded by nonzero-log premise | Agrees; retain. |
| §9.3 (5241) | F=π²(T+π)³; square | μ=2,λ=3; square μ=4,λ=6; unbounded log(1+T) is not a counterexample in integral algebra | Agrees; retain. |
| §9.4 (5269) | invariant D=Q d/dQ on Q; Q′=Q² | D²Q at 1 is 1 versus ordinary second derivative 0; new-coordinate first moment scales 1/2 | Agrees; retain. |
| §9.5 (5306) | Tate period 5, points [6],[36] | logs 55,110 mod125; sum 40; projection 55; [30]=[6] has same log | Agrees; retain. |
| §9.6 (5335) | quaternionic form scaled 2 | Petersson denominator multiplies 4, ratio divides 4; primitive p-lattice condition excludes nonunit scaling | Agrees; retain. |
| §9.7 (5369) | p=5,a=−4; p=23,a=−1 | Euler factors 2 and 25/23; valuations 0 at 5 and −1 at 23 | Agrees; retain. |
| §9.8 (5385) | degree-zero divisor P−P; differential 2ω | AJ and log both 0; scaling gives 2log and square factor 4 | Agrees; retain. |
| §9.9 (5401) | ramified Q2(i),d=2,n=0,1 | β=1/2 at n=0 combines to 1; n=1 factors (2/3)(3/2)·2=2 | Agrees; retain. |
| §9.10 (5445) | isogeny differential factor 2 | log scales 2, square 4; reciprocal scalar correction 1/4 restores equality | Agrees; retain. |
| §9.11 (5459) | two root values 1,2; tK=2 | full sum square 9, not 5; JSW multiplier gives 18 | Agrees; retain. |
| §9.12 (5492) | p=5,a_p=±1 | Euler squares 16/25,36/25, both valuation −2; Howard factor 1−1=0 is different | Agrees; retain. |
| §9.13 (5506) | M=Q(√5), embedding idempotent | matching evaluation (1+1)/2=1; opposite evaluation (1−1)/2=0; actual algebraic point required | Agrees; retain. |
| §9.14 (5520) | root 1+T, odd p | square 1+2T+T²; μ=0, leading unit remains a unit | Agrees; retain. |
| §9.15 (5552) | inert ℓ=3,11 at p=5 | correct factors 8/9,120/121 have valuations 0,1; wrong factors 5/3,13/11 give 1,0 | Agrees; retain. |
| §9.16 (5594) | Hecke auxiliary ℓ=2,aℓ=1 | denominator ℓ+1−aℓ=2; its square 4 compensates log scale 2 | Agrees; retain. |
| §9.17 (5608) | norm-twisted χ and inverse | χ·χ⁻¹=1; good Euler factor squared retained, e.g. (17/11)²=289/121 | Agrees; retain. |
| §9.18 (5628) | p=5, differential unit 2 | log square multiplies 4, a p-unit; equality up to p-unit unchanged | Agrees; retain. |
| §9.19 (5642) | non-torsion rational point versus torsion | tested non-torsion log 44 mod121 at p=11; torsion log 0 | Agrees; retain. |
| §9.20 (5656) | unramified residue degree 2 | absolute values of linear φ² eigenvalues are p⁻¹, not p⁻²; torsion Kummer and log both 0 | Agrees; retain. |
| §9.21 (5676) | 1+T versus Σ5^(−n)T^n | coefficient valuations 0,0 versus −n; second is not integral bounded measure | Agrees; retain. |
| §9.22 (5690) | E_p=2,E_pbar=3 | ratio (3/2)·(2·3)=9=E_pbar² | Agrees; retain. |

## Not verifiable

- `yzz-book` and `yzz-draft` remain settled **waived**. Their exact printed locators, including §3.4's realization proof and §5.1's YZZ comparison, were not certified against either text. Public restatements were checked where available. In particular the book-only nonzero S1 contraction input (Proposition 5.8) and deep-level nonsingularity input (Theorem 7.8(4)), explicitly identified at README:5715, remain source-proof limitations. No settled text was requested again.
- `argos` and `blr` remain settled **uncertified**. Their intersection/Néron-model references are retained by locator; the general cotangent theorem behind §9.1 is not certified from BLR. The accessible JSW p-optimal application was checked separately.
- Ownership against open pull requests without supplied files was not checked. The provided sibling heads, main and board-package object searches were used; indexed citation lookup is not a claim to have reviewed every other roadmap in full.
- The adversarial table covers all 290 numbered targets, including the seeded sample and headline results. Several rows test necessary signs, domains, homogeneity or ranks rather than evaluate a global automorphic function. Neither those rows nor a `sorry` build certify the full arithmetic kernel identities. No additional source request or manifest edit is needed to report the concrete defects above.

## Source issues

- **Error** in gz86 at Chapter II (3.5), printed p.244 (gz86 line 765): the source says the bc coefficient is −(D−B₁B₂)/2; it should be −(D+B₁B₂)/2; affects a stated result.
- **Misprint** in gz86 at Chapter II (5.6), printed p.251 (gz86 line 1013): the source says the final constant is −σ₁(m)(λ_N+2κ_N); it should be −σ₁(m)λ_N+2σ₁(m)κ_N, agreeing with (2.23); affects a stated result.
- **Misprint** in brooks at §6.4, printed p.4224 (brooks line 1589): the source says the full projected de Rham cohomology is the one-dimensional differential line; it should be the Fil¹ part of that cohomology; affects a stated result.
- **Misprint** in jsw at §5.1, list after (5.1.a), printed p.32 (jsw line 1307): the source says the weight-two Petersson integrand is the product of forms times dxdy/y²; it should be that product times dxdy, equivalently include y² against hyperbolic measure; affects a stated result.
- **Error** in yuan-zhang at Lemma 6.1 proof, printed p.583 (yuan-zhang line 2126): the source says arbitrary distinct integer parameters produce an invertible Vandermonde system; it should be distinct positive sufficiently divisible parameters, ensuring distinct transformed moduli; affects the proof.
- **Misprint** in castella-multiplicative at Theorem 3.1 proof, printed p.9 (castella-multiplicative line 410): the source says the central-value function equals the twisted linear CM measure; it should be the square of that twisted measure; affects the proof.
- **Misprint** in cst at the conjecture following Theorem 1.1, printed p.2 (cst line 91): the source says a ramified level prime occurs with valuation two; it should be valuation one for the asserted cyclic maximal-order Heegner construction; affects a stated result.
