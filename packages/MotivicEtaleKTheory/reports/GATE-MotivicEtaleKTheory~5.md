## H01 (CBirkbeck) — answered

The duplicate restriction-fiber and cube constructions remain in `TauCetiRoadmap/ColemanIntegration/README.md:2395`, `:2397` and `:2435`, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, `:211` and `:727` already specify their shared owner and the coherent Quillen/perfect-model adapters preserving relativeKSpace, higherKGroupWithSupports, cubeRelK and ordered relativity. The finding is confirmed and remains unresolved: its repair requires changing ColemanIntegration's construction and dependency clauses, which are outside this job's two-file edit authorization.

## H02 (CBirkbeck) — answered

`TauCetiRoadmap/SchemeKTheoryOperations/README.md:9` and `:2403` still assign the multi-relative refinements to ColemanIntegration, conflicting with the shared ownership in `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`. The required sibling correction is to name MotivicEtaleKTheory §2.0a for the shared iterated restriction diagrams while retaining SchemeKTheoryOperations §§2.5, 6.1 and 6.8–6.9 as their earlier suppliers and ColemanIntegration as owner of its exact-cube realization and Adams comparison; that sibling file is read-only here, so the finding remains unresolved.

## H03 (CBirkbeck) — answered

`TauCetiRoadmap/ColemanIntegration/README.md:2648` still constructs reg_∞ and `:2659` omits the shared character and normalization, although `TauCetiRoadmap/MotivicEtaleKTheory/README.md:729` already specifies reg_∞ = πₚ₋₁ ∘ ch_D,p for p≥2, with πₚ₋₁(3+4i)=4i,3 for p=2,3. Replacing that sibling construction with the marked specialization of §§7.1/7.4, preserving its arithmetic pairings, integral-image theorem, determinants and syntomic map, is the required repair; it remains unresolved because ColemanIntegration is outside the permitted edits.

## H04 (CBirkbeck) — answered

The simultaneous-eigenspace decomposition claimed for arbitrary relative/open cubes in `TauCetiRoadmap/ColemanIntegration/README.md:2395` and `:2437`, and the simultaneous-weight comparison language in `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2405`, exceed the supplied generalized-weight interface; `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, `:223`, `:235` and `:727` already distinguish them and assert equality on full cubes with product support. For T(e₁)=2e₁ and T(e₂)=e₁+2e₂ the two kernel dimensions are 1 and 2, so equivariance alone cannot supply the missing equality: the sibling contracts must use generalized pieces on arbitrary opens or prove a separate semisimplicity theorem, and this remains unresolved without claiming that this Jordan block occurs in those K-groups.

---

**Disposition.** All four points are confirmed; “answered” records an explanation of the unresolved scope restriction, not an applied repair or a dispute of the mathematics. Neither authorized roadmap file was changed, no commit was made, and the reviewed head remains `83b84dfb91b8c5b462d57b390896bff8e5df7e43`; passing validation does not resolve the sibling blocker.

**Evidence and ownership.** The inspected new-roadmap heads are ColemanIntegration `ae078af`, SchemeKTheoryOperations `88dbd5a`, GeneralAlgebraicKTheory `e0552fe`, KTheoryFiniteLocalFields `afe02e8`, MotivesAndAlgebraicCycles `79b02f6`, ResolutionOfSingularitiesCharacteristicZero `bf45c86` and ComplexComparisonPartII `2d50a88`; main is `ae2562c`. Object searches covered main, the indexed open roadmap heads including the supplied sibling checkouts, and the board packages; the confirmed duplicate owners are the sibling clauses identified above, and no ownership transfer was silently treated as completed.

Section 2.0a is the shared refinement needed for this roadmap's cycle-to-K construction; it consumes the existing scheme vertex models, supported products and operations rather than supplying them back to SchemeKTheoryOperations. The merge order places SchemeKTheoryOperations at 38, MotivicEtaleKTheory at 84 and ColemanIntegration at 151, so importing the shared construction from ColemanIntegration would reverse supply; its exact-category and exact-cube work stays downstream. Cross-roadmap citation resolution found no missing citations; the relevant §2.5 comparison, §6.1 pairings, §§6.7–6.9 operations/weights and the cited ColemanIntegration sections were read at those heads.

Levine94 line 655 gives the supported restriction-fiber construction, Levine94 line 695 its iterated-fiber operations, and Levine94 line 706 through line 736 defines generalized characteristic spaces and proves the filtered decomposition (Lemma 2.1, pp.257–259). The wider regular ample-family vertex scope is supplied by SchemeKTheoryOperations §§2.5, 6.7–6.9, rather than inferred from Levine's field-base discussion. BF line 919, BF line 934 and BF line 948 through line 959 give the smooth complex universal Deligne character; BKK line 4027 through line 4036 gives the Tate projection and cone arrow. These legal cached sources suffice for the findings; no new reference is required, and the settled uncertified Bloch86/Beilinson85 and waived Levine98 entries were not reopened.

**Pinned interfaces and signatures.** Both manifests agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The README's cited native declarations were inspected at their stated files and lines, including `AlgebraicCycle` (a locally finitely supported function, without a dimension predicate), `AlgebraicCycle.map` (explicit weights and a quasi-compact morphism), the cone summand differential formulas, Dold–Kan, graded complexes, Tate structures and mixed-Hodge strictness; none supplies the missing geometric K/cycle/Deligne carriers.

The mechanical declaration inventory of `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` is empty: zero theorems, definitions, structures or instances, with only `import Mathlib`, the headline/missing-carrier docstring and the namespace. Consequently the per-declaration `#check @name` list and elaborated-binder comparison are empty, no standing hypothesis can have disappeared from a declaration, and no signature changed; the required module build below elaborated the existing acceptance file.

**Adversarial computations for the reviewed contracts.** No statement was added or changed; the following checks exercise the existing definitions, signs and interfaces on which the four answers rely.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §2.0a, zero cube agrees with supplied K | X=Spec ℚ, full support, rank two | Relative K₀ class 2; supplied K₀ class 2 | Agreement | None |
| §2.0a, empty support | n=0 and n=1 | Support fiber of identity contractible; all its homotopy groups 0 | No spurious supported class | None |
| §2.0a, ordered one-coordinate relativity | Face ranks (1,0), (0,1), (1,1) | a−b gives 1,−1,0; reversed order gives −1,1,0 | Fixes the adapter sign | None |
| §2.0a, unit Adams equivariance | Full one-cube over ℚ, unit 2 | ψ²[2]=[4]=2[2] on each side; v₂ values 2=2 | Full-cube weights agree | None |
| §2.0a, two-loop exchange | Ordered Milnor symbol {u,v} over ℚ(u,v) | Consecutive last-slot residues give 1; exchanged loop order gives −1; ψ² gives factor 4 in both models | Fixes exchange and weight | None |
| §2.0a, general regular base | Spec ℤ₂ and Spec ℤ₃, full one-cube | K₀ of relative cube = K₁(ℤₚ)=ℤₚ×; face differences 1,−1 for both primes | No prime exclusion | None |
| §2.0a, special-unit localization | ℤ₃, remove t=2 | Face values 0−2=−2 and ∞ stay disjoint from the removed section; both surviving faces have trivial-line rank 1 | Domain includes the localized open; no full-cube delooping inferred | None |
| §2.0a, pairing domain | X=Spec ℤ[i], same-base open cubes versus external self-product | Same-base cube regular; external local ring v(v+2i)=0 has dimension 1 and cotangent dimension 2 | Regular external-base hypothesis matters | None |
| §2.0a, Adams multiplicativity | Two line bundles L,M | ψᵃ([L][M])=[LᵃMᵃ]=ψᵃ[L]ψᵃ[M]; trivial lines give 1=1 | Correct vertex identity; coherent diagram comparison still required | None |
| §2.0a, pointed rather than spectrum integral Adams maps | η·1=[−1] in K₁(ℚ), ψ² | ψ²[−1]=[1]=0; a spectrum map fixing 1 would give [−1]≠0 | Excludes an integral spectrum-endomorphism interpretation | None |
| §2.0a, rational coefficient requirement | K₀(ℙ²), h³=0 | ψ²(2h+h²)=2(2h+h²), ψ²h²=4h²; integral eigenlattice index 2, while h=(2h+h²)/2−h²/2 rationally | Rational splitting does not assert integral splitting | None |
| §2.0a, generalized versus scalar weight | T=2I+N, N(e₂)=e₁, N(e₁)=0 | Ne₂=e₁≠0; N²e₂=0; dim ker N=1 versus dim ker N²=2 | Filtration does not prove semisimplicity | None |
| §2.0a, equivariant transport | Invertible intertwiner F with FT=T′F | (T′−2)F(e₂)=F(e₁)≠0; (T′−2)²F(e₂)=0 | Both kernel notions are transported separately | None |
| §2.0a, generalized pieces on a scalar full-cube model | Unit weight-one line, ψ²=2I | ker(ψ²−2)=ℚ and ker((ψ²−2)²)=ℚ, both dimension 1 | Compatible with the restricted equality | None |
| §7.1, positive-degree Chern normalization | Weights p=1,2,3 | (−1)ᵖ⁻¹/(p−1)! = 1,−1,1/2 on the universal and specialized characters | Same normalization | None |
| §§7.1/7.4, point projection | z=3+4i, p=1,2,3 | (z+(−1)ᵖ⁻¹z̄)/2 = 3,4i,3, the stated quotient coordinates | Correct parity | None |
| §7.1, projection descends modulo ℝ(p) | Add real multiples of iᵖ, p=1,2,3 | πₚ₋₁(iᵖ)=0 in all cases; projected z remains 3,4i,3 | Independent of representative; opposite parity retains a nonzero added component | None |
| §7.4, logarithm branch and sign | Units 2, i, 1/2 and 2·3 | Re log values log 2,0,−log 2; log 6=log 2+log 3; branch changes add zero real part | Fixes positive unit normalization | None |
| §7.4, odd product normalization | f=2,g=t on 𝔾_m | Product i log 2 darg t has circle period 2πi log 2; exchanged product has its negative | Preserves twist and odd sign | None |
| §7.4, divisor and projective normalization | tᵃ on 𝔸¹ and O(a) on ℙ¹, a=−1,0,1 | Green representative −a log|t| has supported coefficient a; normalized Chern integral a=−1,0,1 | Unit and divisor signs remain distinguished | None |

**Build outcome (exit 0).**

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

**Gate summary (exit 0).**

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency-check output (exit 0).**

```text
depcheck: 45 roadmaps, 487 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No process remains running and the worktree is clean.
