<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/165#issuecomment-6321025500 -->
Red team round 1 pass a (codex) of 0a73908

Verdict: needs_changes

1. **F01** (P1) The proposed supplier graph is explicitly reciprocal

   Location: packages/ModularIwasawaMainConjectures/README.md:144, also :17: “the two roadmaps cite each other layer by layer”.

   Claim: Reciprocal imports from AutomorphicCongruences are acceptable because individual targets can be interleaved.

   Witness: README:144 assigns formulations in Layers 0–1 here to AutomorphicCongruences, then imports its Layers 1–4 into this roadmap. Neither roadmap can precede the other in the required single supply order.

   Exact repair text: “Move the shared formulation definitions and their prerequisite comparisons into one earlier owner. Automorphic reverse bounds consume that owner; this roadmap consumes those bounds and the same earlier definitions.” Remove the reciprocal contract and give each transferred target a unique owner. Recheck the full roadmap graph after the ownership move.

2. **F02** (P3) The package has no required source manifest

   Location: packages/ModularIwasawaMainConjectures/README.md:1844–1870 and the package file inventory.

   Claim: Every cited work must have legal-source provenance and exact version/locator metadata in sources.toml.

   Witness: At 0a73908 the package contains README.md, Suggested.lean, metadata.toml and review.json; sources.toml is absent.

   Exact repair text: “Add sources.toml using tauceti-roadmap-sources/v1, recording every cited work, the exact version read, locator, cited_for and the sources service's provenance/status fields.” Include works cited only in the body; retain uncertified status where applicable.

3. **F03** (P1) The divisor formula quotients by a possibly nonintegral zeta element

   Location: packages/ModularIwasawaMainConjectures/README.md:353,371: “z_f ∈ H¹(T_K) ⊗ Q”; “length (H¹/Λz)_𝔭”.

   Claim: The integral quotient H¹/Λz exists for the declared rational zeta element.

   Witness: H¹=Λe and z=ϖ⁻¹e meet the rational carrier condition, but Λz is not contained in H¹. Thus H¹/Λz is undefined.

   Exact repair text: “When Λz⊆H¹, use length H²_𝔭−length(H¹/Λz)_𝔭. For rational z choose nonzero d with dz∈H¹ and use length H²_𝔭−length(H¹/Λdz)_𝔭+ord_𝔭(d); prove independence of d.” Retain the separate containment requirement in integral KMC.

4. **F04** (P2) The Σ-independence headline omits localization hypotheses

   Location: packages/ModularIwasawaMainConjectures/README.md:327,348: “for finite Σ, Σ' not containing p”.

   Claim: Integral IMC is equivalent for every pair of finite imprimitive sets for every datum of §0.5.

   Witness: SU line 1006–1008 requires torsion and no invariant submodule of T*. The proof at README:1447–1455 retains those hypotheses, but the earlier headline does not.

   Exact repair text: “IMC.iff_of_sigma: under the localization-surjectivity hypotheses of §5.1, including H⁰(G_Q,T*)=0 and torsion for the common larger imprimitive dual, IMC^Σ(D) ↔ IMC^{Σ′}(D).” Qualify the Check at line 348 likewise, or add a separate theorem proving the unrestricted transfer.

5. **F05** (P1) The localization condition is tested using the wrong dual

   Location: packages/ModularIwasawaMainConjectures/README.md:1802: “T*=Hom(T_pE,μ_{5^∞})≅E[5^∞]”.

   Claim: This Tate dual is the T* in Skinner–Urban Proposition 3.2.18.

   Witness: SU line 690–691 defines M* as Hom_cont(M,Q_p/Z_p). For T=Z_p(1), its invariants vanish for odd p; the Tate dual Hom(T,μ_{p∞}) instead has all Q_p/Z_p invariant.

   Exact repair text: “For SU Proposition 3.2.18 use T*=Hom_cont(T,Q_p/Z_p) with contragredient Galois action. For T=T_pE this is E[p∞](−1).” Correct §§0.2, 5.1 and 6.2 consistently, and recompute the 11a1 invariant test; rational 5-torsion alone does not prove the stated hypothesis fails.

6. **F06** (P1) The universal family is quantified over inadmissible ramification sets

   Location: packages/ModularIwasawaMainConjectures/README.md:1306: “Σ a finite set of primes … universal deformation … unramified outside Σ”.

   Claim: The universal object and theorem exist for every finite Σ.

   Witness: Take Σ=∅ and the ramified residual representation of 14a1 at p=5 used in §2.2. An unramified-outside-Σ lift would reduce to an unramified representation, contradicting its inertia at 2.

   Exact repair text: “Let Σ be a finite set containing p, every prime ramifying in ρ̄, and the auxiliary Steinberg prime; use the admissible deformation/Hecke setting of Fouquet–Wan §2 throughout.” Carry these conditions into §4.2 and add the empty-Σ negative control.

7. **F07** (P1) Split multiplicative coordinate conversion loses a logarithm

   Location: packages/ModularIwasawaMainConjectures/README.md:1607: “in the variable T … the same proposition is stated with Reg_γ/#E(Q)_tors²”.

   Claim: Substitution of Reg_γ for Reg_p suffices in both MTT branches.

   Witness: At split rank zero, the order is one and T=log_p κ(γ)(s−1)+O((s−1)²). The T-leading coefficient is the derivative divided by log_p κ(γ); Reg_γ=1 contributes no such factor.

   Exact repair text: “In T-coordinates the good ordinary/nonsplit formula uses Reg_γ; the split formula uses (ℒ_p(E)/log_p κ(γ))·Reg_γ.” Retain the existing torsion convention and add this split rank-zero Check.

8. **F08** (P1) The height construction uses the wrong Frobenius normalization

   Location: packages/ModularIwasawaMainConjectures/README.md:1150,1188: “crystalline Frobenius … with eigenvalue α⁻¹”.

   Claim: The supplied crystalline Frobenius has the α⁻¹ eigenline required in §3.7.

   Witness: SW line 542–548 uses φ=F/p. For 11a1 at 7, the unnormalized F has roots α,7/α. Neither is α⁻¹: valuations exclude 7/α, and α≡−2 mod 7 excludes α²=1.

   Exact repair text: “Write F for crystalline Frobenius and use φ:=p⁻¹F, with characteristic polynomial X²−(a_p/p)X+p⁻¹. Choose ν_α in the α⁻¹ eigenspace of φ.” State the normalization bridge to CrystallineCohomology and add the two-root Check.

9. **F09** (P1) The sigma normalization omits the Weierstrass b₂ shift

   Location: packages/ModularIwasawaMainConjectures/README.md:1150: “e₂ := −12a/b … the value E₂(E,ω_E)”.

   Claim: For η=xω on an arbitrary minimal Weierstrass equation, −12a/b equals Katz's E₂, and this value can be reused as Katz's E₂ in the multiplicative exponential.

   Witness: MST line 158–167 gives c=(b₂−E₂)/12. The README's Bernardi equation and exponential give c=−e₂/12. For 11a1, b₂=−4, so the two constants differ by −1/3.

   Exact repair text: “Set b₂=a₁²+4a₂ and E₂(E,ω_E)=b₂−12a/b. Define σ_p=exp((E₂−b₂)log_E²/24)·σ_B, where −D²log σ_B=x and D=d/dω_E.” Equivalently keep the exponential coefficient −12a/b but call it E₂−b₂. Apply the same shift in the multiplicative construction and add a nonzero-b₂ model test.

10. **F10** (P1) The Tate differential scaling factor is inverted

   Location: packages/ModularIwasawaMainConjectures/README.md:1160: “ψ*ω_E = C·du/u, put e₂ := C²(1 − 24∑…)”.

   Claim: Katz's weight-two value scales by C² when the differential scales by C.

   Witness: Under ω↦Cω, log_E↦C log_E, so the exponential coefficient must scale by C⁻². With C=2 the required factor is 1/4, not 4. MST line 96–99 fixes sigma's differential scaling.

   Exact repair text: “With ψ*ω_E=C·du/u and C≠0, put E₂(E,ω_E)=C⁻²(1−24∑_{n≥1}∑_{d∣n}d q_E^n).” Use E₂−b₂ in the exponential as in R09. SW line 807–818 prints C² with this pullback convention; do not carry that misprint into the target. Test C=2.

11. **F11** (P2) The displayed height formula is undefined at the identity

   Location: packages/ModularIwasawaMainConjectures/README.md:1152–1158,1163.

   Claim: The sigma quotient defines the height on the entire stated finite-index subgroup.

   Witness: The identity belongs to this subgroup but has no affine x-coordinate denominator e(O); t(O)=0 and σ_p(0)=0. The displayed quotient does not define its height.

   Exact repair text: “Set ĥ_p(O)=0 and apply the sigma formula only to nonzero points of the stated subgroup. Set torsion heights to zero. For nontorsion P choose m≠0 with mP in that subgroup and define ĥ_p(P)=m⁻²ĥ_p(mP), proving independence of m.” Do this in both reduction branches.

12. **F12** (P2) An easy transcendence headline is omitted

   Location: packages/ModularIwasawaMainConjectures/Suggested.lean:15,339; packages/ModularIwasawaMainConjectures/README.md:1168,1185.

   Claim: The Tate-parameter transcendence target cannot be stated on pinned carriers.

   Witness: Tau Ceti a91d3aa has TauCeti.tateCurveAt in TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70. Mathlib 6b7abb3 has WeierstrassCurve.j, IsAlgebraic, Transcendental and PadicComplex (NumberTheory/Padics/Complex.lean:137).

   Exact repair text: “For prime p, q:(PadicComplex p)ˣ and hq:‖(q:PadicComplex p)‖<1, if (TauCeti.tateCurveAt q hq).j is algebraic over ℚ, then (q:PadicComplex p) is transcendental over ℚ.” Add this headline with the individual TateCurve.Specialization import; leave identification with a given global curve as the README target.

13. **F13** (P1) Four essential supplier contracts have no eligible owner

   Location: packages/ModularIwasawaMainConjectures/README.md:69–77,144,254,526,757,1000,1324.

   Claim: KatoEulerSystems, PadicHodgeRegulators, AutomorphicCongruences and GrossZagierAndArithmeticHeights supply the listed constructions and divisibilities.

   Witness: None has a folder on main, an entry in merge-order/ORDER.txt, or an exact-name roadmap pull request. The package has no declared gap. PadicFamilies §4.0 already owns modular zeta classes, reciprocity and part of the Kato bounds.

   Exact repair text: “Import the geometric modular zeta classes, reciprocity and cyclotomic bounds from PadicFamilies §§4.0.1–4.0.3 with their stated hypotheses. Import Wach modules, good bases and Iwasawa domains from PhiGammaModulesAndIwasawaCohomology §§6.0,6.2–6.3. State the missing rank-one-image extensions, Coleman/regulator constructions, reverse divisibilities, universal zeta constructions and integral Manin-period comparisons as named targets before their first use here, or declare precise gaps with eligible earlier suppliers in both Exact supplier contracts and design/plan.json.” Do not substitute the supplied full-SL₂ integral hypothesis for the weaker unipotent hypothesis without proving the extension. The Wach supplier explicitly excludes Coleman maps and regulators. Also retain a named owner for the analytic twist-nonvanishing contract used at §0.4; it cannot remain assigned to KatoEulerSystems §4.2.

14. **F14** (P2) The family period contract drops its correction ideal

   Location: packages/ModularIwasawaMainConjectures/README.md:844,848.

   Claim: PadicFamilies supplies a unit comparison with this package's saturated-eigensymbol normalization at every approximating weight.

   Witness: TauCetiRoadmap/PadicFamilies/README.md:1091–1101,1146–1148 retains a fractional correction ideal. Its unit conclusion requires a perfect integral coefficient pairing and a saturated controlled eigensymbol lattice, neither assumed nor proved here.

   Exact repair text: “Before hidaApproximant_padicL, prove hidaApproximant_periodComparison: for every chosen k_m the PadicFamilies §1.4 quotient-period correction ideal relative to §0.4 is a unit, by verifying the integral dual/divided-power pairing and saturation hypotheses. Use that theorem in the ideal congruence.” If these hypotheses cannot be established, retain the correction ideal and reformulate the subsequent comparison; rational interpolation cannot remove it.

15. **F15** (P3) The p=3 ordinary-control construction duplicates its current supplier

   Location: packages/ModularIwasawaMainConjectures/README.md:105,838,842,856.

   Claim: PadicFamilies supplies control and the family construction only for p≥5, so this package must construct the p=3 branch.

   Witness: TauCetiRoadmap/PadicFamilies/README.md:995–1009, §0.17, states ordinaryCuspidal_control_oddPrime for every odd prime and explicitly supplies Layers 1 and 4 at p=3.

   Exact repair text: “Use PadicFamilies §0.17, ordinaryCuspidal_control_oddPrime, and its Layers 1 and 4 for every odd p. The new target here is the approximation and comparison interface hidaApproximant, including its integral period comparison.” Remove the parallel p=3 control construction and the obsolete claim that the supplier excludes p=3.

16. **F16** (P1) The general derivative theorem has only a restricted family input

   Location: packages/ModularIwasawaMainConjectures/README.md:1627,1639.

   Claim: The supplied families prove greenbergStevens_derivative for every split multiplicative E/Q at every odd p.

   Witness: The p=3 input §1.6 requires irreducible E[p] and a ramified q∥N/p; the headline has neither. PadicFamilies §1.6 also assumes residual irreducibility. GS line 1615–1633 states its primary Theorem 7.1 only for p≥5.

   Exact repair text: “Add the general exceptional-zero deformation and period-comparison targets needed for greenbergStevens_derivative, including p=3 and reducible residual representations, with a legal primary locator supporting that range. Prove these inputs without the auxiliary-prime and irreducibility assumptions of hidaApproximant.” Preserve the general headline; the restricted approximation theorem cannot supply it.

17. **F17** (P2) The Schneider proof does not cover its headline's range

   Location: packages/ModularIwasawaMainConjectures/README.md:1241,1249,1266,1273–1275.

   Claim: The general elliptic and number-field abelian-variety statements follow through schneiderFlatGaloisComparison.

   Witness: That comparison is restricted to good ordinary E with irreducible E[p]. The elliptic headline includes reducible and multiplicative cases; the abelian headline also needs A/k heights and flat cohomology beyond the E/Q constructions of §§3.7–3.8.

   Exact repair text: “Add named targets for Schneider's flat-cohomology construction and algebraic and analytic heights for ordinary abelian varieties over number fields. Supply the full elliptic flat/Galois comparison, retaining H⁰ and local correction terms, and the multiplicative comparison with Werner's corrected height.” Give these their own prerequisites and locators. The now-readable src18 supplies mathematical statements, not the missing library targets.

18. **F18** (P2) The p-converse proof omits the L-value hypothesis and one direction

   Location: packages/ModularIwasawaMainConjectures/README.md:1537,1543.

   Claim: A nonzero specialization of the zeta class automatically spans a line in the Bloch–Kato Selmer group, proving the stated equivalence.

   Witness: FW line 4046–4061 first handles L(f,k/2)≠0 separately. In the converse branch it assumes L(f,k/2)=0; reciprocity then puts the nonzero class in H¹_f. The README omits both steps.

   Exact repair text: “For L(f,k/2)≠0, invoke the named Euler-system finiteness theorem with its hypotheses. For the converse assume L(f,k/2)=0. If the specialized zeta class vanishes, use the characteristic-ideal equality; otherwise explicit reciprocity places its nonzero specialization in H¹_f.” Add the actual earlier owner of the finiteness theorem and reciprocity to Needs, or make the missing specialization theorem a target before this application.

19. **F19** (P1) Exact supplier names and sections do not match current heads

   Location: packages/ModularIwasawaMainConjectures/README.md:179,220,300,340,382,848,1000,1198.

   Claim: The backticked supplier declarations exist at the cited sections.

   Witness: AutomorphicGaloisRepresentations has §§5.1–5.2, not R19.5; its actual names include ordinaryRefinement and eigenformWach. SelmerIwasawaCohomology's ordinary structure criteria are §§3.18–3.21. None of the cited hyphenated declaration names occurs in these current suppliers.

   Exact repair text: Replace the invented identifiers by current section and target names, preserving the supplied hypotheses and convention adapters:

   | Consumed contract | Exact current owner to cite |
   |---|---|
   | Ordinary refinement and lattice | TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2326, §5.1, ordinaryRefinement, ordinaryLatticePlusIn, ordinaryLatticeQuotient_free_rank_one; use its cohomological annihilator convention |
   | Good crystalline/Wach realization | Same file:2384, §5.2, eigenformDcris, eigenformWach, eigenformWach_modParameter |
   | Conductor and bad local factors | Same file:2526, §6.4 |
   | Unramified/Greenberg conditions, Galois Selmer group and dual | TauCetiRoadmap/SelmerIwasawaCohomology/README.md:492,519,562,589, §§2.7–2.10 |
   | Iwasawa cohomology, Shapiro, finiteness, determinant, étale comparison | Same file:1358,1390,1604,1616,1641, §§3.1–3.2,3.13–3.15 |
   | Ordinary localization, no pseudo-null submodule, Fitting comparison | Same file:1773–1833, §§3.18–3.21; verify the structure hypotheses before use |
   | Greenberg main-conjecture predicate | Same file:2206, §4.21 |
   | Integral periods, ordinary interpolation, signed functions, Euler depletion | TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1307,1744,2349,2463, §§1.1,2.5,4.2,4.3 |
   | Rational Tate-module comparison, parametrization, modularity | TauCetiRoadmap/EllipticCurveModularity/README.md:1255,1507,1788, R29.4 IsNewformOf.nonempty_tateModule_equiv, R29.5 modularParametrisation, R29.6 modularity |
   | Odd-prime family control | TauCetiRoadmap/PadicFamilies/README.md:995, §0.17 ordinaryCuspidal_control_oddPrime |

   A semantic resemblance does not supply a nonexistent declaration. Keep the integral lattice adapter of this package separate from the supplier's rational Tate-module comparison.

20. **F20** (P3) The coordinate and logarithm citations point to the wrong owners

   Location: packages/ModularIwasawaMainConjectures/README.md:61,175,179,107,1198,1570.

   Claim: PadicMeasuresIwasawaAlgebras Layer 1 provides the power-series coordinate and ColemanIntegration Layer 0 owns iwasawa-logarithm.

   Witness: TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2620,2747 places these coordinate/component results in §§4.5–4.6. ColemanIntegration §0.18 reexports DirichletPadicLFunctions §0.6, whose named logarithm and uniqueness targets are at README.md:250–264.

   Exact repair text: “Use PadicMeasuresIwasawaAlgebras §4.5 for the Iwasawa coordinate and §4.6 for tame character components. Import DirichletPadicLFunctions §0.6, localIwasawaLog, existsUnique_isIwasawaLog_of_finiteDimensional and localIwasawaLog_exp, for the normalized logarithm.” Cite the earliest owner directly and retain the p=2 depth-four convention where applicable.

21. **F21** (P1) Internal build dependencies run backwards and form cycles

   Location: packages/ModularIwasawaMainConjectures/README.md:168,348,435,739,869,1603,1639.

   Claim: The layers provide a sequential construction using the shared Needs lines.

   Witness: §0.1.ofEllipticCurve uses §3.1, which uses §0.1; §0.5.iff_of_sigma uses §5.1, whose Needs includes §0.5; §5.6.exceptional_rank_zero uses §5.7, whose Needs includes §5.6. Section 0.8 also consumes the later §1.2 unipotent input.

   Exact repair text: “Keep the abstract datum and conjecture predicates in Layer 0. Move ofEllipticCurve after the lattice comparison of §3.1. Move the unipotent algebra before its first use in §0.8. Place the Euler-factor/Σ-change comparison before §1.3, and only then state iff_of_sigma. Keep MTT's definitions before Greenberg–Stevens, and place MTT.exceptional_rank_zero after it.” Split Needs by theorem wherever a section mixes definitions with these later comparisons.

22. **F22** (P3) Period scaling is reversed in the proof plan

   Location: packages/ModularIwasawaMainConjectures/README.md:486.

   Claim: Scaling the differential divides its periods.

   Witness: For any integration cycle c, ∫_c aω=a∫_c ω. Taking a=2 doubles a nonzero period, whereas the claimed division halves it.

   Exact repair text: “Scaling ω by a multiplies its periods by a, so divides the period-normalized L-function by a.”

23. **F23** (P3) Congruence Checks lose the stated precision and coefficient field

   Location: packages/ModularIwasawaMainConjectures/README.md:855–856,889.

   Claim: The displayed ideal example detects generator ambiguity modulo p^m; residual congruence gives (b) at m=1; every nonzero residue at p=3 squares to one.

   Witness: X and X+ϖ^m are congruent modulo ϖ^m. For ramified O, reduction modulo ϖ does not determine reduction modulo p. A generator of F₉× has order eight, so its square is not one.

   Exact repair text: “For odd p, X and 2X generate the same ideal with p^m but are not congruent modulo p^m. Residual congruence gives only a comparison modulo ϖ, not generally modulo p. For an elliptic curve at p=3 the residue a₃ lies in F₃×={±1}.” Replace all three Checks with these formulations.

24. **F24** (P3) Three statable definition Checks have no Lean mirror

   Location: packages/ModularIwasawaMainConjectures/README.md:699,701,735; packages/ModularIwasawaMainConjectures/Suggested.lean:127–182,203–269.

   Claim: The retained predicates' boundary Checks are represented in Lean.

   Witness: No declaration tests IsRamifiedAt on a trivial representation, reversal of DistinctCharacters, or the residually unipotent matrix [[1,1],[ϖ,1+ϖ]] against HasRankOneCoinvariants.

   Exact repair text: “Extend the existing negative ramification example to include a trivial representation, and extend the character example to test reversal. Add not_hasRankOneCoinvariants_residuallyUnipotent for the matrix in §1.2 as a named theorem target, or prove it as the second coinvariant example.” Retain at most two proved examples per definition.

25. **F25** (P3) The Lean file contains a prohibited catalogue and library-only example

   Location: packages/ModularIwasawaMainConjectures/Suggested.lean:310–317,321–352.

   Claim: These belong to the representative signatures deliverable.

   Witness: The final example tests only Associated and PowerSeries, with no definition introduced here. Lines 324–351 catalogue names explicitly omitted from Lean. Both are excluded by the requested file shape.

   Exact repair text: “Delete the final library-only example and the trailing catalogue; retain the uniformizer-versus-one Check in the README. The opening non-exhaustiveness note suffices.”

26. **F26** (P3) A retained generic theorem duplicates a pinned result

   Location: packages/ModularIwasawaMainConjectures/Suggested.lean:66–74; packages/ModularIwasawaMainConjectures/README.md:664.

   Claim: invariants_comp_subtype_eq_top is new supporting library work here.

   Witness: Mathlib/RepresentationTheory/Invariants.lean:85 at 6b7abb3 states Representation.invariants_eq_top under Representation.IsTrivial. Applying it to ρ.comp I.subtype with the supplied h gives this statement exactly.

   Exact repair text: “Delete invariants_comp_subtype_eq_top from the proposed API. In the proof of FWAuxiliaryCondition.isRamifiedAt, equip ρ.comp I.subtype with Representation.IsTrivial using h and apply Representation.invariants_eq_top.” Cite the pinned declaration in the supplier contract.

27. **F27** (P3) The p=3 replacement is attributed to the wrong authors

   Location: packages/ModularIwasawaMainConjectures/README.md:95,1331.

   Claim: The two replacement propositions are joint Paškūnas–Tung results.

   Witness: FW line 1385–1390 cites [98], Propositions 2.13 and 2.33; FW line 5989–5990 identifies [98] as Paškūnas's 2016 paper. FW line 1400 thanks Nakamura and Tung separately.

   Exact repair text: “Use Paškūnas, On 2-dimensional 2-adic Galois representations of local and global fields, Propositions 2.13 and 2.33, as cited after Fouquet–Wan Theorem 3.6.” Correct both attributions and record this source.

28. **F28** (P2) Transcendence is restricted to the downstream application

   Location: packages/ModularIwasawaMainConjectures/README.md:1168: “for the Tate parameter, the only case used”.

   Claim: It suffices to target only q_E for rational elliptic curves.

   Witness: Waldschmidt line 57–60,112–117 states the result for every algebraic q in ℂ or ℂ_p with 0<|q|<1, at every prime. Rational j and odd p are application restrictions, not theorem hypotheses.

   Exact repair text: “Develop the general p-adic theorem: for every prime p and algebraic q∈ℂ_p with 0<|q|_p<1, J(q) is transcendental. Deduce tateParameter_transcendental and tateParameter_log_ne_zero as elliptic corollaries.” Register the general theorem with its locator and the existing-carrier Lean signature of R12; do not limit the library target to the case used here.

## Verified sound

All 1,870 README lines and all 354 Suggested.lean lines were read. The inventories below cover 29 Lean declarations (6 definitions, 11 theorems, 11 proved examples and 1 local instance), 51 numbered target sections, 134 named-output rows and 23 bold-text rows. The 208 README inventory rows include headings as well as targets; one bold row includes several height definitions. All 214 Check entries were examined. Ten finite-field point counts, two model discriminants and nine eta-product coefficients were independently recomputed; the results are recorded below. The mathematical tables give the instances tried and distinguish defects from successful boundary checks.

The source service was used for all 35 cited works: 29 readable, four settled uncertified and two unresolved. The ledger records 62 checked locator groups, counting a row with multiple related numbered statements as one group. This count covers the specified statement or convention comparisons, not complete verification of every cited proof. The newly supplied Schneider text was read; it is no longer classed as unavailable.

Supplier audit: 41 external Needs lines and 32 named roadmap candidates were inventoried. The 24 concrete contract groups in the table below were checked against main or the suppliers' current heads. The six supplied sibling heads were searched for overlapping objects and ownership: K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The package makes zero direct supplier citations to those six. ColemanIntegrationPartII explicitly excludes the height construction and comparison. The four nonexistent supplier names were also searched as exact-name roadmap pull requests, with no results.

The retained Lean signatures carry the necessary explicit finite-dimensionality, domain, DVR, nontriviality, primality and closedness binders. The rank-two unipotent quotient works over an arbitrary DVR, including equal characteristic; the zero ring and fields do not satisfy its DVR hypotheses. The upper-uniformizer quotient is O⊕O/ϖ, and the identity has rank-two coinvariants. The μ comparison has the nonzero hypotheses needed for finite uniformizer divisibility and cancellation; completeness is unnecessary. No forced headline using sorry'd data was found. R12 records a missing easy headline.

The LLZ comparison retains the actual Coleman-image quotient and its restriction on the second map's tame character. The FW pointwise theorem distinguishes the trivial and nontrivial auxiliary quadratic characters. BCS's rational and integral conclusions retain different hypotheses. The inverse-determinant sign is correct in the two unequal-length examples. The ordinary rank-r coordinate comparison has the correct logarithm power; R07 concerns the extra split zero. The package avoids the source's invalid arbitrary-lift inference for residual unipotents.

The pinned library heads are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The reads included Representation.invariants_eq_top, the DVR and quotient APIs, Matrix.SpecialLinearGroup.map, PadicInt.toZMod, CuspForm.rank_eq_zero_of_weight_lt_twelve, PadicComplex, TauCeti.tateCurveAt and WeierstrassCurve.j. Searches by mathematical object found no exact pinned duplicate of the rank-two unipotent quotient or μ-comparison headline. R26 identifies the generic invariants duplicate.

The head's diff is confined to README.md, Suggested.lean, metadata.toml and review.json inside packages/ModularIwasawaMainConjectures. Suggested.lean has one import Mathlib, no set_option, no lemma declarations, no admitted examples, no sorry'd data and no True placeholders. No implementation file was edited, no Lean command was run, and nothing was posted.

Dependency-check output (exit 1):

```text
NOT IN ORDER: ModularIwasawaMainConjectures (insert it after its last supplier)
depcheck: 7 roadmaps, 53 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The placement message is not a finding. This checker does not detect the reciprocal prose contract, validate the missing supplier declarations, or resolve internal theorem dependencies; R01, R13, R19 and R21 give the independent witnesses.

### Supplier contract ledger

Paths in this table are under TauCetiRoadmap/ unless marked as pinned library paths. Current-head identifiers are included where a finding depends on supplier drift.

| Contract group | Owner and inspected locator | Result |
|---|---|---|
| 1. Ordinary filtration/lattice | AutomorphicGaloisRepresentations/README.md:2326, §5.1, head 2648a49 | Current names and arithmetic/cohomological dual convention checked; R19 |
| 2. Crystalline/Wach realization | Same file:2384, §5.2 | Integral quotient identifies with D_cris only after inverting p; R19 |
| 3. Conductor and bad local factors | Same file:2526, §6.4 | Geometric versus arithmetic Frobenius retained; R19 |
| 4. Unramified/Greenberg/ordinary local conditions | SelmerIwasawaCohomology/README.md:492–561, §§2.7–2.8a, head 17f6056 | Existing owners, not the invented identifiers; R19 |
| 5. Galois Selmer group and Pontryagin dual | Same file:562,589, §§2.9–2.10 | Contragredient action retained; R19 |
| 6. Iwasawa cohomology and Shapiro | Same file:1358,1390, §§3.1–3.2 | Inverse tautological action is explicit; R19 |
| 7. Control, duality, finite generation, determinant, étale comparison | Same file:1567–1641, §§3.11–3.15 | Hypotheses and error terms retained; R19 |
| 8. Ordinary localization and structure | Same file:1773–1851, §§3.18–3.21 | Checkable hypotheses needed before no-pseudo-null/Fitting statements; R19 |
| 9. Greenberg predicate | Same file:2206, §4.21 | General conjecture proposition, not unconditional theorem |
| 10. Periods, interpolation and depletion | ModularSymbolsPadicLFunctions/README.md:1307,1744,2463, §§1.1,2.5,4.3, head 4310d40 | Fixed integral normalization and primitive conductor matter; R14,R19 |
| 11. Pollack signed functions | Same file:2349, §4.2 | Signed object owner; rational unit does not imply integral unit |
| 12. Elliptic realization | EllipticCurveModularity/README.md:1255,1507,1788, R29.4–R29.6, head a3f383 | Rational Tate comparison and rational parametrization scalar; not the absent integral Manin contract |
| 13. Odd-prime control | PadicFamilies/README.md:995, §0.17, head f9ad8cc | Already includes p=3; R15 |
| 14. Family period specialization | Same file:1089,1140, §§1.4,1.6 | Correction ideal retained; R14 |
| 15. Modular zeta inputs | Same file:2347–2390, §§4.0.1–4.0.3 | Existing partial owner for the claimed Kato supplier; R13 |
| 16. Wach modules and domains | PhiGammaModulesAndIwasawaCohomology/README.md:1836,1905,1943, §§6.0,6.2–6.3 | Good bases/domain interfaces supplied; regulators expressly excluded at :49–51 |
| 17. Completed Iwasawa coordinate/components | PadicMeasuresIwasawaAlgebras/README.md:2620,2747, §§4.5–4.6 on main | Layer 1 locator incorrect; R20 |
| 18. Iwasawa logarithm reexport | ColemanIntegration/README.md:31,39, L0.18, head acaaf50 | Imports DirichletPadicLFunctions §0.6; R20 |
| 19. Iwasawa logarithm construction | DirichletPadicLFunctions/README.md:250–264, §0.6, head a78529c | Normalization, uniqueness and local exp comparison exist; R20 |
| 20. Smooth-lift crystalline comparison | CrystallineCohomology/README.md:2357, CR.2.3, head 2c8b22a | Actual smooth/PD hypotheses present |
| 21. Crystalline Frobenius | Same file:2991, CR.3.4 | Unnormalized F, so height adapter must divide by p; R08 |
| 22. Mazur principle | SerreWeightAndLevelOptimisation/README.md:535, §2.9, head 763a749 | q≢1 and general-weight ℓ≥5 preserved in §5.11 |
| 23. Ordinary residual local form | Same file:655, §3.1 | Weight range and inertia exponent support the weight-four use |
| 24. Four sets of levels | Same file:823, §3.9 | ℓ≥5 and original representation/weight retained |

### Locator ledger

| Locator checked | Readable witness | Outcome |
|---|---|---|
| SU §1.1/Theorem 1 | SU lines 28–88 | Ordinary range, twists, weight congruence and auxiliary ramification |
| SU Lemma 3.2.17 / Proposition 3.2.18 | SU lines 989–1017 | Localization hypotheses retained only in later target; R04/R05 |
| SU dual convention | SU lines 680–700 | Untwisted Pontryagin dual; R05 |
| SU Theorem 3.6.4 | SU lines 1609–1639 | Rational/integral distinction and large-Σ proof |
| SU Theorem 3.6.11 | SU lines 1722–1739 | Rank-zero converse hypotheses |
| Skinner Theorem A | Skinner lines 36–48 | Odd primes and residual/auxiliary-prime conditions |
| Skinner Theorem C | Skinner lines 82–92 | Good ordinary or multiplicative rank-zero consequence |
| Skinner Theorem 2.5.2 and proof | Skinner lines 585–619 | Actual unipotent coinvariants replace full SL₂ image |
| Skinner §2.6 (2.6.1)–(2.6.2) | Skinner lines 654–691 | Precision and integral ordinary-line congruence |
| Skinner Proposition 2.6.1 | Skinner lines 697–711 | Unit ambiguity, not congruence of chosen generators |
| Skinner 2020 introduction | SkinnerConverse lines 43–48 | All-conductor assertion is reported context |
| FW Theorem 3.6 and following remark | FW lines 1372–1400 | p=3 replacements and attribution; R27 |
| FW Lemma 3.13 | FW lines 1472–1508 | Rank-one cohomology and source's insufficient arbitrary-lift argument; package avoids the latter |
| FW Lemma 3.17 | FW lines 1772–1774 | Perfect derived base change |
| FW Definitions 3.18–3.19 | FW lines 1775–1811 | Local determinant and regular-base suitability |
| FW Proposition 3.20 | FW lines 1814–1848 | Primitive comparison needs suitability |
| FW Propositions 3.22–3.23 | FW lines 1886–1946 | Compatible zeta trivializations |
| FW Proposition 3.28 | FW lines 2003–2016 | Specialization implication |
| FW Lemma 4.50 | FW lines 3859–3863 | Poitou–Tate reformulation |
| FW Theorems 5.1–5.2 | FW lines 4016–4042 | Pointwise residual range and regular universal base |
| FW Corollary 5.3 | FW lines 4044–4061 | L-value vanishing is needed in nonzero-zeta branch; R18 |
| Kato Theorem 16.2 / Remark 16.3 | Kato lines 5902–5927 | Period scaling and primitive-conductor normalization; OCR limits noted below |
| Kato §§17.5–17.6 | Kato lines 6085–6115 | Good period pairs and integral normalization |
| LLZ Theorem 6.1 / Conjecture 6.2 / Remark 6.3 | LLZ lines 2483–2507 | Cohomological signed formulation |
| LLZ Definition 6.4 | LLZ lines 2508–2523 | Starts with Bloch–Kato Selmer and uses Coleman-kernel orthogonality |
| LLZ Theorem 6.5 / Corollary 6.6 | LLZ lines 2524–2541 | i/η restrictions and image quotient |
| LLZ Remark 6.7 / Corollary 6.8 | LLZ lines 2542–2548 | Rational image removal |
| LLZ Proposition 5.10 / Corollary 5.11 | LLZ lines 2079–2096 | Index 1 minus, index 2 plus; rational units |
| LLZ Proposition 5.21 / Corollary 5.22 | LLZ lines 2305–2320 | Full trivial-component image and X in nontrivial components |
| BCS Theorem 1.1.2 | BCS lines 59–68 | p>3 rational theorem; extra integral rank-one image input |
| Rubin III Theorem 5.16 / Corollary 5.17 | Rubin lines 2421–2454 | Non-CM, reduction type and local torsion restrictions |
| SW §3.5 | SW lines 542–548 | Normalized Frobenius F/p; R08 |
| SW §4.1 | SW lines 752–779 | Sigma/height normalization |
| SW §4.2 | SW lines 799–838 | Split correction and copied e₂ scaling misprint; R10 |
| SW Theorem 6.1 | SW lines 1011–1031 | Usual Selmer leading term versus extra split analytic zero |
| MST (1.1)–(1.3), Theorem 1.3 | MST lines 85–141 | Sigma scaling and the different height factor |
| EPW Theorem 2.1.2 | EPW lines 340–349 | Odd-prime control |
| EPW Proposition 4.1.4 | EPW lines 1404–1430 | Specialized quotient-period normalization |
| RJW Conjecture 13.21 | RJW lines 4020–4041 | Criticality and component coranks |
| RJW Theorem B.4 / Appendix B.3 | RJW lines 4461–4494 | Modular main conjecture distinguished from general conjecture |
| Waldschmidt Theorem 2 and coefficient field convention | Waldschmidt lines 57–60,112–117 | Both complex and p-adic statement; primary BSDGP remains uncertified |
| Colmez Remark 0.10 / Theorem 0.11 | Colmez lines 201–214 | Trivial factor and Greenberg–Stevens formula |
| Colmez Conjecture 0.12 / Remark 0.13 | Colmez lines 218–248 | Ordinary versus split order and height conventions |
| Colmez Theorem 0.15 | Colmez lines 267–276 | Order lower bound and equality consequence |
| Colmez Theorem 0.20 | Colmez lines 331–335 | Rational modular parametrization and integral pullback scalar |
| KY Theorem 3.0.10 | KY lines 1744–1760 | Eisenstein endpoint without the earlier character exclusion |
| BSTW Theorem 1.3 | BSTW lines 145–164 | Semistability, a₃=0 and ordinary-supported twists |
| Castella corrected Theorem 1.1 | CastellaErr lines 17–26 | Condition at 2, nonsplit auxiliary prime and local p-torsion exclusion |
| Ribet Theorem 3.3 | Ribet lines 350–376 | Four sets of levels and p≥5 |
| Ribet (4.7) / Theorem 8.1 | Ribet lines 532–545,1311–1313 | Higher-weight and weight-two Mazur-principle hypotheses |
| LSTX introduction | LSTX lines 19–25 | Reports Serre rank-two lifting and small-prime exceptions |
| Nakamura Theorem 1.1 / Remark 1.2 | Nakamura lines 140–184 | Universal map, dual/twist, p≥5 and residual hypotheses |
| Nakamura Corollary 4.2 / Theorem 4.3 | Nakamura lines 2899–2939 | Norm relations and classical specialization factors |
| Paškūnas Propositions 2.13 / 2.33 | Paskunas lines 471–475,1013–1027 | Actual replacement results; attribution checked against FW |
| GS Theorems 5.13 / 7.1 | GS lines 1243–1257,1615–1633 | Primary theorem and family control require p≥5; R16 |
| Werner Theorem 7.2 / Corollary 7.3 | Werner lines 713–740 | Corrected split height comparison |
| Hida 2022 addendum Lemma 0.2 | HidaAdd lines 13–35 | Locator exists; not imported as a theorem target of this package |
| LMFDB 11.a2 model | LMFDB11 lines 158–170 | Matches Cremona 11a1; numerical diagnostics independently recomputed |
| LMFDB 14.a6 model | LMFDB14 lines 158–170 | Matches Cremona 14a1; numerical diagnostics independently recomputed |
| MST (1.7)–(1.9) | MST lines 158–167 | Shift by b₂ in sigma equation; R09 |
| Schneider §2, Theorem 2′ | src18 line 475–557 | Ordinary range, flat-cohomology definition, inverse cyclotomic coordinate and hypotheses checked; formula OCR damaged |
| Schneider §7, Theorems 6–7 | src18 line 1533–1541 | Negative sign between algebraic and analytic heights; leading-term factor structure |

### Full Lean declaration and context inventory

Section context below does not assert that unused variables survive elaboration. The explicit theorem signatures show the hypotheses on which each admitted target depends.

| Line | Section | Section variables and instances | Complete signature before proof/body |
|---|---|---|---|
| 40 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `local instance : Fact (Nat.Prime 7)` |
| 44 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `def IsRamifiedAt (ρ : Representation F G W) (I : Subgroup G) : Prop` |
| 49 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `def FWAuxiliaryCondition [FiniteDimensional F W] (ρ : Representation F G W) (D I : Subgroup G) : Prop` |
| 56 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `def DistinctCharacters {H : Type*} [Group H] (χ₁ χ₂ : H →* Fˣ) : Prop` |
| 62 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `def LocalExclusion {H : Type*} [Group H] (χ₁ χ₂ ω : H →* Fˣ) : Prop` |
| 66 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `theorem invariants_comp_subtype_eq_top (ρ : Representation F G W) (I : Subgroup G) (h : ∀ g ∈ I, ρ g = LinearMap.id) : Representation.invariants (ρ.comp I.subtype) = ⊤` |
| 78 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `theorem FWAuxiliaryCondition.isRamifiedAt [FiniteDimensional F W] (ρ : Representation F G W) (D I : Subgroup G) (hW : finrank F W = 2) (h : FWAuxiliaryCondition ρ D I) : IsRamifiedAt ρ I` |
| 92 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `theorem not_fwAuxiliary_bot [FiniteDimensional F W] (ρ : Representation F G W) (D : Subgroup G) (hW : finrank F W = 2) : ¬ FWAuxiliaryCondition ρ D ⊥` |
| 106 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `theorem fwAuxiliary_independentCharacters : FWAuxiliaryCondition (F := ZMod 7) (Representation.prod ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ)) ((Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)).comp (MonoidHom.snd (ZMod 7)ˣ (ZMod 7)ˣ))) ⊤ (MonoidHom.fst (ZMod 7)ˣ (ZMod 7)ˣ).ker` |
| 117 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `theorem localExclusion_one_iff {H : Type*} [Group H] (χ₁ χ₂ : H →* Fˣ) : LocalExclusion χ₁ χ₂ 1 ↔ DistinctCharacters χ₁ χ₂` |
| 129 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example : IsRamifiedAt (F := ZMod 7) (Representation.ofDistribMulAction (ZMod 7) (ZMod 7)ˣ (ZMod 7)) ⊤` |
| 138 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example (ρ : Representation F G W) : ¬ IsRamifiedAt ρ ⊥` |
| 146 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example [FiniteDimensional F W] (ρ : Representation F G W) (I : Subgroup G) : ¬ FWAuxiliaryCondition ρ I I` |
| 153 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example {H : Type*} [Group H] (χ : H →* Fˣ) : ¬ DistinctCharacters χ χ` |
| 157 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example : DistinctCharacters (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ) (MonoidHom.id _)` |
| 164 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example {H : Type*} [Group H] (ω : H →* Fˣ) : ¬ LocalExclusion 1 ω ω ∧ ¬ LocalExclusion ω 1 ω` |
| 171 | ResidualHypotheses | `{F G W : Type*} [Field F] [Group G] [AddCommGroup W] [Module F W]` | `example : LocalExclusion (F := ZMod 7) (1 : (ZMod 7)ˣ →* (ZMod 7)ˣ) ((MonoidHom.id _) ^ 2) (MonoidHom.id _)` |
| 192 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `def HasRankOneCoinvariants (σ : T →ₗ[O] T) : Prop` |
| 197 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `def HasRankOneImage {G : Type*} [Group G] (ρ : Representation O G T) (H : Subgroup G) : Prop` |
| 203 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `theorem hasRankOneCoinvariants_of_unipotent [IsDomain O] [IsDiscreteValuationRing O] (u : (Fin 2 → O) →ₗ[O] (Fin 2 → O)) (hu : (u - LinearMap.id) ∘ₗ (u - LinearMap.id) = 0) (hnt : ¬ LinearMap.range (u - LinearMap.id) ≤ (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O (Fin 2 → O))) : HasRankOneCoinvariants u` |
| 213 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `theorem not_hasRankOneCoinvariants_upper_uniformizer [IsDomain O] [IsDiscreteValuationRing O] (ϖ : O) (hϖ : Irreducible ϖ) : ¬ HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), ϖ; 0, 1])` |
| 220 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `theorem not_hasRankOneCoinvariants_id [Nontrivial O] : ¬ HasRankOneCoinvariants (LinearMap.id : (Fin 2 → O) →ₗ[O] (Fin 2 → O))` |
| 231 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `theorem hasRankOneImage_fullAutomorphismGroup [IsDomain O] [IsDiscreteValuationRing O] : HasRankOneImage (Representation.ofDistribMulAction O ((Fin 2 → O) ≃ₗ[O] (Fin 2 → O)) (Fin 2 → O)) ⊤` |
| 238 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `example : HasRankOneCoinvariants (Matrix.toLin' !![(1 : O), 1; 0, 1])` |
| 257 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `example [Nontrivial O] {G : Type*} [Group G] (ρ : Representation O G (Fin 2 → O)) : ¬ HasRankOneImage ρ ⊥` |
| 266 | RankOneImage | `{O T : Type*} [CommRing O] [AddCommGroup T] [Module O T]` | `example [Nontrivial O] {G : Type*} [Group G] (H : Subgroup G) : ¬ HasRankOneImage (Representation.trivial O G (Fin 2 → O)) H` |
| 283 | LiftingLemma | `none; binders explicit` | `theorem sl2Zp_closedSubgroup_eq_top (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p])) (hH : IsClosed (H : Set (Matrix.SpecialLinearGroup (Fin 2) ℤ_[p]))) (hsurj : H.map (Matrix.SpecialLinearGroup.map (PadicInt.toZMod (p := p))) = ⊤) : H = ⊤` |
| 301 | MuLambda | `none; binders explicit` | `theorem associated_of_eq_away_of_mu_eq {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (ϖ : O) (hϖ : Irreducible ϖ) (f g : PowerSeries O) (hf : f ≠ 0) (hg : g ≠ 0) (haway : ∃ (m n : ℕ) (u : (PowerSeries O)ˣ), PowerSeries.C ϖ ^ m * f = PowerSeries.C ϖ ^ n * g * u) (hmu : ∀ k : ℕ, PowerSeries.C ϖ ^ k ∣ f ↔ PowerSeries.C ϖ ^ k ∣ g) : Associated f g` |
| 312 | MuLambda | `none; binders explicit` | `example {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (ϖ : O) (hϖ : Irreducible ϖ) : ¬ Associated (PowerSeries.C ϖ) (1 : PowerSeries O)` |

### Lean mathematical pass

| Lean line | Statement | Instances tried | Result | Change |
|---|---|---|---|---|
| 40 | Prime 7 instance | 7 prime | Valid; no arithmetic context retained | none |
| 44 | IsRamifiedAt | trivial action, I=1, F₇× tautological action | False, false, true respectively | R24 |
| 49 | FWAuxiliaryCondition | dimension 0; I=1 in dimension 2; diagonal F₇² with I=ker fst | False; false; true | R24 |
| 56 | DistinctCharacters | equal pair; tautological vs 1; reversed pair | False; true; true | R24 |
| 62 | LocalExclusion | (1,ω), (ω,1), (1,ω²); ω=1 | First two excluded; third allowed over F₇; reduces to distinctness | none |
| 66 | invariants_comp_subtype_eq_top | I=1; zero module; arbitrary trivial restriction | True; already pinned theorem | R26 |
| 78 | FWAuxiliaryCondition.isRamifiedAt | W rank 0,1,2 | Rank-two hypothesis is essential and explicitly present | none |
| 92 | not_fwAuxiliary_bot | I=1 and rank 2 | Invariants dimension 2 contradicts 1 | none |
| 106 | fwAuxiliary_independentCharacters | diag action of F₇××F₇× | I fixes first axis; D fixes zero | none |
| 117 | localExclusion_one_iff | ω=1; χ₁=χ₂ and χ₁≠χ₂ | Exact logical equivalence | none |
| 129 | ramification example | −1 in F₇× acting on 1 | Sends 1 to −1≠1 | none |
| 138 | bottom-inertia example | identity element in arbitrary representation | Action equals identity | none |
| 146 | FW equal-subgroups example | D=I | Same dimension cannot equal 1 and 0 | none |
| 153 | equal-character example | χ=χ | Fails distinctness | none |
| 157 | different-character example | 1 versus tautological F₇× | Evaluation distinguishes | none |
| 164 | exceptional-pair examples | both orderings of (1,ω) | Witness χ=1 rejects both | none |
| 171 | nonexceptional-character example | F₇×, χ₁=1, χ₂=ω² | Order-six generator rejects both forbidden orderings | none |
| 192 | HasRankOneCoinvariants | zero ring; T=0 over nonzero ring; standard unipotent | Zero-ring degeneration allowed by definition; nontrivial counterexamples scoped correctly | none |
| 197 | HasRankOneImage | H=1; trivial rank-two representation; full automorphism group | False, false, true over specified nonzero rings | none |
| 203 | hasRankOneCoinvariants_of_unipotent | unit entry versus ϖ entry; equal-characteristic DVR | Primitivity gives direct summand image and free quotient; ϖ case excluded | none |
| 213 | not_hasRankOneCoinvariants_upper_uniformizer | O², upper entry ϖ | Quotient O⊕O/ϖ is not O | none |
| 220 | not_hasRankOneCoinvariants_id | nonzero ring; zero ring boundary | Nontrivial binder needed and present | none |
| 231 | hasRankOneImage_fullAutomorphismGroup | standard integral unipotent | Actual automorphism provides witness | none |
| 238 | standard-unipotent example | arbitrary commutative ring, including zero ring | Second-coordinate quotient equivalence | none |
| 257 | bottom-subgroup example | rank-two representation, H=1 | Only identity quotient, excluded by nontriviality | none |
| 266 | trivial-representation example | any subgroup, rank two | Every quotient by σ−1 is rank two | none |
| 283 | sl2Zp_closedSubgroup_eq_top | p≥5; p=3 Hurwitz subgroup; nonclosed dense subgroup | Statement correctly retains p bound and closedness | Primary Serre text unresolved |
| 301 | associated_of_eq_away_of_mu_eq | f=ϖ,g=1; equal μ; f=0 | First violates μ; nonzero hypothesis excludes zero; cancellation valid | none |
| 312 | uniformizer-versus-one example | Cϖ versus 1 | True but library-only example violates requested shape | R25 |

### README mathematical pass

Each numbered section, explicit named-output row and bold target row is included. Related outputs share the displayed section data and tests; a change applies where the row consumes the defective comparison. “None” means no additional defect found in those instances, not formal verification of an unbuilt arithmetic theorem.

| README line | Section / statement | Instances tried | Result | Change |
|---|---|---|---|---|
| 3 | Introduction: bold: Summary. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 11 | Introduction: bold: Mathlib and Tau Ceti. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 12 | Introduction: bold: ArithmeticGaloisRepresentations and EllipticCurveModularity. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 13 | Introduction: bold: PadicMeasuresIwasawaAlgebras. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 14 | Introduction: bold: SelmerIwasawaCohomology. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 15 | Introduction: bold: KatoEulerSystems. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 16 | Introduction: bold: ModularSymbolsPadicLFunctions and the signed regulator theory. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 17 | Introduction: bold: AutomorphicCongruences. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 18 | Introduction: bold: SelmerIwasawaCohomology, Part II. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 19 | Introduction: bold: SerreWeightAndLevelOptimisation. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 20 | Introduction: bold: DiophantineApproximationAndTranscendence (a current Tau Ceti roadmap). | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 21 | Introduction: bold: The other arithmetic branches are downstream. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 31 | Introduction: bold: Range of primes. | Supply direction, eligible owners, prime range | Introduction/supplier assertion; no mathematical construction tested | R01,R13,R20,R19,R20 as applicable |
| 152 | 0.1 The modular Iwasawa datum: section target | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 162 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.T | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 163 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.residual | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 164 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.residual_ss_independent | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 165 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.changeLattice | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 166 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.extendCoefficients | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 167 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.ordinaryLine | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 168 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.ofEllipticCurve | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 169 | 0.1 The modular Iwasawa datum: ModularIwasawaDatum.cyclotomicIdentification | p=2,3; weight 2; homothetic versus isogenous Tate lattice; split multiplicative | Twist and saturation retained; elliptic construction relies on later comparison | R13,R19,R21 |
| 191 | 0.2 The ordinary Selmer group over Q_∞ and its dual: section target | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 203 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.mem_iff | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 204 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.dual | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 205 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.dual_fg | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 206 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.relax | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 207 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.changeLattice | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 208 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.extendCoefficients | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 209 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.ofEllipticCurve | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 210 | 0.2 The ordinary Selmer group over Q_∞ and its dual: OrdinarySelmer.etaComponent | Σ empty; α=1 versus α≠1; finite lattice index in infinite tower; tame η and η⁻¹ | Inertia/strict correction retained; dual hypothesis needs correction | R04,R05 |
| 232 | 0.3 Structure of the ordinary Selmer dual: section target | X=0; Λ/(ϖ,X); good versus multiplicative; reducible residual | Finite-submodule exclusion is needed and stated; source-specific local hypotheses retained | R13,R19 |
| 261 | 0.4 The ordinary p-adic L-function with canonical periods: section target | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 265 | 0.4 The ordinary p-adic L-function with canonical periods: bold: primitive | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 284 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 285 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_interpolation | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 286 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_unique | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 287 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_period_unit | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 288 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_depleted | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 289 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_extendCoefficients | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 290 | 0.4 The ordinary p-adic L-function with canonical periods: ordinaryPadicL_ne_zero | primitive conductor 1 versus pⁿ; weight 2 trivial character; period scaled by ϖ | Primitive-conductor branch and period dependence retained | R20,R19 |
| 312 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: section target | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 324 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 325 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC_rational | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 326 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC.toRational | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 327 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC.iff_of_sigma | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 328 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC.iff_extendCoefficients | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 329 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC.iff_divisibilities | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 330 | 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form: IMC.greenberg_instance | Σ empty; 11a1 at 5; f=ϖ and g=1 after inverting ϖ | Rational equality loses μ; Σ equivalence lacks conditions | R04,R05 |
| 351 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: section target | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 365 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: iwasawaH1 | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 366 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: iwasawaH2 | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 367 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 368 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine.triv | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 369 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine.changeLattice | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 370 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine.baseChange | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 371 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine.divisor | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 372 | 0.6 Iwasawa cohomology, the zeta element and the fundamental line: fundamentalLine.sigmaPartial | H²=Λ/(X²); z=e or X²e; z=ϖ⁻¹e; zero divisor lengths | Inverse-determinant sign correct; rational z does not define integral quotient | R03 |
| 394 | 0.7 Kato's main conjecture for modular forms: section target | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 406 | 0.7 Kato's main conjecture for modular forms: KMC | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 407 | 0.7 Kato's main conjecture for modular forms: KMC_rational | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 408 | 0.7 Kato's main conjecture for modular forms: KMC.iff_triv | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 409 | 0.7 Kato's main conjecture for modular forms: KMC.iff_reverse_divisibility | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 410 | 0.7 Kato's main conjecture for modular forms: KMC.changeLattice | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 411 | 0.7 Kato's main conjecture for modular forms: KMC.fw_form | H²=0 and Z=H¹; Z=XH¹; p=2 height-one prime (ϖ) | Unit ideal convention and dyadic rational restriction consistent | R13 |
| 431 | 0.8 Zeta basis versus characteristic ideals: section target | Residual unipotent lift with det(g−1)=−ϖ; actual unipotent with unit entry | Package avoids source's arbitrary-lift inference; proof order still forward | R13,R03,R21 |
| 459 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: section target | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 465 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: bold: p-adic period defect | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 479 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: katoPadicZeta_scale | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 480 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: katoPadicZeta_canonical | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 481 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: katoPeriodDefect | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 482 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: katoPadicZeta_homothety | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 483 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: katoPadicZeta_goodPair | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 484 | 0.9 Kato's good pairs against canonical periods: the p-adic period defect: KatoPeriodDefectUnit | ω scaled by ϖ; simultaneous Betti/de Rham scaling; unequal sign scalars | Defect records nonunit comparison; one explanatory scaling sentence reversed | R22,R23 |
| 502 | 0.10 Kato's main conjecture versus the ordinary main conjecture: section target | Defect 1 versus ϖ; integral versus rational equality; p=2 | Unit defect is required for integral transfer; rational restriction retained | R13 |
| 538 | 0.11 Signed Selmer groups from Coleman maps: section target | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 548 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.localCondition | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 549 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.dual | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 550 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.poitouTate | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 551 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.changeBasis | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 552 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.etaComponent | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 553 | 0.11 Signed Selmer groups from Coleman maps: SignedSelmer.ordinary_case | Two independent Coleman coordinates; triangular basis change; zero kernel | Annihilator direction and Bloch–Kato starting group correct | R13,R19 |
| 573 | 0.12 The signed main conjecture with the Coleman-image term: section target | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 585 | 0.12 The signed main conjecture with the Coleman-image term: SMC | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 586 | 0.12 The signed main conjecture with the Coleman-image term: SMC_rational | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 587 | 0.12 The signed main conjecture with the Coleman-image term: SMC.of_image_eq_top | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 588 | 0.12 The signed main conjecture with the Coleman-image term: SMC.changeBasis | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 589 | 0.12 The signed main conjecture with the Coleman-image term: SMC.kobayashi_form | Image Λ versus XΛ; trivial versus nontrivial η; a_p=0 | Image quotient prevents false principal equality | R13 |
| 607 | 0.13 The signed reformulation of Kato's main conjecture: section target | i=1 all η versus i=2 only η=1; condition (E) absent | LLZ range/intersection and rational alternative retained | R13 |
| 643 | 1.1 Residual hypotheses of the main theorems: section target | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 655 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.irred | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 656 | 1.1 Residual hypotheses of the main theorems: DistinctCharacters | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 657 | 1.1 Residual hypotheses of the main theorems: IsRamifiedAt | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 658 | 1.1 Residual hypotheses of the main theorems: FWAuxiliaryCondition | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 659 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.fwExplicit | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 660 | 1.1 Residual hypotheses of the main theorems: LocalExclusion | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 661 | 1.1 Residual hypotheses of the main theorems: ScalarExclusion | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 662 | 1.1 Residual hypotheses of the main theorems: HasRankOneCoinvariants | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 663 | 1.1 Residual hypotheses of the main theorems: HasRankOneImage | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 664 | 1.1 Residual hypotheses of the main theorems: invariants_comp_subtype_eq_top | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 665 | 1.1 Residual hypotheses of the main theorems: not_fwAuxiliary_bot | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 666 | 1.1 Residual hypotheses of the main theorems: fwAuxiliary_independentCharacters | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 667 | 1.1 Residual hypotheses of the main theorems: not_hasRankOneCoinvariants_id | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 668 | 1.1 Residual hypotheses of the main theorems: not_hasRankOneCoinvariants_upper_uniformizer | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 669 | 1.1 Residual hypotheses of the main theorems: hasRankOneImage_fullAutomorphismGroup | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 670 | 1.1 Residual hypotheses of the main theorems: FWAuxiliaryCondition.isRamifiedAt | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 671 | 1.1 Residual hypotheses of the main theorems: localExclusion_one_iff | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 672 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.fwAux_iff_nonsplit_weight_two | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 673 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.suAux_im | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 674 | 1.1 Residual hypotheses of the main theorems: tateParameter_exists | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 675 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.ramified_iff_not_pth_power | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 676 | 1.1 Residual hypotheses of the main theorems: ResidualHyp.locExc_ordinary_weight_two | Trivial group; dimensions 0,1,2; F₇× diagonal action; ω=1; equal characters | Predicates and rank-two implication consistent; missing mirrors identified | R26,R24,R19 |
| 711 | 1.2 A ramified multiplicative prime gives a rank-one quotient: section target | Matrices (1,1;0,1), (1,ϖ;0,1), (1,1;ϖ,1+ϖ); equal-characteristic DVR | Quotients O, O⊕O/ϖ, and torsion distinguish integral rank one | R24,R21 |
| 737 | 1.3 The Skinner–Urban ordinary main conjecture: section target | Weight 2; higher weight not 2 mod p−1; split auxiliary prime; Σ empty | Stated theorem matches SU/Skinner range; source and order issues remain | R13,R21 |
| 764 | 1.4 The Fouquet–Wan ordinary theorem: section target | 14a1 at 13, nonsplit at 2; 11a1 at 7, split at 11 | FW decomposition-invariant condition distinguishes these cases | R13 |
| 791 | 1.5 The ordinary Selmer form of the ordinary theorems: section target | Period defect 1 or ϖ; simultaneous SU and FW hypotheses | Two main conjectures force unit defect only in overlap | R13 |
| 819 | 1.6 Hida approximation of a p-new weight-two form: section target | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 833 | 1.6 Hida approximation of a p-new weight-two form: hidaApproximant | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 834 | 1.6 Hida approximation of a p-new weight-two form: hidaApproximant_lattice | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 835 | 1.6 Hida approximation of a p-new weight-two form: hidaApproximant_padicL | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 836 | 1.6 Hida approximation of a p-new weight-two form: hidaApproximant_residual | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 838 | 1.6 Hida approximation of a p-new weight-two form: bold: Hida's family through f. | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 840 | 1.6 Hida approximation of a p-new weight-two form: bold: Weights close to 2. | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 842 | 1.6 Hida approximation of a p-new weight-two form: bold: Lattices. | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 844 | 1.6 Hida approximation of a p-new weight-two form: bold: p-adic L-functions. | p=3; M=1 versus M=2; ramified O; quotient versus eigenline periods | Existing control duplicated; unit comparison not supplied; congruence Check fails | R22,R23,R15,R14 |
| 859 | 1.7 Skinner's theorem for multiplicative reduction: section target | Split multiplicative trivial zero; p=3 approximation; local strict correction | Split Euler zero retained; approximation inherits unresolved comparison | R13,R15,R14 |
| 898 | 2.1 Fouquet–Wan conventions against the modular Iwasawa datum: section target | Weight 2 dual Tate module; even versus odd weight; Euler factor 2 | Dual/twist and inverse Euler direction consistent | R13 |
| 921 | 2.2 The Fouquet–Wan pointwise main conjecture: section target | 14a1 at 5 locally irreducible; 11a1 at 7 locally reducible; μ trivial | Theorem 5.1 permits trivial μ only in stated branch | R13,R27 |
| 946 | 2.3 Ordinary and signed consequences of the pointwise theorem: section target | Ordinary defect ϖ; supersingular i=2 nontrivial η; missing (E) | Extra comparison assumptions explicitly retained | R13 |
| 978 | 3.1 Elliptic curves against their newforms: lattices and periods: section target | Optimal curve versus p-isogenous curve; degree prime to p; p=3 | Integral lattice index retained; Manin input has no eligible named owner | R13,R19 |
| 1007 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: section target | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1019 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1020 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_trivial_character | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1021 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_twist | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1022 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_mem_Lambda | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1023 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_isogeny | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1024 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_eq_form | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1025 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: mazurSwinnertonDyerL_analytic | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1026 | 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve: katoPeriodDefect_elliptic | α=1, −1 and good unit root; Néron scaling; Eisenstein p | Trivial zero and possible fractional analytic function retained | R13 |
| 1048 | 3.3 Mazur's main conjecture for an elliptic curve: section target | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1058 | 3.3 Mazur's main conjecture for an elliptic curve: MazurMC | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1059 | 3.3 Mazur's main conjecture for an elliptic curve: MazurMC_rational | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1060 | 3.3 Mazur's main conjecture for an elliptic curve: MazurMC.iff_IMC | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1061 | 3.3 Mazur's main conjecture for an elliptic curve: MazurMC.isogeny | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1062 | 3.3 Mazur's main conjecture for an elliptic curve: MazurMC.toRational | p-isogeny versus prime-to-p isogeny; rational versus integral ideals | No false unconditional p-isogeny transfer asserted | R13 |
| 1080 | 3.4 The Burungale–Castella–Skinner rational cyclotomic theorem: section target | p=3 excluded; good ordinary p>3; no auxiliary prime; CM allowed | BCS rational endpoint matches Theorem 1.1.2(a) | R13 |
| 1101 | 3.5 The Burungale–Castella–Skinner integral cyclotomic theorem: section target | Coinvariants O versus O⊕O/ϖ; same range as rational theorem | Integral strengthening carries actual integral rank-one hypothesis | R13 |
| 1122 | 3.6 Residual surjectivity gives the rank-one image condition: section target | p=3 finite Hurwitz subgroup; p≥5; closed versus dense subgroup | p bound and closedness retained; stated lifting signature sound | none |
| 1148 | 3.7 The cyclotomic p-adic height of an elliptic curve: section target | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1150 | 3.7 The cyclotomic p-adic height of an elliptic curve: bold: canonical p-adic sigma function | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1158 | 3.7 The cyclotomic p-adic height of an elliptic curve: bold: cyclotomic p-adic height pairing, p-adic regulator, γ-normalised regulator, nondegenerate | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1168 | 3.7 The cyclotomic p-adic height of an elliptic curve: bold: The Tate parameter is transcendental. | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1178 | 3.7 The cyclotomic p-adic height of an elliptic curve: canonicalSigma | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1179 | 3.7 The cyclotomic p-adic height of an elliptic curve: cyclotomicHeight | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1180 | 3.7 The cyclotomic p-adic height of an elliptic curve: cyclotomicHeight_model | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1181 | 3.7 The cyclotomic p-adic height of an elliptic curve: cyclotomicHeightPairing | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1182 | 3.7 The cyclotomic p-adic height of an elliptic curve: padicRegulator | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1183 | 3.7 The cyclotomic p-adic height of an elliptic curve: normalizedRegulator | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1184 | 3.7 The cyclotomic p-adic height of an elliptic curve: HeightNondegenerate | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1185 | 3.7 The cyclotomic p-adic height of an elliptic curve: tateParameter_transcendental | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1186 | 3.7 The cyclotomic p-adic height of an elliptic curve: tateParameter_log_ne_zero | O and torsion points; rank 0,1; α⁻¹ versus α; C=2; q=p locally | Height construction has normalization and zero-point defects; transcendence headline available | R08,R10,R11,R12,R28,R20,R09 |
| 1210 | 3.8 Comparison of the height normalisations: section target | Rank 0,1; inverse coordinate; γ replaced by γᵘ; height scaled | Sign and logarithm powers consistent in ordinary rank-r comparison | src18 sign and theorem structure checked; formula OCR limitation retained |
| 1220 | 3.8 Comparison of the height normalisations: schneiderHeight_sign | Rank 0,1; inverse coordinate; γ replaced by γᵘ; height scaled | Sign and logarithm powers consistent in ordinary rank-r comparison | src18 sign and theorem structure checked; formula OCR limitation retained |
| 1221 | 3.8 Comparison of the height normalisations: schneiderHeight_eq | Rank 0,1; inverse coordinate; γ replaced by γᵘ; height scaled | Sign and logarithm powers consistent in ordinary rank-r comparison | src18 sign and theorem structure checked; formula OCR limitation retained |
| 1222 | 3.8 Comparison of the height normalisations: leadingTerm_T_to_s | Rank 0,1; inverse coordinate; γ replaced by γᵘ; height scaled | Sign and logarithm powers consistent in ordinary rank-r comparison | src18 sign and theorem structure checked; formula OCR limitation retained |
| 1239 | 3.9 Schneider's leading-term theorem: section target | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1249 | 3.9 Schneider's leading-term theorem: bold: Abelian varieties. | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1265 | 3.9 Schneider's leading-term theorem: schneider_leading_term_abelianVariety | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1266 | 3.9 Schneider's leading-term theorem: schneiderFlatGaloisComparison | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1267 | 3.9 Schneider's leading-term theorem: schneider_order_ge_rank | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1268 | 3.9 Schneider's leading-term theorem: schneider_order_eq_iff | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1269 | 3.9 Schneider's leading-term theorem: schneider_leading_term | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1270 | 3.9 Schneider's leading-term theorem: schneider_leading_term_split | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1271 | 3.9 Schneider's leading-term theorem: greenberg_rank_zero | Rank 0 and unit regulator; reducible E[p]; multiplicative E; abelian A/k | Headline's broader cases lack the specified construction/comparison | R17 |
| 1304 | 4.1 The Fouquet–Wan universal-family main conjecture: section target | p=3; Σ empty with ramified residual; singular Hecke algebra versus regular base | Regular-base restriction retained; Σ admissibility omitted | R13,R27,R06 |
| 1334 | 4.2 Specialising the family statement: section target | Nonzero Tor/H⁰; nonunit Euler factor; suitable versus arbitrary specialization | Derived base change distinguished from primitive arithmetic compatibility | R13,R06 |
| 1359 | 4.3 The signed main conjecture for crystalline forms: section target | A and E present/absent; nontrivial η for i=2; weight-two nonzero a_p | Source's signed range retained | R13 |
| 1382 | 4.4 Removing the Coleman-image term: section target | Rational versus integral surjectivity; η=1 and η≠1; image XΛ | No unwarranted integral surjectivity from rational theorem | R13 |
| 1405 | 4.5 Kobayashi's and Pollack's signed objects: section target | a_p=0; a₃=±3; rational unit with nonunit integral valuation | Kernel dictionary correct; integral analytic equality explicitly conditional | R13 |
| 1445 | 5.1 Changing the imprimitive set: Euler factors on both sides: section target | Σ empty/enlarged; zero Euler specialization; H⁰ nonzero | Nonzero factor is not necessarily a unit; localization dual wrong | R04,R05,R21 |
| 1475 | 5.2 Invariance under extension of coefficients: section target | Ramified O′/O; uniformizers versus p; faithful flat coefficient extension | Integral characteristic ideals descend under specified finite extension | none |
| 1500 | 5.3 μ- and λ-invariants of the two sides: section target | f=ϖ,g=1; f or g zero excluded; equal-characteristic DVR | μ repairs rational equality; Lean type has necessary domain hypotheses | R25 |
| 1523 | 5.4 The rank-zero p-converse: section target | L-value zero with z-specialization zero/nonzero; L-value nonzero | Converse proof needs explicit vanishing branch | R18 |
| 1552 | 5.5 The ℒ-invariant of a split multiplicative curve: section target | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1562 | 5.5 The ℒ-invariant of a split multiplicative curve: tateLInvariant | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1563 | 5.5 The ℒ-invariant of a split multiplicative curve: tateLInvariant_def | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1564 | 5.5 The ℒ-invariant of a split multiplicative curve: tateLInvariant_ne_zero | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1565 | 5.5 The ℒ-invariant of a split multiplicative curve: tateLInvariant_isogeny | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1566 | 5.5 The ℒ-invariant of a split multiplicative curve: tateLInvariant_ofForm | q=p; q and qᵖ; nonsplit curve; global rational j | Local vanishing permitted; global nonvanishing uses transcendence | R12,R28,R19,R20 |
| 1586 | 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture: section target | Rank 0 split versus good; rank 1; s-coordinate versus X-coordinate | Split branch requires one additional logarithm denominator | R07 |
| 1600 | 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture: MTT | Rank 0 split versus good; rank 1; s-coordinate versus X-coordinate | Split branch requires one additional logarithm denominator | R07 |
| 1601 | 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture: MTT.order_lower_bound | Rank 0 split versus good; rank 1; s-coordinate versus X-coordinate | Split branch requires one additional logarithm denominator | R07 |
| 1602 | 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture: MTT_p.rank_zero_iff_BSD_p | Rank 0 split versus good; rank 1; s-coordinate versus X-coordinate | Split branch requires one additional logarithm denominator | R07 |
| 1603 | 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture: MTT.exceptional_rank_zero | Rank 0 split versus good; rank 1; s-coordinate versus X-coordinate | Split branch requires one additional logarithm denominator | R07 |
| 1621 | 5.7 Trivial zeros in analytic rank zero: section target | 11a1 split at 11; reducible family points; p=3 without auxiliary q | General derivative formula needs broader family input | R16 |
| 1647 | 5.8 The main conjecture implies p-adic BSD under nondegenerate heights: section target | Unit ambiguity versus exact equality; rank 0,1; degenerate height | Only p-part follows from ideals; assumptions retained | R07,R17 |
| 1674 | 5.9 The modular instances of the Greenberg and Coates–Perrin-Riou propositions: section target | Trivial versus nontrivial tame projection; V versus V*(1) | Component descent and Tate dual distinguished; general conjecture not claimed proved | R19 |
| 1695 | 5.10 Verified weight-two examples: section target | 11a1 at 5 and 7; 14a1 at 5 and 13; split/nonsplit inertia | Ordinary/supersingular and auxiliary-prime diagnostics consistent | R05 for later reuse |
| 1718 | 5.11 A higher-weight example: section target | Weight 4,p=7; discriminant 5 mod 7; level 1 weight 4 versus 12; p=13 | Residual irreducibility does not replace ramification; level-lowering argument supplied | none |
| 1757 | 6.1 The anticyclotomic interface: section target | Inert prime in anticyclotomic tower; integral versus rational unramified coefficients | No cyclotomic local-factor cancellation asserted in anticyclotomic tower | none |
| 1767 | 6.1 The anticyclotomic interface: anticyclotomicFormulationInputs | Inert prime in anticyclotomic tower; integral versus rational unramified coefficients | No cyclotomic local-factor cancellation asserted in anticyclotomic tower | none |
| 1781 | 6.2 The Eisenstein-prime interface: section target | 11a1 at 5; p-isogeny versus prime-to-p isogeny; reducible residual | Wrong Tate dual invalidates stated localization test | R05 |
| 1789 | 6.2 The Eisenstein-prime interface: eisensteinFormulation | 11a1 at 5; p-isogeny versus prime-to-p isogeny; reducible residual | Wrong Tate dual invalidates stated localization test | R05 |
| 1790 | 6.2 The Eisenstein-prime interface: eisenstein_imprimitive_change | 11a1 at 5; p-isogeny versus prime-to-p isogeny; reducible residual | Wrong Tate dual invalidates stated localization test | R05 |
| 1791 | 6.2 The Eisenstein-prime interface: eisenstein_isogeny_transfer | 11a1 at 5; p-isogeny versus prime-to-p isogeny; reducible residual | Wrong Tate dual invalidates stated localization test | R05 |
| 1806 | 6.3 The supersingular and multiplicative anticyclotomic interfaces: section target | a₃=±3; twist with supersingular support; split strict correction | a_p=0 and corrected multiplicative hypotheses retained | R13 for signed input |
| 1816 | 6.3 The supersingular and multiplicative anticyclotomic interfaces: kobayashiFormulation_iff_signed | a₃=±3; twist with supersingular support; split strict correction | a_p=0 and corrected multiplicative hypotheses retained | R13 for signed input |
| 1817 | 6.3 The supersingular and multiplicative anticyclotomic interfaces: multiplicativeLocalConditions | a₃=±3; twist with supersingular support; split strict correction | a_p=0 and corrected multiplicative hypotheses retained | R13 for signed input |

### Recomputed numerical Checks

| Curve | Prime | a_p by point count |
|---|---|---|
| 11a1 | 2 | -2 |
| 11a1 | 3 | -1 |
| 11a1 | 5 | 1 |
| 11a1 | 7 | -2 |
| 11a1 | 13 | 4 |
| 14a1 | 2 | -1 |
| 14a1 | 3 | -2 |
| 14a1 | 5 | 0 |
| 14a1 | 7 | 1 |
| 14a1 | 13 | -4 |

Discriminants: 11a1 = −161051; 14a1 = −21952. b₂(11a1)=−4.

Eta-product coefficients, expanding q∏(1−qⁿ)⁴(1−q⁵ⁿ)⁴: {2: -4, 3: 2, 4: 8, 5: -5, 6: -8, 7: 6, 11: 32, 13: -38, 25: 25}

## Not verifiable

- **Serre, Abelian ℓ-adic representations and elliptic curves, IV.3.4 Lemma 3:** the source service found no legal readable copy. LSTX line 19–25 independently reports the rank-two statement and the small-prime exceptions. The primary proof remains unchecked. The request is retained in needs-references.toml.
- **Jones, Iwasawa L-functions for multiplicative abelian varieties (1989), DOI 10.1215/S0012-7094-89-05918-8:** the legal publisher landing page yielded no readable full text to the service. The full multiplicative leading-term/height comparison remains unchecked against that primary paper. The request is retained in needs-references.toml; no primary theorem number has been guessed.
- **Four settled uncertified sources:** Barré-Sirieix–Diaz–Gramain–Philibert (1996); Kobayashi (2003); Silverman, Advanced Topics V.5.3; Greenberg's 1999 Iwasawa-theory text. They are cited by locator without claiming to have read their inaccessible primary texts. Their statuses are preserved, with no new missing-reference request. The available Waldschmidt, LLZ, Stein–Wuthrich and Skinner formulations were checked as indicated in the ledger.
- **OCR limitations:** parts of Kato's displayed interpolation/exact-sequence formulas are damaged in the extraction. Schneider's Theorem 2′ formula is similarly damaged, although its hypotheses, coordinate convention and Theorem 7's factor structure are readable. The report does not certify unreadable glyphs or infer them from source numbering alone.
- **Lean elaboration:** prohibited by this review brief. The written signatures, proofs and pinned carriers were inspected; no successful elaboration of the package or proposed repairs is claimed.
- **Unowned proof chains:** the full regulator, reverse-bound and universal-zeta constructions cannot be checked as supplier targets where the claimed suppliers do not exist. R13 gives the missing contracts and the partial existing owners. No declared gaps or prior settled repair findings were available.

All source requests finished. The unresolved reference request contains only Serre and Jones. No source fetch, OCR task or Lean process started by this reviewer remains running. All mathematical decisions and report edits were made by this reviewer; no sub-agents were used.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0a7390850b36412b284c46156d15dea128ad742d", "job": "RT-ModularIwasawaMainConjectures~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
