# Review of SmoothBundlesConnections (pull request #887 at 48a5638)

**Verdict:** accepted

No finding. This is an incremental re-review of the 15 lines changed since `edc9f48` (both in `TauCetiRoadmap/SmoothBundlesConnections/README.md`: the B5.0 horizontality Check at lines 1098–1103 and the B6.1 exponential connecting-class Check at lines 1646–1652). Nothing outside the folder changed and `Suggested.lean` is byte-identical to the head the previous review read. Both changed Checks were recomputed from the roadmap's own conventions and both are correct; the previous review's two findings are repaired and the repairs introduce no new problem.

## Previous findings

- R01 — repaired: README 1646–1652, “the smooth function `z ↦ z` has `δ_sm(z ↦ z)=−e`: with `t=θ/(2π)` and successive arcs `0→1→2→0`, choose local logarithms whose differences at the crossings are `0, 0, −1`”. The crossing values, the branch choice and the total-complex cross-check `[δf]=−[df]` with `∫df=1` are all stated and all recompute to −1 (rows 1–3 of the table below). The sign now agrees with the first Check's generator, with the degree-one loop evaluation and with the de Rham edge, so no other convention of B6–B7 had to move.
- R02 — repaired: README 1098–1103, “the equation `ġ = dR_g(A(γ̇))` instead gives horizontality for the connection with potential `−A` in this fixed trivialization, whose form is `θ_MC − Ad(g⁻¹)A` (B3.1)”, followed by the circle witness `ω = dθ + dx`, `θ(t)=t`: `ω(ṗ)=2`, `(−ω)(ṗ)=−2`, `(dθ−dx)(ṗ)=0`, `(dθ−dx)(∂_θ)=1`, `(−ω)(∂_θ)=−1`. Every value recomputes (rows 4–5 below); the appeal to B3.1 is to its potential law `A′=Ad(g⁻¹)A+g⁻¹dg` with `A` replaced by `−A`, which gives exactly the displayed form.

## Verified sound

**Scope of this round.** The diff (`changes.md`) touches two Checks and nothing else; no target statement, hypothesis, `*Needs:*` line, supplier citation, Lean declaration or file outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SmoothBundlesConnections'` is empty; `git diff --stat edc9f48..HEAD` lists only the README, 12 insertions and 3 deletions). The passages that depend on the changed Checks were re-read: the Conventions on the Bockstein and holonomy character (README 182–192), B3.1's potential law and Maurer–Cartan Check (README 882–897), the B6.1 connecting-morphism target (README 1533–1552), the B6.1 Checks on the three-arc generator, the `D=δ+(−1)^p d` sign, the constant function and the degree-one loop evaluation (README 1636–1661), and B6.2's definition of `c₁` by the exponential connecting map on the dual-character cocycle (README 1670–1683).

**Gate, build and elaboration.** The worker's gate at this head reports every check zero, ending `build=0 OK`. I elaborated `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean` directly with `lake env lean`: exit 0, exactly six `declaration uses 'sorry'` warnings (lines 69, 98, 155, 162, 205, 215) and no other diagnostic. A scratch file importing the built module with `#check @name` for all ten declarations (six theorems, three definitions, one structure) elaborated with exit 0; each elaborated type agrees with its README statement and with the previous report's reading: the regular-fibre theorem carries `Boundaryless`, `IsManifold I ⊤`, finite dimension and surjective `mfderiv` at fibre points and no T2 assumption; the free-proper-quotient theorem carries `T2Space`, `SecondCountableTopology`, `LieGroup`, `ProperSMul`, smoothness of the action and freeness; the two good-cover theorems carry `T2Space` with second countability, respectively compactness; the constant-section bijection is an iff with nonemptiness of the tuple intersection; smooth-sheaf acyclicity has `0 < n`. No binder was lost. Since the Lean file is unchanged, the previous report's one-tactic padding probe (`simp`, `rfl`, `infer_instance` on each of the six admissions, all failing) stands for this head; nothing in the file mirrors the two changed Checks.

The independent dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1458 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line was printed. The edge count rose by one against the previous report's run because the content snapshot gained a roadmap, not because this README gained a supplier: its `*Needs:*` lines are unchanged.

**Seeded sample, where it falls in the change.** The changed B6.1 Check is a Check of the Čech–de Rham–singular comparison and exercises the sampled target “Coefficient maps and the connecting morphism” (README 1533–1552). Its locator was re-read in the legal source-service extraction of Nicolaescu's lectures: Theorem 7.5.28 at `nicolaescu` lines 14747–14763, printed p. 326 (natural long exact sequence of a short exact sequence of sheaves on a paracompact space, with the connecting map constructed by lifting Čech cochains), and Remark 8.2.2 at `nicolaescu` lines 15623–15657, printed pp. 350–351 (the smooth exponential sequence `0→ℤ→C∞(ℝ)→C∞(S¹)→0`, the fine middle sheaf, and the connecting class represented by the integer cocycle of the lifted logarithms). The source constructs the class exactly as the Check does, by Čech coboundary of local lifts, and fixes no sign for the identity map, so the Check's value is the roadmap's own computation under its stated conventions. The other four sampled targets (“Sheaves and exactness”, “Native fixed-cover complex and the displayed coordinates”, “Augmentation is a separate, conditional comparison”, “Raw refinement maps and homotopies”) are untouched by the diff; their verification in the previous report at `nicolaescu`, `stacks` and `meinrenken` stands and is not repeated. No README locator is flagged unverified. The changed B5.0 Check cites only B3.1.

**Citations.** The worker's one unresolved lead, `SmoothSimplex.integral_mextDeriv` at README 200, is a target of DifferentialGeometry §8.4 on main (`TauCetiRoadmap/DifferentialGeometry/README.md:848`), cited as a supplier target and not claimed as a pinned declaration; it is absent from the pinned Mathlib and Tau Ceti, as a roadmap target should be. The changed passages introduce no new cross-roadmap citation (the B5.0 Check's “(B3.1)” is internal) and no new object whose ownership could lie with another roadmap, so the previous report's ownership audit against main and the supplied open heads is unchanged; ownership against open pull requests whose files the brief does not supply was not checked.

**Adversarial computations.** Rows 1–6 are new and cover every changed statement and the Checks adjacent to them that share a convention. The remaining rows are carried from the previous report (marked “r5”) for statements the diff leaves untouched; they were not recomputed this round.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Exponential connecting class of `z ↦ z`, B6.1 Check (changed) | three-arc cover, `t=θ/(2π)`, arcs U₀∋t∈(−0.1,0.4), U₁∋t∈(0.3,0.7), U₂∋t∈(0.6,1.1); lifts f₀=t, f₁=t, f₂=t; Čech `(δf)_ij=f_j−f_i`; crossing i→j contributes `c_ij` | at the crossings 0→1 (t≈0.35): 0; 1→2 (t≈0.65): 0; 2→0 (t≈0.95, where f₀=t−1=−0.05 and f₂=0.95): −1; sum −1; the integer class evaluates to −1 on the positive loop, i.e. `−e` | Check correct | none |
| Same Check, branch independence | lifts f₀=t+k, f₁=t+m, f₂=t+n with integers k,m,n | crossings m−k, n−m, (k−1)−n; sum −1 for every k,m,n | Value is a class invariant, not a branch artefact | none |
| Same Check, total-complex cross-check | `D=δ+(−1)^p d` on the (0,0)-cochain f | `Df=δf+df` with `d(δf)=0` and `δ(df)=0`, so `[δf]=−[df]`; `df=dθ/(2π)`, `∫_{S¹}df=1`; hence −1, agreeing with the crossing sum | Both computations agree | none |
| Group-equation negative control, B5.0 Check (changed) | trivial circle bundle over ℝ, `ω=dθ+dx` (A=dx), γ(t)=t, θ(0)=0 | negative-sign law `θ̇=−A(γ̇)=−1` gives θ(t)=−t and `ω(ṗ)=1−1=0`; positive-sign law gives θ(t)=t, `ω(ṗ)=1+1=2`, `(−ω)(ṗ)=−2`, `(dθ−dx)(ṗ)=1−1=0`, `(dθ−dx)(∂_θ)=1`, `(−ω)(∂_θ)=−1`, `ker(−ω)=ker ω` | Correct theorem, correct negative control | none |
| Same Check, general group | `ġ=dR_g(A(γ̇))` for a matrix group, `dR_g X=Xg` | `g⁻¹ġ=Ad(g⁻¹)A(γ̇)`, so `(θ_MC−Ad(g⁻¹)A)(ṗ)=0`; B3.1's law with `A↦−A` gives potential `Ad(g⁻¹)(−A)+g⁻¹dg`, the displayed form | The cited form is the connection with potential −A | none |
| Consistency of the changed B6.1 Check with the first and last B6.1 Checks and the de Rham edge | integer cocycle `c_01=1`, `c_12=c_20=0`; partition of unity ρ₀,ρ₁,ρ₂ with empty triple overlaps; `f_i=Σ_k ρ_k c_ki` | f=(−ρ₁, ρ₀, 0), `δf=c`; global form ω=df equals `dρ₀` on U₀₁ and 0 elsewhere; `∫ω=0−1=−1`; `[c]=−[df]` evaluates to +1 = loop evaluation `1+0+0`; `dθ/(2π)` integrates to 1 and maps to the same class `e`; so `δ_sm(id)=−e` is the only value compatible with these | Conventions mutually consistent | none |
| Right-action fundamental fields, Conventions | G=GL₂, A=E₁₂, B=E₂₁ | A#(g)=gA; bracket=g(AB−BA)=g diag(1,−1); left-action fields give the negative | Sign distinguished | retain (r5) |
| Circle parameter and dual character | t=π/2, real curvature F | exp(it)=i; derivative of inverse character=−i; (i/2π)(−iF)=F/(2π) | Consistent | retain (r5) |
| Curvature wedge normalization | ω(X)=E₁₂, ω(Y)=E₂₁ | [ω∧ω](X,Y)=2 diag(1,−1); half equals [ω(X),ω(Y)] | Factor 1/2 used | retain (r5) |
| Regular-fibre atlas and tangent image, B1.0 / Lean 69 | f:ℝ²→ℝ, f(x,y)=x, c=3 | fibre={(3,y)}; dimension 2−1=1; inclusion derivative range=span(0,1)=ker df | Both conclusions | retain (r5) |
| Regular-fibre open restriction | same f, U={y>0} | restricted fibre={(3,y):y>0}=U∩f⁻¹(3) | Open-manifold structure agrees | retain (r5) |
| Regular-fibre universal property | u(t)=(3,t²) into that fibre | fibre coordinate t² smooth; composite (3,t²) smooth; for coordinate abs(t), both fail at 0 | Both implications discriminate | retain (r5) |
| Regular-fibre chart independence | target charts φ(t)=t, ψ(t)=2t | zero equations x−3=0 and 2(x−3)=0; both tangent kernels span(0,1); identity coordinate y | Same smooth structure | retain (r5) |
| Regular-fibre degeneracies | point→ℝ, c outside image; doubled-origin line→ℝ | empty fibre has dimension 0−1=0 by natural subtraction; doubled-origin zero fibre has two discrete points, tangent 0 at each | No T2 or nonemptiness needed | retain (r5) |
| Regular-value negative control | f=x²−y² at (0,0) | df=0, range={0}≠ℝ; zero set has four local branches | Excluded by surjectivity | retain (r5) |
| Sphere regular fibre | f=x²+y², c=1 | df_(x,y)(u,v)=2xu+2yv; tangent kernel perpendicular to (x,y), dimension 1 | Native circle tangent agrees | retain (r5) |
| Transverse fibre-product inclusion/tangent, B1.0 | f=g=id_ℝ | fibre={(x,x)}; kernel of (u,v)↦u−v=diagonal; dimension 1+1−1=1 | Correct | retain (r5) |
| Fibre-product projection submersions | f:ℝ²→ℝ first projection, g:Y→ℝ constant 3 | product={3}×ℝ×Y; map to Y is projection with surjective derivative | Other map's submersion used | retain (r5) |
| Fibre-product failure without transversality | f=g=x² at zero | range df+range dg=0; product x²=y² crosses at zero | Non-example | retain (r5) |
| Kernel distribution and pulled-back frames | projection ℝ³→ℝ; x↦x³ on ℝ | first kernel span(e₂,e₃), rank 2 and constant after pullback; latter rank 1 at 0, rank 0 at 1 | Constant-rank hypothesis used | retain (r5) |
| Principal trivializations and torsors, B1.1 | M×G, right multiplication | chart((x,g)h)=(x,gh); for h solving gh=k, h=g⁻¹k | Correct equivariance/uniqueness | retain (r5) |
| Division order | S₃, p=(12), q=(23), products rightmost first | p⁻¹q=(123), qp⁻¹=(132); p(p⁻¹q)=q, p(qp⁻¹)=(13)≠q | Nonabelian discriminator | retain (r5) |
| Projection and vertical orbit derivative | M×G→M; finite G | derivative (v,a)↦v; kernel 0×𝔤=orbit range; finite G gives dimension 0 | Correct submersion/vertical claims | retain (r5) |
| Smooth descent | Hopf sphere p; F(p)=abs(z₁)², Re(z₁) | F(pλ)=F(p); at p=(1,0), Re(p)=1 and Re(p·(−1))=−1 | First descends, second cannot | retain (r5) |
| Surjective-submersion converse | G→point; nontrivial G acting trivially on point | first action free/transitive and fibre=G; second has every g in stabilizer | Freeness excludes wrong bundle | retain (r5) |
| Trivial/restricted/pulled-back bundles, B1.2 | identity, inclusion U→M, composite f∘g | id*(M×G)=M×G; restriction=U×G; both composite pullbacks have fibre G at each x | Universal maps agree pointwise | retain (r5) |
| Products of principal bundles | trivial G and H bundles | fibre G×H; ((g,h)·(a,b))=(ga,hb); division=(g⁻¹g′,h⁻¹h′) | Principal product | retain (r5) |
| Left-to-right action conversion | G on itself by left multiplication | p·g=g⁻¹p; derivative at 0=−Ap; bracket of −Aᴿ,−Bᴿ=−[A,B]ᴿ | Preserves right-action bracket convention | retain (r5) |
| Cocycle and 0-cochain change, B1.3 | s_j=s_i g_ij; replacements h_i | s_k=s_i g_ij g_jk gives g_ik; new transition h_i⁻¹g_ijh_j; coboundary factors cancel on triples | Cocycle/gluing laws | retain (r5) |
| Hopf transition and nontrivial cover | z=i in affine Hopf charts; double cover of S¹ | s₁=s₀(−i), so g₀₁=bar(z)/abs(z)=−i; Z/2 cocycle differing on overlap components has monodromy −1 | Inverse and trivial-cocycle alternatives excluded | retain (r5) |
| Compact averaging, B1.4 | swap on ℝ², h=diag(1,4) | (h+swap*h)/2=diag(5/2,5/2); twice Haar probability gives diag(5,5) | Normalization and positivity | retain (r5) |
| Equivariant exponential chart | trivial action in Euclidean model, rank 0 | exp_x(v)=x+v, derivative id; zero-dimensional chart has one point | Local-chart conditions | retain (r5) |
| Free proper quotient, Lean 98 | trivial G; ℤ translations on ℝ; Hopf Circle action | quotients M, ℝ/ℤ, S²; dimensions dim M−0, 1−0=1, 3−1=2; projection ranks respectively dim M,1,2 | Generality exceeds discrete quotient API | retain (r5) |
| Free proper quotient empty/negative cases | dim M=0 with M empty and dim G=1; irrational flow on T² | empty quotient dimension 0−1=0; irrational flow has stabilizer 0 but compact square has noncompact inverse image | Empty case valid; nonproper case excluded | retain (r5) |
| Slice and finite-isotropy charts | weighted Circle action (λz₁,λ²z₂), at (0,1) | stabilizer={±1}; slice z₁ transforms by sign; transverse quotient is ℂ/{±1} | Nontrivial isotropy retained | retain (r5) |
| Principal-action properness | trivial bundle over Hausdorff M | (p,g)↦(p,pg) inverse (p,q)↦(p,δ(p,q)); image π(p)=π(q) closed | Correct homeomorphism/closedness argument | retain (r5) |
| Homogeneous spaces | SO(3)/SO(2) | quotient=S²; tangent dimension 3−1=2, vertical dimension 1 | Principal homogeneous model | retain (r5) |
| Ehresmann splitting, B1.5 | ℝ²→ℝ, H=span(1,y²) | (a,b)=(a,ay²)+(0,b−ay²); horizontal+vertical=id, intersection=0 | Complement determines connection | retain (r5) |
| Ehresmann transport/maximal interval | y′=y², y(0)=1 | y(t)=1/(1−t), blows up at 1; product connection y′=0 gives y(t)=1 | Completeness not automatic | retain (r5) |
| Ehresmann fibration theorem | proper projection B×S¹→B | fibre S¹; radial transport gives (b,z)↦(b,z); all fibres diffeomorphic | Headline model | retain (r5) |
| Ehresmann hypotheses | ℝ² minus origin→ℝ; disconnected base with one/two-point fibres | fibre at 0 has two components, at 1 one; disconnected example has cardinalities 1 and 2 | Properness/connectedness used as specified | retain (r5) |
| Associated quotient and equivariant sections, B2.1 | frame f, matrix g, vector v | (f∘g)(v)=f(gv); section coordinate changes u(pg)=g⁻¹u(p); wrong inverse relation gives f(gv)≠f(g⁻¹v) | Quotient convention coherent | retain (r5) |
| Associated trivial representation | ρ(g)=id on V | [p,v]↦(π(p),v); u(pg)=u(p); section space functions M→V | Trivial bundle recovered | retain (r5) |
| Tensor/dual/exterior/Hom constructions | E=ℝ², determinant line; rank 0 | transition diag(2,3) gives determinant 6, dual diag(1/2,1/3), Hom conjugation; exterior degree 3=0 | Fibrewise operations discriminate | retain (r5) |
| Complexification/dual comparison | V=D=ℝ, z=i,w=2, ℓ(1)=1 | evaluation zw=2i; conjugation twice=id; real inclusion fixed | Complex-linear dual, not Hermitian dual | retain (r5) |
| Hermitian fibre convention | u=i,v=1 | h(i,1)=−i; h(1,i)=i; real part on u=u is 1 | First slot conjugate-linear | retain (r5) |
| Metric norm/topology, B2.2 | line h=4h₀ | norm_h(v)=2 abs(v); same open sets; h=0 would assign norm 0 to v=1 | Positive definiteness needed | retain (r5) |
| Section measurability and frame change | measurable s, transition −1 on Möbius overlap | coordinates s and −s have equal norm and the same measurable preimages up to reflection | Atlas independence model | retain (r5) |
| L² quotient and integral inner product | one point of mass 3, rank 1 | norm²(s)=3 abs(s)²; inner(s,t)=3 conjugate(s)t; zero measure identifies every s with 0 | Correct quotient/measure dependence | retain (r5) |
| Completeness and finite rank | one point, unit mass, fibre c₀₀ | partial sums Σ_{k≤N}2^(−k)e_k are Cauchy, limit not in c₀₀; finite ℝⁿ has its usual complete norm | Finite-rank condition excludes counterexample | retain (r5) |
| Unitary versus arbitrary charts | frame (e₁,2e₂) | coordinate e₂=(0,1/2) has norm 1/2 versus fibre norm 1; synthesis (0,1) has norm 2; orthonormal frame gives 1=1 | Bounded isomorphism ≠ isometry | retain (r5) |
| Noncompact frame bounds | line frame e^x over ℝ | synthesis multiplier e^x unbounded; on [−R,R], bounds e^(−R),e^R | Compact-domain qualification necessary | retain (r5) |
| Smooth density and faithful embedding | Lebesgue measure versus zero measure | continuous nonzero section has positive norm on some open set for Lebesgue; zero measure gives norm 0 even for nonzero bump | Open-positive hypothesis used | retain (r5) |
| Locally finite density/separability | rank n over ℝ, compact exhaustion [−m,m] | finite local measure and countably many charts/approximants; direct sum of countably many separable local L² spaces remains separable | Stated locally finite regime | retain (r5) |
| Restriction/zero extension, B2.3 | two points of mass 1, s=(3,4), U={first} | norms²:25=9+16; projections (3,0),(0,4); cross inner product=0 | Orthogonal decomposition | retain (r5) |
| Bounded multipliers and adjoints | f=2i on one point | M_f(3)=6i; norm=2; adjoint multiplier=−2i; compositions multiply scalars | Correct complex adjoint | retain (r5) |
| Indicator operator exact criterion | positive finite mass, null set, rank 0, infinite point mass | norms respectively 1,0,0,0; infinite mass forces L²={0} | README includes all exceptions | retain (r5) |
| Metric-change unitary | h₁=4h₀, s=3 | H=4, sqrt(H)=2; norm²_h₁(3)=36=norm²_h₀(6); wrong inverse gives 9/4 | Direction fixed | retain (r5) |
| Equivalent-measure unitary | masses μ=1, ν=9 | s=2 has ν norm²=36; sqrt(w)s=6 has μ norm²=36; w=0 gives zero image | Positivity used for surjectivity | retain (r5) |
| Fibre Riesz and dual metric | ℂ, u=i,v=1 | R(i)(1)=−i; h*(R(i),R(1))=i=h(1,i); R(iu)=−iR(u) | Conjugate-linearity and reversal correct | retain (r5) |
| Integral duality | one point of mass 2, φ(z)=3z | pairing with s is 6s; functional norm=3√2=norm_L²(φ) | Complex-linear in dual section | retain (r5) |
| L² complexification | real s=3,t=4 | s+it=3+4i; norm²=25=9+16; J(3,4)=(−4,3) | Product norm and complex structure | retain (r5) |
| Unitary base transport | circle rotation φ by a, s(θ)=e^(iθ) | U s(θ)=e^(i(θ−a)); norm²=2π; inverse shift by +a recovers s | Measure-preserving direction correct | retain (r5) |
| Density measures, B2.4 | dxdy, 2dxdy, round circle | rectangle mass 1 versus 2; circle mass 2π; orientation reversal leaves measure positive | Correct measure/integral distinction | retain (r5) |
| Frame recovery and groupoids, B2.5 | rank 1 frame f(v)=2v | [f,3]↦6; [f∘(×3),1]↦6; inverse maps require invertible frames | Groupoids of isomorphisms used | retain (r5) |
| Closed-subgroup reduction | GL₁(ℝ), H=O(1) | G/H positive scales; scale 2 determines a metric; induced extension restores GL₁ fibre | Sections/reductions comparison | retain (r5) |
| Adjoint bracket and invariant pairing | abelian circle; GL₂; su(2) | brackets 0, AB−BA; for orthonormal su(2) generators Killing form negative, its negative positive | Claimed signs and nondegeneracy | retain (r5) |
| Circle extension/tensor/dual | degree k=1 line, z↦z² and z↦z⁻¹ | classes 2 and −1; tensor with inverse has class 0 | Operations consistent with B6 | retain (r5) |
| Möbius L² example | s(t)=sin(t/2) | s(t+2π)=−s(t); integral over one period=π, over ℝ=∞ | Correct one-period norm | retain (r5) |
| Connection axioms, B3.1 | Maurer–Cartan on G; Hopf on unit S³ | θ_g(gA)=A; Im(conjugate(z)iz)=1; negative form reproduces −1 | Axioms exclude zero/negative form | retain (r5) |
| Connection affine difference/existence | circle forms dθ+A and dθ+B | difference=B−A, zero on ∂θ; sum gives 2 on ∂θ; weighted sum with weights summing 1 gives 1 | Affine, not vector space | retain (r5) |
| Potential transformation/gluing | circle g=e^(ix), A=0 | A′=dx; overlap differences dφ add, triple sum derivative of 2πn=0 | Correct local gluing | retain (r5) |
| Maurer–Cartan equation | A=E₁₂, B=E₂₁ left-invariant | dθ(Aᴸ,Bᴸ)=−diag(1,−1); half bracket wedge=+diag(1,−1); sum 0 | Nonabelian sign/factor | retain (r5) |
| Atiyah exact sequence, B3.2 | trivial bundle over ℝ, G=Circle | TP/G=ℝ⊕ℝ; j(a)=(0,−a); projection (v,a)↦v; kernel=image j | Exactness and injection | retain (r5) |
| Atiyah bracket injection | M=point, noncommuting A,B | [V_A,V_B]=−V_[A,B]; [−V_A,−V_B]=−V_[A,B]=j([A,B]) | Negative injection necessary | retain (r5) |
| Curvature splitting defect | circle potential A=x dy on ℝ² | Xʰ=∂x, Yʰ=∂y−x∂θ; bracket=−∂θ; j(F(X,Y))=−∂θ | Formula and sign | retain (r5) |
| Associated derivative/curvature, B3.3 | dual circle character, A=xdy | ∇=d−ixdy; commutator on constant section=−i dx∧dy; standard character gives +i | Matches F normalization | retain (r5) |
| Tensor/dual/Hom pairing laws | scalar connection d+a on E | dual d−a; End(E) coefficient a−a=0; ∇id=0 | Pairing preserved | retain (r5) |
| Invariant tensors and metric reductions | O(1), nonzero real scalar a | Lie algebra o(1)=0; compatible potential=0; d+a changes length derivative by 2a | Noncompatible alternative excluded | retain (r5) |
| Curvature horizontal/equivariant, B4.1 | basic F=dx∧dy in trivial circle bundle | F(∂θ,·)=0; right pullback F=F; base pullback f(x,y)=(2x,y) gives 2dx∧dy | Descent/pullback | retain (r5) |
| Exterior covariant square/Bianchi | dual circle connection A=xdy | d_∇²1=−i dx∧dy; dF=0; flat A=0 gives square 0 | Curvature action not zero generally | retain (r5) |
| Curvature addition | A=0, a=Xdx+Ydy | da=0; half[a∧a]=[X,Y]dx∧dy=F_a; abelian X,Y gives 0 | Nonabelian quadratic term | retain (r5) |
| Paired Leibniz/integration by parts | circle α=sin θ, β=cos θ, degree α=0 | ∫dα·β=π; −∫α dβ=π; without minus RHS=−π | Sign discriminates | retain (r5) |
| Gauge composition, B4.2 | equivariant u,v at p | Φ_uΦ_v(p)=p v(v⁻¹uv)=p uv=Φ_uv(p); wrong equivariance leaves noncanceling factors | Group law correct | retain (r5) |
| Left versus right gauge curvature | SO(3), A=sin x Xdy, g=quarter turn about z | at x=0, left F=Ydx∧dy; right F=−Ydx∧dy; both norms²=1 | Previous repair persists | retain (r5) |
| Gauge infinitesimal actions | circle u=e^(itξ) | pullback derivative dξ; inverse pullback derivative −dξ; on sections dual character derivative −iξ | Covariance signs | retain (r5) |
| Gauge stabilizer | connected S¹, trivial flat circle connection | connection-preserving u has du=0, so constants Circle=centralizer(Circle holonomy) | Holonomy statement uses B5.2 as its Check says | retain; sequence after B5.2 (r5) |
| Angular torus gauge lattice | A=a dx+b dy, u=e^(i(mx+ny)) | shift (a,b)↦(a+m,b+n); periods shift (2πm,2πn); a=1 yields holonomy 1 | Coefficients versus periods | retain (r5) |
| Transport identity/inverse/composition | circle constant A=a dθ, segment lengths s,t | T_0=1; T_−t=e^(iat)=T_t⁻¹; T_t T_s=e^(−ia(s+t)) | Laws agree | retain (r5) |
| Smooth family and group completeness | a varying over bounded parameter set, compact time interval | g(a,t)=e^(−iat) smooth for all finite t; y′=y² instead blows up at t=1 | Principal versus general Ehresmann | retain (r5) |
| Thin groupoid and transport, B5.1 | constant path; a path followed by reverse | classes identity; transports 1 and T⁻¹T=1; rank-one retracing homotopy has no area | Identity/inverse conditions | retain (r5) |
| Reconstruction −∂P | scalar potential A=2, displacement vt | P=e^(−2vt); −∂tP at 0=2v=A(v); P=1 gives A=0 | Sign and linearity | retain (r5) |
| First-variation additivity | small triangle with sides tv,tw | curvature contribution is O(t²); derivative at t=0 is 0; A(v+w)=A(v)+A(w) | Wrong first-order area term excluded | retain (r5) |
| Passive-frame transport law | scalar flat transport, new frame g(x)=e^x | P′_(x→y)=e^(x−y); −∂yP′ at y=x=1=g⁻¹dg(∂x) | Frame derivative required | retain (r5) |
| Inverse-transport derivative | P=e^(−2t), σ=3+5t | derivative of e^(2t)(3+5t) at 0=11=5+2·3; wrong sign gives −1 | Exact retained Check | retain (r5) |
| Reconstruction inverse/metric compatibility | constant skew-adjoint A=i; real A=1 | recovered A=i, norm exp(−it)=1; exp(−t) changes norm and is not isometric | Both directions discriminate | retain (r5) |
| Noninvertible intertwiners | two trivial flat lines, bundle map zero; map multiplication x | zero intertwines T=id and has derivative 0; multiplication x fails by y−x on transport | Morphisms need not be invertible | retain (r5) |
| Flat dictionary, B5.2 | S¹, G=S₃ and G=Z/2 | Hom(Z,S₃)/conj has 3 classes; Hom(Z,Z/2) has 2; point has 1 | Nonabelian/abelian examples | retain (r5) |
| Universal-cover inverse convention | ρ(γ)=h; lifted endpoint (a₀·γ,1) | quotient relation identifies it with (a₀,h); holonomy=h, not h⁻¹ | Right deck/action adapter | retain (r5) |
| Basepoint conjugation | h=(123), g=(12) in S₃ | g⁻¹hg=(132); same unbased conjugacy class | Based formula correct | retain (r5) |
| Flatness iff local parallel frames | A=xdy versus A=a dθ on S¹ | first F=dx∧dy and bracket defect −∂θ; second F=0 and local parallel section e^(−iaθ) | Both directions | retain (r5) |
| Fundamental-group countability | T², L(3,1), ℝ⁰, Hawaiian earring | groups Z², Z/3, 1 countable; earring uncountable and not locally simply connected | Hypothesis excludes failure | retain (r5) |
| Ambrose–Singer | Hopf connection; flat connection | Hopf curvature span=ℝ=Lie(Circle); flat span=0=Lie(H⁰) | Headline values | retain (r5) |
| Immersed holonomy topology | irrational cyclic holonomy in T² | H≅Z discrete, H⁰=1, dim H=0; subspace H is dense and nondiscrete | Wrong topology excluded | retain (r5) |
| Full/restricted holonomy reductions | character k=2 on L(6,1) | image μ₃, kernel Z/2; Q=S³/μ₂; Q/H⁰=Q since H⁰=1 | Covering base necessary | retain (r5) |
| SmoothGoodCover body | ℝ, centre 0, ρ(t)x; zero map proposed instead | endpoints 0 and x, centre fixed; zero map at t=1 gives 0≠1 for x=1 | Definition determines contraction | retain (r5) |
| Good-cover connected intersections | ball versus two-component overlap and annulus | ball contracts; two components cannot connect to one centre; annulus π₁=Z | Both excluded wrong members | retain (r5) |
| Good-cover existence, Lean 155 | empty manifold, discrete manifold | empty index covers ∅; singleton opens have constant one-point contractions and locally finite family | Degeneracies valid | retain (r5) |
| Finite-good-cover existence, Lean 162 | compact discrete manifold with k points | k singleton members; k=0 gives empty cover; finite atlas gives countable basis | No lost second-countability requirement | retain (r5) |
| Uniform convexity/normal domains, B6.0 | round circle, Euclidean ball | circle admissible radius π/2, opposite points at distance π have two minimizers; Euclidean log_q(x)=x−q | Cut-locus distinction | retain (r5) |
| Raw and reparametrized contractions | ball (−1,1), x=3/4 | raw 2x=3/2 lies outside; ρ(2)x=3/4 lies inside; times 0,1 give 0,x | Domain correction essential | retain (r5) |
| Smooth sheaf exactness, sampled | exponential ℝ→Circle at 0 and identity on S¹ | kernel Z for exp(2πit); local log exists; global identity has winding 1 and no real lift | Stalk-exact, not section-surjective | retain (r5) |
| Smooth sheaf acyclicity, Lean 215 | S¹, positive degree 1; degree 0 | H¹(C∞ℝ)=0 versus H¹(ℝ_const)=ℝ; H⁰(C∞ℝ) contains constant 1≠0 | n>0 used | retain (r5) |
| Constant sheaf versus presheaf | empty open, disconnected two-point open | sheaf sections 0 and ℝ²; constant presheaf sections ℝ and ℝ | Actual sheaf necessary | retain (r5) |
| Tuple intersection definition, Lean 169 | i=(a,a,b); disjoint a,b | intersection U_a∩U_b with repeats removed set-theoretically; if disjoint gives ∅ | Matches categorical product, not tuple deletion | retain (r5) |
| Constant-section map, Lean 185/205 | connected nonempty W; empty W; two components | maps r↦constant r bijective; ℝ→0 noninjective; r↦(r,r) misses (0,1) | Both directions of iff; good-cover hypothesis used | retain (r5) |
| Native differential, sampled | c=(2,5); repeated (a,a); triple | δc(a,b)=3; δc(a,a)=0; for c₀₁=2,c₁₂=5,c₀₂=7, δc=5−7+2=0 | Ordered-face signs | retain (r5) |
| Native degreewise coordinate comparison | singleton cover of point, coefficient ℝ | each degree has ℝ; differentials 0,1,0,1; coordinates and native complex have same sequence | Repetitions retained | retain (r5) |
| Augmentation degree 0, sampled | singleton cover X; two identical copies | s↦s; s↦(s,s) whose differential is s−s=0 | Native restriction component agrees | retain (r5) |
| Full augmentation conditionality | good cover of S¹, constant vs smooth ℝ | constant: source H¹=0, target H¹=ℝ; smooth: both 0; H⁰ glued sections in both | False general quasi-isomorphism excluded | retain (r5) |
| Raw refinement maps, sampled | U=(X,X), V=(X), r=0,s=1 | T_r(2,5)=2, T_s(2,5)=5; on cocycle (7,7), both 7 | Chain maps differ; cohomology maps agree | retain (r5) |
| Refinement insertion homotopy degree 0 | same example over ℤ and F₂ | hδ=5−2=3=T_s−T_r; mod 2 both=1; reverse difference over Z=−3 | Correct README sign | retain (r5) |
| Refinement insertion degree 1 | arbitrary α, two fine indices j₀,j₁ | δh+hδ cancels mixed terms, leaves α_(sj₀,sj₁)−α_(rj₀,rj₁) | Same sign in next degree | retain (r5) |
| Refinement identity/composition/naturality | (2,3,5), select index 2 then singleton; mod 2 | composite and successive maps both 5; reduced value 1 on both routes; identity leaves (2,3,5) | Strict laws | retain (r5) |
| Refinement products/universes | N-indexed repeated point cover in Q-modules | C⁰=Q^N; coordinate maps defined; finite-dimensional category has no Q^N object | Product hypothesis meaningful | retain (r5) |
| Raw presheaf negative control | P(∅)=Z, P(nonempty)=0, two discrete points | C⁰=0, C¹=Z²; cocycles (a,−a), boundaries 0, H¹=Z | Correct non-sheaf example | retain (r5) |
| Constant-presheaf comparison on same cover | every P(U)=Z, identity restrictions | dimensions C⁰=2,C¹=4; ranks d⁰=1,d¹=3; H¹ rank=4−3−1=0 | Earlier counterexample repair survives | retain (r5) |
| Coefficient connecting maps, sampled | constant section exp(2πia) | lift a gives δa=0 in both sequences; δ_sm∘H⁰(j)=0=δ_const | Naturality degree 0 | retain (r5) |
| Smooth/constant inclusion not isomorphism | S² in degree 1 | H¹((R/Z)_const)=0; H¹(C∞(R/Z))=Z; map 0→Z | No false identification | retain (r5) |
| Total Čech/de Rham sign | ω₀=xdy,ω₁=0 | δdω=−dx∧dy=dδω; correct cross term=0; unsigned total gives −2dx∧dy | D²=0 | retain (r5) |
| Smooth/singular restriction and small chains | point; an interval split into two cover members | point H⁰=R,Hⁿ>0=0 on both; subdividing interval gives [0,1/2]+[1/2,1], boundary [1]−[0] on both | Comparison models agree | retain (r5) |
| Integration naturality | f(t)=2t, c=[0,1], η=dx | integral on f_*c=2; integral f*η=∫2dt=2 | Normalization fixed | retain (r5) |
| One de Rham comparison/exact forms | S¹, dθ; interval, dx=d(x) | ∫S¹dθ=2π; exact interval class=0 in both cohomologies | Integral normalization, not arbitrary isomorphism | retain (r5) |
| Fundamental-class pairing | S¹ and Hopf base | dθ pairing=2π=integral; Hopf F pairing=2π=integral | Normalized target | retain (r5) |
| Degree-one loop evaluation | triple-circle cover c₀₁=1,c₁₂=c₂₀=0 | positive loop sum=1; backtrack sum=1−1=0 | Compatible with chosen generator | retain (r5) |
| Circle classification/Hopf orientation, B6.2 | p=(1,0), chart z=u+iv | ordered ambient frame (x₁,x₂,y₂,y₁) has parity +1; quotient (u,v) positive | Orientation fixed without projective carrier | retain (r5) |
| Hopf curvature and integral | same chart | A=(u dv−v du)/(1+r²); dA=2du∧dv/(1+r²)²; integral 4π∫₀∞r/(1+r²)²dr=2π | Chern number +1 | retain (r5) |
| Orbit-to-sphere map | z=0; conjugated wrong map | derivative images (2∂X,2∂Y) versus (2∂X,−2∂Y); local area factors +4 versus −4; F=half sphere area | Both sign tests agree | retain (r5) |
| Chern representative and tensor/dual | δφ=2π on a triple; Hopf tensor Hopf | dual cocycle gives −1=−δφ/(2π); Chern numbers 1+1=2 and 1−1=0 | Consistent conventions | retain (r5) |
| Chern pullback | constant map; degree d sphere map | class 0; pairing d·1=d | Natural class, not cardinality bijection | retain (r5) |
| Rank-one Chern–Weil, B6.3 | F=c dvol on unit S² | normalized period=2c; c=1/2 gives 1, c=1/3 gives 2/3 | Integral-image iff discriminates | retain (r5) |
| Curvature adjustment | A↦A+a, a=xdy in chart | F changes by dx∧dy=da, exact class 0; on torus global exact adjustments have period 0 | Prescribed-curvature construction | retain (r5) |
| Torus integral periods | c=1/(2π),1/(4π) | periods 2π,π; normalized values 1,1/2 | Only first realizable | retain (r5) |
| Flat circle class/holonomy, B6.4 | two-arc cocycle exp(2πia),1 | holonomy exp(−2πia); principal cocycle evaluation a; dual evaluation −a=h | Inverse cocycle necessary | retain (r5) |
| Flat iff real Chern class zero | L(3,1), character 1/3; Hopf on S² | first c₁=1 mod3, real image 0, F=0; second real class 1, no flat connection | Both directions tested | retain (r5) |
| UCT kernel without finiteness | H₁=Z⊕Z/3; H₁=Q | Ext first=Z/3; Ext(Q,Z) nonzero torsion-free, multiplication by each n invertible | No false general torsion identification | retain (r5) |
| Fixed-curvature torsor, B6.5 | L(3,1), F=0 | all bundle/connection classes 3; fixed bundle classes 1 since H¹_dR=0 | Distinguishes the two torsors | retain (r5) |
| Origin translation | A₀=0,A₁=2dθ,A=3dθ | old coordinate 3[dθ]; new 1[dθ]=3[dθ]−2[dθ] before lattice quotient | Negative translation sign | retain (r5) |
| Fixed-bundle gauge quotient | angular T² | coefficient quotient R²/Z²; period quotient R²/(2πZ)², related by ×2π | Same torsor, different coordinates | retain (r5) |
| Lattice torus definition/classification, B6.6 | Λ=Z, Λ=0, Möbius Λ over S¹ | fibres R/Z,0, twisted R/Z; H² rank0=0, H²(S¹;Λ)=0, one torsor class | Rank/monodromy handled | retain (r5) |
| Lattice transition rule | basis change −1; multiplication by 2 | −1 sends Z bijectively to Z; 2 sends Z to 2Z and is not in GL₁(Z) | Integral automorphism requirement | retain (r5) |
| Negative connecting class for torus torsors | lifted δt=1 | characteristic cocycle −1; with φ=2πt, −δφ/(2π)=−1 | Rank-one convention matches | retain (r5) |
| Lens pullback quotient, B7 | n=3, ζ=e^(2πi/3) | (vζ)(ζ⁻¹λ)=vλ; wrong relation gives vζ²λ≠vλ | Equivariant isomorphism determined | retain (r5) |
| Lens flat holonomy | path v(t)=e^(2πit/n)w₀, constant λ=1 | endpoint [w₀ζ,1]=[w₀,ζ]; holonomy ζ | Sign independent of Chern naming | retain (r5) |
| Lens Bockstein | cellular d₂=n, χ=1/n | real lifted coboundary n(1/n)=1; n=3 separates 1 from −1 mod3, n=2 does not | Torsion sign test meaningful | retain (r5) |
| Lens holonomy reductions | n=6,k=2; k=0 | orders 6/gcd(6,2)=3 and 1; covers S³/μ₂ and L(6,1); restricted base same for flat case | Boundary k=0 and nontrivial case | retain (r5) |
| Lens Chern class and curvature | n=3,k=1 | c₁=u has order3; real image0; flat F=0; tensor cube class0 | Integral/real/holonomy distinctions | retain (r5) |

**Library declarations and cross-roadmap resolutions.** The ten elaborated signatures above were compared with the pinned carriers they use (`Manifold.IsSmoothEmbedding`, `Manifold.IsSubmersion`, `ProperSMul`, `MulAction.orbitRel.Quotient`, `TopologicalSpace.Opens`, `TopCat.Sheaf (ModuleCat ℝ)`, `CategoryTheory.Sheaf.H`, `smoothSheafAddCommGroup`), all present at the pins exactly as in the previous report's 26-group pinned-library audit, which is unchanged by a README-only diff and is not re-copied here. The one cross-roadmap resolution this round required (DifferentialGeometry §8.4 for `SmoothSimplex.integral_mextDeriv`) is recorded above; the previous report's supplier table (DifferentialGeometry, LieGroups, HopfRinow, AlgebraicTopology, UniversalCovers, and the ComplexKahlerGeometry, DGFloer, RiemannianGeometry, LieGroupoidsPoisson and TopologicalSheafCohomology boundaries) stands, since no supplier citation changed.

**Shape and style of the changed lines.** The two Checks are prose bullets under `**Checks.**`, name no Lean counterpart, contain no LaTeX delimiters, process words, pull-request numbers or paths, and each names a plausible wrong value and what excludes it (the positive-sign curve fails `ω`; negating `ω` breaks reproduction; the identity map is not a locally constant section).

## Not verifiable

Nothing new. The changed passages cite no source beyond B3.1 and the previously verified Nicolaescu locators. The previous report's three uncertified books (`lee-sm` Corollary 5.14, Proposition 5.38, Theorems 21.10 and 21.17; `lee-rm` Lemma 6.16 and Theorem 6.17; `kobayashi-nomizu` I, Ch. II and Appendix 4) remain uncertified; none of them supports either changed Check, so no new legal-text request is made.

## Source issues

- none found in the locators checked this round (`nicolaescu` Theorem 7.5.28 and Remark 8.2.2). The previous report's register entries for `stacks`, `meinrenken`, `nicolaescu` (proof of Theorem 7.5.38) and `schreiber-waldorf` stand and are not repeated.
