# Review of ReductiveGroupsPartII (pull request #792 at 6008aed)

**Verdict:** needs changes

## R01 (P1) — Conjugation transport does not descend modulo the translation kernel

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2401`, independence of choices, clause (3): “transports everything by `Int(g)`”.

**Claim:** The transport depends only on the class of the conjugating element modulo `Z(K)^1 = ker ν`.

**Witness:** In `GL₂(ℚ₃)`, put `z = diag(2,1)`. Its translation is zero, but `z x₁₂(1) z⁻¹ = x₁₂(2) ≠ x₁₂(1)`. Thus `z` and `1` give different maps on the same root group.

**Repair:** Restrict the quotient assertion to the apartment action and transport of filtration subgroups as sets. Retain the chosen conjugating element for maps on root-group elements. Add this example: both conjugations preserve every upper-root filtration subgroup and induce the same apartment map, but have values `x₁₂(2)` and `x₁₂(1)` on `x₁₂(1)`. Bruhat–Tits I 6.2.10(iii) supplies conjugation of filtration subgroups, not elementwise triviality of the translation kernel; see bruhat-tits-i line 4550 and bruhat-tits-ii line 2994.

## R02 (P2) — The quadratic square-root Check omits characteristic different from two

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4487`, `NormTorus.ramified_connected_index`: “over any base of the standing context”.

**Claim:** The extension with `a² = ϖ` gives a quadratic norm-one torus, with `−1 = a/σ(a)` having nonzero Kottwitz image, in the stated standing context.

**Witness:** Take `K = 𝔽₂((t))` and `a² = t`. The extension is inseparable, has no nonidentity automorphism `σ`, and `−1 = 1`, whose Kottwitz image is zero.

**Repair:** Put `char K ≠ 2` on this square-root example, as on the separable examples elsewhere in the README. This still permits residue characteristic two in mixed characteristic. Preserve equal-characteristic two with a separate ramified Artin–Schreier example: `b²+b=t⁻¹`, `σ(b)=b+1`, `a=1/b`. Then `ord_L(a)=1`, `a/σ(a)=(b+1)/b` has norm one and Kottwitz class `1 mod 2`; `−1=1` has class zero. This tests the repaired distinction without narrowing the general torus theory.

## R03 (P2) — Thirteen admitted data declarations violate the acceptance-test contract

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean:175`, `generalLinearPointsHomeomorph`; also the declarations listed below.

**Claim:** The acceptance test may use these definitions and instances with admitted bodies or admitted structure fields.

**Witness:** The gate reports `sorry-data=13`, at lines 64, 175, 201, 204, 207, 211, 514, 1078, 1170, 1290, 1298, 1307 and 1315. The homeomorphism at 175 is supplied entirely by `sorry`.

**Repair:** Delete definitions and instances unnecessary for headline statements. Give the few retained simple definitions real bodies, including their structure laws. Put heavy constructions in the README and name genuinely unstatable headlines in the module docstring. No retained theorem may depend on admitted data. Re-run the gate: this counter must be zero. Successful elaboration of the present file does not discharge this failure.

## R04 (P2) — Ihara's headline theorem is statable but absent

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:3680`–3694, Ihara's theorem; `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean:19`–24.

**Claim:** Ihara's amalgam theorem is left README-only, while the module presents itself as a nonexhaustive collection of representative signatures.

**Witness:** Pinned `Mathlib/GroupTheory/PushoutI.lean:60`, `:80`, `:102`, `:189` supplies the pushout, factor maps, induced map and group instance. Matrix `SL₂`, `GL₂`, conjugation, subgroup intersection and integral points already have native carriers.

**Repair:** State the canonical amalgam map as an isomorphism, or equivalently injectivity plus its exact image `SL₂(K)`, using `K₀ = SL₂(O)`, `K₁ = diag(1,ϖ) K₀ diag(1,ϖ)⁻¹` and `I = K₀ ∩ K₁`. A scratch statement with five short, real subgroup/map definitions, `Monoid.PushoutI.lift`, and only the theorem admitted elaborated at the pins. It includes the local-field instance `K=ℚ₂`, where both vertex indices are three. Retain the README's intended generality when adding the statement. Replace the representative-signature policy with the required headline policy, and explicitly name each omitted headline and its missing carrier; a blanket nonexhaustiveness sentence is insufficient.

## R05 (P3) — Remove admitted examples and boundary-case padding

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean:73`, and the 72 admitted examples reported by the gate; for instance lines 399–426 and the tree Checks following line 1087.

**Claim:** Admitted examples serve as acceptance tests for API facts, boundary cases and computed values.

**Witness:** The gate reports `sorry-examples=72`. Examples include the norm on the identity extension, the four complex fourth roots of unity, and degree three in the `ℚ₂` tree.

**Repair:** Delete them from `Suggested.lean`; keep the mathematical Checks in the README. Do not repair this by proving all 72 in place. Keep only a handful of proved examples if they test something nontrivial about definitions genuinely needed for retained headlines. The computed values remain `1`, `4`, and `3`, respectively; deleting their duplicate Lean declarations loses no headline theorem.

## R06 (P3) — The diagonal norm formula is an imported API specialization

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean:374`, `NormTorus.norm_comp_diagonal`.

**Claim:** The diagonal norm formula is a separate admitted acceptance theorem.

**Witness:** `Mathlib/RingTheory/Norm/Defs.lean:100` gives `Algebra.norm_algebraMap`; `Mathlib/LinearAlgebra/Dimension/Constructions.lean:376` gives `Module.finrank_baseChange`. The declaration's own docstring identifies precisely this specialization.

**Repair:** Delete it from `Suggested.lean`. Keep the formula as a README API fact citing those declarations and the tensor-factor swap. On a rank-two extension the diagonal element `2` still has norm `2²=4`; on rank one it has norm `2`. This is an adapter for imported theory, not a headline. The generic one-tactic screen did not solve it without an explicit tensor/algebra-map conversion; that syntactic conversion does not make the restated API a new deep theorem.

## R07 (P3) — Replace commit-pinned roadmap suppliers

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:385`–386, ChevalleyGroups and CFSGBasicProperties links; also the MassFormula supplier link at line 214.

**Claim:** Frozen commit links specify roadmap suppliers.

**Witness:** The gate reports `blob=2` for lines 385–386. The MassFormula row likewise links a commit in a fork. The relevant suppliers exist on main at C2–C4, T0–T2 and Layer 2.

**Repair:** Cite roadmap name and section, or a main-branch path. Preserve the substantive contracts: arbitrary Chevalley datum in C2–C4, perfectness and nontrivial quotient in T0, and the regular-Haar image law in MassFormula Layer 2. Those sections were re-opened on main; the repair retains the `PGL₂(ℚ)` and linear `ℚ₃` tests below.

## R08 (P3) — Repair the code span rejected by the TeX scanner

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:1023`–1024, the affine-line Weil-restriction Check.

**Claim:** The multiline span is accepted house-style mathematical notation.

**Witness:** The gate reports `tex=1` at line 1023, where the span containing `Res_{k'/k}` continues across the newline before `(Fin d) k`.

**Repair:** Put the complete formula in one code span on one line, or use Unicode prose. The rank-two instance remains a polynomial algebra in two variables. Re-run the scanner; its `tex` count must be zero.

## R09 (P3) — Remove the README's exception for proposed API and Check names

**Location:** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:404`–414, especially “Each Check carries the name proposed for its Lean `example`”.

**Claim:** Backticked proposed API names and named future Lean examples are allowed if a separate Lean line disambiguates them.

**Witness:** The prescribed form allows an own backticked API name only for a declaration actually retained in Suggested.lean, and requires Checks in prose. The affine-line Checks at 1023–1029 illustrate the incompatible convention.

**Repair:** Delete this local exception. State APIs and Checks in mathematical prose; retain an own backticked declaration name only when the corresponding retained acceptance declaration exists. Remove claims that Checks have Lean counterparts when deleting R05's examples. The zero-extension and split-extension Checks still distinguish a point from a product, without proposed theorem names.

## Verified sound

The exact head was checked. The diff outside the four roadmap folders named in the brief is empty, and the worktree was not changed. Root README and CONTRIBUTING were read, together with main-branch roadmap forms including ReductiveGroups, ModularCurves and the completed ProfiniteProPGroups. No computational algorithm, `set_option`, copied source passage, or additional outside-folder edit was identified in this review. This is a repairable continuation of the local theory, not a rejection for replacing the base roadmap.

**Gate and elaboration.** The supplied head gate fails with four nonzero rule counters: `blob=2`, `tex=1`, `sorry-data=13`, `sorry-examples=72`. R03, R05, R07 and R08 account for all four. All its other counters, including targeted build, dependency check, outside-folder changes and stray files, are zero. A direct `lake env lean` elaboration of Suggested.lean also succeeded with admitted-declaration warnings only. It does not establish truth or compliance with the no-admitted-data rule.

The mechanical dependency check was run with the specified order, movable placement and main content. Its output was:

```text
depcheck: 186 roadmaps, 1148 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every Needs block and the supplier contracts were read. No declared gap was available. The shared unvalued relative-root interface is assigned here and consumed by AdelicAlgebraicGroups; the latter's modulus agreement is a consumer contract, not an input to this roadmap's proof of the local modulus.

**Signature and padding probes.** Scratch copies printed 83 named declarations' elaborated signatures, followed by 11 additional topology/instance signatures. Both signature runs succeeded. The local-field, finite/free/projective, smoothness, separability and positive-rank restrictions in these signatures were compared with their prose; no additional dropped-binder defect was identified. Anonymous instances and examples were inspected in the source. No signature was changed in the worktree. A separate scratch copy tried `rfl`, `infer_instance` and `simp` as alternatives on each of 42 named admitted theorems; none closed in that generic screen. The explicit norm simplification probe still left a tensor/algebra-map conversion goal, as recorded in R06. The native Ihara signature elaborated with just its theorem admitted. These are statement/probe results, not proofs of the roadmap.

**Headline coverage.** The main end results are: affine point topology and compact/open integral points; congruence neighbourhood bases and smooth quotient sizes; affine Weil restriction and norm tori; existence of valued root data, apartments and buildings; descent and fixed points; lattice and division-algebra building models and Ihara's theorem; smooth/parahoric/Néron models and the extension principle; Moy–Prasad filtrations; Lang and proalgebraic Lang; Iwahori–Bruhat, Cartan and Iwasawa decompositions, parahoric double cosets, indices and unimodularity; dual reductive groups, Galois action and L-groups. The file states substantial parts of the first three, algebraic relative-root and z-extension results, norm/lattice equivalence, the tree, smooth-model criteria, Lang, and the three GL decompositions and modulus. General buildings, parahorics, their filtrations, and dual/L-group constructions require further carriers. The docstring does not supply the required theorem-by-theorem explanation of these omissions. Ihara is a concrete statable omission (R04); this review does not certify that it is the only such omission.

**Pinned objects opened.** These are the declaration witnesses used for the ownership and convention checks; paths here refer to the pinned libraries, not their development branches.

| Object | Pinned declaration and location | What the definition supplies / does not supply |
| --- | --- | --- |
| Norm of a scalar | `Algebra.norm_algebraMap`, `Mathlib/RingTheory/Norm/Defs.lean:100` | Norm is scalar to module finrank; freeness is in scope, and the library also defines nonfinite cases. |
| Base-change rank | `Module.finrank_baseChange`, `Mathlib/LinearAlgebra/Dimension/Constructions.lean:376` | Identifies the tensor extension's rank; no separate rank theory belongs here. |
| Tensor inclusion | `Algebra.TensorProduct.algebraMap_apply`, `Mathlib/RingTheory/TensorProduct/Basic.lean:256`; `includeLeft_apply`, `:269` | Algebra map is the pure tensor with one; the norm adapter changes factor order. |
| Units norm | `TauCeti.Algebra.normUnits`, `TauCeti/RingTheory/Norm/Units.lean:39`–49 | Units map of the algebra norm, rather than a new norm construction. |
| Dual root pairing | `RootPairing.flip`, `flip_flip`, `Mathlib/LinearAlgebra/RootSystem/Defs.lean:129`, `:139` | Swaps roots/coroots and lattices; double flip is already provided. |
| Maps of root pairings | `weightEquiv`, `coweightEquiv`, `Mathlib/LinearAlgebra/RootSystem/Hom.lean:285`, `:305` | The cocharacter direction is contravariant; it must be inverted when forming the dual covariant action. |
| Modular character | `MeasureTheory.Measure.modularCharacter`, `Mathlib/MeasureTheory/Group/ModularCharacter.lean:45`, pushforward relation `:93` | The right-translation convention gives the upper-triangular determinant modulus used below. |
| Amalgam | `Monoid.PushoutI`, `of`, `lift`, group instance, `Mathlib/GroupTheory/PushoutI.lean:60`, `:80`, `:102`, `:189` | Native carrier and universal map for Ihara. |
| SL inside GL | `Matrix.SpecialLinearGroup.toGL`, injectivity and range, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:273`, `:282`, `:299` | Exact native subgroup, not an arbitrary group with an assumed amalgam property. |
| Pro-p predicate | `TauCeti.IsProP`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` | Condition on open-normal quotients; compactness/Hausdorffness are separate assumptions, not hidden fields of the predicate. |

**Ownership and supplier resolution.** Object searches used the roadmap service on main/open heads, direct pinned-library searches and the board packages. The supplied sibling checkouts were also considered; no ownership claim is made about an unavailable open head. The following substantive supplier interfaces were resolved rather than inferred from roadmap titles:

| Supplier | Resolved location and consumed content | Boundary checked |
| --- | --- | --- |
| ReductiveGroups | `TauCetiRoadmap/ReductiveGroups/README.md:129`, `:227`, `:234`, `:432`, `:443`, `:466`, `:627`, `:1092`, `:1610`: Layers 0, 2–7 and 9 | Hopf/group dictionary, Lie theory, quotients, tori, reductivity, relative roots and pinned integral groups remain upstream. The local valued constructions are this continuation's work. |
| ModularCurves | `TauCetiRoadmap/ModularCurves/README.md:412` (0F), `:1165` (4D) | The existing affine finitely presented Hom construction and strict henselization are imported; arbitrary affine targets are an explicit extension, with Yoneda agreement. |
| LocalFieldsRamification | `TauCetiRoadmap/LocalFieldsRamification/README.md:59`, `:561`, `:705`: Layers 0, 2, 3 | Extension of valuation, maximal unramified extension/arithmetic Frobenius and tame ramification; completing the maximal unramified field is distinct from reconstructing it. |
| RootSystems | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:274`, `:296`: Layers 3, 4 | Coxeter and finite chamber theory are imported; valued affine walls and buildings are new. |
| ProfiniteProPGroups | `Completed/ProfiniteProPGroups/README.md:312`, Layer 3 | Generic pro-p closure/quotient theory already exists; the new statement identifies concrete congruence groups as pro-p. |
| ClassFieldTheory | `TauCetiRoadmap/ClassFieldTheory/README.md:1505`, Layer 9 | Weil group with its Weil topology and arithmetic degree; its mixed-characteristic reciprocity restriction is not silently used for all local fields. |
| ChevalleyGroups | `TauCetiRoadmap/ChevalleyGroups/README.md:280`, `:363`, `:378`–437, C2–C4 | Root maps, centre and integral big cell for general Chevalley data; the adjoint `PGL₂` case is not replaced by the full-weight simply connected case. |
| CFSGBasicProperties | `TauCetiRoadmap/CFSGBasicProperties/README.md:153`–181, T0–T2 | T0's perfectness and nontrivial central quotient are actual hypotheses; finite-family inputs are distinct from the local infinite-field target. |
| MassFormula | `TauCetiRoadmap/MassFormula/README.md:281`–305, Layer 2 | Integral linear lattice index and regular-Haar image scaling; denominator clearing and nonlinear local charts are separate work. |
| Sibling consumers | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:239`–256; `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:435`–463; `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:455`–462 | Shared relative roots, upper-parabolic modulus and integral Hecke input flow out of this roadmap. The inverse-index convention was compared. |

Board-package searches also found ReductiveGroupsPartIII explicitly importing local topology, Weil restriction and parahorics from this roadmap; it does not establish a second owner for them. No distinct-folder collision of the acceptance namespace was identified. The duplicate norm API in R06 is the concrete pinned-library duplication found here. These checks do not turn revision-only open pull requests into suppliers.

**Seeded source sample.** All 58 bibliography works were attempted through the source service: 48 yielded readable text, four were classified uncertified/paywalled, and six remain inaccessible or unreadable. Retrieval is not certification. There are no targets explicitly flagged “unverified” in this README. The 15 seeded targets were examined as follows; restricted source statements were not promoted to general theorems without checking the stated derivation.

| Target | Locator checked in accessible text | Outcome |
| --- | --- | --- |
| Congruence neighbourhood basis | milne-ag line 7539, §12.5, pp. 184–185; alternate casselman line 507, Prop. 1.4.4, p. 14 | Milne gives derivations over a field; the README explicitly extends via square-zero quotients. Casselman is reductive. The stated Platonov–Rapinchuk–Rapinchuk locators remain uncertified by this review. |
| Affine Weil restriction | bruhat-tits-ii line 831, §§1.5.1–1.5.7, pp. 26–28; stacks line 728, Tag 05Y8; line 824, Tag 05YF | Finite locally free extension and the functor's direction agree. General space representability is distinguished from affine coordinate construction. |
| Walls, alcoves and facets | bruhat-tits-i line 583, §§1.3.1–1.3.7, pp. 19–22; line 6012, §§7.2.1–7.2.7, pp. 161–163 | Discrete facets agree with the hyperplane description; central directions are retained in enlarged apartments. |
| Levi centralizing a vector | kisin-zhou line 331, §2.1.6, p. 8; he-2018 line 704, §6.1, p. 16 | Roots vanishing on the vector generate the Levi. Frobenius fixation is sufficient, not necessary, for stability; the README's regular-vector negative control respects this. |
| Independence of choices | bruhat-tits-i line 4459, §§6.2.5–6.2.12, pp. 120–125; bruhat-tits-ii line 3269, §§4.2.9–4.2.10, pp. 91–92; line 2994, §4.1.13, p. 84; line 3326, §§4.2.12–4.2.13, pp. 92–93 | Equipollence and conjugation are supported; quotienting the elementwise transport is not (R01). |
| Quasi-split unitary group in three variables | bruhat-tits-ii line 2898, §§4.1.9–4.1.13, pp. 82–85, including line 2994; §§4.2.20–4.2.23, pp. 97–99, line 3515 | Multipliable-root group and separate value/primed-value sets are essential. The short-root group contains the long-root group and must not be counted twice. |
| Division-algebra buildings | bruhat-tits-1984 line 883, Thm. 2.11, p. 283; line 997, §§3.2–3.6, pp. 286–288; kisin-pappas-zhou line 3356, §6.3.1, p. 73 | Splittable norms and lattice-chain stabilizers support the stated positive-rank construction; rank zero must use the separate trivial object. |
| Extension principle | bruhat-tits-ii line 1241, §§1.7.1–1.7.6, pp. 37–39; kisin-pappas-zhou line 655, Lem. 2.3.3, pp. 14–15; line 716, proof of Prop. 2.4.2, p. 16 | Strict henselian integral points and smoothness are retained. The latter proof's separate odd-prime closed-immersion step is not the unrestricted extension theorem. |
| Torus lft Néron model | jordan-ribet-scholl line 156, §1.1, p. 4 | Supports existence criterion over arbitrary DVR and smooth-test mapping property. BLR §10.2 Thm. 2, p. 297 remains paywalled; no claim of having read it. |
| Pro-unipotent radicals and nested facets | bruhat-tits-ii line 5042, §§4.6.33–4.6.35, pp. 137–139; line 5857, §5.1.32; van-hoften line 556, §2.2.3, p. 14 | Reduction/parabolic correspondence and the direction of the inclusions agree. The van Hoften presentation alone is not a proof over every residue field. |
| Central extensions of parahorics | kisin-pappas line 300, §1.1.3 and Prop. 1.1.4, pp. 7–8; kisin-zhou line 778, Prop. 2.4.13, pp. 17–18 | Tame splitting and torus/prime-to-p finite kernel are retained in the former. The latter supplies the R-smooth torus case; full-fixer surjectivity is not asserted. |
| Iwahori–Bruhat | haines-rapoport line 117, Prop. 8, p. 4; haines-richarz line 85, Thm. 1.4 and (1.7), preprint p. 2 | Normalizer quotient indexes the cells; using the connected parahoric preserves torsion components. |
| Parahoric double cosets | haines-rapoport line 117, Prop. 8, p. 4; haines-richarz line 85, Thm. 1.4 | Weyl double quotient matches the two parahoric types. |
| Cartan | bruhat-tits-i line 2905, Prop. 4.4.3, p. 80; haines-rapoport line 272, Prop. 13, p. 8 and line 288, Lemmas 14–17, p. 9 | Full-fixer and connected-parahoric versions require different quotients; the README distinguishes them. The GL₂ computations below test the connected version. |
| Proper-Levi Kottwitz kernel | gleason-lim-xu line 1242, Lem. 4.12 and (4.15), p. 31 | Proper rational parabolic in adjoint simple group supplies a positive-rank central direction; finite target cannot inject it. |

**Computed adversarial table.** Each row records actual values or sets on test instances, including negative controls. “Pass” means that these computations agree with the stated restricted claim, not a general proof. “Repair” points to a finding. The table includes all 15 sampled targets, the headline families, and every target touched by a finding. Additional API implications were read with their defining hypotheses; no exhaustive proof is claimed by a finite-instance table.

| Statement / convention | Instances tried | Values on the two sides / competing models | Result; change |
| --- | --- | --- | --- |
| ModelField: discrete rank-one, nontrivial valuation | ℚ₂; trivially valued field; lexicographic ℤ² | value group ℤ satisfies rank one; trivial group fails nontriviality; lex ℤ² has rank 2 | Pass; preserve separate hypotheses |
| Point topology / continuity criterion | affine line; two coordinate evaluations | Hom(k[t],R)=R, evaluation is identity; on k[x,y], evaluations are the two projections R²→R | Pass; API, not a substitute for a headline |
| Embedding in all functions | k[t], maps t↦0 and t↦1 | evaluation at t gives 0 and 1; underlying functions differ | Pass |
| Closed embedding using generators | R=ℝ, A=R[x]/(x²+1); A=R[x]/(x²) | solution sets ∅ and {0}, both closed; nilpotent source does not create an extra real point | Pass |
| Finite-type local compactness | A=ℚ₂[x]; infinitely many F₂ variables | first space ℚ₂ locally compact; second F₂^ℕ is compact but not discrete despite discrete coefficients | Pass; finite-type discrete Check discriminates |
| Tensor products on points | A=k[x], B=k[y] | Hom(A⊗B,R)=R²=Hom(A,R)×Hom(B,R); at zero coefficient ring both are singleton | Pass |
| Localization embedding | A=k[t], f=t and f=0, R field nonzero | images Rˣ and ∅; zero is excluded for t, all points excluded for f=0 | Pass |
| Group topology on points | finite constant S₃; Gm(ℝ) | discrete S₃ operations continuous; Gm(ℝ)=ℝ minus {0} is not totally disconnected | Pass |
| GL point comparison | GL₂(ℝ), matrix diag(1,0) | det=0, so neither Hopf points of GL₂ nor matrix units contain it; identity has det=1 in both | Pass mathematically; admitted map R03 |
| Integral points compact and open | Gm over ℤ₃ | image ℤ₃ˣ; 3 and 1/3 excluded, 2 included; compact open subset of ℚ₃ˣ | Pass |
| Linear Haar normalization | x↦3x on ℚ₃, μ(ℤ₃)=1 | image mass 1/3; pushforward mass on ℤ₃ is 3, reciprocal values | Pass; R07 citation repair only |
| Congruence subgroup definition | GL₂(ℤ₂), n=0 and 1 | n=0 gives GL₂(ℤ₂); n=1 kernel of reduction, quotient GL₂(F₂) has 6 elements | Pass |
| Congruence neighbourhood basis | Gm over ℤ₃ | levels n≥1 are 1+3ⁿℤ₃, intersection {1}; each smaller basic ball contains a sufficiently deep level | Pass; primary locator not readable |
| Congruence pro-p theorem | GL₂(ℤ₂), levels 0 and 1 | level-one finite successive quotients have 2-power order; level-zero quotient has order 6, not a 2-power | Pass |
| Smooth congruence quotient size | Gm and GL₂ over ℤ₂, n≥1 | sizes 2=2¹ and 16=2⁴; for Gm at n=0 size 1≠2 | Pass; retain n≥1 |
| Maximal-unramified completion and Frobenius | ζ₇ over ℚ₂; ramified √2 | arithmetic Frobenius ζ₇↦ζ₇², inverse ζ₇↦ζ₇⁴; √2 has value 1/2 and is not in the unramified completion | Pass |
| Affine Weil functor direction | ℂ/ℝ, A′=ℂ[t], R=ℝ | Homℂ(ℂ[t],ℂ)=ℂ; real-coordinate model ℝ² | Pass |
| Weil representing algebra | rank-two free algebra; rank-one identity | one affine variable becomes two variables; rank one gives A′ itself | Pass; R08 notation repair |
| Split and zero-extension Weil Checks | k′=k×k; k′=0 | Res of base-changed X is X×X with coordinate B⊗B; zero extension has one point with coordinate k | Pass; R09 remove proposed Check names |
| Weil restriction of empty scheme | faithfully flat positive rank versus rank zero | Res(empty)=empty in first case; Res(empty)=point for zero extension | Pass; faithful hypothesis matters |
| Finite separable splitting | quadratic separable versus purely inseparable degree two | separable geometric algebra is kbar×kbar; inseparable geometric algebra is kbar[ε]/ε², not a product | Pass; preserve separability |
| Norm and norm-one group | 2+3i over ℂ/ℝ | norm 13; inverse norm 1/13; norm-one real points form circle, not all ℂˣ | Pass |
| Diagonal norm | rank 2 and rank 1, scalar 2 | norms 4=2² and 2=2¹ | Pass formula; imported padding R06 |
| Norm-one torus and its characters | split quadratic extension | kernel {(u,u⁻¹)}≅Gm; character lattice ℤ²/ℤ(1,1)≅ℤ | Pass |
| Norm-one identity extension | degree one | norm identity; kernel {1}; character rank 0 | Pass; Lean Check removed under R05 |
| Roots of unity boundary | μ₄(ℂ); exponent 0 | μ₄ has 4 points; x⁰=1 gives all units, not a finite group | Pass; remove numeric Lean padding |
| Deligne torus weight convention | positive scalar 2; i | inverse weight maps 2 to 1/2, norm to 1/4; complex splitting sends i to (i,−i), not (i,i) | Pass |
| Smooth fixed points | inversion on Gm in characteristic 3 and 2 | fixed scheme μ₂: two reduced points in char 3; (x−1)² in char 2, nonreduced | Pass; invert group order |
| Abstract root datum / generating condition | SL₂; SL₂×C₂ with root groups in first factor | root-generated subgroup is SL₂ in both; index in second group is 2 | Pass; do not drop IsGenerating |
| Weyl normalizer quotient | split SL₂ rank one | N/T has 2 elements; its nonidentity element swaps the two roots | Pass |
| Valuation of root elements | SL₂, xα(π), identity | values 1 and ∞; opposite root convention has reflection translation with negative sign | Pass |
| Equipollence versus scaling | root values of 1 and π | values (0,1); translation by 1 gives (1,2); scaling by 2 gives (0,2), not equipollent | Pass |
| Apartment displacement bijection | rank-one plus one-dimensional central direction | central displacements 0 and 1 give equal root valuations but distinct enlarged points | Pass; central coordinate retained |
| Affine root evaluation and wall | SL₂ coroot coordinate t, α(t)=2t | α+k=0 at t=−k/2; k=0,1 give 0,−1/2 | Pass |
| Local finiteness of walls | SL₂ segment [0,1] | walls at 0,1/2,1: exactly 3; not infinitely many | Pass |
| Facets, alcoves and special points | rank-one apartment; rootless torus | open interval (0,1/2) is an alcove; 1/4 is not special; rootless apartment is a single facet | Pass |
| Affine Weyl reflections | reflections about 0 and 1/2 | s₀(t)=−t; s₁(t)=1−t; s₁s₀(t)=t+1 | Pass; signs fixed |
| Levi of an apartment vector | GL₃: v=(1,1,0), regular v, zero v | Levis GL₂×GL₁, diagonal torus, GL₃; not the positive-root parabolic | Pass |
| Frobenius stability of Levi | unramified U₃, v=(2,1,0) | σv=(0,−1,−2) differs from v; both have no vanishing roots, both Levis T | Pass; no converse claimed |
| Choice transport quotient | GL₂(ℚ₃), 1 and diag(2,1) | both ν=0; images of x₁₂(1) are x₁₂(1) and x₁₂(2) | Fail; R01 |
| Minuscule and dominant coweights | GL₂ weights (1,0), (2,0) | root pairings ±1 versus ±2; only first minuscule | Pass |
| Algebraic fundamental group | GL₀, GL₁, SL₂, PGL₂ | groups 0, ℤ, 0, ℤ/2 respectively | Pass |
| z-extension condition | GL₂→PGL₂ versus SL₂→PGL₂ | kernels Gm versus μ₂; only first is a torus-kernel z-extension | Pass |
| Kottwitz and apartment signs | Gm, element π | κ(π)=1; ν(π)=−1; inverse element gives −1 and +1 | Pass |
| Ramified norm-torus Kottwitz Check | ℚ₃(√3)/ℚ₃ versus F₂((√t))/F₂((t)) | first a/σa=−1 has class 1 mod 2; second has no σ and −1=1 has class 0 | Fail; R02 |
| Repaired equal-characteristic-two Check | b²+b=t⁻¹, a=1/b | σb=b+1; norm((b+1)/b)=1; normalized ord(a)=1 and κ=1 mod 2 | Pass repaired instance |
| SU₃ nonreduced root group | trace-zero δ, commutator in short-root group | central coordinate commutator 2δ; long-root subgroup has first coordinate 0 | Pass in char≠2 instance; no abelian short-root model |
| SU₃ value sets | unramified quadratic extension, odd residue characteristic | Γa=(1/2)ℤ, Γ′a=ℤ, Γ2a=ℤ; 1/2 belongs to Γa but not Γ′a | Pass; primed set matters |
| Split SL₂ reflection normalization | root parameter π | reflection t↦−t−1; fixed point −1/2 rather than +1/2 | Pass README correction; source misprint below |
| Enlarged and reduced buildings | split Gm; GL₂ | Gm enlarged ℝ, reduced point; scalar GL₂ translations are nonzero enlarged, zero reduced | Pass |
| CAT(0) midpoint inequality | apartment line, x=0,y=2,z=1 | d(z,mid)²=0; (d(z,x)²+d(z,y)²)/2−d(x,y)²/4=0 | Pass |
| Choice of invariant metric | two-dimensional split torus | quadratic forms x²+y² and x²+2y² give distances 1 and √2 on second basis vector | Pass; metric choice is necessary |
| Fixed-point theorem | reflection of line; integer translations | reflection fixes 0 with bounded orbit {−1,1}; translations have unbounded orbit ℤ and no fixed point | Pass; boundedness retained |
| Facet and orientation | SL₂ edge with endpoints 0,1 | swap reverses orientation: sign −1; identity sign +1 | Pass |
| Parahoric versus full fixer | PGL₂ edge midpoint | edge flip lies in full fixer and has order 2 modulo connected Iwahori; connected quotient is trivial | Pass |
| Extension of fields on buildings | ramification index 2; unramified extension | normalized lattice distance 1 becomes 2 in ramified case and stays 1 unramified | Pass |
| Central functoriality | GL₂→PGL₂ | apartment ℝ²→ℝ²/ℝ(1,1), kernel ℝ(1,1); scalar displacement disappears | Pass |
| Products of buildings | Gm×Gm | apartment ℝ×ℝ=ℝ²; replacing it by either factor loses one coordinate | Pass |
| Twisted Levi separability | quadratic torus in GL₂ | separable base change Gm²; inseparable base change Gm×Ga, not reductive | Pass; keep separability |
| Splittable norm / graded chain | weights (0,1/2) on K² | chain O² ⊃ πO⊕O ⊃ πO², period 2 with two strict jumps | Pass |
| Norm/chain rank-zero exclusion | zero vector space | one norm; strict chain period equation would force 0<0, impossible | Pass; NeZero n retained |
| Division-algebra valuation normalization | local quaternion division algebra; D₀((t)) | first normalized K-valuation extends with group (1/2)ℤ; second can have value group ℤ despite degree 2 | Pass; degree alone does not set ramification |
| Division-algebra lattice stabilizer | m=1 | stabilizer of standard lattice is O_Dˣ; uniformizer changes lattice and has nonzero translation | Pass |
| SL₂ tree adjacency | O², O⊕πO, O⊕π²O | distances from first are 0,1,2; only middle adjacent | Pass |
| Tree degree | residue field F₂ | lines in F₂²: spans of (1,0),(0,1),(1,1), giving 3=2+1 neighbours | Pass; remove numeric Lean example |
| Ihara amalgam / inversion | SL₂(ℚ₂); PGL₂ edge flip | vertex indices [K₀:I]=[K₁:I]=3; PGL₂ flip exchanges endpoints, SL₂ preserves their parity | Pass mathematics; omitted headline R04 |
| Anisotropic and torus buildings | anisotropic norm-one torus; split Gm | first building point and bounded group; second enlarged line and valuation image ℤ | Pass |
| Smooth model generic/special fibres | GL₂/O; trivial group | dimensions 4 and 0 in both fibres; determinants 1 at identity, including empty 0×0 determinant | Pass |
| Flat schematic closure | generic subgroup x=0 in Ga; torsion O/(π) | closures have coordinate O and zero ring respectively; vertical torsion is not retained as flat generic closure | Pass |
| Extension principle | Ga/O strictly henselian, maps x↦πx and x↦π⁻¹x | first preserves O-points and has integral coefficient; second sends 1 outside O and cannot extend | Pass |
| Need strict henselization in extension test | O with residue Fq; function (X^q−X)/π | integer-valued on O but coefficient 1/π is nonintegral; on strict-henselian points residue outside Fq makes numerator a unit | Pass; O-points alone insufficient |
| Integral relative big cell | SU₃ | dimensions dim U− +dim T+dim U+=3+2+3=8; double-counting U2a gives 10 | Pass |
| Faithful integral linear realization | Gm standard representation; trivial group | standard inclusion into GL₁ has trivial kernel; trivial group embeds into GL₀ | Pass boundary |
| Torus lft Néron model | Gm; trivial torus | integral points Kˣ with components ℤ for Gm; trivial model Spec O with one component | Pass |
| Néron lft versus finite type model | Gm/O | O-points of lft model Kˣ; O-points of Gm/O are Oˣ; π lies only in first | Pass; distinction necessary |
| Connected parahoric of ramified torus | separable ramified quadratic norm-one torus, char K≠2, a²=π | component quotient ℤ/2; full bounded group versus connected subgroup index 2 | Pass restricted instance; R02 repairs overstatement |
| Pro-unipotent does not mean profinite | Ga(C) as residue quotient | additive group C is infinite nondiscrete algebraic group; finite residue Ga(F₂) has 2 points | Pass; finite residue hypothesis retained for pro-p topology |
| Nested facets and reductive quotients | GL₂ vertex and adjacent alcove, q=2 | vertex quotient GL₂(F₂) of order 6; alcove quotient (F₂ˣ)² of order 1; vertex/Iwahori index 3 | Pass; inclusion directions agree |
| Hyperspecial existence | split GL₂; anisotropic inner SL₁(D) | first standard reductive model; second is not quasi-split, so no hyperspecial despite unramified splitting field | Pass |
| Central extensions of parahorics | GL₂→PGL₂; SL₂→PGL₂ at p=2 | first kernel Gm smooth and split; second kernel μ₂ not smooth in special fibre, excluded from prime-to-p clause | Pass |
| Full-fixer surjectivity distinction | connected source fixer, target with 2 components | image of connected special fibre meets only identity component; cannot surject onto both | Pass |
| Classical lattice duality | symplectic basis, weights (a,−a) | dual weights (a,−a) again; weights (a,a), a≠0, dual (−a,−a) differ | Pass |
| Orthogonal integral special fibre caution | split even quadratic space, odd char versus char 2 bilinear model | orthogonal determinant ±1 yields two components in odd char; alternating bilinear form in char 2 gives symplectic behaviour | Pass; do not identify quadratic and bilinear models |
| GL Moy–Prasad depths | depth 1/2 and 1 at standard vertex | matrix lattice πM_n(O) in both; depth 1+ gives π²M_n(O) | Pass |
| Positive-depth multiplication linearization | 1+πX and 1+πY | product 1+π(X+Y)+π²XY; additive law valid modulo π², not exactly | Pass |
| Prime-to-p powers and wild powers | 1+t in F₂((t)) | square 1+t² changes depth 1 to 2; odd power has leading coefficient 1 and retains depth 1 | Pass |
| Wild graded group/Lie comparison caution | norm-one torus for ℚ₂(√2)/ℚ₂ at stated half-depth | group graded quotient can be trivial while corresponding residue Lie piece has 2 elements | Pass negative control; no unrestricted equality |
| Lang for connected groups | Ga over Fqbar; μ₂ over F₃ | x^q−x is surjective with q-point fibres; x↦x⁻¹F(x) on μ₂ is constantly 1 and misses −1 | Pass; connectedness essential |
| Proalgebraic Lang compatibility | successive additive finite-field quotients | each solvable Lang fibre has q^d elements; compatible finite nonempty fibres have nonempty inverse limit | Pass on finite-fibre test |
| Truncated coefficient models | length 2 in equal and mixed characteristic | Fq[t]/t² and W₂(Fq) each have q² elements; char p versus char p² distinguishes rings | Pass |
| Intersection/congruence dimension | GL₂, conjugation diag(π,1), level 1 | coordinate valuations shift by (0,+1,−1,0); intersecting imposes the larger of each pair of bounds | Pass; dependence on root direction retained |
| Iwahori–Weyl group | split GL₂ | ℤ²⋊S₂; a translation (1,0) and the transposition are distinct, unlike quotient by maximal compact normalizer | Pass |
| Length-zero subgroup | PGL₂ rank one | alcove flip has length 0 and order 2; affine Weyl group alone omits it | Pass |
| Simple-reflection cell multiplication | rank-one residue F₂ | one simple cell has 2 right-Iwahori cosets; square has cells 1 and s since s²=1 | Pass |
| Translation length | GL₂ t(1,0), t(1,−1) | lengths ∣1−0∣=1 and ∣1−(−1)∣=2 | Pass |
| Iwahori–Bruhat parametrization | GL₂ identity and Weyl transposition | distinct I-double cosets; both lie in the same maximal-compact double coset | Pass |
| Parahoric double quotient | GL₂ vertex versus alcove | vertex Weyl subgroup S₂ has 2 elements; alcove Weyl subgroup trivial; first identifies the two preceding cells | Pass |
| Finite compact-open double cosets | GL₂ over ℚ₂, diag(2,1) | K-double coset has q+1=3 right K-cosets; whole G/K remains infinite | Pass |
| Kottwitz quotient of G | GL₂, SL₂, PGL₂ | determinant order ℤ, trivial group, and determinant order modulo 2 | Pass |
| Dominant Galois averaging | two factors with weights (1,0),(0,1) | average (1/2,1/2); averaging their dominant representatives gives (1,0), a different vector | Pass; operation order matters |
| Dominance versus Bruhat order | GL₂ dominant (1,0)≤(2,−1); nondominant (−1,1)≤0 | first lengths 1≤3; second lengths 2>0, so cone inequality alone does not imply Bruhat | Pass |
| Torsion translation | ramified norm-one torus | nonzero class in ℤ/2 has real displacement 0; discarding torsion identifies two cells | Pass |
| Admissible set boundary | central coweight; GL₂ minuscule (1,0) | central admissible set singleton; minuscule set has three elements (two length 1, one length 0) | Pass |
| Cartan decomposition | GL₂, diag(π²,π⁻¹) and switched diagonal | both dominant parameter (2,−1); parameter (1,0) has different determinant order 1 versus 1 but different elementary divisors | Pass; determinant alone does not classify |
| Cartan rank zero/one | GL₀ and GL₁ | GL₀ one double coset; GL₁ cosets π^n Oˣ indexed by every n∈ℤ | Pass; boundary examples not Lean headlines |
| Cartan: special versus alcove | SL₂, alcove parahoric | W_x=1 versus W₀=C₂; reflected Iwahori cell cannot be a pure translation cell | Pass |
| Iwasawa decomposition | GL₂ permutation matrix | permutation is in K, so G=KB instance has B-factor 1; diagonal(π,1) gives nontrivial B-factor | Pass |
| Rational split-torus cosets | Gm, K=Oˣ | π^mK=π^nK iff m=n by valuation; infinitely many cosets | Pass |
| Proper-Levi Kottwitz map | PGL₂, Levi T of a Borel | map ℤ→ℤ/2; kernel 2ℤ has rank 1, target finite | Pass |
| Kneser–Tits hypotheses | split SL₂; PGL₂; anisotropic group | SL₂ root-generated quotient 1; PGL₂ quotient Kˣ/(Kˣ)² can be nontrivial; anisotropic root-generated subgroup 1 | Pass; retain simply connected/isotropic scope |
| Unimodularity of reductive group | GL₂ diagonal(3,1) acting on full Lie algebra | weights 1,1,3,1/3 multiply to 1; modulus 1 | Pass |
| Parabolic modulus normalization | upper B in GL₂(ℚ₃), diag(3,1), diag(9,1) | δ values 1/3 and 1/9; opposite B gives 3 and 9 | Pass; matches sibling convention |
| Nonreduced modulus multiplicities | SU₃ odd unramified rank-one case | short-root quotient dimension 2 and long-root dimension 1 give exponent 2+2=4, not 3+2=5 | Pass |
| Iwahori index orientation | SL₂ diag(π,π⁻¹), q=2 | expanding root exponent 2 gives index q²=4; opposite intersection reverses which subgroup has the index | Pass |
| Rank-one Cartan counts | q=2, first positive shell | PGL₂:3; SL₂:6; unramified SU₃:18 from (q³+1)q | Pass |
| Dual based root datum | SL₂ and PGL₂; rank zero | dual pair exchanged; empty root datum remains empty | Pass; consume pinned flip |
| Dual action direction | cyclic permutation of 3 coordinates | inverse permutation sends 1→3, direct sends 1→2; distinguish contragredient from mistaken covariant dual | Pass |
| Dual centre as group scheme | dual of PGL₂ over F₂ | centre μ₂ has coordinate (x−1)² and one F₂-point; not the trivial group scheme | Pass |
| Inner versus lifted inner automorphism | PGL₂(ℝ), diag(−1,1) | any scalar multiple has determinant −c²<0, so no SL₂(ℝ) lift | Pass; use adjoint group |
| Pinning and rational-point faithfulness | Gm/F₂ versus Gm/ℚ | F₂ˣ={1}, inversion acts trivially on points; on ℚˣ it sends 2→1/2 | Pass; scheme automorphism is stronger |
| Finite constant L-group components | Γ=C₂ over F₂×F₂ and over zero ring | constant scheme points have 4 and 1 choices; abstract Γ has 2 in both | Pass; distinguish group functor from abstract semidirect product |
| Semidirect-product convention | Γ acts by inversion on Gm, z=2 | (1,γ)(2,1)=(1/2,γ), while (2,1)(1,γ)=(2,γ) | Pass |
| Dual Levi inclusion | empty and full simple-root subset | dual Levi is dual torus and full dual group respectively | Pass |
| Dual central isogeny | square map Gm→Gm over ℝ | kernel μ₂; positive real values have lifts, −1 has none; scheme map still fppf surjective | Pass; do not assert all-point surjectivity |
| Products of L-groups | two split groups with common Γ=C₂ | fibre product has one Γ-coordinate; direct product has Γ² of size 4 instead of 2 | Pass |
| Weil restriction and dual induction | quadratic separable extension | two dual factors permuted by nontrivial Galois element; rank doubles | Pass |
| GSp₄ root-datum comparison | matrix [[1,1,1],[1,0,1],[1,1,2]] | det=−1; sends (−1,1,0) to (0,−1,0) and (0,−2,1) to (−1,1,0) | Pass README correction; source issue below |

The table contains 127 computation rows. Rank-zero, residue characteristic two, inseparable, nonreduced, split/non-split and nonabelian tests are included; q=1 is excluded because a residue field has at least two elements.

## Not verifiable

The following source limitations are not claims that the corresponding mathematics is false. The review is finished with these limitations recorded; no source was guessed, bypassed behind a paywall, or copied into the repository.

- **platonov-rapinchuk-rapinchuk:** the Cambridge DOI/publisher route did not yield readable legal text. In particular §3.1 p. 126 and Lemma 3.38 p. 160 for the sampled congruence target were not certified. Milne's derivation description and Casselman's reductive case do not certify that exact locator.
- **cartier:** the AMS route led to access control (LibLynx); §4.1 pp. 144–145 was not read.
- **springer:** the AMS route led to access control; §§2.13–2.15 pp. 10–11 and §§3.2–3.7 were not read.
- **tits:** the AMS route led to access control; §§1.10.2 p. 36, 1.15 p. 42 and 3.8.1 p. 55 were not read.
- **yu:** the service found an AMS landing page but did not establish an allowed readable PDF route. Its smooth-model/filtration citations were not certified.
- **nguyen-quoc-thang:** the CERN result was an HTML challenge rather than the paper. Lemma 2.1(a), p. 4 was not read.
- **blr, moy-prasad-1994, moy-prasad-1996, prasad-raghunathan:** the service classified these as paywalled/uncertified. Their locators are retained without claiming text verification and are not new missing-text requests. For the sampled lft Néron target, the accessible Jordan–Ribet–Scholl criterion was checked separately.

The six unresolved retrievals are recorded in the job's `needs-references.toml`; existing entries were retained. Source manifest and roadmap files were not changed. Readable bibliography works outside the seeded sample were used where relevant to the adversarial pass; successful retrieval alone is not asserted to verify every locator in the 7,237-line README.

## Source issues

- **Misprint** in bruhat-tits-i at §6.2.12, application, printed p. 124 (line 4611): the source gives the reflection centre with a positive valuation half-shift; it should be φ − (ω(u)/2)α∨, rather than φ + (ω(u)/2)α∨; affects a stated result.
- **Error** in pilloni at §5.1.1, printed p. 20 (line 864): the listed second simple root and coroot have pairing −2; it should use, for example, simple roots e₂−e₁ and e₃−2e₂ with respective coroots f₂−f₁ and −f₂; affects a stated result.
