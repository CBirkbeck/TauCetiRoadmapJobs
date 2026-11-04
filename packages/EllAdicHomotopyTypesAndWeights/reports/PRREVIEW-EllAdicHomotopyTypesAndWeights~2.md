# Review of EllAdicHomotopyTypesAndWeights (pull request #1644 at 9bbc066)

**Verdict:** accepted

## R01 (P3) — The hypercover reference is still absent from the source manifest

**Location:** `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:1088`, “Theorem 1.2, p. 2”, and `packages/EllAdicHomotopyTypesAndWeights/sources.toml`.

**Claim:** The README cites Dugger–Isaksen, but the source manifest still does not register this work. This carries forward previous R03; it is nonblocking under this review's severity rules.

**Witness:** The manifest has nine source entries and no Dugger–Isaksen entry, by author, title or arXiv identifier. The cached legal arXiv v1 gives the cited open-hypercover theorem at dugger-isaksen line 57, printed p. 2.

**Exact repair:** Add a single `dugger-isaksen` manifest entry for arXiv math/0111287, recording v1's title/numbering, Theorem 1.2, p. 2, the supplier-contract and §4.3 uses, and the legal fetch provenance. Keep the source text outside the roadmap folder. The cached v1 theorem has the claimed open-hypercover domain and weak-equivalence conclusion; no replacement mathematical statement or new source request is needed.

## Previous findings

- R01 — repaired: README §§8.3 and 8.3a now choose weight-stable Hirsch stages and a weight-preserving lift; §8.5 uses those choices. The mixed-weight negative control at line 947 excludes the previously allowed bad lift.
- R02 — repaired: README §§8.3t and 8.3v own exact transgression, transition naturality and zero H² inflation; §8.3a consumes them. ArithmeticLocallySymmetricSpaces §ALS.F.5 supplies the full complex. No finite-stage H² vanishing is assumed.
- R03 — not repaired: README line 1088 still cites Dugger–Isaksen, while the package source manifest still has nine entries and omits it. Carried forward as this report's nonblocking R01.

## Verified sound

This is an incremental re-review of 81 changed lines since ce640e6: 68 added and 10 removed README lines, and three added Lean docstring lines. All changed claims, API laws, examples and their affected uses in §§8.3–8.5 were reviewed. Unchanged mathematical rows below are explicitly carried from the previous report, rather than presented as fresh computations. The two previous blocking findings are repaired; the remaining finding is P3. Acceptance is conditional on the 12 declared supplier contracts, not a certification that their future implementations already exist. The folder is ready for a human's final approval; this is no approval or merge action.

### Gate, scope and elaboration

The requested head is `9bbc066cc5b06acd6c11b490d6828b24fd1afc0b`. The diff outside `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights` is empty, and the worktree remained clean. The worker's supplied gate includes a passing targeted build. I reran the gate successfully, separately ran the targeted build, and directly elaborated `Suggested.lean` from the pinned worktree. Direct elaboration emitted no warnings or errors. The targeted build reported:

```text
Build completed successfully (8976 jobs).
```

The rerun gate reported:

```text
gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The specified dependency command returned:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new supplier is earlier in the merge order. All Needs lines were inventoried; the added local order is §8.3, §8.3t, §8.3v, §8.3a, §8.4, §8.5. No later result is used to prove either new bridge. The arbitrary ungraded presentation remains in scope, while the graded clause explicitly adds its necessary choices. No good-prime restriction, copied source passage, computational algorithm, admitted data or option override was introduced.

The normative root README and CONTRIBUTING were read, and main's DGAInfinity and AlgebraicTopology were inspected for shape. The new subsections retain prose statements, explicit hypotheses, API laws, locators and individual Needs lines. Each new construction has four discriminating Checks. The layer still ends with Examples and Dependencies.

### Recomputed adversarial table for the changes

Here K is a characteristic-zero field, Γ₁L=L, N_k=L(V)/Γ_k, and brackets use dφ(x,y)=−φ([x,y]). Exact rational row reduction was used for the finite Chevalley–Eilenberg calculations. For Lie dimensions 2, 3 and 5, the triples (dim C², rank d¹, rank d²) are (1,0,0), (3,1,0), (10,3,4), giving H² dimensions 1,2,3. The six-dimensional bad-lift model satisfies all 216 basis Jacobi identities and d²=0. The tables contain 15 fresh rows, 37 carried-forward target/convention rows and 12 carried-forward gap rows, for 64 computed rows in total. These are instance tests, not proofs of the full targets.

| Statement | Instances tried and values computed on each side | Result / change |
|---|---|---|
| New Mathlib/ALS contracts, README:43–45,85 | Trivial coefficients on Heisenberg [A,B]=C give dc(A,B)=−1; the extension of cocycle ab has central bracket coefficient +1. Native lowerCentralSeries 0 is top, corresponding to Γ₁, and N₁=0. A one-dimensional basis gives the one-generator abelian free Lie algebra; the underlying set K would instead give many free generators. | Passes. The basis adapter, sign, coefficient action and index shift are explicit; no generic complex is duplicated. |
| §8.3 homogeneous stages | For da=db=0, dc=−ab, weights (1,1,2), the canonical stage dimensions are 2 then 3; their Lie weights are (−1,−1) then (−1,−1,−2), with [A,B]=C of weight −2. With dc=ab instead, [A,B]=−C and 1=−c(−C). For H¹=0 and infinite square-zero H²(A), every Lie stage remains 0. | Passes. Homogeneous choices preserve both the sign and the earlier generality without imposing finite H²(A). |
| §8.3t exactness and sign | For KC→Heis→K², the five term dimensions are 2,2,1,1,2; first inflation has rank 2, restriction rank 0, transgression rank 1 and final inflation rank 0. Transgression sends c to −[ab], and [ab] inflates to [−dc]=0. | Passes. The final H² need not be zero or the preceding map surjective. |
| §8.3t split and zero controls | For K→K²→K, restriction has rank 1 and transgression is 0: a one-dimensional invariant kernel dual maps to H²(K)=0. For h=0, g=q=K², the two inflations are identities of ranks 2 and 1 and the middle term is 0. For g=0 all five terms are 0. | Passes. The common-abelianization hypothesis excludes the split example from the transgression isomorphism. |
| §8.3t extension independence and naturality | Replacing c by c+αa+βb leaves d unchanged because da=db=0. Under A↦uA,B↦vB,C↦uvC, both transgression paths give −uv[ab]: values −6 for (u,v)=(2,3), 0 for (0,3), −1 for (1,1). | Passes, including a noninvertible extension morphism. Differences of general lifts descend to q and contribute a coboundary there. |
| §8.3v finite-stage inflation | Rank-two N₂ has H²=K[ab], dimension 1; N₃ has H² spanned by ac,bc, dimension 2. In N₃, ab=−dc; in N₄, ac=−dp and bc=−dq. Thus the first two inflation maps have rank 0, while dim H²(N₄)=10−3−4=3. | Passes. Nonzero finite stages with zero transition maps yield zero filtered colimit. |
| §8.3v central-extension proof | For c=ab on N₂, E is Heisenberg: Γ₂E=KC, Γ₃E=0. The lift from N₃ has b(C)=1, so d(−b)(A,B)=+1=c(A,B), whereas db gives −1. For c=0, the split lift has b=0 and d(−b)=0. | Passes. In general Γ_kE is central, so Γ_(k+1)E=0 and the free lift factors through N_(k+1). |
| §8.3v ranks zero/one, continuous cochains and variance | V=0 gives N_k=0 and H²=0 for every k. For dim V=1, N₁=0 and N_k=K for k≥2; C²=Λ²K∨=0. Identity pullback fixes a, and a zero linear map pulls positive-degree forms to 0. A functional on N₂ composed with F̂→N₂ kills Γ₂; its inflations give the same colimit functional. | Passes. The cochains are the stated finite-quotient alternating maps; ordinary unrestricted algebraic duals are not used. Exact filtered colimits preserve kernels/images. |
| §8.3a ungraded relation duality | For abelian K², I=cl Γ₂ and I/cl[F̂,I]=Γ₂/Γ₃ has dimension 1, matching H²=K[ab]. For Heisenberg, I=cl Γ₃ and the relation quotient has the two length-three brackets, dimension 2, matching ac,bc. The full free tower has I=0 and colim H²=0. | Passes. The denominator is now explicitly cl[F̂,I]+(I∩Γ_kF̂); no individual finite-stage H² is discarded. |
| §8.3a generation and minimality | For abelian K² the relation representative [A,B] spans the one-dimensional quotient and generates cl Γ₂ as a closed ideal; R=0 has zero image and does not. Adding a redundant generator D↦0 produces relation classes D,[A,B], dimension 2, against dim H²=1. | Passes. Density is the topological condition; the redundant presentation is excluded by the abelianization lift requirement. |
| §8.3a repaired graded lift | For [A,B]=C,[A,C]=P,[B,C]=Q and central D, the lift D̄↦D+C sends [A,D]−[A,[A,B]] to P−P=0, but its components to P and −P. The weight-preserving lift D̄↦D sends the components to 0 and −P, so the mixed sum maps to −P≠0. | Previous R01 repaired on its exact counterexample. The kernel of the corrected map is homogeneous. |
| §8.3a completed grading and cofinality | Weights of A,B equal −1,−2. The word ad(A)^(r−1)B has length r and absolute weight r+1;  r≤r+1≤2r for r≥1. Its infinite sum has finitely many terms below every weight cutoff and is in F̂, but not in L(V). With V=0 both filtrations are zero. | Passes. The completed grading is an inverse-limit grading, and positive generator weights in [1,b] give r≤absolute weight≤br. |
| §8.3a finite relation clause | In the elliptic model the continuous relation dual and its dual relation quotient both have dimension 1; R=K[A,B] maps isomorphically onto it and has weight −2. In the free rank-two model both dimensions are 0. | Passes. In general the direct sum of homogeneous representatives is only required to be dense; an isomorphism onto the completed quotient is asserted when H² is finite-dimensional. |
| §8.5 downstream presentation | For an elliptic curve V has weights (−1,−1), R has one weight −2 relation and the quotient is abelian dimension 2. For the three-punctured line V has weights (−2,−2), R=0, and the first two Lie quotient dimensions are 2,3. For P¹, V=R=0. The bound is [−4,0]∩(−∞,−2]={−4,−3,−2}. | Passes. The revised route makes the required homogeneous choices before applying §8.3a and retains the nilpotence cutoff for finite quotients. |
| Suggested.lean:42–44, continuous presentation headline | Number of own declarations before/after the docstring change: 0/0; admitted data 0/0; stand-in predicates 0/0; own signature probes 0/0. The finite-stage cochain carriers do not supply the Sullivan model or completed relation quotient. | Passes. The newly explicit headline is recorded with its missing carriers; no replacement scalar theorem is inserted. |

### Carried-forward adversarial rows

Each row cites [r1], `packages/EllAdicHomotopyTypesAndWeights/reports/PRREVIEW-EllAdicHomotopyTypesAndWeights~1.md`, at its computed adversarial table. These are the untouched statements' existing computations. The changed §8.3/§8.3a/§8.5 rows have been replaced above.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions: odd squares, differential, Frobenius, weights | In Λ over F₂, e²=0; in F₂[e], e²≠0 although the sign is +1. For dy=x², weights (x,y)=(2,4) give 4=2+2; (2,3) gives 3≠4. Geometric Frobenius on P¹ at q=2 has eigenvalues (1,2), weights (0,2); inverse Frobenius gives (1,1/2), weights (0,−2). At q=1, q^(w/2)=1 for every w. | Passes; extra odd-square law and q>1 are necessary.  [r1] |
| 0.1 Commutative DG carrier and connectedness | Λ_K(e₁) has H⁰=K and e²=0. K[t,dt] has A⁰=K[t]≠K but H⁰=K. The zero algebra has H⁰=0≠K. Scaling e↦2e acts by 2 on H¹, not the identity. | Passes; no confusion between A⁰ and H⁰ or graded and ordinary commutativity.  [r1] |
| 1.1 Rank-one divided powers | γ₁²=2γ₂ over Z; over F₂ this is 0 while γ₂≠0. Over F₃, tγ₂=3γ₃=0. Over Q, γ₂=t²/2. In the zero ring all components are 0. Maps out of the DP algebra require γ₂ as well as γ₁: in F₂[ε]/ε² the choices γ₁↦0, γ₂↦0 or ε respect distinct DP-generator images. | Passes; ordinary polynomial generators alone do not determine integral maps.  [r1] |
| 1.2 Bigrading | x has degree (0,1), dx has (1,1): d changes p by 1 and n by 0. On an edge Ω₀¹=0 and Ω₁¹=R. γ₀+γ₂ has two nonzero components; (γ_n) for all n has infinitely many and is absent from the direct sum. | Passes.  [r1] |
| 1.3 Relative simplex forms | On a point, Q=R/R=0 and Ω=R{t}; dx₀=0. On an edge dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀. Imposing t=1 over Z would force 2γ₂=1, unlike the retained free DP coefficient. At characteristic 2, dx₀²=0 from the exterior factor. | Passes, including the nonempty-simplex hypothesis.  [r1] |
| 1.4 Pullback | Collapsing two coordinates gives γ₂(x+y)=γ₂(x)+xy+γ₂(y), with middle coefficient 1. A missing fibre gives γ_r(0)=0 for r>0; the identity leaves γ_r unchanged. Collapsing three coordinates by either factorization gives Σγ₂(x_i)+Σ_(i<j)x_ix_j. | Passes; directions and divided-power mixed terms agree.  [r1] |
| 2.1 Compatible-family forms | Empty X gives the zero module in every bidegree; a point gives Rγ_n in degree 0. On two incident edges, vertex restrictions 0 and γ₁ disagree, so that pair is excluded. Equal simplex evaluations have difference 0 in the family module. | Passes; compatibility excludes the unrestricted product model.  [r1] |
| 2.2 Coefficient homotopy | (p,n)=(0,0) gives the constant simplicial module R and H₀=R. At (0,1) the normalized two-term complex has differential 1:R→R, hence H₀=H₁=0. At (1,1) its only homology is H₁=R. With R=0 all these groups are 0. | Passes: the nonzero coefficient homotopy is at i=p=n.  [r1] |
| 2.3 Triangular comparison | On S¹, H¹(Ω₀)=0 and H¹(Ω_n)=R for n≥1, matching the truncated H¹γ_n. On T², (aγ₁)(bγ₁)=2abγ₂, which is 0 over F₂ although ordinary ab≠0. Empty X has 0 on both sides. | Passes; the integral ring is not the ordinary cup ring without DP coefficients.  [r1] |
| 2.4 Principal quotient and diagonal | For infinite discrete X, (∏R)/a∏R→∏(R/a) has kernel 0 and is onto by coordinate lifts. On a point, 3γ₁ mod 4 maps to γ₁ mod 2. At p=0 the preceding exterior term is 0, not Ω₀⁰. On RP², H¹(−,Z)=0 but H¹(−,F₂)=F₂, ruling out indiscriminate base change on the diagonal. | Passes; principal quotient and exceptional diagonal retained.  [r1] |
| 2.4 Nonprincipal negative control | R=Q[x₁,x₂,…], I=(x₁,x₂,…), X infinite discrete, (p,n)=(0,1). The vector (x_i) has nonzero class in (∏R)/I∏R but maps to 0 in ∏(R/I). Any finite list of coefficients from I uses finitely many variables and cannot generate all x_i. | README correctly excludes this case; source error recorded below.  [r1] |
| 2.5 Rational comparison | At a point γ_n↦t^n/n!, including γ₀↦1, γ₂↦t²/2. On an edge, t⁰x₁ is nonzero in A_PL[t] but absent from the n=0 image. On a disjoint union of edges, the restrictions x₁^N have unbounded N and no single n; stabilization still has cohomology K per connected component. | Passes; quasi-isomorphism is not asserted to be surjective on all forms.  [r1] |
| 3.1 Pro-forms and order of limits | For a constant point the filtered colimit is Rγ_n. A map two points→one pulls 1 back to (1,1). In lim_r colim_N (Z/ℓ^r)^N the sequence (ℓ^i) exists, since each reduction has finite support; in colim_N lim_r (Z/ℓ^r)^N it does not. | Passes; order of colimit and completion matters.  [r1] |
| 3.2 Mod-ℓ finiteness | A point has H⁰(F_ℓ) of cardinality ℓ and H^i of cardinality 1 for i>0. CP∞ has one-dimensional H^(2j) and zero odd cohomology for every j, so is degreewise finite but unbounded. A countable wedge of circles has H¹=∏F_ℓ, an infinite set. | Passes; finite total degree range is not imposed.  [r1] |
| 3.3 Universal coefficients | For Z_ℓ --ℓ→ Z_ℓ in degrees 1,2, H¹=0 and H²=Z/ℓ. Mod ℓ, H¹=F_ℓ. The displayed sequence in degree 1 is 0→0→F_ℓ→Tor₁(Z/ℓ,F_ℓ)=F_ℓ→0. For the zero complex all terms are 0. | Passes; Tor is in degree i+1.  [r1] |
| 3.4 Completion | At a point lim_r (Z/ℓ^r)γ_n=Z_ℓγ_n, with positive cohomology 0; reduction alone has ℓ^r elements. The total direct sum excludes Σγ_n. On S¹ at (1,1) over F₂, coker d=F₂, of size 2, not 0. | Passes; diagonal cokernel cannot be omitted from the ML argument.  [r1] |
| 3.5 Rationalized homotopy algebra | tγ₂=3γ₃ becomes 1/2=3/6 under normalization. γ₂γ₃=10γ₅ becomes 10/120=1/12=(1/2)(1/6). Before rationalization tγ_(ℓ−1)=ℓγ_ℓ is not an invertible transition over Z_ℓ. The point has H⁰=Q_ℓ. | Passes; factorials, multiplication and rationalization agree.  [r1] |
| 4.1 Étale realization | A geometric point has H⁰=Q_ℓ, two points have Q_ℓ², and a dual-number thickening has the same cohomology as its reduction. In characteristic p with ℓ=p, Artin–Schreier classes t^m, p∤m, give infinitely many independent classes on A¹, outside the hypothesis. | Passes; invertibility and connected-model distinction matter.  [r1] |
| 4.1a Finite/raw comparison | On a point both comparisons send γ₀ to 1 and normalized γ₂ to 1/2. For two points both have two orthogonal idempotents, H⁰ dimension 2; on G_m, H¹ has dimension 1. Refinement Et_rig→E_fin induces forms(E_fin)→forms(Et_rig). | Passes; contravariance and unit preserved.  [r1] |
| 4.2 Galois continuity | Finite orbits of lengths 2 and 3 have common stabilizer 6·Z-hat, of index 6. A fixed point has index 1. An unrestricted family with orbit lengths 2^j has stabilizer of infinite index, not open. | Passes; finite truncation rather than the entire raw type is used.  [r1] |
| 4.3 Hypercover comparison | Cover S¹ by two arcs with overlap in two components. The coarse two-vertex nerve is an interval with H¹=0; the component Čech nerve has two edges and H¹=K, matching S¹. For a non-Čech target with two choices above each of two overlap components, fixed degree-zero lifts allow four degree-one choices, not a unique lift. | Passes; matching-degree lifts and component information are necessary.  [r1] |
| 4.4 Complex comparison | For G_m, Λ(a₁), d=0, gives Betti numbers (1,1,0,…), as on the analytic circle. For an elliptic curve Λ(a₁,b₁) gives (1,2,1), with ab≠0 on both sides. Two points instead have H⁰ dimension 2 and are outside the single-connected-model theorem. | Passes.  [r1] |
| 5.1 Geometric weights | G_m has H¹ weight 2; an elliptic curve has H¹ weight 1; a split nodal rational proper curve has H¹ weight 0. For C_nodal×G_m, H¹ has weights 0,2, H² has two weight-2 lines, and H³ has one weight-4 line. A thickened point has W₋₁H⁰=0 and W₀H⁰=Q_ℓ. | Passes; normality, ordinary cohomology and [0,2i] are distinguished.  [r1] |
| 5.2 Frobenius–Hodge identification | On P¹ at q=2, eigenvalues 1,2 have weights 0,2; at q=3, 1,3 give the same weights. W₀ of total cohomology has rank 1 and W₂ rank 2 in both realizations. Inverse Frobenius would give 1/2 and weight −2 in H². | Passes; geometric convention agrees with the suppliers.  [r1] |
| 6.1 Finite-type filtrations | Λ(a₁,b₁) has degree dimensions 1,2,1. In K[x₂], span(1,x) is not closed since x²≠0 lies outside it. In K[x₂]⊗Λ(y₃), dy=x², Λ(y) is not d-stable. | Passes; finite-dimensional subspaces are not substituted for DG subalgebras.  [r1] |
| 6.2 Stable representatives | For the three-punctured line, dim H¹=2 and H²=0, but free-Lie bracket-length ranks begin 2,1,2,3, so degree-one Hirsch generators are unbounded. Over Q₇, α²=2, α≡3 mod 7 has α≡10 mod 49; the shear b↦b+αa has determinant 1 and inverse shear −α. A swap of a,b sends K[a] in H¹ to K[b]≠K[a], so cannot preserve that chosen first stage up to homotopy. | Passes; specially constructed filtration, not every filtration; no finite-dimensional M¹ assumption.  [r1] |
| 6.3 Generalized eigenvalues | J₂(1) has dim ker(T−1)=1 but dim ker(T−1)²=2. Eigenvectors of eigenvalues 2,3 multiply into generalized eigenvalue 6, not 5. An automorphism has no eigenvalue 0. | Passes; generalized spaces and multiplicative indexing required.  [r1] |
| 6.4 Eigenvalue products | In the sphere model deg(x)=2, deg(y)=3, dy=x², scaling x by a forces y's eigenvalue a², a product of two H² eigenvalues with total degree 4≥3. In the nonminimal acyclic pair du=v, arbitrary scaling β gives no positive cohomology eigenvalue; minimality excludes it. The unit uses the empty product 1 and degree sum 0. | Passes.  [r1] |
| 6.5 Weight grading and bounds | The sphere model has weights x=2,y=4 and d preserves 4=2+2. On G_m the degree-one weight is 2≥1. On Λ(a,b), T(a)=2a,T(b)=a+2b, generalized H¹ has weight 2 at q=2 and ab has eigenvalue 4, weight 4, although T is not semisimple. | Passes.  [r1] |
| 6.6 Common filtration | With A=((1,1),(0,1)) and B=((1,0),(1,1)), AB=((2,1),(1,1)) and BA=((1,1),(1,2)); both preserve the constant filtration. A^n=((1,n),(0,1)). The line K(a+b) is not preserved by diag(2,4), whose image is K(2a+4b). | Passes; common filtration does not imply commuting actions or invariance of arbitrary subspaces.  [r1] |
| 7.1 Weight extension | For Λ(a) of weight 1, the extension is G_m with U=1. A shear b↦b+a for weights 1,2 fixes associated graded but changes H¹. A swap on Λ(a,b) does not restrict to the first stage Λ(a). Weight scalars 2 act as (2,4), not (2,2). | Passes; actual compatible filtered automorphisms and graded action are distinguished.  [r1] |
| 7.2 Splitting and conjugacy | In G_a⋊G_m, s_c(λ)=(c(1−λ),λ): s_c(2)s_c(3)=(−c+2(−2c),6)=(−5c,6)=s_c(6). Conjugation of s₀ by (c,1) gives s_c. For c=0 it is the diagonal section; for U=1 the section is unique. | Passes; finite-stage witness agrees with the pro-tower theorem's normalization.  [r1] |
| 7.3 Rational splitting | Elliptic H¹ weights (1,1) multiply to weight 2 in H². For G_m, W₁H¹=0 and W₂H¹=Q. On a point only weight 0 occurs, with unit 1. | Passes; splitting preserves the actual geometric filtration.  [r1] |
| 7.4 Conjugacy | With weights a=1,b=2, g(a)=a,g(b)=b+a sends the weight-2 line Kb to K(b+a) and induces identity on Gr^W. On H¹ it sends [b] to [b]+[a]≠[b], so it is not homotopic to identity. | Passes; the excluded stronger conjugacy assertion is genuinely stronger.  [r1] |
| 8.1 Arbitrary algebraically closed base | For P¹ minus three rational points over F₂ with ℓ=3, H¹ has eigenvalues (2,2), hence weights (2,2). Its dual generators have weights (−2,−2). The point has only weight-0 H⁰. Neither calculation requires a complex embedding of F-bar₂. | Passes; declared spread-independent filtration is used.  [r1] |
| 8.2 Proper smooth formality | For P¹, x↦[x],y↦0 sends dy=x² to [x²]=0, giving H*=K[x]/(x²). On an elliptic curve d=0 and the map is the identity. For G_m, the degree-diagonal projection kills its nonzero H¹ generator of weight 2, so fails to be a quasi-isomorphism. | Passes; proper smooth purity is essential to this map.  [r1] |
| 8.4 Tannakian comparison | Free rank-two quotients have dimensions 2 at abelian depth and 3 at Heisenberg depth. A finite group C₂ or S₃ has trivial characteristic-zero unipotent completion: g^N=1 implies N log(g)=0, hence log(g)=0. Their profinite groups have orders 2 and 6 instead. | Passes; unipotent completion is not the full profinite group.  [r1] |

### Declared contracts

All 12 slugs were checked again against `packages/EllAdicHomotopyTypesAndWeights/design/plan.json` and the README. The sets agree; every gap has a named supplier. No new gap was added by this diff. Their unchanged precision/minimality and boundary computations are carried from [r1]; the new CE carrier is a resolved supplier citation, while the two new cohomological bridges are owned targets here.

| Gap | Computation distinguishing the requested interface | Audit result |
|---|---|---|
| polynomial-forms-de-rham | A_PL(point)=K, H¹(A_PL(edge))=0; x^N on the Nth disjoint edge has no finite global degree bound. Relative point forms instead equal K[t]. | Generic A_PL is requested from AT2.4, not rebuilt as the relative integral algebra.  [r1] |
| sullivan-minimal-models | P¹'s full model has dy=x² and H²=K; its 1-minimal model is K and H²=0→K injective. | Both notions specified, without a realizing-space nilpotence restriction.  [r1] |
| sullivan-quasi-isomorphism-rigidity | For Λ(a), a↦2a is an isomorphism on H¹ and on the algebra; a↦0 gives rank 0 on H¹ and is not a quasi-isomorphism. | Matches positive minimal, characteristic-zero domain.  [r1] |
| sullivan-homotopy-lifting | If H(a)=f(t)a for a closed degree-one generator, dH(a)=f'(t)dt·a, so a DG homotopy forces f'=0. Thus identity and a↦2a, with H¹ maps 1 and 2, cannot be homotopic. | No free choice of actual compatible lifts is promised.  [r1] |
| sullivan-scalar-extension | Sphere-model H⁰,H² dimensions stay 1,1 over K and L; d(y)=x² remains nonzero. For Λ(a), H¹=K becomes L. | Flat-field cohomology conditions preserved.  [r1] |
| compatible-good-cover-refinement | Two-arc cover: coarse nerve H¹=0, component hypercover H¹=K. A non-Čech target admits four degree-one lifts for fixed degree-zero data. | Matching-level hypercover data, not degree-zero-only Čech lifting.  [r1] |
| geometric-mixed-hodge-realization | Proper nodal rational curve has dim H¹=1 of weight 0; proper smooth rational curve has H¹=0. In degree i, complex index m−i yields cohomological index m. | Singular realization is a genuine extension of the smooth supplier.  [r1] |
| arbitrary-base-weight-filtration | Over F-bar₂, G_m with ℓ=3 has H¹ weight 2; extending to an algebraically closed overfield retains a rank-one weight-2 piece. | A geometric extension contract, not a new finite-field purity theorem.  [r1] |
| normal-h1-weights | G_m gives weight 2, elliptic curve weight 1, nodal nonnormal curve weight 0. | Exact separating normality control.  [r1] |
| normal-variety-unipotent-category | G_m has a one-dimensional additive unipotent Lie algebra, while a point has 0. Finite C₂ and S₃ give 0, rather than groups of orders 2 and 6. | Extends the supplier's smooth characteristic-zero curve setting to the declared normal varieties.  [r1] |
| finite-component-etale-presentation | Constant point has one component per degree; two points have two. Finite truncated Galois orbits 2,3 give open stabilizer of index 6. Unbounded simultaneous orbit lengths 2^j do not. | Finite-component/cohomology presentation is separate from the raw rigid type.  [r1] |
| ordinary-cohomology-weight-bounds | For singular nonproper C_nodal×G_m, degree 1 has weights 0,2 and degree 2 has weights 2,2, within [0,2i]. Smooth-only or proper-only hypotheses exclude this input. | General bound is genuinely needed and is declared.  [r1] |

### Source checks for changed and affected passages

The seeded sample intersects the changes at §§8.3,8.3t,8.3a. These were read against the legal cached texts, with the dependent §8.4 comparison and §8.5 presentation checked as well. The other eleven seeded targets—§§1.1,1.2,1.4,2.2,3.1,4.4,6.1,6.3,7.3,8.1,8.2—are unchanged and retain the previous review's computations above; this incremental round does not claim a fresh full source audit of them. No newly changed locator is marked unverified.

| Target | Locator actually opened; support and limitations |
|---|---|
| §8.3 | Morgan §5, pp. 168–169, morgan line 1175: canonical finite degree-one Hirsch stages require finite H¹, not finite H²(A). Morgan Theorem 9.4, p. 198, morgan line 2245 and line 2252: the dual tower and the explicitly graded lift. Homogeneous stages follow because the canonical stage condition is preserved by the grading. |
| §8.3t and §8.3v | Morgan Theorem 9.4 proof, p. 199, morgan line 2270 concerns negative-weight ideal-generator duality. It does not state the new arbitrary-extension five-term theorem or arbitrary ungraded continuous theorem. The README explicitly owns their direct cochain/central-extension proofs; those proofs were checked at their stated characteristic-zero generality, without finite dimension for §8.3t. |
| §8.3a | Morgan Theorem 9.4, pp. 198–199, morgan line 2252 and line 2270 supports the graded lift and relation-duality route. Poids §10, p. 83, poids line 164, passes from H¹ generators and H² relations to negative Lie weights. The general continuous-dual identification is explicitly part of this target and now consumes §§8.3t–8.3v, not a theorem falsely attributed to Morgan. |
| §8.4 | Sullivan Theorem 8.1(ii), p. 301, sullivan line 1289 gives the rational finite-type nilpotent realization's dual Lie description. It alone is not the positive-characteristic étale theorem. Weil II §5.3.8, p. 242, weil-II line 3956, and Poids §10, p. 83, poids line 164 provide the geometric direction; the stated general étale category remains a declared supplier contract. |
| §8.5 | Weil II §5.3.8, p. 242, weil-II line 3956; Poids §8.3, p. 82, poids line 152, and §10, p. 83, poids line 164; Morgan Theorem 9.4, pp. 198–199, morgan line 2245. The normal-domain bounds and finite-quotient cutoff agree. Morgan's correction, p. 185, morgan-correction line 29 and line 45, preserves Theorem 9.4 while correcting rigidity of indecomposables. |
| Previous R03 | Dugger–Isaksen arXiv v1, Theorem 1.2, p. 2, dugger-isaksen line 57. Cached provenance is the legal arXiv v1; the theorem concerns open hypercovers of arbitrary spaces. Its preprint title is “Hypercovers in topology”; the README also identifies the published title and explicitly uses v1 numbering. Missing manifest registration is the only carried finding. |

The transgression proof works by extending λ to g and descending dλ̃; changes of extension factor through q. Its exactness argument identifies the obstruction to extending λ to a one-cocycle, and pullback proves naturality even for noninjective extension morphisms. The free-tower proof lifts V to the central cocycle extension E. Since Γ_kE is in the central kernel, Γ_(k+1)E=0. The resulting lift factors through N_(k+1), and its central component b satisfies inflated c=d(−b). This verifies the claimed zero transition, rather than merely assuming the desired colimit vanishing.

For presentation duality, finite-stage transgression first identifies the kernel of H²(u_n)→H²(N_k). The zero-inflation target kills the free term after passing to the directed system. The finite-quotient topology and restriction of functionals give the stated continuous dual, and the identification/cofinal-presentation independence are explicitly retained as proof obligations in §8.3a. In the graded case finite positive generator weights make weight and bracket-length cutoffs cofinal; choosing complements weight by weight yields homogeneous lifts. Neither this argument nor the Checks assert canonical choices.

### Pinned declarations and ownership

The manifest pins remain Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Seven newly used/relevant named declarations were opened and mechanically checked together with `#check @name`; all elaborated. The AB5 module instance was also read at the pin.

| Pinned file | Declaration and line; what it supplies |
|---|---|
| `Mathlib/Algebra/Lie/Cochain.lean` | `LieModule.Cohomology.d₁₂` at 101, `twoCocycle` at 156; low-degree cochains and cocycle kernel. The trivial-action formula at 119 has the required negative bracket sign. It supplies no all-degree quotient or five-term sequence. |
| `Mathlib/Algebra/Lie/Extension.lean` | `LieAlgebra.IsExtension` at 59 imposes injectivity, surjectivity and exactness. `LieAlgebra.Extension.ofTwoCocycle` at 243 constructs the extension; the bracket formula at 201 gives central term +c for trivial coefficients. Abelian kernel and action are explicit parameters. |
| `Mathlib/Algebra/Lie/Free.lean` | `FreeLieAlgebra.lift` at 222 extends functions on a type of generators. A basis of V, not V's underlying set treated as independent generators, gives the linear universal property needed here. |
| `Mathlib/Algebra/Lie/Nilpotent.lean` | `LieModule.lowerCentralSeries` at 80 and its zero/successor formulas at 84,88. Native index zero is top, so the README's Γ_k uses index k−1 only for k≥1. |
| `Mathlib/Algebra/Category/ModuleCat/AB.lean` | Instance at 28 gives `CategoryTheory.AB5 (ModuleCat K)` in the fixed module universe. It supplies exact filtered colimits used for the cochain and exact-sequence systems. |

Object searches used the roadmap service over main and open heads, the board packages and the pinned source trees, for Lie transgression, five-term sequences, free nilpotent/pronilpotent objects and Chevalley–Eilenberg cochains. The relevant resolved ownership boundaries are:

| Citation or competing object | Current text resolved and consequence |
|---|---|
| ArithmeticLocallySymmetricSpaces ALS.F.5 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:948`, obtained with the roadmap service. Absolute cochains/cohomology are over a characteristic-zero field with no finite-dimensional Lie-algebra or compact-group restriction. Those restrictions enter separate base-change/relative-form clauses. The new contract imports exactly the absolute complex. |
| AlgebraicTopologyPartII Layer 4 | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:590` at the supplied new-roadmap head. It develops tame/rational homotopy; the five AT2.4 Sullivan/polynomial-form gaps are explicitly registered extensions. §8.3 consumes the existing named Sullivan contract rather than rebuilding the general theory. |
| DGAInfinity Layers 3 and 8 | Main `TauCetiRoadmap/DGAInfinity/README.md:353` and line 520: A∞ transfer/formality and Massey consequences, not Sullivan minimality. These remain the formality suppliers, without supplying the new Lie presentation. |
| DeligneWeightsAndPurity §§7.12–7.15,8.20–8.24 | Current service text at `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2256`, 2300,2310,2728,2844,2868. Proper/smooth bounds, potentially pure models and SNC spectral sequences are narrower than the three registered general-base/normal/general-ordinary-cohomology contracts. §8.5 explicitly uses the general ordinary bound through its gap. |
| AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 | Current service text at `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4566`,4591,4738: tensor reconstruction, unipotent categories and lower-central quotients. Its curve domain and Γ indexing are retained; the general normal-variety category is the registered extension. |
| LieGroupoidsPoisson G1.3 | `TauCetiRoadmap/LieGroupoidsPoisson/README.md:636` at the supplied head constructs algebroid and finite-dimensional real Lie complexes. It is not the all-characteristic-zero-field supplier used here and does not own the new transgression/free-tower vanishing. |
| AffineLieAlgebras A1.2 | `TauCetiRoadmap/AffineLieAlgebras/README.md:196` at the supplied head constructs continuous cochains for its formal-current topology and the residue cocycle. The finite-dimensional free-nilpotent quotient system in §8.3v is a different construction and theorem. |

The service's other transgression hits concern profinite groups, topological fibrations or compact Lie comparisons, not these Lie-extension sequences. No earlier owner of the two new bridges was located. They therefore belong here on the supplied CE complex. There are no own Lean declarations and hence no duplicate fully qualified names. The two unchanged resolver leads (EtaleHomotopyTypes EH.3 and MixedHodgeModulesAndIrregularHodgeTheory H.1) retain [r1]'s board-design resolution; this diff introduces neither citation. No later supplier was added or notion moved to a later roadmap.

### Headline theorems, binders and padding

The README's headline groups remain §§2.2,2.3,2.5,3.3–3.5,4.1,4.1a,4.4,5.2,6.2,6.4,6.6,7.2–7.4,8.1–8.2,8.4–8.5: coefficient homotopy and triangular comparison; stabilization and completed/étale cohomology comparisons; complex minimal-model comparison; Frobenius–Hodge compatibility; stable representatives, eigenvalue products and common filtrations; weight-extension splitting and conjugacy; rational and arbitrary-base gradings; proper smooth formality; the étale 1-minimal comparison and normal-variety Lie presentation. The newly explicit twenty-first group is §8.3a's continuous presentation duality, including its graded form.

The module docstring now names that additional headline and the missing Sullivan carrier, finite Lie tower, completed relation quotient and continuous dual. The pinned low-degree cochain/extension/free-Lie APIs do not construct those objects. No omitted statable headline was found in the changed scope. The file still has one `import Mathlib`, one module docstring, its namespace and no declarations. Consequently the complete own-declaration `#check @name` list is empty; there are zero variable/include blocks and no binder loss. Direct elaboration passed. The one-tactic padding probe has zero sorried theorems to try. This is a valid empty acceptance-test file under the stated rules, not evidence that the README theorems have already been proved.

## Not verifiable

- **miller**, *De Rham cohomology with arbitrary coefficients*, pp. 193–203, remains settled uncertified, as recorded in `packages/EllAdicHomotopyTypesAndWeights/sources.toml`; it supports unchanged Layer 2. Its text was not requested or treated as read.
- **sga5**, Exposé V, §5.3.1, likewise remains settled uncertified for unchanged §3.3. No new request was made.
- The twelve declared supplier gaps are planning contracts. Their eventual proofs are not certified by this review. Unchanged board-design citations retain the limitations recorded in [r1]; no unavailable future module was assumed to exist.
- Morgan's negative-weight proof does not by itself certify the broader ungraded continuous theorem. The added elementary bridges and the remaining continuous-dual identification are explicit owned proof obligations, with their finite-instance evidence recorded above. This is not a missing-text request.

No new source is needed to adjudicate these repairs. Ownership was checked against the supplied available open-roadmap texts, main and the board packages; no inaccessible open work is claimed to have been inspected.

## Source issues

The first two entries are carried unchanged from [r1]'s source audit; the Morgan correction was reread in this round. No additional source error was found in the changed passages' locators.

- **Misprint** in weil-II at §5.1.5, printed p. 235: the source says the rational comparison with the polynomial-form extension is an isomorphism; it should be an injection onto the bounded-degree pieces described immediately afterward; affects nothing.
- **Error** in weil-II at §5.1.5, printed p. 235: the source says arbitrary quotient coefficients commute with off-diagonal forms on every simplicial set; it should be restricted, for example to principal quotients, because infinite coefficient products need not commute with arbitrary quotients; affects a stated result.
- **Error** in morgan at Theorem 9.2 and its rigidity argument, printed p. 195: the source says indecomposables are invariant under homotopic maps; it should be their associated graded for the canonical Hirsch filtration in general; affects the proof; corrected in print at morgan-correction, revised Theorem 9.2 and preceding paragraph, printed p. 185.

[r1]: packages/EllAdicHomotopyTypesAndWeights/reports/PRREVIEW-EllAdicHomotopyTypesAndWeights~1.md
