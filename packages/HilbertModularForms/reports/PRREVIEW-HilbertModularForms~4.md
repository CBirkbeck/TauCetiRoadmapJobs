# Review of HilbertModularForms (pull request #1724 at 28f3bc3)

**Verdict:** needs changes

## R01 (P2) — Use pseudo-eigenvalues in the full Jacquet–Langlands dictionary

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:2082`: “the eigenvalue at 𝔭 ∣ 𝔇 on the quaternionic side being -ε_𝔭(f) N𝔭^{k₀/2 - 1}”.

**Claim:** §10.2 compares the full D-new space, compatibly with the central action, but uses ε, which §7.7 defines only when ψ=1. Nontrivial unramified central characters occur in this space. Its ramified-place eigenvalues need not be real signs.

**Witness:** Over ℚ(√229), base-change 11a1 and twist by the unramified cubic character from x³−4x−1. At one prime above 11, c(𝔭)=ζ₃ and λ_𝔭=−ζ₃; neither is a sign.

**Exact repair:** Keep the full central-character generality. On the ψ summand state the ramified-place eigenvalue as `-λ_𝔭(f) N𝔭^(k₀/2-1)`, with `λ_𝔭(f)^2=ψ([𝔭])`; prove this general coefficient/pseudo-eigenvalue comparison in §7.7. Then give the ε formula as its ψ=1 specialization. Add the cubic-twist negative control. For the witness this gives −(−ζ₃)·11⁰=ζ₃ and λ²=ζ₃²=ψ([𝔭]), as required. Restricting the entire dictionary to ψ=1 would discard part of its promised library.

The witness is reproducible without a database lookup. The cubic has discriminant 229 and is irreducible modulo 2; its splitting field has group S₃ and quadratic resolvent ℚ(√229). Its cyclic cubic extension over the resolvent is unramified at finite and infinite places: the squarefree discriminant gives only transposition inertia, and all three roots are real. At 11, 229≡3² and the cubic has no root modulo 11, so either prime above 11 has nontrivial cubic Frobenius. For `y²+y=x³−x²−10x−20`, Δ=−11⁵ and c₄=496; modulo 11 the singular point is (5,5), with split tangent cone Y²−3X². The projective cubic has 11 points, giving split-multiplicative coefficient 1. Quadratic base change and the unramified cubic twist preserve the two conductor-one primes. Taking D=11𝒪_F gives four ramified places, including the two real ones, so the definite algebra in §10.2 exists. This also tests the supplier's twist law in GL2AutomorphicRepresentationsAndTransfer R17.3.1.

## R02 (P3) — Delete the tuple finite-dimensionality padding

**Location:** `TauCetiRoadmap/HilbertModularForms/Suggested.lean:428`: `theorem finiteDimensional_hilbertModularForms`.

**Claim:** This is presented as another sorried headline, but follows in one tactic from the component theorem immediately above it and the pinned finite-product instance.

**Witness:** The scratch copy elaborated successfully after replacing this sorry by:
`exact Module.Finite.pi (h := fun c => finiteDimensional_modularForms hn 𝔫 h𝔫 (R.rep c) k)`.

**Exact repair:** Delete it from `Suggested.lean`, remove its declaration-name claim from the README's headline list, and keep tuple finite dimensionality as the README consequence of component finite dimensionality. The probe works with the existing binders and arbitrary narrow class group; no restriction to class number one is needed. The library instance is `Module.Finite.pi`, `Mathlib/RingTheory/Finiteness/Basic.lean:274`.

## R03 (P3) — Finish the claim-level source locators

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:449`: “prove the matrix description”; also §§1.2, 2.4, 3.5 and 5.6.

**Claim:** The expanded reference list still does not provide exact locators beside several sampled claims. A chapter covering a subject, an internal dependency, or the final abstract compact-ball lemma does not locate the Hilbert theorem being used.

**Witness:** §§1.1–1.2 contain no source theorem/equation/page locator. Assaf §2.1, equations (2.1.4)–(2.1.10), printed p.3, supplies the corresponding groups, but its Γ₁ uses the opposite diagonal congruence.

**Exact repair:** Attach a precise locator and convention adapter to each retained claim. For §§1.1–1.2 use Assaf's stated lattice/stabilizer formulas and explain the a≡1 versus d≡1 conjugation; separately locate the generalized-index and index results. For §3.5, Bruinier §1.4, Lemma 1.31 and Theorem 1.32, pp.15–16, is an accessible real-quadratic prototype; explicitly state the general-degree/nonparallel extension rather than citing it at that larger scope. Give exact supporting locators for §2.4's normalization and §5.6's nonprincipal Atkin–Lehner construction. If a primary text is unavailable, retain its exact locator with the appropriate source status. Test the Γ₁ adapter on diag(u,1): it satisfies the README's d-congruence, whereas Assaf's a-congruence requires u≡1. This is the remaining part of the preceding review's R04.

## R04 (P3) — Record the references in sources.toml

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:2428`, “## References”; missing `TauCetiRoadmap/HilbertModularForms/sources.toml`.

**Claim:** The references have no source manifest, so the cited versions, legal retrieval provenance and unresolved access statuses are not recorded with the roadmap.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml; sources.toml is absent. In particular the explicitly versioned Assaf and Dembélé–Voight preprints have no manifest entries.

**Exact repair:** Add the required v1 source manifest, one stable key per work, recording the versions actually read, locators, targets, legal retrieval metadata and access status. Keep source files outside the repository. Reuse the source keys below; do not treat a successfully downloaded reCAPTCHA page as verified text. This remains the preceding review's R05.

## Verified sound

The entire README (56 numbered subsections), all 50 Lean declarations, and the five previous findings were reviewed. The findings above comprise one P2 and three P3 findings. This section records successful checks and also identifies the negative controls that produced findings; it is not a claim that numerical examples prove the general theorems.

**Previous findings, checked first.**

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01, missing global central law | README:765: “Ψ(g zI) = η(z)⁻¹ \|z\|_𝔸^{k₀−2} Ψ(g)”; README:781–784 also specifies the normalized ideal action. | Repaired. At F=ℚ(√10), the displayed constant tuple has central eigenvalue 1, whereas the nontrivial class character demands −1. The new law rejects it. |
| R02, multiplicities after root powering | README:1938–1943: “push forward the multiset”; multiplicities are summed over the fibre. | Repaired. Squaring 1 and −1 sends two simple parameters to 1 with multiplicity 2: (1−T²) becomes (1−T)². |
| R03, norm height versus radius | README:873–878: “y=r^{1/n}u” and the density r⁻² dr. | Repaired. In degree two the logarithmic Jacobian is 1; replacing norm r by radius s produces 2s⁻³ ds, not s⁻² ds. |
| R04, omitted statements/locators/Checks | README:521–555 gives the nonsquarefree cusp sum; README:912 cites Bruinier Proposition 1.41; README:1703 names the completed functional-equation input. | Partly repaired. The cusp formula and new adapters are substantive; remaining locator omissions are R03 above. The CM character API and its three checks now appear in §9.3. |
| R05, missing sources manifest | README:2428–2468 retains the references; the directory still has no sources.toml. | Not repaired; R04 above. |

**Gate and elaboration.** The supplied gate for this exact head passes, including scanners, targeted build, dependency direction, outside-folder changes and stray files. The outside-folder diff against origin/main is empty. Independently running the prescribed dependency check produced:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. All dependency lines and supplier citations were read. Direct elaboration of Suggested.lean succeeded with only its 12 sorry warnings. The scratch #check file for all 50 declarations also elaborated successfully. Comparing those types with the README found no lost required standing hypothesis: the 24 binder-loss warnings concern definitions whose underlying types legitimately need fewer assumptions, while embeddings/slashes retain total reality, and the theorems needing degree >1 or nonzero level retain those explicit hypotheses. The Fourier expansion theorem does not need Koecher's degree restriction because it sums over the whole dual lattice.

One-tactic `simp` probes failed to close all 12 sorried targets. The additional `exact` probe closed the tuple theorem, yielding R02. The other 11 statements were examined against their definitions and the pinned libraries; none was identified as a definition, a small-value Check or a direct single-library-lemma replacement. The proved action and linearity helpers are used to construct the retained real definitions.

**Headline coverage.** The statable headline signatures are Fourier expansion, Koecher support, nonparallel cuspidality, full-expansion injectivity, cusp-coefficient injectivity, the cusp Hecke bound, component cusp and modular finite dimensionality, negative-weight vanishing, and the two absolute-convergence theorems. All 11 are present; the extra tuple consequence is R02. The module docstring explicitly names the unavailable carriers for the cusp–Eisenstein decomposition, classical–adelic comparison, newform decomposition and coefficient-field rationality, completed functional equation/card, twists, CM induction, base change, Doi–Naganuma and Jacquet–Langlands. It also records the finite-nebentypus comparison limitation. There are no replacement free predicates, sorry-defined data, set_option overrides or other-roadmap imports. The existing classical Newform carrier is over ℚ and cannot serve as the missing Hilbert newform carrier.

**Seeded source sample.** The six readable mathematical texts (assaf = arXiv:2301.10302v2; dembele-voight = arXiv:1010.5727v2; bruinier = arXiv:math/0609763v1; raghuram-tanabe = the June 20, 2011 author version; flhs = arXiv:1310.7088v4; zagier = the author copy of the 1975 paper) were fetched through the sources service from arXiv or author pages. Their line references below identify the retrieved version, not an inferred locator in a different edition.

| Sampled target | Text opened and scope comparison |
| --- | --- |
| 1.1 lattices/stabilizers | assaf lines 89–124, §2.1, p.3: R⊕b, the matrix entries and positive-unit determinant. Supports the stabilizer convention; it does not itself locate the generalized-index API. R03. |
| 1.2 congruence groups | assaf lines 92–139, equations (2.1.4)–(2.1.10), p.3. Full-level and Γ₀ agree. Γ₁ requires the diagonal-convention adapter described in R03. |
| 2.4 normalized coefficients | dembele-voight lines 2101–2115, Example 7.26, p.42, and raghuram-tanabe §4.1.1, pp.26–27, were compared with the trace dual. The former contains different/index slips listed below; Shimura's precise general formula could not be inspected. This is partial verification, not certification from that misprinted formula. |
| 2.7 finite nebentypus/nonparallel extension | raghuram-tanabe lines 1395–1504 and 1630–1654, §§4.1.1 and 4.1.5, pp.26–29, distinguish finite level character and its global extensions. The explicit global inverse central law in the roadmap passes the class-character counterexample. The supplier F.5 is the parallel specialization, not a source of the new nonparallel extension. |
| 3.1 Siegel sets | bruinier §1.2.1 and Theorem 1.18, p.9 (lines 344–399), give a real-quadratic covering prototype; AdelicAlgebraicGroups §3.4 supplies the general cover and intersection results. The unbalanced domains in Bruinier Proposition 1.16 do not have its claimed finite-intersection property (see Source issues); the roadmap instead retains its logarithmic-unit window and uses the generic supplier. Freitag's general-degree text was unavailable. |
| 3.5 finite dimensionality | bruinier lines 603–678, §1.4, Lemma 1.31 and Theorem 1.32, pp.14–16, prove the parallel, real-quadratic prototype. The roadmap's polydisc/compactness extension is larger and lacks a claim-level locator; R03. |
| 5.2 T, S and central action | dembele-voight lines 1850–1918, (7.10)–(7.14), pp.37–39, and 2031–2050, p.41, were read with the inverse finite action. The roadmap's additional representative norm factors are an adapter, not a literal quotation of these formulas. Principal scalar and nonprincipal character tests appear below. |
| 5.6 Fricke/Atkin–Lehner | The displayed matrices, square and normalization were multiplied directly, including a nonprincipal exact divisor. The nonprincipal construction's literature locator is not supplied; Garrett could not be read. No full source certification is claimed. |
| 6.1 double-coset components | dembele-voight lines 1955–1959 and 1989–1997, reduced norm and (7.19), pp.39–40, give narrow classes and component stabilizers. The roadmap uses b=a⁻¹. AdelicAlgebraicGroups §4.2 supplies the split norm-one strong approximation. |
| 6.3 Hecke compatibility | dembele-voight lines 1912–1918 and 2031–2050, pp.38–41, fix right finite action and its inverse classical matrix. The norm rescaling was checked separately. GL2AutomorphicRepresentationsAndTransfer R16.4.4 retains both T and S coordinates. |
| 7.2 new subspace/newforms | raghuram-tanabe §4.1.3 and §4.1.4, lines 1580–1616, pp.28–29, give primitive forms and the normalized eigenform characterization. The roadmap additionally names its local Casselman supplier for exact-level newvectors. |
| 7.5 coefficient field/Galois action | raghuram-tanabe §§4.1.3–4.1.5 and dembele-voight Example 6.6, lines 1426–1438, p.29, supply primitive terminology and the quadratic-field example. AutomorphicBundles §§11.18, 12.17–12.19 were opened with their field-base-change/tame-expansion hypotheses. Shimura's full rationality text was unavailable; the roadmap separately owns the nonparallel integral-lattice argument rather than attributing it to field base change. |
| 10.2 definite quaternion dictionary | dembele-voight Theorem 3.9, lines 570–607, p.11, is the weight-two D-new theorem; GL2AutomorphicRepresentationsAndTransfer R17.3.1/.3/.5/.9 supplies the larger weight and character scope. The character mismatch in its final local-eigenvalue clause is R01. |
| 10.3 Brandt traces | dembele-voight Example 8.1, lines 2190–2235, p.44: norm-4 and norm-13 matrices and their two norm-character constituents. The subtraction is 0−(5−5)=0 and 36−28=8. |
| 11.3 elliptic interface | flhs lines 66–88, Theorem 1, printed p.2, proves modularity over every real quadratic field and explains the matching rational weight-two form. The roadmap preserves explicit modularity/full-local-factor premises in other degrees; potential modularity is not substituted for base-field modularity. |

Additional source checks: assaf Lemma 3.1.8, Corollaries 3.1.18 and 3.1.23, pp.6–7 (lines 260–344), justify the repaired cusp quotient/count after dividing the global sum by h⁺. Bruinier Proposition 1.25, p.12 (lines 505–520), and Proposition 1.41, pp.21–22 (lines 922–941), have exactly the real-quadratic/parallel restrictions declared in the new adapter. Raghuram–Tanabe §4.4.1 and Theorem 4.16, pp.34–35 (lines 2005–2069), give the gamma arguments and unitary shift. Zagier §5, equations (95a)–(95c) and Theorem 5, pp.32–33 (lines 1191–1248), retain prime discriminant/class-number-one hypotheses for that prototype; they do not justify silently restricting the general base-change target to those fields. Its Appendix 1 is specifically the weight-two treatment.

**Pinned declarations opened.** These are file names relative to the pinned library repositories.

| Pin/file and line | Declaration/content checked; limitation retained |
| --- | --- |
| Mathlib/Analysis/Fourier/AddCircleMulti.lean:286, :320, :329 | UnitAddTorus.hasSum_mFourier_series_L2 and the uniform/pointwise summable-coefficient versions. L² convergence alone does not supply the roadmap's pointwise holomorphic expansion. |
| Mathlib/Analysis/Complex/LocallyUniformLimit.lean:45, :49 | Complex.cderiv_eq_deriv and norm_cderiv_le: open domain, positive radius, contained closed disk, completeness and boundary bound. |
| Mathlib/MeasureTheory/Function/L2Space.lean:136 | MeasureTheory.L2.inner_def uses the conjugate-first complex inner product. |
| Mathlib/RingTheory/Finiteness/Basic.lean:274 | Module.Finite.pi; finite index type and finite component modules. The successful one-tactic probe uses exactly this instance. |
| TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71, :168 | IsTotallyPositive quantifies over real places; it is vacuous for totally complex fields. totallyPositiveIntegerUnits is a subgroup of actual integer units. The analytic signatures retain IsTotallyReal. |
| TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83, :98, :106, :366 | Quotient by positive principal ideals, mk, surjectivity, and the positive-generator equality criterion. This is not the ordinary class group. |
| TauCeti/NumberTheory/NumberField/Global/RayClass/Narrow/Basic.lean:134 | narrowEquivNarrowClassGroup is a multiplicative equivalence, not a definitional identification. |
| TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:101 | normCoeff sums over nonzero ideals of a fixed norm; its coefficient at zero is structurally zero. It does not preserve absolute coefficient sums by equality. |
| TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158 | exists_differentiableOn_eq_dedekindZeta_sub gives the holomorphic remainder on Re(s)>1−1/n, with its equality initially on Re(s)>1. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120, :270 | idealCharacter is defined on ideals prime to the conductor; the principal-generator formula is the inverse embedding monomial and retains congruence/positivity hypotheses. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60 | IsAlgebraic constrains the infinity type on the identity component, not arbitrary sign parities. |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84, :104, :134 | Classical EigenformAwayFromLevel, Newform, dirichletLift. Newform requires nonzero level, newness and first coefficient 1; all-index eigenproperties are theorems rather than defining fields. |
| TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48 | TauCeti.CoefficientField is the intermediate field generated by positive Fourier coefficients of a classical newform. |
| TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91 | Newform.satakeParameters is a root multiset; its natural-number argument has arithmetic meaning only at primes. |
| TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72 | HasLMFDBIntrinsicLabel records degree, real-place count and absolute discriminant; it does not supply the database's ordering index. |

**Ownership and supplier resolution.** Object searches used the roadmap index/grep/show commands, main, the pinned libraries, the board packages and the supplied sibling checkouts. The candidate-order checker places the consumed new suppliers before this roadmap. No fully qualified declaration collision was found for the 50 declarations. The resolver's ten leads are not missing suppliers: Weight.IsParallel is generated in this module, and the other nine strings are LMFDB knowl/database identifiers rather than Lean declarations.

The following substantive supplier citations were resolved by opening the named sections, not by recognizing their names:

- NoncommutativeAndEquivariantIwasawa §F.5, README:2519: parallel k≥2 analytic carriers, all cusps, two distinct integral lattices, constants, normalized ideal coefficients and good/bad Hecke actions. Here the new content is the nonparallel/low-weight extension and its normalization comparisons.
- GL2AutomorphicRepresentationsAndTransfer R16.1.6, README:596; R16.3.6:966; R16.4.3–.5:1051–1128; R16.5.4:1212; R17.3.1/.3/.5/.9:1578–1659; R17.4.1/.3/.4/.5/.8/.16:1754–2127. These provide the fixed-central-character adelic carrier, local factors, multiplicity one, the two-coordinate Hecke interface, functional equation, JL, base change and induction. Arithmetic T at weight k is compared with the unitary trace after division by q^((k₀−1)/2), not with an unscaled unitary eigenvalue.
- AutomorphicLFunctionsAndLocalFactors AL.2.2, README:1640–1707: last-row K₁, conductor minimum, Casselman dimension and Whittaker normalization. At level r and conductor c, the dimension is r−c+1 when r≥c, not always one.
- AdelicAlgebraicGroups §3.4, README:3173–3185, and §4.2:4177: Siegel covers/intersection property and strong approximation. The application is the split D=M₂(F) norm-one group, not strong approximation for GL₁.
- AutomorphicBundles §§11.9, 11.18, 12.17, 12.18, 12.19, README:4055, 4358, 5179, 5229, 5263: geometric/analytic comparison, characteristic-zero rational structure, field base change and Hilbert expansions. Prime-to-p hypotheses and the distinction between all-cusp and standard-component lattices were retained; no arbitrary integral lattice is inferred merely from field base change.
- AutomorphicGaloisRepresentations §§3.10, 3.15, 3.16, README:1646, 1861, 1888: regular Hilbert representations, CM induction and virtual reducibility. Its geometric-Frobenius/dual convention is distinguished from arithmetic coefficient values.
- HilbertModularVarietiesAndShimuraCurves H1.10, H3.6, H3.8, H5.2, README:525, 864, 890, 1307: moduli comparison, positive-unit quotient, Hecke component movement and tame real-quadratic cusp schemes. These do not supply an unrestricted all-prime integral geometric model.
- QuaternionicModularForms §§0.1, 0.3, 1.3, 2.1, 3.1, README:190, 267, 440, 492, 792: quaternionic/class-set carriers, coefficient convention and Hecke action. §10.3 uses their matrices and adds the Hilbert trace comparison; it does not construct Brandt matrices again.
- LFunctions Layer 0, README:385–399, supplies ArithmeticLFunctionData and NormalizationTranslation, including the forced conductor scalar. PotentialModularityAndCompatibleSystems §5.1, README:1316, is explicitly conditional potential modularity of a given lift, not unconditional modularity of an elliptic curve over its base field.
- The foundational GlobalNumberFields, ModularForms, completed NumberFieldArithmetic and ArithmeticDirichletSeries contracts were checked against their roadmap/pinned objects; the retained Hilbert definitions do not replace their ideal, character, class-group, classical-newform or Dirichlet-series carriers.

The main examples used for shape were ModularForms and completed ArithmeticDirichletSeries. Open ownership was checked, including BianchiModularForms (imaginary quadratic), QuaternionArithmetic (orders/arithmetic Brandt data), HilbertModularVarietiesAndShimuraCurvesPartII (mod-p cohomology/patching), and HilbertModularSurfaces. The last currently also claims degree-two groups/Koecher in §§0.3–0.5 and calls HilbertModularForms a consumer at README:1803. That proposed reverse supply was not accepted here: the general analytic/group owner in this earlier folder supplies the degree-two specialization, while surfaces owns its geometric comparison. This is an overlap in the sibling's scope, not an upward input used by the reviewed head. The broader general-weight target should remain here; importing the later surface construction would create the wrong supply direction. ShimuraCompactifications §§8.1–8.5 concern its unit/Fourier-support machinery in the compactification setting; the present analytic theorem includes the required analytic growth argument. Board hits on automorphic bundles, overconvergent forms, Jacquet–Langlands Hodge classes and patching concern geometric, p-adic or cohomological extensions, not an alternative native analytic Hilbert newform carrier.

**Computed adversarial table (92 rows).** Rows distinguish identities, definitions, negative controls and the headline signatures. “Retain” means the computation supports the stated convention, not a proof of the universal target. Fields are number fields, so zero rings, positive/equal characteristic and inseparable base fields are outside these carriers; zero functions, unit/zero levels, scalar kernels, rank-one boundary cases, bad primes and norm-group distinctions are tested explicitly. S₃ appears in the nonabelian witness for R01.

| Statement/object | Instances tried | Values on both sides / discriminating computation | Result; change |
| --- | --- | --- | --- |
| 0.1 product domain and GL₂ action | Two real places; I, T=(1,1;0,1), S=(0,−1;1,0) | I(i,i)=(i,i); T(i,i)=(1+i,1+i); S(2i,2i)=(i/2,i/2). | Retain; rules out the trivial action. |
| 0.1 action order | T,S above at i | TS(i)=1+i; ST(i)=(−1+i)/2, unequal. | Retain left matrix action. |
| 0.1 positive determinant and scalar kernel | diag(−1,1), −I, 2I | determinants −1,1,4; first excluded, last two fix every z. | Retain positivity and projectivization. |
| 0.2 holomorphy | f=1, z₁, conjugate(z₁) | complex derivatives 0,1; conjugate difference quotients along real/imaginary axes 1,−1. | First two admitted, third rejected. |
| 0.3 Weight/top/m | k=(2,4), (2,3), (−2,−2) | top=4,m=(1,0); parity difference −1 rejects (2,3); negative parallel top=−2,m=(0,0). | No natural-subtraction truncation. |
| 0.3 slash cocycle | Weight 2; S twice at z=i; scalar 2I at quadratic weight 4 | S²=−I, slash factor 1; scalar factor N(2)²=4²=16. | Retain arithmetic exponent. |
| 0.4 unitary adapter | Quadratic weight 4, γ=2I | Arithmetic factor 16; unitary factor 1; N(det γ)^((4−2)/2)=16. | Ratio 16, not 1/16. |
| 1.1 lattice and generalized index | F=ℚ(√5), b=O,c=2O, γ=I | ℤ-rank 4; determinant ideal 2O; additive index N(2O)=4. Nonprincipal b has determinant b≠O in Pic. | Retain projective rank two, not free over O. |
| 1.1 stabilizer | diag(2,1), diag(u,1) for positive unit u | determinants 2 (nonunit) and u (unit); first sends O² into a proper sublattice, second preserves it. | Retain determinant-unit condition. |
| 1.2 subgroup inclusions/sections | Level 1; level 2; upper/lower elementary matrices | At 1 all congruences vanish. At 2, upper translation 1 belongs to Γ₀ but not Γ(2); lower entry 1 fails Γ₀(2). det diag(u,1)=u. | Retain; R03 locates convention. |
| 1.2 index | Residue cardinality q=4, levels p and p² | 4(1+1/4)=5; 16(1+1/4)=20. | Retain arbitrary prime-power level. |
| 1.3 conjugation | b=O, α=2, γ=diag(1,2) | γ(O⊕O)=O⊕2O; upper translation 1 becomes 1/2, lower entry 1 becomes 2. | Retain b versus b⁻¹ direction. |
| 1.4 cusp count | F=ℚ(√5), level 1, p=(2), p² | h=1; counts 1,2,1+1+1=3. For p² the positive unit image fills 𝔽₄×, so middle quotient is 1, not φ(p)=3. | Repaired nonsquarefree formula passes. |
| 1.5 representative transport | α=2, quadratic parallel k=2 | Nα=4; raw slash contributes 4, transport prefactor 1/4; product 1 on normalized ideal coefficients. | Retain norm factor. |
| 2.1 box mean/fourierCoeff | Constant 1 and two torus modes 1+2e(x₁) | Mean 1; coefficients at 0,e₁,2e₁ are 1,2,0. expTrace at x+i contributes e^(−2πTr μ); correction contributes e^(+2πTr μ). | Correct sign and normalization. |
| 2.1 full Fourier headline | f=0 and f=1, weight 0 | All-zero series sums to 0; only μ=0 contributes 1 for the constant. | Retain zero term and full dual lattice. |
| 2.1 trace dual | b=(2) over a quadratic field | Translation lattice (1/2)O; dual is 2d⁻¹. Pairing with (1/2)O has integral trace; replacing by (1/2)d⁻¹ need not. | Retain b d⁻¹. |
| 2.2 Koecher headline | μ=0; μ with mixed signs; contracting positive units | Constant coefficient may be 1 at μ=0. If σ₂μ<0 and σ₂ε>1, exp(−2πTr(με^r)) tends to ∞ while covariance has only exponential-in-r unit factors. | Nonzero bad support forced to 0; μ=0 excluded. |
| 2.3 form carrier/parity | f=1,k=0; norm-negative unit with odd parallel k | Slash of 1 at weight 0 is 1; signed scalar-unit law at odd k is −1, so f=−f forces 0. | Retain parity obstruction. |
| 2.3 degree-one negative control | F=ℚ, weight 0, modular j | j has q⁻¹ coefficient 1 and is holomorphic on ℍ; its powers give infinitely many independent invariant holomorphic functions. | Degree >1 is essential for growth-free finite dimensionality. |
| 2.4 normalized coefficients | k=(2,4), m=(1,0), generator με | Raw coefficient multiplier σ₁(ε)⁻¹; monomial multiplier σ₁(ε); product 1. | Unit independence; unnormalized model fails. |
| 2.4 fullExpansion_injective | Tuples 0 and constant 1 | Positive ideal coefficients both 0; standard constants 0 versus 1. | Full expansion distinguishes them; positives alone do not. |
| 2.5 nonparallel cusp headline | k=(2,4), positive unit ε with σ₁ε≠1 | Constant relation a₀=σ₁(ε)⁻¹a₀ forces a₀=0; parallel weight has multiplier 1. | Retain nonparallel hypothesis. |
| 2.6 cusp carrier/injectivity | f=0, constant 1, normalized cusp f | All cusp constants 0 for first and third; constant 1 has mean 1, not 0. A normalized cusp has c(O)=1, not the zero form's 0. | Cusp specialization excludes constant counterexample. |
| 2.7 global central law | F=ℚ(√10), k=0, η(p)=−1 | Local finite-unit laws allow constant tuple; global p-central action is 1 versus required −1. | Previous R01 repaired. |
| 2.7 inverse ideal convention | η(p)=i | Ψ right-central factor i⁻¹=−i; using inverse finite translation returns (−i)⁻¹=i. | Correct central eigenvalue, not −i. |
| 3.1 Siegel/projective action | Scalar positive unit ε in ℚ(√3) | εI fixes z, giving infinitely many GL₂ stabilizers; projective image is identity 1. | Finite-intersection statement must be projective, as now written. |
| 3.1 unbalanced source-domain control | F=ℚ(√5), ε=(3+√5)/2, γ_r=diag(ε^r,ε^(−r)), r≥1 | In Bruinier’s S₂, z=(iε^(2r),iε^(2r)) and γ_r z=(iε^(4r),i) both occur; infinitely many distinct projective γ_r meet S₂. A bounded log-ratio window excludes r→∞. | Retain the roadmap’s unit window; source error below. |
| 3.1 logarithmic coordinates | n=2, y=(2,8) | r=16, u=(1/2,2), product u=1; common radial coordinate √r=4. | Retain norm height versus radius. |
| 3.2 volume | n=2, log y=(log r/2+v,log r/2−v) | Absolute log-Jacobian 1; density r⁻². At s=3 with r=s²: 2s⁻³=2/27 versus wrong s⁻²=1/9; ∫₂∞r⁻²dr=1/2. | Previous R03 repaired. |
| 3.3 nonparallel Hecke bound | k=(2,4), σμ=(2,3) | Raw weight product 2¹·3²=18; multiply μ^m=2 gives 36; Nμ^(k₀/2)=6²=36. | Adapter exponents agree. |
| 3.3 coefficient-extraction sign | y_j=1/σ_jμ, n=2 | exp(+2πTr μy)=e^(4π); inverse sign gives e^(−4π). | Roadmap corrects source's sign slip. |
| 3.3 exists_norm_coeff_le headline | f=0; normalized weight-two cusp, ideal O | Zero form allows C=0: 0≤0. At O, 1≤C·1 forces C≥1. | Bound does not claim uniformity in f. |
| 3.4 Petersson convention | ⟨f,f⟩=1; multiply first/second variable by i | ⟨if,f⟩=−i; ⟨f,if⟩=i; ⟨if,if⟩=1. | Matches pinned conjugate-first inner product. |
| 3.4 scalar slash norm | Quadratic k=4, scalar 2I | Slash scalar 16; squared norm changes by 256=16². | Arithmetic slash is not unitary off unit determinants. |
| 3.5 cusp/modular finite-dimensional headlines | Nonzero level, k=0; finite index set of components | Cusp constants force dim S₀=0; component constants give dim M₀=1; h⁺ components give dim h⁺, not 1. | Component theorem retained; tuple consequence R02. |
| 3.5 negative-weight headline | k=(−2,−2), nonzero level; zero level control | Nonzero level permits lower unipotent and rejects constant 1. At zero level only upper triangular elements remain; 1 is invariant. | Explicit nonzero-level binder prevents counterexample. |
| 3.5 compactness model | Infinite orthonormal sequence | Pairwise norm distance √2, hence no Cauchy subsequence; zero-dimensional ball has diameter 0. | Compactness, not mere boundedness, is needed. |
| 4.1 Eisenstein construction | Nonzero cusp seed, even k; zero seed | Stabilizer factor at −I is (−1)^(nk)=1 for even k; zero seed gives identically zero series. | Retain specified nonzero seed/constant normalization. |
| 4.2 Hecke trick | n=1 and n=2 pole factor | s^n·ρ/(2s): for n=1 gives ρ/2; for n=2 gives ρs/2→0. | Degree distinction preserved; no classical E₂ anomaly imported. |
| 4.3 decomposition | One normalized Eisenstein and one cusp vector | Constant map sends E↦1, f↦0; S∩E has only coefficient 0. | Cusp and Eisenstein summands separated. |
| 4.3 worked constants | F=ℚ(√5), weight 2 | Inverse constant 120; divisor factors at norms 4,5,9 are 5,6,10, giving 600,720,1200. Rescaled constant 5/3 gives 200. | Arithmetic normalizations retained. |
| 5.1 double cosets | q=4, good versus Iwahori level | Good p has q+1=5 cosets; bad p has q=4; good p² has 1+q+q²=21. | No good-primes-only replacement. |
| 5.2 central normalization | Principal a=2, quadratic k=4 | Raw S_(2) scalar N(2)²=16; normalized action 16/16=1. | Narrow principal class acts trivially. |
| 5.2 nontrivial central action | Narrow character value −1 | S_p eigenvalue −Np^(k₀−2); normalized action −1, not +1. | Both Hecke coordinates needed. |
| 5.3 relations | q=4,k=2,a_p=−3,ψ=1 | c(p²)=9−4=5; c(p³)=−15+12=−3. | Correct q^(k−1) recurrence. |
| 5.4 bad coefficient formula | a_p=−1 at a conductor-one prime | c(p²)=1, c(p³)=−1; adding a good-prime term would instead give 1−q. | Bad operator differs as required. |
| 5.5 adjoints | ψ(p)=i | ψ(p)⁻¹=−i; conjugate scalar matches adjoint. With ψ=1 the adjoint scalar is 1. | No unconditional self-adjointness claim. |
| 5.6 W square | Exact q norm 4,k=4 | Raw square scalar 4²=16; normalization factor squared 4^(−2)=1/16; product 1 on ψ=1. | Correct involution normalization. |
| 5.6 nonprincipal component transport | F=ℚ(√10), nonprincipal ideal squared principal | Successive representative factors 1/2 and 2 multiply to 1, whereas deleting either leaves 2 or 1/2. | Matrix square must retain transports. |
| 6.1 components | F=ℚ(√6) | Ordinary class number 1, narrow class number 2; determinant quotient has two components. | Ordinary class quotient is rejected. |
| 6.2 adelization inverse | Quadratic k=4 and finite scalar 2 | Inverse classical scalar contributes 1/16; direct scalar would contribute 16. | Retain inverse right-finite convention. |
| 6.3 unitary Hecke scaling | q=4,k₀=4 | Arithmetic trace a becomes a/8; determinant factor q³=64 becomes 1 after unitary normalization. | T and S normalization agrees with supplier. |
| 6.4 multiplicity one | Two parameters with trace 0, determinants 1 and −1 | Polynomials X²+1 and X²−1 differ despite equal trace. | Full good eigensystem, not bare trace, compared. |
| 7.1 old operators | Normalized g and V_p g | c(O,g)=1, c(O,V_pg)=0; c(p,g+tV_pg)=a_p+t. | Normalization alone does not characterize newness. |
| 7.2 newform definition | f,2f,0 with c(O,f)=1 | First coefficients 1,2,0. Only f meets normalization; 0 also fails nonzeroness. | Definition discriminates scalar multiples. |
| 7.2 newvector dimensions | Local conductor c, levels c−1,c,c+1 | Dimensions 0,1,2 by supplied Casselman formula. | The new line is only the minimal-level line. |
| 7.3 old/new decomposition | Relative level 1 and a prime p | Number of old degeneracy copies τ(1)=1, τ(p)=2. | No assertion that every normalized old vector is a newform. |
| 7.4 all Hecke eigenproperties | Unit ideal and p² in the q=4 example | T₁f=f and c(1)=1; T_(p²)f=(9−4)f=5f. | Good normalization determines scalar formulas. |
| 7.5 coefficient field/orbit | t²=3, t↦−t | Field degree 2; two conjugate eigensystems; minpoly(−2t)=X²−12. | Distinguishes orbit dimension from one complex eigenline. |
| 7.5 nonparallel Galois action | Embedding swap, k=(2,4) | Weight becomes (4,2); it is not fixed (2,4). | Retain transported weight and coefficients. |
| 7.6 local bad cases | k₀=4,q=4,ψ=1 | At v(n)=1: c=±4, c²=16=q². At v(n)≥2: c=0. | Central unramified hypothesis retained. |
| 7.7 signs | Weight 2,a_p=−1; level one | ε_p=−a_p=1; level-one sign list has length 0. | Trivial-character sign convention agrees. |
| 7.7 general character | χ(p)=ζ₃,ψ=χ²,k=2 | c=ζ₃, λ=−ζ₃, λ²=ζ₃²; λ is neither 1 nor −1. | General pseudo-eigenvalue retained; propagate to §10.2 (R01). |
| 8.1 Euler product | a_p=−3,q=4,k=2 | Denominator 1+3T+4T²; inverse coefficients 1,−3,5. | Agrees with §5.3. |
| 8.1 norm regrouping | Two ideals of norm 11 with coefficients 4,−4 | normCoeff(11)=0, while sum of absolute values=8. | Triangle inequality, not equality of absolute sums. |
| 8.1 general convergence headline | k₀=4,s=6 | General threshold k₀+1=5<6; norm exponent 4−6=−2. | Nonempty convergence range. |
| 8.1 cusp convergence headline | k₀=4,s=4 | Cusp threshold k₀/2+1=3<4; exponent 2−4=−2. | Stronger range, using cusp hypothesis. |
| 8.2 Mellin and gamma factors | Weight 2; k=(2,4) | ∫₀∞e^(−2πy)dy=1/(2π); nonparallel gamma arguments s−1,s. | 2π and shifts agree. |
| 8.2 root sign | k=(2,4) versus (4,4), no finite sign | i⁶=−1; i⁸=1. | Sum of weights matters. |
| 8.3 analytic card scalar | n=2,k=2,conductor 775 | Degree 4, two gamma shifts 1/2; conversion scalar 2²·775^(−1/4)=4·775^(−1/4). | Retain gamma factor 2 and conductor scalar. |
| 8.3 analytic rank | Local analytic functions t and t² at centre | Vanishing orders 1 and 2, not merely the common value 0. | Order-of-vanishing definition discriminates multiplicity. |
| 9.1 twisting | χ(p)=−1 and ζ₃ | Trace a becomes −a or ζ₃a; determinant unchanged or multiplied by ζ₃². | Character squares cannot be omitted. |
| 9.2 CM/self-twist | χ(p)=−1, coefficient 4; coefficient 0 | Self-twist requires 4=−4 (false); 0=−0 (true). | Inert vanishing is necessary, finitely many tests not sufficient. |
| 9.3 algebraic CM induction | Values −1±2i above 5 | Sum −2, product 5; reciprocal values sum −2/5 and product 1/5. | Inverse-character convention is detectable. |
| 9.3 inert induced matrix | Matrix (0,1;−9,0) | Trace 0, determinant 9; omitting coset sign would give −9. | Quadratic factor retained. |
| 9.4 root-power operation | 1−3T+2T²=(1−T)(1−2T), r=2 | Parameters 1,2 become 1,4; polynomial 1−5T+4T². | Correct reciprocal-parameter convention. |
| 9.4 collisions | 1−T², r=2 | Roots/parameters 1,−1 both map to 1; output (1−T)², multiplicity 2=1+1. | Previous R02 repaired. |
| 9.4 composition | Parameters 1,2; r=2 then 3 | 1,4 then 1,64; direct r=6 also 1,64. | Tower law holds in test. |
| 9.5 cyclic base change | Rank 2, cyclic degrees 2 and 3 | Exceptional rank 2/2=1 exists; 2/3 is not an integer. | Retain quadratic cuspidality exception. |
| 9.5 inert trace | Roots α+β=b, αβ=1 at q=2 with χ(q)=−1 adjusted determinant −2 | α²+β²=b²+4; b²=−5 gives −1. | Correct plus sign for quadratic nebentypus. |
| 9.6 Doi–Naganuma prototype | D=29, ramified a=−3+2√−5 | a+conj(a)=−6; a·conj(a)=29. | Ramified trace and norm agree with (95c). |
| 9.6 kernel pairing | Conjugate-first pairing, input ig | ⟨K,ig⟩=i⟨K,g⟩, whereas ⟨ig,K⟩=−i⟨g,K⟩. | Linear lift uses correct pairing order. |
| 10.1 partial newspace | D=1, D=rad(n), n=1 | Empty intersection gives full cusp space; all level-prime restrictions give full newspace; at n=1 oldspace=0. | Boundary cases consistent. |
| 10.2 definite parity | n=2,D=1; n=3,D=1; n=3,ω(D)=1 | Ramification counts 2,3,4; allowed, forbidden, allowed. | Parity condition retained. |
| 10.2 global character witness | Cubic x³−4x−1, F=ℚ(√229), p above 11 | Disc=229; cubic mod 11 has values 10,7,10,3,3,5,4,6,6,10,2 (no 0). E has Δ=−161051=−11⁵, c₄=496, #E(𝔽₁₁)=11, so a₁₁=1; twist gives ζ₃ versus alleged sign ±1. | R01; λ formulation gives ζ₃ exactly. |
| 10.3 trace subtraction | Dembélé–Voight Example 8.1 | Norm 4: 0−(5−5)=0. Norm 13: (6+12+8+10)−(14+14)=8=4+4. | Full norm-character subspace, not only constants. |
| 11.1 invariants | Field discriminant 5, level norm 31, coefficient field ℚ(√3) | Field bad rational primes {5}; level bad rational primes {31}; orbit degree 2. | Field and level ramification kept separate. |
| 11.2 labels | Field ℚ(√5), levels norm 31 and 81 | Intrinsic field prefix (2,2,5); level norms 31≠81; orbit letters not determined by these numbers. | No canonical ordering invented. |
| 11.3 elliptic matching | q=9 and #E(𝔽₉)=8 | Trace 9+1−8=2; good polynomial 1−2T+9T², determinant 9. | Arithmetic Frobenius convention matches weight 2. |
| 11.3 bad local interface | Split/nonsplit multiplicative and additive reduction | Local polynomials 1−T,1+T,1 respectively; traces 1,−1,0. | Good-prime agreement alone is not full local-factor equality. |
| 11.3 modularity scope | Real quadratic F; arbitrary higher degree with potential extension | FLHS yields a base-field form in degree 2. A form only over F′ has domain F′, not F. | Explicit base-field modularity input preserved. |

## Not verifiable

These limitations are source-access limitations, not assertions that the mathematical statements are false. All other checks were completed without parking the review.

- **freitag**, *Hilbert Modular Forms*, Chapter I: the sources service hit arXiv rate limiting and a paywalled Springer DOI prefix. Exact general-degree Siegel/finite-dimensionality locators were not certified.
- **van-der-geer**, *Hilbert Modular Surfaces*, Chapters I and VI: no readable text obtained; resolver rate limit. The cited weight-two/Eisenstein and lift passages were not inspected.
- **garrett**, *Holomorphic Hilbert Modular Forms*, Chapters 1–2: no readable text obtained; resolver rate limit. The full lattice-Hecke/Atkin–Lehner passages remain uncertified.
- **shimura1978**, DOI 10.1215/S0012-7094-78-04529-5, §§2,4: Project Euclid's landing page yielded no PDF. General normalized coefficients and rationality were not certified against this text.
- **shimura1971**, *Introduction to the Arithmetic Theory of Automorphic Functions*, Theorem 3.24/§3.3: the resolver returned a JSTOR book-review landing page, not the book. It is not evidence for the stated theorem.
- **miyake**, §§4.5–4.6, and **diamond-shurman**, Proposition 5.8.5: resolver rate limits/no readable legal text.
- **atkin-li**, twisting theorem, and **iwaniec-kowalski**, equation (5.7): supplementary route references could not be read; arXiv/Crossref rate limits and an AMS landing page without usable text. Their content was not guessed.
- **doi-naganuma**, *On the functional equation of certain Dirichlet series*: the service classified the publisher citation as paywalled/uncertified. It is not an outstanding request. Zagier's accessible text was checked separately.
- The LMFDB URLs for **lmfdb-mf.hilbert.weight_vector**, **lmfdb-mf.hilbert.label**, **lmfdb-mf.cm**, **lmfdb-mf.base_change**, **lmfdb-nf.narrow_class_group**, **lmfdb-dq.mf.hilbert.reliability** and **lmfdb-rcs.cande.mf.hilbert** returned reCAPTCHA interstitials. No challenge was bypassed. Their downloaded pages contain no mathematical knowl text. The six other requested knowls and three GitHub source files were readable; the latter confirm stored field names, not truth or completeness of database flags.
- The mutable LMFDB flags/records for every worked form were not independently queried as database records. Dembélé–Voight's printed examples support the cited numerical examples, including Example 6.6's t²=3 eigenvalues; live database reliability claims require the inaccessible reliability knowl.

## Source issues

- **Misprint** in dembele-voight at §2 after (2.4), printed p.6 (line 288): the source says the slash-invariance condition is equivalent to (3.3); it should refer to (2.2); affects nothing.
- **Error** in dembele-voight at §2 after (2.5), printed p.6 (line 307): the source says n=νd⁻¹ with ν in d defines the Fourier coefficient; it should use n=νd with ν in d⁻¹; affects a stated result.
- **Error** in dembele-voight at §2 Hecke paragraph, printed p.6 (lines 310–311): the source says all ideal Hecke operators are diagonalizable on the full level space; it should restrict this assertion to good operators, since bad oldspace operators may have nilpotent blocks; affects a stated result.
- **Misprint** in dembele-voight at Example 6.6, printed p.29 (lines 1427–1431): the source says the complex cusp-space dimension is one despite a quadratic Hecke field; it should distinguish one Hecke orbit from its dimension two; affects a stated result.
- **Error** in dembele-voight at Example 7.26 Fourier expansion, printed p.42 (lines 2101–2105): the source says the exponent lattice is ad⁻¹ for translation lattice a; it should be a⁻¹d⁻¹; affects a stated result.
- **Error** in dembele-voight at Example 7.26 ideal coefficients, printed p.42 (lines 2112–2115): the source says n=νad⁻¹ with integral ν; it should use n=νad with ν in a⁻¹d⁻¹ and the corresponding narrow class; affects a stated result.
- **Misprint** in bruinier at Proposition 1.26 proof, printed p.13 (line 551), and Proposition 1.41 proof, printed p.21 (line 936): the source says coefficient extraction contributes exp(−2πTr(νy)); it should contribute exp(+2πTr(νy)); affects the proof.
- **Error** in lmfdb-mf.hilbert at defining group, web page 1 (line 95): the source says off-diagonal conditions and unit determinant define Γ₀; it should also require integral diagonal entries, excluding diag(2,1/2); affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at cusp description, web page 1 (lines 90–92): the source says cusps are indexed by the strict class group; it should distinguish connected components from level-dependent cusp orbits; affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at displayed expansion, web page 1 (line 93): the source says every Hilbert form expands over positive indices alone; it should include the constant term unless cuspidality is assumed; affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at eigenvalue identification, web page 1 (line 94): the source says an eigenform's coefficients are its eigenvalues; it should require first coefficient one, since scaling the eigenform changes coefficients but not eigenvalues; affects a stated result.
- **Gap** in lmfdb-mf.hilbert.hecke_orbit at orbit definition, web page 1 (line 90): the source says Hecke images span the orbit without specifying scalars; it should specify rational span, since a complex eigenline has dimension one; affects a stated result.
- **Error** in bruinier at Proposition 1.16, printed p.9 (lines 367–388): the source says its unbalanced Siegel domain has finitely many intersecting translates; it should impose a bounded logarithmic unit-ratio window, since positive diagonal units give infinitely many intersections; affects a stated result.
