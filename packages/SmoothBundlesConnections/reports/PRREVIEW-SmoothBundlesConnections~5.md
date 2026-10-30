# Review of SmoothBundlesConnections (pull request #887 at edc9f48)

**Verdict:** needs changes

## R01 (P1) — The exponential connecting-class Check contradicts the loop comparison

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1642`: “the smooth function `z ↦ z` has `δ_sm(z ↦ z)=1`”. Compare the positive-crossing evaluation at lines 1623–1625 and its generator at lines 1631–1634.

**Claim.** With the stated alternating connecting morphism and Čech–singular comparison, the identity circle map has connecting class evaluating to +1 on the positively oriented circle.

**Witness.** Write the circle parameter as t mod 1. On three successive arcs choose logarithms t, t, t, with the first continued near the final crossing as t−1. Differences at crossings 0→1→2→0 are 0, 0, −1; their sum is −1.

**Repair.** Change this Check to `δ_sm(id) = −e`, where e evaluates to +1 on the positively oriented circle. Include the three crossing values. Keep the specified connecting morphism, loop evaluation and de Rham normalization. Indeed, for local logarithms f, `D f = δf + df`, hence `[δf]=−[df]`; `df=dθ/(2π)` integrates to +1, so the repaired value is −1 by both computations. Negating every connecting morphism instead would require changing the coefficient squares, Chern-class and torsion conventions throughout B6–B7.

## R02 (P3) — Negating the connection form does not reverse horizontality

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1098`: “`ġ = dR_g(A(γ̇))` would make `s(γ)g` horizontal for `−ω`.”

**Claim.** The wrong sign in the group evolution equation produces a horizontal curve for the negative connection form.

**Witness.** On the trivial circle bundle over ℝ take real `ω=dθ+dx` and γ(t)=t. The positive-sign solution θ(t)=t gives `ω(γ̇,θ̇)=2` and `−ω(γ̇,θ̇)=−2`; neither is zero. Also `(−ω)(∂θ)=−1`.

**Repair.** Say that this curve is horizontal for the connection with local potential `−A`, whose total-space form is `θ_MC−Ad(g⁻¹)A`, not `−ω`. In this example it is `dθ−dx`, giving `1−1=0` and reproducing the vertical generator with value +1. Alternatively state only that the positive-sign curve fails the original horizontality equation. Keep the correct negative-sign evolution theorem.

## Previous findings

The three findings of the immediately preceding review were checked before the full pass; all three are repaired.

| Previous finding | Passage/evidence at this head | Disposition |
|---|---|---|
| R01, ComplexKahlerGeometry supply cycle | README 63–69: “Everything that would need those results is left to SmoothBundlesConnections, Part II”; B8 is absent, and B6.2 uses the orbit manifold of B1.4. | Repaired. Neither K5a nor K7.1 is consumed here. The new orientation calculation is checked below, not assumed from the projective carrier. |
| R02, DGFloer supply cycle | README 1626–1627: “it does not pass through the fundamental group, and no Hurewicz theorem is used or restated here.” | Repaired. B6.4 constructs the class by locally constant cocycles and compares loop evaluations directly; it does not require the general Hurewicz isomorphism. |
| R03, auxiliary calculus acceptance file | The folder no longer contains `TransportDerivativeTargets.lean`; README 1193–1196 retains the inverse-transport calculation. | Repaired by deletion. |

The previous review's carried repairs also persist: the inverse-pullback gauge action uses `Ad(u)` (README 1030); the quotient headline is present (`Suggested.lean:98`); the Atiyah/countability locators and the refinement-homotopy sign remain explicit. No repair report marking a finding “not actionable in this package” was supplied or found. Neither finding above reopens such a disposition.

## Verified sound

This is a full AI review of B1–B7 and all ten actual Lean declarations, not an incremental review and not a claim that admitted proofs are verified. The report contains fresh computations for the sampled targets, the end theorems, the definitions and their API/convention families. No previous adversarial table is incorporated by reference.

**Gate, build and signatures.** The supplied head is exactly `edc9f482e68889f0309412f766379700e16f9d4b`. The worker's gate reports all checks zero, ending `build=0 OK`; there are no gate failures to report. The diff outside this folder against `origin/main` is empty. Direct `lake env lean` elaboration of `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean` succeeded, with exactly six `declaration uses 'sorry'` warnings and no other diagnostics. A separate scratch copy with `#check @name` for each of the ten declarations also succeeded. There are six theorems, three definitions and one structure; the worker's extra “on” and “above,” entries are docstring-parser artifacts. All required binders match the README. In particular the regular-fibre theorem needs no T2 assumption; the quotient has both T2 and second countability; the finite-cover theorem uses compactness; smooth-sheaf acyclicity intentionally allows corners.

The independent dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1457 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was printed. The two previously demonstrated reverse supply edges have been removed from this folder. The mechanical result was supplemented by reading the suppliers on main, including their reverse references.

**Headline inventory.** The README's end-result families are regular fibres and transverse fibre products; free proper quotients, slices and homogeneous spaces; Ehresmann; associated/frame bundles and finite-rank L² completeness/functoriality; principal connections, the Atiyah sequence and curvature; transport reconstruction; flat bundles, holonomy reductions and Ambrose–Singer; good-cover existence, native Čech coordinates and smooth-real-sheaf acyclicity; Čech–de Rham–singular comparison; normalized circle classification, Chern–Weil, flat/fixed-curvature classification and lattice-torus classification. The six Lean theorems cover regular fibres, free proper quotient atlases, the two good-cover existence forms, the actual constant-section bijection, and smooth-sheaf acyclicity. The module docstring names the remaining end results and the missing principal-bundle, form, transport, de Rham and bundle-section carriers. The countability and raw refinement results are supporting targets in the README, not substitute Lean headlines.

**Padding probe.** In one scratch copy, each of the six admissions was replaced by alternatives attempting `simp`, `rfl`, and `infer_instance`, each required to close the goal. All six failed. The pinned declarations below do not supply a one-lemma proof: the zero-section theorem requires chart/index adapters, the quotient instance is discrete-only, and the native sheaf definitions do not assert good-cover coordinates or smooth-sheaf acyclicity. No padding finding is supported by these probes. The three definitions and `SmoothGoodCover` have real bodies and are used in retained theorems. There is one `import Mathlib`, no sorry'd data, no options, and no admitted examples.

**Seeded source sample (5/5 read).** Source identifiers here identify the legal source-service extractions, not repository files. Printed page numbers were distinguished from PDF page numbers. No README locator is flagged unverified.

| Sample | Locator and extraction | Verification |
|---|---|---|
| Sheaves and exactness | nicolaescu lines 14747–14803, Theorem 7.5.28 p.326, Example 7.5.31/Proposition 7.5.32 p.327; lines 15623–15657, Remark 8.2.2 pp.350–351 | Exact sheaf sequences, natural connecting maps, fine-sheaf acyclicity on paracompact spaces and the smooth exponential sequence. Standing manifolds supply paracompactness. Local logarithms give stalk surjectivity, not global section surjectivity. The corners extension is an owned partition-of-unity argument. |
| Native fixed-cover complex and coordinates | stacks lines 383–399, Tag 01ED and equation 9.0.1 pp.9–10; meinrenken lines 1420–1430, Example 3.16 p.36 | Stacks uses all ordered tuples, including repetitions. Meinrenken's locally constant good-cover coordinates support the constant factors; his ordered-index presentation is not substituted for Mathlib's tuple complex. The empty factor is zero for the sheaf. |
| Conditional augmentation | stacks lines 407–414, Tag 01EG p.10; lines 678–683, Tag 01ET p.15; pinned Tau Ceti declarations below | Degree zero is the sheaf condition. The acyclic-intersection lemma compares Čech with sheaf cohomology, not with global sections concentrated in degree zero. The README explicitly avoids the latter inference. |
| Raw refinement maps and homotopies | stacks lines 1066–1087, Tag 09UY p.24 | Restriction/insertion formulas support the maps and homotopies. The source writes them for sheaves of modules, but their finite-sum cancellation works for arbitrary presheaves in an abelian category with the specified products. The README's sign is the correct one; the source misprint is recorded below. |
| Coefficient maps and connecting morphism | nicolaescu lines 14747–14763 p.326 and 15637–15657 pp.350–351 | Naturality applies to the morphism of the two exact sequences. The smooth and locally constant middle/right sheaves are distinct. Good-cover contractibility supplies lifts, and the vertical cohomology map need not be an isomorphism. R01 concerns a Check's sign, not existence of this naturality square. |

Additional legal sources read: kms, Lemma 9.2 lines 3583–3596, Lemma 10.3 lines 4037–4054, tangent/vertical bundles lines 4569–4580 and curvature lines 4644–4679; freed equations (1.18)–(1.19), lines 370–385; meinrenken Theorems 1.21, 1.23 and 1.25, lines 293–319, 336–342 and 371–381; schreiber-waldorf Proposition 4.7 lines 1058–1070, Theorem 5.8 lines 1418–1431 and Appendix B.4 lines 2374–2488. The last is the cited v5 preprint, printed pp.30,39,63–66; its unitary theorem is not misrepresented as the unrestricted GL theorem, which the README constructs through Proposition 4.7. Nicolaescu's arbitrary-measure L² extension is expressly the roadmap's construction, not attributed to his compact metric-volume theorem.

**Adversarial computations (154 rows).** In the table, “retain” means no change indicated by that test, not a formal proof. All references Bk.n are to the reviewed README. Coefficient tests include ℤ, ℝ, ℝ/ℤ, characteristic two, zero objects, and infinite products where those objects are admitted; arithmetic tests for DVRs or inseparability are not applicable to real smooth manifolds.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Right-action fundamental fields, Conventions | G=GL₂, A=E₁₂, B=E₂₁ | A#(g)=gA; bracket=g(AB−BA)=g diag(1,−1); left-action fields give the negative | Sign distinguished | retain |
| Circle parameter and dual character | t=π/2, real curvature F | exp(it)=i; derivative of inverse character=−i; (i/2π)(−iF)=F/(2π) | Consistent | retain |
| Curvature wedge normalization | ω(X)=E₁₂, ω(Y)=E₂₁ | [ω∧ω](X,Y)=2 diag(1,−1); half equals [ω(X),ω(Y)] | Factor 1/2 used | retain |
| Regular-fibre atlas and tangent image, B1.0 / Lean 69 | f:ℝ²→ℝ, f(x,y)=x, c=3 | fibre={(3,y)}; dimension 2−1=1; inclusion derivative range=span(0,1)=ker df | Both conclusions | retain |
| Regular-fibre open restriction | same f, U={y>0} | restricted fibre={(3,y):y>0}=U∩f⁻¹(3) | Open-manifold structure agrees | retain |
| Regular-fibre universal property | u(t)=(3,t²) into that fibre | fibre coordinate t² smooth; composite (3,t²) smooth; for coordinate abs(t), both fail at 0 | Both implications discriminate | retain |
| Regular-fibre chart independence | target charts φ(t)=t, ψ(t)=2t | zero equations x−3=0 and 2(x−3)=0; both tangent kernels span(0,1); identity coordinate y | Same smooth structure | retain |
| Regular-fibre degeneracies | point→ℝ, c outside image; doubled-origin line→ℝ | empty fibre has dimension 0−1=0 by natural subtraction; doubled-origin zero fibre has two discrete points, tangent 0 at each | No T2 or nonemptiness needed | retain |
| Regular-value negative control | f=x²−y² at (0,0) | df=0, range={0}≠ℝ; zero set has four local branches | Excluded by surjectivity | retain |
| Sphere regular fibre | f=x²+y², c=1 | df_(x,y)(u,v)=2xu+2yv; tangent kernel perpendicular to (x,y), dimension 1 | Native circle tangent agrees | retain |
| Transverse fibre-product inclusion/tangent, B1.0 | f=g=id_ℝ | fibre={(x,x)}; kernel of (u,v)↦u−v=diagonal; dimension 1+1−1=1 | Correct | retain |
| Fibre-product projection submersions | f:ℝ²→ℝ first projection, g:Y→ℝ constant 3 | product={3}×ℝ×Y; map to Y is projection with surjective derivative | Other map's submersion used | retain |
| Fibre-product failure without transversality | f=g=x² at zero | range df+range dg=0; product x²=y² crosses at zero | Non-example | retain |
| Kernel distribution and pulled-back frames | projection ℝ³→ℝ; x↦x³ on ℝ | first kernel span(e₂,e₃), rank 2 and constant after pullback; latter rank 1 at 0, rank 0 at 1 | Constant-rank hypothesis used | retain |
| Principal trivializations and torsors, B1.1 | M×G, right multiplication | chart((x,g)h)=(x,gh); for h solving gh=k, h=g⁻¹k | Correct equivariance/uniqueness | retain |
| Division order | S₃, p=(12), q=(23), products rightmost first | p⁻¹q=(123), qp⁻¹=(132); p(p⁻¹q)=q, p(qp⁻¹)=(13)≠q | Nonabelian discriminator | retain |
| Projection and vertical orbit derivative | M×G→M; finite G | derivative (v,a)↦v; kernel 0×𝔤=orbit range; finite G gives dimension 0 | Correct submersion/vertical claims | retain |
| Smooth descent | Hopf sphere p; F(p)=abs(z₁)², Re(z₁) | F(pλ)=F(p); at p=(1,0), Re(p)=1 and Re(p·(−1))=−1 | First descends, second cannot | retain |
| Surjective-submersion converse | G→point; nontrivial G acting trivially on point | first action free/transitive and fibre=G; second has every g in stabilizer | Freeness excludes wrong bundle | retain |
| Trivial/restricted/pulled-back bundles, B1.2 | identity, inclusion U→M, composite f∘g | id*(M×G)=M×G; restriction=U×G; both composite pullbacks have fibre G at each x | Universal maps agree pointwise | retain |
| Products of principal bundles | trivial G and H bundles | fibre G×H; ((g,h)·(a,b))=(ga,hb); division=(g⁻¹g′,h⁻¹h′) | Principal product | retain |
| Left-to-right action conversion | G on itself by left multiplication | p·g=g⁻¹p; derivative at 0=−Ap; bracket of −Aᴿ,−Bᴿ=−[A,B]ᴿ | Preserves right-action bracket convention | retain |
| Cocycle and 0-cochain change, B1.3 | s_j=s_i g_ij; replacements h_i | s_k=s_i g_ij g_jk gives g_ik; new transition h_i⁻¹g_ijh_j; coboundary factors cancel on triples | Cocycle/gluing laws | retain |
| Hopf transition and nontrivial cover | z=i in affine Hopf charts; double cover of S¹ | s₁=s₀(−i), so g₀₁=bar(z)/abs(z)=−i; Z/2 cocycle differing on overlap components has monodromy −1 | Inverse and trivial-cocycle alternatives excluded | retain |
| Compact averaging, B1.4 | swap on ℝ², h=diag(1,4) | (h+swap*h)/2=diag(5/2,5/2); twice Haar probability gives diag(5,5) | Normalization and positivity | retain |
| Equivariant exponential chart | trivial action in Euclidean model, rank 0 | exp_x(v)=x+v, derivative id; zero-dimensional chart has one point | Local-chart conditions | retain |
| Free proper quotient, Lean 98 | trivial G; ℤ translations on ℝ; Hopf Circle action | quotients M, ℝ/ℤ, S²; dimensions dim M−0, 1−0=1, 3−1=2; projection ranks respectively dim M,1,2 | Generality exceeds discrete quotient API | retain |
| Free proper quotient empty/negative cases | dim M=0 with M empty and dim G=1; irrational flow on T² | empty quotient dimension 0−1=0; irrational flow has stabilizer 0 but compact square has noncompact inverse image | Empty case valid; nonproper case excluded | retain |
| Slice and finite-isotropy charts | weighted Circle action (λz₁,λ²z₂), at (0,1) | stabilizer={±1}; slice z₁ transforms by sign; transverse quotient is ℂ/{±1} | Nontrivial isotropy retained | retain |
| Principal-action properness | trivial bundle over Hausdorff M | (p,g)↦(p,pg) inverse (p,q)↦(p,δ(p,q)); image π(p)=π(q) closed | Correct homeomorphism/closedness argument | retain |
| Homogeneous spaces | SO(3)/SO(2) | quotient=S²; tangent dimension 3−1=2, vertical dimension 1 | Principal homogeneous model | retain |
| Ehresmann splitting, B1.5 | ℝ²→ℝ, H=span(1,y²) | (a,b)=(a,ay²)+(0,b−ay²); horizontal+vertical=id, intersection=0 | Complement determines connection | retain |
| Ehresmann transport/maximal interval | y′=y², y(0)=1 | y(t)=1/(1−t), blows up at 1; product connection y′=0 gives y(t)=1 | Completeness not automatic | retain |
| Ehresmann fibration theorem | proper projection B×S¹→B | fibre S¹; radial transport gives (b,z)↦(b,z); all fibres diffeomorphic | Headline model | retain |
| Ehresmann hypotheses | ℝ² minus origin→ℝ; disconnected base with one/two-point fibres | fibre at 0 has two components, at 1 one; disconnected example has cardinalities 1 and 2 | Properness/connectedness used as specified | retain |
| Associated quotient and equivariant sections, B2.1 | frame f, matrix g, vector v | (f∘g)(v)=f(gv); section coordinate changes u(pg)=g⁻¹u(p); wrong inverse relation gives f(gv)≠f(g⁻¹v) | Quotient convention coherent | retain |
| Associated trivial representation | ρ(g)=id on V | [p,v]↦(π(p),v); u(pg)=u(p); section space functions M→V | Trivial bundle recovered | retain |
| Tensor/dual/exterior/Hom constructions | E=ℝ², determinant line; rank 0 | transition diag(2,3) gives determinant 6, dual diag(1/2,1/3), Hom conjugation; exterior degree 3=0 | Fibrewise operations discriminate | retain |
| Complexification/dual comparison | V=D=ℝ, z=i,w=2, ℓ(1)=1 | evaluation zw=2i; conjugation twice=id; real inclusion fixed | Complex-linear dual, not Hermitian dual | retain |
| Hermitian fibre convention | u=i,v=1 | h(i,1)=−i; h(1,i)=i; real part on u=u is 1 | First slot conjugate-linear | retain |
| Metric norm/topology, B2.2 | line h=4h₀ | norm_h(v)=2 abs(v); same open sets; h=0 would assign norm 0 to v=1 | Positive definiteness needed | retain |
| Section measurability and frame change | measurable s, transition −1 on Möbius overlap | coordinates s and −s have equal norm and the same measurable preimages up to reflection | Atlas independence model | retain |
| L² quotient and integral inner product | one point of mass 3, rank 1 | norm²(s)=3 abs(s)²; inner(s,t)=3 conjugate(s)t; zero measure identifies every s with 0 | Correct quotient/measure dependence | retain |
| Completeness and finite rank | one point, unit mass, fibre c₀₀ | partial sums Σ_{k≤N}2^(−k)e_k are Cauchy, limit not in c₀₀; finite ℝⁿ has its usual complete norm | Finite-rank condition excludes counterexample | retain |
| Unitary versus arbitrary charts | frame (e₁,2e₂) | coordinate e₂=(0,1/2) has norm 1/2 versus fibre norm 1; synthesis (0,1) has norm 2; orthonormal frame gives 1=1 | Bounded isomorphism ≠ isometry | retain |
| Noncompact frame bounds | line frame e^x over ℝ | synthesis multiplier e^x unbounded; on [−R,R], bounds e^(−R),e^R | Compact-domain qualification necessary | retain |
| Smooth density and faithful embedding | Lebesgue measure versus zero measure | continuous nonzero section has positive norm on some open set for Lebesgue; zero measure gives norm 0 even for nonzero bump | Open-positive hypothesis used | retain |
| Locally finite density/separability | rank n over ℝ, compact exhaustion [−m,m] | finite local measure and countably many charts/approximants; direct sum of countably many separable local L² spaces remains separable | Stated locally finite regime | retain |
| Restriction/zero extension, B2.3 | two points of mass 1, s=(3,4), U={first} | norms²:25=9+16; projections (3,0),(0,4); cross inner product=0 | Orthogonal decomposition | retain |
| Bounded multipliers and adjoints | f=2i on one point | M_f(3)=6i; norm=2; adjoint multiplier=−2i; compositions multiply scalars | Correct complex adjoint | retain |
| Indicator operator exact criterion | positive finite mass, null set, rank 0, infinite point mass | norms respectively 1,0,0,0; infinite mass forces L²={0} | README includes all exceptions | retain |
| Metric-change unitary | h₁=4h₀, s=3 | H=4, sqrt(H)=2; norm²_h₁(3)=36=norm²_h₀(6); wrong inverse gives 9/4 | Direction fixed | retain |
| Equivalent-measure unitary | masses μ=1, ν=9 | s=2 has ν norm²=36; sqrt(w)s=6 has μ norm²=36; w=0 gives zero image | Positivity used for surjectivity | retain |
| Fibre Riesz and dual metric | ℂ, u=i,v=1 | R(i)(1)=−i; h*(R(i),R(1))=i=h(1,i); R(iu)=−iR(u) | Conjugate-linearity and reversal correct | retain |
| Integral duality | one point of mass 2, φ(z)=3z | pairing with s is 6s; functional norm=3√2=norm_L²(φ) | Complex-linear in dual section | retain |
| L² complexification | real s=3,t=4 | s+it=3+4i; norm²=25=9+16; J(3,4)=(−4,3) | Product norm and complex structure | retain |
| Unitary base transport | circle rotation φ by a, s(θ)=e^(iθ) | U s(θ)=e^(i(θ−a)); norm²=2π; inverse shift by +a recovers s | Measure-preserving direction correct | retain |
| Density measures, B2.4 | dxdy, 2dxdy, round circle | rectangle mass 1 versus 2; circle mass 2π; orientation reversal leaves measure positive | Correct measure/integral distinction | retain |
| Frame recovery and groupoids, B2.5 | rank 1 frame f(v)=2v | [f,3]↦6; [f∘(×3),1]↦6; inverse maps require invertible frames | Groupoids of isomorphisms used | retain |
| Closed-subgroup reduction | GL₁(ℝ), H=O(1) | G/H positive scales; scale 2 determines a metric; induced extension restores GL₁ fibre | Sections/reductions comparison | retain |
| Adjoint bracket and invariant pairing | abelian circle; GL₂; su(2) | brackets 0, AB−BA; for orthonormal su(2) generators Killing form negative, its negative positive | Claimed signs and nondegeneracy | retain |
| Circle extension/tensor/dual | degree k=1 line, z↦z² and z↦z⁻¹ | classes 2 and −1; tensor with inverse has class 0 | Operations consistent with B6 | retain |
| Möbius L² example | s(t)=sin(t/2) | s(t+2π)=−s(t); integral over one period=π, over ℝ=∞ | Correct one-period norm | retain |
| Connection axioms, B3.1 | Maurer–Cartan on G; Hopf on unit S³ | θ_g(gA)=A; Im(conjugate(z)iz)=1; negative form reproduces −1 | Axioms exclude zero/negative form | retain |
| Connection affine difference/existence | circle forms dθ+A and dθ+B | difference=B−A, zero on ∂θ; sum gives 2 on ∂θ; weighted sum with weights summing 1 gives 1 | Affine, not vector space | retain |
| Potential transformation/gluing | circle g=e^(ix), A=0 | A′=dx; overlap differences dφ add, triple sum derivative of 2πn=0 | Correct local gluing | retain |
| Maurer–Cartan equation | A=E₁₂, B=E₂₁ left-invariant | dθ(Aᴸ,Bᴸ)=−diag(1,−1); half bracket wedge=+diag(1,−1); sum 0 | Nonabelian sign/factor | retain |
| Atiyah exact sequence, B3.2 | trivial bundle over ℝ, G=Circle | TP/G=ℝ⊕ℝ; j(a)=(0,−a); projection (v,a)↦v; kernel=image j | Exactness and injection | retain |
| Atiyah bracket injection | M=point, noncommuting A,B | [V_A,V_B]=−V_[A,B]; [−V_A,−V_B]=−V_[A,B]=j([A,B]) | Negative injection necessary | retain |
| Curvature splitting defect | circle potential A=x dy on ℝ² | Xʰ=∂x, Yʰ=∂y−x∂θ; bracket=−∂θ; j(F(X,Y))=−∂θ | Formula and sign | retain |
| Associated derivative/curvature, B3.3 | dual circle character, A=xdy | ∇=d−ixdy; commutator on constant section=−i dx∧dy; standard character gives +i | Matches F normalization | retain |
| Tensor/dual/Hom pairing laws | scalar connection d+a on E | dual d−a; End(E) coefficient a−a=0; ∇id=0 | Pairing preserved | retain |
| Invariant tensors and metric reductions | O(1), nonzero real scalar a | Lie algebra o(1)=0; compatible potential=0; d+a changes length derivative by 2a | Noncompatible alternative excluded | retain |
| Curvature horizontal/equivariant, B4.1 | basic F=dx∧dy in trivial circle bundle | F(∂θ,·)=0; right pullback F=F; base pullback f(x,y)=(2x,y) gives 2dx∧dy | Descent/pullback | retain |
| Exterior covariant square/Bianchi | dual circle connection A=xdy | d_∇²1=−i dx∧dy; dF=0; flat A=0 gives square 0 | Curvature action not zero generally | retain |
| Curvature addition | A=0, a=Xdx+Ydy | da=0; half[a∧a]=[X,Y]dx∧dy=F_a; abelian X,Y gives 0 | Nonabelian quadratic term | retain |
| Paired Leibniz/integration by parts | circle α=sin θ, β=cos θ, degree α=0 | ∫dα·β=π; −∫α dβ=π; without minus RHS=−π | Sign discriminates | retain |
| Gauge composition, B4.2 | equivariant u,v at p | Φ_uΦ_v(p)=p v(v⁻¹uv)=p uv=Φ_uv(p); wrong equivariance leaves noncanceling factors | Group law correct | retain |
| Left versus right gauge curvature | SO(3), A=sin x Xdy, g=quarter turn about z | at x=0, left F=Ydx∧dy; right F=−Ydx∧dy; both norms²=1 | Previous repair persists | retain |
| Gauge infinitesimal actions | circle u=e^(itξ) | pullback derivative dξ; inverse pullback derivative −dξ; on sections dual character derivative −iξ | Covariance signs | retain |
| Gauge stabilizer | connected S¹, trivial flat circle connection | connection-preserving u has du=0, so constants Circle=centralizer(Circle holonomy) | Holonomy statement uses B5.2 as its Check says | retain; sequence this consequence after B5.2 |
| Angular torus gauge lattice | A=a dx+b dy, u=e^(i(mx+ny)) | shift (a,b)↦(a+m,b+n); periods shift (2πm,2πn); a=1 yields holonomy 1 | Coefficients versus periods | retain |
| Principal group evolution, B5.0 | A=dx, g=e^(−it) | real ω on lifted velocity=1−1=0; positive-sign g=e^(it) gives 2 | Correct theorem, incorrect negative control | R02 |
| Negating ω, B5.0 Check | ω=dθ+dx, g=e^(it) | ω(velocity)=2; −ω(velocity)=−2; replacement connection dθ−dx gives 0 | Check false | R02 |
| Transport identity/inverse/composition | circle constant A=a dθ, segment lengths s,t | T_0=1; T_−t=e^(iat)=T_t⁻¹; T_t T_s=e^(−ia(s+t)) | Laws agree | retain |
| Smooth family and group completeness | a varying over bounded parameter set, compact time interval | g(a,t)=e^(−iat) smooth for all finite t; y′=y² instead blows up at t=1 | Principal versus general Ehresmann | retain |
| Thin groupoid and transport, B5.1 | constant path; a path followed by reverse | classes identity; transports 1 and T⁻¹T=1; rank-one retracing homotopy has no area | Identity/inverse conditions | retain |
| Reconstruction −∂P | scalar potential A=2, displacement vt | P=e^(−2vt); −∂tP at 0=2v=A(v); P=1 gives A=0 | Sign and linearity | retain |
| First-variation additivity | small triangle with sides tv,tw | curvature contribution is O(t²); derivative at t=0 is 0; A(v+w)=A(v)+A(w) | Wrong first-order area term excluded | retain |
| Passive-frame transport law | scalar flat transport, new frame g(x)=e^x | P′_(x→y)=e^(x−y); −∂yP′ at y=x=1=g⁻¹dg(∂x) | Frame derivative required | retain |
| Inverse-transport derivative | P=e^(−2t), σ=3+5t | derivative of e^(2t)(3+5t) at 0=11=5+2·3; wrong sign gives −1 | Exact retained Check | retain |
| Reconstruction inverse/metric compatibility | constant skew-adjoint A=i; real A=1 | recovered A=i, norm exp(−it)=1; exp(−t) changes norm and is not isometric | Both directions discriminate | retain |
| Noninvertible intertwiners | two trivial flat lines, bundle map zero; map multiplication x | zero intertwines T=id and has derivative 0; multiplication x fails by y−x on transport | Morphisms need not be invertible | retain |
| Flat dictionary, B5.2 | S¹, G=S₃ and G=Z/2 | Hom(Z,S₃)/conj has 3 classes; Hom(Z,Z/2) has 2; point has 1 | Nonabelian/abelian examples | retain |
| Universal-cover inverse convention | ρ(γ)=h; lifted endpoint (a₀·γ,1) | quotient relation identifies it with (a₀,h); holonomy=h, not h⁻¹ | Right deck/action adapter | retain |
| Basepoint conjugation | h=(123), g=(12) in S₃ | g⁻¹hg=(132); same unbased conjugacy class | Based formula correct | retain |
| Flatness iff local parallel frames | A=xdy versus A=a dθ on S¹ | first F=dx∧dy and bracket defect −∂θ; second F=0 and local parallel section e^(−iaθ) | Both directions | retain |
| Fundamental-group countability | T², L(3,1), ℝ⁰, Hawaiian earring | groups Z², Z/3, 1 countable; earring uncountable and not locally simply connected | Hypothesis excludes failure | retain |
| Ambrose–Singer | Hopf connection; flat connection | Hopf curvature span=ℝ=Lie(Circle); flat span=0=Lie(H⁰) | Headline values | retain |
| Immersed holonomy topology | irrational cyclic holonomy in T² | H≅Z discrete, H⁰=1, dim H=0; subspace H is dense and nondiscrete | Wrong topology excluded | retain |
| Full/restricted holonomy reductions | character k=2 on L(6,1) | image μ₃, kernel Z/2; Q=S³/μ₂; Q/H⁰=Q since H⁰=1 | Covering base necessary | retain |
| SmoothGoodCover body | ℝ, centre 0, ρ(t)x; zero map proposed instead | endpoints 0 and x, centre fixed; zero map at t=1 gives 0≠1 for x=1 | Definition determines contraction | retain |
| Good-cover connected intersections | ball versus two-component overlap and annulus | ball contracts; two components cannot connect to one centre; annulus π₁=Z | Both excluded wrong members | retain |
| Good-cover existence, Lean 155 | empty manifold, discrete manifold | empty index covers ∅; singleton opens have constant one-point contractions and locally finite family | Degeneracies valid | retain |
| Finite-good-cover existence, Lean 162 | compact discrete manifold with k points | k singleton members; k=0 gives empty cover; finite atlas gives countable basis | No lost second-countability requirement | retain |
| Uniform convexity/normal domains, B6.0 | round circle, Euclidean ball | circle admissible radius π/2, opposite points at distance π have two minimizers; Euclidean log_q(x)=x−q | Cut-locus distinction | retain |
| Raw and reparametrized contractions | ball (−1,1), x=3/4 | raw 2x=3/2 lies outside; ρ(2)x=3/4 lies inside; times 0,1 give 0,x | Domain correction essential | retain |
| Smooth sheaf exactness, sampled | exponential ℝ→Circle at 0 and identity on S¹ | kernel Z for exp(2πit); local log exists; global identity has winding 1 and no real lift | Stalk-exact, not section-surjective | retain |
| Smooth sheaf acyclicity, Lean 215 | S¹, positive degree 1; degree 0 | H¹(C∞ℝ)=0 versus H¹(ℝ_const)=ℝ; H⁰(C∞ℝ) contains constant 1≠0 | n>0 used | retain |
| Constant sheaf versus presheaf | empty open, disconnected two-point open | sheaf sections 0 and ℝ²; constant presheaf sections ℝ and ℝ | Actual sheaf necessary | retain |
| Tuple intersection definition, Lean 169 | i=(a,a,b); disjoint a,b | intersection U_a∩U_b with repeats removed set-theoretically; if disjoint gives ∅ | Matches categorical product, not tuple deletion | retain |
| Constant-section map, Lean 185/205 | connected nonempty W; empty W; two components | maps r↦constant r bijective; ℝ→0 noninjective; r↦(r,r) misses (0,1) | Both directions of iff; good-cover hypothesis used | retain |
| Native differential, sampled | c=(2,5); repeated (a,a); triple | δc(a,b)=3; δc(a,a)=0; for c₀₁=2,c₁₂=5,c₀₂=7, δc=5−7+2=0 | Ordered-face signs | retain |
| Native degreewise coordinate comparison | singleton cover of point, coefficient ℝ | each degree has ℝ; differentials 0,1,0,1; coordinates and native complex have same sequence | Repetitions retained | retain |
| Augmentation degree 0, sampled | singleton cover X; two identical copies | s↦s; s↦(s,s) whose differential is s−s=0 | Native restriction component agrees | retain |
| Full augmentation conditionality | good cover of S¹, constant vs smooth ℝ | constant: source H¹=0, target H¹=ℝ; smooth: both 0; H⁰ glued sections in both | False general quasi-isomorphism excluded | retain |
| Raw refinement maps, sampled | U=(X,X), V=(X), r=0,s=1 | T_r(2,5)=2, T_s(2,5)=5; on cocycle (7,7), both 7 | Chain maps differ; cohomology maps agree | retain |
| Refinement insertion homotopy degree 0 | same example over ℤ and F₂ | hδ=5−2=3=T_s−T_r; mod 2 both=1; reverse difference over Z=−3 | Correct README sign | retain |
| Refinement insertion degree 1 | arbitrary α, two fine indices j₀,j₁ | δh+hδ cancels mixed terms, leaves α_(sj₀,sj₁)−α_(rj₀,rj₁) | Same sign in next degree | retain |
| Refinement identity/composition/naturality | (2,3,5), select index 2 then singleton; mod 2 | composite and successive maps both 5; reduced value 1 on both routes; identity leaves (2,3,5) | Strict laws | retain |
| Refinement products/universes | N-indexed repeated point cover in Q-modules | C⁰=Q^N; coordinate maps defined; finite-dimensional category has no Q^N object | Product hypothesis meaningful | retain |
| Raw presheaf negative control | P(∅)=Z, P(nonempty)=0, two discrete points | C⁰=0, C¹=Z²; cocycles (a,−a), boundaries 0, H¹=Z | Correct non-sheaf example | retain |
| Constant-presheaf comparison on same cover | every P(U)=Z, identity restrictions | dimensions C⁰=2,C¹=4; ranks d⁰=1,d¹=3; H¹ rank=4−3−1=0 | Earlier counterexample repair survives | retain |
| Coefficient connecting maps, sampled | constant section exp(2πia) | lift a gives δa=0 in both sequences; δ_sm∘H⁰(j)=0=δ_const | Naturality degree 0 | retain |
| Smooth/constant inclusion not isomorphism | S² in degree 1 | H¹((R/Z)_const)=0; H¹(C∞(R/Z))=Z; map 0→Z | No false identification | retain |
| Total Čech/de Rham sign | ω₀=xdy,ω₁=0 | δdω=−dx∧dy=dδω; correct cross term=0; unsigned total gives −2dx∧dy | D²=0 | retain |
| Smooth/singular restriction and small chains | point; an interval split into two cover members | point H⁰=R,Hⁿ>0=0 on both; subdividing interval gives [0,1/2]+[1/2,1], boundary [1]−[0] on both | Comparison models agree | retain |
| Integration naturality | f(t)=2t, c=[0,1], η=dx | integral on f_*c=2; integral f*η=∫2dt=2 | Normalization fixed | retain |
| One de Rham comparison/exact forms | S¹, dθ; interval, dx=d(x) | ∫S¹dθ=2π; exact interval class=0 in both cohomologies | Integral normalization, not arbitrary isomorphism | retain |
| Fundamental-class pairing | S¹ and Hopf base | dθ pairing=2π=integral; Hopf F pairing=2π=integral | Normalized target | retain |
| Degree-one loop evaluation | triple-circle cover c₀₁=1,c₁₂=c₂₀=0 | positive loop sum=1; backtrack sum=1−1=0 | Compatible with chosen generator | retain |
| Smooth exponential winding Check | logarithms t,t,t with first branch t−1 at return | δf crossings (0,0,−1), sum −1; README asks +1; df integrates +1 and [δf]=−[df] | Contradiction | R01 |
| Circle classification/Hopf orientation, B6.2 | p=(1,0), chart z=u+iv | ordered ambient frame (x₁,x₂,y₂,y₁) has parity +1; quotient (u,v) positive | Orientation fixed without projective carrier | retain |
| Hopf curvature and integral | same chart | A=(u dv−v du)/(1+r²); dA=2du∧dv/(1+r²)²; integral 4π∫₀∞r/(1+r²)²dr=2π | Chern number +1 | retain |
| Orbit-to-sphere map | z=0; conjugated wrong map | derivative images (2∂X,2∂Y) versus (2∂X,−2∂Y); local area factors +4 versus −4; F=half sphere area | Both sign tests agree | retain |
| Chern representative and tensor/dual | δφ=2π on a triple; Hopf tensor Hopf | dual cocycle gives −1=−δφ/(2π); Chern numbers 1+1=2 and 1−1=0 | Consistent conventions | retain |
| Chern pullback | constant map; degree d sphere map | class 0; pairing d·1=d | Natural class, not cardinality bijection | retain |
| Rank-one Chern–Weil, B6.3 | F=c dvol on unit S² | normalized period=2c; c=1/2 gives 1, c=1/3 gives 2/3 | Integral-image iff discriminates | retain |
| Curvature adjustment | A↦A+a, a=xdy in chart | F changes by dx∧dy=da, exact class 0; on torus global exact adjustments have period 0 | Prescribed-curvature construction | retain |
| Torus integral periods | c=1/(2π),1/(4π) | periods 2π,π; normalized values 1,1/2 | Only first realizable | retain |
| Flat circle class/holonomy, B6.4 | two-arc cocycle exp(2πia),1 | holonomy exp(−2πia); principal cocycle evaluation a; dual evaluation −a=h | Inverse cocycle necessary | retain |
| Flat iff real Chern class zero | L(3,1), character 1/3; Hopf on S² | first c₁=1 mod3, real image 0, F=0; second real class 1, no flat connection | Both directions tested | retain |
| UCT kernel without finiteness | H₁=Z⊕Z/3; H₁=Q | Ext first=Z/3; Ext(Q,Z) nonzero torsion-free, multiplication by each n invertible | No false general torsion identification | retain |
| Fixed-curvature torsor, B6.5 | L(3,1), F=0 | all bundle/connection classes 3; fixed bundle classes 1 since H¹_dR=0 | Distinguishes the two torsors | retain |
| Origin translation | A₀=0,A₁=2dθ,A=3dθ | old coordinate 3[dθ]; new 1[dθ]=3[dθ]−2[dθ] before lattice quotient | Negative translation sign | retain |
| Fixed-bundle gauge quotient | angular T² | coefficient quotient R²/Z²; period quotient R²/(2πZ)², related by ×2π | Same torsor, different coordinates | retain |
| Lattice torus definition/classification, B6.6 | Λ=Z, Λ=0, Möbius Λ over S¹ | fibres R/Z,0, twisted R/Z; H² rank0=0, H²(S¹;Λ)=0, one torsor class | Rank/monodromy handled | retain |
| Lattice transition rule | basis change −1; multiplication by 2 | −1 sends Z bijectively to Z; 2 sends Z to 2Z and is not in GL₁(Z) | Integral automorphism requirement | retain |
| Negative connecting class for torus torsors | lifted δt=1 | characteristic cocycle −1; with φ=2πt, −δφ/(2π)=−1 | Rank-one convention matches | retain |
| Lens pullback quotient, B7 | n=3, ζ=e^(2πi/3) | (vζ)(ζ⁻¹λ)=vλ; wrong relation gives vζ²λ≠vλ | Equivariant isomorphism determined | retain |
| Lens flat holonomy | path v(t)=e^(2πit/n)w₀, constant λ=1 | endpoint [w₀ζ,1]=[w₀,ζ]; holonomy ζ | Sign independent of Chern naming | retain |
| Lens Bockstein | cellular d₂=n, χ=1/n | real lifted coboundary n(1/n)=1; n=3 separates 1 from −1 mod3, n=2 does not | Torsion sign test meaningful | retain |
| Lens holonomy reductions | n=6,k=2; k=0 | orders 6/gcd(6,2)=3 and 1; covers S³/μ₂ and L(6,1); restricted base same for flat case | Boundary k=0 and nontrivial case | retain |
| Lens Chern class and curvature | n=3,k=1 | c₁=u has order3; real image0; flat F=0; tensor cube class0 | Integral/real/holonomy distinctions | retain |

**Pinned-library audit.** Paths in this table are relative to the corresponding pinned library root. Searches included structures, operations and hypotheses, not only the proposed declaration names. The following 26 groups record declarations whose definitions or signatures were opened; they explain both the deferrals and what the proposed results still add.

| Pinned object | File and line | Scope verified |
|---|---|---|
| `FiberBundle`, `FiberBundleCore`, `Trivialization`, `restrictPreimage` | Mathlib `Topology/FiberBundle/Basic.lean:186`, `:418`; `Topology/FiberBundle/Trivialization.lean:376`, `:837` | Native topological local triviality and restriction; these do not impose principal equivariance. |
| `VectorBundle`, `ContMDiffVectorBundle`, local frames | Mathlib `Topology/VectorBundle/Basic.lean:375`; `Geometry/Manifold/VectorBundle/Basic.lean:305`; `LocalFrame.lean:339` | Linear/smooth vector-bundle data already supplied; associated principal quotients still need the B2 construction. |
| `IsSubmersionAt`, `IsSubmersion`, `IsSmoothEmbedding` | Mathlib `Geometry/Manifold/Submersion.lean:171`, `:553`; `SmoothEmbedding.lean:72` | Submersion is a local complement-chart condition. Smooth embedding bundles immersion and topological embedding, without a T2 axiom. |
| Section zero sets and their derivatives | Tau Ceti `Geometry/Manifold/VectorBundle/Section/SmoothZero.lean:63`; `Chart.lean:246`; `Manifold.lean:154`, `:169`, `:219`; `Linearization.lean:271` | Fredholm/section hypotheses and native zero-set charts are supplied. The general manifold-valued regular-fibre statement needs the target-chart construction and dimension/tangent identifications. |
| `IsContMDiffDistribution`, `IsDistributionFrameOn` | Tau Ceti `Geometry/Manifold/Distribution.lean:163`, `:87` | Smooth local frames determine distribution rank; the varying-rank kernel of x³ is not admitted as a rank-constant distribution. |
| `ProperSMul` and quotient atlas | Mathlib `Topology/Algebra/ProperAction/Basic.lean:54`; `Geometry/Manifold/Instances/Quotient.lean:49` | Properness is properness of (g,x)↦(gx,x), not freeness. The existing quotient atlas assumes a properly discontinuous action and retains the model dimension; it is not the positive-dimensional Lie quotient theorem. |
| `GroupLieAlgebra`, `LieGroup` | Mathlib `Geometry/Manifold/GroupLieAlgebra.lean:56`; `Geometry/Manifold/Algebra/LieGroup.lean:72` | Native tangent space at identity and smooth group operations; no global holonomy subgroup construction is hidden in these definitions. |
| Left-invariant tangent equivalence and exponential | Tau Ceti `Geometry/Lie/Tangent/LieEquiv.lean:103`; `Geometry/Lie/Exponential/Basic.lean:55`, `:146` | Native Lie algebra/exponential comparison. Full evolution for time-dependent group coefficients remains an owned B5 target. |
| `CovariantDerivative`, `addOneForm`, `difference` | Mathlib `Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:365`, `:489`, `:503` | Existing section-first connection operation and affine difference. B3's principal-connection comparison must use it rather than redefine it. |
| Levi-Civita and curvature operator | Mathlib `Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:359`; Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Basic.lean:85` | Existing native vector-bundle operations; principal/horizontal form constructions are distinct. |
| Riemannian metric topology | Mathlib `Topology/VectorBundle/Riemannian.lean:60`, `:468`; `Geometry/Manifold/Riemannian/Basic.lean:545` | Continuous metric carriers exist; the extended metric construction needs T3, rather than only bare charted-space data. |
| `contMDiffOn_maximalIntegralCurve` | Tau Ceti `Geometry/Manifold/IntegralCurve/Flow.lean:370` | Finite-dimensional model and 1≤n enter the smooth-flow statement. It is not unconditional global existence. |
| Local flow and parameter theorem | Tau Ceti `Analysis/ODE/InitialCondition.lean:215`; `Analysis/ODE/SmoothParameter.lean:207` | The latter has a zero-field base-parameter hypothesis. README B5 expressly supplies time rescaling before applying it. |
| `IsNormalDomain`, `riemannianLog`, log smoothness | Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Normal.lean:85`, `:224`, `:257` | Open star-shaped exponential domain, injectivity and local diffeomorphism. Smoothness is on the exponential image; uniform convex-radius shrinking is additional work. |
| `Lp`, `L2.inner_def` | Mathlib `MeasureTheory/Function/LpSpace/Basic.lean:89`; `MeasureTheory/Function/L2Space.lean:136` | AE classes of fixed-fibre functions, with integral inner product. These do not themselves construct measurable varying-fibre sections. |
| Compact smooth approximation | Mathlib `Analysis/Normed/Lp/SmoothApprox.lean:102`; `MeasureTheory/Function/ContinuousMapDense.lean:141` | Smooth approximation uses a finite-dimensional real source, Borel structure, measure finite on compacts, and 1≤p<∞. These are used only in B2's locally finite density regime. |
| Measurable restriction | Mathlib `MeasureTheory/MeasurableSpace/Embedding.lean:86`; `MeasureTheory/Measure/Restrict.lean:934` | Measurability of the subset is an actual hypothesis for the subtype embedding and map/comap identity. |
| Fibre Riesz and inner-product topology | Mathlib `Analysis/InnerProductSpace/Dual.lean:136`; `Analysis/InnerProductSpace/Defs.lean:586` | The Riesz equivalence is conjugate-linear in the complex case; native topology compatibility is explicit. |
| Matrix norms and positive square roots | Mathlib `Analysis/Matrix/Normed.lean:404`; `Analysis/Matrix/Order.lean:142`, `:148`; Tau Ceti `Analysis/Matrix/Normed.lean:33` | `linftyOpTopologicalSpace` exists as a protected noncomputable abbreviation; positive square-root inverse/determinant facts are native. Matrix smooth functional calculus remains an owned target. |
| Constant sheaf and terminal-section adjunction | Mathlib `CategoryTheory/Sites/ConstantSheaf.lean:64`, `:68`; `CategoryTheory/Limits/Shapes/IsTerminal.lean:90` | Constant sheaf is sheafification of the constant presheaf, not globally constant functions on disconnected opens. The adjunction supplies the actual map used in Lean. |
| `cechComplexFunctor` | Mathlib `CategoryTheory/Sites/SheafCohomology/Cech.lean:65` | Finite products of site objects and the specified products in the coefficient category; all tuple coordinates remain present. No augmentation quasi-isomorphism is asserted by this definition. |
| `Sheaf.H` and injective vanishing | Mathlib `CategoryTheory/Sites/SheafCohomology/Basic.lean:56`, `:94` | Cohomology is native Ext from the constant integer sheaf; injective vanishing is not smooth-real/fine-sheaf acyclicity. |
| Smooth commutative-group sheaves | Mathlib `Geometry/Manifold/Sheaf/Smooth.lean:230`, `:244` | The additive sheaf and composition map are generated by `to_additive`; their absence from a literal `def` search is not a missing API. |
| Čech augmentation and criteria | Tau Ceti `CategoryTheory/Sites/SheafCohomology/Cech.lean:198`, `:209`, `:298`, `:309` | Degree-zero components are restrictions. Degree-zero quasi-isomorphism is the cover sheaf condition; positive exactness is additionally needed for a full quasi-isomorphism. |
| Universal cover and lens-space group | Tau Ceti `AlgebraicTopology/UniversalCover/Basic.lean:68`; `AlgebraicTopology/UniversalCover/LensSpace/Basic.lean:179`; `FundamentalGroup.lean:73` | Lens carrier requires nonzero modulus and unit weights; its group comparison requires 1≤k and a fibre point. B7 uses these inputs, not a newly postulated lens carrier. |
| Singular subdivision and small chains | Tau Ceti `AlgebraicTopology/Singular/Subdivision/Homotopy.lean:239`; `Small/Equiv.lean:422` | Continuous singular subdivision/homotopy equivalence is supplied; the smooth-simplex version and integration comparison remain B6 targets with DifferentialGeometry inputs. |

**Cross-roadmap citations and ownership.** The normative writing checklist and contribution instructions were read. Main-branch shape comparisons included `Completed/UniversalCovers/README.md` and `Completed/OrthogonalL2Bases/README.md`. The supplier audit used the main copies for existing roadmaps, not revisions of those roadmaps in open work. The roadmap service's object searches covered principal bundles, associated bundles, regular fibres, kernel distributions, quotients, connections/Atiyah sequences, L² sections, good covers, Čech refinement and transport, as well as the proposed namespace. Board-package searches and the supplied readable open heads supplemented them. No other readable file declares one of the ten fully qualified Lean names.

| Citation/ownership boundary | Resolved location | Result |
|---|---|---|
| DifferentialGeometry Layers 0–2, 3.5, 5.1–5.2 and 8 | `TauCetiRoadmap/DifferentialGeometry/README.md:268`, `:816`, `:848` and the corresponding named subsections | Forms, partitions, flows, orientations, integration, smooth chains and de Rham comparison are supplied. The worker's unresolved `SmoothSimplex.integral_mextDeriv` lead is a real target in §8.4 at line 848, not a missing pinned declaration. Its finite-dimensional manifold hypotheses must travel with it. |
| LieGroups Layers 0,1,2,4 | `TauCetiRoadmap/LieGroups/README.md:233`, `:261`, `:275`, `:326` | Lie/exponential/Frobenius/integral-subgroup inputs exist. B5 does not attribute arbitrary time-dependent complete evolution to this supplier. |
| HopfRinow Layers 1–2 | `TauCetiRoadmap/HopfRinow/README.md`, Layers 1–2 | Exponential/normal-neighbourhood interfaces resolve. B6.0 additionally owns the uniform radius and finite-intersection convexity work; normal-domain data alone are not claimed to imply it. |
| AlgebraicTopology Stage 3.2, Stage 4, Stage 6.1 and 6.3 | `TauCetiRoadmap/AlgebraicTopology/README.md:480`, `:508`, `:1011`, `:1253` | Small chains, chain models, coefficient LES/Bockstein/UCT, and the tangent/local-orientation comparison are present. The compact fundamental class is constructed there independently of the later de Rham comparison. |
| UniversalCovers | `Completed/UniversalCovers/README.md` | Path lifting, universal covers and deck actions supply the quotient construction of flat bundles. It supplies covering theory, not principal transport reconstruction. |
| ComplexKahlerGeometry boundary | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:283`, `:570`, `:1407`, `:1444` | K2 consumes the scalar good-cover material; K5a and K7 consume this roadmap. Those results are no longer suppliers here. The orbit Hopf calculation does not silently import the projective comparison. |
| DGFloer boundary | `TauCetiRoadmap/DGFloer/README.md:158`, `:453` | It consumes quotient input here and owns its Hurewicz direction. B6.4's direct cocycle evaluation avoids the former reverse edge. |
| RiemannianGeometry boundary | `TauCetiRoadmap/RiemannianGeometry/README.md:538`, R3.3c | Projective/Hopf carrier comparisons stay there; this roadmap computes on its own S³/Circle orbit manifold. |
| Regular fibres and countability versus LieGroupoidsPoisson | Supplied open head, `TauCetiRoadmap/LieGroupoidsPoisson/README.md:158`, `:175` | G0.0/G0.1 expose the same prerequisite objects. Ownership is moved to this earlier supplier, as recorded in the preceding review; later groupoid work must consume them here. This is not an upward dependency of this folder. |
| Raw fixed-cover refinement versus TopologicalSheafCohomology | Supplied open head, `TauCetiRoadmap/TopologicalSheafCohomology/README.md`, Layer 1 §1.1 | The same raw maps/homotopies occur there. Their ownership moves down to B6.1, the earlier supplier; cover-colimit and general derived-comparison development stays with the later roadmap. No later theorem is consumed to prove the raw formulas here. |

Every `*Needs:*` block was read, including the per-target dependencies inside B6.1. No undeclared supplier gap is used as if available. Later ownership overlaps above are explicit moves to the earliest supplier, not grounds to add a reverse supplier edge. Consumer sections were checked for reversed supply, in particular the CKG and DGFloer edges repaired this round. The report makes no claim about inaccessible open work beyond the readable heads supplied in the brief.

**Shape and scope.** The document has the required summary, ownership, conventions, exact supplier contracts, seven layers with examples and dependencies, consumers and references. Definition families have API prose and at least three Checks; the two incorrect Checks are isolated above. The scope is a general smooth library, including nontrivial bundles and nonabelian groups, rather than only the Hopf/lens examples. There are no computational algorithms, sorry'd data, options, auxiliary Lean catalogue, or out-of-folder edits. General Čech–sheaf and vector-bundle carriers are reused rather than replaced by scalar stand-ins. B6.1's native fixed-cover coordinates are a genuine comparison target, and the displayed coordinates are not substituted for the native complex. Missing-carrier explanations are substantive and do not turn conclusions into assumptions.

## Not verifiable

Six of the nine cited works were read through legal source-service copies. All five seeded targets were verified against readable sources. Three books could not be independently checked in full:

- **lee-sm:** Lee, *Introduction to Smooth Manifolds*, second edition, Corollary 5.14, Proposition 5.38, Theorems 21.10 and 21.17. The source service reached the publisher's paywalled record and classified it uncertified. Its numbering is therefore not certified here. The regular-fibre mathematics was tested directly; the free-proper quotient route is also supported by the readable Meinrenken Theorem 1.21. No repeated request for this settled paywalled text is made.
- **lee-rm:** Lee, *Introduction to Riemannian Manifolds*, second edition, Lemma 6.16 and Theorem 6.17. The service's bibliographic/legal-copy search returned no readable text. Uniform convex-neighbourhood source numbering and the precise source hypotheses remain unverified. The README explicitly owns the extra uniform-radius/finite-intersection argument; pinned normal-domain APIs and the computed good-cover tests were independently checked.
- **kobayashi-nomizu:** *Foundations of Differential Geometry*, Volume I, the cited Chapter II material and Appendix 4. The service's bibliographic resolution reached a JSTOR book review, DOI 10.2307/2315988, not the cited book; that DOI is not treated as the book's identity. No legal full text was available. The specific Ambrose–Singer and holonomy-book locators remain unverified. KMS and Schreiber–Waldorf support several connection/transport inputs, but do not certify every cited book locator.

The two unresolved legal-text requests are recorded together in the job's reference-request artifact. They do not replace the completed mathematical review or the passing gate. No claim of fully certified bibliography or completed Lean proofs is made.

## Source issues

- **Misprint** in stacks at Tag 09UY, §15, printed p.24 (stacks lines 1072–1087): the source says the displayed insertion homotopy gives the first refinement map minus the second; it should be the second minus the first for that insertion order; affects the proof.
- **Misprint** in meinrenken at Theorem 1.25, printed p.12 (meinrenken lines 371–381): the source says the associated slice bundle is equivariantly diffeomorphic to the whole manifold; it should be an invariant open neighbourhood of the orbit; affects a stated result.
- **Misprint** in meinrenken at Example 3.16, printed p.36 (meinrenken lines 1420–1430): the source says degree-zero singular cochains on a contractible intersection are constant; it should be the locally constant degree-zero subcomplex under discussion; affects the proof.
- **Misprint** in nicolaescu at the proof of Theorem 7.5.38, printed p.329 (nicolaescu line 14858): the source says the kernel term preceding forms of degree k−1 is closed forms of degree k; it should be closed forms of degree k−1; affects the proof.
- **Misprint** in schreiber-waldorf at Lemma B.2, printed p.64 (schreiber-waldorf lines 2401–2406): the source says the derivatives of γ₁ and γ₂ agree although only γ₀ and γ₁ were introduced; it should be the derivatives of γ₀ and γ₁; affects the proof.
- **Error** in schreiber-waldorf at Lemma B.3, printed p.65, equation (B.16) (schreiber-waldorf lines 2453–2462): the source says φ(u+β(tτ)v) gives endpoint derivative dφ(v) at τ=0; it should use φ(u+τβ(t)v), since a sitting function has β′(0)=0; affects the proof.
