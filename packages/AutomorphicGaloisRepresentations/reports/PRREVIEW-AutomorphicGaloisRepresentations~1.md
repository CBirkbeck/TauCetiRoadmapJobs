# Review of AutomorphicGaloisRepresentations (pull request #1007 at 81e9d0f)

**Verdict:** needs changes

## R01 (P2) — Supply the hypotheses selecting each local deformation condition

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2768`, §6.12: “For each chosen local deformation functor show factorization through its representing quotient”.

**Claim.** The reconstructed Hecke representation, with absolutely irreducible residual representation, satisfies the listed minimal, ordinary, or specified potentially semistable conditions. The statement does not say which Hecke quotient, level restrictions, ordinary refinement or geometric type ensures each condition. Choosing a deformation functor does not make the Hecke representation a point of it. In particular, mentioning a saturated flag in the description of the ordinary functor does not construct such a flag for the family.

**Witness.** For 11a1, counting points gives `#E(F₁₉)=20`, hence `a₁₉=0`. Its crystalline polynomial is `X²+19`, with slopes `1/2,1/2`; it has no ordinary quotient. Modulo 19, `X²+2X+2` has nonsquare discriminant 15.

The point counts use the integral equation `y²+y=x³−x²−10x−20`. The last polynomial is at the good prime 2. It proves residual irreducibility over F₁₉. Oddness makes it absolute: otherwise the irreducible two-dimensional representation has scalar endomorphism field F₁₉², incompatible with complex conjugation having the two distinct eigenvalues 1 and −1. Thus this example meets the stated residual hypothesis and fails the ordinary conclusion, even over a reduced, flat coefficient ring.

**Repair.** State separate application theorems for the local conditions. For the ordinary branch specify the ordinary Hecke quotient/refinement with unit normalized eigenvalue and prove the integral stable flag over that entire quotient; for the potentially semistable branch specify the Hodge/inertial type furnished by the actual geometric family; for minimality and unramifiedness specify the level and residual conductor hypotheses. Then apply the representing quotients and assemble the global map. Retain the whole-generic-algebra argument for nilpotents. KisinDeformations line 887 and line 1082 give factorization **iff** the family has the indicated period/type property, not an unconditional factorization.

**Repair test.** At 19 the ordinary hypothesis excludes 11a1 while its crystalline branch of the correct type remains available. At 3, `a₃=−1` and `X²+X+3` has slopes 0 and 1, so its unit-root ordinary refinement is admitted. Add these as paired Checks.

## R02 (P2) — Import the existing coefficient-valued Wach construction

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:840`, §0.5: “Construct the dyadic and finite coefficient extensions here”. The same ownership claim occurs at lines 461–467.

**Claim.** This roadmap owns finite-coefficient and dyadic Wach modules, reconstruction, interval twists, filtered crystalline reduction and coefficient change beyond the stated R07 overlap.

**Witness.** `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:2077`, §6.0, already constructs `N_F(T)` for finite unramified F, finite E and an O_E-lattice, without an odd-prime restriction. Section 6.1, line 2112, supplies coefficient extension and filtered reduction.

These targets include existence, uniqueness inside the period realization, lattice recovery, duals, twists and `D_cris(V) ≅ N(V)/π`. The odd-prime hypothesis in that roadmap's subsequent good-basis target must not be moved backwards into §§6.0–6.1. The supplier occurs earlier in the merge order. The claimed extensions are therefore not new ownership here.

**Repair.** Replace §0.5's reconstruction and extension programme with an explicit import of PhiGammaModulesAndIwasawaCohomology §§6.0–6.1. Update Scope, supplier contracts and §5.2's dependencies. Keep the automorphic comparison with the specified eigenform lattice, and, if needed, the comparison with R07's Kisin–Ren realization, identifying precisely that additional comparison.

**Repair test.** For `p=2`, ramified finite E/Q₂ and the trivial O_E-line over Q₂, both constructions give `O_E[[π]]`, quotient O_E and rational crystalline module E, with Frobenius 1 and height 0. The imported construction covers the purported missing case; no generality is lost.

## R03 (P2) — Use the existing residual attachment instead of constructing it again

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2456`, §6.2, and its `residualRep` API at lines 2470–2474.

**Claim.** Define the residual newform representation by reducing a stable lattice, then prove its good-prime polynomial, determinant, lattice independence and recognition.

**Witness.** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1535`, §7.3, already constructs semisimple residual attachments of reduction eigensystems, with the same characteristic polynomial, lattice independence, coefficient transport and agreement with every attached lift.

That owner covers the present newform special case and is already a supplier of this roadmap. Generic lattice reduction and semisimple recognition also belong to ArithmeticGaloisRepresentations §§1.6–1.9 and 5.1–5.7, cited by the owner.

**Repair.** Import the residual attachment from AlgebraicModularFormsAndSerreWeights §7.3. Keep §6.2 as the comparison with this roadmap's DFG realization, its conductor bound, oddness/absolute-irreducibility consequence and the weight-two torsion comparison. Remove the second constructor and repeated generic API; state how the coefficient place and reduction embedding are transported.

**Repair test.** For 11a1 modulo 5, both routes give `1 ⊕ χ̄₅`. At 2 their polynomial is `(X−1)(X−2)=X²+2X+2` in F₅[X]. The comparison identifies the existing object; it does not need a second residual attachment. Nonsemisimple lattice reductions remain distinct, as the README correctly requires.

## R04 (P3) — Remove fictional Lean API and Check names from the README

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1020–1031`, also §§3.1, 6.2, 6.8 and 7.1. For example: `ParabolicPremotive.filTopEquivCuspForms` and `ParabolicPremotive.weight_two_trivial_character`.

**Claim.** Backticked own declaration names label API facts and Checks, although Suggested.lean declares neither the objects nor these facts.

**Witness.** `TauCetiRoadmap/AutomorphicGaloisRepresentations/Suggested.lean:48` and line 60 contain the file's only two declarations: `ordinaryGoodPrimes` and `fixedSquarefreeForm_ordinary_density_one`. There is no `ParabolicPremotive` declaration.

This is the API-catalogue convention forbidden by the standing roadmap form. The worker's `readme-ids-missing=0` did not detect it. The resolver's missing-name list is largely evidence of this problem, not evidence that dozens of new declarations should be added to Lean. The reference `TauCeti.ClassicalModularGalois.weightOne_attachment` at README line 1295 also attributes an unpinned name to Tau Ceti; the actual owner is AlgebraicModularFormsAndSerreWeights §6.4.

**Repair.** Express API facts and Checks in prose, removing fictional own identifiers and category labels such as “(instance)” and “(simp)”. Retain backticked names only for actual pinned/imported declarations and the two declarations in Suggested.lean; cite the weight-one supplier by its roadmap and section, or its correct declared namespace. Do not pad Suggested.lean with these APIs or Checks.

**Repair test.** The four parabolic Checks still distinguish rank two at level 11, the top filtration, the Eisenstein boundary and the specified cusp-form realization after their labels are removed. Their mathematical content is unchanged, and no nonexistent Lean declaration is claimed.

## Verified sound

This review read the complete target README and Suggested.lean, the repository's normative README and CONTRIBUTING, and main-branch shape examples ModularForms and Completed/Chebotarev. It compared the fifteen seeded source targets listed below, inspected the source texts itself, and performed object-based searches of the pinned libraries, main roadmaps, board packages and the supplied open-roadmap snapshots. Text-location helpers did not make the mathematical judgments or verdict. No pull-request file was edited.

The head is `81e9d0f8aca15f3ed498b19db6ff544216f857ed`. The diff outside the reviewed folder is empty. The worker's gate reports every check passing, including its targeted build, imports, sorry-data, set_option, stray-files and dependency checks. No copied passage, computational algorithm, sorry'd data, `set_option`, or scope-wide replacement of an existing roadmap was found. R02 and R03 are repairable ownership overlaps, rather than grounds to reject the whole roadmap.

The required dependency command, with `--movable`, produced:

```text
depcheck: 208 roadmaps, 1486 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No supplier gaps are declared. The R15.2 resolver warning is a false positive: AlgebraicModularFormsAndSerreWeights README line 17 explicitly maps R15.1–R15.5 to Layers 1–5 and R15.5A to Layer 6. The two determinant names at target lines 2675 and 2707 resolve to IntegralHeckeAndGaloisDeterminants §§4.1 and 1.3; they are supplier names, not missing pinned library declarations.

**Elaboration and headline coverage.** After building the two missing imported Tau Ceti object files individually, `lake env lean` on Suggested.lean exited successfully with only the expected `sorry` warning. A scratch copy checked `@ordinaryGoodPrimes` and `@fixedSquarefreeForm_ordinary_density_one`. The elaborated signatures retain N, `[NeZero N]`, the actual weight-two newform, and, for the theorem, `Squarefree N` and `f.χ=1`. No required binder disappeared. The two imports beyond `import Mathlib` are actually used.

The README's headline families are: classical rational/integral realization and attachment (§§1.5–1.7); the weight-one Artin comparison (§2.10); unrestricted Hilbert attachment, determinant, oddness, irreducibility and CM recognition (§§3.10–3.17); full local compatibility and ordinary construction (§§4.4–4.13); fixed-lattice ordinary/crystalline comparisons (§§5.1–5.5); integral Hecke representations and deformation maps (§§6.6–6.12); strict fixed-eigenform systems, large image, residual ramification and ordinary density (§§7.3–7.7). Suggested.lean states the native-carrier density theorem. Its docstring names the other families and their missing realization, local-period, Hilbert-form, residual or determinant/deformation carriers, and identifies the already-owned classical attachments. No missing statable headline was established beyond the ownership repairs above. This is not a request to encode the missing geometric theories using free predicates.

The sorried density theorem did not close with `simp`, `rfl` or `infer_instance` in the scratch one-tactic probe. Object searches found no pinned modular ordinary-density theorem that could close it with one existing lemma. It is not a definition, a boundary case or a README Check. No padding finding applies to Suggested.lean.

**Pinned declarations inspected.** Paths below are relative to the respective pinned package root. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pin and file:line | Declaration or body inspected | Consequence for this roadmap |
|---|---|---|
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84` | `HeckeRing.GL2.EigenformAwayFromLevel` | Nonzero cusp form, diamond character and good-index eigen equations are fields; bad-index eigen-ness is not a field. |
| Same file:104 | `HeckeRing.GL2.Newform` | Adds new-space membership and `a₁=1`; the zero form cannot enter the density theorem. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48` | `TauCeti.CoefficientField` | Actual intermediate field generated by positive Fourier coefficients, not an arbitrary chosen coefficient type. |
| Same file:61 | `TauCeti.coeff_mem_CoefficientField` | Supplies membership, not the separate integrality assertion. The definition in Suggested.lean correctly requires an integral representative. |
| Tau Ceti `TauCeti/NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean:96` | `NumberField.Set.HasNaturalDensity` | Limit of prime-count ratios with all primes as denominator; not Dirichlet density. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | `TauCeti.det_tateModuleGaloisRepresentation` | Carries separably closed K and `(ℓ:K)≠0`; determinant equals the cyclotomic character. |
| Tau Ceti `TauCeti/NumberTheory/LSeries/Landau.lean:296` | `TauCeti.LSeries.landau` | Requires nonnegative coefficients and the actual finite abscissa. |
| Mathlib `Mathlib/RepresentationTheory/Invariants.lean:126` and :141 | `Representation.averageMap`, `Representation.isProj_averageMap` | Finite group and invertible cardinality are in scope. This does not construct Scholl's geometric correspondence. |
| Mathlib `Mathlib/RepresentationTheory/Semisimple.lean:34` | `Representation.IsSemisimpleRepresentation` | Complemented subrepresentation lattice, not merely semisimple matrices at selected elements. |
| Mathlib `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120` | `Matrix.card_GL_field` | Counts all GLₙ over a finite field; it is not a bound on an arbitrary subgroup from its polynomial count. |
| Mathlib `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809` | `Matrix.det_fin_two` | Division-free determinant; valid in characteristic two. |
| Mathlib `Mathlib/GroupTheory/SchurZassenhaus.lean:277` | `Subgroup.exists_right_complement'_of_coprime` | Normality and order/index coprimality are required. |
| Mathlib `Mathlib/CategoryTheory/CofilteredSystem.lean:111` | `nonempty_sections_of_finite_inverse_system` | Directed preorder and finite nonempty stages are explicit. |
| Mathlib `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:109` | `NumberField.Embeddings.finite_of_norm_le` | Integrality and bounds at every embedding, rather than at one embedding. |
| Mathlib `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:405` | `DirichletCharacter.LFunction_apply_one_ne_zero` | Nontrivial complex character; does not handle the trivial-character pole. |
| Mathlib `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:241` | `riemannZeta_residue_one` | Residue limit 1 at s=1, supplying the trivial-character normalization. |

These are 17 declarations in 14 files. No second representation, averaging, determinant or density carrier is needed in Suggested.lean.

**Supplier resolution and ownership.** The citation resolver and dependency audit were followed by reading the relevant contracts, with particular attention to the following boundaries. All paths are `TauCetiRoadmap/<name>/README.md` unless marked Completed. Section names disambiguate legacy numbering.

| Supplier | Resolved contract and comparison |
|---|---|
| AlgebraicModularFormsAndSerreWeights, lines 17, 1383, 1418, 1448, 1478, 1535 | R15 legacy mapping; primitive classical summand, higher-weight and weight-one attachment, prime moments, and residual attachment. Classical attachment is correctly imported; residual attachment needs R03. |
| PhiGammaModulesAndIwasawaCohomology, lines 2077, 2112 | Wach modules and coefficient/base change; R02. |
| LocalGaloisDeformationRings, line 1349, §1.6; §§3.1–3.7 | Labelled coefficient Fontaine–Laffaille functor and its dual variance, strict kernels, reductions and fixed-type period quotients. Type membership remains an application hypothesis, as R01 explains. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.3.9, R07.3.12–3.17, R07.4.26, R07.P7 | Scalar simple-object inertia formulas, FL comparisons, the stated odd-prime Wach overlap, finite-coefficient/Sen conventions. The higher-rank simple-object formula permits niveau 2f. |
| IntegralIwasawaTheory, line 1212, §9.5 | Parallel finite-weight attachment, all-prime ordinary filtration and nonreduced oldform extension. The roadmap's nonparallel normalization and comparison are distinct; the overlap is explicitly identified. |
| HilbertModularVarietiesAndShimuraCurves, lines 3836, 4192 | R18.3.29 retains Carayol's geometric domain and the residual condition on the other coefficient-prime branch. R18.3.32 retains the odd-prime sign test and full dyadic division level. Arithmetic/geometric dual conversion agrees. |
| WeightsInEtaleCohomology, lines 604, 660, 674, 747, 759 | R34.5 supplies actual Kuga–Sato models/projectors; R34.6 supplies arithmetic comparison and the source-qualified Hilbert realization. Degree and auxiliary-character factors are retained. |
| IntegralHeckeAndGaloisDeterminants, lines 2201, 3170 | §§1.3 and 4.1 own henselian reconstruction and coefficient descent of whole laws. The named supplier declarations exist. The target's mixed determinant coefficient is an application, not a new abstract determinant theory. |
| SmallRamificationAndAbelianVarietyBaseCases, line 1985, §5.0d | Arbitrary positive-rank raw compatible data, finite local realization fields and raw operations. The target adds its pairwise almost-strict condition; it does not reconstruct the carrier. |
| AutomorphicGaloisRepresentationsPartII, line 267, AG2.P; line 732, AG2.0 | Finite-coefficient periods, independent coefficient-prime members and weak/strict predicates; geometric algebraic-character reciprocity. A norm character has cyclotomic avatar of grading −1. These early interfaces do not require this roadmap's full comparison. |
| SerreWeightAndLevelOptimisation, line 559, §2.10; §§2.13, 4.7–4.8 | Rational weight-two lowering, coefficient-prime bridge and finite-flat optimization. The fixed-form finiteness wrapper retains its stronger scope restriction. |
| ModularForms, Layers 4 and 8; ModularCurvesPartII §§14–16 | New/old spaces, coefficient fields, periods, coefficient cohomology and integral modular curves. The DFG comparison is the distinct target here. |
| GL2AutomorphicRepresentationsAndTransfer, R17 and R16.4.4 | Transfer/local normalization and the fixed-form non-CM/CM distinction; no new local Langlands carrier is introduced here. |
| ArithmeticGaloisRepresentations, Layers 1–6 | Lattices, residual semisimplification, inertia/WD, recognition, large-image and algebraic-envelope inputs. Geometric good polynomials become the same arithmetic polynomial on the dual. |
| QuaternionicModularForms, Layers 1–5 | Actual form and finite-slope modules and the rational classicality theorem; §0.3 adds the totally real eigenvariety application and normalization comparison. |
| LocallyAnalyticDistributions §§4.2, 4.15–4.16; CompactOperators §§1.7, 3.1–3.5, 4.3; RigidAnalyticGeometry Layers 1, 6 | Fredholm/finite-slope and affinoid gluing inputs are named suppliers, not proof assumptions hidden in “eigenvariety”. |
| PELModuli M0–M4; ShimuraVarieties Layers 1–4, §§8.18–8.23; EndoscopicTransferAndUnitaryTraceComparison §§13.1–13.4 | Generic moduli, towers and unitary transfer. §0.6 still has to prove the particular packet, multiplicity and character calculation. |
| PadicPeriodRings §§4.1–4.3; CrystallineCohomology CR.6; EtaleCohomologyFoundations F.4–F.7; LefschetzPencilsAndVanishingCycles | Actual period/HK/cohomological and vanishing-cycle carriers, rather than unstructured vector spaces. |
| LocalGaloisGroups Layer 5; ClassFieldTheory; GlobalNumberFields | Arithmetic local reciprocity and global character/unit inputs. Inversion is required to use geometric reciprocity here. |
| Completed/ArithmeticDirichletSeries Layer 3; Completed/Chebotarev; AutomorphicLFunctionsAndLocalFactors | Euler/prime-power estimates, density and automorphic analytic inputs. The weight-one bounded-image proof does not replace these with a formal “density” predicate. |
| GlobalGaloisDeformations R04.3 | Universal deformation-map assembly after local membership has been proved; it cannot supply the missing membership in R01. |

Object searches included the supplied open snapshots, not merely declaration-name searches. The concrete DFG comparisons, nonparallel Hilbert normalization, unitary instance, eigenform local comparisons and fixed-form conclusions explain this roadmap's remaining ownership. No duplicate fully qualified Lean declaration was found for its two declarations. The reported overlaps are the two constructor programmes R02 and R03.

**Seeded source sample (15 targets).** “Supports” below means the indicated source text and its actual hypotheses support the stated branch or named proof input; it does not mean a source proves every downstream comparison. Source IDs refer to the legally fetched line-numbered extractions. No README locator was explicitly labelled unverified.

| Target | Text read at locator | Result of comparison |
|---|---|---|
| 0.1 Rank-one local periods | Conrad, Appendix B, Definition B.1 and Propositions B.3–B.4, pp.32–36; conrad lines 1398–1612, especially 1528 | Arithmetic reciprocity is explicitly in B.4; invert it for the roadmap. Crystalline means algebraic on all units; the φ^f eigenvalue includes the algebraic uniformizer factor. Source subscript slip recorded below. |
| 0.2 Central-isogeny lifting | Wintenberger1997 Theorem 2.2.2, pp.1310–1311, lines 823–860; Skinner2009 pp.252–253, lines 482–493 | The split-isogeny cocharacter/lifting conditions and crystalline lifting, then quadratic-twist correction, support this route. The separate 1995 text was not available. |
| 0.6 Unitary and GL₃ realizations | Skinner2009 §§2.3.1–2.3.3, pp.247–251, lines 261–447 | Read the signature, packet multiplicity, central-character twist and GL₃ infinity exponents. Good reduction/unramified-p and the stated special cases are retained. The underlying Blasius–Rogawski source is paywalled. |
| 1.5a Coefficients and labelled FL | DFG §1.1 pp.6–7, lines 289–326; Dimitrov §2.7 p.21, lines 974–1000, Appendix A.6–A.7 pp.48–49, lines 2283–2327 | DFG supports coefficient actions and covariant dual realization. Dimitrov's simple-object theorem supports the residual-weight route; its Corollary 2.13's niveau restriction is false as printed. The roadmap correctly includes niveau 2f via R07.3.9. |
| 1.7 Higher-weight existence | DeligneSerre Theorem 6.1 and Remark 6.2, pp.520–521, lines 507–529 | The classical existence/irreducibility distinction is supported; the density-one uniqueness argument is Corollary 6.3 on p.521. The primitive construction is supplied, rather than redefined here. |
| 2.2 Finite eigenvalue sets | DeligneSerre Proposition 5.5, Remark 5.6, pp.519–520, lines 482–504 | Fixed coefficient degree, integrality and all-embedding bounds are present; a bound at one embedding would not suffice. |
| 2.5 Bounded finite images | DeligneSerre Proposition 7.2, pp.523–524, lines 625–671 | Semisimplicity, M and η<1/2 occur in the source. Uniformity is in the finite field, not in M or η. |
| 3.3a Exact determinant | Carayol §§5.4–5.6, pp.428–429, lines 770–810 | The three principal-series possibilities and the global quadratic-self-twist argument remove the preliminary determinant ambiguity. Squaring the determinant alone does not do this. |
| 4.5 Geometric coefficient-prime comparison | Saito2009 Theorem 0 pp.10–11, lines 487–501; Theorems 1–2 and Claim 1 pp.12–13, lines 548–608 | The odd-degree/discrete-series hypothesis is retained; equality of traces and monodromy-zero detection are separate inputs. The printed monodromy convention slip is recorded below. |
| 4.11 Nearly ordinary construction | SkinnerWiles §3.3, equations (3.2)–(3.3), pp.38–39, lines 1191–1219; ColmezFontaine §3.4 p.22, lines 1148–1154, and Theorem 4.3 p.23, lines 1241–1251 | Skinner–Wiles directly treats the stated parallel/even-degree branch. The roadmap supplies an additional argument using full local compatibility and the weak-admissibility inequality for nonparallel weights; it does not attribute that generality to equation (3.2). Unit and uniformizer factors are retained. |
| 5.4 CM ordinary line | DasguptaKakde Lemma 9.2, pp.66–67, lines 2528–2537; HaraOchiai Proposition A.3, pp.70–71, line 3413 | Ordinarity gives splitting; distinct local characters identify a CM summand; an element inducing CM conjugation exchanges the summands. The weight>1/non-scalar requirement is essential and is in the standing setting. |
| 6.3 Full weight-two Hecke algebra | DDT §4.1 pp.106–110, lines 3914–4055, and Lemmas 1.37–1.39 | Faithful finite-free Hecke action and generic rank-two Tate module retain oldform nilpotents. Passing to the new semisimple quotient would change the object. |
| 6.4a Type-Σ data | DDT δ definition pp.90–91, lines 3348–3367; Definition 3.25 and Lemma 3.27 pp.93–95, lines 3435–3527 | The good/non-good cases and the Σ-dependent correction differ; the target preserves that distinction and the coefficient-prime hypotheses. |
| 6.10 Quaternionic Hecke representations | KhareWintenbergerII §9.1.1, pp.78–80, lines 3647–3730 | Even degree, p unramified, definite quaternion algebra, coefficient action, bad set and residual absolute irreducibility match. The arithmetic polynomial uses Nvψ(ϖ_v). |
| 6.12 Whole-family local conditions | DDT Lemma 3.27 pp.94–95, lines 3508–3527; KisinDeformations Theorems (2.5.5), (2.7.6), published pp.530–531, 534, lines 887–911, 1082–1108 | These are conditional local membership statements and the specific type-Σ construction. They do not justify the unspecified application hypotheses in §6.12: R01. The author-DVI page numbers were not independently accessible. |

**Computed adversarial pass.** There are 81 numbered target subsections, plus the convention and Lean-carrier rows below. Each target row records a concrete separating calculation or a boundary calculation, not a proof by examples. An excluded instance tests the hypothesis; it is not a counterexample to a statement carrying that hypothesis. Source and ownership issues are distinguished from mathematical failures. The rows cover all fifteen sampled targets, all headline families, and every mathematical target touched by a finding.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions: Frobenius and Tate twist | At q=3, ε(Frob_geom)=1/3 and ε(Frob_arith)=3. Dual plus inversion sends eigenvalues α,β back to α,β; dual alone sends them to 1/α,1/β. | Correct distinction. |
| Conventions: Hilbert weight normalization | `(k,w)=(2,0)` gives degrees `(0,1)` and polynomial `X²+X+3` for 11a1 at 3. Norm twist gives `(2,2)`, degrees `(1,2)`, polynomial `X²+3X+27`. | Constant coefficient scales by 3², trace by 3. |
| Conventions: monodromy | `F=diag(1,3)`, `N=E₁₂`: `FNF⁻¹=N/3`; `N=0` has the same Frobenius polynomial but conductor drop 1. | Supports retaining N; source sign issue below. |
| 0.1 | Trivial character: all-unit value 1 and φ^f=1. ε over Q₃: geometric unit u maps to u, uniformizer 3 maps to 1, crystalline φ=1/3. A nontrivial finite ramified character has nontrivial unit values. | The algebraic factor and all-units condition distinguish crystalline from merely potentially crystalline. |
| 0.2 | Identity quotient has trivial crystalline lift, Sym²=1 and determinant=1. Twisting by ramified quadratic η leaves Sym² and determinant unchanged since η²=1, but is not crystalline. | Existence is not an assertion that every lift is crystalline. |
| 0.3 | Rank-one U=a gives Fredholm equation `1−aT=0`, so spectral T=1/a. Multiplying U by p changes valuation from s to s+1. Over `R[ε]/ε²`, ε≠0 but vanishes at reduced points. | Inverse eigenvalue, normalized cutoff and nilpotents must all be retained. |
| 0.4 | A rank-one crystalline period has rank 1; the zero period map has rank 0. `R⊕(x,y)ε` can have a two-dimensional square-zero fibre while the generic image has rank 1. | Generic existence alone cannot imply a locally free period line; saturation/fitting conditions matter. Inaccessible KisinFM source noted below. |
| 0.5 | Trivial O_E-line, including p=2: Wach quotient `O_E⊗O_K`, rational quotient `E⊗K`, height 0. For K/Q_p unramified quadratic and E=Q_p the integral quotient has Z_p-rank 2, not 1. | Numerical formula sound; duplicate ownership R02. |
| 0.6 | Signature (2,1) has symmetric-domain dimension 2; compact signature (3,0) has 0. GL₃ roots `qα²,qαβ,qβ²` have product `q³(αβ)³`; exponents a=−2,b=0 give degrees 2,0,1. | Rules out omitted norm twist and compact replacement. |
| 0.7 | Surface middle cohomology has weight 2; for an N-string of length 2 centered there, graded weights are 1 and 3, not two copies of 2. Setting N=0 removes the string. | Full monodromy filtration, not just smooth-fibre purity, is required. |
| 1.1 | At an étale prime p=2, E[2] has three lines: p+1=3. In characteristic p, geometric subgroup points: ordinary 2, supersingular 1, rather than p+1. | Correct scheme/geometric-point distinction. |
| 1.2 | Level 11, weight 2: cusp dimension 1, parabolic realization dimension 2, top filtration dimension 1. An Eisenstein boundary class has parabolic image 0. | Object sizes agree; remove fictional names under R04. |
| 1.3 | n=3,r=2: `(2·3²)²·2!=648`. Its inverse is unavailable integrally at 2 and 3. Swapping two degree-one classes contributes −1 before the sign projector. | Rational average and sign are necessary; no integral-projector shortcut. |
| 1.4 | A degree-two coefficient orbit has Q-dimension 4 and coefficient-field dimension 2. Δ has coefficient field Q and rank 2 in degree 11. | An individual embedding is not the rational orbit projector. |
| 1.5 | DFG geometric roots have trace ψ⁻¹a and product ψ⁻¹p^(k−1). Twisting both by ψ gives trace a and product ψp^(k−1). At k=2,ψ=1,p=3 this is trace −1, determinant 3. | Character correction and arithmetic dual agree. |
| 1.5a | ℓ=19, 11a1: #E(F₁₉)=20, a₁₉=0. Cohomological inertia exponents modulo 360 are −1=359 and −19=341; neither is divisible by 20, so neither factors through F₁₉×. | Niveau 2, with residue field F₁₉², is required. Target correctly retains it. |
| 1.5a interval and labels | ℓ=3, `[a,a+1]−a=[0,1]`; `[a,a+2]−a=[0,2]` exceeds the safe range. Over unramified quadratic K the coefficient product has two factors exchanged by φ. | Twist and labelled-factor conditions discriminate. |
| 1.6 | T=Oe₁⊕Oe₂ and an eigenline Ee₁: intersection is Oe₁ with torsion-free quotient O. Using πOe₁ gives quotient `O⊕O/π`. | Saturation cannot be omitted. |
| 1.7 | For Δ at 2: a₂=−24 and determinant 2¹¹=2048, hence `X²+24X+2048`; a weight-two Tate polynomial would have constant 2. Eisenstein weight k has reducible `1⊕χ^(k−1)`. | Higher weight and cuspidality remain distinct. |
| 2.1 | For bounded prime trace with `\|a_p\|≤2`, squared trace is ≤4; `a_p=2` attains 4, whereas replacing the second moment by `\|a_p\|` gives 2. | The prime estimate uses the second moment and analytic supplier, not a pointwise bound as proof. |
| 2.2 | Integral elements of Q bounded by 2 are `−2,−1,0,1,2` (five). In Z[√2], `(1−√2)^n` is bounded at one embedding while `(1+√2)^n` is unbounded at the other. | All embeddings and fixed number field are essential. |
| 2.3 | Modulo 5, Δ has a₂=−24≡1 and determinant 2¹¹≡3, polynomial `X²−X+3`. Lifting just a₂ without the character would give constant 2, not 3. | Residual eigensystem includes the determinant data. |
| 2.4 | Exhaustive GL₂ enumeration: over F₂ order 6, 2 polynomials, fibre sizes 4 and 2; over F₃ order 48, 6 polynomials, fibre sizes 12 (once), 9 (twice), 6 (three times). | Nonabelian example verifies polynomial-fibre counts; no class-count substitution. |
| 2.5 | Over F₅: order 480, 20 polynomials, fibres 30 (six), 25 (four), 20 (ten). A unipotent C₅ has order 5 but only polynomial `(X−1)²`, and is not semisimple. | The semisimplicity exclusion is necessary. |
| 2.6 | A cyclic diagonal C₄ over F₅ has 4 polynomials; split Cartan over F₃ has order 4 but 3 unordered eigenvalue polynomials. For M=3,η=1/4, the normalizer estimate is `4M/(1−2η)=24`. | Field-independent bound is not equality with polynomial count. |
| 2.7 | A nontrivial unipotent over F₅ has order 5; a faithful Q₅-representation of C₅ needs dimension at least 4. A prime-to-5 character of order 4 lifts as a Teichmüller character. | Prime-to-residue-characteristic hypothesis separates liftable case. |
| 2.8 | An order-4 character lifts a residual root 2 in F₅ to a fourth root of unity, with fourth power 1; its two-dimensional sum retains determinant, unlike arbitrary scalar lifts 2∈Q₅ whose fourth power is 16. | Teichmüller/group-law lift, not entrywise integer lift. |
| 2.9 | A reducible Artin sum `1⊕χ` has Euler factor `(1−T)(1−χ(p)T)`; the trivial summand contributes a zeta pole of order 1. A cuspidal weight-one representation cannot acquire that pole. | Cuspidal irreducibility uses the stated analytic route. |
| 2.10 | At complex conjugation eigenvalues 1,−1 give trace 0, determinant −1; scalar ±I gives trace ±2 and determinant 1. | Odd Artin attachment comparison fixes parity; supplier owns existence. |
| 3.1 | The 11a1 oldspace at level 22 has automorphic invariant dimension 2, so its rank-two Galois multiplicity gives total cohomology dimension 4. | Extract multiplicity 2, not all cohomology as rank 2. |
| 3.2 | Twisting a rank-two representation by η multiplies trace by η and determinant by η². For η=−1: trace changes sign but determinant is unchanged. | Preliminary squared determinant cannot detect quadratic ambiguity. |
| 3.3 | A two-step filtration with one-dimensional ends has dimensions 1+1=2; replacing a nonsplit extension by its semisimplification retains trace but kills its extension class. | Filtration versus semisimplification distinguished. |
| 3.3a | Candidate roots (α,β)=(2,3) have determinant 6; repeated candidates (2,2),(3,3) have 4,9. When β=−α, determinant ratios can be −1. | Exact global determinant, not its square, removes the false candidates. |
| 3.4 | Special parameter at q=3 has F=diag(1,3), rank N=1, invariant kernel dimension 1 and conductor contribution 1. N=0 has kernel dimension 2 and contribution 0. | Same F-polynomial does not imply same local type. |
| 3.5 | Depth-one unipotent inertia `1+tN` with N²=0 satisfies `(1+sN)(1+tN)=1+(s+t)N`; deleting N gives constant I. | Fundamental local extension retains monodromy. |
| 3.6 | An induced irreducible quadratic local character pair has trace 0 on the nontrivial coset and two distinct characters on the subgroup; a scalar model has trace 2a on that coset. | Local cuspidal representation cannot be replaced by a scalar pair. |
| 3.7 | At q=3 a principal-series parameter has N=0, a special parameter rank N=1; their conductor terms differ by 1 even with equal semisimple F. | Theorem B requires full WD comparison. |
| 3.8 | A₄ has a V₄ Sylow 2-subgroup of index 3; S₄ has a D₈ Sylow 2-subgroup of index 3, which is not normal. | Cubic restriction uses a subgroup, not an invented normal cubic quotient. |
| 3.9 | A cubic character ζ has ζ³=1 but twists a rank-two determinant by ζ²≠1. | Determinant rules out the invisible cubic-descent ambiguity. |
| 3.10 | Parallel type (2,0) and (2,2) differ by an integral norm twist: at q=3 trace −1 becomes −3 and determinant 3 becomes 27. An even-degree field with no finite discrete-series place fails Carayol's branch. | General construction needs the separate unrestricted branch; it is present. |
| 3.11 | For t=−3,s=9,q=3, geometric polynomial `X²+3X+27`; Carayol σ has `X²+X/3+1/3`; arithmetic dual at arithmetic Frobenius returns `X²+3X+27`. | Dictionary fixes the inverse-central-character factor. |
| 3.12 | `(k,w)=(4,2)` yields degrees 0,3; their sum is 3=w+1. Cyclotomic twisting by 1 changes them to −1,2. | Labelled degree sum and twist agree with determinant. |
| 3.13 | ε₃ has infinite inertia image Z₃×, so it is not a number-field-valued finite character on all ideles. Dividing its unit value by the prescribed algebraic unit factor gives 1. | The locally algebraic character formulation avoids a false algebraic-value claim. |
| 3.14 | At real conjugation determinant −1 forces eigenvalues 1,−1 and trace 0. A reducible geometric pair over a totally real field has algebraic-character degrees constrained by parallel norm powers. | Oddness and the character/analytic irreducibility route are not consequences of good-polynomial matching alone. |
| 3.15 | CM curve `y²=x³−x` at 5 has #E(F₅)=8, trace −2; roots `−1±2i` have product 5. At inert 3 its trace is 0. | Finite-order inducing characters alone would have absolute value 1, not √5. |
| 3.16 | On the CM subgroup, `Ind θ` restricts as `θ⊕θᶜ`; outside it trace is 0. Non-CM large connected image SL₂ preserves no line. | Both directions retain the CM/non-CM distinction and weight>1 setting. |
| 3.17 | Over Q, weight-two 11a1 at 3 has rank 2, trace −1, determinant 3. Replacing compact/parabolic cohomology by an Eisenstein boundary adds a rank-one summand. | Geometric Hilbert/classical comparison must preserve the cuspidal image. |
| 4.1 | For q=3, middle weight 1 roots have modulus √3; after twist (1), modulus is 1/√3 and weight −1. A special N-string has nonzero graded ends. | Weight transport and monodromy purity are different assertions. |
| 4.2 | 11a1 at 3: `\|−1\|≤2√3`; Δ at 2: `24≤2·2^(11/2)`. | Bound uses the actual weight; a weight-one bound 2 would fail on Δ. |
| 4.3 | At q=3 the normalized GL₂ parameter contributes the stated half-norm shift; removing it changes determinant from 3s to s. For s=1 these are 3 and 1. | Half-norm factor is not suppressed at small coefficient primes. |
| 4.4 | Unramified parameter: N=0 and two F eigenvalues. Steinberg: rank N=1, same possible eigenvalue list. | Away-from-λ compatibility compares WD, not only polynomials. |
| 4.5 | At the same geometric place, an ℓ≠p realization and a p-adic realization both have trace −1 and determinant 3 in the good 11a1 example. For a special parameter both must have rank N=1. | Trace comparison plus N-detection is the source-qualified input. |
| 4.6 | A residual reducible `1⊕χ̄₅` (11a1 modulo 5) fails the residual-irreducibility hypothesis of the Kisin branch. The mod-19 example passes it. | Do not extend this branch by deleting its residual hypothesis. |
| 4.7 | For type (2,0), full theorem gives degrees 0,1 and determinant grading 1; the printed Skinner pair −1,0 sums to −1. | Roadmap's corrected normalization passes; source issue below. |
| 4.8 | 11a1 is rationally irreducible but its mod-5 semisimplification is `1⊕χ̄₅`. Dimensions are 2 in both cases; irreducibility changes on reduction. | Rational irreducibility does not assert residual irreducibility everywhere. |
| 4.9 | Weight-two unramified Steinberg twist with γ(Frob_arith)=2,q=3 has arithmetic diagonal 6,2 and determinant 12. Replacing it by 2,2 gives determinant 4. | Cyclotomic diagonal factor is necessary. |
| 4.10 | Nonparallel labels k=(2,4), v=(1,0) give unit algebraic factor `4^(−1)=1/4` in the stated test; finite and algebraic factors −1,−1 multiply to 1. | Raw finite character alone cannot define the normalized unit value. |
| 4.11 | After twisting the selected crystalline line to slope 0, weak admissibility gives `0≤t_H≤t_N=0`, hence t_H=0; the other degree kτ−1 is positive. Changing uniformizer with α=2, ν(u)=ζ₃ and algebraic factor 1/4 gives α′=ζ₃/2. | Both the line and the entire unit factor are fixed. |
| 4.12 | At q=3 the same nearly ordinary packet has good polynomial trace −1, determinant 3 after translating back; retaining only the unit root omits the second root 3/α. | Ordinary refinement does not replace full away-from-p compatibility. |
| 4.13 | Parallel k=w=2 gives q₀=0, auxiliary twist 0 and degree 1. For degree g=2,w=4, q₀=6; degree 7 with twist 2 has weight 3. | HK/de Rham multiplicity comparison retains coefficient projector and auxiliary twist. |
| 5.1 | `T∩Ee₁=Oe₁`, quotient O; πOe₁ gives torsion O/π. For 11a1, p=3 slopes 0,1; p=19 slopes 1/2,1/2. | Stable saturated lattice line is additional to a rational eigenline and requires ordinarity. |
| 5.2 | For ε, crystalline φ=p⁻¹; for ε⁻¹, φ=p. A Tate basis and a period basis therefore have different φ entries. | Wach/period comparison must use the specified basis and twist; import R02's owner. |
| 5.3 | CM example at split 5: trace −2 is a 5-adic unit; at inert 3: trace 0, slopes 1/2,1/2. | Ordinary CM prime is split in the stated weight range. |
| 5.4 | In induced basis, CM conjugation has matrix `[[0,a],[b,0]]`, ab≠0; it sends Ee₁ to Ee₂≠Ee₁. A diagonal matrix would preserve the line and lie in the wrong coset. | Lemma 9.2 calculation agrees. |
| 5.5 | At p=3, the interval `[0,p−2]=[0,1]` has length 1; endpoint weight p+1 has degree k−1=3 and is outside it. | Endpoint case needs its separate local contract, not safe-range FL. |
| 6.1 | A coefficient field of degree d=2 gives abelian quotient dimension 2 and rational Tate rank 4; its selected λ-factor has rank 2. | Entire Tate module and selected factor are not conflated. |
| 6.2 | 11a1 mod 5 at 2: `(X−1)(X−2)=X²+2X+2`. In F₄, `1⊕1` and `χ⊕χ` have trace 0 but determinants 1 and χ²≠1. | Full characteristic polynomials needed; import the existing residual object (R03). |
| 6.3 | In `E[u]/(u²(u²+2u+2))`, η=`u(u²+2u+2)` has degree 3 and is nonzero, but η²=0. | Full old Hecke algebra need not be reduced. |
| 6.4 | Split multiplicative case a_p=1: arithmetic Tate-module inertia line has Frobenius p; cohomological geometric invariant line has Frobenius 1. | Bad Euler factor depends on the declared realization and Frobenius, not on an unqualified invariant line. |
| 6.4a | Good residual δ=0; allowing an ordinary coefficient-prime change in Σ can give δ_Σ=1. At a new unramified auxiliary p, the prescribed level factor is p², e.g. 5²=25. | δ and δ_Σ are not interchangeable. |
| 6.5 | For ℓ=3, a residual system becoming reducible over Q(√−3) fails the classical optimization branch. A determinant quotient of order 3 cannot be removed by a prime-to-3 Teichmüller character. | Extra characteristic-three comparison and character conditions remain necessary. |
| 6.6 | `T={(x,y)∈Z₃²:x≡y mod3}`: with e=(0,3), e²=3e, so `T/3T≅F₃[e]/e²`. It is not F₃×F₃. | Reduced integral ring can have nonreduced quotient; use the stated cofinal ideals. |
| 6.7 | New rational quotient has product-of-fields idempotents; the level-88 old factor has nonzero η with η²=0. | Specified reduced localization must be proved to be the new quotient; not all full Hecke rings qualify. |
| 6.8 | Over dual numbers, det diag(1+ε,1)=1+ε, whereas identity determinant=1. For A=E₁₁,B=E₂₂ in characteristic 2, mixed coefficient=`1·1−0=1`. | Whole law and division-free mixed coefficient detect what field points miss. |
| 6.9 | Residual matrix algebra M₂(k) has dimension 4 and scalar commutant dimension 1; residual `1⊕χ` has a two-dimensional diagonal commutant. | Split absolute irreducibility is needed for the stated reconstruction/strict uniqueness. |
| 6.10 | Weight-two ψ=1 at q=3 gives constant coefficient 3, not 1. For p=2, weights k>2 are excluded explicitly; k=2 is retained. | KW coefficient/level/weight domain matches. |
| 6.11 | At p=3,q≡−1, γ=±1 both give unordered residual roots `{1,−1}`. At p=2, coefficient root r=±1/3 fixes γ=±3, with γ²=9, not 1/9. | Correct odd-prime exclusion and dyadic full-level sign. |
| 6.12 | 11a1 at19: trace 0, determinant19, slopes 1/2,1/2; required ordinary slopes would be 0,1. At3: trace−1, determinant3, slopes0,1. | Missing application hypotheses: R01. |
| 7.1 | Direct sum of ranks2 and2 has rank4 and polynomial product; tensor has four roots αᵢβⱼ. A twist (1) scales geometric roots by q⁻¹ and subtracts1 from each degree. | Raw operations have positive-rank domain; pairwise almost-strict comparison requires its own condition on new pairs. |
| 7.2 | Rank-two weight1 roots have squared modulus q; tensor roots have squared modulus q² and weight2; dual has squared modulus q⁻¹ and weight−1. | Purity operations have correct signs; pure does not mean semisimple. |
| 7.3 | Fixed 11a1 good polynomial at3 is `X²+X+3` at every coefficient prime away from3; at3 compare the crystalline parameter instead. At bad11 the WD monodromy remains nonzero. | Strict family is more than a list of good polynomials. |
| 7.4 | SL₂(F₃) has order24; GL₂(F₃) has order48. Containment of the former does not assert equality with the latter or with GL₂ of a larger residue field. | Inner-twist/subfield qualification is necessary and retained. |
| 7.5 | For a non-CM rational form, eventual residual determinant is χ̄ℓ and its image has size ℓ−1; at ℓ=5 the 11a1 representation is reducible. | “All sufficiently large” cannot be “all”; finite exceptions remain. |
| 7.6 | For fixed squarefree N=11, a hypothetical unramified residual member at11 lowers to level1; `dim S₂(Γ₀(1))=0`. For general N the finite lower-level forms give finitely many nonzero coefficient differences. | Fixed-form finiteness argument, not an assertion that residual conductor is always N. |
| 7.7 and Lean headline | At p=5,d=2, a nonzero norm divisible by p² has absolute value≥25, while Ramanujan bounds it by `(2√5)²=20`. Thus all-λ nonordinarity forces a_p=0 away from ramified exceptions. | Supports “some λ ordinary”, not “every λ ordinary”; trace-zero density is the separate deep input. |
| `ordinaryGoodPrimes` | For coefficient field Q and 11a1: p=3 has a₃=−1∉(3), so true; p=19 has a₁₉=0∈(19), so false; p=11 is excluded by 11 dividing N. N=0 is excluded by `[NeZero N]`. | The native predicate separates ordinary, supersingular and bad primes. |
| Density junk values | Below the first prime, both prime counts are 0, so Lean's total quotient is 0/0=0; the limit is at infinity. For the full prime set the eventual ratio is 1; finite sets have limit0. | Small-cutoff junk value cannot trivialize the headline. |

## Not verifiable

- **KisinFM**, *Overconvergent modular forms and the Fontaine–Mazur conjecture*, Proposition 5.14 and Corollary 5.15, author pp.26–27, used in §0.4. The sources service reached the cited Harvard author DVI but could not recognize it as a document; the corresponding author PDF returned 404. The analytic continuation theorem's precise hypotheses and pagination are not certified here.
- **Wintenberger1995**, *Relèvement selon une isogénie de systèmes l-adiques de représentations galoisiennes associés aux motifs*, Theorem 1.1.3, Proposition 1.2 and Remarks 1.1.4, used in §0.2. Bibliographic resolution found no readable legal copy. The separate 1997 local theorem and Skinner's application were read; that does not certify the 1995 locators.
- **RapoportZink**, *Über die lokale Zetafunktion von Shimuravarietäten*, Satz 2.13, used in §0.7. Bibliographic resolution found no readable legal copy. The assertion's exact source hypotheses remain unverified.
- **BlasiusRogawski**, *Motives for Hilbert Modular Forms*, and **BushnellHenniart**, *The Local Langlands Conjecture for GL(2)*: the cited Springer sources resolve to paywalled content. They are recorded as uncertified, not as new requests. Skinner's open account was read for the sampled unitary/GL₃ application; the underlying primary construction and the book's exact local-theory pages were not read.
- **KisinDeformations author-copy pagination.** The published AMS paper was obtained and Theorems (2.5.5), (2.7.6) and their scope were checked. The cited author DVI was not readable through the service, so equivalence of its pp.19–20, 23, 32–33 with the published pagination was not independently certified. Cite the accessible published version when repairing the locator.

The three unresolved works are retained in the job's `needs-references.toml`. The review is finished with the limitations above; no missing source is treated as evidence that its theorem is false. Mathematical witnesses for R01–R03 do not depend on those inaccessible texts.

## Source issues

- **Misprint** in conrad at Proposition B.4(ii), printed p.35 (line 1537): the source says the algebraic factor is evaluated at π_F although the uniformizer is π_L; it should be evaluated at π_L; affects nothing.
- **Error** in Dimitrov at Corollary 2.13, preprint p.21 (lines 989–1000): the source says both tame characters have niveau f; it should allow niveau 2f for a simple rank-two residual factor; affects a stated result.
- **Misprint** in Skinner2009 at Theorem 1's Hodge-type convention, printed p.242 (lines 72–75): the source says the degrees are (w−k)/2 and (w+k−2)/2; it should use (w−k+2)/2 and (w+k)/2 with its stated geometric normalization; affects a stated result.
- **Misprint** in Saito2009 at §2, preprint p.12 (lines 535–542): the source says φN=pNφ and geometric conjugation scales N by q; it should use Nφ=pφN and geometric conjugation by q⁻¹; affects a stated result.
- **Misprint** in DDT at the proof of Theorem 3.15, printed p.91 (line 3376): the source says N_f is divisible by δ(ρ̄); it should say divisible by ℓ raised to δ(ρ̄); affects the proof.
- **Misprint** in ColmezFontaine at §3.4, author-copy p.22 (lines 1157–1162): the source says admissible subobjects and quotients satisfy t_H(D′)=t_H(D); it should require t_H(D′)=t_N(D′), and likewise for quotients; affects a stated result.
