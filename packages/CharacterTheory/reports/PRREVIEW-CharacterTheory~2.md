# Review of CharacterTheory (pull request #978 at 73c4f43)
Folder: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/`

**Verdict:** needs changes

AI review of the complete folder, including unchanged passages. Findings below concern this folder only. The family index is an authorized additional PR file. The gate and Lean elaboration pass; they do not detect the mathematical and ownership defects below. File locations abbreviated as README and Suggested mean `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` and `TauCetiRoadmap/RepresentationTheory/CharacterTheory/Suggested.lean`.

## R01 (P1) — The cyclotomic-action supplier still does not exist at the pin

**Location:** README:704–714: “Tau Ceti supplies it” and “`IsPrimitiveRoot.cyclotomicVirtualCharacterEquiv`”; also README:85,190,200–202,731–733,793.

**Claim:** The pinned library provides a descended virtual-character equivalence, its Galois action, the value/action laws, and a permutation action on irreducible characters.

**Witness:** At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean` is absent; all seven `cyclotomicVirtualCharacter*`/`cyclotomicIrreducibleCharacterAction` names in the supplier table are absent. The actual inputs are `Induction/Cyclotomic/SplittingField.lean:56` and `CharacterTable/Galois.lean:119`.

The parenthetical alternative at README:733 does not supply these constructions. The first actual theorem is equality of virtual-character subgroups under scalar extension. The second assumes an endomorphism of an **algebraically closed coefficient field**. It cannot simply be applied to a cyclotomic number field, and the roadmap explicitly avoids choosing automorphisms of ℂ.

**Repair:** Make descent, the action laws and preservation of irreducibles explicit §4.4 targets, built from the actual descent theorem and a root/eigenvalue calculation over the descended field. Cite the existing declarations with their hypotheses; remove the nonexistent module and all seven invented supplier names. Make the fixed-field theorem and §6.6 consume those targets. Test the value law on C₅ with exponent 2: ζ₅ must map to ζ₅², whereas inverse exponent 3 gives ζ₅³. This is the previous R01, not repaired; no repair report declaring it settled was supplied.

## R02 (P1) — GL₂(𝔽₃)'s cuspidal representations are not quaternionic

**Location:** README:1115: “`GL₂(𝔽₃)` (its degree-`2` cuspidal rows are quaternionic).”

**Claim:** All three degree-two cuspidal rows have Frobenius–Schur indicator −1.

**Witness:** `TauCeti/RepresentationTheory/CharacterTable/GL2/FieldThree.lean:124` gives one real cuspidal row and two conjugate rows with values ±i√2. Summing their square-character values gives 48, 0, 0; division by 48 gives +1, 0, 0.

More explicitly, in that file's column order the class sizes are (1,1,6,6,6,8,8,12), and the squaring map sends columns to (0,0,1,2,2,5,5,0). Thus the real row gives 4+12+24−16+24=48; either complex row gives 4−12+0−16+24=0. A direct enumeration of all 48 invertible 2×2 matrices over 𝔽₃ independently gives the same sums, using exact arithmetic in ℤ[ζ₈]. There are 14 solutions of g²=1.

**Repair:** Replace the example by “one orthogonal cuspidal row and two complex-conjugate cuspidal rows,” with indicators (+1,0,0), and add the square-map calculation as its Check. The weighted indicator sum is then 2+2+6+4=14, agreeing with the involution count; the claimed quaternionic triple would give 6.

## R03 (P1) — The internal tensor-square norm in the product-group Check is 3

**Location:** README:543–545: “the internal tensor product ... has character `(4, 0, 1)` and norm `2`”.

**Claim:** The self-pairing of the tensor square of the two-dimensional S₃ representation is 2.

**Witness:** Class sizes (1,3,2) give (1·4²+3·0²+2·1²)/6=18/6=3, not 2. The same README:598 decomposes this tensor square as 1⊕sgn⊕U, whose self-pairing is 1+1+1=3.

**Repair:** Change 2 to 3. Keep the external-product self-pairing 1: on S₃×S₃ its character is χ(g)χ(h), giving numerator (4+2)²=36 and denominator 36, hence norm 1. The corrected Check distinguishes internal and external products with values 3 and 1.

## R04 (P1) — Squaring does not define the asserted A₅ class permutation

**Location:** README:1022–1023: “`A₅`, `b = 2`: `P_2` swaps the two classes of `5`-cycles and `σ_2(√5) = −√5`”.

**Claim:** This is an instance of the coprime class-power permutation and cyclotomic automorphism in §6.6.

**Witness:** The roadmap itself uses e=30 for A₅ (README:1043). gcd(2,30)=2. Both 1 and (12)(34) square to 1; ζ₃₀↦ζ₃₀² is not a field automorphism because the image has order 15.

**Repair:** Use b=7. Then gcd(7,30)=1, 7≡2 mod 5, seventh powering interchanges the two 5-cycle classes, and σ₇ sends √5 to −√5. Keep b=2 as a negative-control Check showing why coprimality is necessary. If discussing squaring only on the 5-cycle classes, explicitly use conductor 5 and do not call it the permutation of all A₅ classes or an automorphism of ℚ(ζ₃₀).

## R05 (P2) — Several claimed additions already exist, including the full GL₂ table

**Location:** README:349–363,401–404,443–445,461–465,1199–1204; Suggested:30–36: “which no pinned declaration carries” and “the pinned classification does not expose”.

**Claim:** A finite irreducible model/index, character recognition, basic adapters, and the GL₂ table require the new developments described here.

**Witness:** The pinned `TauCeti/RepresentationTheory/CharacterTable/Table.lean:199,244,248` already supplies an irreducible enumeration, degrees and models on Fin(degree)→k. `CharacterTable/GL2/Table.lean:360` already defines the full table on actual conjugacy classes; :382 identifies it with the native character table.

The object audit also found these exact owners:

| Replanned object | Existing pinned declaration and file |
| --- | --- |
| Virtual-character inversion/conjugation, README:264–268 | `TauCeti.conj_apply_of_mem_virtualCharacters`, `TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean:270` |
| Irreducible finite models and block classification, §2.2 | `TauCeti.irreducibleRepresentation`, `CharacterTable/Table.lean:248`; `TauCeti.exists_nonempty_equiv_blockRepresentation`, `CharacterTable/IrreducibleClassification.lean:104`, at arbitrary carrier universe; `TauCeti.nonempty_equiv_index_simpleSubmoduleClasses`, :137 |
| Character of a product and biproduct, §3.1 | `Representation.char_prod`, `TauCeti/RepresentationTheory/FDRep.lean:99`; `FDRep.char_biprod`, :292 |
| Module equivalence → representation equivalence, §3.3 | `TauCeti.Representation.equivOfAsModuleLinearEquiv`, `TauCeti/RepresentationTheory/AsModule.lean:127` |
| Character recognition, §3.4 | `Representation.nonempty_equiv_of_character_eq`, `CharacterTable/Determined.lean:74`; requires characteristic zero, not algebraic closure, and allows arbitrary carrier universe |
| Explicit GL₂ values and assembled table, §9.2 | `TauCeti.GL2CharacterTable`, `GL2CharacterTable_eq_submatrix_characterTable`, `GL2CharacterParam.characterPairing_classFunction`, `CharacterTable/GL2/Table.lean:360,382,395`; `TauCeti.conjClassesGLFinTwoEquiv`, `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean:345`; the four-family value theorems in `CharacterTable/GL2/CharacterValues.lean`, `PrincipalSeries/CharacterValues.lean`, and `Cuspidal/Basic.lean` |

**Repair:** Move these objects to Scope and ownership and Exact supplier contracts and consume their exact names. Keep only a precisely stated difference, such as a comparison with the module-class quotient, a genuinely separate-universe transport, or the positive-characteristic multiplicity congruence. Do not reconstruct the finite models or the characteristic-zero recognition theorem. For GL₂, consume the existing class-indexed table; if an arbitrary-universe extension is intended, say that explicitly and state that extension. Correct the docstring's absence claims.

**Retest:** The native S₃ model has degrees (1,1,2), the trivial group on k³ has multiplicity 3, and the pinned GL₂(𝔽₃) table is already 8×8 with degree squares summing to 48. These are exactly the objects the retained comparisons should use. This is repairable duplication, not grounds to reject the entire established roadmap.

## R06 (P2) — Product irreducible classification is statable but omitted

**Location:** Suggested:31–33: “the classification of the irreducibles of a product group (§3.6) needs the same index”.

**Claim:** The missing canonical index prevents stating this headline at the pins.

**Witness:** A scratch file elaborates the external product as one real-bodied definition using `FDRep.of`, `Representation.tprod`, and the two `MonoidHom` projections, and states existence and uniqueness of the two simple factors using `Nonempty (V ≅ W)`. Only the target's sorry warning remains.

The index is needed by a chosen implementation of the classification, not by its statement. The tested statement quantifies over every simple X in FDRep k (G×H), asserts simple V,W with V⊠W≅X, and asserts that every other such pair is isomorphic factor by factor; it uses finite G,H and algebraically closed characteristic-zero k, exactly as README §3.6.

**Repair:** Keep the simple external-product definition and state that full classification with sorry, including uniqueness up to factorwise isomorphism, in Layer 3 of Suggested. Delete the docstring excuse. The four characters of C₂×C₂ and the degree-four external product for S₃×S₃ give positive tests; the reducible internal S₃ tensor square of R03 is the negative control. Reuse the existing finite model index if a separate indexed corollary is wanted.

## R07 (P2) — The categorical indicator comparison has two owners

**Location:** README:1101–1103: “The categorical mirror is the indicator of PivotalSpherical ... own the comparison.”

**Claim:** CharacterTheory should build the comparison between its finite-group indicator and the categorical indicator.

**Witness:** `TauCetiRoadmap/PivotalSpherical/README.md:527–535` on main, Layer 8, already plans categorical indicators and explicitly identifies the agreement with CharacterTheory's FDRep indicator as its contribution.

**Repair:** Import the comparison from PivotalSpherical Layer 8, with the standard pivotal structure and n=2, rather than plan it again here. Keep the finite-group calculations as Checks. On the degree-two D₄ and Q₈ representations both conventions must give respectively +1 and −1; on either nontrivial C₃ character both must give 0. The existing main roadmap is built on, not re-planned.

## R08 (P3) — Three convention Checks do not discriminate as claimed

**Location:** README:894–896: “an isomorphism sending `zeta` to `−i` would satisfy every clause except that one”; README:1445–1447: “a model with `(σ·u)ᵢ = R_σ u_{σ(i)}` fails to commute.”

**Witness:** In §6.1, at x=ζ₄ the conjugate map has basis coordinates (0,−1), not (0,1), and with ι(ζ)=i its complex image is −i, not i. In §11.3, a transposition equals its inverse, so the two displayed displacement formulas are identical.

The same issue occurs in README:436–437: Hom reversal gives the same numbers “only because `k` is algebraically closed.” For the trivial group over ℝ, Hom(ℝ,ℝ²) and Hom(ℝ²,ℝ) both have dimension 2. More generally, finite semisimple Hom dimensions are symmetric even when the simple endomorphism division rings are larger than k. Remove that explanation and say explicitly that this Check cannot fix orientation.

**Repair:** For §6.1 say that the generator, embedding and coordinate clauses all exclude conjugation, and test x=ζ₄, not ζ₄² (both maps send the latter to −1). For §11.3 use a 3-cycle and test the group law, or exhibit a concrete nonzero commutator with H. A transposition cannot distinguish σ from σ⁻¹. The two-term basis test in the adversarial table below does distinguish them.

## R09 (P3) — New targets lack exact source locators

**Location:** README:501–537 (external tensor/Hom, complete product classification and the Fourier comparison), README:1001–1012 (class-power and degree identities); README:1500–1526 mostly gives whole chapters or whole articles without pages for the claims.

**Claim:** The targets satisfy the requested statement-level source contract.

**Witness:** §3.6 has no bibliographic locator at all. §6.6's two new row theorems cite internal prerequisites only. The seeded §3.4 has no source locator for its positive-characteristic congruence criterion. A bibliography entry spanning several chapters is not an exact locator.

**Repair:** Attach exact section/theorem and printed-page locators to the new assertions, separating a source theorem from a derivation made here. For §3.6 use Fulton–Harris Exercise 2.36, p. 24 (verified below). For derived targets, name the exact source facts and the short derivation (e.g. row orthogonality plus Ω=|C|χ/d gives T=n²/d²). Do not invent locators for unavailable books: mark those uncertified. The source-sample table below distinguishes pinned declarations, readable text, derivations and inaccessible references.

## R10 (P3) — Added adapters do not have the promised API and three discriminating Checks

**Location:** README:441–452 (module-to-representation adapters); README:521–534 (external Hom and Fourier/bimodule comparisons).

**Claim:** Each introduced construction is specified with its API and at least three discriminating Checks.

**Witness:** §3.3 has no Checks or explicit API for the conversion beyond existence. §3.6's Checks test external tensor characters and multiplicities, but none tests external Hom's inverse/factor order or the probability-Haar scaling.

**Repair:** First remove the native adapter duplication in R05. For each retained comparison, specify source, target, forward/inverse laws and naturality, then give three actual controls. For external Hom use C₃×C₂ with χ(g)=ω and sign(h)=−1: the value is −ω², whereas omitting the inverse gives −ω; use a zero carrier and a trivial factor as the other tests. For convolution use δ₁ on C₂: coefficient convolution has δ₁*δ₁=δ₁, probability convolution has δ₁⋆δ₁=δ₁/2, and (2δ₁)⋆(2δ₁)=2δ₁. Include the Fourier value at the identity and a noncommuting S₃ pair to pin order.

## R11 (P3) — Correct the fully qualified Hom and Galois supplier names

**Location:** README:170: `Representation.invariantsEquivFDRepHom`; README:190 and731–733: `Representation.map_ofCharacter_eq_powMap`.

**Witness:** `Mathlib/RepresentationTheory/Invariants.lean:179,217` puts the first in namespace `Representation.linHom`. `TauCeti/RepresentationTheory/CharacterTable/Galois.lean:77,119` puts the second in `TauCeti.Representation`.

**Repair:** Use `Representation.linHom.invariantsEquivFDRepHom` and `TauCeti.Representation.map_ofCharacter_eq_powMap` in the exact supplier table and first citations. The existing comparisons send an invariant linear map to the same intertwiner; on the trivial one-dimensional representation both sides have dimension 1. This is a resolvable namespace error, distinct from R01's absent construction.

## R12 (P3) — Keep the solver headline as an admitted acceptance target

**Location:** Suggested:247–254: `characterTableDixon_isSome` has a four-line proof using the admitted bounded-certificate theorem.

**Claim:** Suggested states the headline theorems “each with sorry” (its own module docstring and the acceptance-test contract).

**Witness:** This is the only one of the 16 theorem declarations proved in place; its proof depends on `exists_bounded_exact_character_table`, which is admitted at :236. It is not an independently completed solver theorem.

**Repair:** Keep this headline and replace its proof with sorry. Its mathematical route remains in README:1030–1031. This is not a request to delete the headline or to prove padding. The quantitative test remains S₄, B=24 and p=61: 2B=48<61.

## Previous findings, checked individually

The previous review had 13 findings. This head is a full re-review, not an incremental approval. Quoted fragments below are from this head unless described as absent.

| Previous finding | Current passage/evidence | Status |
| --- | --- | --- |
| R01 missing cyclotomic action | README:704 “Tau Ceti supplies it”, and :706–714 retain the absent names | **Not repaired**; R01 above |
| R02 sorry'd ring maps | Suggested:158–159 “∃ (E : ... ≃+* ...) (ι : ... →+* ℂ)” with generator, embedding and basis equations | **Repaired**; no admitted data |
| R03 set_option/numeric spring namespace | No set_option remains; Suggested:285 states the punctured quartic limit | **Repaired** |
| R04 imports | Suggested:1 “import Mathlib”, followed only by individual TauCeti modules | **Repaired** |
| R05 executable refinement algorithm | The refinement namespace and row-code/alignment procedure are absent; README:966 “require additionally p > 2B_G” and :1030 totality remain mathematical targets | **Repaired** for the identified algorithm; named examples remain README Checks as requested |
| R06 Burnside–Brauer duplicate | README:54–57 “This roadmap is the owner ... McKaySkewGroup ... cites this subsection” | **Repaired in this package**; the open McKay text still contains its proof target at :538, noted below, but this package took the requested ownership action |
| R07 unidentified Knutson semester notes | README:1283,1316 cite Fulton–Harris/James–Liebeck; :1530 identifies and links the five-page Knutson handout | **Bibliographic repair made**; replaced book locators require the source qualifications below |
| R08 CompactGroups wrong layer | README:107,222,534,537 says “Layer 5” | **Repaired**, resolved on main at CompactGroups:363 |
| R09 absent backticked local declarations | Index/regrouping/virtual-character aliases removed from Suggested and written as prose/native references | **Repaired** for the named aliases; R05 concerns the remaining ownership claim |
| R10 process narrative/anchors | The cited anchors and old prototype/refinement commentary are absent | **Repaired** for the identified passages |
| R11 API catalogue/padding | Suggested is 290 lines: eight real-bodied definitions, sixteen theorems; old aliases, boundary targets and numeric matrices are absent | **Repaired** for the identified padding; all fifteen remaining sorries resisted generic one-tactic probes |
| R12 README shape | “Scope and ownership”, “Conventions”, “Exact supplier contracts”, “How to read the build”, per-layer Examples/Dependencies and Downstream consumers all present | **Repaired structurally**; R09–R10 concern content of that shape |
| R13 companion files | Both companion files are absent; tensor series is Suggested:89–120 and transverse energy is :276–288 | **Repaired** |

## Verified sound

“Sound” here records the claims and instances below; it does not certify the erroneous examples in R02–R04 or the unread books.

**Gate, scope and elaboration.** Head checked: `73c4f437cb49fe8348694fffb331967089c411e9`. The worker's recorded gate has every counter zero, including build, depcheck, outside-folder, imports, sorry-data, stray-files and set_option. A fresh targeted `lake build TauCetiRoadmap.RepresentationTheory.CharacterTheory.Suggested` succeeds (9148 jobs, replayed target). A fresh `lake env lean` of the absolute Suggested path succeeds with exactly 15 “declaration uses sorry” warnings and no other diagnostics. The only changed file outside the two target files is `TauCetiRoadmap/RepresentationTheory/Suggested.lean`, the authorized family index, which states no mathematics. The instructed excluded-folder diff is empty. The worktree remains clean.

The pins were read from lake-manifest.json and compared with the checked-out packages: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No newer library supplied evidence.

**Mechanical supplier-order output**, from the exact command in the brief:

```text
depcheck: 209 roadmaps, 1460 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line was read. R01 is an unowned construction hidden behind nonexistent pinned names; the graph check cannot detect that. No declared supplier gaps were available. The structural proof order for exact reconstruction is consistent: integral ring comparison → eigenvalue-coordinate bound → exact central values → bounded certificate → prime-window completeness → finite search budget. The §0.2 reference forward to §4.1 can be removed altogether by consuming the pinned virtual-character conjugation theorem (R05).

**Signature and padding audit.** A copy containing `#check @...` for **all 24 declarations** elaborated. All needed finite-dimensionality, faithfulness, simplicity, NeZero, exponent equality, coefficient bound, cyclotomic-extension and finite-group hypotheses survived. The two carrier universes in `exists_pos_finrank_intertwining_tensorPower` are independent. The field-of-values theorem intentionally has G,K : Type; the principal-series extension intentionally has F : Type u. The definitions `tensorPowerFDRep` and `tensorMultiplicitySeries` drop Fintype G because their bodies do not require it; their finite-group theorems retain it. No hypothesis-loss correction is needed. A copy tried `simp`, `rfl` and `infer_instance` separately as closing alternatives on **all 15 sorries**; all 15 remained unsolved. The native declaration audit found no exact single-library-theorem closure for these remaining fifteen statements. The one proved theorem is addressed in R12. Eight helper definitions have real bodies; none is a free Prop stand-in or sorry'd map.

**Headline inventory.** The README's main endpoints are Burnside–Brauer (including arbitrary-universe transport), the tensor-fraction identity, positive-power bound and arbitrarily large occurrences, the fixed field of character values, generator-compatible ring-of-integers comparison, exact eigenvalue/character/central-value coordinate bounds, the bounded exact table, strong-prime existence, solver completeness and eventual search success. All have actual signatures. The principal-series arbitrary-universe criterion and quartic spring limit also have signatures. The additional deep structural endpoints are cross-universe isotypic regrouping, character recognition, product irreducible classification, the class-power Galois identity, degree recovery, and the explicit GL₂ table. The docstring names regrouping, recognition, product classification, class-power and GL₂ as omitted; R05 corrects false library-absence claims and R06 supplies the product classification. The degree identity is true on the native central table; its proof is the displayed substitution in the table below. The accepted library-owned Burnside solvability, Frobenius, Frobenius–Schur and GL₂ theorems should be consumed, not added as new Lean acceptance targets.

**Cross-roadmap resolutions and ownership.** The repository norms were read, together with main's SemisimpleAlgebras, PivotalSpherical and the completed OrthogonalL2Bases roadmap for comparison of shape. All four actual roadmap suppliers were resolved against main, not a revising PR:

| Citation | Resolution and convention |
| --- | --- |
| SemisimpleAlgebras Layers 1–2 | `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:186` has finite-dimensional Schur collapse and isotypic components; :153 and the Layer 2 block/simple-module dictionary name `blocks_equiv_simpleModules`. The finiteness qualification on Schur is preserved here. |
| InductionRestriction Layer 2, Layers 3–4 | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:268,298,323,460,503` has the finite induced-character formula, reciprocity, Mackey decomposition and criterion. Its left-coset adapter uses t⁻¹gt; its normalized pairing requires invertible order, agreeing with this roadmap. Its independence from the final CharacterTheory pairing name is explicit at :333–336. |
| CompactGroups Layer 5 | `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:318,363` has Peter–Weyl and the G×G-isotypic decomposition; probability Haar is explicit. Coefficients are multiplied by \|G\| for the probability-convolution comparison, as verified below. |
| PivotalSpherical indicator section | `TauCetiRoadmap/PivotalSpherical/README.md:527–535`, Layer 8, supplies categorical νₙ and already owns the FDRep comparison (R07). |

The open-head searches used `roadmaps grep` by objects: external tensor products, Burnside–Brauer, character recognition, cyclotomic actions, GL₂ tables, Frobenius–Schur, central coefficient bounds, tensor multiplicity series and springs. Main and the named open heads were included; the board-package index was also inspected, and its five listed packages concern unrelated arithmetic objects. No own fully qualified Suggested name collision was found in the inspected ownership results. McKaySkewGroup is the substantive open overlap: `TauCetiRoadmap/McKaySkewGroup/README.md:538–548` still says to prove Burnside–Brauer, although it also says it consumes the generic theorem. CharacterTheory is the appropriate owner because the theorem has no McKay input and McKay already consumes the finite-character library. This head explicitly records that direction, satisfying the previous package-level repair. That sibling should replace its proof target with a citation; this review changes neither checkout. The later arithmetic consumers of Frobenius–Schur found by the search use CharacterTheory rather than supply it.

**Pinned declarations opened.** The table records substantive source bodies/signatures inspected, beyond name-search hits. It contains 29 groups of declarations; the automated object search was only a lead, not proof that a fully qualified name exists.

| File at the pin | Declarations and hypotheses inspected |
| --- | --- |
| `Mathlib/RepresentationTheory/Character.lean:63,68,89,101,172,194,206` | `Representation.char_one`, `char_tensor`, `char_conj`, `isIntegral_character` and FDRep forms; finite-dimensional traces, finite-group integrality |
| `Mathlib/RepresentationTheory/Invariants.lean:109,179,217` | `Representation.invariantsEquivIntertwiningMap`; `Representation.linHom.invariantsEquivFDRepHom`; the latter's namespace is material (R11) |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:801,816,836,850,855,862` | integral closure, `adjoinEquivRingOfIntegers`, `integralPowerBasis`, its generator and dimension; NeZero conductor, characteristic zero and the cyclotomic-extension assumption |
| `TauCeti/RepresentationTheory/FDRep.lean:99,292` | product and biproduct character additivity are already native |
| `TauCeti/RepresentationTheory/AsModule.lean:127,140,166,172,269` | conversion of module equivalences, inverse conversion, equivalence criterion, product-module comparison and categorical mirror |
| `TauCeti/RepresentationTheory/OfModule.lean:90,122,142` | module/representation comparison, irreducibility and finite product character |
| `TauCeti/RepresentationTheory/CharacterTable/ClassFunction.lean:80,90,175,218,289` | class-function descent/lift, inversion, conjugacy-class equivalence and dimension |
| `TauCeti/RepresentationTheory/CharacterTable/ClassSum/Basic.lean:31,42` | native class sum and its coefficient indicator; coefficients outside the class are zero |
| `TauCeti/RepresentationTheory/CharacterTable/ClassSum/Integral.lean:48,59` | integrality first in the center over ℤ, then transported to any commutative coefficient ring |
| `TauCeti/RepresentationTheory/CharacterTable/Pairing.lean:58,79,157,189,250` | bilinear inverse-argument pairing, invertible-order nondegeneracy, cast Hom-dimension formulas |
| `TauCeti/RepresentationTheory/CharacterTable/Completeness.lean:101,247,274,296` | basis from a complete family, arbitrary-universe equivalence to a member, existence of a basis and spanning |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean:199,227,236,244,248,263` | finite irreducible enumeration, exhaustive rows, unique trivial row via injectivity, degrees, models and pairwise inequivalence |
| `TauCeti/RepresentationTheory/CharacterTable/IrreducibleClassification.lean:104,137,159` | complete block models, the simple-submodule-class dictionary and uniqueness of block models |
| `TauCeti/RingTheory/Semisimple/Multiplicity.lean:183,195,216,307` | Hom dimensions for finite products of simple factors; positive Hom detects an isomorphic factor; decomposition via simple quotients |
| `TauCeti/RepresentationTheory/CharacterTable/Determined.lean:68–76,117,127` | unbundled recognition, bundled recognition and natural multiplicities; characteristic zero without algebraic closure |
| `TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean:270` | inversion/conjugation for every finite-group complex virtual character |
| `TauCeti/RepresentationTheory/CharacterTable/Galois.lean:92,101,119` | power law assumes algebraically closed coefficients and an actual coefficient-field endomorphism; this is not the missing cyclotomic action |
| `TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean:49,56,107,121,138` | characteristic-zero field with the required roots, algebraically closed extension, one universe; virtual-character descent and simple realization |
| `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean:165,174,183` | multiplication by degree, the division form with nonzero degree and integrality of class-sum values |
| `TauCeti/RepresentationTheory/CharacterTable/Eigenrow.lean:241,263,386,399` | central table, its left eigenrow equation and degree/ordinary-table comparison |
| `TauCeti/RepresentationTheory/CharacterTable/Specification.lean:171,187,308` | all four specification fields: positive divisor degrees, sum of squares, weighted Hermitian row orthogonality, normalized eigenrows; uniqueness only up to rows |
| `TauCeti/RepresentationTheory/CharacterTable/Dixon/ClassData/Basic.lean:167,226,256,336,422` | numbered classes, index characterization, class equivalence, membership and matrix orientation |
| `TauCeti/RepresentationTheory/CharacterTable/Dixon/Cyclotomic/Solver.lean:284,364,431,437,456,466` | actual Option solver, bounded-certificate completeness with strict 2·coefficient<p, prime-budget membership/success and prefix stability |
| `TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Basic.lean:105,110,217,224` | module indicator and FDRep wrapper, the latter defined from V.ρ |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Irreducible.lean:287,298` | existing criterion uses F : Type; the proposed arbitrary-universe variant is a real extension |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Basic.lean:134` and `Cuspidal/Irreducible.lean:334,343,355` | virtual construction, regular-character hypothesis on the actual cuspidal object, character and dimension |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Table.lean:131,168,283,360,382,395` | four-family parameter carrier, class functions, complete irreducible correspondence, class-indexed table and orthogonality |
| `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean:345,349` | explicit column indexing by central units and characteristic-polynomial data; the representatives are exposed |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/FieldThree.lean:108,124` | eight column labels and the actual 8×8 table, including the non-real cuspidal pair |

### Adversarial computations

The following **111 rows** cover every numbered subsection, the seeded targets, all 16 Lean theorems and eight helper definitions, the independent identities/API clauses, and every finding's mathematical target. Each equality is evaluated, not inferred from a sorry build. “Retain” means the tested statement survives these instances, not a universal proof. Algebraic symbols ω and ζ denote the specified primitive roots, with their displayed cyclotomic relations.

| Statement | Instances tried | Computed sides/values | Result; change |
| --- | --- | --- | --- |
| §0.1 class functions and descent/lift | C₂; S₃; trivial group | dimensions 2,3,1; S₃ class-indicator values (0,1,0) lift to 1 on all three transpositions and 0 elsewhere, then descend to (0,1,0) | Retain native API |
| §0.2 pairing normalization/nondegeneracy | C₂ over 𝔽₂ versus ℂ | in 𝔽₂ inverse of 2 is 0 and ⟨1,1⟩=0; over ℂ, ⟨1,1⟩=2/2=1 | Invertibility essential |
| §0.2 inverse argument/Hermitian comparison | C₃, χ=(1,ω,ω²) | correct self-pairing (1+ωω²+ω²ω)/3=1; same-argument product (1+ω²+ω)/3=0; conj(ω)=ω² | Retain; consume native comparison (R05) |
| §0.2 irreducible row orthogonality | S₃, u=(2,0,−1), trivial t | ⟨u,t⟩=(2−2)/6=0; ⟨u,u⟩=(4+2)/6=1 | Retain |
| §1.1 class sums/center | S₃, C₁,C_T,C_R | center dimension 3; coefficients of K_T are 1 on 3 transpositions, 0 on 1 and 3-cycles; conjugation preserves all six coefficients | Retain native API |
| §1.1 structure constants | S₃ | K_T²=3K₁+3K_R; K_TK_R=2K_T; K_R²=2K₁+K_R; totals 9=3+3·2, 6=2·3, 4=2+2 | Retain; unordered pairs do not carry a well-defined ordered product in this nonabelian group |
| §1.1 integral class center | S₃ K_T; trivial group | K_T³=9K_T, so monic polynomial T³−9T annihilates it; K₁−1=0 | Retain native theorem |
| §1.2 numbered sum/coefficient adapters | S₃ numbering (1,T,R), then swap T,R | numbered T coefficients remain (0 on 1, 1 on T, 0 on R); after swap its index changes 1→2, element unchanged | Valid comparison, API/Checks need completion |
| §2.1 Wedderburn/sum of squares | 1,S₃,Q₈,A₄ | 1=1²; 6=1²+1²+2²; 8=4·1²+2²; 12=3·1²+3² | Retain |
| §2.1 non-semisimple negative control | C₂ over 𝔽₂ | (g−1)²=g²−2g+1=0 while g−1≠0; invertible-order assumption fails | Correct exclusion |
| §2.2 irreducible index and finite models | S₃, same models after ULift | classes/degrees remain (1,1,2); Hom(Zᵢ,Zⱼ) dimensions δᵢⱼ; lifting the carrier changes none of these numbers | Reuse native models/classification (R05) |
| §2.3 center evaluation/count | 1,S₃,Q₈,D₄ | dimensions/counts 1,3,5,5 on both sides; trivial group's map sends a↦a | Retain |
| §3.1 product/direct-sum additivity | C₂, trivial⊕sign; zero summand | characters (1,1)+(1,−1)=(2,0); adding zero gives (2,0) again | Retain finite sum target; consume native binary product/biproduct |
| §3.2 pairing to Hom | S₃ regular representation | regular=(6,0,0); pairings with t,sgn,u equal 1,1,2, matching Hom dimensions | Retain |
| §3.2 intrinsic multiplicities/regrouping | S₃ regular; trivial group on k³; zero module | multiplicities (1,1,2), 3, 0; reconstructed dimensions 1+1+4=6,3,0 | Retain comparison with native models |
| §3.2 reversal Check | trivial group over ℝ, modules ℝ and ℝ² | Hom dimensions 2 in both directions, though ℝ is not algebraically closed | R08: symmetry also holds for finite semisimple modules over nonclosed fields |
| §3.3 equivalence adapters | identity and multiplication by 2 on a trivial ℚ-line | forward/backward composites 1 and (1/2)·2=1; characters stay 1 | Native basic adapter exists (R05); add retained comparison API |
| §3.4 degree/multiplicity character expansion | S₃ regular | degree sum 1·1+1·1+2·2=6; t+sgn+2u=(6,0,0) | Retain |
| §3.4 modular equality iff congruence | trivial group, characteristic 2 and 3 | multiplicities (1,3) cast to (1,1) in char 2; (1,4) cast to (1,1) in char 3; 1≡3 mod2 and 1≡4 mod3; 1 versus 2 in char3 gives unequal 1,2 | Both directions tested; retain |
| §3.4 characteristic-zero recognition | C₂ regular versus 1⊕1; identical regular models | (2,0)≠(2,2), so no equivalence; equal regular models have identity equivalence and equal character | Native theorem already proves this (R05) |
| §3.5 primitive idempotents | C₂, t and sgn; S₃ trivial | e±=(1±g)/2; e±²=e±, e+e−=0, e++e−=1; S₃ (Σg/6)²=6Σg/36=Σg/6 | Retain native API |
| §3.5 virtual characters | C₂, f=t−sgn=(0,2) | pairing f with t is 1, with sgn −1, with itself 2; f(1)=0, so it is not a nonzero genuine character | Retain native carrier |
| §3.5 table columns/row-only uniqueness | S₃ | column self-sums 6,2,3=6/(1,3,2); cross sums 1−1+0=0 and 1+1−2=0; swapping rows preserves every column label | Retain |
| §3.5 conjugation in column orthogonality | C₃ nontrivial columns | Hermitian sum 1+ω²+ω=0; unconjugated sum 1+1+1=3 | Retain |
| §3.6 external action/character | S₃×S₃ standard⊠standard, (t,r) | trace 0·(−1)=0; at (1,1), 2·2=4; at (r,r), (−1)²=1 | Retain |
| §3.6 irreducibility versus internal tensor | S₃ standard | external norm (4+2)²/36=1; internal character (4,0,1), norm (16+2)/6=3 | R03: replace 2 by 3 |
| §3.6 product classification/table | C₂×C₂, trivial factor | four rows (1,±1,±1,±1) from the two factor signs, degrees all 1, degree-square sum 4; G×1 has unchanged table | Statable (R06) |
| §3.6 conjugacy-class product/cardinality | transposition class in S₃ × nontrivial class of C₃ | size 3·1=3; centralizer size 2·3=6; index 18/6=3 | Retain |
| §3.6 external Hom dual/order | C₃×C₂, χ(g)=ω, sign(h)=−1 | trace χ(g⁻¹)sign(h)=−ω²; omission of inverse gives −ω≠−ω² | Add as Check (R10) |
| §3.6 Fourier bimodule equation | S₃ standard, a=(12), b=1, g=(123) | Φ(e_agb⁻¹)=ρ(ag)=ρ(a)ρ(g), trace at ag a transposition=0; RHS has same trace 0 | Retain; map must use the same models |
| §3.6 convolution scaling | C₂, coefficient δ₁ | δ₁*δ₁=δ₁; δ₁⋆δ₁=δ₁/2; (2δ₁)⋆(2δ₁)=2δ₁ | Scaling by \|G\| is correct; add Check |
| §3.7 characterValues/count | zero representation of 1; S₃ standard; C₄ χ₁⊕χ₃ | sets {0},{2,0,−1},{2,0,−2}; counts 1,3,3; class counts 1,3,4 | All eight helper definitions tested here and below |
| §3.7 interpolation polynomial | S₃ standard | P(T)=T(T+1)/6; P(2)=1, P(0)=P(−1)=0; degree 2=r−1 | Retain |
| §3.7 trace criterion/faithfulness | faithful C₄ χ₁⊕χ₃; nonfaithful trivial C₂ | identity fibre of (2,0,−2,0) is {1}; identity fibre of (1,1) is whole C₂ | Faithfulness necessary |
| §3.7 zero-fold tensor/zero carrier | trivial group U=0 | χ(U⁰)=1 with 0⁰=1, χ(Uⁿ)=0 for n>0; Hom(1,U⁰) dimension 1 | Zero-dimensional faithful case correctly included |
| §3.7 Burnside–Brauer bound | S₃ standard | U⁰=1, U¹=U, U²=1⊕sgn⊕U; occurrence exponents 0,2,1 all <3 | Retain both categorical and unbundled theorems |
| §3.7 failed nonfaithful bound | C₂, U=1, X=sgn | r=1; every χ(Uⁿ)=1; every pairing with sgn=(1−1)/2=0 | Correct negative control |
| §3.7 coefficient/pairing interchange | S₃, X=sgn | P=(T²+T)/6; ⟨P(χ),sgn⟩=(1+0)/6=1/6=dim X/\|G\| | Retain |
| §3.7 Vandermonde route | S₃ nodes (2,0,−1), X=sgn | grouped b=(1,−3,2); moment n=0 is 0, n=1 is 0, n=2 is 6≠0; determinant product (0−2)(−1−2)(−1−0)=−6≠0 | Retain |
| §3.8 series/fraction identity | C₄ U=χ₁⊕χ₃ | F₀=(1−2z²)/(1−4z²), F₂=2z²/(1−4z²), F₁=F₃=z/(1−4z²); coefficients at n=0,1,2 are (1,0,2),(0,0,2),(0,1,0),(0,1,0) respectively | Retain |
| §3.8 QF=N and zero character value | same C₄ | Q=(1−2z)·1·(1+2z)=1−4z²; N₀=1−2z², N₂=2z², N₁=N₃=z | Retain |
| §3.8 recurrence | same C₄ | R=T³−4T; e.g. m₃(χ₁)=4=4m₁, m₄(χ₀)=8=4m₂ | Retain |
| §3.8 noncancelling pole | same C₄, d=2 | at z=1/2, Q=0 and all N_j=1/2≠0; no F_j polynomial | Retain |
| §3.8 arbitrarily large powers | same C₄ | odd powers contain χ₁,χ₃ with multiplicity 2^(n−1); even n≥2 contain χ₀,χ₂ with 2^(n−1); these grow without bound on their parity | Retain |
| §3.8 positive exponent ≤r | C₂ sign U; trivial group U=0 | trivial constituent first positive exponent 2=r; zero U has no positive occurrence (all dimensions 0) | Positive-dimension hypothesis essential |
| §3.8 character span versus constituents | same C₄ | values at g,g³ are always equal; three independent rows U⁰,U¹,U² span dimension 3, yet all four simple constituents occur | Retain |
| §4.1 semisimplicity/equality case | diag(ω,ω²); matrix I+N with N²=0≠N | finite-order matrix trace −1, not 2; I+N trace 2 but not I and not finite order in char0 | Finite-order hypothesis essential |
| §4.2 cyclotomic/integral lift | C₃,S₃,Q₈ | χ(g)=ω↔ζ₃; ω+ω²=−1↔ζ₃+ζ₃²; i+(−i)=0↔ζ₄+ζ₄³ | Retain |
| §4.3 central-character normalization | S₃ standard; Q₈ standard at −1 | Ω_R=2(−1)/2=−1, Ω_T=0; Ω_{−1}=1(−2)/2=−1 | Retain; class size is essential |
| §4.3 degree divisibility | S₃ standard | ΣΩ_Cχ(C⁻¹)=1·2+0·0+(−1)(−1)=3=6/2 | Retain |
| §4.4 field of values | C₄ linear; S₃ sign; Q₈ degree two; trivial group | fields ℚ(i),ℚ,ℚ,ℚ; stabilizers respectively {1},all,all,all; fixed fields/image agree | Statement sound on these cases; supplier absent (R01) |
| §4.4 arbitrary-function negative control | C₃, f=(0,i,i) | power invariance holds for exponents 1,2, so H=all; fixed field ℚ but ℚ(f)=ℚ(i) | Representation/character hypothesis required |
| §4.4 class-power direction | C₅ χ(g)=ζ₅ | exponent 2 gives ζ₅²; inverse exponent gives ζ₅³≠ζ₅² | Use in repair of R01 |
| §4.5 splitting-field realization | C₃; Q₈ | linear root action is defined over ℚ(ζ₃); Q₈ matrices diag(i,−i) and [[0,1],[−1,0]] square to −I and anticommute over ℚ(i) | Retain native theorem plus precise universe transport |
| §4.6 coprime zero-or-scalar alternative | S₃ transposition, standard/sign | gcd(3,2)=1, standard trace 0; sign dimension1, action −1 scalar | Both branches required: modulus equality belongs to the nonzero branch |
| §4.6 solvability | A₄,D₆,A₅ | orders 12=2²·3,12=2²·3,60=2²·3·5; first two solvable, third outside hypothesis | Retain native theorem |
| §5.1 coordinate multiplication | S₃ trivial central row (1,3,2) | Ω_T²=9=3·1+3·2; Ω_TΩ_R=6=2·3; Ω_R²=4=2·1+2 | Retain |
| §5.1 left-row convention | S₃ M_T=[[0,3,0],[1,0,2],[0,3,0]] | rows (1,3,2),(1,−3,2),(1,0,−1) multiply to (3,9,6),(−3,9,−6),(0,0,0); wrong column result for first is (9,5,9) | Retain |
| §5.1 normalized eigenrow iff algebra hom | C₂ M_g=[[0,1],[1,0]], v=(1,a) | vM=(a,1)=a(1,a) iff a²=1; over ℂ a=±1, exactly the two algebra homs | Both directions survive |
| §5.1 commuting matrices | S₃ | M_TM_R=2M_T=M_RM_T; M₁=I | Retain |
| §5.2 degree recovery | S₃ central standard row | Σs_C⁻¹Ω_CΩ_C⁻¹=3/2; 6/(3/2)=4; positive degree=2, not −2 | Retain |
| §5.2 specification excludes wrong scaling | C₂ row t versus 2t | normalized Ω identical (1,1); row norms 1 and4; degree-square sum for (2t,sgn) is5≠2 | Orthonormality/square sum exclude scaling |
| §6.1 exact ring/basis comparison | e=1,3,4 | Φ₁=X−1 gives ℤ; ζ₃² coordinates (−1,−1); ζ₄²=(−1,0); same generator/image under E | Retain theorem |
| §6.1 conjugate wrong model | e=4, x=ζ₄ | correct coordinates (0,1), conjugate model (0,−1); embeddings i versus −i | R08 corrects the exclusion claim |
| §6.2 class data and kernel transpose | S₃ row (1,3,2), λ=3 | (M_Tᵀ−3I)vᵀ=0; (M_T−3I)vᵀ=(6,−4,3)≠0 | Retain |
| §6.3 canonicalPowerBound | e=0,1,3,4,12 | A₀=1 by empty supremum/max; A₁=A₃=A₄=A₁₂=1; for e=12, ζ⁴=−1+ζ², ζ⁶=−1 | Theorems correctly exclude e=0 |
| §6.3 coefficient addition/scaling | e=3, x=ζ, y=ζ² | x+y=−1, coords (0,1)+(−1,−1)=(−1,0); 2x has (0,2), absolute bounds 0≤1,0≤2 | Retain |
| §6.3 eigenvalue multiplicities/trace bound | S₃ standard at 3-cycle, e=6; V=0 | m₂=m₄=1, Σm=2; ζ₆²+ζ₆⁴=−1, coordinate magnitude1≤2A₆; zero V has all m=0 and bound0 | Retain |
| §6.4 exactness needs cyclotomic membership | e=1, z=1/2; z=√2 | 1/2 lies in ℚ but is not integral; √2 is integral but not in ℚ; neither lies in image ℤ | Both hypotheses necessary |
| §6.4 division-free central bound | S₃ standard at 3-cycle | d=2,s=2,x=−1,w=−1; dw=−2=sx; coordinate1≤2A₆≤6A₆ | Retain |
| §6.4 bad old coefficient window | S₄ trivial row, 3-cycle | Ω=8, old threshold 2⌊√24⌋=8<13; 2·8=16>13 and balanced residue is −5; B=24 gives 48<61 | Retain general bound, no good-prime shortcut |
| §6.4 A₄ linear value | class of 3-cycles | χ=ω, Ω=4ω; in conductor3 coords(0,4); in native conductor6, ω=ζ₆²=ζ₆−1 so coords(−4,4); both bounds4 | Distinguish conductor from group exponent |
| §6.5 strong primes | 1,C₃,S₄ | (e,B,p)=(1,1,3),(3,3,7),(12,24,61); inequalities2<3,6<7,48<61; p−1 divisible by e | Retain |
| §6.6 bounded exact certificate | C₂ | ordinary=central=[[1,1],[1,−1]], degrees(1,1), degree squares2, row Gram I, coefficient max1≤B=2 | Retain |
| §6.6 power permutation | C₅ b=2; A₅ b=2 then7 | C₅ exponents permuted by2, inverse3; A₅ b2 collapses identity/involutions; b7 fixes their orders and swaps5-cycle classes | R04 |
| §6.6 degree identity/uniqueness | S₃ degree-two row; trivial group | T=6+3=9=(6/2)², m²·9=36 gives positive m=2; T=1,m²=1 gives m=1 | Retain |
| §6.6 reduction at conjugate roots | C₅, p=11, primitive root α=3, b=2 | reduce_{α}(ζ²)=3²=9; reduce_{α²}(ζ)=9; inverse exponent gives3³=5≠9 | Retain direction |
| §6.7 completeness/search bound | S₄ B=24,p=61,e=12 | candidate p=e(k+1)+1 at k=4; coefficient window48<61. This provides a finite candidate budget (at least5), conditional on the specified primitive-root data | Retain proof route; no full solver evaluation claimed |
| §6.7 ordinary conversion | S₃ standard 3-cycle | dΩ/s=2(−1)/2=−1; cleared identity−2=−2 makes division exact | Retain |
| §7.1 square characters | S₃ standard | Sym²=(3,1,0), Λ²=(1,−1,1); invariant multiplicities1 and0; ν=1−0=1 | Retain |
| §7.1 trichotomy/realizability | D₄,Q₈,C₃ nontrivial | square-character sums8,−8,0; indicators+1,−1,0; invariant symmetric/alternating dimensions(1,0),(0,1),(0,0) | Retain |
| §7.2 involution count | D₄,Q₈,S₃,S₄,A₅ | 6=4+2, 2=4−2,4=1+1+2,10=1+1+2+3+3,16=1+3+3+4+5 | Retain |
| §7.2 square roots at nonidentity | C₃, x=g | unique root g²; RHS trivial row1 plus two indicators0 equals1 | Retain general-x form |
| §7.2 real classes/count | C₃,Q₈ | real classes1,5; real-valued irreducible rows1,5; Q₈'s real-valued degree-two row still has ν=−1 | Real-valued does not mean realizable over ℝ |
| §7 Examples GL₂(𝔽₃) | three cuspidals, native order | square sums(48,0,0), indicators(1,0,0), versus claimed(−1,−1,−1); involutions14 | R02 |
| §8.1 Frobenius complement/kernel | S₃ H=C₂; affine group over𝔽₅ H=C₄ | kernel sizes3,5 equal indices; complement orders2,4 divide2,4 respectively | Retain |
| §8.1 T.I. negative control | D₄ H=⟨s⟩ | r² centralizes H but r²∉H; proposed kernel set has6 elements, while index4, impossible subgroup order6∤8 | Retain |
| §8.2 degree-corrected exceptional extension | S₃ H=C₂, φ=sgn_H | Ind(sgn)−Ind(1)+1=sgn_G; degree1 preserved, norm1; difference from trivial has norm2 | Retain |
| §9.1 class and degree counts | q=2,3 | class counts(q−1,(q−1)(q−2)/2,q−1,q(q−1)/2)=(1,0,1,1),(2,1,2,3); totals3,8 | Retain, q=1 excluded by Field |
| §9.1 principal series boundary | q=2, α=β=1 | dim3=q+1; decomposition1⊕degree2, so not simple; α≠β false | Both sides of criterion false |
| §9.1 distinct principal characters | q=3, α=1, β=sign | dimension4; norm1; distinct pair gives simple representation | Retain arbitrary-universe target |
| §9.2 degree-square tally | q=2,3 | 1+4+0+1=6;2+18+16+12=48 | Native assembled table exists (R05) |
| §10.1 S₃ explicit basis/action | τ=(012), σ=(01) | τα=(ω²,1,ω)=ω²α; τβ=(ω²,ω,1)=ωβ; σα=β,σβ=α; coordinate sums0 | Retain |
| §10.1 symmetric-square intertwiners | τ,σ on (α²,β²,αβ) | τ eigenvalues(ω,ω²,1); β² has eigenvalueω², α² eigenvalueω; σ swaps squares and fixesαβ | Retain |
| §10.1 symmetric-cube intertwiners | τ,σ | α³±β³ τ-fixed, σ eigenvalues±1; α²β,αβ² τ eigenvaluesω²,ω and σ swaps them; character(4,0,1) | Retain |
| §10.2 cube fixed-point characters | classes1,(01),(01)(23),(012),(0123) | vertices(8,0,0,2,0); edges(12,2,0,0,0); dimensions8,12 | Retain |
| §10.2 cube decompositions/multiplicity | same classes, weights1,6,3,8,6 | vertex multiplicities(1,1,0,1,1); edge(1,0,1,2,1); weighted standard pairing(36+12)/24=2 | Retain |
| §10.2 matching quotient | (01),(012),(0123) | swaps(M₁,M₂), cycles(M₀,M₁,M₂), swaps(M₀,M₁); kernel has4 elements; E character(2,0,2,−1,0) | Retain |
| §10.3 A₄ table/restriction | Res E, Res V, Res sgn | (2,2,−1,−1)=L₁+L₂; (3,−1,0,0)=T; sign=(1,1,1,1); degree squares12 | Retain |
| §10.3 Fourier eigenvectors | v_j=Σω^(−jr)δ_{q(012)^rM₀} | shift sends v_j↦ω^jv_j; coefficient sum1+ω^(−j)+ω^(−2j)=0; j1,2 distinct eigenvalues | Retain |
| §11.1 two-particle decomposition | four displayed mode vectors | (r,s) signs(+,+),(−,+),(+,−),(−,−); H eigenvalues−2,0,0,0; character(4,0,0,0) | Retain; source labels corrected |
| §11.1 force linearization | v=(1,0), w=(a,b); v=(1,1), w=(a,b) | P_vw=(a,0); respectively((a+b)/2,(a+b)/2); scale κ/m | Retain nonzero-v/equal-mass assumptions |
| §11.1 transverse definitions/energy | ε=0,1/2; κ arbitrary for limit | length1,√2; E(0)=0; E(1/2)=κ(√2−1)²/2; E/ε⁴=8κ/(√2+1)²≈1.37258κ | Retain |
| §11.1 quartic limit/positivity | ε→0, κ>0; κ=0 | rationalized quotient→8κ/4=2κ; E,E′,E″ at0 all0; κ0 gives E identically0 so strict positivity needsκ>0 | Lean limit correctly permits anyκ |
| §11.1 straight versus rotated paths | a≠0,t≠0 | straight acceleration0, force first componentκ(1−1/√(1+4a²t²))>0; rotated separation norm1 and potential0 | Retain distinction from Newton trajectories |
| §11.2 three-particle spectrum | (1,0,−1),(1,1,1),(1,−2,1) | H values(−1,0,1),0,(−3,6,−3); r signs+,-,-; multiplicities1,2 | Retain |
| §11.3 tetrahedron energy/operator | z_ij with squared norm4; six edges | trace H=−6·4=−24; uᵀHu=−Σ(zᵀu)²≤0; physical scaleκ/(2m) | Retain |
| §11.3 eigenspaces | A diagonal trace0, off-diagonal symmetric, I, skew; translations | H eigenvalues−2,−4,−8,0,0 with dimensions2,3,1,3,3; total12; characteristic polynomial X⁶(X+2)²(X+4)³(X+8) | Retain |
| §11.3 polynomial coefficients/frequencies | expansion; κ=m=1 | X¹²+24X¹¹+228X¹⁰+1104X⁹+2880X⁸+3840X⁷+2048X⁶; frequencies1 twice,√2 three times,2 once | Retain |
| §11.3 subgroup fixed spaces/seeds | S₃ stabilizer; D₄ square subgroup | dimensions3,2; four Aᵢ=qᵢqᵢᵀ−I/4 sum0 and span dimension3; three diagonal seeds sum0 and span dimension2 | Retain |
| §11.3 wrong inverse convention | g=(12),h=(23); u supported at vertex1 with valueq₁ | wrong-action A′_gA′_h has support vertex2,valueq₂; A′_{gh} has support vertex3,valueq₂; transposition alone gives no distinction | R08: use group law or a genuine 3-cycle witness |

### Source sample and locator audit

All 13 distinct bibliography works were attempted through the sources service; three texts were read, four were classified as paywalled/uncertified, and six were not located legally by those attempts. No sources manifest exists in the target folder, and this review changes none. The README has no individually flagged “unverified” locator. These are the **15 seeded targets**, including what a source supports and what remains a local derivation. Source line numbers refer to the service's numbered extractions, not PDF image coordinates.

| Seeded target | Locator, hypotheses and result |
| --- | --- |
| 1.1 Class sums/center | Curtis–Reiner unavailable. Native `TauCeti/RepresentationTheory/CharacterTable/ClassSum/Basic.lean:31,42` defines the sum/indicator; `Integral.lean:48,59` supplies integral-center integrality and coefficient transport. S₃ checks ordered-pair multiplication. No printed locator certified. |
| 1.2 Executable class sums | Native `Dixon/ClassData/Basic.lean:167,226,256,336,422` supplies numbered finite classes and multiplication data. The new coefficient comparison is a finite-sum derivation; no bibliographic locator is given. |
| 2.1 Wedderburn/sum of squares | Native `CharacterTable/Wedderburn.lean:67,108,127,137` gives dimension identity, block count and existence. Existence needs algebraic closure and nonzero group order in k; the numerical identity only needs a supplied decomposition. Curtis–Reiner unavailable. |
| 3.4 Multiplicity/recognition | Native `CharacterTable/Determined.lean:74,117,127` supplies characteristic-zero recognition. The modular variant follows from character-basis coefficient uniqueness and equality of natural casts modulo p; m=0,p tests its boundary. No source locator for that extension (R09). |
| 3.5 Idempotents/virtual characters/columns | Fulton–Harris Proposition 2.30 and (2.31)–(2.32), pp. 22–23, `fulton-harris line 773`–`812`, supports completeness, virtual characters and projectors. Exercise 2.21, p. 18, `line 674`–`689`, gives column orthogonality for a square table. Source coefficients are ℂ; the roadmap's wider field statement uses native pairing/basis results. |
| 3.6 External products/classification | Fulton–Harris Exercise 2.36, p. 24, `fulton-harris line 837`–`845`, states product action/character, irreducibility and exhaustiveness for finite complex representations. Factorwise uniqueness follows by restriction/Schur. Add this locator; the wider-field, external-Hom and Fourier claims require their own derivations. |
| 3.7 Burnside–Brauer | Steinberg arXiv:1409.7632v2, Introduction, pp. 1–2, `steinberg-bbs line 21`–`37`, `48`–`54`: characteristic zero, finite group, finite-dimensional faithful representation, powers 0,…,r−1. Supports the ℂ statement. Isaacs Theorem 4.3 unread. |
| 5.1 Multiplication matrices | Native `CharacterTable/ClassSum/MultiplicationMatrix.lean:67,85,98,107,142` fixes entry (j,k)=aᵢₖⱼ and column-coordinate multiplication, distinguished from central-character left eigenrows. S₃'s nonsymmetric M_T tests the side. Dixon/Schneider texts uncertified. |
| 6.1 Exact ring/integer ring | Mathlib `NumberTheory/NumberField/Cyclotomic/Basic.lean:801,816,836,850,855,862` supplies integral closure, equivalence and power basis under nonzero conductor/cyclotomic-field hypotheses. Generator/coordinate compatibility is the new comparison. Tests e=1,4,5 include conjugation (R08); no printed locator verified. |
| 6.6 Certificate/power/degree | Native `Dixon/Cyclotomic/Solver.lean:364` assumes a bounded certificate; the new coordinate bound supplies it. R01 still blocks the cited descent. Substitution Ω_C=s_Cχ(C)/d into orthogonality gives T=n²/d². A₅ b=2 violates coprimality (R04). No source locator for the new identities. |
| 7.2 Realizability/involutions/real classes | Native `CharacterTable/FrobeniusSchur/Realizability.lean:68,83` gives ν=1 iff real realizability for irreducible complex representations; `InvolutionCount.lean:178,251` gives root/involution counts; `RealClasses.lean:252,267` counts real rows/classes. Serre/Isaacs unread. GL₂(𝔽₃) application fails (R02). |
| 10.2 Cube/S₄ | Fulton–Harris §2.3, table p. 19 and quotient p. 20, `fulton-harris line 701`–`730`; Example 2.24/Exercise 2.25, p. 20, `line 732`–`755`, supplies the action and asks for vertex/edge decompositions over ℂ. Enumeration of all 24 rotations gives class sizes (1,6,3,8,6), fixed rows (8,0,0,2,0),(12,2,0,0,0). Intertwiners are additional targets. |
| 10.3 S₄→A₄ | Fulton–Harris Exercises 2.26–2.27, pp. 20–21, `fulton-harris line 725`–`728`, `757`–`770`, gives quotient characters/table and asks for restrictions. The roadmap's explicit Fourier vectors are additional constructions; shifting gives ωʲ as computed. James–Liebeck unread. |
| 11.1 Two particles | Knutson §§1.1–1.4, pp. 1–2, `knutson-tetrahedron line 18`–`43`, `50`–`86`, gives force linearization/symmetry/eigenvectors; p. 3, `line 89`–`91`, notes failure of transverse straight-line approximation. Printed mode labels have the misprint below. Quartic coefficient 2κ/rotated path are correct local derivations, not printed formulas. |
| 11.2 Three particles | Knutson §2, p. 3, `knutson-tetrahedron line 93`–`117`, gives H, signed reflection, multiplicities1,2 and eigenvalues−1,0,−3 with the stated vectors. Direct multiplication verifies the nonscalar sign isotypic component. |

Additional readable-source checks: Steinberg Remark 1, p. 5, `steinberg-bbs line 217`–`224`, supports the positive-power refinement; it does not itself state the roadmap's grouped rational generating series or recurrence, which were checked algebraically. For the trivial group the separate dim(U)>0 condition handles the zero representation. Fulton–Harris §1.3, Exercises 1.10–1.11, pp. 10–11, `fulton-harris line 501`–`545`, supports the S₃ eigenbasis and symmetric powers after the roadmap's explicit exchange of α/β labels. Fulton–Harris §5.2, pp. 68–70, `fulton-harris line 1803`–`1894`, gives the four GL₂ families and table. Its square-root model of the quadratic extension is for odd q, and it expressly leaves even q modifications as an exercise (`line 1819`–`1820`); the native general finite-field construction, and the q=2 test, are therefore material. Knutson §3, pp. 3–5, supplies the tetrahedron symmetry argument, but the full spectrum and physical normalization are independently checked here: direct construction of the 12×12 integer matrix gives trace −24 and eigenvalues −2,−4,−8,0 on the displayed matrix modes.

## Not verifiable

These are access limitations, not mathematical counterexamples. All attempts used the sources service; unread contents were not guessed. This review is complete and is not suspended for those texts.

| Source | Where looked; what remains uncertified |
| --- | --- |
| isaacs | Author/title lookup found no legal text. Chapters 2–4,7,9 and Theorem 4.3 unread; Steinberg separately verifies the sampled tensor bound. |
| curtis-reiner | Author/title lookup found no legal text. The cited chapter range for §§1.1,2.1 unread; native statements checked instead. |
| james-liebeck | Cambridge DOI 10.1017/CBO9780511814532 yielded no open text. Ch.18 numbering/content unread; Fulton–Harris independently covers the sampled examples. |
| burnside | Author/title lookup found no text; no printed solvability-proof locator certified. |
| hulpke | Author/title lookup and the author's old-course index did not identify the exact cited representation-theory notes. Different computational-group notes were not substituted. |
| deligne-lusztig | DOI 10.2307/1971021 led to JSTOR without an open text. The claimed specialization on pp.103–161 was not verified. |
| serre | Service classified Springer citation as paywalled/uncertified; printed contents and exact hypotheses unread. |
| dixon | Service classified Springer citation as paywalled/uncertified; printed contents and exact hypotheses unread. |
| schneider | Service classified Elsevier citation as paywalled/uncertified; printed contents and exact hypotheses unread. |
| bonnafe | Service classified Springer citation as paywalled/uncertified; printed contents and exact hypotheses unread. |

The four paywalled/uncertified works were not added to the missing-text request. The successful institutional Fulton–Harris fetch resolved its initial missing-text entry. No manifest was edited.

## Source issues

- **Misprint** in knutson-tetrahedron at §1.4, printed page 2 (`knutson-tetrahedron line 82`–`85`): the source says the common vertical and common horizontal translation modes have reflection signs (+,−) and (−,+), respectively; it should be (−,+) and (+,−), respectively, for its displayed r and s; affects a stated result.
