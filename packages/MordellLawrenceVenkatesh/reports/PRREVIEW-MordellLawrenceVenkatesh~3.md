# Review of MordellLawrenceVenkatesh (pull request #1231 at 3756140)

**Verdict:** accepted

🤖 Independent AI review. No findings remain. This is an incremental re-review of 40 changed lines since 99154a7, not a new full review. Acceptance means ready for a human's final approval.

## Previous findings

- R01 — repaired: README lines 94–96, 289–294 and §0.18 now import ReductiveGroups §§3A.1–3A.3, retaining the additional stabilizer-dimension formula and scheme-theoretic transporter. The smooth affine supplier is distinguished from the general finite-type extension.
- R02 — repaired: README §§2.1a, 5.14a, 5.21a, 8.12 and 9.3 replace all five undeclared implementation identifiers with mathematical prose. The targets, hypotheses, Checks and five existing Lean declarations remain intact.

## Verified sound

The review checked the complete diff, both previous findings, the changed supplier contracts, the eight affected targets (§§0.18, 2.1a, 3.15, 4.3, 5.14a, 5.21a, 8.12, 9.3), and the uses of the replaced names. No mathematical weakening or new ownership conflict was found. The source sample intersects this work at §§3.15 and 8.12; both locators were reopened. The other 13 sample targets are unchanged and their computed rows are carried below. No locator in the changed passages is marked unverified.

The head is 3756140adba5478705aaf395fda550fe941a026b. The diff outside this roadmap folder is empty, and the worktree remains clean. The original worker gate and the independent scanner gate pass. The independent targeted build of `TauCetiRoadmap.MordellLawrenceVenkatesh.Suggested` passes, as does direct `lake env lean` elaboration. Both produce exactly four declaration-uses-sorry warnings and no other warning. There are no sorry'd data, set-option overrides, stray files or changed imports.

The independent dependency check returned:

```text
depcheck: 205 roadmaps, 1669 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No supplier gap is declared. The changed Needs lines and supplier mentions resolve to the sections below; the orbit construction is consumed from main, not from a revision of an existing roadmap.

**Ownership and supplier evidence.** Object searches used `roadmaps grep`, `roadmaps show`, the pinned sources, the main checkout, the ReductiveGroups board package and the supplied ReductiveGroups open head. The open revision was compared for ownership only; main is the supplier. ReductiveGroups already owns the smooth affine orbit construction, but its cited sections do not assert the stabilizer-dimension formula or the general closed transporter functor. Keeping those additions in §0.18 is consistent with the previous repair. Integral Gauss–Manin extends a field-valued connection; branched transfer extends the supplied unbranched theorem. The renaming adds no new construction or fully qualified declaration.

Locations in the following table are repository-relative. Open-head line numbers may differ by one in tool-rendered copies.

| File | Section and lines read | Verified contract |
|---|---|---|
| TauCetiRoadmap/ReductiveGroups/README.md, main | §§3A.1–3A.3, 264–324 | Actual orbit morphism and scheme stabilizer fibres; geometric reduced locally closed orbit; algebraically closed base extension; finite-union dimension maximum with empty dimension −∞. Smooth affine hypothesis is retained when invoking these orbit models. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md, main | §0.7, 755–787 | Finite-type dimension and base-extension comparison; fibre-dimension formula on integral components. This supplies §0.18's dimension input. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md, main | §2.1, 3265–3295 | Actual derived pushforward; `Sheaf.derivedPushforward` at 3286 resolves the relevant unresolved-name lead. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md | §A4.3, 1899–1940 | Locally free H¹, arbitrary base change, dual pairing; its connection is over a smooth base over a field, so the integral extension remains additional. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md | §§A5.2, A5.6–A5.7, 2557–2586, 2681–2735 | Riemann positivity E(Jx,x)>0, homological form Q=−E, family comparison and homology/cohomology duality. |
| TauCetiRoadmap/DerivedDeRhamCohomology/README.md | §§2.12–2.13, 3250–3309; §5.8, 4510–4592 | Base-linear ordinary forms, pullback and strict filtered sheaf realization, rather than an incorrectly O_A-linear de Rham differential. |
| TauCetiRoadmap/FuchsianOrbifolds/README.md, main | Layer 2, 235–259 | Polygon side pairings, vertex cycles, discreteness and fundamental domains with their hypotheses. |
| Completed/UniversalCovers/README.md, main | Stage 2, 98–125 | Pointed lifting and the deck-group/Galois correspondence used by the polygon construction. |
| TauCetiRoadmap/AlgebraicTopology/README.md, main | Stage 5, 869–899 | Chain transfer, degree identity and deck-sum identity for genuine finite covers. Branch-point descent is the extra argument in §9.3. |

Further related citations were reopened: TauCetiRoadmap/ComplexComparisonPartII/README.md §C4.5 (2261–2293) supplies the affine-curve completion and punctured-surface connectedness input; TauCetiRoadmap/PadicHodgeTheory/README.md §§3.2–3.4 (666–729) supplies the filtered-space and Frobenius-module interfaces; TauCetiRoadmap/JacobianChallenge/README.md Layer D (217 onward) supplies the relative Picard functor and Jacobian construction. These add no new dependency.

The main-roadmap shape was compared with ReductiveGroups, FuchsianOrbifolds and AlgebraicTopology. This incremental check does not repeat the previous whole-document shape audit.

**Source checks.** All four works needed for changed claims were read through the sources service or its legal cache. No source was copied into the PR. FM12 is version 5.0 from the institutional copy already in the cache; the first two attempted URLs timed out or returned 404. Its successful retrieval resolves that new missing-reference record.

| Target | Source locator and extraction lines | Scope checked |
|---|---|---|
| 0.18(ii) | Mil-iAG, Proposition 1.58, p.32; Mil-iAG line 1252–1271 | Transporter is a functor on algebras, testing subscheme containment after base change. The proposition allows an algebraic group and algebraic schemes, not just smooth affine groups or rational points. |
| 0.18(i),(iii) | Mil-iAG (9.40), p.148, line 6033–6044; A.99, p.509, line 21187–21190 | Quotient dimension and the fibre-dimension input. The roadmap computes the image closure from translated stabilizer fibres and does not assume existence of a quotient or descent of a geometric orbit. Reduction and components handle nonreduced/disconnected groups. |
| 2.1a | Stacks Tags 0FMM–0FMN, Lemma 12.1 and Remark 12.2, p.19; Stacks line 814–837 | Base-form filtration and its spectral sequence. The characteristic-zero clause supplies local freeness for general proper smooth families; the abelian-scheme supplier supplies the needed local freeness here over the integral base. The roadmap itself asks for the connection construction and integrability argument. |
| 3.15, seeded and dependent on 0.18 | LV20 v3, Lemma 3.1, p.18; LV20 line 824–834 | Connected analytic continuation plus monodromy equivariance. A point transporter is closed and passes containment from monodromy to its algebraic closure; full monodromy is still needed for density. |
| 5.14a | FM12 §1.1, Theorem 1.2, pp.21–23; FM12 line 830–898 | Hyperbolic polygon and universal cover for closed genus ≥2; cyclic centralizer via the common axis and discreteness. Genus-one centralizers are correctly excluded. |
| 5.21a | FM12 §6.1.1, Theorem 6.1 and Burkhardt generators, pp.171–172, line 5880–5907; §6.3, Theorem 6.4, pp.177–180, line 6085–6108 | Integral elementary symplectic generation. The roadmap explicitly relates its chosen transvections to rotations, mixes and swaps; it does not infer integral generation from field generation. |
| 8.12, seeded and renamed reference | LV20 v3 §8.2.3, p.41, line 1916–1938; §8.2, pp.39–40, line 1832–1848 | Rational Prym/primitive comparison and compatibility with monodromy. The sign and factor q−1 are checked with the supplier convention and transfer identities below. |
| 9.3 | LV20 v3 §8.2, pp.39–40; LV20 line 1832–1848 | Primitive splitting and intersection pairing. The more general branched deck-sum assertion is justified by the roadmap's peripheral-loop quotient of the supplied unbranched transfer, not attributed to an unstated general theorem in LV20. |

**Lean and headlines.** `Suggested.lean` is unchanged. A fresh scratch copy with `#check @name` for all five declarations elaborated. The centralizer definition retains the scalar tower and fixed-scalar hypothesis. Its dimension theorem retains finite-dimensionality, exact fixed field, finite order and bijectivity. Schönflies retains both embeddings. S-units use a Finset of places. Mordell retains smoothness, properness, geometric connectedness, finite-dimensional H¹(O), dimension one and genus ≥2. No signature changed or dropped a needed binder.

The six end theorems are §§4.5, 6.10, 7.9, 10.9, 10.10 and 11.6. The Lean file states S-unit and Mordell finiteness, plus centralizer dimension (§0.4) and Schönflies (§5.2). Its docstring names the other end theorems and absent family, period-map and lifted-action carriers, together with the deeper intermediate headlines. The revision creates no new statable headline omitted from Lean.

The 12 one-tactic probes—`rfl`, `simp`, and `infer_instance` on each of four sorried theorems—failed. Object searches found no pinned one-lemma proof. These tests do not prove mathematical truth, but identify no padding. The one definition has a real body.

Pinned declarations reopened at Mathlib 6b7abb3 and Tau Ceti a91d3aa:

| File and line | Native declaration | Boundary checked |
|---|---|---|
| Mathlib/RingTheory/DedekindDomain/SInteger.lean:65 | `Set.integer` | Valuation ≤1 outside the given set. |
| Mathlib/RingTheory/DedekindDomain/SInteger.lean:108 | `Set.unit` | Actual units with valuation 1; finiteness of the set of places is supplied by the headline binder. |
| TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64 | `AlgebraicGeometry.Scheme.genus` | H¹(O) finrank with a finite-dimensionality guard; it does not itself impose smoothness or properness. |

**Computed adversarial checks for the changed passages and their immediate consumers.** Each row records actual values, including negative controls. They are instance tests, not proofs of the general targets.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.18(i), smooth affine import | GL₂ on A², x=(1,0) and x=0 | Nonzero stabilizer has parameters b,d with d≠0: dim 2; dim orbit closure=2=4−2. Zero stabilizer dimension 4: dim {0}=0=4−4. | Pass; imported orbit construction supplies the same objects | R01 repaired |
| 0.18(i), nonaffine extension | Elliptic curve acting on itself by translation | dim G=1, stabilizer dimension 0, image closure dimension 1=1−0 | Pass without affineness | Generality retained |
| 0.18(i), nonreduced extension | α_p acting on A¹ in characteristic p | Coordinate image at 0 is Spec k[t]/(t^p), reduced closure {0}; dim G=dim stabilizer=0, so 0=0−0 | Pass; scheme length p is not dimension | Generality retained |
| 0.18(ii), rational-point negative control | F₂ translation of V(t²+t); α∈F₄ with α²+α+1=0 | (t+a)²+(t+a) modulo t²+t is a²+a. Values at a=0,1 are 0; at α the value is 1. Transporter is V(a²+a), dimension 0, not G_a of dimension 1. | Pass | New Check discriminates schemes |
| 0.18(ii), infinitesimal and empty controls | Y=Z={0} in A¹; R=k[ε]/ε²; Y empty | Transport equation a=0 excludes a=ε≠0 although reduction is 0. Empty Y imposes zero equations and gives all G. Nonempty Y with empty Z gives no points over nonzero R. | Pass | Scheme containment retained |
| 0.18(iii), finite union | GL₂ zero and nonzero orbits; identity group; empty union | dim union=max(2,0)=2≤4; identity orbit gives 0=0−0; empty union dimension −∞≤0 | Pass | Supplier maximum used |
| 0.18(iii), subgroup closure | Γ=G_a(F₂) and Γ=Z⊂G_a(Q) | First closure V(a²+a) has dimension 0 and orbit closure dimension 0≤0; second closure has dimension 1 and orbit closure 1≤1. Full geometric G_a orbit has dimension 1 in both ambient examples. | Pass; no rational-point density presumed | Generality retained |
| 2.1a | Constant family, coordinate t; zero abelian scheme; identity base change | ∇(t e)=dt⊗e, t∇e=0, ∇²e=0. Rank-zero bundle gives map 0→0. Identity pullback preserves these values. | Pass; connection is base-linear, not O_B-linear | R02 repaired |
| 3.15 (seeded) | Constant family; full Sp₂ monodromy on line filtrations | Constant orbit and image closure both {h₀}, dimension 0. Full action gives P¹, dimension 1; a closed transporter containing dense monodromy contains its closure. | Pass; full-monodromy condition retained | §0.18 still supplies needed transporter |
| 4.3 | L=K_v, rank 2, φ=I; φ=diag(1,2); finitely many filtrations | Scalar φ: A=M₂, dim A=4, line orbit P¹ dimension 1≤4. Distinct-eigenvalue φ: dim A=2, generic torus orbit dimension 1≤2, coordinate orbit dimension 0≤2; finite-union maximum ≤2. | Pass | Bound now cites §0.18 precisely |
| 5.14a | g=1 square; g=2 octagon; nonidentity torus deck element | Angle sums 4·π/2=2π and 8·π/4=2π; Euler characteristics 0 and −2. Torus centralizer Z² has rank 2; compact hyperbolic axis subgroup has rank 1. | Pass; g≥2 excludes the false cyclic claim for the torus | R02 repaired |
| 5.21a | One and two handles, ω(a_i,b_i)=1 | A=[[1,1],[0,1]], B=[[1,0],[−1,1]], det A=det B=1; ABA=[[0,1],[−1,0]]. T_a1 T_a2 T_(a1+a2)^−1 sends (x₁,y₁,x₂,y₂) to (x₁−y₂,y₁,x₂−y₁,y₂). Omitting the mixed vector gives zero inter-handle blocks. | Pass; inverse mix has the Check's +1 entries | R02 repaired |
| 8.12 (seeded) | q=3,g=2; invariant classes of intersection 1 | 2g(C′)−2=3·2+2=8, so genus 5; primitive rank 10−4=6=2·3. Pushforward pairing 2, transported E=−2/(3−1)=−1, Q=1. | Pass; q−1=2≠0 | Branched identity reference resolves to §9.3 |
| 9.3, splitting and pairing | Identity cover; trivial double cover | Identity: projection x−x=0, kernel rank 0. Double cover: push(x,y)=x+y, transfer(z)=(z,z), push transfer(z)=2z; projection ((x−y)/2,(y−x)/2), kernel pairing twice the base form. | Pass in both directions of the direct-sum identification | R02 repaired |
| 9.3, branched deck sum | Genus-two hyperelliptic double cover of S² | H₁(S²)=0, transfer push=0 on Q⁴; involution is −I₄, so I₄+(−I₄)=0 | Pass | R02 repaired |

**Carried adversarial rows.** The following 161 rows reproduce the values for unchanged statements from [the previous report](PRREVIEW-MordellLawrenceVenkatesh~2.md), at head 99154a7. Each row cites that report as “Previous §Verified sound”. They are explicitly carried evidence, not claims that this incremental review recomputed the entire roadmap. Together with the 15 fresh rows above they cover all 166 numbered targets, the three convention rows, every seeded target and all headline statements.

| Statement | Instances tried | Values computed on each side | Result | Evidence |
|---|---|---|---|---|
| 0.1 | E=ℚ(i), splitting field ℂ; inseparable negative control | E⊗ℂ≅ℂ², dimensions 2=1+1; inseparable degree-p tensor has nilpotents, not p distinct factors | Pass; separability matters | [Previous §Verified sound][prev] |
| 0.2 | E=k², M=k²⊕k; empty index | e₁M=k², e₂M=k, dimensions 3=2+1; empty sum=zero module | Pass | [Previous §Verified sound][prev] |
| 0.3 | E=ℂ/F=ℝ, σ=conjugation, φ=σ on one coordinate; φ=0 | Multiplication by a commutes iff a=ā; centralizer ℝ has dimension 1. For φ=0 all ℂ-linear endomorphisms commute | Pass; bijectivity belongs to the dimension theorem | [Previous §Verified sound][prev] |
| 0.4 | Same example; σ=id on k² with φ=id; V=0 | dim centralizer 1≤1²; 4=2²; 0=0² | Pass; Lean headline | [Previous §Verified sound][prev] |
| 0.5 | A=k, k×k, k[ε]/ε² | Unit conditions a≠0; ab≠0; a≠0 for a+bε, respectively; dimensions 1,2,2 | Pass; nilpotents retained | [Previous §Verified sound][prev] |
| 0.6 | Unramified coefficient extension of degree 8, rank 2; rank 0 | Centralizer bound ≤4 independent of 8; rank-zero bound 0 | Pass; ramified extension is outside hypotheses | [Previous §Verified sound][prev] |
| 0.7 | Aff(5), (2,1),(3,4); Aff(2) | Composition (1,4); order 5·4=20, order Aff(2)=2 | Pass; permutation convention fixed | [Previous §Verified sound][prev] |
| 0.8 | Aff(5): identity, translation, multiplier −1, multiplier 2 | Cycle lengths (1,1,1,1,1), (5), (1,2,2), (1,4) | Pass | [Previous §Verified sound][prev] |
| 0.9 | Aff(3)=S₃; q=2 negative control | Centre and permutation centralizer have order 1; normalizer order 6. At q=2 the centre has order 2 | Pass; q≥3 essential | [Previous §Verified sound][prev] |
| 0.10 | q=3, two commutators | Fibres at translations 0,1,2 have sizes 486,405,405; nonzero total 810, quotient by 6 gives 135 | Pass; direct finite computation | [Previous §Verified sound][prev] |
| 0.11 | k=2,N=6; k=4,N=2; N=1 | Counts 24=36(1−1/4)(1−1/9), 15=16(1−1/16), 1=1 | Pass | [Previous §Verified sound][prev] |
| 0.12 | M=(ℤ/5)², standard pairing; B a line or whole M | Line size 5, square 25=#M, pairing zero; whole M size 25, square 625>25, pairing(e,f)=1/5 | Pass; isotropy separates models | [Previous §Verified sound][prev] |
| 0.13 | Reducible symplectic plane; irreducible plane excluded | Minimal invariant line has dimension 1=2/2; an irreducible plane has no proper nonzero invariant line | Pass | [Previous §Verified sound][prev] |
| 0.14 | ω(e,f)=1; v=e, r=2; v=0 | T_e²(f)=f+2e; N²=0; inverse parameter −2; T₀=id | Pass | [Previous §Verified sound][prev] |
| 0.15 | ℤ and 2ℤ in G_a; disconnected finite subgroup | Both closures G_a, dimension 1; finite image has identity component of dimension 0 | Pass; finite index compares components | [Previous §Verified sound][prev] |
| 0.16 | n=1,2,3; n=0 excluded; opposite characteristic | Dimensions 3,10,21 equal n(2n+1); n=0 gives zero algebra, not simple | Pass at stated char 0; source basis typo below | [Previous §Verified sound][prev] |
| 0.17 | Sp₂; zero space excluded | Centre {I,−I}, order 2; Lie centre 0. Sp(0) has order 1 | Pass | [Previous §Verified sound][prev] |
| 0.19 | Powers of T_e over ℚ; characteristic-p negative control | T_e^n=I+nN, infinite parameters; in char p, T_e^p=I and at most p parameters | Pass; char 0 essential | [Previous §Verified sound][prev] |
| 0.20 | e,f in a symplectic plane; parallel vectors | Pairing 1 gives upper/lower root groups and dim SL₂=3; pairing 0 gives only one root group, dim 1 | Pass | [Previous §Verified sound][prev] |
| 0.21 | Two orthogonal symplectic planes; add e₁+e₂; infinite star S={e}∪{f+ne} | Graph components 2→1, closure dimensions 6→10; infinite star pairs with e by 1 and spans ℚ², giving Sp₂ dimension 3 | Pass | [Previous §Verified sound][prev] |
| 0.22 | sl₂ diagonal versus full product | Surjective projections in both cases; dimensions 3 versus 6; kernels 0 versus sl₂ | Pass; both alternatives realized | [Previous §Verified sound][prev] |
| 0.23 | sl₂×sl₂ | Four factor ideals have dimensions 0,3,3,6; diagonal dimension 3 is not an ideal: bracket with (e,0) leaves diagonal | Pass | [Previous §Verified sound][prev] |
| 0.24 | Three sl₂ factors; pairwise diagonal identification | Full product dim 9, total diagonal dim 3; pairwise onto fails on each diagonal pair | Pass | [Previous §Verified sound][prev] |
| 0.25 | Sp₄×Sp₄ with (transvection,I) | Fixed-space dimensions 3 and 4; product dimension 20, graph dimension 10 | Pass; unbalanced pair excludes graph | [Previous §Verified sound][prev] |
| 0.26 | One factor and two factors; diagonal negative control | One factor conclusion dim 3; two independent Sp₂ factors dim 6; diagonal dim 3 fails pairwise test | Pass | [Previous §Verified sound][prev] |
| 1.1 | Trivial rank-two rep versus nontrivial unipotent extension | Both traces 2 on every element; image-algebra rank bound 2d²=8; representations need not be isomorphic | Pass; target compares traces without assuming semisimplicity | [Previous §Verified sound][prev] |
| 1.2 | Rank 0; rank-one weight-zero integral pure characters; nonsemisimple extension | Rank-zero class count 1; rational weight-zero eigenvalues ±1; trivial/unipotent rank-two traces both 2 | Pass; semisimplicity retained | [Previous §Verified sound][prev] |
| 1.3 | ℚ, ℚ(i) | Conjugation identity on ℚ; i↦−i has order 2 on ℚ(i), fixed subfield degree 1 | Pass | [Previous §Verified sound][prev] |
| 1.4 | ℚ(i); ℚ(∛2); ℚ | Maximal CM-or-real fields ℚ(i), ℚ, ℚ; degrees 2,1,1 | Pass | [Previous §Verified sound][prev] |
| 1.5 | K=ℚ(i), primes 2,3,5 | 2 ramified; 3 inert with residue degree 2 and friendly; 5 split with degree 1 and not friendly | Pass | [Previous §Verified sound][prev] |
| 1.6 | Embeddings of ℚ(i), exponents (0,1); totally real ℚ | Conjugate sums 1=1; over ℚ the relation is 2m=w, so w=1 has no integral solution | Pass | [Previous §Verified sound][prev] |
| 1.7 | F=ℚ_p, u=1+p; uniformizer p | χ(Art(u))=(1+p)⁻¹; χ(Art(p))=1, not p⁻¹ | Pass; units/inertia distinction | [Previous §Verified sound][prev] |
| 1.8 | Trivial global character and a principal idele | Every local factor 1, product 1; principal idele's global Artin value 1 | Pass | [Previous §Verified sound][prev] |
| 1.9 | K=ℚ(i), inert place over 3, place-constant exponents | Both exponents m, conjugate sum 2m=w; w=2 gives m=1; w=1 impossible | Pass | [Previous §Verified sound][prev] |
| 1.10 | χ_cyc⁻¹ and its dual | Exponents 1,1 sum 2=weight; dual exponents −1,−1 sum −2 | Pass | [Previous §Verified sound][prev] |
| 1.11 | χ_cyc⁻¹, unit u and uniformizer p | On units η²Art(u)=u²=Norm(u)²; on p left 1, proposed unrestricted right has valuation 2 | Pass as written on units; source error below | [Previous §Verified sound][prev] |
| 1.12 | Jumps −1,+1; zero space; nonstrict bijection | t_H=−1+1=0, mean 0/2=0; rank 0 has no mean; identity from jump 0 to jump 1 has 0<1 | Pass | [Previous §Verified sound][prev] |
| 1.13 | H¹ of a good elliptic curve; ℚ_p(1) | H¹ jumps 0,1: t_H/rank=1/2=w/2; twist gives −1=−2/2 | Pass | [Previous §Verified sound][prev] |
| 1.14 | Induction of the unit from degree-r extension | Rank r, de Rham dimension r; filtration concentrated at 0, t_H=0 | Pass; crystalline variant needs unramified extension | [Previous §Verified sound][prev] |
| 1.15 | Degree-two extension, unit representation; induced twist | Weighted sums 0=2·0; for twist, −2=2·(−1) | Pass; local degrees supply multiplicities | [Previous §Verified sound][prev] |
| 1.16 | Elliptic H¹; dimension-zero abelian variety | Ranks 2 and 0; elliptic Hodge jumps 0,1; determinant has weight 2 and pairing target ℚ_p(−1) | Pass | [Previous §Verified sound][prev] |
| 2.1 | Fixed elliptic A over split degree-two cover; empty cover | Geometric fibre A⊔A, H¹ rank 4=2·1·2; empty fibre rank 0, not A×A as a fibre | Pass | [Previous §Verified sound][prev] |
| 2.2 | Legendre λ=0,2 over ℤ[1/2]; doubled-origin control | Δ(0)=0, Δ(2)=64 a unit after inverting 2; two extensions at the doubled special point violate separatedness | Pass | [Previous §Verified sound][prev] |
| 2.3 | Constant elliptic family with discriminant −64 | Inverting 2 makes Δ a unit; enlarging S again retains the identical generic family | Pass | [Previous §Verified sound][prev] |
| 2.4 | Degree-two split cover, elliptic fibres | E=k², E-rank H¹=2, k-rank=4; F¹ ranks (1,1), total 2 | Pass | [Previous §Verified sound][prev] |
| 2.5 | A¹ over ℤ_p at reduction 0; two coordinates | Residue fibre pℤ_p, not all ℤ_p; m=2 gives (pℤ_p)², reduction identically (0,0) | Pass | [Previous §Verified sound][prev] |
| 2.6 | y′=y, y(0)=1; zero initial value | Coefficients 1/n! and 0; recurrence (n+1)a_(n+1)=a_n | Pass; characteristic-zero denominators | [Previous §Verified sound][prev] |
| 2.7 | exp(z), p=3; p=2, n=2^k | v₃(3^n/n!)≥n/2→∞; v₂(2^(2^k)/(2^k)!)=1, so terms do not tend to zero | Pass; p>2 is used | [Previous §Verified sound][prev] |
| 2.8 | y′=y over ℂ | Ratio of successive absolute terms at z is abs(z)/(n+1)→0; unique normalized solution exp(z) | Pass | [Previous §Verified sound][prev] |
| 2.9 | Constant connection; scalar equation y′=y | T(a,b)=1 or exp(b−a); T(b,c)T(a,b)=exp(c−a), T(a,a)=1 | Pass | [Previous §Verified sound][prev] |
| 2.10 | Noncommuting A=[[1,1],[0,1]], B=[[1,0],[1,1]] | AB=[[2,1],[1,1]]; (AB)⁻¹=[[1,−1],[−1,2]]=B⁻¹A⁻¹ | Pass; opposite-group convention | [Previous §Verified sound][prev] |
| 2.11 | Constant crystalline family; unit Tate line | Transport 1 gives φ_yT=Tφ_0=φ_0; ℚ_p(1) has φ=p⁻¹σ | Instance passes; BO78 locator unread | [Previous §Verified sound][prev] |
| 3.1 | Symplectic plane, a line and the whole plane | Line dimension 1 and orthogonal dimension 1; whole plane dimension 2, pairing(e,f)=1 so not isotropic | Pass | [Previous §Verified sound][prev] |
| 3.2 | Prescribed vector 2e; characteristic two | ω(2e,f/2)=1; inverse-transpose formula PᵀP⁻ᵀ=I also in char 2 | Pass; differs from unprescribed adapted basis | [Previous §Verified sound][prev] |
| 3.3 | Lines ke,kf in k² | Matrix [[0,−1],[1,0]] has determinant 1 and sends ke to kf | Supplied result, not a new proof | [Previous §Verified sound][prev] |
| 3.4 | Graphs in k² and k⁴ | In rank one every 1×1 matrix symmetric; [[0,1],[0,0]] has antisymmetric defect [[0,1],[−1,0]]≠0 | Pass | [Previous §Verified sound][prev] |
| 3.5 | d=1, axes and diagonal | Charts transverse to ke and kf cover ℙ¹; diagonal intersects each axis in dimension 0 | Pass | [Previous §Verified sound][prev] |
| 3.6 | d=0,1; dual-number graph | LGr=Spec k or ℙ¹; graph slope ε over k[ε]/ε² differs from slope 0 despite equal geometric points | Pass; actual functor retained | [Previous §Verified sound][prev] |
| 3.7 | d=0,1,2,3 | Dimensions 0,1,3,6 equal d(d+1)/2; standard charts have those parameter counts | Pass | [Previous §Verified sound][prev] |
| 3.8 | E=k², V=E²; W=k²×0 | Correct component ranks (1,1), total 2; W has ranks (2,0), same total 2 but is rejected | Pass | [Previous §Verified sound][prev] |
| 3.9 | E=k²,d=1; degree-3 field factor | Period dimensions 2=2·1 and 3=3·1; split varieties (ℙ¹)² and (ℙ¹)³ | Pass | [Previous §Verified sound][prev] |
| 3.10 | A¹_ℂ and two disjoint copies | Algebraic and analytic component counts 1 and 2 respectively | Pass | [Previous §Verified sound][prev] |
| 3.11 | Constant A over t=u²; zero family; Legendre | Nontrivial double cover gives image C₂ of dimension 0<6; trivial cover gives image 1; zero family gives Sp₀=1; Legendre closure dimension 3 | Pass | [Previous §Verified sound][prev] |
| 3.12 | Constant transported filtration; changing frame | T=1 gives Φ(y)=F¹, Φ(y₀)=h₀; T sends T⁻¹F¹ back to F¹ exactly | Pass | [Previous §Verified sound][prev] |
| 3.13 | Same constant family; backward deck transport | Period constant h₀; equivariance uses B⁻¹A⁻¹, not A⁻¹B⁻¹, for the two matrices above | Pass | [Previous §Verified sound][prev] |
| 3.14 | Constant frame; scalar horizontal exp series | Coefficients (1,1,1/2,1/6,…) are the same over ℂ and K_v; different evaluations use the same coefficients | Pass | [Previous §Verified sound][prev] |
| 3.16 | f=z₁; zero series | Nonzero f at (a,0,…)=a≠0 for nonzero small a; zero series evaluates to 0 everywhere | Pass; an open polydisk is essential | [Previous §Verified sound][prev] |
| 3.17 | Formal map z↦(z,z²) | Relation Y−X² evaluates to 0 over both fields; image closure is the same parabola of dimension 1 | Pass | [Previous §Verified sound][prev] |
| 3.18 | Full Sp₂ action; constant-family negative control | Orbit ℙ¹ dimension 1 versus constant orbit dimension 0; full-monodromy hypothesis distinguishes them | Pass | [Previous §Verified sound][prev] |
| 3.19 | f=z(z−p) on pℤ_p; m=2 control f=z₁ | Zero set {0,p}, size 2; two-variable zero set {0}×pℤ_p infinite | Pass; curve hypothesis matters | [Previous §Verified sound][prev] |
| 4.1 | Elliptic good reduction; ℚ_p(−1) trace line | H¹ dimensions 2=2, filtration dimensions 2,1,0; trace line has jump 1 and φ=pσ | Pass | [Previous §Verified sound][prev] |
| 4.2 | Constant filtration, φ diagonal | T=id gives identical φ and filtration on both sides; changing filtration alone changes the filtered object | Pass | [Previous §Verified sound][prev] |
| 4.4 | Local degree 8,d=1; constant family control | c≤4<8=period dimension; constant period closure dimension 0 cannot satisfy c<dim Z | Pass; headline criterion | [Previous §Verified sound][prev] |
| 4.5 | d=4 with simple Frobenius spectrum; scalar control | Centralizer dim 8<10=dim LGr₄; scalar centralizer dim 64 fails inequality | Pass; headline hypotheses discriminate | [Previous §Verified sound][prev] |
| 5.1 | Disk, annulus, punctured torus | Types (0,1,0),(0,2,0),(1,0,1); χ=1,0,−1 | Pass; puncture differs from boundary chart | [Previous §Verified sound][prev] |
| 5.2 | Unit circle, identity and reflection | Plane extensions z↦z and z↦z̄ restrict exactly; reflections reverse orientation but remain allowed homeomorphisms | Pass; Lean headline | [Previous §Verified sound][prev] |
| 5.3 | Tetrahedral sphere; triangulated disk | Sphere V−E+F=4−6+4=2, every edge has two faces; disk has boundary edges in one face | Pass | [Previous §Verified sound][prev] |
| 5.4 | Sphere, torus, pair of pants | χ=2,0,−1; formula 2−2g−b gives 2,0,−1; boundary counts 0,0,3 distinguish types | Pass | [Previous §Verified sound][prev] |
| 5.5 | Torus and annulus | Torus matrix [[0,1],[−1,0]], determinant 1; annulus rank-one H₁ has zero form and radical rank 1 | Pass; E=−intersection in Jacobian comparison | [Previous §Verified sound][prev] |
| 5.6 | g=2 closed; g=1,b=1; g=0,b=3 | H₁ ranks 4,2,2; radical ranks 0,0,2 | Pass | [Previous §Verified sound][prev] |
| 5.7 | Torus cut along a nonseparating curve; separating sphere equator | Torus becomes annulus, χ stays 0; sphere becomes two disks, total χ=2 | Pass | [Previous §Verified sound][prev] |
| 5.8 | Torus slopes (2,3) and (2,0) | gcds 1 and 2: first primitive embedded loop, second cannot represent nonzero embedded class | Pass | [Previous §Verified sound][prev] |
| 5.9 | Disk, annulus, three-punctured sphere | Mapping class groups 1, ℤ, S₃; pure three-punctured group 1 versus full group order 6 | Pass | [Previous §Verified sound][prev] |
| 5.10 | Two primitive torus classes e and 2e+3f | gcds 1,1; matrix [[2,1],[3,2]] determinant 1 sends e to 2e+3f | Pass | [Previous §Verified sound][prev] |
| 5.11 | One annular twist; inverse orientation | Lifted angle displacement across annulus 1; inverse twist displacement −1; boundary points fixed modulo ℤ | Pass | [Previous §Verified sound][prev] |
| 5.12 | Torus a,b, î(a,b)=1; separating curve | T_b(a)=a+b; T_a(b)=b−a; matrices as README; separating class gives zero intersection contribution | Pass | [Previous §Verified sound][prev] |
| 5.13 | (2,3),(2,0),(0,0) in torus H₁ | gcd 1,2,0; first represented, second not; zero excluded from the iff | Pass | [Previous §Verified sound][prev] |
| 5.15 | Torus, annulus, disk; sphere negative control | Universal covers ℝ², strip, disk have π₂=0; sphere has π₂=ℤ | Pass | [Previous §Verified sound][prev] |
| 5.16 | Once-punctured torus and closed genus two; torus control | Centres of F₂ and genus-two group are 1; torus centre ℤ², χ=0 excluded | Pass | [Previous §Verified sound][prev] |
| 5.17 | Evaluation at a marked point; local translation supported in a disk | Identity evaluates to that point; supported translation moves it by vector v and is identity outside the disk | Pass; local sections discriminate evaluation from constant map | [Previous §Verified sound][prev] |
| 5.18 | Closed genus two; torus control | χ=−2 gives contractible identity component, π₁=0; torus identity component has π₁=ℤ² | Pass; χ<0 needed | [Previous §Verified sound][prev] |
| 5.19 | Trivial loop and nontrivial push | Trivial loop gives identity mapping class; conjugation by a noncentral loop differs from identity on a crossing generator | Pass; basepoint/loop direction retained | [Previous §Verified sound][prev] |
| 5.20 | Genus-two simple push; noncommuting loop pair | Push is T_left T_right⁻¹; on closed H₁ homologous curves give equal and opposite contributions, net 0 | Pass; kernel of forgetful map, not trivial marked mapping class | [Previous §Verified sound][prev] |
| 5.21 | Annulus cap; three-punctured sphere | Boundary twist integer 1 maps to disk class 0; full puncture permutations give S₃→1 after forgetting all | Pass; kernel not asserted trivial | [Previous §Verified sound][prev] |
| 5.22 | Genus one; genus zero | Image SL₂(ℤ)=Sp₂(ℤ); rank-zero target Sp₀=1 | Pass | [Previous §Verified sound][prev] |
| 5.23 | Configuration of two points on genus-two surface | Base π₂=0, punctured fibre π₁=F₄; kernel injection follows from 0→F₄ term | Pass; use base π₂, not fibre π₂ | [Previous §Verified sound][prev] |
| 5.24 | Degree-n circle cover; degree-one cover | Lift exists iff subgroup nℤ is preserved; deck ambiguity ℤ/n, trivial when n=1 | Pass; general lifting mechanism tested | [Previous §Verified sound][prev] |
| 5.25 | Degree-r lift of annulus twist, r=3 | T_base³ lifts to T_lift¹; exponent 1/r is avoided by divisibility | Pass | [Previous §Verified sound][prev] |
| 5.26 | Constant family of labelled covers over a disk | Base π₁=0, monodromy image 1; continuation around a nontrivial base loop permutes labels by its covering action | Pass | [Previous §Verified sound][prev] |
| 6.1 | ℚ, S={2}; adjoin μ₈ | Solutions t=−1,2,1/2 remain solutions after extension; m≥8 in the enlarged field | Pass; finite generation is supplied | [Previous §Verified sound][prev] |
| 6.2 | K=ℚ(ζ₈), adjoining an eighth root of ζ₈ | Extension ℚ(ζ₆₄), degree φ(64)/φ(8)=32/4=8; only prime 2 ramifies | Pass | [Previous §Verified sound][prev] |
| 6.3 | Cyclic degree-8 extension, generator Frobenius | Order 8 gives one local factor of degree 8; identity Frobenius instead gives eight factors of degree 1 | Pass; inertness condition discriminates | [Previous §Verified sound][prev] |
| 6.4 | λ=−1,1/2,0; char 2 | (Δ,c₄,j)=(64,48,1728),(1,12,1728); Δ(0)=0; char 2 gives Δ=0 | Pass; supplied coefficient model | [Previous §Verified sound][prev] |
| 6.5 | Legendre generators U=[[1,2],[0,1]], L=[[1,0],[−2,1]] | Both unipotent, fixed dimensions 1; independent upper/lower root directions give closure dim 3; integral group excludes −I | Pass | [Previous §Verified sound][prev] |
| 6.6 | Two SL₂ factors, (U,I) | Fixed dimensions 1 and 2 exclude graph; product dimension 6 versus graph 3 | Pass | [Previous §Verified sound][prev] |
| 6.7 | Cyclic Legendre variant m=8 | Eight Sp₂ factors, total dimension 24; each individual factor dim 3 | Pass | [Previous §Verified sound][prev] |
| 6.8 | λ=−2 and 4 | j-values 21952/9 and 35152/9, distinct; numerator/denominator computation retains bad parameters separately | Pass; nonconstant j supports finite exceptional fibres | [Previous §Verified sound][prev] |
| 6.9 | Local degree m=8,d=1 | Centralizer bound 4<8=period dimension; m=1 would give 4<1 false | Pass | [Previous §Verified sound][prev] |
| 6.10 | ℚ, S=∅ and S={2} | Solution counts 0 and 3; latter pairs (−1,2),(2,−1),(1/2,1/2) | Pass; native Lean S-unit headline | [Previous §Verified sound][prev] |
| 7.1 | Empty set; 7-cycle; 8-cycle; fixed point plus 8-cycle | size=0,1,0,1/9 respectively | Pass; threshold is strictly less than 8 | [Previous §Verified sound][prev] |
| 7.2 | Split quadratic and unramified quadratic local algebra | Orbit lengths (1,1) versus (2), equal to local degrees | Pass | [Previous §Verified sound][prev] |
| 7.3 | k[ε]/ε²→k on spectra; degree-two A¹ map | Dimensions 0=0 and 1=1; nilpotents do not change Krull dimension | Pass | [Previous §Verified sound][prev] |
| 7.4 | d=1,r=5, all lines equal versus distinct e,f | Bad locus small diagonal dim 1<5; no line W equals both ke and kf | Pass | [Previous §Verified sound][prev] |
| 7.5 | d=1,r=5, φ^r with distinct eigenvalues | At most two invariant lines; descended ambient bad locus may have dimension 1<5 rather than dimension 0 | Pass; no false claim that bad locus itself is finite | [Previous §Verified sound][prev] |
| 7.6 | d=1, one fixed point plus one 8-cycle; empty control | size=1/9<1/2; contradiction inequality would require 1≥8; empty has size 0 but n=0 excluded | Pass | [Previous §Verified sound][prev] |
| 7.7 | Identity cover and empty cover | Identity size=1, fails <1/(d+1); empty degree=0 fails n≥1 | Pass; prevents vacuous generic simplicity | [Previous §Verified sound][prev] |
| 7.8 | d=1, local degree 8; d=2, degree 8 | Dimension comparisons 4<8 and 16<24 | Pass | [Previous §Verified sound][prev] |
| 7.9 | Identity cover; empty cover on ℙ¹; q=107 KP dimensions | Identity subset empty since 1≥1/(d+1); empty cover n=0 excluded; KP cutoff 1/160 | Pass on boundary hypotheses | [Previous §Verified sound][prev] |
| 8.1 | ℙ¹, elliptic curve, genus-two curve | H₁ ranks 0,2,4 equal 2g; Euler characteristics 2,0,−2 | Pass | [Previous §Verified sound][prev] |
| 8.2 | Γ=G=S₃, φ=id, a a 3-cycle | Stabilizer pair (a,a⁻¹) acts trivially; (a,a) induces nontrivial conjugation by a, since a²≠1 | Pass; inverses and opposite group necessary | [Previous §Verified sound][prev] |
| 8.3 | Overgroup equal to Γ; centre-free S₃ | Extension restricts to original action; stabilizer inverse h=φ(γ)⁻¹ is unique; centralizer size 1 | Pass | [Previous §Verified sound][prev] |
| 8.4 | Punctured-disk cover z↦z³ | Normalized extension has one point over 0 of ramification index 3; unramified off 0 | Pass | [Previous §Verified sound][prev] |
| 8.5 | q=3,g=2 | 810 surjections, free conjugation orbits of size 6, hence 135 geometric Hurwitz points | Pass | [Previous §Verified sound][prev] |
| 8.6 | Peripheral 3-cycle, cyclotomic exponent 2 | c↦c² stays nontrivial of order 3; exponent divisible by 3 would send c to 1 and is not a unit | Pass | [Previous §Verified sound][prev] |
| 8.7 | Aff(3), g=2, inertia 3 | Degree-6 Galois fibre: 2g_Z−2=6·2+2·2=16, so g_Z=9 | Pass | [Previous §Verified sound][prev] |
| 8.8 | q=3 permutation and regular representations | e-image dimensions 1 and 2=q−1; e acts as 1 on (2,−1,−1) for its point stabilizer and kills constants | Pass | [Previous §Verified sound][prev] |
| 8.9 | ε=0, [n], and product projection; m=2 polarization | Connected kernels A,0,E×0; restricted polarization degree 2=2, isogeny kernel rank 4=4 | Pass | [Previous §Verified sound][prev] |
| 8.10 | Trivial G-action; q=3,g=2; genus-zero curve | e=0 gives connected kernel 0; KP Prym dimension 3; genus 0 fails stated supplier range | Pass; supplier sections resolved | [Previous §Verified sound][prev] |
| 8.11 | C=ℂ/(ℤ+iℤ), a=1,b=i | H₁ rank 2=2; intersection(a,b)=1; E(a,b)=−1 and E(Ja,a)=1>0, as the pinned positivity requires | Pass | [Previous §Verified sound][prev] |
| 8.13 | q=3,g=2 and q=107,g=2 | Relative Prym dimensions (3·2)/2=3 and (3·106)/2=159; finite-cover fibre count 135 for q=3 | Pass | [Previous §Verified sound][prev] |
| 8.14 | q=3,g=2, linear-part quotient | Nonzero classes in H¹(Y,ℤ/2): 2⁴−1=15; 135 Hurwitz points give constant fibre size 9 | Pass | [Previous §Verified sound][prev] |
| 9.1 | q=3,g=2; connected cyclic triple cover control | Degree-3 quotient genus 5; cyclic monodromy order 3≠6=Aff(3), hence excluded | Pass | [Previous §Verified sound][prev] |
| 9.2 | Identity cover; disconnected double cover | Primitive kernel 0; double-cover kernel {(x,−x)}, dimension equals base H₁ rank | Pass | [Previous §Verified sound][prev] |
| 9.4 | Identity mapping class; finite common stabilizer | Identity acts I on every primitive factor; passing to index k subgroup leaves connected Zariski closure unchanged | Pass; image not arbitrary data | [Previous §Verified sound][prev] |
| 9.5 | q=3, identity permutation versus 3-cycle | Numbers of lifted components 3 and 1; independent component classes have those ranks in the stated nonseparating case | Pass | [Previous §Verified sound][prev] |
| 9.6 | q=5 types identity, translation, orders 2,4; separating disk boundary control | k=5,1,3,2 gives ranks 4,0,2,1 for admissible curves; disk boundary has k=q but all lifted classes 0, excluding the unrestricted source formula | Pass with nonseparating hypothesis | [Previous §Verified sound][prev] |
| 9.7 | q=3, fixed sheet plus one 2-cycle | Primitive v=e⁺−(1/3)tr(e), push(v)=e−e=0; unique fixed sheet specifies e⁺ | Pass | [Previous §Verified sound][prev] |
| 9.8 | q=3 and ω(v,x)=1; two distinct sheets | Lift action x+3î(x,v)v=x−3v=T_v^(−3)x; projected intersection 0−1/3=−1/3 | Pass; sign recomputed | [Previous §Verified sound][prev] |
| 9.9 | Genus-one surface with two boundaries | H₁ rank 3, radical rank 1; quotient Sp₂=SL₂, radical shears have two integer parameters | Pass | [Previous §Verified sound][prev] |
| 9.10 | Covector (2,2) modulo 3; rank-one control modulo 5 | Lift (5,2), gcd=1 and reduction (2,2); 2 mod5 has no rank-one primitive lift ±1 | Pass; rank≥2 needed | [Previous §Verified sound][prev] |
| 9.11 | q=3,g=2 | Trivial-cover genus-one part has three sheets; total H₁ rank 10, base rank 4, primitive rank 6 | Pass | [Previous §Verified sound][prev] |
| 9.12 | q=3 affine normal form, multiplier 2 and translation 1 | Multiplier has cycles (1,2), translation (3); the q+1=4 curves form a basis of H₁ of the covered genus-one piece, rank 4 | Pass | [Previous §Verified sound][prev] |
| 10.1 | q=3,g=2 | 3I−J on three sheet classes has eigenvalues 0,3,3 and rank 2; full unipotent has N²=0 and fixed dimension 6−2=4 | Pass | [Previous §Verified sound][prev] |
| 10.2 | q=5, c₁=2,c₂=3, cancel first with m=3 | Translation parameters 2+3=0 and 3+3=1 mod5; cycle types (1⁵) and (5) | Pass; factor distinction | [Previous §Verified sound][prev] |
| 10.3 | All eight sign choices of e₁,e₂,e₁+e₂; rank-one control | Difference determinant s₁s₂−s₂s₃−s₁s₃ is −1 or 3, never 0; rank-one single representative has affine dimension 0 | Pass; arbitrary signs distinguished | [Previous §Verified sound][prev] |
| 10.4 | ℓ₁(x,y)=x, ℓ₂(x,y)=y, B=10; zero-form control | w=(11,12), gcd=1, values 11,12>10; zero form value 0 cannot exceed 10 | Pass | [Previous §Verified sound][prev] |
| 10.5 | q=3,g=2; same/different sheet coefficients | Primitive dimension 6; intersection coefficients 1−1/3=2/3 and −1/3 are both nonzero; finite connecting paths keep spanning rank 6 | Pass | [Previous §Verified sound][prev] |
| 10.6 | q=3,g=2; any finite-index subgroup | Closure Sp₆ dimension 3·7=21; nonzero parameter −3 has infinite integer multiples in characteristic zero | Pass | [Previous §Verified sound][prev] |
| 10.7 | q=3,g=2, 135 factors | Product dimension 135·21=2835; diagonal two-factor dimension 21 versus product 42 is excluded by unequal fixed dimensions | Pass | [Previous §Verified sound][prev] |
| 10.8 | Normal subgroup product of selected factors; finite centre | Connected factors have dimensions 21 each; finite centre has dimension 0, with at most 2^N geometric points | Pass | [Previous §Verified sound][prev] |
| 10.9 | q=3,g=2 | Each factor contains noncentral unipotent of rank(N)=2; connected normal projection therefore dimension 21, total 2835 | Pass; headline reduction | [Previous §Verified sound][prev] |
| 10.10 | Same KP family | 135 Prym factors of H¹ rank 6; required full-monodromy product has dimension 2835, matching §10.9 | Pass; headline comparison | [Previous §Verified sound][prev] |
| 11.1 | K=ℚ,g=2,q=107 | q−1=106=2·53, d=159; 64/106²=16/2809<1/160 since 2560<2809 | Pass | [Previous §Verified sound][prev] |
| 11.2 | K=ℚ,p=373, modulo 53 | 373≡2; ord₅₃(2)=52≥8; p odd and unramified in ℚ; avoidance of S remains an explicit condition | Pass | [Previous §Verified sound][prev] |
| 11.3 | Rank-two piece modulo 5, multiplier q_v⁻¹ for q_v=2 | Pairing(e,f)=1, arithmetic multiplier=3 rather than 2; diag(1,3) gives pairing 3 | Pass; inverse Tate twist | [Previous §Verified sound][prev] |
| 11.4 | N=106,g=2; exact 8-cycle boundary | Fixed-kernel bound 2²·106²=44944, total 106⁴=126247696; an 8-cycle contributes 0 to size | Pass; source endpoint corrected | [Previous §Verified sound][prev] |
| 11.5 | q=107,g=2 | Stated size upper bound 64/106²=16/2809<1/(159+1); denominator positive 160 | Pass | [Previous §Verified sound][prev] |
| 11.6 | Smooth genus-two curve; elliptic and nonreduced controls | dim H¹(O)=2 gives 2≤2; elliptic genus 1 fails; square-zero thickening fails smoothness over the field | Headline hypotheses pass; no enumeration asserted | [Previous §Verified sound][prev] |
| Conventions: path order | Noncommuting transport matrices A,B of §2.10 | B⁻¹A⁻¹=[[1,−1],[−1,2]]; A⁻¹B⁻¹=[[2,−1],[−1,1]], unequal | Pass; opposite-group order distinguishes them | [Previous §Verified sound][prev] |
| Conventions: Tate duality | Elliptic H¹, its Tate module, ℚ_p(1) | Hodge jumps (0,1), (−1,0), (−1); geometric weights 1,−1,−2 | Pass | [Previous §Verified sound][prev] |
| Conventions: positivity | Square lattice a=1,b=i, Ja=b | E(a,b)=−1; E(Ja,a)=1>0; Q(a,b)=1 | Pass; same sign in §§8.11–8.12 and supplier | [Previous §Verified sound][prev] |

[prev]: PRREVIEW-MordellLawrenceVenkatesh~2.md#verified-sound

## Not verifiable

The following source limitations are carried from the previous report; their passages were not changed and are outside this incremental source recheck.

- **BO78, Corollary 7.4, p.7.4**, used in §2.11: the previous service search did not retrieve readable legal text; its institutional attempts encountered a certificate failure and a 404. This review does not certify that locator.
- **Fal83, §6, proof of Satz 5, pp.362–363**: the previous DOI lookup was paywalled/uncertified and its institutional PDF attempt failed. No renewed request is made for the settled uncertified source.
- **GX13 edition identity**: the previous legal author PDF was dated January 2025, rather than 2013. The cited Appendix E numbering matched, but edition identity remains uncertified.
- Ownership against open folders for which the brief supplies no checkout was not checked. Search-index hits for such folders were not treated as authoritative evidence. Unchanged source locators and supplier contracts outside the repair's dependency cone retain the prior review's evidence.

All newly needed sources were readable. No new source request remains, and this review is complete.

## Source issues

The first six entries are carried from the previous report, not new roadmap findings:

- **Misprint** in Mil-LAG at Example C_n, printed p.94: the source says the displayed M/P/Q list is a basis, omitting M_ii and making P antisymmetric; it should be the list including M_ii and symmetric upper-right entries; affects the proof.
- **Error** in LV20 at Lemma 2.8, printed p.12: the source says the finite-order-times-norm identity holds on the whole local multiplicative group; it should be an identity on units, leaving an unramified factor unrestricted; affects a stated result.
- **Misprint** in LV20 at proof of Theorem 5.4, printed pp.27–28: the source says the fixed-space estimate applies through i=8 although the multiplier may have order eight; it should be applied for 1≤i≤7, covering orbits of size less than eight; affects the proof.
- **Misprint** in LV20 at proof of Lemma 7.4, printed p.38: the source says vanishing π₂ of the punctured fibre gives injectivity of its fundamental group; it should be vanishing π₂ of the closed base Y; affects the proof.
- **Gap** in LV20 at Lemma 2.3 and proof of Proposition 3.4, printed pp.9,20: the source says the cohomological representations satisfy finiteness requiring unramifiedness outside S, while the chosen p lies outside S; it should be applied with S enlarged by the places above p; affects the proof.
- **Error** in LV20 at Lemmas 8.2–8.3, printed p.42: the source says unrestricted simple closed curves have independent lifted classes and rank determines their cycle type; it should be restricted to nonseparating curves and positive powers divisible by the monodromy order; affects a stated result.


The following slips were observed while checking this revision's sources. None is copied into the revised target.

- **Misprint** in Mil-iAG at Proposition 1.58, proof, printed p.32: the source says the transporter is a closed subfunctor of X; it should be a closed subfunctor of G; affects the proof.
- **Misprint** in Mil-iAG at A.99, printed p.509: the source says to take a point in φ(X) for φ:Y→X; it should be a point in φ(Y); affects a stated result.
- **Misprint** in LV20 at Lemma 3.2, printed p.18: the source says the K_v extension gives the complex image closure and the complex extension gives the p-adic closure; it should be K_v for the p-adic closure and C for the complex closure; affects a stated result.
- **Error** in FM12 at §6.1.1, elementary symplectic matrices, printed p.171: the source says SE_ij equals the inverse of SE_ji for nonpaired indices; it should be SE_ij = SE_{σ(j),σ(i)}^{−(−1)^(i+j)}; affects a stated result.
- **Misprint** in FM12 at §6.1.1, Burkhardt generators, printed p.172: the source says adjacent swaps are indexed through i=g; it should be 1≤i<g; affects the proof.

New source witnesses: Mil-iAG line 1268–1271 and line 21187; LV20 line 842–850; FM12 line 5888 and line 5904–5905. The FM12 inverse formula was also inspected on the rendered PDF page. For g=2, i=1, j=3, SE_13=I+E_13−E_42, whereas SE_31⁻¹=I−E_31+E_24; their (1,3) entries are 1 and 0. The corrected partner SE_42⁻¹ equals I+E_13−E_42. The roadmap uses the separately stated generation theorem and correctly computed Burkhardt moves, so this source error introduces no roadmap finding.
