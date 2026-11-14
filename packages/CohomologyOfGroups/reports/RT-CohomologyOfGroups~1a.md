<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6883073954 -->
Red team round 1 pass a (codex) of a528360

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The cohomological universal coefficient headline is statable

   **Location:** `packages/CohomologyOfGroups/Suggested.lean:46–50`: “the universal coefficient sequences ... the evaluation pairing of README 4.6”.

   **Claim:** §5.2 cannot be an acceptance theorem because its evaluation pairing is missing at the pins.

   **Witness:** `TauCeti/Algebra/Homology/Kronecker.lean:106` defines evaluation. `TauCeti/RepresentationTheory/Homological/GroupCohomology/CoinvariantsTensor.lean:167` identifies its source with group cohomology. README §5.2 itself identifies its desired map with this Kronecker map.

   **Exact repair:** Remove the cohomological universal coefficient sequence from the list of unstatable headlines. Add a headline `universalCoefficient_cohomology` for every commutative hereditary ring `k`, group `G`, trivial coefficient module `A`, and `n : ℕ`: the sequence

   `0 → Ext¹_k(H_n(G,k), A) → H^{n+1}(G,A) → Hom_k(H_{n+1}(G,k), A) → 0`

   is short exact and admits a linear splitting. Define its two maps, with real bodies, by transporting `TauCeti.ChainComplex.extToHomology` and `TauCeti.ChainComplex.kronecker` along `Rep.groupCohomologyIhomIso`, `groupHomologyIso`, and `Hom_k(k,A) ≅ A`, using the standard resolution. Keep ordinary group (co)homology carriers in the statement. Add the name and signature to README §5.2. Import the individual pinned modules used. Generic exactness and splitting inputs already exist in `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121,153,180` and `TauCeti/Algebra/Homology/Kronecker.lean:252`; no new complex or pairing carrier is needed.

   **Retest:** For `G=C₂`, `k=ℤ`, `A=𝔽₂`, `n=0`, the terms are `0 → 0 → 𝔽₂ → 𝔽₂ → 0`, with evaluation an isomorphism. For `n=1` they are `0 → 𝔽₂ → 𝔽₂ → 0 → 0`. For `G=ℤ`, `A=k=ℤ`, `n=0`, they are `0 → 0 → ℤ → ℤ → 0`. These are the actual §5.2 maps, not a replacement theorem about an arbitrary complex.

2. **F02** (P3) Hypercohomology has no discriminating Checks

   **Location:** `packages/CohomologyOfGroups/README.md:992–999,1028–1035`: two definitions, followed by three homological Checks.

   **Claim:** The Checks cover both new objects of §2.1.

   **Witness:** All three Checks use `Hₙ(G; C)` and chain complexes. Replacing hypercohomology by zero, or by cohomology of the invariant complex, changes none of their values.

   **Exact repair:** Append these three Checks to §2.1:

   - For `G=C₂` and `D=ℤ` with trivial action in degree zero, `H⁰(G;D)=ℤ`, `H¹(G;D)=0`, and `H²(G;D)=ℤ/2`; taking only the invariant complex incorrectly gives zero in degree two.
   - For `G=1` and `D=(ℤ —2→ ℤ)` in cochain degrees zero and one, `H⁰(1;D)=0` and `H¹(1;D)=ℤ/2`; reversing the total-complex degree convention gives the wrong degree.
   - For `G=C₂` and `D=ℤ_sgn` in cochain degree one, `H¹(G;D)=0` and `H²(G;D)=ℤ/2`; the invariant complex is zero, whereas `H¹(C₂,ℤ_sgn)=ker(1+t)/(t−1)ℤ=ℤ/2`.

   **Retest:** These computations exclude the zero theory, the underived invariant theory, and the opposite shift convention. They require no additional supplier.

3. **F03** (P2) The second extension filtration has undefined boundary terms

   **Location:** `packages/CohomologyOfGroups/README.md:1822–1824`: “Define the second filtration `A*_j`: for `0 < j ≤ n`”.

   **Claim:** This defines a filtration of the whole normalized cochain complex, subsequently used to identify the first page in §6.2.

   **Witness:** In cochain degree `n=0`, no integer satisfies `0<j≤n`. Thus neither `(A*_0)^0` nor `(A*_1)^0` is specified; even `E₀^{0,0}` cannot be formed from the given definition.

   **Exact repair:** Replace the definition sentence by: “Define `(A*_j)^n = C̄ⁿ(G,M)` for `j ≤ 0`, and `(A*_j)^n = 0` for `j > n`. For `0 < j ≤ n`, let `(A*_j)^n` consist of the normalized cochains depending only on the first `n−j` arguments and the cosets modulo `N` of the last `j`.” Keep the existing source locator. Add: “For `n=0`, `(A*_0)^0=M` and `(A*_1)^0=0`; for `N=1`, `(A*_j)^n=C̄ⁿ` when `j≤n`; for `N=G`, `(A*_j)^n=0` when `j>0`.”

   **Source cross-check:** HS53 lines 404–407 explicitly include both boundary ranges.

   **Retest:** For `G=N=1`, `M=ℤ`, the corrected degree-zero graded piece is `ℤ/0=ℤ`, so the first page and abutment recover `H⁰(1,ℤ)=ℤ`. The incorrect zero completion would give zero there. For `G=C₂,N=1,M=𝔽₂`, each nonzero normalized cochain degree contributes `𝔽₂` at its correct filtration level.

## Verified sound

Counts: all 417 Lean lines and 2,675 README lines read; 20 declarations (7 definitions, 13 theorems); all 41 numbered target sections and all 5 bold subtargets read; 164 Check bullets read, with 41 section-level Check suites tested and computations consolidated below; 33 legal-source locator groups verified; 14 supplier contract blocks checked. The 20 declaration rows and 44 target/subtarget rows record computed instances, not proof certificates. No Lean command was run: the supplied elaborated signatures are the signature evidence.

### Lean declarations: all 20

All names below are in `TauCetiRoadmap.CohomologyOfGroups`. `k` is a commutative ring, all group structures are explicit, and `M` is a representation. The first fifteen declarations use the indicated universe `u`; the five Layer 8 declarations use `Type`. No standing assumption is recovered from a proof body. The supplied `signatures.md` contains the elaboration of every declaration; the displayed contexts agree with those types. Definitions have actual bodies. None of the thirteen theorems is a one-tactic restatement of a definition, a computed Check, or a direct instance of the near-matches supplied by the worker.

| Declaration; README section; Lean line | Variables and instances beyond the common context | Instances and computed values | Result / change |
|---|---|---|---|
| `conjRes`; 1.1; 72 | `A≤G`, group `B`, `β:B→*G`, `g`, `∀b,g⁻¹β(b)g∈A`, `n:ℕ` | `g=1, β=id`: coefficient and group maps both identity. `G=S₃,A=A₃,g=(12),M=𝔽₃,n=1`: generator is sent to its negative, `1↦2`. | Correct direction; retained. |
| `conjCores`; 1.1; 92 | Same as previous row | Identity gives identity; on `H₁(A₃,ℤ)=ℤ/3`, `(12)` gives `1↦2`. With regular coefficients and `g=(123)`, coefficient `e₁↦e_{g⁻¹}`, whereas cohomology gives `e_g`. | Inverse coefficient action is required; retained. |
| `freeGroup_isZero_of_two_le`; 3.6; 112 | `S:Type u`, `M:Rep k (FreeGroup S)`, `n≥2` | `S=∅`: both higher groups zero. `S` singleton, `M=ℤ_sgn`: `H₁=ker(-2)=0`, `H⁰=ker(-2)=0`, `H¹=ℤ/2`, all degrees ≥2 zero. | Bound is meaningful; retained. |
| `coprod_groupHomology_bijective`; 3.6; 120 | Groups `A,B`, `M:Rep k (A∗B)`, `n≥2` | `A=B=C₂`, trivial `ℤ`: degree 2 is `0⊕0→0`; degree 3 is `(ℤ/2)²→(ℤ/2)²` by inclusions. `A=B=ℤ`, both acting by −1: degree 1 gives `0⊕0→ℤ`, not bijective. | Bound is necessary; retained. |
| `nonempty_groupHomology_two_addEquiv_hopf`; 6.8; 136 | `S`, normal `R≤FreeGroup S`; integral trivial coefficients | `F=ℤ,R=mℤ`: intersection with commutator zero, `H₂(C_m,ℤ)=0`. `F=F₂,R=[F,F]`: both sides `ℤ`. `R=1`: both zero. | Correct quotient; retained. |
| `doubleCosetTerm`; 7.1; 148 | Subgroups `H,K`, `[H.FiniteIndex]`, representative `g`, `n` | `S₃,H=K=C₂,n=0,M=ℤ`: identity coset term `1`; other term `2`. `H=G`: only term identity. | Correct source and conjugate intersection; retained. |
| `res_comp_corestriction_eq_finsum`; 7.1; 165 | Same, double-coset quotient `Quotient` indexed sum | Previous example: left multiplication `3`, right `1+2=3`. In positive degrees second term factors through `Hⁿ(1,M)=0`, so both maps are identity on the 2-primary classes. | Finite support follows from finite index; retained. |
| `doubleCosetTermHomology`; 7.1; 176 | Same finite-index hypothesis, `n:ℕ` | Same `S₃` test in degree zero gives summands `1,2`; `K=1` gives coefficient norms using `g⁻¹`, not `g`. | Correct homological direction; retained. |
| `transfer_comp_cores_eq_finsum`; 7.1; 193 | Same | Degree zero `ℤ→ℤ` is multiplication `3=1+2`; `H=G` gives one identity term. Zero module gives zero on both sides. | Retained. |
| `IsStableClass`; 7.2; 203 | Subgroup `P`, `n`, class `z`; no finite-group hypothesis needed for restriction | `G=S₃,P=C₃,n=2,M=ℤ`: equality requires `z=−z` in `ℤ/3`, hence stable set `{0}`. In degree 4 inversion acts `+1`, so all three classes are stable. | Excludes arbitrary classes; retained. |
| `bijOn_res_sylow_isStableClass`; 7.2; 217 | `[Finite G]`, prime `p`, `P:Sylow p G`, `n>0` | `S₃,p=3`: degree 2 source primary part zero, stable part zero; degree 4 both `ℤ/3`. At excluded `n=0`, source primary part of `ℤ` is zero, stable part is `ℤ`. | Positive-degree binder present; retained. |
| `IsHomologyStableClass`; 7.2; 228 | `[Finite G]`, subgroup `P`, `n`, `z`; intersections finite index | `S₃,P=C₃,n=1,M=ℤ`: transfer equality is `z=−z`, stable part zero. For `(C₃)²⋊C₂` with inversion, degree 2 action is determinant `(+1)` on `Λ²P=ℤ/3`, so stable part `ℤ/3`. | Transfer, not inclusion, defines stability; retained. |
| `bijOn_cores_sylow_isHomologyStableClass`; 7.2; 257 | `[Finite G]`, prime `p`, Sylow `P`, `n>0` | `S₃,p=3,n=1`: zero maps bijectively to 3-primary part of `H₁(S₃,ℤ)=ℤ/2`, also zero. Previous semidirect example in degree 2: `ℤ/3→ℤ/3` is an isomorphism. | Corestriction direction agrees; retained. |
| `IsTateStableClass`; 7.2; 274 | `[Fintype G]`, subgroup `P`, `n:ℤ`, class `z` | `P=G`: inner conjugation identity, every class stable. `S₃,P=C₃,M=ℤ_sgn,n=0`: coefficient sign requires `z=−z` in `ℤ/3`, giving zero. | Twisted coefficients matter; retained. |
| `bijOn_tateRes_sylow_isTateStableClass`; 7.2; 316 | `[Fintype G]`, prime `p`, Sylow `P`, all integer degrees | `S₃,p=2,n=0,M=ℤ`: `{0,3}⊂ℤ/6→ℤ/2`, `0↦0,3↦1`, bijective. `G=1`: zero to zero in every degree. | Degree zero is valid for Tate; retained. |
| `tate_duality`; 8.1; 330 | Finite `G`, arbitrary integral `M`, integer `i`; internal Hom to `ℚ/ℤ` | `C₂,M=ℤ,i=0`: `Ĥ⁰(C₂,ℚ/ℤ)=0`, dual of `Ĥ⁻¹(C₂,ℤ)=0` also zero. `i=1`: both `ℤ/2`, evaluation generator `1/2`. | One-sided Hom duality, no finite-generation assumption needed; retained. |
| `tate_duality_of_free`; 8.1; 350 | Finite `G`, `[Module.Free ℤ M]`, `i:ℤ` | `C₃,M=ℤ,i=0`: both `ℤ/3`, pairing multiplication modulo 3. Odd degrees both zero. Dropping freeness with `M=ℤ/2,G=C₂` makes integral dual zero while character dual is `ℤ/2`. | Freeness explicit; retained. |
| `cup_characterConnectingClass_bijective`; 8.4; 366 | Finite `G`, generator `g`, character `χ(g)=1/orderOf(g)` modulo `ℤ`, all `M,n:ℤ` | `C₃`: character value `1/3`, carry cocycle `1` on `(g²,g)`, cup sends generator to generator in the next even degree. `G=1`: `orderOf(1)=1`, character `1 mod ℤ=0`, zero-to-zero map bijective. | No division-by-zero case; retained. |
| `tfae_periodic_cohomology`; 8.5; 380 | `[Fintype G]`; existential positive period and all integral modules | `C₃`: all four conditions true, period 2. `Q₈`: true, period 4; `Ĥ²=(ℤ/2)²`, `Ĥ⁴=ℤ/8`. `C₂²`: all false, mod-2 dimensions `n+1` cannot be periodic. `G=1`: all true, zero class is a periodicity operator on zero groups. | Both directions survive boundary tests; retained. |
| `tfae_primary_periodic_cohomology`; 8.5; 400 | `[Fintype G]`, `[Fact p.Prime]`; restriction to primary components | `A₄,p=3`: cyclic Sylow, period 2; `p=2`: Klein four Sylow, no period. `C₂,p=3`: primary cohomology zero and Sylow trivial, both conditions true. | No extra `p∣\|G\|` needed for this existence theorem; retained. |

### README targets and conventions

This table covers all 41 numbered target sections, splitting the five bold subtargets of §§4.7 and 6.7 into individual rows. Equations involving negative degrees use zero ordinary (co)homology, not natural-number subtraction. All coefficient-zero and zero-ring specializations of these constructions have zero chain groups and zero homology; a linear isomorphism between those zero objects remains an isomorphism. Geometric conditions about schemes, DVRs, inseparability, fans and residue fields have no operands here. Finite-index, finite-group, prime, projectivity, flatness and degree restrictions were tested where the relevant targets introduce them.

| Target / convention | Instances and computed values on the compared sides | Result / change |
|---|---|---|
| 1.1 conjugation; inner triviality | `S₃,A₃,(12)` acts `−1` on `H¹(A₃,𝔽₃)` and `H₁(A₃,ℤ)`; conjugation by an element of `A₃` acts `+1`. For regular coefficients `g=(123)`, cohomology coefficient is `g`, homology coefficient is `g⁻¹`. Identity gives identity. | Signs and compatible pairs agree with the definitions. |
| 1.2 quotient action | `S₃/A₃=C₂` acts by inversion on `H²(C₃,ℤ)=ℤ/3`, giving `1↦2`, but acts by `+1` on degree 4. Replacing lift by an element of its `A₃` coset changes action by inner identity. `N=G` gives trivial quotient action. | Descent uses 1.1; no ambient commutativity assumed. |
| 1.3 additivity | `G=C₂`, copies of trivial `ℤ`: `H₁(G,⊕ℤ)=⊕ℤ/2`; `H²(G,∏ℤ)=∏ℤ/2`. Empty index gives zero on both sides. For infinite-rank free abelian `G`, its identity map has infinite rank, so it cannot lie in the finite-support sum of coordinate homomorphisms. | Direct sum/product asymmetry necessary. |
| 1.4 permutation modules | `G=S₃,H=A₃,k=ℤ`: `H₁(G,ℤ[G/H])=ℤ/3=H₁(H,ℤ)`. Twisting by the sign of a `C₂` stabilizer gives `H₀=ℤ/2`, versus `ℤ` without the twist. `H=1` gives higher homology zero. | Twists and dual coinduction retained. |
| 1.5 discrete comparison | Discrete `ℤ`, trivial `ℤ`: continuous and abstract `H¹=Hom(ℤ,ℤ)=ℤ`; discrete `C₂`, `𝔽₂`: both `H²=𝔽₂`. Compact `∏ℕC_p` instead has continuous `H¹=⊕ℕ𝔽_p`, while abstract dual has strictly larger cardinality. | Discrete-topology hypothesis excludes the false extension. |
| 2.1 hyperhomology and hypercohomology | `S₃`, augmentation complex `ℤ[S₃/A₃]→ℤ`: `H₀=0,H₁=ℤ/2`; naive coinvariants give `H₁=0`. `C₂`, trivial cochain `ℤ`: hypercohomology in degrees 0,1,2 is `ℤ,0,ℤ/2`. | Definitions sound; add the missing cohomological Checks, R02. |
| 2.2 exact sequences | `0→ℤ —2→ℤ→𝔽₂→0`, `G=C₂`: connecting `H₁(C₂,𝔽₂)→H₀(C₂,ℤ)` is zero, preceding `H₁(C₂,ℤ)→H₁(C₂,𝔽₂)` is an isomorphism; in cohomology the Bockstein `H¹(𝔽₂)→H²(ℤ)` is an isomorphism `𝔽₂→ℤ/2`. | Homological/cohomological directions differ correctly. |
| 2.3 two spectral sequences | Complex concentrated in degree 0 gives a single row and ordinary `H_n(G,M)` or `Hⁿ(G,M)`. The preceding augmentation complex has internal homology `ℤ_sgn` in degree 1, so total degree 1 is `H₀(S₃,ℤ_sgn)=ℤ/2`, whereas termwise coinvariants would lose it. | Convergence first-quadrant; no unbounded-totalization claim. |
| 3.1 equivariant theories | Exact `ℤ/2→ℤ/4→ℤ/2` tensored over `ℤ/4` with `ℤ/2` has nonzero top homology `ℤ/2`, refuting omission of flatness. For the trivial group a free resolution of `ℤ[1/2]` gives nonzero `Ext¹(ℤ[1/2],ℤ)`, whereas `Hom(ℤ[1/2],ℤ)=0`; flatness alone does not justify the cohomological comparison. | Separate flat/projective hypotheses correct. |
| 3.2 orbit spectral sequence | Circle with free `C₂` rotation gives quotient-circle homology `ℤ` in degrees 0,1 and zero above. Reflection has two fixed vertices: stabilizer contributions in odd high rows are `(ℤ/2)²`; dropping stabilizers would give zero. Reversing an edge contributes orientation `−1`. | Stabilizers and orientation characters essential. |
| 3.3 free complexes | Free `G`-set in degree 0 has higher stabilizer homology zero. Free contractible line for `ℤ` gives `H₀=ℤ,H₁=ℤ`, agreeing with its circle quotient. A point with nontrivial stabilizer `C₂` has `H₁=ℤ/2`, contradicting a free-action conclusion. | Freeness hypothesis discriminates. |
| 3.4 tree complex | One vertex: `0→0→k —id→k→0`. Infinite line: boundary of edge `(v₀,v₁)` is `v₁−v₀`, augmentation zero; using `v₁+v₀` gives augmentation `2`. A loop has nonzero first homology and is not a tree. | Orientation, augmentation and tree restriction correct. |
| 3.5 tree sequences | `ℤ` on its line: after trivial coinvariants edge map `t−1=0`; kernel and cokernel both `ℤ`. Wrong `t+1` gives multiplication 2 and cokernel `ℤ/2`. One fixed vertex gives identity from stabilizer homology to group homology. | Connecting direction and signs agree. |
| 3.6 amalgams, HNN, free groups | `C₄*_{C₂}C₆`: degree-one edge map `1↦(-2,3)`, cokernel `ℤ/12`. `BS(1,2)` has edge map `1−2=−1`, hence extra cokernel zero and abelianization `ℤ`; replacing subtraction by addition produces spurious `ℤ/3`. Free rank zero and one tested in Lean table. | HNN convention agrees with pinned conjugation relation. |
| 4.1 cup formula | `C₂,𝔽₂`: degree-one generator squared evaluates `1` on `(g,g)`. On `ℤ²`, `⟨x∪y,[a\|b]−[b\|a]⟩=1`, reverse order gives `−1`. Nontrivial coefficients require the prefix action; without it differential leaves a term `2(t−1)` over integral regular coefficients. | Correct action and Koszul sign. |
| 4.2 connecting rules | Bockstein for `0→ℤ —2→ℤ→𝔽₂→0` sends the degree-one generator to the degree-two generator. The right-factor connecting formula contributes `(-1)^p`, thus `−1` for `p=1`. Tensoring that sequence with `𝔽₂` makes the first map zero, so an omitted tensor-exactness assumption would fail. | Exactness hypotheses and signs present. |
| 4.3 identities | Torus generators satisfy `xy=−yx`, with evaluations `1,−1`; in characteristic 2 the same sign becomes `+1`, while `x²≠0` on `C₂`. Degree-zero unit multiplies by 1; zero coefficient pairing produces zero. | Graded commutativity does not falsely force odd squares to vanish. |
| 4.4 diagonals | On a vertex, Alexander–Whitney sends `v` to `v⊗v`, preserving augmentation `1`. On an edge, its `(0,1)` and `(1,0)` faces have total degree 1; the naive diagonal into bidegree `(1,1)` has total degree 2. Swapping faces induces sign `−1` on the two degree-one torus factors. | Chain degree and homotopy comparison coherent. |
| 4.5 projection formula | `H=1≤C₂`: corestriction in degree zero is norm `1+g`, multiplication by 2 on trivial `ℤ`; both sides with scalar `a` are `2a`. Positive cohomology of `1` vanishes, so norm classes multiply to zero in positive Tate degrees. | Finite index explicit. |
| 4.6 cap and evaluation | Back-face cap on torus fundamental cycle with `x∪y` gives `+1∈H₀`. In degree `(n,q)=(2,1)`, exchanging front/back conventions contributes `(-1)^{1·1}=−1`. Evaluation of a boundary by a cocycle is zero because `φd=0`. | Adjunction uses the chosen cap; pinned Kronecker already exists (R01). |
| 4.7(a), bold Tate comparison | `C₂,𝔽₂,p=q=1`: ordinary and Tate cups both give nonzero generator in degree 2. For degree zero with trivial `ℤ`, ordinary `H⁰=ℤ`, Tate `Ĥ⁰=ℤ/2`; comparison must use quotient. | Positive-degree hypothesis and degree-zero warning correct. |
| 4.7(b), bold discrete comparison | Discrete `ℤ²`, integral torus classes: both products evaluate `1` on `[a\|b]−[b\|a]`. Trivial group: degree-zero multiplication agrees, positive groups zero. | Same cochains under continuity-forgetting. |
| 4.7(c), bold profinite comparison | `∏ℕC_p`, trivial `𝔽_p`: degree-one continuous classes have finite support; finite-level cup products use the union of their finite supports. Abstract dual contains infinite-support linear functionals absent from this colimit. | Compares finite-level continuous cup, not all abstract classes. |
| 5.1 homological Künneth | `C₂×C₂,ℤ`: degree 2 tensor part `ℤ/2`, Tor part zero; degree 3 tensor part `(ℤ/2)²`, Tor part `ℤ/2`, total `(ℤ/2)³`. Over `𝔽_p`, degree `n` dimension is `n+1`. `G=H=1,M=N=ℤ/2`: actual `H₁=0`, predicted Tor without flatness `ℤ/2`. | One flat factor necessary; declared flat Künneth gap retained. |
| 5.2 universal coefficients | `C₂, A=𝔽₂,k=ℤ`: `H¹=Hom(ℤ/2,𝔽₂)=𝔽₂`; `H²=Ext¹(ℤ/2,𝔽₂)=𝔽₂`. For `G=ℤ,A=ℤ`, `H¹=ℤ` but `Ext¹(H₀,ℤ)=0`. Field coefficients kill Ext/Tor. | Mathematics correct; cohomological acceptance signature missing (R01). |
| 5.3 cohomological Künneth | Two infinite-dimensional degree-one spaces admit the infinite identity bilinear matrix, which has infinite rank; a finite sum of pure tensors has finite rank. With one finite-dimensional factor, every matrix has finite rank and the tensor-to-dual map is onto. For two cyclic groups over `𝔽_p`, degree `n` dimension `n+1` on both sides. | Finiteness on one factor through degree `n` is sufficient and cannot be omitted indiscriminately. |
| 5.4 Pontryagin/exterior algebra | `ℤ^r`: ranks `1,r,binomial(r,2)` in degrees 0,1,2. `C₂,ℤ`: `Λ³=0` but `H₃=ℤ/2`; claim correctly stops at degree 2 without torsion-free/rational hypotheses. `ℚ`: `H₁=ℚ,H₂=0`. `C₃²`: ordered wedge evaluates `1∈ℤ/3`, reverse `2`. | Existing integral exterior-square owner is imported; higher comparisons stay here. |
| 6.1 filtration | `N=1`: in degree `n`, `A_j=C̄ⁿ` for `j≤n` and zero for `j>n`; `N=G`: positive quotient filtration pieces vanish. `C₄→C₂`: a degree-one carry-detecting cochain has differential on `(1,1)` equal to 1 modulo 2, so requiring quotient dependence is stricter than merely vanishing on kernel arguments. | `A*` and `A` distinguished on the stated range; complete the boundary terms as in R03. |
| 6.2 cohomological HS | `N=1`: only `q=0`, abutment `Hᵖ(G,M)`; `N=G`: only `p=0`. `C₂⊂C₄`, `𝔽₂`: `d₂(y)=x²`, hence `E₃=𝔽₂[x,y²]/(x²)`, one class in each total degree. `S₃,C₃,𝔽₃`: quotient invariants are one-dimensional in degrees `0,3 mod4`, zero in degrees `1,2 mod4`. | Filtration indexing and page shift agree with source convention. |
| 6.3 homological HS | `C₂⊂C₄`, integral coefficients: five-term portion has `H₂(C₂,ℤ)=0`, `H₀(C₂,H₁(C₂,ℤ))=ℤ/2`, and `H₁(C₄,ℤ)=ℤ/4`; kernel of quotient `ℤ/4→ℤ/2` is `ℤ/2`. `N=1` leaves row zero only. | Coinvariant action and edge directions correct. |
| 6.4 edges | `C₄→C₂`, mod-2 cohomology: inflation in degree 1 is isomorphism, in degree 2 zero because inflated cocycle is differential of the carry function; restriction in degree 1 to kernel is zero. Homological quotient map in degree 1 is reduction `ℤ/4→ℤ/2`. | Edges are not claimed to be isomorphisms universally. |
| 6.5 multiplicativity | Bidegrees `(p,q)=(1,0)` and `(p′,q′)=(0,1)` give sign `−1`; reversing gives `+1`. For a split product of two infinite cyclic groups their degree-one generators anticommute and evaluate `±1` on the torus. Over `𝔽₂` both signs become 1. | `(-1)^{p q′}` matches the stated order of kernel and quotient slots. |
| 6.6 transgression | `C₃⊂C₉`: chosen lifts give carry `+1`, coboundary extension at `(2,1)` gives `−1=2∈𝔽₃`; hence `d₂=−c`. `C₉⊂C₂₇`, scalarization still gives carry 1 modulo 3. `C₄⊂Q₈`, quotient `C₂`: lift square is `2∈C₄`, tensor with `𝔽₂` gives zero, so corresponding `d₂=0`. | Minus sign and `N^ab⊗k`, rather than unscalarized extension class, both necessary. |
| 6.7 degree-m bold target | `N=1,m=2`: restriction target in positive degree is zero; inflation is identity, transgression zero. `N=C₃,Q=1`: inflation domain zero, restriction identity, following transgression zero. Nonvanishing `H¹(C₂,𝔽₂)=𝔽₂` excludes applying the `m=2` hypothesis to `C₂⊂C₄`. | Quantified vanishing range correct. |
| 6.7 homological five-term bold target | `C₂⊂C₄,ℤ`: `0→0→ℤ/2→ℤ/4→ℤ/2→0`, middle map `1↦2`, final reduction; images equal kernels. `N=1` collapses to identity on `H₁`. | Declared homological low-degree supplier gap is precise. |
| 6.8 Hopf formula | `F=ℤ,R=mℤ`: numerator `R∩[F,F]=0`, quotient zero, matching `H₂(C_m,ℤ)=0`; omitting intersection would give `mℤ≠0`. For `ℤ²`, ordered torus cycle maps to inverse commutator with the chosen homological differential. | Quotient and sign correct; Lean states existence only and says so. |
| 6.9 finite/profinite comparison | Finite `C₉` with discrete topology has every cochain continuous; for `C₃⊂C₉`, both transgressions send 1 to `−1∈𝔽₃`. `N=1` gives identity inflation in both theories. | No infinite-group extension claimed. |
| 7.1 double cosets | `S₃,H=K=C₂`: degree-zero index 3 equals summands `1+2`. Positive degrees second term factors through trivial-group homology and vanishes. `K=1` gives norm formula; `H=G` leaves one coset. | Nonabelian test and normalizing inverses agree with Lean table. |
| 7.2 stable elements | `S₃,P=C₃`: cohomological stable `H²=0,H⁴=ℤ/3`; homological stable `H₁=0`. Tate degree zero at `p=2` maps `{0,3}⊂ℤ/6` onto `ℤ/2`. For `ℤ_sgn` on `S₃`, normalizer has nontrivial coefficient sign, so even an abelian Sylow does not permit ignoring coefficient action. | Ordinary degree-zero excluded; twisted normalizer clause qualified. |
| 8.1 duality | `C₂,ℤ`: character dual has `Ĥ⁰=0,Ĥ¹=ℤ/2`, matching duals of `Ĥ⁻¹=0,Ĥ⁻²=ℤ/2`. `C₃` free integral coefficients: even groups `ℤ/3`, odd zero. Integral dual of `ℤ/2` is zero, character dual `ℤ/2`, showing why freeness is needed. | No hidden finite-generation assumption in the one-sided duality. |
| 8.2 finite p-groups | `C_p` satisfies cyclicity; `Q₈` has cyclic abelian subgroups but is not cyclic; `C₂²` itself is noncyclic abelian. Composite `p=21`, `C₇⋊C₃`: every element killed by a power of 21 but group is noncyclic and all proper abelian subgroups cyclic. | Explicit prime hypothesis excludes the composite-p counterexample. |
| 8.3 CT resolutions | `0→ℤ_sgn→ℤ[C₂]→ℤ→0`: twisted shift is 1, double untwisted shift 2; ordinary integral Tate pattern is even `ℤ/2`, odd zero, so untwisted period 1 would be false. For a zero module all Tate groups zero. | Orientation character and doubled period correct. |
| 8.4 periods | `C₃`: least period 2; `Q₈`: least period 4, with `Ĥ²=(ℤ/2)²`, `Ĥ⁴=ℤ/8`. `S₃`: 3-period 4 and 2-period 2, global period 4. Cyclic generator character `1/m` gives carry 1 and cup isomorphism; `m=1` gives zero-to-zero. | Least-period convention explicit; supplier Swan/quaternion results imported. |
| 8.5 periodicity equivalences | `C_p`: cyclic abelian subgroups, periodicity 2. `C_p²`: grows in mod-p degree `n` with dimension `n+1`, so no periodicity. `Q₈`: period 4 but noncyclic Sylow allowed. `C₂,p=3`: primary components zero and trivial Sylow, so primary equivalence true despite `3∤2`. | Both directions and trivial-group boundary agree with Lean. |

### Headline coverage and ownership

The README's end targets are the tree and Mayer–Vietoris sequences (§§3.5–3.6), cup/cap comparisons (§4.7), Künneth and universal coefficients (§§5.1–5.3), Hochschild–Serre with edges, products, transgression and low-degree exactness (§§6.2–6.7), Hopf (§6.8), double cosets (§7.1), stable elements (§7.2), Tate duality (§8.1), and periodicity (§§8.3–8.5). The thirteen Lean theorems cover the free-group/free-product, Hopf, double-coset, stable-element, duality, cyclic-cup and periodicity targets. Its seven definitions are used by those theorems. The module docstring names the omitted families and their intended missing constructions. R01 concerns a construction already available at the pin; the missing positive-degree quotient representations and the filtered extension complex remain substantial constructions.

Ownership searches used the supplied open-head index, `roadmaps grep` by mathematical object, and the relevant main and open files. The searches included group hyperhomology, Hopf's formula, the Pontryagin product, stable elements, and Tate duality, followed by inspection of the hits. A separate Lean-name search found no occurrence of this namespace or the selected distinctive headline names on main or the open roadmap heads. The integral exterior-square theorem removed in the last repair remains absent. No new same-object owner was found for this package's arbitrary-group coefficient refinements. The already-owned cases are cited rather than used to justify a second plan: integral hyperhomology, low-degree/continuous cohomology, torus homology, perfect-group Hopf, abelian integral H₂, and finite-group Swan/quaternion period computations.

Fourteen supplier contract blocks were checked; references below identify the versions used. Repeated references to the same section are consolidated, not counted as independent supplier checks.

| Supplier and section(s) | Evidence / contract comparison |
|---|---|
| DerivedModuleAlgebra §S.1 | Main `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955–1035`: double-complex convergence and cohomological edges; homological low-degree edge sequence remains the declared gap. |
| SpectralSequencesAndConvergencePartII §§4.3,5.2 | Open head `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md:1726–1795,1894–1917`: derived bounded-above Künneth, flat representative, two-column sequence, and filtered pairings. Sequence naturality remains the declared contract. |
| ProfiniteCohomology §§3.1,3.2,5.5,6.4,10.1,10.5; Layer 12 | Main `TauCetiRoadmap/ProfiniteCohomology/README.md:1140,1154,1571,1770,2622,2763,3519`: discrete comparison stops at degrees 0–2; all-degree continuous operations have their stated topology hypotheses. Finite specializations used here satisfy them. |
| ClassFieldTheory §0.1 | Main `TauCetiRoadmap/ClassFieldTheory/README.md:778–811`: Tate carriers, operations, Tate–Nakayama and Nakayama–Rim; projectivity/freeness conditions retained. |
| FreeGroupsAndLimitGroups §§2.2,4.1–4.2,4.5–4.8 | Main `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863–952`: trees without inversion, group comparisons, stabilizers and quotient. The homological tree sequences are not claimed there. |
| AlgebraicTopology §§5.3–5.4 | Main `TauCetiRoadmap/AlgebraicTopology/README.md:1945–2018`: surjective regular cover, constant coefficients, deck action; torus exterior algebra. Package comparisons preserve these restrictions. |
| StableHomotopyKTheory §3.29 | Main `TauCetiRoadmap/StableHomotopyKTheory/README.md:1336–1354`: perfect-group kernel–H₂ comparison and presentation naturality, no specified connecting sign. |
| K2SymbolsBrauer §1.1 | Current head `TauCetiRoadmap/K2SymbolsBrauer/README.md:107–130`: positive lifted boundary and inverse commutator. General Hopf existence and bijectivity remain outside this supplier's refinement. |
| SchemeKTheoryOperations §6.7 | Current head `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2548–2556`: integral nonnegative hyperhomology; arbitrary-coefficient directed-union homology. The package's arbitrary-ring and cohomological additions are broader. |
| K3BlochGroups §§4.1,5.2 | Open head `TauCetiRoadmap/K3BlochGroups/README.md:1189–1209,1855–1874`: bounded-below adapter and its signs; localized stable elements, positive-degree finite duality, quaternion class and Swan. Least-period interpretation is explicitly spelled out by this package. |
| ArithmeticGaloisDuality §D7.2 | Current head `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5014–5064`: finite-group UCT and Sylow detection; package uses comparison only, not infinite-group deductions from that finite statement. |
| InductionRestrictionPartII RS.0.3,RS.6.8 | Current head `TauCetiRoadmap/InductionRestrictionPartII/README.md:423–460,1640–1664`: Hall coinvariants and exterior square for every abelian group, not merely finite groups. Inversion acts +1 on Λ², agreeing with the package. |
| MappingClassGroupsAndCanonicalRepresentations §1.1 | Open head `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:847–900`: discrete-extension spectral sequence, specified lift, transgression and five-term exactness. The package identifies its filtered model with this supplied theory. |
| IntegralIwasawaTheoryPartII §0.7 | Open head `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:271–305`: cap evaluation and arbitrary-ring flat-module homology vanishing/coinflation, with the required normal subgroup. |

The two gap slugs occur in both README supplier contracts and `design/plan.json`'s top-level `gaps`. Both have named suppliers and precise hypotheses. They are treated as contracts, not missing-ownership findings. Neither introduces an upward edge. The required dependency command returned:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

The supplied overlap report has no second copy, shared change or dropped cited id. The closest subjects were compared by ownership as above. `git diff --stat origin/main...HEAD` reports 12 changed files, all inside `packages/CohomologyOfGroups`, with 4055 insertions and 7 deletions. The checked head is `a528360e`. The acceptance file has one `import Mathlib`, eight individual Tau Ceti imports, no `set_option`, no sorry-valued data and no admitted examples. No computational algorithm or process narrative was found in the README or declaration docstrings.

### Source verification and independence

The following 33 locator groups were compared with the legal cached texts. A group combines repeated citations of the same result or a result and its immediately adjoining proof; this count is distinct from citation occurrences. Formulas and mathematically forced terminology are not treated as copied expression. No distinctive prose reproduction was found in these comparisons.

| # | Source locator and cached line(s) | Comparison with package |
|---|---|---|
| 1 | HS53 Ch. I §2 Prop. 1, p.111; line 83 | Resolution independence; extension from free integral resolutions to arbitrary-ring projective resolutions has a pinned comparison route. |
| 2 | HS53 Ch. I §2, pp.112–113; line 129 | Homogeneous/inhomogeneous dictionary; discrete continuity comparison is separately constructed. |
| 3 | HS53 Ch. I §2 corollary to Prop. 2, p.113; line 154 | Inner conjugation identity, including coefficient action. |
| 4 | HS53 Ch. I §4 Prop. 4, p.114; lines 201,214 | Cochain bicomplex and vanishing comparison; package marks the homological transcription. |
| 5 | HS53 Ch. I §5, pp.115–116; lines 236,246,273,283 | Both filtrations and acyclic-row comparison. |
| 6 | HS53 Ch. I §7 Prop. 7 and closing remark, pp.117–118; lines 341,345,355 | Quotient action, extension sequence and homological analogue. |
| 7 | HS53 Ch. II §1, pp.118–119; lines 368,379,389 | Normalization, first filtration and cup convention. |
| 8 | HS53 Ch. II §1 Prop. 1/Lemma 1, pp.119–121; lines 401,409,419 | Second filtration and E₁ comparison; source includes boundary values omitted here (R03). |
| 9 | HS53 Ch. II §2 Thm. 1, p.121; lines 476,489 | E₁ identification by restriction of the first kernel arguments. |
| 10 | HS53 Ch. II §3 and §5 Prop. 3, pp.122–125; lines 556,583,658 | Shuffle correction when a representative is not in the second filtration. |
| 11 | HS53 Ch. II §4 Thm. 2, p.125; line 654 | Differential sign `(-1)^q`. |
| 12 | HS53 Ch. II §5 Thm. 3 and following remark, p.126; lines 686–700 | E₂ product sign and coefficient pairing. |
| 13 | HS53 Ch. III §1, pp.126–127; lines 705–719 | Edge maps and filtration quotients. |
| 14 | HS53 Ch. III §3 Prop. 1 and following paragraph, pp.128–129; lines 787–824 | Transgressive subgroup, quotient target, spectral differential. |
| 15 | HS53 Ch. III §4 Thm. 2 and following remark, pp.129–130; lines 825,854 | Vanishing range and degree-m exactness, then degree-one five terms. |
| 16 | HS53 Ch. III §6 Thm. 4, p.133; lines 984–990 | Minus extension-class cup product; package explicitly scalarizes coefficients. |
| 17 | Loh19 Thms. 1.5.1 and 3.2.18, pp.30,129–131; lines 1460,5568 | Hopf quotient and five-term proof; does not itself fix the package's selected Hopf map. |
| 18 | Loh19 Prop. 1.6.11 and Remark 1.6.12, pp.48–49; lines 2205,2215 | Alternating norm and `t−1` cyclic resolution and its splice. |
| 19 | Loh19 Cor. 1.6.18,1.6.19 and Outlook 1.6.20, pp.53–54; lines 2399–2455 | Odd-prime classification; quaternion branch is identified as an outlook, with Brown additionally cited. |
| 20 | Loh19 Thm. 3.2.12, Prop. 3.2.13, Remark 3.2.14, pp.123–124; lines 5306–5399 | Both HS theories, conjugation and naturality. |
| 21 | Loh19 Cor. 3.2.20, pp.133–134; lines 5762–5833 | PID free-complex UCT, naturality, nonnatural splitting; package does not attribute its full hereditary-ring generality to this source. |
| 22 | Loh19 Cor. 3.2.21, p.135; lines 5841–5851 | Integral group-homology decomposition. |
| 23 | Loh19 Thm. 3.2.22, pp.135–136; lines 5854–5874 | One flat complex suffices over a PID; extension here has its own supplier route. |
| 24 | Loh19 Cor. 3.2.23, p.136; lines 5877–5925 | Tensor resolution for a product group; source's repeated second `G` is a misprint, not copied by the package. |
| 25 | Loh19 Example 3.2.25, pp.137–138; lines 5960–5980 | Mod-p product dimensions; package's `n+1` is correct, unlike the final displayed exponent in the extraction. |
| 26 | Loh19 Outlooks 3.2.26 and 3.2.28, pp.138–139; lines 5985–5994,6019–6032 | Cohomological results are pointers, not proved there; cup sign convention differs and is explicitly tested in §4.2. |
| 27 | Loh19 Thm. 4.3.7 and §4.3.2, pp.165–168; lines 7012–7128 | Splicing sphere chains into a periodic resolution; obstruction from growing mod-p dimensions. |
| 28 | MilneCFT Ch. II Prop. 1.30, Cor. 1.33, pp.70–71; lines 3300–3370 | Restriction/corestriction and primary detection. |
| 29 | MilneCFT Ch. II Props. 1.38–1.39, pp.73–74; lines 3459–3515 | Cup uniqueness, connecting signs, identities and projection formula. |
| 30 | MilneCFT Ch. II Prop. 3.4 and Remark 3.5, p.81; lines 3793–3822 | Cyclic periodicity and cup with the character class. |
| 31 | SerreArbres II §2.8, Prop. 13, Remark 1 and example, pp.168–169; lines 5123–5200 | Permutation decomposition, tree chains and amalgam sequence. |
| 32 | Hutchinson13 §3, pp.11–12; lines 482–504 | Homological stable elements and Swan periods. The package supplies the least-period convention omitted from the informal introduction. |
| 33 | Hutchinson13 Cor. 3.3, p.12; lines 511–520 | Four-periodicity away from the defining odd characteristic; source proof has a modulus misprint, package Check does not. |

Five additional expression comparisons, distinct from theorem statements: the conjugation explanation in §1.1 against HS53 line 154; the hypercochain construction in §2.1 against HS53 line 201; the tree proof plan in §3.4 against SerreArbres line 5145; the Künneth proof route in §5.1 against Loh19 line 5889; and the cyclic-cup docstring in `Suggested.lean:361` against MilneCFT line 3813. No distinctive sentence or clause-by-clause paraphrase was found. No source table, figure, exercise list or numerical dataset is reproduced.

Counting each source-key occurrence before the bibliography, including a repeated key introducing a line locator, gives 115 citation references: HS53 42, Loh19 27, MilneCFT 11, SerreArbres 4, Hutchinson13 12, Brown82 14, CE56 3, SwanPPeriod60 2. This convention is stated to avoid conflating unique locator groups with repeated citations.

HS53 has no separate contents page in the cached article; its introduction and numbered chapter/section headings supply its contents (HS53 lines 22–42,49,367,701). They were compared with the eight roadmap layers. There is no one-to-one consecutive mapping: HS53 I §§2,4,5 feed several of Layers 1–3; II §1 feeds both Layers 4 and 6; II §§2–5 and III §§1,3,4,6 feed different parts of Layer 6. Trees, general products, stable elements and periodicity have scopes not supplied by those chapters. The local order in Layer 6 is forced by the explicit edges 6.1→6.2→6.4/6.5→6.6→6.7; Layer 5 puts universal coefficients before the cohomological product that uses them. No source-arrangement finding results.

## Not verifiable

- Brown82 and CE56 remain settled `uncertified`; their full statements, proofs and wording were not inspected. SwanPPeriod60 remains settled `waived`; the accessible Hutchinson13 statement was checked, but Swan's original proof was not. No new reference request was made.
- No Lean elaboration or build was run, as required by the read-only brief. All 20 supplied elaborated signatures were compared with the source and README. Proposed R01 additions have not been elaborated; their native carriers and transport maps were inspected at the pins.
- The source errata below are based on the supplied line-numbered PDF text. Visual confirmation of the original page images was unavailable locally. The package's formulas were recomputed independently.
- Object searches cannot certify that no differently phrased theorem exists anywhere in all 238 sibling checkouts. The named suppliers, closest-overlap subjects, and returned ownership hits were inspected; no unexamined search hit is used as a finding.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p.12, Hutchinson13 line 518: the source says the nonzero homology degrees are congruent to 3 modulo 3; it should be congruent to 3 modulo 4; affects nothing.
- **Misprint** in Loh19 at Corollary 3.2.23 proof, printed p.136, Loh19 lines 5903,5908: the source says the tensor resolution has two factors belonging to G; it should be the resolution of G tensored with the resolution of H; affects nothing.
- **Misprint** in Loh19 at Example 3.2.24, printed p.137, Loh19 lines 5954–5955: the source says the integral homology of ℤ² vanishes in degrees at least 2; it should be degrees at least 3, with H₂ equal to ℤ; affects nothing.
- **Misprint** in Loh19 at Example 3.2.25, printed p.138, Loh19 line 5976: the source says the calculation uses integral coefficients on its left-hand side; it should be coefficients 𝔽_p, as in the preceding display; affects nothing.
- **Misprint** in Loh19 at Example 3.2.25, printed p.138, Loh19 line 5980: the source says the degree-n mod-p homology of C_p×C_p has dimension n; it should be dimension n+1, from the summands indexed 0 through n; affects nothing.

Source independence: 33 locator-group comparisons and 5 additional prose passages, with 5 readable sources; no distinctive shared expression found. Largest share HS53, 42 of 115 source-key citation references; contents compared with HS53: independent. Brown82 and CE56 wording remains uncertified; SwanPPeriod60 is waived.

## For the human reviewers

- Brown82 and CE56 are settled uncertified, and SwanPPeriod60 is waived in `packages/CohomologyOfGroups/sources.toml`; this pass does not assess their wording or licensing. The largest-share source, HS53, was readable and its contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a528360e18dd3af043951b8b7a7579b3c43ef777", "job": "RT-CohomologyOfGroups~1a", "model": "gpt-6-astra", "worker": "chris-8"} -->
