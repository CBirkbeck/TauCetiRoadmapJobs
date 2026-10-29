# Port report: FaltingsFinitenessAndIsogenyTheoremsPartII

Branch: `roadmap/faltings-finiteness-and-isogeny-theorems-part-ii`.
Head commit: `5b8771012b03ecc05b1c6c634a0162afd40dc4f5`.
Base: `c994070`, with an initially empty `git status --short`.

The committed changes are confined to `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/{README.md,Suggested.lean,metadata.toml}`. The source package and its acceptance decisions are preserved. This report is the separately requested report under `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/reports/`.

## Validation

The exact final module build outcome is:

```text
Build completed successfully (8979 jobs).
```

There are exactly **2 warnings**, both `declaration uses sorry`, at `Suggested.lean` lines 47 and 68. No other warning occurs. The only Lean build command used was the requested target-specific `lake build TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII.Suggested` (including its signature-audit and final runs). No process remains running.

The exact final gate summary is:

```text
gate FaltingsFinitenessAndIsogenyTheoremsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed independent dependency check returned:

```text
depcheck: 193 roadmaps, 1201 edges, 0 problem(s)
```

The dependency check has no UPWARD or CYCLE line. No merge-order, manifest, toolchain, infrastructure or top-level roadmap-list file changed. The full gate requires a clean committed worktree: before committing, every structural counter was zero and only its `dirty` check failed. The final full-gate result above is from the committed clean tree.

## Draft pull request body

Build the quantitative continuation of Faltings finiteness and isogeny theory, from Rosati metrics and period estimates through division-order class indices, polarization-free factorization and isogeny bounds, and uniform integral Tate bounds over finitely generated characteristic-zero fields. The roadmap separates abelian, regular and reduced traces, retains every prime in the integral statements, and derives the elliptic j-height estimate from the existing sharp elliptic isogeny supplier. Its native-carrier acceptance statements are the division-order class-index bound and the geometric elliptic j-height bound.

AI-assisted port and mathematical self-review by Codex (GPT-6).

## Dependencies that are open new roadmaps

- AbelianSchemesAndArithmeticModuli: §§A3.3–A3.6, A3.9, A3.11, A4.1, A5.1–A5.4, A6.1, A6.4–A6.8, A6.10–A6.14, A6.20, A6.22 and A6.25.
- ArakelovGeometryAndAbelianHeights: §§1.1–1.6, 2.4, 2.7, 3.4–3.5, 4.4, 5.7–5.9, 6.1–6.2 and 6.5, with the six accepted extensions detailed below.
- GeometryOfNumbersAndQuadraticArithmetic: §§0.2–0.3 and 1.3.
- AutomorphicBundles: §§B4.2, B4.9, B5.1a, B5.13 in genus one, with the accepted fixed-cusp-family extension.
- FaltingsFinitenessAndIsogenyTheorems: §§R28.4.5–R28.4.6 and R28.6.7.
- EllipticCurveModularityPartII: §6.0f, quantitative-elliptic-isogeny.
- ArithmeticGaloisRepresentations: §§5.8, 6.4a and 7.6.
- NeronModelsAndSemistableAbelianVarieties: §6.0.
- InverseGaloisAndArithmeticFundamentalGroups: §§IG.2.4, IG.2.6 and the finitely generated field assembly in IG.2.8.

SuccessiveMinima, HeightsAndUnits, ClassicalArithmeticCompletion, ClassFieldTheory and RepresentationTheory/SemisimpleAlgebras were checked on main, not at revisions of existing roadmaps. PELModuli is cited only to delimit its reduced-trace ownership in Scope and ownership; no theorem or carrier is imported from it. IntegralLattices' implemented carrier is consumed from pinned Tau Ceti.

## Port changes and upstream mathematical reread

All 50 numbered subsections, every target, API list, source locator, layer dependency, worked example and the opening Summary are retained. No statement moved out of Lean: `Suggested.lean` preserves every package declaration and import; its trailing empty line was tidied. Its three declarations need no import repair or new headline. No admission of data, padding or substitute predicate was introduced. The topic remains `math.NT`, matching the main-branch metadata form.

The final reviewer pass made these changes:

1. The global product-index conclusion in §7.2 now states its exact finiteness premise: all local indices finite and all but finitely many equal to 1. Product equality and closedness are still unconditional for the stated number-field open image. Finiteness is subsequently established in §§7.4–7.7; it is no longer silently asserted as a consequence of product equality alone. The all-prime quotient ∏𝔽_ℓ gives the negative control.
2. The Hilbertianity assembly citation now includes InverseGaloisAndArithmeticFundamentalGroups §IG.2.8. That section explicitly combines the number-field, rational-function and finite-extension statements in §IG.2.4; Néron §6.0 owns the closed-point bridge. No new foundational target is assigned here.
3. The integral-form carrier is cited as pinned `TauCeti.IntegralLattice`, with the exact source and its actual fields, in place of relying only on IntegralLattices' roadmap. Mathlib's `IsZLattice` contract explicitly retains its separate discreteness argument.
4. The metric-rescaling lead from the supplied citation ledger is resolved to ArakelovGeometryAndAbelianHeights §1.3. Its degree-rescaling law is present there, although the resolver cannot find an implementation at the pins. The README cites the section in prose and retains the distinct maximal-slope consequence; no missing supplier declaration is claimed.
5. The semisimple-algebra supplier is identified by its actual main-branch subroadmap path, RepresentationTheory/SemisimpleAlgebras. Scope and ownership distinguishes PELModuli §M0.3's reduced-trace discriminant from the regular-trace determinant here, using values −1 and −16 on M₂(ℤ). The native order vocabulary is attributed to ClassicalArithmeticCompletion §§7.4 and 7.21.
6. Dimension g≥1 is explicit in §§2.11 and 4.4, matching their positive-dimensional source setting. Section 2.9 says “squared Rosati lengths” to distinguish q from its square-root norm.
7. The jet API has its definition locator, bost95 §5.2, p. 136. Separate Checks distinguish the value condition at jet order zero from positive-order derivatives. Section 1.8 gains the zero-endomorphism coordinate Check. Section 3.1 gains the square-zero-ring Gram matrix diag(2,0), determinant 0, and the empty-basis determinant 1 for the zero ring. The nondegeneracy and division hypotheses exclude these from the corresponding theorems.
8. The nine supplier extensions are presented as mathematical contracts, without design-gap identifiers or process wording. Their quantifiers and mathematical content are unchanged; typographical spacing and the arithmetic-degree notation were corrected.

The final README was read in full against its own conventions, targets, Checks and Examples. No claim was weakened to avoid exceptional primes, bad reduction, nonprincipal polarization, odd division-algebra index or an arbitrary field extension.

## Elaborated signatures and headline coverage

A scratch copy of the acceptance file appended `#check @name` for every declaration. It was elaborated once through the permitted target build by temporarily using that exact scratch source as the target; the acceptance file was then restored and rebuilt. The resulting signatures were compared with the README and the supplied signature ledger.

| Declaration | Elaborated hypotheses compared with the README | Outcome |
| --- | --- | --- |
| `regularOrderDiscriminant` | Arbitrary universe, Ring D, Subring O, finite basis over ℤ; semisimplicity is not needed by the determinant definition | No dropped binder; unchanged |
| `class_index_bound` | DivisionRing, central ℚ-algebra structure, finite rational dimension, full order span, integral basis, e>0, O-stable M, Module.Finite ℤ M and full rational span; injectivity and nonzero finite index in conclusion | No dropped binder; matches §3.5; unchanged |
| `elliptic_isogeny_j_height_bound` | Positive absolute C before the number field and curves; NumberField, both ellipticity instances, geometric isogeny hypothesis; geometric degree and source j-height; D=1 included | No dropped binder; matches §6.1; unchanged |

Both statable headlines remain. The period, short-End and endomorphism-discriminant estimates need the polarized complex realization and stable-height interfaces. The other quantitative abelian isogeny/factorization estimates need stable height and abelian degree. The adelic and finitely generated Tate headlines need abelian Tate modules and their geometric-End actions. These are identified individually in the module docstring; searching the pinned abelian-variety modules confirmed that the ordinary abelian carrier, Hom, End and isogeny predicate alone do not supply those interfaces. No free predicate, abstract matrix replacement or weakened headline is used instead.

## Supplier verification and duplication sweep

The dependency pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; the actual package HEADs equal the manifest entries. Declaration searches were performed in those source trees. Key native definitions were read, including their fields and hypotheses:

- `Mathlib/Algebra/Module/Lattice.lean:67`: `fg` and `span_eq_top`; no bilinear form or positivity is included.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:433`: the class's field is `span_top`; discreteness is an instance argument.
- `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`: `carrier`, `form`, `isLattice`, `isSymm`, `le_dual`; neither positivity nor nondegeneracy is a field.
- `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`: `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`; represented polarizations, stable height and Tate modules are not fields.
- `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`: native End is `Additive (A ⟶ A)`.
- `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61`: finite and surjective underlying scheme morphism.
- `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`: coordinate pullback and `mapsInfinity`; positive finite function-field degree is supplied by the separate degree development.
- `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:94`: degree is the function-field finrank, including inseparability; this is the imported module used by the acceptance theorem.
- `Mathlib/RingTheory/Discriminant.lean:67`: `Algebra.discr` requires commutative rings; it does not replace the noncommutative determinant of §3.1.
- `Mathlib/NumberTheory/Height/NumberField.lean:145`: the logarithmic absolute height has junk value zero for a transcendental element, which the NumberField binder excludes.
- `Mathlib/Analysis/Matrix/Normed.lean:657`, `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244`, `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`, `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:260` and line 293 supply the cited Frobenius, decomposition, Gram and image double-centralizer results with finite-dimensional/discrete/semisimple hypotheses retained.
- `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:164`, line 184, line 189 and line 329; `ZHat/Component.lean:70`, line 121 and line 136; and `TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114` supply exactly the stated ring/product, component and bounded-index-open-subgroup interfaces. Compactness and finite topological generation remain hypotheses.

Cross-roadmap sections were opened on main or at the indexed heads of new-roadmap submissions, as appropriate. The final citation resolver reports no missing cross-roadmap citations and no missing Lean names. Its environment reports no pinned Lake source tree, so its library-name check was supplemented by the direct pinned-source audit above rather than interpreted as certification of those names.

The required `roadmaps list`, `roadmaps grep` and `roadmaps show` commands were used. Searches by object covered main, the 419 indexed open heads, the supplied sibling checkouts, and the board packages: Rosati metrics and trace forms; regular versus reduced order discriminants; finite order lattices, class indices and norm bodies; Hom cross-discriminants; period subvarieties, short End spanning and principalization; polynomial and sharp elliptic isogeny bounds; residual and integral Tate algebras; specialization and supported connected products. Broad searches were followed by narrower literal searches and by reading the relevant owners. Revisions of existing roadmaps were not used as supplier contracts. No declaration receives another roadmap's fully qualified name; the three local names have no collision in readable roadmap modules.

No new duplicate theorem was deleted during this port. The package already imports, rather than restates, Rosati positivity, degree homogeneity, Gram/covolume identity, the bounded integral basis, qualitative reducibility, the sharp elliptic stable-height theorem and the number-field Tate theorem. These ownership decisions remain confined to Scope and ownership; their consumed interfaces are specified in the supplier contracts. The new explicit replacements are the pinned integral-lattice carrier and section-based degree rescaling. The regular discriminant, class-index estimate, j-height consequence and finitely generated extension remain owned here because the nearby owners cover respectively reduced trace, generic orders, the sharp stable-height estimate and the qualitative number-field case, rather than these targets. No notion moved from a later supplier into this roadmap.

Web searches for relevant Mathlib proposals and Lean Zulip discussions identified no concrete competing Rosati, quantitative class-index or Faltings-height API. This is search evidence, not a claim that no such work exists. No code was copied from an external formalization, and no upstream contribution or coordination message was sent.

## Accepted supplier extensions and source limits

The accepted review has zero findings and explicitly retains nine mathematical extensions. Their substance is preserved:

- AbelianSchemesAndArithmeticModuli: geometric Hom specialization has torsion-free cokernel, compatibly with finite étale torsion realizations.
- ArakelovGeometryAndAbelianHeights: maximal-slope attainment/base extension/vector-height inequality; symmetric-power bound for quotient Hermitian norms; nonzero-morphism slope inequality; squared-metric rescaling of maximal slope; semistable tangent metric and its extension compatibility; symmetric ample cubist models and L² section lattices beyond the principal case.
- ClassFieldTheory: cyclic maximal subfield and cyclic presentation of every number-field central division algebra, including odd index.
- AutomorphicBundles: fixed common-weight rational cusp family, no common zero, and weak-region exponential decay.

These remain explicit supplier contracts, not assertions that the pinned libraries already prove them. The acceptance condition on their fulfilment remains unchanged. The obsolete design records mentioned by older reports are not part of the port and were not edited.

Source verification read the accessible primary PDFs and retained all exact locators. In particular: mw95 line 164 fixes e/2, and mw95 line 688 retains polynomial field-degree dependence; mz20 line 788 requires realification and mz20 line 893 the off-diagonal construction; bost95 line 381 covers nonreduced multiplicities, bost95 line 598 the interpolation inequalities and bost95 line 423 the cubist section-degree formula; gr14 line 177 gives the sharp elliptic constants; ry25 line 456 and ry25 line 602 separate the full-image and supported-image bounds; noot95 line 164 uses the finitely generated-field Tate comparison. Rendered PDF pages were inspected for the class-index exponent, multiplicity estimate, jet/interpolation formulas and sharp elliptic theorem where text extraction loses symbols. These are source-page locators, not new copied passages.

Ownership is certified for the readable local packages, supplied sibling folders and indexed open heads searched here. Separate unreadable board heads noted in the accepted review are not represented as independently inspected in this port.

The four settled source-access limitations remain: mw93-periods and mw95-refine were accepted with source-access waivers; igusa Lemma 20, p. 104, and fw84 Chapter VI §3 remain uncertified primary locators. Accessible restatements and their uses were read; those do not constitute reading the inaccessible proofs. Bost's explicit good-reduction cubist formula and indication of the arbitrary-reduction extension do not replace the accepted general-model supplier contract. The source manifest is unchanged and is not copied into the target folder.

There is no unresolved port, build, name-resolution, binder or dependency-order failure. The mathematical supplier extensions and these source-access limits are the accepted conditions that the worker should retain in its submission context. No suspicious instruction to run foreign code, expose credentials, alter unrelated files or contact another service was found in the package or the mathematical sources.

## Adversarial mathematics pass

These are independently recomputed witnesses and negative controls, not proofs of the general results. Constants with unspecified dimension dependence are tested by necessary lower bounds, without inventing numerical values for them. Rows cover the conventions, supplier laws, each numbered target, embedded targets, and the individual laws of the defined objects. Repeated Examples and the two worked examples have the same values as the corresponding rows. Number-field hypotheses exclude zero rings, characteristic p, inseparable extensions and arbitrary DVRs; the class-index theorem additionally requires a division algebra. The determinant definition itself has no division hypothesis.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Composition convention | Matrix units on E² | e₁₂e₂₁=e₁₁; reversed product=e₂₂ | Order of composition distinguished | None |
| Ground field versus coefficients | Gaussian CM E over ℚ and ℚ(i) | End ranks 1 and 2; tensoring rank-1 End with ℚ still has rank 1 | Field extension differs from coefficients | None |
| Height clamp | Formal h_F=−1, D=1 | H=max(1,1,−1)=1, not −1 | Negative heights admitted | None |
| Constant quantifiers | Identity on every g | Degree 1; H≥1, so C_g≥1 suffices | Constant precedes A,k | None |
| Principalization normalization | Elliptic line of degree 2 | χ=2; polarization degree=4; quotient degree=2 | Square root fixed | None |
| Zarhin dimension | g=1 | dim((E×E∨)⁴)=8 | Dimension multiplier 8 | None |
| Zarhin height | Formal h_F(E)=−1 | 4(−1−1)=−8=8h_F(E) | Additivity retains negative heights | None |
| Abelian trace | Non-CM E; E² | Tr_A(1)=2; 4 | Equals 2g | None |
| Regular trace | ℚ; M₂(ℚ) | tr(1)=1; 4 | Equals rational algebra dimension | None |
| Reduced trace distinction | M₂(ℚ) | Tr_reg(1)=4; Trd(1)=2; discriminants −16 and −1 | Distinct invariants | Ownership clause added |
| Riemann-form sign | Gaussian periods | E(i,1)=1; E(1,i)=−1 | Alternating sign distinguished | None |
| Realification | Gaussian i | 2 Re(i·conj(i))=2; unconjugated value=−2; missing factor gives 1 | Conjugation and factor 2 necessary | None |
| Signed versus positive discriminants | ℤ[i] | regular −4; Rosati 4; self-Hom 16 | All three distinct | None |
| Degree in dimension zero | Trivial variety | Empty determinant=1; trace=0; degree=1, also for zero map | Positive-dimensional zero-map rule excluded | None |
| Positive-dimensional degree at zero | E and E² | Degree 0; determinant 0 | No division by zero in §1.6, g≥1 | None |
| Native index convention | 0⊂0; 0⊂ℤ | Indices 1 and 0 respectively | Nonzero guard excludes infinite quotient | None |
| Native integral lattice | Form zero on ℤ; form (2) on ℤ | First determinant 0, second 2; both carriers full | Native carrier does not require nondegeneracy or positivity | Pinned supplier recorded |
| Native IsZLattice | ℤ⊂ℝ; ℤ×0⊂ℝ² | Span dimensions 1 and 1 versus ambient 1 and 2 | Full-span/discrete arguments retained | Contract made explicit |
| Strict Minkowski supply | ℤ, open interval (−1,1) | Length 2=2·covol; no nonzero integral point | Strict volume inequality indispensable | None |
| Gram–Hadamard supply | Columns (2,0),(0,3); (1,0),(1,1) | det Gram 36=4·9; 1<1·2 | Equality and strict case | None |
| Upper Minkowski product | 2ℤ×3ℤ; box widths 4,2 | λ=(1,3), vol=8, covol=6; 24=4·6 | Real minima, not squared minima | None |
| Coordinate volume transport | Same lattice in basis coordinates | vol=4/3; product=3·4/3=4; ambient product=24 | Determinant direction fixed | None |
| Minimum-flag supply | Standard flag in ℤ² | Basis (e₁,2e₁+e₂): det=1, lengths 1,√5 | Flag does not bound lengths | None |
| Bounded basis supply | Euclidean ℤ² | λ₀=λ₁=1; bounds max(1,1/2)=1, max(1,2/2)=1 | Full short basis needs HeightsAndUnits | None |
| Zero-dimensional lattice conventions | Zero real space | Gram det=1, volume=1, empty minima product=1 | Compatible with Minkowski bound 1≤1 | None |
| Maximal slope attainment/vector law | Trivial Hermitian line, vector 1 | μ_max=0, −h(1)=0 | Nonzero vector and positive rank retained | Accepted contract retained |
| Normalized slope base extension | Trivial line, degree-2 extension | Degree 0→0; denominator 1→2; slope 0→0 | Normalization explicit | Accepted contract retained |
| Symmetric-power slope law | Trivial line, n=0,1,2 | μ_max=0 and n(0+2log1)=0 in all three cases | n=0 included | Accepted contract retained |
| Quotient metric on Sym² | Standard rank-2 bundle | Squared norms 1,1/2,1; μ_max=log2/2≈0.346574≤4log2≈2.772589 | Unit mixed-monomial norm gives wrong 0 | None |
| Morphism slope law | Multiplication by 2 on trivial line | h=log2+log(1/2)=0; 0≤0 | All places needed; zero map excluded | Accepted contract retained |
| Degree rescaling | Rank 2 over ℚ, norm multiplied by 1/2 | Degree 0→2log2 | Equals rD log2 | Cite supplier section, not an unimplemented name |
| Squared-metric slope rescaling | Trivial line, squared norm ×4 | μ_max 0→−log2; dual 0→+log2 | Correct sign and factor 1/2 | Accepted contract retained |
| Semistable tangent metric | Gaussian period 1, L→L⁴ | Length 1→2; dual length 1→1/2 | Cotangent slope rises log2 | Accepted contract retained |
| Cubist section rank | Type (1,2) surface, n=1,4 | χ=2,32 versus principal 1,16 | Principal-only supply insufficient | Accepted extension retained |
| Cubist degree identity | Same surface, n=1 | Difference from principal normalized slope=¼log2≈0.173287 | Probability Haar and section rank fixed | None |
| Faltings/Deligne shift | g=1 | h_Del−h_F=½logπ≈0.572365 | Height normalization fixed | None |
| Cubist algebraic height | Torsion point 0 | Canonical height=0; rigidified line height=0 | Translation-invariant/cubist normalization required | None |
| Symmetrization | Type (1,2) surface | Type becomes (2,4); χ 2→8; intersection 4→16 | Not a principal line after symmetrizing | None |
| Cyclic maximal subfield | Index-3 division algebra | m=9, degree E/F=3, u³=a≠0; invariants 1/3 and −1/3 double to nonzero 2/3,−2/3 | Odd index not covered by quaternion theory | Accepted contract retained |
| Fixed cusp-family normalization | Value exp(−2), scalar exp(−N) | Reciprocal log 2→N+2 | Constants require fixed normalization | Accepted contract retained |
| Hilbertian field supplies | ℚ; ℚ(t); ℚ(t,√(t³+1)) | Transcendence degrees 0,1,1; final relative degree 2 | Number-field, rational-function and permanence inputs separate | Cite IG.2.8 assembly |
| Full-group specialization | Y²=T, T=2 and 1 | Fibre degree 2 in both; component counts 1 and 2; groups C₂ and trivial image | Connectedness required | None |
| Compact subgroup input | ℤ₃× and infinite product C₃ | Uniform subgroup 1+3ℤ₃ has index 2; product has infinitely many index-3 kernels | Finite-dimensional matrix hypothesis retained | None |
| Profinite ring/component supply | Coefficient 6 | Components mod2=0, mod3=0; components of 1=1 | Ring projections preserve 0,1 | None |
| Prime idempotents | Two distinct primes p,q | e_p²=e_p; e_pe_q=0; p-component 1, q-component 0 | Component assembly uses limits | None |
| Double centralizer supply | Scalars on k²; full M₂(k) | Centralizer dimensions 4 and 1; double dimensions 1 and 4 | Recovers image, including noncommutative matrix algebra | None |
| §1.1 representations | [−2] on E | ρ=−2I₂, κ=−2; both sides κP=Pρ equal −2P | Native Hom determines the maps | None |
| §1.1 multiplicativity | e₁₂,e₂₁ on E² | κ(vw)=e₁₁=κ(v)κ(w); reverse=e₂₂ | Ring homomorphism order fixed | None |
| §1.1 identity/zero/addition | E | κ(1)=1, κ(0)=0, κ(1+i)=1+i | Not zero or constant representation | None |
| §1.1 trace law | Gaussian i; identity | trρ(i)=0=2Re(i); trρ(1)=2=2Re(1) | Realification agrees | None |
| §1.1 faithfulness | 0 versus 1 on E | κ values 0 and 1; ρ values 0 and I₂ | Distinct endomorphisms distinguished | None |
| §1.1 basis transport | Gaussian rotation J, swap basis S | S⁻¹JS=−J; trace remains 0, determinant remains 1 | Basis change conjugates | None |
| §1.1 rational extension | (1/2)·1 on E | κ=1/2; ρ=(1/2)I₂ | Rational, rather than integral, coefficients | None |
| §1.2 length definition/square | 1,i,0 on Gaussian E | q=2,2,0; lengths √2,√2,0 | Distinguishes regular trace | None |
| §1.2 vanishing iff | 0 and 1 | Lengths 0 and √2 | Both directions compatible with positivity | None |
| §1.2 rational scalar law | [−2] on E | ℓ=√8=2√2 | Absolute scalar needed | None |
| §1.2 triangle law | 1,i | ℓ(1+i)=2≤2√2 | Not scalar multiplicativity | None |
| §1.2 associated pairing | Gaussian 1,i | Gram diag(2,2); cross term 0 | Matches supplied positive pairing | None |
| §1.3 Rosati determinant | ℤ and ℤ[i] | 2 and 4; rank zero 1 | Positive determinant convention | None |
| §1.3 basis independence | Gaussian basis (1,i) and (1,1+i) | Gram diag(2,2) and [[2,2],[2,4]] both det4 | Unimodular basis required | None |
| §1.3 finite-index scaling | ℤ[2i]⊂ℤ[i] | Index2; det16=2²·4 | Square of index | None |
| §1.3 covolume | Gaussian Rosati plane | Covol2; square4=Gram determinant | Canonical real volume | None |
| §1.3 principal integrality | Product-polarized non-CM E² | Four orthogonal squared lengths2; det=16≥1 | Positive integral determinant | None |
| §1.4 submultiplicativity | [2],[3] on E; shear S on E² | q(6)=72≤8·18=144; q(S²)=12≤6²=36 | No equality claimed | None |
| §1.5 oriented degree | [−2] on E | Real determinant4=degree4 | Positive real orientation | None |
| §1.5 nonisogeny degree | diag(1,0) on E² | determinant0=degree0 | Equal dimensions insufficient for isogeny | None |
| §1.5 homogeneous law | [t] on E² | det(tI₄)=t⁴, degree at t=−2 is16 | Degree 2g and rational scaling | None |
| §1.6 degree inequality | [−2] on E²; shear N=1 | 16=(16/4)²; 1≤(6/4)²=9/4 | g=0 excluded; no reverse inequality | None |
| §1.7 coordinate identity | τ=i, v=i | Rational trace2; complex realified trace2 | Sign and conjugation fixed | None |
| §1.7 bilinear identity | τ=i, v=1,w=i | 2Re(−i)=0=off-diagonal Gram entry | Uses adjoint of w | None |
| §1.8 coordinate bounds | τ=2i, κ=2i | (a,b,c,d)=(0,4,−1,0), ℓ=√8; b-scale2, c-scale1/2 | Reciprocal factors distinguished | None |
| §1.8 degenerate endomorphism | τ=i, v=0 | All blocks and upper bounds0 | No additive coordinate offset | Additional Check |
| §2.1 minimal subgroup | (η,η),(η,0),0 in E² | Dimensions1,1,0; degrees2,1,1 | Diagonal differs from whole product | None |
| §2.1 universal property | Diagonal versus E² | Tangent contains (η,η) in both; minimal dimension1 rather than2 | Smallest subgroup condition necessary | None |
| §2.1 zero law | ω=0 | dim G₀=0; normalized degree1 | Nonempty intersection condition has zero example | None |
| §2.1 isomorphism transport | Factor swap on E² | First factor maps to second; both dimension1 and degree1 | Covariant direction fixed | None |
| §2.1 degree normalization | Principal E² | χ=1; top intersection2=2!·1 | Normalized versus raw degree | None |
| §2.2 multiplicity estimate | Elliptic degree-2 line, two points | length2·degree(0)=2=degree(E) | Includes equality | None |
| §2.2 nonreduced control | Length-2 neighbourhood of 0 | length2, support cardinal1; lhs2=rhs2 | Scheme multiplicities required | None |
| §2.2 nonzero-section guard | Zero section, length3; empty S | False 3≤2 without guard; empty lhs0≤2 | Guard and g≥1 retained | None |
| §2.3 jet carrier | g=2, i=0,1,2 | lengths1,2,3; reduced-point substitute1,1,1 | Value and derivative conditions distinct | Split Checks |
| §2.3 jet translation | g=2, i=1, Q=0 versus Q=P | Both local algebras have basis1,x and length2 | Full scheme transported | None |
| §2.3 jet truncation | g=3, i=2→1 | Dimensions6→3; killed degree-2 part dimension3 | Restriction points toward lower order | None |
| §2.3 graded/cumulative lengths | g=3, i=2 | Degree-2 monomials x²,xy,y²:3; cumulative1+2+3=6 | Mixed derivative essential | None |
| §2.3 auxiliary noninjectivity | g=2,M=N=2,D=4 principal surface | Union length9+5=14, not19; H⁰ dimension16; kernel≥2 | Union, not direct sum | None |
| §2.3 nonprincipal section count | Type(1,2), same jets,D=4 | H⁰ dimension32; kernel≥18 | General symmetric ample line retained | None |
| §2.3 tangent upper bound | B=0 | h=0; log d_L(0)=0; rhs≥0 | Rank-zero convention | None |
| §2.3 subspace lower bound | F=0 | h(F)=0≥−c_g max(1,h_Del,log d_L(A)) | Rank zero does not divide by rank | None |
| §2.3 tangent scaling | Rank-b subspace,L→L⁴ | Height shift b log2; log degree shift b log4 | Signs agree with metric contract | None |
| §2.4 period estimate | Principal E, zero/nonzero ω | Both minimal normalized degrees1; RHS≥C_(1,1) | Need C≥1, not a lower period norm bound | None |
| §2.4 polarization degree | Elliptic line degree3 | Normalized degree3; map-degree9 | Source parameter correctly normalized | None |
| §2.5 cusp evaluation | Fixed abs(u)=exp(−2) | lhs2; rescaled family exp(−N) gives N+2 | Arbitrary family scaling excluded | None |
| §2.5 arithmetic theta intermediary | Same nonzero coordinate, h_Theta≤H | lhs2≤c_g D max(1,H) requires that positive upper allowance | Nonzero coordinate required; no log0 | None |
| §2.6 imaginary part | τ=it and 100+it,g=1,δ=1 | y=t in both; ct≤log M+logabs(u)⁻¹ | No real-part bound added | None |
| §2.7 short periods | B=0; independent vectors in ℤ² | Empty basis0; det((1,1),(1,−1))=−2, index2 | Generating basis stronger than independence | None |
| §2.8 short End span | Non-CM E | Generator1 has q=2 and rational span dimension1 | Does not assert integral basis | None |
| §2.8 principalization | δ=1,4,9 | Quotient degrees1,2,3; isotropic subgroup counts1,3,4 | Correct kernel sizes and direction | None |
| §2.8 height change | δ=4 | ½log√4=¼log4=½log2 | Height sign bound correct | None |
| §2.8 whole-kernel countermodel | Quotient E by E[2] | Degree4; pulled-back polarization degree16 rather than4 | Maximal isotropic subgroup essential | None |
| §2.9 End determinant bound | Non-CM E; Gaussian E | D_lambda2,4; basis squared lengths2 and2,2 | Within positive dimension constants | Clarify squared lengths |
| §2.9 geometric End extension | y²=x³−x, ℚ→ℚ(i) | End ranks1→2; determinant2→4 | Geometric and rational orders distinct | None |
| §2.10 off-diagonal bound | Swap on E² | q4, length2, sqrt(D)=4; need C₁≥1/2 | Both blocks degree1 | None |
| §2.10 diagonal countermodel | Identity on E² | Degree1; both off-diagonal degrees0 | Nonzero product degree polynomial required | None |
| §2.11 polarized isogeny | E→E identity and [2] | Minimum1, log minimum0; height variation0≤½log4 | Absorption concerns minimum degree | State g≥1 |
| §3.1 regular determinant | ℤ; Gaussian order; suborder | 1; −4; −16 | Signed trace discriminant | None |
| §3.1 trace of identity | ℚ; ℚ(i); M₂(ℚ) | 1;2;4 | Uses entire regular representation | None |
| §3.1 basis invariance | Gaussian basis(1,i)→(1,1+i) | Gram diag(2,−2)→[[2,2],[2,0]], both det−4 | Determinant multiplied by unit square1 | None |
| §3.1 index law | ℤ[2i]⊂ℤ[i] | −16=2²(−4) | Sign unchanged, square factor | None |
| §3.1 matrix realization | ℚ(i), x=i | L_i=[[0,−1],[1,0]], trace0 | Integral and rational trace agree | None |
| §3.1 nondegeneracy | M₂(ℚ), x=e₁₂,y=e₂₁ | tr_reg(xy)=tr_reg(e₁₁)=2≠0 | Explicit noncommutative test | None |
| §3.1 nonsemisimple negative control | ℤ[ε]/ε² | Gram diag(2,0); det0 | Definition allowed, nonvanishing theorem excludes it | Additional Check |
| §3.1 zero-ring definition | Empty basis | Empty matrix determinant1; zero trace0 | Division theorem does not accept this ring | Additional Check |
| §3.1 commutative supplier agreement | ℤ[i] | Native Algebra.discr and regular determinant both−4 | No second commutative theory | None |
| §3.2 class-index object | O=ℤ[2i],M=ℤ[i] | [M:αO]=2Norm(α); minimum2 | Infimum is positive integral index | None |
| §3.2 bound interpretation | Same M | b(M)=2; any I≥2 accommodates this M | Uniformity over M required | None |
| §3.2 rank-zero convention | M=0 | [0:0]=1; i₀=1 | Supremum has a nonempty rank-zero class | None |
| §3.2 equivalence invariance | M=ℤ[i],2ℤ[i] as O-modules | Multiplication by2 is equivalence; minima2 and2 | Ambient scaling does not alter index | None |
| §3.2 actual additive index | O=ℤ,M=2ℤ | [M:M]=1, despite ambient [ℤ:M]=2 | Correct ambient quotient | None |
| §3.2 opposite invariance | Hamilton i,j | ij=k, ji=−k; both regular traces0; discs−256 in both orders | Noncommutativity tested | None |
| §3.3 regular norm | ℚ; Gaussian field; Hamilton algebra | N(x)=x; x²+y²; (a²+b²+c²+d²)² | Degrees1,2,4 | None |
| §3.3 basis-normalized volume | ℚ bases1 and2 | sqrtDisc1,2; interval lengths2,1; products2=2 | Reciprocal volume factor | None |
| §3.3 coordinate unit | ℚ basis2 | Coordinate1/2 has norm1; coordinate1 has norm2 | Unit need not be coordinate1 | None |
| §3.3 algebra transport | Complex conjugation on ℚ(i) | Norm x²+y² unchanged; determinant−1; absolute Jacobian1 | p(D) unchanged | None |
| §3.3 complex real volume | ℚ(i) | Disk areaπ; sqrtDisc2; p=2π≈6.283185 | Not one-dimensional complex volume | None |
| §3.3 positivity/finiteness | ℚ norm region | Sup interval length2; p=2>0 | Open/closed boundary same limiting volume2 | None |
| §3.3 norm multiplicativity | Gaussian (1+i),(1−i) | Norms2,2; product2 has norm4=2·2 | Regular determinant is multiplicative | None |
| §3.4 norm-body lower bound | ℚ,ℚ(i),Hamilton | 2=2¹;2π≥4;8π²≈78.956835≥16 | Includes noncommutative division algebra | None |
| §3.4 odd-index reach | Index3 over ℚ | Rational dimension9; lower bound2⁹=512 | Cyclic rather than quaternion contract | None |
| §3.5 class-index headline | ℤ,e=1,2 | Index1≤1^(1/2),1^1 | Finite index cannot be native0 | None |
| §3.5 nonmaximal order | O=ℤ[2i],M=ℤ[i],e=1,2 | Least index2≤4; evident rank-2 index4≤16 | Exponent e/2 retained | None |
| §3.5 finite-generation guard | ℤ[1/2] over ℤ | Quotient by any nonzero cyclic subgroup infinite; native index0 | Excluded by Module.Finite ℤ | None |
| §3.5 right-module theorem | Hamilton/opposite | Opposite discriminant−256, same absolute bound16 at rank1 | All module ranks and sides kept | None |
| §3.6 isotypic trace relation | Non-CM E; Gaussian E; non-CM E² | 2·1=1·2; 2²·4=2²·4=16; 4⁴·16=4⁴·16=4096 | Whole regular trace required | None |
| §3.6 isotypy guard | E×A₂, nonisogenous simple End⁰=ℚ on each | Abelian traces on idempotents2,4; regular traces1,1 | Ratios differ; single proportionality fails | None |
| §4.1 cross determinant | Self non-CM E; Gaussian E | Determinants1,−4; squares1,16 | Squaring, not absolute determinant | None |
| §4.1 separate-basis invariance | Change sign of Gaussian basis1 in first Hom | Pairing determinant−4→4; square16→16 | Independent orientation irrelevant | None |
| §4.1 sublattice law | M=2ℤ,M′=3ℤ | Pairing6, c36=2²3²·1 | Both index factors squared | None |
| §4.1 self-Hom identity | Gaussian self-Hom | c16=(disc−4)² | Matches ordinary, not Rosati, discriminant | None |
| §4.1 reversal | M=2ℤ,M′=3ℤ | Both one-entry pairing matrices(6); both c36 | Map sources/targets reversed consistently | None |
| §4.2 product discriminants | M₂(ℤ),M₄(ℤ),M₂(ℤ[i]) | −16;2³²=4294967296;2¹⁶=65536 | Parity factor (−1)^m | None |
| §4.3 simple cross bound | Self non-CM E; Gaussian E | Identity degree1≤1¹;1≤16¹ | Both endomorphism types | None |
| §4.4 stable-power bound | Diagonal E⊂Eᴺ,Endℤ | Coordinate inverse degree1; i₁^(2)=1; any N | Ambient-power independence | State g≥1 |
| §4.5 polarization removal | Non-CM E | Ordinary disc1, dual cross1; Zarhin dim8 and formal height−8 | No polarization-degree factor | None |
| §4.6 stable subvariety | Diagonal A⊂A⁸; A=E×E′ | Projection degree1; dimensionsg andg; two nonisogenous multiplicities1 | Actual-product hypothesis retained | None |
| §4.7 product-dual map | E×E′ with canonical dualities | Product degree1·1=1 | Direction A→A∨ | None |
| §4.7 factor heights | Formal heights−1,2 | Sum1; largest factor2 | Lower-height input needed | None |
| §5.1 product-target isogeny | A=A*=E | Restricted identity kernel1; degree1 | E²→E projection has kernel dimension1 and no equal-dimensional degree | None |
| §5.2 simple factorization | Simple E; E² | Factor exponent1;2; minimum degree1; log1=0 | Qualitative choice does not assume quantitative theorem | None |
| §5.3 rational unpolarized bound | Identity and [2] on E | Degree1; quasi-inverse of degree4 map has degree4=4^(2−1) | Fixed dimension exponent direction correct | None |
| §5.4 relative isogeny | k=ℚ,K=ℚ̄,g=1 | Base degree1; [K:k] infinite; torsion allowance48²=2304 | Bound independent of extension degree | None |
| §5.4 relative factorization | A=E²,K=k(t) | Multiplicity2, degree1; End(E)=ℤ unchanged | Pairwise nonisogenous means one factor with exponent2 | None |
| §5.4 relative factorization at geometric endpoint | Simple E,K=k̄ | One geometrically simple factor; field allowance #GL₂(𝔽₃)=48 | Infinite extension admitted | None |
| §5.5 geometric isogeny | Non-CM E and nontrivial quadratic twist | Geometric degree1; rational Hom rank0 | Geometric conclusion cannot be made rational | None |
| §6.1 elliptic headline | D=1,j=0 | Identity degree1≤C; uncorrected D²(logD)²=0 | Degree-one correction indispensable | None |
| §6.1 imported constant | D=1,h_F=−1 | B=9702250000000≤C₀=9781210000000 | Negative heights covered | None |
| §6.1 j-height conversion | D=2,j=0,h_F<0 | Imported coarse4C₀; j-bound36C₀; C=9C₀=88030890000000 | Comparison is inequality, not equality | None |
| §6.1 log conversion | D=2 and3 | At2: max=1, log2≈0.693147; at3:max=log3≈1.098612 | C′=C/(log2)² needed for D≥2 | None |
| §7.1 finite-span carrier | Scalar action on Ẑ² | B({1}) rank1; matrix centralizer rank4; index infinite | Galois-image hypotheses not discarded | None |
| §7.1 generated-ring closure under product | GL₂ unipotents | (I+e₁₂)−I=e₁₂; e₁₂e₂₁=e₁₁ | Full matrix algebra generated | None |
| §7.1 monotonicity | {1}⊂GL₂ | Scalar algebra⊂rank-4 algebra | Correct direction | None |
| §7.1 containment in End centralizer | Scalar Endℤ | All matrix commutators with nI equal0 | Rationality of geometric End retained | None |
| §7.1 local projection | Scalar coefficient6 | Local coefficient6 at2 and3; both are lifts of one adelic6 | Coefficient surjectivity required | None |
| §7.1 scalar identity law | T=Ẑ,V={1} | Ẑ·1=Ẑ, local/global indices1 | Unital generation includes scalars | None |
| §7.1 universal property | C=scalars,V={1}; V=GL₂ | First inclusion true on both sides; second false on both sides | Both directions checked | None |
| §7.2 product equality | Rank-1 scalar algebra | Local spansℤ_ℓ; productẐ=B; closed | Finite span is not defined to be closure | None |
| §7.2 product-index condition | Orders at2,3,full elsewhere | Local indices2,3,1; global6 | Conditional product formula | Finiteness made conditional |
| §7.2 infinite-product control | Proper index-ℓ order at every ℓ | Quotient∏𝔽_ℓ infinite; no finite positive index product | Shows why almost-all-full condition is separate | None |
| §7.3 commutator/kernel | Gaussian J | ψ(f)=[[b+c,d−a],[d−a,−b−c]]; kernel rank2 | Dual row-lattice direction fixed | None |
| §7.3 saturation at2 | Same J | Rows b+c,d−a saturated; M_A=1; mod2 kernel dimension2 | Bad residue characteristic2 allowed | None |
| §7.3 exceptional-prime control | ψ:ℤ→ℤ,×2 | Integral kernel0; mod2 kernel dimension1; mod3 dimension0; M_A=2 | Surjectivity fails exactly at2 | None |
| §7.4 fixed-prime bound | Rank-1 scalar action | Every unital spanℤ_ℓ; index1 | Bound M_ℓ=1 in this case | None |
| §7.4 subgroup counting | Additive ℤ₂,d=4 | Indices1,2,4; three subgroups=1+floor(log₂4) | Compact finite generation used | None |
| §7.5 residual refinement | Non-CM elliptic full GL₂(𝔽_ℓ) | Residual commutant dimension1=End rank1 | Uniformity over bounded extensions retained | None |
| §7.5 small-prime control | Trivial action on 𝔽₂² | Commutant dimension4, versus End rank1 | Cannot delete large-prime threshold | None |
| §7.6 integral full algebra | Full residual GL₂; finite quotient Q | Residual algebra dimension4; Q/ℓQ=0 gives Q=0,index1 | Nakayama and M′ threshold retained | None |
| §7.7 number-field uniform index | Exceptional bounds4,9 | Product36; if none exceptional, product1 | All primes retained | None |
| §8.1 integral comparison | Non-CM E over ℚ(t),ℓ=2,3 | Both End lattices rank1; field transcendence degree1 | Field finite generation, not finite algebra | None |
| §8.1 rational algebraicity | Same E | Hom⊗ℚ_ℓ rank1; invariant endomorphisms rank1 | Named substantive target, not image-equality inference | None |
| §8.1 semisimplicity route | Gaussian E over ℚ(i),ℓ=5 | ℚ(i)⊗ℚ₅=ℚ₅×ℚ₅; two Tate eigenspaces of dimensions1,1 | Comparison input separated from specialization | None |
| §8.1 integral saturation | Divisibility example f=[ℓ] on E | T_ℓ(f)=ℓI₂; f kills E[ℓ], sizeℓ²; factor through[ℓ] is identity | Quotient direction f=g∘[ℓ] fixed | None |
| §8.2 preserving End | Constant non-CM E over ℚ(t) | Generic and chosen special geometric End ranks1 | Nonempty chosen-specialization example | None |
| §8.2 one-prime equality control | 2ℤ⊂ℤ atℓ₀=3 | Tensor equalityℤ₃=ℤ₃; integral quotientℤ/2≠0 | Saturation necessary | None |
| §8.2 saturation-only control | ℤ→ℤ²,(n,0) | Cokernelℤ torsion-free; ranks1 and2 | Rank comparison also necessary | None |
| §8.2 jumping-End control | Legendre λ=−1 | Generic End rank1; fibre j1728,Endℤ[i] rank2 | Arbitrary fibre does not preserve End | None |
| §8.3 supported subgroup definition | Diagonal C₂ at two primes | Projections order2 each; supported intersections order1 each | Intersection differs from projection | None |
| §8.3 component law | Supported {±I} at odd prime | Local Zariski group order2; identity component{I} | W order1, not2 | None |
| §8.3 compact product inclusion | U=∏GL_n(ℤ_p) | Each supported identity component=GL_n(ℤ_p); W=U,index1 | Full products admitted by closedness | None |
| §8.3 connected product containment | V=U=∏GL_n(ℤ_p) | V_p⊂U_p⁰ equality at every p | V⊂W direction correct | None |
| §8.3 commutation with End | Scalar geometric End | [v,nI]=0 for every factor | Requires End defined over base | None |
| §8.3 componentwise uniqueness | Trivial group, any prime ordering | Every factor1; both products1 | Empty/ordering convention consistent | None |
| §8.4 supported-image index | V⊂W,W′ index2 | [V:V∩W′]=1 if V⊂W′;2 if quotient surjective | At most2 in both cases | None |
| §8.4 trivial-group control | V={1},[W:W′]=2 | Intersection1; index1≤2 | No nonempty-generator assumption | None |
| §8.5 full-image index | W=2ℤ,U′=3ℤ inℤ | W∩U′=6ℤ; [W:6ℤ]=3=[ℤ:3ℤ] | Correct subgroup-index inequality | None |
| §8.5 algebra-index monotonicity | 6ℤ⊂3ℤ⊂ℤ | Ambient indices6→3 | Larger generated algebra decreases index | None |
| Worked example: non-CM square | E² product polarization | D_lambda16,regular disc−16; 4⁴·16=4⁴·16=4096; shear degree1,q6 | All layer formulas agree | None |
| Worked example: Gaussian comparison | ℤ[i] | disc−4,Rosati4,self-Hom16 | No invariant interchange | None |
| Worked example: adelic bound | Exceptional local4,9; diagonal C₂ | Global bound36; diagonal supported product1 | Index product and support are separate | None |


Pull request: #1738 (roadmap/faltings-finiteness-and-isogeny-theorems-part-ii at 5b87710)
