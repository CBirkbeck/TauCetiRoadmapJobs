<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6398514123 -->
Review (codex) of 892285f

Verdict: needs_changes

1. **F01** (P1) Springer geometry already has an owner

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:590`, also lines 7, 575 and 612: “define 𝒩̃=G×ᴮu” and “The map μ is the Springer resolution”.

   **Claim:** The package owns and constructs the nilpotent cone, Springer incidence resolution and cotangent identification without importing their existing owner.

   **Witness:** `TauCetiRoadmap/NilpotentOrbits/README.md:129` (N1) and line 390 (N7) already construct this cone, incidence scheme, cotangent isomorphism, proper birational morphism and scheme fibres over complex adjoint semisimple groups.

   **Exact repair and test:** Import N1, N5.0 and N7 by name and section in Scope and the supplier contract. Delete the repeated construction in that scope. State explicitly the additional arbitrary-characteristic-zero-field and reductive-centre comparison targets, using the existing objects and maps, and retain the new double-incidence/conormal comparisons. Do not assign a second owner to the complex construction. On PGL₂ over C, both descriptions give the cone a²+bc=0, total space O_P¹(−2), fibre P¹ at zero and one flag over a regular nilpotent. The proposed adapter preserves precisely those objects; it does not construct another resolution. NilpotentOrbits has a narrower initial field/group scope, so this finding does not say its theorem alone supplies the entire general-field extension.

2. **F02** (P2) The Lie-invariants gap requests existing characteristic-zero results

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:53` and the `lie-invariants` entry of `packages/SpringerResolutionAndCharacteristicCycles/design/plan.json`: “in characteristic zero with Chevalley restriction, polynomial invariants ... and unique regular-nilpotent flags”.

   **Claim:** These are all missing inputs to be supplied anew by ReductiveGroups.

   **Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:594`–616, F4.3 at its open head, supplies characteristic-zero coaction-invariant restriction, polynomial generators, central factors, field descent and the unique Borel containing a regular nilpotent.

   **Exact repair and test:** Import F4.3 for those characteristic-zero statements; it is already an allowed supplier through F2.2. Remove those clauses from both copies of the gap. Resolve the reduced nilpotent fibre against NilpotentOrbits N5.0, using a separately stated field adapter if needed. Retain only genuinely missing Lie/root-wall/regular-cover inputs, with their field and p>h hypotheses, and distinguish the individual requested statements. For sl₂ the invariant is a²+bc; for a torus restriction is the identity and the zero fibre is the origin. F4.3's central-factor and descent clauses cover these tests. This is a nonminimal-contract finding, not a complaint that an announced gap has not yet been filled.

3. **F03** (P2) Associated-bundle ownership is not reconciled

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:61` and the matching `associated-bundle-descent` plan entry: “Descend finite-rank representations along representable fppf torsors to associated bundles ... and arbitrary base change”.

   **Claim:** The generic associated-bundle construction is a new AlgebraicVectorBundles prerequisite, without resolving its existing geometric and linear owners.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2589` supplies contracted products and base change. `TauCetiRoadmap/AutomorphicBundles/README.md:520`–558, B0.4 at its open head, supplies finite-locally-free associated modules and their geometric comparison.

   **Exact repair and test:** Consume SchemeAndStackFoundations §1.16 for the geometric contracted product and §1.1 for descent. Make the residual gap explicitly about the missing linear/subbundle/incidence comparisons, with a flat affine group scheme, a representable torsor, and a finite locally free representation specified. Record transfer of the generic linear comparison from AutomorphicBundles B0.4 to the earlier AlgebraicVectorBundles contract, so AutomorphicBundles consumes that owner. Do not add AutomorphicBundles as a supplier: it is line 228 of the merge order, after this package at line 70. This report records the required ownership move; it makes no edit to either roadmap. Test the inverse-action convention on the frame torsor of O(1): weights 1, −1 and 0 give O(1), O(−1) and O, respectively, in both existing constructions. The residual comparison must preserve these three different bundles.

4. **F04** (P2) The local-geometric gap repeats supplied finiteness theorems

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:67` and the `local-geometric-comparisons` plan entry: “proper quasi-finite finiteness and finite birational comparison to a normal target”.

   **Claim:** Both results require new supplier work.

   **Witness:** `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372` proves `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5530`–5535 supplies `IsModification.isIso_of_isFinite` for normal integral targets.

   **Exact repair and test:** Delete these requests from the gap and cite the native theorem and SchemeAndStackFoundations §4.11. For §3.9, retain the proper, integral, birational, normal and quasi-finite hypotheses needed to apply them. Keep only the genuinely missing completed-prime equidimensionality and scheme/cycle comparisons, with their precise hypotheses. A scratch theorem with arbitrary schemes and a proper locally quasi-finite morphism closes by one `exact` using the pinned theorem, with no extra assumptions. On the regular-locus component projection its generic degree is 1; the finite normal modification comparison gives the required isomorphism. The identity map gives the boundary test of degree 1 and an unchanged local ring.

5. **F05** (P2) Global good filtrations are restricted to flags unnecessarily

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:837`–839: “admits good filtrations locally” and “on the flag varieties used here such generating subsheaves exist”.

   **Claim:** In the stated general smooth separated finite-type setting, only local existence is promised; global existence is secured for flags.

   **Witness:** M23 line 771, Proposition 3.25, p. 15, proves global existence. Lines 777–784 extend finitely many local coherent generators and sum them; quasi-projectivity is not required.

   **Exact repair and test:** State global good-filtration existence for every coherent D_Y-module on every Y in the subsection's hypotheses. Use the already cited SchemeAndStackFoundations §0.4 extension theorem, a finite affine cover and the finite sum of the extended generating subsheaves. State global bounded comparison as well, by taking the maximum of finitely many local bounds. On a cover of s affines this constructs s coherent pieces and one coherent generating sum; on A¹ the order filtration of D and the filtration of O both exist globally, with the latter's shift by 1 having comparison bound 1. This removes a route-specific restriction without strengthening the field or smoothness assumptions.

6. **F06** (P2) Characteristic cycles omit coherent modules used by their own API

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:872` and line 1048: “whose reduced characteristic support is empty or pure n-dimensional”; “Ch(M) and CC(M) are invariant”.

   **Claim:** CC is defined only with holonomic-dimensional support, while §9.8 uses it for every strongly equivariant coherent D-module. The general coherent theory promised in Scope is absent.

   **Witness:** On Y=A¹, H={1}, M=D_Y is strongly equivariant and coherent. Its graded module is k[x,ξ], characteristic dimension 2, and generic length 1; §8.6 excludes it although §9.8 applies.

   **Exact repair and test:** Define CC for every coherent D-module as the sum over all irreducible characteristic components, in the ungraded cycle group or direct sum of dimension-graded groups. Prove filtration independence in that generality, as M23 Definition 6.40 and Proposition 6.41, pp. 55–56, M23 lines 2728–2768 do. Specialize to degree n for holonomic modules. Keep §9.5 additivity on its holonomic domain; do not assert unrestricted additivity for mixed-dimensional characteristic cycles. The repaired definition gives CC(D_A¹)=[A²], CC(O_A¹)=[ξ=0], CC(D/Dx²)=2[x=0], and CC(0)=0. The formerly undefined trivial-group invariance statement now reads [A²]=[A²].

7. **F07** (P2) Group characters are not the lattice of highest weights

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:1256`, also lines 26, 1088 and 1090: “a simple highest-weight module whose weight is a G-character”.

   **Claim:** The integrability input is restricted to algebraic characters of G, yet is used for the principal highest weights and for the ample-weight argument.

   **Witness:** For SL₂, X*(G)=0 but λ_e=−2ρ=−α is nonzero. The Check at line 1269 needs integration of this weight to B. It is a T-character, not a G-character.

   **Exact repair and test:** Define the lattice to be X*(T) for the actual isogeny form of G, with its differential in t*. Replace “G-character” by “weight in this character lattice”; add dominance on the Levi where needed. Separate it from X*(G) and from the full abstract Lie weight lattice. For SL₂, λ_e=−α has pairing −2 and integrates to B; λ_s=0 has pairing 0 and integrates to G. For PGL₂, ω is excluded but 2ω belongs to X*(T). These tests retain the intended isogeny restriction and make the input applicable to the package's own simple modules.

8. **F08** (P3) The characteristic-two Check changes the quotient being tested

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:1330`: “in char 2 becomes (x−y)² so graph reducedness assertion cannot be extended blindly”.

   **Claim:** The actual Cartan invariant fibre product for SL₂ in characteristic two is the double line obtained by reducing x²−y².

   **Witness:** In characteristic two, W acts on the SL₂ Cartan by −1=1. Thus k[t]^W=k[t] and t×_(t/W)t is the reduced diagonal Spec k[t]; the two Weyl graph labels coincide.

   **Exact repair and test:** Replace the negative control by the actual invariant quotient calculation: diagonal ring k[t], nilradical 0, and coincident e/s graphs. If retaining the double line, explicitly identify it as reduction of the integral square-invariant quotient, not invariants formed after reduction. Its ring k[x,ε]/ε² has ε≠0 and ε²=0, whereas the actual characteristic-two fibre product has ε=0. This is a false Check outside the theorem's characteristic-zero hypotheses, not a counterexample to that theorem.

9. **F09** (P3) Correct the sampled locators and supply the strong-equivariance locator

   **Location:** `packages/SpringerResolutionAndCharacteristicCycles/README.md:136`, line 452, line 1039 and line 1362; also the completion citations at lines 73 and 1345: “p. 309”; “pp. 565–568”; “Remark 2.4.3”; “Proposition 2.5.3(ii), p. 327”.

   **Claim:** These cited locations directly contain the relative-orbit construction, kernel-generation assertion, general strong-equivariance definition and smoothness statement, respectively. The completion contract also attributes map-level comparisons to §§1.13–1.15.

   **Witness:** BHS19 line 470 is p. 310; BR12 line 1579 is p. 571; BHS19 lines 901–910 discuss flag induction; BHS19 lines 1116–1121 state Proposition 2.5.3 on p. 326. DeformationAndDerivedPatchingAlgebra places local-completion maps in §1.16.

   **Exact repair and test:** Cite BHS19 §2.1, p. 310 for relative positions, correcting the related p. 309 citations in §§1.1–1.3. Cite BR12 §2.10, p. 571 for the evaluation-map consequence, retaining the earlier concentration propositions separately. Cite BHS19 Proposition 2.5.3(ii), pp. 326–327, distinguishing statement and proof. Include DeformationAndDerivedPatchingAlgebra §1.16 for the local-map completion/flatness assertion used in §13.3, instead of attributing that particular assertion to §§1.13–1.15. Its test map k[x]_(x)→k[x,y]_(x,y) completes to k[[x]]→k[[x,y]], with closed fibre k[[y]] and dimensions 2=1+1. For §9.8 add an exact source location defining strong equivariance for a general smooth H-action and the differential compatibility; the cited BHS passages use equivariant categories but do not state that definition or its generality. The formula itself passes the point test: G_m weight 0 differentiates to 0, weight 1 differentiates to 1 and is not strongly equivariant. The corrected locations contain the orbit dimensions 1,2, the claimed evaluation surjection and the smoothness bound 3=3. No source text is unreadable here; this is locator/support repair.

Nine findings: one P1, six P2, two P3; seven blocking. The new double-incidence, characteristic-cycle and completion programme is repairable. The overlap with existing Springer geometry should be removed from its ownership, rather than rejecting the distinct programme as a whole. No previous review was supplied.

## Verified sound

The four submitted files, all 69 numbered README target groups, their APIs, Checks, conventions, proof routes and Needs lines were read. The 15 seeded source targets were checked against the cached legal texts, with the exceptions and corrections recorded below. The full 69-target calculation ledger is retained in scratch; the table here contains the sampled targets, headline groups and every target affected by a finding. A computed example checks consistency and conventions; it does not purport to prove a planned theorem.

The package contains no executable mathematical algorithm, copied source passage detected in the inspected text, sorry'd data, arbitrary Prop stand-in, or `set_option`. The p>h statement is an explicit source hypothesis for component geometry; constructions retain their wider field domains, and §4.2 actually includes positive-characteristic localisation rather than assuming the characteristic-zero result proves it. The exceptions to general-library scope are R05–R06. The strict/generalized central-character distinction and nilpotent-centre convention are retained correctly.

The README has all required principal headings, 14 Layers with Examples and Dependencies, an API for each defined carrier, and at least three discriminating cases for each definition; some concluding Check bullets repeat earlier computations, but do not create Lean padding. Its shape was compared with main's NilpotentOrbits, AlgebraicVectorBundles and SchemeAndStackFoundations. The brief's systematic source identifiers, not local cache paths, are used below.

**Computed adversarial table.** In component-coordinate rows for SL₂ the order is Z_e,Z_s. Here δ=D/Dx, n=dim Y, N=dim U, r=dim T and D=dim G. Every row records actual values or an explicit discrepancy.

| Statement / targets | Instances tried | Values computed on each side, including wrong alternatives | Result / change |
|---|---|---|---|
| Conventions; §§1.1–1.4 | Trivial group, torus, SL₂ | (N,r,D)=(0,0,0),(0,r,r),(1,1,3); flag dimension N=0,0,1; SL₂ orbit dimensions 1=1+0 and 2=1+1 | Sound ranks; R09 page |
| Inverse Weyl convention, §§3.2,5.1 | GL₃ three-cycle, a nonabelian Weyl group | w⁻¹(1,2,4)=(2,4,1), whereas w(1,2,4)=(4,1,2) | Correct inverse |
| §1.5 subbundle intersection | Coordinate lines, equal lines, dual-number base | Intersections 0 and ke₁; over k[ε]/ε² the intersection is (ε)e₁ despite fibre dimension1 | Reduced-base assumption excludes the bad model |
| §2.3 properness/regular cover | SL₂ semisimple and nilpotent regular elements; torus | Geometric flag counts 2,1,1; regular nilpotent q-fibre can have length2, so regular does not mean étale | Statement distinguishes regular from regular semisimple |
| §3.1 double incidence | Torus; GL₂ opposite coordinate flags; zero operator | t×_t t=t, dimension r, versus erroneous t² dimension2r; common operators diagonal, dimension2; zero allows all F² | Pullback definition correct |
| §§3.3–3.4 incidence bundle | SL₂ e,s | Base/fibre dimensions (1,2),(2,1); totals 3=3 in both cases | Sound |
| §§3.7–3.8 reduced lci | SL₂, torus | Ambient dimensions5,r minus equation counts2,0 give3,r; SL₂ local equation (x−y)(2a+b(x+y)) has distinct generic factors of multiplicity1 | Sound in stated characteristic range |
| §3.9 birational projections | SL₂ e,s; torus | Each component projection degree1; whole regular-semisimple q degree2; torus identity degree1 | Sound statement; prerequisite ownership R04 |
| §4.1 Cartan fibre dimension | SL₂; torus | Fibre dimension D−r=3−1=2; r−r=0 | Source and formula agree |
| §4.2 CM proof input | A₁ p=2,3,5; Weyl algebra over F₃ | 2>h false, 3>h and 5>h true; [∂³,x]=[∂,x³]=0; pairings for λ=0,2ρ are1,3, hence regular/excluded | Real characteristic-p input present; R09 locator |
| §§4.3–4.4 spreading/flatness | Flat DVR scheme with escaping generic component; isolated point plus A¹→A¹ | Special fibre CM dimension0 does not control generic ring Q[x,y]/(x²,xy), depth0<dimension1; global fibre dimensions0=1−1 can coexist with local0≠1+0 | Package includes scaling/specialization and correct local dimension condition |
| §5.4 normality | SL₂ components versus their union | Each component smooth dimension3; union has two intersecting branches and is not normal | Component assertion, not union assertion |
| §§6.1–6.2 nilpotent cone/resolution | PGL₂/C; torus; gl₂ centre | Cone a²+bc=0 dimension2; Tot O(−2) dimension2; fibres P¹ and point; torus cone point; gl₂ trace form nondegenerate, Killing form kills centre | Mathematics sound; R01/R02 ownership |
| §6.3 signed cotangent/conormal map | SL₂, torus | (−ψ)+ψ=0 versus2ψ; cotangent product dimension4 versus Grothendieck product6; torus cotangent point versus t² dimension2r | Correct sign and carriers; R01 owner |
| §§6.4–6.6 Steinberg comparison | SL₂ e,s; reduced point versus thickening | Component dimensions2,2 and intersection dimension1; reduction k[ε]/ε²→k changes generic length2 to1 | Scheme equality kept separate from support equality |
| §§7.1–7.4 component/module/zero-fibre cycles | Axes; dual numbers; SL₂ | Top groups Z²; lengths2=1+1; [X̄_e]=(1,0), [X̄_s]=(1,1), [Z_s]=(0,1); zero-fibre depth=dimension2 | Multiplicities and support separation sound |
| §8.1 coherent D-modules | Point, A¹, δ | D_point=k; [∂,x]=1; D has D-rank1 but infinite O-rank; ∂δ≠0 | D-coherence is not O-coherence |
| §§8.2–8.3 filtered structure | O_A¹,D_A¹, constant all-integer filtration | Order ranks1,2,3; gr O=k[x] with ξ=0; gr D=k[x,ξ]; constant filtration gives gr0 but violates bounded-below | Wrong filtration excluded |
| §8.4 global good filtrations | s affine charts on noetherian Y; shifted O | s extended coherent pieces give one finite coherent generating sum; shift-by-1 comparison bound1 | R05: source proves global existence on all stated Y |
| §§8.5–8.6 supports and cycles | O,δ,D,D/Dx²,zero | Supports ξ=0,x=0,A², x=0,empty; cycles [ξ=0],[x=0],[A²],2[x=0],0; dim Ch(D)=2≠1 | R06: extend CC beyond holonomic dimension |
| §§9.1–9.2 transfer/Kashiwara | Point→A¹, identity, double δ | x∂ʲδ=−j∂ʲ⁻¹δ; ker x=k, coker x=0; Tor₁=k,Tor₀=0; Li*δ[−1]=k degree0; double δ kernel dimension2; identity shift0 | Correct sign, Tor index and shift |
| §9.3 Bernstein inequality | O,δ,D on A¹; point | Characteristic dimensions1,1,2≥1; at point0≥0; finite-dimensional nonzero Weyl module would give trace commutator0≠dimension | Correct nonzero/componentwise bound |
| §9.5 length and additivity | D/Dx²; zero module | Length2=1+1; CC2[fibre]=[fibre]+[fibre]; length zero=0 | Sound holonomic statement |
| §§9.6–9.7 intermediate extension/regularity | G_m⊂A¹, trivial and exponential connections | j_!*O=O_A¹; j_+O=O[x⁻¹], quotient δ; exponential has −dt/t², pole2>1; trivial connection pole0 | Distinct extensions and regularity detected |
| §9.8 strong equivariance | G_m on point weights0,1; H=1 on A¹ | Differential0=zero tangent action; differential1≠0; H=1 permits D_A¹ and hence needs CC=[A²] | Definition passes; R06 domain and R09 source |
| §9.9 orbit classification | SL₂ diagonal action on P¹×P¹ | Two orbits, connected stabilizers, two simple trivial orbit connections; signed moment −ψ+ψ=0 | Hypotheses and moment support agree |
| §§10.1–10.2 localisation | Torus, SL₂ | Torus U_χ=k; Γ(O_P¹)=k,H¹=0; ordinary BB parameterρ; generalized k[z]/z² has nonzero z, excluded from strict χ=0 | Strict/shift convention sound; weight vocabulary R07 |
| §10.3 one-to-two-flag induction | Torus, O_F, δ_eB | Identity on torus; Ind O=O_F², CC=Z_w₀; Ind δ=diagonal direct image, CC=Z_e; inverse Li*=i†[N] | Correct exact restriction and labels |
| §§10.4,11.1–11.2 principal simples and Verma cycles | SL₂; torus | M_e=L_e at−2ρ; M_s has L_e+L_s, L_s=k; Verma cycles(1,0),(1,1); simple cycles(1,0),(0,1); torus1 | Sound; no arbitrary matrix substituted |
| §§11.3–11.4 KL and integral bases | A₁; A₃ BR example | M=((1,0),(1,1)), det1, inverse((1,0),(−1,1)); A₃ polynomial1+q gives1,2,3 at q=0,1,2 | Correct w₀ prefixes and integral basis change |
| §12.1 integrability | SL₂ e,s; PGL₂ lattice | Pairings−2,0 give B,G; −α∈X*(T_SL₂) but X*(SL₂)=0; PGL₂ admits2ω and excludesω | R07 fixes applicable lattice |
| §12.2 parabolic cycle invariance | SL₂ w=s; first flag moved with ψ=E₁₂ | Z_s atψ=0 stable under G; e₁→e₂ makes E₁₂ fail to preserve first flag, so whole Z not stable | Precisely the claimed positive-support invariance |
| §§13.1–13.2 Cartan graphs | SL₂ char0 and char2; torus | Char0 ring(x−y)(x+y) has two reduced lines; char2 actual invariant quotient gives k[t], one reduced diagonal; reduction of integral square quotient instead gives ε²=0,ε≠0 | R08 corrects negative control |
| §13.3 formal graph detection | SL₂ origin on both graphs; flat local polynomial map | On e graph y−x=0 while y+x=2x≠0 formally; reverse on s; k[[x]]→k[[x,y]] has closed fibre k[[y]], dimensions 2=1+1 | Detects label beyond the closed point; R09 completion locator |
| §13.4 tangent bound | SL₂ (e,e),(s,e),(s,s); torus | 1+1+1=3, 2+0+1=3, 2+1+0=3; torus0+r+0=r | Bound and dimensions agree |
| §13.5 smoothness | SL₂(s,e),(s,s); torus | Fixed-space codim1=1−0 or0=1−1; tangent bound/local dimension3=3; torusr=r | Correct sufficient criterion; R09 page |
| §§14.1–14.2 completion | Irreducible node; axes at(1,0); point k² | y²−x²(1+x)=(y−x√(1+x))(y+x√(1+x)); one global component maps to two length1 branches; axes contributions(1,0); 2=2·1; lower-dimensional top cycle0→0 | No branch discarded; closed-point/excellence assumptions retained |
| §§14.3–14.4 completed cycles/KL | SL₂ both components; off Z_s; torus | (1,1)=(1,0)+(0,1); off Z_s, 1=1+0; at nonzero E₁₂, L̂_s=0; torus1=1 | Completed identity agrees with source |
| R03 associated bundles | Frame torsor of O(1), characters1,−1,0 | Associated bundles O(1),O(−1),O; reversed action swaps first two | Existing constructions agree; move ownership |
| R04 local-geometric input | Arbitrary proper locally quasi-finite f; identity | Native conclusion IsFinite f; identity degree1, local rings unchanged; finite normal modification isomorphism | Pinned proof eliminates duplicate gap request |

**Seeded source audit.** All five manifest texts were legally available and readable; there were zero author-flagged unverified locators. Printed pages, rather than PDF extraction page numbers, are used. Source text was read directly; no web excerpt or secondary agent verdict was used as evidence.

| Seeded target | Exact text inspected | Support and limits |
|---|---|---|
| 1.3 Relative position orbits | BHS19 lines 458–474, §2.1, pp. 309–310; lines 565–574, Lemma 2.2.4, pp. 312–313 | Fixed B,T, relative orbit and closure conventions agree; orbit display is p. 310, R09 |
| 3.1 Double incidence | BHS19 lines 506–515, equations (2.3)–(2.4), p. 311 | Actual common-operator incidence and fibre-product identification |
| 4.1 Cartan fibres | BHS19 lines 633–663, Lemma 2.3.1, pp. 314–315 | Fibre dimension D−r, including geometric fibres; uses the source's characteristic range |
| 6.3 Cotangent/conormal | BHS19 lines 911–918, p. 321; lines 1039–1045, p. 324 | Conormals and component closures supported; package correctly replaces the source's erroneous Grothendieck factors by Springer factors and fixes the moment sign |
| 8.1 Coherent modules | M23 lines 469–480, Definition 3.1/Remark 3.2, p. 9 | Quasi-coherent underlying O-module, finite local D-generation; no false O-coherence assumption |
| 8.4 Good filtrations | M23 lines 754–784, Propositions 3.24–3.25, pp. 14–15; lines 843–859, Proposition 3.33, p. 16 | Bounded comparison and exact induced filtrations supported; global existence is stronger than package, R05 |
| 9.2 Kashiwara | M23 lines 2378–2425, Theorem 6.20, pp. 48–49; lines 2491–2510, Proposition 6.24, pp. 50–51 | Closed smooth immersion, set-theoretic support and codimension shift agree; source quotient Tor subscript corrected by package |
| 9.3 Bernstein | M23 lines 2552–2598, proof of Theorem 3.38, pp. 51–52 | Componentwise bound for nonzero coherent module; not just a maximum-dimensional assertion |
| 9.5 Holonomic length/additivity | M23 lines 2686–2693, p. 54; lines 2771–2779, Proposition 6.42, p. 56 | Finite length and characteristic-cycle additivity on the holonomic domain |
| 9.8 Strong equivariance | BHS19 lines 891–910, §2.4/Remark 2.4.3, p. 321; lines 1033–1048, p. 324 | Flag-equivariant categories and action use present; general smooth-group definition and strong/weak distinction not stated there, R09 |
| 10.3 Flag induction | BHS19 lines 901–918, Remark 2.4.3, p. 321; lines 929–941, Proposition 2.4.4, p. 322 | Induction equivalence and characteristic-support setting supported; inverse shift independently checked above |
| 12.2 Parabolic invariance | BHS19 lines 1011–1061, Lemma 2.4.8 and proof, pp. 323–324 | First-flag-only ambient action and positivity argument agree; no assertion of stability of all Z |
| 13.5 Smoothness | BHS19 lines 1116–1121 and 1143–1154, Proposition 2.5.3(ii), pp. 326–327 | Zero operator, closed point, smooth Bruhat closure and codimension equality retained; statement page corrected by R09 |
| 14.2 Completion | BHS19 lines 1157–1199, Lemma 2.5.5, pp. 327–328 | Prime-filtration/generic-length calculation; all completed branches, no normality assumption on Z_v |
| 14.4 Completed KL | BHS19 lines 1200–1211, Corollary 2.5.6, p. 328 | Both w₀ prefixes, missing-component zero convention and completed coefficients agree |

Additional source checks included BR12 Theorem 2.2.1 and Remark 2.11.1 (lines 953–998 and 1586–1626), its localisation/concentration inputs (lines 1054–1141 and 1346 onward), Proposition 2.14.2/Remark 2.14.3 (lines 1700–1759); M23's PBW, cycles and duality passages; G98's multiplicity definition; and ElliottBB Theorems 1–2 and the section/global-generation route (lines 174–190, 227–260, 270–312). The ElliottBB manifest correctly identifies Aron Heleodoro, rather than the host of the copy, as author. No sixth work was fetched, no existing manifest entry was rewritten, and no missing-reference request was created.

**Pinned declarations and acceptance-file checks.** Content revision inspected: `1ce5c4f05d1387e8830ae981f7d34d74ba931a89`. The library revisions in its manifest are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All library evidence below is from those pins, not a latest online library.

| Native object opened | File and line at the pin | Actual definition/hypotheses relevant here |
|---|---|---|
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally affine locally ringed space; smoothness, separatedness, finite type and Noetherianity are not fields of this bare carrier |
| `CategoryTheory.Limits.pullback` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean:96` | Categorical pullback under `HasPullback`; no reducedness or dimension assertion |
| `AlgebraicGeometry.AlgebraicCycle` | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44` | Body `Function.locallyFinsupp X R`; no dimension grading or rational equivalence |
| `Module.length`; `Module.length_eq_add_of_exact` | `Mathlib/RingTheory/Length.lean:30`, line 168 | Extended-natural length; additivity assumes injective first map, surjective second map and `Function.Exact` |
| `Finsupp.linearCombination` | `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:52` | Actual linear map from finitely supported coefficients; integer negatives allowed |
| `AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:171` | Compatible quotient inverse limit; does not itself supply scheme equidimensionality or a D-module completion |
| `LinearMap.ker`; `Module.finrank` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Kernel is `comap f ⊥`; finrank uses cardinal-to-natural conversion, whose infinite-rank default is 0. The package uses finite-dimensional Lie/tangent spaces |
| `SymmetricAlgebra` | `Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean:50` | Quotient of tensor algebra by commuting generators; not a sheaf/cotangent construction |
| `SheafOfModules`; `DerivedCategory` | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:31`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Sheaf condition and native universes; derived category requires an abelian category and `HasDerivedCategory` |
| `IsFinite.of_isProper_of_locallyQuasiFinite` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372` | Exactly the needed proper/local-quasi-finite implication, R04 |
| `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` | `TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48` | Full subcategory defined by finite presentation; coherent O-modules only after the local Noetherian hypothesis, not coherent D-modules |
| Scheme tensor/internal Hom | `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:52`, line 63 | `Scheme.Modules.instMonoidalCategory` and `instMonoidalClosed`; ordinary commutative structure-sheaf modules |
| `SheafOfModules.dual` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean:104` | Internal Hom into the tensor unit; does not assert biduality for arbitrary coherent modules |
| `TauCeti.VermaModule` | `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`, binders at lines 140–146 | Actual quotient with characteristic-zero, finite-dimensional Killing-semisimple Lie algebra, split Cartan, chosen root base and weight; not general reductive category O |

Object searches included differential operators, modules over their sheaf, filtrations, characteristic varieties/cycles, Springer/Steinberg incidence, cotangent/conormal schemes, invariant rings, generic lengths and completion. Native schemes, a cycle function group and a Verma quotient do not by themselves provide the missing geometric constructions. No existing native statement of the package's actual incidence/cycle headlines was found in those searches. The generic pieces that are present are identified above and in R04.

`lake env lean` on the absolute package `Suggested.lean` path, run from the pinned content checkout as required, exited 0 with **no diagnostics**, including no warnings. The file has one `import Mathlib`, one module docstring, the required namespace, and **zero definitions, instances or theorems**. Consequently the per-declaration `#check @name` comparison and one-tactic padding probe have an empty candidate set; there is no skipped admitted theorem. A separate scratch file checked all 13 cited Mathlib signatures in the table and proved the proper/quasi-finite implication by one `exact`; it also exited 0. No Tau Ceti import or targeted build was needed. No library or package signature was changed.

The README's headline groups and the docstring's explanations match as follows. Each actual statement needs a substantial geometric carrier or functor, not a few simple predicates on the pinned Scheme type. None should be replaced by a theorem about an arbitrary matrix, scalar family or bare Prop.

| Headline group | README | Missing carrier named in the module docstring |
|---|---|---|
| Proper resolution and regular Weyl cover | 2.3 | Flag quotient, Borel Lie bundle and operator map |
| Reduced lci double incidence | 3.7–3.8 | Actual incidence scheme and Weyl closures |
| Birational projections | 3.9 | Component projections and regular Lie open |
| CM components and flat Cartan maps | 4.2–4.4 | Integral graph closures and Cartan morphisms |
| Geometric normality | 5.4 | Weyl-labelled incidence components |
| Springer and Steinberg conormals | 6.2–6.6 | Nilpotent cone, Springer map, scheme cotangent/conormal objects |
| Filtration-independent characteristic cycles | 8.2–8.6 | D-sheaf, good filtrations and cotangent graded sheaf |
| Kashiwara and Bernstein | 9.2–9.3 | D-module categories, transfers, characteristic support |
| Holonomic length and intermediate extension | 9.5–9.6 | Holonomic heart and image-extension functor |
| BB/principal-block equivalences | 10.1–10.4 | D-sheaf, localisation and strict category O |
| Verma/simple/component cycle bases | 11.1–11.4 | Localised Verma/simple objects and Springer cycles |
| Parabolic invariance | 12.2 | Highest-weight parabolic and actual incidence action |
| Formal graph detection | 13.3 | Incidence, Cartan graphs and completed maps |
| Tangent bound/smoothness | 13.4–13.5 | Actual incidence and Bruhat tangent spaces |
| Completed module/KL cycles | 14.2–14.4 | Zero-fibre sheaves, coefficients and completed schemes |

Thus the empty acceptance file is justified at these pins; it is not itself a finding or padding. R05–R06 repair README generality, not by introducing surrogate Lean statements.

**Supplier and ownership audit.** Every Needs line was read. Supplier names were checked against main, and new-roadmap suppliers against the open heads available through `roadmaps show`. Revisions of existing roadmaps were not used instead of main. Searches used `roadmaps grep` by object and local pinned-source searches; exact source passages were then opened. The board's 19-package index was read before considering absence. The two inaccessible relevant board heads are explicitly excluded from the ownership conclusion below.

| Supplier / object | Citation resolved and text opened | Audit conclusion |
|---|---|---|
| ReductiveGroups | Main README lines 227–248 (Layers 2–3), 627–660 (7), 1023–1108 (8–9), including represented Borels at 1040–1041 | Lie/quotient/root/Bruhat/integral substrate exists. A Bruhat decomposition alone is not all closure-order or regular-cover theory; genuine residual gaps remain |
| AlgebraicVectorBundles | Main README lines 215–369, L0A–L2B | Sheaf operations, dual/symmetric powers, relative Spec, Tot(E)=Spec Sym(E∨), linear maps/base change; R03 reconciles the extra associated construction |
| SchemeAndStackFoundations | Main §§0.4, 0.7–0.9, 0.16–0.21, 0.30; lines 602–625, 755–875, 1099–1428, 1956–1983 | Coherent extension, dimensions, spreading, catenarity, CM/Serre and excellent-normal completion are present, with their hypotheses |
| Scheme descent/derived/Azumaya/cycles | Main §1.1 lines 2071–2082; §1.16 lines 2589–2622; §2.6 lines 3437–3451; §2.18 lines 3970–3992; §2.22 line 4428 onward; §4.13 line 5643 onward; §5.1 lines 6567–6583 | Named sections exist and concern the stated objects. Finite-type graded cycles do not automatically grade completed local spectra |
| Finite normal modification | Main SchemeAndStackFoundations §4.11, lines 5530–5535 | Existing exact input omitted from the package, R04 |
| EnhancedDerivedSheaves | Main README lines 429–457, 492–504, 549–553, 580–618; §§0.1–0.4, E1.3–E1.4 | Additive noncommutative K-injectives distinguished from commutative tensor. The named bimodule-action extension is genuinely additional; it is not an unowned prerequisite |
| RepresentationTheory/LieHighestWeight | Main Layers 3–4, 7, 9; lines 405–550, 931–977, 1432–1464, 1495–1503 | PBW, semisimple Verma/simple modules, central characters and reductive central scalar parameter; does not itself provide the package's strict equivariant category O |
| FormalConnectionsOpers | Open-head F2.2, README lines 179–208; F4.3 lines 594–616 | All-order operators and PBW correctly imported; additional invariant owner overlooked, R02 |
| DeformationAndDerivedPatchingAlgebra | Open-head §§1.13–1.15, README lines 299–359; §§3.3–3.4 lines 592–643; §6.7 lines 1292–1315 | Finite-module completion, local miracle flatness, CI and affine generic-length cycles match. Explicit local-map completion is adjacent §1.16 (line 361), included in the locator repair R09 |
| NilpotentOrbits | Main N1 lines 129–154, N5.0 and N7 lines 390–409 | Existing complex cone/resolution owner; R01 imports it rather than repeating it |
| AutomorphicBundles | Open-head B0.4, README lines 520–558 | Generic associated-module construction already planned; later merge position forbids importing it upward, R03 records an ownership transfer |

The existing four slugs `lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons`, `derived-bimodule-sheaves` match verbatim between README contracts and plan gaps, and each has a named supplier. Their mere incompleteness is not a finding. R02–R04 address only nonminimal or conflicting ownership and precise contract scope. The derived-bimodule gap may remain a declared supplier contract. The package's internal route keeps positive-characteristic localisation in §4.2 separate from characteristic-zero flag localisation in Layer 10; the Hecke/KL multiplicity input is an explicit target in §11.3, not a postulated matrix. No existing general owner of its coherent D-module/holonomic/cycle construction was found in the searched main/open texts; smooth, topological and automorphic filtration results returned by the searches are different objects.

The mandated dependency check returned exit 0:

```text
depcheck: 52 roadmaps, 585 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no moved line for this package. The tool checks the declared graph; it does not resolve the undeclared ownership collision with AutomorphicBundles, which is why R03 forbids adding that upward edge. The order file and tooling were not edited.

## Not verifiable

- The board index gives `SchemeAndStackFoundationsPartII` at head `accb0a0` and `VectorBundlesAndIsocrystalsPartII` at `b58d862`. Read-only content requests at those exact heads returned HTTP 404. Their README contents could not be inspected. This is an access/result limit, not evidence that either package is absent. Ownership against those two heads, and against the other separate board heads beyond the index, is not certified.
- The brief's named open roadmap work was searched through the supplied index-backed `roadmaps grep` service, and relevant matches were opened at their heads. This is an object-based audit, not a claim that every file of every named pull request was read. No unsupported “exists nowhere” conclusion is used in a finding.
- No cited source was unreadable, waived or paywall-only. §9.8's missing direct source support is R09, not an inaccessible-source request. No source passage was inferred from a title or search snippet.

## Source issues

- **Error** in BHS19 at Lemma 2.3.2, p. 315 (BHS19 lines 665–672): the source says global dimension and equidimensional fibres suffice for flatness; it should be the local dimension formula, or additional purity hypotheses implying it; affects a stated result.
- **Gap** in BHS19 at Proposition 2.3.3 proof, p. 316 (BHS19 lines 705–707): the source says flatness and a Cohen–Macaulay special fibre make the whole model Cohen–Macaulay; it should be supplemented by a specialization argument controlling points only on the generic fibre; affects the proof.
- **Misprint** in BHS19 at Theorem 2.4.7 proof, p. 323 (BHS19 line 1001): the source says the unprefixed KL polynomial vanishes outside the reversed Bruhat inequality; it should be the polynomial with both longest-element prefixes; affects the proof.
- **Misprint** in BHS19 at Lemma 2.4.8 proof, p. 324 (BHS19 line 1040): the source says the double-flag cotangent bundle is a product of Grothendieck resolutions; it should be a product of Springer resolutions; affects the proof.
- **Misprint** in BHS19 at Lemma 2.5.2 proof, p. 326 (BHS19 line 1107): the source says the Cartan-component generic point belongs to the incidence completion; it should be located in the Cartan fibre-product completion; affects the proof.
- **Error** in G98 at Definition 1.1.12 and Theorem 1.1.13, pp. 5–6 (G98 lines 191–204): the source says multiplicity is rank after tensoring with the reduced component, and is additive; it should be generic local length, which gives multiplicity two for D/Dx²; affects a stated result.
- **Misprint** in M23 at Theorem 2.11 proof, pp. 3–4 (M23 lines 227 and 285): the source says the easily established and inductively proved filtration inclusions in reversed directions; it should be easy F′⊂F and inductive F⊂F′; affects the proof.
- **Error** in M23 at Example 3.34, pp. 16–17 (M23 lines 860–865): the source says the graded sheaf of every nonzero O-coherent D-module is the zero-section structure sheaf; it should be the pushforward of that module along the zero section, retaining its rank; affects a stated result.
- **Misprint** in M23 at Proposition 6.24 proof, pp. 50–51 (M23 line 2500): the source says the quotient by the normal coordinate is Tor₁; it should be Tor₀, while the kernel is Tor₁; affects the proof.
- **Error** in ElliottBB at Theorem 3 proof sketch, p. 9, footnote 12 (ElliottBB lines 290–299): the source says a sufficiently ample twist kills positive cohomology of any quasi-coherent sheaf; it should be applied to coherent pieces with their individual twist bounds; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "892285f723ce22bb5ffb45e26e0a302c36d19cd8", "job": "REV-PKG-SpringerResolutionAndCharacteristicCycles", "model": "gpt-6-astra", "worker": "chris-7"} -->
