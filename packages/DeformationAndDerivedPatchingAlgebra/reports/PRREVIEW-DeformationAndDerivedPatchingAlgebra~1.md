# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at 7b0ba72)

**Verdict:** needs changes

## R01 (P1) — The fraction-quotient dual returns a completion

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1463`, also line 1472. Claim: for a DVR and finite free L, `D_O(L⊗E/O)≃L*`; the subsequent adjoint-cokernel comparison at an O-point uses this identification.

**Witness:** Take O = ℤ localized at (2), E = ℚ and L = O. The left side is End_O(E/O) = ℤ₂; the right side is O. They are not even equipotent. Line 1469 confirms the completion.

**Repair:** Retain the general DVR scope, but state `D_O(L⊗E/O)≃completion(L*)`, specializing to L* under an explicit completeness hypothesis. Likewise the last O-point comparison must use the completed adjoint cokernel in general, or explicitly assume O complete there. Import the underlying Matlis statements from `DerivedModuleAlgebra` §§1.M.1–1.M.2. Test the corrected formula on the degree-zero O-stalk: both completed sides are ℤ₂; over O = ℤ₂ both uncompleted sides are ℤ₂. Add this stalk as a negative control to the adjoint-cokernel paragraph. The general-DVR paragraph explicitly discusses incomplete rings, so the earlier complete-coefficient convention does not repair its unqualified API.

## R02 (P2) — Import the existing depth comparison instead of rebuilding it

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:529` and supplier contract line 78. Claim: the short-exact depth inequalities are prerequisite targets to construct here from Ext.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1200` on main already states all three inequalities under the nonzero finite Noetherian-local hypotheses, as `depth_shortExact`. It gives the same Stacks locator. On O →π O → k, both specifications give depths (1,1,0).

**Repair:** Add that exact supplier target to the contract, consume it in the nonzero case, and retain only the extension to zero endpoints, explicitly described as that extension. For 0 → 0 → M → M → 0 the extra depths are (∞,d,d), giving d≥d, d≥d and ∞≥d; the other endpoint is analogous. This preserves the required general statement without assigning its substantive nonzero case a second owner. Update the Auslander–Buchsbaum proof route to consume the imported comparison plus this extension.

## R03 (P3) — Delete the supplier-theorem check from Suggested.lean

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/Suggested.lean:315` (`moduleCycle_specialization_coeff`); `README.md:1309` explicitly calls it a check of the supplier's theorem.

**Claim:** A coefficientwise restatement of uniformizer specialization is included as this roadmap's acceptance theorem.

**Witness:** `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:334` (§0.5) supplies specialization and agreement with the cycle of M/πM, under these same complete, equidimensional and flat hypotheses. Taking coefficients is exactly the displayed formula. For A=O[ε]/ε² and M=A, it reads 2=2·1.

**Repair:** Delete it from `Suggested.lean`, as required for a supplier check; retain the mathematical application and computed Check in the README with the supplier citation. Delete `localizedLength` too if nothing else in the acceptance file needs it. This is a duplication/padding finding, not a claim that the current pinned libraries prove the cycle theorem in one tactic.

## R04 (P3) — Remove the residue that fails the push gate

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1135`: `<a id="patching-surjection-iso"></a>`.

**Claim and witness:** The worker's gate at this head reports `residue=1` on this exact line and `FAIL`; all other recorded gate counts, including build and dependency checks, are zero.

**Repair:** Delete the standalone anchor and use the heading's normal Markdown fragment for any link that needs it. The failure is a textual residue, so removing this line removes the reported match. No source file or roadmap content needs replacing. Rerun the gate after repair; this review does not claim a passing gate for the unchanged head.

## R05 (P3) — Cite the supplier section instead of a pull-request URL

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:77`, the GroebnerGeometry G4 link.

**Claim and witness:** The visible section citation links to a numbered pull request. The standing citation rule requires a roadmap name and section, including for open work. G4 is present on main at `TauCetiRoadmap/GroebnerGeometry/README.md:252`.

**Repair:** Link to that roadmap file and its G4 heading, or use the unlinked name and section. Resolving G4 on main reaches the same ordinary associated-graded contract; no mathematics or dependency changes.

## R06 (P3) — Keep undeclared local API names out of code spans

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:105`, `:107` and `:653`.

**Claim and witness:** The prose advertises local names `adicGradedRing`, `adicExpansion` and `symbolicSquare`, but none occurs among the 35 declarations of `Suggested.lean`. These are examples of the same issue across the API paragraphs; the worker's name scanner did not report it.

**Repair:** Express these README-only API targets in mathematical prose without backticked local declaration names. Keep backticks for genuine pinned/supplier identifiers and the acceptance file's actual declarations. Do not add API stubs or padding to Lean. The computed Rees and symbolic-square examples below remain unchanged; this repair changes the declaration claim, not their objects.

## Verified sound

The review read all nine layers and the 471-line Lean file, the repository's normative writing rules and contribution rules, and main-branch roadmap examples (`Completed/EffectiveBounds` and `GrothendieckEulerForms`). The target folder is new relative to main; no outside-folder changes were found. No route-specific computational shortcut, admitted data, option override, extra source file, or duplicate fully qualified Lean declaration was found. The source-access limitations below are separate from mathematical counterexamples.

The worker's gate is **failing only the residue check** recorded in R04. The independent dependency command returned:

```text
depcheck: 208 roadmaps, 1473 edges, 0 problem(s)
```

The two imported Tau Ceti modules were built first. Direct elaboration of `Suggested.lean` then succeeded with only the 20 expected `sorry` warnings. A scratch copy with `#check @name` for all **35 declarations (15 definitions/abbreviations and 20 theorems)** elaborated successfully. Comparison with the README found no silently lost binder: in particular completeness, finite residue, flatness, scalar towers, nonzeroness, the genuine derived-action map, and its cohomology compatibility remain present where stated. No target file was changed.

A second scratch copy tried `rfl`, `simp` and `infer_instance` on each of the **20** admitted theorems. All 20 remained unproved; none was classified as padding merely because a special instance is easy. Object searches at the pins and reading the relevant declarations also found no single pinned theorem supplying one of those complete signatures. R03 is the separate supplier/Check padding case.

**Headline coverage.** The main end results are balanced module patching (§5.5), faithful ring/free-module patching (§5.6), codimension and CM concentration (§9.2), the patched CM functor and canonical duality (§9.3), and paired support transport/survival (§§9.4–9.7). The statable native components include the two patching theorems, both regular-base concentration statements, the CM-base action statement, and the two Ext/dual comparisons. The other deep native signatures are formal presentation, flat completion, Auslander–Buchsbaum, Lescot, finite-action faithfulness, top local cohomology, the Hilbert–Samuel polynomial, multiplicity-one regularity, integral points, parafactoriality and the two minimal-model theorems. These are all in the file. Its module docstring names the absent hull/obstruction, decorated perfect-system, action-block and normalized-dualizing interfaces needed for the full functor and paired-support statements. R03 is an extra imported headline rather than a missing one. Numerical and sign tests of all 20 signatures appear below.

### Seeded source verification

No locator in the README is explicitly marked unverified. All **15 seeded sections** were checked against legally fetched text. Source IDs below identify the fetched works, not an edited manifest: s03 = Stacks (chapter indicated); s04 = Schlessinger, *Functors of Artin rings*; s05 = Gee, *Modularity lifting theorems*, arXiv 2202.05818v2; s06 = Khare–Wintenberger II; s08 = Calegari–Geraghty 2018; s09 = Taylor, *Automorphy for some l-adic lifts II*; s12 = BCGP 2021, author arXiv version; s14 = Boxer–Pilloni 2025; s16 = Iyengar–Khare–Manning, arXiv version 3; s19 = Allen et al., journal-layout author copy; s23 = Emerton–Gee; s27 = Stone's *Hilbert Functions and Multiplicities* notes; s33 = Bhatt's direct-summand paper; s37 = Christensen–Iyengar, *Dimension of finite free complexes over commutative Noetherian rings*.

| Seeded target | Locator actually read | Hypotheses and conclusion comparison |
|---|---|---|
| 1.8 | s03 formal-defos lines 404–439, 505–532; §§4.2–4.8, pp.9–12 | Artinian truncations, continuity/surjectivity and bounded-cotangent Noetherian limits agree. The relative bound uses the finite embedding dimension of the fixed Noetherian base. |
| 1.15 | s33 lines 547–561, Lemma 5.3, pp.9–10; s03 formal-defos lines 505–516, Lemma 4.7, p.11 | Bhatt's pro-Hom/lim¹ statement has the stated fixed annihilated target; it is not arbitrary inverse-limit exactness. Chevalley is used with finite complete modules; the stated parameter-power containment is a direct monomial count. |
| 2.1 | s04 lines 170–175 and 250–269, Notation 2.6, proof of Theorem 2.11, pp.211,213–214; s06 lines 1972–1999, Lemma 4.4, pp.41–42 | Same labelled residue and relative tangent quotient; variable count is intrinsic, chosen presentation is not. KW's Galois setting is an application; general evaluation comes from §1.9, not an unwarranted Galois generalization. |
| 2.2 | s06 lines 2032–2051, §4, pp.43–44; s05 lines 614–617, Lemma 3.13, p.13 | Both use J/mJ. Gee's obstruction injection needs the representation/hull context; the bare relation-space and Nakayama statements here do not claim that injection without it. |
| 3.6 | s16 line 823, before Lemma 3.4, p.18, and lines 1456–1475, Lemma 7.5, p.33 | Symbolic square is contraction after prime localization. Lemma 7.5's action image uses a finite module; the README keeps finiteness on Hom/associated-prime comparison. |
| 3.12 | s27 lines 493–497, Lemma 8, pp.9–10; 850–874, Theorem 10, pp.13–14; 1213–1245, Proposition 14/Lemma 15, pp.19–20; s23 lines 345–352, Lemma 2.2.8, p.7 | Source multiplicity at ambient ring dimension must be distinguished from intrinsic module multiplicity. README does so. The residue-degree factor is required, and the extended ideal is retained. |
| 5.1 | s08 lines 427–467, Definition 2.1 and Proposition 2.3, PDF pp.11–12 | Defect β₀−β₁ and balance are presentation conditions; square presentations do not assert injectivity or projectivity. |
| 6.1 | s09 lines 187–193, Definition 2.1, printed p.187 | Source assumes Noetherianity and a finite module for equivalence with full support. README separates the raw annihilator definition from that finite-module equivalence. |
| 6.2 | s09 lines 194–207, Lemma 2.2, printed pp.187–188 | Quotient and coefficient-change statements retain finite-module/Noetherian hypotheses. No equality of annihilator ideals after quotient is asserted. |
| 7.3 | s14 lines 1076–1101, Lemmas 2.6.6–2.6.7, pp.21–22 | Residual exactness is at the middle term of an actual three-term complex over a local ring. It does not assert both endpoint conditions. Finite free terms are essential. |
| 7.6 | s12 lines 10252–10280, Lemmas 7.8.5–7.8.6 and Remark 7.8.7, pp.213–214 | Source coefficient DVR is complete. Signs of native perfect duality check out; extending the fraction-quotient comparison to incomplete DVRs causes R01. |
| 7.9 | s16 lines 2145–2180, Lemma 10.8, pp.48–49; s19 lines 6160–6183, Lemma 6.3.3, p.1049 | Homological [0,1] becomes cochain [−1,0]. Isolated finite-algebra blocks and cohomologically trivial maps are not identified with arbitrary zero chain maps. |
| 9.1 | s37 lines 60–82 and Theorem 1 immediately following, pp.2–3 | Source lower grading uses dimension minus homological degree; cochain translation is dimension plus degree. Native differential Fitting ideals, not arbitrary rank data, enter the formula. |
| 9.3 | s16 lines 2116–2143, Lemma 10.7, p.48, and 2226–2273, Theorem 11.3, pp.50–51 | Genuine derived action and CM-base dimension bound retained. Dual systems require perfect/Gorenstein coefficient duality and compatible maps; arbitrary cohomology actions alone are not promoted to genuine actions. |
| 9.5 | s19 lines 6098–6137, Lemma 6.3.2, pp.1047–1048, and 6184–6206, Lemma 6.3.4, pp.1049–1050 | Excellence, finite algebra, local irreducibility, zero-dimensional divisor quotient and regularity on the scalar ring are retained. Generic coefficient is length over the generic local ring, including its nilpotents. |

The Stacks PDFs are moving compilations: tag/theorem numbers identify the claims, while the page and line locators here describe the retrieved edition. The BCGP author version has the cited 7.8.5–7.8.7 numbering and pp.213–214. No unseen published correction was used as mathematical evidence. As an additional headline-source check, the legal OCR scan of Nagata, *The theory of multiplicity in general local rings* (s31), gives Theorem 6 at lines 9140–9146, printed p.215: multiplicity one plus formal unmixedness characterizes regularity, with passage to completion explicit. Theorem 9 at lines 9315–9322, printed p.219, gives the generic-length reduction formula and explicitly handles finite residue fields. These agree with §3.13; the OCR of later proof equations is noisy and was not used to certify those equations.

### Computed adversarial pass

Notation: k is a field (take 𝔽₂ where specified), O a DVR, π a uniformizer, E its fraction field; rings with double brackets are complete. A displayed pair records actual values on the two sides, not a proof of the universal theorem. “Retain” means this test found no defect. The table has **145 rows**. Each row is a statement or a tightly related API identity; separate rows distinguish hypotheses, conventions and headline signatures. Zero rings are excluded where local rings are required; empty ranks, intervals and variable lists are tested where admitted.

| Statement | Instance | Computed values / negative control | Result; change |
|---|---|---|---|
| Cochain shift and Tor convention | k[1]; k⊗ᴸ_O k | k[1] is in degree −1; Tor₁=k=H⁻¹, Tor₀=k=H⁰ | Retain |
| Tensor symmetry | two Q-stalks in degree 1 | braid is −1; double braid is (−1)²=1 | Retain |
| Cone and tensor-cone sign | E=Q in degree 1, f=id | cross differential −1 on tensor-cone, +1 on cone; comparison −1 makes them equal | Retain |
| Zero numerical conventions | M=0 | depth=∞, support dimension=−∞, pd=bottom; support=∅ | Retain; numerical headlines exclude it |
| Full support versus MCM | A=k[[x,y]]/(xy), M=A/(x) | depth M=dim A=1; support=V(x)≠Spec A | Retain distinction |
| 1.1 graded ring / Rees comparison | I=0 and I=A | components (A,0,0,…) and (0,0,…); both descriptions agree | Retain |
| 1.1 multiplication and class maps | I=(π) in O | [π²][π³]=[π⁵] in degree 5; degree-zero unit=1 | Retain |
| 1.2 degree-one generation | I=(x,y) | degree 2 generated by x²,xy,y²; 3 classes over k | Retain |
| 1.2 nonflat coefficient change | A=k[[t²,t³]]⊂B=k[[t]], I=t²A, J=t²B | t⁵∈I, t⁵∉t⁴A since t∉A; t⁵∈t⁴B=J². Source class nonzero, target class0 | Retain contraction criterion |
| 1.3 graded module | k[[x]], M=A/(x²) | graded ranks 1,1,0,…; multiplication sends 1→x→0 | Retain |
| 1.4 length recurrence | k[X]/(X²), multiplication X | degree dimensions 1,1,0; in degree 2 kernel=1, cokernel=0, difference 0−1=−1 | Retain |
| 1.5 initial generators | f=x²+x³ in k[[x]] | initial term x²; (f)=(x²) since 1+x is a unit | Retain; initial x³ would give wrong colength 3 rather than 2 |
| 1.6 labelled residue maps | k=𝔽₄, α²=α+1 | Frobenius sends α to α+1≠α; identity sends α to α | Retain residue label |
| 1.7 elementary versus small extension | k[x,y]/(x,y)²→k | kernel dimension 2, square zero; not principal, hence not small | Retain |
| 1.7 kernel killed by maximal ideal | ℤ/8→ℤ/2 | 2·2=4≠0; kernel is not killed by m | Retain exclusion |
| 1.8 truncation index | O=ℤ₂ | n=0 gives 𝔽₂; n=2 gives ℤ/8; limit=ℤ₂ | Retain |
| 1.8 bounded tangent tower | k[[x]]/(xⁿ⁺¹) | tangent dimensions 0 at n=0, then 1; limit cotangent dimension 1 | Retain |
| 1.9 series presentation headline | O→O; O[[x,y]]→O[[x]] killing y | r=0 identity is onto; with r=1 basis x, cotangent dimension 1 and map onto | Retain |
| 1.9 missing generator control | O→O[[x]], r=0 | relative cotangent dimension 1, image misses x; hcotangent fails | Retain |
| 1.10 residue/coefficient extension | ramified O→O′, π=uπ′ᵉ | m_O O′=(π′ᵉ), distinct from (π′) for e>1 | Retain distinct topologies/ideals |
| 1.11 smooth lifting | k[t]/t² against k[t]/t³→k[t]/t² | a lift of t has square t²≠0, including characteristic 2 | Retain obstruction |
| 1.12 complete tensor coproduct | O[[x]] and O[[y]] | result O[[x,y]], relative cotangent dimension 2=1+1 | Retain |
| 1.13 flat completion headline | M=O/πˢ, S=O, I=(π) | both completed tensor sides=O/πˢ; pure tensors agree | Retain |
| 1.13 boundary ideals | I=0; I=A | completion M; completion 0, respectively; unit-ideal completion is not faithful | Retain |
| 1.14 semilocal completion | ℤ localized at 5 adjoin i | residue factors (X−2)(X+2); completion ℤ₅×ℤ₅, two maximal factors | Retain |
| 1.15 pro-comparison | X=O/π, target O/π | Hom=k at every sufficiently deep quotient; transitions identity, lim¹=0 | Retain |
| 1.15 parameter cofinality | (x,y), exponent n | m^(2n−1)⊆(xⁿ,yⁿ); xⁿ⁻¹yⁿ⁻¹ in degree 2n−2 is outside | Retain sharp bound |
| 1.15 empty parameters | zero variables | parameter ideal=0; quotient is the original module | Retain empty case separately |
| 1.16 completed flat fibre | k[x]_(x)→k[x,y]_(x,y) | completed map k[[x]]→k[[x,y]]; closed fibre k[[y]] | Retain |
| 2.1 minimal relative presentation | R=Λ and R=k over a complete DVR Λ | both have d=0; kernels 0 and (π), respectively | Retain relative, not absolute, cotangent condition |
| 2.1 nonminimal presentation | k[[X,Y]]→k[[X]], Y↦0 | source tangent dimension 2, target 1; linear kernel dimension 1 | Retain |
| 2.2 relation space | J=0,(X²),(X,Y)² | dimensions 0,1,3, also in characteristic 2 | Retain |
| 2.2 presentation dependence | k=k[[Y]]/(Y)=k/0 | relation dimensions 1 and 0; no unconditional invariance | Retain |
| 2.3 socle obstruction additivity | kernel k² and a nonzero functional k²→k | two coordinate obstruction components; a nonzero vector is detected by a functional | Retain all finite socles |
| 2.4 relation extension | S=k[[X]], J=(X²) | J/mJ=k·X²; S/mJ=k[X]/X³ and kernel k·X² killed by m | Retain |
| 2.5 equation bound | k[[X]]/(X²) | tangent dimension 1; relations 1; obstruction dimension at least 1, hence 1≤1 in its standard obstruction theory | Retain; zero obstruction cannot fit |
| 2.6 fixed-basis matrix equations | one scalar g=1+X, relation g²=1 | char.2: relation X², quotient k[[X]]/X²; char.3: X(2+X), quotient k; no variables gives Λ | Retain p=2 and rank0 |
| 2.7 continuous frames | trivial group, n=1; trivial residual rank 2 | unique trivial representation; conjugation has no effect on trivial lift | Retain fixed basis and continuity inputs |
| 2.8 nonunique hull automorphisms | hull parameter t with first-order identity t↦t+t² | tangent map=1 but automorphism differs in degree 2 | Retain noncanonical comparison |
| 3.1 depth comparison | 0→O→π O→k→0 | depths (1,1,0); bounds 1≥0, 0≥0, 1≥1 | R02: import nonzero case |
| 3.1 zero endpoint extension | 0→0→M→M→0, depth M=d | (∞,d,d): bounds d≥d, d≥d, ∞≥d | Retain as extension only |
| 3.1 finite minimal resolutions | free module; k over O; k over k[ε]/ε² | lengths 0,1,∞; residue Tor ranks respectively (r,0,…),(1,1,0,…),(1,1,…) | Retain |
| 3.1 Auslander–Buchsbaum headline | M=O and M=k | pd+depth=0+1=1 and 1+0=1 | Retain |
| 3.2 Lescot headline | O and k[ε]/ε² | Ext¹_O(k,O)→Ext¹_O(k,k) is k→k identity; singular socle ε maps to 0 in k | Retain direction |
| 3.2 Koszul regularity | empty list, [π] over O, [0] over k | H₁=0,0,k; quotient condition excludes a unit | Retain |
| 3.2 stable Hom / periodic operator | k[ε]/ε² | ordinary Ext=k in degrees ≥0, stable Ext=k in all integers; degree-two shift k→k is bijective | Retain; char.2 odd square is not forced zero |
| 3.2 signed dual of resolution | O→π O in cochain −1,0 | dual differential −π in degrees 0,1; cokernel k and quotient-induced map 1 | Retain |
| 3.3 finite-action headline | A=D=O, M=Oʳ, r>0 | D finite rank1; annihilator0; M projective over D | Retain |
| 3.3 dimension hypothesis control | A=O, D=O[[t]], M=O, t acts0 | dimensions 1 and2; D-action kernel(t)≠0 | Retain equality hypothesis |
| 3.4 CI regular sequences | empty list; (x²,xy) in k[[x,y]] | empty quotient=A; latter ideal has 2 generators but height1, so not regular | Retain |
| 3.5 relative equation dimension | O/(π) | dim0=dim O−1, but special fibre dim0, not −1; coefficient flatness fails | Retain |
| 3.6 symbolic square | A=k[x,y,z]/(xz−y²), p=(x,y) | zx=y²∈p², z∉p, x∉p²; x∈p^(2) in char.2 too | Retain |
| 3.6 associated-prime detection | O-module k⊕E | Ass={(π),(0)}; (1,0) detected at (π), (0,1) at (0) | Retain |
| 3.7 top local cohomology headline | k and O | top degrees0 and1; H⁰(k)=k, H¹(O)=E/O, higher groups0 | Retain |
| 3.8 normalized noncomplete duality | incomplete DVR O, M=O | dual of H¹_m(O)=End(E/O)=Ô, not O | Retain completion in §3.8; contrasts R01 |
| 3.8 dualizing normalization | regular O of dim1 | normalized dualizing complex O[1]; RHom(k,O[1]) has k in degree0 | Retain shift |
| 3.9 type and trace | k[ε]/ε²; k[x,y]/(x,y)² | socle dimensions1 and2; types1 and2; trace of zero=0, of A=A | Retain |
| 3.10 group-ring CI | O[C₂], T=g−1 | relation T²+2T; mod2 it is T², a length2 Gorenstein ring | Retain p=2 |
| 3.11 Hilbert polynomial headline | kʳ; O; k[[x,y]] | H(n)=r,n+1,(n+1)(n+2)/2; degrees0,1,2, normalized leading values r,1,1 | Retain |
| 3.12 raw coefficient | P=0,d=0 or2 | d!·coeff_d(P)=0 in both cases | Retain; zero natDegree not used as dimension |
| 3.12 intrinsic/ambient distinction | O/πˢ; O⊕k | intrinsic s vs dimension-one0; e₁(O⊕k)=1 while 1+e₀(k)=2 | Retain |
| 3.12 ideal powers | O, I=(πʳ), r≥1 | H(n)=r(n+1); e=r=r¹·1; at r=0 H=0, unit ideal excluded | Retain |
| 3.12 residue degree | k→L finite of degree f | length_k L=f; length_L L=1; f=f·1 | Retain factor |
| 3.13 multiplicity-one headline | regular DVR; k[[x,y]]/(x²,xy) | regular e=1 and unmixed; second ring H(n)=n+2,e=1 but embedded (x,y), embedding dimension2>dim1 | Retain unmixedness |
| 3.13 initial-form equality | cusp k[[t²,t³]], parameter t³ | regular element, colength3; initial form degree1 is zero divisor, while e=2; 3>2 | Retain corrected equality criterion |
| 3.14 Frobenius | 𝔽₂, 𝔽_p[[x,y]], 𝔽₂[ε]/ε² | ranks1,p²; last sends ε→0 and is not flat | Retain |
| 3.15 jet/Hilbert calibration | plane curve x⁴=0 | early cumulative values1,3,6; eventual polynomial4n−2 gives −2,2,6; defects3,1,0 | Retain |
| 4.1 residual finiteness | O[ε]/ε² versus O[[x]] | residual k-dim2 versus ∞; first finite over O, second not | Retain |
| 4.2 integral-point headline | B=O[ε]/ε² and B=O/π² | first maps ε→0 into O; second has π nilpotent and no map into an O-integer domain | Retain nonnilpotence |
| 4.3 local smooth points | O[[x]] with x↦0,π,1 | first two are local points; x↦1 would send the unit 1−x to0 | Retain locality |
| 4.4 generic regularity | O and O[ε]/ε² | generic fibres E and E[ε]/ε²; latter has nonzero nilpotent | Retain regularity condition |
| 4.5 coefficient diagonal | inseparable L/k of degree p | L⊗_kL=L[ε]/εᵖ, diagonal kernel(ε), not an idempotent component | Retain separability |
| 4.6 tensor domains | ramified quadratic O′/O | (α⊗1−1⊗α)(α⊗1+1⊗α)=0; unqualified tensor-domain claim fails | Retain pointed/geometric hypotheses |
| 4.7 points and torsion-free quotient | O/π² and O² | maximal O-flat quotients0 and O²; all valued maps kill π-torsion | Retain |
| 5.1 square presentation | k over k[ε]/ε² | β₀=β₁=1, defect0; ε square presentation noninjective, module nonprojective | Retain |
| 5.1 imbalance control | k over k[[x,y]] | β₀=1,β₁=2, defect−1; no square presentation | Retain |
| 5.2 decorated finite types | a rank1 𝔽₃-module with augmentation1 or2 | two distinct based maps; forgetting decoration identifies different diagrams | Retain |
| 5.3 cofinal extraction | O/πⁿ with natural transitions | limit O; fixed quotient O/π at all levels gives k, not O | Retain cofinality |
| 5.4 limit presentation | constant matrix(π) over O | limiting cokernel k, not a free O-module | Retain numerical input requirement |
| 5.5 balanced patching headline | q=1,R=O,X_n=O with trivial group action,H=O | one relation per finite cyclic group quotient, defect0; output free rank1 | Retain p=3 example |
| 5.6 ring/free patching headline | r=0,R=T=O,N=Oˢ, s>0 | bijection id; free ranks s, coefficient-ring rank1; regular list empty | Retain |
| 5.6 characteristic2 scalar ideals | O=𝔽₂[[π]],r=1 | (1+x)^(2^(n+1))−1=x^(2^(n+1)); augmentation quotient O | Retain equal characteristic |
| 5.7 generic faithfulness | O[ε]/(ε²,πε)→O | generic map E→E is iso; integral kernel(ε)≠0 | Retain generic/integral distinction |
| 5.8 uniform cotangent cutoff | relations πᴺx | any fixed cutoff hides them for N large; no bound uniform in N follows | Retain explicit uniform bound |
| 5.9 norm/projectivity | k[C_p],char k=p, and trivial k | regular norm sends basis1 to Σg≠0 and identifies coinvariants with invariants; trivial norm=0 on k | Retain |
| 5.9 nonabelian norm | k[Q₈],char k=2 | Σg has 8 separate coefficients1, is nonzero; augmentation is8=0 | Retain coefficient, not scalar, norm |
| 6.1 near faithfulness | O-module E/O | annihilator0 but support={(π)}≠Spec O; module is not finite | Retain finite hypothesis |
| 6.1 nilpotent annihilator | A=k[ε]/ε²,M=k | ann=(ε), square0; support=Spec A, not faithful | Retain |
| 6.2 quotient/change of coefficients | A=k[ε]/ε²,M=A,I=(ε) | quotient k over k has ann0; as A-module ann(ε); radicals transport, ideals need not stay equal | Retain |
| 6.3 flat quotient | A=O[ε]/(πε,ε²) | torsion ideal(ε), quotient O; generic fibres both E | Retain |
| 6.4 annihilator after quotient | A=k[[t²,t³]],M=(t²,t³),I=(t²) | t³ annihilates M/IM since t³t²,t³t³∈IM; t³∉I | Retain no equality ann(M/IM)=I |
| 6.5 reduced quotient identification | k[ε]/ε²→k | spectra bijective, ring map kernel(ε)≠0; reduced quotients both k | Retain |
| 6.6 connectedness bound | k[[x,y]], I=(xy) | dim2, arithmetic rank1: lower bound0; node components meet in dimension0 | Retain |
| 6.7 cycle headline | A=O[ε]/ε²,M=A | generic coefficient2, special length2; formula2=2·1 | Sound formula; R03 delete acceptance duplicate |
| 6.7 ramified cycle | A=O[x]/(x²−π) | generic coefficient1, special length2; specialization contributes2 | Retain generic length versus ramification |
| 6.8 monomial cycles | k[[x,y,z,w]]/(xy,zw) | minimal primes (x,z),(x,w),(y,z),(y,w), each coefficient1; total multiplicity4 | Retain |
| 6.9 parafactorial headline | k[[x₁,x₂,x₃,x₄]] | punctured Picard group0; trivial line restricts to trivial line | Retain dimension≥4 |
| 6.9 multiplicity fails to detect lower-dimensional kernel | O⊕k→O | both dimension-one multiplicities1; kernel=k≠0, source not CM | Retain CM requirement |
| 7.1 Tor/Ext adapter | ℤ/2 over ℤ | Tor₀=Tor₁=𝔽₂; Ext¹(ℤ/2,ℤ)=𝔽₂, Hom=0 | Retain |
| 7.2 finite approximation orders | A/I with I not finitely generated | cyclic: order0; not finitely presented: fails order−1 | Retain |
| 7.2 shift of order | preceding module shifted[1] | order becomes−1; fails−2 | Retain sign |
| 7.3 minimal predicate / headline | identity disk; π-disk in −1,0 | residue differentials1 and0; minimal models0 and the original π-disk, ranks(0,0),(1,1) | Retain |
| 7.3 residual detection outside hypotheses | fraction field E over O | E⊗ᴸk=0 but E≠0; E not pseudo-coherent | Retain |
| 7.3 middle exactness | O→π O→0 O | residue middle homology=k≠0; hypothesis fails | Retain endpoints not inferred |
| 7.4 compact Hom | k and ⊕ℕ k | identity of infinite sum does not factor through a finite-dimensional subspace; k-maps do | Retain finite-source restriction |
| 7.5 restricted coefficients | completion of ⊕ O | (πʲ) belongs, (1,1,…) does not; over field m=0 it equals direct sum | Retain |
| 7.5 continuous matrices | every column=e₀ | (a_j)↦Σa_j at coordinate0; infinitely supported first row allowed | Retain column condition |
| 7.5 complete-flat headline | identity disk; π-disk; E-stalk | retracts0 and π-disk; E is excluded since ∩πⁿE=E≠0 | Retain separatedness |
| 7.6 signed bidual | Q→2 Q in degrees0,1 | dual differential+2, double dual−2; signed evaluation(1,−1) gives −2=−2 | Retain |
| 7.6 fraction-quotient API | O=ℤ_(2),L=O | D(L⊗E/O)=ℤ₂; L*=ℤ_(2) | FAIL; R01 completed dual |
| 7.6 adjoint cokernel API | degree-zero ℤ_(2)-stalk | left H⁰(P*)=ℤ_(2); asserted right D(E/O)=ℤ₂ | FAIL; R01 completion or explicit completeness |
| 7.7 strict tower action | identity tower, x alternates0,1 | transition equation on1 is0=1, false | Retain compatible chain maps |
| 7.8 finite derived Hom completion | P=[O→π O] in −1,0,Q=O | Hom_D(P,Q)=0; finite-level kernels πⁿO/πⁿ⁺¹ have transition0, so limit0 | Retain |
| 7.8 inverse-limit exactness | constant 0→O→π O→k→0 | limits O,O,k with kernelπO and cokernel0 | Retain finite/complete hypothesis |
| 7.9 ghosts | C=k[0]⊕k[−1] over a DVR | off-diagonal Ext¹ class δ≠0; cohomology action0; δ²=0 | Retain exponent2, not1 |
| 7.9 isolated blocks | finite algebra k×k acting diagonally | e=(1,0) gives rank1, 1−e rank1; sum rank2 | Retain specified idempotent |
| 7.10 coefficient spectral sequence | C=k[0] over O, B=k | E₂ at Tor indices0,1 both k; abutment H⁰=k,H⁻¹=k | Retain actual abutment |
| 8.1 finite-model selection | alternating two-term 𝔽₂ differential0 or1 | selected0 has H⁰=H¹=k; selected1 has H*=0 | Retain common filter |
| 8.2 augmentation decorations | frame variable z survives group augmentation | group-only result O[[z]], full augmentation O | Retain both variable sets |
| 8.2 error exponent | δ=1 | I¹=0 means I=0; δ=2 allows ε≠0 with ε²=0 | Retain |
| 8.3 finite-code bound | B=𝔽₂, ranks(1,1), zero differential | 4 chain endomorphisms=2^(1²+1²); identity disk has only zero derived endomorphism | Retain quotient, not injection |
| 8.3 uniform nilpotence | ideals (t) in k[t]/tᴺ | exponents N increase; inverse-limit (t) in k[[t]] is not nilpotent | Retain fixed δ |
| 8.4 scalar compatibility | l(y)=x+ε on O[[x]][ε]/ε² | matrix [[x,0],[1,x]] differs from x·Id by nonzero lower entry1 | Retain genuine-action equation |
| 8.4 constant patch | free rank r system | limit terms S∞ʳ, finite reductions Bʳ; ranks r on both sides | Retain |
| 8.5 derived augmentation | [O[[x]]→x O[[x]]] | reduced differential0; cohomology O in each of two degrees, not just top O | Retain |
| 8.5 paired error ideals | k[ε,η]/(ε²,η²), I=(ε),I′=(η) | each nonzero and unequal; quotient by I+I′=k | Retain sum of errors |
| 8.6 cutoff indices | M=2,L=1,N=0,n=1 | selected map φ₂ exists; φ₀ is not supplied | Retain original-level kernel |
| 8.6 nonflat quotient | [O→π O], reduce to k | before H⁰=0,H¹=k; after H⁰=H¹=k | Retain supplied quotient actions |
| 9.1 derived support / annihilator | (A/I)[0]⊕(A/J)[−1] | support V(I)∪V(J)=V(I∩J); annihilator I∩J | Retain |
| 9.1 dimension and shifts | dim A=1, C=A[0]⊕k[−2] | dimension=max(1,2)=2; C[1] has dimension1=2−1 | Retain |
| 9.1 support versus Euler | k[0]⊕k[−1] | support={closed point}, annihilator0 over k; Euler1−1=0 | Retain |
| 9.2 codimension headline | [O→π O] in0,1 | width1, base dim1, support dim0; 0≥1−1=0 | Retain |
| 9.2 balanced concentration headline | [O[[x]]→x O[[x]]] | top O, pd1, depth1, support dim1=2−1; other cohomology0 | Retain |
| 9.2 CM-base action headline | S=k[[t]][ε]/ε², R=S/(t), C=[S→t S] | dimS=depthS=1, width1; top R has depth_R0=dimR and pd_S1 | Retain genuine R-action in D(S) |
| 9.2 strict inequality control | S=k[[x,y]], M=S/(x)⊕k | pd2, support dim1>2−2=0, depth0; hypothesis fails | Retain |
| 9.3 patched dual headline | P=[O→π O] in0,1 | dual in−1,0 has only H⁰=k=Ext¹_O(k,O); shifted[−1] has top degree1 | Retain |
| 9.3 finite-action dual headline | S=O,Q=R=M=k,r=0 | Ext¹_O(k,O)=k=Ext⁰_k(k,k); ordinary Hom_O(k,O)=0 | Retain |
| 9.3 nonfinite acting ring | R=S[[t]],M=S,t acts0 | R/annM=S finite; both S-source Ext⁰ groups=Hom_S(S,S)=S | Retain quotient argument |
| 9.4 spectral versus scalar support | T=S×S,C=S with first projection | scalar support full; T-support only first factor, second block0 | Retain actual finite action image |
| 9.5 length defect | B=O,f=πˢ,M=O and O/πʳ | defects s−0=s; min(r,s)−min(r,s)=0 | Retain |
| 9.5 nonreduced generic length | B=O[ε]/ε²,f=π,M=B | special length2, kernel0, generic length2, c=1; 2=1·2 | Retain |
| 9.5 zero-dimensional case | B=k[ε]/ε²,f=0,M=B | cokernel length2, kernel length2, defect0 | Retain |
| 9.5 derived Euler | C=O[−1],f=πˢ | special Euler−s; generic Euler−1, c=s, hence −s=s(−1) | Retain sign |
| 9.6 paired transport control | x-disk and π-disk over O[[x]] | first rational support V(x); second rational support∅ although integral support V(π) | Retain flat-component hypotheses |
| 9.7 survival | free rank1 stalk with surviving point | local fibre=k of dimension1; zero stalk fibre0 violates nonzero input | Retain specified point and component hypotheses |

### Pinned-library and ownership audit

Mathlib was inspected at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **15 file/line entries** are concrete declarations read at those pins, rather than searches against a newer library:

| Pinned file and line | Declaration / relevant boundary |
|---|---|
| `Mathlib/RingTheory/Support.lean:47` | Native `Module.support` uses nonzero localization; no finite-generation hypothesis in its definition. |
| `Mathlib/RingTheory/Support.lean:117` | `Module.support_eq_empty_iff`; zero is detected without using a finite annihilator formula. |
| `Mathlib/RingTheory/Support.lean:174` | Exact-sequence support comparison. |
| `Mathlib/RingTheory/Support.lean:216` | `Module.support_eq_zeroLocus` is inside the finite-module context beginning at line 196. The E/O counterexample explains the boundary. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | `IsAdicComplete` includes both `IsHausdorff` and `IsPrecomplete`; it really includes separatedness. |
| `Mathlib/RingTheory/AdicCompletion/Functoriality.lean:446` | `surjective_of_mkQ_comp_surjective` assumes precomplete source and Hausdorff target. This supports the approximation route, not the entire relative-cotangent headline verbatim. |
| `Mathlib/RingTheory/Depth/Rees.lean:158` | `ModuleCat.exists_isRegular_tfae` requires a finite module, Noetherian base and `I • top < top`; regularity is not inferred for a zero quotient. |
| `Mathlib/RingTheory/Regular/ProjectiveDimension.lean:166` | `ModuleCat.projectiveDimension_quotient_eq_length` already supplies the regular-sequence quotient formula; the roadmap cites it. |
| `Mathlib/RingTheory/LocalRing/Module.lean:243` | Finite-presentation local flat/free input; it is not arbitrary-rank Kaplansky freeness. |
| `TauCeti/RingTheory/Ideal/ArtinRees.lean:78` | `TauCeti.ArtinRees.exists_controlled_lift`: shift chosen before the surjection and depth; the claimed uniformity is present. |
| `TauCeti/RingTheory/RegularLocalRing/Basic.lean:129` | `quotient_span_singleton` requires an element in m but outside m². |
| `TauCeti/RingTheory/RegularLocalRing/Basic.lean:140` | `quotient_span_singleton_iff` separately requires nonzero x; the x=0 case is not supplied by this equivalence. |
| `TauCeti/RingTheory/FittingIdeal/BaseChange.lean:134` | `TauCeti.fittingIdeal_baseChange` permits arbitrary algebra extension and assumes a finite module. |
| `TauCeti/Algebra/MonoidAlgebra/Dual.lean:265` | `TauCeti.MonoidAlgebra.dualLinearEquiv` is opposite-linear for the right dual action; coefficient-at-one and inverse-coefficient formulas are at lines 286 and 294, naturality at 307. |
| `TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean:80` | `linearHomComplex` uses native cochains and `δ_hom`; the two-term signs above agree with this differential. |

Object searches covered associated graded/Rees objects, completions, symbolic powers, support and annihilators, projective dimension/depth, minimal free models, Matlis and perfect duality, finite action images, module cycles and patching. Searches used the roadmap service as well as main, the supplied sibling checkouts and board package files. The exact namespace search found this folder and the distinct `DeformationAndDerivedPatchingAlgebraPartII` namespace; no declaration was found with this folder's fully qualified name in another readable roadmap. The generic carriers are owned by the following suppliers. The additional content properly owned here consists of the labelled adapters, explicit finite models and comparisons, and simultaneous patching with its action/support contracts; R02 and R03 identify the exceptions.

| Cross-roadmap contract resolved | File/section witness and outcome |
|---|---|
| GroebnerGeometry G4 | `TauCetiRoadmap/GroebnerGeometry/README.md:252`: ordinary associated graded, its classes and maps. Rees-quotient coordinate comparison here is additional. |
| SchemeAndStackFoundations §0.17 | Main `README.md:1138` onward supplies depth, CM, Ext and associated-prime bounds; `:1200` already owns the depth inequalities (R02), `:1205` supplies associated-prime injectivity. The element test of §3.6 is an application to a cyclic submodule. |
| SchemeAndStackFoundations §§4.2–4.5 | Main `README.md:5110`, `:5135`, `:5194`, `:5244`: Artinian categories, small extensions, Schlessinger criteria, hulls and obstruction theory. The all-finite-socle/pushout extension here is distinguished. |
| SchemeAndStackFoundations §§2.18–2.21 | Main `README.md:3959`, `:4094`, `:4275`, `:4390`: affine derived and normalized duality. At `:4393` and `:4400` the predicates are named `DualizingComplex` and `NormalizedDualizing` in prose; this section explicitly is not yet in the Coherent Lean strand. The target's `Coherent.*` labels are not pinned declarations. The mathematical supplier exists, so this is not an unowned-duality finding. |
| SchemeAndStackFoundations SF.2/SF.5 | §2.18 contains the affine/filtered-colimit comparison; §5.1 (`README.md:6567`) gives dimension-graded geometric cycles, with its finite-type-over-field boundary. The target does not confuse that grading with arbitrary affine module cycles. |
| DerivedModuleAlgebra | `README.md:516` (§0.K.1), `:1403` (§1.T.1), `:1666` (§1.1.1), `:2049` and `:2200` (§§1.E.0–1.E.1): Koszul signs, strict tower limits, tensor/Hom and perfect effectivity. §§1.3–1.5 provide derived completion. |
| DerivedModuleAlgebra Matlis contracts | Main `README.md:2242`, `:2290`; the complete-DVR computation is explicit at `:2271`–`:2282`, including the failure over incomplete DVRs. This is the independent supplier witness for R01. |
| EnhancedDerivedSheaves | `README.md:510`, `:549`, `:689`, `:840`, `:888`: enhancement, finite-dimensional regular global-dimension bound, Kunz, and affine tensor comparison. The arbitrary-module global dimension bound includes the finite Krull-dimension input. |
| DeformationAndDerivedPatchingAlgebraPartII | `README.md:321`, `:583`, `:653`, `:753`, `:1364`: Čech/local cohomology, CM characterization, regularity of CM secant lists as consequence of Schenzel, noncomplete finite-module duality, graded Rees modules. This predecessor supplies these outputs despite its Part II title; no reverse dependency was inferred from the title. |
| ArithmeticGaloisDuality D7.1 | `README.md:4685` onward: complete-local complex duality and bounded perfect Tor. §7.10 here extends the latter to bounded-above complexes and module coefficients. |
| IntegralHeckeAndGaloisDeterminants | `README.md:2831`, `:2896`, `:2921` onward, and `Suggested.lean:328`, `:334`: finite derived Hom, ghosts, annihilator bound, finite local factors and actual derived-idempotent splitting. Only the first two are named Lean theorems in that file; the others are stated targets in §2.2. Their content exists, so the target's shorthand theorem names were not treated as missing prerequisites. |
| PadicLocalLanglandsForGL2Qp §§0.4–0.5 | `README.md:299` and `:330`–`:334`: fixed-basis continuous universal lifts, affine module cycles, the shared polynomial, ambient multiplicity, specialization. R03 deletes the duplicated acceptance check; the different Hilbert-series/degree comparison remains here. |
| ModularCurves §§4D,7D | `README.md:1165`, `:1500`: local regularity/completion and test-algebra deformation input. The labelled coefficient adapter preserves the residue map. |
| AdicSpacesPartII §§R0.1b,R0.3 | `README.md:727`, `:1769`: Noetherian completion and adic completed tensor. Local continuous maps need not be adic; §1.12 deliberately constructs the broader local coproduct and compares only on shared hypotheses. |
| AlgebraicVectorBundles 0B–0C; PadicMeasuresIwasawaAlgebras §5.1 | Resolved `README.md:228`, `:254`, and the latter `README.md:3172`: affine dual/determinant operations and determinant lines. The CI parafactorial theorem is additional, not a redefinition of Picard objects. |
| PadicMeasuresIwasawaAlgebras L1 | Completed group algebra, finite quotients and augmentation are supplied; the general complete-flat module comparison in target §7.5 uses different carriers. |
| ProfiniteProPGroups Layers 0,3,4; LocalGaloisGroups | `README.md:131`, `:312`, `:535`; LocalGaloisGroups `README.md:417`: quotient/free profinite and finite-generation inputs. No arithmetic finiteness is inferred for an arbitrary profinite group. |
| LocalFieldsRamification Layer 0 | `README.md:72`: finite integral closure versus integer rings under the local-field hypotheses. The target's more general finite integral-point result does not call every fraction field a local field. |
| GrothendieckEulerForms Layer 5; DGAInfinity Layer 5 | `README.md:383` and `:431`: finite-support Euler additivity/descent and perfect-envelope/idempotent comparison. Euler length zero is not used to conclude zero support. |

Paths abbreviated to `README.md` in this table are inside the named roadmap's `TauCetiRoadmap/<name>/` folder, except `LocalGaloisGroups`, `ProfiniteProPGroups` and `LocalFieldsRamification`, which are under `Completed/<name>/`. Existing roadmaps were compared on main; new supplier folders were read through the supplied roadmap service. The open-work search is limited to readable heads and the supplied index; it does not certify unseen revisions. No UPWARD or CYCLE was reported. Every explicit Needs line was read, including the reordered §1.13 before §1.10 and §§7.1–7.3 before §5.1. Those are subsection reorderings, not circular proofs. There are no declared gap contracts to accept conditionally.

### Shape observations

All nine layers have Examples and Dependencies subsections. Definitions generally carry API prose and discriminating examples, including nonzero versus zero, finite versus infinite, ordinary versus derived, and characteristic-two controls. The Lean file has native-bodied definitions, a single Mathlib import and two used Tau Ceti imports, a single target namespace, declaration docstrings and only admitted theorem proofs. It does not encode unknown mathematical conditions as arbitrary Prop fields. R04 is the recorded failing style gate. R05 and R06 are manual citation/name-style findings beyond that gate result.

## Not verifiable

- The published Calegari–Geraghty correction (Inventiones 227 (2022), pp.855–856, DOI 10.1007/s00222-021-01095-5) resolved to a paywalled/uncertified source. Its claimed list of 47 bracket corrections and exact items (1),(10) at README lines 1680–1682 were not independently certified. The original theorem and proof were read; the strengthened finite-cutoff input is assessed directly, without assuming the correction repairs the quotient-action step.
- Avramov, *Infinite free resolutions*, the cited §§6.2–6.3, §7.1 and §§10.1–10.2, was not legally readable through the service; it resolved as an uncertified book chapter. The detailed acyclic-closure/PBW comparison of §3.2 therefore remains source-unverified. The accessible Avramov–Veliche and Avramov–Iyengar papers do not by themselves certify every locator inside that chapter.
- The reference *Frobenius Singularities*, Chapter 1, §1, Proposition 1.21(b), gives neither an author nor a version. The service and exact-title web searches did not identify the intended text. The complete F-finite Cohen-presentation locator is not certified; provide an identifiable legal reference. This is a source-access limitation, not evidence that the algebraic statement is false.
- The universal assertions are not Lean proofs: the executable checks establish elaboration and probe failure, and the table records explicit adversarial instances. In particular the full system-level patching, spectral support and arbitrary-rank completion arguments are mathematical proof plans, not machine-verified consequences of the pins.

## Source issues

- **Error** in s08 at Lemma 4.4, printed p.357: the source says equality in the filtered Hilbert inequality is equivalent to regularity of the element; it should be equivalent to regularity of its initial form, with the filtered intersection condition; affects a stated result.
- **Misprint** in s08 at Theorem 6.3(d), printed p.386: the source uses the quotient-level kernel φ_N, including N=0 where none is supplied; it should use the original-level kernel φ_M consistent with the selected patch datum; affects a stated result.
- **Gap** in s08 at proof of Theorem 6.3, printed p.388: the source identifies cohomology after arbitrary framing quotient with the quotient of cohomology; it should justify that base change or supply compatible quotient-cohomology actions explicitly; affects the proof.
- **Misprint** in s27 at Proposition 14, printed p.19: the source defines generic rank using dimension over the residue field k; it should use dimension over the fraction field F; affects nothing.
- **Error** in s19 at the paragraph preceding Lemma 6.3.3, printed p.1049: the source asserts the quotient cone triangle for arbitrary f; it should assume f is a nonzerodivisor or use the Koszul cone instead of S/(f); affects the proof.

The witnesses are s08 lines 2429–2458, 3628–3636 and 3683–3697; s27 line 1219; s19 lines 6153–6158. For the last error take S=k and f=0: the cone has k in two degrees, whereas S/(f)=k has one. Lemma 6.3.4 itself includes regularity, and the roadmap retains it. The roadmap also corrects the first CG equality and uses its own stronger finite-cutoff datum. No published correction of these specific errors was verified.
