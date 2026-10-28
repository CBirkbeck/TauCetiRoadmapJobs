<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1119#issuecomment-6450126637 -->
Red team round 2 pass a (codex) of 3cacbea

Verdict: needs_changes

1. **F01** (P2) The fibre theorem excludes the algebraic lattices to which it is applied

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:503, “on which some V_v … acts trivially”; application at line 946, “By §1.5, generation by r elements is equivalent to dim_𝔽 Hom_K(L_j, π) = r”.

   **Claim:** §1.5 supplies the fibre identity for L_j and N_j in §4.7, and the big-module comparison in §1.6 covers these coefficients.

   **Witness:** For f=1, diag(1+pⁿ,1) acts on the adjoint vector E₁₂ by 1+pⁿ≠1 at every n. Thus L₀ has no open kernel. BHHMS23 line 5222 allows continuous coefficients.

   **Exact repair text:** Replace the opening restriction of §1.5 by: “For every continuous K-representation σ_v on a finitely generated W(𝔽)-module with the prescribed central character, choose an open normal V_v⊆K₁ acting trivially on σ_v/pσ_v. In the finite-level Hom formula use σ_v/pσ_v. Exactness gives M∞(σ_v)/𝔪∞ ≅ M∞(σ_v/pσ_v)/𝔪∞, and every map to π factors through σ_v/pσ_v. Thus M∞(σ_v)/𝔪∞ ≅ Hom_K(σ_v,π)^∨ without a smoothness assumption on σ_v.” In §1.6 replace “as in §1.5” by “on a finitely generated W(𝔽)-module with the prescribed central character”, and retain the full continuous Hom comparison (BHHMS23 lines 5221–5223).

   **Repair test:** The lattice L₀ has nontrivial action by g at every integral level, but its reduction is finite and has an open action kernel. Both Hom spaces into the characteristic-p π are identical, and their dual equals the repaired residual fibre. Add this as a negative-control Check.

2. **F02** (P2) The new quaternionic transfer step drops the discrete-series type restriction

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:321, “not an unramified twist of a pure unramified one, so … discrete series”.

   **Claim:** The indicated exclusion alone turns a lift on a chosen local component at a ramified quaternionic place into a discrete-series automorphic local factor.

   **Witness:** A ramified principal series with distinct inertial characters has N=0 but is not discrete series. GK14 lines 1278–1285 and 1415 require scalar or irreducible type and starred components.

   **Exact repair text:** Replace that step by: “At each w∈S_D choose τ_w scalar or irreducible as a Weil type. If τ_w is scalar, use only components whose points are not all potentially unramified; these are the starred local rings of GK14 §5.2.6 (lines 1278–1295). Apply gap:quaternionic-component-realization to components of these rings. An irreducible Weil type forces a supercuspidal factor. In the scalar case, a non-discrete-series factor would be a twist of an unramified principal series; local–global compatibility gives N=0 and purity. But on a scalar starred component the Frobenius eigenvalue ratio is q_w or q_w⁻¹, including at its intersection with an unramified component, whereas purity with N=0 requires absolute-value ratio 1 (GK14 lines 1413–1419). Global Jacquet–Langlands then transfers the lift to D.” Specify these local conditions in the quaternionic datum used in §0.6 and add AutomorphicGaloisRepresentations §4.2 (Ramanujan–Petersson, README.md:1892–1898) to its Needs for the purity step; §4.4 supplies compatibility, not temperedness. Retain the broader GL₂ supplier gap unchanged.

   **Repair test:** A principal-series type χ₁⊕χ₂ with χ₁|I≠χ₂|I is neither scalar nor irreducible and is excluded. A scalar type on the monodromy component and an irreducible Weil type remain available; the argument no longer tries to transfer a ramified principal series. This is a defect in the new application of the gap, not an objection to declaring the gap.

3. **F03** (P3) The newly owned comparison lattices have no discriminating Checks

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:821, “T′_{2,j} the image … Y_j … N_j”; Checks at lines 842–850.

   **Claim:** §4.1 defines T′, Y and N, but all six Checks concern the imported P, R′ and L or the weight set. None computes N; the later §4.4 lattice Check does not repair that omission.

   **Witness:** All current §4.1 Checks also hold after replacing N=L×_Y T′ by L⊕T′. For L=T′=O and Y=O/p, the fibre product requires a≡b mod p, while the direct sum does not.

   **Exact repair text:** Add these three Checks explicitly as underlying O-lattice tests of the constructions:

   - “Project R=O⁴ onto its first three coordinates T=O³. For R′=Oe₁+pOe₂+pOe₃+pOe₄, its image is T′=Oe₁+pOe₂+pOe₃. With L=O mapping onto Y=T′/pT, dim Y=1, whereas dim T′/pT′=3. Thus Y uses pT, not pT′.”
   - “For this data N consists of (a,(b,pc,pd)) with a≡b modulo p. It has basis (1,e₁),(0,pe₁),(0,pe₂),(0,pe₃); ker(N→L)=pT≅T by multiplication by p. The pair (0,e₁) is in L⊕T′ but not in N.”
   - “Projecting T onto Oe₁⊕Oe₂ sends T′ onto Oe₁+pOe₂ and induces N↠N′. The ranks are 4 and 3 and the kernel is generated by (0,pe₃). Taking the whole target lattice as the image would instead give a two-dimensional quotient modulo pT.”

   **Repair test:** The displayed bases compute each quotient, kernel and rank. They distinguish the actual image, the two reductions and the gluing condition; the wrong direct sum and wrong quotient fail.

4. **F04** (P2) The definite doubling argument consumes an even-degree supplier at arbitrary degree

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:339, “The definite case uses … §R18.3.9 in place of the cohomological degeneracy maps.”

   **Claim:** The definite version of §0.7 applies to every allowed totally real F and is supplied by the parent's definite degeneracy theorem.

   **Witness:** TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:2786 explicitly assumes even [F:ℚ]. A definite quaternion algebra over ℚ ramified at ∞ and one finite prime is allowed here, but [ℚ:ℚ]=1 fails that supplier hypothesis.

   **Exact repair text:** Replace the last sentence of the proof route by: “For the definite constant-coefficient case use HilbertModularVarietiesAndShimuraCurves §R18.3.8, definiteIhara_injective, over arbitrary totally real F, and §R18.4.21 for the central-character part. Integral coefficient spaces are those of §§R18.3.1, R18.3.3; their finite-set pullback and trace maps have the Gram matrix of §R18.4.14 by the local double-coset calculation of §R18.3.6. The same unit-discriminant splitting and exclusion of the new spectrum give the integral and residual doubling comparison.” Replace §R18.3.9 in this Needs line and in the supplier contract at line 57 by §§R18.3.8, R18.3.6 and R18.4.21. The general injectivity theorem is already owned by the parent; do not re-plan it.

   **Repair test:** Over ℚ with D ramified at ∞ and ℓ≠p,w₁, the class sets and both translations exist. With q=2 and residual ratio 3 in F₂₉ the Gram determinant is (2−3)(2−10)=8, so the splitting works. No step invokes even degree or narrows the target.

5. **F05** (P2) A nontrivial torus character need not be principal series

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:339, “an eigenform in a part with a nontrivial character is a ramified principal series”.

   **Claim:** All nontrivial torus-character pieces at the pro-residue-characteristic Iwahori level come from ramified principal series.

   **Witness:** At residue cardinality 3, let χ be tamely ramified quadratic. St⊗(χ∘det) has pro-residue-characteristic Iwahori invariants with nontrivial torus character χ⊗χ. It is special, not principal series; χ has order 2, prime to 29.

   **Exact repair text:** Replace the classification sentence by: “A nontrivial torus-character eigenspace can come from a ramified principal series or a ramified character twist of Steinberg. In both cases its Weil–Deligne inertia has a nontrivial tame character of order dividing q_w−1. Since p∤q_w−1, reduction preserves that character. Local–global compatibility therefore excludes both cases at the unramified residual ideal.” Retain the subsequent argument for trivial torus character, which separates unramified principal series from unramified Steinberg twists.

   **Repair test:** For the quadratic twist at q=3, its inertial value −1 remains 28≠1 in F₂₉, so it is excluded for the stated residual reason, without falsely identifying its local representation. Add this as a Check of the torus-character argument.

## Round-one repair verification

All seven findings of pass a and the one finding of pass b were checked against this head and their cited sources. The repair report marks none “not actionable in this package”. Paths and line numbers below refer to packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md unless otherwise specified.

| Earlier finding | Disposition and repaired passage | Witness at this head |
|---|---|---|
| a.F01, missing rank-two Galois factor | **Repaired.** Lines 521, 536–540: “the dual of full localized completed cohomology is … C^{⊕2}”; lines 1114, 1137 retain Ĉ⊗ρ and the same distinction. | DL21 lines 3164–3167 patch the dual multiplicity space; lines 3200–3228 identify its fibre. At multiplicity rank 2, C has rank 2 and the full dual rank 4. Faithfulness and flatness pass between C and C⊕C. |
| a.F02, Tate twist omitted from residual input | **Repaired.** Line 418: “r̄_v^∨(1)”; lines 415, 427 and 960–966 transport determinant εψ⁻¹ to ε³ψ⁻¹. | BHHMS23 lines 5074–5076. At ω(g)=2 in F₂₉, twisting a two-dimensional representation multiplies its determinant by 4. Weights (2,−1) become (3,0), sums 1→3. |
| a.F03, component-realization prerequisite unowned | **Partly repaired.** Lines 119 and 321 introduce “gap:quaternionic-component-realization” and explicitly obtain a point on every chosen component before the multiplicity argument. | The same fifth slug, supplier and contract occur in design/plan.json. GK14 lines 1253–1267 support that contract. The new transfer step still loses the scalar/irreducible starred-type restriction: S02. The node Check at line 327 correctly gives e(A/(x))=1 versus e(A)=2. |
| a.F04, sign Check did not detect sign | **Repaired.** Line 38: “its differential sends the basis vector 1 to −p, which differs from +p in O”. | For C⁻¹→C⁰ given by p, the Hom differential at degree 0 is −f∘d, hence −p; both cokernels remain O/p. The value of the map now separates the conventions. |
| a.F05, arbitrary away-level treated as K₁-stable | **Repaired.** Line 1090: “Π is the tower with levels varying at all places above p”; π is its indicated away-place invariants. | Line 1095 uses V=⟨1+pE₁₂,K₃⟩. Conjugation by 1+pE₂₁ adds p²(E₂₂−E₁₁) modulo p³, outside V. The proof now embeds invariants in Π^{K₁}, without claiming that V is normalized. |
| a.F06, local partial lattice construction duplicated | **Repaired.** Lines 12, 821, 834–840 import “partial fibre products L_j” from MP.8/projective-lattice. | packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md:2365–2397 supplies the recursion and endpoint. Ranks d,4d,7d agree. Only the type-dependent image, Y, N and patched comparisons remain owned here. Their missing Checks are S03. |
| a.F07, nonlocal projection called localization | **Repaired.** Line 1120 uses the residual maximal ideal of F×F. | At m=0×F, (1,0) becomes a unit and annihilates (0,1); localization is F. This is an actual local factor, not a surjection from a local ring with two residual factors. |
| b.F01, quaternionic tower cited to wrong supplier sections | **Repaired.** Lines 101, 296–307 and 358 now cite “§§8.3–8.4”. | TauCetiRoadmap/CompletedCohomologyPartII/README.md:1924–1948: §8.3 explicitly supplies selected quaternionic finite coefficients and §8.4 transports the tower. It retains one split real place, central descent and effective deck groups. |


## Verified sound

Read all 1177 README lines and all 39 Suggested.lean lines, the repository rules, both earlier reports and the repair report. Inventory: **39 numbered mathematical target blocks**, their API assertions and proof routes, **138 Check bullets in 41 groups**, **0 Lean declarations**, **107 distinct explicit source-line anchor starts across 12 cached works**, and **15 supplier-contract families**, plus the two ownership-boundary references to GL2ModularityLifting and LocallyAnalyticDistributionsPartII. The source-line anchors were resolved to the supplied extractions, including surrounding hypotheses and the proof steps used here. The counts record material inspected; S01–S05 identify exceptions to correctness or coverage. Repeated numerical Checks are counted as bullets, not as independent evidence.

The five declared gap slugs occur in both design/plan.json and the README, with named earlier suppliers and matching mathematical needs. The broad GL₂ component-realization contract itself is accepted; S02 concerns its quaternionic application. The coherent local single-type contract includes the nonsplit extension of the current semisimple supplier, rather than silently importing it. No gap is rejected merely because its supplier has not implemented it.

The declaration inventory is empty:

| Suggested.lean item | Section, variables and instances | Computed inventory / result |
|---|---|---|
| Module, lines 1–39 | One `import Mathlib`; namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII; no variable/include block | 0 definitions, 0 instances, 0 theorems, 0 examples, 0 admitted data, 0 set_option; no elaborated signature can lose a binder. |

The README's headline list is: quaternionic weight modularity (§0.6); functorial patching and the big module (§§1.4–1.6); noncommutative grade/CM transfer and flatness (§§2.4–2.6); common-rank weight/type/projective freeness (§§3.2–3.4); adjoint and glued-lattice freeness and first-order multiplicity (§§4.4–4.9); weighted/unweighted GK dimension (§§5.1, 5.5); second-congruence structure (§5.2); patched faithful flatness (§5.3); nonzero Banach lifts (§5.4); and inert-prime R=T, completed-dual flatness and complete intersection (§5.7). Each is named in the module docstring with its missing carrier. The small commutative-algebra criteria of §§2.2–2.3 are supporting results rather than substitutes for these headlines. There is no padded Lean declaration to delete and no fully qualified declaration collision.

### Computed adversarial inventory

In the tables, O denotes the coefficient DVR, k its residue field, and r the common positive patched rank. A calculation on an algebraic model tests the stated algebraic interface; it is not asserted to construct a global automorphic datum. Every numbered target has a row; additional rows separate definitions and conventions that otherwise hide different tests. “Retain” means these instances produce no new finding, not that a finite test proves the theorem.

| Statement / location in README | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| Conventions: geometric Frobenius and Hecke polynomial, lines 27, 35 | In F₂₉, q=5, roots 2,3: S=5/6=25, T=25·5=9, S⁻¹=7; polynomial X²−7·9X+5·7=X²−5X+6. Inverting Frobenius gives roots 15,10. | Geometric and arithmetic conventions are distinguished; retain. |
| Conventions: parent normalization adapter, lines 57, 1121 | Arithmetic roots of r̄⊗ω are 5/2=17 and 5/3=21; T=17+21=9, S=17·21/5=25. The parent's geometric realization has these roots, then 5/17=2 and 5/21=3 recover the chosen input. | The two dual/twist operations agree; retain. |
| Conventions: central and Hodge twists, lines 27–38 | Sym²det⁻¹ has scalar action z²z⁻²=1; χ(z)=2 gives inverse determinant twist 2⁻²=22, versus 4. Hodge pair (2,−1)+1=(3,0), determinant sum 1→3, residual determinant multiplier 4. | Sign and residual input consistent after a.F02 repair. |
| Conventions: duals, lines 29, 38 | Hom_O(k,O)=0; Hom_O(k,E/O)=k. Dual of O --p→ O in degrees −1,0 has differential −p in degrees 0,1; either sign has cokernel k. | Correct negative control; a.F04 repaired. |
| Conventions: direction and opposite algebra, lines 39–41 | k[C₂₉] has dimension 29; its invariants dimension 1. Upper/lower unipotents u,v over F₂₉ give uv=((2,1),(1,1)), vu=((1,1),(1,2)); inversion reverses products. | Pullback direction and contragredient side retained. |
| Support and zero conventions, lines 31, 610–614 | Ann_A(0)=A, quotient support 0; 0 is free over the zero ring of every finite rank. Over a field, k² has rank 2, not 1. Grade(0)=∞, δ(0)=−∞. | Nonzero hypotheses correctly separate finite numerical equalities and CM. |
| §0.1 generic datum, line 139 | p=29,f=1: reducible box {12,13,14}, irreducible box {13,14,15}; p=23 gives 12≤8, hence empty. p=3 gives only the excluded reducible endpoint. f=0 is disallowed; (ℚ,M₂(ℚ)) is excluded from the proper-curve case. | Retain. The p≥29 consequence uses primality, not natural truncated subtraction. |
| §0.2 semisimple BDJ definitions, line 178 | p=5, inertia ω²⊕1: {Sym¹,det²Sym¹}, dimensions 2,2. Irreducible inertia ω₂²⊕ω₂¹⁰: {Sym¹,det Sym³}, dimensions 2,4. For generic f=2 the four subsets give 4 weights. | Both iff directions agree with the recipes; retain. |
| §0.2 boundary and extension-class recipe, lines 178, 208–218 | p=5, ω³⊕1 gives {Sym²,det³,det³Sym⁴}, count 3. Split ω⊕1 gives {1,Sym^(p−1),det Sym^(p−3)}, count 3; a très ramifiée extension leaves {Sym^(p−1)}, count 1. | The extension class and the nonregular boundary are retained; semisimplification alone would fail. |
| §0.2 types and lattices, lines 198–200 | p=29, ω¹³⊕1: weights of dimensions 13 and 15. Isolating type intersection has size 1; all-weight τ₀ has size 2 and dimension 28, versus scalar type dimension 1 and principal-series type dimension 30. A split two-weight sum has two cosocle factors; the required nonsplit layer has one. | Type assertions are supported by EGS15 lines 687, 767, 3324, conditional on gap:tame-types; retain. |
| §0.2 crystalline comparison, line 202 | ρ=ω⊕1, ω(g)=2 mod29: trivial GK14 Hodge type has residual determinant 15; detρ(g)=2. It instead belongs to ρ∨, via ε⁻¹⊕1. For the très ramifiée extension both relevant sets have size 1, not 3. | Dual input and HT convention correct; retain. |
| §0.3 spaces, functor variance and evaluation, line 226 | Zero coefficient gives zero. A multiplicity module of dimension 2 tensored with a rank-two Galois representation has dimension 4, not 2. Pontryagin dual reverses exact arrows and the second dual restores covariance. | Retain. Central quotient and finite-level descent hypotheses are explicit. |
| §0.3 coefficient twisting | At χ(z)=2, the dual action changes a scalar by 2⁻¹=15; determinant twisting changes it by 2²=4. Residual-trivial square roots are unique for p>2; at p=2, −1 and 1 have the same square, explaining exclusion. | Compatible character and fixed unramified value are needed and stated. |
| §0.4 finite-level projectivity, line 261 | Over F₂₉, the trivial C₂-module is projective of dimension 1 while free modules have even dimension. For S₃ the corresponding dimensions are 1 versus multiples of 6. A free F₂₉[C₂₉]-module of rank 1 has dimension 29. | Arbitrary finite quotient gives projective; p-group gives free. No prime-to-p averaging is used for C₂₉. |
| §0.5 weighted colimit, line 279 | For v of degree 1 the generic dual input has two modular weights; a third contributes 0. Twisting by χ⁻¹det changes the centre by 22, not 4. Empty away-place tensor is O. A nonzero finite representation would have GK dimension 0 and cannot be the eventual dimension-1 object. | Definition and subsequent nonvanishing distinguished; retain. |
| §0.6 quaternionic weight theorem, line 311 | Local multiplicities (1,1) give product 1; (1,0) give 0. On A=k[[x,y]]/(xy), M=A/(x) has depth 1=dim A but multiplicity 1≠2=e(A). At a ramified place, distinct inertial characters with N=0 give principal series, not discrete series. | Common-component support is essential. Gap supplies it on GL₂; quaternionic adapter needs S02. |
| §0.7 doubling and parity, line 333 | q=2, ratio 3 in F₂₉: (2−3)(2−10)=8; ratio 2 gives 0. A cubic indefinite algebra has 2 ramified real places and even finite ramification; a rational definite algebra has 1+1 ramified places. At q=3, a quadratic Steinberg twist has torus character χ⊗χ≠1 and inertia −1=28 mod29. | Numerical discriminant correct; supplier scope S04 and local classification S05 need repair. |
| §1.1 patched rings and variable counts, line 364 | F=ℚ, S={p,ℓ}, q=f=1: variables R∞=10, S∞=8; dimensions 11−9=2=2f. For f=2, S={v}, q=2: variables 9 and 5; dimensions 10−6=4. Extra variables q−f=0 give the original local factor. | Retain; finite S and q≥[F:ℚ] exclude negative counts. |
| §1.1 local formal smoothness | A one-weight degree-one type gives O[[t₁,…,t₄]], special dimension/cotangent dimension 4/4. The two-weight model O[[x,y,z₁,z₂,z₃]]/(xy−p) has special dimensions 4/5. An unrestricted degree-2 determinant has 3 directions, versus 1 at fixed Hodge/inertial type. | Distinguishes the correct isolating-type input and unrestricted determinant; retain. |
| §1.2 Hodge/type quotients, line 401 | (1,0) has sum 1; (2,0) has sum 2 and the incompatible fixed-determinant quotient is zero. (2,−1) has sum 1; twisting gives (3,0), sum 3 and residual determinant factor 4. | Retain with a.F02 repair. |
| §1.3 patching-functor conditions, line 434 | Zero functor obeys ordinary exactness but fails the positive minimal-rank property. For A=O[[t]], depth(A)=2 and depth(A/(t))=1; A/(p) has p·1=0. | MCM, torsion-freeness and minimality are separate conditions, not a hypothesis containing the final headline. |
| §1.4 actual coefficient functor, line 466 | The zero coefficient gives 0; a nonmodular Serre weight gives 0, a modular one gives a positive fibre. Over k[ε]/ε², multiplication by ε is nonzero although all residue-field points kill ε. Two surviving away weights contribute 1+1=2, unlike the isolating choice. | Genuine ring actions and one-weight choices matter; retain. |
| §1.5 fibre comparison, line 503 | A free rank-2 module over a quotient has residual fibre k². On the adjoint lattice, diag(1+pⁿ,1)·E₁₂=(1+pⁿ)E₁₂≠E₁₂ for every n, while reduction modulo p has an open action kernel. | The existing hypothesis excludes later coefficients; S01. |
| §1.6 big module, line 521 | Integral dual of k is 0, torsion dual is k. Residual group dimension is 3f: for f=1 grade 2 gives δ=1; for f=2 grade 4 gives δ=2. At rank r=2 augmentation gives multiplicity rank 2 and full H¹ rank 4. | a.F01 repaired; coefficient domain still needs S01. |
| §2.1 noncommutative CM, line 570 | Λ=O[[T]]: Λ has (grade,depth,δ)=(0,2,2); Λ/(T) and Λ/ϖ have (1,1,1). Λ⊕Λ/ϖ has nonzero Ext⁰ and Ext¹. For trivial K, k has grade 1 over O; zero has ∞. | CM equivalence, extension-minimum grade and side convention agree; retain. |
| §2.2 support-freeness criterion, line 602 | A=F₂[ε]/ε², M=A,N=(ε): endpoint ranks 1,1, Ann(M)=0 and Ann(M/N)/Ann(M)=(ε)≅k. M=k² needs 2 generators and gives annihilator quotient 0. Over ℤ/4, N=2A gives the same nonzero quotient ℤ/2. | Correct without Noetherian or local assumptions. r=0 only forces M=0 and is excluded from the theorem. |
| §2.3 fibre-product criterion, line 629 | Node branches A/(x),A/(y) over k give pullback A, ann intersection 0 and ann sum (x,y). Over k[[t]], A×_k A≅A², rank 2≠1, ann sum 0≠(t). Identity maps give the diagonal rank r, not 2r; two zero maps k→k give k². | Both directions and surjectivity tested; retain. |
| §2.4 variable/coefficient comparison, line 656 | A=O[[T,x]], M=A/(x): grades 1 and 0, dimensions 2 and 2. For M=A: grades 0 and 0, dimensions 3 and 2. k[[T]]/(Tⁿ) has length n, hence log_n n=1 for n≥2. O=ℤ₃[π]/(π²−3): O/π=F₃ but O/3=F₃[π]/π². At p=2,K=1 grades of F₂ are 1 and 0. | Correct uniformizer, nonzero and growth-domain conventions; retain. |
| §2.5 CM transfer, line 676 | A=O,B=O[[y]],M=O with y=0: depths 1=1. M=B has depths 1<2 and is not finite over A. A=O[[T]],B=A[[y]]: for M=B depths 2<3; for M=B/(y), depths 2=2. | Finiteness over both rings is precisely what the equality uses; retain. |
| §2.6 miracle flatness, line 693 | A=O[[T,x]], M=A/(T): grade 1=1 on the residual coefficient fibre and M≅O[[x]] is flat. M=A/(ϖ): grades 1≠0 and ϖ·1=0 prevents coefficient-flatness. | Both iff directions tested; retain. |
| §3.1 MCM over support, line 723 | A=k[[x,y]], M=A/(x): support ring dimension 1 equals depth 1, whereas ambient dimension is 2. Zero is separately allowed. | The specified support ring is essential and retained. |
| §3.2 common-rank freeness, line 739 | For r=2, each surviving weight/type fibre has dimension 2, not necessarily 1; a two-weight local node has both branches with rank 2. A nonmodular coefficient gives 0. | Rank is uniform in weight/type, not forced to be minimal 1; retain. |
| §3.2 component-intersection ideals | In k[[x,y]]/(xy), I_all=0, I_empty=A and I_one=(x). The cyclic quotient (x) is annihilated by (y), hence ≅A/(y). For two crossing coordinates, common-cap intervals give (x₁)+(x₂)=(x₁,x₂); the noninterval corner example gives (x₁,x₂y₁)≠(x₁,x₂). | Empty sets, cyclic quotient and common-cap restriction tested; no universal ideal-sum claim. |
| §3.3 locally algebraic supports, line 771 | At r=2 and multiplicities 1,2, generic ranks are 2,4. A det²⁸ twist has trivial residual character, but on scalar 30 in ℤ₂₉ its central value 30⁵⁶≡784≠1 mod841. Adjoint central value remains 1. | Full central-character condition, not merely its reduction, correctly restricts the functor. |
| §3.4 projective-lift freeness, line 789 | Hom(P_σ,D₀²) has dimension 2 since the quotient by the socle contains no σ. A proper essential extension can have the same socle but larger total dimension; the independent reverse embedding makes both dimensions 2 dim D₀. | Reverse embedding avoids assuming that equal socles imply equality; retain. |
| §4.1 imported P,R′,L, line 821 | With d=dim P, ranks L₋₁,L₀,L₁ are d,4d,7d; f=1 endpoint rank 4d. R′/pR has dimension d, but R′/pR′ has dimension 3d. Using R instead of R′ preserves the unwanted two cosocle factors. | Ownership and quotient distinction correct after a.F06 repair. |
| §4.1 new T′,Y,N | For T=O³,T′=Oe₁+pOe₂+pOe₃,L=O, Y has dimension 1, not 3. N has rank 4 and kernel pT under N→L; (0,e₁) is excluded by its congruence condition. | Definition computes correctly; the README needs the discriminating Checks in S03. |
| §4.2 small quotients, line 856 | Q=σ has [Q/soc Q:σ]=0 and fails the required value 1. The permitted self-socle configuration has Loewy length 3; the other-socle case has length 2. | The simple boundary does not accidentally satisfy the hypotheses; retain. |
| §4.3 generator bound, line 872 | At r=2 the lower projective quotient forces at least 2 residual generators and the filtration gives at most 2, hence 2=2. Taking r=1 would contradict the residual fibre dimension 2. | Retain, after S01 extends the fibre identity. |
| §4.4 adjoint type lattice, line 888 | For O³ and the stated elementary modification, W₁ has dimension 2, L/pL dimension 3, W₂ dimension 1; multiplication by p identifies the appropriate kernel. Hom_O(k,O)=0, so a nonzero torsion quotient cannot map onto a characteristic-zero lattice. Adjoint and scalar factors have dimensions 3 and 1. | Correct quotient target and scalar/adjoint separation; retain. |
| §4.5 support freeness, line 908 | A surjection S²→M which becomes an isomorphism after inverting p has p-power-torsion kernel; S p-torsion-free forces this kernel to be 0. Thus rank 2 survives integrally. | Kernel argument uses the source ring's torsion-freeness; retained. |
| §4.6 third-radical comparison, line 924 | k[t]/t⁴→k[t]/t³ becomes an isomorphism after quotienting by rad³: dimensions 3=3, while original dimensions are 4≠3. | No accidental whole-lattice isomorphism; retain. |
| §4.7 generation for L,N, line 940 | At r=2 both intended Hom spaces have dimension 2; any new copy gives dimension at least 3 and contradicts the generator bound. Integral L contains E₁₂ with eigenvalue 1+pⁿ at every open congruence level. | Numerical route sound once S01 fixes its domain. |
| §4.8 glued freeness and exact profiles, line 956 | f=1: j=−1 has 1 profile, j=0 has 2. f=2,j=1 has 3 profiles and generic coefficient rank 7d, versus the wrong 4-profile tensor rank 16d. The inverse norm at diag(2,1) is 15, not 2. At p=29,N=12,a₂=2,d₂₁*=1, the unit factor is 1+O(29³), denominators 2 and 1. | Corrects the source's rectangular support overclaim; generic denominators are nonzero. |
| §4.9 first-order multiplicity, line 980 | At r=2 the surjection k²→k² has kernel dimension 0; before taking the fibre, k[[t]]→k has kernel (t)≠0 despite generator counts 1=1. The f=2 support still has 3 profiles. | Fibre theorem is not confused with an integral isomorphism; retain. |
| §5.1 weighted GK dimension, line 1016 | f=1: residual ambient dimension 3 and grade≤2 give GK≥1, local bound≤1, hence 1. f=2: 6−4=2 and local bound≤2, hence 2. | Upper and lower bounds are independent; retain. |
| §5.2 second-congruence structure, line 1032 | For r=2 each modular constituent has multiplicity 2; K₁ invariants are D₀². Replacing the whole second-order summand by its socle loses the positive first-radical quotient. | Uses multiplicity and hull, not dimension alone; retain. |
| §5.3 faithful flatness, line 1050 | Grade is 2f: 2 at f=1 and 4 at f=2, equal to the residual grade. Frac(O) is O-flat but its closed fibre is 0; the actual module has π∨≠0. | Nonzero closed fibre supplies faithfulness; retain. |
| §5.4 Banach lift, line 1066 | For compact k, Hom_O(k,E)=0 despite k≠0. A nonzero flat compact O-module has a torsion-free lattice; O gives E after Schikhof dual/rationalization, with unit-ball reduction k. | Flatness is used before asserting a nonzero Banach lift; retain. |
| §5.5 unweighted GK dimension, line 1082 | k[C₂₉] has invariant dimension 1 versus 29. V=⟨1+pE₁₂,K₃⟩ is not K₁-normal: the conjugate contains p²(E₂₂−E₁₁). The full tower Π nevertheless carries K₁ and contains the required away-level invariants. | a.F05 repaired; auxiliary-level comparisons still need S04–S05. |
| §5.6 completed arithmetic carriers, line 1101 | (k×k)_(0×k)=k: e₁=1,e₂=0. Hecke T=9,S=25 give trace 5, determinant 6. O --p→ O has one integral cohomology degree but reduction has two copies of k in adjacent degrees. Inert p gives empty away tensor O; two p-places give one nonempty factor. | Finite image, localization, concentration and inertness are all retained. |
| §5.7 R=T and complete intersection, line 1131 | O[[x,t]]/(x)=O[[t]] is codimension 1; action on its free module has kernel 0, unlike action on 0. C and C² have the same annihilator; N⊗C²=(N⊗C)² vanishes iff N⊗C=0. | Faithfulness forces both surjections to be isomorphisms; the rank-two correction preserves the conclusion. |


### Boundary domains and native-carrier checks

| Boundary / wrong model | Computation and domain decision |
|---|---|
| Zero ring, unit ideal, zero module | A/A=0; Ann(0)=A; the free module (A/A)^r=0 for every r. The support-rank convention explicitly allows this, while the nonzero statements of §§2.1, 2.3–2.6 exclude it. Native IsLocalRing includes 0≠1. |
| Empty index set and n=0 | The empty completed tensor product is O; O[[x₁,…,x₀]]=O. With one place above p the away-weight tensor has rank 1, whereas adding another place contributes its actual coefficient dimension. S itself is nonempty because it contains v. |
| p=2, p=3, q=1 and residue field F₂ | The global box has no solution at p=2 or 3; for p=23 its upper bound is 8<12. A residue cardinality is p^f≥2, never 1. General Layer 2 still allows p=2: over O=ℤ₂ and K=1, F₂ has grade 1 over O and grade 0 over F₂. |
| Ramified coefficients and equal characteristic | In O=ℤ₃[π]/(π²−3), O/π has length 1 while O/3 has length 2. Layer 2 uses π, not p. Equal-characteristic DVRs are outside its explicit finite-over-ℤ_p domain, not silently substituted. |
| Fields versus DVRs; square-zero thickenings | The field-valued support criteria allow A=k and rank(k²)=2. Over k[ε]/ε², multiplication by ε is nonzero although every field-valued point kills it. Genuine action maps, not pointwise actions, are required in §1.4. |
| Noncompact groups and p-torsion | GL₂(F_v) acts on π, but the Iwasawa calculations use compact K₁/Z₁. For C_p, k[C_p]=k[t]/t^p has infinite projective dimension for k; this does not meet the torsion-free hypothesis in §2.1. |
| Inseparability and universes | Local number fields have characteristic zero, so the purely inseparable positive-degree case does not occur. Finite residue extensions are separable. Suggested.lean has no quantified carrier or universe-changing map to admit unintended objects. |
| Out-of-range indices, subtraction and division | The lattice indices are −1≤j≤f−1, with −1 the rank-d base case; j=f is not a target. Global counts have q≥[F:ℚ]≥f≥1 and |S|≥1. In the explicit F₂₉ tests, inverses are 2⁻¹=15, 3⁻¹=10, 25⁻¹=7; none is zero. The logarithmic growth test starts at n≥2. There is no Lean natural-subtraction or division-by-zero term. |
| Identity maps and noncommutativity | The pullback of two identities is {(m,m)}, rank r, versus full-product rank 2r. The displayed unipotents satisfy uv≠vu, so inversion is an opposite-algebra identification. The S₃ projectivity test has dimensions 1 versus free dimensions divisible by 6. |

At Mathlib pin **6b7abb3c7686292736be2955bd3eb9ebf63b456a**, all 20 named declarations in the contract exist. The following records their native scope, including the restrictions that do not come for free.

| Declarations | Pinned files and lines | Scope verified |
|---|---|---|
| CategoryTheory.Abelian.Ext | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118 | The category and HasExt instance are parameters; this is not an Iwasawa depth or analytic-group interface. |
| IsLocalRing; IsNoetherianRing; IsRegularLocalRing | Mathlib/RingTheory/LocalRing/Defs.lean:30; Mathlib/RingTheory/Noetherian/Defs.lean:192; Mathlib/RingTheory/RegularLocalRing/Defs.lean:51 | Nontriviality belongs to the local-ring predicate; regular locality adds its stated algebraic conditions. |
| LinearMap.ker; LinearMap.eqLocus; LinearMap.eqLocus_eq_ker_sub | Mathlib/Algebra/Module/Submodule/Ker.lean:59; Mathlib/Algebra/Module/Submodule/EqLocus.lean:45,102 | The equality locus is the submodule of equal images; for maps from a product it gives the actual fibre product. |
| Module.Finite; Module.Free | Mathlib/RingTheory/Finiteness/Defs.lean:121; Mathlib/LinearAlgebra/FreeModule/Basic.lean:43 | Finite means finitely generated; Free means existence of a basis and alone places no finite bound on its cardinality. |
| Module.Flat; Module.FaithfullyFlat | Mathlib/RingTheory/Flat/Basic.lean:113; Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63 | FaithfullyFlat extends Flat and includes the proper-fibre condition. Flatness alone does not exclude Frac(O) with zero closed fibre. |
| Module.annihilator; Module.support | Mathlib/RingTheory/Ideal/Maps.lean:868; Mathlib/RingTheory/Support.lean:47 | The former is the kernel of the scalar action, the latter detects nonzero localizations. These do not identify generic rank with support-freeness. |
| MvPowerSeries; PowerSeries | Mathlib/RingTheory/MvPowerSeries/Basic.lean:86; Mathlib/RingTheory/PowerSeries/Basic.lean:56 | Native coefficient functions support the simple formal-series carriers, including the empty variable set. |
| Matrix.GeneralLinearGroup; Nat.Prime; Representation | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42; Mathlib/Data/Nat/Prime/Defs.lean:42; Mathlib/RepresentationTheory/Basic.lean:48 | GL is units of matrices; the representation is an algebraic monoid homomorphism into linear endomorphisms. Smoothness, admissibility and continuity are additional. |
| WittVector; Submodule.spanFinrank | Mathlib/RingTheory/WittVector/Defs.lean:52; Mathlib/Algebra/Module/SpanRank.lean:66 | The Witt carrier is a sequence carrier with its supplied algebraic structure. spanFinrank is cardinal-to-natural conversion: infinite rank has natural junk value 0, so the README correctly limits generator-count use to finite modules. |

At Tau Ceti pin **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**, TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:117–130 defines the compatible-family subalgebra by the law “carrier := {x | … mapDomain … (x U) = x V}”; line 145 exposes TauCeti.completedGroupAlgebra. Its carrier requires a commutative coefficient ring, a group and a topology, but does not assert compactness, Hausdorffness, uniformity or analytic dimension. TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:344 supplies TauCeti.IsCompactModule.completedGroupAlgebraModule, and line 387 supplies its continuous scalar action with the stated compact-module and continuous-action hypotheses. These are imported objects, not new targets here.

Object searches of both pins found no carrier for the quaternionic multiplicity tower, its patched functor, the local Galois-type components or the claimed global automorphic representations. The native algebraic Ext and group-algebra objects do not make those headline statements statable by themselves. No headline has been replaced by a free predicate or an arbitrary-module stand-in.

### Supplier contracts, ownership and direction

The table records the current owner, the relevant hypotheses, and a separating test. Parent-roadmap paths are under TauCetiRoadmap/ unless a packages/ path is stated. Main-roadmap citations were checked on main, not against a progress revision. Design-owned suppliers were read at their board design. The supplied open heads were searched by mathematical object; this is an ownership search, not a full review of unrelated roadmaps.

| Supplier / actual targets checked | Witness and hypothesis comparison |
|---|---|
| HilbertModularVarietiesAndShimuraCurves, R18.1.1, 1.3–1.4; 3.1, 3.3, 3.9, 3.14–3.15; 4.1–4.2, 4.5–4.6, 4.8, 4.10, 4.14–4.16, 4.21, 4.24–4.25, 4.27 | README.md:1556,1609,1632,2624,2674,2782,2861,2873,3193,3217,3271,3296,3344,3382,3464,3492,3511,3664,3736,3815,3874. Central descent and non-Eisenstein finite-coefficient control are present. The coefficient multiplication by p test distinguishes finite reduction from integral control. R18.3.9 has even-degree scope; S04 repoints to the general R18.3.8 at line 2761. R18.4.29 is auxiliary-prime Ihara patching, not this p-adic coefficient functor. |
| ModpRepresentationsOfGL2OverLocalFields MP.3–MP.9, all named target identifiers in the contract | packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md:854,991,1048,1104,1158,1519,1573,1617,1794,1846,1946,1988,2074,2184,2365,2425,2462,2569. The local bound is an upper bound under its three conditions, not a global equality. The projective lattice includes the partial L_j and ranks d,4d,7d; only the new type-dependent images and patched statements belong here. The 8-deep box meets the weaker lattice and relative-projectivity bounds. |
| LocalGaloisDeformationRingsPartII T.0, T.4, T.6, T.7 | packages/LocalGaloisDeformationRingsPartII/design/README.md:717,982,1003,1024,1096,1131,1153,1202. Semisimplicity and stable presentation with 2f versus 4 variables are retained; nonsplit single-type inputs are explicitly a gap. Reduced node fibres have dimension 4, cotangent dimension 5; a one-weight smooth fibre has 4 and 4. The p-membership statement uses p and whole-type ideals, not arbitrary ramified π or uncoupled coordinate ideals. |
| LocalGaloisDeformationRings §§1.1, 1.4, 1.10, 1.24, 3.1, 3.4, 3.9–3.10 | Framed/fixed-determinant deformation problems and type quotients were read in their current sections. For degree f=2, unrestricted determinant characters have 3 directions; the fixed-Hodge/inertial-type comparison has only 1. The README makes this distinction. Monodromy zero is imposed for crystalline quotients, not inferred from inertial type alone. |
| GlobalGaloisDeformations §§3.3–3.7, 5.1, 5.7–5.8 | README.md:407,442,467,501,574,1117,1363,1399. Absolute residual irreducibility, fixed determinant, finite S and actual local conditions are retained. Empty tensor=O; the patching variable calculation is 10−8=2 at f=1 and 9−5=4 at f=2. |
| DeformationAndDerivedPatchingAlgebra §§1.6, 1.10–1.12, 3.1–3.4, 3.11–3.12, 5.6, 6.1–6.2, 7.2–7.3, 8.1–8.5 | README.md:181,244,259,279,527,562,593,616,750,763,1114,1214,1235,1370,1383,1559,1581,1602,1622,1648. Ring actions, compatible finite decorations and augmentation are supplied. The node module has depth 1 but multiplicity 1 versus ring multiplicity 2; generic support is supplied separately by the declared lifting contract. Abstract power-series cancellation is a gap, not falsely attributed to a presentation lemma. |
| NoncommutativeAndEquivariantIwasawa F.1, 0.10–0.11 | README.md:400–421 and the two current numbered sections supply native grade, coefficient shift, finite-index comparison and regularity only under the no-p-torsion assumptions. Over O[[T]], quotienting by ϖ shifts grade 0→1 and dimension 2→1. The new CM-transfer/flatness criteria are not already stated there. |
| CompletedCohomologyPartII F.1, 1.1–1.3, 2.4, 3.1–3.2, 3.7, 5.5, 8.3–8.4, 8.8, 8.10, 8.12–8.15 | README.md:183–190,645,812,841,945,1924–1948,2036,2087,2145,2176,2210,2230. The quaternionic tower is in 8.3–8.4. Derived finite Hecke images agree with ordinary ones here only after concentration; O --p→ O has one integral cohomology degree and two residual degrees. Pontryagin and Schikhof duals differ on k: k versus 0. |
| PadicMeasuresIwasawaAlgebras §§1.1–1.7, 5.2 | README.md:606–909,3367. Finite-quotient algebra and topological Nakayama require the specified compact Hausdorff modules and finite residue field. The discrete divisible module E/O has p(E/O)=E/O≠0, so cannot be substituted for that compact category. |
| SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 | README.md:558,617,696,800. Smoothness and central-character categories are explicit. Averaging for C₂ over F₂₉ divides by 2, whereas for C₂₉ the denominator is 0; the latter is handled by projectivity, not averaging. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.26, R07.5.15 | README.md:2028,8062. Fundamental-character and finite-field weight conventions are available; extending the weight to KZ requires the scalar action. At f=1 the two generic weights have dimensions 13 and 15, rather than assuming a scalar-invariant extension. |
| PotentialAutomorphyInfrastructurePartII PL.1 and PL.5 | packages/PotentialAutomorphyInfrastructurePartII/design/README.md:798,2102,2182. Potential Barsotti–Tate diagonalizability is local and does not by itself yield all-component quaternionic support. The new gap explicitly extends PL.5's lifting targets; S02 concerns the subsequent transfer. |
| Chebotarev Layer 10 | Chebotarev/README.md:410. Positive-density Frobenius sets have density #C/#G; deleting finitely many bad places leaves infinitely many. An empty conjugacy set has density 0, so nonemptiness is part of the auxiliary-prime selection argument. |
| AutomorphicGaloisRepresentations §§4.2–4.4 | README.md:1892–1915. Ramanujan–Petersson, the normalization, and Weil–Deligne compatibility are different inputs. For q>1 the ratio q has absolute value q≠1, which supplies the scalar starred-component purity argument in S02. |
| GL2AutomorphicRepresentationsAndTransfer R17.3.1, R17.3.10 | README.md:1601,1746. Global transfer requires discrete series at every finite ramified place; the one-split-real-place condition has finite ramification parity [F:ℚ]−1. The local classification and Steinberg Weil–Deligne parameter at lines 630 and 842 separate ramified principal series from ramified Steinberg twists (S05). |

The boundary citations also resolve: GL2ModularityLifting §8.1, README.md:2196, has the totally split patching filtration; it is not silently used at a general unramified place. LocallyAnalyticDistributionsPartII ND.6 explicitly defers completed-cohomology duality to CompletedCohomologyPartII (README.md:24); this package does likewise.

Ownership searches used both `roadmaps grep` and searches of the board, main/Completed and the supplied open checkout files. The object queries included patching functors, support-freeness, capped intervals, projective lattices, adjoint lattices, first-order multiplicity, Gelfand–Kirillov dimension and miracle flatness. Other hits for miracle flatness in SchemeAndStackFoundations and ModularCurves concern commutative local rings/finite modules, not the Iwasawa-algebra criterion here. CompletedCohomologyAndLocalGlobalCompatibility's GK discussion is a different comparison application. The principal local-lattice overlap is explicitly imported from MP.8 after the first repair. With zero Suggested.lean declarations there is no duplicate fully qualified Lean name.

| Declared gap | Declaration and separating test |
|---|---|
| tame-types | Same slug and named supplier in plan and README. It requests the characteristic-zero type correspondence and cosocle lattices; MP supplies mod-p constituents, not these integral lattices. At f=1 the two modular dimensions are 13 and 15; the all-weight type has dimension 28, different from the scalar type of dimension 1. |
| single-type-rings | Same slug and named supplier. The nonsplit extension and the two capped-interval identities are precise. On the node, the empty intersection convention gives A and the full set gives 0; the cyclic module (x) has annihilator (y), hence is A/(y). The common-cap restriction rules out the tested noninterval ideal-sum failure. |
| breuil-mezard-pbt | Same slug and named supplier. Finite K may be ramified, with GK14's chosen lift of each residue embedding retained. In the regular unramified test, predicted μ=1 and unpredicted μ=0, giving global products 1·1=1 and 1·0=0. The dual convention is transported explicitly before comparing with BDJ. |
| power-series-cancellation | Same slug and named supplier. HAM75 Theorem 4 supplies abstract local cancellation and its coefficient-preserving form. Over F₉=F₃[a]/(a²+1), the coefficient Frobenius sends a to −a, so an abstract isomorphism need not preserve labelled coefficients; the contract expressly asks for the coefficient correction. No existing coordinate-change lemma supplies that abstract cancellation. |
| quaternionic-component-realization | Same fifth slug and named supplier. The GL₂ component-selection statement includes absolute irreducibility, p>2 and the p=5 image exception. The node test has e(M)=1 versus e(A)=2 and explains why it is needed. Selecting discrete-series components for quaternionic transfer is the local addition required by S02, not a reason to reject the GL₂ gap. |

The dependency check was run on the unchanged README with the prescribed name, order and movable mode. Its complete output was:

```text
depcheck: 149 roadmaps, 1010 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver reported no unresolved roadmap or Lean names; each mathematical supplier use was then checked rather than treating that report as proof of matching hypotheses. The pull-request diff at the specified head contains only files under packages/HilbertModularVarietiesAndShimuraCurvesPartII/. No git-writing command, Lean build, package repair or external post was performed.

### Source-locator coverage

All 12 manifest works were available in the supplied legal text cache. The explicit source-line anchors were matched to the named statements, their standing hypotheses and the proof steps actually consumed. The following gives the main ranges, not a claim to have reviewed every theorem of every paper.

| Source | Text checked for this package |
|---|---|
| BHHMS23 | Lines 288–308,354–378,1918–1945 and 4312–5477: genericity, local lattices, and the full global §8 argument. The source mistakes below are corrected in the roadmap where indicated by the computed inventory. |
| EGS15 | Lines 385–397,441–540,687–714,767–807,949–983,1580–1840,2197–2235,3212–3338: conventions, weights, lattices, patching, single-type rings and capped intervals. |
| GN22 | Lines 1408–1455 and 1950–2295: R=T implication and Appendix A's grade, CM-transfer and flatness arguments. |
| GK14 | Lines 105–140,244–252,325–375,1220–1690: Breuil–Mézard, labelled Hodge types, component selection, starred rings and quaternionic weights. |
| DL21 | Lines 3111–3235: local/global representation, patching the multiplicity module, and its residual fibre. |
| LE19 | Lines 774–822: Lemma 4.5's generator bound. |
| LMS22 | Lines 625–714: Lemma 4.5 and Proposition 4.6 used for the reverse embedding. |
| BDJ10 | Lines 830–878,1065–1085,1268–1328,1840–1865,1925–1970: boundary weights, extension classes and the localized cohomology comparisons. |
| CEGGPS16 | Lines 1360–1418,2520–2698: Banach duals, nonzero rationalization and locally algebraic support. |
| STACKS | Lines 1540–1559: Tag 05G8, the finite-module Hopfian theorem used twice in §2.2. |
| BRE14 | Lines 2746–2811: Lemma 9.2's representation-theoretic exact sequence. |
| HAM75 | Lines 94–123: Theorem 4's cancellation argument and the preservation of a shared coefficient ring. |

## Not verifiable

- No Lean elaboration or `#check @name` run was made: this review expressly forbids Lean runs, and Suggested.lean has **zero named declarations**. There is no elaborated signature to compare. Imports and the absence of declarations were inspected directly; no build success is claimed.
- The arithmetic modules and their full proofs do not exist at the pins. The table checks statements against the cited mathematics and computes their boundary/interface tests; it does not claim kernel verification of the end theorems or construct a global modular representation for every numerical local test.
- The five named supplier gaps remain conditional contracts. Their current absence from a supplier is not counted as a defect. The report verifies their wording, ownership and declaration, not their future implementation.
- Source certification uses the supplied extracted versions and their printed page labels. No separate inspection of every other published version or independent reconstruction of the OCR was made. All cited works needed for this pass were readable; no additional reference request is pending.
- Ownership was searched across the supplied heads and indexed roadmap texts by object. Unrelated open work was not reviewed line by line, and open work without supplied files was not independently hunted down.

## Source issues

- **Error** in EGS15 at §6.2, printed page 35 (EGS15 lines 1711–1714): the source says the extended adelic centre acts by ψ; it should be ψ⁻¹ with the chosen inertial-type normalization; affects a stated result; corrected in print at BHHMS23 Remark 8.1.3(i), printed page 89.
- **Error** in EGS15 at §6.2, printed page 35 (EGS15 lines 1717–1720): the source says to use the original curve with the extended central action; it should be its quotient by the finite free central action; affects a stated result; corrected in print at BHHMS23 Remark 8.1.3(iii), printed page 89.
- **Misprint** in EGS15 at §6.2, printed page 35 (EGS15 lines 1758–1761): the source says to twist a Galois lifting by θ⁻¹ composed with determinant; it should be θ⁻¹ itself, since θ is already a Galois character; affects the proof.
- **Misprint** in EGS15 at Proposition 10.1.11 proof, printed page 62 (EGS15 line 3334): the source says the chosen lattice has socle σ in its cosocle-filtration argument; it should be cosocle σ; affects the proof.
- **Misprint** in BHHMS23 at Proposition 8.2.3 proof, printed page 92 (BHHMS23 line 4655): the source says both factors of the fibre product use J₁; it should be J₁ in the first factor and J₂ in the second; affects the proof.
- **Misprint** in BHHMS23 at Proposition 8.3.7 proof, printed page 100 (BHHMS23 line 5037): the source says the modular-weight Hom dimension equals the residue degree f; it should be the common patched multiplicity r; affects the proof.
- **Error** in BHHMS23 at Theorem 8.3.9, printed page 101 (BHHMS23 lines 5070–5073): the source says all independently raised Hodge profiles occur in the support of L_j; it should be the baseline profile and profiles raised at just one embedding i≤j; affects a stated result.
- **Error** in BHHMS23 at Corollary 8.3.10, printed page 103 (BHHMS23 lines 5145–5148): the source says the endpoint lattice has all independently raised profiles in its support; it should be the baseline and single-raised profiles, f+1 profiles rather than 2^f; affects a stated result.
- **Misprint** in BHHMS23 at Theorem 8.3.9 proof, printed page 102 (BHHMS23 line 5107): the source says the type-indexing weight uses the positive norm-determinant twist; it should be the inverse norm-determinant twist, as in lines 5075 and 5097; affects the proof.
- **Error** in BHHMS23 at §8.5 after (84), printed page 108 (BHHMS23 line 5441): the source says the patched multiplicity module specializes to the full cohomology dual; it should be the multiplicity-space dual, with the full dual containing two copies; affects a stated result.
- **Misprint** in GN22 at Lemma A.11 proof, printed page 45 (GN22 line 2073): the source says the totalized tensor double complex has terms P_i tensor P_j; it should be P_i tensor Q_j; affects the proof.
- **Misprint** in GN22 at §A.20 after Lemma A.21, printed page 48 (GN22 line 2192): the source says to take an injective A-module resolution to construct the S-valued derived Hom; it should be an injective B-module resolution; affects the proof.
- **Error** in GK14 at Corollary 5.5.7 proof, printed page 35 (GK14 lines 1678–1679): the source says to ramify D at one infinite and one finite place for every F; it should be all but one infinite place, with finite ramification parity [F:ℚ]−1; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3cacbeab75e1b15fb260c19251786a6f6897e66f", "job": "RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
