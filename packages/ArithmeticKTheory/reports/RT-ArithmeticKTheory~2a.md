<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/127#issuecomment-6353139996 -->
Red team round 2 pass a (codex) of d7eac7e

Verdict: needs_changes

1. **F01** (P3) Elementary API and numerical Checks remain in the acceptance test

   **Location:** packages/ArithmeticKTheory/Suggested.lean:377: “IsRegularPrime p ↔ ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)”; also lines 72–84, 96–110, 173–202, 204–275, 335–379, 399–410.

   **Claim:** These declarations belong in the headline acceptance test.

   **Witness:** The class-number equivalence is proved by `rfl`; lines 268–275 use `simp`; lines 82–84 unfold a numerical definition and use `omega`. The three final regular-prime targets are the README’s finite examples.

   **Exact repair:** Delete the padding from Suggested.lean: borelRank_even; mem_divisibleSubgroup_iff; divisibleSubgroup_eq_bot_of_finite; divisibleSubgroup_int; divisibleSubgroup_map_le; divisibleSubgroup_directSum; all three bottCohomologySlot theorems; all three evenTwoRank theorems; bernoulliTop_eq_abs; IsRegularPrime.iff_not_dvd_classNumber; isRegularPrime_three; isRegularPrime_of_lt_37; not_isRegularPrime_37. Delete borelRank, bottCohomologySlot, evenTwoRank and bernoulliTop and their numerical examples: none is needed to state a retained headline. Keep their mathematics as README prose/Checks. Remove the routine unit-membership and totalized-regularity examples; retain at most a handful of substantive examples for retained definitions. Do not replace these deletions with proofs in place.

   **Repair test:** At n=2, the numerical rank is 0=0; at p=3 the criterion’s interval is empty; the p=37 Bernoulli calculation remains a README Check. Deletion loses no headline about an actual K-group.

2. **F02** (P3) The module does not identify its unstated headline theorems

   **Location:** packages/ArithmeticKTheory/Suggested.lean:4–8: “representative target signatures … it is not exhaustive.”

   **Claim:** An unspecified representative sample discharges the acceptance-test documentation requirement.

   **Witness:** The complete module comment names no unavailable headline or missing carrier. README:6–10 instead promises finite generation, integral tables, wild kernels, Bott tables and arithmetic tame-kernel certificates.

   **Exact repair:** Replace the module comment by: “ArithmeticKTheory: target signatures. README.md is the roadmap; this file is its headline acceptance test against the pinned APIs. The retained signatures state denominator localization, eventual multiplication-intersection stabilization, certificate soundness and the divided-Bernoulli consequence of cyclotomic class-number regularity. The finite criterion and tower theorem are imported from CyclotomicClassGroupsAndStickelberger. Quillen finite generation and ranks, Soulé localization, odd and even integral tables, Harris–Segal detection, higher wild-kernel divisibility, Bott descent, K₄(ℤ)=0, the Vandiver K-group table and Gaussian/golden tame-kernel equivalences are not statable at these pins: the actual higher Quillen K-group/spectrum carriers and their comparison maps are missing. Hermitian finiteness also lacks the required GW/L-spectrum carriers.” Confirm the missing carriers by the pinned inventory below and remove numerical substitutes as in S01.

   **Repair test:** The comment now distinguishes the existing native cyclotomic class-number carrier from the absent higher-K carrier; it does not replace K₃(ℤ)=ℤ/48 by a numerical rank identity.

3. **F03** (P2) Norm-residue and motivic foundations duplicate an earlier owner

   **Location:** packages/ArithmeticKTheory/README.md:1135–1143: “Prove milnor_etale_normResidue … construct the required motivic complexes”; also lines 23–27 and 1172–1197.

   **Claim:** This package owns the general motivic complexes, norm-residue theorem and motivic-to-K comparison used in arithmetic descent.

   **Witness:** TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:478–512, §3.0a, already owns motivicCycles and motivicToK, including all-field Milnor diagonals, norm residue for invertible coefficients, the convergent K-tower and its localization/transfer maps.

   **Exact repair:** “Consume KTheoryFiniteLocalFields §3.0a, motivicCycles and motivicToK, on their shared cycle complexes and Milnor carriers, with the stated coefficient, residue, transfer and Bott normalizations. This section constructs the number-field and finite-S arithmetic descent comparisons from those interfaces.” Delete the second construction of the supplied foundations and update Scope, Exact supplier contracts, and every dependent Needs line. State separately any arithmetic-base extension beyond the supplier’s geometric domain rather than silently assuming it.

   **Repair test:** For k=𝔽₅, a=1, m=2, both routes must now use the same Kummer map k×/(k×)²→H¹(k,μ₂), with source and target of order 2. No duplicate Milnor/cycle carrier is introduced. KTheoryFiniteLocalFields precedes this roadmap.

4. **F04** (P2) The Euler-characteristic gap requests an existing export

   **Location:** packages/ArithmeticKTheory/README.md:229: “What IntegralIwasawaTheory must provide (gap:arithmetic-special-value-euler-characteristic)”; packages/ArithmeticKTheory/design/plan.json, fourth gap.

   **Claim:** The totally real special-value Euler characteristic is missing from the named supplier.

   **Witness:** TauCetiRoadmap/IntegralIwasawaTheory/README.md:1611–1632, §12.3, states oddPrime_specialValueEuler and dyadic_specialValueEuler, identifying the finite H² order with the zeta valuation plus v(w_n), and w_n with the H¹ order.

   **Exact repair:** “Consume IntegralIwasawaTheory §12.3, oddPrime_specialValueEuler at χ=1,n=2k and dyadic_specialValueEuler at n=2k, together with its H¹-order identification and §§10.4–10.5 descent. Their Euler quotient is |H²|/|H¹|.” Remove this redundant gap from the README and plan’s gaps list; point §7.5 directly to that export. Retain any genuinely additional rationality prerequisite as a separately named input.

   **Repair test:** For F=ℚ,k=1, the dyadic valuations are v₂(H²)=1, v₂(H¹)=3, and v₂(1/12)=−2=1−3. The supplier already gives the required normalization, including the requested abelian case.

5. **F05** (P2) Real topological K-theory is reconstructed despite an existing owner

   **Location:** packages/ArithmeticKTheory/README.md:1293: “Construct the real topological K-spectrum KO”; lines 1300–1302 and 1324 also assign real Bott periodicity here.

   **Claim:** KO, its connective cover and real Bott periodicity are new prerequisites owned here.

   **Witness:** TauCetiRoadmap/GeneralizedCohomology/README.md:1651–1662 constructs ku/ko, KU/KO, Bott inversion and the canonical connective-cover comparisons. StableHomotopyKTheory itself imports this owner.

   **Exact repair:** “Consume GeneralizedCohomology G5.4 for ko, ku, KO, KU and their Bott classes. Construct the algebraic-to-real comparison and real-place descent on these supplied spectra.” Delete the second KO/ko and real Bott constructions and point the Needs line to that main-roadmap section. Keep the arithmetic comparison targets and their coefficient-extension Checks.

   **Repair test:** The shared models give KO₀→KU₀ equal to 1 and KO₄→KU₄ equal to 2, and retain the mod-two degree-two group ℤ/4. The repair changes ownership, not these normalizations.

6. **F06** (P2) The Steinitz norm-transfer theorem is already supplied

   **Location:** packages/ArithmeticKTheory/README.md:402: “The norm on Picard groups and the determinant-of-restriction formula are the named comparison targets”.

   **Claim:** This package must prove the norm normalization and determinant correction to restriction of scalars.

   **Witness:** TauCetiRoadmap/KTheoryLowDegrees/README.md:563–580, §5.5, states the identical normalized norm, determinant formula and dedekindTransferCoordinates, including virtual negative rank and the degree composite.

   **Exact repair:** “Specialize KTheoryLowDegrees §5.5, dedekindTransferCoordinates, to the finite injective Dedekind extension of §1.2. Its normalized ideal norm is the supplied ClassGroup.relNorm. Record the displayed coordinates and the S-enlargement compatibility as this arithmetic specialization; do not reconstruct the norm or reprove the general determinant formula.” Add §5.5 to the supplier contract.

   **Repair test:** A virtual class (−1,1) transfers to (−d,c_B⁻¹); the identity extension transfers it to (−1,1). The supplied theorem retains precisely the correction this section needs.

7. **F07** (P1) Several claimed suppliers point to sections that do not supply the inputs

   **Location:** packages/ArithmeticKTheory/README.md:192: “H.6 supplies coefficients, colimits, Milnor sequences”; lines 200–205, 244–252 and 276 have further stale allocations.

   **Claim:** The named layers supply the stated prerequisites.

   **Witness:** StableHomotopyKTheory Layer 6 only assembles K-spectra; its coefficients and completion are Layer 7. GeneralAlgebraicKTheory Layer 7 is products/transfers, not finite-coefficient localization. KTheoryLowDegrees has neither Z.4 nor U.6; K2SymbolsBrauer T.7 is not a Hilbert-symbol section.

   **Exact repair:** Replace these contracts and their repeated Needs citations with the following actual owners/targets: StableHomotopyKTheory §§1.24–1.28, 3.36, 7.1–7.13, 7.21–7.28 for category homology, finite generation, coefficients, limits and spectral sequences; GeneralAlgebraicKTheory §§2.1–2.5, 4.3, 4.8, 4.14, 7.4–7.8 for exact K-theory, additivity, dévissage, localization, products and transfers; derive finite-coefficient localization by applying the supplied Moore-spectrum construction to that localization sequence and name the boundary/product compatibility target explicitly. Replace low-degree aliases by KTheoryLowDegrees §§5.1–5.5, 8.1, 11.1–11.3. Replace the Matsumoto/tame aliases by K2SymbolsBrauer §§7.1–7.2, 9.2–9.6, 11.2, 12.1–12.3 and its actual arithmetic computations. Cite main ClassicalArithmeticCompletion §§1.14–1.15 and 1.35 for the classical Hilbert symbol and norm criterion; KTheoryFiniteLocalFields §§3.1–3.5 and 7.3 provide the K-theoretic local factorization and higher comparisons. Replace the claimed IntegralIwasawaTheory §7.1 VandiverCondition export by its actual §7.4 contract. For quadratic/symmetric comparison cite HermitianKTheoryOfPoincareCategories §§4.4, 7.1–7.5, 8.1–8.2. Consume KTheoryFiniteLocalFields §0.5 for stable finite-cover transfers (including their identity and pullback laws). Declare the remaining C₂ input in both README and plan gaps with StableHomotopyKTheory §7 as supplier: gap:connective-c2-homotopy-orbit-spectral-sequence needs the natural, strongly convergent spectral sequence H_p(C₂;π_qE)⇒π_(p+q)(E_hC₂) for every connective C₂-spectrum E. Apply it to the supplied duality action and deduce finite generation from finitely generated coefficients. This input is not supplied by the cited H.6; the cyclic THH-specific sequence in KTheoryFiniteLocalFields §4.4 does not have this generality. Do not treat a familiar layer abbreviation as an export of a theorem absent there.

   **Repair test:** Mod-3 localization now applies S/3 to an existing localization fibre sequence; the product sign comes from the actual pairing and boundary compatibility. The real degree-zero GW case uses §8.1, not the quadratic comparison whose low-degree range is different.

8. **F08** (P2) Kummer's criterion still uses the later character decomposition

   **Location:** packages/ArithmeticKTheory/README.md:2701–2703: “Needs: … the finite character decomposition”; lines 2756–2757 construct it in §7.3.

   **Claim:** The repaired §7.2 proof precedes all of its prerequisites.

   **Witness:** The direct-sum/projector construction first occurs in §7.3, whose Needs line imports §7.2. The finite Herbrand–Ribet gap supplies a componentwise nonvanishing equivalence, not the direct-sum theorem used to deduce the full class-number criterion.

   **Exact repair:** Consume CyclotomicClassGroupsAndStickelberger §§0.2–0.3 before the criterion, as specified in S10; do not build its projectors again. Leave §7.3 only the identification of the localized Picard module with the supplied class module. Its Needs line may then point backwards without a reverse edge.

   **Repair test:** For p=3, e₀=(1+c)/2 and e₁=(1−c)/2 sum to 1. Vanishing of both components implies A/3=0 only after this decomposition; the empty Bernoulli interval alone does not supply it.

9. **F09** (P3) Prospective API identifiers are formatted as undeclared Lean names

   **Location:** packages/ArithmeticKTheory/README.md:505 and 636: “ramifiedResiduePullback” and “titsBuilding”, both backticked.

   **Claim:** These backticked own names satisfy the README/Lean name agreement rule.

   **Witness:** Neither name occurs as a declaration in the complete 412-line Suggested.lean or its 32 supplied elaborated signatures. Numerous later unstatable target names have the same problem.

   **Exact repair:** Write names of prospective README-only constructions and API targets as ordinary prose (or mathematical notation), reserving backticked own identifiers for declarations actually retained in Suggested.lean. Keep pinned and supplier names backticked where resolved. Apply the same conversion after the S01 deletions; do not add API padding to the acceptance test to repair this mismatch.

   **Repair test:** The building remains a README construction with its F₂² Check, while the Lean acceptance test no longer claims that a building carrier is available at the pin.

10. **F10** (P2) The other three gaps and the cyclotomic foundations also have an earlier owner

   **Location:** packages/ArithmeticKTheory/README.md:223–227: the three cyclotomic supplier gaps; §§7.2–7.3; packages/ArithmeticKTheory/design/plan.json: gaps.

   **Claim:** Kummer congruences, finite Herbrand–Ribet and character reflection are missing, and this package owns regularity, projectors and the finite criterion.

   **Witness:** TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:436 supplies the exact divided congruence; 482–487 the exact reflection; 730–740 Herbrand–Ribet. Its §§0.2–0.3 and 5.1/5.4 already own the decomposition, regularity, criterion and tower theorem.

   **Exact repair:** “Consume CyclotomicClassGroupsAndStickelberger §§0.1–0.4 for the direct Artin class action, projectors, decomposition and plus part; §3.1 for divided Kummer congruences; §3.3 for the exceptional-character vanishings and reflection; §4.5 for herbrand_ribet; §§5.1 and 5.4 for regularity, Kummer’s criterion and prime-power stability. This roadmap applies those exports to arithmetic K-groups.” Remove all three redundant gap entries and their README contracts. Replace §§7.2–7.3’s duplicate constructions/proofs by the supplied interfaces and the actual localization adapter to Pic(ℤ[ζ_p,1/p])/p. Delete the supplier headlines IsRegularPrime, kummer_criterion and IsRegularPrime.iwasawa and their finite tests from Suggested.lean. If retaining the new divided-Bernoulli corollary there, state its hypothesis directly using the native cyclotomic class number, without rebuilding the supplier predicate. Update the module comment in S02 accordingly. No new dependency on a later roadmap is needed: this supplier precedes ArithmeticKTheory in the supplied order.

   **Repair test:** At p=37,k=16 the supplied action is exponent 1−32≡5 mod 36, exactly the requested direct-Artin component. At p=5, B₂/2=1/12 and B₆/6=1/252 both reduce to 3. At p=3, the component decomposition and exceptional vanishings yield class-number regularity with an empty Bernoulli interval. All three requested contracts, with their hypotheses, already exist.

11. **F11** (P2) The arithmetic bordification is rebuilt despite an earlier supplier

   **Location:** packages/ArithmeticKTheory/README.md:682–685: “The bordification, duality and Steinberg finiteness targets are owned in this subsection.”

   **Claim:** The compact arithmetic bordification and its finite classifying model belong to this package.

   **Witness:** TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2167–2272, ALS.2.2–ALS.2.4, already constructs the Borel–Serre bordification, compact arithmetic quotient and finite triangulation, with the proper neat/torsion-free hypotheses.

   **Exact repair:** “Consume ArithmeticLocallySymmetricSpaces ALS.2.2–ALS.2.4 for the Borel–Serre bordification, compact quotient and finite CW model, and AdelicAlgebraicGroups §3.6 for the reduction-theory input used there. Prove here the identification of its boundary homology with St(P⊗F), the orientation character sign(N(det))^(m−1), the resulting projective-lattice duality and finite-index descent.” Replace the blanket bordification ownership claim and add these earlier suppliers to the exact contracts.

   **Repair test:** For rank one over a real quadratic field the supplied quotient is a circle, with empty proper-parabolic boundary. For GL₂(ℤ), diag(−1,1) still contributes orientation sign −1; for GL₃ it contributes +1. Importing the bordification does not delete the arithmetic twist comparison.

12. **F12** (P3) The K₄ source entry mixes journal and manuscript pagination

   **Location:** packages/ArithmeticKTheory/sources.toml:361: “Main Theorem and low-rank homology calculations, pp. 267–281”; line 376: “All locators use the manuscript.”

   **Claim:** The recorded locator belongs to the certified 22-page manuscript.

   **Witness:** rognes-k4 line 697 starts the proof on manuscript p.19; line 730 marks p.20 and line 768 p.21. Pages 267–281 are the journal pagination, expressly distinguished by the version note.

   **Exact repair:** Set the locator to “Author manuscript: Main Theorem p.1; Proposition 1.2 pp.5–6; Propositions 5.1–5.2 pp.16–18; §6 pp.19–21.” Retain Topology 39 (2000), pp.267–281 only as publication metadata/version information.

   **Repair test:** The §7.5 low-rank table resolves to rognes-k4 lines 704–724, and the Bökstedt argument to lines 747–772 in the actual certified version.


13. **F13** (P2) Ramification-weighted dévissage is proved again instead of imported

   **Location:** packages/ArithmeticKTheory/README.md:519–524: “Prove ramificationWeightedDevissage … This proves restriction naturality of the entire sequence”.

   **Claim:** This package owns the general support-category calculation producing the ramification factor.

   **Witness:** TauCetiRoadmap/SchemeKTheoryOperations/README.md:863, dvrBoundary_flat_ramification, already supplies the same e-weighted restriction square for every local flat map of DVRs, explicitly using length-e support pullback. Its §3.7 supplies the Dedekind localization assembly.

   **Exact repair:** “Consume SchemeKTheoryOperations §3.6, dvrBoundary_flat_ramification, and §3.7. At each w over v, localize the finite projective S-integer extension and apply that supplied support-pullback calculation. Assemble the coordinate maps into ramifiedResiduePullback on the arithmetic residue direct sums; prove its finite support, tower and S-enlargement compatibility.” Delete the separate general ramificationWeightedDevissage proof target. Keep the arithmetic reindexing and assembly, and keep the warning that K(B/w^e) is not e copies of K(k(w)).

   **Repair test:** A totally ramified quadratic local extension still sends residue K₀ generator1 to2; an unramified quadratic one sends it to1. These are precisely the supplier's e=2 and e=1 instances, so importing it preserves both negative controls.

14. **F14** (P2) The abstract diagonal-extension theorem needs an abelian middle group

   **Location:** packages/ArithmeticKTheory/README.md:1327–1333: “If 0→(ℤ/2)^r→E→ℤ/w→0 has a lift x … then E≅ℤ/(2w)⊕(ℤ/2)^(r−1).”

   **Claim:** The displayed exact sequence and the relation on one lift imply that normal form and nonsplitting, without specifying that E is abelian.

   **Witness:** In D₈=⟨a,s:a⁴=s²=1,sas=a⁻¹⟩, kernel ⟨s,a²s⟩≅C₂² has diagonal a². Quotient C₂ has lift a with a²=diagonal, but D₈≄C₄⊕C₂; the lift as has order2 and splits the projection.

   **Exact repair:** “Let r≥1 and let w be a positive even integer. Let 0→(ℤ/2)^r→E→ℤ/w→0 be a short exact sequence of abelian groups. If a lift x of 1 satisfies wx=(1,…,1), then E≅ℤ/(2w)⊕(ℤ/2)^(r−1), and the projection does not split.” Add the D₈ example above as a negative-control Check for the abelian hypothesis. State this category explicitly in the independent elementary theorem; its subsequent K-group application already supplies it.

   **Repair test:** D₈ fails the added hypothesis. For abelian E, replacing x by x+v leaves wx unchanged because w is even and 2v=0; r=1,w=24 still gives C₄₈, and r=2,w=2 gives C₄⊕C₂ rather than D₈.

The findings below concern this head. The previous-round audit and computed verification records follow them. No roadmap or Lean file was changed.

## Previous-round finding audit

Identifiers here retain the previous reports' F numbering, prefixed by the pass. The repair report marked none “not actionable in this package”; no settled rejection is being reopened. Locations in this table are in packages/ArithmeticKTheory/README.md unless explicitly marked Suggested.lean. Quotes describe the current repair, not an instruction from the previous report.

| Earlier finding | Status and repaired passage at this head | Verification witness; remaining issue |
| --- | --- | --- |
| r1a F01, unowned proof inputs | Partly repaired. :684–685: “The bordification, duality and Steinberg finiteness targets are owned in this subsection.” | Named targets now exist for buildings, descent and real comparison. Some newly assigned ownership duplicates earlier work (S03/S05/S11), and the claimed supplier layers still drift (S07). |
| r1a F02, undeclared cyclotomic gaps | Partly repaired. :223: “What IntegralIwasawaTheory must provide (gap:cyclotomic-kummer-congruence)”. | The three slugs match plan.json exactly and the hypotheses are precise. Their purported absence is refuted by the earlier CyclotomicClassGroupsAndStickelberger exports in S10. |
| r1a F03, arithmetic enlargement | Repaired. :1686–1689: “Arithmetic enlargement can change t and j”. | ℚ(√7), degree four: 1+1+0−1=1 before; 0+2+0−1=1 after. The numerical theorem holds with fixed j and s≥1. |
| r1a F04, catalogue/docstrings | Repaired as raised. Suggested.lean:308: “The spanning solution in a matched certificate is its actual presentation.” | All 32 named declarations have mathematical docstrings; the former name catalogue is absent. The separate missing-headline inventory is S02. |
| r1a F05, insufficient roots in wreath subgroup | Repaired. :1404–1406: “m=ℓ^a=&#124;k×{ℓ}&#124;, so a=v_ℓ(q−1)≥1”. | For q=19, ℓ=3, μ₃ has index 6, divisible by 3; μ₉ has index 2. Full primary roots correct the failed instance; the dyadic a≥2 restriction is explicit. |
| r1a F06, integer order theorem prerequisite | Partly repaired. :2984–2986: “&#124;K_(8a+2)(ℤ)&#124;=2c_(2a+1) and &#124;K_(8a+6)(ℤ)&#124;=c_(2a+2)”. | a=0 gives orders 2,1; a=2 gives K₂₂ order 691. The missing theorem is now an explicit target; its newly declared supplier gap duplicates §12.3 (S04). |
| r1a F07, impossible independent Frobenius choices | Repaired. :295–296: “the compatible class/cyclotomic fiber product”. | ℚ(i): odd norms of split rational primes are 1 mod 4, never the incompatible 3 mod 4 prescription. The actual Chebotarev Layer 10 declaration exists. |
| r1a F08, Bott route too narrow | Repaired. :2514–2516: “For every number field F, finite S containing all primes above an odd prime p”. | For j=0 the two slots are H⁰(0), H²(1); extra inverted primes can contribute the latter. S is not forced to be a singleton. |
| r1a F09, golden-only geometry | Repaired. :3306–3308: “For every number field F of degree n≥1 … length s≥2”. | ℚ: covolumes q and q²; ℚ(√5): 5q and 5√5q² for s=2,3. The general comparison retains 2^n, specializing to 4. |
| r1a F10, certificate absent from Lean | Repaired. Suggested.lean:278: “structure OrderCertificate (A : Type*) [AddCommGroup A]”. | Native relations, spanning solution and surjective lower quotient are data with proofs, not sorry'd data. Upper/lower order 2 forces A=C₂; upper 4 with A=C₂ cannot match a lower order 4. |
| r1a F11, missing definition tests | Repaired as raised. Suggested.lean:143: “Finite cyclic height vanishes”. | C₄: div=0, 2C₄={0,2}, 4C₄=0; ℚ×C₄: div=ℚ×0. Tests were added, but the current acceptance-test policy requires deleting routine padding (S01), not adding more of it. |
| r1a F12, proof-history field | Repaired. :3106–3109: “This is a dependency requirement on the development, not a field or theorem of the mathematical record.” | Two proofs of the same order-4 golden group produce the same mathematical invariant; no Boolean/tag in CertifiedExample purports to certify proof independence. |
| r1a F13, tame-symbol locator/convention | Repaired. :472–473: “The boundary β agrees with III.6.3, whereas Tate’s t is its inverse”. | At 5: β{5,2}=2, β{2,5}=3 in 𝔽₅×; t exchanges those values. kbook line 13461 resolves III.6.3. |
| r1a F14, source manifest | Repaired as raised. sources.toml:1: “schema = "tauceti-roadmap-sources/v1"”. | 23 work entries: 18 certified and five waived; all reference works represented. A new version-pagination inconsistency is S12. |
| r1a F15, false absence of √5 APIs | Repaired. :180–182: “These pinned-library inputs are available at the pinned Tau Ceti commit”. | Sqrt5.Basic/Invariants/Units/RealPlace supply degree 2, discriminant 5, class number 1, unit rank 1, two real places under the stated minpoly/adjoin hypotheses. |
| r1a F16, closed-point indexing | Repaired. :434–435: “nonzero prime ideals (height-one points)”. | A field has no height-one primes: the sum is 0. Its closed zero ideal no longer contributes a spurious K-group. |
| r1a F17, unnamed Witt/L prerequisites | Repaired as raised. :854–855: “for every Dedekind domain R with fraction field of characteristic different from two”. | The injection and periodic tables are now named targets, with finite dyadic set for the table. hermitian lines 1855–1935, 2030–2100 and 2180–2278 support them. Generic carrier/comparison locators still need S07. |
| r1a F18, K₄ proof inputs | Repaired as raised. :2908–2909: “D(R^m) is (m−1)-connected … with D(R⁴) at least four-connected”. | rognes-k4 lines 609 and 627 give exactly these bounds; the low-rank table and Bökstedt section are now separate targets. K₄(ℤ)=0 remains distinct from K₄(ℤ[1/2])=C₃. |
| r1a F19, computational regularity algorithm | Repaired. :2661: “For a prime p define IsRegularPrime p”. | IsRegularPrime.decidable and the earlier algorithm target are absent. No executable prime-search procedure remains. S01 concerns numerical acceptance padding, not an algorithm. |
| r1a F20, reversed §7.2/§7.3 order | Partly repaired. :2702–2703: “the class-number predicate and the finite character decomposition”. | The gap statements moved before the criterion, but the decomposition is still first constructed at :2756 and §7.3 needs §7.2. S08 gives the remaining cycle and repair. |
| r1a F21, conditional raw-kernel tautology | Repaired. :2304–2306: “there is always the inclusion WK^raw⊆WK^sym. At i=1, prove equality”. | The all-degree equality and conclusion-containing hypothesis are gone. In degree two the local uniquely divisible kernel meets global torsion trivially; higher local divisible torsion is correctly left unresolved. |
| r1b F01, padding | Partly repaired. Suggested.lean:378–379 ends the equivalence with “rfl”. | Proofs replaced some admissions but did not remove the padding. The binding current instruction requires deletion; see S01. |
| r1b F02, unused Tau Ceti import | Repaired. Suggested.lean:1: “import Mathlib”. | This is the single import. No unused TauCeti root or roadmap import remains. |
| r1b F03, even diagonal extension | Repaired. :1327: “Let r>0 be an integer and let w>0 be even.” | r=1,w=24 gives E=C₄₈, with 24x nonzero of order 2. For abelian E the claimed nonsplitting is correct; the independent theorem must say abelian, S14. |
| r1b F04, process narrative | Repaired. :2048–2049: “both alternatives in the local criterion are needed”. | ℚ(√−17) has global and local dyadic μ₄, yet is special. The text now gives the mathematical negative control, not repair history. |
| r1b F05, Caputo page | Repaired. :1820: “Proposition 2, p. 4”. | caputo line 203 is Proposition 2; line 212 is its printed p.4 footer. |
| r1b F06, supplier subheadings | Repaired as formatting. :186–292 each supplier has its own heading, starting “From TauCetiRoadmap.StableHomotopyKTheory”. | Four gap sentences occur under IntegralIwasawaTheory as intake requires. Section-content mismatches and redundant requests are separately S04/S07/S10. |

## Verified sound

The checks below distinguish mathematical truth from ownership, locator and acceptance-test defects. “Retain” means no mathematical correction was found in the tested statement; it does not override a finding about its ownership. All 4072 README lines and 412 Suggested.lean lines were read. The worker's 32 elaborated signatures were compared declaration by declaration with the source and README. No section binder was lost. No Lean process was run, and no new elaboration is claimed.

### Lean declaration and instance ledger

All names below have namespace TauCetiRoadmap.ArithmeticKTheory. “D” means arbitrary universes u,v; R : Type u, CommRing R, IsDedekindDomain R, S : Set (HeightOneSpectrum R), F : Type v, Field F, Algebra R F, IsFractionRing R F. These instances exclude the zero ring: an injective unital map to F forces 0≠1 in R. No finiteness of S is silently assumed. “A” means A : Type u with AddCommGroup A. Every natural subtraction/division mentioned below is the total Lean operation. Universes on index types need not equal the universe of summands.

| Declaration and source line | Layer; full variable/instance context beyond D/A | Instances and computed left/right values | Result/change |
| --- | --- | --- | --- |
| sUnitSubmonoid :31 | 1; D | R=ℤ,S=∅: membership of 1,0,2 is true,false,false; S={2}: 2 true,3 false; all primes: exactly nonzero integers | Definition agrees with native units. |
| integer_isLocalization_iff :35 | 1; D; M : Submonoid R | ℤ,S={2}, M={2^n}: true ↔ (true∧true); M={1}: false ↔ (true∧false); M containing 0: false ↔ false | Retain; both directions distinguished. |
| integer_isLocalization_of_torsion_classGroup :62 | 1; D; explicit ∀c : ClassGroup R, IsOfFinOrder c | ℤ: class group 1, any S works; ℤ[√−5], prime P above 2: [P]²=1 and P²=(2), so denominator 2 meets P without P principal | Retain, including infinite S. |
| borelRank :72 | 3; r₁,r₂,n : ℕ | (1,0;0,1,2,3,5)↦(0,1,0,0,1); (0,1;3,5)↦(1,1) | Body correct; n=1 is numerical, not the S-unit rank. Delete S01. |
| borelRank_even :82 | 3; r₁,r₂,k : ℕ | k=0,1,2: residues 0,2,0 yield 0=0 | Padding; delete S01. |
| divisibleSubgroup :93 | 6; A | A=0,ℤ,C₄: 0; A=ℚ,ℚ/ℤ: all; ℚ×C₄: ℚ×0 | Ordinary body; roots are ambient, not coherent. |
| mem_divisibleSubgroup_iff :97 | 6; A; x : A | x=2 in C₄: root for m=2 is 1, but m=4 has none; both sides false. x=1 in ℚ: root 1/m, both true | Definitional simp; delete S01. |
| divisibleSubgroup_eq_bot_of_finite :102 | 6; A; Finite A | C₄: multiplication by 4 has image {0}; trivial group: by 1 gives {0}; both div=⊥ | Padding; delete S01. |
| inter_mul_eventually_eq_divisibleSubgroup :115 | 6; A; T : AddSubgroup A; Finite T; explicit div A≤T | A=C₄,T={0,2}: m=2 intersection T≠0; m₀=4 gives 0=div A for all positive multiples. A=ℚ,T=0 fails hT | Retain; quantifier order and missing “exponent alone” are correct. |
| divisibleSubgroup_int :174 | 6; no parameters | x=1: m=2 excludes it; x=−3: m=4 excludes it; x=0 has root 0 for every m | Boundary padding; delete S01. |
| divisibleSubgroup_map_le :187 | 6; A; B : Type v, AddCommGroup B, f : A→+B | ℚ→ℚ/ℤ sends all to all; zero map sends all to {0}⊆all; identity gives equality | Root transport API; delete S01. |
| divisibleSubgroup_directSum :199 | 6; ι : Type u; B : ι→Type v; ∀i, AddCommGroup (B i); x finite support | ι=∅: 0↔vacuously true; ι=ℕ, B_i=ℚ: e₀ has root e₀/m; B_i=C₄: e₀ fails m=4 on both sides | True without Finite ι; API padding, S01. |
| bottCohomologySlot :206 | 6; j : ℤ, positive : Bool | j=−1: plus(2,0), minus(0,−1); j=0: plus(0,0), minus(2,1); j=1: plus(2,2), minus(0,1) | Correct integer twists; numerical stand-in deleted S01. |
| bottCohomologySlot_totalDegree :210 | 6; j : ℤ, Bool | j=−1: 2·0−2=−2 and 2·(−1)−0=−2; j=0: 0 and 2−2=0 | Unfold/simp arithmetic, delete S01. |
| bottCohomologySlot_sign :227 | 6; j : ℤ, Bool | j=−1 plus twist0 even=true, minus twist−1 even=false; j=1 plus twist2=true | Definitional parity; delete S01. |
| bottCohomologySlot_period :234 | 6; j : ℤ, Bool | j=−1→1: plus(2,0)→(2,2), minus(0,−1)→(0,1) | Unfold and parity; delete S01. |
| evenTwoRank :243 | 6; r,s,t,j,n : ℕ, no arithmetic instances | (1,1,0,0;2,4,6,8)↦(1,0,0,0); (2,1,0,1;2,4,6,8)↦(2,1,1,0); all-zero input↦0 | Totalized body true; not a K-group theorem. Delete S01. |
| evenTwoRank_add_prime :249 | 6; same naturals; hs:1≤s; hn:Even n | fixed r=2,t=0,j=1,n=4,s=1→2: 1→2=1+1. Without hs, all-zero n=0,s=0→1 gives 0≠0+1 | Hypotheses right; numerical API deleted S01. |
| evenTwoRank_residue_two :268 | 6; same naturals; n%8=2 | (2,1,0,1,2): 2=2+1−1; (0,0,0,0,2): 0=0 by truncated subtraction | simp by branch, delete S01. |
| evenTwoRank_periodic :273 | 6; same naturals | n=0→8: 0=0 for r=s=t=j=0; n=2→10: 2=2 in quadratic row | simp on remainder, delete S01. |
| OrderCertificate :278 | 6; A; rel : Relations.{0,0} ℤ; finite G,R,Quotient; solution in A; span=⊤; B : Type 0, AddCommGroup B, Finite B; surjective lower:A→+B; equal cardinalities | Zero group: empty presentation and B=0 both cardinal1. C₂ with relation2g: both bounds2. Upper4→A=C₂ cannot have lower4 because 4≤2 is false | Real data, not a Prop placeholder; chosen small finite presentations suffice after transport. |
| OrderCertificate.isPresentation :308 | 6; A; cert:OrderCertificate A | finite surjections P→A→B with orders2,2 force fibres1,1. Empty P order1 forces A and B order1. Wrong solution g↦0 into C₂ fails span | No conclusion hidden in fields: IsPresentation is bijectivity; fields give span and matching independent orders. |
| bernoulliTop :336 | 7; k : ℕ | k=0,1,2,5,6: −1,1/6,1/30,5/66,691/2730 | Correct reindexing, not ordinary B_k. Delete unnecessary definition S01. |
| bernoulliTop_eq_abs :364 | 7; k : ℕ; 1≤k | k=1:1/6=abs(1/6); k=2:1/30=abs(−1/30); excluded k=0:−1≠1 | True normalization API, delete S01. |
| IsRegularPrime :369 | 7; p : ℕ; no prime instance | p=0: 0∤h>0 true; p=1: 1∤h false; p=3:h=1 true; p=37:false | Totalization deliberate. Duplicate supplier definition, S10. |
| IsRegularPrime.iff_not_dvd_classNumber :377 | 7; p : ℕ | p=0: true↔true; p=1:false↔false | rfl; delete S01. |
| kummer_criterion :382 | 7; p : ℕ; hp:p.Prime; hodd:Odd p | p=3: false↔∃k∈∅ false; p=37:k=16, num B₃₂=−7709321041217=37·(−208360028141) | True as typed; earlier owner, S10. |
| IsRegularPrime.dividedBernoulli_num :388 | 7; p prime odd; explicit hreg; k : ℕ,1≤k | p=5,k=5: B₁₀/5=1/66, numerator1 not divisible by5 despite num B₁₀=5; p=3,k=1:num(1/6)=1 | Reduced numerator and all k correct. Remove duplicate predicate per S10. |
| IsRegularPrime.iwasawa :394 | 7; p prime odd; r quantified AFTER iff, with1≤r | p=3,r=1,2: class numbers1,1; p=37,r=1 already makes RHS false | True; r=0 excluded. Earlier owner, S10. |
| isRegularPrime_three :400 | 7; no parameters | h(ℚ(ζ₃))=1, 3∤1 | Finite Check, delete S01/S10. |
| isRegularPrime_of_lt_37 :404 | 7; p prime,p<37 | primes2,3,5,7,11,13,17,19,23,29,31 have no dividing Bernoulli numerator in their ranges; 2 uses h(ℚ)=1 | Finite-range Check, delete S01/S10. |
| not_isRegularPrime_37 :409 | 7; no parameters | B₃₂ numerator multiple37 above; exponent of component is5 mod36 | Finite Check, delete S01/S10. |

The 15 anonymous proved examples were also read, including their proof bodies. They are not included in the count of 32 named declarations.

| Suggested.lean example line | Context | Computed assertions | Acceptance consequence |
| --- | --- | --- | --- |
| 41 | D | 1 unit,0 nonunit | Routine; S01. |
| 48 | D | Empty S: ℤ denominators±1; full S: all nonzero integers | Routine; S01. |
| 76 | none | rational ranks at3,5:0,1 | Numerical; S01. |
| 79 | none | imaginary ranks at3,5:1,1 | Numerical; S01. |
| 122 | none | div ℚ=ℚ; div(ℚ/ℤ)=ℚ/ℤ; roots x/m | Substantive defining example if definition retained. |
| 143 | none | div C₄=0; 2C₄={0,2};4C₄=0; div(ℚ×C₄)=ℚ×0 | Substantive negative control if definition retained. |
| 218 | none | slots at0: (0,0),(2,1) | Numerical; S01. |
| 222 | none | slots at−1: (2,0),(0,−1); plus at1:(2,2) | Numerical; S01. |
| 256 | none | ranks1,0,0,0 | Numerical; S01. |
| 261 | none | ranks2,1,1,0; enlarged degree4=1; zero inputs0,0 | Numerical; S01. |
| 313 | none | empty upper/lower group cardinal1=1 | Certificate nonemptiness example; no sorry. |
| 327 | none | lower4≤card C₂=2 impossible | Certificate negative control; no sorry. |
| 339 | none | top B₁=1/6; top B₀=−1; B′₁=1/2 | Numerical; S01. |
| 343 | none | 1/30,5/66,691/2730; divided B₁₀=1/66 | Numerical; S01. |
| 373 | none | regularity at0 true,at1 false | Totalization Check; S01. |

### README statement ledger

Each numbered subsection is covered below, splitting its independent constructions and identities into separate rows. C_m denotes the cyclic group of order m, so C₁=0 has cardinality one. Source-backed K-group values are mathematical test values, not claims to have built the future Lean library. Definitions use the standing number-field, finite-S and positive-degree hypotheses unless their row records the expressly wider generality. The golden identities have an additional row-by-row ledger below.

| Statement / location | Instances tried and computed values on the two sides | Result; change |
| --- | --- | --- |
| Conventions :63, finite S and unit rank | ℚ,S=∅: 1+0+0−1=0; ℚ,S={2}:1; ℚ(i),S=∅:0; ℚ with all primes has infinitely generated units | Finite S retained outside expressly arbitrary-S targets. |
| Conventions :70, connective versus periodic degrees | K₀(ℤ)=ℤ, K₁(ℤ)=C₂; negative connective degree is0, while periodic KO₋₈=ℤ | No periodic table applied to ordinary negative degrees. |
| Conventions :83, boundary direction | v=5,a=5,b=2: β=2,t=3; reversing gives β=3,t=2; two units give1 | Inverse convention consistently used. |
| Conventions :93, twists | W₀(ℚ)=ℚ/ℤ infinite; W₁(ℚ)=C₂; W₂(ℚ)=C₂₄; ordinary (ℚ/ℤ)⊗(ℚ/ℤ)=0 | Wrong ordinary tensor model excluded. |
| §1.1 denominator body | ℤ: empty S gives±1, full S all nonzero; a field has empty spectrum yet every nonzero element is a unit | Three distinct native cases agree. |
| §1.1 localization iff | ℤ,S={2}: M=2^ℕ gives true/true; M={1} gives false/false; 0∈M gives false/false | No zero-denominator gap. |
| §1.1 torsion-class sufficiency | ℤ[√−5], nonprincipal P above2: P²=(2), class order2. Arbitrary S: each selected prime has its own such exponent | Does not assume principal primes, finite S, or a uniform class exponent. |
| §1.2 enlargement map | S=∅→{2}: ℤ→ℤ[1/2]; identical S gives identity; all primes giveℚ | Maps have native source/target. |
| §1.2 finite field extension | ℚ→ℚ(i), S={2}, exact T: basis1,i, rank2. Adding a prime above5 upstairs alone makes1/5 integral over ℤ[1/2] false | Exact T is necessary and present; no “arbitrary larger T is finite” claim. |
| §1.3 K₀ coordinates / transfer | B rank d, c_B determinant: (−1,1)↦(−d,c_B⁻¹); identity extension gives(−1,1); rank0 line-class difference gives(0,Norm c) | Formula true; import owner S06. |
| §1.3 K₁ and unit rank | ℤ unitsC₂, ℤ[1/2] unitsC₂×ℤ; ℤ[i] unitsC₄ | Rank0 versus1 and torsion2 versus4 retained. |
| §2.1 localization index set | Field: Spec¹=∅ so residue sum0. ℤ: summands indexed by primes2,3,…; a family nonzero at every prime is not in the direct sum | No spurious closed zero ideal. |
| §2.2 K₀ residue sign | Residue class has rank0 and class [P]⁻¹; a class of order3 distinguishes c⁻¹=c² from c | Matches exact sequence [R/P]=[R]−[P]. |
| §2.2 boundary and S-unit exact sequence | ℤ[1/2]: valuation(−2³)=3, kernel{±1}; at5 β{5,2}=2 versus t{5,2}=3 | Uniformizer order/sign pinned. |
| §2.3 ramified restriction | e=2,f=1: source valuation1 pulls back to2; e=1,f=2: restriction1, transfer2; composite e=2 then3 gives6 | e and f not interchanged; ramification not excluded. Generic proof ownership S13. |
| §2.3 residue transfers and split places | Two split branches have e=f=1 and transfer sum2; 𝔽₂₅×→𝔽₅× norm is x↦x⁶ | Branchwise square and degree formula agree. |
| §2.4 even injectivity | K₄(𝔽_q)=0, hence K₄(O)→K₄(F) injective; degree0 is excluded from positive-even inference | Localization proof direction correct. |
| §3.1 Q-rank filtration | Rank0 category has zero object; rank1 proper-layer poset has two elements; ℤ[√−5] has two rank1 projective classes | Free-lattice shortcut excluded. |
| §3.1 layer poset | V=𝔽₂²: five subspaces, twelve comparable pairs, exclude(0,V) gives eleven; V dimension1 gives (0,0),(V,V) | Uses weak inclusions and excludes precisely whole layer. |
| §3.2 Tits building / Solomon–Tits | V=𝔽₂²: three vertices, reduced H₀=ℤ²; rank1 empty building has reduced H₋₁=ℤ | Unreduced H₀ would wrongly give rank3. |
| §3.2 arithmetic bordification and orientation | GL₂ diag(−1,1) gives sign−1; GL₃ same determinant gives+1. Rank1 real-quadratic quotient is a circle with empty boundary | Orientation exponent m−1 correct; ownership S11. |
| §3.2 relative homology shift | m=1,i=1 gives ⊕Pic ℤ; m=1,i=0 gives0; m=2,i=2 gives Steinberg coinvariants, not ordinary ℤ | Shift i−m and augmented conventions agree. |
| §3.2 stability/finite generation | BQ has π₁=K₀; for ℤ this isℤ, not0. Infinite Pic gives infinitely generated relative H₁ at rank1. ℚ has finite rational rank1 but is not FG overℤ | No simply-connected shortcut; finite-type hypotheses matter. Supplier drift S07. |
| §3.3 finite-S rational comparison | S=∅ gives identity; residue K_odd(𝔽_q) finite→tensorℚ=0. K₁(ℤ)⊗ℚ=0 but ℚ×⊗ℚ infinite-dimensional | Actual localization map is an equivalence only in specified n≥2. |
| §3.4 Borel ranks | ℚ n=2,3,5 gives0,0,1; ℚ(i) gives0,1,1; M₂(ℚ) has the ℚ row by Morita; product ℚ×ℚ(i) at5 gives2 | Numerical and arithmetic ranges agree; Lean padding S01. |
| §3.4 even finiteness versus field torsion | K₂(ℤ)=C₂ finite; K₂(ℚ) has C_(q−1) summands for infinitely many primes q, infinite torsion; K₀(ℚ)=ℤ | Neither field finiteness nor degree-zero finiteness inferred. |
| §3.5 quadratic→symmetric Witt injection | char fraction≠2 makes2q(x)=0 implyq(x)=0; char2 would give2q=0 for everyq and cannot prove injection | Explicit characteristic restriction present. |
| §3.5 symmetric/quadratic L tables | Residues0,1,2,3 give stated Witt/residue/cokernel slots; at residue𝔽₂, W^s and W^q both C₂; empty dyadic set removes those direct sums | Integral dyadic terms retained; no unsupplied split of odd extension. |
| §3.5 signs and genuine/classical comparison | ε=−1 shifts n by2; for m=0 the low range n≤−2 and high range n≥−1 cover all integers. Classical n=0,1,2,3 cannot use comparison beginning at4 | Generic comparison ownership locators corrected by S07. |
| §4.1 W_i and functoriality | 𝔽₃: i=1 order2,i=2 order8; ℚ:i=0 infinite,i=1 order2,i=2 order24; negative i=−2 has order24 | Weight0 finiteness excluded; dual convention correct. |
| §4.1 restriction/corestriction | Identity gives1; quadratic extension cor∘res=2 on invariant twists, not identity | Degree factor retained. |
| §4.2 odd primary exponent | ℓ=3,F=ℚ: i=1 order1,i=2 order3,i=6 order9; the ℓ−1 divisibility test changes exactly at even i | 2-primary noncyclic image treated separately. |
| §4.3 exceptional fields | ℚ has image mod8=C₂×C₂; ℚ(i) has subgroup{1,5}; ℚ(√−2) image{1,3}; ℝ imageC₂ | ℝ is not called exceptional merely because it has a real place. |
| §4.3 dyadic order | i=2: ℚ gives2^(2+1)=8; ℚ(i) gives8; ℚ(√−2) gives2^(3+1−1)=8; odd i for a real field gives2 | Special factor and a,b parameters distinguish models. |
| §4.4 rational w-values | w₂=24,w₄=240,w₆=504,w₁₀=264 | Denominator of B_(2k)/(4k) matches each. |
| §5.1 Soulé / finite coefficients | Odd n≥3: O→F iso; n=1: {±1}→ℚ× is not onto. K₄(ℤ[1/2]) gets C₃ from K₃(𝔽₂) | Degree restriction and coefficient boundary retained. |
| §5.2 norm-residue | 𝔽₅,m=2,a=1: square quotient and H¹ both order2; algebraically closed k degree2 mod2=0; char k=2,m=2 excluded | True interface but duplicated earlier owner S03. |
| §5.2 motivic complexes/tower | Degree0 diagonal ℤ/m; degree1 Kummer map; finite-field K₂m−1 coefficients receive residue boundary while rationalization kills finite fibres | Arithmetic comparison still needed; generic foundations S03. |
| §5.2 algebraically closed rigidity | k algebraically closed,char≠2: K₂(k;ℤ/2)=C₂,K₃(k;ℤ/2)=0 | Distinguishes integral divisible groups from finite coefficients. |
| §5.2 étale edge / e-invariant | ℚ: K₃ torsC₄₈→W₂=C₂₄ has kernelC₂; K₅ tors0→W₃=C₂ has cokernelC₂; ℚ(i) K₃ torsC₂₄→W₂=C₂₄ iso | No uniform real dyadic isomorphism asserted. |
| §5.3 imaginary integral table | ℚ(i): K₃(ℤ[i])=ℤ⊕C₂₄; ℚ(√−7) is imaginary but exceptional, still uses imaginary table with w₂=24 | Imaginary does not mean nonexceptional; source covers it. |
| §5.4 KO and complexification | KO residues0…7: ℤ,C₂,C₂,0,ℤ,0,0,0; KO→KU in degrees0,4 multiplies by1,2 | Arithmetic comparison useful; KO owner S05. |
| §5.4 mod2 KO extensions | Coefficient cardinalities in degrees0…7:2,2,4,2,2,1,1,1; degree2 isC₄ | Cardinality4 alone would not distinguish C₂²; extension law does. |
| §5.4 diagonal extension | r=1,w=24 givesC₄₈; r=2,w=8 givesC₁₆⊕C₂ in Ab. D₈ at r=w=2: a²=diagonal, (as)²=1, as≠sa; it splits and is not C₄⊕C₂ | For abelian E, lift relation fixes nonsplit extension; without that hypothesis D₈ refutes it, S14. |
| §5.4 actual real odd table | ℚ n=3,5,7: C₄₈,ℤ,C₂₄₀; ℚ(√5) at3: C₂₄₀⊕C₂, order480 | Real correction factor2 retained. |
| §5.5 monomial subgroup / transfer | q=7,ℓ=3,r=2: GL₂ order2016, μ₃≀S₂ order18,index112 prime to3; q=19 full μ₉ index2 versus μ₃ index6 | Full-primary hypothesis repaired. Stable transfer prerequisite S07. |
| §5.5 dyadic nonexceptional norm | C₂ acts by3 onC₈: norm1+3=4; coinvariantsC₂→invariants{0,4} sends1↦4, isomorphism | No illegal division by2. |
| §6.1 even H² identification | ℚ: K₂ order2; real degree6 K₆=0 whereas the uncorrected H² term may containC₂ | Real exceptional row excluded from naive cd2 table. |
| §6.1 primary rank from class/Brauer | One ℓ-place,t=0 gives rank0; C₉/3 has dimension1 while order valuation is2 | Rank is not order; all ℓ-places counted. |
| §6.2 signature defect | ℚ:S={2},j=0; ℚ(i):r₁=j=0; ℚ(√7):j=1 then invert7 givesj=0 | Uses Selmer classes, not just units. |
| §6.2 Selmer versus unit model | ℚ(√34):5+√34 has norm−9 and signs(+,-), with even outside-S valuations; Selmer j=0 while units alone give defect1 | Wrong unit-only object excluded. |
| §6.3 hidden real subgroup ρ | ℚ:r₁=1,ρ=0; ℚ(√2):ρ=0; ℚ(√7):ρ=1, K₄=C₂ while compared H²=0 | Hidden C₂ not erased by comparison. |
| §6.4 mod2 order table | ℚ,S={2}: (a,b,c,d)=(2,1,1,0); cardinalities2,4,4,4,2,2,1,2 in residues0…7 | Coefficient cardinalities distinguished from integral ranks. |
| §6.4 even two-rank | Rational row1,0,0,0; real quadratic row2,1,1,0 at2,4,6,8 | Arithmetic function correct; Lean numerical padding S01. |
| §6.4 enlargement and junk n=0 | Fixed j,s: increments1 for s≥1; ℚ(√7) degree4 stays1 after s1→2,j1→0; all-zero s0→1 atn0 stays0 | Repair withstands earlier counterexample. |
| §6.5 totally real ratio | ℚ,i=2:2·2/48=1/12; H²/H¹=2/24=1/12. i=4:2·1/240=1/120 | Factors2^r₁ correct; odd/free-degree cardinalities excluded. |
| §6.6 infinite-height subgroup | 0,ℤ,C₄ give0; ℚ andℚ/ℤ giveall; ℚ×C₄ givesℚ×0 | No division by0: m≥1. |
| §6.6 not largest divisible subgroup | Relations2x=0,2^ny_n=x: x maps to1/2≠0 inℚ/ℤ; quotient byx is⊕C_(2^n) withdiv0; hence div A=C₂, internally2div A=0 | Explicit wrong model excluded. |
| §6.6 multiplication intersections | A=C₄,T={0,2}:2A∩T=C₂ butdiv A=0;4A∩T=0. InC_(2^r), same order2 T needs modulus2^r | T exponent2 is not a uniform stabilization bound. |
| §6.6 coefficient obstruction | Caputo sextic example: tame3-part order3, fixed-modulus kernel order3, infinite-height3-part order1; local roots9 versus global3 | Source-backed arithmetic negative control; no reconstructed class-field computation claimed. |
| §6.7 raw completion kernel | ℚ at i=1:{−1,−1} has real sign−1, so not in raw kernel; ℚ(i) K₂(O)=0 | Real places and actual completion map included. |
| §6.7 symbol kernel | At i=1, local quotient uses w₁(ℚ₂)=2, not w₂(ℚ₂)=8; raw⊆symbol in every positive even degree | No false all-degree equality. |
| §6.7 positive even group | i even: all K_(2i); i odd: kernel of real signature. ℚ at i=1 removes {−1,−1}; no real places makes condition empty | Parity uses i, not2i. |
| §6.8 Moore exact sequence/order | ℚ: K₂(ℤ) order2, real sign detects generator and wild kernel0; μ(ℚ) order2 | Product uses finite nontrivial support; no 0/0. |
| §6.9 strict cohomological kernel | Real H² with even twist=C₂, odd twist0; ℚ(√7),degree4 hidden groupC₂ despite cohomological kernel0 | Actual local maps andρ retained. |
| §6.10 special / very special | ℚ,ℚ(i): not special; ℚ(√−14):special,not very; ℚ(√−17):special and very, local completionℚ₂(i) | Equal global/local μ₄ does not reject the latter. |
| §6.10 finite twisted norm | C₂ action−1 onC₄: coinvariantsC₂,invariantsC₂,norm0; action3 onC₈:norm4 is iso C₂→C₂ | Full norm, not untwisted averaging or eigenvalue division. |
| §6.11 norm-Hilbert criterion | For quadratic local extension, norm coset index2 and Hilbert symbol values±1; identity extension index1,symbol1 | Uses the actual extension and invertible local coefficients. Supplier locator S07. |
| §6.11 Picard descent / twist field | Very-special even twist: full cyclotomic field can give Sha_S order2,Sha_all order1, H₁ order2; twist-fixed field removes that H₁ term | Norm-surjectivity is not inferred for wrong full field. |
| §6.11 compatible Frobenius | ℚ(i), odd split rational prime has norm1 mod4; “same class and norm3 mod4” gives empty fibre. Identity intersection C=F makes unrestricted pair compatible | Repaired compatibility restriction is essential. |
| §6.12 divisibility quotient | Special F and odd i: symbol/div=C₂; nonspecial or even i: quotient0; ℚ(√−14) {−1,−1} witnesses special obstruction | Source-supported parity; no higher raw-kernel substitute. |
| §6.12 hidden real subgroup | ℚ(√7),i=2: hiddenC₂ is contained in ambient div K₄(F), although its internal2-multiplication is0 | Ambient roots versus internal divisibility distinguished. |
| §6.13 twisted Picard injection | F=ℚ,p=3: localized cyclotomic class module0 gives source0; p=37,k=16 character1−32≡5, not31 | General injection keeps ramified primes; CGZ's stronger unramified specialization not promoted to general hypothesis. |
| §6.14 order certificate | P→A→B surjections, card P=card B=2 forces card A=2 and both maps iso; P4→A2 cannot surject B4 | Independent lower map and actual span make theorem substantive. |
| §6.14 cohomological lower bound | K₂(ℤ),L={2}:2=2; L=∅ gives1≠2. K₄(ℚ(√7) integers):2^ρ·1=2, omittingρ gives1 | Certified full orders, not dimensions, are required. |
| §6.15 dualization / Bott | K₀ lineL maps toL⁻¹; β maps to−β. Slots j=−1 plus(2,0),minus(0,−1), both total−2 | Consistent in all integer degrees. |
| §6.15 hyperdescent / edges | Atj=0: H²(X,ℤ/q(1))→K₀^β→H⁰(X,ℤ/q); atj=1 plus H²(2),minusH⁰(1). More S can enlarge H² | General number-field and finite-S scope retained. |
| §6.15 projectors | p=3:2⁻¹=2, (1±ψ)/2 valid; p=2:2 has no inverse, so no such decomposition asserted | Odd p hypothesis necessary. |
| §6.16 ordinary comparison | ℤ→ℤ[1/p] adds a K₁ coefficientC_q generated byp with valuation1; degree0 remainsℤ/q; degrees≥2 agree in stated range | Degree1 exception explicit. |
| §7.1 Bernoulli conventions | B₁=−1/2,B′₁=+1/2; positive sequence at0,1,2,5,6 is−1,1/6,1/30,5/66,691/2730 | k≥1 for positivity; reduced division important. |
| §7.1 divided denominators / w | Denominators B₂/4=24,B₄/8=240,B₆/12=504,B₁₀/20=264; k=0 denominator operation totalizes but not used arithmetically | No zero-index order formula. |
| §7.2 regularity / finite criterion | p=3 range∅ gives regular; p=37,k=16 numerator−7709321041217 divisible37; p=2 separateh=1 | Mathematically correct; supplier duplicate S10. |
| §7.2 all-index divided corollary | p=5,k=5:5/66 divided by5=1/66; numerator changes5→1 | Cancellation handles multiples ofp; no false undivided all-index claim. |
| §7.2 tower theorem | r=1 tests original field; p=3,r=2 has class number1; r=0 would beℚ and cannot test irregularity | r≥1 correct; supplier duplicate S10. |
| §7.3 character projector | G=C₄ over𝔽₅ acting byχ³: e₃=1,e₁=0; sum of all e_a=1. For37,k16 useχ⁵ | Direct action and inverse projector weight consistent; construction duplicated S10. |
| §7.3 reflection | Atp=3 both exceptional components0 and allA=0; at37 odd component5 nonzero does not alone imply even component32 nonzero | Inequality dim A_even≤dim A_odd≤dim A_even+1, not equality; no Vandiver assumption. |
| §7.4 regular cyclotomic even groups | ℓ=3: singleℓ-place and localized class quotient0 give evenℓ-primary rank0; irregular37 gives a nonzero component in suitable degree | Odd torsion may remain nonzero; no wholesale vanishing. |
| §7.4 regular Bott module | ℓ=3 generator degrees0,1,3; ℓ=5 degrees0,1,5,7; changing primitive root rescales chosen Bott generator by a unit | Normalizations depend on chosen Bott data, not unmarked generators. |
| §7.5 stable rank filtration / building | R=ℤ,rank4: connectivity4, stronger than3; zero ring violates the rank-invariance hypothesis (free1≅free0) | No invalid zero-ring specialization. |
| §7.5 low-rank homology and K₄ | Relevant stable homology in degrees0…4 isℤ,0,0,C₂,0; η product eliminated by supplied section argument; K₄(ℤ)=0 but localization at2 addsC₃ | Actual proof targets and source table, not circular special-value use. |
| §7.5 special-value ratio | ℚ,k1:2·2/48=1/12; k2:2·1/240=1/120; odd-prime valuations agree with H²/H¹ | Dyadic assertion restricted to abelianF; redundant gap S04. |
| §7.5 integer even orders | a=0 degrees2,6:2c₁=2,c₂=1; a=2 degree22:c₆=691 | Corrected 2a+2 index; no cyclicity from order alone. |
| §7.5 Vandiver table | Every odd prime is quantified; degree4 remains unconditional0; K₁=C₂ treated separately | Conditional cyclicity not inserted into regular-prime predicate. Supplier target locator S07. |
| §8.1 arithmetic data | Golden field:[F:ℚ]=2,r₁=2,r₂=0,class number1,unit rank1,w₂=120; fake degree3 would fail2=3 | Invariant equalities rule out arbitrary numerical records. |
| §8.1 certified examples | Gaussian upper/lower cardinal1; golden upper/lower4; rational integer tame kernel2 | Proof independence is a development dependency, not encoded metadata. |
| §8.2 rational localization | K₂(ℚ)=C₂⊕⊕_p𝔽_p×; p2 summand1,p3 summand2; infinitely many nontrivial summands | Noncanonical splitting distinguished from boundary map. |
| §8.2 one inverted prime | K₄(ℤ[1/2])=C₃; K₄(ℤ[1/3])=C₈; q−1 in place ofq²−1 would give1,2 incorrectly | Finite-field degree matches n−1. |
| §8.3 Tate filtration / principal step | ℤ before5: units±1; α(u)={u,5}, tα(u)=u, β α(u)=u⁻¹. Equal preceding prime norms retained by ordering | Chosen sign and image quotient correct. |
| §8.3 unit quotient U/U₁ | u=1+πw gives identity in quotient; reduction gives1; arbitrary unit with nontrivial residue remains nontrivial | Reduction target is actual k(v)×. |
| §8.4 small-norm congruence | Atq5, a=6,b=1: N(a−b)=5<25; equality boundary a=26,b=1 gives25=25 and extra5 factor, so strictness matters | Zero difference handled directly; no inverse of0. |
| §8.4 filtration descent | Norm-tied prime q′=q is not automatically preceding; image presentation versus abstract presentation may have a kernel | No conflation of stabilization of image with all finite presentations. |
| §8.5 Gaussian tame kernel | Remaining symbol {i,i} killed by4 and3, gcd=1 ⇒0; K₂(ℤ[i])=0 while K₂(ℚ(i)) has infinite residue torsion | Upper/lower trivial order1; field not confused with integers. |
| §8.6 general congruence lattice | ℚ,s2,q5:index5,covol5; s3:index25,covol25. Tuple(2,1) lies in residue2 lattice, (1,1) does not | Kernel/index construction determines lattice. |
| §8.6 geometry/measure/stretch | ℚ:B_t=[−t,t],vol2t. ℚ(i):measure2dxdy gives covol2=√4. Complex stretchξ has determinantξ², notξ | Weighted real dimension correctly n. |
| §8.6 golden specialization | s2 covol5q; s3 covol5√5q²; ε norm−1, ε² norm1; absolute norms both1 | Norm sign and covolume powers agree. |
| §8.6 strict old-unit bound | At(2),q4,t4, tuple(2,2) in congruence lattice has zero residues; t<q excludes it | Nonzero vector alone does not give old units. |
| §8.7 fraction comparison | ℚ,v5:2/1≡1/3≡2; cross-difference5; bound2·2·3=12<25. Self-comparison has difference0 | The zero branch is separate; denominator nonzero. |
| §8.7 section and multiplicativity | Golden d=2√5/π≈1.4235; two-coordinate and three-coordinate covolumes5q,5√5q² differ | Three-coordinate hypothesis not inferred from section existence. |
| §8.7 cutoff | 16d²=320/π²≈32.4228<33; (20d)^(2/3)≈9.3239<10; d³≈2.8847<27/8; fourth≈12.3183<16d² | q>33 satisfies all four strict inequalities. |
| §8.8 exact finite residues | Eleven residue sizes4,5,9,11,11,19,19,29,29,31,31; relation-index gcds3,4,8,10,10,18,18,28,28,30,30 | Every gcd equalsq−1; full identity/minor ledger below. |
| §8.9 real-sign lower bound | g={−1,−1} signs(−1,−1), h={−1,ε} signs(+1,−1); exponent vectors(1,1),(0,1) determinant1 mod2 | SurjectsC₂²; matched upper4 proves tame kernel order4 without ζ. |
| §8.10 degree3 examples | K₃(ℤ)=C₄₈ versus K₃(ℤ[i])=ℤ⊕C₂₄; rank0 versus1, torsion48 versus24 | Arithmetic outputs agree with earlier layers. |

### Bold-text target coverage

There are no separate bold-named theorem headings in this README. Besides Summary and the 75 Checks labels, it has these 23 emphasized fragments; each is accounted for here rather than silently omitted from the requested bold-target audit.

| Line / emphasized fragment | Computed test of the surrounding claim | Result/change |
| --- | --- | --- |
| 63 finite | ℚ,S={2}: unit rank1; all primes: infinite rank | Finite-S convention is necessary. |
| 328 every | Nonprincipal prime of order2 gets denominator with valuation2; no single uniform exponent assumed | Arbitrary-S torsion-class theorem survives. |
| 510 ramification index | e2f1 restriction2, transfer1 | Correct; S13 ownership. |
| 583 all | ℤ[√−5]: two rank1 Steinitz classes, not one | Projective rank filtration retains both. |
| 766 equals | O→F at n3 rationalized finite residue fibre0, so induced map iso | Actual map, not abstract equal rank. |
| 826 only for n≥2 | K₁(ℤ[1/2]) free rank1 versus numerical Borel residue1 | Exclusion correct. |
| 833 infinite torsion | C_(p−1) summands for arbitrarily large primes p | Field even K not finite. |
| 898 every integer degree | L-degree−1≡3 mod4, not ordinary connective degree | Periodic carrier explicitly used. |
| 917 classical | n0…3 not in quadratic comparison's n≥4 range | Separate classical comparison retained. |
| 1461 norm | action3 onC₈ has norm4, not inverse of2 | Correct dyadic operation. |
| 1653 coefficient K-groups | rational mod2 degree2 cardinal4, integral2-primary rank1 | Different invariants distinguished. |
| 1672 K-group | numerical all-zero rank atn0=0 versus K₀ rank1 | Numerical table explicitly not an arithmetic n0 claim. |
| 2028 either | ℚ(√−17) local cyclotomic field nonexceptional, sameμ₄ | First alternative indispensable. |
| 2028 or | ℚ(√−14) completion has larger dyadic cyclotomic-root field | Other local alternative retained. |
| 2058 full | full cyclotomic versus twist-fixed extension: H₁ orders2 versus1 in the very-special even test | Cannot interchange them. |
| 2088 not | action−1 onC₄ norm0, coinvariant/invariant orders2 | Twisted norm need not be an isomorphism. |
| 2160 twist field | very-special even test removes the order2 H₁ obstruction | Correct descent field. |
| 2427 certified full order | C₉: ℓ-rank1 but cardinal9 | Rank alone cannot be certificate lower order. |
| 2674 direct Artin action | p37,k16 gives exponent5 mod36 | Inverse action would give31. |
| 2707 divided | B₁₀=5/66 but B₁₀/5=1/66 | Reduced numerator cancellation correct. |
| 2978 odd-primary | v₃(1/12)=−1; dyadic ratio needs extra real factor2 | No general nonabelian dyadic claim. |
| 3043 every odd prime | A single prime's Vandiver condition does not control the other primary summands | Quantifier retains global conditional table. |
| 3557 g^A−g^B=π_v g^C | First identity atπ=2 has both sides(−10,6); all173 in next ledger | All exact identities recomputed. |

### Headline acceptance coverage

| README headline | Statable at pins? | Current acceptance coverage / required action |
| --- | --- | --- |
| Denominator localization for arbitrary prime sets | Yes: native S.integer, localization, class group | Both actual theorems stated with D context. |
| Quillen finite generation, rank theorem and even finiteness | No actual higher Quillen K carrier at these pins | Name unavailable headlines/carrier in module comment, S02; numerical rank is padding, S01. |
| Soulé localization and odd integral structure, including real extensions and Harris–Segal detection | No actual higher K spectra/groups/comparison maps | Name these in module comment, S02. |
| Symmetric, quadratic, genuine and classical hermitian finiteness | Required higher GW/L carriers absent | Name them and their missing carriers, S02. |
| Even primary/real dyadic tables and wild-kernel/divisibility theorems | Actual K-group and comparison carriers absent | Generic infinite-height statements can be stated; they do not state the arithmetic wild-kernel result. Document that omission, S02. |
| All-integer Bott descent and involution tables | Bott-localized K spectrum/carrier absent | Numerical slots are not the headline; delete S01 and document S02. |
| Finite order-certificate soundness | Yes: native finite relations and abelian groups | Real certificate theorem present; no arbitrary Prop-valued surrogate. |
| Kummer criterion, reflection applications, divided Bernoulli corollary, prime-power regularity | Yes: native cyclotomic class numbers and Bernoulli values | The three displayed arithmetic theorems are statable; criterion and tower already belong to earlier supplier, S10. Divided consequence can retain literal native hypothesis. |
| K₄(ℤ)=0, unconditional integer order formula and conditional Vandiver group table | Actual higher K carrier absent | Name separately, including unconditional versus conditional distinction, S02. |
| Gaussian and golden arithmetic tame-kernel equivalences, degree-three examples | Actual Quillen K₂/K₃ carriers absent | Document rather than replace by small numeric checks; S02. Native symbol or abstract presentation alone is not the identified Quillen group. |

### Source locator ledger

All cited works were matched to the manifest's existing keys. The following 46 locator groups were checked against the legal local extractions in this round; “group” counts one row, not every theorem reference mentioned within that row. No source passage is reproduced here. Printed pagination and version are distinguished from PDF page indices. The five waived works and the separately waived preprint version are listed under Not verifiable, without reopening them.

| Source / exact locator group | Extraction witness | What the text supports or limits |
| --- | --- | --- |
| kbook III.6.3, p.234 | kbook line 13461 | Boundary uniformizer/unit orientation. |
| kbook V.4.3–4.4, p.401 | kbook line 24007 | Finite-length dévissage and supported-module filtered union, not a bare product of residues. |
| kbook V.6.6–6.6.1, p.409 | kbook line 24532 | Nonzero-prime sequence, valuation and tame boundary. |
| kbook V.6.6.3–6.6.4, p.410 | kbook line 24596 | Finite Dedekind transfer and sum of residue transfers. |
| kbook V.6.8–6.8.1, pp.412–413 | kbook line 24726 | Global-field Soulé theorem and coefficient surjectivity; n≥3 odd and n≥2 even. |
| kbook V.6.8.2, p.413 | kbook line 24796 | Contains the overstrong exponent/wild-kernel wording that the repaired roadmap expressly replaces with the eventual statement. |
| kbook VI.2.2–2.3, pp.470–471 | kbook line 28455 | Fixed twists and exceptional/dyadic formulas; the real-closed-field warning is handled separately in the roadmap. |
| kbook VI.2.4 / Example 2.4.1, p.472 | kbook line 28557 | Divided denominator and finite regularity criterion with reindexed Bernoulli numbers. |
| kbook VI.8.1–8.2, pp.512–513 | kbook line 31265 | Imaginary/even arithmetic tables; roadmap distinguishes ring finite generation from infinite field torsion. |
| kbook VI.8.7–8.8, pp.515–516 | kbook line 31456; kbook line 31472 | Totally real Euler ratio, odd-primary and abelian dyadic scopes. |
| kbook VI.9.3–9.5 | kbook line 31640 | Real extensions and odd torsion table. |
| kbook VI.9.8–9.11 | kbook line 31869; kbook line 32029 | Signature/cohomology correction and primary ranks. |
| kbook VI.9.12, p.525 | kbook line 32095 | The real factor in the K/cohomology ratio. |
| kbook VI.10.1 and Table10.1.1, pp.527–528 | kbook line 32187; kbook line 32240 | The theorem's 8k+6 row prints c_(2k+1), but its table says c_(2k+2). The roadmap uses the correct table index, witnessed by K₂₂ order691. |
| sun v1 pp.5–6 | sun line 147 | Proper layers, rank-one convention and reduced homology; reduction in rank2 is essential. |
| kahn Definition2.3.2 / Corollary2.3.7 | kahn line 409; kahn line 508 | Cellular categorical filtration mechanism. |
| kahn Theorem2.4.1 | kahn line 518 | Homological spectral sequence, with shift. |
| kahn Proposition4.2.4 / Corollary4.2.6 | kahn line 674 | Torsion-free/projective layer comparison. |
| kahn Theorem4.3.3 | kahn line 722 | Identification of the rank-filtration E¹ terms by Steinberg homology; finite generation additionally uses the arithmetic group theorem. |
| putman-studenmund Proposition2.1 | putman-studenmund line 301 | Orientation character sign(Ndet)^(m−1). |
| hermitian Proposition2.3.1 / Corollary2.3.2 | hermitian line 1881 | Symmetric L table on the stated Dedekind domain. |
| hermitian Proposition2.3.9 / Corollary2.3.10 | hermitian line 2031 | Quadratic/localization comparison and extension defects. |
| hermitian Corollaries2.3.16,2.3.18,2.3.19 | hermitian line 2217; hermitian line 2250; hermitian line 2263 | Integral Witt injection and genuine/classical finiteness, preserving range distinctions. |
| rognes-weibel Theorem6.7 | rognes-weibel line 1650 | Real mod-2∞ groups and diagonal extension. |
| rognes-weibel Theorem6.9 | rognes-weibel line 1741 | 2-integer form of that table. |
| handbook Theorem73 | handbook line 1285 | Totally imaginary integral table and odd torsion. |
| wildkernel introduction / TheoremB / §1 | wildkernel line 59 | Infinite-height elements and definitions of local/symbol kernels. |
| wildkernel Proposition2.2 / Corollaries2.3–2.4 | wildkernel line 206 | Top-degree descent and local roots with their hypotheses. |
| wildkernel Lemma3.2 / Proposition3.4 | wildkernel line 264 | Twisted norm and positive/cohomological comparisons. |
| wildkernel Proposition4.1 / Application4.2 | wildkernel line 345 | Picard coinvariant sequence including the H₁ term. |
| wildkernel Lemma4.4 / Corollary4.6 | wildkernel line 372; wildkernel line 402 | Unrestricted class/norm prescription is not used; eventual divisibility requires a separate stabilization index. |
| wildkernel §6, positive descent | wildkernel line 486; wildkernel line 493 | Real modifications and hidden subgroup retained. |
| hutchinson Definition2.3 / Remark2.4 | hutchinson line 139 | Special and very-special criteria. |
| hutchinson Theorem4.3 / Corollaries4.7–4.8 | hutchinson line 592 | Exceptional cohomological wild kernels. |
| hutchinson Theorem4.9 / Lemma5.1 | hutchinson line 695 | Picard image and independent local norm obstruction. |
| hutchinson Lemma5.2 / Remark5.4 / Theorem5.6 / Corollary5.7 | hutchinson line 792 | Twist-fixed field and parity-dependent divisibility comparison. |
| caputo Proposition2 | caputo line 203 | Splitting comparison; actual printed p.4. |
| caputo Lemmas4,6,7 / Proposition3 / Remark5 | caputo line 300 | Faithful cyclic norm calculation, explicit twisted Picard injection and corestriction. |
| caputo Theorem1 / Proposition4 / Example2 | caputo line 588; caputo line 797 | Fixed-modulus obstruction and arithmetic negative control; dyadic hypotheses cannot be discarded. |
| banaszak equations56,59,60 / Remark6.1 / Theorem6.4 | banaszak line 768; banaszak line 1409 | Stabilization index separate from exponent; all small moduli matter for splitting. |
| fgv §§2.6–2.7, equation2.6 / Proposition2.9 / Lemmas2.10–2.14 | fgv line 489 | Dualization, Bott edges and comparison range. The roadmap's twist2k avoids the source's apparent 2k−1 misprint in the even line near fgv line 629. |
| cgz v3 Lemma3.5 and proof | cgz line 901 | χ⁻¹ Picard injection in the unramified-p specialization; general ramified construction is supplied independently through Caputo. |
| sharifi Theorem4.4.2 / Corollaries4.4.4–4.4.5 / Theorem4.5.7 | sharifi line 3500; sharifi line 3690 | Direct-character reflection and exceptional vanishings; no equality in place of the two inequalities. |
| sharifi Definition5.2.4 / Proposition5.2.5 / Remarks5.2.8–5.2.9 | sharifi line 4224; sharifi line 4262 | Integral Bernoulli distributions and divided congruence mechanism. |
| ribet Theorem1.1; yokoyama Theorem4 | ribet line 63; yokoyama line 215 | Direct-action exponent1−k and one-ramified-prime tower argument. |
| groenewegen Lemmas4,9,12 / Propositions10,13 / Theorems11,14–15; rognes-k4 Propositions1.2,5.1–5.2 / §6 | groenewegen line 167, line 333, line 348, line 429, line 470, line 513; rognes-k4 line 187, line 609, line 627, line 697 | Geometry and finite-cutoff proof, plus stable-building and K₄ proof. K₄ manifest pagination repair is S12. |

### Pinned and cross-roadmap interface audit

Pins checked against lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Main roadmap resolution used content main a07e202; an open revision of an existing main roadmap was not substituted for main.

| Interface checked | Exact repository-relative witness | Scope/convention result |
| --- | --- | --- |
| Native S-integers and units | Mathlib/RingTheory/DedekindDomain/SInteger.lean:65,86,93,111,124 | Body uses valuations outside S ≤1. No finite-S field in its definition. Empty/full sets give integral ring/fraction field. |
| S-integer spectrum, class group, units | TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean:180; ClassGroup.lean:136; Unit.lean:123,130,207 in the same directory | Class quotient and localization map exist; unit_fg_of_units requires Finite S and FG base units. It supplies no rank formula. |
| Relative ideal norm | TauCeti/RingTheory/ClassGroup/RelNorm.lean:143,166 | Norm after extension is degree power, not identity; no arithmetic Steinitz formula silently inferred from that alone. |
| √5 arithmetic | TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/Basic.lean:42; Invariants.lean:76,85,96,114,135,140,153,163; Units.lean:50,57,81; RealPlace.lean:39,68 | Minpoly X²−X−1 and rational generation hypotheses are present and carried into roadmap contract. Positive-place absolute value is φ, distinguishing the other place's 1/φ. |
| Finite presentations | Mathlib/Algebra/Module/Presentation/Basic.lean:266,272,282 | Surjectivity corresponds to span=⊤; IsPresentation is bijectivity of the quotient map. Certificate fields do not already contain it. |
| Integer lattice index | Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean:98 | Basis/full-rank hypotheses retained; it does not prove the supplied generators span. |
| Minkowski lattice theorem | Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:91 | Finite-dimensional nontrivial real vector space, Haar measure, discrete lattice, symmetric convex compact body; n≥1 and B_t satisfy these hypotheses. |
| Bernoulli and zeta | Mathlib/NumberTheory/Bernoulli.lean:662; Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:251 | von Staudt–Clausen does not itself state the divided refinement. ζ(−k)= (−1)^k B_(k+1)/(k+1), so k=2j−1 gives the required negative sign. |
| Available K carriers | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean, ExactK0/liftEquiv and exact-functor maps | Exact K₀ and finite-projective K₀ are present; their existence does not provide the higher Quillen K, GW or Bott-localized spectra required by the omitted headlines. |
| Stable homotopy supplier | TauCetiRoadmap/StableHomotopyKTheory/README.md §§1.24–1.28,3.36,7.1–7.28 | Correct comparisons exist in actual sections; H.6 coefficient claim fails, S07. Untwisted AHSS §7.27 is not the C₂-action spectral sequence. |
| Exact K supplier | TauCetiRoadmap/GeneralAlgebraicKTheory/README.md §§2.1–2.5,4.3,4.8,4.14,7.4–7.8 | Products, transfers and localization exist; stale layer assignments S07. |
| Scheme localization supplier | TauCetiRoadmap/SchemeKTheoryOperations/README.md §§3.3,3.6–3.7 | DVR boundary orientation, ramification and transfer agree; duplicate general dévissage S13. |
| Low degrees/symbols | TauCetiRoadmap/KTheoryLowDegrees/README.md §§5.1–5.5,8.1,11.1–11.3; TauCetiRoadmap/K2SymbolsBrauer/README.md §§7.1–7.2,9.2–9.6,11.2,12.1–12.3 | Underlying objects supplied; absent aliases and duplicate Steinitz theorem S06/S07. |
| Classical local symbol | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:713,1383, main §§1.14–1.15,1.35 | Primitive root and invertible n; Artin-first convention, skew symmetry gives norm criterion in either argument. Earliest owner of the classical interface. |
| Étale twist supplier | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:231, F0.3; F4.1–F4.6 | VanishingCycles.etaleTateTwists is a roadmap target, not a missing pinned theorem; odd invertibility/continuous comparison conventions explicit. |
| Arithmetic duality / Selmer | TauCetiRoadmap/ArithmeticGaloisDuality/README.md R02.1,R02.3,R02.4; TauCetiRoadmap/SelmerIwasawaCohomology/README.md L2 | Strict local kernels, continuous limits, real terms and Kummer/Brauer contracts support the stated uses; no second twist or arbitrary local condition is constructed. |
| Cyclotomic class supplier | TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md §§0.1–0.4,3.1,3.3,4.5,5.1,5.4 | All three supposedly missing finite contracts already supplied, with direct action; S10. |
| Iwasawa supplier | TauCetiRoadmap/IntegralIwasawaTheory/README.md §§7.4,10.4–10.5,12.3 | Vandiver locator and special-value export resolved; redundant fourth gap S04, stale Vandiver locator S07. |
| Generalized real K | TauCetiRoadmap/GeneralizedCohomology/README.md:1651, G5.4, main | Existing KO/ku/Bott owner; S05. |
| Bordification/reduction | TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:2167,2220,2246; TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3469, §3.6 | Existing compactification and finite-CW inputs, with neatness; S11. Arithmetic orientation/Steinberg comparison remains here. |
| Witt and hermitian comparison | TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md GN.6; TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md §§4.4,7.1–7.5,8.1–8.2 | GN supplies signature finiteness, not all integral L tables; classical and quadratic comparison ranges differ as the repaired prose acknowledges. |
| Finite/local K | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md §§0.5,1,3.0a,3.1–3.5,6–7 | Finite fields and local kernels supplied. Stable transfer exists at §0.5; motivic ownership overlap at §3.0a is S03. |
| Chebotarev / class field | TauCetiRoadmap/Chebotarev/README.md:410, Layer10; TauCetiRoadmap/ClassFieldTheory/README.md global reciprocity and Hilbert class-field sections | Positive density applies to compatible Frobenius data; no change of arithmetic/geometric action hidden. |
| Native arithmetic/geometry owners | Completed/NumberFieldArithmetic/README.md; Completed/IntegralLattices/README.md; TauCetiRoadmap/IntegralLattices/README.md | Base arithmetic and geometry reused. The new targets are the arithmetic K comparisons/certificates, not algorithms for class numbers or units. |

Ownership searches used the roadmaps list/grep/show tools over current main and indexed open heads, together with direct searches of board packages and all 13 explicitly supplied sibling directories. The direct sibling set was ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. No fully qualified TauCetiRoadmap.ArithmeticKTheory declaration collision was found. Their local heads were used for their own names/sections. Open revisions to main GeneralizedCohomology, NumberFieldArithmetic and ClassicalArithmeticCompletion were not used as suppliers.

The search also finds arithmetic rank/Steinberg developments in AnabelianGeometryAndNonabelianChabauty and regulator-related foundations in ColemanIntegration. They are later than ArithmeticKTheory (positions150 and115 versus66). This package must own its arithmetic rank/Steinberg comparison and make those downstream users consume it; importing them would reverse supply. The general bordification, motives, real topological spectra and cyclotomic class theory already have earlier owners and cannot be reclaimed on that ground. No later supplier was added to the proposed repairs.

### Mechanical dependency and policy record

The specified read-only dependency command, on the unchanged README with name ArithmeticKTheory and the supplied order and movable flag, returned:

```text
depcheck: 14 roadmaps, 113 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not detect the within-roadmap §7.2/§7.3 prerequisite cycle in S08 or a supplier section whose content differs from the asserted contract in S07. Every proposed owner in S03–S13 is main or earlier in the supplied order.

Git head is d7eac7e. The requested origin/main...HEAD stat contains seven files, all under packages/ArithmeticKTheory: README.md, Suggested.lean, design/plan.json, metadata.toml, reports/FIX-RT-ArithmeticKTheory~1.md, review.json and sources.toml. The review created only this report and scratch notes; the final working-tree check shows only this untracked report in the board. No Lean build, git write, posting, source download or credential operation occurred.

The Lean file has one import Mathlib, no lemma declaration, no set_option, no sorry'd data or instance, no True placeholder, no admitted example, no #eval/#synth/#print axioms, and no roadmap import. Declaration docstrings describe mathematics. Process language found in prior reports was treated only as data. No source or repository text was treated as an instruction. Mathematical finite certificates are distinguished from computational search algorithms. The remaining name-format and headline issues are S01/S02/S09.

Boundary applicability was checked rather than forcing meaningless substitutions. NumberField excludes positive characteristic, inseparability, noncompact absolute Galois groups, zero rings and square-zero rings; the general norm-residue clause explicitly requires coefficients invertible in the field. Dedekind and regular hypotheses exclude the nonreduced dual-number countermodel, whose K₀→G₀ map is ×2 rather than an isomorphism. Empty S, empty finite support, rank0/1, degrees0/1/2, residue𝔽₂, primes2/3, ramified/unramified and split primes are recorded above. q=1 is not a residue-field cardinality. The abstract E in §5.4 also needs an explicit abelian hypothesis: D₈ supplies the counterexample in S14. Nonabelian S₃ and Q₈ cannot instantiate AddCommGroup A; they can be finite symmetry groups in transfer, where H₀ transfer for C₃≤S₃ multiplies by2 and for C₄≤Q₈ multiplies by2, consistent with the actual finite-cover construction. No arbitrary-topology carrier or universe/cardinality truncation is used to make a theorem vacuous.

### Independent golden-certificate computations

Coordinates (a,b) mean a+bε in ℚ[ε]/(ε²−ε−1). Multiplication was recomputed as (a,b)(c,d)=(ac+bd,ad+bc+bd), with rational inversion via norm a²+ab−b². Each exponent vector was evaluated exactly; no decimal equality test was used. The following are the values of both sides of every one of the 173 displayed relations in §8.8, in its prime order and row order. All are equal; no mathematical repair is needed for these finite identities.

| Prime, row | Computed g^A−g^B | Computed πg^C | Result |
| --- | --- | --- | --- |
| (2,0), 1 | (-10,6) | (-10,6) | equal |
| (2,0), 2 | (-4,-6) | (-4,-6) | equal |
| (2,0), 3 | (-6,-10) | (-6,-10) | equal |
| (2,0), 4 | (-2,2) | (-2,2) | equal |
| (-1,2), 1 | (-32,-16) | (-32,-16) | equal |
| (-1,2), 2 | (-4,-12) | (-4,-12) | equal |
| (-1,2), 3 | (-8,6) | (-8,6) | equal |
| (3,0), 1 | (-30,15) | (-30,15) | equal |
| (3,0), 2 | (-12,-6) | (-12,-6) | equal |
| (3,0), 3 | (-15,-15) | (-15,-15) | equal |
| (3,0), 4 | (0,-6) | (0,-6) | equal |
| (3,1), 1 | (-6,-24) | (-6,-24) | equal |
| (3,1), 2 | (-10,-18) | (-10,-18) | equal |
| (3,1), 3 | (-4,6) | (-4,6) | equal |
| (3,1), 4 | (-12,18) | (-12,18) | equal |
| (3,1), 5 | (-7,5) | (-7,5) | equal |
| (3,1), 6 | (-15,6) | (-15,6) | equal |
| (3,1), 7 | (-27,-9) | (-27,-9) | equal |
| (3,1), 8 | (-3,21) | (-3,21) | equal |
| (3,1), 9 | (-2,14) | (-2,14) | equal |
| (3,1), 10 | (-20,-25) | (-20,-25) | equal |
| (3,1), 11 | (-9,-3) | (-9,-3) | equal |
| (3,1), 12 | (-9,8) | (-9,8) | equal |
| (3,1), 13 | (-6,-13) | (-6,-13) | equal |
| (3,1), 14 | (-5,2) | (-5,2) | equal |
| (3,1), 15 | (-4,28) | (-4,28) | equal |
| (4,-1), 1 | (-11,0) | (-11,0) | equal |
| (4,-1), 2 | (-15,12) | (-15,12) | equal |
| (4,-1), 3 | (-5,-7) | (-5,-7) | equal |
| (4,-1), 4 | (-22,22) | (-22,22) | equal |
| (4,-1), 5 | (-16,-18) | (-16,-18) | equal |
| (4,-1), 6 | (-4,-10) | (-4,-10) | equal |
| (4,-1), 7 | (-2,-5) | (-2,-5) | equal |
| (4,-1), 8 | (-10,8) | (-10,8) | equal |
| (4,-1), 9 | (-9,-6) | (-9,-6) | equal |
| (4,-1), 10 | (-10,8) | (-10,8) | equal |
| (4,-1), 11 | (-8,-20) | (-8,-20) | equal |
| (4,-1), 12 | (-15,-21) | (-15,-21) | equal |
| (4,1), 1 | (-24,-6) | (-24,-6) | equal |
| (4,1), 2 | (-3,4) | (-3,4) | equal |
| (4,1), 3 | (-17,10) | (-17,10) | equal |
| (4,1), 4 | (-9,-7) | (-9,-7) | equal |
| (4,1), 5 | (-20,14) | (-20,14) | equal |
| (4,1), 6 | (-13,-8) | (-13,-8) | equal |
| (4,1), 7 | (-13,-8) | (-13,-8) | equal |
| (4,1), 8 | (-16,15) | (-16,15) | equal |
| (4,1), 9 | (-16,-4) | (-16,-4) | equal |
| (4,1), 10 | (-17,10) | (-17,10) | equal |
| (4,1), 11 | (-5,13) | (-5,13) | equal |
| (4,1), 12 | (-11,2) | (-11,2) | equal |
| (4,1), 13 | (-9,12) | (-9,12) | equal |
| (4,1), 14 | (-6,8) | (-6,8) | equal |
| (5,-1), 1 | (-32,14) | (-32,14) | equal |
| (5,-1), 2 | (-12,10) | (-12,10) | equal |
| (5,-1), 3 | (-21,8) | (-21,8) | equal |
| (5,-1), 4 | (-24,20) | (-24,20) | equal |
| (5,-1), 5 | (-1,-15) | (-1,-15) | equal |
| (5,-1), 6 | (-13,-5) | (-13,-5) | equal |
| (5,-1), 7 | (-18,15) | (-18,15) | equal |
| (5,-1), 8 | (-4,16) | (-4,16) | equal |
| (5,-1), 9 | (-16,7) | (-16,7) | equal |
| (5,-1), 10 | (-6,24) | (-6,24) | equal |
| (5,-1), 11 | (-14,-1) | (-14,-1) | equal |
| (5,-1), 12 | (-12,10) | (-12,10) | equal |
| (5,-1), 13 | (-19,19) | (-19,19) | equal |
| (5,-1), 14 | (-5,20) | (-5,20) | equal |
| (5,-1), 15 | (-19,19) | (-19,19) | equal |
| (5,-1), 16 | (-4,16) | (-4,16) | equal |
| (5,1), 1 | (-11,21) | (-11,21) | equal |
| (5,1), 2 | (-20,25) | (-20,25) | equal |
| (5,1), 3 | (-14,3) | (-14,3) | equal |
| (5,1), 4 | (-26,18) | (-26,18) | equal |
| (5,1), 5 | (-4,5) | (-4,5) | equal |
| (5,1), 6 | (-4,5) | (-4,5) | equal |
| (5,1), 7 | (-1,-6) | (-1,-6) | equal |
| (5,1), 8 | (-6,-7) | (-6,-7) | equal |
| (5,1), 9 | (-1,-6) | (-1,-6) | equal |
| (5,1), 10 | (-18,-21) | (-18,-21) | equal |
| (5,1), 11 | (-13,9) | (-13,9) | equal |
| (5,1), 12 | (-16,20) | (-16,20) | equal |
| (5,1), 13 | (-6,-7) | (-6,-7) | equal |
| (5,1), 14 | (-16,-9) | (-16,-9) | equal |
| (5,1), 15 | (-7,16) | (-7,16) | equal |
| (5,1), 16 | (-2,-12) | (-2,-12) | equal |
| (5,1), 17 | (-1,-6) | (-1,-6) | equal |
| (5,1), 18 | (-3,11) | (-3,11) | equal |
| (5,1), 19 | (-16,-9) | (-16,-9) | equal |
| (5,1), 20 | (-15,-3) | (-15,-3) | equal |
| (5,1), 21 | (-14,3) | (-14,3) | equal |
| (5,1), 22 | (-1,23) | (-1,23) | equal |
| (5,1), 23 | (-20,-4) | (-20,-4) | equal |
| (5,1), 24 | (-8,10) | (-8,10) | equal |
| (5,1), 25 | (-24,1) | (-24,1) | equal |
| (5,1), 26 | (-13,9) | (-13,9) | equal |
| (5,1), 27 | (-11,-8) | (-11,-8) | equal |
| (6,-1), 1 | (-10,-8) | (-10,-8) | equal |
| (6,-1), 2 | (-9,-13) | (-9,-13) | equal |
| (6,-1), 3 | (-14,-17) | (-14,-17) | equal |
| (6,-1), 4 | (-5,-4) | (-5,-4) | equal |
| (6,-1), 5 | (-8,11) | (-8,11) | equal |
| (6,-1), 6 | (-2,10) | (-2,10) | equal |
| (6,-1), 7 | (-6,1) | (-6,1) | equal |
| (6,-1), 8 | (-11,-3) | (-11,-3) | equal |
| (6,-1), 9 | (-8,-18) | (-8,-18) | equal |
| (6,-1), 10 | (-10,-8) | (-10,-8) | equal |
| (6,-1), 11 | (-3,15) | (-3,15) | equal |
| (6,-1), 12 | (-31,10) | (-31,10) | equal |
| (6,-1), 13 | (-3,15) | (-3,15) | equal |
| (6,-1), 14 | (-4,20) | (-4,20) | equal |
| (6,-1), 15 | (-10,21) | (-10,21) | equal |
| (6,-1), 16 | (-9,16) | (-9,16) | equal |
| (6,-1), 17 | (-30,5) | (-30,5) | equal |
| (6,-1), 18 | (-15,17) | (-15,17) | equal |
| (6,-1), 19 | (-5,25) | (-5,25) | equal |
| (6,-1), 20 | (-19,8) | (-19,8) | equal |
| (5,2), 1 | (-26,2) | (-26,2) | equal |
| (5,2), 2 | (-3,5) | (-3,5) | equal |
| (5,2), 3 | (-1,12) | (-1,12) | equal |
| (5,2), 4 | (-19,-20) | (-19,-20) | equal |
| (5,2), 5 | (-3,5) | (-3,5) | equal |
| (5,2), 6 | (-12,-11) | (-12,-11) | equal |
| (5,2), 7 | (-3,5) | (-3,5) | equal |
| (5,2), 8 | (-16,6) | (-16,6) | equal |
| (5,2), 9 | (-7,-9) | (-7,-9) | equal |
| (5,2), 10 | (-18,-1) | (-18,-1) | equal |
| (5,2), 11 | (-2,24) | (-2,24) | equal |
| (5,2), 12 | (-5,-2) | (-5,-2) | equal |
| (5,2), 13 | (-9,-16) | (-9,-16) | equal |
| (5,2), 14 | (-24,-22) | (-24,-22) | equal |
| (5,2), 15 | (-6,10) | (-6,10) | equal |
| (5,2), 16 | (-21,4) | (-21,4) | equal |
| (5,2), 17 | (-4,17) | (-4,17) | equal |
| (5,2), 18 | (-17,-13) | (-17,-13) | equal |
| (5,2), 19 | (-4,-14) | (-4,-14) | equal |
| (5,2), 20 | (-2,24) | (-2,24) | equal |
| (5,2), 21 | (-17,18) | (-17,18) | equal |
| (5,2), 22 | (-4,17) | (-4,17) | equal |
| (7,-2), 1 | (-23,-20) | (-23,-20) | equal |
| (7,-2), 2 | (-14,-27) | (-14,-27) | equal |
| (7,-2), 3 | (-13,17) | (-13,17) | equal |
| (7,-2), 4 | (-21,6) | (-21,6) | equal |
| (7,-2), 5 | (-8,20) | (-8,20) | equal |
| (7,-2), 6 | (-7,2) | (-7,2) | equal |
| (7,-2), 7 | (-4,10) | (-4,10) | equal |
| (7,-2), 8 | (-5,-3) | (-5,-3) | equal |
| (7,-2), 9 | (-7,2) | (-7,2) | equal |
| (7,-2), 10 | (-2,5) | (-2,5) | equal |
| (7,-2), 11 | (-13,17) | (-13,17) | equal |
| (7,-2), 12 | (-6,15) | (-6,15) | equal |
| (7,-2), 13 | (-1,18) | (-1,18) | equal |
| (7,-2), 14 | (-21,6) | (-21,6) | equal |
| (7,-2), 15 | (-15,-9) | (-15,-9) | equal |
| (7,-2), 16 | (-10,25) | (-10,25) | equal |
| (7,-2), 17 | (-13,-14) | (-13,-14) | equal |
| (7,-2), 18 | (-4,-21) | (-4,-21) | equal |
| (7,-2), 19 | (-30,13) | (-30,13) | equal |
| (7,-2), 20 | (-23,11) | (-23,11) | equal |
| (7,-2), 21 | (-17,27) | (-17,27) | equal |
| (7,-2), 22 | (-21,6) | (-21,6) | equal |
| (7,-2), 23 | (-10,25) | (-10,25) | equal |
| (7,-2), 24 | (-18,14) | (-18,14) | equal |
| (7,-2), 25 | (-12,-1) | (-12,-1) | equal |
| (7,-2), 26 | (-11,12) | (-11,12) | equal |
| (7,-2), 27 | (-11,12) | (-11,12) | equal |
| (7,-2), 28 | (-7,-29) | (-7,-29) | equal |
| (7,-2), 29 | (-1,18) | (-1,18) | equal |
| (7,-2), 30 | (-31,0) | (-31,0) | equal |
| (7,-2), 31 | (-11,12) | (-11,12) | equal |
| (7,-2), 32 | (-8,20) | (-8,20) | equal |
| (7,-2), 33 | (-3,23) | (-3,23) | equal |
| (7,-2), 34 | (-31,0) | (-31,0) | equal |
| (7,-2), 35 | (-26,3) | (-26,3) | equal |
| (7,-2), 36 | (-17,27) | (-17,27) | equal |

| Prime | q | Relations | Signed minors | gcd = q−1 | Residues recomputed | Generated order |
| --- | --- | --- | --- | --- | --- | --- |
| (2,0) | 4 | 4 | [6, -3] | 3 = 3 | [(1, 0), (0, 1)] | 3 = 3 |
| (-1,2) | 5 | 3 | [4] | 4 = 4 | [4, 3, 2] | 4 = 4 |
| (3,0) | 9 | 4 | [8] | 8 = 8 | [(2, 0), (0, 1), (2, 0), (2, 2)] | 8 = 8 |
| (3,1) | 11 | 15 | [60, -30, -10] | 10 = 10 | [10, 8, 2, 4, 3] | 10 = 10 |
| (4,-1) | 11 | 12 | [70, -20] | 10 = 10 | [10, 4, 2, 7, 3, 7] | 10 = 10 |
| (4,1) | 19 | 14 | [-54, -36] | 18 = 18 | [18, 15, 2, 10, 3, 18, 8] | 18 = 18 |
| (5,-1) | 19 | 16 | [216, -18] | 18 = 18 | [18, 5, 2, 9, 3, 8, 18, 9] | 18 = 18 |
| (5,1) | 29 | 27 | [-168, -224, 420] | 28 = 28 | [28, 24, 2, 18, 3, 27, 9, 28, 10] | 28 = 28 |
| (6,-1) | 29 | 20 | [56, 28] | 28 = 28 | [28, 6, 2, 11, 3, 9, 27, 10, 28, 11] | 28 = 28 |
| (5,2) | 31 | 22 | [90, 60] | 30 = 30 | [30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24] | 30 = 30 |
| (7,-2) | 31 | 36 | [-180, -240, -90] | 30 = 30 | [30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12] | 30 = 30 |


The signed minors were recomputed from the selected rows of the relation matrices over ℤ, using exact rational elimination, and the listed residue generators were multiplied to closure in the actual finite fields. There are 23 signed minors in the 11 rows above. Their signed values match those printed in §8.8; each gcd equals q−1 and each generated multiplicative subgroup has order q−1. For q=4,9 the pairs are coordinates in 𝔽_q on the same ε model; for split primes the entries are the indicated residues of ε. These computations verify the advertised witnesses, not an unproved assumption that the relation matrices present the actual tame kernel; that latter step uses the separately stated generation and boundary targets.

Coverage counts: 14 findings (one P1, nine P2, four P3). 32 named Lean declarations and 15 proved examples; 52 numbered README subsections, recorded in 112 statement/definition/convention rows; all 23 emphasized target fragments; 75 README Checks blocks read, with their arithmetic tests recorded in those rows and the 173 identity rows above; 23 determinant and 11 residue-generation Checks recomputed. Source verification covers 46 explicit locator groups across all 18 certified works. The cross-roadmap ledger resolves 14 named suppliers in the exact-contract section plus the additional ownership interfaces; all 13 provided sibling checkouts were searched. All 27 earlier findings were assessed individually: 22 repaired as raised, five partly repaired. No new false numerical identity was found in the finite certificates. The blocking issues are the findings above.

## Not verifiable

- The complete future higher-K, GW, L and étale comparison proofs do not exist at the pinned carriers. This review checks mathematical statements, proof prerequisites and the supplied elaborated types; it does not claim kernel verification of those future proofs. No Lean build or fresh signature elaboration was run under the read-only instruction.
- harris-segal §3, mitchell Theorem3.4, quillen Theorems1/3, bass-tate II§3/Appendix Propositions1–2 and serre III§1/IV§§3,6/V§§1–2 are operator-waived texts. Their original passages were not recertified. They are accepted as waived locators, not missing-text findings or new requests.
- The separately waived 2002 groenewegen preprint was not fetched again. The certified journal text verifies the mathematical statements with its own numbering; dual pagination remains a version distinction. No new source key was created.
- SpecialValuesBirchTate B.3/B.8 and K3BlochGroups are described as downstream consumers. Their named files were not present in the supplied main/Completed/board folders or returned by the indexed show lookup, so their exact future section numbers could not be certified. They were not treated as supplier prerequisites.
- The full class-field computation behind Caputo's sextic example was not independently reconstructed. Its stated values and hypotheses were checked against caputo Proposition4/Example2; the elementary order/intersection contradiction was then evaluated explicitly. Likewise the higher K-group table instances are source-backed mathematical instances, not runtime computations of K-groups.
- No new inaccessible required text was discovered, so no new needs-references request was written. Waived material remains settled.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d7eac7ea432c3790b42a29f8d62e70e30ea48864", "job": "RT-ArithmeticKTheory~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
