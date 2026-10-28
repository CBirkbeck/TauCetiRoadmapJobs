<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1119#issuecomment-6427019705 -->
Red team round 1 pass a (codex) of 6d0add9

Verdict: needs_changes

1. **F01** (P1) The indefinite augmentation loses the rank-two Galois factor

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:517, 532, 535, 1130. 

   **Claim:** The same big module has residual fibre π∨ and augmentation equal to the dual of full completed H¹.

   **Witness:** DL21 lines 3164–3167, 3200–3203 and 3225–3228 patch the Galois multiplicity space. Full localized H¹ has the additional rank-two Galois factor. For a modular σ of multiplicity r, the two residual duals give r and 2r.

   **Exact repair text:** “In the indefinite case let C=M∞⊗_{S∞}W(𝔽). Its dual is the completed Galois multiplicity module. After choosing a basis of the rank-two universal global representation, the full completed-cohomology dual is C^{⊕2}. In the definite case it is C. The augmentation ring surjections are unchanged. In §5.7 apply faithful flatness to C^{⊕2} in the indefinite case, and to C in the definite case.” Add this comparison as part of §1.6 and transport it through §§5.6–5.7; remove the conflicting single-copy identities. The residual σ-multiplicity is then 2r=2r for full H¹, and r=r for the multiplicity module. BHHMS23 line 5441 itself needs this correction when M∞ retains the normalization of lines 5221–5223.

2. **F02** (P2) Cyclotomic twisting must change the residual deformation problem

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:412, 415, 960. The type-ring identification changes the determinant and Hodge weights while leaving its defined residual parameter r̄_v∨ unchanged.

   **Claim:** The quotient for λ+(1,1) is a quotient for the same residual representation with determinant ε³ψ_v⁻¹.

   **Witness:** BHHMS23 lines 5074–5076 explicitly replace r̄_v∨ by r̄_v∨(1). At p=29 choose inertia g with ω(g)=2: the new residual determinant is 4·det(r̄_v∨(g)), unequal to the old determinant.

   **Exact repair text:** “Write R∞(r̄_v∨;εψ_v⁻¹) and R∞(r̄_v∨(1);ε³ψ_v⁻¹) for the two patched deformation problems, transporting the local factor and its structural maps by cyclotomic twisting. Twisting identifies their respective (λ,τ) and (λ+(1,1),τ) quotients. The second quotient is not taken in the original residual deformation ring.” Use this notation throughout §4.8. Add the p=29 inertia Check: both sides now reduce to determinant 4·det(r̄_v∨(g)); demanding the original residual representation instead makes the twisted fixed-determinant functor empty.

3. **F03** (P1) The weight-theorem route lacks prescribed-component modular lifts

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:319, 326; supplier contract at line 117.

   **Claim:** Patching, the local Breuil–Mézard identity and local potential diagonalizability suffice to obtain the global multiplicity identity and nonvanishing in every predicted weight.

   **Witness:** GK14 lines 1475–1490 require support on every component, supplied by Lemmas 5.3.6 and 5.2.5 (lines 1400–1410, 1253–1258). The cited PL.1 target is local. For A=k[[x,y]]/(xy), M=A/(x) is MCM but e(M)=1<2=e(A).

   **Exact repair text:** Add a named earlier-supplier gap, with the same slug in the README and plan: “What PotentialAutomorphyInfrastructurePartII must provide (gap:quaternionic-component-realization), at PL.5: Let p>2, F totally real and r̄ modular with absolutely irreducible restriction to G_{F(ζ_p)}, excluding projective A₅ there when p=5; fix a totally even finite-order ψ lifting ε det r̄, a finite ramification set S containing the p-adic and ramified places, compatible inertial types, and a nonempty irreducible component of each fixed-determinant local type ring, potentially Barsotti–Tate at p. After finite coefficient extension there is a modular lift of determinant ψε⁻¹, unramified outside S, on every chosen component (GK14 Lemma 5.2.5, pp. 26–27).” In §0.6 derive the quaternionic version by the discrete-series compatibility at ramified places as in GK14 Lemma 5.3.6, establish full component support and generic rank, and only then invoke GK14 Lemma 5.4.3 and Proposition 5.4.4 for the multiplicity identity. Cite the supplied transfer and local–global compatibility inputs there. The node example is now excluded by full component support; merely assuming MCM or one modular point does not exclude it. The existing local Breuil–Mézard gap remains distinct.

4. **F04** (P3) The dual differential Check cannot determine its claimed sign

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:38. The two-term complex has no degrees and the computed cokernel is used to check a minus sign.

   **Claim:** The example determines the dual differential to be −p.

   **Witness:** For C⁰=O, C¹=O, d⁰=p, the usual cohomological Hom differential on C∨ is d⁻¹=+p. Both +p and −p have cokernel O/p, so the displayed value cannot distinguish them.

   **Exact repair text:** “Take C⁻¹=C⁰=O and d⁻¹=p. With d_Hom(f)=d_O∘f−(−1)^deg(f)f∘d_C, the dual has degrees 0,1 and d⁰(1)=−p, unequal to +p in O. Its cokernel is O/p.” Explicit degrees and evaluation on 1 now distinguish the sign; keep the cokernel observation only as a separate consistency check.

5. **F05** (P2) The lower-bound proof acts on a fixed level by a group that need not act

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:1084. The proof calls the original fixed-level space a representation of the product of the other K₁,w.

   **Claim:** One can take K₁,w-invariants in that space for every open V_w⊆K₁,w in the theorem.

   **Witness:** Let V=⟨1+pE₁₂,K₃⟩⊂K₁. Conjugation by 1+pE₂₁ adds p²(E₂₂−E₁₁) modulo p³, so V is not normal. Only its normalizer acts at that fixed level; K₁ does not.

   **Exact repair text:** “First form the smooth tower representation Π varying the levels at all other p-adic places. By finite-level control, the original space is Π^{∏V_w}. Its nonvanishing implies Π≠0. The compact pro-p group ∏K₁,w therefore has Π^{∏K₁,w}≠0, and this invariant space embeds in Π^{∏V_w}. Apply the weight theorem and §5.1 at the enlarged levels.” Add the displayed nonnormal V as a Check. The inclusion is now defined even for that V; do not restrict the theorem to normal subgroups.

6. **F06** (P2) Partial glued lattices already belong to the local supplier

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7, 12, 815, 828, 834. The scope claims ownership of the intermediate lattices and §4.1 plans their construction.

   **Claim:** Only the endpoint R is supplied by ModpRepresentationsOfGL2OverLocalFields; this roadmap constructs L_j.

   **Witness:** packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md:2375–2376 and 2389 already construct every partial L_j and state its fibre-product recursion. The hypotheses there are weaker (3-deep) than the present 8-deep application.

   **Exact repair text:** “Import all partial lattices L_j, their recursion and the endpoint comparison from ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice. This section specializes that interface to σ_v and constructs the type-dependent lattices T′_{2,j}, Y_j and N_j and their comparisons with L_j. The new global targets are the patched-module results of §§4.3–4.9.” Mark the L_j API and recursion as supplied and remove their construction from the proof work and ownership claim. For f=2 both interfaces give ranks d,4d,7d and the same two reduction constraints; no mathematical target is lost.

7. **F07** (P3) The first completed-Hecke Check does not test locality

   **Location:** packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:1112. The proposed Check computes that a residual quotient sends 1 to 1 and its maximal ideal to 0.

   **Claim:** Those values check that the completed Hecke algebra is local with the intended residue field.

   **Witness:** The nonlocal algebra 𝔽×𝔽 with projection to its first factor has the same values: 1↦1 and 0×𝔽↦0. Thus this Check accepts the unlocalized, wrong carrier.

   **Exact repair text:** Replace that bullet by “For T=𝔽×𝔽 and 𝔪=0×𝔽, localization kills e₂=(0,1), sends e₁=(1,0) to 1, and gives T_𝔪≅𝔽 with unique maximal ideal 0. Keeping both nonzero orthogonal idempotents fails locality.” This computes the actual localization operation and excludes the exhibited wrong model; combine it with the existing semilocality bullet to avoid duplicating the same Check.

## Verified sound

Read all 1,169 README lines and all 39 Suggested.lean lines at 6d0add9. Counts: **0 Lean declarations**, **39 numbered mathematical target sections**, **134 README Check bullets examined and 91 computed mathematical test rows recorded**, **39 target locator blocks checked against 12 package sources plus one additional legal source**, and **15 direct roadmap-supplier families checked**. The computed cases below include every target section and the separate conventions, definitions and support identities. Computations on model modules check the displayed algebra and hypothesis boundaries; they are not proofs of the arithmetic theorems.

The package diff has 9 changed files, all under packages/HilbertModularVarietiesAndShimuraCurvesPartII. There is one Mathlib import, no set_option, no admitted data, no theorem/lemma declarations, and no executable algorithm in the mathematical targets. No forbidden pull-request references or process directives were found in README or docstrings. The four declared gap slugs agree between README and design/plan.json. Their absence from current suppliers is not counted as a defect. No finding is a re-raising of an item marked “not actionable in this package” in the last repair report.

The dependency command returned exactly:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. The internal §0.5→§0.6 reference is confined to the nonvanishing conclusion after constructing the colimit; the stated build order separates these operations. The substantive missing global input is R03, which a name-only dependency scan cannot detect.

| Suggested.lean declaration inventory | Section | Variable / instance context | Computed audit result |
|---|---|---|---|
| No declarations | Empty TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII namespace | No section variables, includes, instances or universes introduced | 0 theorem signatures; 0 data definitions; 0 padding declarations; 0 colliding fully qualified names |

The headline list is: the quaternionic weight theorem (§0.6); coefficient and big-module patching (§§1.4–1.6); central-variable grade comparisons, CM transfer and miracle flatness (§§2.4–2.6); common-rank and locally algebraic support theorems (§§3.2–3.4); adjoint/glued-lattice freeness and first-order multiplicity (§§4.4–4.9); weighted and unweighted GK dimension (§§5.1,5.5); second-congruence structure (§5.2); patched faithful flatness (§5.3); Banach lifts (§5.4); and inert-prime R=T, completed-cohomology flatness and complete intersection (§5.7). Each unavailable headline is named in the module docstring. The elementary extension and fibre-product criteria (§§2.2–2.3) are supporting algebra, not substitutes for those headlines.

The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The 20 named Mathlib declarations in the library contract resolve at those pins. In particular:

| Native input | Pinned evidence | What is, and is not, included |
|---|---|---|
| Locality, finite generation, freeness | Mathlib/RingTheory/LocalRing/Defs.lean:30; Mathlib/RingTheory/Finiteness/Defs.lean:121; Mathlib/LinearAlgebra/FreeModule/Basic.lean:43 | Locality includes nontriviality; Module.Finite means finite generation; Module.Free alone allows infinite rank. |
| Flatness and faithful flatness | Mathlib/RingTheory/Flat/Basic.lean:113; Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63 | FaithfullyFlat includes Flat; neither identifies any arithmetic module. |
| Equal locus and kernel | Mathlib/Algebra/Module/Submodule/EqLocus.lean:45,102; Mathlib/Algebra/Module/Submodule/Ker.lean:59 | Equal values and the difference kernel are native; surjectivity and support freeness are additional hypotheses. |
| Support and annihilator | Mathlib/RingTheory/Support.lean:47; Mathlib/RingTheory/Ideal/Maps.lean:868 | Support uses nonzero localizations; annihilator is the scalar-action kernel. Equal sets of primes do not identify annihilators over a nonreduced ring. |
| Algebraic representation | Mathlib/RepresentationTheory/Basic.lean:48 | A monoid homomorphism to endomorphisms, with no smoothness or admissibility built in. |
| Ext | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118 | Derived-category Ext exists, with its category and smallness context; no Iwasawa analytic dimension/depth package is thereby supplied. |
| Generator cardinal converted to ℕ | Mathlib/Algebra/Module/SpanRank.lean:66 | spanFinrank alone cannot certify finite generation; cardinal-to-natural conversion must not be used on an infinite module as a finite generator count. |
| Completed group algebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:109,145; Module.lean | A compatible inverse-limit algebra and compact continuous module extension; no uniform pro-p analytic structure, Auslander regularity or arithmetic patching carrier. |

Searches by object in pinned sources did not locate the missing uniform analytic/Iwasawa dimension structure, quaternionic cohomology, coefficient patching functor or patched module needed for these headlines. Replacing them by arbitrary modules or free predicates would change the theorems. No statable arithmetic headline or padding theorem was identified in Suggested.lean.

The citation resolver found no unresolved roadmap citation or own Lean name against main 40e1669 and the 2026-10-26T20:27:35Z index; its external-library check was unavailable, so the library declarations were inspected at the provided pins directly. Object searches used the roadmap service against main and indexed heads, then the board packages, Completed, and all **55 supplied sibling checkouts**. The sibling search found no additional owner of the global quaternionic patching/GK results or the two support-freeness criteria. The local lattice overlap is R06. No Lean names are declared here, so a fully qualified declaration collision is impossible.

| Direct supplier family checked | Resolved contract and outcome |
|---|---|
| HilbertModularVarietiesAndShimuraCurves | R18.1, R18.3 and R18.4 finite-level geometry, exactness, Hecke and rank-two representation interfaces; the Galois factor must remain in full H¹ (R01). |
| ModpRepresentationsOfGL2OverLocalFields | MP.3–MP.9 named targets exist; depth bounds meet the global 8-deep application. The supplied partial lattices are R06. For the same-socle case, apply the single-σ hull results to Q/σ, not directly to Q; the finite Ext-neighbour intervals give the semisimple middle layer. |
| LocalGaloisDeformationRingsPartII | T.0, T.4/weight-shape-bijection, T.6/single-presentation, single-components, special-fibres and T.7/weight-union, multiple-presentation, exact-q-ideals, p-membership resolve. Stable variables, whole-type ideals, p and embedding reversal are retained. |
| LocalGaloisDeformationRings | §§1.1,1.4,1.10,1.24 and 3.1,3.4,3.9–3.10 supply the claimed local carriers and type quotients; twisting also changes the residual input (R02). |
| GlobalGaloisDeformations | §§3.3–3.7,5.1,5.7–5.8 supply global problems, Taylor–Wiles data and generator counts; unrestricted global augmentation is separately targeted here. |
| DeformationAndDerivedPatchingAlgebra | §§1.6,1.10–1.12,3.1–3.4,3.11–3.12,5.6,6.1–6.2,7.2–7.3,8.1–8.5 resolve. Its explicit MCM/full-support distinction confirms R03. Cancellation remains a declared gap. |
| NoncommutativeAndEquivariantIwasawa | F.1,0.1–0.4,0.10–0.11 retain the no-p-torsion hypothesis and integral/residual dimension shift. |
| CompletedCohomologyPartII | F.1,1.1–1.3,2.4,3.1–3.2,3.7,5.5,8.4,8.8,8.10,8.12–8.15 provide the qualified tower/duality/Hecke interfaces, not unconditional reduction of arbitrary complexes. |
| PadicMeasuresIwasawaAlgebras | §§1.1–1.7 and 5.2 resolve on main; compact Hausdorff continuous modules are essential to topological Nakayama. |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4 resolve; smoothness and admissibility are not inferred from algebraic Representation. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.26 and R07.5.15 give the fundamental-character and weight carriers; the BDJ comparison remains here. |
| PotentialAutomorphyInfrastructurePartII | PL.1/potentially-barsotti-tate-diagonalizable exists with p>2. It is local and does not supply R03's global component realization. |
| Chebotarev | Layer 10 gives density #C/#G, infinitude and invariance under finite deletion; the separate residual-image argument still chooses the class. |
| AutomorphicGaloisRepresentations | §§4.3–4.4 include the required Hilbert-form normalization and Weil–Deligne compatibility with monodromy at w∤p. |
| GL2AutomorphicRepresentationsAndTransfer | R17.3.1,R17.3.10 cover non-norm discrete quaternionic transfer and the indefinite parity case. |

| Source locator blocks checked | Evidence and outcome |
|---|---|
| BHHMS23 | Lines 288–365,1918–1946,4312–5475 cover the multiplicity statement, p-membership and §§8.1–8.5. Target statements match except the issues recorded above and the already corrected source errors below. |
| EGS15 | Lines 385,441–540,687–785,954–967,1597–1664,1686–1835,2197–2260,3212–3355: conventions, weight recipes, type isolation, patching, cuspidal coefficient enlargement and component ideals. |
| GN22 | Lines 1408–1437 and 1955–2292: R=T implication and Appendix A's grade, depth and flatness statements. Locality, finiteness on both sides and nonzero CM hypotheses are retained. |
| GK14 | Lines 105–146,244–249,325–371,1220–1277,1400–1680: local multiplicities, Hodge labels, component realization and global weights. The missing component argument is R03. |
| DL21 | Lines 3111–3228: exact functor, big module and multiplicity-space augmentation, supporting R01. |
| LE19 | Lines 779–808: generator-count lemma and its application; finite generation and the equal minimum counts are explicit. |
| LMS22 | Lines 631–658: the tame-lattice Hom test eliminates repeated modular weights in the radical; the package uses the corresponding common-rank argument. |
| BDJ10 | Lines 834–863,1065–1097,1260–1347: antisymmetric choices, extension-class subspaces and both exceptional modifications. |
| CEGGPS16 | Lines 1369–1379 and 2533–2563: Banach admissibility and actual type-ring factorization, rather than equality only on field-valued points. |
| STACKS | Line 1544, tag 05G8: surjective endomorphisms of finite modules are invertible, without assuming the coefficient ring Noetherian. |
| BRE14 | Lines 2754–2810, Lemma 9.2: the reverse embedding used for the full K₁-invariant Diamond module. |
| HAM75 | Lines 101–120, Theorem 4: cancellation for commutative local rings; the substitutions and quotient maps preserve shared constants. |
| HW22 (additional review source) | Lines 1783–1829, end of Proposition 4.18 proof, pp. 37–38, arXiv:2009.09640v4, fetched through the source service. Applying the first-order hull theorem to Q/σ, then the finite Ext-neighbour intervals, supplies the same-socle argument. No new supplier gap is required for this deduction. |

The following table is the running mathematical record. All rows use actual arithmetic inputs where an arithmetic theorem is being discussed; elementary rings and representations are negative controls for a proposed inference. No arbitrary model is being asserted to arise from a global automorphic datum.

| Statement / context | Instances tried | Values computed on each side or in the competing model | Result / change |
|---|---|---|---|
| Geometric Hecke convention | 𝔽₂₉, q=5, roots 2,3 | S=25,T=9; S⁻¹T=7·9=5; qS⁻¹=6; polynomial X²−5X+6 | Correct. |
| Frobenius reversal and parent adapter | Same roots | Arithmetic inverse roots 15,10; parent twisted roots 17,21; 5/17=2 and 5/21=3 | Correct; direct T as geometric trace would give 9≠5. |
| Central determinant twist | χ(z)=2 in 𝔽₂₉ | χ⁻²=22, χ²=4; Sym²det⁻¹ scalar 2²/2²=1 | Correct. |
| Hodge twist versus residual twist | (2,−1), ω(g)=2 | Weights become (3,0), sums 1→3; residual determinant multiplies by 2²=4 | R02. |
| Duals and differential convention | O/p; two-term O-complex | Hom(O/p,O)=0, Hom(O/p,E/O)=𝔽; degrees 0,1 give dual +p, degrees −1,0 give dual −p | R04; cokernel is 𝔽 for either sign. |
| Nonabelian inverse convention | Upper/lower unipotents u,v over 𝔽₂₉ | uv=((2,1),(1,1)), vu=((1,1),(1,2)); (uv)⁻¹=v⁻¹u⁻¹ | Opposite algebra required. |
| Support and zero module | A=k[ε]/ε²; A,k,0 | Ann(A)=0, Ann(k)=(ε), Ann(0)=A; quotient supports A,k,0 | Scheme structure distinguishes A from k. |
| CM/zero convention | O, k, 0 | depth/dimension 1/1 and 0/0; zero grade ∞, dimension −∞ | Noncommutative CM excludes 0; patching permits 0 separately. |
| Local analytic dimension | f=1,2 | dim K₁=4,8; dim Z₁=1,2; quotient dimensions 3,6 | Equals 3f. |
| Tame-type gap | GL₂(𝔽₂₉) types | Scalar/principal/cuspidal dimensions 1,30,28; Steinberg dimension 29 | Boundary in contract distinguished. |
| Single-type gap | f=1,2 | One-weight relative dimensions 3+f=4,5; total dimensions 5,6 | Coefficient dimension retained. |
| Breuil–Mézard gap | Predicted FL regular weight / excluded weight | μ=1 / 0; corresponding lifting ring nonzero / zero | Support comparison retains dual input. |
| Ramified Hodge labels in the gap | e=2,f=1,a=(1,0) | Highest weights (1,0),(0,0); GK Hodge pairs (2,0),(1,0), not (2,0),(0,0) | Correct non-chosen embedding convention. |
| Cancellation gap | Z_p[[t]][[x]] versus Z_p[[x]] | Dimensions 3 versus 2; if A[[x]]=W[[X₁,X₂]], dim A=2 | No lost coefficient variable. |
| Witt coefficient correction | 𝔽₉=𝔽₃[a]/(a²+1) | a³=−a; Frobenius sends [a] to [−a]; inverse lift restores [a] | Residue correction necessary. |
| §0.1 generic datum | p=23,29; f=0,1 | Reducible boxes ∅ and {12,13,14}; irreducible at 29 is {13,14,15}; field degree f=0 absent | Bounds and nonemptiness correct. |
| §0.1 EGS versus strong genericity | p=29,r₀=11; p=3 | r₀=11 lies below 12; at p=3 reducible range {0} is exhausted by exclusions | The genericities are distinct. |
| §0.1 quaternion parity | Rational definite; cubic indefinite | Real ramification 1 or 2 forces finite ramification odd or even | Rational split curve excluded; properness retained. |
| §0.2 reducible and irreducible recipes | p=5,s=1 | Reducible dimensions 2+2; irreducible dimensions 2+4; respective determinant exponents 2 and 1 | Distinct recipes agree with source. |
| §0.2 boundary weights | p=5, inertia ω³⊕1 | Dimensions 3,1,5 and cardinality 3, not generic count 2 | Exceptional endpoint retained. |
| §0.2 extension class | Split ω⊕1 / très ramifiée extension | Split weights 1,Sym⁴,det Sym²: count 3; extension only Sym⁴: count 1 | Semisimplification is insufficient. |
| §0.2 generic and type counts | f=2; p=29,f=1,ω¹³⊕1 | 2²=4 weights; dimensions 13+15=28; isolation cardinality 1 versus all-weight cardinality 2 | Isolating and all-weight types differ. |
| §0.2 nonsplit type layer | 0→σ′→θ→σ→0, dimensions 15,13 | dim θ=28=dim(σ⊕σ′), but cosocle dimensions 13 versus 28 | Extension structure, not dimension, specifies θ. |
| §0.2 raw GK dual input | ρ=ω⊕1, ω(g)=2 | det ρ(g)=2; raw trivial-Hodge determinant 2⁻¹=15; ρ∨ has determinant 15 | Correct double convention change. |
| §0.3 coefficients and evaluation | Zero coefficients; multiplicity rank r=2 | S(0)=M(0)=0; rank-two Galois tensor has multiplicity dimension 2·2=4 | Evaluation retains rank-two factor; R01 downstream. |
| §0.3 exactness boundary | Connected C₂₉-cover | Norm vector has 29 coefficients 1 but augmentation 29=0; invariant target has dimension 1 | Non-Eisenstein localization is essential. |
| §0.3 Hecke normalization | q=5, roots 2,3 | Correct (T,S)=(9,25); wrong dual-twist input yields (1,20) | Wrong Galois normalization excluded. |
| §0.4 projectivity | C₂ and S₃ over 𝔽₂₉ | Trivial projective dimension 1; free dimensions multiples of 2 and 6 | Projective does not imply free here. |
| §0.4 p-group freeness | Regular C₂₉-module | Total dimension 29, invariant dimension 1 | Local group algebra case differs from preceding row. |
| §0.5 weighted π | Inertial exponents 15 and 13 at p=29 | Dual exponents 13 and 15; weight pairs (Sym¹²,det¹³Sym¹⁴) and (det¹⁵Sym¹²,Sym¹⁴) | Both socle examples agree with dual input. |
| §0.5 nonzero and infinite dimension | Wrong away weight; matched weight; f=1 | Wrong weight fibre 0; matched multiplicity r≥1; GK 1 versus finite-dimensional GK 0 | Correct conditional consequence of weight theorem. |
| §0.6 weight theorem | Local multiplicity tuples (1,1),(1,0) | Products 1 and 0; first has nonzero predicted global space, second zero | Arithmetic support step requires R03. |
| §0.6 MCM is not full support | A=k[[x,y]]/(xy), M=A/(x) | depth M=dim M=1; support one of two branches; e(M)=1, e(A)=2 | R03's missing inference fails on this model. |
| §0.7 auxiliary doubling | q=2, eigenratio 3 or 2 in 𝔽₂₉ | 3⁻¹=10; (2−3)(2−10)=8; ratio 2 gives 0 | Unit discriminant excludes special ratios 2,15. |
| §1.1 patched ring counts | (f,card S,q)=(1,2,1),(2,1,2) | R∞/S∞ variable counts 10/8 and 9/5; dimension differences 2 and 4 | Equals 2f. |
| §1.1 empty away tensor | S={v},q=f | Tensor unit O; q−f=0 extra variables; local ring remains | No empty-set junk dimension. |
| §1.1 away isolation | O[[x,y,z₁,z₂,z₃]]/(xy−p) versus O[[t₁,…,t₄]] | Special dimensions 4,4; cotangent dimensions 5,4 | Genericity alone does not make every type smooth. |
| §1.1 determinant release | f=2 | Unrestricted determinant contributes f+1=3 directions; fixed type releases one unramified direction | These counts must not be interchanged. |
| §1.2 type quotients | (1,0),(2,−1),(2,0) | Sums 1,1,2; third quotient is zero; type dimension 9 when f=1,card S=2,q=1 | Correct; twist needs R02. |
| §1.3 abstract functor | Zero; A²; A⊕A/(t), A=O[[t]] | Ranks 0,2; third depth 1<dim A=2 | Zero allowed; rank one not forced. |
| §1.3 torsion exclusion | A⊕A/(p) | p kills (0,1)≠0; p injective on A | Torsion-free lattice condition discriminates. |
| §1.4 arithmetic functor | Zero; two surviving away weights | M∞(0)=0; two rank-one weight fibres add to dimension 2, not 1 | Isolating choice required. |
| §1.4 scheme-theoretic factorization | A=k[ε]/ε² acting on A or k | ε·1=ε≠0 or 0; field points kill ε in both | Pointwise support does not prove factorization. |
| §1.5 fibre identity | Support-free value of rank 2 | dim(M/mM)=2=dim Hom(σ,π)∨ | Correct finite-residual comparison. |
| §1.6 big module | f=1; r=2 indefinite | δ(π∨)=1, hence infinite k-dimension; full H¹ has σ multiplicity 4, π has 2 | R01; R∞-finiteness alone is correctly denied. |
| §2.1 noncommutative CM | Λ=O[[T]]; Λ,Λ/T,Λ/p | (grade,depth,δ)=(0,2,2),(1,1,1),(1,1,1) | Grade and depth identities agree. |
| §2.1 non-CM and zero | Λ⊕Λ/p;0 | Nonzero Ext in degrees 0 and 1; zero Ext in every degree | CM rejects both by the stated conventions. |
| §2.2 extension freeness | A=𝔽₂[ε]/ε², M=A,N=(ε) | Ann(M)=0, Ann(N)=Ann(M/N)=(ε); ideal quotient length 1; M rank 1 | Positive and characteristic-two case passes. |
| §2.2 split negative control | A=Z/4; M=A,N=2A versus M=(Z/2)² | First needs 1 generator, ideal quotient Z/2; second needs 2, annihilator quotient 0 | Hypotheses exclude split countermodel. |
| §2.2 rank/zero boundary | M=0; M=k² | Support ring for zero is 0; k² rank 2≠1 | r≥1 and finite generator count respected. |
| §2.3 fibre-product freeness | Nodal A; branches onto k | Ann sum (x,y)=Ann k; intersection (x)∩(y)=0; pullback A, rank 1 | Both ideal identities agree. |
| §2.3 failed equal-rank condition | A=k[[t]], A→k←A | Ann sum 0≠(t); pullback A⊕(t)≅A², rank 2≠1 | Iff fails on both sides as required. |
| §2.3 identity and nonsurjective maps | k→k←k, identities versus zeros | Pullback dimensions 1 versus 2 | Surjectivity and chosen maps matter. |
| §2.4 central variable | A=O[[T,x]], M=A/x or A | x-killed grades 1,0 with dimensions 2,2; regular quotient grades 0,0 with dimensions 3,2 | Correct shift distinction. |
| §2.4 growth | Ω=k[[T]], n≥2 | length Ω/(Tⁿ)=n; log_n(n)=1; n=1 excluded | No logarithm-base junk value. |
| §2.4 ramified/p=2 coefficients | O=Z₃[π]/(π²−3); O=Z₂,K=1 | O/π=𝔽₃; O/3=𝔽₃[π]/π²; F₂ grades 1 integrally and 0 residually | Uniformizer, not rational prime, controls reduction. |
| §2.5 depth comparison | A=O, B=O[[y]], M=O or B | For O depths 1=1; for B depths 1<2 | Finiteness over A needed for equality. |
| §2.5 nontrivial K | A=O[[T]],B=A[[y]], M=B or B/y | Depths 2<3, or 2=2; latter dimensions 2=2 | CM transfer example agrees. |
| §2.6 flatness iff grades | A=O[[T,x]], M=A/T or A/p | First grades 1=1 and coefficient-flat; second 1≠0 and p-torsion | Both directions tested. |
| §3.1 finite-length input support | A=k[[x,y]], M=A/x; zero | depth/support dimension 1=1, ambient dimension 2; zero value 0 | MCM is over support, not arbitrary ambient ring. |
| §3.2 common rank | xy=p integral type, reduction xy=0 | Two branch ranks (1,1), or (2,2) for two copies | Common r need not be 1. |
| §3.2 component intersections | Node, one/both/no branches | Ideals (x),0,A; quotient supports k[[y]],A,0 | Intersection defines union; sum (x,y) only the point. |
| §3.2 cyclic interval | Full one-coordinate interval / singleton | I_F=0, I_F×=(x), Ann(x)=(y); singleton puncture ideal A, generator 1 | Quotients equal A/(y) and A/I_J. |
| §3.2 common-cap identity | Two-coordinate node | (x₁)+(x₂)=(x₁,x₂); noninterval replacement gives (x₁,x₂y₁) | Set x₁=y₁=y₂=0: x₂ survives only in wrong quotient. |
| §3.2 flat transport | Adjoin t versus quotient by (x,y) | Ann(x) remains (y) after series extension; quotient kills x and cyclic module becomes 0 | Flatness hypothesis distinguishes transports. |
| §3.3 locally algebraic rank | Type multiplicities 1,2, common r=2 | Component ranks 2 and 4 | Local freeness need not have constant rank across disconnected types. |
| §3.3 exact integral central character | p=29,z=30, twist det²⁸ | z⁵⁶=784 mod 841≠1; original finite tame scalar acts as 1 | Same residual character does not suffice. |
| §3.4 projective lift / Diamond module | Common r=2 | Modular Hom dimensions 2; candidate D₀² dimension 2 dim D₀ on both embeddings | Socle agreement alone would not identify a proper essential extension. |
| §4.1 lattices and endpoint | f=1,2; d=dim P | Partial ranks d,4d and d,4d,7d; R′/pR dimension d versus R′/pR′ dimension 3d | Numerical identities pass; ownership is R06. |
| §4.1 raw gluing control | P̃×_P R₂,j using projection | Cosocle has quotient σ⊕σ₁,j⊕σ₂,j, three simple summands | Raw map exists but does not give the desired single cosocle. |
| §4.2 small quotient | Q=σ; same-socle permitted Q | [Q/soc Q:σ]=0 for simple Q; permitted case has [Q:σ]=2 | Simple example excluded. Q/σ has σ-multiplicity 1; the existing hull and Ext inputs apply to that quotient, giving middle Loewy length 1. |
| §4.3 minimal generators | r=2, terminal σ | Residual quotient dimension 2 forces ≥2 generators; induction aims at ≤2 | Equality 2=2 with the quotient-hull argument in §4.2. |
| §4.4 normalized lattice | A=O³,L=Oe₁⊕pOe₂⊕pOe₃ | dim(A/L)=2, dim(L/pL)=3, dim(L/pA)=1; 2+1=3 | Multiplication by p supplies the first map. |
| §4.4 torsion/lattice distinction | O/p→O versus O/p→O/p | All first maps 0, identity second map surjective of image dimension 1 | Reduced target in §4.4 is correct. |
| §4.5 support freeness | Surjection S²→M, generic rank 2 | Generic kernel rank 0; p-torsion-free S² has p-power-torsion submodule 0 | Kernel 0 once generic component equality is established. |
| §4.6 radical truncation | k[t]/t⁴→k[t]/t³ | Original lengths 4,3; both rad³ quotients length 3 | No claim of full-module equality. |
| §4.7 generator equivalence | f=1,r=2, one extra map | Baseline 2; extra map gives ≥3; factoring through N bounds it by 2 | Contradiction uses r, not f. |
| §4.8 Hodge profiles | f=2,j=1 | Three profiles; dimension (1+3+3)d=7d; extra double-adjoint gives 16d | Package correctly removes rectangular fourth profile. |
| §4.8 p-membership | p=29,N=12,a₂=2,d₂₁*=1 | 2/a₂=1; unit 1+O(29³); element 29·unit; denominators 2,1 | Generic restrictions exclude 0,1 and p=2. |
| §4.8 inverse norm sign | diag(2,1), f=1 | Negative norm-determinant factor 15, positive 2 | Correct negative twist; residual input needs R02. |
| §4.9 multiplicity after fibre | r=2; k[[t]]→k control | Fibre dimensions 2→2 force kernel 0; before fibre (t)≠0 despite generator counts 1,1 | Does not overclaim integral isomorphism. |
| §5.1 weighted GK | f=1,2 | 2≥3−d and d≤1 give d=1; 4≥6−d and d≤2 give d=2 | Upper/lower bounds agree. |
| §5.2 second congruence | r=2 | Every listed constituent has multiplicity 2; K₁-invariants D₀² | No unjustified multiplicity-one normalization. |
| §5.3 faithful flatness | f=1,2; Frac(O) control | Required grades 2=2,4=4; π∨≠0; Frac(O)/p=0 | Flatness plus nonzero closed fibre needed. |
| §5.4 Banach specialization | Compact k versus flat O | Hom(k,E)=0; Hom(O,E)=E, unit ball O, reduction k | Nonzero residue alone would not suffice; flatness removes torsion. |
| §5.5 arbitrary away levels | V=⟨1+pE₁₂,K₃⟩⊂K₁ | Conjugation adds p²diag(−1,1) modulo p³; V not normal | R05 fixes the group-action domain. |
| §5.5 lower-bound invariants | Regular C₂₉-module | Invariants dimension 1⊂29; nonzero pro-p representation has nonzero invariants | Apply in full tower, then take fixed-level invariants. |
| §5.6 Hecke/locality | T=k×k→k | Both T and k send 1↦1, kernel↦0; after localization e₂=0 and e₁=1 | R07. |
| §5.6 reduction of cohomology | O --p→ O | Integral cohomology k in one degree; reduced differential 0, two cohomology groups k | General inverse-limit reduction cannot be assumed. |
| §5.6 inert tower | One versus two p-adic places | Away tensor has 0 versus 1 factors; empty tensor O | Inert specialization retains its hypothesis. |
| §5.7 R=T and CI | O[[x,t]]/(x); full H¹ factor | Quotient O[[t]], codimension 1; faithful module kills only 0; full dual C² has residual multiplicity 2r | CI inference sound; augmentation normalization requires R01. |

## Not verifiable

- No Lean command was run, as required by this read-only pass. There are no declarations to elaborate or compare using #check; the requested signature-context inventory is empty, not an omitted build result.
- The calculations above do not certify the deep arithmetic proofs. In particular §0.6 remains conditional on the missing global component-realization input in R03, in addition to the four properly declared supplier gaps.
- Cached legal text, rather than a fresh visual inspection of every PDF page, was used. Missing reduction bars in extracted formulae are not classified as printed source errors. In particular the torsion-to-lattice formula around BHHMS23 line 4872 is interpreted using its surrounding reduction context.
- Searches covered the provided sibling heads, current named suppliers and the accessible main/Completed copies. They cannot certify ownership against unpublished work. No additional unavailable open pull request was sought.
- No package-cited work was unavailable, waived or newly paywalled. No missing-text request is pending. HW22 was fetched solely to test the suspected first-order input gap; it resolved that suspicion. The read-only roadmap source manifest was not changed.

## Source issues

- **Error** in EGS15 at §6.2, p. 35 (EGS15 lines 1711–1714): the source says the adelic centre uses ψ with its chosen type normalization; it should be ψ⁻¹ with the corresponding Hecke normalization; affects a stated result; corrected in print at BHHMS23 Remark 8.1.3(i)–(ii), pp. 88–89 (BHHMS23 lines 4442–4451).
- **Gap** in EGS15 at §6.2, p. 35 (EGS15 lines 1717–1720): the source says the coefficient cohomology is taken on the unquotiented curve while imposing the full adelic central action; it should be taken on the finite central quotient, with the localized comparison proved; affects the proof; corrected in print at BHHMS23 Remark 8.1.3(iii), p. 89 (BHHMS23 lines 4452–4461).
- **Misprint** in EGS15 at §6.2, p. 35 (EGS15 lines 1758–1761): the source says the Galois lifting is twisted by θ_w⁻¹ composed with determinant; it should be twisted by the Galois character θ_w⁻¹ itself; affects the proof.
- **Misprint** in BHHMS23 at proof of Proposition 8.2.3, p. 92 (BHHMS23 line 4655): the source says both factors of the module fibre product are indexed by 𝒥₁; it should be 𝒥₁ and 𝒥₂, matching the ring fibre product; affects the proof.
- **Misprint** in BHHMS23 at proof of Proposition 8.3.7, p. 100 (BHHMS23 line 5037): the source says the baseline Hom dimension is the residue degree f; it should be the common patched multiplicity r; affects the proof.
- **Error** in BHHMS23 at Theorem 8.3.9 and Corollary 8.3.10, pp. 101,103 (BHHMS23 lines 5070–5073,5145–5147): the source says adjoint Hodge profiles can be chosen independently at every active embedding; it should be the union of profiles with at most one adjoint embedding; affects a stated result.
- **Misprint** in BHHMS23 at proof of Theorem 8.3.9, p. 102 (BHHMS23 line 5107): the source says the type-indexing bijection uses the positive norm-determinant twist; it should be the negative twist already specified after cyclotomic twisting; affects the proof.
- **Error** in BHHMS23 at §8.5, p. 108 (BHHMS23 line 5441): the source says the multiplicity-normalized patched module augments to the full completed-H¹ dual; it should be the multiplicity dual, with two copies giving full H¹ after a basis choice; affects the proof.
- **Misprint** in GN22 at proof of Lemma A.11, p. 45 (GN22 line 2073): the source says the tensor resolution has terms P_i completed-tensored with P_j; it should be P_i completed-tensored with Q_j, resolving the two different modules; affects the proof.
- **Misprint** in GN22 at §A.20, after Lemma A.21, p. 48 (GN22 line 2192): the source says to use an injective A-module resolution to construct the S-valued derived Hom for a B-module; it should be an injective B-module resolution; affects the proof.
- **Misprint** in GK14 at proof of Corollary 5.5.7, p. 35 (GK14 lines 1676–1679): the source says to ramify D at one infinite and one finite place for an arbitrary totally real field; it should ramify at all but the chosen infinite place, with compatible finite ramification of the required parity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6d0add97e86320bbad6d6e9553f90399fbf1f005", "job": "RT-HilbertModularVarietiesAndShimuraCurvesPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
