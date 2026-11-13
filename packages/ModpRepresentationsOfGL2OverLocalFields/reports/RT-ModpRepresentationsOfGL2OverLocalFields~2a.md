<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6859788236 -->
Red team round 2 pass a (codex) of bee775a

Verdict: needs_changes

1. **F01** (P1) The obstruction-space support criterion reverses the cosets

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:746`: “supported in `P⁺KZ` and one supported in `wP⁺KZ`”.

   **Claim:** These support conditions characterize membership in `Δ(W,V)` for the compact induction used in §0.8.

   **Witness:** HU12 line 200 gives support `KZg⁻¹`. The trivial-weight augmentation has `Δ=k`. Left multiplication by `s=(0 1;1 0)∈K` sends `wP⁺KZ` into the disjoint `P⁺KZ`; thus left-K-invariant functions with the asserted negative support vanish.

   Indeed `sw=diag(ϖ,1)` and `diag(ϖ,1)P⁺⊆P⁺`. If `f` has the asserted negative support, then for every point `x` of that support, `f(x)=f(sx)=0`. Consequently the right side of the stated criterion contains only `0`, whereas the definition and the second Check give `Δ(k,k)=k`. This is a false identification, not a change in the induction convention permitted by the suppliers: the imported function model is left equivariant with right translation.

   **Exact repair text:** Add after the definition of the standard functions: “Here `[g,v]` is supported on `KZg⁻¹` and takes the value `v` at `g⁻¹`; `G` acts by right translation.” Replace the API bullet by: “`v∈Δ(W,V)` exactly when it has a preimage supported in `KZ(P⁺)⁻¹` and one supported in `KZ(P⁺)⁻¹w⁻¹`.” Add the Check: “For the augmentation with `W=k`, `[1,1]` and `[w,1]` both map to `1`; their supports lie in `KZ(P⁺)⁻¹` and `KZ(P⁺)⁻¹w⁻¹`, respectively. A left-K-invariant function supported in `wP⁺KZ` is zero, since left multiplication by `(0 1;1 0)` moves that set into `P⁺KZ`.”

   **Repair test:** The two corrected preimages map to `1`, so the repaired criterion gives `k=k`. For the identity presentation the corrected support sets are disjoint (inverses of the two right-coset cells), so it gives `0=0` as required.

2. **F02** (P2) Crossed-product multiplication assumes a normal subgroup

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:558`: “Multiplication is the crossed product given by coset representatives of `H/U`”.

   **Claim:** A crossed-product rule on `H/U` describes the algebra for every compact open subgroup U.

   **Witness:** Take discrete `H=S₃`, `U=⟨(12)⟩`, `g=(123)`. Then `g⁻¹Ug=⟨(13)⟩≠U`; `H/U` is not a quotient group and conjugation by g does not preserve `𝒪[[U]]`. SHOTTON20 line 322 changes the subgroup precisely for this reason.

   The tensor-module decomposition and the existence theorem are correct. The stated multiplication prescription is not a crossed product over the claimed coefficient ring when U is nonnormal. This matters for the main example, where K is not normal in GL₂(F). All existing multiplication Checks use normal U, so they miss the problem.

   **Exact repair text:** Replace the two sentences beginning “Multiplication is” with: “To multiply `(h⊗x)(g⊗y)`, put `V=U∩gUg⁻¹`, choose representatives a of `U/V`, and write `x=Σ_a a x_a` with `x_a∈𝒪[[V]]`. The product is `Σ_a hag⊗((g⁻¹ x_a g)y)`, with `g⁻¹ x_a g∈𝒪[[U]]`. Prove independence of these representatives and compatibility with the subgroup comparison maps (SHOTTON20, proof of Proposition 3.2, pp. 7–8). For normal U this is the usual crossed-product rule; for arbitrary U the refinement by V is necessary. The algebra is free, hence flat, as a right `𝒪[[U]]`-module (SHOTTON20, Lemma 3.3).” Add the Check: “For discrete `H=S₃`, `U=⟨(12)⟩`, `g=(123)` and `x=(12)`, one has `V=1`, the single nonzero coefficient is `x_(12)=1`, and the product `xg=(23)` is recovered. Conjugation cannot instead be performed inside `𝒪[[U]]`, since `g⁻¹xg=(13)∉U`.”

   **Repair test:** The nonnormal example gives `(23)` in `𝒪[S₃]`. For `ℤ_p⋊C₂`, V=U and the same formula gives `sTs⁻¹=(1+T)⁻¹−1`, preserving the existing sign Check. No normality restriction is imposed on the general construction.

## Round-one findings, verified individually

All locations in this table are in `packages/ModpRepresentationsOfGL2OverLocalFields/README.md` unless another file is named. The status concerns the original finding, not certification of every prerequisite in its layer. None of the fourteen findings was marked not actionable by the repair report.

| Earlier finding | Status and repaired passage | Witness and retest |
| --- | --- | --- |
| 1a/F01, augmentation filtration outside pro-p groups | Repaired, §4.2: “compact analytic pro-`p` group without `p`-torsion” | BHHMS23 line 2392 requires pro-p. For the sign module of `C₂` in characteristic 5, `gr M=0` but `j(M)=0`; the added hypothesis excludes it. For `ℤ_p^d`, the trivial module gives `d−d=0=dim Supp(k)`. |
| 1a/F02, finite fixed-central-character Ext | Repaired, line 353: “What PadicLocalLanglandsForGL2Qp must provide (gap:fixed-central-character-ext1-finite)” | The identical slug is in `design/plan.json`. Supplier §§5.1–5.2 give blocks, not this finiteness theorem. §1.4 now uses the declared gap and a left-exact comparison. At `p=2`, the central restriction of a determinant extension is `2ℓ=0`, not a surjection onto a three-dimensional space. |
| 1a/F03, PBW used with an adic theorem | Repaired, line 430: “gap:enveloping-auslander-regular” | Supplier §0.5 requires a complete nonnegative adic filtration; PBW has increasing `F₀=k`. Pinned `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213` supplies the graded identification, not Auslander regularity. For the three-dimensional Heisenberg algebra, its PBW graded ring is `k[e,f,h]`. |
| 1a/F04, enough injectives versus injective envelopes | Repaired, §4.6: “an injective envelope `τ → E` of `k[U]`-modules” followed by passage to smooth vectors | Pinned `TauCeti/Algebra/Module/Injective/Envelope/Existence.lean:109` and SmoothRepresentationsOfLocalGroups SR.0.2 supply the two steps. The smooth part is injective as right adjoint to an exact inclusion and remains essential. For `U=1`, the envelope of `k` is `k`, not `k²`. |
| 1a/F05, nondiscriminating hull/enlargement Checks | Repaired, §§5.6, 6.7: “`p = 17`”, “dimension `34`”, and the explicit lengths in §6.7 | For `Sym⁵`, the stated hull dimensions are `6`, `6+10=16`, and `6+6+10+12=34`. For `p=23`, the enlargement has lengths `8/4/4`; multiplicities `2,3` give `20/10/10`, distinguishing a multiplicity-free answer. |
| 1b/F01, unstated Brauer pairing | Repaired, §5.4: “`TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`” | Pin `TauCeti/Algebra/Module/ProjectiveCover/Multiplicity.lean:158` requires `dim End(S)=1`, satisfied over the splitting field. With the Steinberg projective, `dim Hom(St,St)=1=[St:St]` and `dim Hom(St,k)=0=[k:St]`. |
| 1b/F02, ownership of Qp Hecke declarations | Repaired, lines 344–348: “For `F = ℚ_p` the declarations … are those of §§2.7–2.8” | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 explicitly imports those declarations and extends them to general `F`. The contract now distinguishes the original Qp owner from its extension. |
| 1b/F03, derived ordinary supplier locator | Repaired, line 395: “§3.7, last interface item” | PotentialAutomorphyInfrastructure §3.7's final interface derives `N(𝒪)`-invariants with the monoid Hecke action. Its §3.12 is a different comparison. The additional Hom localisation is built here in §2.2. |
| 1b/F04, finite Ext supplier | Repaired, same explicit gap at line 353 | Independently resolved against PadicLocalLanglandsForGL2Qp §§5.1–5.2; this is the same missing assertion as 1a/F02, not a second supplier. For distinct central characters the Ext space is zero; for equal characters the gap supplies finiteness. |
| 1b/F05, organisation described by source section | Repaired, scope: “finite-length criteria for finitely generated smooth representations of `GL₂(ℚ_p)/p^ℤ`” | The scope now specifies the three mathematical criteria. The dependency chain §1.2 → §§1.3,1.5,1.6 explains their grouping; it no longer tells the implementer to follow a source section. |
| 1b/F06, existing smoothness predicate omitted | Repaired, line 283: “`TauCeti.IsSmoothDiscrete`” | Pin `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` has discrete topology and open-stabiliser fields. The local bare-representation predicate supplies only the latter. For a discrete trivial line both hold; no false claim that a bare representation already has a topology remains. |
| 1b/F07, Vignéras version/title | Repaired, References: “preprint arXiv:0909.4003v1 titled” | VIGNERAS11 line 7 carries the preprint title specified there; the manifest preserves its version note. Published and preprint versions have one key. |
| 1b/F08, wrong socle/duality owner | Repaired, contracts: “§§2.1 and 3.1” of QuiverRepresentations and “§2.3” of ArtinAlgebras | Main's QuiverRepresentations §2.1 gives Krull–Schmidt and §3.1 projective covers; ArtinAlgebras §2.3 gives duality. Pinned `TauCeti.socle` supplies the socle. In `k[ε]/ε²`, `soc=rad=(ε)`, `cosoc=k`, Loewy length 2, agreeing with the new conventions. |
| 1b/F09, undefined BDJ set | Repaired, §3.4 defines `W_BDJ(ρ̄)` and states equality with its regular part under 1-deepness | BDJ10 line 1116 detects the boundary: at `p=5`, inertia `ω³⊕1`, the full set has `Sym²`, `det³`, `det³⊗Sym⁴`, while the regular set has the first two. The repair correctly rejects the earlier review's stronger equality. Under the stated stronger conditions the extra weight is absent. |

The new supplier gaps have matching slugs, suppliers and sections in the README and `design/plan.json`. No new false claim was found in the repaired passages. S01 and S02 predate these repairs.

## Verified sound

### Lean declarations and retained contexts

All 232 lines of `Suggested.lean` were read. The supplied elaborated signatures were compared with the source and the README; no Lean process was run. There are **12 declarations: four definitions, one abbreviation, seven admitted headline theorems**. No lost binder, sorry-valued data, placeholder proposition, `set_option`, `lemma`, duplicate fully qualified name, or one-tactic theorem padding was identified.

Context abbreviations below are expansions, not omitted assumptions. **D** is `A : Type uA`, commutative ring; `G : Type uG`, group with topology; `V : Type uV`, additive commutative group and `A`-module. **LF** has fields `F,L : Type u`, valuative relations and topologies, nonarchimedean-local-field instances and characteristic zero, a prime `p`, and residue characteristic `p` for both. **Q** has prime `p`, finite field `k : Type` of characteristic `p`, `G′=GL₂(ℚ_[p])/p^ℤ`, and `k`-modules in `Type`. Individual rows specify the additional binders. Definitional generality outside local fields is deliberate; the deep theorems add LF or Q.

| Declaration, line; README | Actual context and carrier | Instances and computed values | Result/change |
| --- | --- | --- | --- |
| `IsSmoothRep`, 54; conventions | D; `ρ : Representation A G V`; every vector has open stabiliser | Trivial action: stabiliser `G`, open. For a nondiscrete infinite group acting on its abstract regular module, stabiliser of basis vector at 1 is `{1}`, not open. Zero module: stabiliser `G`. | Definition distinguishes smooth from abstract regular; none. |
| `IsTorsionAdmissible`, 59; §0.1 | D; `p : ℕ`, `ρ`; finite length over A of `V^U ∩ ker(p^j)` for every compact open U and j | `L/𝒪_L`, trivial action, ramification e: length of `p^j`-torsion `ej`; infinite sum of k: length `∞` for j=1; j=0 gives `ker(1)=0`. | Matches the torsion-admissibility convention; none. |
| `IsFinitelyPresented`, 69; §0.3 | D; compact open U₁,U₂; `Rep.{uA} A Uᵢ`, finite-length smooth Wᵢ; induced maps with range=kernel and surjective final map | Trivial group: precisely finite-length A-modules. Zero: W₁=W₂=0. Compact induction of finite W: W₁=0, final map identity. | Relative smooth finite presentation, not abstract group-ring presentation; none. |
| `smoothDualSpan`, 84; §1.6 | D; span in `Module.Dual A V` of f whose stabiliser `{g : f∘ρ(g)=f}` is open | Trivial line gives all k, dimension 1; Steinberg over Qp gives 0; zero gives 0. Stabiliser is unchanged if `g` is replaced by `g⁻¹`. | Span agrees with smooth dual for the actual topological groups; none. |
| `GL2ModScalar`, 92; conventions | Field F with topology; `ϖ : F`; quotient by normal closure of scalar-ϖ matrices | `ϖ≠0`: central cyclic subgroup, determinant valuation of scalar ϖ is 2. `ϖ=0`: no invertible scalar-zero matrix, normal closure of empty set is 1, quotient is GL₂(F). | Junk value does not enter any headline; irreducible uniformiser excludes it. |
| `isFinitelyPresented_ker`, 104; §0.5 | LF; irreducible `ϖ : 𝒪[F]`; V,W are `𝒪[L]`-modules; finite presentations of ρ,σ; intertwiner f | f=id: kernel 0, presentation 0→0. f=0: kernel V, the given finite presentation. For `c-Ind_K` over SL₂, coherence is the nontrivial case. | Native kernel, local-field hypotheses retained; none. |
| `isFinitelyPresented_of_finite`, 121; §1.3 | Q; smooth ρ and finite generation over `MonoidAlgebra k G′` | V=0: both true. I(σ): finite generation true, finite presentation true, finite length false. Non-Qp supersingular counterexamples are outside Q. | Correct Qp restriction, p=2,3 included; none. |
| `isFiniteLength_of_bounded_semisimple_quotients`, 133; §1.5 | Q; smooth, finitely generated; one N bounds `Module.length` of every semisimple quotient | π⊕π simple: bound 2, length 2, not bound 1. `I(1)/(T−1)`: cosocle length 1, total length 2. I(σ): arbitrarily large semisimple quotients, no N. | Quantifier order is uniform in the quotient; none. |
| `isFiniteLength_iff_finite_smoothDualSpan`, 151; §1.6 | Q; smooth and finitely generated | Trivial k: true↔true (1,1). St: true↔true (length 1, dual dimension 0). I(σ): false↔false (both infinite). Infinite direct sum of St: infinite length and smooth dual 0, excluded by finite generation. | Both implications survive tests; none. |
| `isFiniteLength_of_admissible_of_finitelyPresented`, 166; §2.4 | LF; torsion admissible and smoothly finitely presented over `𝒪[L]` | Finite torsion V gives finite length; V=0 length 0. General-F supersingular admissible V violates finite presentation. Infinite sum of k violates admissibility. | Torsion follows from finite-length presentation coefficients; none. |
| `isFinitelyPresented_subrepresentation_of_admissible`, 180; §2.4 | Same LF and hypotheses; arbitrary subrepresentation W of ρ | W=0 and W=top give fp 0 and fp V; ordinary principal-series character subobject is a finite line. | No abstract-Noetherian shortcut; relies on ordinary constituent analysis; none. |
| `exists_coind_approximation_of_lattice`, 202; §2.6 | LF with normed L, Banach E, stable open bounded lattice Θ, joint continuous action; lower Borel identified by entry (0,1)=0; S exactly `ϖ_LΘ`; quotient admissible and fp; hF excludes e=f=1 | Qp gives excluded `(e=f=1)`; unramified quadratic gives `(e,f)=(1,2)`, allowed; ramified quadratic `(2,1)`, allowed. Trivial Θ=𝒪: M=0 gives kernel 0 and cokernel rank 1. Induced lattice: identity gives kernel=cokernel=0. | Coinduction uses continuous, not locally constant, functions. Canonical module topology, joint continuity and completeness are explicitly retained; none. |

The seven Lean headlines correspond to §§0.5, 1.3, 1.5, 1.6, 2.4 (two statements), 2.6. The additional deep endpoints are the ordinary-parts counit (§2.5), supersingular exclusion (§2.4), the local GK bound (§7.6), projective lattice identification (§8.6), endomorphism dimension (§9.1), Hom cyclicity (§9.2), and relative projectivity (§9.3). The module docstring names their absent smooth ordinary-parts, Serre-weight, tame-weight, GK, completed-Iwasawa, pseudocompact/projective-cover and truncation carriers. There is no simple native-carrier formulation omitted in favour of a weaker stand-in. The continuous Banach statement is included precisely because its carriers do exist.

### Sampled adversarial computations

All **60 numbered target sections**, **six bold worked-example targets**, and **198 Check bullets** were read. This table retains 25 target samples and all six worked-example tests; the exhaustive per-target ledger is omitted for comment length. Values are mathematical computations, not Lean output or proofs. Section numbers identify the README targets.

The local-field hypotheses exclude the zero ring, `q=1`, inseparable characteristic-p base fields and rank-zero GL₂. Actual zero modules, empty weight sets, trivial compact groups, small primes and ramified fields were tested where admitted. Layers 3–9 retain their depth and characteristic restrictions.

| Target | Instances and computed values on the two sides | Result/change |
| --- | --- | --- |
| §0.1 torsion admissibility, smoothness and dual finiteness | Trivial `L/𝒪_L`: `(p^j)`-torsion length `ej`; j=0 gives 0. Infinite trivial sum of k: invariant length `∞`, not finite. Zero has length 0. For trivial group these are the whole torsion submodules. | None; finite-level torsion is essential. |
| §0.2 augmented algebra, comparison and action | `H=1`: algebra `𝒪`, scalar action unchanged. Discrete S₃: `(12)(23)=(123)`, reverse `(132)`. `ℤ_p⋊C₂`: `sTs⁻¹=−T+T²−…`, not T, including characteristic 2 where the T² coefficient distinguishes them. On `k[ℚ_p/ℤ_p]` and infinite trivial sum k, T acts as 0. For nonnormal U in S₃, `g⁻¹Ug≠U`. | S02; retain general compact open U and refine it in multiplication. |
| §0.6 Hom base change | Trivial line: `Hom(k,k)⊗k′=k′=Hom(k′,k′)`. Infinite direct sum source gives products: `k^ℕ⊗k′→(k′)^ℕ` misses sequences spanning an infinite-dimensional k-subspace when k′/k is infinite. | None; finite generation cannot be omitted. |
| §0.8 Δ, cells and maps | Identity presentation: Δ=0 but I₁-invariants nonzero. Trivial augmentation: both cell images k, so Δ=k. Map between these gives `0→k`, not onto. The written support API instead gives 0 for the negative preimage. | S01; invert the right-coset cells in the function-support criterion. |
| §1.2 finite filtration, nonsplit coefficients | Zero has empty filtration, I(σ) has one step. For `F=ℚ₂₅`, k=𝔽₅, the character-valued-in-𝔽₂₅ module has k-dimension 2 and endomorphism field 𝔽₂₅. The matrix `(0 2;1 0)` has eigenvalues `±√2`, neither in k; after extension it splits into two characters. | None; does not incorrectly call every irreducible K-module an absolutely irreducible Serre weight over k. |
| §1.4 central characters and Ext support | For p=5, determinant twist δ on scalar 2 gives δ(4)=4≠1, so distinct central characters force Ext=0. Self-extensions of 1 over GL₂(Qp) give `Hom(Qp×,k)`, dimension 2 for odd p and 3 for p=2. Restriction to scalar z is `ℓ(z²)=2ℓ(z)`, zero at p=2. | None in repaired left-exact sequence; source right-exact sequence is erroneous. |
| §1.6 smooth dual iff finite length | Trivial representation: length 1, smooth dual dimension 1. St: length 1, smooth dual dimension 0. I(σ): both infinite. Infinite direct sum of St: infinite length and dual 0, but not fg. | None; tests both directions and the fg hypothesis. |
| §2.2 derived ordinary vanishing | Degree-one transfer multiplies arguments by `q/c`. Qp, c=p: multiplier 1. Unramified quadratic: q/p=p, zero mod p. Ramified quadratic `ϖ²=p`: q/ϖ=ϖ, nonzero but square zero mod p. With p=5, c=2ϖ and functional ℓ(1)=0, ℓ(ϖ)=1, transfer evaluated at 1 gives 3, not 1. Higher cohomology of coinduced cell is 0. | None; nilpotence, not one-step vanishing, is used. |
| §2.5 finite-error counit | Induced object: kernel=cokernel=0. Character: source 0, kernel 0, cokernel one-dimensional. St: source Ind(1), kernel k, cokernel 0. | None; verifies direction of the counit and both error terms. |
| §2.6 Banach lattice | hF is false for Qp (p irreducible and residue size p), true for unramified degree 2 (residue p²) and ramified degree 2 (p not irreducible). On continuous induction, `Σ_n ϖ_L^n 1_{ϖ_F^n𝒪_F}` has value `(1−ϖ_L)⁻¹` at 0 but finite partial sums nearby; it is not locally constant. | None; continuous coinduction and the coefficient topology are necessary. |
| §3.3 adjacency and Ext | Neighbours: Ext dimension 1; two-step separation: 0. p=2,f=1 gives GL₂(𝔽₂)=S₃ and self-Ext of the trivial character dimension 1 despite no self adjacency; the exception is stated. p=3,f=1: neighbouring characters Ext dimension 1, self-Ext 0. | None; small-prime exception retained. |
| §3.4 tame weight recipes | p=17 split ω⁶⊕1 gives `{Sym⁵,Sym⁹det⁶}`. Irreducible ω₂⁶⊕ω₂¹⁰² gives `{Sym⁵,Sym¹¹det⁵}`; for the latter weight exponents `294≡6 mod288`, `90+204=294`. p=5 split ω³⊕1 gives regular set `{Sym²,det³}` while BDJ adds `det³Sym⁴`. | None in repaired comparison. Regular equality also enumerated for 148 one-deep parameter/sign configurations at (p,f)=(5,1),(5,2),(5,3),(7,2). |
| §3.5 Diamond modules | Empty weight set gives D₀=0. For the specified p=17 irreducible case, D₀ dimension `6+10+12+4=32`; D₁ dimension 2. On diag(3,1), the D₁ characters take values 5 and 1; semisimplifying D₀ first gives four invariant characters, values 5,6,1,13. | None; invariants cannot be replaced by invariants of the semisimplification. |
| §4.2 comparisons | U=ℤ_p^d, M=k: grade d, dimension 0, graded support 0. U=1 gives `0−0=0`. Excluded C₂ sign at p=5: augmentation filtration has gr M=0, support −∞, but j(M)=0. | None after pro-p repair; equality is a declared gap. |
| §4.4 graded Iwahori algebra | f=1: `[e,f]=h`, e,f degree 1, h degree 2. Degree 1 dimension 2; degree 2 dimension 4 with characters α², α⁻²,1,1. General f degree 2 dimension `2f²+2f`. PBW graded ring is polynomial in 3f variables. | None; the PBW transfer is not confused with the complete-adic supplier. |
| §4.6 envelopes and Wχ,n | U=1, τ=k: envelope k; embedding into k² is not essential. U=ℤ_p: envelope C∞(ℤ_p,k), dual k[[T]]. Iwahori truncations have dimensions 1, `1+2f`, `1+4f+2f²`; at f=1 these are 1,3,7. | None; quotient/radical direction is correct. |
| §5.1 Iwahori Ext/truncation embedding | Root directions ±αᵢ give one-dimensional Ext. Upper-root extension is K₁-trivial, lower-root one is not. p=5,f=1: α²=α⁻², giving multiplicity 2 in Wχ,3; p>5 separates them. | None; the roadmap corrects the source's p>3 multiplicity claim. |
| §5.6 first-order hull | p=17, σ=Sym⁵: σ dimension 6; hull with Sym⁹det⁶ dimension 16; unrestricted Pσ dimension 34. Self-Ext vanishes for r=14 but is nonzero for r=15. Tangent space has dimension 3f. | None; tests multiplicity-one and boundary hypotheses. |
| §6.2 K₁ filtration | One coordinate, bound 3: first K₁-torsion layer has labels 0,1; second has 2,3. Filtration degree is floor(a/2), not a, hence each pair shares degree. | None; ordinary radical rank would give four levels instead of two. |
| §6.7 tame socle enlargement | p=23,r=10 is 8-deep: `8<11<15`. The f=1 lengths are 8,4,4; multiplicities 2,3 give 20,10,10. At f=2 each of four hulls has length 12, total 48, invariant part length 16; ordinary box rank≤1 would give only 3 per hull. | None; repaired examples discriminate both multiplicity and K₁ filtration. |
| §7.6 local GK bound | f=1 admissible supersingular example has GK=1, meeting bound 1. f=2 conclusion is ≤2 against ambient GL₂ dimension 8. Zero module has GK=−∞ but cannot satisfy the nonempty socle hypothesis. | None; zero is not used to certify existence of a generic example. |
| §8.3 adjoint contraction | Scalars on the three components are −2r,4,2(r+2). At p=11,r=3 these are 5,4,10, all invertible; r=0 kills the first and r=p−2 kills the third. | None; generic bounds exclude both kernels. |
| §8.6 first projective truncation | Over K/Z₁ dimension is `(1+3f)d`; for p=11,Sym⁵ the three-deep inequalities hold. Over K₁/Z₁ alone the corresponding trivial projective truncation has dimension `1+3f`, missing factor d. | None; the source's K₁/K slip is explicitly corrected. |
| §9.2 cyclic Hom | τ=σ: generator id gives right regular End-module. p=13: integer interval `5<r<6` empty. p=17 gives r=6,7,8,9. Precomposition uses End of the source. | None; side of module action checked. |
| §9.3 relative projectivity | Q=T gives projectivity in A₁-modules; Q=σ gives `Hom(σ,σ)=k=Hom(T,σ)` and semisimple generated subcategory. Proper length-two quotient is not projective in the whole A₁-category, since its cover is T. | None; ambient projectivity is not claimed. |
| Worked example: trivial Qp weight | I(1) infinite length; quotient by T−1 length 2, cosocle length 1, smooth dual dimension 1. | None. |
| Worked example: coherence | Augmentation kernel fp; supersingular non-Qp kernel not fg. | None; different quotients have different hypotheses. |
| Worked example: ordinary approximation | `Ord(St⊗χdet)=χ⊗χ`; counit kernel χdet, cokernel 0. | None. |
| Worked example: f=1 weights | λ=(5,0), p=17 gives the two t-values above; split inertia gives Sym⁵ and Sym⁹det⁶, not the irreducible-pair second weight Sym¹¹det⁵. | None. |
| Worked example: Iwahori | Graded dimensions 2 and 4 give W₂=3,W₃=7; crossing quotient dimension 1. | None. |
| Worked example: gluing | f=1: rank R=4d, reduction dimension 4d, endomorphism dimension 4. | None. |

Discriminating instances were computed for all 60 Check blocks. Definition sections have at least three listed Checks. Boundary identities remain README material, not Lean acceptance-test padding.

### Conventions and additional identity tests

| Convention/API | Computation | Result/change |
| --- | --- | --- |
| Scalar quotient and determinant parity | `det(ϖ·1₂)=ϖ²`, valuation 2; `det diag(ϖ,1)=ϖ`, valuation 1. These elements do not generate the same central quotient. | None. |
| Coefficient versus group field | For ramified L of index e, `p=uϖ_L^e`, so `ker p^j=ker ϖ_L^{ej}`. For F unramified quadratic but L=Qp, q=p² while e(L)=1. | None; the two fields are not conflated. |
| Dual action and composition | For g acting by scalar a on k, dual action is a⁻¹; at a=2 over 𝔽₅ it is 3 and evaluation gives `2·3=1`. `(f·a)·b=(f∘a)∘b=f∘(a∘b)`. | None; right End action matches function composition. |
| Cyclic embeddings/root lattice | f=2 sends `(λ₀,λ₁)` to `(λ₁,λ₀)` under π. Root `(1,−1)` has difference 2, central `(c,c)` difference 0. | None. |
| Niveau and Artin norm | f=1,r=2,p=5: niveau-two image has order 24; exponent `1+5=6` gives order 4, matching niveau one. 𝔽₅× alone has order 4 and cannot realise the former. | None; required coefficient extension is explicit. |
| Radicals and socles | On `k[ε]/ε²`, socle and radical both `(ε)`, quotient k; radical powers have lengths 2,1,0 and Loewy length 2. On zero, Loewy length 0. | None. |
| Admissibility and quotients | Trivial `L/𝒪` dual is 𝒪, free rank 1. Its p-torsion dual is `𝒪/p`, length e. A finite direct sum of n copies has dual rank n and p^j-torsion length nej. | None. |
| Compact-open restriction of dimension | For U=ℤ_p and U′=pℤ_p, dual k[[U]] is free of rank p over k[[U′]], grade 0 over either; dimension `1−0=1` on both sides. For k, both grades 1, dimension 0. | None. |
| Exact dimension maximum | On `0→k→k⊕C∞(ℤ_p,k)→C∞(ℤ_p,k)→0`, dimensions are 0,1,1, and middle=`max(0,1)=1`. On `0→0→k→k→0`, middle=`max(−∞,0)=0`. | None. |
| Central quotient comparison | `U=ℤ_p²`, module k[[X]] with second coordinate trivial: grade over k[[X,Y]] is 1 and over k[[X]] is 0, so `2−1=1−0=1`. | None. |
| Elementary group-ring identities | Set g=1+X,h=1+Y. Then `gh−1=X+Y+XY≡X+Y mod m²`; `g⁻¹−1=−X+X²−…`; in characteristic p, `g^p−1=X^p∈m^p`. At g=1 all three sides are 0. | None. |
| Crossing minimal primes/regularity | For two indices, minimal primes choose one of Xᵢ,Yᵢ per index: four primes, each quotient k in two variables, dimension 2. Multiplication by X₂Y₂ is injective after quotienting by X₁Y₁ since it is monic in independent variables. Empty regular list has quotient k, not the zero ring. | None. |
| Identity/composition for constructed maps | For Δ and continuous induction, id restricts/induces id and zero induces zero. For scalar maps 2 and 3 over 𝔽₅, both successive and composite induced maps multiply by `6=1`. Quotient map from the crossing polynomial ring sends XᵢYᵢ to 0 and 1 to 1. | S01 only for the separate support identification. |
| Square-zero and filtration controls | `k[[X]]/(X²)` has Krull dimension 0 but length 2; the crossing algebra is reduced but not a domain. An augmentation-square quotient retains degree-one generators and kills their products, unlike the trivial quotient which kills the generators. | None; these rings are not identified. |

### Suppliers, ownership, pins and dependency direction

The review checked **12 named supplier families**, resolving section identities on main or at the available open heads, and distinguished the seven explicit gaps from supplied results. This is a count of supplier families, not a claim that twelve citations exhaust the repeated Needs lines.

| Supplier family | Resolved contract and boundary checked |
| --- | --- |
| SmoothRepresentationsOfLocalGroups | SR.0.1–0.4, SR.0d.1 and SR.2.1: smooth category, smooth-part right adjoint, invariants, duals, enough injectives, induction and Frobenius reciprocity. The exact inclusion and right adjoint occur in its README at lines 669–713. Its right-translation function convention is the one used in S01. |
| PadicLocalLanglandsForGL2Qp | §§0.1,0.3,2.1–2.3,2.6–2.9,5.1–5.3: coefficient dualities, Qp classification and finite presentation, non-Qp supersingular obstruction, and blocks. §§5.1–5.2 do not silently supply the two Ext-finiteness gaps. Qp principal-series reducibility is `χ₁=χ₂` for unnormalised induction. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.5.15, README lines 8197–8222, imports the Qp declarations and extends to arbitrary F over algebraically closed coefficients. The three further Barthel–Livné contracts are declared gaps. No reverse ownership edge is introduced. |
| PotentialAutomorphyInfrastructure | §3.7, final interface, README lines 1270–1283: positive transfer and derived N-invariants. The package constructs its own locally finite Hom localisation and does not cite §3.12 for it. |
| CompletedCohomologyAndLocalGlobalCompatibility | §0.1, README lines 235–243: the complete admissible categories and locally finite ordinary right adjoint. A smooth module killed by a fixed power of ϖ is complete for this finite filtration; torsion-admissibility supplies the finite residual invariants. |
| NoncommutativeAndEquivariantIwasawa | §F.1 and §§0.3,0.5,0.7–0.8,0.10–0.11,0.13. In particular §0.5, README lines 271–301, is complete-adic, and gives only the grade inequality in its existing API. The equality and increasing-PBW transfer remain explicit gaps. |
| CompletedCohomologyPartII | §F.1 and §5.8: integral admissibility/duality and power-subgroup growth. §5.8 requires a nonzero finite module and d>0; package §4.1 deals separately with d=0 and V=0. |
| DeformationAndDerivedPatchingAlgebra | §3.4: regular-sequence ideals and complete intersections, including exclusion of the unit ideal. The crossing ideal is proper and its generators form a regular sequence in a polynomial ring. |
| SchemeAndStackFoundations | Main §0.17: depth and Cohen–Macaulay comparison. The package uses finite polynomial rings over a field and regular quotients, not an arbitrary non-Noetherian version. |
| ClassFieldTheory | Main Layer 7: arithmetic Artin map and its geometric form obtained by inversion; README lines 1225–1229 specify the inertia restriction. The niveau-r character uses the unramified degree-r extension, not just Artin reciprocity for F. |
| RepresentationTheory/QuiverRepresentations | Main §§2.1,3.1, README lines 481–518: finite-length decomposition and finite algebra covers. Its duality is explicitly handed to ArtinAlgebras. |
| RepresentationTheory/ArtinAlgebras | Main §2.3, README lines 717–729: finite left/right duality and projective/injective exchange. Inversion in K/Z₁ preserves the augmentation-square ideal, so it supplies the required anti-involution of A₁. |

All seven gaps are precise theorem contracts, have nonempty earlier suppliers and matching plan slugs, and ask for results beyond the cited suppliers' present APIs. The filtered-grade gap supplies equality, rather than restating the existing inequality; the enveloping-algebra gap concerns an increasing filtration, rather than restating a complete-adic theorem. A zero Lie algebra gives U=k, an abelian d-dimensional one gives k[X₁,…,X_d]; both satisfy the proposed contract. Declared gaps are not findings.

At the pins, the near-matches do not discharge the seven headlines. In particular `Mathlib/RepresentationTheory/Basic.lean:670` supplies the algebraic contragredient, not its smooth-vector finite-length criterion. `Mathlib/RingTheory/FiniteLength.lean:92` assumes semisimplicity of the module itself; §1.5 only controls its semisimple quotients. `Mathlib/RepresentationTheory/Induced.lean:77` supplies algebraic induction, not smooth finite-presentation coherence. Algebraic-geometry smoothness hits and bounded-set hits in the supplied search output concern different objects. Pinned continuous coinduction and local-field classes were inspected at `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, `:541`, `:558` and `Mathlib/NumberTheory/LocalField/Basic.lean:46`: operator continuity does not imply joint action continuity, whereas the local-field class does require the valuation-compatible topology. The headline explicitly carries what those definitions omit.

Ownership searches used `roadmaps grep`/`show`, the available open-head checkouts, main, the board packages and the pins. Searches by object included smooth envelopes, finite-length/projective covers, augmented group algebras, Hom base change, ordinary parts, tame/BDJ weights, crossing algebras, GK dimension, Iwahori truncations and projective gluing. The existing owners of generic smooth categories, ordinary parts over Qp, completed algebras, PBW, projective/injective envelopes and finite-algebra duality are imported rather than re-planned. ArithmeticGaloisRepresentations has finite-dimensional Hom base change; this package's finitely generated group-algebra source is more general and does not duplicate that theorem's scope.

Closest-open-roadmap comparison: LocallyAnalyticRepresentationsOfLocalGroups owns characteristic-zero locally analytic distribution/Ext theory, not these torsion smooth targets. ScholzeFunctorAndModpCohomologyOfTheLubinTateTower explicitly consumes MP.0–MP.1 for its geometric applications. LocalGaloisDeformationRingsPartII concerns deformation rings/types. HilbertModularVarietiesAndShimuraCurvesPartII consumes MP.3–MP.9 for the global theorem. Its §0.2 still duplicates the tame BDJ recipe and still asserts the false one-deep full equality: its own p=5 example has three weights. The package already records that ownership must move down here and the later consumer must use the regular-part comparison. It is not a new blocking finding in this package and no upward edge should be added to address it.

The overlap file identifies the open roadmap #2282 as another copy of this roadmap. Its head has the same scope and the older, pre-repair text, rather than an independently different scope; in particular it retains the old ordinary supplier locator and omits the new BDJ repair. This package must be applied to that existing roadmap branch, preserving its MP mapping, rather than submitted as a second independent roadmap. No corresponding folder was found on main, no dropped section IDs were reported, and no new supplier edge to an open revision is needed. The board-to-upstream administrative relationship is outside the text comparison.

Mechanical dependency output from the requested read-only command:

```text
depcheck: 239 roadmaps, 2173 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The git comparison with origin/main changes ten files, all inside `packages/ModpRepresentationsOfGL2OverLocalFields/`. The only working-tree addition from this review is this report. No Lean build, git write or external post was made. README and Lean contain no pull-request numbers, process narrative, `set_option` or computational algorithm. The single Lean import is `import Mathlib`.

### Source locator ledger

The following ledger records **139 discrete locator checks in 18 readable sources**. A range in the evidence column identifies the relevant extracted lines; the locator column identifies exactly which numbered assertions enter that count. Repeated citations to the same assertion are not counted again. The evidence supports the package at its stated hypotheses, except for S01–S02 and the source errors separately recorded below. Two further works retain their settled waived/uncertified status.

| Source | Locators checked (count) | Extracted evidence and comparison |
| --- | --- | --- |
| BHHMS23 | 2.4.2, 2.4.4, 2.4.6, 2.4.7; 5.1.2–5.1.3; 5.3.1–5.3.5; 6.1.1–6.1.3; 6.2.1–6.2.4; 6.3.1, 6.3.3–6.3.5, 6.3.7–6.3.11, 6.3.13, 6.3.15; 6.4.1–6.4.4, 6.4.6–6.4.7; 7.1.1, 7.1.4; 7.2.1–7.2.2; 7.3.1–7.3.4; 7.4.1–7.4.4 (47) | Lines 716–786, 2385–2392, 2624–2817, 2900–2930, 2997–3110, 3138–3610, 3621–3818, 3881–3922, 3998–4052, 4107–4277. Depth assumptions, central quotient, augmentation degree, projective category and multiplicities were compared. The package corrects the BDJ boundary, p=5 collision and K₁/K cover misprint. The PBW step has an explicit supplier gap. |
| CDN23 | 1.2–1.4, 1.6–1.7, 1.17, 1.19–1.26, 1.29–1.34 (20) | Lines 459–519, 692–731, 737–823, 855–917. Finite type, finite length and finite dimension are distinguished. The filtration over nonsplit coefficients is strengthened correctly; the central Ext comparison is only left exact. The proof of ordinary vanishing is replaced, rather than importing the Qp-only citation. |
| SHOTTON20 | 2.7, 2.8, 3.2, 3.3, 3.5, 4.5, 5.1, 5.2 (8) | Lines 145–198, 301–347, 469–506. The smooth notion of finite presentation uses finite coefficient modules, not arbitrary abstract group-ring presentations. The algebra construction changes compact subgroups under conjugation, as S02 requires. |
| HU12 | standard-function convention; §3.1.1; Corollaire 3.9; Théorème 3.27; Proposition 4.4 (5) | Lines 200, 1007, 1167, 1663, 1900–1926. The convention fixes inverse supports. Admissibility is required for the invariant-containment application. The ordinary constituent proof uses a finite Hecke presentation. |
| BP12 | Corollary 5.6; Proposition 13.1; Corollary 13.2; Theorem 13.8; §16 case (iii) (5) | Lines 1468, 3025–3064, 3157, 3670–3675. The p=2 exception is separated. Maximal Diamond objects are unique up to isomorphism; the explicit f=1 example has D₁ dimension 2. The assertion of unique projectors in the proof of Proposition 13.1 is stronger than the proof needs and is erroneous. |
| EMERTON1 | Definition 3.1.3; Lemma 3.1.7; Definition 3.1.9; Proposition 4.1.5; Theorem 4.4.6 (5) | Lines 686, 753, 780, 1279, 1759. Locally finite localisation, unnormalised opposite-parabolic induction and the locally admissible adjunction match. |
| EMERTON2 | Remark 3.7.3; Theorem 4.2.12 (2) | Lines 1179, 1497. There is a degree-one comparison injection. The latter theorem is for GL₂(Qp), so it does not by itself prove the non-Qp vanishing. |
| HAUSEUX | Corollaire 4.2.4 (1) | Lines 1342–1350. Degree-one ordinary cohomology of the induced object vanishes for F≠Qp; the Qp character case has a nonzero term. |
| DEG | Lemma 4.2.1 (1) | Line 2193. The source's p≥5 scope does not silently cover p=2,3; the package's extension is a declared gap. |
| KOHLHAASE17 | Proposition 3.9 (1) | Line 660. Smooth duality has the asserted finite-dimensional/vanishing consequence for admissible representations, with irreducibility in the vanishing clause. |
| VIGNERAS11 | Proposition 8; Lemme 11; Propositions 9–10 (4) | Lines 783, 808, 827, 835. Preprint numbering is used. The obstruction-space nonvanishing claims cannot be used for arbitrary compact induction; the package explicitly excludes that application. |
| HW22 | Lemma 2.10 (1) | Lines 540–564. The exceptional self-extension at r=p−2 is retained, rather than extrapolating the regular range. |
| HU10 | Lemma 2.13(i), preprint; journal 2.12(i) (1) | Lines 902–908. The cyclic digit submodule and numbering conversion agree. |
| LMS22 | Proposition 3.3 (1) | Lines 318–328. Tensor decomposition must be read with the separate correction, including the character exception. |
| LMS22-CORR | Item (2) (1) | Lines 13–19. The corrected translated modules become projective covers under the stated non-character condition. |
| BDJ10 | §3.1 irreducible recipe; §3.2 reducible recipe (2) | Lines 834–890, 1020–1140, especially 1116. The determinant exponents and q+1 ambiguity explain exactly the extra boundary weight in the p=5 test. |
| LE19 | Theorem 1.1 (1) | Line 30, with the setup on lines 1–95. The example is at degree three and p>2; it disproves admissibility, not finite type. |
| SERRE-TREES | Chapter II, §1.4, Théorème 3 and Corollaire 1 (2) | Lines 3281, 3287. These supply the two vertex stabilisers and the SL₂ amalgam; the scalar quotient/type-preserving index-two step is additionally explained in the package. |

The additional supporting locators below contribute 31 checks to that total; they resolve proof-route citations as well as headline citations.

| Source | Additional locators (count) | Evidence and scope |
| --- | --- | --- |
| SHOTTON20 | Definition 2.3; Lemmas 2.4, 2.6, 3.6; Propositions 3.8, 4.1–4.3; Corollary 4.4 (9) | Lines 112–138, 350–394, 408–468. Analyticity supplies noetherian completed compact-group rings; the amalgam coherence proof uses flatness on the correct side. |
| HU12 | Proposition 3.30; Corollaire 3.31; Théorème 4.3; Lemme 4.5 (4) | Lines 1734–1767, 1825–1843, 1926–1933. Finite obstruction is equivalent to finite generation of the kernel; admissibility is separately used to descend on obstruction dimension and conclude finite length. |
| BP12 | Lemmas 3.4, 3.5, 3.8; Corollaries 3.12, 6.9 (5) | Lines 805–817, 887–898, 986–1005, 1701–1707. The digit restrictions and simple socle/cosocle hypotheses agree; Corollary 6.9's proof confirms the cited Barthel–Livné numbering. |
| HW22 | Theorem 2.23; Corollaries 2.25–2.26; Theorem 2.30; Corollary 2.31 (5) | Lines 817–844, 974–989. Genericity attaches to the socle for the injective version and to the cosocle for the projective version. These agree with §5.6. |
| EMERTON1 | Lemma 2.3.4; Proposition 4.3.4 (2) | Lines 361–367, 1607–1623. Admissibility supplies the local central finiteness needed by the unit isomorphism. |
| BHHMS23 | Theorems 1.7, 1.10; proof of Lemma 4.1.2 (3) | Lines 360–361, 452, 1271–1284. The global equality is not imported as a local equality; characteristic-zero projective constituents are multiplicity-free of the asserted length. |
| CDN23 | Remarque 1.18; Lemme 2.9 (2) | Lines 702–705, 1148–1154. The general admissible finite-type claim remains a conjecture; the five-term assertion is numbered 2.9, not its equation number. |
| VIGNERAS11 | §5, Théorème 6 (1) | Lines 723–740. Torsion admissible finite presentation gives finite length and the subquotient property. |

One further source-proof check can be made without an external result: in BP12 Proposition 13.1, choose distinct simple constituents S,T with a nonzero map `a:E(S)→E(T)`. The idempotents `(x,y)↦(x,0)` and `(x,y)↦(x,a(x))` both project onto an injective envelope of S. For `GL₂(𝔽₃)`, inflate the principal-block projectives of `S₃=GL₂(𝔽₃)/Q₈`; their successive factors are `1,sgn,1` and `sgn,1,sgn`, providing such a map a. The map kills soc(S), so even fixing the embedded socle does not restore uniqueness. Choosing compatible projectors suffices; the package does not assert their uniqueness.

### Wording, arrangement and reuse

For locator checks, the mathematical claims and proof inputs were compared with the source passages, without reproducing their expression. The following **16 additional prose comparisons across nine sources** include definition wording, explanatory remarks, proof routes and a Lean docstring. Shared formulae, standard terminology and short forced mathematical statements were not counted as borrowed prose.

| Package passage | Source comparison | Result |
| --- | --- | --- |
| README §0.2, construction and action explanation | SHOTTON20 lines 301–347 | The text supplies its own finite-vector action argument. The multiplication defect is S02, not borrowed expression. |
| Suggested.lean coherence docstring, lines 98–103 | SHOTTON20 lines 469–506 | The docstring specifies the local-field quotient and torsion conclusion independently of the source's amalgam exposition. |
| README §1.2, nonsplit coefficient explanation | CDN23 lines 717–729 | Adds the coefficient-splitting issue and a matrix control; no source sentence reproduced. |
| README §1.4, central restriction proof route | CDN23 lines 765–785 | Rewrites the extension argument and corrects its exactness. |
| README §1.6, smooth-dual proof route | CDN23 lines 787–822 | States the needed filtration and Ext inputs in the package's dependency order. |
| README §2.1, locally finite ordinary construction | EMERTON1 lines 686–780, 1759 | Formulae identify the same functor; surrounding explanation is independently written. |
| README §2.2, comparison and transfer explanation | EMERTON2 lines 1179, 1497–1530 | Distinguishes derived and cohomological ordinary parts and gives independent ramified-field tests. |
| README §2.6, integral inverse-limit route | CDN23 line 917 and following proof | The lattice hypotheses and compatible finite-error passage are expressed in the roadmap's terms. |
| README §3.2, cyclic coordinate explanation | BHHMS23 §2.4, lines 640–716 | Formula and parity are mathematical data; no borrowed explanatory sentence found. |
| README §3.4, regular-part comparison | BDJ10 lines 1116–1140 | Independent comparison argument and explicit boundary counterexample. |
| README §3.5, maximal Diamond object | BP12 lines 3025–3064 | Uses the invariant maximality property, without copying the proof's exposition or its projector uniqueness error. |
| README §4.6, smooth-envelope construction | BHHMS23 around line 2886 | Adds the algebraic-envelope/smooth-part route; no matching source paragraph. |
| README §5.5, corrected tensor decomposition | LMS22 lines 318–328 | Mathematical summands and hypotheses agree after the separately cited corrigendum; no reused table or prose. |
| README §5.6, hull dimensions and exceptional case | HW22 lines 540–564 | Numeric negative controls and their presentation are the roadmap's own. |
| README §8.3, character eigenspaces | BHHMS23 lines 3995–4052 | Scalar eigenvalues are forced data; the check computes them at explicit parameters. |
| README §9.1, integral endomorphism route | BHHMS23 lines 4232–4258 | The rank and reduction argument uses the same proof idea, with its own statement and explanation. |

Counting source-tagged citation occurrences before References, with a compound citation to one source counted once, gives **161 occurrences**, of which **48 cite BHHMS23** (about 29.8%). This is a separate measure from the 139 resolved locator checks above. Its contents were read at BHHMS23 lines 16–59.

The closest structural correspondence is Layer 4 ↔ source §5, Layers 5–7 ↔ source §6, and Layers 8–9 ↔ source §7. It is not a sequence of equal-scope source chapters: Layer 3 combines the tame recipe with BP12's Diamond object; Layer 4 includes the Iwahori envelopes used by the dimension criterion; Layer 5 combines finite Borel/GL₂ representations, projective lifts and HW22/LMS22 tensor input; Layer 6 isolates subobject boxes and socle enlargement; Layer 7 starts with connected characters before its Loewy and dimension consequences. The source's deformation chapters and global chapter are supplied elsewhere or excluded. Layers 0–2 are independent inputs to the local smooth library, using SHOTTON20, HU12, CDN23 and EMERTON1–2.

The order in the closest run is forced by the explicit Needs edges: §4.7 uses §4.6; §7.6 uses §§4.7,6.7,7.5; §8.6 uses §§8.1–8.5 and §§5.4–5.5; §9.3 uses §§9.1–9.2. The source's preliminary-computation section is split between the package's tensor input and lattice construction, rather than imported as an expository layer. No one-to-one source-outline plan or reused table, figure, exercise list or external formalisation was identified.

Counts for this pass: **12 Lean declarations read; 60 numbered README target sections and six bold worked examples read; 139 locator checks recorded; all 198 Check bullets read, with computed tests for all 60 Check blocks; 12 supplier families resolved; 14 earlier findings retested; two new findings**. The tables record finite discriminating tests and proof-input comparisons, not completed proofs of the roadmap's future theorems.

## Not verifiable

- BARTHEL-LIVNE94 remains waived. Its Proposition 18, Theorem 30, Theorems 33–34 and Corollary 36 were not certified from the original text; the package's contracts and the quoted uses in readable secondary sources were checked. No new source request is made.
- SERRE-LRFG remains uncertified. Part III, Chapters 14–15 were not checked against the book. The Brauer-pairing claim used here was checked against the pinned projective-cover multiplicity declaration instead. No new source request is made.
- No fresh Lean elaboration was run, as required by the read-only brief. The twelve supplied elaborated signatures were used for binder verification. This report does not claim a new build result.
- The seven declared supplier gaps are contracts, not finished library theorems. In particular the all-prime Ext-finiteness extensions are not proved by the p≥5 DEG citation. Acceptance of those contracts does not certify their eventual proofs.
- The relationship between the job-board package and upstream open roadmap #2282 cannot be established by comparing their mathematical text. The available heads establish common scope and older text at the upstream head; they do not establish which branch the worker will update.

## Source issues

- **Error** in BHHMS23 at Proposition 2.4.2, printed p. 16 (BHHMS23 line 716): the source says the one-deep presentation gives the entire BDJ set; it should be the regular part, with stronger hypotheses for full equality; affects a stated result.
- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p. 56 (BHHMS23 line 2901): the source says all noncentral character multiplicities are at most one for p>3; it should be restricted to p>5 or include the p=5 collision of the two squared root characters; affects a stated result.
- **Misprint** in BHHMS23 at proof of Corollary 7.3.4, printed p. 84 (BHHMS23 line 4206): the source says the cover is taken for K₁/Z₁ in the final dimension comparison; it should be the cover for K/Z₁; affects the proof.
- **Error** in CDN23 at the remark after Proposition 1.19, printed p. 17 (CDN23 line 729): the source says the Serre-weight filtration works over unchanged finite coefficients for general F; it should be a filtration by irreducible coefficient-field K-modules, or require a splitting coefficient field; affects a stated result.
- **Error** in CDN23 at proof of Lemme 1.23, printed p. 18 (CDN23 line 779): the source says the extension comparison surjects onto the central-character variation space; it should be left exact only: at p=2 the determinant-extension restriction is multiplication by two and vanishes; affects the proof.
- **Gap** in CDN23 at proof of Proposition 1.30(b), printed p. 21 (CDN23 line 891): the source says the cited Emerton theorem proves the non-Qp Steinberg vanishing; it should be justified by the non-Qp cell-cohomology calculation and induced ordinary-cohomology vanishing; affects the proof.
- **Error** in VIGNERAS11 at §5, Propositions 9–10, preprint p. 22 (VIGNERAS11 lines 827, 835): the source says the obstruction contains the stated invariants and is nonzero for arbitrary generating modules; it should be restricted to hypotheses such as the admissible Serre-weight quotient case; affects a stated result.
- **Error** in LMS22 at Proposition 3.3(2), printed pp. 7–8 (LMS22 line 326): the source says every translated tensor summand is the corresponding projective cover; it should be the translated R-module, identified with that cover only when the corresponding weight is not a character; affects a stated result.
- **Error** in BP12 at proof of Proposition 13.1, printed p. 76 (BP12 line 3058): the source says multiplicity-free socle makes the injective-envelope projectors unique; it should be a choice of compatible orthogonal projectors; nonzero cross-homomorphisms give distinct choices; affects the proof.

- **Misprint** in SHOTTON20 at proof of Proposition 3.2, printed p. 8 (SHOTTON20 line 314): the source says the subgroup comparison maps compose in the displayed order; it should be ρ(K,K″)=ρ(K,K′)∘ρ(K′,K″), following their specified domains; affects the proof.
- **Misprint** in SHOTTON20 at proof of Proposition 3.8, printed p. 9 (SHOTTON20 line 394): the source says tensoring the presentation with ranks m then n gives ranks n then m; it should be ranks m then n; affects the proof.

Source independence: 16 additional prose passages compared with nine sources; no borrowed wording or reused tables/figures found. Largest share BHHMS23, 48 of 161 source-tagged citation occurrences; contents compared with BHHMS23 lines 16–59: no one-to-one source-outline plan.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bee775a19eaeeabd7f62adbbcad518a8e975926d", "job": "RT-ModpRepresentationsOfGL2OverLocalFields~2a", "model": "gpt-6-astra", "worker": "chris-33"} -->
