# Repair report: LogicAndDefinabilityInNumberTheory

## F01 (P1) — not actionable in this package: the existing supplier's generality and foundation ownership require a maintainer decision

Undeclared prerequisite → gap:general-ominimal-block-foundations in the exact supplier contract, counting dependencies and plan gaps. B2.6 already quantifies over arbitrary expansions; relabelling it R_an,exp would misstate its head, while reproducing its block decomposition would violate single ownership. Its general foundations must be supplied earlier independently of this consumer. No supplier or merge-order file was changed.

## F02 (P2) — applied

“Not statable” → native fixed-polynomial signatures hilbert_tenth_integers and forall_exists_rational_undecidable. README §§4.16 and 4.25 state the parameter forms, retain sentence/code consequences, and give the complement reduction with both implications. Added zero-arity, negative-input, inverse-witness and nonintegral-coordinate Checks. undecidability_in_number_theory line 214 and koenigsmann_defining_z line 59 support the reductions.

## F03 (P3) — applied

§2.5 depending on §§2.4 and 2.8 → cell-decomposition/Fubini nullity and direct local substitution. Explicitly retained §2.4's dependence on §2.5 and clarified the reading order. Added determinant-direction, two-dimensional scaling and intrinsic-versus-ambient nullity Checks. The internal Needs graph has no cycle.

## F04 (P3) — applied

Corrected every listed locator, including both Proposition 21 references: README §§4.18, 4.20, 4.25, 4.27 and 6.4 after renumbering. The nonsquare Lean docstring disappears with F07. Proposition 6 starts on p.76, Proposition 21 on p.87, the two corollaries are on p.74, and cell decomposition is 4.1–4.2 on p.12.

## F05 (P3) — applied

Deleted old §§2.10, 6.7–6.9 and 6.13. Folded old §4.6's renaming argument, source locator and noninjective-renaming Check into §4.5's existing API bullet. Renumbered affected sections, local links, dependencies, Lean docstrings and manifest cited-for ranges. Removed corresponding boundary/quotient promises from scope, contracts, conventions and examples. No replacement theorem was introduced.

## F06 (P3) — applied

Removed the four uncited manifest entries. Replaced Koenigsmann's misclassified items and the mirror-symmetry lemma locator; attached Davis to the computation/MRDP/H10 sections. Added Poonen's p.3 locator for the new parameter statement. Removed “design provenance” from References. All retained entries have nonempty cited-for fields and unique keys; unused quotient/boundary locators were also trimmed.

## F07 (P3) — applied

Deleted rational_nonsquares_diophantine and its headline-list/README acceptance references. README §4.27 retains the rational nonsquare and quadratic nonnorm targets. For k=ℚ and r=2, zero is already a square, so the nonpower set equals the nonsquare set; finite systems combine into one equation by a sum of squares over ℚ.

## Source verification

All source text used was the supplied legal cache; no additional work required fetching or a new source key. Settled waived and uncertified works were neither reopened nor requested. The following are locators, not source transcriptions.

| Finding | Evidence read | Mathematical conclusion |
| --- | --- | --- |
| F01 | on_the_algebraic_points_of_a_definable_set line 265, Theorem 3.5(1)–(3), p.6; lines 274–282, proof | The general uniform block theorem is true. Its proof uses general definable regular loci and dimension, so the missing earlier foundations are substantive. |
| F02 | undecidability_in_number_theory lines 214–226, author p.3 | H10 has a fixed-polynomial, one-parameter undecidability form. |
| F02 | koenigsmann_defining_z lines 47–69, p.74 | The universal integer formula gives the complement reduction and undecidable ∀∃ theory; the single-equation form follows by the explicit product construction in §4.25. |
| F03 | cluckers_loeser_2008 line 1786, Theorem 7.5.3, p.43; line 1867, Corollary 7.5.4, p.45 | Prepared local analytic cells supply the substitution route; lower-dimensional graph cells are null directly by product Haar measure. The general nonarchimedean analytic step retains Schneider's settled uncertified locator. |
| F04 | koenigsmann_defining_z lines 24–46, pp.73–74; lines 59–69, p.74 | Conditional Diophantine transfer uses §1 and Observation 0; Corollaries 3 and 3′ concern ∀∃ undecidability. |
| F04 | koenigsmann_defining_z lines 161–255, pp.76–78; lines 712–724, pp.87–88 | Correct statement/proof page ranges for Propositions 6 and 21. |
| F04 | geometric_categories_and_o_minimal_structures lines 472–510, p.12; lines 513 and 530, p.13 | 4.1 is monotonicity, 4.2 cell decomposition; 4.3 is components and 4.8 stratification. |
| F06 | koenigsmann_defining_z lines 323, 395, 409, 416 and following labelled items | 10 is a proposition, 11 a corollary, 12 a definition; the subsequent item classes agree with the corrected manifest. |
| F06 | mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int lines 1083–1091, p.20; line 1168, p.22 | Lemma 4.3 is measure substitution; Lemma 4.11 instead concerns quotient stacks. |
| F07 | le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres lines 568–582, Theorem 4.3, pp.16–17 | Nonpowers for every number field include the rational exponent-two case; formal reality permits the one-equation conversion in that specialization. |

Davis, Hodges, Bosch–Lütkebohmert–Raynaud, Schneider and Denef retain their existing uncertified status. The three remaining waived works retain their status. No missing-reference request is needed.

## Ownership and cross-roadmap audit

Read the main-checkout roadmaps RealAlgebraicGeometry and DiophantineApproximationAndTranscendence for shape. Confirmed main at 1ce5c4f05d1387e8830ae981f7d34d74ba931a89, Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a, and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest pins.

Used roadmaps grep by object across main and the indexed open heads, and rg across board packages: semirational/block decomposition, general o-minimal cells, H10, universal-existential undecidability, nonsquares and nonpowers. B2.6 is the existing general block owner; ShimuraVarieties §3.5a supplies foundations specifically for R_an,exp. No other roadmap found owns the two added fixed-polynomial undecidability headlines. They are direct statements of this package's existing H10/∀∃ endpoints on native carriers. No supplier-qualified Lean declaration was added.

Every cross-roadmap contract was reread at main when present there, otherwise at the indexed open head:

| Copy | Roadmap and exact sections consumed |
| --- | --- |
| Main | SchemeAndStackFoundations §§0.7, 2.20 |
| Main | QuadraticFormInvariants Layer 2 and §6C items 9, 10, 12 |
| Main | GlobalQuadraticForms §§4.1–4.4, 5.5, 6.1 |
| Main | DiophantineApproximationAndTranscendence §§0.2–0.3 and the scope comparison with §5.6 |
| Main | RealAlgebraicGeometry Layers 3, 6 |
| Main | DifferentialGeometry, “Boundary and corners” |
| Main | Chebotarev Layer 14; ClassFieldTheory Layers 5, 10–13 |
| Open head | NeronModelsAndSemistableAbelianVarieties §§2.5, 4.6; ReductiveGroupsPartII RG2.3.7 |
| Open head | MotivesAndAlgebraicCycles §4.20 |
| Open head | HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6, 5.8 |
| Open head | ShimuraVarieties §§3.5a, 3.5d, 3.6 |
| Open head | AdelicAlgebraicGroups §2.4, gauge Haar measure and Weil volume |
| Open head | AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15, B2.18 |
| Open head | ResolutionOfSingularitiesCharacteristicZero §6.2; WeilConjectures, “Curve RH from the surface bound” |

The citation resolver reports no missing cross-roadmap citation or Lean name. Its run did not check external pinned-library names; those were separately checked against the actual pins as described below. The original resolver lead Diophantine.mrdp is this package's own declaration.

F01 remains a human ownership decision. At its open head, TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md B2.6 states an arbitrary fixed o-minimal expansion and explicitly constructs the uniform block decomposition. Its Needs line names ShimuraVarieties §3.5a, whose actual statement is restricted to R_an,exp. Pila 2009 Theorem 3.5 is therefore not unowned work that can be duplicated here. The new gap records the exact absent independent input to that existing supplier. It does not certify that the hidden cycle has been resolved. Either the supplier is scoped externally with an explicit ownership transfer for the general theorem, or general foundations are assigned earlier externally; this package cannot enact either decision.

The pre-existing gap:neron-pairing-perfect-finite-residue remains necessary: NeronModelsAndSemistableAbelianVarieties §4.6 explicitly excludes perfectness beyond semistable reduction. It was preserved unchanged in both contract and plan.

## Checks and gate outcomes

- Suggested.lean elaboration from the content checkout: exit 0; exactly eleven warnings, all “declaration uses sorry”, at lines 35, 47, 63, 70, 86, 92, 98, 106, 115, 149 and 165. The used Tau Ceti module's object file exists, so no build was necessary.
- One scratch file containing the complete module followed by #check @name for all sixteen declarations elaborated with exit 0. Compared every elaborated signature to its README statement. No hypothesis was lost. The new closed parameter statements need no sentence-code carrier; all polynomial arities, coefficient types and parameter domains remain in their types.
- In particular igusa_poincare_rationality retains the DVR, domain, characteristic-zero, ℤ_p-algebra and finite-module instances. nonpowers_diophantine retains Field, NumberField and r>1. Both counting signatures retain the expansion and family-definability hypotheses, positive ε, T≥1 and the constant before the varying parameter; bounded-degree counting retains k≥1 and explicit coordinate algebraicity.
- Sixty-eight native library declarations cited in the README were checked in one scratch file using import Mathlib: exit 0, no errors or warnings. Source inspection also confirmed TauCeti.IsSemialgebraic at TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68 and the Grothendieck completion API at TauCeti/RingTheory/GrothendieckRing.lean:180,205,232. Mathlib/Computability/RE.lean:129 defines ComputablePred on Primcodable inputs, which ℤ and ℕ supply directly. Mathlib/NumberTheory/Dioph.lean:48–51 still records the missing MvPolynomial comparison. No native MRDP or either fixed-polynomial undecidability theorem was found by object search.
- Static acceptance-file checks: one import Mathlib plus the used individual Tau Ceti module; eleven theorem declarations with sorry and five definitions with real bodies; no set_option, lemma, example or sorry-defined data. Every kept Lean name occurs in the README, and the deleted nonsquare name occurs in neither README nor Suggested.lean. All eight layers have consecutive subsection numbers. Manifest parsing and git diff --check succeed; only authorized package files and this report changed.
- Internal Needs graph: 93 sections, 183 distinct internal edges (including both Needs clauses in §2.2), zero cycles. Local anchors: zero missing targets. The substitution route is §§2.2 → 2.5 → 2.4 → 2.7 → 2.8, with no return edge from §2.5 to §§2.4 or 2.8.
- Dependency-direction command: exit 0. Exact output follows; there is no UPWARD, CYCLE or moved line. This syntactic check does not detect F01's missing foundational ownership.

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

No separate gate failures were listed in the brief. The supplied citation lead was resolved as an own declaration. All active Lean processes started for this repair finished. No commit or external write was made.

## Adversarial mathematics pass

The 149-row table uses final subsection numbers. Rows record computed witnesses, countermodels or truth values, including API operations on the same objects. A retained hypothesis or a successful instance is not presented as a proof of a deep theorem. Source certification and the unresolved ownership gap are recorded separately above.

| Statement | Instances tried | Values on the two sides or positive/negative controls | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: quotient guards | Fractions (1,2), (2,4), (1,0) over ℤ | 1·4=2·2=4; denominator 0 fails | Guard indispensable | None |
| Conventions: valuation totalization | t⁰, t, 0 in 𝔽₃((t)) | ord 1=0, ord t=1; 0 fails the nonzero guard for any chosen ord(0) | Sound | None |
| Conventions: local volume and sign | πO, π²O at q=3 | μ=1/3,1/9; q^(−ord π)=1/3, inverse convention gives 3 | Sound | Added §2.5 witness |
| Conventions: tensor density | π²(dx)⊗2, unit multiple, zero section | (1/9)^(1/2)=1/3; unit factor 1; zero density 0 | Sound | None |
| Conventions: base-first relative form | a=xy, ω=dx∧dy | da∧(−dx/x)=dx∧dy; da∧dx/x=−dx∧dy | Sign fixed | None |
| Conventions: coefficients | L=2, i=1; L=1 | (1−1/2)⁻¹=2; denominator at 1 is 0 | q>1 needed | None |
| Conventions: arithmetic domains | 1−2; squares (1,i) over ℂ | Integer difference −1; 1²+i²=0 with neither entry 0 | Signed and field restrictions needed | None |
| Conventions: restricted analytic functions | Restricted constant 1 at 1 and 2 | Values 1 on closed cube, 0 outside | Zero-extension fixed | None |
| Conventions: charts | φ₁(u)=u, φ₂(v)=2v | φ₂⁻¹φ₁(u)=u/2; reverse map 2u | Direction fixed | Removed unused boundary convention |
| Conventions: boundary and dimension | ℤ; line in ℝ²; ∅ | frontier ℤ=ℤ; cl(line) minus line=∅ while frontier=line; dim ∅=−∞ | Sound | None |
| Conventions: heights and degree | −3/4; (); (√2,√3) | Heights 4,1; coordinate degrees 2,2 versus joint degree 4 | Sound | None |
| §0.1 quotient interpretation | Identity; ℤ/2ℤ; two output values modulo equality | Quotient equality is original equality; 0 and 2 coincide mod 2; outputs 0,1 disagree | Uniqueness excludes wrong graph | None |
| §0.1 parameter extension | Formula x=a with a=2, enlarged tuple (2,7) | Both truth sets {2}; no extra x | Sound | None |
| §0.2 realization | Fraction equality 1/2=2/4; existential additive zero | 4=4; representative (0,1) realizes zero in both structures | Both directions hold | None |
| §0.2 composition | Two identity interpretations on a two-element ring | Composite sends 0↦0,1↦1; domain still two classes | Identity laws hold | None |
| §0.3 fraction operations | (−1,2)+(1,2); (1,2)(2,3) | (0,4) represents 0; (2,6) represents 1/3 | Sound | None |
| §0.4 arithmetic semantics | ∃x, 2x=1 in ℤ versus its interpreted fraction field | False in ℤ; true at class (1,2) in ℚ | Translation must name carrier/domain | None |
| §1.1 sorted language | VG 3,2 modulo 2; RF input to ac | Residues 1,0; RF term is ill-sorted | Sort guards work | None |
| §1.2 angular component | t³(2+t) over 𝔽₃; t⁴ over 𝔽₂ | (ord,ac)=(3,2),(4,1); ac(0)=0, ac(1)=1 | Sound in small characteristics | None |
| §1.2 change of uniformizer | π′=2t over 𝔽₃ | ac′(t)=2, ac′(t²)=1, ac′(t³)=2 | Inverse power convention fixed | None |
| §1.3 elimination scope | ℂ((t)), ℂ((t^ℚ)), ℚ₂ | Value groups ℤ,ℚ,ℤ; residue characteristics 0,0,2 | First two admitted; third excluded | None |
| §1.4 AKE | Identity pair ℂ((t)); named VF constant t versus 2t | Same RF/VG sentences; ac(t)=1 versus ac(2t)=2 | Named data must agree | None |
| §1.5 ring transfer | ∃x,x²+1=0 at p=2,3,5 | ℚ_p/𝔽_p((t)) truth pairs false/true, false/false, true/true | Finite exceptions necessary | None |
| §2.1 cells | ord z=0, ac z=1 over q=3; units; point 0 | Mass 1/3; two fibres total 2/3; point mass 0 | Angular data and intrinsic dimension matter | None |
| §2.2 fixed-prime preparation | 1 and x²+y² over ℚ₂; π=√2 | ord 1=0; polynomial at (0,0)=0; ord π=1, ord 2=2 | Every prime and ramification retained | None |
| §2.3 constructible functions | 1_O, 1_F, empty indicator at q=2 | Integrals 1,∞,0; Σ2^(−n)=2 | Constructibility does not imply integrability | None |
| §2.4 summation | Σn≥0 q^(−n); Σn≥0 1 at q=2 | 2 versus divergent series | Summability hypothesis needed | None |
| §2.4 integrability locus | φ=ab−c on F; (a,b,c)=(2,3,6),(2,3,5) | Functions 0 and 1; integrals 0 and ∞ | Constructible zero locus can encode multiplication | None |
| §2.4 exponential-polynomial zero bound | 1−y; 1−2^y | Exactly one real zero in each case, y=1 and y=0; bound 2−1=1 | Fixed-power Rolle route sufficient | None |
| §2.5 substitution | x=πu, q=3 | μ(πO)=1/3=|π|μ(O); inverse determinant would give 3 | Direction correct | Added Check |
| §2.5 higher-dimensional substitution | diag(π,π²), q=3 | Image mass (1/3)(1/9)=1/27=|π³| | Sound | Added Check |
| §2.5 lower-dimensional nullity | Point in F; graph y=0 in F²; F⁰ | 0; ∫0 dx=0; intrinsic singleton mass 1 | Strict dimension bound needed | Replaced circular route |
| §2.6 tail identity, zero and unit | f=0 and f=1 | 0=1+(T−1)/(1−T)=0; T=1+(T−1) | Includes zero polynomial | None |
| §2.6 tail identity, coordinate | f=x, q=2 | Z=(1/2)/(1−T/2), A=1/(1−T/2); both sides T/(2−T) | All-prime witness | None |
| §2.6 raw counts | f=x, f=0, m=1 over ℤ₂ | Raw series 1/(1−T),1/(1−2T); normalized second series 1/(1−T) | Normalization distinguished | None |
| §2.7 form measure | dx on O; π²(dx)⊗2, q=3; zero form | Volumes 1,1/3,0 | Tensor exponent correct | None |
| §2.8 codimension nullity | Origin in F; zero-dimensional X={0} with Y=X | Ambient μ({0})=0; intrinsic count=1 and codimension 0 | Codimension hypothesis necessary | None |
| §2.9 Weil volume | 𝔸¹_O, 𝔾_m,O at q=3; dimension zero point | 3/3=1; 2/3=1−1/3; 1/1=1 | Gauge normalization correct | None |
| §2.10(a) prime-to-p isogeny | Identity; degree-p supersingular reduction | Identity degree 1 is étale; reduction of p-isogeny has inseparable degree p | Prime-to-p condition retained | Renumbered |
| §2.10(b) point counts | Split Tate curve n=3, q=5 | 3·(5−1)=12 on both dual sides | Connected/component factors correct | Renumbered |
| §2.10(b) finite-field cohomology count | ℤ/3, Frobenius −1 | σ−1=1 mod 3 is bijective; kernel and cokernel have order 1 | Cyclic count holds | Renumbered |
| §2.10(c) dual invariants | Trivial action on ℤ/3; S₃ on 𝔽₃³/diagonal | Cyclic case orders 3=3; noncyclic invariant orders 1 versus dual 3 | Cyclicity necessary | Renumbered |
| Perfectness supplier gap | Pairing (r,s)↦rs/3; zero pairing on ℤ/3 | ⟨1,1⟩=1/3≠0; zero map kernel has order 3 | Existing gap precise | Preserved |
| §2.11 dual volume | Identity isogeny on good-reduction E/ℚ₅ with #E(𝔽₅)=N; ω=0 | N/5=N/5; zero integrals 0=0 | Sound, using supplier gap | Renumbered |
| §2.12 relative Fubini | Projection O²→O with dx∧dy; base a=xy | Inner and outer masses 1·1=1; relative form −dx/x | Density and sign agree | Renumbered |
| §3.1 subassignments | ∀y,y²≠−1 over ℝ,ℂ; three zero arities | Truth sets {⋆},∅; h[0,0,0]={⋆} | Arbitrary extension functoriality fails | None |
| §3.1 closed embeddings | y²=x³−x versus open subset of 𝔸¹ | Genus 1 versus genus 0; closed embedding in 𝔸² remains | Open-chart replacement invalid | None |
| §3.2 scissor relation | RF over 𝔽₃ | 3=(3−1)+1=2+1; product of two two-point sets has 4 points | Additive/product laws compatible | None |
| §3.2 direct image | Two points→one point, unit | f_!1=2; (f_!1)²=4, f_!(1·1)=2 | Ring-map model excluded | None |
| §3.3 coefficients | L=2 and L=3; L−2 at 3/2 | Inverses 2,3/2; L−2=−1/2 | Positivity uses every real q>1 | None |
| §3.4 Presburger functions | Empty set, ℕ, even nonnegative integers at q=2 | Sums 0, Σ2^(−n)=2, Σ2^(−2n)=4/3; constant sum diverges | Summation laws hold | None |
| §3.5 tensor relation | Residue line and punctured line at q=3 | Both factors give 3 and 2; empty base gives zero ring | Common relations agree | None |
| §3.6 grading | Singleton in grades 0 and 1; graph over F | Contributions 1,0; graph total dimension 1, relative 0 | Ambient grade not intrinsic grade | None |
| §3.7 pushforward axioms | 1-cell ord z=0, ac z=1 at q=3; two residue points | Specializations 1/3 and 2 | Correct generators and additive image | None |
| §3.7 Fubini and independence | Product of two such 1-cells at q=3 | (1/3)(1/3)=1/9 in either order | Bicell normalization agrees | None |
| §3.8 motivic substitution | x=tu | Integral of image ball L⁻¹; pulled-back integrand L^(−ord t)=L⁻¹ | Jacobian sign correct | None |
| §3.9 specialization | L⁻²; residue line minus origin, q=3 | 1/9; 3−1=2 | Both tensor factors agree with local values | None |
| §3.10 transfer of identities | φ=ψ; different VF parameter elements | Universal difference 0 over both fields; no map assigning t↦t is specified across fields | Universal identity is the correct interface | None |
| §3.11 realization | 𝔾_m and ℙ¹; Lefschetz shift [2] | [ℚ(1)]−1; 1+[ℚ(1)]; even-shift sign +1 | Rings and normalization distinguished | None |
| §4.1 polynomial comparison | Empty variables, C(−3); X₀−2X₁ at (1,3) | −3=−3; 1−6=−5 on both sides | Signed coefficients retained | None |
| §4.2 evaluation | (X₀−1)X₁ at (2,3) | Native value 3=integer polynomial value 3 | Sound | None |
| §4.3 surjectivity | Constant −2, projection product, subtraction | Preimages C(−2), X₀X₁, X₀−X₀=0 have values −2,10,0 at (2,5) | Constructor route covers examples | None |
| §4.4 injectivity | X(X−1) at 0,1,2 | Values 0,0,2 versus zero polynomial 0,0,0 | Infinite box needed | None |
| §4.5 ring equivalence | −7 with no variables; product at (2,5) | Inverse C(−7); X₀X₁ evaluates 10 both ways | Inverse/evaluation agree | None |
| §4.5 renaming | Collapse X₀−X₁ at 7; swap at (2,5) | 7−7=0=0; 5−2=3=3 | Noninjective renaming allowed | Folded old §4.6 and added Check |
| §4.6 witness support | Input X with infinite witness type; polynomial X−Y₇ | Support ∅ for X; support {7} for X−Y₇, every input retained | Finite witnesses, arbitrary inputs | Renumbered |
| §4.7 enumeration | Support {7}; empty support | m=1, h(0)=7; m=0 and unique empty assignment | No input permutation | Renumbered |
| §4.8 existential roots | q(u,v)=u−v−1; injective versus collapsed witnesses | q(1,0)=0; collapsed q(w,w)=−1 | Injectivity necessary | Renumbered |
| §4.9 normal form | Evens; constant 1; zero arities | x−2y=0 at (4,2), fails for x=3; 1≠0; empty assignment exists uniquely | Domain and arities agree | Renumbered |
| §4.10 coding | X−2 at 0; empty witness block | −2 in both semantics; exactly one empty tuple | Native Poly is not a syntax tree | Renumbered |
| §4.11 semidecision | p=0 and p=1, zero witnesses | Predicate always true versus always false; singleton witness enumeration in both | Correct domains | Renumbered |
| §4.12 sequence code | Entries (1,2), choose y=6 and x=15 | Moduli 7,13; remainders 1,2; P(15,6)=T(19)+6=196 | Positive pairing and CRT agree | Renumbered |
| §4.13 bounded universal | P(i) iff i=0; n=0,1,2 | Truth values true,true,false | Empty block must be true | Renumbered |
| §4.14 computation graphs | Identity; minimization whose first trial diverges | Graph y=x; no output when first trial diverges, even if later trial would return 0 | Undefined earlier output cannot be skipped | Renumbered |
| §4.15 MRDP | n=0, empty and universal sets; evens | Equations 1=0 and 0=0; x−2y=0 | Native RE/Dioph carriers match | Renumbered |
| §4.16 fixed-polynomial H10 | Test p=a−x² at a=−1,0,1 | No root, root 0, root ±1; this family is computable and not the existential witness | Universal-over-polynomials reading excluded | Added headline and Checks |
| §4.16 four squares | Witness values −1,0,1 | No square-sum for −1; 0=0+0+0+0; 1=1+0+0+0 | Natural witness conversion exact | Added Checks |
| §4.16 zero arity | p(a)=a | Solvable exactly at a=0, computable | Zero arity does not force undecidability | Added Check |
| §4.17 ring Diophantine sets | ℚ inverses; ℂ squares; ℤ/6 product | 2·(1/2)=1, 0·y≠1; 1+i²=0; 2·3=0 with factors nonzero | Field/domain/formal-reality restrictions necessary | Renumbered |
| §4.17 rationalIntegers | 0,−7,1/2 | Integer witnesses 0,−7; no integer casts to 1/2 | Actual subset determined | Renumbered |
| §4.17 rationalDiophantine | Empty set via 1; nonzero via xy−1 | No zero of 1; x=2 has y=1/2, x=0 has none | One-equation specialization correct | Renumbered |
| §4.18 interpretation transfer | t=1/2; t=3 in Observation 0 | For 1/2, m=1,n=2,u=1,v=0 gives 1=1 and m=tn; for 3, gcd(3n,n)=1 forces n=±1, excluded | Both membership directions hold | Locator corrected |
| §4.19 quaternion traces | a=b=−1; x₁=1, others 0 | Norm 1, trace 2; real S=[−2,2], T=[−4,4] | Trace factor 2 fixed | Renumbered |
| §4.20 semilocal trace theorem | a=b=−1; dyadic auxiliary row (6,15) | T=ℤ_(2)∩[−4,4], contains 3 not 5; triples (1,1,0),(1,1,1) give −21≡3,69≡5 mod8 | Real/dyadic terms essential | Locator corrected |
| §4.21 class rings | R³₃,R⁵₅,R⁷₇; R³₅; R¹_1,3 | ℤ_(3),ℤ_(5),ℤ_(7); ℤ_(2); ℚ | Guards and empty support work | Renumbered |
| §4.22 radicals | ℤ_(3), ℤ_(3)∩ℤ_(5), ℚ | 3ℤ_(3),3ℤ_(3)∩5ℤ_(5),{0}; empty-intersection expression ℚ≠{0} | Nonempty support needed | Renumbered |
| §4.22 dyadic parity | (a,b)=(−1,3) | Δ={2,3}, even v₂ entries remove 2; J=3ℤ_(3), not Jac(ℤ_(2)∩ℤ_(3)) | Parity guard retained | Renumbered |
| §4.23 prime parameters | p=3,−3,9 | 3∈Φ₃; −3 fails positivity; 9≡1 mod8 fails class-three guard | Wrong signed/square models excluded | Renumbered |
| §4.24 universal integers | t=0,3,1/2 | Integers pass all local tests; v₂(1/2)=−1 fails dyadic test | Set and complement agree | Renumbered |
| §4.24 union versus intersection | R=ℤ_(3)∩ℤ_(5), x=1/3 | x∈ℤ_(5), x∉ℤ_(3), hence universal radical predicate true but x∉R | Universal predicate is union | Renumbered |
| §4.25 polynomial ∀∃ reduction | Integral tuple with P=0 | Pw−1=−1; every g-factor nonzero; product nonzero for every witness | Universal sentence false | Added headline and Check |
| §4.25 inverse branch | P=2,w=1/2 | Pw−1=0; whole product 0 | Nonzero-polynomial branch true | Added Check |
| §4.25 noninteger branch | z_i=1/2; P=0 | Some g(z_i,u_i)=0; product (−1)·0=0 | Noninteger branch true | Added Check |
| §4.25 empty coordinate tuple | n=0 | Product 1, equation P(a)w−1=0 iff P(a)≠0 | Quantifier order handles n=0 | Added Check |
| §4.26 square-detection union | p=1,17,17·41 | S₁=∅; S₁₇=ℤ_(17); S₆₉₇=ℤ_(17)∪ℤ_(41), contains 1/17 | Union convention fixed | Renumbered |
| §4.27 nonsquares | −1,0,4 over ℚ; −1 over ℚ(i) | Membership true,false,false; over ℚ(i), −1=i² so false | Base field matters | Dropped special-case acceptance theorem |
| §4.27 empty class/nonnorm | 35=5·7; y square; y=−1,x=−1 | Class-three support ∅ but both factors needed; split norm surjective; −1 not sum of two rational squares | Product classes and real place needed | Locator corrected |
| §4.28 one universal variable | t=0,1/2; dyadic classes 1,3 | Integer predicate true,false; 3−1=2∉8ℤ_(2), but 2∈ℤ_(2) | Modulus 8 essential | Renumbered |
| §4.29(a) normic Brauer group | Cyclic field degree 2; split degree-two algebra | Orders 2 and 1 in the stated quotient | Field hypothesis needed | Renumbered |
| §4.29(b) zero-cycle degree | p=2 and p=3 | Target degrees 5,7; 5−2·2=1 and 7−2·3=1 | Degree comparison exact | Renumbered |
| §4.29(c) valuation classes | ℚ, p=2, support {2} | Positive classes 1,2; including sign gives 1,−1,2,−2 | Finitely many supported square classes | Renumbered |
| §4.29(d) Brauer obstruction | Locally soluble obstruction family with p=2 | Local point sets nonempty; degree-one evaluation sum 1/2 modulo ℤ, so no degree-one zero-cycle | Orthogonality cannot be dropped | Renumbered |
| §4.30 nonpowers | ℚ,r=2 at −1,0,4; r=3 at 2,−8; r=1 | true,false,false; true,false; empty complement | Nonzero guard and exponent hypotheses correct | Renumbered |
| §4.30 finite systems | p₁,p₂ over ℚ at (0,0),(1,0) | Σp_j²=0 and 1 respectively; equivalent to both zero over ℚ | F07 specialization justified | Removed duplicate Lean headline |
| §4.31 existential closure | Identity; ℚ⊂ℝ | Same witnesses in identity; x²=2 false in ℚ,true in ℝ | Arbitrary embeddings not elementary | Renumbered |
| §4.32 rational-model criteria | K=L=ℚ; negative exponent-control n=2 | Intersections ℤ=ℤ and ℚ²=ℚ²; 2 has no rational square root in either copy | No existential integer definition inferred | Renumbered |
| §4.33 two universals | a=b=1,t=0,u₄=v₄=1, others 0 | A=1,B=C=−1; both squared terms 0, F=0 | Positive-parameter witness | Renumbered |
| §4.33 degree/guards | a=−1,u₂=1; leading u₄ term | a+A=0; coefficient of a²b²u₄⁸ is 1, total degree 12 | Existential degree 8 differs from total 12 | Renumbered |
| §5.1 densities | Whole O² and πO at q=3 | N_n=3^(2n), normalized 1; πO mass 1/3 for n≥1 | Counts not densities | None |
| §5.1 level zero | O/m⁰ | Unit ideal quotient has one element; Φ must be constant on its sole reduction fibre | Reduction invariance necessary | None |
| §5.2 series transfer | Whole Oᵈ; geometric denominator at T=1/2 | P=1/(1−T)=2 at 1/2 over both residue-matched fields | Fixed relations transfer | None |
| §5.3 zeta convention | f=1 and f=0, Re(s)>0 | Integrals 1 and 0; Z(T)=1 and 0 at T=q^(−s) | Zero fibre omitted correctly | None |
| §5.4 residue axes | q=2,3 | 2q−1=3,5 from q+q−1 | Origin subtracted once | None |
| §5.4 nonzero product fibre | q=3, v(a)=1,2 | Logarithmic masses 2·2/3=4/3 and 3·2/3=2 | Shell count n+1 fixed | None |
| §5.4 total integral | q=2; q=3 | 4(1/2)²Σ(n+1)2^(−n)=3; 9(2/3)²Σ(n+1)3^(−n)=5 | Equals residue-axis count | None |
| §6.1 o-minimal predicate | Ordered real field; expansion naming ℤ | Finite unary endpoints; frontier ℤ=ℤ infinite, fails | Wrong discrete model excluded | None |
| §6.2 selected expansions | Restricted sine, unrestricted sine, exp | First allowed; unrestricted sine zeros πℤ infinite; exp unbounded | Language distinction matters | None |
| §6.3 selected analytic cells | exp graph and ℤ | Graph analytic dimension 1; ℤ has infinitely many components | Selected structure tame, discrete expansion not | References renumbered |
| §6.4 cells | Closed unit disk with x-axis cut at −1,1 | Five base cells; stack counts 1+3+5+3+1=13 | Adapted cylindrical cells | Locator corrected |
| §6.5 dimension | Open interval; line in ℝ²; ∅ | dim=1; cl(interval) minus interval has dim0; line remainder ∅; dim ∅=−∞ | Closure remainder differs from boundary | None |
| §6.5 choice | Surjection {0,1}→{0} | Section sends 0 to 0; f(g(0))=0; g(f(1))=0≠1 | Right inverse only | None |
| §6.5 finite topology | (0,1) and two isolated points | One component, two components; open interval is one open simplex, not compact closed simplex | Component/triangulation conventions agree | None |
| §6.6 finite atlases | ℝ; closed quadrant; infinitely many isolated point charts | One chart; one relative-open orthant chart; no finite subcover of separate infinite point charts | Finiteness explicit | None |
| §6.7 algebraic varieties | 𝔸¹_ℂ, ℙ¹, node xy=0 | Real dimension 2; transition z↦1/z with z≠0; node has two branches at origin | Singular carrier is not a manifold | Renumbered |
| §6.8 analytic closure | ℂ× in ℂ; one punctured branch of node; E=Y | Closures ℂ, branch y=0,∅ | Relative closure handles singular ambient | Renumbered |
| §6.9 definable Chow | {1}⊂ℂ×; node branch; empty and full sets | Ideals (z−1),(y),(1),(0) in the respective coordinate rings | Algebraicity agrees with analytic sets | Renumbered |
| §6.10 algebraic union | Countable point family covering ℚ; finite set {0,1} | ℚ not definable; {0}∪{1} uses two members | Definability essential; finite case works | Renumbered |
| §6.11 algebraicPart | (0,1), {0,1}, empty tuple space | X_alg=X,∅,∅ | Positive dimension excludes finite points | Renumbered |
| §6.11 semialgebraic parameters | Line y=πx | Whole line is semialgebraic over ℝ and in its own algebraic part | Real coefficients allowed | Renumbered |
| §6.12 rational height | −3/4,(−3,2),0,() | max(3,4)=4; max(3,2)=3; max(0,1)=1; empty supremum 0 then max1=1 | Native formula agrees | Renumbered |
| §6.12 absolute-height conversion | √2, k=2,T=2 | Degree2,H=√2, coefficient height2≤2²·2²=16 | Correct fixed-degree conversion | Renumbered |
| §6.13 blocks | Point, interval, constant image of interval | Dimensions 0,1,0; algebraic parts ∅,interval,∅ | Image dimension can drop | Renumbered |
| §6.13 wrong map | t↦(t,exp t) versus identity interval | Exp graph not semialgebraic; identity image same interval | Arbitrary definable image disallowed | Renumbered |
| B2.6 supplied decomposition and gap | General expansion L; specialised R_an,exp | Needs cell decomposition in L; supplied §3.5a only names R_an,exp, giving zero general-L contracts | Ownership input missing | Declared F01 gap |
| §6.14 Pila–Wilkie | Interval; singleton; n=0 | Outside-algebraic counts 0; at most1; 0 or1 with empty tuple height1 | Constant uniformity compatible | Renumbered |
| §6.14 nonsemialgebraic curve | Graph y=2^x at integer x=k≥0 | Height max(k,2^k), hence k≤log₂T for these points | Logarithmic sample satisfies subpower scale | Renumbered |
| §6.15 integer/image blocks | (−3,2); constant interval image; identity | Height3; image singleton and algebraic part ∅; identity algebraic part interval | Height/image statements agree | Renumbered |
| §6.16 algebraic counting | √2, k=2,T=2 and k=1 | Accepted with degree2,H=√2; rejected at k=1 | Coordinate bounds exact | Renumbered |
| §6.16 tuple/general ambient | (√2,√3); π; n=0 | Coordinate degrees2,2 versus joint4; π has junk height1 and minpoly0 but algebraicity false; empty count1 | Algebraicity and coordinatewise bound necessary | Renumbered |
| §6.17 growth comparison | c=C=1,δ=A=1,ε=1/2,D=16 | 16 lifts versus at most4 singleton blocks | A positive-dimensional block must occur | Renumbered |
| §7.1 lift convention | g=1,τ=i, D=−4,a=1,b=0 | Re0,Im1; coordinate degrees1,1≤2; heights1≤4 | Lift degree/height convention agrees | References renumbered |
| §7.1 weakly special input | A₁ singleton j=1728 and j=1 | Both weakly special, only first special; special-point counts1 and0 | Special-point condition essential | References renumbered |
| §7.1 uniformization | j(i)=1728; translations i+n | Same image for every n∈ℤ, infinitely many discrete lifts | Whole π cannot be definable | References renumbered |
| §7.2 exceptional points | V=A₁; V={1728}; V={1} | Exceptional counts0,1,0 respectively | Finite exceptional conclusion consistent | References renumbered |
| §7.3 maximal specials | V=A₁; V={1728} | One maximal positive-dimensional special; one maximal point special | Dimension-zero and positive cases agree | References renumbered |
| §7.4 André–Oort | Empty set, {0,1728}, {1}, A₁ | Special closures ∅,{0,1728},∅,A₁ | Finite-union conclusion agrees | References renumbered |
| §7.5 CM pairs | Diagonal; j₁=1728; j₁=1 | Infinitely many CM pairs; infinitely many; zero | First two excluded as special, last satisfies finiteness | None |
| §7.6 period codimension | dim X=dim Ď=1, Z point; intersection component dimension1 versus0 | Ambient2, codim V=codim W=1; U codim1<2 or codim2=2 | Strict inequality selects positive-dimensional components | References renumbered |
| §7.7 mixed reduction | Torsion singleton in CM elliptic fibre; nontorsion singleton; pure case | Special-point counts1,0; torsion-part order1 | Density and pure bound hypotheses retained | References renumbered |

## Maintainer consequences

The two new Lean names are hilbert_tenth_integers and forall_exists_rational_undecidable. The deleted name is rational_nonsquares_diophantine; its README mathematics remains in §4.27. No other declaration was renamed.

Section references affected by F05: old §§2.11–2.13 become §§2.10–2.12; old §§4.7–4.34 become §§4.6–4.33; old §§6.10–6.12 become §§6.7–6.9; old §§6.14–6.21 become §§6.10–6.17. All in-package consumers and cited-for ranges were updated. External consumers of these section locators must update their references. In particular rational counting is now §6.14, bounded-degree counting §6.16 and the orbit bridge §6.17.

The report does not accept its own mathematics as an independent review. F01 remains explicitly open for the human ownership decision described above; the passing dependency check does not discharge it.
