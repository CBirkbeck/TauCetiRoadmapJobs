<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12942#issuecomment-6794818282 -->
Red team round 1 pass a (codex) of dddd8d6

Verdict: needs_changes

1. **F01** (P1) Divisibility reverses the stated multiplicative valuation inequality

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:670`: “then `v(x_n) ≤ v(y_n)`”.

   **Claim:** Divisibility of sharps gives that inequality in the proof of Q6.3.

   **Witness:** In `V = 𝒪_C`, take compatible sequences `x_n = 1`, `y_n = p^{1/pⁿ}`. Then `x♯ ∣ y♯`, but `v(x_0)=1 > v(y_0)=|p|`.

   **Exact repair:** Replace “`v(x_n) ≤ v(y_n)`” by “`v(y_n) ≤ v(x_n)` (multiplicative valuations), hence `y_n/x_n ∈ V`”. On the witness this reads `|p| ≤ 1` and gives `z_n=p^{1/pⁿ}` as required.

2. **F02** (P3) A torsion-transfer Check violates adic separatedness

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:503`: “for `ϖ = (p^{1/p}, 1)` both sides are 0”.

   **Claim:** This is a Check of Q5.4(2), which requires `ϖ`-adic completeness including separatedness.

   **Witness:** In `A=𝒪_C × 𝔽̄_p`, every ideal `ϖⁿA` contains `0 × 𝔽̄_p`; their intersection is nonzero. The completion is `𝒪_C`, not `A`.

   **Exact repair:** Replace that final clause by “The alternative `ϖ=(p^{1/p},1)` is inadmissible: `⋂ₙϖⁿA=0×𝔽̄_p`, so `A` is not `ϖ`-adically separated.” Retain the admissible `(p^{1/p},0)` Check, where both torsion modules are `0×𝔽̄_p`.

3. **F03** (P2) The localization proof's exact sequence fails at the explicitly allowed zero parameter

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:721`: “`0 → V_𝔮/V → V/aⁿ → V_𝔮/aⁿ → V_𝔮/V → 0`”.

   **Claim:** This sequence is exact for the parameters of Q6.5, which explicitly allow `a=0`.

   **Witness:** Set `V=ℤ_p`, `𝔮=0`, `a=0`, `n=1`. It would inject the nonzero torsion module `ℚ_p/ℤ_p` into the torsion-free module `ℤ_p`. No such injection exists.

   **Exact repair:** Begin the proof: “For `a=0`, both rings are automatically complete for the zero ideal. Hence assume `a≠0` before using the displayed exact sequences. For the separate valuation-topology assertion, `𝔮=0` gives the fraction field with its trivial valuation and is treated separately.” With `a≠0` multiplication by `aⁿ` is injective on the valuation domain, and the snake-lemma sequence is valid. The original `a=0` conclusion remains true.

4. **F04** (P1) Existence of a Cohen-ring Frobenius lift has no supplier contract

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1486`: “Choose a Cohen ring `W` for `k` with a Frobenius lift `φ_W`”. Also Q10.4, lines 1549–1552.

   **Claim:** The prismatic cover construction can make this choice for arbitrary, possibly imperfect, `k` using the listed inputs.

   **Witness:** `TauCetiRoadmap/PerfectoidSpaces/README.md:17416`–17428 supplies `CohenDVR` and its existence, explicitly leaving additional lifting properties separate. No Frobenius-lift existence appears there. BS22 line 1304 makes the choice but is not a formal supplier.

   **Exact repair:** Add to the PerfectoidSpaces supplier contract: “What PerfectoidSpaces must provide (gap:cohen-frobenius-lift): For every prime `p` and field `k` of characteristic `p`, the Cohen DVR used in P7.16a's regular presentations admits a continuous unital endomorphism `φ_W` whose reduction, under its specified residue isomorphism, is `x ↦ x^p`.” Add the identical slug and needs sentence to the plan's top-level gaps with supplier `PerfectoidSpaces`, section `P7.16a`, and cite it in Q10.2 and Q10.4. Do not substitute Witt vectors of an imperfect field. The contract covers `k=𝔽_p(t)`, where a lift must send the residue of `t` to `t^p`, and also infinite p-bases. The current listed inputs do not assert this existence; the generality must be retained.

5. **F05** (P2) The cover inside the completed absolute integral closure is absent from the acceptance test

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1557`–1559; `packages/PerfectoidQuotientsPartII/Suggested.lean:266`–280.

   **Claim:** Q10.4 constructs a faithfully flat integral perfectoid cover with an injective `R`-algebra map into `(R⁺)^∧`. It is the substantive new bridge from Q10.2 to the unconditional Q10.6.

   **Witness:** `exists_faithfullyFlat_isIntegralPerfectoid` concludes only that a cover exists. `tor_map_mul_root_eq_zero_of_cover` assumes its map. No declaration concludes existence of the map, although that exact target type occurs at Lean lines 285–288.

   **Exact repair:** Add a headline theorem `exists_faithfullyFlat_isIntegralPerfectoid_in_absoluteIntegralClosureCompletion` with the `R`, completeness, mixed-characteristic and F-finite hypotheses of `tor_map_mul_root_eq_zero`. Conclude existence of a ring `R'` in `Type u`, an `R`-algebra structure, `Module.FaithfullyFlat R R'`, `IsIntegralPerfectoid p R'`, and an injective `R`-algebra map `R' →ₐ[R] AdicCompletion (Ideal.span {(p : integralClosure R (AlgebraicClosure (FractionRing R)))}) (integralClosure R (AlgebraicClosure (FractionRing R)))`. Use `sorry`, document the theorem, and name it in Q10.4. All carriers already occur in this file; no new definition is needed. For `R=ℤ_p`, the completed root tower embedded into `𝒪_{ℂ_p}` satisfies this conclusion; the existing cover-only signature does not express that embedding.


   The exact proposed signature, within the existing namespace and `RegularLocal` section, is:

   ```lean
   /-- An F-finite complete regular local ring of mixed characteristic has a faithfully flat
   integral perfectoid cover embedding into its completed absolute integral closure (README Q10.4). -/
   theorem exists_faithfullyFlat_isIntegralPerfectoid_in_absoluteIntegralClosureCompletion
       (R : Type u) [CommRing R] [IsDomain R] [IsRegularLocalRing R]
       [IsAdicComplete (maximalIdeal R) R] [CharZero R] [CharP (ResidueField R) p]
       [Module.Finite (frobenius (ResidueField R) p).fieldRange (ResidueField R)] :
       ∃ (R' : Type u) (_ : CommRing R') (_ : Algebra R R'),
         Module.FaithfullyFlat R R' ∧ IsIntegralPerfectoid p R' ∧
         ∃ φ : R' →ₐ[R] AdicCompletion
           (Ideal.span {(p : integralClosure R (AlgebraicClosure (FractionRing R)))})
           (integralClosure R (AlgebraicClosure (FractionRing R))),
           Function.Injective φ :=
     sorry
   ```

6. **F06** (P3) Two BS22 locators point to the wrong pages

   **Location:** `packages/PerfectoidQuotientsPartII/README.md:1774`: “Theorem 7.4 and its proof, pp. 61–62”; also line 1562, “Remark 10.13, p. 84”.

   **Claim:** The reference locates the surjectivity theorem on pages 61–62 and the cover-inside-completion passage on page 84 of the explicitly cited arXiv v4.

   **Witness:** BS22 line 2175 places Theorem 7.4 on page 56, its proof at line 2431 on page 62, and the embedded-cover choice at line 3215 on page 83.

   **Exact repair:** At line 1774 use “Theorem 7.4, p. 56, and its proof, p. 62”. At line 1562 use “Remark 10.13, p. 83”. The proof-only citation in Q10.5 already points to page 62 correctly.

Six findings: two P1 defects (a reversed mathematical inequality and an unowned prerequisite), two P2 defects, and two P3 Check/locator defects. No package files were changed.

## Verified sound

Read all 1,797 README lines and all 338 Lean lines: 37 numbered targets, including all 15 bold theorem statements; 18 Lean declarations (3 definitions and 15 theorems); 141 numbered-section Check bullets read, with 140 tested by the computations and comparisons below and one source-only example identified under Not verifiable. The computations below cover those 37 targets and all 18 declarations. Checked 56 distinct source locators across all nine cited works, with source issues distinguished below. Resolved the contracts against six supplying roadmaps and inspected the closest ownership candidates. The six findings above are exceptions to the conclusions in this section, not a claim that their statements passed.

The supplied elaboration record contains all 18 types. I compared those types with the actual declarations and README. No necessary section binder disappears. In particular, completeness is explicit or supplied by `IsIntegralPerfectoid`; `IsPZariski` intentionally retains `p` without its primality instance; the syntomic definitions intentionally retain neither. No fresh Lean command was run, in accordance with the read-only/no-build instruction.

**Declaration and context ledger.** All names below have namespace `TauCetiRoadmap.PerfectoidQuotientsPartII`; line numbers refer to `packages/PerfectoidQuotientsPartII/Suggested.lean`. “IP” means the native `IsIntegralPerfectoid p` instance, “FF” means ordinary `Module.FaithfullyFlat`, and “nonunit” means the explicit `Fact (¬ IsUnit (p : A))`. All theorems except the Tate criterion retain `p : ℕ` and `Fact p.Prime`. Ring binders carry `CommRing`. Each value in the test column is computed in the displayed instance, rather than a proof of the general theorem.

| Declaration; section; line | Retained variable, instance and universe context | Instances and computed values | Result / change |
| --- | --- | --- | --- |
| `IsSyntomic`; Definitions/Q7.2; 59 | Independent `R : Type u₁`, `S : Type u₂`, `Algebra R S`; finite principal-open cover; local dimension may vary | `k→k[X]`: cover `{1}`, dimension 1; `ℤ→𝔽_p`: multiplication by `p` has kernel all of `𝔽_p`, so flatness fails; `R→0`: empty cover has span `⊥=⊤` | Definition distinguishes flat lci, nonflat and empty cases; retained |
| `IsIndSyntomic`; Definitions/Q7.2; 67 | `R,S,B,T : Type u`; ring/algebra instances; every finitely presented `B` and every `B→S` must factor | `k→k[T^{1/p∞}]`: finite coefficients lie in stage `k[T^{1/pᴺ}]`, factorization composite is the given map; `ℤ→𝔽_p`: no factorization through a flat algebra of the quotient map; `R→0`: factor through `T=0` | Real factorization property; no free predicate or missing prime binder |
| `IsPZariski`; Definitions/Q9.5; 74 | Arbitrary natural `p`; arbitrary `A`; no primality requirement in definition | `ℤ_p`: `1+pa≡1 mod p`, hence units; `ℚ`, `a=−1/p`: value 0, nonunit; zero ring: 0=1 is a unit; junk `p=0`: value 1 always; `p=1`: choosing `a=−1` forces zero ring | Matches Jacobson condition; retained |
| `isIntegralPerfectoid_fibreProduct`; FibreProducts/Q5.6; 89 | Independent universes for `A,A',B`; IP on all three; `f` surjective; arbitrary `g` | `A'=0`: equalizer carrier is `A×B`; `g=id`: carrier is `{(a,f(a))}≃A`; `k[T^{1/p∞}]×_k k[T^{1/p∞}]`: inverse Frobenius acts componentwise and preserves equality at 0 | Both nontrivial and boundary cases agree; no one-lemma proof at pin |
| `isAdicComplete_preTilt_iff`; Tilting/Q6.2; 107 | IP, nonunit; actual Witt generator with kernel equality; `ϖ∣ξ₀` | Characteristic `p`, `ξ=p`, `ϖ=0`: both completions equal original rings; `𝒪_C`, `ϖ=t^{1/p}`: both complete; infinite constant products: both complete | Both directions survive; no dropped completeness assumption |
| `valuationRing_iff_preTilt`; Tilting/Q6.4; 118 | IP, nonunit; domain instances are existential on each side | `𝒪_C`: true ↔ true; `𝒪_C×𝒪_C`: false ↔ false, since `(1,0)(0,1)=0`; perfect field: true ↔ true | Domain is not silently assumed for arbitrary IP rings |
| `untilt_dvd_iff_and_exists_isUnit_mul_untilt`; Tilting/Q6.4; 128 | Domain, valuation ring, IP, nonunit | `x=1,y=t`: both divisibilities true; reversed `x=t,y=1`: both false; `a=0`: `u=1,b=0`, `0=1·0`; `a=1+p`: `u=1+p,b=1` | Native sharp map; correct multiplicative direction in signature; R01 fixes proof prose |
| `isAlgClosed_fractionRing_iff`; Tilting/Q6.7; 137 | Domain, valuation ring, IP, nonunit, domain of tilt | `𝒪_C`: true ↔ true; completed 3-root tower: `X²−2` has no residue root, hence false ↔ false; characteristic-`p` perfect field: same fraction field on both sides | General statement retained, including rank zero |
| `exists_surjective_of_isSMulRegular`; Tilting/Q6.8(1); 146 | `A,Ã : Type u`; IP; `ϖ^p∣p`; explicit `ϖ`-completeness; output regularity and lift equality | `A=𝔽_p,ϖ=0`: completed p-root tower, `ϖ̃=p^{1/p}`, `f(ϖ̃)=0`, multiplication injective; already regular case: identity; `A=0`: source zero, injectivity vacuous | Neither source nor parameter is a sorry'd datum |
| `exists_surjective_of_isSMulRegular_of_roots`; Tilting/Q6.8(2); 157 | Previous context plus specified sequence `r`, `r₀=ϖ`, `rₙ₊₁^p=rₙ`; output all coordinate lift equalities | `A=𝔽_p`: `rₙ=0`, lift `r'ₙ=p^{1/p^{n+1}}`; its pth power equals preceding term and reduction equals 0; already regular ring: identity on the entire sequence | Stronger than an arbitrary lift; retained |
| `exists_surjective_of_isSMulRegular_p`; Tilting/Q6.8(3); 168 | `A,Ã : Type u`; IP only; output regularity of `p` and surjectivity | `𝔽_p`: p-root tower has p-kernel 0 and residue map onto `𝔽_p`; p-torsion-free IP: identity; zero: zero source works | Does not follow by setting `ϖ=p` in first theorem (`p^p∣p` generally fails) |
| `exists_approximation`; Valuations/Q8.3; 186 | `A : Type u`, topology, IP, nonunit; `IsAdic`, complete; `∃a'` precedes all valuations with `Γ₀ : Type v`; continuity and boundedness | `a=b♯`: error 0; `m=0`: bound `v(p)` since max is 1; `a=1+p,a'=1`: error and bound both `v(p)`; `v(p)=0`: error forced 0 | Uniform quantifier order is correct |
| `isTopologicallyNilpotent_iff_forall_lt_one`; Valuations/Q8.4; 199 | `R : Type u`, topology, topological ring, Tate instance, actual pair of definition; arbitrary `Γ₀ : Type v`; no prime binder | `ℚ_p,a=p`: true ↔ `p⁻¹<1`; `a=1`: false ↔ `1<1`; Gauss `T`: value 1, neither condition; zero ring: nilpotent and no valuations | Pair of definition prevents the unbounded-subring vacuity |
| `exists_indSyntomic_andre`; Andre/Q9.3; 222 | `A,A' : Type u`; actual roots; alternative complete-IP or henselian regular-parameter perfectoid-completion hypothesis; output FF before and after quotient | `𝒪_C`: `A'=A,I=0`; `𝔽_p,ϖ=0`: `A'=𝔽̄_p,I=0`; `P=1`: natDegree 0 excludes it; zero ring: all carriers zero; `p=3,P=T²−2`: new residue root required | No hypothesis contains its conclusion; ordinary FF and actual ind-syntomicity are asserted |
| `exists_semiperfectoid_cover`; Andre/Q9.6; 243 | `A,A',Ã : Type u`; actual `IsPZariski`; output FF, completion of reduction IP, surjection, p-regularity, henselianity, positive-degree root property | `A=ℤ_(p)`: `A'=Ã=ℤ̄_p`, completion `𝒪_Cp`; `A=𝔽_p`: `A'=ℤ̄_p/p`, reduction `𝔽̄_p`; `A=0`: all zero | No hidden topological assumptions; retained |
| `exists_faithfullyFlat_isIntegralPerfectoid`; RegularLocal/Q10.2; 266 | `R,R' : Type u`, regular local, `p∈maximalIdeal`; output algebra, FF, IP; no residue perfection or completeness restriction | `R=𝔽_p(t)`: perfect closure, FF field extension; `R=ℤ_p`: completed p-root tower, nonzero reduction; `R=ℚ`: hypothesis fails since `p` unit | Generality agrees; missing prerequisite R04, distinct missing bridge R05 |
| `tor_map_mul_root_eq_zero_of_cover`; RegularLocal/Q10.5; 280 | Complete regular local domain, CharZero, residue CharP; actual FF IP `R'` and algebra map to completed `R⁺`; finite `S⊆R⁺`, `c∈(p)`, finite étale after localization; compatible roots in `R⁺`; `n,i>0`; `N : ModuleCat.{u}(R/pⁿ)` | `S=R`: source Tor 0; `c=0`: all roots 0 and induced map 0; ramified quadratic `S/ℤ_p`, odd `p`: root of `p` has value `1/p∉(1/2)ℤ`, so roots must be in `R⁺`; first-argument multiplication acts by that root | No finite-projectivity assumption on general `S`; exact map and root location retained |
| `tor_map_mul_root_eq_zero`; RegularLocal/Q10.6; 315 | Previous context minus supplied cover; finite module over Frobenius fieldRange on residue field; all other binders retained | Perfect residue degree 1; `𝔽_p(t)` degree `p`; infinite p-basis degree infinite and excluded; DVR finite `S` free gives Tor 0; nonnormal dimension-two example below has Tor₁≠0 | Neither merely perfect nor arbitrary residue fields are substituted |

**README target and Check ledger.** The number in parentheses is the number of Check bullets read; all but the explicitly identified source-only formal-fibre example were tested. Values for multi-assertion targets are separated by semicolons. `C` is an algebraically closed complete nonarchimedean extension of `ℚ_p`, `t=p♭`, and root towers use their stated completion. The 15 bold targets are individually represented in the declaration ledger as well as grouped under their numbered sections here.

| Statement / target | Instances tried and values computed | Result / change |
| --- | --- | --- |
| Q5.1, modulo-divisor tilt and uniqueness of θ (4) | `ℤ_p`: sequences are 0 and Teichmüller roots, count `p`; at 2 the sole nonzero sequence is 1. Perfect characteristic `p`: sharp identity. `ε≠1` has `ε♯=1`. Modulo 9: `2³=8≠2`. In `𝒪_C`, reduction at `p^{1/p}` gives the same inverse-limit ring | Divisor hypothesis, ring versus monoid and noninjective sharp distinguished |
| Q5.2, products and pullbacks (4) | Zero target gives product; identity leg gives `A`; two copies of `𝒪_C` glued over residue give two tilted copies glued over same residue. In `ℤ/p²`, `p²·1=0` but `p·1≠0`; bound-one torsion hypothesis fails | Product and pullback computations agree, including empty product 0 |
| Q5.3, quotient comparisons (4) | `ϖ=p^{1/p}` gives `A♭/(t)=A/(p)`; characteristic `p`, `ϖ=0` gives `A=A`. Root tower quotient equals `𝔽_p[t^{1/p∞}]/(t)` on both sides, with nonzero nilpotent `t^{1/p}`. Unit `u` changes generator to `ut` but `(ut)=(t)` | Quotient need not be reduced; ideals, rather than generators, are canonical |
| Q5.4, torsion module comparison (4) | Domain: both torsion modules 0. Characteristic `p`: both whole `A`. Product with `ϖ=(p^{1/p},0)`: both `0×𝔽̄_p`. Alternative parameter has nonzero adic intersection. For `B/(t)`, tilt is completed `B`; Witt `[t]` acts as 0 on `B/(t)` but nontrivially on its tilt | R02; the nonperfectoid counterexample distinguishes modules, not just ring reducedness |
| Q5.5, A_inf surjections and kernels (3) | Identity: kernel 0. Residue map: kernel is Witt vectors with every coordinate in `𝔪`, and theta generator maps to generator `p`. Zero target: kernel quotient `W(A♭)/(ξ)=A` | Compatible kernel statements agree |
| Q5.6, perfectoid pullback (4) | Over zero: product. Residue glue: mixed-characteristic perfectoid. Torsion decomposition: same two projections as supplier. Over characteristic `p`, Frobenius inverse sends `(a,b)` to `(a^{1/p},b^{1/p})` and preserves `a(0)=b(0)` | Headline retained |
| Q5.7, glueing with perfect algebras (3) | `𝔽_p→𝔽̄_p`: pullback is residue preimage of `𝔽_p`; identity gives `A`. Reversed arrow would have two consecutive arrows rather than two arrows into the same ring, so gives no such pullback | Map direction is correct |
| Q6.1, relative tilting equivalence (3) | Characteristic `p`: `W(B)/(p)=B`, completeness at 0 automatic. `𝒪_C` and residue field map to `𝒪_C♭` and residue field. Taking `B=C♭`: `ξ₀` and then `ξ` are units, so quotient is 0, not an untilt of `C♭` | Completeness necessary; omitted categorical headline explicitly identified in docstring |
| Q6.2, completeness iff (4) | `𝒪_C,t^{1/p}`: complete/complete; `ϖ=0`: complete/complete; constant infinite product: complete/complete; `ϖ=t²`: complete/complete even though `t²∤ξ₀` in chosen normal form | Both directions and nonnoetherian cases agree; last Check appropriately outside sufficient hypothesis |
| Q6.3, valuation tilt without perfectoidness (3) | `𝒪_C`: usual tilted valuation; `ℤ_p`: tilt `𝔽_p`, value group `{1}` versus `ℤ`; `𝔽_p[[t]]`: inverse-Frobenius limit `𝔽_p`, same loss. Divisibility witness `1∣p` has `1>v(p)` | R01 only; no spurious equality of value groups here |
| Q6.4, valuation and value groups (4) | `𝒪_C`: same group; product: zero divisors both sides; completed p-root tower: group `ℤ[1/p]` both sides, `(t^{1/p})♯=p^{1/p}` and `1+p=(1+p)·1♯`; characteristic `p`: identical rings and divisibility | Both iff directions and unit normalization agree |
| Q6.5, localizations and completeness (3) | Maximal prime: `V_q=V`; `q=0,a≠0`: completion of field at unit ideal is 0, not field; `a=0`: both rings 0-adically complete, but proposed injection `ℚ_p/ℤ_p→ℤ_p` impossible | R03; theorem survives with separate zero case |
| Q6.6, perfectoid localizations (3) | Mixed-characteristic rank one: only nonzero prime gives original ring; characteristic `p`, zero prime gives perfect fraction field; rank-two height-one localization discards residue valuation and keeps rank-one coarsening; mixed-characteristic fraction field has `p` unit | Exclusion and rank conventions agree |
| Q6.7, algebraic closedness (3) | `C,C♭`: algebraically closed; at `p=3`, root-tower residue is `𝔽₃`, squares `{0,1}`, so `X²−2` has no root on either side; dimension zero characteristic `p`: same field | True/true, false/false and identity directions tested |
| Q6.8, three torsion-free presentations (4) | Residue `𝔽̄_p`: completed `W(𝔽̄_p)` p-root tower maps roots to 0; already regular: identity; `𝔽_p`: completed `ℤ_p` p-root tower is p-regular and surjects. Arbitrary unit adjustment does not prescribe images of higher roots | All three signatures express distinct assertions |
| Q7.1, ind-fppf definition and characterization (5) | Identity incl. zero, polynomial ring and countable polynomial colimit: FF; infinite-variable ring not finitely presented. `ℚ⊗ℤ𝔽_p=0`; `ℤ→𝔽_p` has p-torsion. Double product rank 2 is FF; empty product rank 0 is not FF over `ℤ`. Nonreduced formal fibre has a nonzero nilpotent; source footnote supplies failure of ind-fppf | Definition has five discriminating Checks; nonreduced-fibre existence is source-backed rather than an explicit constructed ring here |
| Q7.2, syntomic definitions (5) | Root polynomials at finite stages have relative dimension 1; two-variable hypersurface has dimension 1. `ℤ→𝔽_p` nonflat; `ℤ[1/p]` syntomic but its p-fibre is 0. `k[x,y]/(x,y)²`: embedding dimension 2, dimension 0, three minimal relations, so not lci | Local varying dimension in Lean agrees with general syntomicity |
| Q7.3, stability (3) | Two independent root variables give colimit of dimension-2 polynomial stages; base change `𝔽_p⊗ℤℤ[X]=𝔽_p[X]`; empty product 0 is syntomic by empty cover but not FF over `ℤ` | Nonempty restriction correct for ind-fppf products |
| Q7.4, gluing flatness (3) | `M=ℤ_p`: generic module `ℚ_p`, special module `𝔽_p`, flat. `M=𝔽_p`: both fibre tests pass but p-kernel `𝔽_p` nonzero. Square-zero `A=ℤ⊕N`, `N=ℤ[1/p]/ℤ`, `M=ℤ`: generic rings both `ℤ[1/p]`, special both `𝔽_p`, but `Tor₁^A(M,M)=N≠0` | Regularity on both ring and module needed; arbitrary nonnoetherian base supported by 0H7N |
| Q7.5, blowup presentation (3) | `(a,g)=(p,T)` gives `ℤ_p[X]`, `T=pX`; `(2,2)` gives actual subring `ℤ`, while presentation has nonzero class `X−1` killed by 2; `g=0,a` nonunit regular gives class `X` killed by `a`, actual subring `R` | Regular-pair hypothesis excludes the extra torsion (if `a` unit, both reduce to `R`) |
| Q7.6, hypersurfaces (3) | `ϖX−q`: nonzero on every fibre because one coefficient is a unit or `q` stays monic; `pX`: vanishes at p and class `X` is p-torsion; `1+px`: quotient `ℚ_p`, empty special fibre. With zero variables, fibrewise nonzero constant is a unit, quotient 0 | Empty fibres allowed; zero algebra may use a redundant standard dimension-zero presentation |
| Q8.1, valuation continuity (4) | p-adic: `v(p)ⁿ→0`; trivial valuation: `1ⁿ=1`; quotient valuation: `v(ϖ)=0`. Lexicographic example has `v(T)=(-1,0)<(0,-n)=v(p)ⁿ` for all n, so no p-adic basic neighbourhood lies in `{v<v(T)}` | Cofinality cannot be replaced by `v(ϖ)<1` |
| Q8.2, tilted valuation (3) | `v♭(t)=v(p)`; quotient-support case gives `v♭(ϖ♭)=0`; two lifts of zeroth coordinate of `t` have values `0` and `v(p)`, while sharp gives `v(p)` | Definition must use actual sharp, not arbitrary lift |
| Q8.3, approximation (4) | Sharp input error 0; `m=0` bound `v(p)`; support containing p bound 0; `a=1+p` permits errors `v(p)` from `a'=1` and 0 from a compatible-root lift | Simultaneous inequality and nonuniqueness agree |
| Q8.4, nilpotence criterion (4) | `p` in `ℚ_p`: powers tend to 0 and values <1; `1`: constant powers, value 1. Gauss `T`: value 1. Unbounded `B=ℚ_p`: bounded continuous valuations empty, so false left/true right for `1`; zero ring: true/true | Actual pair of definition excludes the false positive |
| Q9.1, root-extension definition (4) | Empty polynomial set: `I'=0`, p-integral closure (equal to `𝒪_C` in example); `T−a`: root class equals `a`; `T`: class of `T^{1/p}` is nonzero, has pth power 0, is divisible by arbitrary `ϖ^{m/p}` and dies in completion; `1`: quotient 0, not FF | Quotient before completion may be nonreduced; no false reducedness claim |
| Q9.2, p-integral-closure union (3) | `P=T`: `q_j=T^{1/pʲ}`, `q_{j+1}^p−q_j=0`; each stage localized at `ϖ` is `C[T^{1/p∞}]`, not finitely generated. `(T^{1/p}/ϖ^{1/p})^p=T/ϖ` but coefficient `ϖ^{-1/p}` excludes it from first stage. `m=0`: `A₀[P]=A₀` | Individual stages are ind-syntomic, not falsely called syntomic |
| Q9.3, André theorem (5) | `𝒪_C`: identity with zero ideal; 3-root tower: `T²−2` requires residue extension; polynomial `T` produces nonzero nilpotent in an FF intermediate quotient; degree-zero `1` has value 1 everywhere; zero input gives all zero | Ordinary FF is required for both algebra and quotient; positive degree essential |
| Q9.4, completion consequences (3) | Characteristic `p`, `ϖ=0`: ideal divisible by 0 is 0, unique roots. Cyclotomic completion, odd p: neither `p` nor `1+p` is a pth power; a degree-p normal root extension would contain `ζ_p`, forcing `p−1` to divide p. Residue `𝔽̄_p≠0` is almost zero over `𝒪_C` | Actual roots improve unit-multiple roots; almost-zero does not mean zero |
| Q9.5, p-Zariski and Zariskization (6) | `ℤ/pⁿ`: `p` nilpotent, all `1+pa` units, incl. n=0 zero ring; `ℤ_(p)` localization inverts all integers prime to p; `ℚ`: denominator `1+p(-1/p)=0` gives zero localization; `ℤ`: `1+p` nonunit. `ℤ_p[T]` localized fibre remains `𝔽_p[T]≠0`; `ℤ_(p)⊗𝔽_ℓ=0` for ℓ≠p | Both FF and p-Zariski hypotheses separated |
| Q9.6, semiperfectoid covers (4) | `ℤ_(p)→ℤ̄_p`: torsion-free local FF, completion `𝒪_Cp`; `𝔽_p→ℤ̄_p/p`: reduction `𝔽̄_p`; zero→zero; `ℤ` fails via `1+p` | General characteristic-p and zero cases retained |
| Q10.1, residue towers (3) | `ℤ_p→W(𝔽_{pⁿ})`: ramification index 1; `ℤ_p[√p]` towers keep ramification index 2; `𝔽_{pⁿ}[[x]]` colimit excludes series with coefficients of unbounded finite-field degree | Unramified clause is conditional; colimit not identified with completion |
| Q10.2, prismatic FF cover (4) | `ℤ_p`: `p−x`, coefficient of p is 1, completed root tower; wrong crystalline prism gives `𝔽_p`, not flat over `ℤ_p`; characteristic-p power series: perfection union, FF; field: perfect closure, dimension 0 | R04 concerns existence of coefficient Frobenius lift; general theorem and specializations agree |
| Q10.3, completed R⁺ (3) | `ℤ_p`: completion `𝒪_Cp`; characteristic-p `R`: `R⁺` perfect but p-kernel entire nonzero ring; `R=ℚ`: p-unit completion 0 | CharZero needed for p-regularity, not perfectoidness alone |
| Q10.4, embedded cover (6) | `ℤ_p`: stage rank `pⁿ`; n=0 class `(1,−1)`, n≥1 `(1,0)`, at p=2 `(1,1)` versus `(1,0)`. Bad `p²−x`: next class 0, quotient nonregular; at p=2 factors `(x−2)(x+2)`. Valuations `1/p<1` and `1+1/p>1` give intersection example. `k=𝔽_p(t),d=2`: stage rank `p^{3n}`; infinite p-basis gives infinite rank | R04 supplier gap and R05 missing headline; numerical normalization and finiteness factor correct |
| Q10.5, conditional Tor (6) | `S=R` or finite étale: Tor source 0; `c=0`: roots 0. Quadratic `S`: value group `(1/2)ℤ` lacks `1/p` for odd p. For `c=pu`, ratio of chosen roots has p-power equal to a unit, hence is a unit after p-integral closure. `c=p(x+p)` needs enlargement; its divisor `x+p` is unramified in finite p,x-root stages. Enlarged root `T^{1/pᵏ}` maps to specified `c_k` | Image-of-almost-ideal versus actual-root issue is addressed by the stated enlargement |
| Q10.6, F-finite Tor (4) | DVR finite domains are free, source Tor 0; dimension-two finite normal domains are CM and free, source 0. Without normality: `R=ℤ₃[[x]], S=R⊕(3,x)t, t²=2` has depth 1 and `Tor₁^{R/3}(S/3,𝔽₃)≅𝔽₃`; after 3 inverted it is étale. Cover has p,x roots. Residue Frobenius degrees 1, p, infinite distinguish three cases | No false theorem found. Dimension ≥3 prose is read as an example range, not a claim excluding this nonnormal dimension-two instance |

**Conventions and headline coverage.** All rings in these targets are commutative; nonabelian group examples, fans, induction moduli, Chern signs and degree-of-zero-polynomial formulas have no corresponding operation in this package. Ring zero, module zero, empty covers/products, rank-zero valuation fields, p=2 and p=3, inseparable residue extensions, square-zero rings, nonnoetherian products, noncomplete colimits, units, zero parameters and identity maps are explicitly represented above. No denominator is used without its stated localization or regularity hypothesis. Positive degree excludes the constant polynomial 1, and `n,i>0` exclude the boundary Tor degrees. For `n=0`, `R/(p⁰)=0` would be the zero ring, not the intended coefficient ring.

The major final results are relative tilting; completeness, valuation and algebraic-closedness transfer; torsion-free presentations; fibre-product perfectoidness; integral approximation and the valuative criterion; ind-syntomic André and semiperfectoid covers; prismatic regular-local covers; embedded covers in completed `R⁺`; and the conditional/unconditional Tor conclusions. Fifteen component signatures are present. Relative tilting is explicitly listed as not statable because the requisite functorial categories are absent. The embedded-cover signature is statable and missing (R05). None of the 15 existing theorems is padding: reading the pinned definitions does not reduce one to a Check, a definitional equality or one available library lemma. The three definitions are used by the André/cover headlines.

**Pins, suppliers and ownership.**

| Supplier examined | Resolved contract and distinction |
| --- | --- |
| PerfectoidQuotients §§0.2–0.6, 1.2, 1.4 | Naturality, distinguished generators, bound-one torsion, torsion-free quotient, root closure, completed constructions and weaker André refinements have those targets at the current head. Q5–Q10 add the relative and ordinary ind-syntomic results. Root-polynomial and completed-tensor constructions remain imported. |
| PerfectoidSpaces P0.1–P0.2, P0.11, P1.15, P1.24–P1.25, P3.7, P4.15.2, P4.15.4–P4.15.5, P7.16a–P7.17 | Native predicates are used, the categorical/field results and perfect-residue towers are imported. `RegularTower.CohenDVR` and its existence do not assert the Frobenius lift used here: R04. The perfect-residue P7.17 is not misused for imperfect residue fields. |
| PrismaticCohomology §§0.61–0.63, 0.79, 0.83–0.84, 2.30–2.31 | Distinguished-element functoriality, regularity/rigidity, perfectoidization and arbitrary-finite-ideal almost purity match the requested contracts. Perfection and perfect-prism equivalence are cited through PerfectoidSpaces ownership. |
| EnhancedDerivedSheaves §E1.6 | `frobenius_flat_of_isRegular` supplies characteristic-p regular Frobenius flatness; it does not supply the mixed-characteristic Cohen lift. |
| DerivedDeRhamCohomology §1.10 | Both ordinary-(faithful)-flatness-from-complete-flatness names exist with noetherian base, regular parameter and completeness. The application is over noetherian `R`, not over a nonnoetherian root colimit. |
| StableReduction Layer 1 | Scheme syntomic morphisms are imported. The small ring-level predicate needed in the acceptance file expresses local standard syntomicity, with varying relative dimension, on the native pinned carrier. |

Object searches used both the supplied checkouts and `roadmaps grep/show`. Compared scopes with PerfectoidQuotients, PrismaticCohomology, DirectSummandsAndBigCohenMacaulay, PurityForFlatCohomology, PrismaticCohomologyPartIII and ArcTopologyAndDescent. DirectSummands' fixed-perfectoid-field/almost-flat cover does not duplicate the general ordinary faithfully flat prismatic cover. Prismatic Part III owns étale/syntomic complexes and F-crystals, not syntomic ring-map foundations. Purity consumes these results. Arc owns its descent applications. No duplicate fully qualified declaration name was located. The general factorization predicates and ordinary ind-syntomic refinement therefore remain this package's work, with the existing geometric and completed constructions imported.

At the pin, checked the actual definitions and relevant hypotheses of `PreTilt`, sharp, `quotientMulEquiv`, Fontaine theta, Teichmüller uniqueness, `IsIntegralPerfectoid`, standard syntomicity, valuation continuity, Tate rings/pairs of definition, affine blowups, henselization and Tor. Useful exact anchors include `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`, `Mathlib/RingTheory/Teichmuller.lean:195`, `Mathlib/RingTheory/WittVector/TeichmullerSeries.lean:117`, `TauCeti/RingTheory/Perfectoid/Integral.lean:76`, `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:90`, `TauCeti/RingTheory/Valuation/Continuous/Basic.lean:129`, `TauCeti/RingTheory/Huber/Basic.lean:163`, `TauCeti/RingTheory/Ideal/AffineBlowup.lean:138`, and `TauCeti/RingTheory/Henselization/IndEtale.lean:60`. Continuity tests attained values; a pair of definition supplies an open adic subring and finitely generated ideal, not Hausdorffness. Integral perfectoid completeness includes separation. Fixed-relative-dimension standard syntomicity does not already provide the varying-dimension predicate.

`git diff --stat origin/main...HEAD` shows only this package's README, Suggested file, sources manifest and repair reports. The single Mathlib import, existing individual Tau Ceti imports, namespace, `theorem` form, real definition bodies and absence of `set_option` meet the acceptance-file rules. No computational algorithm, pull-request number or process narrative was found in README or declaration docstrings.

The requested read-only dependency check returned:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order or package edit was made. The most recent repair report contains no finding settled as not actionable; none of the findings here reopens such a disposition.

**Source-locator ledger.** Counts are distinct locators, not repeated citations; “line” means the numbered legal extraction supplied for that source. Stacks 0BIQ was fetched through the source service under the existing `Stacks` key because the supplied Algebra extraction does not include More on Algebra.

| Source; locators verified | Count | Evidence and comparison |
| --- | ---: | --- |
| CS24 §1.4; §§2.1.1–2.1.2; Proposition 2.1.4; Example 2.1.5; Proposition 2.1.9; Remark 2.1.10; Proposition 2.1.12; §2.3.3; Lemmas 2.3.1–2.3.2; Theorem 2.3.4; §2.3.6; Corollary 2.3.7; Lemma 3.1.1 | 15 | Lines 305–313, 365–437, 468–491, 539–593, 682–702, 980–1001, 895–978, 1004–1155, 1157–1174, 1188–1204. Tilt directions, torsion, scalar factor `v(p)`, ordinary ind-syntomicity, rank-free valuation cases and unramified proviso compared. |
| BS22 Remark 3.11; Theorem 7.4; Theorems 10.9, 10.11; Remark 10.13 | 5 | Lines 1299–1327, 2175 and 2431–2439, 3084–3106, 3151–3183, 3206–3226. R06 corrects the theorem and embedding-page locators; proof-only citation is right. Q10.4–Q10.5 explicitly fill the embedding/root-transport gaps below. |
| BMS1 Lemma 3.2; Definition 3.5; Example 3.6; Lemmas 3.9–3.10 | 5 | Lines 863–883, 1008–1015, 1033–1067. π-adic separated completeness, unit multiples rather than arbitrary exact roots, and regularity for the converse checked. |
| Wedhorn Lemma 7.4; Definition 7.7; Theorem 7.10; Proposition 7.18 | 4 | Lines 2325–2335, 2413–2415, 2429–2444, 2494–2508. Cofinality and integrally closed open subrings compared with native continuity and the Tate proof. |
| Sch12 Theorem 3.7; Proposition 3.8; Corollary 6.7 | 3 | Lines 751–761, 1675–1692. Field finite-extension equivalence supports algebraic closedness; approximation is cited as background to the stronger integral CS24 statement, not as its exact signature. |
| Ces19 Lemma 4.7; Lemmas 5.1–5.2 | 3 | Lines 303–310, 419–445, 447–462. Regularity of p, integral closure and perfect-residue restriction checked. |
| HM17 Theorem 1.3 | 1 | Lines 65–70. F-finite hypothesis retained; original Tor modulo p-powers is distinguished from the stronger intermediate Tor over `R/pⁿ` in BS22. |
| Bha18 Theorem 1.5; Propositions 5.1–5.2 | 3 | Lines 74–77, 451–480. Almost flat root cover distinguished from ordinary FF; alternative (a) of Proposition 5.2 supplies the generalized perfectoid ordinary-FF form. |
| Stacks tags 00E0, 00FK, 00HP, 00IA, 07DV, 090T, 031A, 0H7N, 07C3, 00SL, 00SO, 00SV, 00SW, 00SY, 00SZ, 0C33, 0BIQ | 17 | Algebra lines 1595, 2986, 4367, 5504, 7566, 10626, 10646, 11208, 14640, 16637, 16656, 16782, 16817, 16828, 16866, 21812; More on Algebra lines 3872–3893. Tested nonnoetherian gluing, finite presentation, varying local dimension, empty fibres/products and regular-pair blowup. |

## Not verifiable

- No new Lean elaboration or theorem proof was run. The existing 18 elaborated signatures were supplied as input and compared manually; `sorry` elaboration cannot certify the mathematics. The proposed extra theorem in R05 requires the repair worker's normal elaboration check.
- Relative tilting's categorical equivalence cannot be represented by the present pinned categories/functors, as the module docstring says. Its mathematical statement was compared with CS24 Proposition 2.1.9; no stand-in was accepted.
- The CS24 footnote's noetherian local `ℚ`-algebra with nonreduced formal fibre was verified as the cited example class, not reconstructed from its further references. This is the one Check whose explicit ring and nilpotent were not computed from a presentation.
- Source pagination was certified against the explicitly cited preprint versions and current Stacks extractions, not against typeset journal pagination or unconsulted later corrections. No cited text needed for this pass remains inaccessible; no new missing-reference request was necessary.

## Source issues

- **Gap** in CS24 at proof of Proposition 2.1.9, printed p. 15 (line 588): the source says the displayed sequence applies for any allowed parameter; it should be restricted to nonzero parameters, treating zero separately; affects the proof.
- **Misprint** in CS24 at §2.3.3, printed p. 24 (line 987): the source says finite products preserve ind-fppf algebras; it should be nonempty finite products for ind-fppf, since the empty product over a nonzero base is not faithfully flat; affects a stated result.
- **Misprint** in CS24 at Theorem 2.3.4 and Corollary 2.3.7, printed pp. 25 and 28 (lines 1004–1010, 1157–1160): the source says all monic polynomials acquire roots; it should be monic polynomials of positive degree, excluding the constant polynomial one; affects a stated result.
- **Misprint** in CS24 at proof of Corollary 2.3.7, printed p. 29 (line 1174): the source says Proposition 2.1.11(d) proves the completed quotient perfectoid; it should be Proposition 2.1.11(c), the root-stable quotient assertion; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed p. 83 (lines 3215–3216): the source says Remark 3.11 provides a perfectoid cover inside completed absolute integral closure; it should be supplemented by an embedding construction with its hypotheses; affects the proof.
- **Gap** in BS22 at Remark 10.13, printed pp. 83–84 (lines 3217–3226): the source says almost vanishing of the middle Tor gives annihilation by every chosen root in the target; it should include transport of these roots from the annihilating ideal, for example after enlarging the cover; affects the proof.
- **Misprint** in BS22 at proof of Corollary 7.3, printed p. 56 (line 2173): the source says the equivalent prism category is equipped with a map from R; it should be equipped with a map from S; affects the proof.
- **Misprint** in BS22 at proof of Theorem 7.4, printed p. 62 (line 2435): the source says the ideal I becomes principal; it should be the defining ideal J of S=R/J; affects the proof.
- **Misprint** in Wedhorn at Remark 7.8(3), printed p. 59 (line 2424): the source says its additive valuation sublevel subgroup is defined by a greater-than-or-equal inequality; it should use less-than-or-equal; affects a stated result.
- **Misprint** in Wedhorn at Remark 7.9, printed p. 59 (line 2428): the source says a continuous map A→B induces a map Cont(B)→Cont(B); it should induce Cont(B)→Cont(A); affects a stated result.
- **Misprint** in Stacks at Lemma 15.32.2, tag 0BIQ, printed pp. 82–83 of More on Algebra (lines 3877–3891): the source says the final relation uses the variable y_n with coefficient a_r; it should use y_r, consistent with the r generators throughout; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "dddd8d6eb69c93e5f9fdcde10e9d99d555da445c", "job": "RT-PerfectoidQuotientsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
