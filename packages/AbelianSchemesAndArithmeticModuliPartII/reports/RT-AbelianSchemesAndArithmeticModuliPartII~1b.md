<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/122#issuecomment-6314886997 -->
Red team round 1 pass b (claude) of 46bb981

Verdict: needs_changes

1. **F01** (P1) Supplier HodgeStructuresPartII H.2 does not exist anywhere

   Location: README.md:48–49 ("**HodgeStructuresPartII**, H.2, supplies polarized variations, the fixed part and equivariant Hodge morphisms"); also Needs lines of "Fixed homology and equivariant Hom" (README.md:974), "Free subgroups in curve monodromy" (README.md:1048), "Gao quotient criterion for Betti rank" (README.md:1281).

   Claim: the theorem of the fixed part for polarized integral variations of weight −1 and the equivariant Hodge-Hom algebraization are supplied by HodgeStructuresPartII H.2.

   Witness: no folder `TauCetiRoadmap/HodgeStructuresPartII` on main, no line in `merge-order/ORDER.txt`, no pull request among the 1000 most recent roadmap PRs. `Completed/HodgeStructures/README.md:411–412` says Deligne's theorem of the fixed part and monodromy semisimplicity belong to an unwritten successor.

   Repair: the fixed-part theorem (for a polarized ℤ-VHS of weight −1 over a smooth complex curve, after a finite étale cover) and the equivariant Hodge-Hom algebraization become targets of B2 here (new targets "Theorem of the fixed part for abelian families" and "Equivariant Hodge morphisms are homomorphisms of abelian schemes", source Deligne, Théorie de Hodge II, Corollaire 4.1.2), or, if the design intends an external owner, declare `gap:fixed-part-theorem` with a named supplier in `design/plan.json` and under a new `## Exact supplier contracts` section. Remove every "HodgeStructuresPartII" citation.

2. **F02** (P1) Supplier LogicAndDefinabilityInNumberTheory LD.6 does not exist anywhere

   Location: README.md:49–50 ("**LogicAndDefinabilityInNumberTheory**, LD.6, owns the o-minimal, mixed Ax–Schanuel and weakly special theory"); Needs lines at README.md:1022, 1176, 1188, 1204, 1218 (B2 "Invariant definable sets of Ax-type" and all four B3 Kuga targets).

   Claim: Pila–Wilkie, o-minimal Chow, definable fundamental sets, mixed bi-algebraic monodromy and the Kuga interface are owned by LD.6.

   Witness: no such roadmap on main, in `merge-order/ORDER.txt`, or among 1000 PRs. The only on-main Ax–Schanuel material is `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3542` (§5.6, modular functions), which does not cover Kuga mixed Shimura varieties.

   Repair: either declare a gap with a real supplier (none exists today, so the brief's rule makes this unowned) or move the consumed notions down: add to B3 targets "Definable fundamental set and Pila–Wilkie counting for a Kuga mixed Shimura variety" and "Mixed Ax–Schanuel for Kuga varieties" (Gao–Ax Theorem 4.1 as the statement), with B2's Ax-type lemma citing those. Delete the LD.6 citations and the "do not introduce a competing mixed Shimura theory" sentence, which now contradicts the targets.

3. **F03** (P1) Layer P1 duplicates the parent's A4.2 universal vector extension

   Location: README.md:302–357 ("### Universal vector extension of the dual" and "### Lie and cotangent identifications").

   Claim: P1 constructs A♮, the smooth group representing rigidified line bundles with integrable connection on A_T, with kernel V(ω_A) and Lie(A♮) ≅ H¹_dR(A/S).

   Witness: parent README (PR #849 head), §A4.2 "The universal vector extension" lines 1789–1836, defines `AbelianVectorExtension` for every abelian scheme with universal property, base change and `AbelianVectorExtension.invariantForms` (ω_{E(A)} ≅ H¹_dR(A/S)), and says explicitly "the same moduli problem on A gives E(A^∨)"; §A4.3 owns H¹_dR and the Hodge sequence.

   Repair: replace the two P1 targets by an import: "A♮ := E(A∨) of AbelianSchemesAndArithmeticModuli §A4.2 applied to A∨; Lie(A♮) ≅ H¹_dR(A/S) and H ≅ ω_{A♮} are `AbelianVectorExtension.invariantForms` for A∨ plus the duality H¹_dR(A∨/S) ≅ H¹_dR(A/S)^∨ of §A4.3". Keep only the universal line bundle with connection (P♮, ∇) as a P1 target if the parent does not name it, with Needs: A4.2, A4.3. Delete the P1 Construction requirements paragraph.

4. **F04** (P1) F4's local orbit and stabilizer-index bounds are attributed to GN.2, which does not state them

   Location: README.md:1991–2012 ("Finite-support adelic stabilizers in a prime-field isogeny class", Needs "GeometryOfNumbersAndQuadraticArithmetic, GN.2") and README.md:2068–2071 ("The GN.2 local suppliers must use the successive projected lattices ... Bound local orbit counts by ℓ^(2Δ_ℓ) and stabilizer indices by ℓ^Δ_ℓ").

   Claim: GN.2 supplies, for the centralizer of a linear Frobenius on V_ℓ, the count of orbits on stable lattices and the index of each stabilizer in a conjugate of a fixed compact.

   Witness: GeometryOfNumbersAndQuadraticArithmetic (PR #851 head) has no section labelled "GN.2"; its Layer 2 is "Integral quadratic and hermitian lattices" and Layer 3 is "Representation densities, mass and theta coefficients"; grep for "orbit count", "stabilizer index", "Lipnowski" finds nothing.

   Repair: add F4 targets "Local orbit count of the Frobenius centralizer on stable lattices" and "Local stabilizer index bound" (LT §3.1–3.2, (15)–(20)) with the Δ_ℓ formula of the Construction requirements as their statement, and make the stabilizer theorem need them. Repoint every "GN.2"/"GN.3" to "GeometryOfNumbersAndQuadraticArithmetic Layer 2"/"Layer 3 §3.3" for what those layers actually state (hermitian lattices, mass).

5. **F05** (P1) Suggested.lean carries sorry'd data, including its central definition

   Location: Suggested.lean:52 (`def tensorSymmetricPower ... := by sorry`), 65 (`def tensorSymmetricPower_map`), 89 (`abbrev degreeCompletion` mentions it), 91, 129, 138, 148 (`instance tensorSymmetricAlgebra_commRing := by sorry`), 151, 175, 184, 210, 223, 319 (`torusCharacter`), 326 (`torusAnnihilator`).

   Claim: these are definitions and instances.

   Witness: eleven `def`s and two `instance`s have body `sorry`; every later statement and all 12 examples mention them, so none asserts anything (brief: no sorry'd data, nothing that mentions one).

   Repair: give real bodies: `tensorSymmetricPower R M n := ⨅ σ : Equiv.Perm (Fin n), LinearMap.eqLocus ((PiTensorProduct.reindex R (fun _ => M) σ).toLinearMap) LinearMap.id`; delete `degreeCompletion_component` (use `c n`); `dividedTensor n v := ⟨PiTensorProduct.tprod R (fun _ => v), tensorSymmetricPower_diagonal ..⟩`; `tensorSquareEquiv` via `PiTensorProduct.tmulEquiv` composed with `reindex` along `finSumFinEquiv`; `torusCharacter m := ∑ i, m i • Pi.evalAddMonoidHom _ i` (as an `AddMonoidHom`); `torusAnnihilator H := ⨅ x ∈ H, (torusCharacter · x).ker` as a subgroup. Move `shuffleDividedPowers`, the two instances, `dividedPowerComparison(Equiv)` and `invariantTensorMultigrading` to README-only targets with their intended signatures.

6. **F06** (P2) Parent target slugs cited in Needs do not exist; one is in the wrong layer

   Location: README.md:897 and 1334 (`A6/poincare-complete-reducibility`), 1425 (`A6/characteristic-polynomial-on-tate-module`), 1489–1491 (`A6/hom-to-tate-module-homs-is-injective`, `A6/hom-is-free-of-finite-rank`, `A6/endomorphism-algebra-is-semisimple`), 1632 (`A6/characteristic-polynomial-of-an-endomorphism`), 2166–2168 and 2185 (`A6/rosati-positivity`, `A6/automorphisms-of-polarized-abelian-varieties`, `A2/rosati-involution`).

   Claim: these name targets of the parent.

   Witness: grep of the parent README at the head of PR #849 finds zero occurrences of any of the nine slugs; the parent numbers targets A6.5 (Poincaré complete reducibility), A6.11 (`charpolyTate`), A6.2 (faithfulness on Tate modules), A6.7, A6.8, A6.10 (`End.charpoly`), A6.14 (`rosatiPositivity`), A6.18 (`polarizedAutomorphisms`), and the Rosati involution is A3.9 (`Polarization.rosati`), not A2.

   Repair: replace by `AbelianSchemesAndArithmeticModuli §A6.5 (poincareReducibility)`, `§A6.11 (charpolyTate)`, `§A6.2`, `§A6.7`, `§A6.8`, `§A6.10 (End.charpoly)`, `§A6.14 (rosatiPositivity)`, `§A6.18 (polarizedAutomorphisms)`, `§A3.9 (Polarization.rosati)`; in the scope paragraph move "Rosati involutions" from A2 to A3.

7. **F07** (P2) FiniteFlatGroups slugs do not exist; F1 restates R07.2.19

   Location: README.md:1607, 1617, 1662, 1712, 1800–1801, 1847, 1861–1862, 1878 (`R07.2/dieudonne-p-divisible`, `R07.1/etale-groups-as-galois-modules`); README.md:1621–1631 ("Characteristic polynomial on the p-realization").

   Claim: the slugs name FiniteFlat targets; the ℤ_p-integrality of the characteristic polynomial of C(u) is new here.

   Witness: FiniteFlatGroupsAndIntegralPadicHodgeTheory (PR #879 head) has no such slugs; the Dieudonné anti-equivalence for p-divisible groups is §R07.2.10 `dieudonnePDivisible`, finite étale groups as π₁-modules is §R07.1.2 `etaleGroupEquivContAction`, and §R07.2.19 `exists_padic_charpoly` already proves that the characteristic polynomial of F^a on a Dieudonné module over F_{p^a} has ℤ_p coefficients, citing LT.

   Repair: cite `§R07.2.10 (dieudonnePDivisible)` and `§R07.1.2 (etaleGroupEquivContAction)`; in F1 "Characteristic polynomial on the p-realization" add Needs `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.19 (exists_padic_charpoly)` and state that only the identification with the parent's integer polynomial is proved here.

8. **F08** (P2) F0 point counts duplicate DeligneWeightsAndPurity 1.5

   Location: README.md:1413 (`frobeniusPolynomial_points`) and README.md:1466–1473 ("Point counts are isogeny invariant").

   Claim: #A(F_{q^r}) = det(1 − π^r | V_ℓA) and its isogeny invariance are targets here.

   Witness: DeligneWeightsAndPurity (PR #929 head) §1.5 "Point counts of abelian varieties over F_{q^m}, and their bounds" states N_m = deg(1 − π^m) = P_{π^m}(1) = ∏(1 − a_i^m) with the Weil bound, needing parent §A6.1 and §A6.10.

   Repair: delete the target "Point counts are isogeny invariant" and the API item `frobeniusPolynomial_points`; where F5 "Elliptic point groups" and F3 "Frobenius polynomial determines the isogeny class" need point counts, cite `DeligneWeightsAndPurity §1.5`.

9. **F09** (P2) F1 Frobenius semisimplicity duplicates the parent's A6.21

   Location: README.md:1665–1676 ("Semisimplicity of the linear q-Frobenius realization").

   Claim: C(π_A) = F^a is a semisimple L-linear endomorphism of C(A)[1/p]; cited need is `A6/endomorphism-algebra-is-semisimple`.

   Witness: parent §A6.21 `frobeniusSemisimple` (lines 3246–3257) proves π and its powers act semisimply on V_ℓA "and on any faithful characteristic-zero realization carrying the same End⁰ action".

   Repair: state the target as the specialization of `AbelianSchemesAndArithmeticModuli §A6.21 (frobeniusSemisimple)` to the isocrystal C(A)[1/p] with its End⁰(A)^op action, keeping only the identification of its characteristic polynomial with P_A as new; Needs: §A6.21, F1 "Characteristic polynomial on the p-realization".

10. **F10** (P3) Every example in Suggested.lean is admitted

   Location: Suggested.lean:75–86, 109–125, 193–207, 335–343 (12 `example ... := by sorry`).

   Claim: these are the Checks' Lean mirrors.

   Witness: all 12 examples end in `sorry`; the brief requires proved, discriminating examples and forbids admitted ones.

   Repair: once R05 gives real bodies, prove `tensorSymmetricPower R M 0 = ⊤`, `tensorSymmetricPower R M 1 = ⊤` (every permutation of `Fin 1` is the identity), the `e₀ ⊗ e₁ ∉ TSym²` test via the coordinate functional, the three annihilator examples on `BettiTorus 1`, and `degreeCompletion_single`; delete `degreeCompletion_product` (R21). Examples that cannot be proved become named `sorry`'d theorem targets listed in the README.

11. **F11** (P3) Import, option, keyword, namespace and docstring policy

   Location: Suggested.lean:1–28 (27 lines `import Mathlib.<submodule>`, no `import Mathlib`), 44 (`set_option autoImplicit false`), 47 (`namespace AbelianArithmetic`), 30–42 (module docstring), 15 declarations headed `lemma` (55, 61, 70, 95, 99, 104, 132, 158, 164, 169, 179, 188, 213, 322, 330).

   Claim: file shape.

   Witness: brief requires the single line `import Mathlib`, no `set_option` of any kind, `theorem` never `lemma`, `namespace TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII`, and a module docstring "<Name>: representative target signatures"; the present docstring is process text ("No implementation is claimed ... use `sorry`").

   Repair: replace lines 1–27 by `import Mathlib` and `import TauCeti.LinearAlgebra.TensorProduct.Symmetric`; delete line 44; rename the namespace; `lemma` → `theorem`; rewrite the docstring to the required form; delete the comment at line 88 ("all proposed maps and facts remain unproved").

12. **F12** (P3) Ninety-three "Signature omitted" blocks are a catalogue of process comments

   Location: Suggested.lean:471–1267 (`/- Signature omitted: ... API signature omitted: ... Example omitted: ... -/`).

   Claim: these record targets whose carriers are missing.

   Witness: 93 comment blocks restate README targets verbatim with "omitted" annotations; the brief forbids catalogues of names and process comments, and the README is the place for targets without carriers.

   Repair: delete lines 471–1267; keep the layer section comments `/-! ## Layer k: <title> -/` only where a declaration follows.

13. **F13** (P3) Thirty-seven Lean names never appear in the README

   Location: Suggested.lean declarations `degreeCompletion_component_apply`, `dividedTensor`, `dividedTensor_coe`, `shuffleDividedPowers`, `tensorSymmetricAlgebra_commRing`, `tensorSymmetricAlgebra_algebra`, `tensorSymmetricAlgebra_include`, `dividedPowerComparison`, `dividedPowerComparison_dp`, `dividedPowerComparisonEquiv`, `dividedPowerComparisonEquiv_toAlgHom`, `tensorSquareEquiv`, `tensorSquareEquiv_tprod`, `degreeTwoInvariant`, `invariantTensorMultigrading`, `monicCoefficientLift`, `fixedResultantCongruence`, `padicResultantRecognition`, `titsFreeSubgroup`, `freeMatrixWordGrowth`, `constantRankLocal`, `riemannGoodCover`, `BettiTorus`, `torusCharacter`, `torusCharacter_apply`, `torusAnnihilator`, `torusAnnihilator_mem`, `closedTorusSubgroup_characters`, `countableClosedTorusSubgroups`, `invarianceOfDomain`, `shiftedFactorSlope`, `resultantRecognition`, `powerSumReconstruction`, `weilPolynomialCount`, `weilGeneratorDiscriminantBound`, `orderedRootProductBound`, `rationalOrbitCount`.

   Claim: README and Lean agree.

   Witness: `grep -c <name> README.md` returns 0 for each.

   Repair: name the Lean declaration in each corresponding README target (e.g. "`resultantRecognition`" under "Recognition from nonzero monic resultant tests").

14. **F14** (P3) Library locators point at non-pinned commits and miss pinned TauCeti libraries

   Location: README.md:2369–2383 ("Library declaration locations", Mathlib `082e2d37...`, TauCeti `f790474...`); README.md:134–147 ("Library interfaces"); Suggested.lean:424–436 (`weilGeneratorDiscriminantBound` uses `Polynomial.resultant P P.derivative`).

   Claim: these are the pinned locations and the available library.

   Witness: `lake-manifest.json` on main pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At the TauCeti pin exist `TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean` (`resultant_deriv`, `discr_eq_prod_roots_sub_sq`, `discr_mul`, `discr_powerBasis_eq_minpoly_discr`), `TauCeti/LinearAlgebra/TensorPower/Basic.lean` (`TauCeti.TensorPower.oneEquiv`, `splitAt`), `TauCeti/AlgebraicGeometry/AbelianVariety/{Basic,Isogeny,End/Basic}.lean` (`AbelianVariety`, `End`, `IsIsogeny`), none cited.

   Repair: relink every location to the pinned commits; add the TauCeti files above to "Library interfaces"; state `weilGeneratorDiscriminantBound` with `Polynomial.discr` and cite `discr_powerBasis_eq_minpoly_discr` for |D_K| ≤ |disc P|; cite `TauCeti.TensorPower.oneEquiv` for the "native singleton tensor equivalence" of `tensorSymmetricPower_one`.

15. **F15** (P3) KS Definition 1.6 does not define TSym or the shuffle product

   Location: README.md:193, 244, 255, 266 ("**Source.** [KS], Definition 1.6, PDF pp.8–9" for invariant tensor powers, shuffle multiplication, degree-two comparison, divided power comparison).

   Claim: the source defines the invariant tensor power, its shuffle multiplication and divided powers.

   Witness: KS line 367–377 (Definition 1.6, PDF p.8) only introduces the multigraded notation TSym^α(M(Ξ)) for a T_{L,R}-module; KS line 147 says "TSym denotes the tensor symmetric power" without definition; "shuffle" does not occur in the text.

   Repair: cite a primary source for the definition and shuffle algebra, e.g. Roby, Lois polynômes et lois formelles (1963) §III, or Bass, Algebraic K-theory, Appendix, or Kings, Eisenstein classes, elliptic Soulé elements and the ℓ-adic elliptic polylogarithm §2.2; keep KS Definition 1.6 only for the multigrading target.

16. **F16** (P3) LT's stated g² log g is a misprint the README silently corrects

   Location: README.md:2153–2160 ("prove log N_p(g) = (1/2)g² log g + O_p(g²)", source "[LT] §§5.3–5.5, equations (39),(51)–(56)").

   Claim: the source supports the coefficient 1/2.

   Witness: LT line 1243 ((51)) and line 1418 ((56)) state [K:Q] n² log n and g² log g, but LT's own c(M) at line 1067–1078 is (∏_{d≤n}(d−1)!/(2π)^d)^{[K:Q]}, whose logarithm is (1/2)[K:Q] n² log n + O(n²). The README's value is right; the deviation from the cited equations is unrecorded.

   Repair: add to the target: "LT (51) and (56) print the coefficient 1 for [K:Q] n² log n; the factorial product in LT (39) gives 1/2, which is the value proved here", and list the misprint in the References note.

17. **F17** (P3) PELModuli M5–M6 cited for period uniformization, which is M3

   Location: README.md:47, 698–699 and 1398 ("**PELModuli**, M5; **PELModuli**, M6" for period uniformization and polarized moduli with level).

   Witness: PELModuli (PR #966 head) §M3.5 "The complex uniformization morphism" and §M3.6 "Algebraization of the uniformization"; M5 is "Siegel, Hilbert and unitary examples", M6 "Arithmetic moduli, coarse spaces and Hodge lines".

   Repair: cite `PELModuli §M3.5–M3.6` for uniformization and `§M5` for the Siegel family; keep M6 only for coarse moduli with level.

18. **F18** (P3) JacobianChallengePartII slugs do not exist

   Location: README.md:1344 (`JC7/universal-faltings-zhang`), README.md:1369 (`JC2/curve-difference`).

   Witness: JacobianChallengePartII (PR #1225 head) has no "JC2"/"JC7" labels and neither slug; its Layer 2 is "Abel maps and section-free differences", §5.3–5.4 "Faltings–Zhang morphism"/"Shifted Faltings–Zhang morphism", §7.2 "Faltings–Zhang for a curve family with full level".

   Repair: cite `JacobianChallengePartII Layer 2` and `§7.2` (with §5.3–5.4) respectively.

19. **F19** (P3) ComplexComparisonPartII C0 cited for the Dolbeault lemma, which is C1

   Location: README.md:40–41 ("C0, supplies analytification and bundle-valued Dolbeault comparison"), README.md:581 and 591.

   Witness: ComplexComparisonPartII (PR #848 head) Layer C0 is "Coherent analytic modules and coherent analytification"; `localDolbeault` is listed under C1 (line 48).

   Repair: Needs of "Smooth tensor model and Dolbeault resolutions": `ComplexComparisonPartII C0` (analytification) and `C1 (localDolbeault)`.

20. **F20** (P3) Vector groups are AlgebraicVectorBundles L2B, not L2A

   Location: README.md:333–335 (Needs "AlgebraicVectorBundles, L2A").

   Witness: `TauCetiRoadmap/AlgebraicVectorBundles/README.md:306` L2A is "structured linear schemes", `:340` L2B is "geometric vector bundles"; the parent's A4.2 cites L2B for V(F).

   Repair: cite L2B (this disappears if R03 removes the target).

21. **F21** (P3) Vacuous or restating Checks and API items

   Location: Suggested.lean:121–122 (`degreeCompletion_product` is `rfl` for an `abbrev`), 109–110 (`degreeCompletion_zero_component` instance of `degreeCompletion_zero`), 205–207 (`tensorSymmetricAlgebra_free` restates `dividedPowerComparisonEquiv`), 70–72 (`tensorSymmetricPower_ext` is `Subtype.ext_iff`), 91–97 (`degreeCompletion_component` with sole property `= c n`); README.md:212–215.

   Repair: delete the four items; replace the README Check `degreeCompletion_product` by a discriminating one (e.g. the product of two sequences supported in degrees m and n is supported in degree m + n under the shuffle product), and `degreeCompletion_zero_component` by a nonzero-component example.

22. **F22** (P3) B4 induction states a stronger hypothesis than its source

   Location: README.md:1321–1328 ("finite geometric generic stabilizer", source Gao–Betti Theorem 10.1).

   Witness: Gao–Betti line 1276–1283 (Theorem 10.1, PDF p.26) assumes (c) "X + A′ ⊄ X for any non-isotrivial abelian subscheme A′", and proves rank ≥ 2(dim X^{[m]}_ι − t) for every t ≥ 0.

   Repair: state hypothesis (c) as in the source and the t-parametrized conclusion; keep "finite stabilizer" only in the survey-sourced "Non-degeneracy criterion for fibre powers".

23. **F23** (P3) Uncited reference and off-by-one page

   Location: README.md:2320 and 2352 ("Smith" reference, never cited in the body); README.md:2126 ("Porism 4.3 ... printed pp. ... 540").

   Witness: `grep -n Smith README.md` hits only the reference list; Waterhouse line 786 (Porism 4.3) lies on PDF page 21 = printed 541.

   Repair: delete the Smith entry; write "541".

Files reviewed: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md` (2383 lines, every line) and `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean` (1267 lines, every line). Pins used: Mathlib `6b7abb3c` and TauCeti `a91d3aaf` from `lake-manifest.json` on main.

## Dependency check

    NOT IN ORDER: AbelianSchemesAndArithmeticModuliPartII (insert it after its last supplier)
    depcheck: 5 roadmaps, 32 edges, 1 problem(s)

No UPWARD or CYCLE line. "Not in order" is expected before intake. Note that the checker saw only 5 roadmaps: HodgeStructuresPartII and LogicAndDefinabilityInNumberTheory (R01, R02) are not in the order file, so their direction cannot be checked mechanically.

## Verified sound

- Declarations read: 62 (18 `theorem`, 15 `lemma`, 17 `def`/`abbrev`/`instance`, 12 `example`), plus the 93 comment blocks. Each native statement was instantiated on its degenerate cases; all 22 native theorem statements are true as typed: `monicCoefficientLift` (trivial ring forces trivial O), `fixedResultantCongruence` (any m, n), `padicResultantRecognition`/`resultantRecognition` (slope argument: v Res(R,ψ_n) = n·deg R exactly, Res(S,ψ_n) stabilizes), `shiftedFactorSlope` (checked e = 0, S = 1, n = 0), `powerSumReconstruction` (coefficient convention `coeff i = q^{g−i} coeff (2g−i)` matches a_{2g−i} = q^{g−i}a_i; g = 0), `weilPolynomialCount` ((4g q^{j/2}+1) ≤ (4g+1)q^{j/2}; q = 2, g = 1 gives 5 ≤ 7.07), `weilGeneratorDiscriminantBound` (d = 1 vacuous but true), `orderedRootProductBound` (integer because it equals ∏ disc(R_k)^{e_k²}∏ Res(R_k,R_l)^{e_k e_l}; m = 0, 1), `rationalOrbitCount` (fibre count [K:S]·#Γ\G/K and conjugation bijection), `titsFreeSubgroup` (char 0 needs no finite generation; n = 0 vacuous), `freeMatrixWordGrowth` (C = 1/2, T₀ = 1), `constantRankLocal`, `riemannGoodCover`, `closedTorusSubgroup_characters`, `countableClosedTorusSubgroups`, `invarianceOfDomain` (m = 0), `degreeTwoInvariant` (TauCeti `symmetricTensors` is `eqLocus (TensorProduct.comm) id`), `invariantTensorMultigrading` (empty index, k = 0 and k > 0), `tensorSymmetricAlgebra_divided` (binomial count of shuffles), `dividedPowerComparison` (the four divided-power relations hold for v^{[n]} in the shuffle algebra over any module).
- Targets read: 115 (all). Conventions checked by computation: Betti form 2 Σ d_j da_j∧db_j and "twice the polarization class" (g = 1: i∂∂̄(2(Im w)²/y) = 2 da∧db); reciprocity a_{2g−i} = q^{g−i}a_i; D_* integrality; Honda–Tate invariant f_v ord_v(π)/a versus [K:Q_p]ord_v(π)/ord_v(p^a); the prime-field case a = 1 giving E = Q(π); p = 2 elliptic counterexample (y²+xy = x³+x²+1: #E(F_2) = 2, #E(F_4) = 8) and p = 3 separately (a ∈ {1, 3} both fail); independence of the nine class-number-one square classes; the compact-preimage lattice limit; the LT Lemma 2.1 constant corrected to (4g+1)^g.
- Locators verified against the text: 85 (KS 15, DGH 9, GH 10, LT 16, Gao–Betti 5, Gao–Ax 7, Lee 2, DPH 3, Lemmermeyer 1, Conrad 2, Waterhouse 3, Gao–Survey 1, Tate 4, Milne 1, WM 5, GGK 0). All agree with the README except R15, R16, R23. In particular LT Lemma 5.19 is false for p = 2 as printed and the README correctly restricts it.
- Checks tested: 56 README Checks and 12 Lean examples; all true as stated except the vacuous/restating ones in R21.
- Sibling citations checked: 41 (parent A1–A6 and nine slugs; FiniteFlat R07.1, R07.2, two slugs; DWP 0.1–0.3, 1.4; GN.2–GN.3; JC2/JC7 and two slugs; CC2 C0; AA.1, AA.3, AA.4 and their anchors; PEL M5–M6; H.2; LD.6; AVB L0B, L2A; ClassFieldTheory Layers 5, 10, 13; SemisimpleAlgebras Layers 4, 5; Chebotarev Layer 14; Completed/EffectiveBounds Layer 1; SchemeAndStackFoundations Layers 2, 4; DifferentialGeometry Layers 0–1). Sound: DWP, AA, CC2 (layer exists), AVB L0B, CFT, SemisimpleAlgebras, Chebotarev, EffectiveBounds, SF, DG, JacobianChallenge.
- Pinned declarations grepped at the pins: `Polynomial.resultant` (optional degree arguments), `PadicInt.valuation : ℕ`, `PadicInt.appr_spec`, `IsDiscreteValuationRing.addVal : AddValuation R ℕ∞`, `DividedPowerAlgebra.dp`, `MvPolynomial.mul_esymm_eq_sum`, `OpenPartialHomeomorph` (module `Mathlib.Topology.OpenPartialHomeomorph.Basic`), `Topology.IsOpenEmbedding`, `DoubleCoset.Quotient`, `ℕ∞ω`, `TauCeti.symmetricTensors`; every submodule import in Suggested.lean exists at the pin.
- Policy: the pull request changes only the package folder (README.md, Suggested.lean, metadata.toml, review.json); no pull-request numbers in README or Lean; every target has a locator; no computational algorithms. Headlines: no easy headline on existing carriers is missing (the F-layer statements need Tate modules, Frobenius polynomials or Dieudonné modules, none at the pins) and none is forced.

## Not verifiable

- GGK, Proposition 5.2, Step 1, equation (5.4), printed pp. 212–213: the sources service returned arXiv 2105.15085v4 (102 pages), whose extracted text could not be searched for "Proposition" or "degenerate" (layout artefacts); the published PMIHES pagination was not checked.
- Milne 1968 and WM 1971 are OCR of image-only scans; the §1 characteristic-polynomial criterion (Milne lines 83–121, PDF p.3) and Part I Theorems 3, 5, 6 and Part II Theorems 1, 2 (WM lines 105–160, 298–345) were located by heading only; formula-level text is garbled.
- Whether the roadmap's design declared gaps: no `design/plan.json` is readable in the package, and the README has no `## Exact supplier contracts` section, so R01, R02 and R04 are reported as unowned.
- Lean elaboration was not run (read-only pass); the reviewer's record that the file elaborated was against Mathlib `082e2d37`, not the current pin.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46bb9812d1f7c1386aabbe7dba3f514309c714db", "job": "RT-AbelianSchemesAndArithmeticModuliPartII~1b", "model": "fable", "worker": "chris-g"} -->
