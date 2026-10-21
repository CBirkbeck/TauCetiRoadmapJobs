<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/160#issuecomment-6318217595 -->
Red team round 1 pass a (codex) of 5c63c49

Verdict: needs_changes

1. **F01** (P1) The principal cohomological supplier is not an admissible supplied roadmap

   **Location:** packages/K2SymbolsBrauerPartII/README.md:64–70: “Consume §§1.1–1.6's finite twists”; “consume the low-degree branch of §12.1”.

   **Claim:** MotivicEtaleKTheory supplies finite/adic twists, the field comparison, residue diagrams, Galois symbols, all local/global/S-integer Tate theorems and finite étale Chern operations.

   **Witness:** MotivicEtaleKTheory is absent from merge-order/ORDER.txt, from both main-roadmap directories, and from the supplied sibling heads; there is no design/plan.json or matching gap declaration. The open-roadmap title search returned no MotivicEtaleKTheory supplier.

   **Exact repair text:** “The finite/adic twist constructions, the cup-compatible field étale/Galois dictionary, the degree-two symbol and residue diagrams, the Tate comparisons and finite étale Chern construction are prerequisites requiring an earlier named owner. They are not supplied by an admissible version of MotivicEtaleKTheory.” For the field symbol/isomorphism and its coefficient dictionary cite KTheoryFiniteLocalFields §3.0a and EtaleCohomologyFoundations F.0.3 for finite twists; for the finite-coefficient carriers and early Chern operations cite KTheoryFiniteLocalFields §§1.1, 1.8, retaining the stated degree-two even-coefficient restrictions. Replace every remaining purported import with an exact existing earlier target or an explicit, hypothesis-complete supplier gap recorded in both design/plan.json and Exact supplier contracts; prerequisites without an earlier owner must become targets here before their first use. Preserve the all-field, all-allowed-prime and real-place scope. Do not silently assume the advertised isomorphisms.

2. **F02** (P3) The base Matsumoto contract cites an owner that its current head removed

   **Location:** packages/K2SymbolsBrauerPartII/README.md:62: “using the Matsumoto presentation imported there from AlgebraicKTheory A5”.

   **Claim:** The base roadmap imports its classical field presentation from AlgebraicKTheory A5.

   **Witness:** TauCetiRoadmap/K2SymbolsBrauer/README.md:120–122, at a969ec1ec875183342902f729306793407cedf64, constructs that presentation in §0.4; lines 1221–1223 explicitly consume §0.4. GeneralAlgebraicKTheory excludes field symbol presentations.

   **Exact repair text:** Replace the quoted phrase with “using the classical field presentation constructed in K2SymbolsBrauer §0.4”. Include Layer 0 in the introduction's description of where the base roadmap starts; retain §§5.1–5.2 and 7.1–7.3 for the native presentation and its comparison.

3. **F03** (P3) Suggested.lean ends with a prohibited catalogue of undeclared names

   **Location:** packages/K2SymbolsBrauerPartII/Suggested.lean:57–81: “The remaining definitions and milestones are stated in README.md”.

   **Claim:** This comment block records the unstatable milestones by listing identifiers.

   **Witness:** Lines 60–77 are only identifier lists; none is a declaration. The brief expressly forbids catalogues of names and permits unavailable-carrier milestones to remain in README.md.

   **Exact repair text:** Delete lines 57–81. Retain the module docstring's statement that README.md is definitive and Suggested.lean is not exhaustive. Add genuinely statable milestones as declarations, as in R04 below, rather than as comments.

4. **F04** (P2) Missing easy conic/Hilbert headline at the actual pins

   **Location:** packages/K2SymbolsBrauerPartII/README.md:399 and packages/K2SymbolsBrauerPartII/Suggested.lean:33–45; README.md:58 excludes objects described as current-library-only.

   **Claim:** The conic/Hilbert comparison is a README target but is omitted from Lean on the claimed baseline-carrier distinction.

   **Witness:** At Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46 defines hilbertSymbol : Fˣ → Fˣ → ℤˣ; lines 56–59 state exactly its norm-equation criterion. Every carrier of the conic bridge exists.

   **Exact repair text:** Import TauCeti.NumberTheory.HilbertSymbol.Basic and add the named field-generic target below, with a mathematical docstring and sorry proof. Add its exact name and scope to §3.4 and use its local specialization there. Replace the obsolete baseline/current split by the actual lake-manifest.json pins.

   ```lean
   theorem conicSymbol_eq_hilbertSymbol {F : Type*} [Field F]
       (h2 : (2 : F) ≠ 0) (r s : Fˣ) :
       conicSymbol F (r : F) (s : F) = TauCeti.hilbertSymbol r s := by
     sorry
   ```

5. **F05** (P2) Local K₂ factorization and splitting duplicate an earlier owner

   **Location:** packages/K2SymbolsBrauerPartII/README.md:326–359 and :659: “KTheoryFiniteLocalFields uses N_{F,m}, its full-root section”.

   **Claim:** This package owns the norm-residue homomorphism and full-root splitting and supplies them to KTheoryFiniteLocalFields.

   **Witness:** TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:476–482 at fb3a9c0be1f750f85762a27dad74fde5a219bb94 constructs normResidueMap and all exponent projections; §3.3 owns split surjectivity. KTheoryFiniteLocalFields is an explicitly allowed earlier supplier in the supplied merge order.

   **Exact repair text:** “KTheoryFiniteLocalFields §§3.1–3.3 supplies normResidueMap, its coefficient projections and full-root splitting. For w=#μ(F), our N_{F,m}(x) is normResidueMap(x) raised to w/m, since m divides w, transported through K2SymbolsBrauer's specified classical/Milnor comparison. This is the coefficient power map, not the primary-component projection. We prove the equality of these specified maps and their Brauer/conic dictionaries.” Replace the new constructions and split-surjectivity milestone by this transport contract, and remove the assertion that the earlier roadmap consumes them from this package. Keep the full-root exact-order argument as a Check of the supplied section.

6. **F06** (P2) The finite-coefficient exact sequence is already a named earlier target

   **Location:** packages/K2SymbolsBrauerPartII/README.md:593–604: “Prove finiteK2_bockstein_exact and finiteK2_integralReduction_image”.

   **Claim:** Layer 5 owns the finite-coefficient short exact sequence, its boundary kernel, coefficient naturality and CRT.

   **Witness:** TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:197–205 supplies coeff, coeffGroup, reduce, bockstein, coeff_exact, all-degree short exactness, coefficient maps and CRT for every ring. The package's statement is its field/degree-two specialization.

   **Exact repair text:** “Consume KTheoryFiniteLocalFields §1.1's coeff_exact at n=2, with its actual reduce and bockstein maps and coefficient/CRT diagrams. Its exactness identifies the integral-reduction image with the Bockstein kernel. Layer 5.5 uses this supplied image; no new finite-coefficient exactness theorem is planned here.” Move §5.4 into the supplier contract and retain its examples as explanations of the existing distinction between finite coefficients and quotients.

7. **F07** (P2) The scalar invariant comparison is already owned on main

   **Location:** packages/K2SymbolsBrauerPartII/README.md:426–430, and its supplier contract at :82–84.

   **Claim:** The proof derives the Artin/cup sign from ClassFieldTheory and presents its determination as new comparison work.

   **Witness:** TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:1576–1599, §1.44, already targets normResidueSymbol_eq_localSymbol with the named normalized coordinate, specified coefficient pairing and cubic sign determination.

   **Exact repair text:** “Consume ClassicalArithmeticCompletion §1.44's normResidueSymbol_eq_localSymbol, including its convention comparison and cubic sign determination. Use §§1.1–1.4 to identify its concrete cup with βζ and extend the supplied scalar identity to K₂ by symbol generation.” Add §1.44 to Exact supplier contracts and the Layer 3 dependencies; retain the K₂ map equality and the cubic value as a transport Check, not a second proof of the scalar comparison.

8. **F08** (P3) The package omits the required source manifest

   **Location:** packages/K2SymbolsBrauerPartII/README.md:663–668, References; packages/K2SymbolsBrauerPartII/sources.toml is absent.

   **Claim:** Four works support the targets, but the package records none in the required sources schema.

   **Witness:** The head adds README.md, Suggested.lean, metadata.toml and review.json only. No sources.toml exists. Legal service extractions for Weibel, Milne and Soulé were obtained during this review; Tate was requested too.

   **Exact repair text:** Add sources.toml with schema `tauceti-roadmap-sources/v1` and entries for Weibel (2013), Tate (1976), Milne (2020, v4.03) and Soulé (1978), including authors, title, locator_scheme, every cited locator and cited_for, plus the service's URL, provenance, hash, licence_class and status. Use no local paths. Preserve any eventual uncertified/waived status instead of claiming a text was inspected.

9. **F09** (P3) Statable conic Checks lack Lean mirrors

   **Location:** packages/K2SymbolsBrauerPartII/README.md:391–395; packages/K2SymbolsBrauerPartII/Suggested.lean:47–55.

   **Claim:** The Checks test the real negative quadrant, the dyadic obstruction, three rational failures and the Steinberg witness in every characteristic.

   **Witness:** The only examples are (0,0) over ℝ and (1,s). No example tests (r,1−r), including characteristic two; the rational theorem asserts only a product inequality, not the three claimed values.

   **Exact repair text:** Expand the two permitted conic examples into two grouped, proved tests: one for real values at (0,0), (−1,−1), (1,−1); one for the universal (1,s) and (r,1−r) positive witnesses. Keep their proofs grounded in conicSymbol. Add named README/Lean boundary theorem targets for the dyadic value and the three individual rational values if these cannot yet be proved without admission; do not add admitted examples or exceed two examples per definition.

10. **F10** (P2) Global finite-coefficient K₂ groups need not be finite

   **Location:** packages/K2SymbolsBrauerPartII/README.md:546: “an arbitrary isomorphism with the same finite source and target”.

   **Claim:** The groups in the global finite-coefficient dictionary are finite.

   **Witness:** For F=ℚ and m=2, tame localization surjects K₂(ℚ)/2 onto the direct sum of 𝔽_pˣ/(𝔽_pˣ)² over odd primes. Each summand has order two, so the source and its Galois-cohomology target are infinite.

   **Exact repair text:** Replace “the same finite source and target” with “the same finite-coefficient source and target groups, which can be infinite for global fields”.

11. **F11** (P2) The tensor-contraction milestone also has existing carriers

   **Location:** packages/K2SymbolsBrauerPartII/README.md:130–132; packages/K2SymbolsBrauerPartII/Suggested.lean:60–62 and :79–80.

   **Claim:** The coefficient-contraction milestone remains only in a comment among targets said to require unavailable carriers.

   **Witness:** At the Tau Ceti pin, TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:158–180 supplies the field-generic ZMod-bilinear kummerCupPairing. TensorProduct.lift factors that existing bilinear map without any K₂, symbol-algebra or K-spectrum carrier.

   **Exact repair text:** Import TauCeti.NumberTheory.ClassFieldTheory.Local.Symbol. Define rootCupContraction on `(muNRep m F).V ⊗[ZMod m] (muNRep m F).V` by `TensorProduct.lift (kummerCupPairing ζ hζ).bil`, for `m≥1`, any field F and a specified primitive ζ. State rootCupContraction_tmul and the root-change map identity of §1.5 on these carriers, with the appropriate unit scalar. Give at most two proved discriminating examples, including the fifth-root coefficient calculation. Retain the integer-weight twist and K₂ milestones in README.md until their carriers exist.

## Verified sound

Read **all 668 README lines and all 83 Lean lines** at the requested head. Coverage: **6 Lean declarations** (one definition, three theorems, two anonymous examples); **23 numbered target subsections, containing 72 distinct proposed API names**; **100 Check bullets** assessed mathematically; **28 locator groups verified in three legal source texts**; **37 supplier section/target checks across seven available roadmap owners**, plus the unresolved MotivicEtaleKTheory contract. The five specifically supplied sibling heads were searched by object and supplier name; none is directly cited in this package and no relevant duplicate was found there. They were not substituted with web versions.

The three Lean theorem propositions withstand the explicit tests below. There are no section variables to disappear: every needed field or characteristic binder is in the declaration itself. The two example proofs unfold the actual conic definition. No forced headline, admitted data, admitted example, `set_option`, extra import, `lemma` declaration, `True` placeholder or conclusion-containing hypothesis occurs. The file has the prescribed namespace and module docstring. No mathematical algorithm is requested. At the reviewed head the diff touches only four files inside the package folder. No package source file was edited, no build or Lean command was run, and nothing was posted.

The algebra calculations were checked directly. The monomial multiplication has exponent jk, so YX=ζXY. The splitting matrices obey that relation, including the wrap factor b. For d=[F(α):F], the Galois subgroup fixes α^d and the degree-d factors are distinct; the Y^s corner has powers c and b and commutator ζ^s. The cochain computation gives δf=d·ζ^(j(g)i(h)), hence the ordered cup with the stated positive algebra class. For Q₇, the arithmetic Frobenius ratio reduces to 2, the invariant of Aζ(3,7) is 1/3 and the Artin-first symbol is ζ⁻¹. Root replacement contributes u⁻¹ to the contraction, and Soulé's integral degree-two product contributes the separate minus sign. These computations do not certify the absent supplier contracts.

**Lean context and adversarial table.** All rows are in Layer 3; `Type*` is universe-polymorphic.

| Declaration and line in Suggested.lean | Exact variable/instance context | Instances tried | Result / change |
| --- | --- | --- | --- |
| conicSymbol, 20 | F : Type u; [Field F]; r s : F; no characteristic restriction | F₂, ℚ, ℝ; (0,0), (1,s), (r,1−r) | Real body, integer-unit codomain; zero-ring case excluded by Field. R09 concerns mirrors. |
| conicSymbol_real_eq_neg_one_iff, 26 | r s : ℝ | (0,0), (0,−1), (−1,−1), (1,0), (1,−1) | Weak inequalities necessary and sufficient; no missing binder. |
| conicSymbol_eq_one_iff_norm, 33 | [Field F]; explicit h2 : (2:F)≠0; r s : Fˣ | r=1 split case; r=s=−1 over ℝ; exceptional coordinates v=0 and x=0 | Both exceptional cases reduce to a difference of squares; no division by zero. Add pinned Hilbert comparison, R04. |
| conicSymbol_rat_not_multiplicative, 42 | No parameters or instances beyond ℚ | r=3,7,21 and s=−1 | Primitive integer equation rA²=B²+C² contradicts reduction modulo 3 or 7. R09 records missing individual-value mirrors. |
| example, 48 | None beyond ℝ | (0,0) | Unfolding gives −1 since 0≠1. |
| example, 52 | F : Type u; [Field F]; s : F | Characteristic 2 included; witness (1,0) | Unfolding gives +1. |

**README adversarial table.** Each row includes every proposed name in its subsection; auxiliary values, identity/composition laws, uniqueness and naturality were checked with the same context. All fields exclude the zero ring. Unless replaced below, m≥1 is invertible in F; root-dependent rows also specify ζ primitive in F.



| Section / README line / proposed declarations | Context | Instances tried | Result / change |
| --- | --- | --- | --- |
| 1.1 / 92: `galoisSymbol_eq_explicitCup11` | Any field; no chosen root | m=1; power slot; Q,m=3; R,m=2 | Ordered cup and Steinberg checks consistent; supplied h missing, R01. |
| 1.2 / 107: `rootTwistTrivialization`, `rootTwistTrivialization_one`, `rootTwistTrivialization_zero`, `rootTwistTrivialization_weight_one`, `rootTwistTrivialization_tensor` | Chosen ζ; every integer weight | j=0,1,2,−1; m=1,2,5; Q,μ₃ action | u^j and dual evaluation correct; supplier repair R01. |
| 1.3 / 128: `rootCupContraction`, `rootCupContraction_tmul`, `rootCupContraction_eq_pairing`, `rootCupContraction_unique` | Chosen ζ; tensor of native root modules | m=1; tensor with additive zero; m=5 exponents 2,3 | ζ^(2·3)=ζ, while root multiplication gives 1. Missing easy milestone R11. |
| 1.4 / 142: `brauerSymbol`, `brauerSymbol_symbol`, `brauerSymbol_torsion`, `brauerSymbol_algebraic`, `brauerSymbol_unique` | K₂/m to Br(F)[m]; chosen ζ | m=1; Steinberg/power symbols; Hamilton vs split real class | Field Picard vanishing justifies inclusion; R01 affects the h input. |
| 1.5 / 162: `rootTwistTrivialization_change`, `brauerSymbol_change`, `brauerSymbol_map` | All embeddings F→E; u a unit modulo m | u=2,m=5; ζ inversion,m=3; identity and composed embeddings | Contraction scales by inverse u, inverse weight-two coordinate by inverse u²; R01. |
| 1.6 / 188: `galoisSymbol_residue`, `galoisSymbol_units_unramified` | DVR; m invertible in residue field | {u,π}; two units; Q₇,m=3; excluded Q₂,m=2 | Uniformizer-last tame value ū corresponds to −κ(ū); residue supplier R01. |
| 2.1 / 217: `cyclicSymbolAlgebra`, `cyclicSymbolAlgebra_basis`, `cyclicSymbolAlgebra_relations`, `cyclicSymbolAlgebra_lift`, `cyclicSymbolAlgebra_baseChange` | Any field; m≥2; unit a,b; arbitrary target F-algebra | m=2; m=4,a=c²; a an m-th power; m=1 excluded from Fin-index construction | Carry multiplication and universal map consistent; no forced Lean algebra encoding. |
| 2.2 / 241: `cyclicSymbolAlgebra_split`, `cyclicSymbolAlgebra_isCentralSimple` | Extension L/F; α^m=a; α,b units | a=1 without root of b; R Hamilton; C splitting; m=2 wrap | All eigenvalues distinct; dimension m² and center/simplicity descent consistent. |
| 2.3 / 264: `cyclicSymbolAlgebra_matrixCorner` | Chosen α; d its actual radical degree; s=m/d | d=1; d=m; m=4,d=2 | α^d lies in F and Y^s preserves the selected corner; matrix degree correct. |
| 2.4 / 291: `cyclicSymbolAlgebra_brauerClass`, `brauerSymbol_quaternion` | Every unit pair; fixed algebra/Brauer comparison | Full and proper radical degree; cubic Q₇; quaternion case | Cocycle carry and negative-flip identity give the positive ordered cup; supplied h R01. |
| 3.1 / 324: `normResidueK2`, `normResidueK2_symbol`, `normResidueK2_unique`, `normResidueK2_mod`, `normResidueK2_power` | Nonarchimedean local F; μ_m contained; no chosen coordinate root | m=1; Q₂ wild; Q₃ unramified quadratic; equal characteristic | Symbol and both power relations correct; earlier ownership R05. |
| 3.2 / 346: `normResidueK2_splitSurjective` | Entire root group equals μ_m; specified ζ | m=1; Q₂ section; m=6 nonprimitive value | Exact order argument valid; section does not alone prove divisibility. Earlier owner R05. |
| 3.3 / 368: `conicSymbol`, `conicSymbol_eq_one_iff`, `conicSymbol_symm`, `conicSymbol_one_left`, `conicSymbol_steinberg`, `conicSymbol_eq_one_iff_norm`, `conicSymbol_real_eq_neg_one_iff`, `conicSymbol_rat_not_multiplicative` | Every field and arbitrary r,s; norm bridge additionally h2 and units | (0,0); (1,s); (r,1−r); real quadrant; Q₂; rational 3,7,21 | All six Check bullets mathematically consistent; missing mirrors R09. |
| 3.4 / 397: `hilbertK2`, `hilbertSymbol_eq_one_iff_conic`, `hilbertK2_symbol`, `hilbertK2_real`, `conicSymbol`, `hilbertK2_eq_normResidueK2`, `hilbertK2_unique` | Nonarchimedean local char≠2; real map separate | Q₂; real negative and positive units; excluded zero input; Steinberg pair | Unit-domain distinction correct. Generic conic/Hilbert bridge omitted from Lean, R04. |
| 3.5 / 418: `normResidueK2_eq_neg_invariant`, `normResidueSymbol_eq_positive_invariant_flip` | Nonarchimedean local; chosen ζ; m invertible in F | Q₇,m=3; root inversion; m=1,2; Q₂ wild | Artin-first negative invariant formula correct; scalar theorem already owned, R07. |
| 4.1 / 455: `placeNormResidueK2`, `placeNormResidueK2_finite`, `placeNormResidueK2_real`, `placeNormResidueK2_complex`, `placeNormResidueK2_symbol` | Number field; all μ_m global; all places | Q,m=1,2; real place with m>2 impossible; completion root transport | Common root target and archimedean branches consistent; imported N ownership R05. |
| 4.2 / 470: `placeNormResidueK2_finiteSupport` | Every integral classical K₂ class | Zero; Hamilton support {2,∞}; x+(−x) | Finite union suffices, equality of supports of summands correctly avoided. |
| 4.3 / 485: `normResidueK2_product_formula`, `brauerSymbol_sum_invariant`, `normResidueK2_product_iff_sum` | All places; finite support; primitive ζ for additive form | Hamilton at 2 and ∞; m=1; sums and differences of symbols | Product/sum equivalence follows from injective root/invariant coordinates. |
| 5.1 / 519: `tateLocal_symbolDictionary`, `tateLocal_residueDictionary` | Nondiscrete locally compact field; prime ℓ≠char F; r≥1 | Q₂,ℓ=2; R at ℓ=2 and odd ℓ; C; F₂((t)),ℓ=3 | No contrary boundary value found; field comparison supplier repair R01, Tate locator uncertified. |
| 5.2 / 540: `tateGlobal_symbolDictionary`, `tateGlobal_adicDictionary` | Global field; prime ℓ≠char F; r≥1; adic torsion as stated | Q at ℓ=2; F_q(t); real completions; characteristic prime excluded | Finite maps consistent; groups need not be finite, R10. Adic theorem supplier R01; Tate uncertified. |
| 5.3 / 555: `tateSInteger_dictionary`, `tateSInteger_naturality` | Number field; finite S contains infinity and ℓ; μ_ℓ for Picard row | Z[1/2]; nonzero Picard quotient; S enlargement; omitted ℓ-place | No Picard term was erased; full arithmetic contract unowned, R01. Soulé narrower root scope is explicitly acknowledged. |
| 5.4 / 591: `finiteK2_bockstein_exact`, `finiteK2_integralReduction_image` | Every field; m≥1, even in characteristic dividing m | m=1; R,m=2 with nonzero μ₂; m=6 CRT | Exact segment is correct; it is supplied already, R06. |
| 5.5 / 613: `etaleChern_productNormalized`, `etaleChern_productNormalized_symbol`, `etaleChern_rawHurewicz` | Any field; m invertible; integral classical K₂ input | m=1,2,3,6; cubic invariant; raw comparison negation; Bockstein quotient | Integral-image minus sign supported by Soulé; arbitrary finite-class product not asserted. Chern supplier R01. |

The bold commutation/order conventions at README line 27 are included in the Layer 2 rows; they are not additional targets. The Check ledger records all 100 bullets individually. Several Check bullets merely repeat an asserted property or describe a bad proof (for example lines 364, 366, 505, 610 and 640); their statements are consistent, but they do not add independent test evidence. After the ownership repairs, retain explicit instances rather than counting those repetitions as fresh Checks.

**Source locator ledger.** Counts below are distinct locator groups, not repeated citation occurrences. No source passage is reproduced here.

| Source | Locator groups verified | Evidence in the service extraction | Scope checked |
| --- | --- | --- | --- |
| Weibel, author's 29 August 2013 K-book | 15: III.6.2; Examples 6.2.1, 6.2.2, 6.2.3, 6.2.5; III.6.3; III.6.9; Lemma 6.9.1; Proposition 6.9.2; III.6.10; 6.10.1; equation 6.10.2; Proposition 6.10.3; Remark 6.10.4; VI.8.6 | weibel line 13369; line 13376; line 13394; line 13406; line 13450; line 13461; line 13858; line 13884; line 13893; line 13925; line 13950; line 13968; line 13971; line 14004; line 31428 | Printed pages 232–234, 240–243 and 515 match. The package repairs the primitive-value gap and the insufficient minimal-polynomial premise instead of copying them. |
| Milne, CFT v4.03 | 7: III Proposition 3.6; III.4 Steps 1–4; Remark 4.5; V Proposition 5.2; Theorem 5.3; Example 5.4; VII Theorem 8.1(b) | milne line 4957; line 5019; line 5040; line 5068; line 5093; line 5140; line 8075; line 8123; line 8142; line 10042 | Version confirmed at milne line 7. Printed pages 109, 111–114, 178–179 and 221; variable transpose and all-place sum match. |
| Soulé, author's thesis transcription | 6: Proposition 2.2.2.3; §2.2.3.1; §2.2.3.2 including Lemma 2.2.3.2.1; Proposition 2.2.3.3; its following remark; §2.2.4.4 | soule line 1282; line 1371; line 1401; line 1450; line 1460; line 1529; line 1551; line 1693; line 1709 | Printed pages 42–49 and 53–55 match. Integral product coefficient is −1; finite factorization and the warning about two finite inputs are present; ring proof explicitly assumes root containment. |

**Pinned API verification.** Mathlib was read at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as required by lake-manifest.json. In particular:

- Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461 and :516 provide the two named primitive-root maps; Mathlib/LinearAlgebra/TensorProduct/Basic.lean:122 and :126 provide tensor lift and its pure-tensor formula.
- TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125–136 provides the actual discrete root coefficient module; Kummer.lean:249 and :277 provides the multiplicative class and the positive gα/α convention.
- TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:483–595 records all topology/action/continuity contexts of explicitCup11; :790 has the negative flipped-pairing formula.
- TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:92–180 is field-generic, including the coefficient dictionary and root pairing. Brauer/RootsOfUnity.lean:68–105 requires a nonarchimedean local field and invertibility in the field; it has the normalized torsion coordinate, including wild mixed-characteristic exponents.
- TauCeti/Algebra/CrossedProduct/Comparison.lean:267–298 has the additive-tag Brauer equivalence and its positive inflated-cocycle characterization; CupProduct.lean:318 is the quaternion cup theorem. TauCeti/NumberTheory/HilbertSymbol/Basic.lean:42–59 has the generic unit-input sign used in R04.

**Supplier/merge-direction result.** The available contracts checked were K2SymbolsBrauer §§0.4, 5.1–5.2, 7.1–7.3, 8.1–8.3, 12.5, 12.11; GeneralAlgebraicKTheory §§1.7–1.8, 5.11, 7.4–7.5; ClassFieldTheory Layers 5, 6, 10, 14; QuadraticFormInvariants §§6C, 6E, 7B; ClassicalArithmeticCompletion §§1.14, 1.24–1.25, 1.35, 1.44, 1.52; KTheoryFiniteLocalFields §§1.1, 1.8, 3.0a, 3.1–3.3; and EtaleCohomologyFoundations F.0.2–F.0.3. Open heads inspected were K2SymbolsBrauer `a969ec1ec875183342902f729306793407cedf64`, GeneralAlgebraicKTheory `57056743b0997d5f46fa8bca5f67b50d075c30bc` and KTheoryFiniteLocalFields `fb3a9c0be1f750f85762a27dad74fde5a219bb94`.

The required depcheck on the unchanged README produced:

```text
NOT IN ORDER: K2SymbolsBrauerPartII (insert it after its last supplier)
depcheck: 6 roadmaps, 40 edges, 1 problem(s)
```

Exit status was 1. It produced no UPWARD or CYCLE line. The missing-order message is recorded, not raised as a finding. The mechanical result does not resolve R01: it cannot certify the absent supplier's target contracts. R05–R06 repoint supply to the earlier owner; no target is moved to a later supplier and no later-roadmap dependency is proposed.

## Not verifiable

- **Tate's primary text and eight cited locator groups:** Theorem 3.1, Lemma 3.2, Diagram 3.3, Theorem 3.5 and its corollary, Proposition 4.5 and its corollary, Theorem 5.1, Equation 5.3 / Theorem 5.4, and Theorem 6.2. The GDZ service request did not complete, the DigiZeitschriften alternative returned HTTP 404, and the DOI fetch recorded `uncertified` for the paywalled publisher. The remaining texts corroborate some stated mathematics, but do not certify these exact primary locators. The scratch missing-reference list contains no pending human request because the final status is uncertified.
- **MotivicEtaleKTheory's claimed declarations and proof dependencies:** no admissible source version or declared gap was available. This is the actionable supplier defect R01, not a claim that Tate's mathematical theorems are false.
- **Lean elaboration:** prohibited by the read-only brief. No compilation result is claimed; signatures, binder retention and both written example proofs were inspected statically.
- **Exhaustive pinned-library absence:** the relevant object paths and named declarations were searched and read at the pins, but no full local checkout of the pinned libraries was available. Positive duplication and missing-headline findings use exact retrieved files; absence of every conceivable equivalent declaration is not claimed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5c63c49dbd09d58d39c8f2a62419661d4520a68f", "job": "RT-K2SymbolsBrauerPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
