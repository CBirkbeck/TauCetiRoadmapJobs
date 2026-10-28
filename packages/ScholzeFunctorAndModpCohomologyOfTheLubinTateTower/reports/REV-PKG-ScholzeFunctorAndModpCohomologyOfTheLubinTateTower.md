<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1702#issuecomment-6399431637 -->
Review (codex) of 52b1cfe

Verdict: needs_changes

1. **F01** (P2) The Weil-to-Galois extension needs admissibility

   **Location:** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:375`: “the continuous discrete W_F-action on Sⁱ(π) extends uniquely to Gal_F”.

   **Claim:** This applies to the general smooth coefficients introduced in §1.1. The standing conventions do not make π admissible, and §1.1 explicitly includes non-admissible π.

   **Witness:** In rank one take A=k=𝔽_p and π=k[t,t⁻¹], with units acting trivially and a uniformiser acting by multiplication by t. Then S⁰=π and geometric Frobenius has infinite orbit {tⁿ:n∈ℤ} on 1.

   The representation is smooth and killed by the maximal ideal, but its unit invariants have infinite dimension. A continuous action of the compact group Gal_F on a discrete space has finite orbits. Thus this Weil action has no continuous Galois extension. SCH18 line 871, Proposition 4.6, pp. 20–21, explicitly assumes admissibility; its proof uses finite compact-open invariant spaces.

   **Exact repair:** State the Galois-extension theorem for admissible π, and scope every Galois-equivariant consequence in this subsection accordingly. Keep the general smooth sheaf and Weil-action construction. Add the unramified shift representation above as a negative-control Check. For the repaired positive control π=k[t,t⁻¹]/(tᵐ−1), m≥1, the Frobenius orbit has at most m elements and the action factors through ℤ/m; the continuous extension exists. This repair preserves the general coefficient-ring theorem supported by SCH18.

2. **F02** (P1) The named trace supplier does not supply the trace

   **Location:** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:389`: “the Tate trace on projective space from ClassicalAdicEtaleCohomology §1.4”.

   **Claim:** That section supplies the projective-space trace used to identify S² of a character, with its Tate twist and degree-one normalization.

   **Witness:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:372`, §1.4, supplies local systems, Kummer coefficients and twists; it does not state this trace. The projective-bundle calculation is in `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1122`, §0.9.

   This is a substantive supplier-contract mismatch, rather than an absent paper locator. Replacing it with the analytic smooth trace would also be insufficient: that trace's prime-to-residue hypotheses exclude the p-primary coefficients here.

   **Exact repair:** Add the exact contract for EtaleCohomologyFoundations §0.9 (and §0.11 for its normalized trace), and cite ClassicalAdicEtaleCohomology §8.2, specifically its proper algebraic comparison at `README.md:3600`. Replace the §1.4 trace citation with these inputs. Over the characteristic-zero field C, p is invertible algebraically; the proper comparison permits arbitrary torsion coefficients. This gives H²(ℙ¹_C,k(1))=k, with degree-one class 1 and degree-two class 2=0 when p=2. Those are precisely the package's convention tests, without excluding p=2.

3. **F03** (P2) Noncompact Shapiro is statable at the pins but omitted

   **Location:** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:405`: “Prove Hⁱ_cont(H,Ind_J^H V)≃Hⁱ_cont(J,V), for all i”. Also `Suggested.lean:10`, the list of unavailable headline signatures.

   **Claim:** The README includes the continuously split, noncompact Shapiro comparison as a deep result. Suggested.lean contains only compact finiteness and Moore vanishing; it neither states this comparison nor identifies a missing carrier for it.

   **Witness:** `Mathlib/RepresentationTheory/Continuous/Basic.lean:533` defines `ContRepresentation.coindV` by f(φ(g)h)=π(g)f(h); line 550 defines `ContRepresentation.coind` with right translation and the inherited continuous-function topology. The required carrier already exists.

   I elaborated a separate signature against the pins, with one `import Mathlib`, no new definitions, no options, and only its theorem proof admitted. It exited successfully with one `sorry` warning. The complete retained type was also checked. Its essential form is:

   ```lean
   open CategoryTheory
   universe u

   theorem noncompactShapiroSignature
       (R H : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
       [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [T2Space H]
       [LocallyCompactSpace H] [TotallyDisconnectedSpace H]
       (J : Subgroup H) (hJ : IsClosed (J : Set H))
       (X : TopRep.{u} R J)
       (hact : Continuous (fun z : J × X => X.ρ z.1 z.2))
       (s : Quotient (QuotientGroup.rightRel J) → H) (hs : Continuous s)
       (hsec : Function.RightInverse s (Quotient.mk (QuotientGroup.rightRel J)))
       (i : ℕ) :
       Nonempty (continuousCohomology i
         (TopRep.of (X.ρ.coind ⟨J.subtype, continuous_subtype_val⟩)) ≅
           continuousCohomology i X) := by
     sorry
   ```

   **Exact repair:** State the full §2.1 Shapiro headline on this native coinduced object, retaining local compactness, closedness, a continuous quotient section and jointly continuous coefficient action. The stronger naturality/map characterization can remain in the README. Cite `ContRepresentation.coindV` and `ContRepresentation.coind` in the supplier contracts and describe the induction carrier as imported, instead of planning its construction again. Add the actual theorem name to the README. Also name the §1.3 strict-image theorem separately in the not-statable docstring list: it lacks the analytic étale integral sheaf and strict adic restriction carriers. Test J=1, H=C₂, V=𝔽₂: the induced carrier has dimension 2, its invariants dimension 1, and both positive-degree Shapiro outputs are zero. For H=S₃ the respective dimensions are 6 and 1. These distinguish the native construction from V itself and from a termwise cochain isomorphism.

4. **F04** (P1) Arithmetic Lubin–Tate descent is attributed to a Drinfeld-only contract

   **Location:** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:811`: “arithmetic descent is the supplied quotient descent”; its Needs line is at 825. The arithmetic LT notation first appears at line 21.

   **Claim:** EndoscopicTransferAndUnitaryTraceComparison §12.19 supplies the arithmetic Lubin–Tate quotient LT⁽ᵖ⁾_{n,K} needed by the final theorem.

   **Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4676`, §12.19, explicitly states arithmetic descent for the rank-two **Drinfeld** tower. Section 12.11 at line 4501 compares infinite levels, not equal numbered finite levels.

   Sections 12.7 and 12.14 provide the Weil cocycle and geometric central quotient; neither states effectiveness over F for the finite-level Lubin–Tate quotient. The distinction matters already at n=0: the geometric LT height components are open discs, whereas the Drinfeld components are Ω_F. An infinite-level isomorphism does not identify these finite-level objects. Searches by this object in main, the supplied open heads and the board designs did not locate a separate arithmetic LT descent contract.

   **Exact repair:** Declare an additional gap owned by EndoscopicTransferAndUnitaryTraceComparison §12.19, in both the plan's top-level gaps and the README contracts. For example, `gap:lubin-tate-arithmetic-descent`: for every finite F/ℚ_p and rank-two level n≥0, the full-height Lubin–Tate level modulo the central subgroup generated by ϖ in Dˣ has effective descent to F from its specified Weil cocycle, compatible with level maps, Dˣ/⟨ϖ⟩, and base change to finite K/F. Cite that contract at §6.4. Alternatively resolve an existing supplier statement with exactly this content; the present Drinfeld-only citation cannot serve. The repaired contract must retain both height classes at n=0 and produce the LT discs after geometric base change, not Ω_F. A declared contract suffices; this review does not require its implementation first.

5. **F05** (P3) Correct source and classification locators

   **Location:** `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:521` and `sources.toml:48`: “Propositions 3.15, 3.17, 3.22 and Lemma 3.23”; also `README.md:241` and 415 for FUST22 Lemma 6.2, and the classification range at `README.md:95`.

   **Claim:** These locators identify the fiber results and the compact-group finiteness result.

   **Witness:** LUD17 line 1099 labels 3.22 a lemma; line 1159 labels 3.23 a proposition. FUST22 line 478 is Lemma 6.2 on printed p. 290; printed p. 291 starts at line 494. Classification is in PadicLocalLanglandsForGL2Qp §2.7.

   **Exact repair:** Use “Propositions 3.15, 3.17 and 3.23; Lemma 3.22” in the README and the existing LUD17 manifest entry. Change the compact lemma's page to 290 and the combined Lemmas 6.2–6.6 range to pp. 290–295. Extend the narrow PadicLocalLanglandsForGL2Qp classification pointers from §§2.1–2.6 through §2.7; its statement is at `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:853`. Do not add new manifest keys. Reopening these corrected locators gives exactly the completed-fiber statement and the bounded-coefficient finiteness statement used here. No mathematical statement needs to change for this finding.

Five findings: two P1, two P2 and one P3. The package is repairable. No previous package review was supplied. README.md, Suggested.lean, metadata.toml and the recorded source entries were left unchanged.

## Verified sound

The audit covered all 28 numbered subsections, their API bullets and Checks, all 28 Needs lines, seven layer dependency summaries, the conventions, supplier contracts, references and all three Lean declarations. The seeded sample contains 15 targets; all its accessible primary texts were read. There are four blocking findings above, not a clean acceptance. The computations below are negative and positive controls; they do not substitute for the source proofs or the supplier contracts.

**Principles and shape.** The extension beyond the supplied mod-p/O-torsion functor is identified as the general complete-local coefficient extension. The full-rank towers, all height components and all primes are retained where the sources provide them. The odd-prime arithmetic endpoints are not substituted for the general-F, all-prime geometric multiplicity theorem. Moore's rank-two theorem is distinguished from stable K₂. No algorithmic deliverable, copied source passage, sorry'd data, `set_option`, foreign roadmap import, admitted example or `lemma` declaration was found in the package. There is one real predicate and two substantive theorem signatures. The seven layers all have Examples and Dependencies; each numbered subsection has at least four Check bullets. `metadata.toml` records math.NT. Main-branch ClassifyingSpaces and LocalGaloisGroups were read for house shape. Except for the findings, the API is in prose and the three own Lean names agree with the README.

**Seeded source verification.** Pagination below follows the manifest's specified versions, not a silently substituted revision. SCH18/SCH13/LUD17/PAS22/DPS23/GK14/STR08 use the specified preprint pagination; MOO68 uses printed scan pagination; FUST22 and CDN23 use journal pagination. No new work needed fetching and no author-recorded manifest entry was altered.

| Sampled target | Source opened and locator | Hypotheses/content checked; outcome |
|---|---|---|
| 0.1 | SCH18 lines 318, 335, 346, 363, 389, 414; Proposition 2.8 through Lemma 2.13, pp. 8–10; line 729, Lemma 3.12, p. 17 | qcqs/profinite limit, open-subgroup slice, invariants of the quotient sheaf, finite-étale torsor tower and continuous Hochschild–Serre. They are distinct constructions with the correct bases. |
| 1.3 | SCH18 lines 511–566; Corollary 3.6 and proof, pp. 12–13 | Smooth separated qc V, qc valuatively strict U; the good-germ step is explicitly a supplier gap. Identity of a nonproper closed disc is excluded. |
| 1.4 | SCH13 lines 462, 516–574; Proposition 2.11, Lemmas 2.12–2.13, pp. 10–13 | Almost finiteness, middle exactness, reduction/multiplication, Frobenius scalar extension and algebraic closure are retained. The elementary-divisor vector is not ordinary length. |
| 1.6 | SCH18 lines 871–918; Propositions 4.6–4.7, pp. 20–21; DPS23 lines 1387–1422, Lemmas 7.3–7.4, pp. 30–31 | R01: Galois extension drops admissibility. The common D-central character and inverse Galois twist are checked using DPS23's convention; R02 concerns the separate projective trace input. |
| 2.1 | FUST22 lines 100–116, 358, 399–448, 478–610; Lemma 2.1, Corollary 4.4, Proposition 5.1, Corollary 5.2, Lemmas 6.2–6.6, pp. 281, 287–295; CDN23 line 1555, p. 37 | Full smooth Ext category; compact-open/function-space distinction; reductive finiteness for bounded O-torsion; exceptional-block exclusions at small primes. Noncompact Shapiro is cited to BW00 IX.2.3, pp. 175–176, whose text remains uncertified. R03 and R05 apply. |
| 2.2 | MOO68 lines 1950–2110, especially 2054; Theorems 10.3–10.4, printed pp. 51–53; CDN23 lines 2041–2056, Lemma 4.28, p. 49 | Topological/Borel extensions versus globally continuous finite discrete-kernel cocycles are distinguished. The local kernel is μ(F); the odd-Qp vanishing is not claimed for p=2 or general ramified F. |
| 2.3 | CDN23 lines 1452–1530; Theorem 3.2, Lemma 3.10, pp. 34–36; ECD17 line 3541, Proposition 14.9, p. 86 | Prodiscrete Stein-limit topology and vanishing of rows j≥2. ECD14.9 permits arbitrary abelian torsion; the package uses continuity directly, avoiding the coefficient-range gap in ECD23.6's projection-formula proof. |
| 2.4 | CDN23 lines 1531–1550; Corollary 3.11, p. 36 | Finite quotients of the profinite source, continuous Hom, double-dual variance and the direction/order of the five-term maps. |
| 3.1 | LUD17 lines 862, 916, 922, 958, 972, 1099, 1159, 1230, 1236, 1252–1290; Theorems 3.11/3.14, Corollary 3.13, fiber results and §4, pp. 20–30 | B(ℤ_p), B′ and B(ℚ_p) are distinguished; completed fibers and rank-one sheaf; higher direct images vanish by the fiber computation. Labels require R05. |
| 3.2 | LUD17 lines 1303–1340; Theorem 4.6, Corollary 4.7, p. 31 | All smooth character pairs, including equal characters and p=2; Steinberg follows from the exact sequence and the cohomological bound. Character S² remains nonzero. |
| 4.1 | DPS23 lines 1748–1787; Proposition 8.1, Lemma 8.2, pp. 37–39; GK14 lines 1689–1745, Appendix A, pp. 36–37 | p>2, coefficient enlargement, even totally real degree, p split, prescribed reducible local data, large global image. The potentially Barsotti–Tate existence input is declared. |
| 4.3 | PAS22 lines 1242–1285; Lemmas 6.1–6.2, pp. 27–28 | Arbitrary Hecke ideal, finite generators, global S⁰-vanishing, injection, norm-one-trivial cokernel, exceptional χ⊕χε obstruction. The global comparison itself is imported. |
| 5.1 | CDN23 lines 1814–1841; §4.2 and Lemma 4.13, p. 43 | “Finite image” requires finite support AND finite-dimensional values; finite coefficients are essential to the Weil H⁰/H¹ argument. The arithmetic application is the Qp one. |
| 5.2 | CDN23 lines 1818–1880; Lemma 4.13 and Lemma 4.17, pp. 43–45 | Three descent steps, strict topology, finite error terms and the unquotiented scalar-group Shapiro calculation. The package correctly keeps two height cosets and does not require all level groups to be torsion-free. |
| 6.4 | CDN23 lines 2021–2059; Theorem 4.26, Lemmas 4.27–4.28, Remark 4.29, pp. 48–49 | Finite-length-to-smooth-vectors route, absence of finite-dimensional G-submodules, odd-prime Moore input and the converse criterion. The mathematics matches; its arithmetic LT carrier needs R04. |

Other source passages opened include STR08 lines 337–402 (Theorems 4.3–4.4, component labels and reciprocity); SCH18 lines 481 and 792–869 (finiteness and admissibility); DPS23 lines 1330–1422 (compact duals, centre and twists), 1852–1927 (quaternionic module and the correction in footnote 15, line 1896, to PAS22 equation (26), lines 748–751); and CDN23 lines 1280–1307 and 1880–2020 (geometric finite presentation, finite support, arithmetic length, general-F multiplicities and higher-dimensional vanishing).

**Computed adversarial controls.** Unless a finding is named, “retained” means the displayed test agrees with the statement under its stated hypotheses. These controls cover every numbered target as well as the conventions and all headline groups. In entries involving sheaves, source proofs supply the construction; the table records the actual finite, zero, scalar, rank or cohomology values tested.

| Statement/object | Instances tried | Computed values on the two sides / wrong model | Result and change |
|---|---|---|---|
| Torsor lift and common centre | δ(2)=2 in 𝔽₅ | Lift evaluation 2⁻¹=3; D scalar 2; Galois scalar 3; twist followed by inverse 2·3=1 | Retained; inversion cannot be removed from both factors. |
| Reciprocity | δ(ϖ)=2, units trivial | Geometric Frobenius 3; arithmetic Frobenius 2; their product 1 | Retained against geometric/arithmetic interchange. |
| Rank and scalar quotient | r=1,2; n=0 | v(det(ϖI₁))=1, v(det(ϖI₂))=2; height quotient has respectively 1,2 classes | Retained; r=0 excluded and level zero is the full compact group. |
| Lattice dual | λ=ℤ₅, scalar 2 | Pairing scalar 2·(1/2)=1; λ*⊗L/O=L/O, but (L/O)⊗(L/O)=0 | Retained; torsion dual cannot replace lattice dual. |
| Projective trace / character S² | Degree-one/two divisors, p=2,3 | Trace values 1,2; in 𝔽₂ these are 1,0; H²(ℙ¹,k)=k(−1), rank 1 | R02 supplies the missing exact contract; no prime exclusion. |
| 0.1 equivariant limits and HS | G=1, empty X | E₂⁰ʲ=Hʲ(X), E₂ⁱʲ=0 for i>0; empty module-sheaf sections 0 on both sites | Retained; an empty cover is used only on the empty object. |
| 0.1 coefficient linearization | C₂ on a point, k=𝔽₃ | Trivial coefficient generator 1, invariants k; sign generator 2, invariants 0 | Retained; trivial action on the space does not force trivial linearization. |
| 0.1 period torsor dictionary | r=1; S₃ g=(12), h=(23) | Fˣ/O_Fˣ=ℤ, not a point; g⁻¹hg=(13), not (23) | Retained; full G-torsor and compact K-torsor have different bases. |
| 0.2 component labels | F=ℚ₂, m=1,2; m=0 | Unit label counts 1 and 2; at m=0 each height has one component; all heights are ℤ | Retained against dropping heights or using 1+M₂(O_F). |
| 0.3 / Lean compact finiteness | H=C_p, analytic dimension 0; V=𝔽_p | dim Hⁱ(C_p,V)=1 for every i≥0, both p=2 and p=3 | Retained; conclusion is degreewise finiteness, not bounded cohomological dimension. |
| 0.3 / Lean compact finiteness | H=ℤ_p, V=k trivial | Dimensions in degrees 0,1,2 are (1,1,0) | Retained at p=2 as well. |
| 0.3 admissibility and boundedness | Regular functions, countable sum; H=1, ℚ_p/ℤ_p | Regular H⁰=k and higher groups 0; direct sum H⁰ has dimension ℵ₀. For ℚ_p/ℤ_p, truncation has pʲ elements but full H⁰ is infinite | Retained; both admissibility and bounded exponent discriminate. |
| 1.1 sheaf, stalk and exactness | π=0,k²; lift changed by scalar 2 mod 5 | Stalks 0,k²; lift comparison 3 versus wrong value 2; exact stalk sequence 0→k→k²→k→0 | Retained; construction is not the invariant subspace of π. |
| 1.2 Sⁱ and dual δ-functor | r=1, π=k; r=2, π=k | Rank-one dimensions (1,0,0); rank-two dimensions (1,0,1); dual scalar of 2 is 3 | Retained; dual reverses exact-sequence arrows. |
| 1.3 strict restriction | Empty U; proper ℙ¹; identity closed disc | Empty image 0; projective almost ranks (1,0,1); closed-disc identity retains infinitely many monomials, and fails valuative strictness | Retained; mere open containment does not suffice. |
| 1.4 almost Frobenius systems | Standard rank r and zero system | γ(M_k)=(k,…,k) with r entries; γ(M_pk)=(pk,…,pk)=pγ(M_k); zero gives empty vector and r=0 | Retained; single r works at every exponent. |
| 1.4 exactness / wrong system | Rank one, k=1; constant M_k=O/π, p=2 | Kernel O/π²→O/π is πO/π², the q-image; constant family's γ(M₂)=1 versus Frobenius value 2 | Retained; constant-thickness impostor excluded. |
| 1.5 coefficient generality | A=k[ε]/ε², π=A trivial, r=2 | S²=A(−1), k-dimension 2; reducing A to k gives dimension 1 and loses nonzero ε-action | Retained; no reducedness/domain restriction. |
| 1.5 bounds | r=1,2 and π=0 | Upper bounds 0,2; H¹ for r=1 is 0; all zero-coefficient groups 0 | Retained; rank-zero formula is not used. |
| 1.6 Galois extension | π=k[t,t⁻¹]; π/(tᵐ−1) | Frobenius orbit infinite in first case; at most m in second. A profinite continuous discrete orbit must be finite | R01 adds admissibility. |
| 1.6 central/twist formulas | δ value 2 mod 5, trivial π | D character 2, Galois character 3; r=2 S¹=0 and S² rank 1 | Formula retained; R01 scopes Galois equivariance. |
| 2.1 Fust Ext | H=1 and ℤ_p, V=k | H⁰=Ext⁰=k; for ℤ_p degree 1 has dimension 1 and degree 2 is 0 on both sides | Retained; full smooth category required. |
| 2.1 Shapiro carrier/map | H=C₂ or S₃, J=1 | Carrier dimensions 2 or 6, versus V dimension 1; invariants dimension 1 on both sides; positive-degree cohomology 0 | R03; native coinduction passes and a termwise isomorphism fails. |
| 2.1 noncompact section and untwist | GL₂(F)→Fˣ; δ(x)=2 mod 5 | det diag(t,1)=t, det(tI₂)=t²; T² scalar 2·3=1 | Retained; scalar matrices are not the quotient section. |
| 2.1 reductive finiteness | H=ℚ₃ˣ, V=𝔽₃ trivial | ℚ₃ˣ=3^ℤ×μ₂×(1+3ℤ₃); dimensions in degrees 0,1,2 are (1,2,1) | Retained; noncompactness does not imply vanishing. |
| 2.1 block exclusions | π=1 versus supersingular π | H⁰(SL₂,1)=k versus H⁰(SL₂,π)=0; exceptional trivial representation cannot be included in vanishing | Retained at small primes with representation-level exclusions. |
| 2.2 / Lean Moore | F=ℚ₃,ℚ₅,ℚ₂ | Orders of μ(F) are 2,4,2; dimensions Hom(μ(F),𝔽_p) are 0,0,1 | Retained; p=2 is a genuine negative control. |
| 2.2 general field contrast | F=ℚ₃(ζ₃), unramified quadratic ℚ₃-extension, 𝔽₃((t)) | Root-of-unity orders 6,8,2 give Hom-to-𝔽₃ dimensions 1,0,0 | Retained; oddness alone does not give general-F vanishing. |
| 2.2 perfection input | a=2 in ℚ₂ and ℚ₃ | a≠0; a²−1=3≠0 in both fields, even though its reduction can vanish | Retained; pinned lemma applies over the field, not its residue field. |
| 2.3 spectral sequence / Stein topology | r=1, π=k; two finite product points | Abutment k in degree 0 and 0 above; finite-product sections k² on both sides. In all ranks the forbidden rows j≥2 are 0 | Retained; ordinary torsion continuity suffices. |
| 2.4 multiplicity coefficients | π=0,k,k² | Hom terms 0,Hʲ,(Hʲ)², agreeing with coefficient cohomology; dual weight 3 becomes Hom weight 2 | Retained; variance and zero object agree. |
| 2.4 continuous versus algebraic Hom | Source ∏ℕk, target discrete k | Continuous dual is ⊕ℕk, with finite coordinate support; unrestricted algebraic dual has additional functionals | Retained; source must use its actual finite quotients. |
| 2.5 five-term comparison | Supersingular and character inputs | Supersingular SL₂ error groups 0. Odd-p character has S¹=0 and degree-two error 0, hence multiplicity 0; at p=2 the latter has dimension 1 | Retained; comparison is not imposed as a definition for all π. |
| 3.1 Borel quotient | diag(p,p⁻¹); completed split fiber; rank-one character | Determinant valuation 0 but matrix not in B(ℤ_p); two chosen fiber points allow independent values (1,0); local-system stalk dimension 1 versus invariant-only wrong model 0 | Retained; B′, B(ℤ_p), B(ℚ_p) and fiber products distinguished. |
| 3.2 principal / Steinberg / character | Equal inducing characters, p=2 or 3 | S²(Ind 1)=0, S²(St)=0, S²(1)=k(−1) of dimension 1; connecting S¹(St)→k(−1) is surjective | Retained; one-dimensional subrepresentation does not force the induced S² to be nonzero. |
| 4.1 globalization hypotheses | k=𝔽₉, locally reducible input; even/odd real degree | Upper/lower unipotents in SL₂(𝔽₉) have distinct fixed lines, common fixed space 0; sum of d real invariants is d/2, equal to 0 mod ℤ exactly when d is even | Retained; local reducibility is compatible with large global image. |
| 4.2 auxiliary place and quaternion exchange | k=𝔽₂₇; primitive ξ; exchanged pair | ξ² has order 13, whereas 𝔽₃ˣ has order 2; two exchanged 1/2 invariants sum to 0 mod ℤ | Retained; coefficient enlargement and both quaternion algebras matter. |
| 4.2 coefficient dual and occurrence | Rank-one lattice; fixed-central-character category | Lattice dual tensor gives L/O, torsion-dual tensor gives 0; central scalar 2 on S gives 3 on S∨ | Retained; projectivity is in the matching central quotient. |
| 4.3 Hecke-ideal comparison | I=0 and I=T; generic versus exceptional label | I=0 gives identity S¹(S)→Ĥ¹, cokernel 0; I=T gives 0→0. Generic ratio is outside {1,ε,ε⁻¹}; χ⊕χε has exceptional ratio ε | Retained; source supports the stronger arbitrary-ideal injection. |
| 4.4 generic Galois criterion | K=ℚ_p, fixed central character ζ | χ₁ or χ₂ trivial gives ordered candidates (1,ζε) and (ζε,1), at most two; a nontrivial twist with value 2 changes a fixed eigenvalue 1 to 2 | Retained; no all-twists conclusion from one vanishing. |
| 5.1 finite image | Zero, one finite value, one infinite value | (support size, value dimension)=(0,0),(1,1),(1,∞); only first two qualify | Retained; finite support alone is insufficient. |
| 5.1 cosocle/cohomology | Nonsplit length-two extension; H=1 or ℤ_p | Irreducible cosocle yields Hom rank 1 over its endomorphism field, 0 elsewhere; ℤ_p sends one trivial k-value to dimensions (1,1,0) | Retained for the supplied admissible/Qp representation application. |
| 5.2 descent and scalar quotient | n=0, scalar pI₂; trivial scalar stabilizer | Two height orbits 0,1; scalar coinduced module has two summands and H¹(ℤ,−)=0 on each; −1∈O_Dˣ has order 2 for odd p | Retained; source's one-coset/torsion-free shortcuts are not copied. |
| 5.3 finite support / characters | p=3; determinant twist δ | 𝔽₃ˣ has two characters; scalar pI₂ acts under δ∘det by δ(p)², so quotient condition is δ(p)²=1 | Retained; using δ(p)=1 alone would lose a permitted twist. |
| 5.4 arithmetic length | n=0; coefficient exponent 2; π=0 | Height quotient retains two Ω summands; O/p² has two O/p successive factors; zero input multiplicity 0 | Retained; finite length is proved for actual arithmetic dual, not an arbitrary finite-support family. |
| 6.1 general-F multiplicities | p=2, character; zero π | SL₂(ℚ₂) degree-two error dimension 1 is finite, though nonzero; π=0 gives dimension 0 | Retained; general multiplicity finiteness does not need the odd-prime vanishing. |
| 6.2 dual coinvariants | H=C_p, N(e₂)=e₁, N(e₁)=0 | Invariants ke₁, coinvariants k[e₂]; both dimensions 1 but natural invariants→coinvariants map is 0 | Retained; dual Hom yields coinvariants, not invariants. |
| 6.2 variance/topology | ρ=0,k², identity levels | Π(0)=0; Π(k²)=Π(k)²; identity gives identity; level arrows reverse H¹ pullback | Retained; no left-exactness assertion. |
| 6.3 dimension and block support | Absolutely irreducible dim 3, ordinary factors of dim≤2 | Hom from a simple 3-dimensional representation to successive 1/2-dimensional factors is 0; dimension-2 supersingular label remains allowed | Retained; scalar extension and absolute irreducibility are essential to this comparison. |
| 6.4 finite-dimensional submodules | Finite target for additive ℚ_p; odd-p character | Divisibility forces each additive root-group image to be 0; SL₂ acts trivially. Character multiplicity is bounded between 0 and 0 | Retained; intermediate finite-dimensional smooth subspace is actually 0. |
| 6.4 arithmetic LT carrier | n=0, two height classes | LT geometric pieces are two open discs; Drinfeld pieces are two Ω_F, not the same finite-level object | R04: name the LT descent contract instead of using Drinfeld descent. |

**Pinned library and duplication audit.** The checked pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used objects, coefficient conditions and operations, not just the package's chosen names. The following declarations/bodies were opened; paths are relative to their respective library repositories.

| Pinned file and line | Declaration / information checked |
|---|---|
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`, 64, 243, 262 | `TopRep`, `TopRep.of`, `TopRep.coind₁`, `TopRep.res`: topological module and continuous individual operators; no jointly continuous orbit action is built into the carrier. |
| `Mathlib/RepresentationTheory/Continuous/Basic.lean:72`, 431, 533, 550, 568 | `toRepresentation`, `trivial`, `coindV`, `coind`, `coind₁`. R03 is the missed native general coinduction. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`, 131 | `homogeneousCochains`, `continuousCohomology`; actual continuous homogeneous cochain homology. |
| `Mathlib/RepresentationTheory/Basic.lean:48`; `Mathlib/RepresentationTheory/Invariants.lean:73` | `Representation` and fixed submodule `{v : ∀g,ρ(g)v=v}`. These are reused by the admissibility predicate. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | `CategoryTheory.Abelian.Ext` requires the abelian/Ext-category infrastructure; it does not supply the smooth category. |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | `Field.absoluteGaloisGroup`, automorphisms of the algebraic closure; this alone is not a geometric cohomology object. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`, 804; `Mathlib/Topology/Algebra/Group/Matrix.lean:125` | Determinant-one carrier, `Matrix.SL2.commutator_eq_top`, topological-group instance. The perfection lemma needs a≠0 and a²≠1, not p>3. |
| `Mathlib/Topology/Algebra/PontryaginDual.lean:37` | Circle-valued continuous multiplicative characters; not the coefficient-linear O-duality promised by the supplier. |
| `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:90`; `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | `LieGroup`, analytic `ω` versus smooth `∞`, and `IsAdicComplete` including separatedness. The Lean theorem really assumes analytic charts and algebraic completeness. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:236`, 272, 618 | `ofDiscreteModule`, `IsSmoothDiscrete` (discrete topology plus open stabilizers), `SmoothDiscreteTopRep`. No derived smooth abelian category is supplied by this full-subcategory definition. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean:73` | `trivialFp` is the native ULift of ZMod p, with trivial continuous action; its lift is on the coefficient object. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean:235`, 244, 454 | `quasiIso_shapiroCochainMap`, `shapiroIso`, `shapiroIsoTopRep`; profinite/closed-subgroup smooth discrete setting, restriction/evaluation forward map. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Finiteness.lean:155` | `finite_continuousCohomology_of_isOpen_of_normal_of_prime` requires finite coefficient carrier and lower-degree inputs. It does not directly prove the infinite admissible-coefficient compact headline. |

The other cited basic module paths (including `Mathlib/Basic/Finite/Defs.lean`) exist. Searches found no native Lubin–Tate torsor/cohomology, almost-module system with the required scalar extension, completed quaternionic module, or mod-p block carrier that would make the corresponding geometric headlines statable by a few simple definitions. The native continuous induction is the exception in R03. No duplicate fully qualified name for the package's three declarations was found.

**Resolved roadmap ownership and supply.** Main was checked at `794d0fc`; open heads were those in the supplied index dated 2026-10-25. Roadmap `show`/`grep` and `resolve` were used, followed by reading the relevant supplier statements. Existing roadmaps with revision/progress pull requests were checked on main. No revision pull request was used as a new supplier. Each row below resolves the contract to the named section; the source of any mismatch is stated rather than hidden behind the resolver's existence check.

| Supplier and inspected location | Object / resolution |
|---|---|
| `TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility/README.md:311` (§0.6), 524–637 (§§1.5–1.7), 1189 (§3.7), 1702 (§4.12) | Full period torsor, basic mod-p/O-torsion functor; definite/indefinite quaternionic modules, smallness and fixed-central-character injectivity, Hecke localization and S¹ comparison. Package extends coefficients and proves the specified global application, rather than rebuilding the towers. |
| `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison/README.md:4281`–4437 (§§12.2–12.8), 4501 (§12.11), 4574 (§12.14), 4676 (§12.19), 4710 (§12.21) | Formal towers, periods, infinite EL duality, height-preserving scalar quotient and Stein Mittag–Leffler. The finite levels are not identified by equal indices; §12.4 uses uniformiser-of-F powers, so intermediate D-levels are obtained by the stated compact-group quotients. Arithmetic LT descent is R04. |
| `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups/README.md:558`, 617, 696, 800, 1593, 1655, 1833 | SR.0.1–SR.0.4, SR.0d.1–SR.0d.2 and SR.2.1 supply categories, smoothness, invariants, admissibility, derived structure and induction. Derived continuous comparison there is for compact open U; §2.1's general locally profinite comparison is an extension. |
| `packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md:337`, 530 and MP.0–MP.1 named targets | Admissibility, finite presentation, finite-index/coinvariant closure, scalar extension, central Ext support and cosocle/smooth-dual length criteria. MP.0 scalar extension explicitly retains admissibility; MP.1 central Ext is the Qp input. These supplied criteria are not replanned here. |
| `TauCetiRoadmap.PadicLocalLanglandsForGL2Qp/README.md:207`, 273, 643–853, 1744–1847, 2370, 2392 | §§0.1/0.3 dualities; §§2.1–2.7 and Layer 3 smooth representations/Montréal values; §§5.1–5.4 blocks and pseudo-deformations; §§6.7–6.8 residual finiteness and occurrence. The scope citation to Layers 2–3 resolves classification at §2.7; the narrower supplier-list range §§2.1–2.6 needs the locator correction in R05. |
| `TauCetiRoadmap.KTheoryLowDegrees/README.md:1064` (§11.5) | Owns Moore's local rank-two covering classification, including root-of-unity kernel. Continuous discrete-cocycle comparison and odd-prime consequence are the package's addition. |
| `TauCetiRoadmap.ClassFieldTheory/README.md:920`, 1504 (Layers 5,9) | Finite local Galois H⁰/H¹/H², local Weil topology and arithmetic-normalized reciprocity. The package explicitly inverts this normalization; the 2/3 scalar test agrees. |
| `TauCetiRoadmap.PerfectoidSpaces/README.md`, P0.5–P0.13, P0.29, P2, P3.18–P3.22, P5, P8 | Almost categories, scalar operations, bases, tilting, almost acyclicity, finite-stage descent and free-action quotients. The package's module-system rigidity is distinct from almost-algebra Frobenius criteria. |
| `TauCetiRoadmap.DiamondsAndVStacks/README.md`, D0, D4, D6 | Coherent-site/topos limits with universe cutoffs and analytic diamonds; no unrestricted unbounded cohomology commutation is imported. |
| `TauCetiRoadmap.DiamondEtaleCohomology/README.md:565` (C0.18), C0–C1 | ECD14.9 continuity for arbitrary abelian sheaves; comparison with quasi-pro-étale sites. Prime-to-p base change elsewhere in C1 is not used as a p-primary theorem. |
| `TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration/README.md:2392` (IG.4.1) | Equivariant étale site and its slices/pullbacks. Closed-subgroup limit refinements are the package's own targets. |
| `TauCetiRoadmap.PadicHodgeTheory/README.md:593` (§2.7); `TauCetiRoadmap.AInfCohomology/README.md:2018` (AI.3.1) | Toric/nested-cover primitive comparison route and finite-image spectral-sequence propagation; the proper absolute comparison is owned by AInf. The package's strict-image statement and general almost-system rigidity are distinct. |
| `TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa/README.md:172`, 198, 398 (Layer 0) | Open-uniform analytic characterization, finite-index bases and noetherian completed group rings, allowing p-torsion. The resolution used here is termwise finite rank; no bounded-length resolution is inferred for C_p. |
| `TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra/README.md:241` (§1.10) | Cohen coefficient map and power-series surjection, including p-torsion targets; no coefficient-field embedding is substituted. |
| `TauCetiRoadmap.CompletedCohomologyPartII/README.md:806`–1130 (Layer 3) | Continuous dual, finite-coefficient and coefficient-limit comparisons with the stated compactness/completeness conditions. |
| `TauCetiRoadmap.AdicSpacesPartII/README.md`, R0.10–R0.18 | Separated/smooth/valuative geometric interfaces; the specific good-germ assertion is declared as a gap. |
| `TauCetiRoadmap.ClassicalAdicEtaleCohomology/README.md`, §§1.1,1.3,1.5 | Torsion cohomology and descent/limit carriers; analytic dimension and arithmetic Stein Hochschild–Serre are declared gaps. The trace pointer is R02. |
| `TauCetiRoadmap.PerfectoidShimuraVarieties/README.md`, §§1.13–1.15 | Anticanonical towers and perfectoid limits; height-zero LT embedding is a declared gap, not presumed supplied. |
| `TauCetiRoadmap.LocalGaloisDeformationRings/README.md`, §3.4 | Fixed potentially semistable/type conditions; existence of potentially Barsotti–Tate lifts is separately declared. |
| `TauCetiRoadmap.PotentialModularityAndCompatibleSystems/README.md`, §§2.23,4.15 | Prescribed local data and potential modularity with splitting/avoidance/solvable-descent conditions; no local residual irreducibility is added. |
| `TauCetiRoadmap.AutomorphicGaloisRepresentations/README.md:1578`, 1607, 1692 (§§3.7,3.10–3.11) | Hilbert/Carayol attachment and normalization. The parallel adapter transports coefficient-prime comparison only under its stated local conditions or residual absolute irreducibility; the large-image globalized input satisfies the latter. |
| `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer/README.md`, R16.3, R17.3–R17.4 | Local type/parameter dictionary, quaternionic transfer and solvable base change. The geometric reciprocity and central determinant conventions require the package's stated transport. |
| `TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves/README.md`, R18.3–R18.4 | Residual Hecke localization, effective central/stabilizer conditions, quaternionic coefficient modules and eigenspaces; the two exchanged algebras remain distinct. |
| `TauCetiRoadmap.ReductiveGroupsPartII/README.md:2846`, 2973, 3128, 3408 (RG2.2) | Contractible building, oriented facets, fixers and local-field finite orbit geometry. Coefficient resolution/cohomological finiteness are added here. |
| `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`, LT.2, “Lubin–Tate character” and “Artin comparison” | Finite-level character and arithmetic Artin normalization. Transport to the geometric inverse convention agrees with STR08's component labels. |
| `TauCetiRoadmap.Chebotarev/README.md:410` (Layer 10) | Density #C/#G, infinitude and removal of finitely many places; this supplies the auxiliary-place choice. |
| ProetaleCohomologyOfPAdicCurvesAndTowers, arithmetic finite-presentation section | Declared gap, not an asserted existing theorem. Its absence is not a finding. |

The board-package index was read first. The four available package READMEs were inspected by object search; for the other fifteen indexed heads the package README returned HTTP 404, but their design READMEs were available and were inspected. In particular `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md:29` imports this roadmap's mod-p length/multiplicity theorems and develops characteristic-zero factorization; it is a consumer, not a second owner of these endpoints. The indexed EndoscopicTransferAndUnitaryTraceComparisonPartII and CompletedCohomologyAndLocalGlobalCompatibilityPartII designs were included. Searches of the supplied open roadmap heads covered the additional named open work; no second owner for the strict-image/Frobenius-system theorem, general continuous-cocycle Moore consequence, Ludwig quotient or mod-p tower endpoints was identified. This is a checked ownership result, not a claim that an unlisted future roadmap cannot overlap.

**Declared gaps.** All six existing slugs occur both in the plan's top-level gaps list and in the README supplier subsections: `proetale-finite-presentation`, `temkin-good-germs`, `analytic-topology-dimension`, `arithmetic-stein-hochschild-serre`, `height-zero-modular-uniformisation`, `potentially-barsotti-tate-lifts`. Each names an earlier supplier, states the needed geometric/coefficient hypotheses and requests a single coherent missing interface. No duplicate of these contracts was located in the checked sources of supply. They are not findings. R04 identifies an additional undeclared interface. Because the verdict is needs changes, review.json does not record conditional acceptance.

**Dependency check.** The prescribed `gate --depcheck` command with `--name ScholzeFunctorAndModpCohomologyOfTheLubinTateTower`, the supplied order, and `--movable` returned:

```text
depcheck: 52 roadmaps, 606 edges, 0 problem(s)
```

There were no UPWARD or CYCLE lines. Manual review of the Needs lines found no reverse consumer edge. The citation resolver found no nonexistent section labels or own Lean names; it did not verify the content of those sections and did not inspect the pinned Lake libraries. The manual content checks therefore remain necessary, and yielded R02–R04.

**Headline inventory and Lean acceptance test.** The README's end theorems and deep supporting endpoints are:

| Headline group | Acceptance status |
|---|---|
| Equivariant site limits/descent/HS; Strauch components (§§0.1–0.2) | Named in docstring; geometric sites/tower component map missing at pins. |
| Compact analytic-group finiteness with complete local coefficients (§0.3) | `compactLie_cohomology_finite` stated on native carriers. |
| General-coefficient Scholze sheaf/finiteness/action refinements (§§1.1–1.6) | Geometric functor absent at pins; docstring identifies it. R01 repairs the prose statement. |
| Almost finite strict images and Frobenius rigidity (§§1.3–1.4) | Almost sheaf/module-system interfaces missing; no stand-in theorem present. |
| Fust smooth Ext, reductive finiteness and block vanishing (§2.1) | Derived smooth/reductive/block carriers unavailable; docstring names them. |
| Continuously split noncompact Shapiro (§2.1) | Native carrier exists; missing signature is R03. |
| Moore odd-prime SL₂ degree-two vanishing (§2.2) | `moore_sl2_h2_vanishes` stated with prime and 2<p binders. |
| Cartan–Leray, multiplicity and degree-one comparison (§§2.3–2.5) | Docstring names missing tower cohomology and Sⁱ. |
| Perfectoid Borel quotient and principal/Steinberg S² vanishing (§§3.1–3.2) | Docstring names missing quotient/sheaf. |
| Globalization, quaternionic occurrence/Hecke comparison and generic Galois criterion (Layer 4) | Docstring identifies missing automorphic/quaternionic/S¹ objects. |
| Finite arithmetic support and arithmetic finite length (Layer 5) | Docstring identifies missing arithmetic tower cohomology. |
| All-F multiplicities and geometric finite presentation (§§6.1–6.2) | Docstring's geometric multiplicity group depends on missing tower carriers. |
| Finite length, dimension>2 vanishing and supersingular support (§6.3) | Named in docstring with missing geometric cohomology/action carrier. |
| Smooth-vector finiteness and its arithmetic-length equivalence (§6.4) | Named in docstring; arithmetic LT input also needs R04. |

`lake env lean` was run on the original absolute Suggested.lean path from the content checkout, as prescribed. Exit status was 0; the only warnings were the two expected `sorry` warnings. The used TauCeti object file was already present, so no build was needed. No other Lean build/update/cache command was used.

All three declarations were mechanically inspected with `#check @name` on a scratch copy and compared with the README and the supplied signature extraction. No needed binder was lost. The compact theorem retains primality, finite analytic dimension (including zero), Hausdorff compact topological group, complete noetherian local A, finite residue field of characteristic p, discrete scalar topology, smooth X, compact-open admissibility and a positive annihilating maximal-ideal exponent. The Moore theorem retains both primality and 2<p. The predicate deliberately does not itself assert smoothness or bounded torsion; the theorem supplies both.

Both sorried theorems were probed on a copy using individual closing attempts by `simp`, `rfl` and `infer_instance`; neither closed. Inspection of the pinned finite-coefficient reduction and profinite Shapiro theorems found no applicable single library theorem closing either target. The compact theorem permits infinite admissible modules and torsion in H, and the Moore theorem uses a noncompact group, so neither is an existing boundary-case instance. No padding declaration was found. The additional R03 signature elaborated successfully with one `sorry` warning and retained all its section/action/closed-subgroup hypotheses. All review-owned Lean processes finished.

## Not verifiable

- **BW00, Chapter IX, Proposition 2.3, pp. 175–176:** the manifest settles this publisher text as uncertified; its full hypotheses/proof could not be reread legally here. No new request was made. FUST22's induction conventions and CDN23 line 1555's explicit use for the prodiscrete Shapiro step were checked, but they are not a claim to have read BW00.
- Fifteen indexed board heads did not yet expose `packages/<Name>/README.md`; their available `design/README.md` files were searched for ownership instead. No assertion about absent package-only additions at those heads is made. This did not prevent checking the named existing suppliers or their available designs.

## Source issues

- **Misprint** in SCH13 at proof of Lemma 2.13, p. 12, line 556: the source says the kernel of the chosen map to A/π is annihilated; it should be the cokernel; affects the proof.
- **Misprint** in LUD17 at proof of Theorem 4.6, p. 31, line 1322: the source calls the perfectoid-fiber result Lemma 3.23; it should be Proposition 3.23; affects nothing.
- **Error** in CDN23 at proof of Lemma 4.13, equation (4.15), p. 44, lines 1852–1853: the source identifies scalar-uniformiser quotient components with Fˣ/ϖ^ℤ; it should be Fˣ/ϖ^(2ℤ), retaining two height classes in rank two; affects the proof.
- **Error** in CDN23 at proof of Lemma 4.13, p. 44, line 1855: the source calls every indicated compact division-algebra level group torsion-free; it should use compact analytic groups without that assertion, since level zero contains roots of unity; affects the proof.
- **Error** in CDN23 at proof of Lemma 4.13, p. 44, line 1866: the source uses one coinduced unit-function summand for the scalar action; it should use two height-coset summands, each having zero first cohomology; affects the proof.
- **Gap** in ECD17 at proof of Lemma 23.6, p. 144, lines 6021–6023: the source invokes Proposition 22.11 for arbitrary coefficient rings although that proposition assumes prime-to-p torsion; it should justify the arbitrary-coefficient profinite-product comparison separately, using continuity in the bounded torsion case needed here; affects the proof.
- **Misprint** in CDN23 at proof of Lemma 4.24 within Theorem 4.23, p. 48, line 1998: the source reverses the group and coefficient arguments in H¹(T,H); it should be H¹(H,T); affects nothing.
- **Error** in PAS22 at Lemma 5.1, equation (26), p. 17: the source uses the torsion dual of the lattice before tensoring with L/O; it should use Hom_O(λ,O); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "52b1cfe32410a5c7cf5e9a0c75db426097cf7f8f", "job": "REV-PKG-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower", "model": "gpt-6-astra", "worker": "chris-13"} -->
