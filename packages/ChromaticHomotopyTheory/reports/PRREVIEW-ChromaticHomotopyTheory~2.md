# Review of ChromaticHomotopyTheory (pull request #1643 at 76df858)

**Verdict:** accepted

## R01 (P3) — Align the two remaining gap-section locators

**Location:** `packages/ChromaticHomotopyTheory/design/plan.json:4550` and `:4556`: “KII.5, purity and trace comparison” and “KII.6, height bounds and redshift”.

**Claim:** These are the supplier sections for the two BHLS contracts. The README now correctly uses §5.2 and §6.5, but the machine-readable contracts retain the obsolete names.

**Witness:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:1536` names §5.2; `:1733` names §6.5. The consuming README uses those sections at lines 155 and 157.

**Repair:** Change only these two gap `section` values to §5.2, fixed-point trace, and §6.5, BP-model redshift. Preserve their slugs, suppliers and needs sentences. At h=1 the former still requests the T(2)-localized trace of the possibly nonconnective fixed-point ring; the latter still requests the associative BP⟨1⟩ model, not the existing general E∞ redshift theorem. This is the remaining locator portion of previous R07, not an undeclared dependency.

## R02 (P3) — Name the owner of the uncompleted KU comparison

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:357`: “Compare with the uncompleted KU formula in hesselholt-ku line 1658”.

**Claim:** This comparison identifies its literature source but omits the earlier roadmap that already supplies the uncompleted calculation.

**Witness:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:880`, §7.2, gives KU Tate coefficients for C_p and C_(p²), including the cyclotomic fields and Euler coordinate.

**Repair:** Cite StableHomotopyKTheoryPartII §7.2 in Scope and ownership and in the comparison's supplier/Needs references. Retain the completed-input extension here and its explicit completion comparison. At p=2 both calculations give ℚ₂; at p=3 both give ℚ₃(ζ₃), with z satisfying z²+3z+3=0. Changing the coordinate from z=L−1 to 1−L must change the sign accordingly. The retained completed theorem is a distinguished variant, so this is a missing owner citation, not a finding that the entire target is duplicated.

## Verified sound

:robot: Independent AI review of the full 524-line README and complete Suggested.lean at the specified head. There are **2 P3 findings, 0 P1 findings and 0 P2 findings**. Acceptance is conditional on the six declared supplier contracts, and on the inherited EllipticCohomology contracts identified below. It means ready for human final approval.

### Previous findings, checked first

| Previous finding | Passage at this head | Assessment and recomputed witness |
| --- | --- | --- |
| R01: wrong Morava period | README:383, “let κ_n=E_n/(p,u₁,…,u_(n−1)) be its 2-periodic residue theory” | Repaired. At p=2,n=2, κ₀(S²)=𝔽₄², κ₁(S²)=0; the E₂-module has dimension 2. README:397 explicitly contrasts the incorrect dimension 1 from ordinary period-six K(2). |
| R02: dropped Honda residue field | README:143, “put k=𝔽_(p^(h+1)), h≥1” | Repaired. At p=2,h=1 the residue has four elements, quotient rank 2 and both stated valuations 1/2. At p=3,h=1 these become nine elements, rank 6, valuations 1/6 and 1/3. |
| R03: duplicate chromatic owners | README:9, “GeneralAlgebraicKTheoryPartII §§4.2–4.4 own periodic groups, telescope criteria and ring acyclicity” | Repaired for the constructions identified in that finding. Lines 9–14 and 141 import the finite towers, Bousfield–Kuhn, Tate, height, realization and Thom interfaces. The corresponding duplicate construction sections are gone. Φ_nΩ∞T(n) still gives L_T(n)T(n)≠0. |
| R04: wrong Segal supplier | README:137, “Consume §2.7's finite-type generalized Segal theorem at B=S” | Repaired. StableHomotopyKTheoryPartII:336–338 gives that theorem and sphere specialization. The resulting π₀ is ℤ_p and negative groups vanish; Hℤ Tate instead has π₀=ℤ/p. |
| R05: unconditional higher norm | README:81, “its diagonal must be (m−1)-ambidextrous” | Repaired. For B²C_p→*, the diagonal fiber is BC_p. In Sp, its norm on trivial H𝔽_p has π₀ map 0, so it cannot be inverted. Lines 87 and 391 now exclude this input. |
| R06: weak-ring double ownership | README:79, “What BordismFormalGroups must provide (gap:weak-ring-finite-postnikov)” | Repaired. The same slug and needs sentence occur in the plan. The local weak-ring proof has been removed; generic higher norms and the criterion have the supplier owner. Hℚ at n=0 satisfies all three vanishing tests; H𝔽_p fails the infinity-endpoint test. |
| R07: obsolete KII locators/intake placement | README:155 and :157, “§5.2” and “§6.5” | Partly repaired. Both contracts are under Exact supplier contracts and use the actual README sections. Only the two plan-section labels remain: R01 above. |

None of these assessments relies on treating a previous review as authoritative. The cited current passages and suppliers were reopened. No settled “not actionable in this package” objection is re-raised.

### Gate, dependency direction and Lean

The outside-folder diff is empty, and the worktree is clean. The worker's gate at this head reports:

```text
gate ChromaticHomotopyTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the required dependency check. Its complete substantive output is:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I also read every Needs line, layer dependency list and supplier subsection. This graph result is supplemented by the object/section checks below; the extraction alone cannot establish ownership.

Direct `lake env lean` elaboration of `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean` exited 0 with no diagnostics. The file has one `import Mathlib`, one module docstring, the prescribed namespace and **zero declarations**. Therefore the elaborated-signature inventory and one-tactic-padding inventory each have zero entries. There are no variables to disappear, sorry data, stand-ins, examples, overrides or declarations needing a scratch proof probe. No signature changed.

The headline inventory is:

1. §3.1: generalized Serre filtration, monodromy, naturality and homological convergence.
2. §4.1: completed KU raw Tate coefficients, their nonvanishing and localized vanishing.
3. §4.2: chromatic higher semiadditivity, the residue-theory dimension criterion and Eilenberg–Mac Lane ranks, and π-finite fiber comparison.
4. §5.1: positive-height Bott inversion for every associative ko-algebra.
5. §6.1: faithful full-level spectral Galois extensions at every N≥1.
6. The separately assigned Part II: all-prime telescope separation at every height ≥2.

The docstring names all five retained headline groups and the separate Part II theorem, with the missing carriers for each. None is presently statable using a few simple definitions on native carriers: the pins do not have the spectral stable category, KU/ko ring spectra, Morava residue/module categories, spectral level sheaves or higher norms. Formal groups and ordinary categorical localization cannot express these theorems. Omitting coefficient calculations from Suggested.lean therefore avoids padding rather than omitting a statable headline.

### Pinned declarations opened

Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered spectra/prespectra, Bousfield localization, Morava theories, higher semiadditivity, spectral Galois objects and the named algebraic carriers. I opened these 12 declarations/interfaces, not just their search results:

| File at the pin | Declaration and actual scope |
| --- | --- |
| `Mathlib/RingTheory/FormalGroup/Basic.lean:56` | `FormalGroup`: two-variable power series, zero constant term, the two unit linear coefficients and associativity. The unit identities are consequences; this is not an E∞ ring spectrum. |
| Same file :74 | `FormalGroup.IsComm`: commutativity is additional structure, not implicit in the carrier. |
| Same file :126 | `FormalGroup.Point` has body `{f : MvPowerSeries σ R // PowerSeries.HasSubst f}`. It does not mean arbitrary points of an arbitrary topological R-algebra. |
| Same file :145 | `FormalGroup.𝔾ₐ`: X+Y. |
| Same file :161 | `FormalGroup.𝔾ₘ`: X+Y+XY, fixing the sign used here. |
| Same file :184 | `FormalGroup.map`: coefficientwise transport along a ring homomorphism. |
| `Mathlib/CategoryTheory/Localization/Bousfield.lean:55` | `CategoryTheory.ObjectProperty.isLocal`: bijective precomposition into objects satisfying a property, in an ordinary category. It constructs neither a spectral reflector nor a higher mapping-space equivalence. |
| `Mathlib/RingTheory/Flat/Localization.lean:37` | `IsLocalization.flat`: applies even to commutative semirings with the localization structure. The README's ring instance is valid. |
| `Mathlib/RingTheory/Flat/Basic.lean:323` | `Module.Flat.lTensor_exact`: flat module, additive module groups, linear maps and an exact sequence are explicit. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` | `WeierstrassCurve.formalGroup`: reindexes the addition series to Fin 2. Its series comparison and base change are at :69 and :75. It does not construct Otop. |
| `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36` | `TopPair.HomologyPretheory`: functors, comparison and boundary data, not a category of spectra or automatic generalized Serre theory. |
| `TauCeti/AlgebraicTopology/Singular/HomologyPretheory.lean:73` | `TopPair.singularHomologyPretheory`: ordinary relative singular homology; it does not supply arbitrary spectral coefficients. |

The algebraic definitions already present are cited, not redefined in Suggested.lean. No fully qualified Lean-name collision is possible in this declaration-free file.

### Seeded sources

All five sampled targets were checked against the cached legal text, including the version's numbering, printed page, hypotheses and conclusion. No additional locator was marked unverified. ABS is the explicitly settled exception, not a new source request.

| Target | Text inspected | What the text supports |
| --- | --- | --- |
| 3.1 Generalized Serre filtration | lmmt line 398, Proposition 2.11(ii) proof, p.10; bhm line 258, Lemma 3.5, p.6 | Both use generalized homology comparison over fibers. They are applications, not a standalone construction of the entire filtered API. The roadmap supplies that construction using the named filtered-spectrum machinery; strong homological convergence is expressly supplied by StableHomotopyKTheory §7.24. The arbitrary coefficient spectrum and monodromy are retained. |
| 4.1 Nonzero raw Tate spectra | greenlees-sadofsky line 343, Corollary 2.4, p.400; hesselholt-ku line 1658, p.844; cm-tate line 118 and line 129, Theorem 2.6 and Remark 2.8, pp.3–4 | The first supplies the cyclic inverse Thom tower; the second calculates **uncompleted** KU Tate; the third distinguishes localized vanishing and nonzero raw examples. The completed-input comparison is correctly identified as a target to prove, not claimed to follow by commuting completion with Tate. The independent earlier uncompleted owner is R02. |
| 4.2 Higher semiadditivity | csy line 1632 and line 1692, Definitions 3.1.5/3.1.10, pp.33–34; line 3445, Theorem 4.3.10, pp.68–69; line 3639 and line 3655, Lemma 5.1.7/Corollary 5.1.9, pp.73–74; line 3882, Theorem 5.3.1, p.79; line 3923, line 3930 and line 3970, pp.80–81 | Weak ambidexterity precedes the norm. The bootstrap uses the map of endomorphism rings of monoidal units and rational nonzero dimensions. The dimension calculation uses a two-periodic residue theory. The fiber theorem requires π-finite n-connected fibers. Height zero is rational here, not global S[1/p]-localization. |
| 5.1 Real Bott coefficients | lmmt line 876–879, Corollary 4.19 and its proof, p.21; abs, Theorems 6.9/11.5, pp.15–16,28–29, uncertified | The proof explicitly gives ko→KO and A→A[β⁻¹] as T(n)-equivalences for n≥1. Its K-theory conclusion has n≥2; the README correctly states the input-spectrum assertion. The ABS normalization was cross-checked against the suppliers rather than claimed to have been read. |
| 6.1 Full-level Galois extensions | mm line 1757, Definitions 7.3–7.4, p.37; line 1776, Example 7.5, p.37; line 1801, Theorem 7.6, p.38 | Every positive level is included; GL₂ acts on full bases without fixing the pairing. The level cover is a torsor of stacks, a scheme for N≥3, and the section extension is faithful Galois. Small levels are not removed. The source's erroneous displayed torsion point is recorded under Source issues. |

Additional reopened passages: hahn line 116 and line 338–403 for the residue correction and valuation; csy line 4036–4066 for the weak-ring criterion, including infinity; bhls line 98 for all k≥0 in separation, line 2886–2913 for fixed-point trace, and line 3194–3229 for the coassembly proof; hahn-wilson line 93 for the BP-model redshift input. In particular, the trace-only argument in bhls line 2906–2913 does not use T(h+1)-acyclicity of A; that extra hypothesis is needed for the adjacent-height localization comparison. The more general trace gap is thus supported by the proof, not a dropped hypothesis.

### Adversarial values

These are finite consistency and negative-control calculations, not proofs of the future library. “Pass” means agreement on the stated instances. The 97 rows cover the conventions, supplier interfaces, retained statements/API, worked Checks and Part II boundary; independently sensitive subclaims have their own rows. Statements repeated verbatim as Checks are tested in the same row. Unrelated test classes (DVR ramification, polynomial degree, fans, etc.) do not occur as quantified carriers here.

| Statement | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| Homological suspension | ΣS in degree 1; ΣHℤ | π₁ΣS=ℤ=π₀S; π₁ΣHℤ=ℤ=π₀Hℤ | Pass |
| Symmetry and boundary degree | S¹∧S¹; triangle S→0→ΣS | Symmetry degree −1=(−1)^(1·1); δ:π₁ΣS→π₀S is id:ℤ→ℤ, lowering degree by 1 | Pass |
| Zero/cofiber conventions | id:S→S; 0→S | Cofibers 0 and S respectively | Pass |
| Reduced versus added basepoint | * and ∅ | Σ∞*=0; Σ∞_+*=S; Σ∞_+∅=0 | Pass |
| Universe and compactness convention | A countable wedge of S_(p) | Identity has infinitely many nonzero component projections; each finite-stage factorization has only finitely many | Pass; no compactness assigned to the wedge |
| Height-zero T versus K | p=2,q=3; S/q | π₀(S[1/2]∧S/3)=ℤ/3; Hℚ∧S/3=0 | Pass |
| Excluded nonprime substitute | Multiplication by 3 or 4 on ℤ/2 | 3 acts as 1; 4 acts as 0; (ℤ/4)[1/2]=0 | Pass |
| p-local bottom comparison | X=S_(p) | S[1/p]∧X=Hℚ=Hℚ∧X | Pass |
| Connected-cover index | X=K(A,2), r=2,3, A=ℤ/2 | π₂X⟨2⟩=ℤ/2; X⟨3⟩=*; τ≤2X=X | Pass |
| Connectivity of maps | K(C_p,2)→* versus BC_p→* | Fibers have π₁=0,π₂=C_p versus π₁=C_p; respectively 2-connective/1-connected and 1-connective/0-connected | Pass |
| Formal multiplicative coordinate | p=2 and p=3 | [2]=2X+X²→X²; [3]=3X+3X²+X³→X³ | Pass |
| Geometric height | Additive/multiplicative laws over 𝔽₂ | p-series 0 versus X²; heights ∞ versus 1 | Pass |
| Height on a thickening | Multiplicative law over 𝔽_p[ε]/ε² | Unique reduced field point gives X^p and height 1; ε is not a field coefficient parameter for a separate geometric height | Pass |
| Non-orientation coordinate | Coordinate change x↦2x over ℤ_(2) | Linear coefficient 2 is not a unit; inverse linear coefficient 1/2 absent | Pass |
| Periodic-generator convention | Height 1, odd p, ψ_(−1) | u↦−u, u⁻¹↦−u⁻¹, product remains 1; square of action sends u to u | Pass |
| Elliptic grading | Δ and Δ²⁴ | Weights 12 and 288; degrees 24 and 576 | Pass |
| Native formal-group carrier | Zero series and 𝔾ₘ | Zero series fails the required linear coefficient 1; 𝔾ₘ has both linear coefficients 1 | Pass |
| Native point carrier | Series X and constant 1 over ℤ | X has substitution condition; constant 1 is not nilpotent and fails it | Pass |
| Ordinary isLocal predicate | Identity morphism; empty object property | Precomposition by id is identity; empty property's condition is vacuous | Pass; no spectral reflector inferred |
| Localization flatness input | ℤ→ℤ[1/2], sequence ℤ ×2→ℤ→ℤ/2 | Tensor gives ℤ[1/2] ×2→ℤ[1/2]→0; image is all and kernel of last map is all | Pass |
| Weierstrass law base change | Identity ring map; reduction mod p | Identity leaves every coefficient fixed; reduction sends each coefficient to its residue on both sides | Pass |
| Fiberwise Kan extension | Identity X→X; two-point set→* | Fibers are * and two points; colimits D_x and D₁⊕D₂ on both descriptions | Pass |
| Weak-ring unit law | R=0,Hℚ; zero multiplication on Hℚ | 0=id_0; ordinary rational multiplication has μ(1⊗x)=x; zero multiplication sends 1 to 0≠1 | Pass |
| Weak-ring criterion at n=0 | R=Hℚ, F(1)=S/p | F(1)⊗R=0; reduced rational BC_p homology=0; every K(j)⊗R for j>0 including infinity=0 | Pass |
| Infinity endpoint of criterion | R=H𝔽_p | All finite positive K(j) smashes vanish; K(∞) smash is nonzero; H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p | Pass; omitting infinity gives false positive |
| Weak-ring finite-Postnikov formulation | Hℚ and f:BC_p→* at n=0 | τ≤0f is *→*; rational homology map ℚ→ℚ is identity | Pass |
| p-local finite duality | S_(p), S/p | D(S_(p))=S_(p); D(S/p)=Σ⁻¹S/p; biduals recover the inputs | Pass |
| Dual target must be p-local | V=S_(p), X=Hℤ | π₀F(V,X)=Hom(ℤ_(p),ℤ)=0; π₀(DV⊗X)=ℤ_(p)≠0 | Pass negative control |
| Spectral-module gap | Affine chart, zero module and unit module | Sections/base change give 0 and the coefficient ring respectively; unit tensor M=M | Consistent conditional contract |
| Stable James gap | W=*,S²,S⁰ | Reduced splitting is 0 or ∨_(r≥1)S^(2r); for S⁰, π₀J=ℕ but π₀ΩS¹=ℤ | Pass; disconnected input excluded |
| Truncation/fiber transport | Identity map; reflection of S¹ | Identity fiber=*; reflection acts by −1 on H₁, not +1 | Pass |
| Finite-local kernel | S/p at n=0; S/3 at p=2 | p-inversion kills S/p; S[1/2] retains S/3 whereas rationalization kills it | Pass |
| Bousfield order | E=0,F=S | Every S-acyclic is 0-acyclic, so ⟨0⟩≤⟨S⟩; reverse fails on S | Pass |
| Basic localization examples | L_0S,L_SS,L_HℚS | 0,S,Hℚ respectively | Pass |
| p-local compact sphere | Homotopy π₀S_(p); q≠p on S/p | ℤ_(p); scalar q mod p is a unit, giving invertibility | Pass |
| BP versus MU | p=3, degree 2 | π₂BP=0; π₂MU_(3)=ℤ_(3); degree(v₁)=4 | Pass |
| Hazewinkel degrees | p=2,3 and i=0,1 | degree(v₀)=0 both; degree(v₁)=2,4 | Pass |
| Morava endpoints and periods | K(0), K(1) at 2, H𝔽₂ | π₂ values 0,𝔽₂,0; π₀ values ℚ,𝔽₂,𝔽₂ | Pass |
| Coefficient cofibers | BP⟨1⟩/v₁; k(1)/v₁; Hℤ_(p)/p | π₀=ℤ_(p),𝔽_p,𝔽_p respectively | Pass |
| Orthogonal supports | K(0)∧K(1) | 0; rationalization of a p-torsion periodic coefficient theory is 0 | Pass |
| Type and smash | S_(p),S/p,0 | Types 0,1,∞; max(0,1)=1 and max(1,∞)=∞ match smashes | Pass |
| Unit nilpotence | R=0 and H𝔽_p | Unit powers are 0 in zero ring; 1^m=1≠0 in 𝔽_p for m≥1 | Pass |
| Thick generation | S_(p),S/p,0 | Generated categories C₀,C₁,{0}; rational detection is nonzero,0,0 | Pass |
| Wrong periodic map | Multiplication by p on S/p | On K(1)_*(S/p), scalar p=0; identity is nonzero | Pass; p-map not v₁ |
| Powers and degrees | v and v², degree(v)=d | v² has degree 2d; powers (2,1) give the same map and degree | Pass |
| Asymptotic sign | Interchange sign −1 | (−1)²=1; first power remains −1 | Pass |
| Bousfield–Kuhn supplied comparison | Ω∞T(n) | Φ_nΩ∞T(n)=L_T(n)T(n)≠0; zero functor would give 0 | Pass |
| Honda residue and valuation | p=2,h=1 | d=4−2=2; residue k=𝔽₄; val(z)=1/2; (p−1)/d=1/2=p^(−h) | Pass; previous R02 repaired |
| Honda residue and valuation | p=3,h=1; excluded h=0 | d=9−3=6; residue 𝔽₉; values 1/6,1/3; h=0 would give P valuation 1, no strict decrease | Pass |
| Part II witness and index | p=2,n=2,k=0; zero candidate | BHLS height parameter is h=1; witness satisfies L_T(2)X=X but X→L_K(2)X not equivalence; zero gives 0→0 and cannot witness | Source-backed existence; zero negative control |
| Fixed-point trace input | BP⟨1⟩ with Adams ℤ-action on π₀ | H¹(ℤ;ℤ₂)=coker(0)=ℤ₂=π₋₁B^hℤ, so the ring is not connective | Pass |
| Purity on T(n)-acyclic rings | C=Hℤ_p,n=2 | L_(T(1)∨T(2))C=0=L_T(1)C; L_T(2)K(C)=0 | Pass |
| Purity hypothesis negative control | C=E₂ | π₀E₂=W(𝔽_(p²))[[u₁]]; π₀L_T(1)E₂ is p-completed W(𝔽_(p²))((u₁)); u₁ becomes invertible only in latter | Pass; C not T(2)-acyclic |
| fp-type of the BP model | p=2,h=1,U=S/(2,v₁⁴) | π_*(U⊗ku₂^∧)=𝔽₂[v₁]/v₁⁴, nonzero degrees 0,2,4,6; S/2 instead gives all nonnegative even degrees | Pass; fp-type 1, not 0 |
| Coassembly direction | Trivial group; F=id | F(B^h1)→F(B)^h1 is id; for F=id and any group it is the same limit comparison | Pass; no general equivalence claimed |
| High trace/purity indexing | h=1,n=h+1=2 | Trace localization T(2); purity input T(1)∨T(2); τ≥0B^hℤ removes the nonzero π₋₁ just computed | Pass; gap needed |
| 3.1 zero/empty/point base | E=0; Y=∅; Y=* | Pages and target 0; pages and target 0; sole column E_t(F_+) equals target | Pass |
| 3.1 graded cell and differential | One s-cell; d₂ at (s,t)=(2,0) | Graded term Σ^s(E⊗F_+); d₂ target (0,1), total degree 1 versus source 2 | Pass |
| 3.1 full monodromy | Reflection mapping torus of S¹, E=Hℤ | 1−(−1)=2; ker=0,coker=ℤ/2; H₂=0,H₁=ℤ⊕ℤ/2. Trivial action gives ℤ,ℤ² | Pass |
| 3.1 arbitrary-map naturality | t↦t/2 on I with endpoint vertices | Image of {0,1} is {0,1/2}, not filtration 0; induced H₀ map is id:ℤ→ℤ, matching cellular replacement | Pass; filtered naturality restricted correctly |
| 3.1 periodic infinite base | E=KU, identity fibration of ℂP∞ | E² has ℤ for s≥0 even,t even, else 0; all d_r=0 by parity; associated graded in each even total degree is one ℤ for each even s≥0 | Pass; exhaustive direct-limit filtration, not cohomological completion |
| 3.1 excluded convergence shortcut | Constant nonzero filtration in all integers | Associated graded=0; colimit=S has π₀=ℤ | Pass negative control; bounded-below hypothesis indispensable |
| 4.1 Euler inversion at 2 | Trivial action on KU₂^∧ | ((1+z)²−1)/z=2+z; z=−2; ℤ₂[z]/(z+2)[1/z]=ℚ₂≠0 | Pass |
| 4.1 Euler inversion at 3 | Trivial action on KU₃^∧ | Quotient polynomial z²+3z+3, degree 2 Eisenstein; inverted quotient ℚ₃(ζ₃), dimension 2 over ℚ₃ | Pass |
| 4.1 raw versus localized Tate | Completed KU at p=2,3 | Raw π₀=ℚ₂,ℚ₃(ζ₃); T(1)-localized spectra 0 in both cases | Pass |
| 4.1 comparison with uncompleted KU | p=2,3 | Earlier §7.2 gives same two fields; completion cofiber has even groups ℤ_p/ℤ, uniquely p-divisible, hence zero C_p Tate | Pass; add owner citation R02 |
| 4.1 locality prerequisite | KU_(p), Moore tower S/p^i | Even coefficients limit ℤ_p; odd coefficients 0; result KU_p^∧=L_K(1)KU_(p) | Pass |
| Sphere/Hℤ Tate contrast | Trivial C₂ | Sphere π₀=ℤ₂,π₋₂=0; Hℤ Tate π₀=ℤ/2,π₋₂=ℤ/2 | Pass |
| Weak norm base cases | q equivalence; empty and two-point fibers | Norm id; 0→0; biproduct map X⊕Y→X×Y is identity matrix | Pass |
| Higher-norm obstruction | B²C_p→* in Sp and Sp_(p) | Diagonal BC_p norm on π₀H𝔽_p is p=0, with nonzero Tate groups in every degree | Pass; weak 2-ambidexterity fails |
| Rational higher semiadditivity | C_p on Hℚ; finite set of size 2 | Norm multiplication p is invertible; set norm is 2×2 identity; cardinality BC_p=1/p and two-point set=2 | Pass |
| Global T(0) exception | p=2,q=3,H𝔽₃ | 2 acts invertibly, so object is S[1/2]-local; C₃ norm on π₀ is 3=0 | Pass; not 1-semiadditive |
| Positive-height semiadditivity | n=1, trivial C_p on KU_p^∧ | Localized Tate=0, so localized norm has zero cofiber; raw Tate remains nonzero | Pass |
| Cardinality versus dimension | p=2,n=2,k=1,2 | Dimensions 4,2; cardinalities in E₂ are 2,1; products with preceding cardinality give 4,2 | Pass; notions not conflated |
| Cardinality invertibility range | p=2,n=2,k=2,3 versus k=1 | Images of cardinalities 1,1 versus 2 in π₀E₂; first two units, last nonunit | Pass |
| Dimension rank formula | p=2,n=1,2; r=0,1,2,3 | n=1 ranks (2,2,1,1); n=2 ranks (2,4,2,1); p^(binom(n,r)) gives same values | Pass, including r>n |
| Corrected residue criterion | X=S²,p=2,n=2 and p=3,n=1 | κ₀=k²,κ₁=0; module E_n⊕Σ²E_n has dimension 2. Period-six/four K(n)₀ has dimension 1 | Pass; wrong-period model excluded |
| Dimension zero/odd cases | X=*,∅,S¹ | κ degree-(0,1) ranks (1,0),(0,0),(1,1); categorical dimensions 1,0,0 | Pass; S¹ excluded by evenness |
| Bootstrap rational dimension input | E_n functor, p=2,n=2,r=0,1,2 | Images of dimensions 2,4,2 in characteristic-zero π₀E₂, all rational nonzero | Pass; zero image cannot meet the premise |
| π-finite fiber comparison | n=1,K(C_p,2)→*; identity map | Residue rank 1, reduced rank 0; localized map is unit→unit. Identity fiber=* gives same identity | Pass |
| Connectivity negative control | n=1,BC_p→* | Unreduced K(1) rank p versus target rank 1; reduced rank p−1≠0 | Pass; cannot weaken to 0-connected fibers |
| General finite-local corollary | L=0; L=L₀^f,n=0,f:BC_p→* | First 0→0; second rational ℚ→ℚ, identity | Pass |
| 5.1 ko→KO positive heights | n=1,2; bounded-above cover fiber | Periodic colimit of bounded-above fiber groups=0; T(n)-localized fiber=0 | Pass |
| 5.1 all associative ko-algebras | A=0 and A=KO | Inversions 0 and KO; maps 0→0 and id | Pass |
| 5.1 excluded rational case | A=ko,n=0,degree −8 | π₋₈(ko⊗Hℚ)=0 versus π₋₈(KO⊗Hℚ)=ℚ | Pass negative control |
| Real coefficient/complexification normalization | α,β with c(α)=2b²,c(β)=b⁴ | c(α²)=4b⁴=c(4β); incorrect α²=β gives 4b⁴≠b⁴ | Pass |
| Real additive table | ko degrees 0,1,2,3 and KO degree 8 | ℤ,ℤ/2,ℤ/2,0 and ℤβ; complex ku instead has degree-1 group 0 | Pass |
| 6.1 Galois definition at trivial group | A→A; A=0 | B^h1=A; B⊗_AB=A; base change=id; all become 0 for zero ring | Pass |
| 6.1 split cyclic torsor | G=C₂,B=A² | B⊗_AB=A⁴=∏_G B; fixed points A; projection detects each module | Pass |
| 6.1 nonabelian split torsor | G=S₃,B=A⁶ | B⊗_AB=A³⁶=∏_G B; fixed points A; tensor is M↦M⁶ | Pass |
| Faithfulness independent requirement | A=Hℤ,B=0 | B⊗_AA=0 while A≠0; conservativity fails | Pass |
| Full-level small cases | N=1,2,3,5 | Group orders 1,6,48,480; N=1 extension id; −1 fixes every 2-torsion point at N=2 | Pass; stack retained |
| Prime-to-level condition | N=3 in characteristic 2; N=2 in characteristic 2 | 3=1 is a unit in 𝔽₂; 2=0 is not, so latter base has no such field point | Pass |
| Right base action/left section action | Upper/lower unipotents g,h over 𝔽₃ | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]]; row outputs (2P+Q,P+Q) and (P+Q,P+2Q) | Pass; pullback reverses composition |
| Determinant components | diag(−1,1) at N=3 | Pairing ζ↦ζ⁻¹≠ζ; GL₂ order 48 versus SL₂ order 24 | Pass |
| Supersingular convention comparison | p=2 and p=3 | Extended automorphism orders 24·2=48 and 12·2=24 respectively | Pass |
| R01 gap locators | h=1 in fixed-point and BP contracts | Mathematical height h+1=2 unchanged; section strings KII.5/KII.6 do not equal existing headings §5.2/§6.5 | Locator mismatch only; repair R01 |

### Supplier and ownership audit

I read GeneralizedCohomology and BordismFormalGroups on main as the two shape/context examples, then resolved the 12 named roadmap suppliers below. Existing main roadmaps were read on main, rather than importing proposed revisions to them. Supplied new-roadmap heads were read directly or through `roadmaps show`. Object searches used `roadmaps grep`, the main tree, the board packages and the supplied open work; the open-work audit was performed. The citation resolver reported no missing cross-roadmap references. Its library-name pass was unavailable, so I checked those names directly in the pinned packages.

| Supplier | Resolved sections and ownership boundary |
| --- | --- |
| GeneralizedCohomology | `TauCetiRoadmap/GeneralizedCohomology/README.md:533`, G2.10, constructs arbitrary-parameter Hurewicz lifting and its Serre comparison; G3.4 at :717, G3.7 at :773, G3.8 at :785 and G3.9 at :878 supply telescope/continuity/cover/completion comparisons. G4.5 gives orientations. G5.1 at :1512 supplies integral finite duality; G5.4 at :1559, with ko/ku and inversion at :1652–1662, supplies the actual rings and units. The p-local compact-generation extension remains a declared contract. |
| BordismFormalGroups | `TauCetiRoadmap/BordismFormalGroups/README.md:299` and :305 give the all-prime BP/ku splitting with its Bott action; F1–F3/F5 give the oriented coefficients, regular cofibers, p-series and deformation theory. F6.1–F6.4 give the localization, type, periodicity and finite localization interfaces consumed here. F6.5's Kan formula is at :2105, finite-action/Tate API at :2395–2439, Morava completion at :2530 and Landweber locality at :2555. Generic higher π-finite norms and the weak-ring criterion are the declared extension, not an undocumented claim about today's finite-group subsection. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:211` and :242, E0.4–E0.5, correctly distinguish the supplied stable/space-indexed framework; E5:abstract.4 at :1512 gives stable monoidal structures, and E5:presentability.1 at :1597 gives compact objects/Ind comparison. Ordinary derived modules on a ringed site do not by themselves supply spectral QCoh; the latter has an explicit gap. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:572`–:608, §§2.4–2.7, give boundary, pointed-set π₁ action and transport. §3.18 at :1209 and §3.21 at :1246 supply Postnikov convergence and twisted obstructions. §§7.21–7.27 at :2593–2694 give the filtered machinery; §7.24 at :2660 explicitly allows unbounded coefficient spectra for exhaustive bounded-below homological filtrations. §7.26's complete-tower obstruction is different. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:499`, :849 and :1602 identify Stages 4,5,8. Cellular approximation appears at :639; twisted ordinary coefficients and fibration inputs retain their ordinary-topological ownership. The retained §3.1 adds spectrum-valued fibers and the generalized filtration, rather than rebuilding ordinary Serre theory. |
| HomotopySpheres | `TauCetiRoadmap/HomotopySpheres/README.md:661`, :817 and :1341 identify §§3A,3B,4B. Word quotients at :852–857 and connected James equivalence at :870 are distinct from the requested natural stable splitting. The all-eight-entry Bott comparison at :1425–1462 supports the real periodicity input. Raw/derived models and path-connectedness are retained. |
| TopologicalKTheory | `TauCetiRoadmap/TopologicalKTheory/README.md:1148`, T7; relations at :1245 and complexification at :1263. The supplier uses cohomological a,b,u of degrees −4,−8,−2; the roadmap uses homological α,β,b of degrees 4,8,2. Both give a²=4b and complexification values 2u²,u⁴ under that renaming. |
| EllipticCohomology | `TauCetiRoadmap/EllipticCohomology/README.md:557`, E2 item 2, realizes heights 1,2 over a specified perfect residue field; E3 supplies Otop; E4 at :1478 gives the degree-576 discriminant localization; E5 supplies units/Thom refinements; E6 at :1841 supplies level sheaves and deck descent, including small-level stacks. All-height realization, spectral affineness and the three named Galois/supersingular contracts are inherited from GeneralAlgebraicKTheoryPartII's supplier declarations, not falsely claimed to be implemented in base E2/E6. |
| ModularCurves | `TauCetiRoadmap/ModularCurves/README.md:1043`, :1077, :1100, :1313, :1510 and :1551 resolve §§3D,4B,4C,5B,7E,7F. The row action at :161–178 agrees with the noncommuting-matrix test. §5B requires N≥3 for schemes; EllipticCohomology supplies the small-level stack problem instead. |
| RefinedTraceMethods | `TauCetiRoadmap/RefinedTraceMethods/README.md:646`, :853, :879, :1825 and :1948 resolve §§2.6,2.9,2.10,4.9,4.11 for THH, TC, categorical K and trace. §6.8 at :2860, especially :2872–2883, supplies L_K(1)X=(L_KU X)_p^∧ and the distinction between K(1)-locality and completion. It is no longer cited for the sphere Segal theorem. |
| StableHomotopyKTheoryPartII | `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:336` gives §2.7's finite-type Segal theorem; S meets its boundedness and mod-p finite-type hypotheses. §7.2 at :878–896 supplies the uncompleted KU calculation; completion of the input is the retained distinction here, with the missing owner citation recorded in R02. |
| GeneralAlgebraicKTheoryPartII | `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:678`–:1272 contain all the cited §§4.2–4.33. I compared their actual statements: periodic and finite-local conventions, Bousfield–Kuhn, fiberwise comparison, sharp connectivity, restricted localization comparison, Tate, Hahn and Thom inputs have the stated owners. §4.20 at :1005 only supplies height-one equality, not Part II's separation. §§5.2,5.5,6.5 at :1536,:1598,:1733 supply high trace, purity and general redshift. The stronger fixed-point and BP-model requirements remain gaps. |

The remaining scope is distinguished by object: ordinary Serre and unfiltered fiberwise comparison do not construct the retained spectral filtration; finite-group Tate vanishing does not give all higher semiadditivity; the completed KU input is distinguished from the uncompleted calculation; coefficient Bott periodicity is distinguished from telescopic inversion for arbitrary ko-algebras; the full-level theorem extends a supplied level-three instance. The independent separation target is not asserted by GeneralAlgebraicKTheoryPartII §4.20. No ownership move or additional merge-order edge was required by this review.

The ko-algebra K-theory consequence in GeneralAlgebraicKTheoryPartII §8.6 (`README.md:2054`) was also checked: its asserted conclusion is about K(A) at heights ≥2, while the retained statement here concerns A itself at every positive height. These are compatible; the earlier proof uses connective-cover invariance and base change already supplied by GeneralizedCohomology and §4.3, so it does not require an upward citation to this roadmap.

### Declared contracts and shape

All six plan slugs occur under Exact supplier contracts with the named supplier and the same substantive needs sentence:

| Gap | README location | Precision/minimality check |
| --- | --- | --- |
| p-local-finite-duality | :71 | Specifies every prime, compact/retract identification, filtered generation and p-local targets. Integral finite duality is already imported; its p-local category comparison is the additional interface. |
| spectral-ringed-sites | :93 | Specifies an algebraic stack, an étale E∞-ring sheaf and the spectral QCoh/base-change/descent/adjunction package. Ordinary ringed-site derived modules are not passed off as this package. |
| stable-james-splitting | :107 | Specifies a path-connected pointed CW input, the reduced r≥1 wedge and filtration compatibility. The supplier's word quotients alone do not assert this splitting. The same owner contract is consumed by GeneralAlgebraicKTheoryPartII. |
| weak-ring-finite-postnikov | :79 | Gives the actual left-unit law, nonzero p-local input, every finite n≥0, all three equivalent tests including infinity, and the equivalent π-finite map condition. These are equivalent formulations of one theorem, not unrelated requests. The independent higher-norm construction is explicit. |
| bhls-purity-comparison | :155 | Specifies connective E₁ input with a coherent ℤ-action, the possibly −1-connective fixed points, height h+1≥2 and naturality. This strengthens the existing connective trace input exactly where needed. R01 concerns only the section metadata. |
| bhls-bp-redshift | :157 | Specifies the one BP model, its fp-type, multiplication, action, Lichtenbaum–Quillen property and TC nonvanishing at every prime and height. These are the simultaneous properties needed of that model; the existing general E∞ redshift theorem does not supply it. R01 concerns only the section metadata. |

No gap has supplier `none`. The five additional EllipticCohomology slugs at README:117–125 match the pre-existing supplier declarations in `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:222`–:230; they are inherited ownership contracts, not silently undeclared local prerequisites. The stable-James contract is likewise shared with that earlier consumer. I did not treat absence of these extensions from a supplier's current body as a defect.

All seven layers have Examples and Dependencies. Layers 0–2 contain supplied-interface checks, not new definition targets needing a second API. The retained filtration, higher-norm/semiadditivity and spectral-Galois constructions have API prose and at least three discriminating checks; the residue-theory definition is tested on S², the point, the empty space and S¹. The raw KU calculation and Bott comparison keep their nonzero and height-zero negative controls. There is no executable algorithm, good-prime restriction, copied source passage, process narrative requiring repair, sorry data or set_option in the reviewed files. Mathematical sources remain external references.

## Not verifiable

- **abs**, Theorems 6.9 and 11.5, pp.15–16,28–29, remains the settled locator-only uncertified entry. I consulted its manifest status and did not request it again. Supplier coefficient targets and the explicit complexification calculation were checked; that is not a certification of the inaccessible ABS text.
- The cited raw-KU calculation in **hesselholt-ku** is uncompleted. Its exact text does not independently certify the completed-input comparison. The roadmap explicitly makes that comparison a proof obligation; the Euler quotient and the completion-cofiber test above support it. In particular no claim that Tate commutes with an arbitrary completion is certified or used.
- This review checks statements, interfaces, source support and concrete consistency tests. It does not supply formal proofs of the new spectral constructions or verify implementations of declared gaps. The empty Lean file establishes elaboration only. Ravenel–Wilson's rank calculation was checked where csy line 3660 quotes it, not by a fresh audit of the complete Ravenel–Wilson proof.
- No additional unavailable text was discovered in the requested sample, and no new source request or manifest edit was made.

## Source issues

- **Misprint** in hahn at Definition 4.1 and Proposition 4.3, printed p.8: the source says the Honda coefficient quotient has residue field 𝔽_p; it should be 𝔽_(p^(h+1)) for the theory fixed in §2; affects a stated result.
- **Misprint** in csy at proof of Corollary 5.3.2, printed p.80: the source says the localization from T(n)-local spectra to K(n)-local spectra is L_T(n); it should be L_K(n); affects the proof.
- **Misprint** in csy at Lemma 5.1.7, printed p.73: the source says the degree-zero dimension is over 𝔽_p also at n=0; it should use the rational coefficient field at height zero; affects a stated result.
- **Misprint** in mm at Example 7.5, printed p.37: the source says the displayed Legendre basis includes the point (0,1); it should use (1,0), which lies on the curve and is nonzero 2-torsion; affects nothing.
