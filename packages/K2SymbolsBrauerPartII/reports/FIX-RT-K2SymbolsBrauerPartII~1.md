# Repair report

The findings below follow review a (F01–F11), then review b (F01–F05). Overlapping supplier and sign findings have one shared repair, with an explicit disposition for each finding. Source references use the manifest keys in `packages/K2SymbolsBrauerPartII/sources.toml`.

**Review a**

## F01 (P1) — not actionable in this package: two earlier supplier extensions are required

Absent supplier → verified KTheoryFiniteLocalFields, EtaleCohomologyFoundations and SchemeAndStackFoundations contracts throughout Scope, Exact supplier contracts and Layers 1–5. Unavailable compatibility/arithmetic assertions → gaps field-cup-residue-coherence and arithmetic-tate-symbol-maps, in README and the new plan's sole top-level `gaps` list. This package cannot make earlier owners supply those extensions. No field, allowed prime or real place was excluded.

## F02 (P3) — applied

AlgebraicKTheory A5 → K2SymbolsBrauer §0.4; Layers 1–13 → Layers 0–13 in Scope. The available base head constructs the classical presentation in §0.4 and consumes it in §§7.1–7.3. GeneralAlgebraicKTheory's Scope excludes field-specific presentations. Native presentation and comparison citations remain §§5.1–5.2 and 7.1–7.3.

## F03 (P3) — applied

Identifier catalogue → deleted. The module docstring now lists mathematical headlines and their missing carriers in prose, including the symbol algebra needed for central simplicity and matrix corners. README API identifiers unsupported by declarations → descriptive mathematical prose throughout all five layers. The Lean file contains only the conic definition and two headline theorems.

## F04 (P2) — applied differently

Obsolete baseline/current split → actual pins. Imported `TauCeti.NumberTheory.HilbertSymbol.Basic` and added `conicSymbol_eq_hilbertSymbol` with explicit characteristic and unit hypotheses. The equivalent norm-criterion theorem stays in README §3.3 instead of duplicating the acceptance headline. Pinned Basic.lean:46,56–59 defines the sign and its norm criterion; §3.4 uses the generic equality locally.

## F05 (P2) — applied

New local factorization/section → transport of KTheoryFiniteLocalFields §§3.1–3.3, with N(x)=normResidueMap(x)^(w/m). Added the w=6,m=3 distinction: coefficient power ζ² versus primary projection ζ⁴. Retained exact-order splitting Checks. Updated Scope, §§3.1–3.4, Layer 3 dependencies, finite-place transport in §4.1 (supplier §7.3), and Downstream consumers. Supply points toward this package.

## F06 (P2) — applied

New finite-coefficient exactness/image/CRT targets → consumption of KTheoryFiniteLocalFields §1.1's actual coeff_exact, reduce and bockstein maps in Exact supplier contracts and §5.4. The image remains the Bockstein kernel used in §5.5. Examples retain the nonzero root-of-unity quotient. No duplicate exactness declaration was added.

## F07 (P2) — applied

Second derivation of the scalar Artin/cup sign → transport of ClassicalArithmeticCompletion §1.44's normResidueSymbol_eq_localSymbol and convention comparison. Updated Exact supplier contracts, §3.5 and Layer 3 dependencies. The cubic calculation remains a transport Check: inv β{3,7}=1/3, H₃(3,7)=ζ⁻¹ and H₃(7,3)=ζ. K₂ equality follows by generation.

## F08 (P3) — applied

Missing manifest → four unique source entries with authors, titles, years, locators, cited sections and service provenance/hash/status. All four works were fetched legally and certified, including OCR of Tate's GDZ scan. No source text was copied into the package and no reference request remains pending.

## F09 (P3) — applied differently

Requested Lean mirrors/boundary theorems → README Checks only, as required by the acceptance-test contract. Retained real, dyadic, rational and Steinberg witnesses; added explicit F₂ values and the F₂(t) counterexample to the characteristic-two norm bridge. Removed the trivial proved examples and the rational negative-control theorem from Lean. No admitted examples or boundary padding were added.

## F10 (P2) — applied

“Finite source and target” → finite-coefficient groups, potentially infinite. Added the Q,m=2 Check: tame localization surjects onto the direct sum of one C₂ for each odd prime. Thus K₂(Q)/2 and its Galois-symbol target are infinite. Evidence: tate line 547, Equation (5.3), p.269.

## F11 (P2) — applied differently

Unavailable-carrier suggestion → explicit native module and TensorProduct.lift formula in README §1.3; equivariance, pure-tensor formula and root change remain there. Pinned Local/Symbol.lean:165–182 supplies the bilinear pairing. A lift and its defining equation are routine API, so no new definition or sorried API theorem was added to the headline-only acceptance file. The docstring acknowledges these existing carriers.

**Review b**

## F01 (P3) — applied

Title “k₂ … part ii” → “K₂ … part II”. This preserves the functor symbol and numeral, matching K2SymbolsBrauer and AdicSpacesPartII. No internal links target the title, so no link slug needed updating.

## F02 (P3) — applied

Roadmap-owned h2MuToBr → pinned Tau Ceti contract with file and hypotheses. The ClassFieldTheory character formula now has the unit class first and δ on the character. The Kummer-form transport is consumed through ClassicalArithmeticCompletion §1.44, as in review a F07. Evidence: pinned Torsion.lean:58; ClassFieldTheory's character formula; milne lines 5034–5064 and 5088–5090.

## F03 (P3) — applied

Unconditional general adic torsion quotient → explicit injectivity of mod-ℓ h_ℓ, with Tate 3.5(b)/corollary and global injectivity from Theorem 5.1. Updated §5.2 and the arithmetic supplier gap. Evidence: tate lines 354–360 and 493. The global zero-divisible-kernel specialization remains distinct from the general conditional formulation.

## F04 (P3) — applied

Number-field Picard/localization scope → global fields, ℓ≠char F, finite nonempty S, archimedean places and places above ℓ in the number-field case. The two ring isomorphisms keep number-field scope. Updated Scope, supplier gap/plan and §5.3, adding the F₃[t] zero-group Check. Evidence: tate lines 569–607; soule lines 1709–1749; weibel line 31435.

## F05 (P3) — applied

Lean Layer 3 “local norm-residue and conic symbols” → README's “local norm-residue and Hilbert symbols”. The retained declarations remain in README order.

# Gate failures

- **Missing sources.toml:** added the v1 manifest with exactly one lifetime key per cited work: weibel, tate, milne, soule. Each entry includes bibliographic metadata and every cited locator group, plus the service's URL, fetched-from URL, timestamp, SHA-256, licence class and certified status. Source validation reports zero problems.
- **TeX residue (74 hits):** moved every TeX subscript/superscript expression outside fences into code spans, preserving the mathematics throughout conventions, all five layers and examples. Punctuation is outside the spans. No subsection heading changed, so no internal heading link changed. Final tex=0 and latex=0.
- **Missing README identifiers (four):** the defining conic criterion, symmetry, one-left and Steinberg facts are prose in §3.3. The same repair covers every non-headline API name in the former Lean comment catalogue; no declaration was added to satisfy the name scanner. Final readme-ids-missing=0.

# Verification

- Targeted build of TauCeti.NumberTheory.HilbertSymbol.Basic from the content checkout: exit 0, “Build completed successfully (1885 jobs).” This was the missing imported object. No bare build, package update or cache-fetch command was run.
- `lake env lean` on `packages/K2SymbolsBrauerPartII/Suggested.lean`, from the content checkout: exit 0; exactly two “declaration uses 'sorry'” warnings, for the real criterion and conic/Hilbert equality. An initial invocation from the board checkout stopped before elaboration because it has no default toolchain; the required content-checkout invocation succeeded without changing any toolchain.
- One scratch signature file containing all three retained declarations and `#check @name` for each: exit 0; exactly the same two intended sorry warnings. Elaborated signatures appear below. All field, characteristic and unit binders agree with README §§3.3–3.4; none disappeared. The generic equality explicitly retains h2. No section variables or instances were introduced.
- Dependency command from the brief: exit 0. Exact output:

```text
depcheck: 14 roadmaps, 107 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Package content scan: the installed worker's unmodified scan_folder, source-manifest validator, gap-reference validator and four-required-files check all passed. All counts, including depcheck, tex, readme-ids-missing, imports, sources and gaps, are zero. This is the package gate's text/source/gap check, not a claim of worker submission or independent mathematical acceptance. The ordinary CLI worktree gate expects a TauCetiRoadmap directory, so its invocation on the board directory only reported that layout mismatch; it was replaced by the package scanner, without changing tooling.
- Citation resolver: no missing cross-roadmap citations and no missing roadmap identifiers. Its library scan was unavailable in that command's environment; pinned library declarations were read directly instead.
- All edits are in this package's README, Suggested.lean, sources.toml, report and the plan's top-level gaps list. metadata.toml is unchanged. No commit, push or external write was made.

| Declaration | Elaborated binders and conclusion | README agreement |
| --- | --- | --- |
| conicSymbol | (F : Type u) → [Field F] → F → F → ℤˣ | Total on all coefficients, including zero, every characteristic. |
| conicSymbol_real_eq_neg_one_iff | ∀ r s : ℝ, conicSymbol ℝ r s = −1 ↔ r≤0 ∧ s≤0 | Weak inequalities on the total domain. |
| conicSymbol_eq_hilbertSymbol | ∀ {F : Type u} [Field F], (2:F)≠0 → ∀ r s : Fˣ, conicSymbol F ↑r ↑s = TauCeti.hilbertSymbol r s | Field generic; unit inputs and characteristic hypothesis explicit. |

# Sources and ownership evidence

The source texts were read in the service cache; only locators are recorded here. Milne's extraction identifies version 4.03 at milne lines 5–8. Tate's extraction is an OCR of the legal GDZ scan.

| Work | Inspected locators supporting the repairs and retained mathematics |
| --- | --- |
| weibel | Lines 13372–13453: real/conic/local symbols, III.6.2.1–6.2.5, pp.232–234. Lines 13858–13912: algebra convention and its Brauer class, III.6.9, pp.240–241; the interpolation proof must use the full minimal polynomial. Lines 13950–14020: Kummer, ordered cup, symbol and coefficient dictionary, III.6.10.1–6.10.4, pp.242–243. Line 31435: finite S-integer comparison in VI.8.6, p.515. |
| tate | Lines 256–293: adic symbol and projection formula, Theorem 3.1/Lemma 3.2, pp.262–263. Lines 294–344: Diagram 3.3 and ordered finite cup. Lines 354–360: conditional general torsion quotient, Theorem 3.5(b)/corollary, p.265. Lines 461–485: local criterion/corollary, pp.267–268. Line 493: global injectivity/bijectivity, Theorem 5.1, p.268. Lines 542–565: localization and global adic theorem, pp.269–270. Lines 569–607: global-field scope, S hypotheses and actual Picard map of Theorem 6.2, pp.270–271. |
| milne | Lines 4957–4959: III Proposition 3.6, p.109. Lines 5034–5064: δχ cup b, χ cup δb and inflation. Lines 5088–5105: Artin evaluation and root-dependent coefficient contraction. Lines 5140–5146 (III.4, Remark 4.5, p.114) fix the transposed Hilbert order. Lines 8075–8096, 8123–8150 (V.5, pp.178–179) and 10042–10046 (VII.8.1(b), p.221) give the all-place reciprocity inputs. |
| soule | Lines 1276–1286: integral product coefficient, Proposition 2.2.2.3, pp.42–44. Lines 1401–1426: finite cofiber, §2.2.3.1, pp.45–46. Lines 1447–1468: factorization through finite reduction, §2.2.3.2/Lemma 2.2.3.2.1, pp.47–48. Lines 1520–1555: restricted finite-product inference, Proposition 2.2.3.3/remark, p.49. Lines 1695–1749: degree-two minus sign and ring/Picard argument, §2.2.4.4, pp.53–55; its root hypothesis is not silently discarded. |

Direct pin checks used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, read from the content checkout's manifest. In Tau Ceti, FieldTheory/GaloisCohomology/Coefficients.lean:125 is literally the additive roots-of-unity carrier; its topology at :129 is discrete. Kummer.lean:249,277,322,330 supplies the map, cocycle and kernel statements. RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595,790 supplies the explicit cup and negative-flip comparison. NumberTheory/ClassFieldTheory/Local/Symbol.lean:165–182 is the existing ZMod-bilinear root pairing. Brauer/Torsion.lean:58, RootsOfUnity.lean:89,103 and Invariant.lean:193 provide the actual Kummer/Brauer map and normalized invariant coordinate. Algebra/CrossedProduct/Comparison.lean:267,295 and CupProduct.lean:318 give the fixed algebraic-to-cohomological direction and quaternion comparison. HilbertSymbol/Basic.lean:46,56–59 is the field-generic norm sign. Mathlib RingTheory/RootsOfUnity/PrimitiveRoots.lean:461,516 supplies the primitive-root equivalences with their domain/nonzero hypotheses.

Three main roadmaps were read for structure: AdicSpacesPartII, EtaleCohomologyFoundations and ClassicalArithmeticCompletion. Every supplier citation was resolved at main or its available open head and read at the relevant section: K2SymbolsBrauer §§0.4, 5.1–5.2, 7.1–7.3, 8.1–8.3, 12.5 and tame/localization layers; KTheoryFiniteLocalFields §§1.1, 1.8, 3.0a–3.3 and 7.3; GeneralAlgebraicKTheory §§1.7–1.8, Layer 5 and §§7.4–7.5; SchemeAndStackFoundations §§2.11, 2.15; EtaleCohomologyFoundations §§F.0.3, F.4.1–F.4.2; ClassFieldTheory Layers 5, 6, 10, 14; QuadraticFormInvariants §§6C, 6E, 7B; ClassicalArithmeticCompletion §§1.14, 1.24–1.25, 1.44, 1.52. A named gap denotes a required extension, not an assertion that the cited section already contains it.

Object searches used the roadmap service across main and open heads, the board packages, the pinned libraries and all thirteen explicitly supplied sibling folders. No competing owner was found for the specified degree-m monomial algebra/matrix-corner comparison or for the total arbitrary-coefficient conic sign. SelmerIwasawaCohomologyPartII and CohomologyComparisonsPartII consume generic twists or construct specialized filtered realizations; neither owns these dictionaries. Generic twists, K-theory coefficients, field symbols and local splittings are imported from their earlier owners. No own declaration uses another roadmap's fully qualified name.

# Adversarial mathematical pass

These are mathematical calculations, not proofs supplied by Lean's sorry elaboration. A positive row means the stated instances agree; it does not certify an unavailable supplier. All field assertions exclude the zero ring by Field. The algebra presentation excludes m=0,1 and has an explicit degree-one corner convention; coefficient assertions include m=1. K₂ and its targets are abelian: nonabelian groups are outside those signatures, while the cochain convention was also tested on S₃.

| Statement | Instances tried | Computed values on the two sides | Result and change |
| --- | --- | --- | --- |
| Quotient versus torsion conventions | A=ℤ, m=2; A=0, m=1 | A/2=C₂ but A[2]=0; 0/1=0=0[1] | Distinct constructions retained. |
| Invertible coefficient convention | F=F₂, m=2,3; F=Q₂, m=2 | 2=0 in F₂, 3=1; 2≠0 in Q₂ | Characteristic and residue invertibility kept separate. |
| Weight-one native module and action | Q, m=3, complex conjugation | ζ↦ζ²; ζ⊗ζ↦ζ⁴⊗-coordinate=ζ⊗ζ | Weight one nontrivial, weight two trivial; no root-free scalar identification. |
| Kummer cocycle and its power kernel | a=c^m in F; a=3 over Q₇, m=3 | Chosen root c gives g(c)/c=1; Frob(root 3)/root 3=ζ | κ(c^m)=0, κ(3) has coordinate 1. |
| Ordered explicit cup convention | S₃, trivial C₂ coefficients, both sign characters; g=(12), h=(23) | χ(g)χ(h)=1·1=1; formula gives 1 | Nonabelian multiplication does not reverse the two inputs. |
| Negative-flip cohomology convention | C₃, identity character to Z/3 | Cup cochain at (1,1)=1; δ(i↦i²)(1,1)=1, so its class is 0=−0 | Cochain values are not confused with class equalities. |
| §1.1 symbol/cup dictionary | R, m=2, {−1,−1}; symbol with a power slot | Both Brauer realizations have invariant 1/2; power slot has κ=0, hence h=0 | Actual cup map retained; input coherence is an explicit gap. |
| §1.1 Steinberg and field naturality | R, {−1,2}; Q→Q(μ₃); m=1 | κ₂(2)=0, cup=0; tensor h exists before root choice; m=1 gives 0=0 | No root-containment restriction added. |
| §1.2 trivialization value on 1 | m=5, ζ, j=1,2; m=1 | 1↦ζ and ζ⊗ζ; zero module has 1=0↦0 | Basis, rather than a zero map, specified. |
| §1.2 weight zero | m=5, ζ and ζ² | τ₀(1)=1 for both; root change factor 2⁰=1 | Weight zero independent of root. |
| §1.2 weight-one library dictionary | m=5, exponent 2 | ZMod coordinate 2 maps to ζ² by both primitive-root maps | Native coefficient embedding retained. |
| §1.2 tensor coherence | m=5, weights 1,1 and 1,−1 | New weight-two factor 2·2=4; new evaluation factor 2·3=1 | Distinguishes tensor and dual bases. |
| §1.2 negative weights | m=5, u=2, j=−1 | 2⁻¹=3; (3t*)(2t)=6=1 | Dual/evaluation law retained. |
| §1.3 contraction definition | m=5, input ζ²⊗ζ³ | c gives ζ⁶=ζ; multiplication gives ζ⁵=1 | Native tensor lift explicitly specified in README. |
| §1.3 pure-tensor formula | m=5, exponents 2,3 | lift(bil)(x⊗y)=bil(x,y)=2·3=1 in Z/5 | Routine API remains prose. |
| §1.3 agreement/uniqueness | m=5, basis tensor ζ⊗ζ; either factor root 1 | Both maps take generator to ζ; additive-zero input gives root 1 | Linear maps with this generator value coincide; wrong multiplication fails zero input. |
| §1.3 equivariance and m=1 | ζ∈F; m=1 | gζ=ζ, so g(c(ζ⊗ζ))=ζ=c(gζ⊗gζ); at m=1 source=target=0 | No unavailable-carrier claim for this lift. |
| §1.4 Brauer symbol definition | R, m=2, {−1,−1}; a positive slot | Contracted cup and Hamilton class each have inv=1/2; positive slot gives 0 | Fixed Kummer inclusion used. |
| §1.4 torsion | Q₇, m=3, {3,7}; m=1 | 3·(1/3)=0 in Q/Z; Br[1]=0 | Exponent assertion valid, including trivial coefficient. |
| §1.4 algebraic transport | R→C, Hamilton class | R class has inv=1/2; C restriction is split, class 0 | Brauer equivalence direction and restriction agree. |
| §1.4 uniqueness on symbols | x={3,7}+{7,3} over Q₇ | β(x)=1/3−1/3=0 for both specified maps | Symbol-generation argument fixes map, not just norm kernel. |
| §1.5 root change of τ | m=5, u=2, j=0,1,2,−1 | Factors 1,2,4,3 respectively | All weights retained. |
| §1.5 contraction root change | m=5, fixed tensor ζ²⊗ζ³, new root ζ² | Old value ζ; new coordinates 1,4 give ζ⁸=ζ³; 3c gives ζ³ | Factor u⁻¹=3, not u⁻²=4. |
| §1.5 Brauer root change | Q₇, m=3, u=2, inv β{3,7}=1/3 | New invariant 2/3=−1/3; u⁻¹·1/3=2/3 | Root inversion negates this nonzero class. |
| §1.5 inverse weight-two coordinate | m=5, u=2 | 2⁻²=4; basis changes by 4 and inverse by 4 | Coincidence mod 5 is not used to identify contraction factor 3. |
| §1.5 field-map identity/composition | R→C→C; identity R→R | Hamilton class maps to 0 by either composite; identity preserves 1/2 | No independent choice of target root. |
| §1.6 residue dictionary | Q₇, m=3, {3,7}, ζ residue 2 | ∂ᴹ=3; κ(3) coordinate 1; cohomological residue=−1=2 | Negative square retained, coherence recorded as a gap. |
| §1.6 two units unramified | Q₇, m=3, {2,3} | ∂ᴹ=1 and −κ(1)=0; unit cup residue=0 | Zero residue does not claim zero cup over every DVR. |
| §1.6 wild exclusion | Q₂, m=2, {−1,−1} | Tame value 1; norm-residue value −1; m=0 in F₂ | Residue formula excluded, local pairing retained. |
| §2.1 monomial multiplication | m=3; e_(2,1)e_(2,2) | Carries (1,1), coefficient ζ²ab, index (1,0) | Carry and jk exponent agree. |
| §2.1 associativity/unit | m=2; e=e_(1,1) | e²=−ab; (e²)e=−ab e=e(e²); e_(0,0)e=e | Carry law and central scalars agree. |
| §2.1 generator relations | m=3 | YX=ζe_(1,1), XY=e_(1,1); X³=a, Y³=b | Opposite exponent would invert Brauer convention. |
| §2.1 basis/dimension | m=2, a=1; m=4, a=c² | Dimensions 4 and 16, even when radical degrees are 1 and 2 | Carrier is not the radical field crossed with an oversized group. |
| §2.1 universal property | Q, m=2, a=b=1; X=diag(1,−1), Y=swap | X²=I=Y²; YX=−XY; (XY)²=−I matches e_(1,1)² | Ordered monomials specify the map. |
| §2.1 scalar extension | R→C, m=2, a=b=−1 | Four basis vectors remain four; 1⊗e_(i,j)↦e_(i,j) | Identity/composition preserve each basis vector. |
| §2.1 degree-one boundary | d=1 corner; m=0 excluded | Corner dimension 1; Mat_m(F) dimension m² | No use of index 1 in Fin 1. |
| §2.2 splitting representation | m=2, α²=a | YX=[[0,−αb],[α,0]]=−XY; Y²=bI, X²=aI | Wrap factor b and commutation direction correct. |
| §2.2 eigenvalue denominators | m=3, α≠0 | α, αζ⁻¹, αζ⁻² distinct; differences α(ζ⁻ⁱ−ζ⁻ʲ)≠0 | Interpolation has no zero denominator. |
| §2.2 split/nonsplit cases | a=1 arbitrary b; R, a=b=−1; C extension | First algebra is Mat_m(F); Hamilton over R remains nonsplit; over C becomes Mat₂(C) | Root-of-a hypothesis essential for displayed splitting. |
| §2.2 central simplicity | R Hamilton; split Mat₂(F) | Centers both F; dimensions 4; ideals only 0 and whole | Descent is applied to actual splitting. |
| §2.2 full minimal polynomial warning | Mat₂(D), D quaternion division, diag(1,−1) | Ambient degree 4, u⁴=1, minimal polynomial degree 2; D remains nonsplit | Wrong general interpolation claim is excluded. |
| §2.3 radical fixed element/divisibility | F=Q(i), m=4, α²=2 | d=2 divides 4; c=2∈F; s=2; c²=4=a | Actual radical degree used. |
| §2.3 factors/idempotents | Same example | T⁴−4=(T²−2)(T²+2); two degree-2 factors | Y exchanges two idempotents; Y² preserves one. |
| §2.3 corner and matrix equivalence | Same example, arbitrary b | (eX)²=2e; (eY²)²=be; Y²X=−XY²; 16=2²·4 | Quaternion corner and matrix factor correct. |
| §2.3 extremes | d=1 and d=m | Mat_m(F) has dimension m²; Mat₁(A) has dimension m² | Both boundaries included. |
| §2.4 carry cocycle computation | m=3, i(g)=i(h)=2, j(g)=1 | δf=γ³ζ²=bζ²; dζ^(j(g)i(h))=bζ² | Positive ordered class follows by negative flip. |
| §2.4 smaller-degree cocycle | m=4,d=2,s=2; i(g)=i(h)=2 | Carry in full and corner models is 1; d=b; δf=bζ^(2j(g)) | Same inflated class; matrix factor contributes zero Brauer class. |
| §2.4 algebra/Brauer equality | Q₇, m=3, a=3,b=7 | inv[A]=1/3=inv β; opposite has 2/3 | Cubic value distinguishes sign. |
| §2.4 quaternion specialization | R, a=b=−1; a=1 | Both ordered-cup and quaternion classes give 1/2; split input gives 0 | Existing quaternion theorem used. |
| §3.1 coefficient transport | Q₇, w=6,m=3, full value ζ₆ | Power map ζ₆²; primary projection ζ₆⁴ | Distinct maps; equality with supplied coefficient projection specified. |
| §3.1 local symbol values | Q₂,{−1,−1}; Q₃,{3,−1} | N=−1 in each; first has tame value 1, second violates even-valuation unramified norm condition | Wild and unramified cases retained. |
| §3.1 tame quadratic formula | Q₅, {5,2} | ∂ᴹ=3 mod 5; Legendre(3)=−1=Legendre(2)=N | Quadratic inversion invisible; odd-degree sign checked separately. |
| §3.1 quotient/power slots | x=m y; {a,b^m}; m=1 | N(x)=N(y)^m=1; power slot H=1; μ₁={1} | Supplied quotient factorization retained. |
| §3.1 coefficient changes | w=6, d=3 then d=1 | ζ₆↦ζ₆²↦(ζ₆²)³=1; direct sixth power is 1 | Coefficient powers compose. |
| §3.2 full-root exact order | ζ^e=t^m, μ(F)=μ_m | t^(m²)=1 implies t^m=1, hence ζ^e=1 and m divides e | Class has order m; sufficient for primitive pairing value. |
| §3.2 section | Q₂, m=2; m=1 | s(−1)={−1,−1}, 2s=0, N(s)=−1; trivial coefficient gives s(1)=0 | Imported splitting satisfies formula. |
| §3.2 composite-order negative control | m=6, candidate pairing value ζ² | Order(ζ²)=3 rather than 6; image cannot contain ζ | Nonidentity is insufficient; primitive value retained. |
| §3.3 conic definition/existence | R,(0,0) and (1,−1) | First equation gives 0≠1, sign −1; second has (1,0), sign 1 | Real body fixes the object, including zeros. |
| §3.3 symmetry/one-left | Any F; (r,s)↔(s,r); (1,s) | Equation at (x,y) becomes same at (y,x); (1,0) gives 1+0=1 | API stays prose, not Lean padding. |
| §3.3 Steinberg characteristic two | F₂,r=0,1; any F,r | (0,1),(1,0) give 1; r·1²+(1−r)·1²=1 | Explicit positive Checks retained. |
| §3.3 norm bridge, nonexceptional | Q,r=2,s=−1 | Conic (1,1):2−1=1; norm (1,1):1−2=−1 | Both directions yield solubility. |
| §3.3 norm bridge, v=0 | Q,r=1,s=3 | Conic (1,0) gives 1; norm 2²−1²=3 | Exceptional coordinate handled without division by zero. |
| §3.3 norm bridge, x=0 | Q,r=2,s=−2 | Norm 0²−2·1²=−2; conic 2(3/4)²−2(1/4)²=1 | Second exceptional coordinate also handled. |
| §3.3 characteristic hypothesis | F₂(t),r=1,s=t | Conic value 1 at (1,0); norm value −1 because x²−y² is a square and t is not | Added negative-control Check; h2 explicit in headline. |
| §3.3 real criterion | (0,0),(−1,−1),(1,−1),(0,2) | Signs −1,−1,1,1; both-nonpositive predicates true,true,false,false | Weak, not strict, inequalities on total domain. |
| §3.3 dyadic obstruction | Q₂,r=s=−1 | Primitive square triple would sum to 0 mod 4; residues 0,1 force all three even | Conic sign −1, agreeing with Hilbert value. |
| §3.3 rational negative control | Q,r=3,7,21,s=−1 | Mod 3 or 7 forces B=C=0 and then A=0; all signs −1; product of first two is 1 | Counterexample retained in README, removed from acceptance file. |
| §3.4 generic conic/Hilbert headline | R,(−1,−1),(1,−1); Q,(1,3) | Conic/Hilbert signs respectively (−1,−1),(1,1),(1,1) | Equality statable at pins; no local bilinearity inferred globally. |
| §3.4 local quadratic map | Q₂,−1,−1; Q₃,3,−1 | Transported μ₂ values −1 map to integer unit −1, matching conic | Supplied N₂ used instead of new factorization. |
| §3.4 real/complex maps | R, negative pair; R, one positive; C, negative pair | Real values −1,1; C point (i,0) gives conic/Hilbert value 1 | Real map remains supplied realSignSymbol. |
| §3.4 units versus zero domain | R,(0,0) | Total sign −1; no corresponding pair in Rˣ×Rˣ | Zero is not silently admitted to K₂ symbols. |
| §3.5 cubic arithmetic orientation | Q₇, ζ residue 2, α³=3 | Nonzero cubes={1,6}; Frob ratio α⁶=9≡2; inv A=1/3; H(7,3)=ζ, H(3,7)=ζ² | Scalar comparison imported; K₂ transport retains negative exponent. |
| §3.5 supplier's cubic witness | Q₇,(7,2),(2,7) | 2²=4 gives H(7,2)=4; inverse H(2,7)=2 | Same sign as {3,7}, with the supplier's variables. |
| §3.5 root-independence | m=3,u=2,inv β=1/3 | New β coordinate 2; (ζ²)^(−2)=ζ²=ζ⁻¹ | Basis and inverse scalar cancel. |
| §3.5 invariant coordinate | m=3, inv=1/3; m=2, inv=1/2; m=1 | e₃=1 whereas 3·inv=0; ζ₂^(±1)=−1; zero coordinate gives 1 | e_m is a coordinate, never multiplication in Q/Z. |
| §4.1 common-target place factors | Q,m=2,x={−1,−1}; m=1 | Factors at 2,∞ are −1,−1; odd primes 1; m=1 all 1 | Finite-place maps consumed from KTheoryFiniteLocalFields §7.3. |
| §4.1 real containment and target transport | Real place, m=3; μ₂(Q)→μ₂(Q₂) | Real μ₃ has 1 element, not 3; ±1 map to themselves and return unchanged | No artificial real factor at higher m; common codomain fixed. |
| §4.2 finite support | Q,m=2,x={−1,−1}; m=1 | Multiplicative and invariant supports both {2,∞}; at m=1 both empty | Places above m and real places included. |
| §4.2 support addition | Same x and y=−x | support(x+y)=∅; support(x) union support(y)={2,∞} | Inclusion, not equality, is stated. |
| §4.3 product formula | Same rational Hamilton class | (−1)(−1)=1; 1/2+1/2=1=0 in Q/Z | Neither dyadic nor real term omitted. |
| §4.3 product/sum iff | m=3, coordinates k₁=1,k₂=2 | ζ^(−1)ζ^(−2)=1; (1+2)/3=1=0 in Q/Z | Injective root and torsion coordinates identify the two equations. |
| §5.1 finite local Tate dictionary | Q₇,ℓ=3,r=1; Q₂,ℓ=2 | Ordered cup has contracted inv 1/3; dyadic {−1,−1} has inv 1/2 | All allowed primes retained; no tame square at residue prime. |
| §5.1 archimedean coefficient cases | R,ℓ=2,r≥1; odd ℓ; C | H²(C₂,Z/2^r)=C₂ with nonzero symbol; odd target 0; C target 0 | Ordinary real contribution remains. |
| §5.1 equal characteristic | F₂((t)),ℓ=3; ℓ=2 | μ₃(F)=1, local degree-two target 0 and K₂/3=0; at ℓ=2, IsUnit fails | Prime-to-characteristic generality preserved. |
| §5.2 completion/residue naturality | Q,{3,7} at 7,m=3; F₃(t),{2,t},ℓ=2 at t=0 | Both restrictions send symbols to local unit images; Q₇ invariant 1/3; function-field quadratic invariant 1/2 | Actual restriction maps specified, not arbitrary isomorphisms. |
| §5.2 general adic torsion theorem | Formal coefficient diagram with injective h_ℓ; global F₃(t), {2,t} | Divisible kernel maps to 0; global class has order 2 and local invariant 1/2 | Injectivity added; arithmetic extension recorded as gap. |
| §5.2 finite coefficients need not be finite | Q,m=2, all odd primes | Each tame quotient F_pˣ/(F_pˣ)²=C₂; direct sum contains arbitrarily many independent C₂ factors | Added infinity Check; h target equally infinite. |
| §5.3 number-field ring maps | O=Z[1/2],ℓ=2,r=1 | K₂(O)/2=C₂, H²_et(O,μ₂²)=C₂; nonzero class has local pair (−1,−1) | Ordinary dyadic/real ring comparison retained. |
| §5.3 global-function-field Picard sequence | F₃(t),ℓ=2,S={∞},O=F₃[t] | Pic=0, K₂(O)/2=0; kernel of μ₂→μ₂ by sum is 0 | Added scope boundary Check; sequence is 0→0→0→0. |
| §5.3 Picard versus generic restriction | μ_ℓ⊂F and Pic(O)/ℓ=C_ℓ | μ_ℓ⊗Pic=C_ℓ, injects into ring quotient and maps to 0 in field quotient | Field Pic=0 does not erase ring kernel. |
| §5.3 weight-one Kummer sequence | Same hypothetical Pic quotient; Spec F | Ring left term C_ℓ; field left term 0 | Weight-one and weight-two sequences distinguished. |
| §5.3 localization composition/sign | {u,π}, residue Kummer coordinate 1; two successive localizations | Each remaining residue coordinate is −1; direct and composite restrictions preserve that coordinate | Generic/localization maps require declared arithmetic/coherence gaps. |
| §5.3 invertibility on O | O=Z,ℓ=2 versus Z[1/2] | 2 not a unit on Z; becomes a unit on Z[1/2] | Ring comparison asserted only on stated S domain. |
| §5.4 cofiber exactness and image | Q₂,m=2, Bott β with ∂β=−1 | Quotient sequence C₂→Z/4→C₂; red{−1,−1}=2β, ∂(2β)=1 | Supplied exactness distinguishes finite group from quotient. |
| §5.4 m=1 and field maps | Cofiber of identity; Q₂→C | All three m=1 groups 0; at m=2 roots −1 transport to −1, and zero-boundary reductions stay zero-boundary | No splitting or fresh boundary chosen. |
| §5.4 coefficient inclusion/reduction | m=6,d=2, boundary root ζ₆ | Reduction boundary ζ₆³=−1; inclusion of a d-boundary −1 retains −1 in μ₆ | Different Bockstein multipliers retained from supplier. |
| §5.4 CRT | Z/6 coordinate 5 | 5↦(1 mod 2,2 mod 3) and CRT returns 5 | No finite-by-finite product inferred. |
| §5.5 integral Chern product coefficient | i=j=1 | −(1)!/(0!0!)=−1; diagonal pullback keeps −1 | All coefficient primes allowed for integral reduction. |
| §5.5 product-normalized Chern headline | Q₇,m=3,x={3,7} | Contracted h invariant 1/3; Chern invariant −1/3=2/3 | Minus sign retained independently of Artin transposition. |
| §5.5 even-coefficient correction | Q₂,m=2, β and red{−1,−1}=2β | ∂β=−1; ∂red=1; c(red class)=1 in Z/2, whereas twice any Z/2 value is 0 | No homomorphism on arbitrary degree-two finite classes asserted; correction vanishes on reductions. |
| §5.5 raw Hurewicz comparison | ε=−1 and x={3,7} | −εh=+h, invariant 1/3; normalized formula −h has 2/3 | Raw and product-normalized maps not interchanged. |
| §5.5 raw sign change | Replace θ₂ by −θ₂, ε by −ε | θ₂∘(ε·) unchanged; coefficient −ε changes sign | Intrinsic comparison independent of raw normalization choice. |
| §5.5 arbitrary coefficient/CRT | m=6, cup coordinate 1; m=1 | Chern −1=5↦(1,2); at m=1 both groups 0 | One minus sign across all prime-power factors. |

# Maintainer consequences

The two declared supplier gaps require earlier-owner work or a human ownership decision. This repair does not assert those extensions exist and cannot close them by editing a consumer. The plan did not exist; it was added with only the permitted top-level `gaps` member. No merge-order file was changed. No supplier may use these adapters as a prerequisite for the maps being compared.

The retained Lean names are conicSymbol and conicSymbol_real_eq_neg_one_iff, with the added conicSymbol_eq_hilbertSymbol. The former conicSymbol_eq_one_iff_norm remains a README norm criterion; conicSymbol_rat_not_multiplicative remains the README rational negative control. Their declarations were removed to avoid duplicate/API and boundary targets. The roadmap-service search found no external citation of either removed name. The other removed identifier strings only catalogued future API and were never declarations. KTheoryFiniteLocalFields is consistently a supplier, including its local splitting, finite coefficients and finite-place transports; it is no longer listed as consuming this package.
