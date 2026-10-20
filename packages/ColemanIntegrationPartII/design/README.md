# Roadmap: coleman integration, part ii — harmonic realizations, indices and descent

**Summary.** Extend natural p-adic single integration by a harmonic realization on curves, logarithmic annular double and triple indices, the corrected global double pairing, wide-open triple sums and their Coleman one-form pairing. The end theorems identify the harmonic realization with the arbitrary-reduction integral over every finite extension of ℚ_p, descend nonsplit poles and degree-zero divisors, and state branch, trace and refinement compatibilities with their actual choice laws. The formal local index theory is developed over every characteristic-zero field. Graphs retain loops and parallel edges; p=2 and p=3 are included.

## Scope and ownership

This is a continuation of **ColemanIntegration**. The boundary of the continuation is its requested §7.7 natural single-integration theorem, imported in full below. Its requested §§7.10–7.11 graph realizations are special-case checks, not restrictions on the natural integral. The base text is an unresolved ownership contract: its section contents and its overlap with the interfaces below are represented by explicit gaps, not attributed invented statements.

This roadmap owns harmonic graph normalization and its metric refinement, the index constructions and their complete choice laws, the comparison of harmonic component primitives with natural single integration, traced closed-point contributions, divisor evaluation and descent of these realizations. A definition or index theorem identified in the base belongs to that base, and the corresponding interface here is an import boundary. The ownership question is recorded in the contracts, rather than solved by recreating the base theory.

Already in the library are Mathlib's p-adic field, general multigraph, simple-graph Laplacian, Laurent-series derivative and field trace, and Tau Ceti's normed restricted-series carrier. Their exact declarations appear below. RigidAnalyticGeometry §§1.3, 2.3, 6.2 and 8.1 own the analytic spaces, reduction, extension and analytification. StableReduction Layers 0–2, 4–5, 7 and 9 own models, branches, dual graphs, positivity, common resolutions, all-genus nodal reduction and section separation. JacobianChallenge Layers D–F own the algebraic Jacobian and pointed Abel–Jacobi after finite extension. EllipticCurves Layer 4 owns point-level Tate uniformization. None is developed a second time here.

The curve cohomology comparison and the analytic bridges beyond those algebraic suppliers have explicit unbound contracts. K-theory symbols, regulator maps, motivic relations, height pairings, special values and effective procedures belong to their consumers. The triple end-sum here is defined on a Coleman wide open with global auxiliary data. There is no whole-curve triple pairing obtained by a choice-free sum of arbitrary bad-reduction Vologodsky component primitives.

## Conventions

Work in universes u,v with native field, module, submodule, linear-map, polynomial, Laurent-series and Graph carriers. The geometric coefficient field is any finite extension K/ℚ_p, p prime. No odd-prime, unramified or good-reduction hypothesis is standing. Formal graph and local index algebra need only a characteristic-zero coefficient field k. Complete ultrametric coefficients enter analytic annuli. A connected Coleman wide open over K has constant field K and is geometrically connected; a larger finite constant field is treated over that field with its trace, as in §7.6. Over ℂ_p use connected wide opens.

Fix the logarithm by λ=log(p). Its universal parameter T is fixed by scalar extension and Galois, and log_univ(u)=log₀(u)+v_p(u)T with v_p(p)=1. If π is a uniformizer of ramification index e over ℚ_p, ν_π(π)=1 and v_p=ν_π/e. These normalizations differ: a branch change of size 2 changes log(π) by 2/e, including e=2 at p=2. The affine-in-T assertion concerns single integrals; no degree-one-in-T assertion is made for arbitrary triple auxiliary data.

An oriented graph edge points from tail to head. Reversal acts freely on **flags**, even at a loop. Put d f=f(tail)−f(head); jumps are c=F_head−F_tail, so adding a_v to component primitives changes c to c−d a. On a single edge f(tail)=2,f(head)=5 gives d f=−3. Unit edge lengths correspond to one fixed regular model. For comparisons keep a common rational metric: replacing an edge by m equal pieces gives jumps c/m, not c on every piece. General lengths ℓ_i give increments ℓ_i c/ℓ. A loop contributes two opposite outgoing flags to divergence.

At xy=π choose tail=(y), head=(x), and x as the end parameter of the tail; Res_e(dx/x)=1. The relative affine position is t=ν_π(x), increasing from tail 0 to head 1. The value is F_tail+c t. Reversal uses y=π/x and gives F_head−c(1−t). For F_tail=2,c=6,t=1/3 both equal 4. Vertical orders satisfy Res_e(dlog f)=ord_head(f)−ord_tail(f)=−d(ord)(e) in this convention; f=x gives 1. This fixes the sign without identifying the two papers' differential conventions by name alone.

A puncture at a point has its usual positive uniformizer orientation. An end of a wide open is oriented by the parameter vanishing in the omitted disc. Define B(F,G) by Res(F dG) when F is Laurent, so B(1,log z)=1 and B(z,z⁻¹)=−1. The proper cup comparison is primitive-of-α against β, in the order α∪β. Graph corrections are c_ω Res η−c_η Res ω: (2,3,5,7) gives −11, and reversing the edge keeps −11.

In the Čech representative ((ω_v),(f_e)), d f_e=ω_tail−ω_head and a coboundary is ((d a_v),(a_tail−a_head)). The graph retraction χ is represented by f_e−(F_tail−F_head), so a global form with f_e=0 gives its jump c. In a fixed metric N_ℓ has representative ℓ(e)Res_e(ω_tail); its comparison with geometric monodromy must carry that scale. Geometric monodromy N is different from differentiation with respect to T. Linear q-Frobenius always has q≥2.

Triple auxiliary choices are labelled primitives I_{R dS} with dI=R dS and I_{R dS}+I_{S dR}=RS. Functions, branch and every auxiliary entry are transported together. Increasing I_{G dH} by 1 changes T(log z,G;H) by −1. With all half-square primitives, T(log z,log z;log z)=0; characteristic zero makes both 2 and 3 invertible even over ℚ₂ or ℚ₃.

Divisors are finite integral sums of **closed** points, with degree Σ n_x[κ(x):K]. Local nonsplit indices use the full scalar trace after taking the index. A quadratic point contributes trace 2 to a local scalar index 1. Trace is linear, not multiplicative: if α²=π in a quadratic extension, Tr(α)=0 and Tr(α²)=2π. The finite-extension divisor sum repeats each closed point once for each embedding, and a temporary basepoint cancels only at degree zero.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The following names refer to statements read at that commit.

- `Padic` in `Mathlib/NumberTheory/Padics/PadicNumbers.lean` is the Cauchy completion of ℚ for the p-adic norm, with `[Fact p.Prime]`; the file supplies `Padic.normedField` and its `CompleteSpace` instance. It is a coefficient-field foundation, not an integration theorem.
- `Graph`, `Graph.IsLoopAt`, `Graph.ext` and `Graph.banana` in `Mathlib/Combinatorics/Graph/Basic.lean` retain edge identities, loops and parallel edges. The cochain flags are compared to this incidence structure. `SimpleGraph.lapMatrix` and `SimpleGraph.lapMatrix_mulVec_apply'` in `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean` give the unit-length simple-graph case. The kept variant is a rational-length cochain theory on multigraphs; it does not reintroduce the simple-graph matrix.
- `LaurentSeries`, `LaurentSeries.hasseDeriv_coeff`, `LaurentSeries.derivative` and `LaurentSeries.derivative_map` in `Mathlib/RingTheory/LaurentSeries.lean` provide the formal carrier and its derivative. The first Hasse derivative is the ordinary derivative. The formal residue used below is coefficient −1 of a differential on this carrier, rather than a second Laurent-series type.
- `Algebra.trace` in `Mathlib/RingTheory/Trace/Defs.lean` is the linear map obtained from left multiplication. `Algebra.trace_algebraMap` says Tr(algebraMap x)=finrank·x under its free-module hypotheses. `Algebra.trace_trace` requires both finite free stages of a scalar tower. For finite extensions of fields these hypotheses hold. `trace_eq_sum_embeddings` in `Mathlib/RingTheory/Trace/Basic.lean` requires finite-dimensional separable L/K and an algebraically closed target E; it states algebraMap(Tr x)=Σ_σ σx. The name is at the root namespace. It is not a product formula and is not used for inseparable extensions.

### From Tau Ceti

The baseline is Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean`, `MvPowerSeries.norm_eq_gaussNorm` identifies the native restricted-series norm with its Gauss norm for positive polyradii over an ultrametric normed ring. Its `CompleteSpace` instance requires complete coefficients. RigidAnalyticGeometry consumes this native floor. It supplies no p-adic integration or index theorem.

### From TauCetiRoadmap.ColemanIntegration

**The imported headline, `gap:base-single`.** For every prime p, finite K/ℚ_p, smooth geometrically connected finite-type algebraic U/K, regular closed one-form ω and a,b∈U(K), there is the unique natural single-integration theory with universal value A+B T in K[T]. At branch λ the integral is K-linear in ω, locally analytic in its endpoints, has differential ω in the second endpoint, has I(a,a)=0, and satisfies I(a,c)=I(a,b)+I(b,c). For an algebraic map f:U→V it sends f*ω to the integral on endpoints f(a),f(b). It integrates df to f(b)−f(a) and dlog f to log_λ(f(b)/f(a)) on their domains. It agrees with Coleman single integration in good reduction and commutes with finite coefficient extension and Galois conjugation. On any smooth proper geometrically connected curve apply it to the complement of the poles of **any meromorphic** one-form. No graph, model, genus or reduction condition is a hypothesis. Endpoints over finite extensions are included by base change. Uniqueness is of the natural theory across varieties, not of solutions to a differential equation on disconnected p-adic point sets (colmez1998 Definitions II.1.2–II.1.3 and Theorem II.1.4, p. 74, line 2982; comparison and descent in Remark 2, pp. 2–3, line 229).

The ColemanIntegration §7.7 contract requires an exact exported declaration for natural single integration and exact section bindings for its analytic interfaces. Vologodsky2001 Proposition 52, §17.2, p. 42, line 1806 identifies his single integral with Colmez's under that preprint's p>2 convention (line 51); the all-prime headline uses Colmez, not an unproved all-prime iterated transport theorem.

### From TauCetiRoadmap.RigidAnalyticGeometry

Use §1.3 for finite/complete coefficient extension and its tensor comparison, §2.3 for reduction, §6.2 for rigid spaces, discs, annuli, gluing and quasi-separated field extension, and §8.1 for analytification and its compatibility with finite maps and products. Carry quasi-separatedness in global rigid base change. These interfaces supply the ambient geometry of component wide opens, not the analytic Coleman algebra or a de Rham comparison.

### From TauCetiRoadmap.StableReduction

Use Layer 0 for model generic-fibre identifications, finite DVR extensions, towers and common extensions; Layer 1 for nodal charts, finite splitting of nodes, branches and components and the connected dual graph with loops; Layer 2 for curve positivity; Layers 4–5 for regularization, blowups and common model resolutions; Layer 7 for finite-extension nodal reduction in genera 0, 1 and ≥2; and Layer 9 for separation of finitely many markings into disjoint smooth sections. Only the section-separation construction is used without the stable-range inequality. Genus-zero and genus-one cases do not pass through an unpointed stable-model theorem of genus ≥2.

### From TauCetiRoadmap.JacobianChallenge

Use Layers D–F: proper smooth curves are projective, divisor classes and the Jacobian, its abelian-variety structure, pointed Abel–Jacobi and base change. The pointed theorem is applied over an extension containing a temporary point. It supplies no K-rational point on X and no unpointed Abel–Jacobi morphism. The analytic logarithm and compactness bridge is `gap:base-jacobian`.

### From TauCetiRoadmap.EllipticCurves

Use Layer 4's analytic Tate strand: q is a **unit** with |q|<1, and the point-level isomorphisms L×/q^ℤ≃E_q(L) commute with finite extensions and Galois. The differential and annular realization comparison is `gap:tate-differential`; no rigid quotient is attributed to the point-level theorem.

### Contracts requiring an exact producing section

A gap names missing mathematical output, not a replacement theory or a hypothesis containing a desired conclusion. `gap:curve-comparison` and `gap:tate-differential` have no bound supplier. Their unplaced candidate extensions are described in the design report; neither is used as a roadmap prerequisite. The other gaps are additional exact interfaces required of the named base roadmap.


- **`gap:base-single` — The universal single-integration import.** ColemanIntegration; §7.7 (requested, text unavailable). Provide the natural universal single-integration theorem for all finite p-adic fields, with its actual carriers and finite-extension/Galois compatibilities. The section binding and its declaration names are required by this contract. The theorem must cover all primes, smooth geometrically connected varieties, closed regular one-forms, affine universal values A+B T, exact/logarithmic formulas, Chasles, naturality under algebraic pullback, local analyticity, natural-theory uniqueness, good-reduction comparison, and scalar extension of forms. This is an import contract, not a new theorem to construct here. Source: colmez1998 Definitions II.1.2–II.1.3/Theorem II.1.4, lines 2982–2997; Remark 2, lines 229–255. Vologodsky2001 Proposition 52 is read only at its p>2 standing convention.

- **`gap:base-annuli` — Annular differential and residue interfaces.** ColemanIntegration; Analytic residue and annular integration section (exact locator unavailable). Provide analytic annular Laurent expansions, residue and substitution laws, logarithm branches, and their compatibility with formal Laurent differential germs. RigidAnalyticGeometry §6.2 supplies the spaces, not these residue theorems. Require the two orientations, Res(dz/z)=1, vanishing on exact differentials, residue degree under finite maps and formal substitutions, analytic unit logarithms, shrink compatibility, coefficient extension and trace, and expansion at closed points. Formal Laurent differentiation uses the pinned LaurentSeries.derivative rather than a replacement. Source: besser2017 Definition 3.1, lines 402–420; besser-dejeu2012 §7, lines 2232–2242.

- **`gap:base-coleman` — Global Coleman functions on wide opens.** ColemanIntegration; Coleman wide opens and Coleman-function algebra section (exact locator unavailable). Provide connected Coleman wide opens, their finite end sets, the actual Coleman function/form algebra, uniqueness of primitives up to a scalar and integration of Coleman one-forms. Include analytic one-forms and their Coleman primitives with A_log,1 end restrictions, integration by parts and base change/Galois equivariance. Require functions with analytic differential as a subspace of the actual Coleman algebra, compatible global primitives of R dS and a common branch; do not replace these objects by a record containing the desired identities. Source: besser2017 lines 475–501; besser-dejeu2012 lines 2533–2545.

- **`gap:base-reciprocity` — Local restriction and reciprocity contracts.** ColemanIntegration; Single/double integration reciprocity section (exact locator unavailable). Provide Coleman and natural-single-integral double-index reciprocity together with global residue cancellation and local Coleman restriction before harmonic normalization. For a global natural primitive F and a rational f with disjoint divisor/pole supports require Σ_x B_x(F,log f)=0. For a connected Coleman wide open require B_U(F,log f)=0 for an invertible analytic f, and the double-index identification with compact-cohomology projection, analytic-exact vanishing and rational-core vanishing used in §3.1. Require restriction of a natural single primitive on a component to a Coleman primitive, without any harmonic-jump conclusion; §4.2 proves that conclusion. The principal-divisor/Jacobian argument must allow moving divisors away from poles. Residue cancellation is Σ_ends Res(ω)=0. These are the precise source inputs used at besser-zerbes2017 lines 140–150, 161, 212 and besser2017 lines 503–520; their ownership cannot be certified without the base text.

- **`gap:curve-comparison` — Unbound curve comparison producer.** Unbound producer; Curve Čech–de Rham, cup, graph projection and Frobenius/monodromy contract (no producing section bound). Bind an allowed earlier producer and exact section for the full curve de Rham/rigid/semistable comparison, including ordered cup products, trace and Frobenius normalizations. The comparison producer must have an earlier place in the supply order and a concrete section exporting these maps. Required contract: hypercohomology and algebraic/rigid comparison for X−Z with arbitrary finite étale boundary and finite scalar extension; the Čech representative ((ω_v),(f_e)) with d f_e=ω_tail−ω_head, χ represented by f_e−(F_tail−F_head), graph exact sequence (4.5), monodromy represented by ℓ(e)Res_e(ω_tail), restriction and proper ordered cup residue formula, model/refinement compatibility, q-linear Frobenius with χφ=χ,Nφ=qN,χN=N,N²=0, weight-q scaling for compact/wide-open cup pairing, q-eigenspace radical of the wide-open pairing and absence of eigenvalue 1/q on H¹. The graph algebra and index identities are owned here; their comparison to cohomology is not reconstructed. Locators: besser2017 lines 586–658, 671–689, 738–759; besser-dejeu2012 lines 2591–2617. This contract is not attributed to an unspecified section of the base comparison roadmap.

- **`gap:coleman-form-relations` — The actual Coleman one-form relations.** ColemanIntegration; Coleman one-form symbol/connection section (exact locator unavailable). Provide the actual Coleman one-form product module and the symbol/connection relation theorem used by Besser–de Jeu Lemma 9.1. Need the well-defined map Ω¹_col,1(U)→H¹_dR(U)⊗Ω¹(U), sending G dH to [dG]⊗dH, with kernel of the tensor-product presentation contained in analytic-function tensors. This is a base Coleman-algebra extension if absent, not an index theorem and not a regulator relation to import from a consumer. Source: besser-dejeu2012 Lemma 9.1 and proof of Proposition 9.2, lines 2769–2789; the proof there cites the Tannakian Coleman-function theory. The index pairing of §6.4 is the new output here.

- **`gap:base-jacobian` — Abelian logarithm and p-adic point topology bridge.** ColemanIntegration; Abelian logarithm and curve restriction section (exact locator unavailable). Provide the abelian-logarithm/invariant-differential comparison and compact p-adic Jacobian point topology required by the curve integration comparison. JacobianChallenge Layers D–F supply the Jacobian and pointed Abel–Jacobi only after choosing a rational point, which may be supplied over a finite extension. Require pullback identification of invariant differentials with holomorphic curve forms, the locally analytic abelian logarithm characterized by its differential, compatibility with natural single integration, compactness of Jac(X)(K), and the divisor evaluation comparison on the open complement of poles. These are genuine missing analytic bridges, not properties asserted by the algebraic Jacobian roadmap. Source: colmez1998 Lemma II.1.13/Remark II.1.18, lines 3147–3159 and 3213; besser-zerbes2017 lines 142–150.

- **`gap:tate-differential` — Tate uniformization differential comparison.** Unbound producer; Analytic differential comparison extending EllipticCurves Layer 4 (producing extension unbound). Provide the pullback of the normalized Tate invariant differential to dz/z and its compatibility with annular charts of a regular Tate model. EllipticCurves Layer 4 explicitly supplies point-level Galois-compatible uniformization, not a rigid-space quotient. The integration witness needs local analyticity, pullback of the invariant differential, and the n-gon/loop/parallel-edge annular chart comparison. This belongs to an EllipticCurves Part II extension if the analytic comparison is not exported by that base. This plan records the missing contract without planning a second Tate uniformization. Source: besser-zerbes2017 §3, lines 245–278.


## How to read the build

Layer 1 constructs the finite graph algebra independently of geometry. Layer 2 constructs local double indices. Layer 3 constructs wide-open and corrected cohomological double pairings before the harmonic/Vologodsky identification. Layer 4 proves that identification and the point-sum formula, using only the earlier pairing theory and the imported integration reciprocity. Layer 5 constructs the local triple index with its genuine auxiliary data; Layer 6 cancels only globally compatible auxiliary constants and descends the pairing to actual Coleman one-forms. Layer 7 exports branch, trace, divisor and arbitrary-reduction descent, with the Tate curve fixing all normalizations. Thus Besser §§3–4 precede Besser–Zerbes, and Besser §5 follows it. Each subsection names the output, its proof ingredients and discriminating checks. A `gap:` premise is an unresolved supplier contract, never a claimed theorem.


## Layer 1: Finite graph cochains and harmonic normalization

### 1.1 Cochains with edge identities

Define `Graph.LengthCochains` as follows. For a finite graph Γ, retain both flags of every edge, including a loop, and an orientation-reversing fixed-point-free involution e ↦ −e on its darts. For a field k of characteristic zero and positive rational lengths ℓ(e)=ℓ(−e), define C⁰=V→k, C¹={c:E→k | c(−e)=−c(e)}, d f(e)=f(tail e)−f(head e), div_ℓ(c)(v)=Σ_{tail(e)=v} c(e)/ℓ(e), Harm_ℓ=ker(div_ℓ), and (c,d)_ℓ=Σ_{E/±} c(e)d(e)/ℓ(e). These are modules, linear maps, a submodule and a bilinear form on the native graph carrier; the flag presentation has an explicit forgetful comparison to Graph.IsLink. (besser2017, Definitions 4.1–4.3, p. 12, besser2017 line 528; rational-length extension by subdivision from Proposition 4.12(3), besser2017 line 768).

Assume Γ has finite actual vertex and edge sets; ambient types need not be finite; k is a field with CharZero; ℓ(e) is a strictly positive rational number, interpreted through ℚ→k.

Construct `LengthCochains.mk`: A native graph, a choice of its two flags per edge and positive reversal-invariant rational lengths give this presentation; reversing the chosen orientation gives a canonically isomorphic complex. Prove `LengthCochains.ext`: Two cochains are equal exactly when their values on every dart agree; values on one dart of each edge suffice. Prove `LengthCochains.div_d_adjoint`: Σ_v f(v) div_ℓ(c)(v)=(d f,c)_ℓ; loops contribute two opposite values. Prove `LengthCochains.map`: Graph isomorphisms preserving lengths and characteristic-zero coefficient embeddings commute with d, divergence and the edge pairing; unit lengths recover Definitions 4.1–4.3. Prove `LengthCochains.simple_laplacian`: For a finite simple graph with unit lengths, div(d f) is SimpleGraph.lapMatrix acting on f. The multigraph extension retains parallel edges and two loop flags.

The proof uses the following argument. Use submodules of function modules and finite sums. Define the two flags separately even when their incident vertices coincide; the involution has no fixed dart. The adjoint identity follows by grouping the two flags of each edge.

*Needs:* Mathlib `Graph`, Mathlib `Graph.IsLoopAt`, Mathlib `SimpleGraph.lapMatrix`.

**Checks.**

- On one oriented edge v→w, f(v)=2,f(w)=5 gives d f=−3; a head-minus-tail differential would give +3.
- For one vertex and no edges C¹=0 and Harm_ℓ=0; the empty graph has C⁰=C¹=0.
- A loop at v carrying c(e)=1,c(−e)=−1 has divergence zero and is a nonzero harmonic cochain. Giving the loop only one dart incorrectly excludes it.
- On one edge of length 1/2, c=2,d=3 give (c,d)_ℓ=12; using an unweighted product gives 6.
- Reversing the selected orientation replaces both c,d by their negatives and leaves the value 12. A zero argument gives zero.
- For one edge of length 1/2 with c=2, divergence is +4 at its tail and −4 at its head; it is not harmonic. An outgoing sum omitting the inverse length gives the wrong values.
- A cochain assigning 1 to both directions of a nonloop edge is not in C¹ in characteristic zero. On no edges C¹ is the zero module; on one loop C¹ is k.
- The empty graph has only the zero 0-cochain; on one isolated vertex C⁰=k and d=0. On two isolated vertices its kernel has two independent constants.

### 1.2 The harmonic representative

Prove `Graph.harmonic_exact_decomposition` as follows. For Γ,k,ℓ as in §1.1, C¹=Harm_ℓ ⊕ im(d). Thus every graph cohomology class has one harmonic representative. The kernel of d consists of the functions constant on each connected component. If Γ is connected and nonempty, a potential for the exact part is unique modulo one common constant. Harmonic and exact cochains are orthogonal for ( , )_ℓ; the induced form on harmonic cochains is nondegenerate. All these decompositions commute with coefficient extension. (besser2017, Theorem 4.4 and following orthogonality statement, p. 12, besser2017 line 553; rational-length consequence).

Assume The hypotheses of §1.1; connectedness and nonemptiness only for a single common constant.

Construct `harmonicProjection`: The unique harmonic projection C¹→ₗ[k]Harm_ℓ has kernel im(d), is identity on Harm_ℓ and is idempotent. Prove `harmonicProjection_changePotential`: harmonicProjection(c+d a)=harmonicProjection(c). Prove `rationalLaplacian_rank`: For each connected component with r vertices, the rational weighted Laplacian has rank r−1, preserved over k.

The proof uses the following argument. Over ℚ, the adjoint identity identifies the Laplacian kernel after embedding into ℝ: Σ_edges (f(v)−f(w))²/ℓ=0 forces componentwise constants. A maximal minor is a nonzero rational, so the same rank holds over every characteristic-zero k. Rank-nullity and orthogonality give the direct sum, uniqueness, nondegeneracy and extension compatibility.

*Needs:* §1.1.

**Checks.**

- On a cyclic triangle with unit lengths and cyclic edge values (3,0,0), the harmonic part is (1,1,1) and the exact part is (2,−1,−1).
- On a tree the harmonic part is zero; on two isolated vertices the ambiguity is two constants, not one.
- In characteristic 3 on a triangle, the constant cyclic cochain (1,1,1) is both exact and harmonic. Characteristic zero is essential; p=3 coefficients ℚ₃ are still allowed.

### 1.3 Subdivision with a fixed metric

Prove `Graph.harmonic_subdivision` as follows. If an edge of length ℓ is subdivided into consecutive positive rational lengths ℓ_i with Σℓ_i=ℓ, a harmonic jump c on that edge extends by c_i=(ℓ_i/ℓ)c. Restriction adds the jumps along the chain, and these operations identify graph cohomology and its harmonic representatives. Pairings ( , )_ℓ are preserved when both arguments are extended this way. If a residue current r is constant along the chain, Σ_i c_i r=c r. Attaching a tree contributes zero harmonic current. Uniform subdivision into m pieces gives c/m on each new edge, for m≥1. (besser-zerbes2017, Corollary 1.2 and preceding subdivision argument, p. 3, besser-zerbes2017 line 99; compare besser2017 Proposition 4.12(3), line 768).

Assume Finite graphs and positive rational lengths as in §1.1; m is positive; no division by zero; New degree-two vertices have no additional attached marked source terms.

Prove `harmonic_subdivision_comp`: Successive subdivisions give the same extension as their common refinement. Prove `harmonic_subdivision_residue`: The jump-residue contribution is invariant under subdivision; reversing every dart preserves it.

The proof uses the following argument. Divergence at each new vertex forces constant c_i/ℓ_i. Summing along the chain determines that current. Direct substitution proves the energy and residue identities; the cohomology isomorphism follows by extending potentials and applying §1.2.

*Needs:* §1.2.

**Checks.**

- Splitting a jump 6 into lengths 1/3 and 2/3 of its original length gives jumps 2 and 4, total 6.
- m=1 is identity; a rational tail carries zero current.
- For a triangle with jumps (1,1,1), dividing one edge into two halves gives (1/2,1/2) on that edge. Treating all four resulting lengths as 1 changes the harmonic representative and is not the same metric realization.

### Examples

A single vertex, a bridge, a two-edge cycle, a loop and a triangle distinguish graph incidence from simple adjacency.

### Dependencies

Pinned Mathlib Graph; finite linear algebra over a characteristic-zero field. No analytic or cohomological comparison is a premise.

## Layer 2: Logarithmic annular functions and the double index

### 2.1 Functions with one logarithmic term

Define `Annulus.LogarithmicFunctions` as follows. For a characteristic-zero field k put A_log=k((z))[L], dL=dz/z, and A_log,1=k((z))+kL. On an open annulus over a complete characteristic-zero nonarchimedean field use its analytic Laurent functions in place of k((z)) and a fixed logarithm branch for L=log z. The derivative maps A_log,1 onto the analytic one-forms on the open annulus (and onto k((z))dz in the formal case), with kernel k. Res(d(f+aL))=a when Res(dz/z)=1. All annular restrictions are taken inside a common domain of convergence. (besser2017, Definition 3.1, pp. 9–10, besser2017 line 402; formal polynomial logarithms in besser-dejeu2012 §7, pp. 355–356, line 2232).

Assume k is a field of characteristic zero; Analytic case: complete nontrivially normed ultrametric k and a genuine open annulus; A common logarithm branch and an orientation with Res(dz/z)=1.

Construct `LogarithmicFunctions.mk`: Construct f+aL from an analytic or formal Laurent f and scalar a; add, scale, differentiate and restrict coefficientwise. Prove `LogarithmicFunctions.ext`: Equality in a fixed parameter is equality of the Laurent part and the coefficient a. Prove `LogarithmicFunctions.residue_zero_iff`: F is Laurent without L exactly when Res(dF)=0. Prove `LogarithmicFunctions.changeParameter`: In the analytic case, for an orientation-preserving parameter u transport log u=log z+log(u/z) with the fixed branch and analytic unit logarithm. Formally, for u=az(1+h), h∈zk[[z]], choose a scalar δ for the logarithm of a and transport L_u=L_z+δ+log(1+h) by its formal power series; use the full differential-algebra map. Orientation reversal transports both residue and logarithm.

The proof uses the following argument. Use native Laurent series and polynomial carriers. Integrate Laurent monomials with denominator n+1 away from n=−1, whose primitive is L; in the analytic case polynomial denominator growth preserves convergence on every strictly smaller closed subannulus. The residue criterion proves uniqueness of the decomposition.

*Needs:* `gap:base-annuli`, RigidAnalyticGeometry §6.2, Mathlib `LaurentSeries`, Mathlib `LaurentSeries.derivative`, Mathlib `LaurentSeries.hasseDeriv_coeff`.

**Checks.**

- d(2+3L)=3 dz/z and Res=3; replacing the residue by the constant term of F fails.
- dC=0 for every constant C and dL≠0, including over ℚ₂.
- L² is in A_log but not A_log,1, since d(L²)=2L dz/z is not an analytic differential. Characteristic p would also make d(z^p)=0.

### 2.2 The alternating local index

Define `Annulus.doubleIndex` as follows. For the oriented formal punctured disc or open annulus of §2.1 define B_e(f+aL,g+bL)=Res_e(f dg)+b Res_e(f dz/z)−a Res_e(g dz/z), using a parameter compatible with the orientation. This is the unique alternating k-bilinear pairing with B_e(F,G)=Res_e(F dG) when F has no logarithmic term. In particular B_e(C,G)=C Res_e(dG). This definition owns the index; the underlying residue is supplied by the base. (besser2017, Definition 3.2 and Lemma 3.3, p. 9, besser2017 line 421; besser-dejeu2012 Definition 7.1 and construction, p. 356, line 2243).

Assume The field, function spaces, orientation and branch hypotheses of §2.1.

Prove `doubleIndex_ext`: An alternating bilinear pairing with the analytic-first residue rule equals B_e. Prove `doubleIndex_add_left`: B_e(F+F′,G)=B_e(F,G)+B_e(F′,G), with analogous scalar and right-variable laws. Prove `doubleIndex_reverse`: B_{−e}(F,G)=−B_e(F,G). Prove `doubleIndex_add_constants`: B_e(F+A,G+B)−B_e(F,G)=A Res_e(dG)−B Res_e(dF).

The proof uses the following argument. Expand in the direct sum of the Laurent subspace and kL. Residues of exact Laurent differentials vanish, proving alternation. The residue rule determines all terms except B(L,L), which is zero by alternation.

*Needs:* §2.1.

**Checks.**

- B_e(1,L)=1, B_e(L,1)=−1 and B_e(z,z⁻¹)=−1; both residue order and logarithmic constant terms are detected.
- B_e(L,L)=0 and B_e(C,D)=0 for constants C,D; the expression Res(F dG) alone is undefined when F=L.
- If a=0 the formula is Res(f dG); if b=0 it is −Res(g dF). These agree when both are Laurent because Res d(fg)=0.

### 2.3 Coordinate changes, degrees and coefficients

Prove `Annulus.doubleIndex_pullback` as follows. Let φ:e′→e be a finite map of annuli with positive degree n and compatible orientation, or a formal parameter substitution of ramification order n. For pulled-back functions and branch, B_e′(φ*F,φ*G)=n B_e(F,G). In particular the index is invariant under orientation-preserving parameter isomorphisms, and reverses sign with orientation. Scalar extension commutes with B; restricting to smaller annuli preserves B. For a finite separable coefficient extension L/k, the residue trace commutes with Laurent coefficient trace. (besser-dejeu2012, Definition 7.1, p. 356, line 2243; §8 and residue-degree argument in Lemma 8.1, p. 361, line 2524; double-index consequence).

Assume The hypotheses of §2.1; φ finite of positive degree with no poles in its analytic domain; formal substitution has positive order; Branches and coefficient embeddings agree on the source field.

Prove `doubleIndex_scalarExtension`: The embedded value of B_k(F,G) equals B_L(F_L,G_L). Prove `doubleIndex_shrink`: Analytic continuation to a common end annulus identifies the values.

The proof uses the following argument. Apply the imported residue pullback law to the analytic-first rule; uniqueness in §2.2 supplies all logarithmic terms. Coefficient trace commutes with coefficient extraction. The same argument handles shrinking and scalar extension.

*Needs:* §2.2, Mathlib `Algebra.trace`.

**Checks.**

- Under z=t², B(1,log(z)) pulls back to B(1,2log(t))=2.
- The identity map has degree 1; there is no degree-zero constant-map residue identity here.
- Under z=t⁻¹ with reversed orientation B(1,log(z))=−1 in the t orientation. Counting absolute degree without an orientation loses this sign.

### Examples

The values B(1,log z)=1 and B(z,z⁻¹)=−1 fix the residue order; z↦z² fixes the degree convention.

### Dependencies

Layer 1 is independent. This layer uses the base analytic/residue contract and RigidAnalyticGeometry §§6.2, 1.3.

## Layer 3: Wide-open pairings and semistable graph corrections

### 3.1 The end-sum on a wide open

Define `ColemanWideOpen.doublePairing` as follows. For a connected Coleman wide open U, ω,η analytic one-forms on U and their Coleman primitives F,G, define B_U(ω,η)=Σ_{e∈End(U)} B_e(F|e,G|e), orienting each end by a parameter vanishing in its omitted disc. The value is independent of the two global primitive constants, alternating, annihilates d f in either slot for f analytic on U, and therefore factors through H¹_dR(U). It agrees under common shrinking of ends and is zero if U has rational good-reduction compactification. The same construction allows finitely many punctures by replacing them by sufficiently small omitted discs. (besser2017, Definition 3.8, Proposition 3.9 and Remark 3.10, p. 11, besser2017 line 492).

Assume U is a connected Coleman wide open over a finite extension K/ℚ_p or its complete algebraically closed extension; F,G are global Coleman primitives of analytic differentials, with one branch; For cohomology factorization use the algebraic/rigid de Rham comparison contract; Over K the wide open is geometrically connected with Coleman constant field K; a larger finite constant field is treated over that field and then by trace; The construction is first made after splitting the finite family of ends over the coefficient field; nonsplit ends are traced by §7.5 and descended by §7.6.

Prove `doublePairing_eq_sum`: The function-level notation B_U(F,G) means the pairing of their differentials, evaluated by the end-sum. Prove `doublePairing_constant_independent`: Changing either global primitive constant changes the sum by a constant times Σ_ends Res(ω) or Σ_ends Res(η), hence zero. Prove `doublePairing_restrict`: Restriction to a smaller wide open preserving the core gives the same pairing, including newly excised discs on which both differentials extend analytically.

The proof uses the following argument. Global residue cancellation kills primitive constants. Coleman double-index reciprocity identifies the end pairing with the cup product of the Frobenius projection onto compact cohomology; it kills analytic exact forms and is zero on rational compactification. The same residue characterization and local disc reciprocity prove shrinking.

*Needs:* §2.3, `gap:base-coleman`, `gap:base-reciprocity`, `gap:curve-comparison`.

**Checks.**

- If either differential is zero then B_U=0; a proper domain with no ends has zero end-sum for its analytic global one-forms.
- For ℙ¹ minus discs, B_U=0 even if a local end index B_e(1,log z)=1; cancellation over ends is essential.
- On a positive-genus good-reduction curve choose second-kind de Rham representatives α,β with α∪β=1 and delete their pole discs; B_U(∫α,∫β)=1. An identically zero definition fails.

### 3.2 Normalized component primitives

Define `Semistable.HarmonicPrimitiveData` as follows. For a smooth proper geometrically connected curve X/K with a split regular nodal model and meromorphic ω, remove the poles and choose Coleman primitives F_v on the connected component wide opens. Their differences c_ω(e)=F_head|e−F_tail|e are constants and antisymmetric. Normalize by adding component constants until c_ω is harmonic. At a regular model use unit edge lengths; for subdivisions use the compatible rational metric of §1.3. For a self-node, first take a compatible subdivision giving Coleman component domains; coarsening then adds jumps along its chain, rather than subtracting a primitive from itself. The normalized family exists and is unique up to one common constant, and c_ω is independent of that common constant. The family is a torsor under K, not a distinguished primitive with an invented zero value. (besser-zerbes2017, Equation (1.4) and normalization preceding Theorem 1.1, p. 2, besser-zerbes2017 line 74).

Assume K/ℚ_p finite, p any prime; a fixed branch; X smooth, proper, geometrically connected, dimension one; Chosen split regular nodal realization; pole support separated from the connecting annuli; Component wide opens and their Coleman primitives are those in the base contract.

Construct `HarmonicPrimitiveData.mk`: Normalize any family by projecting its jump cochain and solving for a component potential; no basepoint is selected. Prove `HarmonicPrimitiveData.ext_mod_constant`: Two normalized families for the same ω differ by the same scalar on every component. Prove `HarmonicPrimitiveData.linear`: Sums and scalar multiples of normalized families normalize the corresponding forms. Prove `HarmonicPrimitiveData.jump_change`: Replacing F_v by F_v+a_v replaces c by c−d a, with d from §1.1. Prove `HarmonicPrimitiveData.jump_class`: The class of c is the χ([ω]) class of the Čech–de Rham comparison contract, with the signs fixed in the conventions.

The proof uses the following argument. Kernel-of-d equals constants on each connected annulus by Coleman uniqueness. Apply §1.2 to c=h+d a and add a_v to the primitives, producing c−d a=h. Connectedness of the dual graph gives uniqueness modulo one scalar.

*Needs:* §1.2, §2.1, `gap:base-coleman`, StableReduction Layers 0–1, RigidAnalyticGeometry §§2.3, 6.2, `gap:curve-comparison`.

**Checks.**

- A two-component bridge with F_head−F_tail=2 is normalized by subtracting 2 from F_head, giving jump zero; this tests c↦c−d a.
- A smooth irreducible special fibre has one primitive modulo one constant and no graph jumps.
- On a unit-length triangle a cyclic jump cochain (1,1,1) is already normalized and cannot be made zero by component constants. Harmonic gluing does not identify functions on overlaps.

### 3.3 The graph correction before identification

Prove `Semistable.auxiliaryDoubleIndex_formula` as follows. In the split setup of §3.2 let Z contain the poles of ω,η and let F_v,G_v be any component Coleman primitives with jumps c,d. Then Σ_v Σ_{x∈Z∩U_v} B_x(F_v,G_v)=Σ_v B_{U_v−Z}(ω,η)+Σ_{e∈E/±}(c(e)Res_e η−d(e)Res_e ω). The ends at Z use the point orientation; connecting annuli are oriented as ends of the tail component. The formula holds before harmonic normalization; neither side is claimed independent of arbitrary component constants. (besser2017, Theorem 4.10 and its expansion, pp. 14–15, besser2017 line 700).

Assume Hypotheses of §3.2; ω and η regular on X−Z; Z consists of rational points in separated smooth residue domains in this realization; No pole lies on a connecting annulus.

Prove `auxiliaryDoubleIndex_edgeReverse`: Each summand c Res η−d Res ω is invariant under e↦−e. Prove `auxiliaryDoubleIndex_changeConstants`: Changing component primitives changes both sides by the same residue-weighted sum.

The proof uses the following argument. Expand every component end-sum, separating puncture ends from connecting ends. Each connecting annulus occurs twice with opposite orientation. Substitute F_head=F_tail+c and G_head=G_tail+d; §2.2 gives the stated sign. This proof uses no harmonic/Vologodsky comparison.

*Needs:* §2.2, §3.1, §3.2.

**Checks.**

- On one paired overlap take c=2,d=3,Res η=5,Res ω=7. The correction is 10−21=−11, and reversing all four signs still gives −11.
- If c=d=0 the correction is zero. Zero forms give zero on both sides.
- Adding a constant only on one component can change the point-sum when that component has nonzero total puncture residue. Independence is not valid before normalization.

### 3.4 The cohomological pairing with graph terms

Define `Semistable.correctedDoublePairing` as follows. For X,Z and a split separated semistable realization define on H¹_dR(X−Z/K) the alternating pairing B_h(α,β)=Σ_v B_{U_v−Z}(res_v α,res_v β)+(χ α,N_ℓ β)_ℓ−(χ β,N_ℓ α)_ℓ. Here χ is the graph retraction of the comparison contract, graph representatives of χ are harmonic, and N_ℓ is represented by ℓ(e)Res_e of the differential in a Čech representative. For global meromorphic forms this equals §3.3 with harmonic component jumps. It annihilates algebraic exact forms, restricts to α∪β in that order on proper H¹_dR(X), and is unchanged by refinements between admissible nodal realizations, using the metric when edge lengths change; modifications outside that class are compared after finite extension and regularization. If Z is empty use Čech hypercohomology, rather than pretending all proper classes have global regular representatives. (besser2017, Definition 4.11 and Proposition 4.12(1)–(3), pp. 15–16, besser2017 line 738; metric formulation is the subdivision consequence).

Assume X/K smooth proper geometrically connected curve, K/ℚ_p finite with fixed branch; Z finite reduced and split in this realization; points separated in the model; The full Čech, cup, χ and monodromy comparison contract is supplied; Lengths have one fixed valuation normalization; Every model at which the displayed formula is evaluated is an admissible split nodal realization; a modification outside that class is compared after finite extension and regularization.

Prove `correctedDoublePairing_eq_aux`: For harmonic F_v,G_v, B_h([ω],[η])=Σ_{x∈Z} B_x(F_v,G_v). Prove `correctedDoublePairing_cup`: For proper classes α,β, B_h(j*α,j*β)=α∪β. Prove `correctedDoublePairing_refinement`: Transport through the canonical cohomology maps of refinements preserves the pairing; rational tails contribute zero. Prove `correctedDoublePairing_ext`: Equal de Rham classes give equal values in either argument; changing Čech representatives by a total coboundary does not change B_h.

The proof uses the following argument. The comparison contract makes res,χ,N_ℓ maps on hypercohomology, so the expression is defined on classes. §1.2 makes the graph products independent of exact representatives. §3.3 identifies forms; the local second-kind residue formula in the cup contract proves the proper restriction. Subdivision and rational-tail invariance follow from §§1.3 and 3.1; the model comparison transports this to common refinements.

*Needs:* §1.3, §3.3, `gap:curve-comparison`.

**Checks.**

- The graph contribution on harmonic/residue values c_ω=2,c_η=3,r_η=5,r_ω=7 is −11 in the chosen order; exchanging α and β gives +11.
- For X=ℙ¹ and Z empty, H¹_dR=0 and B_h=0; for good reduction there is no graph contribution.
- For second-kind representatives with proper classes α∪β=1, the normalized point-sum is 1. Defining the proper pairing only from global holomorphic forms would miss these classes.

### 3.5 Frobenius and monodromy compatibility

Prove `Semistable.correctedDoublePairing_phi_N` as follows. For the linear q-Frobenius φ and geometric monodromy N in the curve-comparison contract, B_h(φ α,φ β)=q B_h(α,β) and B_h(Nα,β)+B_h(α,Nβ)=0. The geometric N here is distinct from differentiation in the universal logarithm variable. When using metric cochains, the comparison maps must identify that geometric N with N_ℓ using the same valuation scale. (besser2017, Proposition 4.12(4) and proof, pp. 15–16, besser2017 line 754).

Assume Hypotheses of §3.4; q is a positive power of the residue prime with q≥2; Operators are the supplied comparison operators, not arbitrary endomorphisms; χφ=χ, Nφ=qN, χN=N, N²=0; wide-open pairing has Frobenius weight 2.

Prove `correctedDoublePairing_phi_iterate`: Replacing φ by its a-th positive iterate multiplies the pairing by q^a.

The proof uses the following argument. Apply wide-open Frobenius scaling and χφ=χ, Nφ=qN to §3.4. For monodromy the component restrictions of N vanish, χN=N and N²=0; the two remaining symmetric graph products cancel. No reference to the later harmonic identification is needed.

*Needs:* §3.4, `gap:curve-comparison`.

**Checks.**

- For N=0 the skew-adjointness equation is 0=0; this does not force B_h=0.
- On a symplectic two-dimensional test space, φ=diag(1,q), N(e₂)=e₁,N(e₁)=0 and B(e₁,e₂)=1 give B(φe₁,φe₂)=q and B(Ne₂,e₂)+B(e₂,Ne₂)=1−1=0.
- An arbitrary identity operator on a nonzero symplectic pairing cannot be called a q-Frobenius when q≥2: it scales by 1, not q.

### Examples

A rational wide open has zero double pairing. A positive-genus wide open can have nonzero pairing, and a cycle forces the graph correction to be retained.

### Dependencies

Layers 1–2; the base Coleman-function and residue contracts; the unbound curve-comparison contract for de Rham assertions. The harmonic identification with arbitrary-reduction integration is not a premise.

## Layer 4: Harmonic realization of arbitrary-reduction single integration

### 4.1 Rational logarithms and graph residues

Prove `Semistable.dlog_residue_is_exact` as follows. In a split regular semistable model, if f is a nonzero rational function whose divisor has support away from all connecting annuli, then Res_e(dlog f)=ord_head(f)−ord_tail(f)=−d(ord)(e), where ord_v is the multiplicity of the vertical component in div(f). Thus the residue cochain of dlog f is exact. The functions f and log_λ f are global component primitives of df and dlog f respectively, so both have zero harmonic jumps wherever defined. (besser-zerbes2017, Lemma 2.1 and proof, p. 5, besser-zerbes2017 line 218; exact/log primitives in §2, line 135).

Assume Hypotheses of §3.2; f≠0 and has neither zero nor pole on a connecting annulus; At a node xy=π, tail=(y), head=(x), Res_e(dx/x)=1.

Prove `dlog_residue_orthogonal_harmonic`: For harmonic c, Σ_e c(e)Res_e(dlog f)=0 at unit lengths; in a metric realization use the associated weighted exact cochain.

The proof uses the following argument. The local node computation determines the order sign; factor f by its two vertical powers. The remaining unit has zero annular logarithmic residue by the no-zero/no-pole hypothesis and the annular residue theorem. Global f and log f have matching restrictions, proving zero jumps.

*Needs:* §1.1, §3.2, `gap:base-annuli`, `gap:base-single`.

**Checks.**

- For xy=π, tail=(y), head=(x), f=x gives ord_tail=0,ord_head=1 and Res_e(dlog x)=1=−d(ord)(e). Identifying the residue with +d(ord) under this differential convention gives the wrong sign.
- A nonzero constant f has zero residue and zero jumps; f=0 is excluded from dlog.
- For a rational f on a proper curve, ∫df=f plus a constant and ∫dlog f=log f plus a constant on every component; no new cycle class is created.

### 4.2 Identification on smooth residue domains

Prove `Semistable.harmonicPrimitive_eq_singleIntegral` as follows. Let F be a primitive from the imported natural single-integration theory for a meromorphic ω on a smooth proper geometrically connected X/K. In the split regular semistable realization of §3.2, its values away from poles on residue domains of smooth special-fibre points agree, modulo one common constant, with the normalized component Coleman primitives. This comparison holds for every prime and every genus. Loops and parallel edges are retained through their flags or a compatible subdivision. (besser-zerbes2017, Theorem 1.1, p. 2, besser-zerbes2017 line 88; §2, pp. 3–5, line 130; all-prime integration supplied by colmez1998 Theorem II.1.4).

Assume K/ℚ_p finite, p any prime, with a fixed branch; ω meromorphic; every evaluated point lies outside its poles; A split regular semistable realization with separated supports is chosen for the comparison.

Prove `harmonicPrimitive_divisor_eq`: For a split degree-zero divisor D disjoint from the poles, Σ n_P F(P)=Σ n_P F_v(P), with P in its smooth residue domain. Prove `harmonicPrimitive_goodReduction`: For a smooth proper model this is the base Coleman single-integral comparison.

The proof uses the following argument. The base theorem gives Coleman restrictions on components and the natural principal-divisor reciprocity. For principal D=(f), compare the point double-index reciprocity for F and log f with §3.3 for the harmonic family. Component Coleman reciprocity kills the component pairings, and §4.1 with harmonic-exact orthogonality kills the correction. The difference of the two divisor evaluations therefore factors through Jac(X)(K), is additive and locally constant, and vanishes because a homomorphism from this compact group into the torsion-free additive field with open kernel has finite, hence zero, image. The Jacobian/compactness bridge is an explicit base-contract gap.

*Needs:* §3.4, §4.1, `gap:base-single`, `gap:base-reciprocity`, JacobianChallenge Layers D–F, `gap:base-jacobian`.

**Checks.**

- On a tree every harmonic jump is zero; with a single component the comparison is equality of Coleman primitives modulo one constant.
- On a cycle the harmonic cochain may be nonzero, so analytic equality of primitives on connecting overlaps is not a conclusion.
- For df and dlog f the identification follows from their global primitives. This includes p=2 through the Colmez single-integration contract, without invoking all-prime iterated transport.

### 4.3 The valuation term and its sign

Prove `Semistable.singleIntegral_on_annulus` as follows. For the oriented node xy=π with tail component (y), head component (x), set t=ν_π(x), so the tail has t=0 and the head t=1. If c=F_head−F_tail is the normalized jump, then on algebraic points of the connecting annulus the single-integral primitive equals F_tail+c t, after the same global constant is fixed. In a metric segment of length ℓ, use the relative affine coordinate t/ℓ. With y=π/x the reverse expression is F_head−c ν_π(y), giving the same value. (besser-zerbes2017, Corollary 1.2, p. 3, besser-zerbes2017 line 108).

Assume Hypotheses of §4.2; ν_π(π)=1 and endpoints avoid poles; Points may be rational over any finite extension; their branches extend the chosen one.

Prove `singleIntegral_annulus_reverse`: F_tail+c t=F_head−c(1−t). Prove `singleIntegral_annulus_baseChange`: Under ramification m, the new component constants interpolate with increments c/m; the old ν_π equals ν_ϖ/m.

The proof uses the following argument. Choose a finite ramified extension in which the point reduces to a newly inserted component. Theorem §4.2 and harmonicity at its degree-two vertices force the constants given by §1.3. The new component lies at rational position t, giving the formula. Finite-extension compatibility identifies it with the original single integral.

*Needs:* §1.3, §4.2, `gap:base-single`.

**Checks.**

- With F_tail=2,c=6,t=1/3, the value is 4; the reverse expression is 8−6·(2/3)=4.
- If c=0 the formula is the Coleman function; t=0 and t=1 give the two boundary values by continuation to the adjacent smooth residue domains.
- For c=6, a quadratic ramified refinement has two jumps 3,3. Assigning 6 to each new edge gives total 12 and violates the formula.

### 4.4 The Vologodsky point-sum

Prove `Semistable.globalDoublePairing_eq_pointSum` as follows. In the split setup, for meromorphic ω,η regular on X−Z and single-integral primitives F,G, Σ_{x∈Z} B_x(F,G)=B_h([ω],[η]). The sum is independent of the two global constants and descends to H¹_dR(X−Z). It extends the ordered proper cup product and has the Frobenius/monodromy compatibilities of §3.5. The nonsplit formulation is the residue-field trace construction of §7.5; its validity is not a rational-pole hypothesis on the final theorem. (besser2017, Corollary 5.3, p. 16, besser2017 line 807; Proposition 3.5, p. 10, line 449).

Assume X/K and branch as in §4.2; Z finite reduced and contains all poles; For this split formula points of Z are rational and separated in the chosen realization.

Prove `globalDoublePairing_exact`: If ω=df with f rational regular off Z, the point-sum is zero for every η regular off Z. Prove `globalDoublePairing_constants`: Adding A to F changes the sum by AΣ_x Res_x η=0, and similarly in the other slot.

The proof uses the following argument. Near a pole in a smooth residue domain, §4.2 identifies the single-integral germ with its component Coleman germ up to the common constants. §3.3 and §3.4 give the equality; global residue cancellation handles constants. Import the class-level and operator properties from §§3.4–3.5.

*Needs:* §3.3, §3.4, §3.5, §4.2.

**Checks.**

- For Z empty the point-sum on global regular forms is zero, compatible with the isotropic holomorphic subspace. Proper cohomology is handled through §3.4, not this representation.
- For second-kind representatives α,β the sum is α∪β, with primitive of α placed first.
- Omitting the jump-residue term from §3.3 need not reproduce this point-sum on a graph with cycles.

### Examples

Exact and logarithmic differentials have zero jumps; a Tate curve has a nonzero harmonic cycle jump.

### Dependencies

Layers 1–3; the full imported single-integration theorem and the base reciprocity/Abel–Jacobi contract. There is no use of a height or regulator theorem.

## Layer 5: Auxiliary primitives and the local triple index

### 5.1 Compatible labelled auxiliary primitives

Define `Annulus.TripleIndexData` as follows. For three labelled functions F,G,H in A_log,1, define TripleIndexData to consist of primitives I_{R dS} in A_log for every labelled pair, with dI_{R dS}=R dS and I_{R dS}+I_{S dR}=RS. On the diagonal set I_{R dR}=R²/2. Distinct labels retain their choices even when their functions happen to coincide. Such data exist. Choices for each unordered off-diagonal pair form a torsor under k, acting by I_{R dS}↦I_{R dS}+C and I_{S dR}↦I_{S dR}−C. Data may be permuted, pulled back and combined linearly with their functions; no arbitrary primitive choices are silently identified. (besser-dejeu2012, §7, equation (7.2) and the data before Proposition 7.3, pp. 355–356, besser-dejeu2012 line 2232 and line 2251).

Assume Characteristic-zero field k and the formal ring of §2.1; or its analytic open-annulus version; All differential and product equations are imposed on the actual functions; In the analytic case all functions and primitives share a domain of convergence.

Construct `TripleIndexData.mk`: Choose a primitive for one direction of each unordered pair and set the reverse to RS−I; use R²/2 on the diagonal. Prove `TripleIndexData.ext`: Equality is equality of the three functions and their labelled primitive entries. Prove `TripleIndexData.changeConstant`: The indicated opposite shifts preserve all derivative and integration-by-parts equations; any two choices are related by unique pair constants. Prove `TripleIndexData.pullback`: Differential-compatible annular or formal substitutions pull back every entry, preserving products and pair equations. Prove `TripleIndexData.linearCombination`: Mixed-pair auxiliary primitives for a linear combination are the same linear combination of the original mixed entries; reverse entries satisfy integration by parts, and a new diagonal entry is recomputed as R²/2.

The proof uses the following argument. Integration by parts recursively integrates z^n L^j dz in k((z))[L]; n=−1 raises log degree and divides by j+1, while n≠−1 lowers log degree after division by n+1. Characteristic zero makes all these denominators nonzero. Kernel-of-d is k, giving the torsor and functoriality laws.

*Needs:* §2.1.

**Checks.**

- For all three functions equal to L and all auxiliary integrals L²/2, d(L²/2)=L dz/z and each pair sums to L².
- For all functions zero, choosing all auxiliary integrals zero is valid; independent opposite constants on off-diagonal pairs are also valid.
- If G=0,H=L, the choices I_{G dH}=1,I_{H dG}=0 fail because their sum is 1 rather than GH=0. The compatible pair is (1,−1).

### 5.2 Existence and characterization of the local index

Define `Annulus.tripleIndex` as follows. For compatible TripleIndexData define T_e(F,G;H) as the unique scalar operation that is trilinear under the compatible linear combinations of §5.1, symmetric in F,G, satisfies T(F,G;H)+T(F,H;G)+T(G,H;F)=0 with the same permuted auxiliary entries, and equals B_e(F,I_{G dH}) when G has no logarithmic term. Existence and uniqueness hold in the formal and analytic annular settings. T is an operation on the full auxiliary data, not a trilinear map on three bare functions. (besser-dejeu2012, Proposition 7.3, Lemma 7.5 and equation (7.6), pp. 356–359, besser-dejeu2012 line 2277 and line 2327).

Assume Hypotheses and actual primitive equations of §5.1; The analytic-first reduction uses Res(dG)=0.

Prove `tripleIndex_unique`: Any scalar operation on the same data satisfying the four stated laws equals T. Prove `tripleIndex_symm`: T(F,G;H)=T(G,F;H) with the natural permutation of primitive entries. Prove `tripleIndex_threeTerm`: The three cyclic placements of the distinguished third slot sum to zero with common auxiliary data. Prove `tripleIndex_meromorphic`: If F,G have no logarithmic term then T(F,G;H)=Res_e(FG dH).

The proof uses the following argument. Expand each function into Laurent part plus scalar L. If one slot is Laurent, the reduction, symmetry and three-term identity determine the value; integration by parts proves consistency on intersections of those cases. For three L slots choose all half squares, making the value zero. Extend by compatible trilinearity and derive the conditional choice-change formulas from these axioms and use them to compare arbitrary primitive choices; §5.3 exports those formulas after existence.

*Needs:* §2.2, §5.1.

**Checks.**

- T(1,1;L)=1 and T(z,z;z⁻²)=−2 by the Laurent-first rule. These computed values detect the order of the differentiated third slot; the three-term identity uses one common labelled primitive data set.
- With F=G=H=L and all I=L²/2, T=0, since three equal summands give 3T=0. This holds over ℚ₃ because 3 is nonzero.
- For Laurent F=z,G=z⁻¹,H=L, T=Res(dz/z)=1; an index that always vanishes on rational-function slots fails.

### 5.3 The actual choice laws

Prove `Annulus.tripleIndex_changeConstant` as follows. Increasing I_{G dH} by C and decreasing I_{H dG} by C changes T(F,G;H) by −C Res_e(dF). Changing the F,H pair similarly changes it by −C Res_e(dG). It is independent of the F,G pair. Simultaneous pair changes add these effects. In particular zero in a function slot does not force the local value to vanish when its associated auxiliary data are not the compatible zero data. (besser-dejeu2012, Lemma 7.4, p. 357, besser-dejeu2012 line 2299).

Assume TripleIndexData as in §5.1; C∈k; the opposite primitive is shifted by −C; Functions and all other primitive entries are fixed.

Prove `tripleIndex_changeBoth`: Changing the G,H pair by C and the F,H pair by D changes the value by −C Res(dF)−D Res(dG).

The proof uses the following argument. Use the reduction rule on the added data (F,0;H), where I_{0 dH}=C. Then T(F,0;H)=B(F,C)=−C Res(dF). Symmetry gives the other law, and changing the unused F,G pair has no effect in the generating cases, hence in general.

*Needs:* §5.2.

**Checks.**

- For F=L,G=0,H=L with the G,H pair (1,−1), T=−1; the all-zero G,H primitive pair gives 0.
- If Res(dF)=0 the G,H constant change has no effect. Changing only the F,G pair never changes T.
- For Res(dF)=1 and C=2, the change is −2. The local index cannot be exported as independent of auxiliary primitives.

### 5.4 A local normalization formula

Prove `Annulus.tripleIndex_simplePoles` as follows. In the formal case assume dF,dG,dH have at most simple poles at z=0. Write c_z for the constant coefficient of the L⁰ Laurent coefficient in A_log. Then T(F,G;H)=c_z(F)c_z(G)Res(dH)−Res(dF)c_z(I_{G dH})−Res(dG)c_z(I_{F dH}). The coefficient c_z is parameter dependent; the whole expression, with all functions and primitive data transported, is parameter independent. (besser-dejeu2012, Definition 7.7 and Proposition 7.8, pp. 359–360, besser-dejeu2012 line 2413 and line 2430).

Assume k a characteristic-zero field; TripleIndexData of §5.1; dF,dG,dH have no poles of order greater than one at the formal origin.

Prove `tripleIndex_simplePoles_zeroConstantPrimitives`: If the two relevant primitive constant terms are zero, the value is c_z(F)c_z(G)Res(dH).

The proof uses the following argument. First normalize the two relevant primitives to constant term zero. By trilinearity reduce to analytic power series and L. The residue characterization gives the displayed product in these generating cases. Apply §5.3 to restore arbitrary primitive constants.

*Needs:* §5.3.

**Checks.**

- For F=2+L,G=3,H=L and I_{G dH}=3L, I_{F dH}=2L+L²/2, the value is 6.
- For three L functions and all half-square primitives every constant term is zero, hence T=0.
- Over an analytic coefficient field with its fixed branch, under u=az one has c_u(log z)=−log a while c_z(log z)=0. Formally the same value is −δ for the chosen logarithmic lift δ. A formula asserting constant-term invariance alone is false.

### 5.5 Orientation, parameter and degree laws

Prove `Annulus.tripleIndex_pullback` as follows. Orientation reversal negates the triple index with fixed functions and auxiliary data. For an orientation-preserving finite map φ:e′→e of annuli of degree n≥1, or a formal substitution of positive order n, T_e′(φ*F,φ*G;φ*H)=n T_e(F,G;H), provided every auxiliary primitive is pulled back. In particular parameter isomorphisms preserve T. Restrictions of ends and scalar embeddings also preserve the index on transported data. (besser-dejeu2012, §8 parameter independence and Lemma 8.1, p. 361, besser-dejeu2012 line 2524; orientation/scalar consequences of the characterization).

Assume Hypotheses of §5.1; φ finite with positive degree and compatible orientations; All functions, branches and primitive entries are transported together.

Prove `tripleIndex_pullback_comp`: Degrees multiply under composable pullbacks and scalar embeddings commute with the degree law.

The proof uses the following argument. Compose the index with pullback and divide by the nonzero scalar n. The residue degree law of §2.3 and uniqueness of §5.2 recover the original index; reversal and scalar extension use the same characterization. Restricting Laurent expansions to a common annulus preserves every term.

*Needs:* §2.3, §5.2, §5.3.

**Checks.**

- z=t² sends (1,1;log z) with its primitives to (1,1;2log t), and T changes from 1 to 2.
- An orientation-preserving identity has degree 1; reversal sends the same value 1 to −1.
- Pulling back F,G,H but replacing I_{G dH} by its pullback plus 1 changes T by −Res(dφ*F). Function pullback alone does not imply the degree formula.

### Examples

The triple (1,1;log z) has value 1. The triple (log z,0;log z) with a nonzero auxiliary constant has value −1.

### Dependencies

Layer 2, characteristic-zero polynomial-logarithm calculus and the base annular residue laws. Global integration and semistable models are not prerequisites for the formal theory.

## Layer 6: Wide-open triple sums and Coleman one-form pairings

### 6.1 The global end-sum

Define `ColemanWideOpen.tripleIndex` as follows. For a connected Coleman wide open U and global Coleman functions F,G,H with analytic differentials, choose all I_{R dS} as global Coleman primitives with I_{R dS}+I_{S dR}=RS, and define T_U(F,G;H)=Σ_{e∈End(U)}T_e(F,G;H). Restrictions of these global choices, rather than unrelated local choices at each end, are part of the construction. Over a finite extension K/ℚ_p use functions and auxiliary data defined over K or scalar extension with descent as in §7.6; over ℂ_p take the same end-sum. (besser-dejeu2012, §8 global construction and Lemma 8.2, p. 361, besser-dejeu2012 line 2533).

Assume U connected and a Coleman wide open with finitely many ends; F,G,H global Coleman functions with dF,dG,dH analytic on U; A common branch and global compatible Coleman auxiliary primitives; Over K the wide open is geometrically connected with Coleman constant field K; a larger finite constant field is treated over that field and then by trace; The construction is first made after splitting the finite family of ends over the coefficient field; nonsplit ends are traced by §7.5 and descended by §7.6.

Prove `tripleIndex_eq_endSum`: The global value is the finite end-sum of local indices using the restrictions of any global compatible primitive family. Construct `tripleIndex_globalChoices`: Global Coleman integration supplies a primitive of each Coleman form R dS; integration by parts supplies the opposite primitive. Prove `tripleIndex_congr`: Equal global Coleman functions give equal values after independence of global auxiliary choices in §6.2; functions are not replaced by their differential classes.

The proof uses the following argument. Use the global Coleman algebra and integration of its one-forms to construct the pair primitives, then restrict to ends and apply §5.2. Finite end sets make the sum algebraic. Auxiliary-choice independence is proved in §6.2 rather than encoded as an assumed field of the data.

*Needs:* §3.1, §5.2, `gap:base-coleman`.

**Checks.**

- The zero triple with all global auxiliary primitives zero has value 0; global auxiliary changes still give 0 by residue cancellation.
- On a rational wide open T_U(F,1;H)=B_U(F,H)=0, although individual end indices can be nonzero.
- On a positive-genus wide open with B_U(F,H)=1, T_U(F,1;H)=1. A construction factoring through [dG] would give 0 since d1=0.

### 6.2 Choice cancellation, constants and shrinking

Prove `ColemanWideOpen.tripleIndex_laws` as follows. The end-sum of §6.1 is independent of the global auxiliary primitives, is k-trilinear in the actual functions, is symmetric in the first two slots and satisfies the three-term identity. For a scalar C, T_U(F,C;H)=C B_U(F,H) and T_U(F,G;C)=0. Hence replacing G by G+C changes the value by C B_U(F,H). It is preserved on common smaller end annuli and on deleting discs across which all three functions and their global auxiliary data extend as Coleman data with analytic differentials. A restriction theorem carries that extension hypothesis; it does not allow arbitrary singular excisions. (besser-dejeu2012, Lemmas 8.2–8.3, pp. 361–362, besser-dejeu2012 line 2546; introduction p. 310, line 250, for shrinking).

Assume Hypotheses of §6.1; Auxiliary changes are global constants on connected U; Shrinking preserves the core, or has the stated extension across added discs.

Prove `tripleIndex_add_const_second`: T_U(F,G+C;H)−T_U(F,G;H)=C B_U(F,H). Prove `tripleIndex_const_third`: T_U(F,G;C)=0 for any constant C. Prove `tripleIndex_restrict`: Compatible repeated shrinking gives the same value, including any finite chain of common end restrictions.

The proof uses the following argument. Sum §5.3 and use the residue theorem for the analytic one-form dF. This gives auxiliary independence and ordinary trilinearity. Reduction with G=C gives C B_U(F,H); the three-term identity and alternation of B_U give zero in the third slot. Restriction uses §5.5; an added filled disc has total zero index from analytic local primitives and the residue theorem.

*Needs:* §5.3, §5.5, §6.1, `gap:base-reciprocity`.

**Checks.**

- For B_U(F,H)=1, adding 2 to G adds 2 to T_U; it is not a pairing of three differential classes.
- A global shift C in I_{G dH} changes the sum by −CΣ_e Res_e(dF)=0, even if individual residues are nonzero.
- On an annular rational wide open with end residues +1 and −1, changing the auxiliary primitive only at the first end by 1 changes the sum by −1. Local choices do not cancel without global compatibility.

### 6.3 The q-eigenspace vanishing theorem

Prove `ColemanWideOpen.tripleIndex_frobenius_vanishing` as follows. Let U be a Coleman wide open defined over a finite p-adic field with a degree-q Frobenius lift in the supplied rigid-cohomology sense, q≥2. If φ*[dF]=q[dF] and φ*[dG]=q[dG] in H¹_dR(U), then T_U(F,G;H)=0 for every global Coleman H with analytic differential. The assertion also includes zero classes. It uses the supplied spectrum theorem excluding 1/q from Frobenius on H¹_dR(U), and the fact that the q-eigenspace is in the radical of B_U. (besser-dejeu2012, Proposition 8.4 and proof, p. 362, besser-dejeu2012 line 2591).

Assume Hypotheses of §6.1; U and data descend to a finite p-adic field; A compatible Frobenius lift of positive degree q, with q a power of p; Both stated q-eigenclass equations; Rigid comparison supplies the spectrum and double-pairing radical properties.

Prove `tripleIndex_frobenius_iterate`: A positive iterate uses q^a and its corresponding eigenclass hypotheses, giving the same vanishing conclusion.

The proof uses the following argument. Write φ*F=qF+r and φ*G=qG+s with analytic r,s, absorbing global constants into r,s. If a slot is analytic, reduce the triple index to the double pairing and use the q-radical property to kill its value when paired with the other q-eigenclass; the three-term identity handles an analytic third slot. Thus the functional H↦T_U(F,G;H) factors through [dH]. The degree law gives qT=q²T(F,G;φ*H), so its functional has reciprocal eigenvalue 1/q. The spectrum exclusion forces it to vanish.

*Needs:* §5.5, §6.2, `gap:curve-comparison`, `gap:base-coleman`.

**Checks.**

- F=0 satisfies the eigenclass condition and gives zero; p=2 and q=2 are admitted.
- A general F with B_U(F,H)=1 and G=1 gives T_U=1. The theorem cannot drop the q-eigenclass hypothesis on F.
- The proof produces L(φ*γ)=q⁻¹L(γ). At q=2 this is eigenvalue 1/2, not 2 or 1; the excluded reciprocal is essential.

### 6.4 A pairing on actual Coleman one-forms

Construct `ColemanWideOpen.colemanFormPairing` as follows. Let Ω¹_col,1(U) be the submodule of actual Coleman one-forms generated by G dH for global Coleman G,H with analytic differentials, using the base Coleman algebra and its multiplication relations. There is a unique k-bilinear pairing P_U:A_col,1(U)×Ω¹_col,1(U)→k with P_U(F,G dH)=T_U(F,G;H). In particular P_U(F,dH)=B_U(F,H). The pairing respects equalities of actual Coleman forms, not only chosen expressions as sums of symbols. (besser-dejeu2012, Lemma 9.1 and Proposition 9.2, p. 364, besser-dejeu2012 line 2769 and line 2776).

Assume Hypotheses of §6.1; The base exports the actual Coleman one-form module and the relation/symbol map of Lemma 9.1; No free module on unrelated formal symbols replaces the Coleman form module.

Prove `colemanFormPairing_unique`: The values on generators G dH uniquely determine the bilinear pairing. Prove `colemanFormPairing_relation`: If Σ_i G_i dH_i=0 as a Coleman one-form, then Σ_i T_U(F,G_i;H_i)=0 for every F. Prove `colemanFormPairing_restrict`: Compatible restriction of the functions and actual forms to a smaller wide open preserves P_U.

The proof uses the following argument. By §6.2 the generator formula depends on dH, not its primitive constant. The base relation theorem gives the map Ω¹_col,1→H¹_dR(U)⊗Ω¹(U), G dH↦[dG]⊗dH, and says the kernel of the product presentation is generated inside analytic-function tensors. On those tensors the double-index reduction depends only on the actual product form. Therefore the generator prescription kills all relations and descends; generators prove uniqueness.

*Needs:* §6.2, `gap:coleman-form-relations`.

**Checks.**

- P_U(F,1·dH)=B_U(F,H); for B_U(F,H)=1 this gives 1.
- P_U(F,G dC)=0 for a constant C, as the one-form is zero.
- G dH+H dG=d(GH) is one and the same actual form when GH is a Coleman function. Where it lies in the stated module, the two presentations give the same pairing; bilinearity on a free symbol module alone would not prove this.

### Examples

A local auxiliary change survives at an end, while a global change cancels by the residue theorem. Constants in the first two slots can survive globally.

### Dependencies

Layers 2–3 and 5; the base global Coleman algebra and its one-form relation module; the unbound curve Frobenius contract for §6.3.

## Layer 7: Branch transport, traces and arbitrary-reduction descent

### 7.1 Specializing the universal branch

Prove `SingleIntegral.branchTransport` as follows. Write the imported universal single integral as I_univ(a,b;ω)=A+B T in K[T], with T=Log(p). For λ,λ′∈K, I_λ′−I_λ=(λ′−λ)B. For u∈K×, log_λ′(u)−log_λ(u)=(λ′−λ)v_p(u), where v_p(p)=1. For local double or triple indices, changing a branch transports the functions and every auxiliary primitive; the new value is computed by the same residue characterization and the change-of-constant laws. When F and G change by constants A₀,B₀ on a fixed end, ΔB=A₀ Res(dG)−B₀ Res(dF). A branch change with nonconstant valuation term on an annulus is not assumed to be such a constant shift. (colmez1998, Definition II.1.3 and Theorem II.1.4, p. 74, colmez1998 line 2986; §II.2.5, p. 97, line 3950; index transport from besser-dejeu2012 Lemma 7.4, line 2299).

Assume p prime, K/ℚ_p finite; Closed regular one-form on a smooth geometrically connected variety, endpoints outside poles; The universal affine-in-T integral is the base contract; λ and λ′ belong to K; extensions use their images.

Prove `branchTransport_comp`: Transport from λ to λ″ is the composite of transport from λ to λ′ and λ′ to λ″, on the full functions and primitive data. Prove `branchTransport_exact`: For df the coefficient B is zero; for dlog f it is v_p(f(b)/f(a)).

The proof uses the following argument. Evaluate the affine polynomial at λ′ and λ and subtract. Apply the universal logarithm formula for the multiplicative case. For indices, transport formal/analytic logarithms and products and apply the local characterizations; when the transported changes are constants the explicit constant laws apply. No assertion that arbitrary index data are affine in T is made.

*Needs:* `gap:base-single`, §2.2, §5.3, §6.2.

**Checks.**

- For u=p, branch change from 0 to 2 changes log(u) by 2; for a ramified uniformizer ϖ with v_p(ϖ)=1/e it changes it by 2/e.
- For λ′=λ or ω=0 the change is zero; for a unit u the logarithm change is zero.
- B_e(F+A₀,G+B₀) need not equal B_e(F,G); F=0,G=L,A₀=1,B₀=0 changes it by 1. Index branch independence cannot be inferred from the derivative alone.

### 7.2 Holomorphic integration on a proper curve

Prove `SingleIntegral.properHolomorphic_branchIndependent` as follows. For a smooth proper geometrically connected curve X/K, a holomorphic one-form ω and algebraic endpoints a,b, its single integral I_λ(a,b;ω) is independent of λ. After a finite extension containing a,b and a temporary basepoint, this is the abelian logarithm on Jac(X) paired with the invariant differential corresponding to ω. Descent eliminates the temporary basepoint; the statement does not require X(K) to be nonempty. (colmez1998, Lemma II.1.13 and Remark II.1.18, pp. 78–79, colmez1998 line 3147 and line 3213; curve illustration besser-zerbes2017 §3, line 245).

Assume K/ℚ_p finite, all primes; X smooth proper geometrically connected of dimension one; ω regular everywhere; endpoints algebraic over K.

Prove `properHolomorphic_universalCoefficient_zero`: The T coefficient of the universal integral is zero for holomorphic forms on proper curves.

The proof uses the following argument. Use the base Abel–Jacobi and invariant-differential comparison after finite extension. The abelian logarithm is characterized by its differential and group law, independently of a branch. Subtract endpoint values and use finite-extension compatibility; this also removes the choice of the temporary Abel–Jacobi basepoint.

*Needs:* §7.1, `gap:base-single`, `gap:base-jacobian`, JacobianChallenge Layers D–F.

**Checks.**

- On ℙ¹ all holomorphic one-forms vanish and so do all their integrals.
- For an elliptic curve the value from the identity is the unique locally analytic group logarithm with differential ω, and is branch independent.
- On the nonproper curve G_m the form dz/z integrates from 1 to p to λ. Properness cannot be dropped.

### 7.3 Finite extension and coefficient trace

Prove `SingleIntegral.coefficientTrace` as follows. For a finite extension L/K of p-adic fields with compatible branches, base change sends I_K(a,b;ω) to I_L(a,b;ω_L). For an L-valued regular closed form ω on U_L and K-rational endpoints a,b, Tr_{L/K}(I_L(a,b;ω))=I_K(a,b;Tr_{L/K}ω), where the form trace uses Ω¹(U_L)=Ω¹(U)⊗_K L. Both identities hold coefficientwise for universal affine polynomials with T fixed. The constructions commute with field embeddings, Galois conjugation and towers. (colmez1998, Theorem II.1.4, p. 74, colmez1998 line 2996; Galois descent Remark 2(iv), pp. 2–3, line 246; trace consequence, not a quoted trace theorem. Compare vologodsky2001 Theorem B(4), line 195, only under p>2).

Assume U/K smooth geometrically connected finite-type algebraic variety; ω regular and closed on U_L; curves may use the complement of their poles; a,b∈U(K) for the trace formula; L/K finite; the branches are restrictions of one branch with parameter in K.

Prove `coefficientTrace_tower`: Tr_{M/K}I_M=Tr_{L/K}(Tr_{M/L}I_M) in every finite tower M/L/K, with the same coefficient trace on forms. Prove `singleIntegral_galois`: σ(I(a,b;ω))=I(σa,σb;σω), with σ fixing the universal T. Construct `primitive_galois_average`: After a finite Galois extension containing a point a, averaging the conjugates of P↦I(a,P;ω) gives a K-defined primitive torsor representative; any two such representatives differ by a K-constant.

The proof uses the following argument. Finite scalar extension of forms and K-linearity reduce the coefficient trace formula to ω=αη with η over K. Trace linearity and the base-change identity then prove it. Equivalently sum over embeddings in a normal closure using the pinned embedding formula and descend. The pinned tower theorem gives transitivity. Average over the finite Galois group, dividing by its nonzero order, to obtain a descended primitive; its constant ambiguity follows from the natural theory.

*Needs:* `gap:base-single`, §7.1, Mathlib `Algebra.trace`, Mathlib `trace_eq_sum_embeddings`, Mathlib `Algebra.trace_trace`, Mathlib `Algebra.trace_algebraMap`.

**Checks.**

- If ω is defined over K and [L:K]=n, Tr(I_L(a,b;ω))=n I_K(a,b;ω), not I_K(a,b;ω).
- L=K is identity, and a=b gives zero. Every finite extension of p-adic fields is separable, including ramified quadratic extensions at p=2.
- Trace is not multiplicative: for α²=π in a quadratic extension, Tr(α)=0 but Tr(α²)=2π≠0. Do not trace each factor of an index separately.

### 7.4 Degree-zero divisors without a rational basepoint

Define `Curve.divisorSingleIntegral` as follows. For a smooth proper geometrically connected curve X/K, meromorphic ω, and a degree-zero K-divisor D=Σ_x n_x[x] disjoint from its poles, choose a finite Galois extension L splitting the support and containing a point a outside the poles. Define ∫_D ω=Σ_x n_x Σ_{σ:κ(x)→L} I_L(a,σx;ω). Its value is independent of a, L and the embeddings used to display the geometric support, belongs to K and is additive in D and K-linear in ω. Degree means Σ_x n_x[κ(x):K]=0. No K-rational basepoint is part of the exported object. (besser-zerbes2017, Degree-zero divisor evaluation and splitting argument, §2, p. 4, besser-zerbes2017 line 142; Galois consequence of colmez1998 Remark 2(iv), line 246).

Assume K/ℚ_p finite, any prime, fixed branch; X smooth proper geometrically connected curve; D integral divisor of degree zero; support disjoint from poles of ω; L is a finite Galois extension splitting the support and containing a permissible temporary point.

Prove `divisorSingleIntegral_split`: For D=b−a with a,b rational, the value is I_K(a,b;ω). Prove `divisorSingleIntegral_ext`: Equal divisors, evaluated as finite sums over closed points, give equal values; regrouping the support changes nothing. Prove `divisorSingleIntegral_add`: The evaluation is a homomorphism on divisors of degree zero disjoint from the pole support. Prove `divisorSingleIntegral_baseChange`: Ordinary divisor pullback to a finite field extension preserves the value after scalar extension; closed points split with their usual multiplicities.

The proof uses the following argument. Chasles makes a basepoint change contribute deg(D)·I(a′,a;ω)=0. Scalar extension and a common finite Galois overfield compare any two splitting fields. Galois equivariance permutes the geometric points and changes the basepoint only, so the scalar is fixed and lies in K. Finite-sum linearity gives the API.

*Needs:* §7.3, `gap:base-single`, StableReduction Layer 0.

**Checks.**

- For α²=π in a ramified quadratic extension, D=[t²−π]−2[0] on ℙ¹ and ω=t dt give ∫_D ω=π, since each geometric point contributes π/2. This works at p=2 as a field identity.
- D=0 gives zero even when X(K) is empty; changing the temporary basepoint contributes deg(D) times one integral, hence zero.
- A single quadratic closed point has degree 2, not 1. Subtracting one rational point does not make degree zero and the putative evaluation depends on the basepoint.

### 7.5 Closed-point indices and traced sums

Define `Curve.tracedLocalIndexSum` as follows. For X/K smooth proper geometrically connected and a finite reduced Z, use K-defined primitive representatives from §7.3 for ω,η regular off Z. At a closed point x the formal germs lie over κ(x); define its double contribution as Tr_{κ(x)/K} B_x(F,G), and sum over Z. This sum is independent of the two global primitive constants and extends the corrected pairing to nonsplit poles. For triple-index data that themselves descend to κ(x), define the local traced contribution Tr_{κ(x)/K} T_x(F,G;H) with the full auxiliary data. No auxiliary independence is asserted for a local triple index. For any expression already defined over K, extension to L followed by scalar trace multiplies its value by [L:K]. For a finite Galois-stable family of annular ends with end fields κ(e), define the corresponding end-sums by Σ_e Tr_{κ(e)/K} B_e or Σ_e Tr_{κ(e)/K} T_e, using descended functions and, for triples, the full compatible auxiliary data. Their scalar extension is the sum over geometric ends. (colmez1998, Galois descent Remark 2(iv), line 246, and §II.2.5, line 3950; consequence of besser2017 Definition 3.4/Corollary 5.3, lines 435/807 and besser-dejeu2012 §8, line 2524).

Assume K/ℚ_p finite; a compatible branch; Z finite reduced, all residue fields finite separable over K; F,G are descended representatives of the global single-integral primitive torsors; For a traced triple contribution, functions and auxiliary primitives are all defined over κ(x).

Prove `tracedLocalIndexSum_split`: In a normal splitting extension the embedded traced contribution is the sum of the conjugate point contributions, and the global sum equals the split corrected pairing. Prove `tracedLocalIndexSum_tower`: Computing residue traces through an intermediate residue field gives the same contribution. Prove `tracedLocalIndexSum_congr`: Parameter changes preserving the formal point orientation and equal local germs preserve the traced values. Prove `tracedLocalIndexSum_bilinear`: The global double sum is alternating and K-bilinear in the forms; it factors through de Rham classes and extends the proper cup product after descent. Construct `tracedEndIndexSum`: Taking the index over each end field and then its field trace gives the same scalar as splitting all ends and summing their conjugate contributions; traces compose in towers.

The proof uses the following argument. Scalar extension of local indices and the pinned trace-as-embeddings identity identify each closed-point contribution with its geometric conjugate sum. Apply §4.4 after splitting. Faithful scalar embedding proves constant independence, cohomology factorization and cup compatibility over K. Transitivity is the pinned trace tower theorem. For triple data the same proof yields descent of values, retaining local choice dependence.

*Needs:* §2.3, §4.4, §5.5, §7.3, Mathlib `trace_eq_sum_embeddings`, Mathlib `Algebra.trace_trace`.

**Checks.**

- At the quadratic closed point t²−π=0, B_x(1,log(t²−π))=1 over κ(x), so its trace is 2; at infinity the residue is −2, and the global constant-first sum is 0.
- A K-rational point uses the identity trace; an empty point set contributes zero for global regular forms.
- In a quadratic extension α²=π, replacing Tr(B) by a product of traces of its input coefficients can turn Tr(α²)=2π into 0. Only the whole scalar index is traced.

### 7.6 Independence of semistable extensions and models

Prove `Curve.integrationRealization_descent` as follows. For every smooth proper geometrically connected X/K, every meromorphic ω and every degree-zero divisor away from its poles, choose any finite extension giving a split regular nodal model with separated pole and divisor support. The harmonic formula of §§4.2–4.3 evaluates the imported single integral and §7.4, and the corrected double formula evaluates §7.5. These values agree after any further coefficient extension, common model refinement, node subdivision or pole separation, hence descend to the original arbitrary-reduction curve. For a connected Coleman wide open with F,G,H and global compatible auxiliary data defined over K, T_U and P_U are K-valued and commute with scalar extension and admissible shrinking. This last assertion is about a wide open; it does not construct a triple pairing of three arbitrary whole-curve Vologodsky primitives by summing components. A connected wide open whose constant field is a finite extension k₀/K is treated over k₀, and its K-valued end-sum is the field trace, equivalently the sum over geometric components. (besser-zerbes2017, Corollary 1.2 and §2 finite-extension argument, p. 3, besser-zerbes2017 line 95 and line 130; besser2017 Proposition 4.12(3), line 753; besser-dejeu2012 introduction p. 310, line 250).

Assume K/ℚ_p finite, p any prime; fixed branch parameter in K; X/K smooth proper geometrically connected curve; no reduction or genus restriction; Meromorphic forms evaluated off poles; divisor degree zero where a divisor is evaluated; Triple assertions require actual global Coleman wide-open data and descended auxiliary choices.

Prove `integrationRealization_commonExtension`: Two realization fields and models are compared in one common finite extension with compatible generic-fibre identifications. Prove `integrationRealization_divisor`: The harmonic evaluation equals the K-valued degree-zero divisor integral without a chosen K-point. Prove `wideOpenIndex_galoisDescent`: If the wide-open functions and auxiliary data descend, their end-sums are fixed by Galois and belong to the coefficient field; local end values may require their residue fields.

The proof uses the following argument. StableReduction supplies finite nodal reduction in all genera, regularization, splitting of branches and separation of marked sections, together with common refinements. Apply the split comparison and then §7.3. Since each harmonic evaluation equals the intrinsic base integral, two realizations agree in a common field; trace/embedding descent gives the K-value. §1.3 handles the metric under refinement, and §7.5 handles nonsplit local terms. For global triple data use §5.5 and §6.2 and descend the resulting scalar, without asserting a new global bad-reduction triple construction.

*Needs:* §1.3, §4.3, §4.4, §6.4, §7.3, §7.4, §7.5, StableReduction Layers 0–1, 4–5, 7, 9, RigidAnalyticGeometry §§1.3, 6.2, 8.1, JacobianChallenge Layers D–F, StableReduction Layer 2.

**Checks.**

- Good reduction uses a single component and gives Coleman integration, with no graph correction.
- A ramified extension splitting a quadratic divisor gives the value π of §7.4 and traced local residue 2 of §7.5, independent of further ramification.
- A whole-curve sum of local triple indices changes under unrelated component auxiliary shifts by the residue change laws. Wide-open global-choice independence does not certify that construction.
- A connected wide open with quadratic constant field L has K-valued end-sum Tr_{L/K} of its L-valued sum; the scalar 1 contributes 2, not 1. Geometric connectedness cannot be inferred from connectedness alone.

### 7.7 A cycle with nonzero jump and branch cancellation

Establish `TateCurve.singleIntegral_normalization` as follows. For a Tate curve E_q/K with q∈K× and n=ν_π(q)>0, the invariant differential dz/z has primitive on K×/q^ℤ given by F(z)=log_λ(z)−(ν_π(z)/n)log_λ(q), normalized by F(1)=0. In the regular n-gon presentation its cyclic harmonic jump is −log_λ(q)/n. For n=1 use the loop presentation and for n=2 the two parallel edges, or a compatible regular subdivision. The expression is invariant under z↦qz and under a change of logarithm branch. (besser-zerbes2017, §3, pp. 5–6, besser-zerbes2017 line 245 and line 265).

Assume K/ℚ_p finite, fixed uniformizer π and any logarithm branch; q≠0, ν_π(q)=n>0; this hypothesis makes n invertible in K; The point-level Tate uniformization is supplied by EllipticCurves Layer 4; its differential normalization is gap:tate-differential; Algebraic points are interpreted after compatible finite coefficient extension.

Prove `TateCurve.singleIntegral_q_periodic`: F(qz)−F(z)=log(q)−(n/n)log(q)=0. Prove `TateCurve.singleIntegral_branch`: The branch change is (λ′−λ)(v_p(z)−ν_π(z)v_p(q)/n)=0 since v_p=ν_π/e.

The proof uses the following argument. On successive fundamental annuli use log(z) as the Coleman primitive. Crossing the final q-identification contributes −log(q). Project this cochain to the constant cyclic harmonic cochain, using §1.2. Subtract the vertex potential and apply §4.3. The displayed two-term computations verify q-periodicity and branch independence.

*Needs:* §4.3, §7.1, §7.2, `gap:tate-differential`, EllipticCurves Layer 4.

**Checks.**

- Over ℚ_p take π=p, q=p³ and log(p)=1. Then n=3, every cyclic jump is −1 and F(z)=log(z)−ν_π(z); enforcing zero jumps fails.
- For n=1 or n=2 the same formula holds on loops or parallel edges. The case q=1 is excluded because n=0 and the quotient is not this Tate curve.
- At p=2 the cancellation uses only characteristic-zero division by n and v_p=ν_π/e; it imposes no odd-prime condition.

### Examples

A ramified quadratic closed point tests residue-field traces; a degree-zero divisor tests basepoint cancellation; the Tate curve tests branch cancellation with a nonzero cycle.

### Dependencies

All previous layers; the imported universal single-integration theorem; StableReduction Layers 0–1, 4–5, 7 and 9; finite-dimensional field trace at the pins. No regulator construction is used.

## Downstream consumers

**PadicHodgeRegulators** is the intended consumer of the double/triple index laws, the Coleman one-form pairing, divisor integration and descent. It constructs regulator maps and proves symbol relations; none is a premise here. Its exact consuming section is an external interface to bind. **EllipticRegulators** consumes elliptic specializations and the Tate witness with the same boundary; its consuming section is also unbound. **EffectiveDiophantineMethods** can consume the general harmonic single-integral and divisor interface. **ArithmeticDynamics** consumes Chabauty–Coleman point results through EffectiveDiophantineMethods ED.4 in its §§3.58 and 3.60, and has no producer role here. ErdosProgressionPowers imports rational-point finiteness, not this index producer; no supplier edge is introduced from it.

## References

All statements are paraphrases; line numbers refer to the versioned source extractions. The manifest records the legal acquisition and version of each work. Derived metric, trace and descent statements cite their source ingredients and are explicitly presented as consequences, rather than assigned nonexistent theorem numbers.

- **colmez1998**, Pierre Colmez, *Intégration sur les variétés p-adiques*, Astérisque 248 (1998), [Numdam open archive](https://www.numdam.org/item/AST_1998__248__R1_0.pdf). Definitions II.1.2–II.1.3 and Theorem II.1.4, pp. 73–74, line 2982; Remark 2, pp. 2–3, line 225; Lemma II.1.13 and Remark II.1.18, pp. 78–79, lines 3147 and 3213; §II.2.5, p. 97, line 3950.
- **vologodsky2001**, Vadim Vologodsky, *Hodge structure on the fundamental group and its application to p-adic integration*, [arXiv:math/0108109v1](https://arxiv.org/abs/math/0108109v1). Standing p>2 convention §1.1, p. 2, line 51; Theorem B(4), §1.17, p. 5, line 195; Proposition 52, §17.2, p. 42, line 1806. These are v1 locators, not unchecked published numbering.
- **besser2017**, Amnon Besser, *p-adic heights and Vologodsky integration*, [arXiv:1711.06957v1](https://arxiv.org/abs/1711.06957v1). Definitions 3.1–3.2/Lemma 3.3, p. 9, line 402; Definitions 3.4/3.8 and Propositions 3.5/3.9, pp. 9–11, lines 435/492; graph theory and Theorem 4.4, p. 12, line 528; Theorem 4.10, Definition 4.11 and Proposition 4.12, pp. 14–16, lines 700/738/747; Corollary 5.3, p. 16, line 807. The height construction and comparison are outside scope.
- **besser-zerbes2017**, Amnon Besser and Sarah Livia Zerbes, *Vologodsky integration on curves with semi-stable reduction*, [arXiv:1711.06950v1](https://arxiv.org/abs/1711.06950v1). Theorem 1.1, p. 2, line 88; Corollary 1.2, p. 3, line 108; §2 and Lemma 2.1, pp. 3–5, lines 130/218; Tate example §3, pp. 5–6, line 245. The n≥3 presentation is replaced by a flag graph or subdivision in the general example.
- **besser-dejeu2012**, Amnon Besser and Rob de Jeu, *The syntomic regulator for K4 of curves*, Pacific Journal of Mathematics 260 (2012), 305–380, [publisher open archive](https://msp.org/pjm/2012/260-2/pjm-v260-n2-p03-p.pdf). Published §§7–8, pp. 355–362, lines 2227/2519; Lemma 9.1 and Proposition 9.2, p. 364, lines 2769/2776; shrinking and field descent in the introduction, p. 310, line 250. The regulator itself is not imported or constructed here.
