# Port: GeometryOfNumbersAndQuadraticArithmeticPartII

Branch: `roadmap/geometry-of-numbers-and-quadratic-arithmetic-part-ii`.
Head commit: `d851306d6a34498af43a6e055833ab75bea1e121`.
Base: `4d14cbd5ba21a1804ca78c9989b9ea485bcfad08`.

The initial checkout was clean at `4d14cbd`. The requested branch already existed, with this job's three-file port commit directly above that base; it was inspected and reused. The final commit touches only `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md`, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean`, and `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/metadata.toml`. The report is outside the content checkout. Nothing was pushed and no GitHub write was made.

## Validation

The final named build exited zero:

```text
Build completed successfully (8984 jobs).
```

Warning count: **3**, all reporting that a declaration uses `sorry` at the three headline theorems; zero other warnings and zero errors. The module-system `module` header avoids the extra import-compatibility warning emitted without it. No options, new definitions, admitted data, examples or additional imports were introduced.

Final push-gate summary:

```text
gate GeometryOfNumbersAndQuadraticArithmeticPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The explicit dependency-direction command, using the supplied local merge order and `--movable`, returned:

```text
depcheck: 158 roadmaps, 1092 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The push gate independently reports `depcheck=0`. The final citation resolver, explicitly pointed at the pinned Lake packages, found no unresolved cross-roadmap citations and no unresolved Lean names. Direct source reads and elaboration independently verified the pinned library declarations.

Pins checked mechanically against the manifest and dependency checkouts: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

All three declarations were copied unchanged into one scratch source with `#check @name` for each, and that source elaborated successfully. Each elaborated type was compared with README §§0.4 and 4.1: the finite field, characteristic two, specified algebra structure, both finite-dimensional spaces, independent half-dimensions, six symplectic-basis conditions, actual quadratic vanishing and dimension equality all survive; the coordinate theorem retains the additive equivalence and all three quantified coordinates; the multiplication theorem retains its exact native Witt classes and least-representative coefficients. **No binder was lost and no mathematical signature changed.** The scratch file uses the declarations in the same module, since the required plain imports and module-system header do not export these test signatures for downstream imports. The final content contains no scratch checks.

## Draft pull request body

Builds the dyadic arithmetic continuation of GeometryOfNumbersAndQuadraticArithmetic: explicit residue and finite-field Arf coordinates, completion and quadratic rigidity, the total-cokernel and parity obstructions, and integral comparisons over the integers and Eisenstein integers. The explicit ℚ₂ Witt arithmetic determines the corrected Eisenstein quadratic L-groups and distinguishes symmetric rank parity from quadratic Arf base change, within a general Dedekind-domain theory that includes ramification and infinite imperfect residue fields.

AI assistance: Codex performed the port, source and supplier checks, signature audit, and arithmetic self-review. This is an author self-review, not independent mathematical approval.

## Suppliers still carried by new-roadmap pull requests

- GeometryOfNumbersAndQuadraticArithmetic: §§6.1a, 6.2–6.5, 6.8a–6.9, 6.10a.
- HermitianKTheoryOfPoincareCategories: §§1.6, 3.4, 4.5–4.6, 6.6, 7.9.
- ArithmeticKTheory: §§1.1–1.3, 2.2, 3.5.
- KTheoryFiniteLocalFields: §1.7.
- GeneralAlgebraicKTheory: §§11.3–11.4, 11.15.

SchemeAndStackFoundations, QuadraticFormInvariants, GlobalQuadraticForms, IntegralLattices and Completed/IntegralLattices are consumed as they stand on main; revisions of those roadmaps are not added as dependencies. The repository README and CONTRIBUTING and the main-roadmap models were read before the port was finalized. No skill or delegated agent was used.

## Lean scope, supplier replacements and ownership

Nothing moved from the accepted package's Lean file to the README: it already has exactly the three permitted headlines, no definitions and no padding. The file retains `arf_trace_classifies`, `wittRing_padicTwo_coordinates`, and `wittRing_padicTwo_mul_c`; the only package-to-port Lean change is the required module-system header. Its native import `TauCeti.LinearAlgebra.QuadraticForm.Witt.FundamentalIdeal` exists at the pin and is actually used. Headlines requiring integral Witt carriers, dyadic quadratic scalar extension or periodic Poincaré L-spectra remain explicitly identified in the docstring with their missing carriers. No weakened proxy was added.

The object sweep used `roadmaps grep` across main and all indexed open heads, `roadmaps show` to reread the relevant new-roadmap suppliers, direct reads of the supplied sibling heads, and searches of the board's packages. Objects searched include symmetric and quadratic Witt quotients, full polar maps, second residues and their duality lines, absolute-trace Arf coordinates, L-theory rigidity and completion squares, dense K₀-image subcategories, ideal-adic completion and henselization, E₈ refinements, Eisenstein arithmetic, local Witt invariants and Scharlau transfer. The tool index contained 383 open pull requests; no missing head was fetched independently. Broad search hits on unrelated Artin–Schreier, Hasse–Arf and automorphic Eisenstein theory were inspected as different objects. Ownership against open pull requests whose files were not supplied was not checked beyond the provided indexed text search.

The sweep retained the package's ownership decisions. ArithmeticKTheory §3.5 owns the general Dedekind tables, the degree-three extension, the quadratic-to-symmetric injection and the quadratic/symmetric completion pullback. GeometryOfNumbersAndQuadraticArithmetic owns integral L-tables, signature normalizations and the shared Poincaré/spectrum framework. HermitianKTheoryOfPoincareCategories owns the quadratic Witt carrier, surgery and the 𝔽₂ Arf theorem. The finite-field trace extension here is strictly more general than that 𝔽₂ theorem; the explicit ℚ₂ coordinates refine the local classification rather than reconstruct it. KTheoryFiniteLocalFields' symmetric perfect-field comparison is distinct from the quadratic base-change law. Completed/IntegralLattices owns the lattice and E₈ construction; the new calculation is its actual quadratic refinement modulo two. Generic henselization, smooth approximation and dense-subcategory theory stay with their existing owners. No new duplicate target was found, no further deletion was required, and no notion moved down from a later roadmap. Every own Lean declaration has this roadmap's namespace.

These ownership exclusions remain only in README's Scope and ownership; no removed-target stubs were introduced. There is no supplier replacement by a private carrier. The supplier citation repairs listed below sharpen existing imports of mathematics.

## Upstream reread and port repairs

1. Replaced the vague IntegralLattices signature-theory citations with milestones **1I and 1L**, whose actual statements are Milgram and van der Blij. This supplies the even-unimodular signature-divisibility input of §4.2 with an exact locator.
2. Clarified §0.4's proof sentence: it is the **orthogonal sum** of two trace-one planes that is metabolic. Each individual trace-one plane is nonmetabolic. The accepted theorem and all Checks already express the correct statement.
3. Added `IsCyclotomicExtension.Rat.three_pid` to §5.2's Needs line. The proof uses a free Gram matrix for a projective form and a unit determinant; the existing cyclotomic PID supplier supplies that input explicitly.
4. Extended the henselization citations to **SchemeAndStackFoundations §§0.12–0.13**. Section 0.12 constructs the carrier; §0.13 supplies Noetherianity and quotient-power compatibility. The latter alone was an incomplete locator for the carrier.
5. Added a §4.1 negative-control Check for hyperbolic stabilization: c has rank 2, determinant 3, Hasse +1; c⊥⟨1,−1⟩ has rank 4, determinant −3, Hasse −1, and the same signed determinant and Witt class. This makes the stated Hasse-normalization warning quantitatively testable.
6. Added `module` before the package's unchanged imports to meet the pinned compiler's compatibility requirement with only `sorry` warnings.

No accepted mathematical decision was reversed. In particular the corrected annihilator is generated by 2u and c, the quadratic 𝔽₂→𝔽₄ map is zero while the symmetric map is the identity, and the Eisenstein quadratic table remains 0,0,ℤ/2,ℤ/4. Every definition retains its API and at least three discriminating Checks, and all 23 numbered sections, six layer examples/dependency blocks, worked examples and exact hypotheses remain present.

## Source and native API verification

The numbered cached extractions were read directly. Wall's anti-structure formulas, absent from text extraction, were also read on the rendered printed page 426. No source prose was copied into the roadmap. No suspicious instruction attempting to redirect the job was found.

| Claims | Resolved source locators and scope |
| --- | --- |
| Integral comparison, nonsingular forms and injectivity | CDHHLMNNS-III-v4 line 1896; CDHHLMNNS-III-v4 line 2050; CDHHLMNNS-III-v4 line 2226. Symmetric L₀ uses Dedekind surgery, whereas quadratic L₀ is the general ring comparison. |
| Residue line, shift, boundary and ramification | CDHHLMNNS-III-v4 line 1690; CDHHLMNNS-III-v4 line 1790; CDHHLMNNS-III-v4 line 1840. The uniformizer is a coordinate choice; ramified base change is not ordinary residue-field extension. |
| Symmetric global characteristic-two and DVR statements | CDHHLMNNS-III-v4 line 1881; CDHHLMNNS-III-v4 line 1904; CDHHLMNNS-III-v4 line 1936; CDHHLMNNS-III-v4 line 1960. Global-field and local-DVR hypotheses remain separate. |
| General fracture and its route | CDHHLMNNS-III-v4 line 1976; CDHHLMNNS-II-v5 line 5253. Both control subgroups, derived completion, coefficient comparison, Ore conditions and Tate boundary remain explicit. |
| Isometry lifting and complete rigidity | Wall-1970 line 76; Wall-1970 line 104; Wall-1970 line 132; Wall-1970 line 155; CDHHLMNNS-III-v4 line 2000. The noncommutative theorem precedes Wall's later commutativity assumption. Degree-one kernel comparison is described at CDHHLMNNS-III-v4 line 2019. |
| Henselian passage and regularity input | CDHHLMNNS-III-v4 line 2023; CMM line 892; CMM line 1659; Stacks line 6106; Stacks line 6126. The completed henselization can be nonlocal; the general ideal-adic G-ring theorem is needed. |
| Total quotient, finiteness, parity and nondyadic localization | CDHHLMNNS-III-v4 line 2031; CDHHLMNNS-III-v4 line 2044; CDHHLMNNS-III-v4 line 2072; CDHHLMNNS-III-v4 line 2099; CDHHLMNNS-III-v4 line 2206. The quotient uses the sum of two images; the extension has no chosen splitting. |
| Arf and explicit local/integral arithmetic | CDHHLMNNS-III-v4 line 2095; CDHHLMNNS-III-v4 line 2110; CDHHLMNNS-III-v4 line 2120; CDHHLMNNS-III-v4 line 2150; CDHHLMNNS-III-v4 line 2168; CDHHLMNNS-III-v4 line 2183; CDHHLMNNS-III-v4 line 2553. The trace formula, annihilator correction and Eisenstein corrected arrows are derived, not attributed as verbatim source statements. |

Wall-1973, Lam-2005 and Scharlau-1985 retain their settled locator-only, uncertified status. Their full texts were not claimed to have been read. The accessible paper identifies their applications; the corresponding general supplier contract remains explicit. No new source or licence claim was invented.

Native declarations were checked by object and exact spelling at the manifest pins. In particular Mathlib's `QuadraticMap` has homogeneity and a bilinear companion but no nonsingularity or finite-projectivity field (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`, definition at line 146); `polarBilin` is the full polar. The section carrying `QuadraticForm.baseChange` in `TensorProduct.lean` requires two invertible. `AdicCompletion` is the compatible-family subtype in `Mathlib/RingTheory/AdicCompletion/Basic.lean`, definition at line 171, and does not assert completeness for an arbitrary infinitely generated ideal. Ideal Chinese remainders, class-group/Picard comparisons, the cyclotomic integral closure, PID and units declarations and inertia/ramification formulas were located directly. At conductor three and prime two their invariants are f=2 and e=1.

Tau Ceti's `WittRing` requires a field and invertible two; `oneFoldPfisterClass` is ⟨1,−a⟩, not ⟨1,a⟩. The native transfer takes a nonzero linear functional and has the stated projection formula. The local classification and Hasse product use the field, topology, valuation and finite-dimensional hypotheses; they do not classify integral ring forms. The general Dedekind completion and residue-field declarations do not require finite residue fields. Searches found the supplied field Witt, transfer and completion objects, rather than a ring-valued or characteristic-two Witt carrier that would justify changing the acceptance file.

## Adversarial mathematics pass

Each row addresses a distinct mathematical assertion; repeated occurrences in examples and supplier contracts use the same witnesses. Values were recomputed, using exact rational Hilbert-symbol arithmetic and finite-field arithmetic for the finite calculations. Equality of dyadic Witt classes was tested through hyperbolicity of q⊥−q′ using dimension, determinant square class and Hasse invariant, independently of the proposed coordinates. Exhaustion of all field Witt classes additionally uses the supplied local classification/order-32 result. Spectrum-valued claims are tested on the displayed homotopy-group values and degenerate diagrams, not asserted to have been proved by finite computation. Source scope and proof inputs were checked separately above.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Dedekind conventions allow fields but exclude nonreduced rings | ℚ; 𝔽₂[ε]/ε² | ℚ has zero nonzero-prime coordinates; ε≠0 and ε²=0 excludes the latter from a domain | Scope distinguishes inputs | None |
| Finite projective need not mean free | I=(2,1+√−5) | I²=2R; determinant pairing xy/2 gives I≃I∨, while I has no free generator | Nonfree form retained | None |
| Perfect adjoint is stronger than nonzero determinant | ℤ, B=2xy | det=2≠0; adjoint cokernel=ℤ/2≠0 | Singular input excluded | None |
| Rank-zero perfectness | Zero module | adjoint 0→0 has inverse 0; Witt class=0 | Boundary included | None |
| Zero-ring convention | Zero ring and its projectives | 1=0 forces every module element=0; both Witt groups=0 | Consistent | None |
| Full polar, not associated half-polar | q=x²/2 over ℚ; q=x² over 𝔽₂ | b(1,1)=1 in first case; second has b=0 on a line | Normalization and exclusion agree | None |
| Quadratic Lagrangian requires quadratic vanishing | Arf-one plane and xy over 𝔽₂ | Same polar [[0,1],[1,0]]; nonzero values (1,1,1) versus (0,0,1) | Equal polars do not identify forms | None |
| Negative-sign spectrum is Σ² | ℤ, degrees 2 and 0 | Positive degrees 0 and −2 give ℤ and 0 | Subtract-two convention agrees | None |
| Pullback difference normalization | Identity maps on ℤ | (1,1)↦0; (2,1)↦1; sum would give 2 and 3 | Correct sign | None |
| Residue coefficient shift | DVR uniformizer π | p⁻¹/R is killed by π and one-dimensional; derived coefficient lies in degree shift −1 | Line and shift retained | None |
| Pic/2 is a cokernel | Pic=ℤ/4 | quotient classes {0,2},{1,3}; 2-torsion subgroup={0,2} | Distinct constructions despite same order | None |
| Ring identification versus inverse polarization | B=xy over ℚ₂ | Ring comparison gives ⟨1⟩; half-diagonal gives ⟨1/2⟩=⟨2⟩ | Factor two retained | None |
| Signed determinant convention | ⟨1,3⟩ and hyperbolic plane | Signed determinants −3 and 1; plain determinants 3 and −1 | Sign discriminates conventions | None |
| Hasse product in ranks zero and one | Empty form; ⟨3⟩ | Both empty pair-products=+1 | Boundary correct | None |
| Hilbert-symbol normalization | (−1,−1),(2,5),(−1,2) over ℚ₂ | −1,−1,+1 by εε+αω+βω | Matches native supplier | None |
| Hasse under hyperbolic stabilization | c and c⊥H | (rank,det,Hasse)=(2,3,+1),(4,−3,−1); same signed determinant −3 | Equal Witt classes have different raw Hasse signs | New README Check |
| General stabilization law | 85 diagonal forms of ranks 0–3, entries 1,−1,2,3 | h(q⊥H)=h(q)(det q,−1) in 85/85; zero failures | Formula survives varied signs | None |
| E₈ half-norm convention | Root eᵢ and adjacent pair | B(eᵢ,eᵢ)=2, q(eᵢ)=1; q(eᵢ+eⱼ)=1 | Direct diagonal reduction would give 0 | None |
| §0.1 comparison σ on forms | Arf-one 𝔽₂ plane | Quadratic invariant=1; symmetric alternating Witt class=0 | σ need not be isomorphism | None |
| §0.1 inverse when two invertible | B=xy over ℚ | polar of x²/2 at (1,1)=1=B(1,1); half of b_q(x,x)=q(x) | Both inverse directions agree | None |
| §0.1 compatibility with scalar extension and isometry | q=x² over ℚ, scaling x↦2x, extension to ℚ₂ | Both polar computations give 8xy and at (1,1) value 8 | Naturality witness | None |
| §0.1 additive and zero API | xy⊥xy and zero form over 𝔽₂ | Polar is block sum of two H matrices; class 0+0=0; zero polar=0 | Operations agree | None |
| §0.1 metabolic descent | L=span(1,0) in q=xy | q(L)=0 and L⊥=L of dimension 1; symmetric quotient class=0 | Quotient map defined | None |
| §0.1 L₀ comparisons use distinct hypotheses | ℤ, E₈ and unit line | Lq₀ generator has signature/8=1; Ls₀ unit has signature=1; σ sends 1↦8 | Correct integral comparison | Exact lattice locator |
| §0.2 symmetric generic injection | ℤ unit line; R=K | Signatures 1↦1; field map x↦x | Zero kernel in witnesses | None |
| §0.2 quadratic generic injection | E₈ over ℤ→ℚ | Signature 8↦8, nonzero class remains nonzero | Characteristic-not-two hypothesis retained | None |
| §0.2 characteristic-two polarization is zero | xy over 𝔽₂[t] | Polar alternating; generic Lagrangian coordinate line gives symmetric class 0; symmetric unit parity=1 | Quadratic and symmetric images differ | None |
| §0.3 unit residue | ⟨3⟩ over ℤ_(2) | v₂=0; boundary=0, coefficient reduction would be 1 | Unit API agrees | None |
| §0.3 odd valuation residue | ⟨2⟩ over ℤ_(2) | v₂=1; residue=⟨1⟩ with parity 1 | Nonsingular residue retained | None |
| §0.3 square invariance | ⟨1⟩ and ⟨4⟩ | Valuations 0 and 2; both residues=0 | Divisibility-only rule excluded | None |
| §0.3 unit coefficient retained | ⟨6⟩ at 3 | 6=3·2; residue=⟨2⟩, while squares in 𝔽₃×={1} | Rank-only rule excluded | None |
| §0.3 dual-generator coefficient | πu on standard line | dual generator gives u⁻¹; ratio u⁻¹/u=u⁻² is square | Same Witt coefficient | None |
| §0.3 uniformizer coordinate | ⟨5⟩ at 5, π=5 and 10 | Coefficients 1 and 3, since 2⁻¹=3 mod5 | Coordinate transformation required | None |
| §0.3 ramified base change | ℤ→ℤ[i], 2=−i(1+i)² | Valuation 1 becomes 2; residue 1 becomes 0 although residue-field extension is identity | Linking comparison retained | None |
| §0.3 finite support | ⟨6⟩ over ℚ | Only primes 2,3 contribute, with units 3 and 2 respectively | Infinite-support tuple excluded | None |
| §0.3 additivity/metabolic relations | ⟨2,−2⟩ at 2 | Residues 1+1=0 in Ws(𝔽₂); hyperbolic class=0 | Descent agrees | None |
| §0.4 coordinate definition on hyperbolic plane | xy over 𝔽₂ | q(e)q(f)=0; trace=0; three zeros among four vectors | Correct zero class | None |
| §0.4 nonzero coordinate | x²+xy+y² over 𝔽₂ | Product=1; trace=1; values on nonzero vectors 1,1,1 | Correct nonmetabolic class | None |
| §0.4 symplectic conditions imply perfect polar | Standard plane, and zero-dimensional basis | H determinant=−1=1 in char2; empty adjoint 0→0 invertible | No missing nonsingularity hypothesis | None |
| §0.4 absolute trace, not raw coefficient | x²+xy+y² over 𝔽₄ | Raw coefficient 1; trace 1+1=0; value at (ζ,1)=0 | Field extension kills this class | None |
| §0.4 basis independence | All symplectic bases of xy over 𝔽₂ and 𝔽₄ | 6 and 60 bases; raw sums {0} and {0,1}; traces {0} in both | Raw independence would fail | Clarified orthogonal-sum sentence |
| §0.4 additivity | Two Arf-one planes | 1+1=0; diagonal subspace dimension 2, quadratic value q(x)+q(x)=0 | Sum is metabolic | Clarified sentence |
| §0.4 Artin–Schreier criterion | 𝔽₂, 𝔽₄, 𝔽₈ | Images z²+z and trace kernels equal {0}, {0,1}, {0,2,4,6} | Solvability matches trace zero | None |
| §0.4 completeness iff | Every binary coefficient pair over 𝔽₂ and 𝔽₄ | 16 and 256 comparisons; trace equality and half-dimensional isotropic subspace agree in all; 10 and 136 true | Both implications tested | None |
| §0.4 unequal/zero dimensions | Zero versus zero, xy, Arf-one plane | Traces (0,0),(0,0),(0,1); L dimensions 0,1,none | No positive/equal-dimension restriction | None |
| §0.4 diagonal witness for q=q′ | Any 𝔽₂ plane with itself | q(x)+q(x)=0; 2 dim diagonal=dim(V×V)=4 | Basis comparison sound | None |
| §0.4 trace coordinate surjectivity | x²+xy+ζy² over 𝔽₄ | Tr ζ=ζ+ζ²=1; xy has trace 0 | Both quotient values occur | None |
| §0.4 extension-degree law | 𝔽₂→𝔽₄ and 𝔽₂→𝔽₈ | Tr(1)=0 and 1; degrees 2 and 3 reduce to 0 and 1 | Even and odd degrees distinguished | None |
| §1.1 characteristic-two global table | 𝔽₂[t], 𝔽₂(t), 𝔽₂[t,t⁻¹] | Pic/2=0 in each; odd groups 0; t-residue 1 before inversion, no coordinate after | Field and localization boundaries agree | None |
| §1.1 divisor-to-Picard cokernel | Principal divisor (t) on 𝔽₂[t] | valuation vector has t-coordinate 1; class of (t) in Pic/2=0 | Correct quotient relation | None |
| §1.1 imperfect generic field allowed | 𝔽₂(t) | t has no square root; empty prime family and Pic=0 persist | No perfection silently added | None |
| §1.2 DVR residue surjectivity | ℤ_(2), ℤ_(3), 𝔽₂[[t]] | ⟨2⟩↦1; ⟨6⟩↦⟨2⟩; ⟨t⟩↦1 | No completeness needed in first two | None |
| §1.2 mixed-characteristic dyadic table | ℤ_(2) | Residues Ws(R),ℤ/2,0,0 | Degree-one residue survives | None |
| §1.2 nondyadic DVR table | ℤ_(3) | Residue map onto Ws(𝔽₃) but Ls₁=0, since field Ls₂=0 | Surjectivity is not degree-one nonvanishing | None |
| §1.2 equal-characteristic-two DVR table | 𝔽₂[[t]] | Even group Ws(R); every odd group 0 | Different from mixed characteristic | None |
| §1.2 global characteristic-not-two table | ℤ and 𝔽₃[t] | (ℤ,ℤ/2,0,0) and (Ws,0,0,0); Pic/2=0 in both | Scope and degrees agree | None |
| §2.1 completion equivalence | ℤ, ℤ[i], ℤ[ζ₃] | Factor counts 1,1,1; residue degrees 1,1,2; ramification exponents 1,2,1 | Exponents do not count factors | None |
| §2.1 cofinal powers | ℤ[i], (2)=(1+i)² | (2)^m=(1+i)^(2m); for n choose m with 2m≥n | Same limit of quotient powers | None |
| §2.1 quotient projections and inverse | ℤ₂ modulo 2 and 4 | Integer 3 projects to 1 and 3; reduction of 3 mod4 is 1 mod2 | Compatible-family construction fixes maps | None |
| §2.1 component residue and fraction field | ℤ₂, unramified quadratic O | Residues 𝔽₂ and 𝔽₄; inverting 2 gives ℚ₂ and E | R-algebra maps have stated targets | None |
| §2.1 nondyadic inversion preserves completion | ℤ→ℤ[1/3] | 3 is a ℤ₂ unit, inverse modulo 8 is 3; completion both ℤ₂ | Correct inversion API | None |
| §2.1 empty product | ℤ[1/2], ℚ, ℤ_(3) | Quotient by 2^m is 0 for each; inverse limit=0 | Not R or 3-adic completion | None |
| §2.1 projection extensionality | Two-factor target, maps x↦(0,0),(0,1) | First coordinates agree 0=0; second 0≠1 | Every projection needed | None |
| §2.1 empty extensionality | Target zero ring | Every element/map value=0; empty condition true | Vacuity is valid here | None |
| §2.1 derived/ordinary comparison hypothesis | ℤ at 2 | Kernel of multiplication by 2^m is 0 for all m | Torsion-free sufficient case applies | None |
| §2.2 general fracture, unit parameter | (R,ℓ)=(ℤ,1) | C=0; localized R=ℤ; overlap=0; square has identity left vertical | Degeneration is pullback | None |
| §2.2 bounded torsion case | (ℤ/4,2) | C=ℤ/4; localization=0; overlap=0; top map identity | Non-domain case allowed | None |
| §2.2 arithmetic overlap and complex sign | (ℤ,2) | Overlap ℚ₂; 1↦(1,1)↦0; (2,1)↦1 | Sum would fail | None |
| §2.2 image controls | Even-Euler subcategory of Dᵇ(k) | K₀ image=2ℤ; quotient=ℤ/2; k[0] has class 1 outside | Density cannot remove control | None |
| §2.2 coefficient invertibility/Tate input | Standard ℤ coefficient on ℚ₂ overlap | Dual coefficient rank 1; norm 1+τ=2 on trivial ℚ₂, an invertible scalar; Tate groups 0 | Route's extra conditions visible | None |
| §2.3 Wall anti-structure axioms | α=id,u=−1; transpose,u=1 | α(u)=u⁻¹; α²=id=conjugation by u | Noncommutative/sign inputs admissible | None |
| §2.3 involution on refinements | General φ with stated axioms | T²φ=u⁻¹(uφu⁻¹)u=φ | T−1 quotient legitimate | None |
| §2.3 sesquilinear multiplication order | M₂(ℚ), transpose | α(E₁₂E₂₁)=E₁₁=α(E₂₁)α(E₁₂); unreversed order gives E₂₂ | Right-module convention discriminated | None |
| §2.3 sign in bilinearization | Rank-one xy over ℚ,u=−1 | φ+Tφ=0; omitting u would give 2xy | Nonsingularity not automatic | None |
| §2.3 alternating versus symmetric sign | Matrix [[0,1],[0,0]] | For u=−1 determinant 1; for u=1 determinant −1 | Both signs correctly represented | None |
| §2.3 hyperbolic lift | xy over ℤ₂→𝔽₂ | Polar determinant −1 and reduced determinant 1, both units | Dyadic lift uses no 1/2 | None |
| §2.3 prescribed residue isometry hypothesis | xy versus x²+xy+y² | Residue Arf values 0 and 1; no residue isometry | False premise excluded | None |
| §2.3 identity and square-zero correction | J=0; J=(ε) in 𝔽₂[ε]/ε² | Identity reduces to itself; error ideal J squares to 0 | One correction eliminates error | None |
| §2.3 projective/nonsingular lifting route | Idempotents 0,1; xy matrix | 0²=0,1²=1 lift unchanged; determinant −1 remains unit | Existence route grounded | None |
| §2.3 symmetric lifting negative control | ℤ₂ lines 1 and 3 | Same residue 1; 3 mod8=3 whereas odd squares mod8=1 | Symmetric analogue false | None |
| §2.4 complete quadratic rigidity | ℤ₂→𝔽₂ | Quadratic residues ℤ/2,0,ℤ/2,0 on both sides | Integral dyadic assertion consistent | None |
| §2.4 nonreduced source | Dual numbers→𝔽₂ | Same quadratic residues; ε≠0, ε²=0 | Reducedness not required | None |
| §2.4 zero and unit ideals | J=0; J=R with separated completion | Identity; intersection of J^n=R forces R=0 | Junk unit-ideal case consistent | None |
| §2.4 symmetric negative control | ℤ₂→𝔽₂ | Orders 16 and 2, unequal | Theory restriction necessary | None |
| §2.4 degree-one comparison route | ℤ₂→𝔽₂ | Lq₁=0 on each side; Lq₀=ℤ/2 on each | Isometry surjectivity alone not substituted for kernel comparison | None |
| §2.5 henselian integral rigidity | (ℤ₂,(2)), dual-number pair, J=0 | Same four quadratic residues; identity at J=0 | Completeness examples and nilpotent example agree | None |
| §2.5 nonnilpotent ideal permitted | (ℤ₂,(2)) | 2^m≠0 for every finite m, while reduction rigidity still gives ℤ/2 in even degrees | Nilpotence not introduced | None |
| §2.5 nonlocal henselization | A=ℤ[x],I=(2) | H/2H=𝔽₂[x]; maximal ideals include (x),(x+1), infinitely many total | Local-only completion theorem insufficient | Citation includes carrier §0.12 |
| §2.5 smooth-section/retraction route | Smooth H[x]→Ĥ, x↦0 | Evaluation x↦0 gives H[x]→H, composing H→H[x] to identity; 1↦1 | Split-injection approximation witness | None |
| §3.1 total quotient definition | D=ℤ/4,G=2D,Q=0 | G+Q={0,2}; quotient cosets {0,2},{1,3}, order2 | Intersection quotient would have order4 | None |
| §3.1 surjective quotient map | Same D,G,Q | Representatives 0 and1 attain both cosets | Surjectivity API | None |
| §3.1 zero-class criterion | Same D,G,Q | 2=2+0 lies in sum and maps0; 1 cannot be such a sum and maps1 | Both directions tested | None |
| §3.1 either image alone may kill quotient | (G,Q)=(D,0),(0,D) | G+Q=D and quotient order1 in each | No unjustified quadratic surjectivity | None |
| §3.1 factorization universal property | f:ℤ/4→ℤ/2, f(x)=x mod2 | Values 0,1,0,1; f kills G and Q; induced quotient values 0,1 | Both images, not intersection, govern factorization | None |
| §3.1 cokernel of cokernels | σ_R=0, σ_C=0, global map ×2 on ℤ/4 | Both constructions quotient D by {0,2}, giving ℤ/2 | Commuting-diagram identification agrees | None |
| §3.1 diagram functoriality | Induced ×2 map on preceding quotient | Source coset1 maps coset2=0; both representative maps 1↦2,3↦2 | Well-defined induced map | None |
| §3.1 inherited abelian group | Quotient ℤ/4/2D | 1+1=0 in quotient; two classes | Native additive quotient sufficient | None |
| §3.1 two-inverted case | ℤ[1/2] | C=0; both ranges=0; A=0 | Boundary correct | None |
| §3.2 number-field degree-two coordinates | ℤ, ℤ[1/2], ℤ[ζ₃] | d=1,0,1 yields ℤ/2,0,ℤ/2 | Degree-one residue field size not used instead | None |
| §3.2 finite two-primary A | Same three rings | Orders 1,1,4 respectively, all powers of2 | Finite quotient route consistent | None |
| §3.2 exact extension retains maps | Eisenstein ring with Pic/2=0 | 0→ℤ/4→ℤ/4→0, kernel order4 | Kernel cannot be dropped | None |
| §3.3 diagonal quotient | d=0,1,2,3 | Parity-vector counts 1,2,4,8; diagonal counts1,2,2,2; quotient orders1,1,2,4 | d−1 exponent only for d≥1 | None |
| §3.3 completed quadratic image has parity zero | Hyperbolic and Arf-one binary forms | Both ranks2, parity0; unit symmetric line has parity1 | Map kills required image | None |
| §3.3 global image is diagonal | Global rank-one form, d=2 | Completion parity=(1,1); class of (1,0) outside diagonal | Surjection detects obstruction | None |
| §3.3 infinite imperfect residues | A=ℤ[t]_(2), x²−x−4 | Discriminant17 unit; mod2 roots0,1, derivative1; two residue fields𝔽₂(t); quotient order2 | Nonzero obstruction beyond finite/perfect residues | None |
| §3.3 d=1 does not imply A=0 | ℤ and Eisenstein ring | Same parity quotient0; A orders1 and4 | Stronger false conclusion excluded | None |
| §3.4 empty localization | S=∅ | R_S=R; residue sum=0; fibre of identity=0 | Boundary consistent | None |
| §3.4 nondyadic localization | ℤ→ℤ[1/3] | Both 2-completions ℤ₂; sole residue field𝔽₃ | Fracture comparison applies | None |
| §3.4 dyadic negative control | ℤ→ℤ[1/2] | π₃Lq(𝔽₂)=0,π₂Lq(ℤ[1/2])=0 but π₂Lq(ℤ)=ℤ/2 | Proposed dyadic fibre sequence impossible | None |
| §3.4 infinite support excluded | Infinite S, one nonzero residue per prime | Support cardinal infinite versus finite for every direct-sum element | Correct carrier | None |
| Dedekind K₀ control disappearance | ℤ→ℤ[1/3] | K₀=ℤ on both, map rank1↦rank1 onto | Does not contradict even-Euler control | None |
| §4.1 u,v,c definitions | Native Pfister classes2,−3 | v=⟨1,−2⟩,c=⟨1,3⟩; u rank1 | Pin's minus sign used | None |
| §4.1 generator orders | 8u,4u,2v,2c | Hyperbolicity values true,false,true,true | Orders8,2,2 exactly | None |
| §4.1 residue independence | u,v,c | Boundaries0,1,0 | v independent of integral subgroup | None |
| §4.1 coordinate injectivity | All 32 triples | 496 unequal pairs; zero Witt-class collisions | Unique coordinates | None |
| §4.1 coordinate addition | All 1024 ordered pairs | Witt sum equals reduced-coordinate sum in1024/1024, zero failures | Quotient representatives respect addition | None |
| §4.1 coordinate exhaustivity | Independent32 coordinates and supplied cardinality W=32 | Image cardinal32 equals whole cardinal32 | Classification input used explicitly | None |
| §4.1 c multiplication headline | All32 triples | c(au+bv+ec)=ac+4bu in32/32, zero failures | Formula agrees | None |
| §4.1 tensor cv | ⟨1,3,−2,−6⟩ versus4u | Rank4, determinant36 square, Hasse(+1)(−1)(−1)=+1; 4u same | cv=4u≠0 | None |
| §4.1 c² and ideal | All32 multiples | c² hyperbolic; image={0,c,4u,c+4u}, cardinal4 | Nilpotent nonzero c | None |
| §4.1 annihilator | All32 coordinates | Exactly a∈{0,2,4,6},b=0,e∈{0,1}:8 elements | ann(c)=⟨2u,c⟩ | Accepted correction retained |
| §4.1 alternate c presentation | Ratio−5/3 inℚ₂ | Odd unit residue mod8=1; class equality test true | ⟨1,−5⟩=c | None |
| §4.1 corrected alternate annihilator generator | ⟨1,−3⟩,v | Equality to2u+c true; c times it0; cv=4u≠0 | Source's v cannot generate ann(c) | Accepted correction retained |
| §4.1 least representatives | a=8 mod8,b=2 mod2 | Both residues0; 8u=0,2v=0 | No integer-coordinate uniqueness claim | None |
| §4.2 actual E₈ model | Arms2,4,1 Gram matrix | Positive diagonal pivots2,3/2,4/3,5/4,6/5,7/6,8/7,1/8; determinant1 | Positive even unimodular model | None |
| §4.2 adjacent and nonadjacent polar | Two roots | Adjacent q-sum=1,polar−1≡1; nonadjacent polar0 | Graph/refinement agree | None |
| §4.2 Arf-zero computation | All256 binary vectors | 136 zeros,120 ones; 2⁷+2³=136 | Arf0, not Arf1 | None |
| §4.2 signature normalization | E₈ and bilinear unit | 8/8=1 and signature1; unit line requires nonexistent integral q(1)=1/2 | Distinct integral carriers | None |
| §4.3 integral symmetric subgroup | Residue kernel in32 coordinates | b=0 gives16 elements, generatedu,c | Integral group ℤ/8⊕ℤ/2 | None |
| §4.3 residue section | ⟨−1,2⟩=−v | Boundary1; order2; −v=v | Splitting fixed | None |
| §4.3 local quadratic image | Polar[[2,1],[1,2]] | det3,signed−3; diagonal⟨2,3/2⟩ equalsc+4u and differs fromc | Full-polar factor matters | None |
| §4.3 joint-image quotient | ⟨u,c+4u⟩ in16-element subgroup | Generatesu andc, hence16 classes; quotient order1 | A(ℤ)=0 | None |
| Integer global-to-local quadratic map | E₈ reduction | Arf0 versus global signature/8=1 | Mapℤ→ℤ/2 zero | None |
| §5.1 Eisenstein dyadic place | t²+t+1 over𝔽₂ | Values1,1 at0,1; derivative1; degree2 irreducible | One unramified prime,f2,e1 | None |
| §5.1 unramified does not imply inert | t²+t+2 forℚ(√−7) | Mod2=t(t+1), two simple roots | Discriminant-only argument excluded | None |
| §5.1 six units and square classes | Norm a²−ab+b²=1 | Pairs(±1,0),(0,±1),(1,1),(−1,−1); squares form subgroup order3,index2 | Unit representatives±1 | None |
| §5.1 fraction-field coordinate | ζ=(−1+s)/2,s²=−3 | ζ²+ζ+1=0; 2ζ+1=s | Actual extension fixed | None |
| §5.2 2u nonzero | K and E | Signed determinant−1 nonsquare, whereas zero even class signed determinant1 | Order not2 | None |
| §5.2 4u vanishes after extension | ℚ₂ versusE | Hamilton symbol−1 overℚ₂; overE norm of−1=1 gives symbol+1 | Order4 at E | None |
| §5.2 four global/completed classes | 0,u,2u,3u | (parity,signed det)=(0,1),(1,1),(0,−1),(1,−1) | All distinct | PID input explicit |
| §5.2 global Hasse route | Unit unimodular matrices | Odd local Hasse+1; no real places; single dyadic sign forced+1 | Global upper bound agrees with four distinct classes | None |
| §5.3 restriction kernel | Integral source order16 | Kernel(c) has4 elements; image16/4=4 | Different from cokernel | None |
| §5.3 restriction cokernel | Transfer ontoann(c) | ann(c) order8=4·2 | Not kernel order4 | None |
| §5.3 symmetric residue comparison | 𝔽₂→𝔽₄ | Unit rank1↦rank1, parity1↦1 | Identity map | None |
| §5.3 transfer functional normalization | (1+s)²=−2+2s | λ=2; −λ=−2; λ/2=1 | Basis values determine functional | None |
| §5.3 transfer kernel contains restriction | Restricted unit line | Gram[[0,1],[1,0]],Witt class0 | Exactness normalization agrees | None |
| §5.3 ordinary trace is different | Transfer of unit alongTr | diag(2,−6),signed determinant12,class3 nonsquare | Nonzero unlikeλ-transfer | None |
| §5.3 transfer sign detected | Unit line⟨s⟩ | λ givesdiag(1,−3)=2u+c; −λ gives6u+c; difference4u≠0 | Sign fixed beyond one test form | None |
| §5.4 old quadratic extension map | Arf-one𝔽₂ plane over𝔽₄ | Value at(ζ,1)=0; Tr(1)=0 | Mapℤ/2→ℤ/2 zero | Accepted correction retained |
| §5.4 new local quadratic class | x²+xy+ζy² | Trζ=1; polar[[2,1],[1,2ζ]] | Nonzero order-two image | None |
| §5.4 signed determinant and norm | d=1−4ζ | Norm=1+4+16=21≡5 mod8 nonsquare | d nonsquare inE | None |
| §5.4 disjoint images | t versus0,2u | Norm determinants21 versus1,1; 21 nonsquare | t outside⟨u⟩; intersection0 | None |
| §5.5 degree-one boundary | R→O | Ls₁ valuesℤ/2→ℤ/2,identity1↦1; Lq₁(O)=0 | Boundary into degree0 vanishes | None |
| §5.5 degree-zero pullback | ⟨u⟩ order4 and⟨t⟩ order2 | Intersection0; kernel of difference map has1 element | Wq(R)=0 | Accepted correction retained |
| §5.5 transfer of new polar | Displayed4×4 matrix | det21; pivots1,−1,4,−21/4; residualclass⟨1,−21⟩=c | Additional quadratic image visible | None |
| §5.5 final obstruction quotient | ann(c)/⟨c⟩ | Order8/2=4; generator2u has order4 | A=ℤ/4 | Accepted correction retained |
| §5.5 corrected L-tables | Eisenstein ring,Pic0,d1 | Symmetric(ℤ/4,ℤ/2,0,0);quadratic(0,0,ℤ/2,ℤ/4) | Both use correct distinct residue arrows | None |
| Worked examples agree with all layers | ℤ,ℤ[1/2],ℤ[ζ₃] | A orders1,1,4;degree-two quadratic orders2,1,2;degree-three quadratic orders1,1,4 | No example refutes general extension | None |

All denominators above have their required domains: 1/2 is used only in characteristic-not-two fields or on an even integral diagonal; π⁻¹ is in the fraction field for a nonzero uniformizer; unit ratios use nonzero coefficients; ℓ=1, the unit ideal, empty index sets and zero-dimensional forms are handled explicitly. Nonabelian groups such as S₃ are outside the additive-commutative Witt-group signatures, and inseparable finite extensions are outside the finite-field extension tests because finite fields are perfect. No total-function junk value is used to simulate a missing carrier or a forbidden input.

## Unresolved and conditional implementation contracts

There is no unresolved port or validation defect. Acceptance remains conditional on the package's announced supplier contracts: `derived-localization-completion-square` and `poincare-change-of-rings-criterion` from GeometryOfNumbersAndQuadraticArithmetic, and `quadratic-extension-witt-exactness` from QuadraticFormInvariants. The already-declared fourth contract, `henselian-pair-completion-regular` from SchemeAndStackFoundations §0.21, is also retained with its exact nonlocal G-ring hypotheses and the checked Stacks locators. These are requests for the suppliers' mathematical library work, not assertions that the missing implementations exist at the pins. The three settled locator-only sources remain as described above. No source-service request, tool process or Lean elaboration was left running.


Pull request: #1691 (roadmap/geometry-of-numbers-and-quadratic-arithmetic-part-ii at d851306)
