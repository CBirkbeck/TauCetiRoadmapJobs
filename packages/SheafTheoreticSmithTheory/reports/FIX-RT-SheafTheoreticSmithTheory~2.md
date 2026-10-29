# Repair report: SheafTheoreticSmithTheory

## RT-SheafTheoreticSmithTheory~2a/F01 (P3) — applied

MR18 §1.1, p.2 → p.1 in README §4.5, References and the MR18 manifest locator. MR18 line 4 marks page 1, lines 20–28 state the product/very-good hypotheses, and line 47 starts page 2. The mathematical hypotheses and reduction argument are unchanged.

## RT-SheafTheoreticSmithTheory~2b/F01 (P3) — applied

Two overlapping module Checks → three discriminating Checks in §0.4: characteristic-p identification versus failure over integers, inverse and norm formulas versus the nonunit image σ↦u, and finite/infinite/zero free modules versus the nonflat residue module. No Lean padding was added. The p=2 and p=3 norm formulas agree with §0.1 and the later nearby-complex examples.

## RT-SheafTheoreticSmithTheory~2b/F02 (P3) — applied

Unjustified application to the free complement → finite-prime-avoidance construction of invariant affine principal neighbourhoods in §0.2. The ModularCurves supplier contract now explicitly uses that construction. Added the scalar-action Check n=x³ at p=3 and n=−x² at p=2, both with D(n)=G_m. ModularCurves Layer 0C item 3 explicitly requires the invariant affine cover.

## RT-SheafTheoreticSmithTheory~2b/F03 (P3) — applied

A supplied generation proof → the API's required hypothesis hg, discharged here for the specified σ. Updated the Tau Ceti contract, §1.2 proof route and generator Check. At the pin, Periodic.lean lines 167, 200 and 302 take hg as an argument; σ and σ² generate C₃, whereas 1 does not.

## Verification and check outcomes

- Acceptance-test elaboration: ran the prescribed `lake env lean` command on `packages/SheafTheoreticSmithTheory/Suggested.lean` from the content checkout. Exit 0; exactly two expected warnings, at lines 61 and 73, that the headline declarations use `sorry`. No Tau Ceti import or preliminary module build was needed.
- Elaborated signatures: created and elaborated one scratch copy with `#check @name` for all six declarations. Exit 0, with the same two warnings. Repeated this check after the module-header repair; all six fully qualified names and signatures are unchanged. Compared every displayed binder with README §§8.1–8.2: the four definitions retain A, its commutative-ring instance and their explicit arguments; both headlines retain primality and periodicity; character extension additionally retains the field, characteristic, perfectness, fixed-subring containment, norm/transfer containment and transfer-annihilation hypotheses. No binder disappeared and no signature change was necessary.
- Dependency check: ran the prescribed `gate --depcheck` command with `--name SheafTheoreticSmithTheory --movable`, the board order and content checkout. Exit 0. Its complete output was:

```text
depcheck: 188 roadmaps, 1236 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Cross-roadmap resolution: `roadmaps resolve` exited 0 against main c994070 and the indexed 415 open roadmap heads. It reported no cross-roadmap citation found nowhere and no Lean name found nowhere. Its library-name check did not have pinned packages available to that service; the relevant declarations were inspected directly in the supplied pinned checkouts instead.
- `git diff --check` exited 0. The source manifest parses as TOML, and the report covers all 65 numbered README targets as well as conventions, declarations and worked examples.
- The library pins used were Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, as recorded in the content checkout's `lake-manifest.json`.
- Module-system warning repaired in `packages/SheafTheoreticSmithTheory/Suggested.lean`: added `module`, made the sole Mathlib import public, and added `public section` to preserve the six existing exported names. Re-elaboration exits 0 with only the two expected `sorry` warnings; the module-system warning is absent. No theorem, definition body or mathematical hypothesis changed. No sources were missing. Don93 remains settled as `uncertified`; it was neither requested again nor treated as a source whose text had been read.
- The changed files are `packages/SheafTheoreticSmithTheory/README.md`, `packages/SheafTheoreticSmithTheory/sources.toml`, `packages/SheafTheoreticSmithTheory/Suggested.lean` and this report. Metadata and the design plan are unchanged. No commits or external writes were made.

## Evidence, ownership and pattern search

The MR18 extraction is the recorded arXiv v3: MR18 lines 20–28 are on its printed page 1. All three instances of the erroneous §1.1 page locator were repaired; other MR18 page locators were retained. The restricted engine still uses products of simply connected quasi-simple and general linear groups with very-good characteristic, and the endpoint still uses all good primes through the stated reductions.

For the affine-cover repair, let P₁,…,Pᵣ be the finitely many orbit primes in B. Each misses some element of I(Z), since its point is outside Z. Finite prime avoidance supplies f outside their union. Every translated factor of n avoids every Pᵢ because the action permutes the orbit. Thus n avoids all Pᵢ, belongs to I(Z), and is invariant since σᵖ=1. Consequently D(n) is affine, invariant, contains the orbit and misses Z. This argument uses arbitrary prime ideals, not merely closed rational points, and leaves the scheme equalizer intact on nonreduced test rings. Empty U requires no opens. This supplies exactly the hypothesis of `TauCetiRoadmap/ModularCurves/README.md`, Layer 0C item 3; the torsor theorem stays with that owner. The general admissible quotient-gluing gap already has its separate owner and is not expanded by this repair.

Searched the whole README for invariant affine opens, free quotients and invariant products. The other consumers are §§2.3–2.5 and 2.7–2.9, all of which use §0.2; §5.4 already uses the invariant-product argument around fixed points. Their statements and computed examples remain compatible. The supplier application in Exact supplier contracts was updated along with §0.2. No generic quotient construction was reassigned.

The algebra identification is justified by (1+u)ᵖ=1 and the inverse u↦σ−1; the p-element bases make it an isomorphism. The added integer control is specifically ℤ[u]/u², where 2u≠0. It does not impose characteristic p on the integral coefficients or on the algebra diagonal in Layer 8. Searched §§0.1, 0.4–0.6, 1.2–1.5, 2.4, 4.10, 8.1 and the worked examples for the same truncated-polynomial and norm conventions; their existing u, u² and augmentation-ideal calculations agree.

At the pins, `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean` lines 167, 200 and 302 expose the generation hypothesis. Lines 322 and 332 use it in the composition identities too. The generator-independent API at line 346 instead chooses a generator using cyclicity; it does not fix this roadmap's specified σ. The repair therefore keeps the explicit-generator API. The only other assertion about its generation proof was the §1.2 route, which was updated with the contract. No module theorem was replanned.

Ownership searches used `roadmaps grep` across main and indexed open heads, together with object searches in the board packages, the supplied sibling checkouts and pinned libraries. The affected generic inputs retain their owners: ModularCurves Layer 0C for free finite quotients, DeformationAndDerivedPatchingAlgebra §7.5 for arbitrary-rank local freeness, and the pinned Tate module API for periodic module comparisons. No new carrier, theorem name or supplier target was introduced here. The invariant-principal-open argument and cyclic algebra calculations are proofs and Checks of this roadmap's existing applications. No fully qualified declaration name was taken from a sibling roadmap.

Cross-roadmap locators were resolved against main for EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4, E3.4, E5:abstract; EtaleCohomologyFoundations F.1–F.3, F.5–F.6, §§0.8, 0.10; SchemeAndStackFoundations §§1.17, 1.21, 1.23; ModularCurves Layer 0C; ReductiveGroups Layers 1, 4, 9, §§10A–10B; ReductiveGroupsPartII §§RG2.0a, RG2.5.1–RG2.5.2. The indexed new-roadmap heads were consulted for EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2, 2.4–2.5, 3.1–3.2, 5.2, 7.3; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.5, 1.8–1.9, 1.14; GeometricSatakeAndFusion GS0; LanglandsParameterStacks LP3.0; DeformationAndDerivedPatchingAlgebra §7.5; AInfCohomology AI.7.2. No new dependency was added. The existing supplier gaps remain explicit prerequisites, rather than claims that the supplying roadmap already proves their extensions.

## Computed adversarial pass

The following are tests of statements and conventions, not proofs of the planned theorems. Unless varied, p=3, k has characteristic 3, O=W(k), A=k[u]/u³, σ=1+u and N=u². A Tate pair means (even, odd). C=[A→u A] is in cohomological degrees 0,1. For the Frobenius tests α²=−1 in F₉ and β³=β+1 in F₂₇. All geometric examples have characteristic different from p; all global assertions retain their specified common support, degree and Tor bounds.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Coefficient and goodness conventions | A₁, G₂; trivial O and k | Highest-root coefficients 1 versus 3,2; 3 is good for A₁ and bad for G₂; O/3=k but char O=0 | Survives | None |
| Cyclic differential and shift conventions | A; k[1]; O | (σ−1)N=u³=0; 1−σ=−u; H⁻¹(k[1])=k; trivial O has alternating 0,3 | Survives | None |
| Frobenius direction convention | α and β | α³=−α; β⁹=β−1; (β−1)³=β, (β+1)³=β−1 | Survives | None |
| Universe and bounded-Ind convention | Zero indexing diagram; family k[2n] | Empty colimit=0; H⁻²ⁿ of the family sum is k for every n, so no common finite interval | Survives | None |
| §0.1 coefficient datum | p=2, regular and trivial modules | N=u; ker u=im u=ku; regular Tate=(0,0), trivial k=(k,k), trivial O=(k,0) | Survives | None |
| §0.2 equalizer and free quotient | Scalar action; trivial action; rotation over F[ε]/ε² | (ζ−1)x=0 gives x=0; trivial U=∅; fixed triples=(a,a,a); G_m quotient degree p, derivative pxᵖ⁻¹ a unit | Survives | Cover proof supplied |
| §0.2 invariant affine cover | f=x, p=2,3; general orbit primes | Products −x² and x³ have D(n)=G_m; for each orbit prime Pᵢ, n∉Pᵢ and n∈I(Z), so orbit⊂D(n)⊂U | Survives | New Check |
| §0.3 geometric equivariance | Point; free three-point orbit; unbounded sum | D(A) at a point; pushforward regular rank 3 has N(e₀)=e₀+e₁+e₂; unrelated trivial k³ has N=0; family degrees −2n unbounded | Survives | None |
| §0.4 algebra identification | F₂[u]/u²; ℤ[u]/u²; k[u]/u³ | (1+u)²=1 versus 1+2u; (1+u)(1−u+u²)=1; N=u at 2 and u² at 3; u³=0 so u is not a unit | Survives | Replaced Checks |
| §0.4 arbitrary-rank flatness | A, A^(ℕ), 0 and k | Free ranks 1, ℵ₀, 0; Tor₁ᴬ(k,k)=k≠0 excludes k | Survives | Replaced Checks |
| §0.5 flat/perfect complexes | A; k; C | Tor interval of A=[0,0], C=[0,1]; H⁰(C)=ku² and H¹(C)=k, both nonflat; k has nonzero Tor in all positive degrees | Survives | None |
| §0.6 stalk criterion | C at every stalk; disjoint shifts k[n] | C⊗ᴸk=[k→0 k] in [0,1]; individual shift intervals {−n} have no common bound | Survives | None |
| §1.1 Tate localization | A, k, O; cone(id) | Images have Tate pairs (0,0),(k,k),(k,0); cone(id)=0, so identity is inverted | Survives | None |
| §1.2 two-periodicity | O, O[1]; C₃ generators; finite-level nonflat input | O pair (k,0) repeats after [2], becomes (0,k) after [1]; σ powers 1,σ,σ² and σ² powers 1,σ²,σ; g=1 yields {1}; inversion acts by 2 on H²; Ind(k) is not O/9[C₃]-flat | Survives | Generation route and Check clarified |
| §1.3 internal Tate sheaves | Two points; regular and trivial modules | Sections k² in each parity for k, restriction maps coordinate projections; O gives (k²,0); A gives (0,0) | Survives | None |
| §1.4 connecting map | 0→O→³O→k→0; split sequence | T⁰(3)=0, reduction k→k=id, boundary T¹k→T²O=id up to the fixed connecting convention; split boundary=0 | Survives | None |
| §1.5 trivial coefficient formulas | k⊕k[1]; Oʳ for r=0,1,2 | (k²,k²); (kʳ,0), including (0,0) at r=0 | Survives | None |
| §1.6 stratified integral category | O, O[1], O²; skyscraper on one-stratum P¹ | (k,0),(0,k),(k²,0); skyscraper ranks 1 at its point and 0 elsewhere, so is not locally constant | Survives | None |
| §2.1 operation bounds | A¹→pt; G_m⊂A¹ | Compact H²=A(−1), attaining 2dim A¹=2; nearby H⁰=k,H¹=k(−1), violating a relative-dimension-zero bound | Survives | None |
| §2.2 locally finite type supports | ⊔ℕpt; ⊔ₙAⁿ; empty scheme | Compact sections ⊕ℕk rather than ∏ℕk; second family has H²ⁿ_c=k(−n) for all n; empty compact sections=0 | Survives | None |
| §2.3 induced free-quotient complex | Three permuted points | Pushforward=A, dim 3, N(e₀)=Σeᵢ and Tate=(0,0); trivial k³ instead has Tate=(k³,k³) | Survives | None |
| §2.4 nearby complement | Scalar rotation at origin | C has H⁰=k,H¹=k(−1) and quotient image 0; separate trivial cohomology modules have nonzero Tate groups | Survives | None |
| §2.5 i! versus i* | Identity; origin in A¹ | Identity cone=0; i!k=k(−1)[−2] versus i*k=k, with perfect nearby error and equal quotient images | Survives | None |
| §2.6 Smith functor | Trivial action; free orbit; scalar-action origin | Psm=T*; empty fixed locus gives 0; fixed-origin k gives (k,k) | Survives | None |
| §2.7 kernel pushforward | Free orbit→pt; identity on pt | Compact output=A and Tate=0; identity carries A to A and k to k, preserving kernel without killing k | Survives | None |
| §2.8 operations and projection | Unit; induced factor; A¹→pt | K⊗Λ=K; induced factor has quotient 0; ordinary H⁰(A¹,k)=k versus compact H²=k(−1) | Survives | None |
| §2.9 relative comparison | Free orbit; identity scalar 2; fixed point plus free orbit | Both composites 0; both carry scalar 2 to 2; k⊕A projects to k | Survives | None |
| §2.10 localization | pt⊔free orbit; empty Y | Global k⊕A has (k,k), fixed locus k has (k,k); empty case both (0,0) | Survives | None |
| §3.1 modular Satake extension | Torus; H=PGL₂; integral unit | χ₁χ₋₁=χ₀; dual SL₂ standard weights ±1 and dimension 2; O-unit reduces to k-unit | Survives | None |
| §3.2 standards/costandards | SL₂ at 3, weights 0 and 3 | Δ(0)=∇(0)=k; Δ(3),∇(3) dimension 4 with opposite nonsplit Loewy orders; T(3) dimension 6 | Survives | None |
| §3.3 tiltings | Trivial group; SL₂; torus; zero | End_O(O)⊗k=k; rank T_O(3)=4+2=6; rank Δ_O(3)=4; zero tilting but not indecomposable; O² reduces to two k summands | Survives | None |
| §3.4 tensor and character determination | SL₂ standard V; D=diag(1,2), upper unipotent U | V²=T(2)⊕T(0), dimensions 3+1=4; (DU)₁₂=1 versus (UD)₁₂=2, rejecting full torus restriction | Survives | None |
| §3.5 bounded tilting generation | Torus; Δ(3); zero | Torus Extⁿ=0 for n>0; 0→Δ(3)→T(3)→Δ(1)→0 has dimensions 4→6→2; zero resolved by zero | Survives | None |
| §4.1 JMW condition | A¹; P¹; elliptic curve | Constant ordinary cohomology ranks (1), (1,0,1), (1,2,1); elliptic odd rank 2 fails; dimension pariversity of A¹=1 | Survives | None |
| §4.2 parity predicates | Λ[1] on A¹; O/p on pt; k⊕k[1] | Degree −1≡1 is dimension-even; O/p not free; degrees 0,−1 give parity but neither pure parity | Survives | None |
| §4.3 normalized uniqueness | Point O, O², O[1] | End(O)=O local; Mat₂(O) has idempotent diag(1,0); restrictions of O and O[1] lie in degrees 0 and −1 | Survives | None |
| §4.4 Grassmannian parity existence | Torus; minuscule P¹; Artin–Schreier x³ in geometric char 5 | Generators Λ and Λ[1]; Swan∞=3, χ_c=1−3=−2 and dim H¹=2 for the wild rank-one system, versus 0 for constant A¹ | Survives | None |
| §4.5 parity–tilting and engine | GL₂ at 2,3; SL₂ at 2; G₂ | P¹ generator k[1] perverse with Satake dimension 2; SL₂ at 2 good but not very good since 2 divides 2; G₂ has bad primes 2,3 | Survives | Page locator corrected only |
| §4.6 external products | (P¹)ʳ for r=0,1,2; E⊕E; zero factor | Shifts 0,1,2 and dense rank 1; sum dense rank 2 and decomposable; zero factor gives 0; odd three-cycle sign +1 | Survives | None |
| §4.7 graded Hom/composition | E=O_P¹[1]; point | End_T(E)=k[h]/h², indices 0,1; h² belongs to H⁴=0; point has only index-zero k | Survives | None |
| §4.8 Tate parity | O; O[1]; regular O[C₃]; trivial k | Tate pairs (k,0),(0,k),(0,0),(k,k); k fails integral-even-unit model | Survives | None |
| §4.9 Tate indecomposables | P¹ E; two copies of unit; zero | k[h]/h² has residue k and nilpotent radical (h); Mat₂(k) has rank-one idempotent; zero has no nonzero indecomposable restriction | Survives | None |
| §4.10 ordinary Hom reduction | Hom(O,O); augmentation ideal I | O⊗k=k=Hom(k,k); I^C₃=0 but (I/pI)^C₃=ku² dimension 1 | Survives | None |
| §4.11 normalization | O; O[1]; O[2]; perverse pairs | Dense degrees 0,−1,−2; only O ordinary-normalized; T*O[2]≅T*O; negative pairwise perverse Hom=0 | Survives | None |
| §4.12 lifting | P¹ endomorphisms 1,h,2 | L(1)=1,L(h)=0,L(2)=2; index-zero component of fg is f₀g₀ because all remaining indices are positive | Survives | None |
| §5.1 diagonal Grassmannian | Rotation on X³, including dual numbers; d=1 | Fixed triples=(x,x,x) on every test ring; dimensions 3−1=2 even, whereas at p=2, 2−1=1 odd | Survives | None |
| §5.2 norm functor | Unit; scalar α; rank-two point object | Nm(1)=1; α³=−α; rank 2³=8 includes 2 pure and 6 mixed words | Survives | None |
| §5.3 norm stalk decomposition | Two-element basis; odd basis vector; zero | 8=2 fixed+2·3 free words; three-cycle sign (−1)²=1, transposition sign −1; zero has 0 words | Survives | None |
| §5.4 Smith parity and purity | Trivial/free pieces; d=1; fixed origin | (k,0) and (0,0); source/target shifts 3,1 same parity; codimension-one purity shift −2; fixed scalar line over F[[t]] is Spec F[[t]] | Survives | None |
| §5.5 additive Smith norm on maps | Tensor cube of f+g; scalar 3; α | Two pure terms plus two transfers of three mixed terms; transfers=0 in quotient; 3³ mod 3=0; α³=−α | Survives | None |
| §5.6 categorical Frobenius | β; α; zero | Fr β=β+1, Fr⁻¹β=β−1; D Fr⁻¹β=β, D Fr β=β−1; α alone gives same two directions; 0 maps to 0 | Survives | None |
| §5.7 prime-field form | Torus rank-one generator; coefficients 2 and α | Fr(2)=2, Fr(α)=−α≠α; dimension of Hom remains 1 | Survives | None |
| §5.8 linear BC | Torus identity times β; biproduct; equivariant augmentation control | BC^(p)(βf)=(β+1)BC^(p)(f); BC(βf)=βBC(f); two pure summands survive; invalid equivariant Hom changes 0→1 | Survives | None |
| §6.1 hyperbolic CT | Torus; unit; nonmonodromic diagonal | ρ=0 gives CT=id; unit only at weight 0; diagonal test yields k versus k[−2] for the two localizations | Survives | None |
| §6.2 extreme intersection | GL₂ λ=(1,0), ν=(0,1); ν=(2,−1) | Pairing with ρ gives 0 and intersection one reduced point; outside-polytope intersection ∅, so no dimension formula applied | Survives | None |
| §6.3 normalized CT | Minuscule P¹ and tensor square | Open weight Λ(−1)[−1] shifted +1 and point weight Λ[1] shifted −1 are both in degree 0; square multiplicities 1,2,1 | Survives | None |
| §6.4 CT/Smith shifts | Weight pairings ±1; p=3,2; nonfixed tuple | Shift differences ±2 at 3, ±1 at 2; torus difference 0; nonfixed tuple (1,0,0) contributes 0 | Survives | None |
| §6.5 CT and lifting on maps | Torus Hom; P¹ h; scalar 2 | Hom(k,k[2i])=0 for i≠0; CT(h)=0=L(h); scalar 2 remains 2 on both composites | Survives | None |
| §6.6 torus BC | (2,−1,4); β; equal-output-weight matrices | Output 5; linearized β maps to β versus wrong-direction β−1; matrix [[1,β],[0,1]] is unchanged entrywise | Survives | None |
| §6.7 objectwise restriction | Three SL₂ standard factors | (x+x⁻¹)³ has coefficients 1,3,3,1; ch T(3)+ch T(1) gives the same coefficients, total dimension 8 | Survives | None |
| §6.8 equivariant comparison | Standard SL₂, D and U | DU=[[1,1],[0,2]], UD=[[1,2],[0,2]]; torus-intertwining D fails root intertwining | Survives | None |
| §6.9 natural Satake endpoint | Torus; diagonal restriction of three standards | Weights sum 2−1+4=5; restricted tensor dimension 2³=8; identity comparison intertwines both standard root matrices | Survives | None |
| §7.1 CT conservativity | Zero; minuscule finite support | CT(0)=0; lowest-weight summand of the generator has rank 1, so detects its nonzero restriction | Survives | None |
| §7.2 exact Smith norm | Split 1→2→1 dimensions; nonsplit SL₂ Δ(3) | Rank-two tensor cube has two surviving pure lines; torus restriction of Δ(3) has weights ±3,±1 and exact sequence dimensions 2,4,2 | Survives | None |
| §7.3 equivariantization | Trivial group; S₃; discontinuous sign | u₁=0 obeys 0²=0 but 0≠id; P₁₂P₂₃≠P₂₃P₁₂ and (P₁₂P₂₃)³=1; sign is 1 on dense direct sum and −1 somewhere, so kernel not open | Survives | None |
| §7.4 arithmetic descent | Trivial Γ; order-three factor permutation | Trivial action gives original BC; three permutations compose to id and cocycle product uγ γ(uγ) γ²(uγ)=1 | Survives | None |
| §7.5 objectwise integral comparison | Unit; P¹ class h | O-unit reduces to k-unit; F_T(h)=h≠0 while I_kL(h)=0, excluding naturality on all Tate maps | Survives | None |
| §7.6 norm-image comparison | Torus f=[[1,[β]],[0,1]]; scalar 2; arbitrary h | Fixed-word matrices both [[1,β³],[0,1]]=[[1,β+1],[0,1]], unlike ordinary reduction with β; 2³ mod 3=2; arbitrary h gives h versus 0 | Survives | None |
| §8.1 algebra diagonal | ℤ; ℤ[i]; trivial action on dual numbers; rotating k³; nonprime length 4 | Reduction a² mod 2=a mod 2; a+bi↦a+b mod 2 with kernel (1+i); ε³=0; transfer k³=diagonal, quotient 0; length-4 swap transfer=0 but additive defect (x+y)⁴≠0 | Survives | None |
| §8.2 character extension | Trivial F₃[x]; cyclic k³; imperfect F₃(t); ℤ at 2 | Fr⁻¹χ(a³)=χ(a); 1 in transfer excludes characters; χ(x³)=t has no cube root since v_t(t)=1; integer extension is reduction mod 2 | Survives | None |
| §8.3 vector-space/algebra twist | k[x] with F₃[x] form; W=k; β | Linearized x↦x³, scalar β↦β; a⊗μ↦a³μ gives (aλ)³μ=a³λ³μ; forward-source direction gives β−1 | Survives | None |
| `fixedSubring` | Identity, rotation k³, variable permutation | Fixed sets A, diagonal k, and x₀ excluded since σx₀=x₁≠x₀ | Survives | None |
| `cyclicTransfer` | p=0,1,3; rotation k³ | Values 0, a, and (a+b+c,a+b+c,a+b+c); trivial char-3 action gives 0 | Survives | None |
| `cyclicNorm` | p=0,1,3; zero and unit | Values 1, a, diagonal abc; for prime p, Nm(0)=0 and Nm(1)=1 | Survives | None |
| `transferIdeal` | Identity char 3; rotation k³; ℤ at 2; zero ring | Ideals 0, (1), 2ℤ, 0 respectively; fixed b gives bTr(a)=Tr(ba) | Survives | None |
| `algebra_tate_diagonal` | Trivial σ; nontrivial conjugation; zero quotient | a↦a³; ℤ[i] gives a+b mod 2; cyclic product has unique map into zero ring; p=0,1 excluded by primality | Survives | None |
| `tate_character_extension` | A=ℤ, p=2; A=k[x], S=k without norm containment | Unique reduction in first case; without hNorm every evaluation x↦c extends scalar character, so uniqueness fails | Survives | None |
| Worked example: nearby complex | C and its separate cohomology | C has quotient 0 and Tor interval [0,1]; H⁰,H¹ each dimension 1 and nonzero Tate | Survives | None |
| Worked example: ordinary reduction | Augmentation ideal I | Integral invariants 0; reduced invariants ku² dimension 1 | Survives | None |
| Worked example: object versus map | End_T(O_P¹[1]) | k⊕kh, h²=0; lifting h gives 0, reduction h gives h | Survives | None |
| Worked example: torus maps | Weights 2,−1,4 and β | Sum 5; inverse-source composite β, forward-source composite β−1 | Survives | None |
| Worked example: algebra characters | k[x]; k³; k[ε]/ε² | Linearization fixes k, sends x to x³; product quotient 0 has no unital field characters; ε↦0 | Survives | None |

The supplier boundaries were also tested: the native finite-flat theorem applies to free rank 1 but does not cover the explicit infinite-rank A^(ℕ); the §7.5 supplier does. The existing highest-weight gaps retain ranks 4 and 6 for Δ_O(3) and T_O(3), and do not identify them. The uniform adic gap retains O/p=k and common intervals, excluding the unbounded family k[2n]. The arbitrary-geometric-field gap retains ordinary dual-number test rings, on which fixed triples are still diagonal. No new statement or carrier is being assigned to a later roadmap.

## Maintainer consequences

All four findings are settled by local repairs. No supplier-gap slug, Lean declaration name, theorem signature, consumer interface or merge-order placement changed. The deep sheaf comparisons remain the README's targets with the missing carriers identified in `Suggested.lean`; the successful elaboration is not a proof of those targets. Fresh independent review remains necessary.
