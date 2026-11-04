<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6434850644 -->
Red team round 1 pass a (codex) of 02f336a

Verdict: needs_changes

1. **F01** (P1) The parabolic action does not preserve the simple cycle

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1318–1320, “Every component Z_v with a_(w,v)>0 is individually P_w-stable for this ambient action.” Also the headline at README:3 and Suggested.lean:23.

   **Claim:** A fixed P_w acts on the first flag alone and preserves ℒ_w globally in F×F×g.

   **Witness:** SL₂, w=e: P_e=B, ℒ_e=[Z_e]. Put L=ke₂ and p=((1,1),(0,1))∈B. Then (L,L,0)∈Z_e but (pL,L,0)∉Z_e, since pL=k(e₁+e₂)≠L. BHS19 lines 1025–1056 repeat the false assertion.

   **Exact repair text:** “Let f:F×F→(G/P_w)×F forget the refinement of the first flag. The induced simple D-module is the smooth abelian pullback f*E_w of a strongly G-equivariant regular holonomic D-module E_w. Its characteristic cycle is the smooth cotangent pullback of CC(E_w). Consequently each Z_v with a_(w,v)>0 is saturated under refinement of that partial flag: if (g₁B,g₂B,ψ)∈Z_v and p∈P_w, then (g₁pB,g₂B,ψ)∈Z_v. This is a relative refinement statement, not invariance under a fixed P_w acting by left translation on the first flag everywhere.” Prove the descent through G×ᴾʷF≅(G/P_w)×F using §9.9 and add the smooth characteristic-cycle pullback comparison with its multiplicities. Replace the false global-action headline and its proof, and add the displayed counterexample as a negative Check. For w=e, P_w=B and g₁pB=g₁B, so the repaired assertion fixes both flags in the refuting instance. For w=w₀, P_w=G and ψ=0 on Z_w₀, giving the expected arbitrary refinement.

2. **F02** (P1) The graded-module/sheaf comparison cites the wrong supplier

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:833, “Relative Spec and the graded coherent-sheaf comparison are AlgebraicVectorBundles L1A–L2B inputs.”

   **Claim:** Those sections supply the module comparison needed to turn gr M into a coherent sheaf on T*Y.

   **Witness:** TauCetiRoadmap/AlgebraicVectorBundles/README.md:269–327 constructs algebras, affine schemes and graded algebra charts. The required module equivalence is instead `relativeSpec_modulesEquiv`, TauCetiRoadmap/SchemeAndStackFoundations/README.md:539–542 (§0.2).

   **Exact repair text:** “AlgebraicVectorBundles L1A–L2B supplies relative Spec, its graded algebra charts and T*Y. SchemeAndStackFoundations §0.2 supplies relativeSpec_modulesEquiv for modules over the resulting quasi-coherent algebra. Apply it to gr M after forgetting its grading, retaining the grading as the cotangent scaling structure; finite presentation is checked on affine charts.” Add §0.2 to the supplier contract and §8.2 Needs. On Y=A¹ the module k[x,ξ]/(ξ) becomes the structure sheaf of the zero section under this equivalence; it is not an algebra/affine-scheme anti-equivalence applied to an arbitrary module.

3. **F03** (P1) The Verma-cycle route has no supplier for Borel–Moore homology

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1220–1229, “Construct the comparison from the finite free component group to rational top Borel–Moore homology over C”.

   **Claim:** The listed inputs support the homology group, fundamental classes and convolution used to prove the Verma-cycle equality.

   **Witness:** The Needs list contains only §§10.4, 7.3–7.4, 8.6 and 4.2, all algebraic. TauCetiRoadmap/AffineMorseLefschetz/README.md:210–278, A4.0, already owns locally finite Borel–Moore chains, open restriction and fundamental classes. BR12 lines 1703–1727 assumes these operations.

   **Exact repair text:** “Consume AffineMorseLefschetz A4.0's rational Borel–Moore homology and proper/open functoriality. Use AffineMorseLefschetz A4.1 for a finite triangulation of a compact semialgebraic compactification compatible with its boundary and component closures, then A4.0 for the open-complement triangulation. Use ComplexComparisonPartII C−1.1 for scheme analytification and its complex-point, product and proper-map comparisons. Construct the component fundamental-class map using this carrier; prove H_(4N)^BM(Z(C),Q)=⊕_w Q[Z_w] and compatibility with the convolution correspondence. The cycle and Weyl-action comparisons remain targets of §11.1.” Name these inputs in Exact supplier contracts and §11.1 Needs, with a locator for the geometric triangulation/comparison target. For SL₂ the required top group has degree 4 and rank 2; ordinary H₄(T*P¹,Q)=0, whereas its Borel–Moore top class is Q, so an ordinary-homology substitute cannot discharge this input.

4. **F04** (P3) The independent KL multiplicity target lacks a proof locator

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1248–1265, “Use the composition-multiplicity theorem established here”.

   **Claim:** §11.3 owns the independent principal-block KL multiplicity theorem, but its locator and proof route explain only how to use that theorem for cycles.

   **Witness:** BHS19 lines 882–884 refers the multiplicity theorem to Humphreys §8.4. The package's only proof route starts after that theorem and applies cycle additivity; no primary proof locator is given for the independent multiplicity target.

   **Exact repair text:** “Split §11.3 into (a) normalized Hecke/KL theory, (b) the principal-block composition-multiplicity theorem, and (c) its cycle consequence. For (b), construct the regular-holonomic/perverse comparison on the flag stratification, the intersection-complex character map, and its identification with the normalized KL basis; prove the standard/simple change-of-basis formula and transport it through §10.4, with the indices w₀w,w₀v. Assign each prerequisite to a named earlier supplier section, a precise declared gap, or an explicit preceding target here. Only (c) uses §11.1 and cycle additivity.” Add primary locators for the comparison and multiplicity proof. This preserves the A₁ matrix ((1,0),(1,1)); the A₃ polynomial 1+q must be obtained from the comparison, giving multiplicity 2 at q=1, rather than being an assumed input in the proof of the same theorem. The target is explicitly owned here; the defect is its missing primary proof locator and independent route, not a false formula or a circular cycle argument. Ownership constraint on this repair: packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:70–197 already assigns the Betti heart and regular Riemann–Hilbert comparison to B/middle-perverse and B/regular-riemann-hilbert. That roadmap is later in the merge order (178 versus 70). For the proposed geometric route, move the required early comparison targets down to this roadmap and record the ownership transfer; do not add an upward supplier edge or independently duplicate them. An independent algebraic proof route would instead need its own explicit preceding targets.

5. **F05** (P2) The Hecke construction omits its existing type-A owner

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1248, “Construct the equal-parameter Hecke algebra of the finite Weyl Coxeter system”.

   **Claim:** This is a new independent Hecke construction, with no supplier or comparison to the existing type-A construction.

   **Witness:** TauCetiRoadmap/TypeAHeckeAlgebras/README.md:9–24, 33–35 and 40–50 already owns the universal type-A algebra, its quotient carrier, generator relation and basis. For W=S₃, the proposed finite-Weyl algebra repeats that object.

   **Exact repair text:** “Use TypeAHeckeAlgebras H1 for type A. The finite-Weyl extension uses the same normalized quadratic relation (T_s−v)(T_s+v⁻¹)=0 over Z[v,v⁻¹], q=v², and constructs the generator-preserving comparison with H1 on every type-A factor. Its general Coxeter construction and KL basis extend that existing library; no second type-A carrier is introduced.” Name H1 in the ownership and Needs sections; if ownership is transferred to that supplier, declare the precise finite-Weyl/KL extension as a supplier gap. For S₃ both algebras then have the same two generators, braid relation, quadratic relations and rank 6; at v=1 both specialize to Z[S₃].

6. **F06** (P2) The BR dual-kernel twists retain the opposite Borel's signs

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:472, “define K_w^∨=O_(X_sₘ)(−ρ,ρ−αₘ)⋆⋯⋆O_(X_s₁)(−ρ,ρ−α₁)”; compare the positive-root convention at README:22.

   **Claim:** These are the dual kernels used in the CM argument after transporting BR's conventions.

   **Witness:** For upper-triangular B in SL₂, the associated weight-ρ line is O(−1). Here X_s=Tot O(−1,−1), so ω_(X_s)=O(−1,−1), but the displayed twist is O(1,1). BR12 line 164 uses the opposite positive roots.

   **Exact repair text:** “Write L_B(λ)=G×ᴮk_λ, with fibre character λ and the inverse-action associated-bundle convention. For our positive Borel, transport BR's simple dual kernel to O_(X_s)(ρ,α−ρ); reverse the order of these corrected simple kernels for the dual convolution. Record the opposition map on flags, simple roots, weights and convolution indices before using BR's formulas.” Cite BR12 Theorem 2.2.1, lines 974–983, together with its root convention, lines 160–165. Add the SL₂ Check: L_B(ρ)=O(−1), X_s=Tot O(−1,−1), and the corrected dual twist restricts to degree −1 on each ruling, agreeing with the canonical bundle. If retaining BR's auxiliary negative-Borel notation instead, define it separately and give that same explicit transport; the current unqualified weights do not do so.

7. **F07** (P3) The simple-cycle theorem refers to an undefined section

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1233, “regular strong-equivariant simple modules are identified as in L”.

   **Claim:** “L” supplies the identification and labels used by the triangularity theorem.

   **Witness:** No section or construction L exists. The identification is stated in README:1183–1194, §10.4; §10.3 supplies double-flag induction. For SL₂ these give L_e on the diagonal and L_s on the full flag-pair support.

   **Exact repair text:** “The regular strongly equivariant simple modules and their Weyl labels are those of §10.4, transported by the induction equivalence of §10.3.” This selects the two SL₂ supports used in the triangularity Check and removes the unresolved locator.

8. **F08** (P3) The filtration Check has no specified epsilon-extension module

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:875, “induced ε extension”.

   **Claim:** This is a computed D-module example of exact induced good filtrations and generic lengths 1+1=2.

   **Witness:** No epsilon-extension D-module is defined. The ordinary k[ε]/ε² module cannot be a finite-dimensional A¹ Weyl module in characteristic zero: taking traces in [∂,x]=1 gives 0=2.

   **Exact repair text:** “On A¹ let D be the Weyl algebra. Use 0→D/Dx→D/Dx²→D/Dx→0, with first map [P]↦[Px] and second the quotient. Take the order filtration on the middle module and its induced submodule and quotient filtrations. The associated graded sequence has factors k[x,ξ]/(x), middle k[x,ξ]/(x²), and generic lengths 1,2,1 at (x), so 2=1+1.” The module has infinite k-dimension; the coefficients are finite lengths at the characteristic generic point, avoiding the impossible finite-dimensional interpretation.

## Verified sound

Read all 1,535 README lines and all 38 Suggested.lean lines. The audit covers 69 numbered target groups, 71 Checks blocks and their 224 bullet entries, including repeated recap bullets. The computed table below gives the actual values; repeated bullets do not increase the number of independent tests. Read 0 Lean declarations: the file contains no definitions, instances, opaque constants, theorems, examples, section variables or universe declarations. There are 15 unavailable-headline groups in its module docstring. Resolved 72 source-locator entries across all six manifest works, as enumerated below; locating a statement does not certify it, and the erroneous statements are listed under Source issues. Checked the nine cross-roadmap supplier-contract groups and their named section locations, with the claim-level exceptions R02–R05. Searched all 55 supplied sibling folders (110 README/Lean files), main/Completed and board packages by object, and used the roadmap grep/show tools for ownership and current-head resolution.

The current main copy was 737e482; the pinned Mathlib was 6b7abb3c7686292736be2955bd3eb9ebf63b456a and pinned Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The inspected package head was 02f336a. The earlier repair's F03 was explicitly settled as requiring an external ownership transfer. Its reason is consistent with the supply order, so it is not re-raised here.

### Lean declaration and headline inventory

| Suggested.lean declaration | Section variables / instances / universes | Typed-side test | Outcome |
| --- | --- | --- | --- |
| None | None; only `import Mathlib`, module docstring and namespace | Declaration count=0; sorry'd data=0; padding theorems=0; own fully qualified name collisions=0 | No elaborated-signature file or Lean execution is necessary. There is no declaration to lose a binder. |

| README headline | Suggested.lean docstring | Pin boundary checked |
| --- | --- | --- |
| Proper resolution and regular Weyl covering, §2.3 | line 12 | Native schemes exist, but not the flag quotient/Borel Lie bundle and operator map. |
| Reduced LCI double incidence, §§3.7–3.8 | line 13 | No native Weyl-labelled incidence components and their scheme equations. |
| Birational component projections, §3.9 | line 14 | Missing the actual component morphisms and regular Lie open. |
| CM components and flat Cartan maps, §§4.2–4.4 | line 15 | Missing graph kernels, integral closures and Cartan maps. |
| Geometric normality, §5.4 | line 16 | Missing the component schemes. |
| Springer field/centre comparison and Steinberg conormals, §§6.1–6.6 | line 17 | NilpotentOrbits plans the complex construction; it is not a pinned carrier. |
| Filtration-independent coherent characteristic cycles, §§8.2–8.6 | line 18 | Native sheaf modules and cycles do not supply D_Y, good filtrations or gr M on T*Y. |
| Kashiwara and Bernstein, §§9.2–9.3 | line 19 | Missing D-module categories, transfer functors and characteristic support. |
| Holonomic length and intermediate extension, §§9.5–9.6 | line 20 | Missing the holonomic heart and its extension operations. |
| BB and equivariant localisation, §§10.1–10.4 | line 21 | Native semisimple Verma modules do not provide the flag D-sheaf or strict reductive category O. |
| Verma/simple cycle formulas and three bases, §§11.1–11.4 | line 22 | Missing cycles of these actual modules and Steinberg components; a free matrix would be a stand-in. |
| Parabolic invariance, §12.2 | line 23 | Missing geometric action/cycle carriers; the mathematical headline itself requires R01. |
| Formal graph detection, §13.3 | line 24 | Native adic completion does not provide the actual completed Cartan morphism. |
| Tangent bound and smoothness, §§13.4–13.5 | line 25 | Native finrank/ker do not name the component tangent spaces and their maps. |
| Completed cycle and KL identities, §§14.2–14.4 | line 26 | Missing zero-fibre sheaves, component coefficients and completed local schemes. |

No statable headline was found omitted. Encoding a general proper morphism, a bare matrix, arbitrary functions or a cycle equality as hypotheses would not state any of these headlines on the roadmap's objects.

### Pinned carriers and supplier checks

| Input | Evidence and retained scope |
| --- | --- |
| Scheme and pullback | Mathlib/AlgebraicGeometry/Scheme.lean:40; Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean; Mathlib/AlgebraicGeometry/Pullbacks.lean. Scheme carries locally ringed-space data; no separatedness, finite type, smoothness or reducedness is built into an arbitrary Scheme. |
| Proper plus quasi-finite | Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372, `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, requires precisely the two named morphism properties. |
| Native cycles | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44, `AlgebraicGeometry.AlgebraicCycle`, is locally finitely supported coefficients on points; it has no dimension grading or rational equivalence in that definition. |
| Native lengths | Mathlib/RingTheory/Length.lean:30,168; `Module.length` is extended-natural-valued and `Module.length_eq_add_of_exact` includes injectivity, surjectivity and exactness. The dual-number calculation is 2=1+1, not an unchecked conversion of infinity. |
| Completion | Mathlib/RingTheory/AdicCompletion/Basic.lean:171, `AdicCompletion`, is a compatible family of quotient classes. Its definition alone gives neither sheaf completion nor a geometric cycle comparison. |
| Linear/categorical substrate | The pinned `Finsupp.linearCombination`, `LinearMap.ker`, `Module.finrank`, `SymmetricAlgebra`, `SheafOfModules` and `DerivedCategory` were located and their carrier roles checked. None defines a scheme cotangent bundle or a holonomic category. |
| Native coherent sheaves | TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48 is the full finitely presented module-sheaf subcategory; Noetherianity supplies the coherent interpretation. The tensor-product sheaf modules cited in the contract exist. |
| Native Verma module | TauCeti/Algebra/Lie/HighestWeight/Verma.lean:140–146,195 retains Field, CharZero, Killing-semisimplicity, finite dimension, split Cartan and chosen root base. It is not a split reductive category O definition. |
| ReductiveGroups | TauCetiRoadmap/ReductiveGroups/README.md:227–248,627 onward,1023 onward,1092 onward,1733–1784,2057–2113 locate Layers 2,3,7,8,9,10A–10B,11C–11D. The complex regular-semisimple statements are distinguished from the declared arbitrary-field gap. The actual character-lattice and negative/positive-Borel convention is retained. |
| AlgebraicVectorBundles | L0A–L0C supply ordinary sheaf operations; L1A–L2B supply the algebra/relative-Spec/total-space construction. The module equivalence attribution is corrected in R02. |
| SchemeAndStackFoundations | §§0.4,0.7–0.9,0.16–0.21,0.30,1.1,1.16,2.6,2.18,2.22,4.11,4.13,5.1 exist with the relevant extension, dimension, descent, CM, excellence, derived, finite-modification and cycle roles. §0.2 is the missing relative-Spec module comparison. |
| DeformationAndDerivedPatchingAlgebra | Current §1.16 states the actual local completion map, flatness and completed closed fibre. §§1.13–1.15 supply finite-module completion; §§3.3–3.4 retain local dimensions and proper regular-sequence ideals. §6.7 consumes the earlier affine module-cycle owner through its compatibility interface, so it is not missing. |
| SchubertGeometry | S1 and S2.3 give the relevant quotient/root-cell and reduced-word/closure comparisons. Its right quotient is by the negative Borel; the package explicitly transports it for §1.4. S3's line-bundle convention also detects R06's sign problem. |
| NilpotentOrbits | N1, N5.0 and N7 state the cone ideal, reducedness/CI and cotangent Springer construction. The package's field and reductive-centre adapters compare those objects rather than assigning the complex construction a second owner. |
| FormalConnectionsOpers | Current F2.2 contains all-order operators, principal parts and Lie–Rinehart PBW, not merely first-order connections. F4.3 contains invariant restriction, central factors, field descent and regular-nilpotent uniqueness. These two citations resolve. |
| EnhancedDerivedSheaves | §§0.1–0.4 and E1.3–E1.4 provide the ordinary enhanced/sheaf substrate and additive noncommutative models. The bimodule tensor–Hom/pushforward extension is expressly a gap, not falsely attributed to commutative tensor theory. |
| RepresentationTheory/LieHighestWeight | Layers 3,4,7,9 have the stated semisimple PBW/highest-weight/central-character and reductive splitting roles. They do not supply the principal KL theorem claimed as proved by §11.3. |

All four gap slugs, suppliers, sections and needs sentences agree between design/plan.json and the README: lie-invariants, associated-bundle-descent, local-geometric-comparisons, derived-bimodule-sheaves. They name concrete map/comparison packages with their hypotheses; none is assigned to “none”. Existing invariant restriction, ordinary descent, contracted products, finite modifications and basic completion are already excluded from the residual requests or named as their inputs. The associated-bundle ownership transfer remains the settled F03 matter.

The resolver's sole missing-name lead, `IsModification.isIso_of_isFinite`, is a false positive: it is a planned export of TauCetiRoadmap/SchemeAndStackFoundations/README.md:5534 (§4.11), not a claim of a pinned implementation. It was not reported as a defect.

The requested dependency check on the unmodified README returned:

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R04 records a proposed ownership move if the geometric KL route is chosen; it is not an existing dependency. The read-only `origin/main...HEAD` diff covered seven files, all inside packages/SpringerResolutionAndCharacteristicCycles (README, Suggested, design plan, metadata, two earlier reports and sources). No package-file edit or Lean command was made during this pass. The single import, namespace, docstring and absence of `set_option`, own `lemma` declarations, sorry'd data, computational algorithms and process/PR references in README/Suggested satisfy the inspected policy checks.

### Computed statement audit

The numbered subsections are the README's target groups; its bold labels are Summary, Checks and reference keys, rather than additional named theorems. Each row includes the definition/API and theorem of that subsection. Recap bullets repeating the same instance are not separate mathematical tests. In this table, G means the stated split connected reductive group; C means characteristic zero or p>h; D means a smooth separated finite-type scheme of pure dimension n over a characteristic-zero field. A field is nonzero, so the zero ring is excluded from those contexts. N=dim U, r=dim T and D_G=r+2N. No compact-topological-group hypothesis or numeric q-division occurs here.

| Statement and context | Instances and computed values on both sides | Result; change |
| --- | --- | --- |
| Conventions, README:20–37 | SL₂: (N,r,D_G)=(1,1,3), dim T*F=2; torus: (0,r,r); trivial G: (0,0,0). GL₃ cycle sends (1,2,4) by w⁻¹ to (2,4,1), by w to (4,1,2). Signed covectors sum −a+a=0, unsigned sum 2a. Closed-point inverse has Tor₁=k, Tor₀=0 and shift [−1] gives H⁰=k. | These dimensions, inverse label and shift agree. Twisted line bundles need R06's additional comparison. |
| Associated-bundle gap, README:65–71 | Right frame torsor of O(1), weights 1,−1,0: degrees 1,−1,0; inverse convention swapped: −1,1,0. Rank-zero representation: fibre 0 and descended rank 0. | Correct inverse-action checks; settled ownership transfer is not re-raised. |
| §1.1 Flag scheme; G over any field | G=1 or torus: quotient point, fibre rank 0; SL₂: flags are lines, F=P¹; over k[ε]/ε² the line k[ε](1,ε) differs from k[ε](1,0), although their residue lines coincide. | Quotient sheaf retains infinitesimal flags; point-set quotient would fail. |
| §1.2 Smooth projectivity; G | SL₂: dim F=1=N, dim B=2=r+N; GL₃: dim F=3=N; torus/trivial group: point of dimension 0. | Numeric dimensions agree; positive weight must be converted to the appropriate ample bundle convention. |
| §1.3 Relative position; G | SL₂: e gives equal lines, s gives distinct lines; torus: one orbit; GL₃: six labels versus three cyclic labels, so a cyclic-only W model fails. | Correct orbit indexing; no reducedness inferred from test points. |
| §1.4 Bruhat dimensions/closures; G | SL₂: dim U_e=1=1+0, dim U_s=2=1+1, diagonal is in closure of distinct pairs; GL₃: dimensions 3+ℓ(w), hence 3 to 6; torus: 0. | Both closure directions agree with e<s and their transported opposite-Borel convention. |
| §1.5 Intersection; reduced locally finite-type Y, finite-rank summands | Coordinate lines in k²: intersection 0, sum rank 2; equal lines: rank 1, zero substitute rank 0. Over k[ε]/ε², spans (1,0),(1,ε) intersect in (ε)e₁, while fibre intersection is ke₁. | Reducedness excludes the false constant-rank inference; arbitrary base change is used only after splitting. |
| §2.1 Grothendieck resolution; construction all fields, structural C | Torus: g̃=t and map=id, fibre dimension 0. SL₂: g̃ is rank-2 bundle over P¹, total dimension 1+2=3. Over dual numbers, ψ=εI for GL₂ is retained and maps to εI, not 0. | Associated Lie bundle and operator map pass these tests. |
| §2.2 Regular loci; G,C | In sl₂, centralizer dimensions of 0,E₁₂,diag(a,−a) with a≠0 are 3,1,1; rank is 1. E₁₂ is regular but not semisimple. Torus: all centralizers have dimension r and every element is regular semisimple. | Distinguishes regular from regular semisimple; p=2 is excluded for A₁, p=3 admitted. |
| §2.3 Properness/regular cover; G,C | SL₂ regular semisimple fibre: two reduced eigenlines, degree 2=card W. Grothendieck fibre at E₁₂: local equation t²=0, length 2, one geometric flag. Torus: identity cover degree 1; zero in sl₂: fibre P¹. | Étaleness only over regular semisimple locus; regular cover may ramify. |
| §3.1 Double incidence; G,C | Torus: t×_t t=t, dimension r. SL₂ chart ψ=((a,b),(c,−a)), flags (1,x),(1,y): equations c−2ax−bx²=0 and c−2ay−by²=0. At x=y=0 equations both c=0. | Fibre-product construction keeps the two scheme equations, including their coincidence on diagonal. |
| §3.2 Cartan projections; G,C | GL₃ cycle: κ₁=(1,2,4), κ₂=(2,4,1). SL₂ at a diagonal flag: κ₁=κ₂=a. Torus: both maps=id_t. | Actual quotient b/u yields these maps; switching w and w⁻¹ fails GL₃. |
| §3.3 Incidence strata; G,C | SL₂: V_e over equal flags has fibre b, dimension 2; V_s over distinct flags has fibre t, dimension 1. ψ=0 belongs over both kinds of flag pair; torus: sole stratum=t. | Strata retain operator zero and the two different base orbits. |
| §3.4 Stratum vector bundles; G,C | SL₂: 1+2=3 and 2+1=3. GL₃: (3+ℓ)+(6−ℓ)=9. Torus: 0+r=r. | Rank r+N−ℓ and total dimension D_G agree; no negative natural-number rank. |
| §3.5 Components; G,C | SL₂ chart: after eliminating c, equation (x−y)(2a+b(x+y))=0. Thus X_e: x=y; X_s: 2a+b(x+y)=0; each dimension 3. Torus: one component of dimension r. | Reduced closures give two distinct components in A₁, one in rank zero. |
| §3.6 Bruhat support; G,C | SL₂: π(X_e)=diagonal; π(X_s)=P¹×P¹, including diagonal with ψ nilpotent. ψ=0 lies over every pair. Torus: image point. | Inclusion in closure, and actual surjectivity onto it, have the required boundary points. |
| §3.7 Local complete intersection; G,C | SL₂ ambient chart dimension 5, two equations, dimension 3=5−2; at x=y=0 both linear parts can coincide, yet sequence has codimension 2. Torus: zero equations, dimension r. | LCI does not assert smoothness of the union; expected codimension retained. |
| §3.8 Reducedness; G,C | SL₂ residual equation has distinct factors x−y and 2a+b(x+y), with 2 invertible: nilradical 0. Nonreduced control k[ε]/ε²: ε≠0, ε²=0 despite reduced support point. | CM plus generic reducedness is the route, not equality of geometric points. |
| §3.9 Birational projections; G,C | X_e→g̃ is identity. For SL₂ X_s over E₁₂, a=bundle Cartan coordinate gives y=x when b≠0, hence projection iso there; over ψ=0 fixed first flag leaves P¹ of second flags. Torus: identity. | Birational/regular-locus isomorphism does not imply global isomorphism. |
| §4.1 Cartan-fibre dimensions; G,C | SL₂: dim X_w=3, dim t=1, fibre dimension 2 at a=0 and a≠0. Torus id_t: fibre dimension 0=r−r. Trivial group: point→point. | D_G−r=2N agrees at special and generic fibres. |
| §4.2 CM/convolution/localisation; semisimple simply connected, p>h, integral model | A₁: p=3,5 satisfy p>2; p=2 fails. Empty kernel acts by identity, zero kernel by 0. Over F₃, [∂³,x]=0=[∂,x³]. Pairings for λ=0,2ρ are 1,3. X_s=Tot O(−1,−1), canonical degrees (−1,−1), displayed dual twist degrees (+1,+1). | CM/localisation boundary checks pass; dual-twist transport needs R06. |
| §4.3 Geometric CM; G,C | Torus affine t: depth=dim=r. SL₂ charts X_e and X_s smooth of dimension 3, depth 3. Flat disjoint-union control over Z_(p): special point depth=dim=0, generic bad component k[x,y]/(x²,xy) depth 0<1. | Supplied scaling/proper-flags argument is needed; flatness alone fails the stated control. |
| §4.4 Flat Cartan maps; G,C | SL₂ local dimension formula 3=1+2; torus  r=r+0. Map point⊔A¹→A¹ has global dimensions 1=1+0 but at isolated source point local dimensions 0≠1+0. | Correct local miracle-flatness hypothesis excludes global-dimension substitute. |
| §5.1 Weyl Cartan relation; G,C | SL₂ X_e: κ₂=a=κ₁; X_s: κ₂=−κ₁. GL₃ cycle: (2,4,1)=w⁻¹(1,2,4)≠w(1,2,4). Torus w=e: z=z. | Equality tested for inverse-sensitive nonabelian W and rank zero. |
| §5.2 Smooth fixed-Cartan/flag fibres; G,C | For fixed SL₂ equal flags, prescribed Cartan leaves one nilpotent coordinate; distinct flags leave 0. GL₃ ranks N−ℓ are 3−ℓ, hence 3 at e and 0 at w₀. | Affine fibres of stated ranks; empty-root case rank 0. |
| §5.3 Single-wall regularity; G,C | sl₂ wall z=0: E₁₂ centralizer dimension 1=r, zero centralizer dimension 3. In gl₃, diag(a,a,c)+E₁₂, a≠c, has centralizer dimension 2+1=3=r; without root vector dimension 4+1=5. | Nonzero root-vector condition separates regular from nonregular points. |
| §5.4 Normality; G,C | SL₂ each chart X_e,X_s is affine 3-space, integral and normal; their union has two components meeting and is not normal at the intersection. Torus: polynomial ring in r variables. | The theorem concerns individual components, not all X. |
| §6.1 Nilpotent fibre; G,char 0 | sl₂ invariant a²+bc: zero fibre is a²+bc=0, dimension 2. gl₂: tr=det=0 removes the central coordinate; torus: cone={0}. Dual-number central εI has trace 2ε≠0, so is excluded in char 0. | Scheme zero fibre, not only nilpotent adjoint action; central factor correctly killed. |
| §6.2 Springer resolution; G,char 0 | SL₂/PGL₂: Tot O(−2), dimension 2; fibre at 0=P¹, fibre at E₁₂=one reduced point (stronger nilradical equation sets flag coordinate t=0). Torus: point→point. | Correctly differs from length-2 Grothendieck fibre in §2.3. |
| §6.3 Cotangent/conormal; G,char 0, fixed invariant form | tr(E₁₂E₂₁)=1; scaling the form by 2 requires operator E₁₂/2 for the same covector. Signed pair has moment −ψ+ψ=0; unsigned pair gives 2ψ. SL₂ cotangent product dimension 4, Grothendieck product 6. | Form dependence and sign are explicit; no canonical form on reductive centre claimed. |
| §6.4 Reduced Steinberg variety; G,char 0 | SL₂: diagonal cotangent component Z_e and zero section Z_s, both dimension 2, intersect along diagonal at ψ=0. Torus: one point. Reduced structure has nilradical 0 by definition. | Tests distinguish two conormals from a single zero section. |
| §6.5 Steinberg fibre-product comparison; G,char 0 | At SL₂ regular nilpotent, both Springer factors give one reduced point. At 0, flags range over P¹×P¹. Dual-number ring and its reduction have identical geometric points but lengths 2 and 1. | The conditional unreduced comparison is not inferred from these point sets. |
| §6.6 Conormal components; G,char 0 | SL₂ diagonal: base dimension 1 + conormal rank 1=2; open orbit: dimension 2 + rank 0=2. GL₃: (3+ℓ)+(3−ℓ)=6=2N; torus: 0. | Correct rank/order and pure dimension. |
| §7.1 Component basis; pure finite-type support | SL₂ top cycles give Z², (1,0)≠(0,1), (−1,1) allowed; torus gives Z, empty scheme gives 0. Point has degree-0 group Z but degree-1 group 0. | Dimension grading is added to native ungraded cycles, with no rational-equivalence quotient. |
| §7.2 Generic-length gluing; Noetherian finite-type scheme, finite module, support bound | k[ε]/ε²: lengths 2,1,1 and 2=1+1. Coordinate axes structure sheaf: generic coefficients (1,1). Zero module: all 0; finite-length point module in degree 1: 0. | Exact additivity in fixed dimension and affine/global comparison match. |
| §7.3 Cartan zero fibres; G,char 0 | SL₂ X_s chart a=−b(x+y)/2, c=−bxy gives κ₁=b(x−y)/2: zero fibre b(x−y)=0, coefficients 1 on b=0 and 1 on x=y. X_e zero fibre gives only Z_e. | Scheme fibre cycle (1,1) differs from component cycle (0,1). |
| §7.4 Zero-fibre CM/dimension; G,char 0 | SL₂ X_s zero ring k[x,y,b]/(b(x−y)): dimension/depth 2; X_e zero is T*P¹, dimension/depth 2. Torus zero fibre point dimension/depth 0. | r parameters cut D_G down to 2N. |
| §8.1 Coherent D-modules; D | Point: D=k; A¹: [∂,x]=1, D has infinite O-rank but D-rank 1. Delta has xδ=0, x∂δ=−δ; zero has 0 generators. | Distinguishes D-coherence from O-coherence and from a commutative substitute. |
| §8.2 PBW/Noetherian/cotangent; D | A¹: gr D=k[x,ξ], order pieces ranks 1,2,3 for p=0,1,2; point rank 1 for all p≥0. gr O=k[x,ξ]/(ξ) becomes zero-section sheaf. | Algebraic values correct; missing module-sheaf supplier is R02. |
| §8.3 Good filtrations; D | O: gr=k[x], ξ acts 0; D: gr=k[x,ξ]; constant all-integer filtration on nonzero M has gr=0 but is not bounded below. Zero filtration on zero M is good. | Boundedness prevents disappearing nonzero modules. |
| §8.4 Global good filtrations/comparison; D finite type | Shift F_j↦F_(j+1): a=1 gives both inclusions; zero shift needs a=0. One affine chart needs one generating lattice; finitely many shifts a_i give a=max a_i. For D/Dx², induced graded factors each have generic length 1, total 2. | The stated finite-cover argument gives a global bound; the unspecified “ε extension” Check needs R08’s actual D/Dx² sequence. |
| §8.5 Characteristic support; D | O: ξ=0; delta: x=0; D: whole A²; zero: empty. D/Dx² has reduced support x=0 even though its graded module has x²=0. | Radical support independent of the retained module multiplicity. |
| §8.6 All-component characteristic cycle; D | CC(O)=[ξ=0]; CC(D/Dx²)=2[x=0]; rank-a connection gives a[zero section], including a=0. CC(D⊕O)=[A²], whereas CC(D)+CC(O)=[A²]+[ξ=0]. | Correct nonadditivity outside holonomic/equidimensional support; finite generic lengths retain 2 rather than reduced rank 1. |
| §9.1 Transfer/duality; D, smooth source and target | Identity transfer=D and shift 0. Point k² dual has dimension 2. On A¹, right dx·∂=0; dual O has Ext¹=O and shift [1] returns degree 0. Two-term x-resolution has Ext⁰=0, Ext¹=k. | Left/right and cohomological shifts agree; ordinary torsion-module bidual would give 0≠k. |
| §9.2 Kashiwara; smooth closed immersion codimension c | A¹ delta: x∂ʲδ=−j∂ʲ⁻¹δ; ker x=kδ, coker x=0. Double delta gives kernel dimension 2; codimension 0 identity has shift 0. | Li*[−1] recovers k in degree 0; naive quotient would incorrectly give 0. |
| §9.3 Bernstein; nonzero coherent module on D | On A¹, characteristic dimensions O:1, delta:1, D:2, all ≥1; point:0≥0. A nonzero finite-dimensional Weyl module would imply 0=tr[∂,x]=dim M≠0. | Characteristic zero and nonzero conditions exclude the false rank-zero support substitute. |
| §9.4 Holonomic category; D | O,delta have dimension 1≤1; D dimension 2>1; zero has empty support and is included. Exponential rank-one connection has dimension 1 but fails regularity. | Holonomic and regular are distinct predicates. |
| §9.5 Length/additivity; holonomic D-modules | delta⊕delta: length 2, cycle coefficient 2=1+1; zero length 0. A rank-2 trivial connection has cycle 2[zero section]. Nonholonomic D⊕O fails the unrestricted cycle addition as in §8.6. | Exactness and finiteness match the holonomic hypotheses. |
| §9.6 Intermediate extension; holonomic, locally closed smooth immersion | Identity gives E. G_m→A¹ gives j_!*O=O, while j_+O=O[x⁻¹] and quotient delta≠0. Point→A¹ gives delta, whose normalized inverse is k. | Boundary condition excludes the larger direct image. |
| §9.7 Regularity; holonomic, geometric char 0 | Trivial connection: logarithmic form 0; delta comes from a dimension-0 connection. Exponential ∂e=e gives −dt/t² at infinity, pole 2; replacing lattice by t^m changes by m dt/t and cannot cancel the double pole. | Correct regular/irregular distinction and lattice-existence test. |
| §9.8 Strong equivariance; smooth H, D | G_m on a point, weights 0 and 1: differentiated actions 0 and 1 versus vector-field action 0, so 0=0 and 1≠0. Trivial H on A¹ permits D with CC=[A²]. Finite constant S₃ on a point has Lie algebra 0, so its nontrivial representations are allowed. | Connectedness was not silently imposed on H; weak weight-1 action is rejected. |
| §9.9 Moment/orbit classification; H smooth, algebraically closed field and connected stabilizers for simple classification | SL₂ double flags: two orbits; stabilizers B and T connected; two trivial orbit simples; signed moment 0. H=G_m acting on itself by t·x=t² has stabilizer μ₂ and two rank-one equivariant local systems, so connected-stabilizer hypothesis matters. | General support statement and narrower classification distinguished; nonconnected stabilizer control excluded. |
| §10.1 D-affinity; G,char 0, strict χ₀ | Torus: central vector field z=0, ΓD=k. SL₂: trivial representation localizes to O_P¹, Γ=k and H¹=0. Actual lattice: SL₂ ω gives dimension 2; PGL₂ first dominant nonzero weight 2ω gives dimension 3. | General quasi-coherent proof uses individual coherent twists, not uniform Serre vanishing. |
| §10.2 BB equivalence; same strict reduction | Torus Loc(V)=V. Loc(k)=O_F. Generalized torus module k[z]/z² has z·1=z≠0 and is not a strict quotient module; strict quotient k has z=0. | Scope correctly excludes generalized central character. |
| §10.3 Induction; strongly B-equivariant regular holonomic | Torus: identity. Ind O_F=O_(F×F), CC=[Z_w₀]. Ind delta_e is diagonal direct image, CC=[Z_e]; for SL₂ dimensions of supports 2 versus 1. | This correct induction already refutes the fixed-parabolic action in R01. |
| §10.4 Principal O; G,char 0, strict χ₀ | SL₂: M_e=M(−2ρ)=L_e; M_s=M(0) has L_e,L_s each once, L_s=k. Torus: only weight 0; generalized k[z]/z² excluded. Zero module length 0. | Labels, finite length and central restriction agree on these instances. |
| §11.1 Verma-cycle theorem; G,char 0 | A₁ CC(M_e)=(1,0), CC(M_s)=(1,1), matching κ₁-zero fibres. Top BM degree 4 has rank 2; ordinary H₄(T*P¹,Q)=0 but BM H₄=Q. Torus coefficients 1. | Cycle values agree; homological proof foundation missing, R03. |
| §11.2 Simple-cycle triangularity; G,char 0 | A₁ simple matrix A=((1,0),(0,1)); open-orbit closure smooth, so a_(s,e)=0, while m_(s,e)=1. Torus A=(1). | Positivity/support/diagonal agree; unresolved identification repaired in R07. |
| §11.3 KL multiplicities; finite Weyl group, principal O,char 0 | A₁ M=((1,0),(1,1)); P_(s,e)=0, P_(e,s)=1. A₃ P_(s₂,s₂s₁s₃s₂)=1+q gives values 1,2,3 at q=0,1,2; multiplicity is 2. Type A₂ normalized Hecke has rank 6 and v=1 gives Z[S₃]. | Correct indices and example values; R04 missing proof route and R05 owner comparison. |
| §11.4 Three bases; finite W,char 0 | A₁ A=I, M determinant 1; M⁻¹=((1,0),(−1,1)). Torus: (1) inverse (1). Over integers, replacing diagonal 1 by 2 would give determinant 2 and fail integral basis. | Unitriangularity supplies genuine integral changes, not merely rational spanning. |
| §12.1 Parabolic integrability; actual X*(T),char 0 | SL₂ pairings −2 and 0 give I_e=∅, P_e=B, I_s={α}, P_s=G. Torus has no roots and P=G. PGL₂ ω absent, −2ω and 2ω present. | Actual lattice and negative-root integrability conditions agree. |
| §12.2 Parabolic invariance; G,char 0 | SL₂ w=e, L=ke₂, p=((1,1),(0,1)): (L,L,0)∈Z_e but (pL,L,0)∉Z_e, since pL=k(e₁+e₂). w=s: Z_s=F²×{0} is stable. | False universal claim despite passing w=s Check; R01. Relative-refinement repair gives g₁pB=g₁B for P_e=B. |
| §13.1 Cartan graphs; G,char 0 | A₁ ring k[x,y]/(x²−y²), graphs y=±x; torus only diagonal. GL₃ cycle graph uses (1,2,4)→(2,4,1), not (4,1,2). | Universal fibre product and inverse labels match. |
| §13.2 Components of Cartan product; G,char 0 | A₁ factors (x−y)(x+y), two reduced intersecting lines. In char 2 actual action is trivial, quotient k[t], diagonal reduced; reducing integral square-invariant model instead gives k[x,ε]/ε², nilradical (ε). | Characteristic-two Check correctly distinguishes two constructions. |
| §13.3 Completion detects graph; closed x,G,char 0 | On completed graph e, y−x=0 but y+x=2x≠0; on graph s these reverse. k[x]_(x)→k[x,y]_(x,y) gives k[[x]]→k[[x,y]], closed fibre k[[y]], dimensions 2=1+1. Identity: 1=1+0. | Both directions of factorization iff checked; point membership in both graphs is insufficient. |
| §13.4 Tangent upper bound; zero operator,closed x,G,char 0 | SL₂ (w,v)=(e,e),(s,e),(s,s): sums 1+1+1, 2+0+1, 2+1+0 each 3; actual component tangent dimension 3. Torus: 0+r+0=r. | Fixed-space orientation and lengths reproduce the bound. |
| §13.5 Smoothness criterion; §13.4 plus smooth orbit closure and codimension equality | A₁ (s,e): fixed codim 1=ℓ(s)−ℓ(e); (s,s): 0=1−1. Tangent bound=local dimension=3 in both. Torus: r=r. | Sufficient condition verified, with no converse asserted. |
| §14.1 Cycle completion; excellent reduced pure finite-type Y,closed x | A¹: [A¹]→[Spec k[[t]]]. Irreducible node: y²−x²(1+x)=(y−x√(1+x))(y+x√(1+x)), sqrt=1+x/2−x²/8+…, coefficients (1,1). Axes at (1,0): y=0 coefficient 1, x=0 coefficient 0. | Retains both formal branches; excludes nonclosed-point dimension drop. |
| §14.2 Generic lengths after completion; finite coherent module on zero fibre | Point k²: 2=2·1. Node structure sheaf: coefficient 1 becomes (1,1); its double gives (2,2). Smaller-support point module in curve top degree: 0 before=0 after. | Flat completion and dimension grading retain all branch coefficients. |
| §14.3 Completed simple cycles; G,char 0,closed x | Torus: coefficient 1. SL₂ diagonal zero: completed simple cycles are separate component classes. At nonzero E₁₂ only Z_e passes through x, so L̂_s=0 and L̂_e has coefficient 1. | Definition is cycle completion, not a completed D-module assertion. |
| §14.4 Completed KL identity; G,char 0,closed x | A₁ at intersection: (1,1)=(1,0)+(0,1). Off Z_s: 1=1+0. For w=e off Z_e: 0=0. Torus: 1=1. | Identity retains missing-component zeros and formal multiplicities; proof depends on repair R04. |

| Cross-cutting field/base boundaries | Empty Y has only the zero module and zero cycles; empty cover has zero generating sum. Unit ideal defines empty support, coefficient 0. For k=F₂(t), adjoining t^(1/2) gives reduced field L but L⊗_k L=L[ε]/ε²: reducedness alone does not imply geometric reducedness. This is outside characteristic-zero D/completion applications and outside A₁'s p>h range. A nonsplit anisotropic torus over R is excluded by splitness; a torus that is split has F=point, dim t=r. | No zero-ring field instance, non-quasi-separated scheme, division by q−1, infinite generic length converted to an integer, or out-of-range Weyl label is admitted. |

### Source-locator ledger

These 72 entries count named propositions/definitions or explicitly cited unnumbered constructions once, not every repeated citation. All six works have one manifest key, certified status and legal cached text. The ledger distinguishes a correct location from a correct mathematical assertion.

| Source | Locator entries counted | Text inspected and conclusion |
| --- | --- | --- |
| BHS19 | 2: §2.1; Proposition 2.1.1 | BHS19 lines 458–499, pp. 309–310: flag conventions and regular covering; the p>h bound is explicit. |
| BHS19 | 5: Proposition 2.2.1; Lemma 2.2.2; Lemma 2.2.4; Proposition 2.2.5; Theorem 2.2.6 | BHS19 lines 518–632, pp. 311–314: stratum rank, reduced-base intersection, closure support, LCI and regular-locus component projection. |
| BHS19 | 6: Lemmas 2.3.1–2.3.2; Proposition 2.3.3; Lemmas 2.3.4–2.3.5; Theorem 2.3.6 | BHS19 lines 633–811, pp. 314–319: fibre dimensions, Cartan relation and normality. The source's global miracle-flatness and characteristic-zero lifting steps require the corrections already made in the package. |
| BHS19 | 7: §2.4 nilpotent/Steinberg construction; Proposition 2.4.1; Remark 2.4.3; Propositions 2.4.4 and 2.4.6; Theorem 2.4.7; Lemma 2.4.8 | BHS19 lines 820–1057, pp. 320–324: cycle constructions and labels. R01 refutes Lemma 2.4.8. The source states KL multiplicities but imports their proof; it does not close R04. |
| BHS19 | 5: Lemmas 2.5.1–2.5.2; Proposition 2.5.3; Lemma 2.5.5; Corollary 2.5.6 | BHS19 lines 1071–1211, pp. 325–328: graph components, completion, zero-operator tangent bound and completed cycles. The completed graph's generic-point typo is corrected by the package. |
| BR12 | 11: §1.1; Theorem 2.2.1; Remark 2.2.2; §2.3; Theorem 2.4.1; Propositions 2.6.7 and 2.8.1; §2.10; Remark 2.11.1; Proposition 2.14.2; Remark 2.14.3 | BR12 lines 159–208,953–1140,1346–1450,1546–1626,1703–1758; pp. 538–539,557–561,565–568,570–572,574–575. Root opposition, inverse orbit index and convolution order must all be transported; R06 isolates the untransported line twist. A₃ polynomial 1+q is present. |
| M23 | 3: Theorems 2.11 and 2.21; Corollary 2.22 | M23 lines 218–300,371–397, pp. 3–6: local order/PBW and Noetherian comparison, with reversed inclusion announcements in the source. |
| M23 | 9: Definitions 3.1,3.19,3.21; Propositions 3.22,3.24,3.25; Definition 3.28; Propositions 3.30,3.33 | M23 lines 475–490,697–859, pp. 9,13–16: module, good-filtration, bounded-comparison, support and strict-exactness statements. Global existence needs the package's coherent-extension argument. |
| M23 | 10: Theorem 5.5; §6.1 transfer; Theorem 6.20; Proposition 6.24; §6.3 Bernstein; Proposition 6.37; Definition 6.40; Propositions 6.41–6.42; normalized duality before Exercise 6.55 | M23 lines 1717–1731,2093 onward,2378–2620,2664–2779,3063–3094; pp. 35–36,43–52,54–56,62–63. Generic length and holonomic additivity have the package's scope; finite-projective and Tor-index slips are source issues. |
| M23 | 7: Definition 6.77; Theorems 6.79,6.83; Definitions 7.25,7.30,7.32; Theorem 7.33 | M23 lines 3685–3976,4768–4852; pp. 72–77,93–94: intermediate extension and curve regularity. The regularity source is complex; arbitrary-field comparison is an explicit package target, not attributed to the source. |
| G98 | 3: Definition 1.1.12; §2.1; §4.1 | G98 lines 191–204,1061–1130,2833–2865; pp. 5–6,23–24,61. The reduced-rank multiplicity is erroneous; the package correctly uses M23 generic length. |
| ElliottBB | 3: Theorems 1–2; §4 projection/ample-twist route | ElliottBB lines 174–260,270–312; pp. 5–10. Semisimple algebraically closed setting retained; actual central map and arbitrary-field/reductive adapters are stated separately. The source's quasi-coherent Serre-vanishing assertion is not used unchanged. |
| EH18 | 1: Definition 4.10 and its preceding equivalence | EH18 lines 1725–1740, p. 63, with chapter hypothesis at EH18 line 1581: strongly equivariant D-modules over algebraically closed characteristic zero; the package separately owns field descent. |

## Not verifiable

- No Lean build or elaboration was run, as required by the read-only brief. The acceptance file has zero declarations, so the requested per-declaration `#check @name` audit has an empty domain; no inferred binder claim is being substituted for an elaboration result.
- The future formal proofs are not present. In particular, the full positive-characteristic localisation/convolution construction, general-field regularity descent and KL comparison are not certified merely by their bibliography or the small examples. R03 identifies missing homological inputs and R04 the missing independent multiplicity proof source; the declared four supplier extensions remain conditional contracts.
- No complete proof was available in the package's six sources for the principal KL multiplicity theorem: BHS19 refers onward. This is R04, rather than a new missing-reference request for every work in BHS19's bibliography. All works actually cited as package sources are readable; no needs-references request is outstanding.
- Ownership searches cover the supplied 55 sibling heads, main/Completed, board packages and roadmap-tool matches. They do not constitute a line-by-line mathematical review of every other open pull request. No unnamed or inaccessible pull request was used as evidence of a missing declaration.
- Source issues below are checked against the provided legal text extractions. No published erratum correcting these particular passages was established during this pass. Ambiguous OCR bars or accents were not used as standalone findings.

## Source issues

- **Misprint** in BHS19 at proof of Proposition 2.2.5, p. 313 (BHS19 line 578): the source says the stratum-bundle input is Lemma 2.2.1; it should be Proposition 2.2.1; affects nothing.
- **Error** in BHS19 at Lemma 2.3.2, p. 315 (BHS19 lines 665–673): the source says global equidimensional-fibre dimensions imply flatness for arbitrary Noetherian schemes with regular base and CM source; it should be the local dimension equality at every source point, with the stated regularity and CM hypotheses; affects a stated result.
- **Gap** in BHS19 at proof of Proposition 2.3.3, p. 316 (BHS19 lines 705–707): the source says flatness over the DVR and a CM special fibre make the entire model CM; it should be supplemented by the scaling and projective-flag specialization argument reaching every potentially bad generic point; affects the proof.
- **Misprint** in BHS19 at formula (2.15), proof of Proposition 2.4.4, p. 322 (BHS19 lines 934–936): the source says the associated-bundle map and B-action leave the operator coordinate unchanged; it should be conjugated by g₁⁻¹ in the map and by b⁻¹ in the B-action; affects the proof.
- **Misprint** in BHS19 at proof of Theorem 2.4.7(ii), p. 323 (BHS19 line 1001): the source says unprefixed P_(w,w′)(1) vanishes unless w′≤w; it should be the prefixed P_(w₀w,w₀w′)(1) in that support assertion; affects the proof.
- **Error** in BHS19 at Lemma 2.4.8, p. 324 (BHS19 lines 1025–1056): the source says a fixed highest-weight parabolic preserves the induced cycle by first-flag-only left translation; it should be relative partial-flag descent and refinement saturation, as distinguished by the SL₂ diagonal counterexample in R01; affects a stated result.
- **Misprint** in BHS19 at proof of Lemma 2.4.8, p. 324 (BHS19 line 1040): the source says the cotangent bundle of the double flag variety is the product of Grothendieck resolutions; it should be the product of Springer cotangent resolutions, with the signed incidence convention; affects the proof.
- **Misprint** in BHS19 at proof of Lemma 2.5.2, p. 326 (BHS19 line 1107): the source says the generic point of the completed Cartan graph lies in the completed incidence scheme; it should be a point of the completed Cartan fibre product; affects the proof.
- **Error** in G98 at Definition 1.1.12 and Theorem 1.1.13, pp. 5–6 (G98 lines 191–204): the source says multiplicity is rank after tensoring with the reduced component and is additive; it should be generic localized module length; D/Dx² has length 2, while that reduced rank is 1; affects a stated result.
- **Gap** in G98 at §2.1.4, p. 23 (G98 lines 1079–1083): the source says differentiating a monic equation determines the lifted derivation uniquely; it should be justified using an étale presentation with invertible Jacobian; a repeated monic equation has zero derivative and gives no determination; affects the proof.
- **Misprint** in G98 at Definition 4.1.1, p. 61 (G98 lines 2835–2843): the source says holonomicity requires characteristic dimension equal to dim X without a zero-object exception; it should be M=0 or characteristic dimension equal to dim X, so the asserted abelian category contains zero; affects a stated result.
- **Misprint** in M23 at Theorem 2.11 proof, pp. 3–4 (M23 lines 227,285): the source says the easy and inductively proved filtration inclusions in the opposite directions; it should be F′_p⊆F_p immediately and F_p⊆F′_p by the displayed expansion; affects the proof.
- **Misprint** in M23 at Theorem 5.5 proof, pp. 35–36 (M23 lines 1725–1729): the source says bounded complexes of finitely generated modules have termwise ordinary biduality; it should be bounded complexes of finitely generated projective modules; affects the proof.
- **Misprint** in M23 at Theorem 6.20 proof, p. 50 (M23 lines 2446–2449): the source says an operator applied to u equals a product of operators alone; it should be that product applied to u; affects the proof.
- **Misprint** in M23 at Proposition 6.24 proof, pp. 50–51 (M23 lines 2500–2503): the source says the quotient N/zN is Tor₁ and then identifies Tor₁ with the kernel; it should be Tor₀=N/zN and Tor₁=ker z; affects the proof.
- **Misprint** in M23 at Theorem 6.54 proof, pp. 61–62 (M23 lines 3027,3058): the source says pushforward cohomology is a module over the source's D or O sheaf; it should be a module over the corresponding target sheaf on Y; affects the proof.
- **Misprint** in M23 at Proposition 6.82 proof, p. 76 (M23 lines 3915–3916): the source says the second factorization's open map is an inclusion from U∩V to V; it should be the inclusion U₁∩U₂→U₁, following the displayed closed map from U₂∩V; affects the proof.
- **Misprint** in M23 at Example 7.27, p. 93 (M23 lines 4792–4793): the source says every submodule of a DVR's fraction field is a principal fractional lattice; it should be every nonzero finitely generated submodule; zero and the entire fraction field are counterexamples otherwise; affects the proof.
- **Misprint** in M23 at Example 7.28, pp. 93–94 (M23 lines 4800,4809): the source says the connection term is λ/x or −λ/y independently of the section g; it should be λg/x or −λg/y, respectively, so the connection sends zero to zero; affects a stated result.
- **Misprint** in ElliottBB at Theorem 1 discussion, footnote 11, p. 6 (ElliottBB lines 198–203): the source says a cotangent covector belongs to b* and maps directly to g*; it should be in (g/b)*=ann(b)⊂g*; affects the proof.
- **Error** in ElliottBB at §4, footnote 12 and vanishing argument, p. 9 (ElliottBB lines 290–299): the source says sufficiently high ample twists kill positive cohomology of every quasi-coherent sheaf; it should be coherent sheaves with individual bounds, followed by a filtered-colimit argument; ⊕_(n≥0)O(−n) on P¹ has no uniform bound; affects the proof.
- **Misprint** in ElliottBB at §4 projection argument, p. 10 (ElliottBB line 312): the source says the twist parameter is minus the undefined λ₁; it should be minus ν₁, the lowest weight used to define the preceding map; affects the proof.
- **Misprint** in EH18 at Definition 4.1, p. 57 (EH18 lines 1581,1587–1589): the source says derivations and differential operators are C-linear while the chapter's field is arbitrary algebraically closed K of characteristic zero; it should be K-linear throughout that definition; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "02f336a77099d056d9535a73ecbaaa807bdd8e0e", "job": "RT-SpringerResolutionAndCharacteristicCycles~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
