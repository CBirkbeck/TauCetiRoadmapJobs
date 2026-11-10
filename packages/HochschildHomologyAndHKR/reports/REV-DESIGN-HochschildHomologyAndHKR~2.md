# Review of HochschildHomologyAndHKR (design, round 2)

**Verdict:** needs changes

Ten findings: one P1, four P2, five P3. This is a design review, not a package acceptance or an elaboration certificate. The original four findings are repaired; the current pins expose additional duplication, and the adversarial pass finds invalid Checks and missing empty cases. The general scope is repairable and does not require rejecting or re-planning the roadmap.

## Verification of the previous repairs

The repair report marks F01–F04 applied; none is marked not actionable. I checked the repaired passages, their plan entries, and their witnesses independently.

| Previous finding | Repaired passage in packages/HochschildHomologyAndHKR/design/README.md | Assessment |
| --- | --- | --- |
| F01 | Lines 94–101 name `TauCeti.ReducedTensorWords.brace`, `TauCeti.AInfinityAlgebra.PositiveHochschild.complex` and its cohomology. Lines 1015–1022 restrict the comparison to “for `n ≥ 2`” and distinguish “`Z¹(A,A) = Der_k(A)`”. | Repaired for the original positive-arity omission. The namespaces corrected by the repair are correct. The degree restriction prevents identifying derivations with derivations modulo inner derivations. R01 concerns additional declarations at the actual current pin, not a rejection of this repair. R03 concerns its newly added Check. |
| F02 | Lines 1122–1125: “For `A` flat as a `k`-module, RefinedTraceMethods §1.1 identifies the homology of the cyclic bar complex with the derived Hochschild homology”. | Repaired. The supplier, its contract and the plan prerequisite agree. The source section now resolves. |
| F03 | Line 1147: “For a commutative `k`-algebra `R`”; lines 1149–1154 restrict the derived comparison clauses to flat algebras and the isomorphism clause to smooth algebras. | Repaired. Classical antisymmetrisation and projection work without flatness. The added nonflat test gives classical HH₂(F_p/Z)=0 versus derived F_p. R09 records the same unnecessary restriction surviving in §7.5. |
| F04 | Lines 1463–1466 cite “the Koszul-resolution computation inside the proof of Theorem 3.1”; line 1483 says Theorem 5.2 “is the case of a perfect field `k`”. | Repaired. HKR62 lines 268–279 support the regular-sequence computation; the narrower theorem is no longer claimed for arbitrary bases. R05 concerns the unsampled zero-variable case of the repaired §8.5. |

The earlier review's computed rows remain useful evidence for unchanged formulas. Its summary-only rows on functoriality and long exact sequences have been recomputed below. Its claims of absence at older library pins, and its uncomputed “m=0: identity” entry, are not carried forward.

## R01 (P2) — Import the bimodule primitives now present at the pin

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:463`, §§1.2, 3.2–3.3, and scope/contracts: “with … cofaces”; “Define the submodule … of bimodule derivations”. `packages/HochschildHomologyAndHKR/design/plan.json:7` records obsolete baseline revisions.

**Claim.** The design owns the bimodule cofaces, coboundary identities, low-degree cocycle characterisations and bimodule derivation carrier.

**Witness.** `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:226,303,329,359,382` already supplies these cofaces, differential, square-zero law and cocycle characterisations; `TauCeti/RingTheory/Derivation/Bimodule.lean:41` supplies `TauCeti.BimoduleDerivation`.

These declarations are at the manifest pin, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, not a prospective roadmap. Their hypotheses include both module actions, compatible scalar towers, and commuting actions where needed. They include arity zero. The plan instead records Tau Ceti `358314d4...` and Mathlib `f6090c70...`; the actual Mathlib pin is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

**Repair.** Refresh the baseline and list these native objects in scope and exact contracts. Build the cosimplicial packaging and codegeneracies from the native cofaces, and identify the resulting alternating differential with `TauCeti.hochschildBimoduleCoboundary`. Import its identities instead of planning them again. Use `TauCeti.BimoduleDerivation` for §3.3; keep the identification with the cocycle submodule, inner quotient and HH¹ comparison as adapters. Update the affected plan ownership and Needs. Do not delete the genuinely new arbitrary-bimodule complex: the existing `TauCeti.hochschildCochainComplex` has a different coefficient object, as explained below.

**Repair test.** The pinned degree-zero formula gives δE₁₁(E₁₂)=−E₁₂, exactly the design's convention. In degree one the pinned formula gives af(b)−f(ab)+f(a)b. The native derivation carrier has D(1)=0 and the same Leibniz rule; over additive groups D(1)=2D(1) forces D(1)=0, so it loses no intended inputs.

## R02 (P2) — Exterior projectivity and finite-projective duality have owners

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1246`: “prove that … is finite projective and that … `pairingDual` … is bijective”; plan target 7.3.

**Claim.** §7.3 owns the generic finite-projective exterior-power and duality results.

**Witness.** `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145` proves exterior projectivity. Open #1272, `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3954`, §6.1, owns evaluation being an isomorphism for every finite projective module.

Mathlib `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:29` already supplies finiteness. EulerSystemsAndKolyvaginSystems §6.1 explicitly adds the general finite-projective comparison to IntegralIwasawaTheory §12.6's shared bidual and evaluation. This is not only an arithmetic specialization: its quantifier is an arbitrary finite projective X over a commutative R. At X=P*, its map is
`⋀^n P* → (⋀^n P**)*`.
After finite-projective reflexivity P≃P**, this is precisely §7.3's determinant pairing. The necessary dual projectivity, dual finiteness and reflexivity are native: `Mathlib/LinearAlgebra/Dual/Lemmas.lean:141,145,262`. Transposing the evaluation matrix changes neither determinant nor sign. Thus the two roadmaps own the same comparison by object.

**Repair.** Import `exteriorPower.instProjective`, `exteriorPower.instFinite`, and the finite-projective comparison from EulerSystemsAndKolyvaginSystems §6.1. Keep only the identification of that comparison with Mathlib's `pairingDual` if an adapter is necessary; do not retain the generic retract proof as a second owned theorem. Redirect §§7.4 and 7.6 and the plan, add the earlier supplier contract, and run the gate again. Record the shared carrier's origin in IntegralIwasawaTheory §12.6 without claiming its comparison is separately owned here.

**Repair test.** For P=R² and n=2 both comparisons evaluate to det(I₂)=1 on the dual basis wedge; for P=0,n=0 both are the identity of R; for n above the rank both modules vanish. The native projectivity instance applies even without finite generation.

## R03 (P3) — The new sign control is not a Hochschild cochain

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1067`: “for `f(a,b) = a` on `k[x]`”; plan target 6.1 tests.

**Claim.** This f tests the difference between the correct brace sign and `m{F}−F{m}` in arity two.

**Witness.** Over Z[x], f(1,0)=1. Every bilinear cochain has f(1,0)=0. Consequently Θf and the pinned brace operation on it are undefined.

**Repair.** Replace this control in README and plan with the bilinear cochain f(a,b)=a∂_x b over Z[x]. Its coboundary is δf(a,b,c)=ab∂_x c. The wrong expression is `2a(∂_x b)c−ab∂_x c`.

**Repair test.** At (a,b,c)=(1,x,1), δf=0, the correct bracket −Θδf=0, and the wrong expression is 2. It therefore equals neither sign of Θδf, on an actual cochain.

## R04 (P1) — The arity-zero sign Check contradicts the theorem

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1103`: “`(p,q) = (0,1)` … both sides equal `a ↦ x g(a) − g(a) x`”; plan target 6.2 tests.

**Claim.** The two sides of §6.2's displayed homotopy identity have this value when f=x is a zero-cochain.

**Witness.** In Mat₂(Z), take x=E₁₁, g=id and a=E₁₂. Both sides of the theorem are −E₁₂. The Check prints +E₁₂.

Indeed the left side is g∪x−x∪g, and the right side is δx∘g because x∘g=x∘δg=0. Both are g(a)x−xg(a). The previous review's computed table already had this correct value, although the design did not.

**Repair.** Reverse this Check to g(a)x−xg(a) in README and plan, and include the displayed matrix example. Keep the main theorem's signs unchanged. The repaired sides both evaluate to −E₁₂, so the test also excludes the incorrect convention.

## R05 (P2) — The top-degree formula fails to specify zero variables

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1474`: “For `R = MvPolynomial (Fin m) k` … `⟨g∂₁, ∂₂, …, ∂_m⟩`”; plan target 8.5 permits every natural m.

**Claim.** Multiplying the first derivation by g expresses the top-degree cocycle uniformly for all m.

**Witness.** For m=0,k=Z,g=2 there is no first derivation. Reading the displayed family as empty gives ⟨⟩=1, while g det(empty)=2.

**Repair.** State the formula uniformly as `g · ⟨∂₁,…,∂_m⟩` and the normalised input as `g · (∂₁∧⋯∧∂_m)`, with scalar multiplication outside the empty-capable family. Explain the equivalent first-column formulation only for m≥1. Update target 8.5 and add the zero-variable Check; do not narrow the roadmap to positive m.

**Repair test.** At m=0 the cocycle, its class and the normalised value are all g∈HH⁰(k,k)=k, since det(empty)=0!=1. At m=1 the expression is g∂; at m=2 the stated Jacobian and factorial identities are unchanged.

## R06 (P3) — Correct the dropped-coface and zero-variable comparison controls

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:490`: “drops `δ⁰` would make every `m` a cocycle”; line 1451: “`m = 0`: `ι` is the identity of `k`”. Corresponding plan tests 1.2 and 8.3.

**Claim.** These are discriminating evaluations of the indicated constructions.

**Witness.** Dropping the first coface leaves m↦(a↦−ma), whose kernel is zero by a=1. For m=0 the unnormalised bar has B₁(k)=k, whereas K₁(k)=0.

**Repair.** Say explicitly that dropping the first coface makes the degree-zero cocycles zero, while the correct ones are the centre. In §8.3 say ι₀=id_k and ι_n is the unique map 0→B_n(k) for n>0; it is an augmentation-compatible homotopy equivalence, not the identity complex map. Update both plan tests.

**Repair test.** For A=M=Z the wrong degree-zero kernel is 0 and the correct kernel is Z. For k=Z,m=0 the comparison in degree one is 0→Z and in degree zero is id_Z. Its homology is id_Z in degree zero and 0→0 above.

## R07 (P2) — The matrix trace example needs a nonempty matrix index

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:773`: “`HH₀(Mat_n(k)) ≅ k` through the trace”.

**Claim.** The trace is the stated isomorphism for unrestricted n.

**Witness.** At n=0,k=Z, Mat₀(Z) is the zero ring. Its Hochschild chains and HH₀ vanish, and trace is 0→Z, not an isomorphism.

**Repair.** State this example for n≥1 and add n=0 as its negative control. This qualifies the matrix example only, not the general HH₀ theorem. If a plan test repeats the unrestricted matrix claim, qualify it there too.

**Repair test.** At n=1 the trace is id_k; at n=2 the commutator submodule is the trace-zero matrices and the quotient is k, including characteristic two. At n=0 the source is 0.

## R08 (P3) — Nonzero Checks silently exclude the permitted zero base ring

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:160`: “`E₁₁ − E₂₂ ≠ 0`”; line 684: “`1 ≠ 0`”; lines 735–736: “this extension does not split”; line 1406: “`x ⊗ 1 + 1 ⊗ x ≠ 0`”.

**Claim.** These nonexamples hold under the standing assumption of an arbitrary commutative base ring.

**Witness.** For k=0 every displayed module and algebra is zero: E₁₁−E₂₂=0, 1=0, the identity map is a derivation, and the displayed extension splits uniquely.

**Repair.** Restrict only the nonzero/nonexample Checks to a nonzero k (or choose Z explicitly). Apply the same correction to the unqualified nonzero claims at lines 538, 769, 774, 925–926 and 1523 and their plan counterparts. Keep all construction and theorem statements over arbitrary k. The nearby line 452 already correctly says k nonzero.

**Repair test.** Over Z the matrix differences and monomials in these controls are nonzero, the identity fails D(1)=0, and t² is nonzero in Z[t]/(t³). Over the zero ring retain a separate positive control: every complex and comparison is the unique zero object/map.

## R09 (P3) — Remove residual flatness from classical evaluation and name its inputs

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1310`: “Evaluation: for `R` flat over `k`”; the Needs at line 1308 omits §§6.4(a) and 7.1. Plan target 7.5 has the same restriction.

**Claim.** The two classical evaluation identities are restricted to flat algebras.

**Witness.** Expanding cup evaluation on the antisymmetrised chain gives Σσ sgn(σ)∏j D_j(r_σ(j))=det(D_j(r_i)); alternating the derivations adds n! identical determinants. No tensor exactness enters.

**Repair.** State both evaluations for every commutative k-algebra R, as now done for the classical maps in §6.4, and add §§6.4(a) and 7.1 explicitly to Needs and plan prerequisites. Retain flatness on comparisons with derived chains only.

**Repair test.** For the nonflat algebra R=F₂[x,y] over Z and D₁=∂_x,D₂=∂_y, cup evaluation on ε²(dx∧dy) is 1; determinant-cocycle evaluation is 0=2·1. Thus the unrestricted identities have nontrivial nonflat instances, not just a zero-module boundary case.

## R10 (P3) — Use the required lower-case roadmap title

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1`: “`# Roadmap: Hochschild homology and the Hochschild–Kostant–Rosenberg theorem`”.

**Claim.** The README matches the specified house heading.

**Witness.** The required shape is `# Roadmap: <lower-case title>`; the heading contains capitalized Hochschild and Kostant–Rosenberg.

**Repair.** Lowercase the title text in the README's first heading. This is a presentation-only correction; retain standard capitalization of mathematical names in prose.

## Verified sound

### Coverage, scope and ownership

I read all 37 targets in eight layers, their definitions, APIs, Checks, dependencies and the plan. I read the previous review and repair report first, then recomputed changed passages and checked for the repaired patterns elsewhere. The source sample comprises all 15 named targets; its readable and unreadable parts are itemized below. The report separates a valid theorem from a false Check instead of treating a successful source lookup as proof of every example.

The general-base scope is appropriate: no good-characteristic shortcut, no computational algorithm, and no bypass of the factorial obstruction. The smooth theorem keeps k-projectivity as an explicit sufficient hypothesis, and the polynomial case is independent of the smooth supplier gap. No copied source passage, route-specific restriction of the main scope, or wholesale re-planning was found. Generic overlap must be removed as in R01–R02. All eight layers have Examples and Dependencies sections; the definition blocks have API lists and at least three Checks, subject to the defective controls above. The text uses Unicode mathematics and locators, not LaTeX delimiters or executable procedures. No process dates, job references, machine paths or pull-request numbers were found in the roadmap text. Apart from R10, the requested heading structure is present.

The board package index was read before searching packages. Object searches used the roadmap service over main and the readable open heads, in addition to the pinned libraries. The overlap file reports no conflicting head changing this roadmap, dropped cited id, or id supplied only by an open revision. I checked its two closest roads: #2037 CyclicHomologyLieHomologyAndQuasiFreeAlgebras, scope and §4.1, owns cyclic-category homology, Lie homology and quasi-free algebras; #1493 RefinedTraceMethods owns the derived cyclic/HKR maps imported here. Neither supplies a second generic arbitrary-bimodule complex under this design's proposed interface. R02 records the independently discovered exterior-duality collision with #1272, including its exact file and location.

The new native `TauCeti.hochschildCochainComplex` is not itself a duplicate of the full proposed arbitrary-bimodule complex. `TauCeti/RingTheory/HochschildCohomology/Complex.lean:16` explicitly takes scalar-module-valued cochains with n+1 arguments. Currying gives HHⁿ(A,Hom_k(A,M)), with dual-bimodule actions, rather than HHⁿ(A,M). The bridge is `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary` in `TauCeti/RingTheory/HochschildCohomology/Dual.lean:138`. R01 imports the genuinely matching bimodule primitives without conflating these carriers.

### Dependency check and supplier resolutions

The final gate run on the unchanged candidate produced:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2111 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Not being in the order at design stage is not a defect. The additional earlier supplier recommended in R02 needs the normal post-repair gate run.

Every explicit supplier citation and Needs line was read. Resolutions at main or the supplied head:

| Supplier | Resolved location and contract |
| --- | --- |
| DGAInfinity, main | `TauCetiRoadmap/DGAInfinity/README.md:70`, conventions: Koszul tensor sign and degree −1 suspension; line 93: sign-free suspension square for ordinary multiplication; Layer 0 at 263, Layer 1 at 293, Layer 8 at 520. Positive-arity native operations are imported by the repaired contracts; the remaining arity-zero, multiple-brace and chain interfaces remain section-level contracts. |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649`, §0.K.1, now cites native `TauCeti.koszulComplex`, its tensor comparison and weakly regular exactness. Its generator differential yields d(e₁∧e₂)=t₁e₂−t₂e₁, matching §§8.2–8.3. The preserved section id resolves despite changed line numbers. |
| KTheoryFiniteLocalFields, #1281 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:639`, §4.0, cyclic homology foundations: derived Hochschild chains, HH₀=A/[A,A], smooth homological HKR. It does not identify the integral antisymmetrisation with the unnamed comparison. |
| RefinedTraceMethods, #1493 | `TauCetiRoadmap/RefinedTraceMethods/README.md:84`, §1.1 and its cyclic-bar subtopic give flat classical/derived comparison; §1.9 at 404 gives ε,π,πε=n!, multiplicativity and degree-one isomorphism; §1.10 at 445 gives the nonflat F_p/Z control. Permutation versus inverse permutation gives the same alternating sum. |
| Scope-only boundaries | `TauCetiRoadmap/BanachAlgebras/README.md:1379`, Layer 6, bounded cochains/extensions; `TauCetiRoadmap/NoncommutativeGeometry/README.md:479`, N1, with cyclic/scalar cochains at 582; `TauCetiRoadmap/ZigzagPreprojective/README.md:1047`, Layer 7, specialised bigraded cohomology; LanglandsParameterStacks §1.17 at 525, Hochschild action; DerivedDeRhamCohomology Layer 2 at 3040, de Rham differential, not consumed here. These are exclusions, not hidden upward supplies. |

The named gap `smooth-hkr-antisymmetrisation` occurs in both plan and README, names RefinedTraceMethods §1.9, and specifies every n, every commutative k, smooth commutative A, the map ε_n, and its identification with KTheoryFiniteLocalFields §4.0. It is precise and minimal: πε=n! is insufficient in characteristic p≤n, and an unnamed HH≅Ω isomorphism does not identify ε. This is a declared contract, not an unowned prerequisite or a finding. The verdict is not accepted, so review.json does not attach conditional acceptance.

`roadmaps resolve` found no missing cross-roadmap citation. Its note says it did not check external Lean names; that was not used as evidence that library declarations exist.

### Pinned library evidence

Actual manifest revisions used: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The design's recorded older baseline cannot justify claims of absence. In addition to the declarations in R01–R02, the following native definitions and hypotheses were opened or resolved at these pins:

| File and line | Declaration or native condition checked |
| --- | --- |
| `Mathlib/AlgebraicTopology/DoldKan/HomotopyEquivalence.lean:81` | `homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`, for an abelian category and simplicial object; no ring-flatness assumption. |
| `Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180` | `degeneraciesVanish_iff_QInfty_f_comp`, identifying vanishing on degeneracies with annihilating Q∞. |
| `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64` and `:71` | `pairingDual` and its value det(f_j(v_i)); not a divided antisymmetrisation. |
| `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:29`, `:162`, `:182` | `instFinite`, `instFree`, `bijective_pairingDual`; the last is under finite AND free hypotheses. General projectivity is supplied separately by Tau Ceti, R02. |
| `Mathlib/RingTheory/Smooth/Basic.lean:70`, `:539` | FormallySmooth includes projectivity of Ω and the vanishing cotangent condition; Smooth adds algebra finite presentation, not k-module projectivity. |
| `Mathlib/RingTheory/Smooth/Flat.lean:57` | Smooth.flat is the flatness instance used in §6.4(d). |
| `Mathlib/RingTheory/Kaehler/Basic.lean:251`, `:355` | generation by differentials and `linearMapEquivDerivation`; symmetric commutative coefficients, not arbitrary bimodule derivations. |
| `Mathlib/CategoryTheory/Abelian/Ext.lean:56` | `ChainComplex.linearYonedaObj` is pointwise linear Yoneda applied to the chain complex: precomposition, with no extra sign in §4.3. |
| `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:234` | `extMk_comp_mk₀`, fixing the degree-zero end of the lift/composition comparison. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`, `:128` | `Abelian.Ext` is a small shifted-hom object; its `comp` uses shifted composition. It is not unsigned composition of arbitrary strict lifts. |
| `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105`, `:109` | leftDerived and its resolution comparison; these are the native carriers intended for Tor. |
| `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75`, `:86`, `:166` | Hochschild differential, brace-sub formula and bracket Leibniz law, in the AInfinityAlgebra namespace. |
| `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Complex.lean:49`, `:87`, `:103` | PositiveHochschild cochains, complex, bracket. No arity-zero term in this particular complex. |
| `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Cohomology.lean:80`, `:197` | PositiveHochschild.Cohomology and cohomologyBracket. |
| `TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean:94`, `:160`, `:340`, `:354` | ReducedTensorWords brace, bracket, pre-Lie relation and bracket Leibniz identity. These do not supply the separate multiple brace m{F,G}. |
| `TauCeti/RingTheory/KoszulComplex/Basic.lean:79`, `:137`, `:399`; `Regular.lean:141` | Koszul differential and its product sign, homologyZeroEquivSpan, exactAt_of_isWeaklyRegular. These match the current main supplier §0.K.1. |

The existing balanced-tensor and universal-coefficient contracts were also resolved in the cited pin files. In particular the UCT route needs projective cycles and splitting of their inclusion, not merely a symbolic Hom of homology. §7.2 obtains those conditions by induction from termwise projectivity and projective lower homology. The elementary failure of injectivity without those hypotheses is recorded below.

### Source sample

All nine cited works have manifest entries. AV20, Ginz05, HKR62 and StacksSmooth were read from the supplied legal cached extractions. Loday98, Ger63, Weibel94, CE56 and Mat86 remain settled uncertified; they were not requested again. No new source or manifest edit was necessary. No additional author-flagged unverified locator requiring a fetch was found. A readable alternative is not treated as certification of an unread textbook's exact section number.

| Seeded target | Source text read, locator and result |
| --- | --- |
| 1.2 cosimplicial/cochain | Ginz05 lines 1033–1062, §5.2, printed p.22, gives bar evaluation and the coboundary, including degrees zero and one. The complete cosimplicial packaging/codegeneracies are not established there; these have the direct construction route and native cofaces in R01. Loday98 §1.5, Weibel94 §9.1 and CE56 IX remain uncertified. |
| 1.3 functoriality | Loday98 §1.1 and Weibel94 §9.1 unread. No claim of source-text verification. The explicit chain/cochain maps were checked algebraically, including composition and coefficient restriction, in the table below. |
| 1.5 commutative algebras | Ginz05 lines 2161–2166, §9.2, printed p.45, centre action on coefficients; commutativity makes it an R-action. Symmetry is unnecessary for this action, but is required later for duality. |
| 2.1 normalised chains | Ginz05 lines 894–932, §4.5 and Corollary 4.5.2, printed p.19, reduced bar over a field. The roadmap's arbitrary-base extension uses the named Dold–Kan theorem and right exactness, not an assertion that the source already has that generality. |
| 3.1 degree-zero homology | Ginz05 lines 941–953, §5.1, printed p.20, commutator quotient; lines 1001–1030, printed p.21, trace and matrix commutators. R07 supplies the necessary nonempty-index qualification. |
| 3.5 twisted square-zero extensions | Ginz05 lines 1088–1111, §5.5 and Remark 5.5.1, printed p.23: cocycle-controlled multiplication and unital reduced version. Its field setting makes module splitting automatic; this design explicitly requires k-splitting in the general-base classification. |
| 4.3 cochains as Hom from bar | Ginz05 lines 1033–1062, printed p.22; HKR62 lines 284–298, printed pp.389–390, commutative balancing/evaluation. The native Yoneda functor confirms the claimed absence of a differential sign. |
| 4.5 Tor comparison | Ginz05 lines 944–976, printed p.20, gives the right enveloping action and balanced tensor formula. The roadmap's k-projectivity supplies projectivity of bar terms over Aᵉ; no flat-only projective-resolution claim is made. |
| 5.4 cup versus Yoneda | Ginz05 lines 1348–1350, printed p.29, states the comparison; HKR62 lines 479–495, printed p.394, gives the value product and class formula. Neither determines Mathlib's unresolved universal shifted-composition sign; see limitations. The strict lift factor (−1)^(pi) was recomputed. |
| 6.4 antisymmetrisation/projection | Ginz05 lines 2142–2156, printed p.45; AV20 lines 237–243, printed p.6. Both support the factorial composite. The commutative calculation survives the Ginzburg prose errors recorded below. Smooth integral bijectivity remains the declared named-map gap. |
| 7.1 chain/cochain duality | HKR62 lines 284–298, printed pp.389–390, and lines 352–364, printed p.391, evaluate h₁(D)(r₀dr₁)=r₀D(r₁). Symmetric coefficients are present in the design. |
| 7.3 finite-projective exterior powers | HKR62 lines 531–535, printed p.395, gives the finite-projective retract/duality step. That step is general algebra even though the surrounding final theorem is a perfect-field theorem. Ownership is R02. |
| 7.4 polyvectors | Ginz05 lines 1130–1140, printed p.24, exterior tangent objects; HKR62 Theorem 5.2, line 548, printed p.395, regular affine perfect-field theorem. The definition over arbitrary k is meaningful; its general smooth comparison has a separate route. |
| 7.6 cohomological HKR | HKR62 Lemma 4.1, lines 301–330, printed pp.389–390, projective-homology duality; Theorem 5.1, lines 522–526, printed p.395, k-projective algebra; Theorem 5.2, line 548, perfect-field case. AV20 Proposition 1.2, lines 70–74, printed p.2, smooth affine formality; Ginz05 Theorem 9.1.3, lines 2086–2090, printed p.44, smooth affine variety. None is mislabelled as the full general-base cohomological theorem: the design assembles that from its named inputs and gap. |
| 8.2 Koszul bimodule resolution | HKR62 lines 268–279, printed p.389, regular-sequence resolution and vanishing differential after tensor; Ginz05 Lemma 9.3.1, lines 2187–2197, printed p.46. The arbitrary-base polynomial differences supply the weakly regular sequence for the native Koszul theorem. |

Also checked StacksSmooth Definition 137.1, Tag 00T2, lines 16920–16923, and Proposition 138.13, Tag 00TN, lines 17399–17404: smooth means finite presentation with the stated cotangent/formal-smoothness conditions. It does not mean projective as a module over the base. Repaired §§8.4–8.5 use HKR62's construction, not the Noetherian regularity hypotheses of its Theorem 3.1.

### Computed adversarial table

The values below use the unnormalised complexes in the design unless explicitly marked derived. Z means the integers; E_ij are matrix units. A zero module gives zero operations and zero homology throughout. No test below treats the zero-ring failures as a reason to narrow the theorems.

| Statement | Instances and values computed on the two sides | Result; change |
| --- | --- | --- |
| Conventions and 1.1 chains | A=M=k: b_n is 1 for even n≥2 and 0 for odd n, so HH₀=k and higher HH=0. Mat₂(Z): b(E₁₂⊗E₂₁)=E₁₁−E₂₂; reversing the wrap action gives 0. | Main convention holds; R08 qualifies nonzero witnesses. |
| 1.2 cochains | A=M=k: δ^n=0 for even n, 1 for odd n; HH⁰=k, higher HH=0. δ²E₁₁(E₁₂,E₂₂)=0; wrong last sign gives 2E₁₂. Dropping the first coface gives δ_wrong m(1)=−m, not 0. | Native formulas match; R01 and R06. |
| 1.3 functoriality | Z[x]→Z[y]→Z[z], x↦y²,y↦z+1: both composed chain maps send 1⊗x to 1⊗(z+1)²; all b₁ values are 0. Pulling back ∂_y sends x to 2y in the restricted coefficient bimodule. Pulling back id_A gives the same cochain, not a reversed chain map. | Holds, including variance. |
| 1.4 exact sequences | A=k and 0→k→k²→k→0: HH₀ maps are u↦(u,0) and (u,v)↦v; all higher terms and connecting maps are 0. Without flatness/projectivity, take A=Z⊕F₂ square-zero: multiplication by 2 on A⊗Z kills its F₂ summand; Hom_Z(A,Z)→Hom_Z(A,F₂) misses the F₂-coordinate functional (image dimension 1 versus 2). | The stated split/flat/projective hypotheses prevent these failures. |
| 1.5 R-linearity | R=k[x]: b(1⊗x⊗1)=x⊗1. Correct coefficient action on b(1⊗1⊗1) gives x⊗1; action on the algebra factor gives 1⊗x. For nonsymmetric coefficients, b(rm⊗a)=r(ma−am) follows from commuting actions and commutativity of R. | Holds; R08 for nonzero controls. |
| 2.1 normalisation of chains | b(m⊗1⊗1)=m⊗1−m⊗1+m⊗1=m⊗1. For A=k, reduced positive terms vanish and HH_n=0 for n>0. For k[x], b(1⊗x⊗x)=2x⊗x−1⊗x², so quotienting arbitrary tensors would erase a genuine relation. | Degenerate quotient and Moore summand agree without flatness. |
| 2.2 normalisation of cochains | D(1)=2D(1) gives D(1)=0; δm(1)=0. The nonnormalised g with g(1)=1 has δg(1,1)=1−1+1=1. For A=k only degree zero remains in the reduced complex. | Holds. |
| 3.1 HH₀ | In Mat₂(k), off-diagonal E_ij=[E_ij,E_jj], and E₁₁−E₂₂=[E₁₂,E₂₁]. The quotient of four coordinates by these three directions is k via trace; in F₂ the diagonal relation is (1,1), still the trace kernel. At matrix size 0, source=0,target=Z. | Main quotient holds; R07. |
| 3.2 HH⁰ | δm=0 iff am=ma; in Mat₂(Z), δE₁₁(E₁₂)=−E₁₂ while δ(cI)=0. For a commutative algebra every m is central. | Native cocycle theorem supplies this part, R01. |
| 3.3 derivations and HH¹ | Z[x]: Der=Z[x]∂ and Inn=0. Mat₂(Q): Der=Inn has dimension 3, HH¹=0; Lie inner ad(E₁₁)(E₁₂)=+E₁₂ versus δE₁₁(E₁₂)=−E₁₂. Over k=0, id=0 is a derivation. | Quotient/sign correct; R01, R08. |
| 3.4 HH₁=Ω¹ | b(1⊗a⊗c)=a⊗c−1⊗ac+c⊗a gives the Leibniz relation. db→[1⊗b]→db and [a⊗b]→a db→[a⊗b]. For dual numbers Ω=R dx/(2x dx), dimension 2 over F₂ and 1 over Q. F_p/Z gives both HH₁=0 and Ω=0. | Holds without flatness. |
| 3.5 twisted extension | For dual numbers and f(x,x)=1, t²=(0,1), t³=0. For the bilinear cochain supported at (x,x²) over k[x], δf(x,x,x)=1 and the two triple products are (x³,0) and (x³,1). The gauge (a,m)↦(a,m+g(a)) into the f−δg extension has second component f(a,b)+g(ab) on both sides. | Cocycle and gauge signs hold; R08 on nonzero k. |
| 3.6 HH² classification | A=F₂ over Z: C^n=F₂ and δ alternates 0/1, so HH²=0. The extension Z/4→F₂ is not Z-split. For A=k, HH²=0 and every k-split extension is trivial as the classification predicts. | k-split condition essential. |
| 4.1 enveloping actions | (E₁₂⊗op E₂₁)E₂₂=E₁₁; reversing factors gives 0. The right action for tensoring sends m·(a⊗op b) to bma. For m=1,a=E₁₂,b=E₂₁ this is E₂₂, versus E₁₁ for the incorrect order. | Both action directions pinned. |
| 4.2 bar | On a₀⊗a₁, b′(1⊗a₀⊗a₁)+hμ=a₀⊗a₁. For k[x], h(x·(1⊗1))=1⊗x⊗1 differs from x·h(1⊗1)=x⊗1⊗1: contraction is k-linear, not falsely Aᵉ-linear. | Augmented contraction and projective-term route hold. |
| 4.3 Hom(bar,M) | Evaluate φb′ at 1⊗a⊗b⊗1: a f(b)−f(ab)+f(a)b=δf(a,b). In degree zero the result is am−ma. Native linearYonedaObj precomposition adds no sign. | Holds. |
| 4.4 Ext comparison | A=k: bar Hom has alternating 0/id, so both HH⁰ and Ext⁰ are M and both positive groups vanish. For projective k[x], derivation ∂ is represented by a₀⊗a₁⊗a₂↦a₀∂(a₁)a₂; evaluating at 1⊗x⊗1 gives 1 on both presentations. | Consistent with projective resolution. |
| 4.5 Tor comparison | m⊗(a₀,…,a_{n+1}) maps to a_{n+1}ma₀⊗(a₁,…,a_n). End faces become m′a₁ and (−1)^n a_n m′. A=k gives Tor₀=M, Tor_n=0 above; matrix right/left reversal gives E₂₂ versus E₁₁ as above. | Holds. |
| 5.1 cup | (∂_x∪∂_y)(x,y)=1, reversed product=0; (∂_x∪∂_x)(x,x)=1 although its class is 0. Multiplying 0-cochains x,y gives xy, not yx for noncommuting matrices. | Correct multiplication order. |
| 5.2 cup Leibniz | p=q=1: δ(f∪g)=af(b)g(c)−f(ab)g(c)+f(a)g(bc)−f(a)g(b)c, equal to (δf∪g−f∪δg)(a,b,c). With f=g=∂ both are 0. | Holds. |
| 5.3–5.4 lifts/Yoneda | q=0: pinned extMk_comp_mk₀ gives sign 1. For p=1 the unsigned lift satisfies F₀b′=−b′F₁; strict lift uses (−1)^i. With f=∂_x,g=∂_y at (1,x,y,1), lifted composition is −1 versus cup value 1, giving the advertised (−1)^(pq) lift factor. | Strict-lift calculation holds; full shifted-composition s(p,q) not certified. |
| 6.1 suspension dictionary | At n=0, [m,Θx](sa)=s(xa−ax)=−Θδx; at n=1 it is s(f(a)b+af(b)−f(ab))=Θδf; at n=2 it is s(f(a,b)c−af(b,c)+f(ab,c)−f(a,bc))=−Θδf. Positive degree 0 has Der of dimension 3 for Mat₂(Q), versus HH¹=0. The repaired test of R03 gives correct 0 versus wrong 2. | Dictionary and positive truncation repaired correctly; R03. |
| 6.2 homotopy/bracket | p=q=1,f=g=∂ at (x,x): cup sum=2 and −δ(∂²)=2; Ginzburg's printed alternative gives −2. At p=0,q=1,x=E₁₁,g=id,a=E₁₂ both theorem sides are −E₁₂, while its Check says +E₁₂. The exponent identity (p−1)(q−1)=pq−p−q+1 gives the repaired bracket Leibniz signs. | Main identity holds; R04 repairs contradiction. |
| 6.3 classical/derived | A=k: both have HH₀=k, higher HH=0. F_p/Z: ordinary chains have b₂=1,b₃=0 and HH₂=0; supplied derived HH₂=F_p. | Flat comparison correctly supplied by RefinedTraceMethods §1.1. |
| 6.4 ε and π | In k[x,y], ε₂(dx∧dy)=[1⊗x⊗y−1⊗y⊗x], πε=2dx∧dy. Over F₂ the composite is 0 but cup pairing is 1−0=1, so ε is not zero. For F_p/Z both positive classical groups/forms vanish. | General classical clauses sound; smooth isomorphism conditional on declared gap. |
| 7.1 duality | For symmetric M, the wrap terms r₀f(…)r_n and r_n r₀f(…) agree. For k[x] acting on k with x left=1,right=0, δm(x)=m, whereas transpose of b₁=0 is 0. h₁(∂)([1⊗x])=1. | Symmetry is necessary and stated. |
| 7.2 Kronecker | Z --2--> Z in degrees 1,0: H¹(Hom)=Z/2 and Hom(H₁,Z)=0, so injectivity fails when H₀ is not projective. For R --id--> R both sides vanish. In degree zero both sides are Hom(X₀/B₀,M). | Projectivity hypotheses used, not vacuous. |
| 7.3 exterior duality | R²,n=2: both pairings give det(I)=1; P=0,n=0 gives id_R; P=0,n>0 gives 0. On a countably free vector space the block symplectic form has infinite rank, while a sum of s decomposable 2-forms has rank ≤2s. | Finiteness matters; import existing owners, R02. |
| 7.4 polyvectors | τ₂(∂_x∧∂_y)(dx∧dy)=1. In F₂[x], ∂∧∂=0, whereas signed coinvariants would retain its tensor square. For K=F₂(u),R=K[a]/(a²−u), D(a) is arbitrary and T²=0. | Exterior, not skew coinvariant, convention correct. |
| 7.5 determinant | On (x,y) determinant=1 and on (y,x)=−1; cup values are 1 and 0. In F₂[x,y], determinant=δ(∂_x∂_y), so its class is 0 while cup pairing on ε is 1. Over the nonflat base Z→F₂[x,y], the same evaluations are 0=2·1 and 1=det(I). | Factorial correct; R09 removes residual restriction. |
| 7.6 cohomological HKR | F₂[x,y]: Ψ₂(∂_x∧∂_y) pairs to 1; determinant class is 0. Z[1/2]/Z is smooth but not module-projective; its classical cochains alternate 0/id and positive HH=0=Der, illustrating a sufficient hypothesis, not a false converse. In the inseparable quadratic example, the t-periodic bimodule resolution gives HH²=R while T²=0. | Smoothness essential; projectivity explicitly sufficient; named-map gap remains. |
| 8.1 diagonal sequence | m=0: kernel 0. m=1: X−Y is monic and multiplication is injective even over rings with zero divisors. Dual numbers: (x⊗1−1⊗x)(x⊗1+1⊗x)=0; second factor nonzero for nonzero k. | General polynomial sequence works; R08 fixes nonexample scope. |
| 8.2 Koszul | d(e₁∧e₂)=t₁e₂−t₂e₁, then d²=t₁t₂−t₂t₁=0. Tensor with R or Hom into R sends every t_i to 0, so both differentials are zero. At m=0 K₀=k and K_n=0 above. | Native generic construction applies; signs agree with supplier. |
| 8.3 Koszul/bar comparison | b′ι(e_i)=X_i⊗1−1⊗X_i=t_i. In degree two both sides are X₁⊗X₂⊗1+1⊗X₁⊗X₂−X₂⊗X₁⊗1−1⊗X₂⊗X₁. At m=0, ι₁ is 0→k, not id_k. | Chain-map formula sound; R06 fixes boundary Check. |
| 8.4 polynomial HKR bases | Evaluation of cup basis I on ε(dX_J) is det(δ_{i_l,j_r})=δ_IJ. For one variable, HH₀=HH₁=R and HH⁰=HH¹=R, all degrees ≥2 zero. For no variables only degree zero is k. | Valid over every commutative base, independently of smooth gap. |
| 8.5 top/Jacobian | m=2,(r₁,r₂)=(X₁²,X₂): determinant=2X₁; normalised value=gX₁ if 2 is a unit. m=1 gives g∂. m=0,g=2 gives printed empty determinant cocycle 1 versus required 2; repaired scalar multiple gives 2 on both sides. | R05 supplies uniform empty case. |

### Headline inventory and Lean-stage limits

There is no `Suggested.lean` in this design. No Lean file was modified or generated, no sorried theorem or data declaration was introduced, and no `set_option` or forbidden import is involved. Elaboration: **not available (this lane does not elaborate; say so in the report)**. In particular there was no passing build, no mechanical `#check @name` binder audit, and no executed one-tactic probe. These package-stage checks are not falsely reported as passed.

The README's headlines are normalisation (§§2.1–2.2); HH₁=Ω¹ and HH¹=Der/Inn (§§3.3–3.4); the k-split extension classification (§3.6); Ext/Tor comparisons (§§4.4–4.5); cup/Yoneda comparison (§5.4); the suspension dictionary and Gerstenhaber homotopy theorem (§§6.1–6.2); classical antisymmetrisation and its smooth isomorphism (§6.4); cohomological HKR, its factorial comparison and duality (§§7.5–7.6); and polynomial HKR/top-degree Jacobian (§§8.4–8.5).

For package preparation the native multilinear maps, new bimodule differential, categorical complexes/homology, exterior powers, derivations, Ext and left-derived functors are actual carriers. They permit a short real-bodied classical cochain complex and headline statements such as cohomological and polynomial HKR; the old absence claims cannot justify omitting those signatures. Positive-arity parts of the suspension comparison can use the named AInfinity pin directly. Full arity-zero/multiple-brace and derived chain comparisons still require their unimplemented supplier carriers and must be named explicitly if not statable. The chain-side and square-zero-extension signatures require an actual construction, not a free proposition or sorry'd data. This is a statability assessment by reading, not a claim that all these signatures have been elaborated.

There are zero sorried declarations to probe in this design and zero package padding findings. No README identifier is asserted here to have a nonexistent own Lean declaration: the plan's `HochschildHKR.*` names are prospective API labels. At package stage every attributed backticked own name must match its actual declaration and namespace; API/Check-only declarations must stay out of Suggested.lean.

## Not verifiable

- Loday98, Ger63, Weibel94, CE56 and Mat86 are settled uncertified. Their exact section/theorem locators were not certified from text. In particular the only printed-source citations of §1.3 remain unread. The algebraic maps were checked directly, but that does not certify a book locator. No repeat request was made.
- The full value of s(p,q) for Mathlib's shifted Ext composition in §§5.3–5.4 has not been derived here. The strict-lift factor and q=0 case are computed above; they do not certify a closed formula for s. The design states a universal sign rather than its closed value, as in the previous review.
- DGAInfinity's remaining general multiple-brace and chain-differential conventions are section-level contracts. The small-degree cochain signs were recomputed; a general formula for the chain rescalings ν_n was not independently extracted from a pinned implementation.
- No Lean elaboration or executable one-tactic/binder test is available in this lane, and the design has no Suggested.lean. No package acceptance is implied.
- Ownership against open pull requests without readable files supplied by this job was not checked. The supplied head service, board index, overlap leads and named readable neighboring roadmaps were searched; this is not a claim about inaccessible work.
- The sign omission in Ginz05 §5.2 is visible in the cached extraction. The underlying typeset display was not independently inspected, so an extraction defect cannot be excluded.

## Source issues

- **Error** in Ginz05 at identity (6.6.3), printed p.29, line 1368: the source says the cup commutator equals a homotopy expression giving −2∂a∂b for two derivations; it should be the sign-corrected expression in §6.2, giving +2∂a∂b; affects a stated result.
- **Misprint** in Ginz05 at identity (6.6.2), printed p.29, line 1363: the source says a q-ary insertion receives arguments indexed from i through i+q; it should be indexed from i through i+q−1; affects nothing.
- **Misprint** in Ginz05 at the §5.2 boundary display, printed p.22, lines 1049–1053, as extracted: the source says the middle boundary terms have no alternating signs; it should be the signed middle sum used in its earlier boundary formula; affects nothing.
- **Misprint** in Ginz05 at §9.2, printed p.45, lines 2147–2148: the source says the alternating map has zero image for commutative algebras with symmetric coefficients; it should be the Lie differential that vanishes; affects the proof.
- **Error** in Ginz05 at §9.2, printed p.45, lines 2148–2150: the source says every alternating chain is a Hochschild cycle without qualification; it should be restricted to the commutative symmetric-coefficient setting, or to Lie cycles; affects a stated result.

For the last two items, degree one supplies a quick check: alt(1⊗x)=1⊗x is nonzero for Z[x], while for Mat₂(Z), b(alt(E₁₂⊗E₂₁))=E₁₁−E₂₂ is nonzero. The design correctly uses the commutative setting and does not inherit these errors.
