# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 87071bd)

**Verdict:** needs changes

## R01 (P1) — Repoint the relative K-theory supplier contract

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:103`, “§4.15 supplies the relative group”. Also lines 33, 57, 101, 1140–1144 and the subsequent Needs lines.

**Claim:** GeneralAlgebraicKTheory §4.15 supplies relative triples and §4.16 their stable-automorphism boundary.

**Witness:** `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:899` starts §4.16, an automorphism/Q-theory comparison; §4.15 is absent. Its §4.17 imports the presentations from AlgebraicKTheory §§2.2, 3.2–3.3.

**Repair:** Import the triple group and boundary from `TauCetiRoadmap/AlgebraicKTheory/README.md:346` and `:363`, respectively. Retain GeneralAlgebraicKTheory §4.17 for exactness without fullness and its higher comparison targets. Update the sign convention and every affected supplier citation. Both suppliers precede this roadmap; no new construction or upward edge is needed. On scalar extension ℤ→𝔽₅ the supplied boundary sends 2 to the nonzero element of 𝔽₅ˣ/{±1}=C₂ and 4 to zero; negating that boundary as prescribed here gives the same kernel. This tests the repaired contract on a nontrivial relative group.

## R02 (P1) — Own the known CM inputs instead of assuming them

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:47`, “theorems in the literature that enter as the named hypotheses”; details at lines 1875, 1905 and 1915.

**Claim:** Rubin's theorem and Schneps's μ-vanishing may remain hypotheses because no earlier roadmap constructs elliptic units.

**Witness:** Line 1911 supplies the obstruction itself: ℤ_p[[S,T]]/(S) has μ=0, but its S-coinvariants have rank one over ℤ_p[[T]]. No declared supplier gap owns the missing arithmetic input.

**Repair:** Assign the elliptic-unit construction, main-conjecture comparison, μ-vanishing and the required finite-character cyclotomic nonvanishing to actual targets here, or to precise declared contracts with a permitted earlier supplier. Give their general statements, APIs, Checks, sources and dependencies; derive the CM corollary from them. Keep genuine conjectures conditional, but do not turn these known theorems into permanent assumptions merely to bypass their theory. For the displayed module the repaired proof must fail its arithmetic nonvanishing input: specialization sends S to 0. For Φ_p(σ), specialization at the trivial character gives p while an order-p character gives 0, so the contract must retain every finite character, not just the trivial one. These are already useful negative controls in the README.

## R03 (P1) — Supply the open-image and rational Lie-cohomology inputs

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1897`, the proof of ellipticHCohomology_finite; its reference to the Check at line 1805 is not a supplier target.

**Claim:** Serre's open-image theorem identifies the non-CM Lie algebra, and Lazard's comparison identifies continuous and Lie-algebra cohomology.

**Witness:** `lazard` lines 6597–6620, V.2.4.10, pp. 178–179: the comparison is stable cohomology, or cohomology of a sufficiently small subgroup. Neither input is supplied by §0.13's mod-p exterior calculation.

**Repair:** Add or import precise targets for the elliptic open-image theorem and the finite-dimensional rational Lazard comparison, including the sufficiently-small subgroup/extension-to-saturation condition and functoriality. Give the CM image statement its input as well. List them in this proof's Needs, then shrink the uniform subgroup before applying the comparison. A literature citation or a dimension Check does not assign construction ownership. The generic comparison cannot omit smallness: let U=ℤ_p act through C_p on V=ℚ_p(ζ_p). Then H⁰(U,V)=0, whereas its differentiated Lie action is zero and H⁰(Lie U,V)=V has dimension p−1. On pℤ_p both dimensions are p−1. For the elliptic proof, retain the standard sl₂ representation: trivial coefficients have H³(sl₂,ℚ_p)=ℚ_p, while the standard representation has zero cohomology. The source supports a repair; this is not a claim that the elliptic finiteness theorem is false.

## R04 (P3) — Remove the anchors rejected by the gate

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:85`, and 144 other occurrences of HTML anchor tags.

**Claim:** The folder passes the required text rules.

**Witness:** The supplied head-specific gate reports `residue=145` and `FAIL`; its rule explicitly forbids `<a id=` tags. All other reported gate counters, including build and dependency checking, are zero.

**Repair:** Delete these tags and update internal links to the headings' generated anchors. For example, the §0.1 link should resolve to its heading without the tag at line 144. Run the gate again; acceptance requires the residue count to be zero. This is one repeated style finding, not 145 findings.

## R05 (P3) — Make API lists and Checks prose rather than undeclared Lean names

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:329`, the PValuation API; the same pattern occurs at lines 363, 469, 595 and throughout later layers.

**Claim:** Backticked names in API lists denote declarations in Suggested.lean, and Checks follow the required prose form.

**Witness:** `PValuation.pow_p` is named in the README but is not one of the file's eleven declarations. The Check `selmer_cm_dim` at line 1805 similarly names no Lean declaration.

**Repair:** Convert the API paragraphs to bullets stating hypotheses and conclusions in prose. Keep a backticked local declaration name only for the eleven definitions/theorems actually retained in Suggested.lean. Remove labels purporting to name Lean Checks; keep their mathematical computations. Do not inflate Suggested.lean to satisfy the name inventory. The valuation test remains concrete: at odd p the coordinate generator has value 1 and its p-th power value 2; at p=2 use values 2 and 3.

## R06 (P3) — Use the roadmap namespace and layer comments

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/Suggested.lean:33`, “namespace TauCeti.NoncommIwasawa”; README line 7 repeats it.

**Claim:** These are roadmap target signatures in the required form.

**Witness:** All eleven elaborated declarations use the library namespace TauCeti.NoncommIwasawa. The prescribed namespace is TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa; the file also lacks layer comments separating its Layer 0 and Layer 1 targets.

**Repair:** Rename the namespace and its README references, use the prescribed “target signatures” module-docstring title, and add the Layer 0/Layer 1 section comments in README order. Re-elaborate and rerun the eleven signature checks. This changes names only: for G=1 the integral/residual/rational dimension values remain 1/0/0.

## R07 (P3) — Correct the Coates–Howson attribution

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1875`, attributing Lemma 2.5, Proposition 2.13 and formula (25) to Coates–Howson, Euler characteristics and elliptic curves II.

**Claim:** Those locators supply the homology and μ-difference inputs.

**Witness:** `coates-howson-ii` lines 286–289 give a rank-bound Theorem 2.5; lines 463–466 give a different equation (25). `cfksv` lines 1737–1738 identify reference [9] as Coates–Schneider–Sujatha.

**Repair:** Cite Coates–Schneider–Sujatha, Links between cyclotomic and GL₂ Iwasawa theory, Lemma 2.5, p. 192, and Proposition 2.13, pp. 197–198, equation (25). For the control-map cokernel cite CFKSV Lemma 5.3, p. 199, proof (`cfksv` lines 1425–1434), separately from those homology/μ inputs; give a separate locator for the claimed kernel bound. Preserve Proposition 2.13's pro-p, ordinary, cyclotomic-torsion and full-tower-torsion hypotheses, explaining any implication used to discharge the latter. The correct formula is at `coates-schneider-sujatha-links` lines 441–449; for X=0 it reads 0=0+0, and when X_f is finitely generated over Λ(H) its correction terms have μ=0, giving the equality used in Corollary 2.14.

## Verified sound

The worktree head is the requested commit. The outside-folder diff is empty. No PR file was edited. I read the standing README/CONTRIBUTING requirements and used the main-branch PadicMeasuresIwasawaAlgebras and DerivedModuleAlgebra roadmaps as shape comparisons. The target folder is new relative to main, so the defects above are repairable rather than grounds for rejecting a re-planned existing roadmap.

The worker's gate fails only on the 145 anchors in R04. Independent dependency checking returned:

```text
depcheck: 205 roadmaps, 1555 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I read the Needs lines as mathematical dependencies as well: the mechanical result does not detect R01's stale section ownership or R02–R03's unassigned prerequisites. Later-roadmap references in the ownership discussion describe consumers, not new suppliers. No declared supplier gaps were supplied for this package.

Independent `lake env lean` elaboration of Suggested.lean succeeded with exactly five sorry warnings. A scratch copy with `#check @name` for all eleven declarations also elaborated. All five theorem signatures retain prime, compactness, Hausdorffness, total disconnectedness and the stated finite-free coefficient-DVR hypotheses. The two suspicious binder losses are in canonicalSet and saturatedSet: these real definitions make sense on the more general native completed-group-algebra carrier, and their theorem uses restore the required profinite hypotheses. I found no false theorem caused by those losses. No data is sorry'd and no set_option occurs.

The five retained theorems were probed individually with rfl, simp and infer_instance in a scratch copy; none closed. Object searches found no pinned lemma giving one of these five results by exact. They are substantive local-ring, global-dimension and Ore statements, not Checks or boundary-case padding. Six definitions support them. Namespace repair R06 is still required.

The README's end theorems are §§1.7, 2.15, 3.6, 6.15, 6.30, 6.34, 6.36, 7.13, 7.14 and 7.18. The additional deep algebra results are §§0.4, 0.11, 0.12 and 1.10. Suggested.lean states the five presently expressible algebra theorems. Its module docstring names the missing K₁/relative K₀, arithmetic-complex, zeta, determinant, Bockstein and period carriers for the others; it also names Fitting annihilation and the later foundations. I found no substitute using arbitrary free predicates or sorry'd carriers.

Pinned-library checks used Mathlib 6b7abb3 and Tau Ceti a91d3aa. The following eleven declarations were opened, not inferred from names:

| Pinned file | Declaration / fact checked |
|---|---|
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:68` | IsProP quantifies over open-normal quotients. It does not itself assert compactness or Hausdorffness. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | completedGroupAlgebra is the compatible-family inverse-limit carrier, not an assumed analytic algebra. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Map.lean:91` | completedGroupAlgebra.map uses a continuous group homomorphism. |
| `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean:265` | projectiveDimension uses WithBot ℕ∞; zero objects do not force the supremum of all module dimensions to be negative. |
| `Mathlib/RingTheory/OreLocalization/Ring.lean:133` | universalHom requires that the denominators map to units. |
| `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:330` | of_mul_of retains the factor set. |
| `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:339` | isUnit_of uses the inverse carry, not merely the inverse-labelled group element. |
| `TauCeti/RingTheory/FittingIdeal/Basic.lean:343` | fittingIdeal is commutative and uses finite-module presentation minors. |
| `TauCeti/RingTheory/FittingIdeal/Basic.lean:349` | fittingIdeal_eq_minorsIdeal_ker permits a different finite free presentation. |
| `TauCeti/RingTheory/FittingIdeal/Basic.lean:372` | fittingIdeal_le_of_surjective is the supplied commutative functoriality. |
| `TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean:58` | nonempty_linearEquiv_of_projective_of_tensorRat requires finite projective modules. It is not the lattice G₀ theorem. |

Ownership searches used the roadmap service's main/open-head index, the supplied sibling checkouts, board packages, and both pinned libraries, by objects including completed group algebras, relative triples, twisted algebras, Fitting invariants, Selmer conditions, elliptic units, open image, Robba rings and Hilbert families. No duplicate fully qualified name among the eleven declarations was found. The generic completed and twisted algebras and commutative Fitting ideal are correctly imported; the noncommutative variants require additional work. GeneralAlgebraicKTheory is a new earlier supplier, not a replacement for main. Its current §4.17 makes the ownership move in R01 explicit.

Resolved supplier contracts include AlgebraicKTheory §§2.2, 3.2–3.3 (automorphisms, triples and boundary); GeneralAlgebraicKTheory §§3.14, 4.6, 4.17, 5.7, 5.11, 6.3, 6.9, 6.19, 8.1, 8.7 and 10.6; PadicMeasuresIwasawaAlgebras §1.7 at README line 909, §4.2 at 2409, §4.6 at 2710, §5.1 at 3172 and §5.2 at 3367; DerivedModuleAlgebra §0.2 at 626, §1.T.1 at 1403, §1.1.1 at 1666 and §1.E.0 at 2049; and IntegralIwasawaTheory §§2.0, 2.2, 2.6, 6.0–6.3, 8.3, 9.3, 9.7, 10.0–10.2, 11.2, 11.5 and 12.1. These comparisons distinguish commutative determinant lines from the noncommutative Picard-valued construction, finite arithmetic cochains from compact coefficient extensions, and character-quotient main conjectures from equivariant determinant comparisons. The resolver's apparent ProfiniteCohomology §F.2 failure at target README line 614 is a parsing lead: F.2 there refers to this roadmap's local foundation, not a missing ProfiniteCohomology section.

The seeded source sample comprised 15 targets. The table below records the passages actually read and the limits of source certification. No locator is explicitly labelled unverified in the README. A retrieved source is not automatically certification of every proof in it.

| Sample target | Source passage and locator | Outcome |
|---|---|---|
| 0.1 | ardakov-brown lines 110–142, §2.3, pp. 3–4; calegari-dimitrov-tang lines 2080–2140, Lemmas 4.5.6/4.5.9, pp. 662–663 | Constant-index convention and the odd/2-adic examples agree. This does not replace a primary proof of the full DDMS equivalence. |
| 0.7 | lazard lines 2904–2945, III.2.1.2, p. 81; fu lines 647–655, (15), p. 13 | Strict valuation threshold and odd-prime coordinate formula agree; the 2-adic offset is essential. Schneider's basis/saturation locators remain uncertified. |
| 0.14 | cfksv lines 329–379, Lemma 3.2, p. 171 | Diagonal twist and inverse untwisting agree; finite-free coefficient extension is an adapter, not a quotation of greater source generality. |
| 1.8 | cfksv lines 250–259, Lemma 2.5, pp. 169–170 | Kernel of a finite p-group quotient is nilpotent in the stated characteristic-p setting. |
| 1.9 | cfksv lines 267–276, Proposition 2.6, p. 170 | Prime-radical quotient and regularity criterion agree; this is not the set of all nilpotent elements. |
| 2.9 | neeman-ranicki lines 125–185, Theorem 0.5/Corollary 0.7, pp. 3–4; muro-tonks-witte lines 1225–1257, Theorem 1.6.3 | Stable flatness is needed for the localization comparison; the determinant result supports the proposed route. The stale triple supplier is R01. |
| 5.8 | kakde lines 570–653, §3, pp. 14–16, Lemma 15/Theorem 16; gambheera-popescu lines 1650–1668, Theorem 6.30, pp. 33–34 | The normalized element and its boundary are stronger than equality of Fitting ideals. Source hypotheses are retained; the general comparison still requires its stated arithmetic identifications. |
| 6.2 | kakde lines 84–104, §1, p. 3, and the §4 reduction | Dividing the abelian tuple by a characteristic element reduces patching to integral congruence images. The generic patching statement is conditional on both required image descriptions. |
| 6.12 | kakde lines 2112–2133, (9), p. 48; lines 2158–2225, Lemma 72/Definition 73/Proposition 74, pp. 49–50 | Exact logarithmic sequence and completion construction checked. Laurent residue and logarithmic-series corrections are listed below. |
| 6.19 | kakde lines 3053–3083, (15)–(16), pp. 71–72 | Partial-zeta sum and smoothed difference agree, including translated test function and norm exponent. |
| 6.30 | ritter-weiss-2011 lines 8–31 and 39–117, Theorem, p. 1; reductions, pp. 2–3 | Odd prime, total reality, finite-over-cyclotomic and μ=0 retained; existence is not uniqueness in K₁. |
| 6.36 | gambheera-popescu lines 1607–1676, Theorems 6.28/6.30; lines 1787–1818, Proposition 7.10 | Minus Fitting statement has no μ=0 assumption; Tate-module comparison is separately conditional. S/T and dual-action conventions checked. |
| 7.10 | burns-venjakob lines 925–994, Lemma 5.1, pp. 21–22 | Leopoldt for the finite field cut out by the representation, actual representation and trivial multiplicity are needed. |
| 7.12 | burns-venjakob lines 1020–1072, Remark 5.4, pp. 23–24; colmez lines 680–700, final theorem, p. 389 | Permutation case follows from residues of Dedekind zeta functions and Euler factors. The OCR of Colmez's displayed constants is imperfect; BV gives the readable comparison. |
| 7.15 | burns-venjakob lines 1180–1237, §6.1/Conjecture 6.1, p. 28; loeffler-venjakob-zerbes lines 187–203, Propositions 2.3.2–2.3.3 | De Rham hypothesis, inverse crystalline Frobenius and Tate factor checked. The general ε-isomorphism remains a conjecture, not a proved construction. |

The following is the computed adversarial record, with 165 rows. “Retain” means that the displayed instance agrees with the statement and its exclusions, not that examples prove a universal theorem. Conjectural rows test definitions and consistency only. Numbered subsections are listed individually; foundation blocks and important subsidiary claims have separate rows. The table covers every sampled target, every headline and every finding's mathematical witness.

| Statement | Instances and computed left side | Right side / excluded wrong value | Result; change |
|---|---|---|---|
| F.0 automorphisms and Morita | diag(2,3) over 𝔽₅ has determinant 6=1; elementary shear has 1 | K₁ classes 1 and 1; no square root | Retain; R01 changes owner. |
| F.0 relative boundary | ℤ→𝔽₅: δ(2)≠0, δ(4)=0 | 𝔽₅ˣ/{±1}=C₂, kernel {1,4} | R01. |
| 0.1 uniformity | C_p successive indices p,1; ℤ_p² indices p²,p²; trivial group 1,1 | C_p fails constancy; dimensions 2 and 0 | Retain. |
| 0.1 powerful at 2 | D₈: commutator subgroup has order 2, fourth powers form 1 | Square-power test would wrongly admit D₈ | Retain fourth powers. |
| 0.2 analytic predicate | Finite G has open uniform subgroup 1, dimension 0 | Infinite product C_p has no finitely generated open subgroup | Retain. |
| 0.3 open-subgroup freeness | S₃×ℤ₅ over ℤ₅ factor has six cosets, rank 6 | (12)(123)≠(123)(12) | Retain noncommutative carrier. |
| 0.4 local-ring criterion | k[C_p]=k[ε]/ε^p has one maximal ideal | For odd p, O[C₂]=O×O has two | Retain; pro-p iff tested both ways. |
| 0.5 filtrations | π²=p: O/p has nonzero π with π²=0 | gr_π O=k[Π], dimension 1; gr_p has nilpotents | Retain uniformizer filtration. |
| 0.6 ordered coordinates | ℤ_p²/pⁿℤ_p² has p^(2n) elements | Two coordinates modulo pⁿ give p^(2n) | Retain, including n=0. |
| 0.7 valuation | p=3: ω(g)=1, ω(g³)=2; p=2: 2,3 | Threshold is >1/(p−1); value 1 fails at 2 | Retain; prose names R05. |
| 0.7 saturation | At p=3, shifted valuation ω(g)=2 requires a p-th root | In p⁻¹ℤ_p the added root has value 1 | Retain saturation distinct from completion. |
| 0.8 rationalization | Fixed p⁻N denominators allowed; coefficients p⁻n unbounded | Unbounded sequence is outside O[[G]][1/p] | Retain. |
| 0.9 integral graded ring | aba⁻¹=b^(1+p): degree-two commutator PB | Polynomial grading would give 0 | Retain extra commutator condition. |
| F.1 grade and Ext | Over DVR O, Ext¹(k,O)=k, Hom(k,O)=0 | grade_O(k)=1; grade_k(k)=0 | Retain coefficient-sensitive grade. |
| F.1 reduction | Ideal (π,T) has nonflat reduction defect k | A blanket equality of grades would miss grade 0 | Retain stated defect control. |
| 0.10 Auslander condition | A/(T): Hom into A=0, Ext¹=A/(T) | Grade is 1; p-torsion does not imply finite global dimension | Retain. |
| 0.11 integral dimension | G=1: 1/0; G=ℤ_p: 2/1 (integral/residual) | d+1/d with d=0,1; C_p gives infinity | Retain torsion exclusion. |
| 0.12 rational dimension | G=1 or C_p: rational group algebra semisimple, dimension 0 | d=0, including p-torsion; ℤ_p gives 1 | Retain. |
| F.2 completed tensor | O^ℕ completed-tensored with O/p gives (O/p)^ℕ | Algebraic finite-support sum would omit (1,1,…) | Retain completion. |
| F.2 derived homology | H₁(ℤ_p,O)=O | Underived coinvariants alone have no degree-one term | Retain derived construction. |
| 0.13 exterior cohomology | ℤ_p² has dimensions 1,2,1 and zero above 2 | Exterior algebra dimensions 1,2,1; degree-one squares 0 also at 2 | Retain uniformity. |
| 0.14 twisting | Rank m free module twisted by rank n has rank mn; n=0 gives 0 | Inverse untwist uses ρ(g)⁻¹; multiplying ρ(g) twice fails | Retain. |
| 0.15 rational homology | Trivial ℤ_p action: H₀=H₁=ℚ_p; scalar a≠1: both 0 | Kernel/cokernel of a−1 give those values | Retain. |
| 1.1 canonical S | R=ℤ_p[[T]], H=1: R/(T)=ℤ_p finite; R/(p)=𝔽_p[[T]] infinite | T∈S, p∉S | Retain. |
| 1.2 central subgroup | C_ℓ×ℤ_p, ℓ≠p: ℤ_p factor central of index ℓ | A pro-p choice removes the finite prime-to-p factor | Retain. |
| 1.3 finite algebra V | C_p quotient: 𝔽_p((T))[ε]/ε^p has dimension p | ε≠0, ε^p=0; not a field | Retain. |
| 1.4 left criterion | Multiplication by T over 𝔽_p((T)) is invertible; p acts by 0 | Finiteness respectively true/false | Retain. |
| 1.5 right criterion | Same cyclic example: T invertible, p=0 | Right and left criteria give true/false | Retain; not evidence that noncommutative sides coincide automatically. |
| 1.6 S-torsion | R/(T) is S-torsion; R/(p) is not | R/(T) finite over ℤ_p; R/(p) infinite | Retain. |
| 1.7 Ore theorem | In commutative R, rT=Tr; T regular, 0 excluded | Ore equations hold with the same denominator; p-torsion groups remain admitted | Retain headline. |
| 1.8 finite-level kernel | p=3, k[C₃]→k: K=(ε), K³=0, K²≠0 | Nilpotence exponent 3 works | Retain. |
| 1.9 prime radical | Γ case: radical ideal pR, T regular modulo pR | In M₂(k), E₁₂ nilpotent but prime radical 0 | Retain prime radical, not all nilpotents. |
| 1.10 S* | p∈S*, p∉S; π²=p makes π invertible after p | Both localizations invert π; the sets need not literally coincide | Retain. |
| 1.11 localization | R_S=R_(p): T invertible, p nonunit | Fraction field would invert both | Retain. |
| 1.12 flatness | ℚ⊗ℤ ℤ/n=0; tensoring injective n:ℤ→ℤ remains injective | Kernel 0 | Retain Ore-flatness, not arbitrary localization language. |
| 1.13 M_H | H=1: R/(T), R/(p) are torsion; R has rank 1 | First two in M_H, R out | Retain. |
| 1.14 supported perfect complexes | Cone(T) becomes acyclic after T inversion | R[0] localizes to nonzero R_S | Retain. |
| 2.1 complete-ideal K₀ | K₀(ℤ_p)→K₀(𝔽_p) sends rank n to n | ℤ→ℤ identity | Retain. |
| 2.2 detection | Free rank n at every finite level has rank n | Zero class requires n=0 for free modules | Retain. |
| 2.3 character dual | C₃, p=7: χ⊗χ∨ contains trivial once; χ⊗χ contains it zero times | Multiplicities 1 versus 0 | Retain contragredient. |
| 2.4 H-homology | H=1: H₀=M, H_i=0 for i>0 | Alternating series is characteristic(M) | Retain boundedness condition. |
| 2.5 twist preservation | Trivial rank-one twist leaves M unchanged | M_H membership unchanged | Retain. |
| 2.6 semilocality | ℤ_p[[U,V]]_(p,U)[1/p] retains infinitely many maximal ideals | Cannot assert semilocality of every S* localization | Retain explicit exclusion. |
| 2.7 determinant characteristic | C=[R —T→ R] in degrees −1,0 has ch=T⁻¹ | ∂ch=−[R/T] | Retain. |
| 2.8 relative class | Same C has [C]=+[R/T]; shift gives −[R/T] | Left multiplication by a noncentral scalar is not left-linear | Retain projective/fibre route; R01. |
| 2.9 localization sequence | Unit uTⁿ gives relative class n[R/T]; an integral unit gives 0 | Image equals kernel; rank difference of [R/T] is 0 | Retain sign; supplier R01. |
| 2.10 boundary | ∂T=[R/T], ∂T⁻¹=−[R/T] | Additive inverse, not equal signs | Retain. |
| 2.11 surjectivity | [R/T] is hit by T | Torsion class maps to rank 0 in K₀(R) | Retain. |
| 2.12 characteristic element | M=R/T: representative T; M=0: representative 1 | Boundaries [M] and 0 | Retain unit ambiguity. |
| 2.13 units/K₁ scope | k[x,y]/(xy) localized at x+y: K₀ map ℤ→ℤ² is diagonal | Cokernel nonzero; generic localization argument would fail | Retain regularity/localization hypotheses. |
| 2.14 finite modules | 𝔽_p over ℤ_p[[T]] has characteristic ideal (1) | In K₀ of p-torsion, its T-resolution gives class 0 | Retain pseudo-null contribution 0. |
| 2.15 p-torsion headline | G=C_p×Γ: Cone(T) remains a bounded free complex | Infinite global dimension does not prevent this perfect class or its lift T | Retain. |
| 3.1 representation map | Scalar u on rank n gives determinant uⁿ | No n-th root or divided determinant | Retain. |
| 3.2 localization extension | Trivial representation sends T to T, a fraction-field unit | T is not a unit in O[[T]] | Retain target localization. |
| 3.3 evaluation | p=3, a=4,b=7: cancelled rational expression evaluates −4/7 | Separate evaluation of its zero/pole factors is undefined | Retain evaluation domain. |
| 3.4 Akashi | R=ℤ_p[[X,Y]], M=R/p gives Akashi p | H=C_p, M=𝔽_p has H_i=𝔽_p for all i; finite product unavailable | Retain bounded homology. |
| 3.5 evaluation–Akashi | C₃ at p=7: χ paired with χ∨ gives 1; with χ gives 0 | Duality distinguishes the two evaluations | Retain. |
| 3.6 Euler formula | M=R/(T−p): H₀=𝔽_p,H₁=0, χ=p | Characteristic value −p has absolute inverse p | Retain; R/T has infinite H₀ and is excluded. |
| 3.7 finiteness hypothesis | 𝔽_p[[X,Y]], H'=p^aH: X^(p^a) injective but quotient infinite | Higher homology 0 does not imply finite H₀ | Retain full finiteness requirement. |
| 3.8 Artin formalism | Trivial quotient gives identity; index n transfer on a scalar gives uⁿ | Induced rank n also evaluates uⁿ | Retain. |
| 3.9 X₁(11) data | (5^16/5^4)^(1/4)=125 | 5³=125; second character gives 5 | Retain as conditional numerical Check. |
| 3.10 integrality conjecture | Constant p⁻¹ has no pole but valuation −1 | Not integral; absence of poles alone insufficient | Retain as conjecture. |
| 3.11 finite K-theory | ℤ₇[C₃]=ℤ₇³; K₁ is product of three unit groups | Rationalization preserves the three components | Retain; projective Swan not a lattice theorem. |
| 3.11 continuity | Compatible unit 1 at all levels has limit 1 | K′₁ comparison does not prove unrestricted K₁ continuity | Retain separate target. |
| 3.12 total quotient | C₂×Γ at odd p gives F×F | Two central primitive idempotents, not a field | Retain. |
| 3.13 reduced norm | diag(a,b) has reduced norm ab | (ab)² is wrong; K₁ kernel must remain explicit | Retain. |
| 3.14 induction | C₂ transfer evaluates as trivial value times sign value | Product of the two one-dimensional factors | Retain. |
| F.3 real correction | Trivial odd-p real term has invariant rank 1; dyadic Tate groups even ℤ₂/2, odd 0 | Ordinary and Tate compact support differ | Retain. |
| F.3 Hochschild–Serre | N=C_p in C_(p²): H¹(C_(p²),𝔽_p) dimension 1 | Naive sum of quotient/kernel H¹ dimensions would be 2; transgression nonzero | Retain derived comparison. |
| F.4 Selmer base change | Cone(T) specialized at T=0 has H⁻¹=H⁰=O | Underived cokernel alone has only one O | Retain derived tensor. |
| F.4 Leopoldt | ℚ has unit rank 0 | Defect 0, shared proposition rather than new definition | Retain ownership. |
| 4.1 elliptic object | E of conductor 11 at p=5 has five points mod 5, a₅=1 | Ordinary; rational 5-torsion permits nonzero local/Kummer terms | Retain. |
| 4.2 conjectures | Free Λ(G) has rank 1 and is not M_H; zero module is | Conjectural Selmer membership is additional arithmetic content | Retain as conjectures. |
| 4.2a μ | R/pⁿ has μ=n; free R has μ=0 | μ is not additive on arbitrary nontorsion exact sequences | Retain torsion hypotheses. |
| 4.3 CM criterion | R/(S) has μ=0, but cyclotomic rank 1 | Nonvanishing input equals false (image S=0) | R02. |
| 4.3 finite characters | Φ_p(σ): π₁=p; π_ψ=0 for ψ of order p | H'^p coinvariants have rank p−1 despite trivial-line torsion | R02 retain all characters. |
| 4.3 Lie comparison | U=ℤ_p finite-character action: H⁰(U,V)=0 | Lie H⁰ dimension p−1; on pU both p−1 | R03 shrink subgroup. |
| 4.3 coefficient vanishing | Trivial sl₂ coefficients H³=ℚ_p; standard coefficients H*=0 | Finiteness route needs the standard representation | R03. |
| 4.3 μ-difference | X=0: μ_G=0 and all homology terms 0 | CSS equation (25): 0=0+0 | R07 locator repair. |
| 4.4 admissibility/weak Leopoldt | F∞=F_cyc: H=1; H² in the cyclotomic limit 0 | Finite E/F cannot contain F_cyc; CM tower not totally real | Retain separate scopes. |
| 4.5 arithmetic complex | H⁻¹=X,H⁰=ℤ_p gives [C]=[ℤ_p]−[X] | −[C]=[X]−[ℤ_p] | Retain. |
| 4.6 compact duality | Shift by −3 sends degree i to i+3 | Odd shift inverts determinant | Retain shift/local terms. |
| 4.7 derived base change | Cone(T) at T=0 retains two O terms | Ordinary tensor of its cohomology misses Tor₁=O | Retain. |
| 4.8 prime two | Trivial real ℤ₂ coefficient: even Tate cohomology ℤ₂/2, odd 0 | No bounded ordinary replacement has this periodicity | Retain. |
| 5.1 conjectural L-element | At a good prime 11, removed trivial factor gives 1−1/11=10/11 | Omitting it changes the value by 11/10 | Retain prescribed factors. |
| 5.2 main conjecture | Multiplying by unit u preserves boundary; rank-n evaluation multiplies by uⁿ | Same divisor does not give same interpolation | Retain normalization. |
| 5.3 consequences | For X=0, characteristic class 1 has boundary 0 | Conditional consequence does not construct the L-element | Retain conditional status. |
| 5.4 X₁(11) | −1/2+3/2+2=3; −3/2+5/2=1 | Euler factors 125 and 5 | Retain conditional data. |
| 5.5 totally real MC | ∂ζ=[X]−[ℤ_p] | −[C] with C's two displayed cohomologies | Retain K′₁ uniqueness only. |
| 5.6 zeta contract | Identity element has boundary 0 and evaluations 1 | An SK₁ element can preserve evaluations | Retain explicit ambiguity. |
| 5.7 functoriality | Identity quotient gives identity; C₂ transfer gives product of two values | Induction decomposes as 1⊕sign | Retain; R01 dependencies. |
| 5.8 normalized abelian comparison | 1 and 1+p generate same ideal, values at 0 differ | Inversion sends T to −T/(1+T), not T | Retain element-level normalization. |
| F.5 forms | Rescale differential by x at weight k: coefficient multiplied by Norm(x)^(-k) | Fixed lattice without compensation differs | Retain all components/cusps. |
| F.5 family lattices | Constant 1/p with integral positive coefficients is in positive lattice, not constant-integral lattice | Constant obstruction is nonzero in Q(Λ)/Λ | Retain separate lattices. |
| F.5 specialization | C=Λ/(T), P=T: C[P]=C and C/PC=C | Dropping left torsion loses a nonzero term | Retain four-term sequence. |
| 6.1 abelian decomposition | ℤ₅[C₃]=ℤ₅×O₂, ranks 1+2=3; S₃ blocks 1²+1²+2²=6 | Repeating every absolute character would overcount | Retain Galois orbits. |
| 6.1 pseudomeasure | For ℚ, p=3: L_{p-rem}(−1)=(1−3)(−1/12)=1/6 | Additional removal of 2 gives −1/6 | Retain factors and pole component. |
| 6.2 patching | Scalar model ζ=6,f=2 gives quotient 3 and f·3=6 | Quotient unit has boundary 0; ζ and f same boundary | Retain conditional image hypotheses. |
| 6.3 dimensional reduction | Quotient killing H leaves Γ of dimension 1 | Compatible identities at all finite H-quotients give identity limit | Retain compatibility. |
| 6.4 induction | S₃ standard character = Ind_C₂(1)−1, dimensions 3−1=2 | At a transposition: 1−1=0 | Retain virtual combinations. |
| 6.5 prime-to-p elementary | p=5, C₂: K₁ torsion μ₄² has order 16 | μ₄×C₂ would have order 8 | Retain determinant route. |
| 6.6 coefficient components | p=5,C₃,trivial action: two coefficient components ranks 1 and 2 | Product rank 3, not two quadratic components | Retain. |
| 6.7 twisted carry | p=3, exponents 1+2 give carry γ³ | Basis product is γ³, not 1; inverse needs γ⁻³ | Retain native factor set. |
| 6.7 denominator products | In R×R, (1,0)(0,1)=0 | Complement of p(R×R) is not multiplicative | Retain componentwise set. |
| 6.8 α and Frobenius | p=3,x=1+3g: norm 28, α=1+(9g+27g²)/28 | For trivial quotient φ(z)=z³; identity map would fail | Retain. |
| 6.9 additive image | C_p: trivial component of β is p times identity coefficient | Requiring an unrestricted trace equality at P=1 would force 0 | Retain restricted condition. |
| 6.10 additive inverse | δβ([1])=[1] | An extra p gives p[1] and is wrong | Retain normalization. |
| 6.11 logarithm | Odd p: log(1+p) has valuation 1; at 2, log(1+2ℤ₂)⊂4ℤ₂ | Uniform assertion log-image=2ℤ₂ would be false | Retain prime restrictions. |
| 6.12 integral logarithm | L(γ)=0 though γ infinite order; scalar a gives (1−1/p)log(a) | Kernel not just finite roots; B(Z)/p=𝔽_q((T)) contains T⁻¹ | Retain corrected kernel/residue. |
| 6.13 trace/norm | Scalar norm a↦a^p: log(a^p)=p log(a) | Trace on scalar logarithm is p log(a) | Retain determinant–trace route. |
| 6.14 multiplicative sequence | G=Γ×C_p: θ(γ) has L=0 but noncyclic component γ≠1 | Kernel includes central infinite-order units | Retain central factor. |
| 6.15 K′₁ congruences | Quotient group 1: θ is identity on abelian units | Congruence image is the same unit group | Retain headline; nontrivial subgroups impose additional laws. |
| 6.16 injectivity | At p=3, Frobenius on μ₁₃ cycles exponents 1→3→9→1 | The three embeddings form an orbit, not three fixed components | Retain; no unsupported split matrix identification. |
| 6.17 character tests | Q₈ degree-2 representation induced from C₄ character | Degree [Q₈:C₄]=2; a one-dimensional character alone misses it | Retain monomiality; this is algebraic test, not odd-prime MC instance. |
| 6.18 M1/M2 | Abelian identity conjugation fixes ζ; norm to same subgroup is identity | Both sides ζ | Retain. |
| 6.19 partial zeta | ℚ,p=3,k=2: ζ_{(3)}(−1)=1/6; ε=0 gives 0 | u=1 smoothing gives 1/6−1/6=0 | Retain norm exponent/translation. |
| 6.20 approximations | u=1 gives zero at every finite quotient | Compatible inverse limit is zero | Retain. |
| 6.21 trace ideals | Trivial C_p action: trace(a)=pa; free orbit: orbit sum has coefficients 1 | Fixed and free orbits have different divisibility | Retain. |
| 6.22 cusp/Hecke | diag(p,1) modulo p fixes the second line; diag(1,p) fixes the first | Unit diagonal cusp matrix commutes with diagonal Hecke matrix | Retain actual cusp and orientation. |
| 6.23 transfer | C_(p²)×C_p to maximal C_(p²): transfer multiplies by p | Image misses generators of order p² | Retain. |
| 6.24 Möbius values | C₃², r=2: 2⁹−4·2³+3·2=486 | 486/9=54; free stabilizer only modulus 1 | Retain full subgroup sum. |
| 6.25 congruences | C₉×C₃, P=⟨(3,0)⟩ has three cyclic overgroups | Unweighted sum reduces to 3ζ=0 mod 3, impossible for unit ζ | Retain replacement Möbius route. |
| 6.25a finite p-extension | P=1 gives identity; H₂(C_p,ℤ_p)=0, H₁=C_p | Extra finite homology is finite, not a free rank contribution | Retain. |
| 6.26 trace bound | In C_(p²)×C_(p²), P=⟨(a,b^p)⟩, i_P=1, actual multiplier p | Simplified claimed multiplier p² is wrong | Retain corrected multiplier. |
| 6.26a relative logarithm | Abelian G has a=0: image of 1+a is 0 | This is 1→0, not full logarithmic surjectivity | Retain relative hypothesis. |
| 6.26a denominator clearing | Additive class p⁻¹ becomes 1 after p | Integrality at exponent 1 does not imply integrality at exponent 0 | Retain. |
| 6.27 logarithmic pseudomeasure | L(γ)=0; L(a)=(1−1/p)log(a) | Logarithm alone cannot distinguish γ from 1 | Retain torsion/lift correction. |
| 6.28 Möbius–Wall | C_p: 1−1=0; C_p²: coefficients 1,−1,p | Noncyclic subgroup has nonzero Möbius coefficient p | Retain full lattice. |
| 6.29 integrality criterion | Abelian relative ideal 0 gives correction 1 | No relative torsion ambiguity survives | Retain arithmetic hypotheses. |
| 6.30 Ritter–Weiss | Abelian Γ: normalized ζ=G₁(T)/T gives its own determinant preimage | Pole order −1 allowed; source does not prove uniqueness in K₁ | Retain μ=0, odd p. |
| 6.31 descent | Trivial C_p trace ideal pR extends to pB and contracts to pR | Completion does not make 1 divisible by p | Retain contraction. |
| 6.32 M4 | P=1, group unit z: z^p/φ(z)=1 | Replacing φ by identity gives z^(p−1)≠1 | Retain p-power map. |
| 6.33 all congruences | G/Z=1: norm/conjugacy laws identities; M4 ratio above 1 | All four specialize consistently | Retain. |
| 6.34 Kakde | Cyclotomic ζ=G₁/T: pole −1, ∂ζ includes −[ℤ_p] | [X]−[ℤ_p] agrees with −[C] | Retain K′₁ headline. |
| 6.35 conditional SK₁ | Parameter m=1 gives unchanged cyclic invariant; m=2 gives inverse-half adjustment | Cyclic algebra of degree p^s has dimension p^(2s) | Retain conditional status. |
| 6.36 abelian minus | H=ℚ(ζ₃),p=5: surviving −1 has no 5-primary part; at p=3 unsmoothed L(0,χ)=1/3 | Removing smoothing can destroy integrality | Retain T and covariant-dual action; no μ hypothesis inserted. |
| 7.1 Bockstein | Cone(T): B=−1; matrix [[T,1],[0,T]] has cokernel R/T² and B=0 | The two complexes have different semisimplicity | Retain. |
| 7.2 order | Cone(T) degrees −1,0 has r=−1; its shift r=1 | Inverting shift sign would disagree with T⁻¹ | Retain direct-sum, not extension, closure. |
| 7.3 trivialization | Cone(pT): B=−p, determinant trivialization −1/p | Leading sign gives 1/p | Retain. |
| 7.4 leading term | ε/T: order −1, leading ε(0); shift leading ε(0)⁻¹ | Evaluation at T=0 itself is unavailable | Retain. |
| 7.5 characteristic coefficient | 3T⁻²(1+T): order −2, leading 3 | Not the value at zero | Retain. |
| 7.6 canonical localization | Cone(T) gives order −1 and leading 1 | Boundary of characteristic is −[R/T] | Retain. |
| 7.7 change of generator | γ'=γ²: T'=2T+T²; leading coefficient of T in T' is 1/2 | c_γ'=2c_γ; normalized product unchanged | Retain. |
| 7.8 Euler–Poincaré | Cone(pT): Bockstein cohomology 𝔽_p, length 1; leading p⁻¹ | χ_add=−ord(p⁻¹)=1; χ_mult=p | Retain corrected sign. |
| 7.9 global determinant | Unit motive: H_f⁰ and Betti+ both rank 1, tangent rank 0 | Ordinary real correction cancels the compact rank contribution | Retain inverse determinant and conjectural status. |
| 7.10 Tate descent | Trivial representation over ℚ: m=1, H_c²=H_c³=ℚ_p; 1⊕1 gives m=2 | Negative virtual character −1 is not a representation | Retain actual representation/Leopoldt. |
| 7.11 Stark | ℚ,p=3: truncated residue factor 1−1/3=2/3 | Removing prime 2 adds 1/2, giving 1/3 | Retain Euler factors; conjecture not proved by this test. |
| 7.12 permutation case | ℚ: class number=regulator=discriminant=1, real factor 2^0=1 | Residue ratio e_p=1−1/p; p=3 gives 2/3 | Retain Colmez normalization. |
| 7.13 shifted global map | c=5, ℓ=7, L=11: B=−7/5, t=−5/7, ζ=77 | Leading sign −1 gives 55; c⁻¹·55=11 | Retain shift, not inversion of map. |
| 7.14 character scope | C₂ sign = Ind_1(1)−1, value −1 at nonidentity | Permutation character there must be nonnegative | Retain virtual/permutation distinction. |
| F.6 period/exponential | Trivial ℚ_p: exponential source 0, H_f¹ dimension 1; ℚ_p(1): unit exponential dimension 1 | Full H¹(ℚ_p(1)) dimension 2 | Retain distinct finite and full local conditions. |
| F.6 Robba lift | b=u^p+Σ pⁿu^(−pⁿ): term norm p⁻nρ^(−pⁿ)→∞ for ρ<1 | Amice lift is not overconvergent | Retain analytic-lift hypothesis. |
| F.6 slopes | π²=p: φ(e)=πe has p-normalized slope 1/2 | Uniformizer-normalized slope 1; diag(1,p) slopes 0,1, not pure 1/2 | Retain normalization adapter. |
| F.6 logarithmic monodromy | ∇e₂=e₁du/u: ∇(e₂−log(u)e₁)=0 | Residue N≠0 before adjoining log | Retain logarithm, not finite-cover-only triviality. |
| F.6 Weil–Deligne | ℚ_p(r): crystalline φ=p⁻r, arithmetic Weil Frobenius p^r | Equal Frobenius conventions would reverse twist | Retain inverse. |
| 7.15 epsilon/Gamma | Γ*(3)=2, Γ*(−1)=−1, Γ*(−2)=1/2 | ℚ_p(1) comparison t·t⁻¹=1; zero representation determinant 1 | Retain de Rham restriction. |
| 7.16 local conditions | ℚ_p(1): Greenberg dimension 2, finite dimension 1 | Split multiplicative curve: B1 factor (1−p⁻¹)²≠0 but C1 factor 0 | Retain full/quotient distinction. |
| 7.17 height | One T-block in degrees 1,2 has r=−1; shift has r=1 | Nonzero height gives semisimplicity; zero Bockstein fails | Retain. |
| 7.18 interpolation | V̂=ℚ_p(4), dimρ=2: Γ(V̂)=1/6, inverse-twist factor 36 | Omitting dimension gives 6; rank-one shifted height b=7,A=11 gives −77 | Retain dimension and shift. |
| 7.19 Fitting orders | M₂(ℤ₃) has centre ℤ₃ and matrix algebra fraction ring | ℤ₃[C₃] residue nonsemisimple although rational algebra semisimple | Retain order hypotheses. |
| 7.20 denominator ideal | In ℤ₃[S₃], a reduced norm can be (1/3)Σg | Not integral; multiplying by 3 gives integral norm sum | Retain denominator ideal. |
| 7.21 maximal Fitting | ℤ₃/9: Fitt=(9); free rank one: 0; zero module: (1) | Matrix blocks determinants 15,24 generate (3), although presentation surjective | Retain maximum over presentations. |
| 7.22 characteristic/Fitting | Presentation T of R/T gives Fitt=(T) | T⁻¹ has the opposite boundary, not that presentation invariant | Retain orientation. |
| 7.23 annihilation | Σg annihilates augmentation ideal of ℤ₃[S₃] | (1/3)Σg is not an integral annihilator | Retain denominator correction. |
| 7.24 exceptional factor | E=Tg, g=Tu, u(0)≠0: order(E)=2, leading u(0) | Counting only the displayed first T would give order 1 | Retain total vanishing order. |

## Not verifiable

Source-service retrieval was attempted for 71 distinct works: 53 yielded text, nine were uncertified, and nine remained unreadable. This is a retrieval count, not a claim to have line-checked all 53 works. The 15 seeded targets were checked at the passages above, with the stated qualifications. The README's extensive list of proposed source corrections is not blanket-certified by this review; the Source issues section below contains only errors independently seen in source text during these checks.

The nine unreadable works and searches are recorded together in the scratch missing-reference manifest; no source manifest in the PR was edited:

- **kedlaya-differential-equations:** Proposition 19.1.5/Corollary 19.1.6, pp. 315–316, for F.6. Title/author source-service search returned no readable copy. The available earlier monodromy paper does not certify these book locators.
- **rw3:** Proposition 11/Lemma 12 for §6.26a. Title search for Towards equivariant Iwasawa theory III returned no readable copy. Later-paper restatements do not verify the original proof.
- **rw4:** Proposition 9 for §§6.26a/6.30. Title search returned no readable copy.
- **rw5:** Propositions 2.2, 2.4, 3.2 and theorem p. 1096 for §6.26a. Source-service request for Non-abelian pseudomeasures and congruences between abelian Iwasawa L-functions timed out.
- **rw8:** §1 Lemma 1/Proposition A. DOI 10.4171/dm/245 resolved to an EMS landing page, but the service did not retrieve its text.
- **wiles:** Theorems 1.3–1.4 for §6.1. DOI 10.2307/1971468 resolved to JSTOR without readable text. Kakde's explicit restatement was read; the original proof was not.
- **platonov-rapinchuk-rapinchuk:** §1.4.3/Theorem 1.23, pp. 33–34, for §3.11. Cambridge DOI search did not retrieve text.
- **hida-1988:** §§1–3 for F.5. The institutional Heidelberg copy timed out. The claimed all-degree control theorem is not certified from that source here.
- **bourbaki:** Commutative Algebra VII.4.8 Proposition 18 for §3.5. Title search returned no readable copy.

Uncertified locators, recorded without requesting them again: Schneider's p-Adic Lie Groups; Deligne's local constants; Berger's Représentations p-adiques et équations différentielles; Deligne–Ribet; NSW; Ribes–Zalesskii; Wiles 1988; Serre's cohomological-dimension paper; and Rubin 1991. In particular the ordered-basis/saturation claims and the full generality of Rubin's finite-character specialization assertion were not verified directly in those texts. Coates–Howson II, Schneps 1987 and Serre's open-image paper were subsequently retrieved legally; their mere availability does not repair ownership R02–R03.

The arithmetic numerical tables behind the X₁(11) examples were treated as the explicit hypotheses the README says they are. Their displayed arithmetic was recomputed; no independent certification of those large arithmetic computations is claimed. The five Lean sorry statements were checked for signatures and adversarial instances, not proved.

## Source issues

- **Misprint** in kakde at Lemma 72, p. 49: the source identifies the completed localized residue with a power-series ring; it should be the Laurent-series field 𝔽_q((T)); affects the proof.
- **Misprint** in kakde at Proposition 74, proof, p. 50: the source's second logarithmic expansion omits the powers inside Frobenius; it should use φ(v^k)/(pk) term by term; affects nothing.
- **Misprint** in burns-venjakob at §6.1, p. 28: the source labels the displayed Gamma leading coefficient by the opposite integer; it should index Γ* at the integer where the value or residue is taken; affects nothing.
- **Gap** in burns-venjakob at §5.2, after equation (19), p. 24: the source calls the factorized p-adic regulator map an isomorphism before imposing Leopoldt; it should require Leopoldt for that invertibility conclusion; affects the proof.
- **Misprint** in burns-venjakob at §6.2, Dabrowski–Panchishkin condition, p. 29: the source identifies Fil⁰ of the ordinary part with a de Rham tangent quotient; it should use the full de Rham realization of that ordinary part; affects nothing.
