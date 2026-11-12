<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13471#issuecomment-6793069838 -->
Review (codex) of 5e31262

Verdict: needs_changes

1. **F01** (P1) Central specialisation tensors over the wrong coefficient ring

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:457`: “Z(g) the centre of U(g), K/ℚ_p finite and λ : Z(g) → K”; “D(G, K)_λ := D(G, K) ⊗_{Z(g),λ} K”. Also the quotient equality on that line, :462, :469 and §4.3 at :495.

   **Claim.** With g the ℚ_p-Lie algebra fixed at :144 and :457, this tensor product equals the quotient by the central operators z_i − λ(z_i), and has the strong dual asserted in §4.3. The coefficient field has already been extended in D(G,K), but not in the specified tensor base Z(U(g)).

   **Witness.** Take p=3, 𝔾=G=1, K=ℚ₃(√3). Then Z(g)=ℚ₃ and ker λ=0. The written tensor is K⊗ℚ₃K≅K×K, of K-dimension 2; the quotient and claimed strong dual are K, of dimension 1.

   This instance is a connected split reductive group with compact open subgroup; equivalently use the permitted empty product SL₂⁰. Writing s=√3 and σ(s)=−s, the isomorphism sends a⊗b to (ab,aσ(b)). Thus s⊗1−1⊗s maps to (0,2s), is nonzero, and is killed by multiplication. In contrast, the quotient on :457 is D/0=K and C^la(1,K)′=K. The finite-group Check at :469 silently changes Z(g) from ℚ_p to K, exposing the same mismatch. For non-rational values λ(z_i), z_i−λ(z_i) is not even an element of the rational centre whose kernel the sentence describes.

   **Exact repair.** Keep the general finite coefficient field. In §4.1 define Z_K := Z(U(g_K)) = K⊗ℚ_p Z(U(g)), and let λ : Z_K → K be a K-algebra character. Tensor D(G,K) over Z_K, and use ker λ in this centre for every distribution, Banach, closure and completed-enveloping quotient. Alternatively retain the rational character but explicitly extend it by λ_K(a⊗z)=aλ(z), and use Z_K and ker λ_K everywhere. Keep §4.2's ℚ_p-valued characters as the K=ℚ_p case; make the antipode in §4.3 its K-linear extension. State this scalar convention consistently in Conventions 6 and :462, and add the quadratic-field/trivial-group example as a negative-control Check.

   **Repair tested.** For the same K and G, Z_K=K, λ=id and K⊗_K K≅K=D/0=C^la(1,K)′, all of K-dimension 1. For SL₂ and λ(Δ)=s, the kernel in K[Δ] is (Δ−s); the rational kernel would instead be (Δ²−3). For K=ℚ_p the repair changes no formula, so the Fu endpoint and its descent square remain as intended. FU24 line 792 states its tensor formula with both coefficient fields equal to ℚ_p; ST02 line 636 explicitly extends the centre from L to K. Neither source supports the mixed-base identity as written here.

## Verified sound

### Previous findings checked first

The previous review and the repair report were read first. None of its findings was marked not actionable. All three are repaired; R01 above is a different error in an unchanged, freshly sampled passage.

| Previous finding | Repaired passage in `packages/LocallyAnalyticDistributionsPartII/README.md` | Verdict and test |
|---|---|---|
| F01: commutative flatness predicate on a noncommutative ring | :297 “for every injective A-linear map P → P′ of left A-modules”; :37 “the same holds for the opposite homomorphism” | Repaired. The specified maps are balanced extensions. For A=M₂(ℚ₃), Q=A and both tensor functors are the identity; E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂. No commutative scalar instance is demanded. |
| F02: missing Cohen supplier | :364 “DeformationAndDerivedPatchingAlgebra §1.10 gives a strict Cohen ring R′”; :366 “R is free on these e elements” | Repaired in Scope, contract, §§3.5–3.6, Needs and Layer 3 Dependencies. The supplier's actual §1.10 states the lifting map. For R=W(𝔽̄₃)[π], π²=3, R=R′⊕R′π and [K:K′]=2, whereas [K:ℚ₃]=∞. |
| F03: displaced ring in the torsion Check | :311 “For A = ℤ_p[[X]] with its (p, X)-adic filtration and T the powers of gr p” | Repaired. M=𝔽₃[[X]] is nonzero, 3M=0, 3∈S and Q⊗_A M=Q/Q3=0. The preceding ℚ_p-coefficient example is no longer its antecedent. |

The fresh pass covered every changed assertion: Convention 7, the balanced-tensor contract, §3.1 flatness and its new matrix Check, the Cohen contract, the coefficient-field construction, §3.6's tensor sidedness, and their dependency lines. Searches for the same patterns elsewhere found no further commutative flatness predicate applied to a noncommutative scalar ring, omitted Cohen invocation, or ambiguous “same A and T”. The commutative `Module.FaithfullyFlat` at §4.14 is appropriate. The older strictness, ramified deformation-index and infinite-residue-field repairs also remain intact.

### Principles, shape, and coverage

All 700 README lines, all 37 target subsections and all 37 Needs lines were read. The six layers each end with Examples and Dependencies. The fourteen explicit definition/API/Checks sections retain at least three Checks; §3.1 now has seven and §3.6 four. The two simple Lean definitions have four shared congruence-group Checks. The main-branch PadicMeasuresIwasawaAlgebras and RepresentationTheory/LieHighestWeight introductions and relevant layers were read for shape and ownership.

The Part II boundary builds on the base roadmap's abelian distribution theory and locally convex calculus. It imports distributions, Fréchet–Stein theory, uniform groups, PBW, classical Lie theory and completed group algebras rather than replacing those roadmaps. The endpoint includes non-induced integral Casimir parameters at every odd prime. The very-good-prime assumption on the source-general Verma theorem imposes no extra restriction on the odd-prime SL₂ endpoint. The alternative distribution proof retains its separatedness/domain premise; it is not substituted for the unconditional endpoint.

The layers follow the required mathematical constructions: lattices, embeddings, completions, microlocalisation, specialisation, and matrix coefficients. Their dependencies account for that order. The forward reference §4.7→§4.8 is acyclic, and §3.5 uses only the coefficient-subfield part of §3.6, which does not depend on §3.5. No copied source passage, computational algorithm, forbidden supplier, process narrative, machine path, HTML anchor, sorry-defined data, `set_option`, or admitted example was found in the package inputs. Source theorem names and mathematical words such as “lemma” in citations were not misclassified as Lean declarations.

The previous round's adversarial table has computed values for every target. For unchanged material outside this round's sample, those numerical/algebraic rows were used, not its blanket prose summaries. Every seeded target was reviewed afresh, as were all changed passages. The table below records fresh controls for the sample, headlines, repairs and R01. Zero coefficients, characteristic-p coefficients and noncompact groups are excluded where the explicit field/group assumptions require it; the generic ring targets retain zero-ring and zero-module interpretations. The subgroup definitions admit p=2, while the uniform-group endpoint excludes its order-two element explicitly.

### Headline coverage and Lean checks

| README headline or deep milestone | `packages/LocallyAnalyticDistributionsPartII/Suggested.lean` coverage |
|---|---|
| Finite-dimensional Iwasawa semisimplicity, §3.8 | Theorem at :78 on the actual rational completed group algebra of G₁^m. |
| Algebraic Peter–Weyl, §5.2(iii) | Theorem at :98 constructs a surjective K-algebra map and prescribes the action of every group element on the native tensor of symmetric powers. |
| Fu injectivity, §4.14 | Docstring :25: missing noncommutative completed central quotient and specified microlocalisation map. |
| Microlocalisation and D_(1/p), §§3.4–3.5 | Docstring :31: missing filtered microlocalisation, completed enveloping algebra and distribution stages. |
| Affinoid Verma faithfulness, §4.13 | Docstring :35: missing completed Verma carrier and action; the p^n lattice is retained. |
| Frommer and Banach crossed products, §§2.3–2.4 | Docstring :38: missing distribution Banach stages. |
| Central quotient domains/normal forms, §§4.7–4.10 | Same docstring item: missing Banach stages and completed quotients. |
| Isotypic comparison, §3.10 | Docstring :41: missing microlocalised module and map. |
| Central strong duality, §4.3 | Docstring :43: missing locally analytic compact-type topology and strong dual. The antipode twist is present; the coefficient convention needs R01's repair. |
| Arens–Michael Fréchet–Stein theorem, §2.5 | Docstring :46: missing envelope and Fréchet–Stein carriers. |

No additional statable headline omission or stand-in was found. Both owned backticked theorem names and both owned definition names occur in the README and are declared in the Lean file. Supplier names and mathematical notation were distinguished from claims of package declarations.

The required `lake env lean` on the original file, run from the content checkout, exited 0. Its only diagnostics were the two expected `declaration uses sorry` warnings at :78 and :98. The used Tau Ceti object files were present. No build was needed.

A scratch copy appended `#check @name` for all four declarations and elaborated successfully. Both definitions retain `Fact p.Prime`; semisimplicity retains p≠2, both module structures, their scalar tower and finite dimension; Peter–Weyl retains p≠2, m, k, K, both scalar algebra structures, the tower and finite dimension over ℚ_p. All agree with their explicit README headline instances. Nothing was changed. An initial scratch invocation from the board directory reported no default toolchain; the required invocation from the content checkout then succeeded without changing configuration.

Every sorried theorem was tested with closing `simp`, `rfl` and `infer_instance` alternatives in a scratch copy. Both reached the fallback `sorry`; neither is padding. The scratch-only unused-tactic diagnostics do not occur in the original-file build. The candidate one-lemma proofs were read at the pin: finite-group Maschke is not Iwasawa semisimplicity; Jacobson/Burnside density assumes an already appropriate action and does not construct this completed action. No candidate gives an `exact` proof of either headline. All Lean processes finished.

### Seeded sources

All fifteen seeded targets were checked against the cached legal texts at their locators. The manifest records fifteen distinct works, ten readable and five settled inaccessible works. No additional author-flagged unverified locator was found. No source was fetched or manifest entry changed. Numbering below is that of the versions explicitly cited in the README; page numbers are printed pages, not extraction offsets. Secondary attributions inside AW13, ST02 and FU24 were not treated as independently read originals.

| Seeded target | Passage read | Assessment |
|---|---|---|
| §0.2 First congruence subgroups | FU24 line 123, before Theorem 1.4, p.3; FU24 line 941, Lemma 5.6, p.19 | Kernel and product are the intended groups. The index is the elementary surjective-reduction consequence, with the p=2 control retained. |
| §1.2 Crossed products | ST02 line 514, Lemma 3.1 proof, p.13; AW13 line 3317, §10.6, p.72 | Left cosets give a right basis; inverses give a left basis. Twisting is retained. MR01 original remains waived. |
| §3.2 m-adic filtration | AW13 line 3102, §10.1, pp.67–68; line 3167, Lemma 10.2; line 3190, Theorem 10.3, p.69 | Arbitrary residue field, p uniformiser, degree formula and enveloping graded ring all agree. Infinite-residue coefficients are proved through completed coefficient extension here. SCH11 original is uncertified. |
| §3.3 Ore set | AW13 line 3228, §10.4, p.70; line 3298, §10.6, pp.71–72 | Exact powers of the symbol of p, not every nonzero symbol; conjugation stability and unramified restriction agree. |
| §3.8 Semisimplicity | AW13 line 3653, §11.1, pp.78–80; line 2811, §9.2, p.61; line 3749, §§11.2–11.3, pp.80–81 | Finite dimension and semisimple Lie algebra are retained. The extension beyond simply connected groups uses the deeper lattice; the unrestricted lattice claim remains qualified. |
| §3.9 Attached Lie module | FU24 line 700, p.14; AW13 line 2816, §9.2 Proposition and proof, p.61 | Stable-lattice extension and pullback are supported. The native action is applied to a compact ℤ_p-lattice and then base changed. |
| §4.1 Central specialisations | FU24 line 773 and line 792, §5 and Theorem 5.2, p.16; ST03 line 449, Proposition 3.7, pp.11–12 | Closed central ideals and quotient theory supported. FU24 uses ℚ_p on both sides; it does not justify the changed tensor base for general K. R01. |
| §4.3 Strong duality | FU24 line 792, Theorem 5.2 and (25)–(26), p.16; ST02 line 635, Proposition 3.7, p.16 | The package's antipode correction is correct. Its general-K quotient needs the scalar repair R01. |
| §4.5 Eigenfunction density | FU24 line 807, Theorem 5.2 proof, pp.16–17 | Nowhere-vanishing f₀ times locally constant functions gives density. Inversion supplies the antipode-twisted eigenspace. |
| §4.8 Small radii | FU24 line 448, Lemma 3.3, pp.9–10; line 818, equation (27), p.17; line 972, equation (30), p.20; KOH07 line 665, §1.4, pp.15–16 | This is explicitly a derived target, not a quotation of a nonexistent theorem. Log/exp convergence, bounded reduction and the integral endpoint support its stated range and normal forms. |
| §4.9 Ext/grade | AB07 line 612, §5.4 Lemma, pp.16–17; line 627, Corollary, p.17 | Right-module Ext orientation agrees. The cocycle correction in the inverse pairing is necessary and works. |
| §4.12 Integral highest weights | FU24 line 163, Theorem 1.5 and following sentence, p.4; AW14 line 453 and line 471, §§4.5–4.6, pp.10–11 | The quadratic-root construction is a valid explicit derivation; it produces the R-linear character required by the source. |
| §4.14 Fu injectivity | FU24 line 163, Theorem 1.5, p.4; AW14 line 489, Theorem 4.6, p.11; line 740, Theorem 5.4, p.16 | Integral arbitrary parameters, finite coefficient extension, corrected deformation index and faithful descent are supported. |
| §5.1 Algebraic functions | FU24 line 1062, §6, pp.21–22 | Coordinate relation, degree filtration and dimension difference agree; open-subgroup restriction is injective by Zariski density. |
| §5.2 Peter–Weyl | FU24 line 1094 and line 1113, §6 and (32), p.22; AW13 line 3749 and line 3776, pp.80–81 | Product action, matrix-coefficient dimensions and quotient identification agree. The source's right-unipotent typo is corrected. |

The repair-specific source passages were also read: AW13 line 402 through its microlocalisation corollary at line 423, pp.8–9, and AW14 line 642 through line 666, §5.2, p.14. ST03 line 474 verifies the coadmissibility premise in the general Fréchet–Stein contract; line 817 verifies HYP and the odd-prime uniform-group instance. SCHM13 §§3.2 and 4.3.3 and BCGP25 §§2.2.29–2.2.35 were read for the envelope and sidedness controls.

### Computed adversarial table

These are discriminating computations, not formal proofs of the admitted theorems. For unchanged targets not repeated here, the earlier computed rows were retained as described above.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.2 definitions and indices | p=2,3,5; m=0; upper unipotents | p(p²−1)=6,24,120; empty-product index=1. I+pE₁₂ reduces to I, I+E₁₂ does not. −I reduces to I only at 2. | Correct; p=2 uniformity explicitly fails. |
| §1.2 coset sides | S₃, H=⟨(12)⟩ | Left reps 1,(23),(123) give right-span dimension 6 but left-span dimension 4; inverse reps restore left-span dimension 6. | Correct sides. |
| §1.2 cocycle | ℤ₃ over 3ℤ₃, reps 0,1,2 | 2+2=4=3+1; δ₂δ₂=δ₃δ₁, not δ₁. | Twisting retained. |
| Convention 7, §3.1 flatness | A=M₂(ℚ₃), T={1}; ℤ→ℤ/2 | Q=A, A⊗_A P=P; E₁₂E₂₁=E₁₁, reverse product E₂₂. Tensoring ×2 on ℤ with ℤ/2 gives 0 on a nonzero module. | Repaired notion admits the matrix ring and rejects a nonflat map. |
| §3.1 torsion Check | A=ℤ₃[[X]], M=A/(3) | 1≠0 in M, 3M=0; Q=ℚ₃⟨X/3⟩ and Q/Q3=0. | F03 repaired. |
| §3.1 filtered/strict distinction | Laurent filtration; xy=0 ring | deg_A(x⁻¹)=1, deg_Q(x⁻¹)=−1; in ℚ₃[[x,y]]/(xy), y≠0 but its localisation is 0. | Older repair survives; unconditional strictness is absent. |
| §3.2 coefficients and degree | ℤ₃ and W(𝔽̄₃), G=ℤ₃ | Graded rings are respectively 𝔽₃[P,X] and 𝔽̄₃[P,X]; degree-n dimension over k is n+1. deg(3+b²)=deg(b+9)=1, symbols P and X. | Correct coefficient extension. |
| §3.2 rank zero/algebraic tensor | G=1; independent residues x_j | G=1 gives gr R=k[P], deg(3)=1. Algebraic tensor coefficients span finitely many residue dimensions; Σ[x_j]b^j has infinite-dimensional residue span. | Completed extension is necessary. |
| §3.3 exact Ore set | ℤ₃; R=ℤ₃[π], π²=3 | 1,3,12∈S; 2,6∉S; saturation inverts all nonzero scalars. In ramified R, 0=3−3∈3+m². | Correct exact symbols and coefficient restriction. |
| §§3.5–3.6 coefficient field | ℤ₃; W(𝔽̄₃)[π], π²=3 | R′-bases (1) and (1,π), degrees 1 and 2; second K has infinite ℚ₃-degree. In characteristic 3, ℤ₃→𝔽₃[[t]] sends 3 to 0. | F02 repaired; mixed characteristic used. |
| §3.6 tensor sidedness | G=1; general pure tensors | G=1: Λ=K′, A=B=K, both tensors=M. u⊗(λ⊗c) maps to c⊗uλ; right multiplication by c′⊗λ′ gives cc′⊗uλλ′ on both sides. | Right-A-module identification is correct. |
| §§3.4–3.5 headline comparison | G=ℤ₃; G=1 | b↦exp(3u)−1 has norm 1/3 and inverse u=log(1+b)/3; rank zero gives K→K. Coefficients d_j=3^(−j) have weighted norms 1, not tending to 0. | Correct normalisation and c₀ condition. |
| §3.8 semisimplicity headline | m=0; M=0; abelian negative control | For m=0 the algebra is ℚ₃, complements exist; zero module has one submodule. For ℤ₃ acting by I+N, N²=0≠N on ℚ₃², the invariant line has no invariant complement. | Semisimple Lie hypothesis excludes the counterexample. |
| §§3.8–3.9 stable lattices | PGL₃ at 3; SL₂ standard module | q has eigenvalues 1/3,1/3,−2/3, determinant −2/27; 1−3q=diag(0,0,3). For SL₂, exp(3e)=I+3e. | Lattice qualification distinguishes the two cases. |
| §3.9 Lie versus Artin | trivial module; nontrivial order-3 character | Lie action 0 gives exp(0)=1; an Artin character sends a generator to ζ₃≠1 while its derivative is 0. | No unintended identification. |
| §4.1 coefficient base; §4.3 | G=1, K=ℚ₃(√3) | Written tensor has K-dimension 2 and zero divisors; D/0 and C^la(1,K)′ have dimension 1 and are fields. Repaired tensor over Z_K=K has dimension 1. | **R01.** |
| §4.1 Casimir convention | k=0,1,2 | Δ eigenvalues 0,3/2,4; Killing Casimir eigenvalues 0,3/8,1. For k=2, ½·4−2+4=4. | Δ=4Ω is correct. |
| §4.1 vanishing Check | p=3,r=3^(−2/3),λ=1/3 | ‖Δ‖≤3^(2/3)<3=|λ|; ‖λ⁻¹Δ‖<1, quotient=0. | Correct nonintegral negative control. |
| §4.3 antipode | torus f(g)=g | Left infinitesimal eigenvalue −1; (x̃+δ₁)(f)=2, (x̃−δ₁)(f)=0. | λ∘S is required. |
| §4.5 density and inversion | χ(t)=t, p=3; χ=1 | f₀(4)=4, |f₀|=1; multiplying an approximation error ε preserves ε. Inversion preserves sup error and exchanges weights −1,+1. χ=1 gives f₀=1. | Both eigenspaces and injection supported after R01. |
| §4.8 logarithmic radius | p=3, r=1/3 and 3^(−1/√2) | ρ=1 and 3^(1−1/√2)>1; x=p⁻¹log(1+b) has norm ρ. h²=2λ+2h−4ef has term weights ≤ρ² for |λ|≤1. | Normal-form reduction is bounded. |
| §4.8 domain discriminator | p=3; one and two factors | Matrix of ½h²+2ef has determinant −1/2≠0; each block has quotient dimension 2, two blocks dimension 4. At ρ=1 use the PBW filtration on the reduced enveloping quotient, not a falsely commutative norm reduction. | Correct domain route. |
| §4.9 Frobenius comparison | T=ℚ[u]/(u²−2); M=0,T | α(f)=u/2, β(u/2)(u)=1, β(u/2)(1)=0; omitted cocycle gives 1/2. Grades of 0 are ∞ on both sides, grades of T are 0. | Correct pairing, Ext sides and zero convention. |
| §4.12 highest weights | λ=1,−1/2 at 3; m=0 | a=−1+√3 gives a(a+2)/2=1; a=−1 gives −1/2; empty extension degree 1. a(√3h)=3−√3. | Integral character has the stated R-linear domain. |
| §4.13 faithfulness headline/index | π²=3,n=1,λ(3h)=1 | Index en=2; at index 1, ‖3h‖=3^(−1/2) and λ(πh)=π⁻¹∉R; at index 2, ‖3h‖=1 and 1−3h evaluates to 0 in K⟨3h⟩. | Older index repair remains necessary and correct. |
| §4.14 endpoint | p=3,λ=1; m=0 | 2λ+1=3 is nonsquare in ℚ₃; coefficient degree=2 and n=en=0. Empty product map is ℚ₃→ℚ₃, kernel 0. | Non-induced integral case retained. |
| §5.1 algebraic functions | degrees 0,1,2; subgroup {±I} | Graded dimensions 1,4,9; filtered dimensions 1,5,14. x−w vanishes on {±I} but is a nonzero coordinate function. | Correct filtration and openness control. |
| §5.2 Peter–Weyl headline | k=0,1,2; k=(1,2); m=0 | End dimensions 1,4,9; product module dimension 6 and End dimension 36; empty tensor End dimension 1. | Correct generality and dimensions. |
| §5.2 actual action | I,I+3E₁₂,I+3E₂₁,diag(4,1/4) | Vectorized determinant −135/4≠0, hence span dimension 4; trivial-action span would have dimension 1. | Lean prescribes the right action. |
| §5.2 left/right translations | lower-left and upper-right unipotents | (n_lower⁻¹g)₁₁=x, (gn_upper)₁₁=x, whereas (gn_lower)₁₁=x+ay. | Correct right subgroup. |

### Pinned declarations and ownership

The following native files and declarations were opened at the pins. The carrier definitions were read, including their omitted properties; existence of a name alone was not treated as a mathematical verification.

| Object | Pinned declaration and repository-relative file | Scope checked |
|---|---|---|
| Completed group algebra and group elements | `TauCeti.completedGroupAlgebra`, `.of`, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145,252` | Compatible finite-quotient families, arbitrary commutative coefficients; compactness of the coefficient ring is not required for the carrier. |
| Compact modules and action | `TauCeti.IsCompactModule`, `TauCeti/Topology/Algebra/Module/Compact.lean:294`; `.completedGroupAlgebraModule`, `.completedSMul_of`, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322,251` | Four predicate fields include compactness, total disconnectedness and continuous actions, not a separate T2 field. The action's compact-coefficient hypotheses are used only on ℤ_p-lattices here. |
| Noncommutative tensors | `TauCeti.BalancedTensorProduct`, `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55`; `.assoc`, `Associator.lean:117` in that directory | Quotient by ma⊗n−m⊗an and reassociation through a bimodule. Scalars may be ℤ; the intermediate ring need not be commutative. |
| Extension functor | `TauCeti.BalancedExtension`, `.map`, `.lid`, `TauCeti/LinearAlgebra/TensorProduct/Balanced/Extension.lean:118,251,291` | S⊗_R P for a ring homomorphism; map on R-linear maps; identity comparison. Supports the repaired flatness formulation. |
| PBW | `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75`; `Module.Basis.pbwBasis`, `.pbwBasis_eq_prod_pow`, `Basis.lean:96,175`; `.pbwAssociatedGradedEquiv`, `Injective.lean:213` in that directory | Free Lie module over a commutative ring, increasing ordered monomials, symmetric associated graded. |
| Enveloping algebra and sl₂ | `UniversalEnvelopingAlgebra`, `.ι`, `.lift`, `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65,80,92`; `LieAlgebra.SpecialLinear.sl`, `Mathlib/Algebra/Lie/Classical.lean:92`; `IsSl2Triple`, `Mathlib/Algebra/Lie/Sl2.lean:38` | Native algebra, Lie map/universal property, trace-zero matrices and bracket normalisation. |
| Casimir | `TauCeti.casimirElement`, `.casimirElement_mem_center`, `TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:125,175` | Killing-dual-basis normalisation; roadmap Δ is four times this element. |
| Congruence subgroup ingredients | `Matrix.SpecialLinearGroup`, `.map`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70,225`; `PadicInt.toZMod`, `Mathlib/NumberTheory/Padics/RingHoms.lean:301`; `MonoidHom.ker`, `Mathlib/Algebra/Group/Subgroup/Ker.lean:238`; `Subgroup.pi`, `Mathlib/Algebra/Group/Subgroup/Basic.lean:172` | Determinant-one matrices, entrywise reduction, actual kernel and coordinatewise membership. |
| Symmetric-power action | `TauCeti.symPowerRep`, `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`; `SymmetricPower`, `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53`; `PiTensorProduct`, `.map`, `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:104,481`; `.toGL`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369` | Actual standard action on symmetric tensors and all factors of the product; no arbitrary-action parameter. |
| Flatness and opposites | `Module.Flat`, `Mathlib/RingTheory/Flat/Basic.lean:83,114`; `Module.FaithfullyFlat`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:58,64`; `RingHom.op`, `Mathlib/Algebra/Ring/Opposite.lean:270` | Commutative binders on native flatness; opposite-ring map available without commutativity. |
| Ordinary coefficient tensors | `TensorProduct`, `Mathlib/LinearAlgebra/TensorProduct/Defs.lean:72`; `Algebra.TensorProduct.rid`, `Mathlib/RingTheory/TensorProduct/Maps.lean:274` | Appropriate over commutative coefficient fields; the tensor base must still be correct (R01). |
| Ore and filtered rings | `OreLocalization.OreSet`, `Mathlib/GroupTheory/OreLocalization/OreSet.lean:52`; `OreLocalization`, `Basic.lean:92` there; `IsRingFiltration`, `Mathlib/RingTheory/FilteredAlgebra/Basic.lean:75` | Ore denominator data and ring filtration; completeness, exhaustiveness and separatedness are additional README hypotheses. |
| Ring predicates | `IsNoetherianRing`, `Mathlib/RingTheory/Noetherian/Defs.lean:191`; `IsDomain`, `Mathlib/Algebra/Ring/Defs.lean:437` | Left-noetherian abbreviation; domain includes nontriviality, so a zero central quotient is not a domain. |
| Semisimplicity and near matches | `IsSemisimpleModule`, Jacobson density, `Mathlib/RingTheory/SimpleModule/Basic.lean:66,573`; Maschke, `Mathlib/RepresentationTheory/Maschke.lean:165`; `asAlgebraHom_surjective_of_isIrreducible`, `TauCeti/RepresentationTheory/Irreducible.lean:242` | Complemented submodule lattice; finite group requirement for Maschke; existing irreducible action/algebraically closed field for the cited Burnside form. None closes a headline directly. |
| Completion limitation | `AdicCompletion` ring instance, `Mathlib/RingTheory/AdicCompletion/Algebra.lean:40,97` | CommRing scalar/completed ring; does not give a ring structure for the completion of noncommutative U(h) by this instance. |
| Topological/algebraic helpers | `Subalgebra.topologicalClosure`, `Mathlib/Topology/Algebra/Algebra.lean:263`; `.center`, `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:906`; `NormedSpace.exp`, `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128`; `MvPolynomial`, `Mathlib/Algebra/MvPolynomial/Basic.lean:80` | Closure and centre are native; convergence of the total exponential is still a theorem required here. |
| Functions and modules | `ContinuousMap`, `Mathlib/Topology/ContinuousMap/Defs.lean:32`; `LocallyConstant`, `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `AbstractMeasure`, `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`; `LieModule`, `Mathlib/Algebra/Lie/Basic.lean:93`; `IsUltrametricDist`, `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47` | Maps carry their actual continuity/local constancy; measure carrier is a continuous dual; Lie action has scalar compatibility. |

The near-match search's congruence groups are over ℤ, not ℤ_p. The compact-group Peter–Weyl results concern complex continuous/unitary representations and their Haar topology, not the p-adic algebraic coefficient quotient. The two package definitions are necessary specialisations of native carriers. Object searches were run through `roadmaps grep` and at the pins for completed algebras, lattice/coordinate theory, Cohen rings, enveloping completions, microlocalisation, Frommer closures, Arens–Michael envelopes, finite crossed-product Ext and Peter–Weyl. No duplicate fully qualified package declaration was found.

### Supplier resolution, overlap and order

The board-package index and the supplied open-head/overlap indices were read before ownership conclusions. `roadmaps show` was used to read the relevant open heads, and `roadmaps resolve` returned no unresolved cross-roadmap citation or name. Its native-name disclaimer was handled by the independent pin reads above. The supplied overlap report lists no conflicting head, dropped cited id, revision-only id, or dropped local id; the five closest roadmaps were inspected. No new overlap finding was found.

| Supplier / nearby work | File and resolved locations | Result |
|---|---|---|
| NoncommutativeAndEquivariantIwasawa, open #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:150,177,209,271,303,333,378,435,590` | §§0.1–0.3,0.5–0.8,F.1,0.13a exist with the cited group, filtration and Lie content. Its finite-free coefficient convention is respected. Its Iwasawa finite-index Ext comparison is narrower than §4.9's arbitrary-ring crossed product; the latter is the generic extension, not a second Iwasawa grade construction. |
| PadicLocalLanglandsForGL2Qp, open #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`; compatibility table at :2424 | §0.1 supplies the analytic/distribution carriers, flatness and duality with the stated coefficient hypotheses. Its compatibility table explicitly retains AnalyticSupport abbreviations and the named operations. General Fréchet–Stein theory and explicit radii remain the declared gaps. |
| LocallyAnalyticDistributions, open #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891,1048,1081,1344` | §§0.0–0.3 provide the stated locally convex, Hahn–Banach, chart and duality interfaces, with their coefficient restrictions. Discretely valued shared carriers point to the preceding supplier. |
| DeformationAndDerivedPatchingAlgebra, open #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:246,250` | §1.10 supplies strict Cohen rings and compatible lifting into the prescribed complete local target, including noninjective maps in characteristic p. The package derives injectivity and the finite free DVR consequence. F02 repaired. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:398,657,909` | Layer 0, §§1.2,1.7 supply bounded measures, convolution and the countable-tower comparison. Compact p-adic analytic groups satisfy the tower requirement. |
| LieHighestWeight, main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,405,567,931` | Layers 0,3,5,7 supply/import the stated classical representation and centre results. Native PBW/Casimir/complete-reducibility objects are not re-owned here. |
| CompletedCohomologyPartII, open #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:7` onward, Scope | Arithmetic towers, completed cohomology and analytic-vector comparisons; no competing microlocal/enveloping construction. |
| GlobalGaloisDeformationsPartII, open #1837 | `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:7,15` | Galois lifting and finite-coefficient applications; explicitly imports Lazard and Lie foundations. No second ownership of these endpoints. |

The two declared slugs `frechet-stein-general` and `radius-algebras` agree between `packages/LocallyAnalyticDistributionsPartII/design/plan.json` and README:56,58, with named supplier PadicLocalLanglandsForGL2Qp §0.1. Their mathematical hypotheses are precise: B must be coadmissible over A in the restriction theorem; the radius presentation retains HYP, null coefficients, and rational-power radii for the Fréchet–Stein stages. They are contracts with the existing owner, not unowned prerequisites, and request no duplicate package construction. A future acceptance remains conditional on them.

Required dependency-check output:

```text
depcheck: 237 roadmaps, 2144 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The new Cohen supplier edge points from an earlier roadmap. Neither the merge order nor tooling was changed.

## Not verifiable

- SCH11 remains settled uncertified/paywalled. Its original Theorem 28.3, Corollary 31.7 and Theorem 32.1 passages could not be read. Their exact citations remain, without a renewed request.
- FROM03, DDMS99, MR01 and DG70 remain settled waived. Their original passages were not available. Accessible KOH07, AW13, AB07 and ST02 support the uses checked above but do not certify the unavailable originals.
- Ownership against open work without a readable head in the supplied indices/configured tools was not independently checked. No absence claim relies on such unavailable work.
- The original and scratch Lean runs establish elaboration and the stated probe outcomes, not proofs of the admitted headlines. Source checks, explicit hypotheses and computed controls are the mathematical review evidence.

## Source issues

R01 is a package coefficient-extension error, not an error in FU24's ℚ_p-coefficient tensor formula. The following source defects were encountered/rechecked; none is a reason to restore an incorrect source convention in the package.

- **Misprint** in FU24 at §4, equation (16), printed page 14: the source says the completion consists of bounded weighted coefficients; it should require weighted coefficients tending to zero; affects nothing.
- **Gap** in FU24 at Theorem 4.2, printed page 14: the source says the cited theorem proves noetherianity at every real radius; it should provide the irrational-radius proof or qualify that assertion; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed page 14: the source says its Ore-set formula applies to ramified coefficient rings; it should use unramified coefficients and base change; affects the proof.
- **Error** in FU24 at Theorem 5.7, printed page 20: the source says every central parameter gives a domain; it should exclude parameters whose defining central element is a unit; affects a stated result.
- **Gap** in FU24 at Theorem 5.7 proof, printed page 20: the source says the weaker-norm graded calculation transfers the domain property; it should establish separatedness of the quotient filtration; affects the proof.
- **Error** in FU24 at Remark 5.8, printed pages 20–21: the source says integrality characterises induced parameters; it should require 2λ+1 to be a square in ℤ_p; affects a stated result.
- **Error** in FU24 at §5 before Theorem 5.2, printed page 16: the source says the principal-series character is dχ composed with HC; it should include the antipode for the specified left-translation action; affects a stated result.
- **Error** in FU24 at Theorem 5.2, printed page 16: the source says the natural strong dual retains the same central character; it should use the antipode-twisted character under this action convention; affects a stated result.
- **Misprint** in FU24 at §6, printed page 22: the source says the right stabilising unipotent subgroup is lower upper triangular; it should say upper triangular; affects nothing.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 14: the source says weighted boundedness describes the completion; it should require weighted coefficients tending to zero; affects nothing.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 15: the source says distributions surject toward the underlying ℚ_p-analytic structure; it should reverse the surjection, from ℚ_p-analytic to locally L-analytic distributions; affects nothing.
- **Error** in AW14 at §5.4 Theorem with §4.5 Definition, printed pages 16 and 10: the source says index-n Verma modules accept characters on p^n t; it should use index en when p is a unit times π^e; affects a stated result.
- **Misprint** in AB07 at §5.4 Lemma proof, printed page 17: the source says the inverse Frobenius pairing takes only the inverse-index coefficient; it should include the cocycle, or take the identity coefficient of the product; affects the proof.
- **Misprint** in AB07 at §5.4 Corollary, printed page 17: the source says R=T∗G while also naming R as the base ring; it should say T=R∗G; affects nothing.
- **Misprint** in AW13 at §11.1 Theorem proof, printed page 80: the source says V→RLV is the counit and LRW→W the unit; it should exchange the two names; affects nothing.
- **Misprint** in BCGP25 at Definition 2.2.31, printed page 24: the source says a left-module transition tensors the module on the left of the algebra; it should tensor the Banach algebra on the left of the module; affects a stated result.
- **Error** in SCHM13 at Proposition 3.2.1 proof, printed page 6: the source says every r>1 PBW norm for its arbitrary chosen basis is submultiplicative; it should first use an integral bracket-stable basis or sufficiently large radii; affects the proof.

For the last item, over ℚ₃ take [x,y]=y/9 and ordered basis (x,y), r=2: ‖x‖‖y‖=4, but yx=xy−y/9 has norm 18. The proposition's cofinal completion survives; the package already fixes a bracket-stable integral lattice in §2.5, so this is not a package finding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5e3126294c3040c98a3b2b20f9f4bc75602a6887", "job": "REV-PKG-LocallyAnalyticDistributionsPartII~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
