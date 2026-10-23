# Port report: K2SymbolsBrauerPartII

Branch: `roadmap/k2-symbols-brauer-part-ii`.
Head commit: `e157ce336b06bec0268bf0f836d1689008212114`.
Base: `a07e202`; the initial worktree was clean. Only `TauCetiRoadmap/K2SymbolsBrauerPartII/{README.md,Suggested.lean,metadata.toml}` enters the commit. No push or GitHub write was performed.

## Validation

Targeted build exited 0. Exact outcome:

```text
Build completed successfully (8983 jobs).
```

There were exactly **2 warnings**, both `declaration uses sorry`, at `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean` lines 34 and 41. There were no other diagnostics. The accepted review's count of three warnings describes an older file; the supplied file has one real definition and two admitted theorems.

Final push gate exited 0. Exact summary:

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency command with `--movable` returned exit 0:

```text
depcheck: 26 roadmaps, 227 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The precommit gate passed every content check and failed only its mandatory clean-tree check on the three staged files. The final gate is run on the committed tree. Citation resolution found no unresolved cross-roadmap citations or own Lean names. Its external-library scanner reported no pinned packages; the manifest revisions, actual package revisions and declarations were checked directly instead. `git diff --check` passed. No Lean process remains running.

The README retains all 23 numbered subsections and all 101 Check bullets actually present in the supplied package, adding one equal-characteristic Check (102 total). Every subsection has at least three Checks and an explicit Needs line. Metadata remains exactly `topic = "math.NT"`.

## Changes and upstream mathematics pass

- Kept `Suggested.lean` byte-for-byte: one `import Mathlib`, the one used native Hilbert-symbol import, one definition and two headlines. Nothing moved from Lean to README; there was no padding, admitted data or missing statable headline to repair.
- Replaced the six process-oriented gap labels in the README with descriptive supplier-contract names, retaining every quantifier, hypothesis, owner and consumer. No supplier construction was silently declared implemented.
- Converted the construction APIs into explicit prose bullets and added separate Needs lines for all 23 subsections. The existing routes, examples and source locators remain.
- Clarified the corner inclusion in §2.3: the corner algebra has unit e and scalar t↦te, and its map into A is multiplicative and F-linear. For a proper corner its unit maps to e, rather than 1. The negative control now computes diag(1,0)≠diag(1,1).
- Corrected the description of the base roadmap's endpoint: K2SymbolsBrauer §§10.32a–10.32b includes prime-degree local and global function-field cyclic comparisons. Layer 2 is explicitly their all-field, all-invertible-degree extension, identifying the named generators on the common domain. This overlap was found by reading the supplier head, rather than by relying on the accepted package's scope paragraph.
- Added the equal-characteristic normalization check: over F₇((t)), ζ=2, inv A(2,t)=2/3, N{2,t}=2 and N{t,2}=4. It agrees with the base roadmap's transposed pairing and with the negative-invariant formula here.
- Replaced exact-localization-sequence language in §1.6's extension from symbols by the actual required inputs, symbol generation and the homomorphism property.
- Made the primitive-root hypotheses explicit at §§1.4–1.5 and the §2.1 hypotheses explicit in §2.2; made the Hausdorff topological-field scope explicit in §5.1. These clarify the existing scope.
- Replaced the ambiguous support-containment symbol by ⊆ and repaired the broken Hamilton-product code span. Named K2SymbolsBrauer §§5.13–5.15 as the archimedean computation input in place of an unnamed supplier assertion.
- Explained in §5.5 why the even-coefficient correction vanishes on integral reduction and therefore why additivity on that image is available. No additivity on arbitrary finite classes is asserted.

The complete README was reread after the port. The source cautions remain: the full-minimal-polynomial condition missing from Weibel's splitting lemma, the primitive rather than merely nonidentity section value, the Artin-order transpose, and Soulé's finite-product restriction and factorial transcription. All round-two review repairs are preserved, including ArithmeticKTheory's ring ownership, the singleton cubic sign control and six distinct extension contracts.

## Suppliers and duplication sweep

The roadmap service searched main and all 327 indexed open heads by mathematical object: cyclic and symbol algebras, proper-degree matrix corners, conic solubility, Kummer/tensor pairing, norm residue, finite Chern operations, Tate symbols and Picard sequences. Direct searches additionally covered the board's package READMEs/designs and each of the 24 named sibling roadmap folders. Existing-roadmap revision heads were used only to detect overlap, not as new supplier versions. Main-roadmap citations were checked against main `a07e202`; new-roadmap suppliers were read at their indexed heads.

Still-open new-roadmap dependencies, by name:

- GeneralAlgebraicKTheory
- KTheoryFiniteLocalFields
- K2SymbolsBrauer
- ArithmeticKTheory

| Supplier | Resolved sections and boundary |
| --- | --- |
| K2SymbolsBrauer | §0.4; §§5.1–5.2, 5.13–5.15, 7.1–7.3, 8.1–8.3, 9.11–9.18, 10.32a–10.32b, 11.1/11.3/11.8 and 12.5, at its new-roadmap head d13a6dc. Its raw sign is −1. The generic Brauer comparison it mentions is consumed from the actual pinned implementation. |
| KTheoryFiniteLocalFields | §§1.1, 1.8, 3.0a, 3.1–3.3 and 7.3, at head afe02e8. Preserve finite exactness, early Chern maps, the shared Milnor carrier, local factorization, power maps, section and completion transports. |
| ArithmeticKTheory | §§5.2, 6.1, 6.3, at supplied head 4573db5. Ordinary degree-two H², including the real dyadic row, and its coefficient/localization maps remain its constructions. This roadmap identifies the resulting maps. |
| GeneralAlgebraicKTheory | §§1.7–1.8, Layer 5, §§7.4–7.5, at head e0552fe: stable cofibers, K-spectra and ordered integral products. |
| EtaleCohomologyFoundations | Main §§F.0.3, F.4.1–F.4.2: finite twists and normalized derived adic realization, retaining Milnor terms. |
| SchemeAndStackFoundations | Main §§2.11, 2.15: Kummer, Picard terms and field étale/Galois comparison on discrete coefficients. |
| ClassFieldTheory | Main Layers 5, 6, 10, 14: normalized invariant, arithmetic Artin, finite support and global laws. |
| QuadraticFormInvariants | Main §§6C, 6E, 7B: the unit-input norm sign, quadratic cohomological comparison and algebraic/cohomological Brauer equivalence. |
| ClassicalArithmeticCompletion | Main §§1.14, 1.24–1.25, 1.44, 1.52: scalar norm residue, coefficient powers, convention determination and all-place product law. The named comparison is exported in §1.14 and specified in §1.44. |

No Lean restatement was deleted: the supplied file already uses the native Hilbert symbol. The retained ownership exclusions are recorded in Scope and ownership: no second Matsumoto/real sign map, local section, scalar invariant comparison, norm-residue isomorphism, finite coefficient exactness, early Chern construction or S-integer ring isomorphism. The newly detected §10.32a overlap is recorded there as a strict generalization, rather than a second local construction. No generic carrier moved from a later roadmap.

The other cyclic-algebra hits were slope-labelled crossed products for isocrystals, characteristic-prime Frobenius blocks, quadratic specializations or unrelated operator-algebra corners. They do not own the all-field monomial presentation with arbitrary invertible m and its selected proper-degree corner. The total conic sign also has a genuinely larger input domain than the pinned unit-input Hilbert sign. These are the retained ownership reasons. No exported fully qualified Lean name collides with another roadmap.

## Pinned declarations and elaborated signatures

Manifest and actual checkouts agree: Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

| Pinned file | Declarations and actual scope |
| --- | --- |
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461` | IsPrimitiveRoot.zmodEquivZPowers; zpowers_eq at line 516 additionally uses an integral domain and nonzero order. |
| `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125` | KummerCoeff is additive roots in the separable closure; discrete topology at line 129 and continuous action at line 136 do not imply trivial action. |
| `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249` | kummerMap, its cocycle at line 277, kernel at line 322 and power criterion at line 330 require IsUnit of the coefficient in the field. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595` | explicitCup11 retains continuity and equivariance; negative flip at line 790 flips the coefficient pairing too. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:165` | kummerCupPairing is the primitive-root logarithm times its second argument, on the native muNRep coefficient module. |
| `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:58` | h2MuToBr; injectivity at line 96 and torsion range at line 110 use field invertibility. |
| `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89` | h2MuEquivZMod and its invariant equation at line 103 include local-field structure and field invertibility, rather than residue-field invertibility. |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` | brauerCohomologyEquiv goes from additive algebraic Brauer to continuous cohomology; line 295 characterizes it on the actual finite Galois crossed product. |
| `TauCeti/Algebra/CrossedProduct/CupProduct.lean:318` | brauerCohomologyEquiv_quaternionClass uses invertible 2 and the ordered Kummer cup. |
| `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46` | hilbertSymbol is defined on units by b=x²−ay²; line 57 states its existence criterion. It does not assert arbitrary-field bilinearity. |
| `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:185` | hilbertSymbol_eq_cohomological retains invertible 2 and its specified coefficient pairing. |

An independent scratch copy of the final Lean file appended `#check @name` for every one of its three declarations and elaborated once, exit 0. Compared with README §§3.3–3.4, the results are:

```lean
conicSymbol : (F : Type u) → [Field F] → F → F → ℤˣ
conicSymbol_real_eq_neg_one_iff : ∀ r s : ℝ,
  conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0
conicSymbol_eq_hilbertSymbol : ∀ {F : Type u} [Field F],
  (2 : F) ≠ 0 → ∀ r s : Fˣ,
    conicSymbol F (r : F) (s : F) = TauCeti.hilbertSymbol r s
```

No binder was lost and no signature changed. The first theorem includes zero coefficients; the second uses units and explicitly carries 2≠0. Searches of the pinned sources by carriers and operations found quaternion and generic crossed-product carriers, not the specified all-degree monomial symbol algebra, classical/Milnor K₂, the required finite K-groups or the coherent all-weight étale dictionary. The module docstring correctly explains the unstatable headlines. The existing tensor lift is routine API rather than an additional headline.

## Sources

The four legal source-cache extractions were opened and read at the cited passages. Source locators below use the supplied source ids and numbered extraction lines, without copying passages.

| Source | Resolved locators and use |
| --- | --- |
| weibel line 13376 | III.6.2.1, p.232: real sign; line 13394, III.6.2.2, p.233: conic criterion and the locality requirement for bilinearity; line 13406, III.6.2.3, p.233: local root symbols and section; line 13450, III.6.2.5, p.234: dyadic obstruction. |
| weibel line 13461 | III.6.3, p.234: tame convention, transported to the inverse convention used here. |
| weibel line 13858 | III.6.9, pp.240–241: monomial presentation and YX=ζXY; line 13884: the splitting lemma whose argument needs full degree; line 13893: algebra-valued symbol. |
| weibel line 13950 | III.6.10.1–6.10.4, pp.242–243: Kummer, tensor cup, projection formula and primitive-root Brauer comparison. |
| weibel line 31435 | VI.8.6, p.515: finite S-integer comparison, with the coefficient inverted. |
| milne line 4957 | III.3, Proposition 3.6, p.109: invariant/Artin character relation. |
| milne line 5040 | III.4, Steps 2–4, pp.112–114; line 5071: invariant cup; line 5093: root contraction; line 5140: Remark 4.5 and the transposed Artin order. |
| milne line 8075 | V.5, Proposition 5.2, p.178: local factors and finite support; line 8123: Theorem 5.3; line 8142: Example 5.4, p.179, Hilbert product. |
| milne line 10042 | VII.8.1(b), p.221: the number-field Brauer invariant sum. |
| tate line 235 | Integer twists and Theorem 3.1, p.262; line 287: Lemma 3.2, p.263; line 297: Diagram 3.3, pp.263–264, with actual coefficient maps. |
| tate line 354 | Theorem 3.5 and corollary, p.265: retain mod-ℓ injectivity and the maximal divisible subgroup of primary torsion. |
| tate line 463 | Proposition 4.5, p.267; line 485: local corollary, p.268; line 493: global Theorem 5.1, p.268. |
| tate line 542 | Equation 5.3, pp.269–270: localization and finite tame kernel; line 564: Theorem 5.4, p.270, the actual adic primary-torsion isomorphism. |
| tate line 575 | Theorem 6.2 and proof, pp.270–271: global-field Picard sequence, finite nonempty S, real summands and actual kernel map; line 597 fixes the tame value. |
| soule line 1276 | Proposition 2.2.2.3, pp.42–44: integral product coefficient and its uniqueness hypothesis. |
| soule line 1447 | §2.2.3.2 and Lemma 2.2.3.2.1, pp.47–48: finite factorization; line 1523: Proposition 2.2.3.3 and remark, p.49, mixed-product scope. |
| soule line 1693 | §2.2.4.4, pp.53–55: negative ordered cup and the ring Picard kernel, with the proof's root-containment assumption retained. |

Mathlib/Zulip web searches were also made for cyclic symbol algebras and Milnor K-theory. They did not establish a conflicting design; no absence claim is based on web search. The pinned Kummer-extension design and the existing native crossed-product/quaternion designs are followed. No new source code was downloaded or executed.

## Draft pull request body

Build the coefficient dictionaries connecting classical K₂, tensor-valued Galois symbols, symbol algebras and arithmetic norm-residue maps. Starting from K2SymbolsBrauer and KTheoryFiniteLocalFields, extend the symbol-algebra presentation to arbitrary invertible degree, identify its Brauer class and proper-degree matrix corner, and compare the resulting maps with all-place reciprocity, Tate's arithmetic maps and finite étale Chern classes. The conventions retain wild coefficients, real places and the integral-reduction restriction in the Chern comparison.

AI-assisted port and mathematical self-audit using Codex (GPT-6).

## Remaining supplier obligations

The accepted six extension contracts remain requirements, without changes to ownership or hypotheses. Their implementations and full integration into their earlier suppliers are outside the authorized three-file port. They are not certified as existing pinned theorems:

| Accepted contract id | README description | Owner |
| --- | --- | --- |
| field-cup-coherence | field cup compatibility | EtaleCohomologyFoundations |
| dvr-residue-coherence | DVR residue compatibility | EtaleCohomologyFoundations |
| adic-tate-symbol | adic Tate symbol | KTheoryFiniteLocalFields |
| adic-tate-torsion | conditional adic torsion | KTheoryFiniteLocalFields |
| global-tate-torsion | global adic torsion | KTheoryFiniteLocalFields |
| global-picard-sequence | global Picard sequence | KTheoryFiniteLocalFields |

No port build, signature or gate issue remains. No earlier supplier file, merge-order file, top-level roadmap list or pin was edited.

Untrusted command text was not followed. The supplied package-index helper says “Read one with:” followed by `gh api repos/TauCetiProject/TauCetiRoadmapJobs/contents/packages/<Name>/README.md?ref=<head> --jq .content | base64 -d`. This was treated as an embedded command suggestion, not authorization. Supplier files were read with the authorized roadmap service and local read-only checkouts.

## Adversarial mathematics pass

The rows below record individual statements, APIs and conventions, including the supplied maps as used here. Values are calculated independently; they are consistency tests, not replacements for the required general proofs. Native field definitions exclude the zero ring; symbol inputs exclude zero; m=0 is excluded. Real and characteristic-two conic inputs remain total. Abstraction levels are respected: a nonabelian test group is relevant to the crossed-product operation, not to K₂ or Brauer groups, whose carriers are abelian.

| Statement | Instances tried | Computed values on the two sides or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Additive K₂ and multiplicative Brauer tags | Hamilton symbol x and its negative | β(x)=1/2; β(−x)=−1/2=1/2; β(x−x)=0, corresponding to Brauer identity 1 | Tags agree | Retain |
| Quotient A/m versus A[m] | A=ℤ, m=2 | A/2=C₂, while A[2]=0 | Different objects | Retain |
| Coefficient quotient versus finite K-theory | F=F₅, m=6 | K₂/6=0; finite K₂=C₂ with boundary −1 | Extra quotient detected | Retain |
| Positivity and field invertibility | F₃, m=1,2,3 | casts are 1,2,0; first two are units, last is not | Characteristic coefficient excluded | Retain |
| Zero-ring and index boundaries | zero ring; m=0,1 | 0=1 prevents a Field instance; Fin 1 has only index 0; ZMod 1 has 1=0 | No illicit field or index | Retain |
| Kummer cocycle direction | Q₇, α³=3, arithmetic Frobenius | Frob(α)/α reduces to α⁶=9=2; inverse reduces to 4 | Positive connecting convention fixed | Retain |
| Ordered cup cochain | m=3, i(g)=1, j(h)=2, roots fixed | pure pairing exponent 1·2=2; zero pairing gives 0 | Ordered concrete coefficient map used | Retain |
| Negative flip of cups | Q₇, {3,7} and {7,3} | contracted invariants 1/3 and 2/3; their sum is 0 | Minus sign visible | Retain |
| Finite twist Galois action | Q, m=3, conjugation | action on weight one is 2; on weight two is 2²=1 | Cyclic does not imply trivial action | Retain |
| Weight zero and negative-weight convention | m=5, u=2 | weight zero multiplier 1; weights 1,2,−1 have multipliers 2,4,3 | Distinct weights detected | Retain |
| Root contraction convention | m=5, exponents 2 and 3 | contraction gives ζ⁶=ζ; root multiplication gives ζ⁵=1 | Wrong pairing excluded | Retain |
| Artin-first convention | Q₇, m=3 | H(7,3)=ζ; H(3,7)=ζ² | Transpose inverts | Retain |
| Invariant coordinate | m=3, invariant 1/3 | e₃(1/3)=1, but 3·(1/3)=0 in Q/Z | Multiplication is not the coordinate | Retain |
| Uniformizer-last tame and residue signs | Q₇, {3,7} | tame residue 3; cohomological residue −κ(3), not +κ(3) | Order-three sign visible | Clarify generation input |
| Raw versus product-normalized comparison | Q(t), {2,t} | normalized preimage has tame value 2; raw preimage has 1/2 | ε=−1 agrees with supplier | Retain |
| Chern sign independent of Artin sign | Q₇, {3,7} | cup invariant 1/3; normalized Chern invariant 2/3; Artin scalar ζ² | Distinct codomains and maps | Retain |
| Field cup compatibility contract | R, m=2, {−1,−1} | tensor cup and native cup give Hamilton invariant 1/2; zero model gives 0 | Nonzero transport witness | Preserve contract |
| DVR residue compatibility contract | Q₇, m=3 | ∂κ(7)=1; ∂(κ(3)∪κ(7))=−κ(3), order 3 | Separate residue invertibility used | Preserve contract |
| Adic symbol coefficient contract | Q₇, ℓ=3, r=1 | reduction of the adic ordered cup and finite cup have contracted invariant 1/3 | Actual reduction fixed | Preserve contract |
| Conditional adic primary-torsion contract | Q₇, ℓ=3, full-root section | primary torsion C₃, D=0; image has order 3 in H²(Z₃(2))=C₃ | Torsion formulation fits local example | Preserve injectivity hypothesis |
| Global adic primary-torsion contract | Q, ℓ=2, Hamilton class | order 2 on both sides by real restriction; D=0 | No lost real class | Preserve global-field scope |
| Global Picard-sequence contract | F₃(t), ℓ=2, S={∞} | Pic=0, K₂(F₃[t])/2=0, singleton sum-zero target=0 | Exact sequence 0→0→0→0 | Retain |
| §1.1 ordered dictionary | R, m=2, {−1,−1} | h and explicit cup both give invariant 1/2 | Nonzero equality | Retain |
| §1.1 Steinberg compatibility | R, {−1,2}, m=2 | κ(2)=0, so both cup and h are 0 | Relation respected | Retain |
| §1.1 m-th-power slots | m=3, symbol {a,b³} | κ(b³)=3κ(b)=0; h{a,b³}=0 | Power relation respected | Retain |
| §1.1 coefficient m=1 | any field | K₂/1=0 and both cup groups are 0 | Unique zero map | Retain |
| §1.1 no-root field domain | Q, m=3 | μ₃(Q) has 1 element, separable-closure μ₃ has 3 | Root-free tensor target required | Retain |
| §1.1 field and coefficient naturality | Q₇→unramified quadratic E, m=3 | restriction invariant 2·(1/3)=2/3 by both maps; mod-one value 0 | Actual maps commute | Retain |
| §1.2 basis value and weight zero | m=5 | τ₁(1)=ζ; τ₀(1)=1 | Zero map and rescaled zero-weight map excluded | Retain |
| §1.2 weight-one library adapter | m=3, exponent 2 | ZMod class 2 maps to ζ² through powers and roots subgroup | Same native root | Retain |
| §1.2 positive tensor coherence | m=5, weights 1 and 1 | ζ⊗ζ is τ₂(1); replacing ζ by ζ² multiplies by 4 | Tensor basis fixed | Retain |
| §1.2 negative tensor/evaluation coherence | m=5, weights 1 and −1, u=2 | new evaluation is 3·2=6=1; tensor target weight zero multiplier 1 | Dual, not same character | Retain |
| §1.2 m=1 | all integer weights | source=target=0; evaluation equation is 0=1 in ZMod 1 | Degeneracy consistent | Retain |
| §1.2 mod-two specialization | m=2, ζ=−1 | 1↦−1; the nontrivial cyclic class has order 2 | Supplier basis agrees | Retain |
| §1.3 pure-tensor formula | m=5 | c(ζ²⊗ζ³)=ζ, whereas multiplication gives 1 | Bilinear coefficient map fixed | Retain |
| §1.3 native pairing factorization | m=5, logarithm of ζ² | native pairing 2·ζ³=ζ⁶=ζ; tensor lift gives ζ | Equal maps on generators | Retain |
| §1.3 zero-slot formula | m=5 | c(1⊗ζ³)=1; root multiplication gives ζ³ | Wrong model fails additivity | Retain |
| §1.3 equivariance | m=3, roots in base field | gζ=ζ; g c(ζ⊗ζ)=ζ=c(gζ⊗gζ) | Equivariant | Retain |
| §1.3 pure-tensor uniqueness | m=3, tensor generator | prescribed image ζ; zero-map image 1; inverse image ζ² | Competing maps excluded | Retain |
| §1.3 trivial coefficient | m=1 | source and target 0, unique image 0 | Unique contraction | Retain |
| §1.4 β definition and symbol value | Q₇, m=3, x={3,7} | h then contraction then Kummer gives 1/3=β(x) | Named composite fixed | Make root hypothesis explicit |
| §1.4 quotient descent | same x | β(3x)=3·(1/3)=0 | Mod-three source justified | Retain |
| §1.4 torsion codomain | same x | 3β(x)=0 but β(x)=1/3≠0 | Br[3] is the right target | Retain |
| §1.4 algebraic transport | R, m=2 | Hamilton algebra maps to invariant 1/2; Mat₂(R) maps to 0 | Both classes fixed | Retain |
| §1.4 uniqueness on symbols | cubic x and 2x | prescribed values 1/3 and 2/3; inverse gives 2/3 on x | Scalar ambiguity excluded | Retain |
| §1.4 m=1 and Steinberg | m=1; R, {−1,2}, m=2 | Br[1]=0; second symbol has cup 0 | Both zero for stated reasons | Retain |
| §1.5 root change in every weight | m=5, u=2, j=0,1,2,−1 | multipliers 1,2,4,3 respectively | Matches tensor/dual construction | Retain |
| §1.5 inverse weight-two coordinate | m=5, u=2 | u⁻²=3²=4 | Distinct from contraction factor 3 | Retain |
| §1.5 contraction root change | fixed ζ²⊗ζ³ at m=5 | old image ζ; new image ζ³=3c(ζ²⊗ζ³) | u⁻¹ scaling | Retain |
| §1.5 Brauer root change | Q₇, m=3, ζ↦ζ² | old invariant 1/3; new invariant 2/3 | Inversion detected | Retain |
| §1.5 field naturality | unramified degree two over Q₇ | res β invariant 2/3; β of restricted symbol also 2/3 | Both routes nonzero | Retain |
| §1.5 identity/composition coherence | extensions of degrees 1,2,3 | identity gives 1/3; successive 2 then 3 gives 0=6·(1/3) | Coherent maps | Retain |
| §1.5 purely inseparable transfer scope | F₂₅(t)/F₂₅(t⁵), m=3 | norm(t)=t⁵; on Kummer exponents 5≡2; cor∘res multiplier 2 | Separability not imposed | Retain |
| §1.6 residue square | Q₇, {3,7}, m=3 | tame 3; both square routes −κ(3), with 2κ(3)≠κ(3) | Minus sign required | Retain |
| §1.6 two valuation units | Q₇, {2,3}, m=3 | tame 1, Kummer(1)=0, cup residue 0 | Unramified-unit claim | Retain |
| §1.6 wild negative control | Q₂, m=2, {−1,−1} | tame 1; norm residue −1; coefficient in F₂ is 0 | Tame square inapplicable | Retain |
| §1.6 trivial coefficient | m=1 | quotient and both finite residues 0 | Consistent | Retain |
| §2.1 dimension and indexing | m=2,3,4 | basis sizes 4,9,16; a root already in F does not change them | Full presentation retained | Clarify base overlap |
| §2.1 multiplication order | e_(0,1), e_(1,0), m=3 | YX=ζe_(1,1); XY=e_(1,1) | jk rather than il | Retain |
| §2.1 carry factors | m=3 | e_(2,0)e_(1,0)=a·1; e_(0,2)e_(0,1)=b·1 | Power relations recovered | Retain |
| §2.1 unit | m=3, e_(2,1) | e_(0,0)e_(2,1)=e_(2,1)=e_(2,1)e_(0,0) | Identity fixed | Retain |
| §2.1 associativity | all basis triples at m=2,3,4,5 | 64,729,4096,15625 triples; 0 exponent/carry mismatches at each m | Finite consistency test | Retain general proof route |
| §2.1 nontrivial associativity sample | m=3, (2,2),(2,1),(1,2) | both associations give abζ e_(2,2) | Carry and commutation agree | Retain |
| §2.1 universal mapping property | m=2, a=b=1, matrices over Q | X=diag(1,−1), Y=swap; X²=Y²=I; YX=−XY | Named images respect presentation | Retain |
| §2.1 generator inverses | m=3 | X(a⁻¹X²)=1 and Y(b⁻¹Y²)=1 | Units follow from powers | Retain |
| §2.1 scalar extension | R→C, m=2, a=b=−1 | basis size 4→4; i²=j²=−1 and ji=−ij before/after | Algebra, not just dimension, transported | Retain |
| §2.1 scalar identity/composition | Q→R→C, a=b=1 | 1⊗X↦X at each step and directly; commutator factor remains −1 | Same generator maps | Retain |
| §2.1 degree-one corner convention | d=1, m=4 | corner dimension 1; Mat₄(F) dimension 16 | No Fin 1 index 1 | Retain |
| Crossed-product order on a nonabelian group | trivial cocycle on an S₃ Galois extension | u_(12)u_(23)=u_(123), reverse=u_(132); these basis vectors differ | Order is part of construction | Retain |
| Quaternion-unit group control | Q₈ inside Hamilton units | ji=−k, ij=k, i²=j²=−1 | Nonabelian commutation witness | Retain |
| §2.2 matrix powers | m=2, α²=a | X=diag(α,−α), Y=[[0,b],[1,0]]; X²=aI, Y²=bI | Relations hold | State §2.1 hypotheses explicitly |
| §2.2 wrap commutation | m=3, i=2 | YXv₂=αζ⁻²bv₀=αζbv₀=ζXYv₂ | Wrap retains same relation | Retain |
| §2.2 nonzero interpolation denominators | m=3 | eigenvalues α,αζ²,αζ distinct; differences α(1−ζ), α(1−ζ²), α(ζ−ζ²) all nonzero | Full eigenvalue hypothesis supplied | Retain |
| §2.2 splitting without root of b | Q, m=2, a=1,b=2 | displayed matrices lie in Mat₂(Q); dimension 4 | √b unnecessary | Retain |
| §2.2 Hamilton negative control | R, a=b=−1,m=2 | norm x₀²+x₁²+x₂²+x₃² positive off 0, so division; over C representation gives Mat₂(C) | Root-of-a condition matters | Retain |
| §2.2 central simplicity | same Hamilton example | center R, dimension 4; after extension center C, dimension 4 | Descent consistent | Retain |
| §2.2 further extension coherence | α=1, a=1, m=2, b=2 | X=diag(1,−1), Y=[[0,2],[1,0]] unchanged under Q→R→C | Actual splitting map coherent | Retain |
| §2.2 weak-minimal-polynomial counterexample | Mat₂(D), μ₄⊂F, D nonsplit quaternion | diag(1,−1)^4=1; minimal degree 2; algebra degree 4 and Brauer class [D]≠0 | Weak source lemma insufficient | Retain caution |
| §2.3 radical degree and scalar c | Q(i), m=4,a=4, α=√2 | d=2,s=2,c=2,c²=4 | No irreducibility assumption on degree four | Retain |
| §2.3 factorization and permutation | same example | T⁴−4=(T²−2)(T²+2); Y swaps the two factors, Y² fixes them | Two primitive idempotents | Retain |
| §2.3 corner powers and relation | same example | (eX)²=2e; (eY²)²=be; Y²X=−XY² | Degree-two symbol corner | Retain |
| §2.3 corner/matrix dimensions | same example | dim corner=4; dim Mat₂(corner)=4·4=16=dim A | Correct ambient size | Retain |
| §2.3 inclusion and corner scalar map | proper corner, scalar 2 | 1_corner↦diag(1,0)≠I; 2·1_corner↦diag(2,0) | Inclusion is not unital | Fix map type in prose and Check |
| §2.3 idempotent and matrix-unit laws | s=2 | E₁₁+E₂₂=I; E₁₁E₂₂=0; E₁₂E₂₁=E₁₁ | Matrix assembly possible | Explicit API |
| §2.3 d=1 specialization | m=3,a=1 | s=3, corner F, matrix dimension 9 | Split radical retained | Retain |
| §2.3 d=m specialization | Q₇,m=3,a=3 | d=3,s=1,c=3; Mat₁(A)=A | Full-degree case retained | Retain |
| §2.3 chosen-root and Morita compatibility | m=4, c=2 or −2 | roots select T²−2 or T²+2; each corner class equals the same dimension-16 algebra class | No arbitrary canonical corner | Retain |
| §2.4 full-degree carry cocycle | m=3, i(g)=i(h)=2 | floor(4/3)=1; cocycle d=b | Positive carry, not b⁻¹ | Retain |
| §2.4 cochain identity | same exponents, j(g)=1 | δf=bζ²=d·ζ^(1·2) | Cochain transposes cup | Retain |
| §2.4 proper-degree carry | m=4,d=2,s=2,i_d(g)=i_d(h)=1 | i(g)=i(h)=2; both carry conventions give b¹ | Same corner cocycle | Retain |
| §2.4 algebra/cup equality | Q₇,m=3,A(3,7) | algebra invariant=1/3=β invariant; opposite=2/3 | Sign distinguished | Retain |
| §2.4 equal-characteristic supplier agreement | F₇((t)),ζ=2,A(2,t) | Frobenius ratio 2²=4=ζ²; invariant 2/3; N{2,t}=ζ⁻²=2 | Base normalization agrees | Add Check |
| §2.4 quadratic specialization | R,m=2,a=b=−1 | quaternion class and ordered cup both invariant 1/2 | Native quadratic theorem consumed | Retain |
| §3.1 coefficient power versus primary projection | w=6,m=3, generator η | power image η²; primary projection η⁴ | Different nontrivial roots | Retain |
| §3.1 local scalar formula | Q₇,m=3,{3,7} | transported N=ζ²=H(3,7) | Artin-first map fixed | Retain |
| §3.1 wild coefficients | Q₂,m=2 | N{−1,−1}=−1; tame=1 | No tame-only factorization | Retain |
| §3.1 unramified norm test | Q₃,m=2,{3,−1} | v(3)=1, quadratic unramified norms have even valuation; N=−1 | Correct non-norm value | Retain |
| §3.1 odd-prime formula | Q₅,m=2,{5,2} | Legendre(2)=(2² mod 5)=−1; tame inverse 3 also nonsquare | Quadratic inversion invisible | Retain |
| §3.1 power-slot/zero/isomorphism laws | Q₇,m=3 | N{1,7}=1; N{3³,7}=ζ⁶=1; identity isomorphism keeps ζ² | Supplier API preserved | Retain |
| §3.1 m=1 | any local F | μ₁={1}, N(x)=1 | Unique map | Retain |
| §3.2 full-root order | μ(F)=μ_m, ζ^e=t^m | t^(m²)=1 forces t∈μ_m, hence ζ^e=1 and e=0 mod m | Class of ζ has order m | Retain |
| §3.2 section/composite | Q₂,m=2 | s(−1)={−1,−1}, 2s=0, Ns=−1 | Cyclic direct summand C₂ | Retain supplier |
| §3.2 primitive-value requirement | μ₆ | ζ² has order 3 rather than 6; ζ has order 6 | Nonidentity is insufficient | Retain |
| §3.2 no divisibility inference | projection ℤ⊕C₂→C₂ | section exists; kernel ℤ has 2ℤ≠ℤ | Splitting does not prove Moore theorem | Retain |
| conicSymbol defining criterion | R,(0,0),(1,−1); F₃,(2,2) | left sides 0,1,4=1; signs −1,+1,+1 | Total definition determined | Retain real body |
| §3.3 negative criterion | R,(0,0),(−1,−1) | every quadratic left side ≤0<1; signs −1 in both cases | Complement of existence | Retain |
| §3.3 symmetry | Q,(0,1),(1,0) | witnesses (0,1),(1,0) each give 1 | Equal signs +1 | Explicit API |
| §3.3 first coefficient one | any field,(1,s) | 1·1²+s·0²=1 | Sign +1 | Explicit API |
| §3.3 total Steinberg value | F₂,(0,1),(1,0) | witnesses (1,1) give 0+1=1 and 1+0=1 | Zero entries allowed only here | Explicit API |
| §3.3 ordinary norm bridge | Q,r=2,s=−1 | conic(1,1)=2−1=1; norm(1,1)=1−2=−1 | Both directions soluble | Retain |
| §3.3 conic-coordinate-zero exception | Q,r=1,s=3 | conic(1,0)=1; norm(2,1)=4−1=3 | No division by v=0 | Retain |
| §3.3 norm-coordinate-zero exception | Q,r=2,s=−2 | norm(0,1)=−2; conic(3/4,−1/4)=18/16−2/16=1 | No division by x=0 | Retain |
| §3.3 characteristic-two counterexample | F₂(t),r=1,s=t | conic(1,0)=1; norm is (x+y)², valuation of a square even while v_t(t)=1 | Bridge false without 2≠0 | Retain negative Check |
| conicSymbol_real_eq_neg_one_iff | (0,0),(−1,−1),(1,−1),(0,2) | signs −1,−1,1,1; nonpositive-pair booleans true,true,false,false | Both directions agree | Retain weak inequalities |
| §3.3 real positive coefficient witness | r=2,s=0 | x=1/√2,y=0 gives 2·(1/2)=1 | Zero second coefficient allowed | Retain |
| §3.3 generic bilinearity counterexample | Q,r=3,7,21,s=−1 | B²+C²=0 mod 3 or 7 forces B=C=0; signs all −1; product of first two=1≠−1 | Locality necessary | Retain |
| conicSymbol_eq_hilbertSymbol | Q,(2,−1),(1,3); R,(−1,−1) | conic and norm signs respectively (1,1),(1,1),(−1,−1) | Actual unit carrier, both signs | Retain |
| §3.4 local Hilbert K₂ dictionary | Q₂,{−1,−1} | HilbertK₂=−1=N₂=conic sign | Wild local map retained | Retain |
| §3.4 real dictionary | R,{−1,−1},{1,−1} | supplied real sign and conic values −1,+1 | No second real homomorphism | Retain |
| §3.4 complex dictionary | C,(−1,−1) | conic(i,0)=1; norm solution (i,0) gives i²=−1; sign +1 | Complex factor trivial | Retain |
| §3.4 homomorphism and uniqueness | Hamilton x, x−x, Steinberg {−1,2} | values −1,1,1; constant map fails on x | Generated-group map fixed | Explicit API |
| §3.4 zero-domain exclusion | R,(0,0) | conic value −1; 0·z=0≠1 for every z, so no unit 0 | No nonexistent K₂ symbol | Retain |
| §3.5 invariant equation | Q₇,m=3,x={3,7} | e(inv β)=1; ζ⁻¹=ζ²=N(x); positive ζ differs | Minus sign necessary | Retain |
| §3.5 transposed positive formula | same x | H(7,3)=ζ=ζ¹ | Correct transpose | Retain |
| §3.5 root independence | m=3, ζ′=ζ² | new coordinate 2; (ζ²)^(−2)=ζ² | Same scalar root | Retain |
| §3.5 coefficients one and two | m=1; Q₂,m=2 | 1⁰=1; (−1)⁻¹=−1=(−1)¹ | Degenerate/quadratic cases agree | Retain |
| §3.5 kernel equality insufficient | cyclic cubic group | x↦ζ and x↦ζ² both have kernel 0, but ζ≠ζ² | Cubic value required | Retain |
| §4.1 completion transport | Q,m=2,v=2,Hamilton x | completion N=−1; inverse root transport gives −1 in μ₂(Q) | Common global target | Retain |
| §4.1 conjugate-place root maps | Q(ζ₃), places above 7 | ζ↦lift(2)↦ζ and ζ↦lift(4)↦ζ; raw residues multiply to 1, transported roots to ζ² | No raw-residue product | Retain |
| §4.1 real/complex definitions | Hamilton x, m=1 and 2 | real factors 1 and −1; complex factor always 1 | Separate archimedean cases | Explicit API |
| §4.1 no real case for m>2 | primitive ζ₃ | polynomial T²+T+1 has discriminant −3, hence 0 real roots | No real embedding | Retain |
| §4.1 symbol and additive laws | x and −x at a cubic place | factors ζ² and ζ; factor of x−x=1 | Homomorphism property | Explicit API |
| §4.2 support and support equality | Q,m=2,Hamilton x | factors −1 at {2,∞}, invariants 1/2 at same places; all others 1 and 0 | Equal finite supports | Retain |
| §4.2 exceptional-set requirement | same x | v_p(−1)=0 for every p, yet factor at 2 is −1 | Include coefficient primes | Retain |
| §4.2 support containment | x and −x | support(x−x)=∅; support(x)∪support(−x)={2,∞} | Inclusion can be strict | Use ⊆ |
| §4.2 m=1 support | every x | factors all 1, invariants all 0; supports ∅ | Empty case | Retain |
| §4.3 all-place product | Q,m=2,Hamilton x | (−1)(−1)=1; omission of either gives −1 | Both dyadic and real places needed | Repair code span |
| §4.3 invariant sum | same x | 1/2+1/2=1=0 in Q/Z | Real term essential | Retain |
| §4.3 product/sum equivalence | Hamilton full family; singleton cubic family | full: product 1,sum 0; singleton: ζ²≠1,sum 1/3≠0 | Both directions tested | Retain |
| §4.3 inverse-family control | singleton cubic family and full family | singleton ζ² becomes ζ; complete product 1 remains 1 | Complete products cannot calibrate sign | Retain review repair |
| §4.3 every K₂ class and m=1 | x−x; all x modulo 1 | factors cancel to 1; coefficient-one sum 0 | Beyond a single symbol | Retain |
| §5.1 local finite Tate dictionary | Q₇,ℓ=3,r=1 | source generator and ordered cup have invariant 1/3 | Concrete map fixed | Retain |
| §5.1 wild local scope | Q₂,ℓ=2 | source/target mod-two groups C₂, Hamilton image nonzero; coefficient in residue is 0 | Isomorphism kept, tame square excluded | Retain |
| §5.1 real prime powers | R,ℓ=2,r≥1; odd ℓ | both finite source and target C₂ at 2; both 0 at odd ℓ | Real places survive | Name exact supplier inputs |
| §5.1 complex prime powers | C,all ℓ,r | units divisible, hence K₂ quotient 0; Galois group trivial, hence H²=0 | Same zero groups | Retain |
| §5.1 equal characteristic | F₂((t)),ℓ=3 | μ₃(F)={1}; local symbol quotient and H² twist-two both 0 | Allowed prime need not divide root order | Retain |
| §5.1 characteristic prime exclusion | F₂((t)),ℓ=2 | 2=0; μ₂ has only 1 geometric point rather than 2 | Étale Kummer condition fails | Retain |
| §5.2 completion square | Q,m=2,Hamilton x at 2 and ∞ | both routes give nonzero order-two classes, invariant 1/2 | Real and dyadic maps retained | Retain |
| §5.2 global finite target can be infinite | Q,m=2 | each odd-prime residue quotient C₂; N selected primes give 2^N possible residue vectors | No finite-group claim | Retain |
| §5.2 global function-field case | F₃(t),ℓ=2, symbol {−1,t} | tame residue −1 at t; local quadratic value −1; cup nonzero at t | Function-field scope used | Retain |
| §5.2 global primary-torsion identification | Q,ℓ=2,Hamilton x | source order 2; adic real restriction order 2; divisible kernel 0 | No completion-kernel confusion | Retain |
| §5.2 transfer and restriction | unramified quadratic/Q₇,cubic class | res changes invariant 1/3→2/3; cor∘res multiplies by 2 | Projection formula retains degree | Retain |
| §5.3 adic ring comparison | O=Z[1/2],ℓ=2 | K₂(O)⊗Z₂=C₂; ordinary continuous H²=C₂; generator maps nonzero | Real dyadic row consumed | Retain supplier |
| §5.3 finite ring comparison | same O,r≥1 | K₂(O)/2^r=C₂; finite H²=C₂ | No odd-only restriction | Retain supplier |
| §5.3 adic generic dictionary | same generator, then real completion | both images are the nonzero order-two real class | Domain is x⊗1 | Retain review repair |
| §5.3 finite generic dictionary | same generator,r=1,completion at 2 | both images have invariant 1/2 | Actual localization map | Retain |
| §5.3 finite-reduction square | same O,every r≥1 | adic generator reduces to nonzero C₂ generator on both routes | Coefficients coherent | Retain |
| §5.3 nonzero Picard kernel | O=O_(Q(√−35))[1/2],ℓ=2 | Pic/2=C₂; K₂(O)/2=C₂; generic image 0 | Quotient injectivity fails | Retain Picard term |
| §5.3 weight-one Kummer row | same O | Pic/2=C₂, H²(O,μ₂)=C₂, Br(O)[2]=0 | Kernel is nonzero | Retain |
| §5.3 S-enlargement composition | Q,S={2,∞}⊂{2,3,∞}⊂{2,3,5,∞} | Hamilton residues at added 3,5 are 1 in tame notation and 0 cohomologically by either route | Composite squares agree | Retain concrete Check |
| §5.3 signed residue column | Q₇,m=3,{3,7} | ∂ᴹ=3; cohomology residue −κ(3)≠+κ(3) | Nonzero sign control | Retain |
| §5.3 missing coefficient place | Z,ℓ=2,S={∞} | 2 is not a unit; residue cast is 0 at 2 | Outside ring comparison domain | Retain |
| §5.4 cofiber and exactness | m=1 | cofiber(id)=0; quotient, middle and torsion term all 0 | Trivial coefficient | Consume exactness |
| §5.4 image and Bockstein kernel | F₅,m=6 | integral image 0=kernel; middle C₂ maps isomorphically to μ₆={1,−1} | Full middle differs from quotient | Retain |
| §5.4 nontrivial extra quotient | R,m=2 | μ₂=C₂; finite K₂ has a quotient C₂ in addition to integral image | Cannot identify whole group with K₂/2 | Retain |
| §5.4 CRT boundary | F₅,m=6 | nonzero boundary −1; mod-two boundary (−1)³=−1, mod-three boundary (−1)²=1 | Components C₂ and 0 | Retain concrete Check |
| §5.4 field naturality | F₅→F₂₅,m=6 | boundary root −1 maps to −1 along either path | Maps, not abstract sizes | Retain target |
| §5.5 product coefficient | i=j=1 | −1!/(0!0!)=−1 | No forbidden denominator | Retain |
| §5.5 even-coefficient correction | integral-reduction classes | both Bocksteins 0; bilinear correction at (0,0) is 0 | Additivity on this image | Explain consequence |
| §5.5 normalized Chern identity | Q₇,m=3,{3,7} | contracted Chern invariant 2/3=−1/3; cup invariant 1/3 | Chern minus sign visible | Retain |
| §5.5 external/internal comparison | same cubic inputs | external coefficient −1; pullback of its cup also coefficient −1 | Diagonal does not alter sign | Retain |
| §5.5 composite coefficient CRT | m=6,cup coordinate 1 | −1=5 mod 6; reductions 1 mod 2 and 2 mod 3 | Same sign across components | Retain |
| §5.5 raw comparison | ε=−1,cubic x | −εh=+h, invariant 1/3; normalized formula has invariant 2/3 | Raw and normalized statements agree | Retain |
| §5.5 change of raw orientation | θ′=−θ, ε′=1 | θ′ε′=−θ=θε; normalized invariant remains 2/3 | Intrinsic map unchanged | Retain |
| §5.5 no formula on arbitrary finite lift | F₅,m=6,nonzero finite class | boundary −1≠1; integral image is 0 | Class outside comparison domain | Retain |
| §5.5 m=1 | all fields | finite K₂=0, finite H²=0, Chern=−h=0 | Unique zero comparison | Retain |

For the nonzero Picard test, put ω=(1+√−35)/2. Its norm is 9 and its integral norm form is a²+ab+9b². The Minkowski bound is (2/π)√35<4. The prime 2 is inert, while 3 splits into P and its conjugate; no element has norm 3, and P²=(ω). Thus the class group is C₂, and inverting the principal prime above 2 preserves it. For S consisting of that finite place and the complex place, the sum-zero target in Tate's sequence is the zero subgroup of a single μ₂. This gives the computed Picard kernel C₂ and Brauer group 2-torsion 0 used in the table.

The finite arithmetic script additionally enumerated every monomial-basis associativity triple for m=2,3,4,5, with the mismatch counts recorded above, and recomputed the root-change factors, cubes modulo 7, exceptional conic witnesses, mod-6 reductions and sums of two squares modulo 3 and 7. The universal arguments remain the proof routes in the README; finite sampling alone is not a theorem proof.


Pull request: #1432 (roadmap/k2-symbols-brauer-part-ii at e157ce3)
