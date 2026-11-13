<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6858470284 -->
Red team round 1 pass a (codex) of db295a0

Verdict: needs_changes

1. **F01** (P2) The other open head changes the same acceptance carrier

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean:52`; README §0.3, line 186.

   **Claim:** The package introduces its own flag-stabilizer parabolic and uses it in the headline signature.

   **Witness:** The other open head (#2287), `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:199`, instead imports `TauCeti.TitsSystem.standardParabolic`. It also changes §§0.2 and 6.7 ownership. These are different implementations of the same targets.

   **Exact repair:** Rebase this package on the current #2287 head before either merges, retaining its native parabolic imports, compact-graph supplier and Breuil–Kisin-twist supplier changes; then apply the independent findings below. Do not independently recreate those changes. At d=1 the imported empty parabolic is the upper triangular Borel and the full parabolic is GL₂, preserving the package's two tests. The pinned implementations exist in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195` and `TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean:48`.

2. **F02** (P1) Subdivision collapses the two ends of a loop

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:157`, “edge set `I₂ = {(a, s) : a ∈ A, s an endpoint of a}`”.

   **Claim:** This subdivision preserves cohomology, including loops allowed in line 152.

   **Witness:** One vertex s and one loop a over ℚ: original ∂=0 and H¹=ℚ. The displayed set has only (a,s); the new complex is ℚ²→ℚ, (x,y)↦y−x, surjective, so H¹=0.

   **Exact repair:** “Let Inc(a) be the set of endpoint incidences: two separately tagged incidences for a relatively compact edge, even when its endpoints coincide, and one for a leg. Put I₂=Σ_a Inc(a), and I₂,c=Σ_{a∈A_c} Inc(a). Attach each incidence to its original endpoint and the inserted vertex, retaining legs.” Add: “A subdivided loop has two parallel edges; its differential has image ℚ(1,1) in ℚ², hence H¹=ℚ²/ℚ(1,1)≅ℚ.” Use incidence multiplicity throughout §2.2. CDN-CURVES line 774 has the same problem; see Source issues.

3. **F03** (P2) Graph functoriality lacks properness and variance

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:155`, “functorial for morphisms of oriented graphs with legs”; line 173, “natural for length-preserving maps”.

   **Claim:** All three cohomology constructions and monodromy are functorial for unspecified graph morphisms.

   **Witness:** The length-preserving covering ℤ→the one-loop graph pulls the target's finitely supported vertex cochain 1 back to the constant cochain 1 on infinitely many vertices. This is not in ℚ^(ℤ).

   **Exact repair:** “Ordinary cohomology has contravariant pullback for cellular graph maps. Compactly supported cohomology has contravariant pullback for proper cellular maps; its linear dual is covariant for those maps. Specify these maps on the cochain complexes. Monodromy is equivariant under length-preserving graph isomorphisms and compatible with subdivision when the subdivided lengths sum to the original length.” If additional morphisms are needed, state their chain maps and compatibility separately. Add the covering above as a negative control: ordinary pullback exists, compact-support pullback does not. For an isomorphism the inverse image of a finite support is finite; for a loop split into lengths a,b the monodromy is a+b on both descriptions.

4. **F04** (P1) The integral sequence in §3.3 drops the proper-curve cokernel

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:460`, “the exact sequence `0 → O(Y_S)/O_C → Symb_p(Y) → … → 0`”.

   **Claim:** This sequence is exact for the quasi-compact curves of Layer 3, including proper curves.

   **Witness:** For a proper ordinary elliptic curve, O(Y_S)/O_C=0 and ℚ_p⊗Symb_p(Y)=ℚ_p². The rational period term is X_st¹(H¹_HK(Y)), of Dimension (1,2), and has cokernel H¹(Y,O)=C by §4.7.

   **Exact repair:** Replace the claimed integral short exact sequence by: “Put A_st=A_cris⟨v⟩_PD, the divided-power polynomial extension, with φ(v)=pv and N_A(v)=1; horizontal extension is x↦1⊗x−v⊗Nx. Identify v with −u in the convention N(u)=−1. The symbol regulator followed by horizontal extension is independent of the compatible powers of p. After rationalization its exact sequence is 0→O(Y)/C→ℚ_p⊗Symb_p(Y)→X_st¹(H¹_HK(Y))→H¹(Y,O)→0. Integral assertions retain their bounded p-power errors as in §§3.3–3.4.” Specify the identification of the A_st operator with the chosen B_st convention. On the elliptic curve this restores the nonzero C cokernel; on an affinoid H¹(Y,O)=0. CDN-CURVES lines 3763–3769 omit the proper case's obstruction; lines 558–560 and 3673–3686 exhibit it. Do not infer exact integral surjectivity from the source's displayed sequence.

5. **F05** (P2) The gluing map reverses direction without taking its inverse

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:356` and `:375`, both naming `ι_{a,s}`.

   **Claim:** §2.2 defines ι from the leg ghost circle to the short ghost circle; §2.3 defines the same symbol from the short to the leg.

   **Witness:** For a coordinate identification T_s↦2T_a over C at p=3, the inverse sends T_a↦T_s/2. The two algebra maps have coefficients 2 and 1/2, not the same coefficient.

   **Exact repair:** Keep §2.2's convention and replace the §2.3 bullet by: “The gluing isomorphism ι_{a,s}:Y_{a,s}→Y_{s,a} induces the continuous R-algebra isomorphism ι_{a,s}^*:O(Y_{s,a})→O(Y_{a,s}). Its inverse has the reverse source and target.” Rewrite the coordinate-rescaling Check with this variance. The two maps in the witness then compose to T_s↦T_s and T_a↦T_a.

6. **F06** (P2) The acceptance test omits pairwise non-isomorphism

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:213`; `Suggested.lean:122`.

   **Claim:** §0.4(a) promises the irreducible constituents with their distinct labels, but Lean tests only irreducibility.

   **Witness:** `Mathlib/RepresentationTheory/Intertwining.lean:320` already defines `Representation.Equiv`. With the existing generalizedSteinberg definition, non-isomorphism needs no missing geometric carrier. GK14 lines 1328–1332 state distinctness and multiplicity one.

   **Exact repair:** Add a sorry theorem with the same p,K,A hypotheses as `generalizedSteinberg_isIrreducible` and conclusion `Nonempty ((generalizedSteinberg K A d J).Equiv (generalizedSteinberg K A d J')) ↔ J = J'`. Use the imported simple-reflection index after R01. Retain the distinctness/multiplicity theorem as a headline in the module docstring, and state its finite-filtration form if using the native subrepresentation carrier. Test J=J′ via the identity; for d=1 the trivial representation and Steinberg are distinct; d=0 has a single label. Merely asserting irreducibility would accept an incorrect construction assigning the trivial representation to every J.

7. **F07** (P3) The Jacobian period limit does not stabilize

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:632`, “For `x ∈ V_p(J)` the limit stabilizes”.

   **Claim:** The bounded-lift construction becomes constant for Tate-module inputs.

   **Witness:** Let J be an elliptic Jacobian and x=0. Choose every lift x̂_n equal to a fixed nonzero vector v in the vector-group kernel of J̃→J. Then pⁿx̂_n=pⁿv converges to 0 but never stabilizes.

   **Exact repair:** “For x∈V_p(J), the convergent bounded-lift construction gives its Fontaine period. It need not be eventually constant: for x=0 and constant vector-group lifts v≠0, its terms are pⁿv→0.” This tests the construction's actual limit and preserves lift independence. CDN-CURVES lines 4112–4114 assert a limit, not stabilization.

8. **F08** (P3) A dimension-one Check forgets disconnected components

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:720`, “with `Ω⁰/ker d = O(X_C)/C`”.

   **Claim:** This equality holds for all dimension-one Stein semistable models of §5.1.

   **Witness:** The disjoint union of two standard half-plane models satisfies §5.1. The function (0,1) is killed by d but is nonzero modulo diagonal C: ker d=C², not C.

   **Exact repair:** “In dimension one the diagram agrees with the product form of §4.2, with Ω⁰/ker d=O(X_C)/H⁰_dR(X_C); for connected X_C this is O(X_C)/C.” For two components (0,1) is zero in the repaired quotient, as required.

9. **F09** (P3) The level-zero model Check ignores arithmetic descent

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:893`, “two copies of the standard model over `O_F` (`E = F`)”.

   **Claim:** The arithmetic level-zero central quotient is the split disjoint union over F.

   **Witness:** The package's §7.7, line 956, correctly computes H⁰(M₀,F^ϖ,𝔽_p)=𝔽_p, because Frobenius interchanges the two geometric components. Two standard O_F-models instead give H⁰=𝔽_p². CDN23 lines 196–208 distinguish geometric levels from their descent.

   **Exact repair:** “After base change to the unramified quadratic extension F₂/F, M₀,F₂^ϖ is the disjoint union of two half-planes, with two standard O_F₂-models. Over F use their descended model; Frobenius exchanges the geometric copies.” Keep the thickness-one assertion geometrically. This gives H⁰=𝔽_p over F and H⁰=𝔽_p² over F₂, agreeing with §7.7.

10. **F10** (P3) Parabolic monotonicity is acceptance-test padding

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean:63`, `parabolic_mono`.

   **Claim:** A separate theorem records the monotonicity of the defining infimum of stabilizers.

   **Witness:** Its entire proof is the single `iInf_mono` term on line 65. The pinned `TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean:80` already provides `standardParabolic_monotone` for the native replacement in R01.

   **Exact repair:** Delete `parabolic_mono` from `Suggested.lean`; retain the mathematical fact in README §0.3 and use the native monotonicity theorem in the quotient projection. This deletion is already implemented by the other head discussed in R01; retain it during reconciliation. For d=1 the inclusion remains B⊆GL₂; for d=0 it is GL₁⊆GL₁. Do not prove the deleted theorem in place.

11. **F11** (P2) The hyperplane-cocycle headline is statable but absent

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:225`; `Suggested.lean:18`.

   **Claim:** §0.5 supplies the deep presentation used by the regulators, but the acceptance test neither states it nor accounts for it among the unavailable headlines.

   **Witness:** The pins contain `Projectivization` (Basic.lean:48), its quotient topology (Topology/Algebra/Projectivization.lean:44), projective dependence (Independence.lean:80), and locally constant modules. CDN-STEIN lines 2046–2054 express the presentation using precisely these carriers and a finite alternating sum.

   **Exact repair:** Add the §0.5 headline with `sorry`: for K/ℚ_p finite and 0≤r≤d, Sp_r(ℤ) is G-equivariantly isomorphic to the submodule of locally constant ℤ-valued functions on (ℙ(K^{d+1})*)^{r+1} satisfying Σ_i(−1)^i f(H₀,…,Ĥ_i,…,H_{r+1})=0 and vanishing on dependent tuples. Define that submodule with those two real conditions on the native projectivization; use its contragredient projective action and pullback by g⁻¹. These are simple definitions, not a new geometric carrier. Name the theorem in the README and module docstring. At r=0 the submodule is ℤ; at d=r=1 it consists of g(H₁)−g(H₀), recovering LC(ℙ¹(K),ℤ)/ℤ. The r>d zero convention can stay a README Check.

12. **F12** (P3) The definition of a short lacks discriminating Checks

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:338`, the definition of a short; Checks at lines 346–350.

   **Claim:** A short is connected, formally smooth, and one-dimensional with affinoid generic fibre. The local Checks test residues, ghost rings and base-ring topology, not those conditions.

   **Witness:** None of these Checks distinguishes O_C⟨T⟩ from the nodal algebra O_C⟨T,U⟩/(TU−p), or from the disconnected product O_C⟨T⟩×O_C⟨T⟩. The latter two violate different defining conditions.

   **Exact repair:** Add these three Checks: “Spf O_C⟨T⟩ is a short: its generic fibre is the connected unit disc and its reduction is smooth affine one-space. Spf O_C⟨T,U⟩/(TU−p) is not a short: its reduction TU=0 is singular at (0,0). The disjoint union of two unit-disc models is formally smooth of relative dimension one but is not a short, because it has two connected components.” The singularity has two tangent directions against dimension one; the last example has π₀ of cardinality two.

13. **F13** (P3) The truncation counterexample does not compare the proposed two sides

   **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:818`, “Without `τ≤i` the statement fails”; the parallel argument is at line 690.

   **Claim:** Nonzero H¹ of the disc versus H¹ of its degree-zero truncation disproves an untruncated comparison.

   **Witness:** For C•=D•=ℚ_p[−1], the identity is an untruncated quasi-isomorphism; H¹(C•)=ℚ_p while H¹(τ≤0D•)=0. These unequal groups do not disprove C•≃D•. The Check never computes the proposed untruncated right side.

   **Exact repair:** Delete the purported counterexample in §6.7. Replace §5.3's corresponding bullet by the scope sentence outside Checks: “The comparison is asserted only in degrees at most r.” In §6.7 add outside Checks: “The inverse-Frobenius map used here is constructed on τ≤i AΩ{i}; no untruncated comparison is asserted.” The point, Artin–Schreier and cuspidal-model Checks remain three distinct tests in §6.7. The identity-complex witness no longer contradicts either sentence.

## Verified sound

Read all 1,013 README lines, all 128 Lean lines, all 7 Lean declarations, and all 51 numbered mathematical target sections. The README has 203 Check bullets. Checks tested: 51 section-level bundles with the explicit computed values below; all 203 individual Check bullets were read. The computation ledger covers all 51 sections; it distinguishes computed controls from general theorems whose proof is not certified by a boundary computation. There is one admitted headline theorem, four data definitions with real bodies, and two proved supporting theorems. No sorry'd data, `set_option`, additional import, `lemma`, or free-Prop stand-in occurs. The 7 supplied elaborated signatures agree with their explicit binders; no section instance has disappeared. I inspected those elaborations rather than running Lean again: the review's read-only prohibition on builds was respected.

The named headlines are: §0.4 irreducibility, distinctness and multiplicity, lattice uniqueness and universal completion; §0.5 hyperplane-cocycle presentation; §2.4 Kummer symbols; §§2.5, 3.1–3.2 and 4.3 filtrations; §§3.3–3.5, 4.1–4.2 and 4.7 fundamental diagrams; §§4.5–4.6 Weil–Deligne comparison; §§4.8–4.9 Jacobian periods and integration; §5.5 the semistable Stein diagram; §§6.2, 6.4–6.5 and 6.9 half-space cohomology; §6.10 Dat's complex; §§7.1–7.5 tower components, models, multiplicities and diagrams; §§7.7–7.8 finite copresentation and non-admissibility. The geometric missing carriers named in the module docstring are genuine. Native scheme ℓ-adic cohomology does not supply adic-space cohomology. The native finite-group Steinberg theorem does not imply the local-field theorem. R06 and R11 concern additional statements on carriers that do exist.

The package diff is confined to `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/`. No prohibited supplier was found. The four declared gaps have the same slugs in `design/plan.json` and README lines 102, 126–128, with named earlier suppliers and explicit field hypotheses. They are accepted as contracts, not treated as missing implementations. The two automated unresolved-citation leads are not findings: `Semistable.aOmega` is a future target of AInfCohomology §AI.6.2, not claimed to be a pinned declaration; PadicLocalLanglandsForGL2QpPartII §4.1 is a downstream reference and exists in the board's package.

Dependency checker output, run without editing the merge order:

```text
depcheck: 238 roadmaps, 2161 edges, 0 problem(s)
```

No UPWARD or CYCLE line. This checks roadmap direction; it does not validate the mathematics of a supplier contract.

### Lean declaration and context ledger

All names below are in `TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers`, Layer 0. Each declaration carries its own binders; there is no ambient section-variable block. Type universes are the independent `Type*` universes of K, A, and G.

| Declaration, line | Retained context | Instantiation and computed values | Result / change |
|---|---|---|---|
| `parabolic`, 52 | K field; d:ℕ; J:Set(Fin d) | d=0: empty infimum=GL₁. d=1,J=∅: stabilizer of Ke₀; upper unipotent sends e₀↦e₀, lower unipotent sends e₀↦e₀+e₁. J=univ: GL₂. | Correct upper flag convention; native replacement required by R01. |
| `parabolic_mono`, 63 | Same; J,J′; h:J⊆J′ | d=1: B≤GL₂; J=J′ gives P_J≤P_J; d=0 both GL₁. | True, one infimum-monotonicity term; delete under R10. |
| `translation`, 69 | G group, topology, IsTopologicalGroup; H subgroup; A commutative ring | S₃, H=1, g=(12), h=(23), f=δ₁, x=gh: L_(gh)f(x)=1=L_gL_hf(x). Wrong forward translation gives 0 versus 1. H=G: L_g=id on A; A=0 gives zero module. | Inverse and multiplication order correct. No Hausdorffness needed for this definition. |
| `steinbergRelations`, 82 | K field, topology, IsTopologicalRing; A commutative ring; d,J | d=1,J=∅: image of functions on a point=constants A. J=univ: empty supremum=0. d=0: relations=0. | Correct complement indexing; no local-field hypothesis needed to form the submodule. |
| `steinbergRelations_le_comap`, 94 | Same, plus g∈GL | J=univ: 0≤0. d=1,J=∅: constant c translates to c, so A≤L_g⁻¹(A)=A. On a summand q*f, L_g(q*f)=q*(L_g f) pointwise. | Correct quotient-invariance proof; retained as construction support, not counted as a headline. |
| `generalizedSteinberg`, 109 | K field, topology, IsTopologicalRing; A commutative ring; d,J | d=0: A/0=A with trivial GL₁-action. d=1: J=∅ gives LC(ℙ¹(K),A)/A; J=univ gives A. A=0 gives 0/0=0. | Real quotient; no division by a scalar or hidden nonzero-ring requirement. |
| `generalizedSteinberg_isIrreducible`, 122 | p:ℕ, Fact p.Prime; K nontrivially normed field, NormedAlgebra ℚ_[p] K, FiniteDimensional ℚ_[p] K; A field; CharZero A∨CharP A p; d,J | d=0: one-dimensional A has invariant subspaces {0,A}, distinct since A field. d=1,p=2 or 3: endpoints are trivial A and LC(ℙ¹(K),A)/A. p=0,1 and A=zero ring excluded by instances. Positive-characteristic K excluded by ℚ_[p]-algebra. | No type-level counterexample. GK14 supplies char p for type A; char 0 scalar-extension route is mathematically consistent. R06 adds the missing distinctness test. |

The one-tactic probe detects `parabolic_mono`; it does not reduce the irreducibility theorem to a pinned result. Definitions of `Representation.IsIrreducible` and `Representation.quotient` were read at `Mathlib/RepresentationTheory/Irreducible.lean:29` and `Mathlib/RepresentationTheory/Basic.lean:329`. In particular irreducibility does not itself assert smoothness, admissibility, or a topology on coefficients.

### Mathematical computation ledger

Each row is a target section, including its definitions, associated identities and conventions. Values are on the stated carriers. “Consistent” records the displayed computations, not a replacement proof of the general theorem. Zero rings are tested only where ring coefficients are allowed; fields exclude them. Characteristic-p base fields, inseparable base extensions, non-quasi-separated spaces and infinite-dimensional coefficient spaces are not silently inserted into hypotheses requiring finite characteristic-zero extensions, separated spaces or finite dimension. The entries explicitly expose the admitted disconnected and loop cases.

| Target | Instances and values computed on the two sides | Result / change |
|---|---|---|
| 0.1 Graph cohomology | One loop: ∂=0, H¹=H¹_c=L; stated subdivision: coker((x,y)↦y−x)=0. Two legs: coker(L→L²)=L and ker(sum:L²→L)=L. One leg: both groups=0. L=𝔽₂²: kernel has 4 elements, abstract endomorphism group has 16. | R02; R03 for the infinite covering. |
| 0.2 Graph monodromy | Loop length 3: N(x)=3x; lengths 1+2 give 3x too. Segment with four legs: H¹=0, H¹_c dual has rank 4−1=3, so N=0 is not an isomorphism. N=iN_µq with qi=0 gives N²=iN_µ(qi)N_µq=0. | Compactness and positive rational lengths discriminate; R01 compact-graph ownership, R03 naturality. |
| 0.3 Generalized Steinberg | GL₂: Sp₀=A and Sp₁=LC(ℙ¹(K),A)/A. q=2: three residual points modulo constants give rank 3−1=2. δ_a(1)=1, (δ_a−δ_b)(1)=0. Empty simple roots give A, zero coefficients give 0. | Definitions consistent; R01/R10. |
| 0.4 Irreducibility/lattices/completion | d=0: lattice O⊂Frac(O), homothetic lattices ϖ^nO; scalar extension A has dimension 1. GL₂ flag functions have constants and quotient, two distinct constituents. Dirac difference has norm ≤1; p^(−n) values on shrinking balls are unbounded. | No contrary field case found; R06 missing Lean distinctness. |
| 0.5 Cocycle presentation | r=0: f(H₁)−f(H₀)=0 ⇒ f constant. d=r=1: f(a,b)=g(b)−g(a), and f(b,c)−f(a,c)+f(a,b)=0. d=1,r=2: three equations dependent ⇒ f=0. δ_a−δ_b has mass 0; separated pairs with weights p^(−n) give values p^(−n), hence no common bound. | Algebraic controls agree; R11. |
| 1.1 Coefficients | Geometric point: H⁰=ℚ_p(r), H¹=0 on both sites. Closed disc, ℓ≠p: H¹=0 on both sides. Empty space: all groups=0. The non-spherically-complete open-disc counterexample is source-dependent, not a consequence of point tests. | qcqs range retained; no blanket noncompact comparison inferred. |
| 1.2 Tensors | H=C̆: B_st⁺⊗H=B_st⁺. H=0: quotient tensor=0. H=∏_n C̆ with finite truncations: lim_n(B_st⁺)^n=∏_n B_st⁺. Dense nonclosed image has Hausdorff quotient 0 although its algebraic quotient can be nonzero. | Product/quotient distinction retained; arbitrary-presentation independence not established by these computations. |
| 1.3 Period spaces | M slope 1: φ_B b=b gives X¹=ℚ_p and X⁰=0. M slope 0: φ_B b=pb gives X¹→C with kernel ℚ_pt. Slopes 0,1: Dimension=(1,1)+(0,1)=(1,2). φ²e=pe gives slope 1/2 over both residue fields in the Check. M=0 gives 0. | Twist and sign controls consistent. |
| 1.4 Uniformizer normalization | e=2, N_raw e₁=2e₀: D_p(e₁+ue₀)=0 and D_raw(e₁+2ue₀)=0; wrong transport gives −3e₀. p=3,ϖ=12: a=4, v₃(log4)=1; correction sends e₁↦e₁−log4 e₀. Map ι=0 makes both comparisons 0 despite log4 N≠0. Root change ε gives ℓ₁=t, Ψ(u)=u−t. | Both directions and noninjective case agree. |
| 2.1 Pieces and residues | Res(dT/T)=1; Res(kT^k dT/T)=0 for k≠0. T₁T₂=p^µ gives dlog T₂=−dlog T₁. Positive coefficients all 1 are allowed in ghost ring; negative coefficients all 1 are not. [p♭]^n→0 for (p,[p♭])-adic topology but not p-adically. | Residue and topology controls consistent; R12 missing short controls. |
| 2.2 Pattern | Refined disc: one compact edge and one leg; ∂* forces both coordinates 0. Annulus: two vertices, one compact edge, two legs gives residue kernel rank 1. Three-edge Tate circle: b₁=3−3+1=1, N=sum lengths. | Fine-triangulation tests consistent; incidence repair R02 and direction R05 propagate here. |
| 2.3 Reconstruction | T₁T₂=p^µ replaced by αp^µ preserves length but changes gluing. Scaling a ring map sends 1↦α, hence fails unitality unless α=1. ω=Σp^nT^(p^n−1)dT has residue 0, proposed primitive coefficients 1 do not tend to 0; finite partial sums are exact. | Unseparated class≠0, separated class=0 as claimed; R05. |
| 2.4 Symbols | n=0: divisor condition automatic and quotient by first powers is 0. Constant c has all roots ⇒ symbol 0. Annular T has residue 1; T² residue 2, also as a ℤ₂-class. Local trivial family gives g_next^ℓ=g·v_i/v_j, whereas product g·v_i v_j introduces v_j². | Kummer normalization and corrected quotient relation agree. |
| 2.5 ℓ-adic filtration | Disc ℓ≠p: all pieces 0. Annulus: only residue ℤ_ℓ survives. Tate curve: two rank-one graph pieces, N(e₁)=µe₀ and N(e₀)=0. Good reduction genus g: graph pieces 0 and component rank 2g. | Consistent. |
| 3.1 de Rham filtration | Closed disc: separated H¹=0, while ω=Σp^nT^(p^n−1)dT has nonzero unseparated class and zero residue. Annulus: separated quotient C·dlog T, residue 1. Proper good reduction genus g: dimension 2g. | Separation is essential. |
| 3.2 Hyodo–Kato filtration | Disc: separated H¹=0. Annulus: rank 1, φ=pσ,N=0. Good-reduction elliptic: rank 2,N=0. Tate: rank 2,N rank 1,N²=0; Nφ(e₁)=pe₀=pφN(e₁). | Boundary slope-one restriction and normalization retained. |
| 3.3 Syntomic regulator | Cone[−1] has degree −1=0 and H⁰=(F¹A_cris)^(φ=p). p=2: t/2 belongs to that eigenspace, exceeding ℤ₂t. f=1+pT: dy=(φ/p)x−x, so −(1−φ/p)x−dy=0; opposite sign yields coefficient 2p at T=0. Proper elliptic: omitted cokernel=C. | Correct cone/sign controls; false short exact sequence R04. |
| 3.4 Integral approximation | Disc: separated period term 0; annulus: regulator(T)=dlog T, (φ/p)dlog T=dlog T. A homology group killed by p² tensors to 0 over ℚ_p; at p=2 bound is 4, not exactness. | Consistent bounded-error formulation. |
| 3.5 Quasi-compact diagram | Disc: period term 0, H¹=ℚ_p⊗̂principal units. Annulus: period term ℚ_p, Kummer(T) maps to 1. Proper genus 1: O(Y) principal constants are p-divisible, completion 0; right-hand term H¹(O)=C remains. | Contradicts the extra claim of §3.3, not this diagram. |
| 4.1 Dagger diagram | Dagger disc: HK¹=0 and H¹_proét=O†/C. Dagger annulus: HK¹=C̆dlog T, X¹=ℚ_p. p∉principal units since |p−1|=1; 1+p² is a principal constant and its logarithm vanishes modulo C. | Constant denominator is correct. |
| 4.2 Boundaryless diagram | Open disc: HK¹=0 and H¹_proét=O/C. Open annulus: rank-one residue period term. Two components: ker d=C²; (0,1) is 0 modulo locally constant functions but not modulo diagonal C. Slope 0 versus 1 modules both have C-dimensional de Rham realizations but periods B_cris^(φ=p) versus ℚ_p. | Product and comparison controls consistent. |
| 4.3 Filtrations/model comparison | Half-plane: tree H¹=0, projective-line component H¹=0, leaving harmonic residues of slope 1. Ramified Tate q=π²,e=2: N_raw=2, N_p=1. ϖ=12 over ℚ₃: HK correction is −log₃4·N even though e=1. | Same signs as §1.4. |
| 4.4 Special fibre/WD | Disc gives one point; half-plane gives a tree of projective lines. Tate twisted basis Φ=diag(q⁻¹,1), Ne₁=µe₀: NΦe₁=µe₀=qΦNe₁; conjugation scales N by q⁻¹. | Repaired semidirect-product sign agrees. |
| 4.5 Fontaine recipe | Unramified finite-dimensional V: inertia invariants in ℚ_ℓ[u]⊗V are constants, N=0, WD=V. Tate two-term module: exp(−uN)(e₁)=e₁−uµe₀ is horizontal and N has rank 1. Polynomial action gives d/du(gf)=χ(g)⁻¹g(f′). | These computations apply to finite-dimensional V and their specified projective systems; unrestricted V is not certified below. |
| 4.6 Similarity | E:y²+y=x³ over 𝔽₂ has two affine points plus infinity, #E=3,a=0. Untwisted polynomial X²+2; after twist eigenvalues divided by 2 give X²+1/2. Dagger annulus: twisted HK Frobenius=1, Kummer(T) eigenvalue=1; N=0 both. | Twist and finite-field test agree. |
| 4.7 Proper diagram | g=0: all terms 0. Ordinary g=1: slopes 0,1 give period Dimension (1,2), quotient C of Dimension (1,0), kernel ℚ_p². Supersingular: two slopes 1/2 give (1/2,1)+(1/2,1)=(1,2). | Proper cokernel is essential, R04. |
| 4.8 Jacobian cover | g=0: cover 0. Ordinary g=1: connected and étale factors have Dimensions (1,1),(0,1), sum (1,2). Tate curve |j|=|q|⁻¹>1 rules out good reduction; abstract étale extension gives Dimension (0,2), different from cover (1,2). In O_C/p^m, kernel of reduction has m-th power 0; in O_C, p^m≠0. | Integral-domain adapter and good-reduction restriction are necessary. |
| 4.9 Integration | x=0, lifts v≠0: p^nv→0, no two consecutive terms equal. μ_p∞: raw F=σ, normalized φ=p⁻¹σ; conditions F=p and φ=1 both give B_cris^(φ=p). Wrong contravariant condition gives ℚ_p and loses C quotient. | Variance tests consistent; stabilization false, R07. |
| 5.1 Stein models | Affine-line chain coordinates multiply to ϖ. Naive disc transition reduces T↦0, not an open immersion. Product of two nodal charts has two equations x₁x₂=ϖ=x₃x₄, not the one-equation strict semistable chart. Proper positive-dimensional generic fibre cannot be Stein. | Excluded examples do not invalidate the stated class. |
| 5.2 HK comparison | Affine-line chain: tree b₁=0, component genus=0, one boundary leg ⇒ HK¹=0=dR¹. e=2 Tate gives N_raw(e₁)=2e₀,N_p(e₁)=e₀. Unit change: HK e₁↦e₁+log(w)e₀, inverse evaluation e₁↦e₁−log(w)e₀. | Compatible with §1.4. |
| 5.3 Fontaine–Messing | r=0: crystalline fixed part maps to quotient by F⁰=0, H⁰=ℚ_p per component after rationalization. p=2,r=2: a=2 and p^a a!=4·2=8. Enough-roots exponent is Nr+c_p independent of K′; e-dependent A(e,p,r) alone supplies no fixed colimit exponent. | Correct factorial and quantifier controls; gap accepted. |
| 5.4 Bloch–Kato | Point,r=1: θ:B_cris^(φ=p)→C surjective, kernel ℚ_pt; H¹=0. Omitting N gives extra element u with φu=pu and θι(u)=0. Uniformizer change adds log(w)N in HK and subtracts it in period substitution, total 0. | Point, monodromy, and comparison-map directions agree. |
| 5.5 Stein diagram | Affine line,r=1: class T maps to dT≠0; HK¹=0. r=0: Ω^(−1)=0, middle ℚ_p per component. Two components: ker d=C² versus claimed C. | R08; p^(−r) factor agrees with source. |
| 6.1 Half-space model | d=1,q=2: valency 3. d=2,q=2: #ℙ²(𝔽₂)=7 point blow-ups; lines are Cartier divisors, their blow-up is identity. d=3 requires line centres too. Rational hyperplane point has its defining equation 0 and is excluded. | Dimension convention and low-rank supplier agree. |
| 6.2 ℓ-adic/dR half-space | d=r=1: dlog((z−a)/(z−b)) has residues +1,−1, corresponding to δ_a−δ_b. r=0: constants; r>d: 0. ℓ=p is not inserted into the prime-to-p homotopy argument. | Twists and regulator values agree. |
| 6.3 Frobenius | On punctured ℙ¹, Frobenius pulls dlog(t−a) to q·dlog(t−a), rank q residue space. s=0 eigenvalue 1. Relation Nφ^f=qφ^fN with φ^f=q^s gives q^s(1−q)N=0; q≥2, so N=0. | d=1 extension works; q=1 excluded by finite residue field. |
| 6.4 HK Steinberg | r=0: F^(σ=1)=ℚ_p. r=1: residue Frobenius=pσ, eigenvalue-p vectors have ℚ_p coefficients. Iterating f times gives p^(rf)=q^r. | Semilinear versus linearized Frobenius distinguished. |
| 6.5 Pro-étale half-space | d=r=1: period quotient Sp₁(ℚ_p)*, analytic kernel O/C. r=0: ℚ_p. r=d+1: Ω^d/ker d=Ω^d/Ω^d=0 and Sp_(d+1)=0. | No natural-number underflow: Ω^(−1) explicitly 0. |
| 6.6 Integral de Rham | d=1,j=0: H⁰=O_K, higher H¹(O)=0. j=1: δ_a−δ_b has total mass 0 and gives log form. Three points give ω_ab+ω_bc−ω_ac=0, so generators are not a free family. | Integral lattice and relations agree. |
| 6.7 AΩ fixed points | i=0: fixed Witt constants ℤ_p. Point,i=1: cokernel of 1−φ⁻¹=0 and H¹_ét=0. Cusp y²=x³+p,p≥5: derivative equations force x=y=0, incompatible with p≠0 on generic fibre; reduction is cuspidal. | General flat-model scope supported; the truncation Check fails as a negative control (R13). |
| 6.8 A_inf half-space | i=0: A_inf. d=i=1: twists {−1}+{1}=0. Three residues (1,−1,0)+(0,1,−1)−(1,0,−1)=0; coefficient vector remains nonzero at p=2. | Regulator relations and twist cancellation agree. |
| 6.9 Integral/rational étale | r=0 yields ℤ_p,𝔽_p,ℚ_p. r>d: Sp=0 and cohomology=0. d=r=1: integral dual gives bounded mass-zero measures; inverting p allows a common denominator, not arbitrary unbounded distributions. | Distinguishes étale from pro-étale topology. |
| 6.10 Dat complex | d=1: degrees 1,2 are St and Λ(−1); no negative-degree term. d=2,i=1: degree 3, π_{1}(−1). Factorials: d=1 needs 2 invertible for displayed exponential; d=2 needs 6 invertible. Strong banality is separately retained for splitting. | Dimension shift d_source=d+1 and inverse pullback agree. |
| 7.1 Components/actions | Rank 2,p=3,(g,b)=(3I,3): det/Nrd=9/9=1, height 2−2=0; wrong product gives 81,height4. Rank1,(ϖ,1,geometric Φ): valuation 1−1=0. q=2: level-ϖ deck order 12, level-ϖ_D order 3, quotient kernel order4. | Inverse division-algebra action and two indexing systems agree. |
| 7.2 Models | Thickness2 becomes lengths1+1=2, inserting valence-two genus-zero vertex. Level0: type(vertex)+height parity is invariant, giving two G-orbits, one G×D×-orbit. Over F: H⁰=𝔽_p; a split union would give 𝔽_p². | R09 arithmetic split Check. |
| 7.3 Levelwise diagram | Level0 central quotient over C: O/H⁰_dR=(O(Ω)/C)²; full level gives product over ℤ. Locally constant (0,1) maps to 0, hence its exponential class is étale. Nonlocally constant f gives nonzero analytic class. | Disconnected denominator corrected here already. |
| 7.4 Multiplicities | Level0: D×/O_D× is abelian, hence no dimension≥2 irreducible JL sector. Slope 1/2 twist by φ=p gives 3/2; component-stabilizer restriction unchanged, so the geometric sector stays slope1/2. Wrong formula would give 3/2. | Slope hypothesis prevents the source's unrestricted overclaim. |
| 7.5 Multiplicity diagram | Slope1/2: period Dimension ([L:ℚ_p],2), kernel θ=0 by zero φ=1 space. Slope3/2 block satisfies φ²=p³, requiring coefficient φ²=p⁻¹; plus-period space=0. Slope0 instead gives kernel ℚ_pt. | Injectivity and slope restrictions discriminate. |
| 7.6 cpcf | Constant finite module has finite limit. System ℤ/p^n has limit ℤ_p. System 𝔽_p^s has limit ∏ℕ𝔽_p; its dual for trivial G is ⊕ℕ𝔽_p, not finitely presented. In A=B=0 five-term case C=ker(D→E); in D=E=0, C=coker(A→B). | Profinite is weaker than cpcf; coherence assumption retained. |
| 7.7 Finite copresentation | n=0,q=0,K=F: invariants under swapping copies form diagonal 𝔽_p; K⊇F₂ gives 𝔽_p², dual permutation action. k=1 coefficient is O_L/p, not automatically k_L when L ramifies. k=0 excluded. | Arithmetic/geometric distinction correct here; R09 resolves contradiction. |
| 7.8 Non-admissibility | JL of level2 has nontrivial Ǧ₁-action whereas M₁ has trivial Ǧ₁-action ⇒ Hom=0. n=0 has no supercuspidal sector. F=ℚ_p counterexample supplies nonzero Hom from its supercuspidal completion into Π, so vanishing is restricted to F≠ℚ_p. | Field and level hypotheses retained. |

### Supplier and ownership ledger

Thirty supplier/neighbor texts were inspected at main or the available heads. The following 28 supplier contracts were resolved by name and section, not by remembered numbering; multiple references to a section count once in this table. Main roadmaps remain suppliers at main. Open revisions are not imported as new prerequisites. The overlapping head of this roadmap and ScholzeFunctorAndModpCohomologyOfTheLubinTateTower were the two additional neighbor texts.

| Supplier | Resolved sections / interface checked |
|---|---|
| AdicEtaleGeometry | A1, étale/pro-étale sites; main |
| AdicSpacesPartIII | F0, R3.4 and R3.7, formal spaces, Stein coherent vanishing, GAGA; main |
| AdicSpacesPartIV | F1.5–F1.9 and F1.11, weak formal/dagger objects and comparison; main |
| EnhancedDerivedSheaves | E2, derived limits and Milnor exact sequence; main |
| StableReduction | Layers 1, 2, 7, graph/genus and stable reduction; main |
| JacobianChallenge | Layer D, Jacobian; main |
| ReductiveGroupsPartII | RG2.2, building and tree; main |
| ClassicalAdicEtaleCohomology | 1.3–1.4; 4.1, 4.6–4.7; Layer 8, 9.1, 9.6–9.7: coefficients, formal nearby cycles and prime-to-p duality |
| CrystallineCohomology | CR.4.7 slope decomposition over perfect k (simple standard blocks over algebraically closed k); CR.5.1, CR.5.3–5.4, CR.6.1, CR.6.5 |
| CohomologyComparisonsPartII | 4.1–4.5: modified lattice, period maps, e-dependent and enough-roots exponents; formal transfer is the declared gap |
| AInfCohomology | AI.1.2, AI.3.1–3.2, AI.6.1–6.3; `Semistable.aOmega` is a planned target, not a pinned constant |
| CohomologyComparisons | 4.5 signed monodromy transport, 4.9a model comparison, 4.11–4.12 proper comparison |
| CstConjectureForDaggerVarieties | 1.5, model-free diagram; completion-of-algebraic-closure and residue-field hypotheses retained |
| PrismaticCohomologyPartIII | 6.3 and 6.25, perfectoid Artin–Schreier–Witt and integral comparison |
| LocallyAnalyticDistributions | 0.0, 0.2 and 0.CR.6.6, limits/strictness and the explicitly all-dimensional finite-piece HK comparison |
| PadicPeriodRings | 4.1 and 4.3, p-normalized period operators; arbitrary C plus-period assertions separately declared as gap |
| PadicHodgeTheory | 0.6, 5.3–5.4, 8.1; completed ring initially finite K/ℚ_p, general K separately declared as gap |
| VectorBundlesAndIsocrystals | Layer 5, BC Dimensions and rank-two period example |
| PadicDifferentialEquationsAndRigidCohomology | RD.4.10–4.11, 4.18, 4.29, 4.34, 4.38, 7.7; arbitrary endomorphisms remain the declared extension of the Frobenius comparison |
| EndoscopicTransferAndUnitaryTraceComparison | 12.2–12.8, 12.11–12.12, 12.14, 12.19–12.21; inverse pullback, diagonal action, height, central descent, ℓ-adic sectors |
| HilbertModularVarietiesAndShimuraCurves | R18.5.1–R18.5.3, half-plane, exhaustion and standard model |
| TropicalAndBerkovichArithmetic | 2.11, 2.13–2.17, skeleton/refinement and reconstruction; generalized versus strict node thickness distinguished |
| AbelianSchemesAndArithmeticModuli | A4.2 and A4.CR.7.2, universal vector extension and contravariant crystalline realization |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.2.20, 2.25–2.26, 2.28; raw covariant versus normalized Frobenius and Nilp-domain restriction |
| SmoothRepresentationsOfLocalGroups | SR.0, SR.0d, SR.2, SR.3 (*steinberg*), SR.5.2 (*segment-representations*); latter target still exists under the broadened heading |
| PadicLocalLanglandsForGL2Qp | 6.9, local Jacquet–Langlands interface |
| GL2AutomorphicRepresentationsAndTransfer | R16.3.1–R16.3.3, rank-two local parameters and correspondence |
| ModpRepresentationsOfGL2OverLocalFields | 0.3–0.5, 0.7, 2.4, 2.6; coherence is for the stated smooth torsion category; approximation uses F≠ℚ_p |

The compact graph construction belongs to ColemanIntegrationPartII §§1.1–1.2 as the overlapping head records; extending it to graphs with legs is this roadmap's work. The native GL Tits-system parabolics are earlier library work (R01). Generalized Steinberg representations over arbitrary coefficients extend the complex comparison imported from SmoothRepresentationsOfLocalGroups; the finite-group Tau Ceti carrier is not a duplicate. Curve diagrams over arbitrary C with value group ℚ extend beyond the CstConjectureForDaggerVarieties range, and the package states the common-range model comparison rather than identifying structures from de Rham vector spaces alone. No new ownership cycle was found in those interfaces.

The characteristic-zero invariant-space route also has a native algebraic input: `jacobson_density` and `Module.Finite.toModuleEnd_moduleEnd_surjective`, `Mathlib/RingTheory/SimpleModule/Basic.lean:560` and `:573`. These concern semisimple modules and finite generation over their endomorphism rings; they are not a direct theorem about p-adic Steinberg representations. SmoothRepresentationsOfLocalGroups SR.3 also uses the corresponding finite-dimensional Hecke-module Burnside argument. Thus that step was not reported as unowned merely because its name differs at the pin.

### Source-locator and wording ledger

The following 65 locator groups were checked against the cached legal texts; repeated occurrences in the README are not counted twice. A group can include a theorem and its immediately adjacent definition or remark. The outcome records support at the stated range, or the particular defect, rather than certifying an entire source proof.

| # | Locator checked | Cached witness / result |
|---|---|---|
| 1 | CDN-CURVES §§1.1.1–1.2.2 | CDN-CURVES line 648 onwards; loops permitted, support and ring-dual distinction agree. |
| 2 | CDN-CURVES §1.2.3, Remarque 1.4 | CDN-CURVES line 774; incidence error R02. |
| 3 | CDN-CURVES §1.2.4, Remarques 1.5–1.6 | CDN-CURVES line 783; positive-length monodromy and square-zero composite. |
| 4 | CDN-CURVES Théorème 0.1, Remarque 0.2 | CDN-CURVES line 92; value-group hypothesis and affinoid comparison retained. |
| 5 | CDN-CURVES §0.3.4 | CDN-CURVES line 546; rational sequence retains H¹(O), witness for R04. |
| 6 | CDN-CURVES Théorème 3.17 | CDN-CURVES line 1748; formal reconstruction. |
| 7 | CDN-CURVES Théorème 3.19 | CDN-CURVES line 1854; pattern reconstruction and adjacent family discussion. |
| 8 | CDN-CURVES Proposition 3.20 | CDN-CURVES line 1926; degree-one comparison, independent of edge choice. |
| 9 | CDN-CURVES Lemme 5.4 | CDN-CURVES line 2463; Kummer quotient and Picard exact sequence. |
| 10 | CDN-CURVES §6.2.1, Lemme 6.1 | CDN-CURVES line 3122; localized-symbol relation needs quotient, already repaired in package. |
| 11 | CDN-CURVES Proposition 6.2 | CDN-CURVES line 3163; graph kernel in symbol localization. |
| 12 | CDN-CURVES Théorème 6.3 | CDN-CURVES line 3189; ℓ≠p and graph/component/residue filtration. |
| 13 | CDN-CURVES Proposition 6.8 | CDN-CURVES line 3283; integral filtration has bounded p-error. |
| 14 | CDN-CURVES Théorème 6.14 | CDN-CURVES line 3374; separated finite-dimensional filtration. |
| 15 | CDN-CURVES Théorème 6.21, Remarque 6.22 | CDN-CURVES line 3561; comparison and residue twist. |
| 16 | CDN-CURVES §6.4.1, Théorème 6.24 | CDN-CURVES line 3591; regulator and p=2 qualification. |
| 17 | CDN-CURVES Corollaire 6.25 | CDN-CURVES line 3656; integral comparison is qualified at p=2. |
| 18 | CDN-CURVES Proposition 6.26, Remarque 6.27 | CDN-CURVES line 3673; p²-exactness and proper-curve obstruction. |
| 19 | CDN-CURVES Remarque 6.28 | CDN-CURVES line 3700; logarithm sign and integrality restriction. |
| 20 | CDN-CURVES Proposition 6.29 | CDN-CURVES line 3766; false exact sequence R04. |
| 21 | CDN-CURVES Théorème 6.30 | CDN-CURVES line 3780; affinoid integral approximation. |
| 22 | CDN-CURVES Théorème 6.32, Remarque 6.33 | CDN-CURVES line 3826; top exact row versus bottom complex, proper cokernel. |
| 23 | CDN-CURVES Proposition 7.4, Remarque 7.5 | CDN-CURVES line 3968; dagger finite HK and comparison. |
| 24 | CDN-CURVES Théorème 7.6 | CDN-CURVES line 3980; dagger diagram with closed images. |
| 25 | CDN-CURVES §7.1.5 | CDN-CURVES line 4017; universal-cover sequence and convergence condition. |
| 26 | CDN-CURVES Théorème 7.9, Remarque 7.10 | CDN-CURVES line 4049; period identification and covariant/contravariant warning. |
| 27 | CDN-CURVES Théorème 7.12 | CDN-CURVES line 4112; bounded-lift limit, not stabilization. |
| 28 | CDN-CURVES Théorème 8.4 | CDN-CURVES line 4387; special-fibre functoriality. |
| 29 | CDN-CURVES §8.2.5 | CDN-CURVES line 4432; semidirect-product sign conflicts with line 4437, already corrected in package. |
| 30 | CDN-CURVES Théorème 8.7 | CDN-CURVES line 4444; nonempty node set is retained. |
| 31 | CDN-CURVES Théorème 8.9 | CDN-CURVES line 4477; boundaryless ℓ-adic filtration. |
| 32 | CDN-CURVES §8.3.1, Remarque 8.10 | CDN-CURVES line 4512; polynomial recipe and separate inverse-limit extension. |
| 33 | CDN-CURVES Théorèmes 8.11–8.12 | CDN-CURVES line 4535; log-special-fibre identification, similarity and component-endomorphism proof input. |
| 34 | CDN-STEIN Proposition 5.1, Corollaries 5.3–5.4 | CDN-STEIN line 1905; allowed coefficient characteristics, lattice and completion. |
| 35 | CDN-STEIN §5.2.2 | CDN-STEIN line 1936; dual-of-quotient error already repaired. |
| 36 | CDN-STEIN Proposition 5.6, §5.4.1 | CDN-STEIN line 1980 and line 2046; integral cocycle presentation, R11. |
| 37 | CDN-STEIN Theorem 5.8, Corollary 5.9 | CDN-STEIN line 2003; prime-to-p étale/pro-étale and de Rham variants. |
| 38 | CDN-STEIN Corollary 3.46 | CDN-STEIN line 1400; rational comparison and coherent-site argument. |
| 39 | CDN-STEIN Proposition 3.12, Remark 3.13 | CDN-STEIN line 905; overconvergent comparison and uniformizer dependence. |
| 40 | CDN-STEIN §3.2.1 | CDN-STEIN line 925; completed semistable ring over the uniformizer PD base. |
| 41 | CDN-STEIN Lemmas 3.26, 3.28 | CDN-STEIN line 1057; classical cohomology and completed-ring invariants. |
| 42 | CDN-STEIN Proposition 3.36, equation (3.37) | CDN-STEIN line 1224; Bloch–Kato diagram, closed images and change of plus ring. |
| 43 | CDN-STEIN Proposition 3.48 | CDN-STEIN line 1453; crystalline BK-to-FM direction. |
| 44 | CDN-STEIN Theorem 4.1 | CDN-STEIN line 1525; change-of-convergence arrow, equivalence for Stein. |
| 45 | CDN-STEIN Theorem 4.12, Remark 4.13 | CDN-STEIN line 1690; diagram and p^(−r) normalization at line 1716; proper comparison has a different right term. |
| 46 | CDN-STEIN Lemma 5.11 | CDN-STEIN line 2104; HK duals and eigenvectors. |
| 47 | CDN-STEIN Theorem 5.13 | CDN-STEIN line 2169; pro-étale half-space diagram. |
| 48 | CDN-STEIN Proposition 6.5, Corollary 6.6 | CDN-STEIN line 2270; integral coherent vanishing and zero differential. |
| 49 | CDN-STEIN Theorem 6.28 | CDN-STEIN line 2601; integral and rational measures, not a free family of logarithmic generators. |
| 50 | CDN-STEIN Theorem 6.45 | CDN-STEIN line 2916; étale cohomology and bounded vectors. |
| 51 | CDN-STEIN Lemma A.7 | CDN-STEIN line 3116; HK/Chern-class compatibility. |
| 52 | GK14 Corollaries 4.3–4.5 | GK14 line 1300; type-A mod-p irreducibility, distinctness, multiplicity and complete-DVR lattice uniqueness. |
| 53 | CDN-DUKE Theorem 2.9, Lemma 2.11 | CDN-DUKE line 358; truncated inverse Frobenius on any flat model, twisted Artin–Schreier. |
| 54 | STR08 Theorem 4.4 | STR08 line 361; det, inverse reduced norm and reciprocity action. |
| 55 | DAT06 Theorem 3.1.1 | DAT06 line 1290; dimension-index conversion and compact-support twists. |
| 56 | DAT06 Lemma 4.2.1, Proposition 4.2.2 | DAT06 line 1988; factorial requirement versus strong banality; continuity proof issue below. |
| 57 | GK05 §§6.1–6.2 | GK05 line 1209; source assumes d≥2; package supplies the d=1 adapter. |
| 58 | GK05 Theorem 6.3 | GK05 line 1254; logarithmic strata and scalar Frobenius; proof gap noted below. |
| 59 | GK05 Proposition 6.5, Corollary 6.6 | GK05 line 1275; strata resolution and resulting comparison. |
| 60 | GK05-RT Theorem 4.5 | GK05-RT line 1770; strong dominance and integral coherent vanishing. |
| 61 | GK07 Proposition 4.5 and following remark | GK07 line 1164; small weights/log forms, with closedness at line 1212. |
| 62 | THO24 Theorems 3.5–3.6 | THO24 line 779; field splitting versus integral derived-tensor finiteness. |
| 63 | CN-I period-ring normalization | CN-I line 448; normalization at p and its signed embedding. |
| 64 | CDN20 Theorem 0.4, Corollary 2.1 | CDN20 line 174 and line 644; slope omitted in introduction, included in comparison section. |
| 65 | CDN23 tower definitions and arithmetic descent | CDN23 line 178; division-algebra level ideals and descended quotient, R09. |

In addition to these locator passages, five prose comparisons were made: the §0.3 Lean parabolic docstring against CDN-STEIN §5.2.1; the §1.4 normalization explanation against CN-I line 448 and CDN-STEIN line 925; the §2.4 localized-symbol explanation against CDN-CURVES line 3122; the §5.4 proof route against CDN-STEIN line 1453; and the §6.6 proof route against GK05-RT line 1770 and GK07 line 1164. No copied prose or clause-by-clause non-mathematical paraphrase was identified in these comparisons. Shared formulas, conventional names and forced hypotheses were not counted as copied expression. No imported figure, data table, exercise list or external formalization was identified.

Source-use counts, counting one source token per citation mention before References (including repeated locators): CDN-CURVES 117; CDN-STEIN 60; CDN23 31; CDN20 24; CDN-DUKE 11; GK05 9; DAT06 6; THO24 3; STR08 3; CN-I 2; GK14 2; GK07, GK05-RT, SS91, DS01, NAK84, KM74 and BW00 1 each. Total 275. CN-II, CGN23 and IS01 occur in References but have no separate source-token occurrence in the body.

The largest source's contents were read at CDN-CURVES lines 24–90. Comparison by number: Layer 0 uses source §1 together with CDN-STEIN §5; Layer 1 draws period preliminaries out of several sources; Layer 2 combines source §3 with pieces from §§4–5; Layer 3 assembles source §§4–6; Layer 4 combines source §§7–8 and places integration after the diagram/filtration comparisons; Layers 5–7 use other papers. This is not a one-to-one run of source chapters. The Needs lines force pieces→symbols→syntomic→diagram (§§2.1–3.5), diagram→limits→comparison (§§4.1–4.6), and comparison→tower multiplicities (§7.4). The specific compact-graph ownership issue is R01, not an arrangement claim.

Source independence: 70 passage groups compared with 13 sources; no non-mathematical wording reuse identified; largest share CDN-CURVES, 117 of 275 citation mentions; contents compared with CDN-CURVES: independent combination, with dependency-forced order as above.

## Not verifiable

- SS91, IS01, DS01, NAK84, KM74 and BW00 remain the six settled uncertified texts. No new request was made. Restatements and uses in the accessible sources were checked; that does not certify the inaccessible original proofs or their exact published wording.
- No new Lean elaboration or build was run. The supplied signatures were inspected for all seven declarations, and native definitions were read. R06/R11 are proposed acceptance statements, not claimed to have been compiled during this read-only review.
- The four declared supplier gaps are future contracts. Their slugs, scopes and supplier direction were checked; no implementation of them was certified.
- The table's computations do not prove arbitrary-presentation independence in §1.2 or reconstruct arbitrary infinite-dimensional continuous representations in §4.5. The latter source explicitly treats projective limits of finite-dimensional representations separately (CDN-CURVES line 4529); the review does not certify any broader topological representation category hidden in the word “continuous”.
- The 65 source-locator groups above are the certified locator coverage, not a claim that all 275 repeated citation mentions or every cited proof step was independently re-proved. In particular the full finite-copresentation dévissage and non-admissibility proof in CDN23 were checked through the stated supplier interfaces and boundary tests, not reconstructed in full.

## Source issues

- **Error** in CDN-CURVES at §1.2.3 and Remarque 1.4, printed p. 19 (CDN-CURVES line 774): the source says subdivision edges are endpoint pairs despite allowing loops; it should be separately tagged endpoint incidences, preserving both ends of a loop; affects a stated result.
- **Misprint** in CDN-CURVES at §6.2.1, printed p. 75 (CDN-CURVES line 3124): the source says the compatibility uses the product of the two transition factors; it should be their quotient v_i/v_j; affects a stated result.
- **Misprint** in CDN-CURVES at Proposition 6.26, printed p. 87 (CDN-CURVES line 3676): the source says the filtered Frobenius-p eigenspace is ℤ_pt without qualification; it should exclude p=2 from that integral equality, since t/2 also belongs; affects the proof.
- **Misprint** in CDN-CURVES at Remarque 6.28(ii), printed p. 88 (CDN-CURVES line 3710): the source says (1−φ/p)log(u) equals p⁻¹log(φ(u)/u^p); it should have the opposite sign, equivalently the reciprocal logarithm; affects the proof.
- **Error** in CDN-CURVES at Proposition 6.29, printed p. 90 (CDN-CURVES line 3769): the source says the integral sequence ends surjectively at the period term for all curves; it should retain the proper-curve H¹(O) obstruction and integral bounded-error qualifications; affects a stated result.
- **Misprint** in CDN-CURVES at §7.2.3, printed p. 101 (CDN-CURVES line 4215): the source says λ(v_n)=p^nλ(v_0) with pv_(n+1)=v_n; it should use v_(−n) in that Taylor term, since λ(v_n)=p^(−n)λ(v_0); affects the proof.
- **Misprint** in CDN-CURVES at §8.2.5, printed p. 107 (CDN-CURVES line 4432): the source says the semidirect action scales by p^deg while asserting Ng=p^deg gN; it should scale the additive coordinate by p^(−deg) for that relation; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p. 38 (CDN-STEIN line 1936): the source says the Steinberg dual is the inverse limit of full flag-function duals; it should use the annihilator of relations, or duals of finite-stage images; affects a stated result.
- **Error** in CDN20 at Theorem 0.4, printed p. 6 (CDN20 line 202): the source says the multiplicity formula holds for supercuspidal modules without fixing slope; it should retain slope 1/2 as in §2.1, resisting unramified nonunitary twists; affects a stated result.
- **Error** in DAT06 at proof of Lemma 4.2.1, printed p. 43 (DAT06 line 2033): the source says every homomorphism of profinite groups is continuous; it should justify continuity of this inertia action, since arbitrary profinite homomorphisms need not be continuous; affects the proof.
- **Gap** in GK05 at proof of Theorem 6.3, printed pp. 32–33 (GK05 line 1270): the source says scalar Frobenius on the two Gysin outer terms gives scalar Frobenius on the middle; it should justify a Frobenius-compatible splitting or generation by logarithmic eigenclasses; affects the proof.

For the last two source issues the elementary obstructions are, respectively, a discontinuous linear functional on the abstract vector space ∏_ℕ𝔽₂ that vanishes on ⊕_ℕ𝔽₂, and the matrix [[q^m,1],[0,q^m]], whose submodule and quotient have scalar q^m Frobenius but whose action is not scalar. Neither observation is an assertion that the cited final cohomology theorem is false.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "db295a02958abb4c474d138e940671027f647b8c", "job": "RT-ProetaleCohomologyOfPAdicCurvesAndTowers~1a", "model": "gpt-6-astra", "worker": "chris-10"} -->
