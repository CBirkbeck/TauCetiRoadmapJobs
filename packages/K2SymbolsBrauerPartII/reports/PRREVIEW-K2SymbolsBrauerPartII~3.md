# Review of K2SymbolsBrauerPartII (pull request #1432 at 474cce8)

**Verdict:** needs changes

## R01 (P2) — Reconcile the six obsolete supplier-gap requests

**Location:** `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:7`, “Part II owns the native field-cohomology bridge”; also §§1.1, 1.6 and 5.0a–5.0d; `packages/K2SymbolsBrauerPartII/design/plan.json:2`.

**Claim:** The plan still requests six constructions from earlier suppliers, although the README now assigns those constructions to Part II. None of the six appears as a gap declaration under Exact supplier contracts. These are duplicate ownership contracts, not merely prerequisites whose implementations are unfinished.

**Witness:** The plan has six slugs at lines 4, 10, 16, 22, 28 and 34. The README constructs all six locally and contains zero `gap:` declarations.

| Surviving plan slug | Supplier requested in plan | Construction owned here |
|---|---|---|
| field-cup-coherence | EtaleCohomologyFoundations | §1.1 |
| dvr-residue-coherence | EtaleCohomologyFoundations | §1.6 |
| adic-tate-symbol | KTheoryFiniteLocalFields | §5.0a |
| adic-tate-torsion | KTheoryFiniteLocalFields | §5.0b |
| global-tate-torsion | KTheoryFiniteLocalFields | §5.0c |
| global-picard-sequence | KTheoryFiniteLocalFields | §5.0d |

**Exact repair:** Keep the local targets, hypotheses and proof routes. Remove these six redundant entries from the editable top-level `gaps` list in `packages/K2SymbolsBrauerPartII/design/plan.json`. The repaired ownership count is zero external requests and six local constructions, instead of six of each. This leaves the mathematical tests unchanged: the cubic residue is −κ₃(3)=2κ₃(3), the real adic target is C₂, and the two-place function-field Picard sequence is 0→0→C₂→C₂→0. It does not require an edit or implementation in an earlier supplier.

### Previous findings, checked first

The immediately preceding review has one finding, R01: “Remove the six obsolete supplier-gap requests.” **Not repaired.** Its witness remains present at this same head. In particular the README still says “Part II owns the native field-cohomology bridge” and “Section 1.6 constructs the arbitrary-DVR residue bridge,” while the plan still assigns these to EtaleCohomologyFoundations. The four Tate constructions have the same mismatch. The supplied change record contains no intervening changes.

The older classical-carrier attribution finding remains repaired: the opening, scope and contracts cite AlgebraicKTheory §§5.1–5.2, and §5.4 uses AlgebraicKTheory §2.3, KTheoryLowDegrees §8.1 and GeneralAlgebraicKTheory §§3.12–3.14 for the normalized field K₁ comparison. The repair report's objection to implementing earlier suppliers does not answer R01: removal of redundant requests is a package reconciliation. The later available repair report does not mark this reconciliation not actionable.

## Verified sound

This is a full review of the 927-line README and 51-line Suggested.lean at the requested head, not an incremental carry-forward. I reread the sampled sources and supplier contracts, recomputed the tests below, checked the pinned declarations, and independently elaborated the acceptance file. One blocking ownership-contract finding remains; no additional mathematical counterexample was found.

### Gate, scope, order and signatures

The worker's gate reports:

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

HEAD is `474cce8367b3d6e8ab7481b068ed4340531ca2e7`. The diff outside the reviewed roadmap folder is empty. Direct `lake env lean` elaboration of the original acceptance file exited 0, with only the intended `sorry` warnings at lines 39 and 46. The worker's targeted module build passed. No files in the PR worktree were changed.

The prescribed dependency check was independently run and returned:

```text
depcheck: 204 roadmaps, 1634 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. I read the Needs clauses and supplier contracts against the named sections, including the distinction between suppliers and downstream consumers. The six local constructions precede their uses; §5.0e supplies coefficient reduction before §5.3. The last layer does not use Layer 4 to prove global torsion. R01 concerns the separate gap register; the mechanical graph passing does not reconcile that register.

A scratch copy containing `#check @` for each of the three declarations elaborated successfully. The actual signatures retain:

| Declaration | Scope verified against README §§3.3–3.4 |
|---|---|
| `conicSymbol` | Every universe-level field F and arbitrary r,s:F, including zero; result ℤˣ. |
| `conicSymbol_real_eq_neg_one_iff` | Every r,s:ℝ; output −1 iff both coefficients are nonpositive. |
| `conicSymbol_eq_hilbertSymbol` | Every field F, explicit `(2 : F) ≠ 0`, and unit inputs r,s:Fˣ. |

No binder was dropped. There is one real-body definition needed by two headline theorems, no sorry'd data, no `set_option`, no imported roadmap module, and no ad hoc substitute for an unavailable carrier. The imports are `Mathlib` and the used Tau Ceti Hilbert-symbol module.

For both sorried theorems I tried `simp [conicSymbol, TauCeti.hilbertSymbol]`, `rfl` and `infer_instance` separately on a scratch copy: all six attempts failed. Simplification leaves the real solubility criterion or the conic/norm equivalence, respectively. The pinned norm and ternary-isotropy statements do not already state the normalized conic equivalence; its zero-coordinate cases need the argument recorded below. There is no identified one-library-lemma proof or padding declaration to delete.

### Headline coverage

The README's end results and deep intermediate results are: the ordered field-cohomology and arbitrary-DVR residue bridges; root-dependent Brauer dictionary; central simplicity, splitting representation, smaller-radical matrix corner and Brauer class of the general symbol algebra; the total real conic criterion and its Hilbert comparison; the K₂ arithmetic invariant formula and all-place product law; the adic Tate symbol and coefficient diagram; conditional and global torsion comparisons; the global-field Picard sequence; all-exponent arithmetic coefficient reduction; local/global/S-integer map comparisons; and the product-normalized finite Chern identity.

The two conic headlines are stated in Lean. The module docstring names the other families and the unavailable carriers: classical/Milnor K₂ and K-spectra with finite coefficients, the constructed symbol algebra, and the coherent finite/adic étale twist and comparison objects. Existing continuous Kummer cohomology does not by itself supply the latter family. The primitive-root maps and tensor lift already available at the pins are used as inputs, not padded into the acceptance file as new headlines. No missing statable headline was identified.

### Sources: all 15 seeded targets

All four referenced works were available in the supplied legal cache. I used their actual extracted text, including Tate's OCR, at the printed locators. No README locator marked unverified was found. Source lines below refer to those extractions; page numbers are printed pages, not PDF offsets. The construction arguments that extend a source statement are distinguished from that statement.

| Sampled target | Text opened | What the text supports, and limits retained |
|---|---|---|
| §1.1 ordered Kummer-cup dictionary | weibel line 13950, III.6.10.1–6.10.3, pp.242–243; tate line 287 and line 294, Lemma 3.2/Diagram 3.3, pp.263–264 | Kummer and ordered tensor symbol with invertible coefficients. Tate's projection-formula lemma is separable; the README separately constructs inseparable transfer with its degree multiplier. Native-model and coefficient coherence are local targets, not claims that the printed lemma contains Lean comparisons. |
| §1.5 changing root/field | weibel line 13950 and line 14004, III.6.10 and Remark 6.10.4, pp.242–243 | Root-dependent contraction from the tensor symbol to Brauer torsion. The u^j, u⁻² and u⁻¹ formulas are deductions from the chosen basis, not a falsely attributed numbered theorem. |
| §2.2 splitting/central simplicity | weibel line 13858 and line 13873, III.6.9, pp.240–241; line 13884, Lemma 6.9.1, p.241 | Symbol relations and central simplicity. The README replaces the source's insufficient noncentral-root criterion by the explicit splitting representation with m distinct eigenvalues. |
| §2.3 smaller radical corner | weibel line 13858–13893, III.6.9, pp.240–241 | Cyclic presentation and its Brauer interpretation; the reducible-radical corner argument is supplied in the README. It does not pretend Lemma 6.9.1 proves the defective unrestricted root criterion. |
| §3.2 full-root section | weibel line 13406–13431, III.6.2.3, p.233 | Local norm-residue pairing and section argument. The README demands a primitive pairing value, fixing the inadequate nonidentity-value step for composite root order. |
| §3.4 quadratic K₂ homomorphisms | weibel line 13376 and line 13394, III.6.2.1–6.2.2, pp.232–233 | Real/local quadratic symbols, including char≠2 for the norm/conic comparison. Bimultiplicativity is not asserted over arbitrary fields. |
| §3.5 arithmetic invariant/cubic witness | milne line 4957, III.3 Proposition 3.6, p.109; lines 5019–5109, III.4 Steps 1–4, pp.111–113; line 5140, Remark 4.5, p.114 | Arithmetic reciprocity and cup invariant. Milne's root/Artin arguments are transposed relative to H_m here. With YX=ζXY the displayed exponent is negative; the cubic example detects it. |
| §4.2 finite support | milne line 8075–8122, V.5 Proposition 5.2, p.178 | Almost-all-place triviality for symbols. Finite symbol generation extends this to each K₂ class; it does not assert a uniformly finite set for all classes. |
| §4.3 product/invariant sum | milne line 8123, V.5 Theorem 5.3, p.179; line 10042, VII.8.1(b), p.221 | Number-field all-place reciprocity and Brauer invariant sum. Complex factors and real dyadic terms are retained; the claim is not silently promoted to function fields. |
| §5.0b conditional torsion | tate line 354–367, Theorem 3.5 and corollary, p.265 | Mod-ℓ injectivity gives the torsion comparison after maximal divisibility. The README keeps that hypothesis and separates the stronger global conclusion. |
| §5.0c global torsion | tate line 542–566, Equation 5.3/Theorem 5.4, pp.269–270; weibel line 30619 and line 30646, VI.6.1–6.2, pp.502–503 | Global torsion, finite tame kernel and the adic identification. The function-field finite-generation/characteristic-prime inputs have named owners. The source's S-unit rank misprint is not used as a formula. |
| §5.0d Picard sequence | tate line 570–607, Theorems 6.1–6.2, pp.270–271 | Global field, μ_ℓ contained, finite nonempty S with archimedean and required ℓ-adic places. The snake-lemma Picard injection and tame normalization are substantive, not an unspecified abstract injection. |
| §5.1 local Tate maps | tate line 463–486, Proposition 4.5 and corollary, pp.267–268 | Nondiscrete locally compact fields, coefficient prime different from field characteristic. Includes real/dyadic cases and equal characteristic; does not exclude wild mixed-characteristic coefficients. |
| §5.3 S-integers/localization | tate line 575–607, Theorem 6.2, pp.270–271; weibel line 31335–31352, VI.8.2–8.3, pp.513–514; soule line 1693–1749, §2.2.4.4, pp.53–55 | Tate's Picard sequence is global-field general. Soulé's ring proof uses roots of unity; Weibel's cited general comparison has odd/totally-imaginary restrictions. The broader number-field and real dyadic comparisons here explicitly come from ArithmeticKTheory §§5.2, 6.1, 6.3, not a claim that these source passages prove them without those restrictions. |
| §5.5 finite Chern sign | soule line 1276–1286, Proposition 2.2.2.3, pp.42–44; lines 1447–1519, §2.2.3.2/Lemma 2.2.3.2.1, pp.47–48; line 1693, §2.2.4.4, p.53; lines 1523–1555, Proposition 2.2.3.3 and warning, p.49 | Integral product coefficient −1 and factorization through reduction. The finite-by-finite product restriction is not discarded; the even-degree correction vanishes on integral reductions. Composite coefficients use the supplier's CRT maps. |

I also checked the coefficient exactness at soule line 1400–1446 (§2.2.3.1, pp.45–46), the adic symbol/Steinberg construction at tate line 256–284 (Theorem 3.1, pp.262–263), and the real arithmetic coefficient context at weibel line 31623–31638 (VI.9.1.3–9.2, p.518). Source errors encountered are recorded below; they are not additional roadmap findings because the roadmap avoids or corrects them.

### Adversarial values

The 125 rows cover every target subsection, its defining laws and APIs, the 15 sampled targets, both Lean theorems, and the ownership issue. Repeated laws are separated where their hypotheses, maps or normalizations differ. A numerical instance is a falsification test, not a proof of the general target. “Retain” means no repair identified; excluded instances test the stated boundary, not a proposed narrowing.

Two sets of finite computations were run independently: all 56 ordered unit pairs over F₃, F₅ and F₇ have matching conic and norm-equation solubility; the four monomial models below pass all 20,514 ordered basis-triple associativity tests. The rational, real, coefficient and invariant calculations in the other rows were recomputed directly.

| Statement/law | Instance tried | Computed left and right values | Result / change |
|---|---|---|---|
| §1.1 Kummer cocycle direction | α^m=a, gα=ζα | gα/α=ζ; inverse convention gives ζ⁻¹ | Retain gα/α. |
| §1.1 ordered symbol and nonzero control | ℝ, m=2, {-1,-1} | Contracted h has invariant 1/2; Hamilton class has 1/2 | Retain; zero map fails. |
| §1.1 Steinberg relation | ℝ, {-1,2}, m=2 | κ(2)=0; h{-1,2}=0 | Retain. |
| §1.1 power slots and coefficient one | {a,c^m}; m=1 | κ(c^m)=0, cup=0; at m=1 both coefficient groups are 0 | Retain; no division by m inside the field is used at m=1. |
| §1.1 inseparable restriction/transfer | F₂(t)⊂F₂(s), t=s², m=3 | res κ(t)=2κ(s); cor κ(s)=κ(t); cor res=2, not 1 | Retain degree multiplier. |
| §1.1 root-free domain | ℚ, m=3 | μ₃ has rank one with action −1; tensor square has action (+1) | Tensor symbol exists; root trivialization does not. |
| §1.2 weight-zero basis | m=5, roots ζ and ζ² | Both τ₀ send 1 to 1; multiplier 2⁰=1 | Retain. |
| §1.2 weight one/native embedding | m=5, exponent 3 | τ₁(3)=ζ³; primitive-root power equivalence gives ζ³ | Retain supplied carrier. |
| §1.2 tensor coherence | weights 1+1, root ζ², m=5 | Basis multiplier 2·2=4; weight-two multiplier 2²=4 | Retain. |
| §1.2 negative weights/evaluation | weights 1 and −1, m=5, root change 2 | Dual multiplier 3; evaluation 2·3=1 mod 5 | Retain; unmarked dual basis fails. |
| §1.2 trivial/forbidden root cases | m=1; ℚ,m=3 | All modules 0 at m=1; ℚ weight-one action −1≠1 | Retain root containment only where needed. |
| §1.3 contraction value | m=5, ζ²⊗ζ³ | c=ζ⁶=ζ; ordinary multiplication gives ζ⁵=1 | Retain tensor pairing. |
| §1.3 bilinearity at zero | 1⊗ζ³ in multiplicative notation | c=1; multiplication would give ζ³ | Retain. |
| §1.3 uniqueness/equivariance | primitive root in F; generator tensor ζ⊗ζ | c sends generator to ζ; Galois acts by 1 on both sides | Pure tensors generate, fixing every value; zero map differs on generator. |
| §1.3 native mod-two pairing | ζ=−1, exponents 1,1 | c((-1)⊗(-1))=−1; native pairing gives −1 | Retain. |
| §1.4 Brauer composite/torsion | ℝ, {-1,-1}, m=2 | β=1/2; 2β=0 in ℚ/ℤ | Retain. |
| §1.4 split and Steinberg values | ℝ,{1,-1}; {-1,2} | Cup=0 and Brauer class=0 in each case | Retain. |
| §1.4 algebraic export/uniqueness | Hamilton algebra; symbols generating K₂ | Fixed equivalence sends [Hamilton] to 1/2; β gives 1/2 | Retain specified equivalence; symbol values determine the map. |
| §1.5 three root-change scalars | m=5,u=2 | Weight one 2, weight two 4, inverse weight two 4, contraction 3 | All equal their respective u-powers; retain. |
| §1.5 fixed-tensor contraction | ζ²⊗ζ³, new root ζ² | Old value ζ; new value ζ³=(old value)³ | Retain u⁻¹, not u⁻². |
| §1.5 Brauer root change | cubic local invariant 1/3,u=2 | New invariant 2/3; u⁻¹·1/3=2/3 | Retain. |
| §1.5 field naturality/identity | ℝ→ℂ, Hamilton; identity ℝ→ℝ | Both extension paths give 0; both identity paths give 1/2 | Retain. |
| §1.6 positive degree-one residue | ℂ[[t]],m=3 | ∂κ(t)=1=P_up δ_up κ(t); negative normalization gives 2 | Retain actual purity sign. |
| §1.6 uniformizer independence | π→uπ | ∂(κ(u)+κ(π))=0+1=1 | Retain. |
| §1.6 ordered residue | ℚ₇,m=3,{3,7} | Tame=3; Galois and localization residues both −κ₃(3)=2κ₃(3) | Retain; opposite sign gives κ₃(3)≠2κ₃(3). |
| §1.6 reversed and unramified cups | {7,3}; {u,w} units | Reversed residue κ₃(3); unit/unit residue 0 and tame 1 | Retain left-factor degree sign. |
| §1.6 diagonal ramified symbol | F₃(t),m=2,{t,t} | Tame=−1=2; cohomological residue κ₂(2)=−κ₂(2)≠0 | Retain (−1) factor. |
| §1.6 ramified restriction | t=s²,m=3 | Original residue −κ(u); restricted residue −2κ(u)=e·(−κ(u)) | Retain e on restriction. |
| §1.6 transfer normalization | Unramified quadratic extension of ℚ₇,u=3,m=3 | Norm residue 3²=2; cor residue −κ(2)=−2κ(3) | Retain no extra e or degree factor. |
| §1.6 coefficient/henselization maps | cubic residue 2κ₃(3); identity henselization map on residue field | Coefficient map sends −κ(u) to −κ(u) at target exponent; henselization preserves 2κ₃(3) | Retain actual coefficient maps. |
| §1.6 wild exclusion | ℚ₂,m=2,{-1,-1} | Tame=1 but Hilbert=−1; 2 is not invertible in residue field | Correctly excluded from residue formula. |
| §2.1 monomial algebra relation | m=3,F₇,ζ=2,a=2,b=3 | YX=2e₁₁; ζXY=2e₁₁; XY=e₁₁ | Retain YX=ζXY. |
| §2.1 associativity/carries | (m,F,ζ)=(2,F₅,4),(3,F₇,2),(4,F₅,2),(5,F₁₁,3),a=2,b=3 | (e_i e_j)e_k=e_i(e_j e_k) in 64+729+4096+15625=20514 trials | Retain multiplication. |
| §2.1 powers, basis and dimensions | m=3,a=2,b=3 | X³=2e₀₀,Y³=3e₀₀; basis cardinality 3²=9 | Retain. |
| §2.1 universal property | Clock/shift matrices obey X^m=a,Y^m=b,YX=ζXY | Image e_ij=X^iY^j; image e₀₀=I, image e₁₁=XY | Generator images determine the map, including mixed monomials. |
| §2.1 smallest/invalid degree | m=1 and m=0 | Degree-one convention F has dimension 1; Fin 1 has no index 1 | m≥2 on displayed generator construction prevents junk indices. |
| §2.1 scalar extension | Hamilton over ℝ then ℂ | Dimension 4 before/after extension; Brauer values 1/2→0 | Retain field embeddings, not arbitrary scalar maps. |
| §2.2 split representation powers | Xv_i=αζ⁻ⁱv_i; cyclic Y with final factor b | X^m=aI; Y^m=bI | Retain without requiring a radical of b. |
| §2.2 wraparound commutation | m=3,i=2 | YXv₂=αζb v₀; ζXYv₂=αζb v₀ | Retain sign at wrap as well as interior indices. |
| §2.2 distinct eigenvalues | m=3,α≠0 | Eigenvalues α,αζ⁻¹,αζ⁻² pairwise distinct; minimal polynomial degree 3 | Correct splitting argument. |
| §2.2 already split radical | m=2,a=1,b=2 over ℚ | diag(1,−1)²=I; shift²=2I; algebra Mat₂(ℚ), dimension 4 | Retain; b need not be a square. |
| §2.2 source negative control | F=ℂ(u,v), D=(u,v) division quaternion, A=Mat₂(D); x=diag(1,−1) | x⁴=1, x noncentral, minimal polynomial degree 2; Brauer class [D]≠0 | Noncentral root alone fails; README supplies stronger hypothesis. |
| §2.3 smaller-degree corner | F=ℚ(i),m=4,a=4,α=√2 | d=2,s=2,c=α²=2; T⁴−4=(T²−2)(T²+2) | Retain factorization and corner. |
| §2.3 dimension/corner unit | Same example | Corner dimension d²=4; Mat_s(corner) dimension 2²·4=16=m² | Retain; identifying A with its corner would fail. |
| §2.3 corner identity | s=2 | Corner identity diag(1,0); ambient identity diag(1,1) | Retain eAe as an algebra with unit e. |
| §2.3 extreme radical degrees | d=1; d=m | A≃Mat_m(F), dimension m²; s=1 gives A≃Mat₁(A) | Retain both extremes. |
| §2.3 other radical choice | α→ζα in m=4 example | c=2→−2; conjugate idempotent/corner has same Brauer class | Retain generator-dependent corner with invariant class. |
| §2.4 carry cocycle/coboundary | m=3,i(g)=i(h)=2,j(g)=1 | d(g,h)=b; δ(γ^i)=bζ²; cup discrepancy factor ζ² | Retain ordered cocycle comparison. |
| §2.4 algebra versus cup | ℚ₇,m=3,{3,7} | Algebra invariant=1/3; β invariant=1/3; opposite algebra=2/3 | Retain ordered class, not its opposite. |
| §2.4 base-roadmap overlap | F₇((t)),ζ=2,{2,t} | β invariant=2/3; H(2,t)=2; transposed H(t,2)=4 | Matches base YX convention and transposed cyclic pairing. |
| §2.4 matrix invariance | m=4,d=2 corner; m=2 Hamilton | [Mat₂(corner)]=[corner]; Hamilton invariant 1/2 on both models | Retain fixed Brauer equivalence. |
| §3.1 full-root exponent projection | μ₆=<ζ>,m=3 | Full generator maps to ζ^(6/3)=ζ²; primary projection would give ζ⁴ | Retain exponent w/m. |
| §3.1 wild/local values | ℚ₂{-1,-1}; ℚ₃{3,-1}; ℚ₅{5,2} | Each quadratic factor −1; first tame value 1 | Retain wild mixed characteristic. |
| §3.1 trivial exponent | m=1 | N₁=1; exponent-coordinate target 0 | Retain. |
| §3.2 primitive section value | Full roots order w, H_w(ζ,a)=ζ | N_w({ζ,a})=ζ; w{ζ,a}=0; order is exactly w | Section has composite identity ζ↦ζ. |
| §3.2 composite nonprimitive control | w=6,value ζ² | Value order 3, not 6; image misses ζ | Retain primitive-value requirement. |
| §3.2 kernel versus section | ℤ⊕C₂→C₂ | Section composite=id; kernel ℤ has 1∉2ℤ | Section alone does not imply divisible kernel; supplier theorem retained. |
| §3.3 total conic zero inputs | r=s=0; r=1,s=0 | Equation is 0=1 (false), sign −1; x=1 gives 1=1, sign +1 | Retain total definition. |
| §3.3 trivial/symmetric/Steinberg tests | (1,s); (r,1−r); swap (r,s) | Witness (1,0) gives 1; (1,1) gives r+1−r=1; swapping x,y preserves value 1 | Retain. |
| §3.3 real headline, both directions | (−1,−1),(0,−1),(0,0); (2,−1),(0,2) | First three cannot attain 1 and signs −1; last two attain 1 via positive-coordinate inverse square root and signs +1 | Matches both ≤0 criterion, including zero. |
| §3.4 generic conic/norm, ordinary branch | rx²+sy²=1,y≠0 | s=(1/y)²−r(x/y)²; norm target s | Retain. |
| §3.4 conic branch y=0 | r=1,s=3 | Conic (1,0) gives 1; norm (2,1) gives 4−1=3 | Split case handles missing division by y. |
| §3.4 norm branch x=0 | r=2,s=−2, norm (0,1) | Norm=−2; conic (3/4,−1/4) gives 18/16−2/16=1 | Retain exceptional branch; 2≠0 needed. |
| §3.4 characteristic-two negative control | F₂(t),r=1,s=t | Conic has (1,0); norm image consists of squares, and t is nonsquare | Explicit char≠2 hypothesis is necessary. |
| §3.4 finite-field comparison | All 4+16+36 unit pairs over F₃,F₅,F₇ | Conic solvable=true=norm solvable in all 56 cases; both signs +1 | Retain. |
| §3.4 failure of general-field bilinearity | ℚ, s=−1,r=3,7,21 | Each norm/conic sign −1; product of first two signs +1 differs from third −1 | Locality restriction retained. |
| §3.4 K₂ homomorphism, real/complex | ℝ Hamilton generator; ℂ all symbols | Real value −1, double value (+1); complex value +1 | Agrees with supplied real sign and trivial complex factor. |
| §3.5 cubic arithmetic witness | ℚ₇,α³=3,ζ reducing to 2 | Frob(α)/α reduces to α⁶=3²=2; β{3,7} invariant 1/3 | Arithmetic transpose fixed. |
| §3.5 negative exponent | Same class | H(3,7)=ζ⁻¹=ζ²; H(7,3)=ζ | Retain; quadratic tests cannot choose this sign. |
| §3.5 changing primitive root | ζ→ζ², invariant 1/3→2/3 | (ζ²)^(−2)=ζ²; scalar H unchanged | Root-dependent invariant and scalar dictionary agree. |
| §3.5 invariant coordinate | [1/3]∈(ℚ/ℤ)[3] | e₃([1/3])=1; 3·[1/3]=0 | Retain inverse coordinate, not multiplication in ℚ/ℤ. |
| §3.5 m=1,2 boundaries | Trivial symbol; Hamilton class | m=1 value 1; m=2 ζ⁻¹=ζ=−1 | Retain independent cubic control. |
| §4.1 common global roots | ℚ(ζ₃), two local embeddings sending ζ₃ to lifts of 2 and 4 | Pullback of either corresponding local root is the same ζ₃ | Retain coefficient transport, not raw residue-field numbers. |
| §4.1 archimedean/trivial factors | ℚ,m=2,Hamilton; m=1; real m>2 | Real factor −1; m=1 factors 1; real field has no primitive root of order >2 | Domains and factors agree. |
| §4.2 finite support on symbol | ℚ,{-1,-1} | Support={2,∞}; outside it factors 1 and invariants 0 | Retain. |
| §4.2 sums/cancellation | x−x, with x above | Support empty; union of supports {2,∞}; inclusion strict | Retain support inclusion, not equality. |
| §4.2 all K₂ classes | Finite sum of n symbols | Outside union of n finite supports, product 1^n=1 | Symbol generation supplies finite support for each class. |
| §4.3 product and Brauer sum | ℚ Hamilton | (−1)(−1)=1; 1/2+1/2=0 in ℚ/ℤ | Retain real place. |
| §4.3 zero class/empty support | x=0 | Empty product=1; empty sum=0 | Retain. |
| §4.3 coordinate equivalence | Cubic coordinate k=1 | exp_ζ(−1)=ζ²≠1; [1/3]≠0 | Injectivity detects vanishing; complete global sum/product both vanish. |
| §5.0a adic symbol | ℝ,ℓ=2,Hamilton | Adic H²=C₂, generator maps to generator at every 2^r; ℂ target 0 | Retain actual ordered symbol. |
| §5.0a coefficient square | ℚ₇,ℓ=3,{3,7} | Finite invariant 1/3; residue 2κ₃(3) on both comparison paths | Retain coefficient/residue compatibility. |
| §5.0a left Tate square | ℝ,ℓ=2, (−1)⊗(−1) | γ gives {-1,-1}; finite cup gives nonzero element of C₂ | Zero-map alternative excluded. |
| §5.0a transfer | F₂(t)⊂F₂(s),t=s²,ℓ=3 | cor res=2 on Kummer input and on symbol projection-formula square | Retain inseparable multiplier. |
| §5.0b maximal-divisible quotient | Abstract control C_(ℓ∞)⊕C_ℓ→C_ℓ | Kernel C_(ℓ∞), quotient C_ℓ, target torsion C_ℓ | Correct quotient shape; omitting D fails this control. |
| §5.0b real and closed fields | ℝ,ℓ=2; separably closed field,char≠ℓ | Real primary torsion quotient C₂ with D=0; closed-field quotient 0=H² | No assertion that the whole closed-field K₂ is zero. |
| §5.0c function-field torsion | F₃(t), degree-d residue place | Residue group order 3^d−1; degree-one term C₂ | Finite-support elements have finite order. |
| §5.0c absence of divisibility | Direct sum of finite residue groups | Projection of divisible subgroup into each finite group is 0; finite-support element with all projections 0 is 0 | Finite tame kernel then gives no nonzero divisible subgroup. |
| §5.0c finite coefficient not finite group | ℚ,m=2, odd-prime residue factors | Each F_pˣ/(F_pˣ)²=C₂; infinitely many nonzero summands | Retain infinite K₂(ℚ)/2 and matching H². |
| §5.0d γ/tame normalization | F₃(t),ℓ=2,{-1,t} | Tame=−1=2, order 2; γ maps primitive root tensor t to that class | Retain actual map. |
| §5.0d cubic γ control | ℚ(ζ₃), at place over 7, {ζ₃,7} | Tame reduces to 2, order 3; cohomological residue −κ₃(2) | Retain inverse Quillen-boundary transport. |
| §5.0d Picard exact sequence | ℚ,S={2,∞},ℓ=2 | Pic=0; K₂(ℤ[1/2])/2=C₂; sum-zero subgroup of C₂² is diagonal C₂ | Sequence 0→0→C₂→C₂→0. |
| §5.0d one function-field place | F₃(t),S={∞},ℓ=2 | Pic(F₃[t])=0,K₂=0; kernel of single C₂ sum map is 0 | Sequence entirely zero. |
| §5.0d two function-field places | F₃(t),S={0,∞},ℓ=2 | Pic(F₃[t,t⁻¹])=0,K₂/2=C₂; local coordinates (1,1) have sum 0 | Sequence 0→0→C₂→C₂→0. |
| §5.0d tensor Picard term | Abstract Pic=C_(ℓ²),generator g | ζ⊗ℓg=0; ζ⊗g generates C_ℓ | Tensor term is Pic/ℓ, not the subgroup Pic[ℓ] with an arbitrary inclusion. |
| §5.0d S-enlargement | Old tuple in sum-zero group, new unramified place | Tuple maps to (old tuple,0); sum remains 0 | Retain commuting actual injections. |
| §5.0e real weight-two vanishing | C₂ acting on ℤ₂(2) trivially | H³=ker(2:ℤ₂→ℤ₂)=0; H²=ℤ₂/2=C₂ | Retain ordinary degree-two group. |
| §5.0e finite-to-adic distinction | H³(C₂,ℤ/2^r(2)) | Nonzero representative 2^(r−1); reduction of 2^r from r+1 is 0 | Inverse limit 0; finite H³ need not vanish. |
| §5.0e twist negative control | ℤ₂(1), sign action | H³=C₂, unlike weight-two H³=0 | Weight-two hypothesis does work. |
| §5.0e all-exponent reduction | ℤ[1/2],ℓ=2,r≥1 | H²_adic/2^r=C₂=H²_finite; generator survives | Retain real dyadic row. |
| §5.0e zero arithmetic example | ℤ[1/3],ℓ=3 | K₂⊗ℤ₃=0, quotient by 3^r=0; both corresponding H² groups 0 | Retain. |
| §5.1 local archimedean boundary | ℝ at ℓ=2 and odd ℓ; ℂ | Quotients C₂ and 0 respectively; complex quotient 0 | Matches local cohomology and supplier decomposition. |
| §5.1 equal/wild characteristic | F₂((t)),ℓ=3; ℚ₂,ℓ=2 | μ₃ of first field trivial, finite quotient 0; second has nonzero quadratic class | No “good primes only” restriction. |
| §5.2 completion square | ℚ Hamilton, completions at 2 and ∞ | Both K₂ local symbols nonzero; both cohomology restrictions invariant 1/2 | Retain actual maps, not cardinalities. |
| §5.2 global boundary | F₃(t),ℓ=2 versus ℓ=3 | At ℓ=2 residue C₂ present; ℓ=3 equals characteristic, excluded from étale Kummer claim | Retain scope. |
| §5.3 product-normalized restriction | Quillen [3]·[7],ℚ₇,m=3 | (θ₂♮)⁻¹ gives {3,7}, invariant 1/3,tame 3 | Matches ordered arithmetic edge. |
| §5.3 raw-map negative control | Same product through θ₂⁻¹ | Gives −{3,7}, invariant 2/3,tame 5 | Raw and normalized adapters cannot be interchanged. |
| §5.3 localization square | Same example | det B_Q=5; κ₃(5)=−κ₃(3)=∂h | Equality holds with inverse tame. |
| §5.3 Picard connecting sign | Tame map −det B_Q versus det B_Q | Changing boundary by −1 changes connecting injection by −1; cubic coordinate 1 becomes 2 | Retain sign through S-enlargement. |
| §5.3 two-step enlargement | ℤ[1/2]→invert 3→invert 5, Hamilton | Tame values at 3,5 are 1; cohomological residues 0,0 under either composite | Retain composition. |
| §5.3 ring/field contrast | Nonzero Pic(O)/ℓ with μ_ℓ⊂F | Picard class nonzero in ring kernel; generic restriction 0 | No false injectivity after quotienting. |
| §5.3 weight-one Kummer | Same nonzero Picard class | Image in H²(O,μ_ℓ) nonzero, image in Br(O)[ℓ] zero | Weight-one Picard column retained. |
| §5.3 coefficient invertibility | ℤ with ℓ=2 not inverted | 2 is nonunit; required invertibility=false | Excluded from asserted finite étale ring comparison. |
| §5.4 finite K₂ versus quotient | F₅,m=6 | Integral K₂/6=0; finite K₂=C₂; Bockstein target μ₆=C₂ | No conflation of carriers. |
| §5.4 actual Bockstein/CRT | Same nonzero finite class | Boundary −1; mod-two component nonzero, mod-three component 0 | CRT and boundary agree. |
| §5.4 integral image | Any integral class under reduction | Bockstein=0; image is ker boundary, while μ_m quotient may be nonzero | Retain image restriction. |
| §5.4 trivial coefficient | m=1 | cofib(id)=0; K₂/1=0 and K₁[1]=0 | Sequence 0→0→0→0. |
| §5.5 product coefficient | i=j=1 | −(1!)/(0!0!)=−1; integral Chern cup coefficient −1 | No modular factorial division. |
| §5.5 cubic Chern sign | ℚ₇,{3,7},m=3 | h invariant 1/3; c₂,₂ red θ₂♮ invariant −1/3=2/3 | Retain, independently of Artin transpose. |
| §5.5 composite coefficients | Cup coordinate 1 mod 6 | Chern=5; reductions 1 mod 2 and 2 mod 3; CRT gives 5 | Retain minus sign at every primary factor. |
| §5.5 even correction domain | Reduction of integral K₁ classes | Both Bocksteins 0; correction term 0; coefficient remains −1 | No unrestricted finite-by-finite product claim. |
| §5.5 extra finite class | F₅,m=6, nonzero finite K₂ class | Bockstein −1≠1; class outside integral image 0 | Formula correctly makes no claim about this class. |
| §5.5 raw sign and invariance | ε=−1; replace θ₂ by −θ₂ | Raw coefficient −ε=+1; ε also changes sign, leaving θ₂♮ fixed | Retain separate intrinsic and raw formulas. |
| §5.5 zero coefficient target | m=1 | Finite K and finite cohomology both 0; Chern identity 0=−0 | Retain. |
| R01 ownership reconciliation | Six plan slugs against local targets | Before: 6 external requests+6 local owners; repair: 0+6 | Remove obsolete requests; all mathematical values above unchanged. |

### Pinned library audit

Pins were checked directly: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered roots/tensors, Kummer and cups, crossed products and Brauer classes, conics/norm equations, classical/Milnor K₂, and coefficient/Chern carriers. The following declaration sites were opened, not inferred from current online documentation:

| Pinned file and line | Declaration or definition inspected; scope that matters |
|---|---|
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461`, :516 | `IsPrimitiveRoot.zmodEquivZPowers`, `IsPrimitiveRoot.zpowers_eq`; the latter needs a domain and nonzero coefficient. Existing root-carrier equivalences are inputs. |
| `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:122`, :126, :133 | `TensorProduct.lift`, its pure-tensor formula and extensionality. §1.3 adds the specified coefficient interpretation, not a second tensor universal property. |
| `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125`, :129, :131 | `KummerCoeff` is additive roots in the separable closure, with discrete topology and its Galois action. Discreteness does not make that action trivial. |
| `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249`, :277, :322, :330 | `kummerMap`, cocycle identification, kernel and power criterion; invertibility in the field is retained, and the H¹ result has a multiplicative tag. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595`, :790 | `explicitCup11` and `explicitCup11_eq_neg_flip`; continuous equivariant biadditive pairing and the flipped coefficient map matter. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:165` | `kummerCupPairing` on the native ZMod coefficient representation; the roadmap tensor-factorizes this pairing. |
| `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:69`, :89, :103 | Nonarchimedean local-field scope of `h2MuEquivZMod`; normalized rational coordinate k/m. The arithmetic coefficient is invertible in the field, not necessarily its residue field. |
| `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:58` | `h2MuToBr` on field cohomology; the Kummer injectivity/torsion interpretation requires invertible coefficients. |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:267`, :295 | `brauerCohomologyEquiv` and its crossed-product class formula; finite-dimensional Galois crossed-product input is not the arbitrary reducible-radical symbol algebra. |
| `TauCeti/Algebra/CrossedProduct/CupProduct.lean:318` | Quaternion ordered-cup comparison with invertible 2. |
| `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46`, :56, :62, :69, :201, :208 | Unit-input sign defined by b=x²−ay²; norm criterion and quaternion/ternary-isotropy comparisons. The latter use invertible 2 and do not already supply the normalized total conic theorem. |

These 11 file groups resolve the explicit pinned inputs and distinguish them from genuinely missing headline carriers. No fully qualified name of a kept acceptance declaration was found in another readable roadmap. No unneeded API theorem has been restated in Suggested.lean.

### Supplier and open-work ownership audit

I used the roadmap service's object search and citation resolver, inspected the relevant returned sections, and searched the board packages. Main was verified at `929496d4221b974c60787257a3cdc28b600fc49c`; open work used the supplied head index dated 2026-11-03. The resolver reported no unresolved cross-roadmap citation or own Lean name. Its unavailable external-library scan was replaced by the pinned reads above.

The resolved contracts are listed by exact section, so service headers do not affect their locators:

| Supplier, file | Sections resolved and responsibility retained |
|---|---|
| `TauCetiRoadmap/AlgebraicKTheory/README.md` | §§1.1–1.4, 2.1–2.3, 3.1, 5.1–5.2: classical carriers, determinant/unit K₁, stable Steinberg kernel and Matsumoto. The extension does not re-own these. |
| `TauCetiRoadmap/KTheoryLowDegrees/README.md` | §§8.1, 13.1: size-one unit normalization and absolute comparison using GeneralAlgebraicKTheory. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` | §§1.7–1.8, 3.12–3.14, Layer 5, §§7.4–7.5: cofibers, suspension sign, unit-preserving K₁ comparison, connective spectrum and products. |
| `TauCetiRoadmap/K2SymbolsBrauer/README.md` | §§5.1–5.2, 7.1–7.3: symbol adapters on the classical owner; §§5.13–5.15 and 12.5: archimedean results; §§8.1–8.3: raw ε=−1 and θ₂♮; §9.7 and §§9.11–9.18: residue/transfer compatibility; §§10.7–10.9: transfers; §§10.32a–10.32c: function-field cyclic results and tame-kernel inputs; §§11.1–11.3, 11.7–11.8, 12.2–12.3: localization/norm/global inputs. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` | §§1.1, 1.8: finite-coefficient cofiber/CRT and early Chern operations with the even-degree caveat; §3.0a: finite norm-residue symbol on the shared carrier, not all six new bridges; §§3.1–3.3: full-root map and primitive section; §7.3: completion transport. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` | §F.0.3: all-integer finite twists; §0.7: support triangle; §F.3a: henselian tame inertia; §§F.4.1–F.4.2: derived adic systems and Milnor terms. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §§0.12–0.14: henselian/local inputs; §2.11: Kummer including Picard; §2.15: field étale/Galois comparison; §3.4: Picard/divisor dictionary. These are inputs to the newly proved coherence, not an existing assertion of every coherence square. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md` | §0.10: purity for regular noetherian schemes and regular immersions, with invertible coefficients and positive uniformizer normalization. The stated final scope includes arbitrary DVRs; the roadmap does not substitute smooth-over-field purity. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md` | §§5.2, 6.1, 6.3: arithmetic edge and localization, odd/totally-imaginary comparison, and ordinary degree-two real dyadic row. The real extension is actually supplied in §6.3. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` | §§R02.1.2–R02.1.3: coefficient limits and divisible-subgroup input; §R02.3.2: function-field Brauer sum; §R02.4.4: finite arithmetic cohomology and real-place high-degree comparison. |
| `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` | §3.15: arithmetic-site finite/lattice comparisons with real places and coefficient triangles. |
| `TauCetiRoadmap/ClassFieldTheory/README.md` | Layers 5, 6, 10, 14: local invariants/cups, arithmetic reciprocity, Brauer families and quadratic comparison. |
| `TauCetiRoadmap/QuadraticFormInvariants/README.md` | §§6C, 6E, 7B: generic norm criterion, cohomological normalization and algebraic/cohomological Brauer equivalence. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` | §§1.14, 1.24–1.25, 1.44, 1.52: scalar pairing, arithmetic convention, signed invariant comparison and all-place law. §1.44's cubic control agrees after the stated Artin transpose. |

The meaningful ownership overlaps were checked by object, not just declaration name. The base roadmap's prime-degree local function-field algebra is extended to arbitrary fields and invertible degrees, with the same generators on the overlap. Its global function-field reciprocity remains imported. The local norm-residue map, full-root section, finite-symbol isomorphism, coefficient exactness and early Chern operations are consumed, not constructed again. The new targets identify their actual maps.

Among supplied open work, MotivicEtaleKTheory explicitly leaves the finite norm-residue input to KTheoryFiniteLocalFields; its higher geometric theory is not a second owner of these dictionaries. HabiroNumberFields consumes the global adic comparison. The K₃/Bloch and scheme-operation roadmaps concern different carriers or higher operations. Other Chern constructions found in the search, including cyclic/Hochschild constructions in RefinedTraceMethods, do not supply this integral-reduction map. No duplicate owner of the general reducible-radical matrix-corner construction or the total conic comparison was found. R01 records the duplicate contracts that were found in this package's own plan. This audit makes no ownership claim about inaccessible work outside the supplied context.

### Shape and scope

The README has the required summary, scope, conventions, exact contracts, build explanation, numbered layers, API prose, Checks, examples, dependencies, consumers and references. The definitions in §§1.2–1.4, 2.1 and 3.3 have explicit laws and at least three discriminating Checks; the other constructions likewise state their input/output objects, normalization and tests. Source-dependent theorem hypotheses distinguish field from residue-field invertibility, positive degree from degenerate indices, units from arbitrary conic inputs, local from general fields, and number-field ring comparisons from the global-field Picard theorem.

I found no route-specific good-prime shortcut, copied source passage, computational algorithm target, or re-planning of the base roadmap. Finite matrix computations and cubic examples are mathematical Checks. The total conic does not extend local Hilbert bimultiplicativity to all fields. Generic restriction of the S-integer comparison is not mistaken for injectivity after finite reduction. The difference between K₂/m and K₂ with finite coefficients is maintained. The independent arithmetic, residue, raw-Hurewicz and Chern signs agree on their common cubic witness.

## Not verifiable

- None of the 15 sampled source targets is blocked by an unavailable legal text. All four works in References were read in the supplied cache; no new missing-source request or manifest edit was needed.
- The admitted headline proofs and planned supplier constructions are not implemented by this review. Elaboration checks their stated Lean signatures, and the finite tests detect particular counterexamples; neither proves the roadmap's future theorems. Supplier ownership was verified against the supplied main/head texts, not treated as completed formalization.

## Source issues

- **Error** in weibel at III, Lemma 6.9.1, printed p.241 (weibel line 13884): the source says a noncentral nth root of one forces splitting of a degree-n central simple algebra; it should require the full-degree minimal-polynomial or distinct-eigenvalue condition; affects a stated result.
- **Gap** in weibel at III, Example 6.2.3, printed p.233 (weibel line 13428): the source says a nonidentity pairing value supplies a section onto all roots of unity; it should choose a primitive value using full-order nondegeneracy; affects the proof.
- **Misprint** in weibel at VI, Corollary 6.2(a), printed p.503 (weibel line 30647): the source says the size of S is s minus one in its S-unit-rank notation; it should say the rank s is the size of S minus one; affects a stated result.
- **Misprint** in soule at Proposition 2.2.3.3, printed p.49 (soule line 1530): the source says the denominator contains the factorial of 1 minus i; it should contain the factorial of i minus one; affects nothing.
