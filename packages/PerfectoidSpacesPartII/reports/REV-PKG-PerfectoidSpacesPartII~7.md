<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12960#issuecomment-6851708480 -->
Review (codex) of 204d34d

Verdict: needs_changes

1. **F01** (P2) Import the symmetric-group Galois closure from its existing owner

   **Location.** `packages/PerfectoidSpacesPartII/README.md:117`: “§4.2 adds the `S_r`-Galois closure and Galois rigidity”; construction at :1886 and proof at :1896.

   **Claim.** This roadmap owns the ordered-frame construction of the symmetric-group Galois closure of a finite étale algebra.

   **Witness.** `TauCetiRoadmap/AdicEtaleGeometry/README.md:9428` on main, A4.3, constructs the same complement of diagonals in the tensor power, with the same symmetric-group action; :9446 gives the same cubic example of rank six.

   **Exact repair.** Add AdicEtaleGeometry A4.3, *splitting-torsor-of-finite-etale-algebra*, to Scope and ownership and Exact supplier contracts. Remove the construction of the `S_r`-torsor from this roadmap's ownership list and §4.2(1). Retain as a refinement the map from the original constant-positive-rank algebra `S` to its supplied ordered-frame algebra `T`, and prove that it is an `S_{r−1}`-torsor by fixing the first frame coordinate. Keep Galois rigidity as §4.2's other result. Cite A4.3 in its Needs and in the closure step of §4.3; do not re-plan the supplied torsor.

   This repair preserves the required cases: rank one gives `T = S = R`; rank two gives `T = S`; for `S = ℚ(∛2)`, `T = ℚ(∛2, ζ₃)` has degree six over ℚ and degree two over `S`. The stabilizer is `S₂`, while the acting group over ℚ is the nonabelian `S₃`. Rank-zero components still require separate treatment. A4.3 is on main, so this repair introduces no upward edge or new open-PR dependency.

2. **F02** (P2) State complete integral closedness of the root saturation

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1624`: “Statements (1), (3) and (4) need the Banach localisations”; clause (3) is at :1608. `packages/PerfectoidSpacesPartII/Suggested.lean:378` states only clause (2), with regular `g`.

   **Claim.** Clause (3) of the headline Riemann extension theorem cannot be stated at the pins.

   **Witness.** ANDRE18A line 2619, Lemme 4.2.3, p. 56, permits arbitrary `g`. The existing `rootSaturation` and native `Submodule.FG` express its conclusion. The following signature elaborates at the pins without adding a carrier.

   **Exact repair.** Add the following theorem in Layer 3, with a mathematical docstring citing that lemma, and name it in README §3.6 and the module docstring. Remove (3) from the README's unstatability claim. Keep the full perfectoid-field and complete Hausdorff Tate-ring hypotheses, but do not add regularity of `g`.

   ```lean
   theorem rootSaturation_completelyIntegrallyClosed
       (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
       (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε)
       (hKp : ‖(p : K)‖ < 1)
       (hKF : Function.Surjective
         (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
       (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
       [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]
       [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
       [Algebra K R] (hKR : Continuous (algebraMap K R))
       (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m) :
       ∀ b : Localization.Away ((g 0 : powerBoundedSubring R) : R),
         (∃ M : Submodule (rootSaturation p g hg)
           (Localization.Away ((g 0 : powerBoundedSubring R) : R)),
           M.FG ∧ ∀ n : ℕ, b ^ n ∈ M) → b ∈ rootSaturation p g hg :=
     sorry
   ```

   Here `p` and `[Fact p.Prime]` are the existing section variables. A copy containing this declaration elaborated successfully with only `sorry` warnings. This is complete integral closedness of the saturation itself, not the existing identification with the complete integral closure of `R°` under regularity.

   Separating instances: with `R = K × K` and every root of `g` equal to `(1,0)`, `R[1/g] = K` and the saturation is `K°`; powers contained in a finite `K°`-submodule have norm at most one. The existing regularity binder excludes this instance. For `g = 0`, both the localization and saturation are zero. For `g = 1`, the saturation is `R°`. Add the product example as a negative control for accidentally retaining regularity. This is a new occurrence of the pattern repaired by round-6 F01, not a rejection of that repair.

3. **F03** (P3) Keep the Tate algebra and its unit ball distinct in the trace paragraph

   **Location.** `packages/PerfectoidSpacesPartII/README.md:2078`: “on the carriers of §3.6: `A = R°`”.

   **Claim.** The `A` of the Abhyankar lemma is the power-bounded subring of the Lean Tate algebra.

   **Witness.** `packages/PerfectoidSpacesPartII/Suggested.lean:407` takes `B′` over the localization of `R`, not of `R°`. With `R = K` and `g = 1`, these bases are respectively `K` and `K°`.

   **Exact repair.** Replace the carrier explanation by: “Here `A = R`, `A° = powerBoundedSubring R`, and `A[1/g]` is `Localization.Away ((g 0 : powerBoundedSubring R) : R)`; `rootSaturation p g hg` is the subalgebra over `R°` defined in §2.3.” Keep the following integral-closure and trace explanation. For `g = 1`, this now gives ambient algebra `K`, saturation `K°`, and trace `K × K → K`, as in the Lean signature. The earlier Layer 1 uses of `A = R°` are intentional and need no change.

4. **F04** (P3) Correct the denominator-condition namespace

   **Location.** `packages/PerfectoidSpacesPartII/README.md:272`: “`TauCeti.Huber.HasDenominatorPower`”.

   **Claim.** This is the fully qualified pinned declaration used by rational localization.

   **Witness.** `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311` declares it inside `PairOfDefinition` (:135). At the pin, `#check @TauCeti.Huber.HasDenominatorPower` reports an unknown identifier; the qualified name below elaborates.

   **Exact repair.** Write `TauCeti.Huber.PairOfDefinition.HasDenominatorPower`. The corrected `#check` gives the predicate on a pair of definition, numerator set, denominator and localization. The unqualified uses in Suggested.lean are valid because that namespace is opened. This is a name correction to an existing supplier, not an unowned mathematical prerequisite.

5. **F05** (P3) Correct two Kummer locators and the characteristic-p example pointer

   **Locations.** `packages/PerfectoidSpacesPartII/Suggested.lean:485`: “§2.2, formula (7)”; :509: “§2.3, formula (8)”. `packages/PerfectoidSpacesPartII/README.md:1675`: “§3.6's last Check”.

   **Claim.** These locators identify the generic Kummer stages, their integral closures, and the characteristic-p algebra used in §3.7.

   **Witness.** ANDRE18B line 314 defines the base in (7); line 328 defines generic stages in (8); line 333 defines their closures in §2.3. The characteristic-p algebra is at README :1645, not its last Check (:1652).

   **Exact repair.** Cite “§2.2, formula (8), p. 78” for `KummerAlgebra`, and “§2.3, p. 78” for `kummerIntegralStage`. Replace “§3.6's last Check” with “the characteristic-p algebra `B = K + (Σ_m T₁^{1/p^m}P)^−` in the Checks of §3.6”. Testing the repaired references reaches `A_jl`, `A°_jl`, and the intended algebra respectively. Its saturation is `P°` and the largest perfectoid algebra is `P`, so the mathematics of that Check remains valid.

Five findings: two P2 and three P3. All six findings from round 6 are repaired. The package elaborates, but it still duplicates an existing supplier construction and omits a statable clause of a headline theorem. No package mathematics or source-manifest entry was edited during this review.

## Verified sound

### Previous findings and the changed passages

The repair report marks no finding “not actionable”. Each of its six claims was checked against this package, not assumed from the report.

| Round-6 finding | Repaired passage in this package | Status and follow-through |
| --- | --- | --- |
| F01, missing trace headline | Suggested.lean :407, `abhyankar_trace_almost_surjective`; README :2083, “The trace is Tau Ceti's `LinearMap.projectiveTrace`”. | Repaired. The new root-saturation body, finite-projective trace, faithfulness hypothesis, ideal generators and integral-model comparison were reviewed. R02 finds the same omission pattern elsewhere; R03 corrects new prose. |
| F02, page of Lemme 3.5.5 / Proposition 3.5.6 | §3.3 now cites “Lemme 3.5.5 and Proposition 3.5.6, p. 48”; its example cites “Remarques 3.5.5(2), pp. 47–48”. | Repaired. ANDRE18A lines 2082, 2109 and 2120 distinguish the page and the similarly numbered remarks. |
| F03, page of André B §2.4 | §5.5 now cites “André B, §2.4, p. 79”. | Repaired. ANDRE18B lines 356–366. The Kummer docstrings had different formula slips, R05. |
| F04, direction of the structure maps | README §1.1: “its restriction to `R°` is `f_n` followed by the inclusion `𝒪⁺ ⊆ 𝒪`”; the limit-theorem docstring agrees. | Repaired. `coeffToSections` targets ordinary sections; the limit projection is followed by the plus-presheaf inclusion. |
| F05, missing index zero | §1.1 now says “For `n ≥ 0`”; §1.2 includes the `n = 0` locus and Check. | Repaired. At zero the annulus is `1 ≤ \|g\|`; the exponent estimate still uses `c = pᵏm`. |
| F06, §3.0 stub | Layer 3 introduction uses “`TauCeti.Perfectoid.IsPerfectoidTateRing`”; no §3.0 target remains. | Repaired. The pinned predicate is imported, not re-planned. |

The other missing-carrier explanations were re-examined. The relevant distinction is between having a category of modules or a localization carrier and having the derived tensor product, Banach constructions or almost-algebra structures needed by the actual theorem. The new root-saturation subalgebra changes that assessment for §3.6(3).

### Principles, shape, and Lean checks

Read all 50 numbered targets, their API lists, Checks, examples, Needs lines, supplier contracts, and the 34 named Lean declarations. Reused earlier computed adversarial rows only where they supply explicit values; sampled targets and changed passages were recomputed. Compared the shape with PerfectoidSpaces, AdicEtaleGeometry and AdicSpacesPartIV on main. Six layers have Examples and Dependencies; definitions carry API facts and at least three Checks. No computational algorithm, good-prime restriction, sorry-valued data, `set_option`, admitted example, process path, PR number, HTML anchor or removed-target stub was found in the roadmap or Lean text. All 34 own names are present in the README; the new names are declared in the Lean file. No misleading own-name API catalogue was found.

The original package was elaborated using `lake env lean` from the pinned content checkout: **exit 0; nine warnings, all `declaration uses 'sorry'`**, at Suggested.lean lines 111, 160, 223, 300, 378, 407, 534, 586 and 645. All imported Tau Ceti object files were available. The module header has one Mathlib import and individual used Tau Ceti modules, in the `module` / `public import` form used on main.

A scratch copy with `#check @name` for every one of the 34 declarations elaborated. Complete-space, Hausdorff, perfectoid, finite-projective, scalar-algebra and characteristic/perfectness hypotheses remain in the signatures that need them; no lost section binder was found. The three Kummer headlines explicitly retain `[CharP k p] [PerfectRing k p]`. Localization in the trace theorem is away from `g` in the Tate ring. Its almost ideal uses every `c ∈ K` with norm less than one and every root of `g`, not just a fixed scalar.

Every one of the nine sorried theorems was tested on a scratch copy with `first | (solve | simp) | rfl | infer_instance`. All nine failed to close; each final diagnostic is the attempted `infer_instance` on its non-class conclusion. A broader `exact?` attempt was stopped after five minutes; no exhaustive exact-lemma-search result is claimed. Pinned near-matches were also read by object. Neither of the two proved helper theorems is admitted padding: their proofs supply membership/inclusion evidence required by later definitions. **No padding finding.**

| README headline | Acceptance-test coverage |
| --- | --- |
| §1.2 quantitative Riemann extension | Both kernel and cokernel clauses stated; uniform offset `pᵏm`. |
| §1.3 derived form | Named in module docstring; native derived categories and Tor of objects do not supply the required tensor product of arbitrary complexes. |
| §1.4 without regularity | Kernel clause stated; cokernel clause is already the general §1.2 theorem. |
| §1.5 limit form | Stated using the native plus presheaf and ring limit. |
| §3.6 perfectoid Riemann extension | Clause (2) stated; (1) and (4) need the Banach constructions. Clause (3) is statable and missing: R02. |
| §3.11 nested systems | Named; the 2-limit category and uniform limit of perfectoid Banach algebras are absent. |
| §4.5 ramified almost purity | Named; the almost-module category alone does not provide almost-perfectoid and almost-finite-étale algebra categories. |
| §4.7 Abhyankar lemma | Trace clause stated in the integral-closure model. Envelope and almost-finite-étale clauses named as not statable. |
| §5.8 Kummer almost faithful flatness | Stated for the completed full normalized tower over the coordinate tower. |
| §5.9 purity | Stated for every pair of finite or infinite indices. |
| §5.12 ramified almost faithful flatness | Stated modulo every `pᵐ`, with finite faithful reduced extension and étaleness after inverting `pg`. |

### Seeded source sample

All fifteen requested targets were read at their locators, including hypotheses and the portions of proofs explicitly used. There are no author-flagged unverified locators. All five works have one certified manifest key each. The published André versions were used; the stated preprint numbering conventions for Bhatt and Scholze were respected. ANDRE18B v1 was additionally fetched through the sources service under its existing key; the service kept the author's manifest entry unchanged.

| Target | Source text opened | Outcome |
| --- | --- | --- |
| §0.3, derived limits of almost-pro-zero towers | BHATT18 line 326, Lemmas 3.4–3.5, p. 6 | Both `lim` and `lim¹` conclusions are supported; almost-pro-zero is not confused with termwise almost zero. |
| §0.4, linear functors | BHATT18 line 337, Lemma 3.6, p. 6 | A-linearity is required and retained; scalar-annihilated transition images give the result. |
| §1.4, no regularity of `g` | BHATT18 line 427, Remark 4.4, p. 7 | Product-root almost setup retained; the stronger pseudouniformizer-only kernel claim is not made. |
| §2.3, root saturation | ANDRE18A line 935, Lemme 2.5.1, pp. 24–25; line 1067, Lemme 2.5.3, pp. 26–27; line 1282, Lemme 2.8.2, p. 32 | Image inside the localization, possible loss of injectivity, six closure conditions and limit compatibility agree. |
| §2.4, Laurent localization | ANDRE18A line 1107, §§2.6.1–2.6.4, pp. 27–29 | Quotient model supported; erroneous source norm formula and universal injectivity are explicitly corrected. |
| §2.5, Weierstrass localization | ANDRE18B line 236, §§1.2–1.2.3, pp. 76–77 | Isometric multiplication hypothesis, torsion-freeness and discrete versus nondiscrete unit-ball distinction retained. |
| §3.4, annular localization | ANDRE18A line 2173, §3.6.3, formulas (3.12)–(3.15), p. 49; line 2261, Proposition 3.6.1, p. 50 | Spectral unit ball distinguished from quotient-norm unit ball, including `j = 0`. |
| §3.7, largest perfectoid subalgebra | ANDRE18A line 2633, Corollaire 4.2.4, p. 56 | Abstract containment and continuity of the structure map retained; coreflection and tilt formulas agree. Internal example pointer needs R05. |
| §3.8, uniform limits | ANDRE18A line 2768, Proposition 4.3.1, pp. 58–59; line 2826, Remarque 4.3.1, p. 59 | Implications have the source's direction; no assertion that all uniform limits are perfectoid. |
| §3.11, nested systems | ANDRE18A line 2924, Théorème 4.4.2, pp. 61–62 | Uniform limit is the right adjoint and left quasi-inverse; coreflective image, not general equivalence onto all systems. |
| §4.2, Galois closure and rigidity | ANDRE18A line 369, Lemmes 1.9.2–1.9.3, p. 10 | Mathematics supported, including the stabilizer subgroup. Ownership defect R01. |
| §4.4, integral almost étaleness away from `g` | ANDRE18A line 3090, Proposition 5.2.3 and proof, pp. 66–67; GR03 line 3371, Theorem 3.5.28 | Modulo powers in characteristic zero, and the separate characteristic-p argument, agree. Principal flatness input is a declared contract. |
| §4.8, reduced affinoid envelopes | ANDRE18A line 3201, §5.4, pp. 68–69 | Normalization and discriminant data are explicit; almost perfectoid is not silently replaced by perfectoid. |
| §5.4, normalized Kummer tower | ANDRE18B line 313, §§2.2–2.3, p. 78; ANDRE18A lines 1454, 1552, Examples 3.1.2(1), 3.2.3(2), pp. 35, 37 | All root branches, normalization and directed unions retained. Two Lean docstring formula locators need R05. |
| §5.5, spectral norm | ANDRE18B line 358, §2.4, p. 79 | Spectral means power-multiplicative; arbitrary products need not have multiplicative norm. Isometric transition statement agrees. |

Also opened the newly used trace result (ANDRE18A line 3186), the complete-integral-closedness lemma (line 2619), GR03 Lemmas 5.2.1 and 5.3.3 (lines 5263 and 5509), all nine GR items cited in the reference list, and the source-correction passages. SCHOLZE12 lines 1352, 1393 and 1675 give the rational-localization and approximation context. No required text was inaccessible.

### Computed adversarial evidence

Here `q = |ϖ|` with `0 < q < 1`; `P` denotes the perfected two-variable Tate algebra when specified. Equalities in almost categories are distinguished from equalities of ordinary rings. “Keep” means no repair is required by that instance; the listed findings identify required changes. These rows cover every seeded target, every headline, and every mathematical target touched by a finding; additional rows record the important definition and convention controls.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result; change |
| --- | --- | --- | --- |
| §0.1 almost-pro-zero | Bhatt tower `M_n = K°/ϖ^{1/p^n}`; zero tower | Transition image is `ϖ^{1/p^n−1/p^{n′}}K°/ϖ^{1/p^n}`. Multiplication by `ϖ^{1/p^k}` kills it when `n′ ≥ k`; the image itself is nonzero for every finite `n′`. Zero tower has image zero. | Separates almost-pro-zero from pro-zero; keep. |
| §0.2 uniform offsets | Same tower, `g = 1`; termwise almost-zero tower | For fixed offset `c`, exponent deficit is `1/p^{n+c} > 0`; choose `l > n+c`, and multiplication by `ϖ^{1/p^l}` remains nonzero. Termwise almost-zero tower has `c(k)=0`. | Uniformity is stronger; keep. |
| §0.3 derived limits | Zero transitions; comparison `ℤ ←p ℤ ←p …` | Zero transitions give `1−shift = id` on the product, so `lim = 0 = lim¹`. The p-multiplication tower has `lim = 0`, `lim¹ = ℤ_p/ℤ ≠ 0`, and fails the annihilated-transition hypothesis. | Tests both derived degrees; keep. |
| §0.4 linear functors | Linear `F`; additive scalar-changing tensor functor in the Check | Linear case: `F(ϖ_k ρ)=ϖ_k F(ρ)=F(0)=0`. Scalar-changing case: nonzero `x ⊗ ϖ^{1/p}` in `M_n ⊗_{𝔽_p} K°/p`, whereas at `ϖ=p`, `k=0`, `x ⊗ p=0`. | The explicit `k=1` control is necessary; keep. |
| §0.5 and §1.3 derived form | Two-term cone, arbitrary tensor complex; `K=R` | `H⁻¹(C)=ker f`, `H⁰(C)=coker f`. The scalar-killed transition factors through `H⁻¹(C)[1]`; a second smaller root kills it. `t_l=t_{l+1}² t_{l+1}^{p−2}` works at `p=2` with final factor one. | Uniform constants survive tensoring; keep. |
| §1.1 annular tower | `g=1`, `g=0`, and `g=(T,0)` | Opens are respectively all of X, empty, and annuli on the first factor. Restriction sends `u_{n+c}^e` to `t^{ce}u_n^e`. Product kernel contains `(0,1)`. | Directions and empty case correct; keep. |
| §1.2 kernel headline | `g=T`, `n=0`; `m=0` | Kernel of inclusion into `(K°/tᵐ)[T^{±1/p^∞}]` is zero. For `m=0`, ideal `(t⁰)=(1)`, so source and target quotient are zero. | New index-zero prose agrees; keep. |
| §1.2 quantitative headline | Monomial `u_{n+c}^e`, `c=pᵏm` | If `e≥1/pᵏ`, `ce≥m`, so the term vanishes modulo `tᵐ`; otherwise `g^{1/pᵏ−e}t^{ce}` has nonnegative g-exponent and comes from A. Same at `n=0`. | Offset is independent of n; keep. |
| §1.4 no regularity | `A=K°⟨T^{1/p^∞}⟩ × K°`, `g=(T,0)` | `(t_kT_k,0)(0,1)=0`, but `(t_k,t_k)(0,1)=(0,t_k)≠0`. | Product-root setup works; pseudouniformizer-only version fails; keep. |
| §1.5 limit headline and its maps | Disc `g=T`; `g=1`; `g=0` | `‖1/T‖_{U_n}=q^{−n}` is unbounded, so it is excluded from the plus limit. Unit case limit is `R°`; zero case limit is zero and every root of g annihilates the kernel. `R° → O⁺ → O` is the restriction of `R → O`. | Limit and repaired composition agree; keep. |
| §2.1 closure definitions | `ℤ⊂ℤ[i]`, `p=3`; `ℤ⊂ℤ[1/2]` | Imaginary part of `(a+bi)³` is `b(3a²−b²)`, zero only when `b=0`. For `2^{-e}`, bounded denominator for all powers requires `en≤m` for all n, hence `e=0`. | Root closure differs from integral closure; keep. |
| §2.2 unit-ball dictionary | K with its spectral norm; dual numbers with Gauss norm | `K°={\|x\|≤1}`, powers have norm `\|x\|ⁿ`. For `ε²=0`, every `cε` is power-bounded, with norms unbounded as c varies, so the ring is not uniform. | Reduced/uniform restriction discriminates; keep. |
| §2.3 root saturation and new real body | `g=1`, `g=0`; disc with `g=T` | Saturations are `R°`, zero in the zero localization, and the disc unit ball. Testing only m=0 would admit `b=T^{−(1−1/p)}`; the m=1 exponent is `2/p−1<0` for `p≥3`, and m=2 gives `−1/4` at p=2. | Every root is needed. Multiplication law uses `p−2≥0`; keep. |
| §2.4 Laurent quotient norm | `K×K`, `g=(ϖ²,1)`, `λ=ϖ`, `a=(1,ϖ²)` | First factor dies; image norm is `q²`. The source's infimum gives `inf_m max(q^m,q^{2−m})=q`. Restriction from λ=`ϖ³` to λ=`ϖ` is `K×K→K`, killing first factor. | README correctly rejects both false source formulas. |
| §2.5 Weierstrass unit ball | `B=K⟨T⟩`, `f=T`, `λ=ϖ`; then `f=ϖT`, `λ=ϖ²` | First integral model is `K°⟨U⟩`, with `T=ϖU`. Second naive model contains nonzero `[ϖU−T]` killed by ϖ. | Isometric-multiplication hypothesis excludes the torsion example; keep. |
| §§2.6–2.7 uniform limits/colimits | Constant systems; bounded product of copies of K | Constant limit and colimit are K. In the bounded product the sequence `(ϖ^{-i})_i` has supremum infinity and is excluded; constant sequence one has norm one. Empty product gives the zero terminal ring. | Boundedness and categorical boundary distinguished; keep. |
| §2.8 and §3.2 root algebras | `g=1`, `g=0`, both characteristics | Finite stage `K[S]/(Sᵖ−1)` has dimension p and is reduced in characteristic zero; in characteristic p its reduced uniform quotient is K. For g=0 the uniform quotient is K. | Choosing one root in a field would lose branches; keep. |
| §3.1 coreflection | Perfectoid K; characteristic-p ordinary disc `K⟨T⟩` | Counit on K is identity. Compatible roots of a nonconstant monomial T are absent in `K⟨T⟩`, whereas constants have roots; the coreflection cannot act as identity on this disc. | Perfectoid/coreflection distinction retained; keep. |
| §3.3 almost perfectoid | `B=K+(T₁^{1/p^∞}P)^−+(T₂P)^−` | Every `T₁^{1/p^k}P⊂B`; the quotient P/B is killed by each such root. `T₂∈B` but `T₂^{1/p}∉B`. | Almost perfectoid is strictly weaker; keep. |
| §3.4 annular norms | Standard annulus, j≥1 and j=0 | `(ϖʲ/T)^{1/p}` has spectral norm one and quotient norm `q^{−j(1−1/p)}>1`. At j=0, `T^{-1/p}=T^{1−1/p}U`, both norms one. | Distinct unit balls correctly stated; keep. |
| §3.5 limit lemma | T acts as zero; r=0 | At j=0, `0·u=1` forces zero ring. For j≥1, stages are `k_K[U^{1/p^∞}]`; transitions kill positive powers of U; limit is `k_K`. Kernel of `K°/ϖ^r→k_K` is `K°°/ϖ^r`. At r=0 all rings are zero. | Product-root almost setup is essential; keep. |
| §3.6(2), existing headline | g unit; `B=K+(Σ T₁^{1/p^m}P)^−`, g=`T₁` | Unit case both sets are `R°`. In second case saturation is `P°`; `T₂=(T₁T₂)/T₁` belongs, but a monic equation would specialize to one over `K°`, contradicting transcendence of T₂. | Complete integral closure cannot be replaced by integral closure; keep. |
| §3.6(3), missing headline | `R=K×K`, g=`(1,0)`; g=0 | Localization/saturation are `K/K°` in the product case and `0/0` in the zero case. Finite-module power containment over K° forces norm≤1; for b=ϖ⁻¹ norms `q^{-n}` have no finite bound. | Native statement is meaningful without regularity; add R02. |
| §3.7 largest algebra | Disc; characteristic-p B above | Disc saturation/coreflection gives A. For B, saturation gives P°, inversion gives P, and `T₂∉B` but `T₂∈P`. | Largest algebra may enlarge B; fix pointer only, R05. |
| §3.8 uniform limits | Constant perfectoid K; two-stage isomorphism | Limit is K; all five conditions hold. Reduction `K°/ϖ→K°/ϖ^{1/p}` is onto. For an identity transition the limit equals its stage, not a new completion. | Implication direction preserved; keep. |
| §§3.9–3.10 nested systems | Zero system; `A[j]²`; square-zero system | `lim¹0=0`; product system limit is A² in the disc case. `ε²=0` with ε≠0 excludes `A[j][ε]/(ε²)` despite base-change isomorphisms. | Category needs both perfectoidness and base change; keep. |
| §3.11 nested-systems headline | Standard annuli and zero system | `ulim A[j]=A` for the disc, localizing returns A[j], and unit is identity. Zero gives `ulim0=0`, `ς(0)=0`. Morphism sets in adjunction both identify with compatible maps on these systems. | Left quasi-inverse/right adjoint orientation correct; keep. |
| §4.1 Galois conventions | Swap on `K×K`; `ℤ→ℤ[i]` | `(1,0)⊗(0,1)` maps to `((0,0),(0,1))` with André's convention, and `((0,0),(1,0))` with A4.2's. Swapping tensor factors interchanges them. Integral Gaussian Galois-map determinant is ±4, so it is not an unramified torsor at 2. | Convention and ramification controls correct; keep. |
| §4.2 closure and rigidity | Ranks 1,2,3,0; split G-torsor | Frame counts are `1!,2!,3!=1,2,6`; stabilizers have orders `1,1,2`. Rank-zero algebra cannot factor a faithful torsor over nonzero R. In a split G-torsor, the invariant ring is the diagonal R. | Correct mathematics; use existing owner, R01. |
| §4.3 envelopes | Split degree d and zero cover | `B_j=A[j]^d`, `B=Riemann(A)^d`; d=0 gives zero. `1/T` lies in the algebraic annular limit with norms `q^{-j}`, not in the bounded uniform limit. | Trace-injectivity route uses the correct limit; keep. |
| §4.4 integral almost étaleness | g=1, split degree two; characteristic p | Integral model modulo pᵐ is `(A°/pᵐ)²`; Galois tensor map permutes four standard basis vectors. In characteristic p and m≥1, pᵐ=0 and the assertion is the unmodded one. | Correct hypotheses and characteristic split; keep. |
| §4.5 ramified almost purity | Identity and tame `Y^ℓ=T`, ℓ prime to p | Identity goes to the root saturation. Bézout `a pᵏ+bℓ=1` gives exponent `1/(ℓpᵏ)=a/ℓ+b/pᵏ`; envelope is `K⟨T^{1/ℓp^∞}⟩`, degree ℓ generically. | No good-prime-only restriction on the general theorem; keep. |
| §§4.6–4.7 envelope headline | B′=0; B′=A[1/g]; split degree two | Zero envelope has structure-map kernel A. Identity envelope has unit-ball saturation. Split trace `(x,y)↦x+y` sends `(1,0)` to one, including p=2. | Faithfulness only where needed; keep. |
| New §4.7 trace headline | Base `R=K×K`, `B′=K×R`, g=1 | R-ranks are (2,1). Projective trace of `(x,(y₁,y₂))` is `(x+y₁,y₂)`, onto K°×K° on the integral model. A global-free-only trace would give zero. | Finite-projective trace is essential; correct A/R° prose, R03. |
| §4.8 reduced affinoid envelope | B=A; B=A²; zero algebra | At g=1, envelopes are P and P². Zero algebra has no finite injective normalization from the stated nonzero Tate algebra. | Choice of normalization and g retained; keep. |
| §§5.1–5.2 purity and almost flatness | `2ℤ⊂ℤ`; `ℤ→ℤ[1/2]`; m=0 and m=V | Tensor with 𝔽₂ sends the nonzero generator of `2ℤ/4ℤ` to zero. `𝔽₂⊗ℤ[1/2]=0`. For m=0 every module is almost zero; m=V recovers ordinary injectivity/flatness/faithfulness. | Definitions exclude plausible wrong models; keep. |
| §5.3 Krull detection | Non-Noetherian valuation ring, M=residue field | `M=K°/K°°≠0`, annihilated by the idempotent maximal ideal; dropping Noetherian would force M=0 incorrectly. | Noetherian condition retained; keep. |
| §5.4 Kummer carrier | n=0,p=2,g=1; n=1,g=T,j=l=1 | `Φ₂(ζ₁)=1+ζ₁`, hence ζ₁=−1. Stage (0,1) is `ℚ₂[X]/(X²−1)=ℚ₂²`, normalization `ℤ₂²`. For g=T the polynomial factors as `∏(X−ζ^a T^{1/p})`; distinct nonzero factors multiply to zero. | All branches and non-domains retained; correct citations, R05. |
| §5.4 nontrivial idempotent | n=0,p=2,g=2,j=3,l=1 | `u=ζ₈+ζ₈⁻¹` has u²=2. In `K₃[X]/(X²−2)`, `e=(1+X/u)/2` has e²=e, e≠0,1. | A chosen-field-root model would discard e; keep. |
| §5.5 spectral norm and ideal | Above idempotent; p=2,3 | `‖e‖=‖1−e‖=1`, but `‖e(1−e)‖=0`; power-multiplicativity still holds. With v(p)=1, `v(ζ_{p²}−1)=1/2,1/6` for p=2,3; next roots divide the valuation by p. | Norm is not generally multiplicative; root ideal is idempotent; keep. |
| §§5.6–5.7 tubes and flatness | j=k′=0; coefficient reduction | Modulo the stage uniformizer the tube is `k⟦T_i⟧[Z,U]/(Z−g₀)=k⟦T_i⟧[U]`. General monic degree `p^{j−k′}` gives basis `Z^a U^b`, `a<p^{j−k′}`. | Residue flatness and nonzero fibers; hypotheses `j≥k′`, coefficient in base stage retained. |
| §5.8 flatness headline | n=0; compatible evaluation in C_p | Normalized stages are torsion-free over the cyclotomic valuation ring, so tensor kernels are zero. A compatible evaluation of the completed tower has image containing the base and does not kill one, detecting the faithful case. | General theorem is deeper than this valuation-ring control; keep. |
| §5.9 purity headline | p=2,g=1,j=0,l=1; g=p and j=0 | Diagonal `ℤ₂→ℤ₂²` has retraction first projection. For the Eisenstein root stage of p, basis `1,p^{1/p},…,p^{(p−1)/p}` has coefficient-of-one retraction. | Both split and ramified finite controls are pure; keep full headline. |
| §§5.10–5.11 generic flatness and model | Split two-branch completion | The lower-shriek model consists of pairs with equal residues; `(1,0)` is excluded while `(c,0)` belongs for every c in the maximal ideal. After inverting such a c it contains `(1,0)` and becomes the full product. | Model can be strictly smaller integrally; keep. |
| §5.12 ramified flatness headline | m=0; B=A; forbidden zero B | At m=0 quotient is zero. At B=A the integral closure differs from the tower by a quotient killed by the g-root ideal. B=0 would destroy faithfulness and is excluded by the injective structure-map binder. | Full finite-faithful hypothesis and correct ideal survive; keep. |
| Declared complete Nakayama contract | `ℤ_(p)→ℤ_p`; `ℤ_p→ℤ_p⊕ℚ_p` | Both reduce to identity on 𝔽_p but are not onto. The first lacks complete source; the second lacks separated complete target. | Both completeness hypotheses necessary; contract valid. |
| Declared principal flatness contract | C=ℤ,M=𝔽_p,f=p; C=`ℤ_p[x]`,M=`ℚ_p` with x=0 | First has flat special/generic fibers but `Tor₁=𝔽_p≠0` and f is not injective. Second has special fiber zero but generic module `ℚ_p[x]/(x)` is not flat. | Regularity and generic-fiber hypotheses necessary; contract valid. |

### Ownership, pins, supplier order and gaps

The board-package index and the supplied open-PR index were read before making absence claims. `roadmaps show` and object-based `roadmaps grep` were used against main and the indexed heads. The overlaps report has no second copy, conflicting head, dropped cited id, or id available only in an open revision. Its empty conflict lists do not detect the object overlap in R01.

Read the scopes of all eight distinct roadmaps in the three closest lists: DirectSummandsAndBigCohenMacaulay (#1735), PerfectoidQuotients (#1042), PerfectoidTowers (#816), RelativeFarguesFontaine (#1209), ArcTopologyAndDescent (#1755), PerfectoidSpaces, AdicEtaleGeometry and AdicSpacesPartIV. The open numbers identify the heads checked here; they are not proposed README citations. The only duplicate construction found is A4.3's Galois closure. No same fully qualified Lean declaration was found elsewhere. Derived tensor products, perfected Tate algebras, ordinary almost purity, monic-root pairs and generic adic localization are imported; the package's extra norm formulas and ramified comparisons have their own mathematical content.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotients, PerfectoidTowers, RelativeFarguesFontaine, ArcTopologyAndDescent, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartIV; almost algebra, perfected Tate algebras and ordinary almost purity belong to PerfectoidSpaces; monic-root pairs to PerfectoidQuotients §1.4; finite étale torsors and symmetric-group Galois closures to AdicEtaleGeometry A4.2–A4.3 (R01); ramified Riemann extension, root saturation and this Kummer tower to PerfectoidSpacesPartII; direct summand conclusions to DirectSummandsAndBigCohenMacaulay. No additional shared ownership was found with the other listed scopes.

Cross-roadmap references were resolved at main or the supplied open heads. Representative file-and-line anchors, including the actual consumed statements rather than only names:

| Supplier file | Sections and current anchors | Contract checked |
| --- | --- | --- |
| `TauCetiRoadmap/PerfectoidSpaces/README.md` | P0.1 :879; P0.2 :965; P0.3 :1042; P0.6 :1262; P0.8 :1447; P0.9 :1562; P0.11 :1714; P0.12 :1832; P0.14 :2034; P0.16 :2161 / :2206; P0.25 :3029; P0.26 :3143; P0.27 :3220 / :3251 | Basic setups, compatible roots without regularity, adjoints, almost algebra, traces, descent, change of setup and almost-zero inverse limits. Complete Nakayama and principal flatness are the explicit gaps below, not claimed supplied. |
| Same file | P1.1 :3583; P1.2 :3702; P1.4 :3843; P1.5 :3965; P1.7 :4079; P1.11 :4355; P1.24 :5049; P1.25 :5101; P1.27 :5197; P1.29 :5289; P1.30 :5423 | Complete Hausdorff Tate hypotheses, characteristic p, tilt and sharp, field criterion, integral comparison, filtered colimits, perfected Tate algebras. |
| Same file | P2.2 :6207; P2.3 :6235; P2.4 :6427; P2.13 :7391; P2.16 :7652; P3.3 :8176; P3.10 :8628; P3.11 :8649; P3.12 :8688; P3.13 :8746; P4.15.4 :11144 | Approximation, rational localization/restrictions, tensor-plus comparison, ordinary almost purity; later comparison citation is an ownership boundary. |
| `TauCetiRoadmap/PerfectoidQuotients/README.md` (#1042) | §1.4 :1193 | Monic-root pairs; the P=T−g specialization used here is within its hypotheses. |
| `Completed/AdicSpaces/README.md` | §2.2 :378; §3.1 :461 | Rational subsets and localization. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md` | R0.3 :1769; R0.4 :2270; R0.9 :4071 | Completed tensors, spectral norm/uniformization and Noether normalization. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md` | R3.5 :10179, norm clauses :10371 / :10444; R3.9 :12470 | Uniform spectral norm and Gel'fand spectrum. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md` | A4.2 :9246, alias :9267; A4.2a :9376; A4.3 :9428 | Classical torsor map and descent; A4.3 overlap R01. `Algebra.galoisTensorMap` is an explicitly planned alias, resolving the automated citation lead. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md` | Mapping :38; §0.K.1 :649; §0.2 :794; §1.1 :1865 | §1.T.1 is preserved by the old-number mapping; Koszul complexes, derived tensors, towers and Milnor sequence remain resolvable. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` | E2:towers.2 :1401 | Ordinary pro-zero comparison, distinct from the almost-pro-zero targets. |
| `TauCetiRoadmap/DerivedDeRhamCohomology/README.md` (#868) | §1.10 :536 | Noetherian, complete, torsion-free ordinary faithful-flatness criterion. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md` (#1034) | §1.13 :304 | Flat completion over a Noetherian base, with Jacobson-radical hypothesis for faithfulness. |
| `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md` (#1085); `TauCetiRoadmap/AdicSpacesPartV/README.md` (#2133) | §1.3 :448; §1.7 :447 | Scope comparisons, not suppliers or upward Needs edges. |

The prescribed dependency check returned:

```text
depcheck: 208 roadmaps, 1899 edges, 0 problem(s)
```

Every Needs line and supplier citation was read. There is no UPWARD or CYCLE line and no forbidden supplier. The two exact declared gaps have matching slugs, named supplier, section and needs in `packages/PerfectoidSpacesPartII/design/plan.json` and README Exact supplier contracts:

- `complete-almost-nakayama`, PerfectoidSpaces P0.26: the I-adically complete almost-module epimorphism criterion. P0.26's tight finite-generation form at :3168 is weaker. GR03 line 5509 supports the complete filtered argument; surjectivity on the associated graded follows from the degree-zero hypothesis for the I-adic filtration.
- `principal-almost-flatness`, PerfectoidSpaces P0.11: regular f on C and M, flatness modulo and after inverting f. P0.11's definition/Tor criterion does not supply this gluing theorem. GR03 line 5263 specializes at A=C, with Tor₁(M,C/f)=ker(f on M) and Tor₂=0.

Both are precise, minimal contracts, not findings. Because this verdict is needs changes, review.json does not claim conditional acceptance.

Pinned declarations were inspected by object as well as name. The 86 identifier occurrences in the Mathlib/Tau Ceti contracts resolve to their stated objects except R04. Important native definitions and comparisons are:

| Pin file and line | What was read, including limits of the native notion |
| --- | --- |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27` / :32 | `IsAlmostIntegral` uses one regular multiplier; `completeIntegralClosure` uses that predicate. The package deliberately uses finite-submodule power containment for its relative closure statements. |
| `Mathlib/RingTheory/Finiteness/Defs.lean:46` / :121 | `Submodule.FG` is finite spanning; `Module.Finite` is finite generation of top. These carriers suffice for R02. |
| `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:223`; `Mathlib/GroupTheory/MonoidLocalization/Away.lean:140` | Actual integral closure and localization at powers, including the zero localization. |
| `Mathlib/RingTheory/Flat/Basic.lean:114`; `Mathlib/RingTheory/Flat/Tensor.lean:89`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64` / :385 | Ordinary flatness and faithful flatness, not the arbitrary-idempotent-ideal almost predicates stated here. |
| `Mathlib/LinearAlgebra/Trace.lean:75`; `TauCeti/LinearAlgebra/Trace/Projective.lean:72` / :96 / :118 / :147 / :158 | Ordinary trace has the zero fallback without a finite basis. Projective trace uses finite-projective duality, including products, cyclicity and base change. |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86` / :102 / :108 | Perfectoid predicate, uniformity and reducedness. Completeness and Hausdorffness are separate explicit headline binders. |
| `TauCeti/RingTheory/Huber/Basic.lean:163` / :186 / :213 / :474; `TauCeti/RingTheory/Huber/Bounded.lean:109`; `TauCeti/RingTheory/Huber/PowerBounded.lean:121` / :456 / :482 / :598; `TauCeti/RingTheory/Huber/Uniform.lean:71` | Pairs of definition, pseudouniformizers, Tate/uniform structures, bounded powers, power-bounded subring and nilpotent ideal; these do not choose an arbitrary normed stand-in. |
| `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311`; `TauCeti/RingTheory/Huber/LocalizationTopology/Completion.lean:242`; `TauCeti/RingTheory/Huber/LocalizationTopology/CompleteSeparated/Basic.lean:91`; `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean:117` | Denominator condition, structure map, completed localization and completed plus ring, with their actual parameters. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean:146` / :319; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219` | Rational subset/open and comparison map in the correct inclusion direction. |
| `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Stalk/Basic.lean:58`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/GlobalSections.lean:81` / :199; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Plus/Basic.lean:116` / :151 / :225 | Ordinary presentation-limit sections, the canonical map, plus presheaf and its inclusion/comparison. These make the §1.5 statement native. |
| `TauCeti/RingTheory/Almost/BasicSetup.lean:252` / :261; `TauCeti/RingTheory/Almost/Module.lean:75` / :86; `TauCeti/RingTheory/Almost/RootSetup.lean:62` / :92 / :107 | Actual almost-zero/module carriers and compatible-root setup. The module category is not a bundled almost-finite-étale algebra API. |
| `TauCeti/CategoryTheory/Functor/ProZero.lean:67` / :97 | Ordinary pro-zero and limit vanishing; does not assert almost-pro-zero derived-limit vanishing. |
| `Mathlib/CategoryTheory/Linear/LinearFunctor.lean:36`; `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Scalar-compatible functors, Tor of objects, derived category and Ext. No replacement by module-only tensors was accepted for §1.3. |
| `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175` and its surrounding binders | Finite integral closure over an integrally closed Noetherian domain in a finite separable field extension; its filename does not restrict the theorem to Dedekind bases. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:57` / :172; `Mathlib/RingTheory/AdicCompletion/Algebra.lean:97` / :103 | Separated complete condition and actual compatible-sequence completion, with ring/algebra structures. |
| `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86` / :374; `Mathlib/Algebra/MvPolynomial/Basic.lean:80`; `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227` | Native Witt vectors, formal power series, coordinates and polynomial relations; index-zero cyclotomic convention does not enter the primitive p-root relation. |
| `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:35`; `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:672`; `Mathlib/RingTheory/Etale/Basic.lean:205`; `Mathlib/Algebra/Module/Projective.lean:71` | Adjoin, inclusions, étaleness and projectivity are actual definitions, not free Prop placeholders. |
| `Mathlib/RingTheory/Filtration.lean:393`; `Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean:46` | Krull-intersection input; scheme-theoretic universal injectivity is not module purity of ring maps. |

Object searches found no pinned theorem already proving the retained ramified/Kummer headlines. Categorical cardinal-purity and ideal-purity hits have different carriers; ordinary tensor-injectivity criteria are cited inputs, not copies of the almost statements. The prior library-near-match file was treated as leads, not proof of absence.

### Source independence and arrangement

Compared the fifteen seeded passages and five additional passages: §0.1's definition against BHATT18 line 309; the complete-Nakayama contract against GR03 line 5509; §1.1's rational model against SCHOLZE12 line 1393; the new trace docstring against ANDRE18A line 3186; and §5.7's proof plan against ANDRE18B line 485. No copied non-mathematical sentence, translated expository passage, borrowed exercise list, table or figure was found. Shared formulas and standard mathematical vocabulary are unavoidable expressions of the assertions.

For a reproducible citation count, count author-key occurrences immediately followed by an explicit section/theorem/lemma/proposition/corollary/remark/definition/example/notation/annex locator in the text from Conventions through Worked examples, excluding References and the opening source-overview table: ANDRE18A 67, ANDRE18B 28, BHATT18 21, GR03 9, SCHOLZE12 1; total 126. Repeated locators count as repeated citations.

Read ANDRE18A's contents at line 14. The coarse correspondence is Layer 2 ↔ §2, Layer 3 ↔ §§3–4, Layer 4 ↔ §§1.9, 4.4, 5. This is not a one-to-one chapter run: closure material is pulled into §2.1, the Weierstrass material comes from ANDRE18B, limits and coreflection are regrouped, and classical Galois tools occur where the ramified envelope needs them. The order 2→3→4 is also forced by §3.6's root-saturation/localization inputs and §4.3's nested-systems/Riemann-extension inputs. Layer 1's quantitative route is independent until the Kummer application; Layer 5 uses both routes and two sources. The source table of contents was not used as sufficient evidence of independence; the actual Needs lines were compared.

Source independence: 20 passages compared with 5 sources; no non-mathematical copying found. Largest share ANDRE18A, 67 of 126 explicit author-plus-locator citations under the counting rule above. Contents compared with ANDRE18A: independently selected and regrouped, with the common coarse order forced by dependencies.

Maintainer notes: none were supplied.

## Not verifiable

- No required source text or contents page was inaccessible. All five manifest works and the separately cited ANDRE18B v1 passage were available legally.
- The automated `exact?` search was stopped after five minutes; no claim of an exhaustive exact-lemma search is made. All nine required one-tactic probes with `simp`, `rfl` and `infer_instance` completed, and relevant pinned candidates were inspected.
- Elaboration verifies the target types, not the admitted proofs. The mathematical checks above are source comparisons and explicit adversarial instances.

## Source issues

These are errors or gaps in the sources that the package already corrects; they are not additional package findings.

- **Error** in ANDRE18A at Remarque 2.6.4(1), p. 29: the source says restrictions between uniformized Laurent localizations are injective; it should be that a restriction can kill a factor, as in the product-ring example above; affects a stated result.
- **Error** in ANDRE18A at §2.6.2 property list, p. 28: the source says the image norm equals the infimum of norms of denominator multiples; it should be the Banach quotient norm, giving q² instead of q in the product example; affects a stated result.
- **Gap** in ANDRE18A at Lemme 2.6.3 proof, p. 29: the source says injectivity follows from that norm formula and lower bound one; it should be proved by spectral-point detection, with the elementary lower bound corrected to the norm of the element; affects the proof.
- **Misprint** in ANDRE18A at formula (2.17), §2.5.3(1), p. 26: the source says to invert p in the saturated integral ring; it should be to invert the pseudouniformizer, since in characteristic p inverting p gives zero; affects a stated result.
- **Misprint** in ANDRE18A at Lemme 2.5.3 proof of (2) ⇒ (6), p. 27: the source says condition (1) supplies the implication; it should be condition (2), which applies to elements in the larger localization; affects nothing.
- **Error** in ANDRE18A at Théorème 0.3.1(1), p. 2: the source says the base embeds in the perfectoid envelope for every finite étale generic algebra; it should be a continuous structure map, injective under faithfulness; affects a stated result.
- **Error** in ANDRE18A at Proposition 4.4.4 proof (3), p. 63: the source says the localized base embeds into the uniform annular limit; it should be the algebraic annular limit, since inverse coordinates have unbounded annular norms; affects the proof.
- **Gap** in ANDRE18B at Théorème 2.5.2 proof step (a), p. 81: the source says generic-fiber flatness follows from an affinoid-polydisc exhaustion; it should include descent to the non-affinoid base, or derive flatness from the integral model; affects the proof.
- **Misprint** in ANDRE18B at §1.2.1 formula (2), p. 77: the source says the discrete-valuation condition with a misplaced conjunction; it should be the condition that the valuation is discrete; affects nothing.
- **Error** in ANDRE18B at introduction §0.6, p. 74: the source says the defining union adjoins roots of unity and of g only; it should also adjoin coordinate roots, without which g=1 leaves Frobenius missing a coordinate; affects a stated result.
- **Misprint** in ANDRE18B at Annexe A.4 first paragraph, p. 92: the source says the intermediate almost-injective arrow points from the intermediate module back to the source; it should point from the source to the intermediate module in the factorization; affects nothing.
- **Misprint** in ANDRE18B at proof of Lemme A.2.1(4), p. 90: the source says the dual uses S-linear maps to R and a single evaluation; it should use R-linear maps and a finite sum of evaluations equal to one; affects the proof.
- **Error** in ANDRE18B at arXiv v1 §5.5, p. 14: the source says module purity tests a ring-map tensor expression with an unspecified algebra; it should tensor the given module map with each test module; affects a stated result; corrected in print at Annexe A.4, p. 92.
- **Gap** in BHATT18 at §1.4 Notation, p. 3: the source says t has compatible roots, with a norm condition only in characteristic zero; it should require a nonzero topologically nilpotent t also in characteristic p; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "204d34d10719ab3eaf6c23a9baf104a50a66860a", "job": "REV-PKG-PerfectoidSpacesPartII~7", "model": "gpt-6-astra", "worker": "chris-8"} -->
