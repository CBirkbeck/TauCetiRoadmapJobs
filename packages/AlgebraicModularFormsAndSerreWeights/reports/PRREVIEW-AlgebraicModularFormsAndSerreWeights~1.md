# Review of AlgebraicModularFormsAndSerreWeights (pull request #928 at 4e550b1)

**Verdict:** needs changes

## R01 (P2) — Remove the upward ClassFieldTheory dependency

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:83`, also 1624 and 1683: “ClassFieldTheory Layer 11”.

**Claim:** Global reciprocity supplies the Dirichlet-character branches of the two classical attachments.

**Witness:** The dependency check places this roadmap at 92 and ClassFieldTheory at 255. It also reports that moving this roadmap beyond that supplier would cross its consumer AdmissiblePairsAndPadicHodgeStructures at 189.

**Repair:** Replace these supplier edges with the character construction and recognition already owned by ArithmeticGaloisRepresentations §2.3, explicitly distinguishing the direct cyclotomic construction from the converse finite-character classification. That section supplies both; do not reconstruct global reciprocity here or merely move this roadmap below its consumer. Its direct construction sends arithmetic Frobenius at q to ε(q). For ε=χ₋₃ and q=2 this gives −1, and the weight-one Eisenstein sum has trace 0 and determinant −1, exactly the required test. A scratch-copy dependency probe with this change and R02 returned zero problems; re-run it on the repaired head.

## R02 (P2) — Remove the redundant upward AlgebraicCurves dependency

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1592`, also the supplier table at 82: “AlgebraicCurves Layer 12E and JacobianChallenge Layers A–B”.

**Claim:** Both supply coherent curve cohomology and Serre duality for the parabolic realization.

**Witness:** The dependency check reports 92 → 238. `TauCetiRoadmap/AlgebraicCurves/README.md:1155` describes 12E as a comparison with function-field divisors and explicitly imports the cohomology from JacobianChallenge A–B.

**Repair:** Cite JacobianChallenge A–B directly for the smooth proper geometric curves used here, and SchemeAndStackFoundations §§2.19–2.21, 3.3 for the stated general duality interfaces. Delete the unused function-field comparison edge from both locations. On ℙ¹, these suppliers give dim H⁰(O)=1 and dim H¹(O)=0; on a genus-one curve they give 1 and 1. Nothing in those required computations uses AlgebraicCurves 12E. The scratch-copy probe applying R01–R02 returned zero problems.

## R03 (P3) — Delete the 84 HTML target anchors

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:94`, and the other 83 gate matches: `<a id="target-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction"></a>`.

**Claim:** These anchors implement the internal target links.

**Witness:** The supplied gate reports `residue=84`; its rule explicitly forbids `<a id=` tags.

**Repair:** Delete the tags and rewrite internal links to the ordinary Markdown heading fragments. For example, the Raynaud link should address `#the-raynaud-input-and-its-boundary`. Preserve the mathematical target and verify every rewritten link. That replacement identifies the same heading without the forbidden tag.

## R04 (P3) — Put the layers and target headings into the required shape

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1562`, 1598, 1630 and 1662: “### R15.5A.1 The classical rank-two cohomological summand”.

**Claim:** The arithmetic identifiers provide the roadmap's layer and subsection structure.

**Witness:** The gate reports `target-ids=4`, requiring `### k.n Title`. The seven layer headings use R15 identifiers; the attachment layer also lacks the required closing Examples and Dependencies subsections.

**Repair:** Number the seven layers 1–7 and their mathematical subsections k.n in build order, updating links and references consistently. Add the attachment layer's Examples and Dependencies, and use the required References and Downstream consumers headings. For example, the four attachment targets become 6.1–6.4, preserving their order before residual modularity. The four offending heading prefixes then disappear.

## R05 (P3) — Use the roadmap namespace and Lean layer order

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/Suggested.lean:42`, 103, 145 and 174: “namespace TauCeti.ClassicalModularGalois”.

**Claim:** The seven target signatures are declared directly in several library namespaces.

**Witness:** There is no `namespace TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights`, and the declaration order is attachment, residual attachment, lifting, denominators, then prime moments, without layer section comments.

**Repair:** Put the signatures in the required roadmap namespace, using nested topic namespaces if useful, and order them by their README layers with `/-! ## Layer k: … -/` comments. Update all seven README names. Keep the statements and their sorry bodies; repeat the seven `#check @…` probes after renaming. This changes ownership and presentation, not the hypotheses verified below.

## R06 (P3) — Correct the Diamond–Shurman DOI

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:464`: “Diamond–Shurman … Proposition 5.8.5”, linked to DOI `10.1007/b138227`.

**Claim:** The link identifies *A First Course in Modular Forms*.

**Witness:** The source service resolves that DOI to *Landschaftsformen*. The [publisher's book record](https://link.springer.com/book/10.1007/978-0-387-27226-9) identifies Diamond–Shurman's book with DOI `10.1007/978-0-387-27226-9`.

**Repair:** Replace the DOI, supply the edition and proposition page, and retain an `uncertified` status unless its text is legally available. The corrected DOI resolves to the intended authors and title. I did not certify Proposition 5.8.5 from publisher metadata; the recurrence itself was independently compared with the pinned coefficient theorem and Deligne–Serre §1.6.

## R07 (P3) — Add the required source inventory

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1891`, “Sources and pagination”, and the folder inventory.

**Claim:** The bibliography and inline links are the complete source record.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml, but no sources.toml. The source audit encountered 20 distinct scholarly works and a separately versioned code reference.

**Repair:** Add the prescribed `tauceti-roadmap-sources/v1` manifest, with one stable key per work, exact locators, cited targets, version notes and the source service's access/provenance fields. In particular, distinguish the Edixhoven author DVI from journal pagination and record the corrected Diamond–Shurman DOI as uncertified. A manifest lookup must recover the intended work rather than require following every repeated inline URL. This review has not edited a manifest.

## R08 (P3) — Give the Igusa construction discriminating Checks

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:817–823`: “This target constructs its tautological differential”.

**Claim:** The new differential, deck action and ordinary operator have their specified normalizations.

**Witness:** This defining subsection has no Checks block. In characteristic 5, deck scalar u=2 gives u⁻¹=3 on f/a; the plausible direct-character convention gives 2 instead.

**Repair:** Add the definition's API bullets and at least three computed Checks. Include that inverse-character calculation, the change a↦−a and f/a↦−f/a under the nontrivial characteristic-3 deck element, and a width-three Tate chart in characteristic 2 where θ(t)=(1/3)t=t and the construction requires no division by 6. These distinguish direction, differential normalization and the small-prime domain.

## Verified sound

This review read both listed files at the specified head, the normative writing checklist and contribution rules, and the main-branch ModularForms and ModularCurves examples. There was no previous AI review to reconcile. There are **8 findings: 0 P1, 2 P2 and 6 P3**. The two supplier edges block acceptance. No edits were made to the pull-request worktree.

The supplied full gate reports `residue=84`, `target-ids=4`, `depcheck=2`, all other counters zero, and **FAIL**. In particular its targeted build passed, and it found no sorry-data, set_option, admitted examples, disallowed imports, stray files or outside-folder edits. The independent outside-folder diff was empty. The requested dependency command was run again with `--movable`; its complete output was:

```text
not movable: AlgebraicModularFormsAndSerreWeights consumes ClassFieldTheory (#255) and is consumed by AdmissiblePairsAndPadicHodgeStructures (#189), which comes first: moving AlgebraicModularFormsAndSerreWeights after ClassFieldTheory would put a supplier after a consumer, a cycle through AlgebraicModularFormsAndSerreWeights
UPWARD: AlgebraicModularFormsAndSerreWeights (#92) -> AlgebraicCurves (#238) at README lines [1592]
UPWARD: AlgebraicModularFormsAndSerreWeights (#92) -> ClassFieldTheory (#255) at README lines [83, 1624, 1683]
depcheck: 164 roadmaps, 1174 edges, 2 problem(s)
```

The first line is an obstruction to moving the package, rather than evidence that the mathematical definitions themselves are circular. R01–R02 remove the unnecessary edges instead. No merge-order file was edited. A separate scratch copy replaced the ClassFieldTheory references by ArithmeticGaloisRepresentations §2.3 and removed the redundant AlgebraicCurves references; the same dependency command then returned:

```text
depcheck: 164 roadmaps, 1172 edges, 0 problem(s)
```

This is validation of the proposed edge repair, not a passing gate for the unchanged pull-request head.

In the compared source passages I found no copied prose. The mathematical scope retains level-prime denominators, coefficient primes dividing the level, torsion coefficients, p=2,3 and inseparable DVR extensions where claimed. The finite arithmetic tables and small calculations are definitions/Checks, not proposed computational algorithms. The explicit geometric and local additions distinguish this roadmap from the analytic ModularForms base.

**Lean and headline coverage.** `lake env lean` on Suggested.lean succeeded with exactly seven sorry warnings. A scratch copy with `#check @name` for every declaration also succeeded. The elaborated lifting signature includes both `Module.Finite O M` and `Module.Free O M`; its fraction-field, valuation and residue-embedding hypotheses survive. The residual signature retains a finite discrete coefficient field, positive weight, the specified residue-kernel equation, integral coefficients and a nonzero reduction. The higher-weight attachment retains k≥2 and an actual holomorphic character-space eigenvector. The moment signatures use the nonzero *cuspidal* eigenform carrier. No dropped-hypothesis discrepancy was found.

The seven statable headline results are: all-prime bounded denominators; Deligne–Serre eigenvalue lifting; higher-weight attachment; weight-one prime moment; weight-one finite-eigenvalue density; weight-one Artin attachment; residual attachment. All seven are present. The module docstring separately names the analytic/geometric comparison, geometric q-expansion/base change, theta cycles, supersingular periodicity, weight reduction, local finite-flat/weight comparisons, controlled geometric lifting, filtered parabolic realization and residual witness/Serre-target interfaces whose requisite geometric or local carriers are missing. None is replaced by a bare Prop or an arithmetic table in Lean. Universal Serre modularity and weight/level optimization are expressly outside this roadmap, so their absence is not a missing headline.

All seven sorry bodies were independently probed with closing `simp`, `rfl` and `infer_instance` branches on a scratch copy; **0 of 7 closed**. Object searches and the pinned declarations below supplied no one-library-lemma proof of a headline. The formal coefficient and elementary boundary calculations remain in the README, not as padding in Suggested.lean.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are repository-relative paths in the corresponding pinned library:

| Declaration / object | Pinned file and line | What its hypotheses and body establish |
| --- | --- | --- |
| `modFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:315` | Intersection of diamond eigenspaces in holomorphic ModularForm; it does not impose cuspidality or normalization. |
| `HeckeRing.GL2.heckeTNat` | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.lean:84` | Actual level-Γ₁ Hecke endomorphism, with nonzero index. |
| `HeckeRing.GL2.EigenformAwayFromLevel` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84` | Extends CuspForm, includes nonzero and character membership; stores eigenvalues only at indices coprime to level, and does not require a₁=1. |
| `Eigenform.exists_toCuspForm_eq_and_χ_eq_iff_ne_zero_and_forall_prime_qExpansion_coeff_prime_mul` | `TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean:238` | Full prime recurrence, including the divisibility guard and bad-level primes. The README compares its normalized version with this owner. |
| `AlgHom.IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean:54` | φ(x)−x^card(R/p) lies in Q for every x. Finiteness/nonzero cardinality is not part of this predicate; the number-field prime hypotheses here give cardinality q. |
| `Representation.IsSemisimpleRepresentation` | `Mathlib/RepresentationTheory/Semisimple.lean:34` | Every subrepresentation has a complement; continuity and finite image are separate conditions and are stated separately. |
| `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59` | Symmetric power of the standard GL representation over a commutative ring; it is not the modular-curve local system. |
| `Algebra.adjoin_le` | `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:550` | Generated-subalgebra containment, used without replanning a generic adjoin theorem. |
| `Algebra.HasGoingDown.of_flat`; `Ideal.exists_ideal_le_liesOver_of_le` | `Mathlib/RingTheory/Ideal/GoingDown.lean:153`, line 49 | Flatness supplies going down; both base ideals and the upper ideal have prime hypotheses. |
| `Module.mem_support_iff_of_finite` | `Mathlib/RingTheory/Support.lean:200` | Support equals the primes containing the annihilator, with module finiteness in scope. |
| `IsArtinianRing.isNilpotent_jacobson_bot`; `localization_artinian` | `Mathlib/RingTheory/Artinian/Ring.lean:54`, line 92 | Nilpotence and localization used in the socle route. |
| `TensorProduct.AlgebraTensorModule.map_tmul` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean:188` | The specified two maps act on pure tensors; scalar compatibility is retained. |
| `TauCeti.integralClosure.isDedekindDomain` | `TauCeti/RingTheory/DedekindDomain/IntegralClosure.lean:111` | Finite extension of a fraction field, compatible scalar tower; no separability and no claim that normalization is module-finite. |
| `PowerSeries.expand`, `expand_C`, `coeff_expand_mul`, `coeff_expand` | `Mathlib/RingTheory/PowerSeries/Expand.lean:33`, 39, 87, 110 | Substitution q↦q^p with p≠0, fixing coefficients; this is the coefficient-linear V, not absolute Frobenius. |
| `DirichletCharacter.LFunction_apply_one_ne_zero` | `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:405` | Requires a nontrivial Dirichlet character; the distinct-character comparison uses precisely that case. |

**Ownership and supplier resolution.** Searches were by objects (Hodge sections, integral cusp lattices, coefficient selection, coherent Hecke, local weights, finite-flat models, eigencharacter lifting, parabolic realizations and Galois attachments), through `roadmaps grep`, the pinned libraries and the board packages. The available supplied sibling checkouts were included in the ownership search. An index hit alone was not treated as a resolved supplier. No duplicate of one of the seven fully qualified headline names was found in the searched readable roadmaps. Open revisions of existing roadmaps were not substituted for main-branch suppliers.

The following 16 supplier texts were resolved and their relevant passages read. Line numbers refer to the README at main or the supplied new-roadmap head, not to the scratch copies:

| Supplier | Resolved sections / witness lines | Ownership boundary checked |
| --- | --- | --- |
| ModularForms, main | Layers 0, 4–5, 8, 8G, 8W, 10C; lines 259, 532, 638, 764, 917–935, 1119 | Analytic carriers, old/new theory, modular-symbol integral structure, weight-one all-cusp lattice and analytic automorphy. 8W is prose inside Layer 8, not a missing heading. The new higher-weight geometric lattice is distinguished from these inputs. |
| ModularCurvesPartII, new head | §§2.6–2.7, 3.1–3.2, 3.7, 3.9, 4.1–4.4, 5.21; lines 698, 741, 935, 969, 1126, 1201, 1422, 2218 | Quotients, contraction, level stacks, cusp charts, proper rigidifying covers. |
| ModularCurvesPartII, same head | §§7.1–7.1a, 9.1–9.3, 9.9–9.11, 11.1; lines 2384, 2411, 2726, 2959, 3010, 3169 | Hodge line, characteristic-zero KS, isogenies/coherent Hecke and Igusa cover. Integral logarithmic comparison, the auxiliary Fricke square and tautological Igusa differential are the present roadmap's additions. |
| ModularCurvesPartII, same head | §§14.1–14.4a, 14.11; lines 3741, 3774, 3801, 3824, 3850, 4021 | Geometric coefficient systems, parabolic image and comparisons. The current target retains the pairing's factorial, dual-lattice and vanishing restrictions; it owns the filtered decomposition and primitive multiplicity. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, new head | R07.1–R07.3, R07.5, especially §R07.1.24 line 1901 and §§R07.5.6–5.6a lines 7614, 7656 | Maximal models, tame/Fontaine–Laffaille data and odd-prime finite-coefficient Kummer comparison. The dyadic coefficient-torsor/descent construction is explicitly retained here. |
| ArithmeticGaloisRepresentations, new head | §§1.6–1.9, 2.1–2.3, Layer 3, §4.6, §§5.1–5.7; lines 1007, 1053, 1100, 1121, 1652, 2998, 3134, 3315 | Stable lattices, semisimplification, inertia, conductor, induced-dihedral identification, coefficient descent and recognition. §2.3 also resolves R01. |
| SchemeAndStackFoundations, main | §§2.19–2.21, 3.3; lines 4094, 4275, 4390, 4713; completion/formal-functions inputs in §§4.8–4.9 | General adjunction, trace, coherent duality and foundational q-expansion inputs remain suppliers. |
| ComplexComparisonPartII, new head | C−1.2, C0.4, C1.7–C1.9, C2.1–C2.2, C5.6, C6.3–C6.6; lines 787, 1046, 1560, 1608, 1664, 1711, 1736, 3743, 4166 | Analytic quotient/GAGA and characteristic-zero canonical extension; no integral connection is inferred solely from the complex construction. |
| AbelianSchemesAndArithmeticModuli, new head | §A4.3 line 1842 | Open de Rham bundle and Hodge sequence; its connection hypotheses are not silently broadened to the integral compactification. |
| EtaleCohomologyFoundations, main | §§0.6, 0.8, 0.11 and F.0–F.6 | Scheme cohomology, compact support and duality, not a prebuilt primitive modular-form projector. |
| ArithmeticDirichletSeries, completed/main | Layers 3, 7–8; lines 190, 289, 320 | Euler logarithms, prime normalization, upper density and Landau positivity. |
| Chebotarev, main | Layer 10 line 410 | Finite Galois conjugacy-class density; the same upper-density normalization is used in the image bound. |
| AutomorphicFormsOnReductiveGroups, new head | §§5.8, 7.3; lines 868, 1162 | Anemic Hecke characters and Sℓ↦ℓ⁻¹det, compatible with Tℓ↦trace. |
| ModularCurves, main | Layer 0E line 386; Layers 5, 10 lines 1279, 2103 | Effective finite-group/finite-flat descent, universal curves and compactification. |
| JacobianChallenge, main | Layers A–B lines 111, 135 | Coherent curve theory and duality; direct owner for R02. |
| AlgebraicCurves, main | Layer 12E line 1155 | Function-field/coherent comparison; genuinely present, but unnecessary and upward here. |
| ClassFieldTheory, main | Layer 11 line 1683 | Global reciprocity exists; the finding is its direction and unnecessary use, not a missing section. |
| EllipticCurves, main | Layers 1, 3, 4, 4.5a, 5; lines 423, 683, 793, 905, 1154; semistability at 1629 | Frobenius/Verschiebung, supersingularity, Tate uniformization, twists and semistability. The semistability claim is present within the invariant package. |

The multiple ModularCurvesPartII rows describe one supplier, giving 16 distinct supplier texts. The separate scope citation to AutomorphicLFunctionsAndLocalFactors AL.3 was also resolved: its README line 1952 begins that layer, and lines 2178–2250 supply the adelic Eisenstein kernel, residues, unfolding and pole criterion. The present target expressly builds the classical modular-form specialization and its comparison with Fourier coefficients; it does not restate those generic GLₙ declarations in Lean. Among the supplied sibling heads, OverconvergentAutomorphicForms README line 3 concerns analytic coefficient sheaves on Hilbert spaces, while EllipticCurveModularityPartII README line 694 explicitly consumes this roadmap's parabolic realization/projection. These are distinct constructions or downstream uses, not evidence to re-plan a supplier. The resolver's eight leads were checked: seven are this file's own headline declarations; the other is the explicitly later Cartier API. README line 56 identifies `a3a2f35` as later than the pin rather than pretending its object file is available. It is not used as a pinned Lean import. These leads are not eight missing-declaration findings. No declared supplier gaps were available to condition acceptance on.

**Adversarial calculations.** The rows below cover every mathematical target subsection, the sampled targets and all seven Lean headlines, splitting out conventions and independent identities where needed. Values are calculations on test instances, not claims that a finite test proves a general theorem. “Matches” means no counterexample in the displayed instance; unread source generality remains identified separately. Polynomial coefficient, matrix, small-group, theta-table and elliptic-point calculations were also recomputed in scratch. In particular, all 76 admissible large-table rows for p=5,7,11,13 have the asserted length p−1.

| Statement and location | Instance; computed construction value | Claimed value or competing model | Result; change |
| --- | --- | --- | --- |
| Tate/Frobenius conventions, 15–29 | q=t³: dlog q=3 dt/t; arithmetic action on residue x is x^q | 3 dt/t; geometric Frobenius would reverse the action | Matches; none. |
| Raynaud boundary, 96 | Over ℤ₂, constant model v(δ)=0, multiplicative model v(δ)=1 | Strict bound v(δ)<p−1=1 accepts 0, rejects 1 although generic fibres agree | Matches; no uniqueness asserted at the boundary. |
| Raynaud rescaling, 96 | p=3, v(δ)=3: rescaled valuation 3−(3−1)=1 | 1<2; original 3<2 is false | Matches. |
| Finite-flat/peu bridge, 116 | Kummer classes 1+p and p have valuations 0 and 1 modulo p; at p=2 use −1 and 2 | Unit class is finite-flat/peu; valuation-one class is not; weights 2 versus p+1, or 4 at p=2 | Matches the scalar controls; dyadic coefficient descent text not certified. |
| Coefficient-field descent, 134 | C₃ acts on 𝔽₄² by λI, λ²+λ+1=0: trace 0, characteristic polynomial X²+λ² | Trace lies in 𝔽₂, but λ² does not; the characteristic-polynomial hypothesis excludes descent to 𝔽₂ | Matches; traces alone would fail. |
| Geometric sections, 166 | Connected proper X: H⁰(O)=κ; negative Hodge degree gives 0; at level one odd weight over ℂ gives 0 | M₀=κ, M₋₁=0, odd level-one space 0 | Matches; coarse-line replacement would miss stabilizers. |
| Cusp module/kernel, 196 | Constants restrict c↦(c,…,c); Δ starts q; E₄ starts 1 | S₀=0, Δ restriction 0, E₄ restriction 1 | Matches; sampled target. |
| Coefficient maps, 222 | Zero map sends each coefficient to 0; reduction ℤ→𝔽₂ in level-one weight 1 maps 0→κA | Zero map is zero; base-change image dimension 0, target dimension 1 | Matches; no unconditional surjectivity. |
| Small-level descent, 248 | Direct matrix count: GL₂(𝔽₂)=6, GL₂(𝔽₃)=48, GL₂(ℤ/4)=96; mod-two kernel 16 | Listed orders 48,96,16; averaging needs their orders invertible | Matches. |
| Full level-two dimensions, 248 | On the λ-line: M₂=H⁰(O(1)), S₂=H⁰(O(−2)), S₆=H⁰(O(0)) | Dimensions 2,0,1 | Matches. |
| Small-characteristic descent failure, 248 | At level one, A in characteristic 2 has weight 1; in characteristic 3 weight 2; characteristic-zero dimensions both 0 | Residual dimensions nonzero versus integral reduction dimensions 0; cusp examples AΔ have weights 13 and 14 | Matches. |
| All-weight analytic comparison, 288 | Full level two over ℂ, weights −2 and 2: geometric dimensions 0 and 2 | Analytic dimensions 0 and 2 with the same stabilizer convention | Matches on these instances; sampled locator partly unverified. |
| Logarithmic de Rham lattice, 298 | Width 3: residue matrix in (ω,η) is ((0,0),(3,0)); square is 0 | Nilpotent with eigenvalues 0,0; mod 2 rank 1 and filtration ranks 1,2,1 | Matches; sampled target. |
| Cup product/isogeny scaling, 298 | Multiplication [2] on a characteristic-zero elliptic curve acts as 2I on H¹ | Pairing scales by 4=deg[2], not by 2 | Matches. |
| Logarithmic KS, 316 | q=t³ sends ω_can² to dlog q=3dt/t | 3dt/t; dropping the width gives dt/t | Matches. |
| q-expansion principle, 346 | On connected component containing a cusp, E₄−E₄ has every coefficient 0; on X⊔X, section (0,1) vanishes at cusps on first component | First section 0; second is not 0, so one needs a cusp on every component | Matches stated component condition. |
| Strong q-expansion, 358 | A mod 5 has constant expansion 1 and weight 4; θA=0 | It is nonzero, so a characteristic-zero/ordinary injectivity restriction is necessary; the stated restrictions exclude this false extension | Matches domain boundary. |
| Holomorphic base change, 370 | Full level 3 has dim M₁=2 over a geometric prime-to-3 field; level-one mod-2 weight-one map has image 0 and target dimension 1 | Fine-level result and exceptional small-level failure are distinct | Matches. |
| Finite section modules, 380 | Proper ℙ¹ over a Noetherian DVR: H⁰(O(d)) has rank d+1 for d≥0; d=0,1 give ranks 1,2 | Finite section module; zero coefficient module gives rank 0 | Matches. |
| Formal Hecke model, 392 | f=q, ℓ=2: coefficients at n=1 and 2 are 0 and cd; c=1,d=−1 gives −1 at n=2 | Divisibility-guard formula gives 0,−1; unconditional a_(n/ℓ) would wrongly read a₀ at n=1 | Matches. |
| Geometric Hecke normalization, 392 | Δ: coefficient 1 of T₂Δ is a₂=−24; quotient versus dual-quotient level structure differs by [2] | Eigenvalue −24; a diamond twist appears if the other level structure is substituted | Matches; no bad-level identity inferred. |
| Integral Hecke comparison, 436 | Weight 2, auxiliary D=3 and coefficients ℤ₂ satisfy “D odd”; D=2 over ℤ₂ satisfies neither alternative | First branch available; second branch excluded unless 2 is inverted | Matches source boundary; sampled target. |
| Normalized eigensequence, 446 | For Δ, a₁=1, a₂=−24, a₄=−1472 and e₂=2048 | a₄+e₂a₁=576=a₂²; at a bad prime eℓ=0 the second term is 0 | Matches in both cases. |
| Eigensequence versus realization, 446 | Zero sequence over ℚ has a₁=0 and realizes the zero cusp form | Normalized predicate false (0≠1), realization true; over the zero ring 0=1 is allowed | Matches; no nonzero realization is smuggled in. |
| Integral lattice/reduction image, 468 | Δ has leading integral coefficient 1; AΔ mod 2 has weight 13 and coefficient 1 | Δ reduces nontrivially; characteristic-zero level-one S₁₃=0 so AΔ is outside that reduction image | Matches; image is not all Katz forms. |
| Bounded denominators, 502; Lean 178 | Δ/11 has a₁=1/11, and 11 clears every coefficient; zero form cleared by D=1 | D=11 works, D=1 fails on a₁; zero/negative-weight case allows D=1 | Matches; headline. |
| Bounded-denominator q convention, 502 | With q=e^(πiτ), Δ=q²+… and Δ⁻¹=q⁻²+… | Leading exponents 2 and −2, not 1 and −1 | Matches CDT normalization. |
| Diamond action, 524 | Weight 3: ⟨−1⟩ acts by −1; over characteristic 2 this becomes 1; weight −1 still gives −1 | (−1)^n for all integer n; identity diamond gives 1 | Matches. |
| Field coherent trace/duality, 550 | n=−1: dual line is ω²(−C)⊗ω=ω³(−C); p=2,N=5,ℓ=3 has ℓ=1 in κ | H¹(ω⁻¹) pairs with S₃; normalization divides by 3, a unit, not by 2 | Matches arithmetic/domain controls; sampled Edixhoven locator unread. |
| Torsion coherent Hecke, 571 | A=0 gives H⁰=H¹=0; over ℤ/9 with x=2, x⁻¹=5 and 2·5=1 | Zero endomorphism in the first case; normalized trace is defined in the second | Matches; no torsion-free coefficient assertion. |
| Curve Fricke, 601 | P has order 5: double quotient sends P to 2P; 2≠1,4 mod 5 | w₂²=⟨2⟩, not identity at a generic marked point | Matches. |
| Hodge Fricke square, 631 | x=2, trivial diamond, n=0,1,2,−1 gives scalars 1,2,4,1/2 | x^n; at n=2 nonzero characteristic-zero module 4id≠id, while on zero module both are 0 | Matches. |
| Cuspidal exact sequence, 663 | On ℙ¹ with two marked cusps and n=0: κ→κ² is c↦(c,c), cokernel dimension 1=dim H¹(O(−2)) | Restriction is not onto; connecting map accounts for dimension 1 | Matches; sampled target. |
| Full-boundary eigenvalues, 673 | In 𝔽₅, n=3, x=3, ε(x)=−1: infinity gives 1−9=2; zero gives −1+9=3 | Two-character formula gives 2 and 3; a single universal orbit formula gives the wrong second value | Matches corrected roadmap; source error recorded below. |
| Hasse invariant, 705 | E₄ mod 5 has constant 1 and all positive coefficients 240σ₃(n)=0; ordinary versus supersingular value is nonzero versus 0 | Weight 4 section with expansion 1; its zero divisor is nonempty, unlike the global constant section in weight 0 | Matches. |
| Hasse scaling law, 705 | Over 𝔽₅(t), replace ω by tω: Hasse scalar changes by t⁻⁴ | Weight 4 transformation t⁻⁴, not t⁴ | Matches convention. |
| Small-prime Hasse lifts, 731 | E₄=1+240q+2160q²+…; mod 2 and mod 3 it is 1; shift is 4 | Constant expansion preserved, with even shift divisible by p−1 at both primes | Matches. |
| Formal theta/Hecke relation, 743 | f=q², ℓ=2,c=d=1: T_(2,4,1)(Θf)=2q+8q⁴ | 2Θ(T_(2,1,1)f)=2q+8q⁴ | Matches over ℤ, before reduction. |
| Formal theta, 743 | Θ(1)=0; Θ(q²)=2q²; in characteristic p, Θ(q^p)=0 | Coefficients n a_n; at p=2 the q² coefficient is 0 | Matches. |
| Filtration, 751 | w(0)=0, w(1)=0, w(A)=0, w(Δ mod 5)=12 | Total convention 0 at zero; removing powers of A explains the first three, Δ does not vanish at supersingular points | Matches; Hodge weight of A is 4, not its filtration. |
| Geometric theta/KS, 755 | Width n=3 in characteristic 5: θ(t)=2t; θΔ has q² coefficient −48=2 mod 5 | 1/3=2 and coefficient 2τ(2)=2; using t=q would give 1 instead of 2 | Matches. |
| Theta kernel and eigenvalue shift, 755 | θ(g^p)=0; at p=5 and good ℓ=2, eigenvalue λ changes to 2λ and determinant exponent changes by p+1=6 | Cyclotomic tensor multiplies trace by 2 and determinant by 4; 2⁶=4 mod 5 | Matches, conditional on actual attachments as stated. |
| Coefficient-linear U,V, 783 | f=tq over 𝔽₂(t): V(f)=tq², absolute Frobenius f²=t²q²; UV(f)=tq | V fixes coefficients, UV=id; t≠t² distinguishes the wrong model | Matches; sampled target. |
| U,V constants and junk index, 783 | U(1)=V(1)=1; U(q)=0 for p≥2; UV(q)=q | Coefficient zero is retained; VU(q)=0≠q, so only the stated inverse direction holds | Matches. |
| Theta of V over torsion, 783 | Over ℤ/9, p=3, Θ(Vq)=3q³, nonzero; mod 3 it is 0 | Characteristic-p vanishing cannot be applied over ℤ/9 | Matches. |
| Igusa differential/deck action, 817 | For p=5,u=2, a↦2a makes f/a↦3f/a; p=3,u=−1 gives −f/a | Inverse character gives 3 and −1; direct character gives 2 in the first test | Mathematical law matches; add Checks, R08. |
| Ordinary weight congruences, 829 | Exponents of unit groups for (p,m)=(5,2),(2,1),(2,2),(2,3),(2,4) are 20,1,2,2,4 | Formula gives 20,1,2,2,4; naive 2^(m−1) would give 4 rather than 2 at m=3 | Matches; sampled target. |
| Torsion section socles, 855 | Over ℤ₃,m=2: socle is {0,3,6}; a↦3a identifies 𝔽₃ with it; ordinary reduction sends all three to 0 | Socle has dimension 1, reduction image dimension 0 | Matches; sampled target. |
| Socle injectivity criterion, 855 | K→0 has kernel K≠0 but K[π]=0; for ℤ/9, nonzero subgroup contains 3 or 6 | Criterion works with power torsion; fails without it | Matches stated restriction. |
| Weight-one doubling, 878 | p=3: 1=p−2. On the mod-3 socle, θ(Vg)=0; a kernel equation yields θf=0, hence f=0 and UVg=g=0 | Two kernel coordinates both 0; over ℤ/9, 3q³≠0 prevents the same direct theta step | Matches; sampled target. |
| Supersingular spaces, 898 | Two reduced supersingular points over κ: dim SS₀=2, while constant global functions form dimension 1; a line fibre in weight −1 still has dimension 1 per point | SS uses all sections on the divisor, not global-form image; negative fibres do not vanish | Matches. |
| Supersingular periodicity, 932 | p=5,ℓ=2: four multiplications by B shift weight by 24, scalar 2⁴=1 mod 5 | Period p²−1=24; single-step scalar 2, not 1 | Matches arithmetic consequence; geometric source unverified. |
| Dyadic periodicity, 932 | p=2,ℓ=3: shift p+1=3, scalar 3=1 | T₃(Bf)=B T₃(f) | Matches. |
| Root-dependent Fricke, 952 | Weight 1 over characteristic 5 with λ(Wζf)=1: replacing ζ by ζ⁻¹ gives −1=4; weight 0 gives 1 | Sign (−1)^n; dual acts by precomposition, not by inverse | Matches convention calculation; source generality unverified. |
| Twisted duality scalar, 980 | n=1 gives ℓ⁰=1; n=2,ℓ=2 mod 5 gives 2⁻¹=3 | ΦT=ℓ^(1−n)T∨Φ; omitted twist would give 1 in the second test | Matches. |
| Supersingular boundary duality, 994 | p=5,k=7: p+1−k=−1, S₋₁=0, so boundary map has zero target; k=2,ℓ=2 gives 2^(k−p)=2⁻³=2 | Restriction M₇→SS₇ is onto, not Φ an isomorphism; ℓ^(k−1)=2 agrees | Matches. |
| Large theta tables, 1011 | p=5,k=2 gives [8,14,20,2] nonordinary and [8,14,20,10] ordinary; 76 admissible rows for p=5,7,11,13 were evaluated | Lengths 4 and 4, and p−1 in every evaluated row; nonordinary k=p+1 absent | Arithmetic tables match; not a proof of geometric cycles. |
| Small theta tables, 1043 | p=2,k=3: absent/[6]; p=3,k=1: [5,9] in both branches; p=3,k=2: [6,2]/[6,6] | Lengths 1 and 2, with the declared missing row; no use of p>3 formula | Matches internal arithmetic; Edixhoven locator unverified. |
| Weight reduction, 1065 | p=2 bound p+1=3; on κ[t]/t², multiplication by t is ((0,0),(1,0)), dual is its transpose | Both have characteristic polynomial X² and support {(t)}; each has a one-dimensional t-killed eigenspace | Matches nonsemisimple support argument. |
| Tame alternatives, 1101 | p=2, ψ of order 3: Frobenius sends ψ↦ψ² and ψ²↦ψ⁴=ψ | A two-element niveau-two orbit, not two independently fixed eigenlines | Matches; sampled target. |
| Tame projections/weight, 1111 | p=5,(a,b)=(1,3): exponent pa+b=8, weight 9; supersingular (0,1) gives 2 | 1+pa+b=9 and 2; wild projection absent | Matches. |
| Unramified exception, 1111 | p=5,(0,0): raw expression 1, classical weight 5; at p=2 the only niveau-one pair is (0,0) | Explicit exceptional output p, hence 5 or 2 | Matches. |
| Wild generic and adjacent weights, 1153 | p=5: (1,3) and (3,1) both give 9; adjacent (0,1) gives peu 2, très 6 | Generic min/max formula 9; difference p−1=4 only for the adjacent odd-prime branch | Matches; sampled target. |
| Dyadic wild parameter, 1153 | ℚ₂(√−1,√2,√5) has total degree 8; unramified √5 disappears over ℚ₂^nr, leaving degree 4=2² | Wild m=2, not 3; très weight 4 instead of naive correction 3 | Matches Serre convention; Edixhoven citation unverified. |
| Determinant/parity, 1191 | p=5,(1,3): k−1=8≡a+b=4≡0 mod 4; adjacent weights 2,6 have exponents 1,5≡1 | All branches retain the same inertia determinant; k=3 forces ε(−1)=−1 at odd p | Matches. |
| Characteristic-two oddness, 1191 | c=((1,1),(0,1)) over 𝔽₂ has c²=I, determinant 1=−1, but c≠I | Automatic determinant oddness does not force trivial complex conjugation | Matches. |
| Twists and renormalization, 1201 | p=5,(1,3), twist by χ⁻¹ gives (0,2): weight 9→3; p=2 très stays 4 | 3 lies in [2,6]; every dyadic cyclotomic twist is 1 and cannot reach ≤3 | Matches. |
| Dyadic tame descent, 1219 | Order-three inertia on 𝔽₂² has polynomial X²+X+1; over 𝔽₄ its two roots are λ,λ² and Frobenius interchanges them | Paired rank-two model has both characters; one eigenline is not descent-stable | Matches necessity; complete source proof unverified. |
| Weight-two criterion, 1235 | p=5 extensions of 1 by χ: both determinant χ; unit class gives weight 2, class 5 gives weight 6 | Finite-flat condition true/false separates the two; determinant alone gives only 2 mod 4 | Matches both directions on the examples. |
| Edixhoven/classical comparison, 1249 | Unramified p=5 gives 1/5; dyadic très gives 3/4; supersingular gives 2/2 | Exactly the two exceptional branches in the stated tables | Internal comparison matches; external locator unverified. |
| Dyadic dichotomy, 1269 | d=5,−1,−5 have valuation 0; d=±2,±10 have odd valuation 1 | Weights 2 versus 4; unramified d=5 is in the first group | Matches Serre's listed classes. |
| Fontaine–Laffaille, 1283 | p=5, weights 0,2 give k=3; weights 0,1 with peu class give 2, très class would give 6 | The latter is outside the finite-flat/Fontaine–Laffaille extension condition; p=2 range is empty | Matches restrictions. |
| Semistable elliptic torsion, 1303 | q=3³·4: valuation 3≡0 mod 3, Kummer class 4; q=3: valuation 1 | Weights 2 and 4 at p=3; at p=2,q=2 the weight is 4 | Matches. |
| Bad-dihedral constraint, 1321 | p=5 normalized cases: k=3 or 4 | 2k−1=5 in niveau one, 2k−3=5 in niveau two; unnormalized k=9 does not qualify | Matches the domain of the consequence. |
| Generated algebra/line, 1347 | Upper triangular 2×2 matrices preserve κe₁; products have lower-left entry 0; f=0 gives the zero invariant subspace | Generated algebra preserves the same line/subspace even for a noncommuting family | Matches; scalar-character construction separately excludes f=0. |
| Invariant-line character, 1357 | H=κ×κ on κ²: on e₁, χ(1,0)=1; on e₂, χ(1,0)=0 | First and second projection respectively; zero vector would determine neither scalar | Matches existence, uniqueness and rescaling. |
| Horizontal prime, 1383 | H=O[t]/t², Q=(π,t), P=(t): P⊂Q, H/P=O | P∩O=0, Q∩O=(π) | Matches going-down input. |
| Dominating DVR character, 1393 | H=O[x]/(x²−π), L=K(α), α²=π; send x↦α in a valuation ring above O | Residue sends α↦0 and π↦0; valuation ring dominates O | Matches; extension need not be separable or normalization module-finite. |
| Nilpotent socle, 1407 | A=κ[t]/t², V=A: tV=κt, t²V=0, and t annihilates nonzero t | Nonzero socle κt; A=κ, radical 0 gives the whole nonzero V | Matches. |
| Localized socle descent, 1417 | A=κ×κ localized at I=0×κ: (1,0) maps to 1 and is killed by I | Nonzero localized vector has an actual I-killed representative | Matches. |
| Faithful character occurrence, 1427 | A=κ×κ acting on κ² has e₁/e₂ for the two characters | Each eigenspace dimension 1; on V=0 faithfulness fails for nonzero A | Matches. |
| Generic faithful action, 1437 | O×O acting diagonally on O² remains injective on K² | Kernel 0 before and after localization | Matches the finite-free base-change route. |
| Integral representatives, 1447 | Eigenvector (π⁻¹,1): multiplying by π gives (1,π) | Integral and nonzero; eigenvalues unchanged by scalar multiplication | Matches; sampled target. |
| Deligne–Serre lifting, 1459; Lean 155 | Empty operator family on M=O: choose L=K,V=O,f′=1. On O² with T=((0,π),(1,0)), lift eigenvalue to α with α²=π | Nonzero vector in first case; T(α,1)=(π,α)=α(α,1) in second | Matches; headline. |
| Prescribed-vector failure, 1473 | T=((0,π),(0,0)); mod π, e₂ is an eigenvector of eigenvalue 0; characteristic-zero kernel is Ke₁ | Eigenvalue 0 lifts, but no integral eigenvector reduces to e₂ | Matches precise limitation. |
| Required fraction-field extension, 1483 | T²=πI, so eigenvalue squared is π; v(π)=1 but v(x²)=2v(x) | No eigenvalue in K; adjoining α works; over 𝔽₂((t)), X²−t is inseparable | Matches all-DVR generality. |
| Nonfaithful nonoccurrence, 1501 | κ×κ acts on κ through first projection; h=(0,1) acts as 0, second character has value 1 | Eigenvector equation becomes 0=v, contradicting v≠0 | Matches. |
| Controlled lifting/shift, 1513 | E₄ mod 2 or 3 has expansion 1; multiply integral reduction by it: coefficients unchanged, weight increases by 4 | Same residual eigensystem at the controlled shift, since 4≡0 mod p−1 | Matches; sampled target. |
| Weight one to two at three, 1527 | Normalized E₁,χ₋₃ has first terms 1+6q+0q²+6q³; mod 3 equals 1 | Multiplier raises weight by 1 and twists character by χ₋₃; at ℓ=2, χ₋₃(2)·2=1 mod 3 | Matches determinant compensation. |
| Parabolic realization, 1562 | k=2 gives Sym⁰ rank 1; primitive newform contribution has two Hodge pieces of dimension 1 | Rank-two primitive multiplicity, not total oldspace dimension; k=1 would require Sym⁻¹ and is excluded | Matches mathematical boundary; supplier edge repaired by R02. |
| Auxiliary-level comparison, 1562 | Level 11 form at λ above 11: base ℤ[1/11] permits q=2, excludes q=11; auxiliary level 33 also excludes q=3 | Same primitive dimension 2; level 11 supplies the q=3 comparison | Matches inclusion of coefficient primes dividing level. |
| Higher-weight attachment, 1598; Lean 49 | Δ at q=2: λ₂=−24, determinant 2¹¹=2048 | Polynomial X²+24X+2048; for 2Δ, Fourier coefficient −48 while trace remains −24 | Matches; headline. |
| Oldvectors/Eisenstein attachment, 1598 | Δ(3τ) has a₁=a₂=0 but good T₂ eigenvalue −24. E₄ has T₂ eigenvalue 1+2³=9 and Fourier coefficient 2160 | Oldvector polynomial still X²+24X+2048; E₄ polynomial X²−9X+8, not trace 2160 | Matches native carrier generality. |
| Frobenius/pairing determinant control, 1598 | F=I₂,V=2I₂ satisfy F+V=3I₂ and FV=2I₂, but det F=1 | Desired determinant 2 does not follow from that polynomial relation alone; the stated pairing/primitive input is needed | Matches the route's additional input. |
| Weight-one prime moment, 1630; Lean 193 | S₃ standard character values 2,0,−1 on classes of sizes 1,3,2 give (4+0+2)/6=1 | Leading log coefficient 1; Eisenstein 1⊕χ₋₃ gives (4+0)/2=2 | Matches; cusp hypothesis necessary. |
| Finite eigenvalue density, 1640; Lean 205 | [K:ℚ]=2,B=4 gives 2/16=1/8. S₃ example Y={2,0,−1} has empty exceptional set | Bound 1/8 in first case; exceptional prime sum 0 in second | Matches quantifier order and upper-density convention. |
| Finite-image counting, 1648 | G=S₃, complement a transposition class: density 3/6=1/2, retained elements 3 | (1−η)·6=3 for η=1/2 | Matches Chebotarev normalization. |
| Weight-one Artin attachment, 1662; Lean 80 | S₃ standard representation: transposition eigenvalues 1,−1, trace 0, determinant −1; 3-cycle trace −1 | Finite image and irreducible; Eisenstein pair 1⊕χ₋₃ is finite but reducible | Matches; R01 concerns supply, not this statement. |
| Classical reduction versus Katz, 1697 | Level-one AΔ in characteristic 2 has weight 13 and leading coefficient 1; integral characteristic-zero S₁₃=0 | Katz space contains this form; classical reduction space does not | Matches separate carriers. |
| Residual attachment, 1709; Lean 109 | Δ mod 3 at q=2: trace −24=0, determinant 2048=2; level-11 elliptic form mod 3 has trace −2=1, determinant 2 | Polynomials X²+2 and X²−X+2 respectively | Matches; headline retains nonzero integral reduction. |
| Place-sensitive residual witness, 1729 | a=(−1+√5)/2: roots of a²+a−1 mod 11 are 3,7; conjugate a′=−1−a sends 7↦3 | Transported coefficient place restores 3; leaving the old place gives 7≠3 | Matches; sampled target. |
| S-type controls, 1767 | Level-11 curve has #E(𝔽₂)=5, hence a₂=−2; mod-3 polynomial X²−X+2 has discriminant 2, a nonsquare | No invariant 𝔽₃-line; odd complex conjugation excludes an irreducible-but-geometrically-split two-dimensional form | Matches the stated irreducibility control. |
| Reducible elliptic control, 1767 | On y²+y=x³−x²−10x−20, multiples of (5,5) are (5,5),(16,−61),(16,60),(5,−6),O | Point has order 5, giving an invariant line in E[5] | Matches failure of S-type at 5. |
| Oddness/modularity control, 1767 | Trivial rank-two representation mod 3 has det(c)=1; oddness requires −1=2 | 1≠2, so this even representation is excluded | Matches. |
| Classical target predicate, 1839 | Unramified p=5 requests k=5; dyadic très requests k=4 | Edixhoven values 1 and 3 would define a different target | Matches; no universal modularity assertion is encoded. |
| Witness-comparison determinant, 1867 | p=5, shift n=4, q=2: q^n=16=1 mod 5 | Cyclotomic exponent and determinant unchanged; image/character-projector hypotheses remain necessary | Matches conditional comparison. |
| ClassFieldTheory replacement, 83 | χ₋₃(2)=−1; cyclotomic restriction sends Frob₂ to 2 mod 3 | Eisenstein trace 1+(−1)=0, determinant −1 | R01: same values through earlier AGR §2.3. |
| AlgebraicCurves replacement, 1592 | ℙ¹: dimensions (H⁰O,H¹O)=(1,0); genus one: (1,1) | Direct JacobianChallenge duality gives the same pairs | R02: no function-field comparison needed. |

There are **108 adversarial rows**, including the 15 sampled targets and seven Lean headlines. They exercise zero coefficient modules, zero forms, zero-ring normalization, identity/zero coefficient maps, negative/zero/one weights, p=2,3,5, nilpotents, an inseparable field extension, noncommuting operators, nonsemisimple Hecke modules, nonfaithful actions and both directions of the asserted inverse/criterion comparisons. They do not certify inaccessible source passages or replace the deep existence proofs with finite examples.

**Source sample and locators.** The brief describes a 15-target seeded sample but supplies no target names (“none found by heading”). To make the review reproducible, I sampled 15 source-bearing target blocks with seed `int('4e550b1',16)` and recorded the resulting list. No explicitly unverified-locator marker was found in the README. All 20 distinct scholarly works linked by the README were attempted through the sources service; the access and extraction limitations are below. The later Cartier source was fetched separately and its coefficient-selection definition read at `cartier-later line 723` and `cartier-later line 737`.

| Sampled target / README line | Source text and exact locator examined | Verification result |
| --- | --- | --- |
| Cusp forms and cusp ideal, 196 | Katz 1973 §1.5, pp.82–83, `katz1973 line 448`; Edixhoven §2.1, author pp.3–4 | Katz establishes the extended Hodge line and sections. The Edixhoven cusp/ideal passage was not readable; no full locator certification. The explicit kernel test is in the adversarial table. |
| All-weight analytic comparison, 288 | Same Katz/Edixhoven locators; Katz Tate normalization at `katz1973 line 461` | The sections/Tate input is supported. General analytic comparison also uses the named GAGA supplier; Edixhoven author pagination remains unverified. |
| Integral logarithmic de Rham extension, 298 | Katz A1.3.16–18, pp.168–169, `katz1973 line 3134`, `katz1973 line 3153`; A2.3.6, pp.178–179, `katz1973 line 3420`; Deligne II.5.3–5.6, pp.93–96, `deligne1970 line 3078`, `deligne1970 line 3132` | Tate formulas and complex canonical extension agree. Katz A2.3.6 itself is over the ordinary formal Witt base: it is an input, not an already-proved whole integral compactification theorem. The README explicitly owns the integral lattice and gluing. |
| Integral Hecke comparison, 436 | DDT §4.1, Lemma 4.1, revised p.107, `ddt line 3932`–`ddt line 3947` | Weight two; D positive and coprime to N; part (b) requires D odd or 2 invertible. The roadmap retains the lemma's hypotheses and does not claim this is an arbitrary-weight generation theorem. |
| Field coherent Hecke/trace duality, 550 | Edixhoven §7.1, (7.1.1), Proposition 7.3 proof and Lemma 7.4, author pp.23–25 | Not text-certified. The field/torsion distinction and arithmetic inverse scalar were tested, but that does not verify the cited proof. |
| Equivariant cusp sequence, 663 | CG 2018 §3.2.3, pp.313–316, `cg2018 line 789`–`cg2018 line 793` | Source explicitly supplies Hecke equivariance of the long exact sequence. No degree-zero surjectivity is imported. |
| Coefficient-linear U,V, 783 | Katz 1977 §II, pp.55–56, `katz1977 line 75`–`katz1977 line 109`; CG 2020 Lemma 8.14 proof, local p.66/final p.866, `cg2020 line 2562`–`cg2020 line 2578` | Formal U,V and the separate characteristic-p theta input agree. The arbitrary-ring formal equations are verified directly rather than inferred from a characteristic-p geometric result. |
| Ordinary congruences, 829 | Katz 1973 4.4.1–4.4.2, pp.151–152, `katz1973 line 2590`–`katz1973 line 2640` | The finite-base hypotheses and separate dyadic unit-group exponent cases are retained. |
| Torsion section socles, 855 | CG 2018 Theorem 3.11 proof, pp.327–328, `cg2018 line 1227`–`cg2018 line 1271` | Socle reduction is the source's step; the README supplies the flat-sheaf kernel argument needed for its general coefficient formulation. |
| Weight-one torsion T_p, 878 | Same CG 2018 proof; CG 2020 local p.66; Katz 1977 §II corollary (3), `katz1977 line 89`–`katz1977 line 93` | Theta injectivity is used only after passing to characteristic p, in weights 1 through p−2. The p≥3 assumption and m≥1 remain. |
| Tame inertia alternatives, 1101 | Serre 1987 Proposition 1, §2.1 p.183, `serre1987 line 188`–`serre1987 line 213` | Niveau-one or a Frobenius-paired niveau-two alternative; semisimplification at this step does not erase the extension used by later targets. |
| Wild table, 1153 | Serre §2.4 pp.186–187, §2.6 p.188, `serre1987 line 295`–`serre1987 line 383`, `serre1987 line 419`; Edixhoven Proposition 8.5, author p.28 | Serre's ordered exponents, adjacent correction and dyadic degree-over-the-unramified-base convention agree. Edixhoven's broader quoted bound could not be text-verified. |
| Integral eigenline representatives, 1447 | Deligne–Serre Lemma 6.11, p.522, `deligne-serre line 574`–`deligne-serre line 597` | Finite-free DVR lifting supplies eigenvalues and an integral eigenvector, not a prescribed residual vector. Coordinate denominator clearing gives the displayed test. |
| Controlled lifting and shifts, 1513 | Deligne–Serre §§6.9–6.11, p.522, `deligne-serre line 562`–`deligne-serre line 597` | Weight shift plus eigenvalue lifting is supported. The README separately retains reduction-image and character-projector hypotheses before invoking it. |
| Residual witness, 1729 | Khare–Wintenberger introduction pp.1–2, `khare-wintenberger line 49`–`khare-wintenberger line 69`; Horawa p.57, `horawa line 2980`–`horawa line 2984` | The integral coefficient-place convention and the level-47 coefficient (−1+√5)/2 agree; the two mod-11 roots and transported place were computed. |

Thus **11 of 15 sampled blocks had readable text for all their listed works; 4 have an Edixhoven component not text-certified**. This is a locator audit, not a claim that every target is a verbatim theorem of its reference: for example the integral logarithmic gluing is explicitly new work with cited local and characteristic-zero ingredients.

Additional headline checks read Deligne–Serre Theorem 4.1 and Corollary 4.2, pp.513–514 (`deligne-serre line 262`–`deligne-serre line 277`); Proposition 5.1 and its proof, pp.518–519 (`deligne-serre line 424`); Proposition 5.5, pp.519–520 (`deligne-serre line 477`–`deligne-serre line 500`); Theorem 6.1, pp.520–521 (`deligne-serre line 507`–`deligne-serre line 526`); and Lemmas 6.11, 6.13, pp.522–523 (`deligne-serre line 574`, `deligne-serre line 616`). Their hypotheses support holomorphic versus cuspidal attachments, every coefficient place, eigenvalues rather than arbitrary Fourier coefficients, the upper-density quantifiers and characteristic-polynomial descent. CDT Lemma 4.2.2, p.655 (`cdt line 1747`–`cdt line 1754`) was read as the bounded-denominator application, including its q=e^(πiτ) convention; the general lattice route is stated separately in this roadmap. Jochnowitz §7 was obtained from the AMS open archive and read at `jochnowitz line 371`–`jochnowitz line 443`; its level-one cycle analysis was not treated as a substitute for unread general-level Edixhoven locators.

## Not verifiable

- **Edixhoven, author DVI dated 24 December 1998.** The sources service could not extract the author's `weight.dvi`. EuDML supplied bibliographic metadata and a legal GDZ link. Following that link through its IIIF manifest obtained the journal PDF, pp.563–594, but it is an image-only scan; available extraction reported no OCR, and local PDF rendering was unavailable. The web reader also could not open that PDF. I did not infer author-version pagination or proof hypotheses from its metadata. The limitation covers the cited §§2–4 and 7–8, in particular sample lines 196, 288, 550 and the Edixhoven part of 1153, plus geometric theta-cycle, supersingular and dyadic descent claims that depend on those passages. A single missing-reference record has been written using the stable key `edixhoven`; the review is finished rather than parked.
- **Diamond–Shurman Proposition 5.8.5.** The corrected publisher record was found, but its book text was not legally readable through the service and is recorded as uncertified. No missing-reference request was made for this paywalled text. R06 concerns the demonstrably wrong DOI, not a guessed proposition content.
- **Deligne 1969 displayed diagrams.** The extracted text identifies Theorem 2.10 and the Hecke/pairing passages in §§3–4, including the inverse-Frobenius convention, but omits some displayed diagrams and equations. Those displays were not visually verified; the screenshot reader returned no usable image. The higher-weight attachment's explicit statement was independently checked in Deligne–Serre Theorem 6.1. This limitation concerns diagram-level certification of the parabolic proof route, not the readable theorem statements.
- **Scope of external verification.** The read-only ownership audit covered the supplied readable main, package and sibling material. It does not certify unpublished work or unspecified open heads. Source retrieval success alone was not counted as verification: the Edixhoven HTML records and empty scan extraction are specifically excluded above. General deep geometric existence statements remain mathematical targets; the computed rows are adversarial tests, not completed formal proofs.

## Source issues

- **Error** in cg2018 at Remark 3.4, printed p.316: the source says diamond operators act transitively on all cusps, forcing one universal boundary eigenvalue formula; it should be a cusp-type decomposition with two characters and potentially vanishing components; affects the proof.
- **Misprint** in serre1987 at Proposition 4 proof, printed p.190: the source says the tame prolongation input is Raynaud Theorem 2.4.3; it should be Raynaud Theorem 3.4.3, printed p.270; affects the proof.
- **Misprint** in cg2020 at Lemma 8.14 proof, local p.66, final p.866: the source says F belongs to the β summand immediately after assuming it belongs to the α summand; it should be the α summand in that sentence; affects the proof.
- **Misprint** in cg2020 at Lemma 8.14 proof, local p.66, final p.866: the source says V acts on F by β after U acts by α; it should be the diamond-weighted V that acts by β, since UV=1; affects the proof.

The first two issues are already explicitly corrected or guarded against in the roadmap. For the last two, see `cg2020 line 2578`–`cg2020 line 2597`: with α=2, β=3 in 𝔽₇, UV=1 forces V's eigenvalue 4, whereas ⟨p⟩V has eigenvalue (2·3)·4=3. The roadmap's doubling map correctly uses ⟨p⟩V, so these source slips are not additional roadmap findings.
