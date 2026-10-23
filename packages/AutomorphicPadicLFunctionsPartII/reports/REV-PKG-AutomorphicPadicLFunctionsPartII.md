<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1015#issuecomment-6376599221 -->
Review (claude) of f8feb07

Verdict: needs changes

1. **F01** (P1) The base roadmap and the CM-field Katz measure exist at no readable head

   - **Location.** README line 3, "extends the ray-class distributions and CM-field Katz interpolation of AutomorphicPadicLFunctions", and line 1185 (§8.5), "compare with the CM-field Katz measure under the same periods, Artin convention, local factors and primitive/imprimitive convention".
   - **Claim.** The README says where the base roadmap AutomorphicPadicLFunctions stops (lines 3 and 7), and §8.5 compares its measure with a CM-field Katz measure that this base is supposed to own.
   - **Witness.** No `TauCetiRoadmap/AutomorphicPadicLFunctions` on main (dfdf9a3). `roadmaps show` finds it in none of the 331 open pull requests. It is absent from `scratch/board-packages-index.txt`, from `packages/` and from `merge-order/ORDER.txt`. The board-issue search returns 0. `roadmaps grep` finds no roadmap that owns a Katz measure.
   - **Repair.** Delete the Katz comparison from these places:
     - §8.5, the sentences from "At L=K, tame conductor f=O_K" to "arbitrary admissible critical types and tame f.";
     - the §8.5 proof-route sentence "Compare with CM-field Katz comparison only at L=K, …";
     - the second clause of the fourth §8.5 Check;
     - the Scope sentence "Only the CM-field comparison at the end uses the narrower Katz overlap.";
     - "the CM-field Katz comparison" and "the Katz measure interface" in the `Suggested.lean` docstring.

     Rewrite the first Summary sentence and the "base program stops" sentence (line 7) so that the boundary is stated against roadmaps that exist (GlobalNumberFields, ComplexMultiplicationAndExplicitReciprocity, PadicMeasuresIwasawaAlgebras).

     Tested at L=K=ℚ(i), f=O_K, p=5: every Katz type −kΣ−Σd(σ)(σ−σ̄), with k≥1 and d≥0, has α=k+d≥1 and β=d≥0. It is therefore critical, §8.5's own μ_f interpolates it, and density makes μ_f unique, so no interpolation statement is lost.

     If a human instead puts AutomorphicPadicLFunctions in the merge order at a readable head, cite its Katz-measure section by name and repeat the parent check (see Not verifiable).

2. **F02** (P1) Three declared gaps have supplier `none`

   - **Location.** In `design/plan.json`, the top-level `gaps` records AutomorphicPadicLFunctionsPartII:G1, G2 and G3 have the keys `id,title,detail,neededBy` only. README line 754 (§5.4) reads: "lies in [O_f×:Γ₀] times the integral critical tensor line whenever the full-unit normalized value is claimed integral".
   - **Claim.** Each record is a declared prerequisite with no owner.
   - **Witness.** None of the three has a `supplier` or a `section`. `grep 'gap:AutomorphicPadicLFunctionsPartII'` on the README finds nothing. Yet each obligation is already stated as a target of this roadmap: G1 in §8.3 (the sign comparison), G2 in §8.4 (uniform bounded division) and G3 in §5.4 (unit-index descent).
   - **Repair.**
     - Record this roadmap as the owner of G1 (§8.3), G2 (§8.4) and G3 (§5.4), or retire the three records as owned here.
     - In §5.4, replace the clause conditional on a claim with an unconditional target: "for every finite-index torsion-free Γ₀⊂O_f× fixing h and x, EK^(β,a)_(Γ₀)(h,x) lies in [O_f×:Γ₀] times the integral critical tensor line over R[1/(f N(bc))]".
     - Tested on d=1, O_f×=μ₂⊃Γ₀=1: the restated target is exactly integrality of EK_1/2, which the conditional wording assumed rather than stated.

3. **F03** (P2) §3.4 re-plans ThetaSeries Layer 1 instead of citing it

   - **Location.** README line 544: "choose a real lattice basis and reduce lattice Poisson summation to iterated native SchwartzMap.tsum_eq_tsum_fourier on ℤ". Line 40: "The lattice continuation iterates Poisson summation and retains the real change-of-basis determinant."
   - **Claim.** Lattice Poisson summation is proved here from Mathlib's one-dimensional theorem.
   - **Witness.** `TauCetiRoadmap/ThetaSeries/README.md` on main, lines 50–60, owns Poisson summation for full-rank ℤ-lattices together with its dual and covolume lemmas: "whichever later needs them consumes them from here". Its items 1B–1D (lines 452–472) are this route. The README never mentions ThetaSeries.
   - **Repair.**
     - Add a `### From TauCetiRoadmap.ThetaSeries` contract that consumes Layer 1 (`poissonSummation` 1A, summability 1E, the Gaussians of 1F) and `dual_dual` (2A) and `covolume_dual` (2C). Apply them in the Euclidean model of (ℂ^d, Re H) reached by x↦(√h_i·x_i), with Λ*=i·Λ^∨, where Λ^∨ is the dual for Re H.
     - In §3.4, replace the first route sentence with "apply ThetaSeries Layer 1 to x̄^ν·exp(−πt‖x‖²_H)·exp(2πi⟨x,w⟩)".
     - In the §3.4 *Needs:*, replace `SchwartzMap.tsum_eq_tsum_fourier` with "ThetaSeries Layer 1 (1A, 1E, 1F), 2A, 2C".
     - Delete the sentence at line 40, and name ThetaSeries in Scope as the owner of lattice Poisson summation.
     - Tested: for h=1 and Λ=ℤ[i], the Re-H dual is ℤ[i] and i·ℤ[i]=ℤ[i]=Λ*. For h=2, the Re-H dual is ½ℤ[i] and i·½ℤ[i]=½ℤ[i]=Λ*.

4. **F04** (P2) The statable functional equation and residue of §3.4 are missing from `Suggested.lean`

   - **Location.** `Suggested.lean` lines 67–81 state continuation and pole order only. README §3.4 (line 538) says the completion satisfies the functional equation and gives K the residue π^d/(Γ(d)vol_HΛ) at d. README line 509 only says "Periods and the chosen H fix the covolume vol_HΛ".
   - **Claim.** The headline target of §3.4 consists of continuation, the functional equation and the corrected residues, but the acceptance test states only the first.
   - **Witness.** The block below elaborates at the pins (`lake env lean`, only `sorry` warnings), using Mathlib `ZLattice.covolume` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean:72`) and `Complex.Gamma`. vol_HΛ needs the factor ∏h_i: at h=2, Λ=ℤ[i] the Lebesgue covolumes of Λ and Λ* multiply to ¼, not 1.
   - **Repair.**
     - Add the theorem below to `Suggested.lean`.
     - Backtick `kronecker_functional_equation` in §3.4.
     - Define vol_HΛ in §3.3 as (∏h_i) times the Lebesgue covolume, which is the volume for the metric Re H.
     - Add the h=2 instance as a Check.
     - Tested on ℚ(i), z=w=0, h=1: Λd=ℤ[i] and vol=1. The identity is the symmetry of the completed Dedekind zeta function (|d_K|=4), and the residue is 4·π/4=π.

   ```lean
   /-- Functional equation and residue of the generalized Kronecker series (Kings–Sprang v4,
   Proposition 3.13, with the phase `exp(2πi⟨w,z⟩)` of its proof and the residues of the
   gamma completion). `Λd` is the dual lattice for `Im H`, and `(∏ i, h i) * ZLattice.covolume Λ`
   is the covolume `vol_H Λ` for the metric `Re H`. -/
   theorem kronecker_functional_equation
       (d : ℕ) (hd : 0 < d) (Λ Λd : Submodule ℤ (Fin d → ℂ))
       [DiscreteTopology Λ] [IsZLattice ℝ Λ]
       (h : Fin d → ℝ) (hh : ∀ i, 0 < h i)
       (hΛd : ∀ l, l ∈ Λd ↔ ∀ m ∈ Λ, ∃ n : ℤ, (hermitianPairing h l m).im = n)
       (ν : Fin d → ℕ) (z w : Fin d → ℂ) :
       ∃ F G : ℂ → ℂ,
         (∀ s : ℂ, (d : ℝ) + (∑ i, (ν i : ℝ)) / 2 < s.re →
           HasSum (fun l : Λ => kroneckerTerm h ν z w s l) (F s)) ∧
         (∀ s : ℂ, (d : ℝ) + (∑ i, (ν i : ℝ)) / 2 < s.re →
           HasSum (fun l : Λd => kroneckerTerm h ν w z s l) (G s)) ∧
         (∀ s : ℂ, s ≠ (d : ℂ) → AnalyticAt ℂ F s ∧ AnalyticAt ℂ G s) ∧
         (∀ s : ℂ, (∀ n : ℕ, s ≠ -n) → (∀ n : ℕ, ((d + ∑ i, ν i : ℕ) : ℂ) - s ≠ -n) →
           s ≠ (d : ℂ) → ((d + ∑ i, ν i : ℕ) : ℂ) - s ≠ (d : ℂ) →
           (Real.pi : ℂ) ^ (-s) * Complex.Gamma s * F s =
             Complex.exp ((2 * Real.pi * Complex.I) * (hermitianPairing h w z).im) /
               (((∏ i, h i) * ZLattice.covolume Λ : ℝ) : ℂ) *
             ((Real.pi : ℂ) ^ (-(((d + ∑ i, ν i : ℕ) : ℂ) - s)) *
               Complex.Gamma (((d + ∑ i, ν i : ℕ) : ℂ) - s) *
               G (((d + ∑ i, ν i : ℕ) : ℂ) - s))) ∧
         (ν = 0 → w ∈ Λd → Filter.Tendsto (fun s => (s - d) * F s) (nhdsWithin (d : ℂ) {(d : ℂ)}ᶜ)
           (nhds ((Real.pi : ℂ) ^ (d : ℂ) /
             (Complex.Gamma d * (((∏ i, h i) * ZLattice.covolume Λ : ℝ) : ℂ))))) ∧
         (w ∉ Λd → AnalyticAt ℂ F (d : ℂ)) := by
     sorry
   ```

   The hypotheses `s ∉ −ℕ` and `d+|ν|−s ∉ −ℕ` keep the junk value `Complex.Gamma (−n) = 0` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:344`) out of the identity. `hΛd` characterizes the dual exactly; it is an additive subgroup, so the hypothesis is satisfiable and determines Λd.

5. **F05** (P2) Two declared gaps ask for results main already supplies

   - **Location.** README line 70 (gap:equivariant-poincare-limit): "…, affine evaluation into group cohomology and …". README line 88 (gap:group-torus-comparison): "native discrete group-to-singular local-coefficient comparison for finite-rank free abelian groups on their logarithmic universal covers, naturally under finite-index maps". The same `needs` text is in `design/plan.json`.
   - **Claim.** These comparisons are missing from their suppliers.
   - **Witness.**
     - SchemeAndStackFoundations §2.23 (main, line 4580) supplies H^p(Γ,H^q(X,F))⇒H^(p+q)_Γ(X,F), and §2.6 (line 3474) supplies acyclicity of quasi-coherent modules on affines; together they give the affine collapse.
     - AlgebraicTopology Stage 8 item 8 (line 1853) supplies H*(Bπ;A)≅`groupCohomology` with change-of-group naturality. Items 7 and 5 give finite CW type for the compact torus and Whitehead's theorem.
   - **Repair.**
     - Strike "affine evaluation into group cohomology" from the first gap, and cite SchemeAndStackFoundations §2.23 and §2.6 in the §2.1 *Needs:*.
     - Retire gap:group-torus-comparison and cite AlgebraicTopology Stage 8 items 5, 7 and 8 with Stage 6 in §§2.2–2.3. Its content is these steps: the classifying map Γ\L¹_R→BΓ induces the identity on π₁, Whitehead's theorem makes it a homotopy equivalence, and item 8 identifies the cohomologies.
     - Tested at d=2, Γ=ℤ: the circle Γ\L¹_R and the bar-model BΓ are both K(ℤ,1). The comparison gives H¹=Hom(ℤ,M)=M for trivial M on both sides.
     - Any change to the gap `needs` text has to be made in the plan and in the README together.

6. **F06** (P3) `kroneckerSeries` is padding

   - **Location.** `Suggested.lean` lines 54–58 (`kroneckerSeries`) and line 76: "F s = kroneckerSeries Λ h ν z w s".
   - **Claim.** The definition is needed to state the headline.
   - **Witness.** Its only use is a conjunct that follows in one step from the preceding `HasSum` conjunct. The scratch probe `example … (hs : HasSum (fun l : Λ => kroneckerTerm h ν z w s l) a) : a = kroneckerSeries Λ h ν z w s := hs.tsum_eq.symm` elaborates.
   - **Repair.** Delete `kroneckerSeries` and the conjunct `∧ F s = kroneckerSeries Λ h ν z w s` from `Suggested.lean`. Keep the series in README §3.3 as prose without backticks. The `MeromorphicOn` conjunct is likewise implied by the analyticity and order-one clauses; it may stay.

7. **F07** (P3) Four locator and citation slips

   - **Location and witness.**
     1. Lines 13, 64, 148, 201, 890 and 979 cite "ComplexMultiplicationAndExplicitReciprocity §0.1" for the lifted embedding partition. At its head, §0.1 is "Inverse-coset reflex pairs" for a CM field, and its `CMType` block covers CM algebras only. The lifted type on a totally complex L is asserted in §1.3, `cmHodgeEigenspaces`.
     2. Lines 14 and 74 cite "DifferentialGeometry Layers 0–1 and 9" for integration. On main, integration and Stokes are in Layer 5 (line 503); Layer 9 is Poincaré duality.
     3. Line 211 cites "§4.4, p.52" for the two-auxiliary construction. That construction is in the proof of Theorem 4.10 on p.53 (KS-v4 line 2490).
     4. Lines 18, 1196 and 1212 write "Nonordinary CM special values" where the board roadmap's name is `NonordinaryCMSpecialValues`.
   - **Repair.**
     1. Cite §1.3 (`cmHodgeEigenspaces`) in place of §0.1.
     2. Cite DifferentialGeometry Layers 0–1 and 5.
     3. Change the locator to "proof of Theorem 4.10, p.53, KS-v4 line 2490".
     4. Write NonordinaryCMSpecialValues. It is a boundary deferral, not a supplier.

Scope: `packages/AutomorphicPadicLFunctionsPartII/README.md` (1229 lines, Layers 0–8, 44 targets, every Check and supplier contract), `Suggested.lean` (four declarations), `metadata.toml`, `sources.toml`, and the gap records of `design/plan.json`. There was no previous review. Seven findings: two P1, three P2, two P3. Most of the mathematics is careful, and its witnesses recompute correctly (table below). The blocking defects are about ownership and the acceptance test: a base roadmap that exists nowhere and a Katz comparison nobody owns, three gaps with no supplier, a route that re-plans ThetaSeries Layer 1, a statable functional equation left out of `Suggested.lean`, and two gaps that ask for results main already supplies.

## Adversarial table

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. unitary shift | χ=N^m | Σχ(a)Na^(−s)=ζ_L(s−m); L(χᵘ,s−m)=ζ_L(s−m) | holds | — |
| Conv. alternating form | z=1/2, w=i/2 | ⟨w,z⟩=Im(i/4)=1/4; ⟨z,w⟩=−1/4 | antisymmetric | — |
| 0.1 critical types | ℚ(i), μ=(−2,1); L=ℚ(i,√(1+i)), α=(1,2) | a=1, β=1, w=−1; weight at γ=i is σ(i)^(−2)·σ̄(i)=(−1)(−i)=i≠1, so Γ=1; (1,2) is not a norm pullback | holds | — |
| 0.2 cotangent weights | ℚ(i), γ=i | ω_A: σ(i)⁻¹=−i; ω_A∨: σ̄(i)=−i; Lie: i | holds | — |
| 0.3 invariants | ℚ(ζ₃), μ₆, weight 3σ, M=R/(2) | (−ζ₃)³=−1≠1 over R, ≡1 mod 2, so M^Γ=M≠0 | torsion-free hypothesis present | — |
| 1.1 trace zero | Nc=3; Nc′=5; c=O_L | (2,−1,−1) has trace 0; pullback trace 4·0=0; restriction trace −2; 1−1=0 | holds | — |
| 1.2 residue, limits | d=1, Γ=1 | degree-0 sections with Kronecker residues (KS Remark 2.22) | consistent | gap |
| 1.3 EK class | (1,1) on two points | trace 2≠0, so outside the domain; EK(0)=0 | holds | — |
| 1.4 derivatives | z², z₁z₂ | ∂²=2; ∂₁∂₂=1 | holds | — |
| 2.1 specialization | d=1, Γ=1, a=b=0 | augmentation of the splitting (KS Def. 2.24) | holds | — |
| 2.2 cap and shift | d=1, Γ=μ₂ over ℤ₂; Ru, a=1 | normalized cap sends 1↦1/2∉ℤ₂; shift u⊗u↦u^[2], shuffle gives 2u^[2] | holds | — |
| 2.3 change of group | degree-m circle cover; μ₂⊃1 | ×m; transfer H₀(μ₂)→H₀(1) is ×2 | holds | — |
| 2.4 refined class | [f]=id | equals §2.2, with no 1/Nf | holds | — |
| 2.5 comparison | f=O_L | both sides are the unrefined class | holds | — |
| 2.6 polylog | d=1 | coherent degree 0, de Rham degree 2d−1=1 | holds | — |
| 3.1 Borel model | d=1, 2 | EΓ is a point; dimension 5; |σγ|²r·|σγ⁻¹z|²=r|z|² | holds | — |
| 3.2 current sign | N=2, (p,q)=(1,0) | ∫η∧dω=−∫dη∧ω; (−1)^(3d−1−p−q)=−1 | holds | — |
| 3.3 series terms | ν=1, z+λ=i; ν=(0,1) at (1,0); z=1/2, w=i/2, a=1 | −i; 0; exp(−2πi·(−1/2))=−1 | holds | — |
| 3.3 convergence | general ν | Σ‖λ‖^(|ν|−2Re s)<∞ ⟺ Re s>d+|ν|/2 | holds | — |
| 3.4 functional equation | ℚ(i), z=w=0, h=1 | Λ*=ℤ[i], vol=1; π^(−s)Γ(s)4ζ_K(s)=π^(s−1)Γ(1−s)4ζ_K(1−s) | holds | R04 |
| 3.4 residues | same | Res₁K=4·π/4=π=π^d/(Γ(d)vol); Res₁M=1; K(0)=4ζ_K(0)=−1, Res₀M=−1 | README holds; source misassigns | source issue |
| 3.4 vol_H | h=2, Λ=ℤ[i] | Λ*=½ℤ[i]; Lebesgue 1·¼; H-volume 2·½=1 | README undefined | R04 |
| 3.4 phase | z=1/2, w=i/2 | e^(πi/2)=i; reversed −i; product 1 | holds | — |
| Lean headline | square lattice; 6 one-tactic probes | Re s>1; regular at 0 (K(0)=−1); pole at 1 allowed; simp, rfl, infer_instance, decide, norm_num, aesop all fail | true, not padding | R06 |
| 3.5 contraction | d=1; d=2, j=1 | ι_v(dz∧dz̄)=−v dz; ι(dι)vol=Cv₁v₂(u₂−u₁)∧dz₁∧dz₂=−2Cv₁v₂u₁∧dz₁∧dz₂ | README holds; source sign opposite | source issue |
| 3.5 square lattice | vol(A) | −2i; C=−π; −C(l̄/r)dz=+π(l̄/r)dz | holds | — |
| 3.5 binomial | (A+v)^(−(j+1)) | coefficient of v^b is (−1)^b·C(j+b,b)·A^(−(j+1+b)) | README holds; source lacks (−1)^b | source issue |
| 3.6 current = class | d=1, b=0,1 | the b=1 term has sign opposite to b=0 (row above) | consistent | — |
| 4.1 orbit series | ℚ(i), μ₄⊃1, t=1/3, α=4 | 4 distinct translates; E_(Γ′)=E_Γ; sum over 4 orbits =4E_Γ | README holds; printed Lemma 3.25 false | source issue |
| 4.1 homothety | c∈L× | f(cλ)=c̄^β c^(−α) N(c)^(−s) f(λ) | holds | — |
| 4.2 fibre integral | d=2; s=0 | dlog(ur₁)∧dlog(ur₂)=−2·dlog u∧dlog r₁; ∏Γ(α_i)=a! | holds | — |
| 4.3 sign ε(d,β) | d=1, β=0,1; d=2, β=0 | −1, +1, +1 | consistent; final transport is G1 | — |
| 5.1 periods | ℚ(i); Ω=2, q=1, u=i | dual basis {1/2, −i/2}=(1/(2i))ℤ[i]; Ω∨=πi before and after rescaling | holds | — |
| 5.2 normalizer | α=3; α=(3,2) | 2v/Ω³; 2!·1!=2≠3!=6 | holds | — |
| 5.3 partial L | b=O_L; χ=N | coefficient 1; ζ_L(s−1) | holds (KS Lemma 4.2) | — |
| 5.4 integrality | μ₂⊂O_f× | descent needs the special divisibility (row 2.2) | owned target | R02 |
| 5.5 distribution | Nc=3 | (Nc−1)E(1;a)−Σ_(t≠0)E=Nc·E(1;a)−E(1;c⁻¹a) | holds (KS Prop. 4.12) | — |
| 5.6 χ(b) | b^m=(λ) | χ(b)^m=∏σ(λ)^(μ(σ))∈O_E[1/Nb] | holds | — |
| 5.7 both conductors | f=O_L | factor (1−χ(c′))(χ(c)Nc−1), as in KS Thm 4.10 | holds | — |
| 5.8 period power | L=K; quartic L | [L:K]=1; 2 | holds (KS Cor. 4.14) | — |
| 5.9 Deligne | L_f(χ,0)=0 | ratio 0∈Qbar∖Qbar× | README holds | source issue |
| 6.1 ordinary | ℚ(i), p=5, 3; Gaussian reduction at 5 | 5=(2+i)(2−i); 3 inert; 2+3≡0 connected, 2−3≡4 étale | holds | — |
| 6.2 p-adic periods | ω_A↦uω_A | Ω_p↦uΩ_p (KS Def. 5.7) | holds | — |
| 6.3 theta | index 2 | θ_(Γ′)=2θ_Γ (KS Lemma 5.17) | holds | — |
| 6.4 derivatives | (1+T)²; (1+T₁)²(1+T₂)³ | 4 (ordinary derivative 2); 6 | holds | — |
| 7.1 measure | (1+T)^m; constant c | δ_m with k-th moment m^k; cδ₀ | holds | — |
| 7.2 translation | KS Cor. 5.25 proof | pairing positive, transform inverse | holds | — |
| 7.3 Fourier | ℤ/4→ℤ/2; order 3; n=0 | (1/2,0,1/2,0); (1,ζ,ζ²)↦(0,1,0); δ₀↦(1/3,1/3,1/3); identity | holds | — |
| 7.4 twisted moments | ρ=1 | reduces to KS Thm 5.22 | holds | — |
| 8.1 local factor | 𝔽₃, quadratic character | (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3; with ζ₃: +i/√3 | holds | — |
| 8.2 smoothing atom | Nc=7, χ(c)=2; ζ₅ | 7−1/2=13/2 against 13 (ratio 2); Frob₂⁻¹: ζ₅↦ζ₅³ | holds | — |
| 8.3 weights | α=2, β=1, t=2, s=3 | t²s=12; times t⁻¹: ts=6 | holds | — |
| 8.4 boundedness | C_p, p⁻¹Σδ_g | character values 1 and 0; δ_e↦1/p | holds; source gap | R02 |
| 8.5 interpolation | ℚ(i), p=5, α=2, β=1; u=2 | divisor Ω_p²Ω_p∨; both sides ×1/4 | holds; Katz part unowned | R01 |
| Depletion | values 2, 3 | (1−2)(1−3)=2 | holds | — |

## Verified sound

- **Seeded sample: 15 of 15 locators checked against KS-v4 v4.** Each was checked for theorem number, page, hypotheses and support.
  - 0.2: Def. 1.15, Remark 1.16, (1.3.2)–(1.3.4), Notation 1.18, lines 519–561.
  - 1.4: Defs. 2.21 and 2.23, lines 879–903.
  - 2.1: Def. 2.24, (2.3.3)–(2.3.4), line 918.
  - 3.1: §3.2, (3.2.1), Def. 3.7, Lemma 3.8, lines 1422–1485.
  - 3.6: Def. 3.19, Thm 3.20, Cor. 3.22, lines 1789–1908.
  - 4.2: Lemma 3.26, line 2029.
  - 5.3: Lemma 4.2, line 2215.
  - 5.4: Thm 4.9, (4.3.1), line 2353.
  - 5.5: (4.4.1), Prop. 4.12, line 2442.
  - 5.8: (4.5.1), Cor. 4.14, line 2534.
  - 6.1: Notation 5.1, Defs. 5.2–5.3, Props. 5.4–5.6, lines 2633–2721.
  - 6.2: Def. 5.7, Lemma 5.8, line 2743.
  - 6.4: Defs. 5.18–5.19, (5.4.1), Prop. 5.20, lines 2963–2999.
  - 7.3: Def. 5.24, (5.5.9)–(5.5.11), lines 3228–3313.
  - 8.2: Thm 5.27 proof Steps 2 and 4, lines 3624–3736.
- **Other locators read.** Also read: Def. 3.11 and Prop. 3.13 (the `Suggested.lean` locator), Prop. 2.27, Lemma 3.16, Lemma 3.25, Thms 4.10 and 5.22, Cors. 4.13–4.15, and BKO-2021 line 70. No locator is flagged unverified by the author, and both manifest sources are readable and certified.
- **Elaboration.** `lake env lean` on `Suggested.lean` succeeds in 7 s, with one warning, `declaration uses sorry`, at line 67.
- **Binder check.** `#check @…` for all four declarations shows explicit binders only (no section variables). The elaborated types match README §§3.3–3.4; nothing changed.
- **Padding probe.** The probes simp, rfl, infer_instance, decide, norm_num and aesop fail on the theorem. No `set_option`, no `lemma`, no sorry'd data; the only import is `Mathlib`. The docstring names eight non-statable headlines with their missing carriers; I confirmed that Mathlib and Tau Ceti lack abelian-scheme periods, Hecke L-functions and multivariate Amice theory.
- **Library declarations opened at the pins (18).**
  - `Mathlib/NumberTheory/NumberField/CMField.lean:69`.
  - `.../Units/DirichletTheorem.lean:373` and `:415`.
  - `Mathlib/Algebra/Module/ZLattice/Summable.lean:236` (namespace `ZLattice`), `Basic.lean:433`, `Covolume.lean:72`.
  - `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`, `:97`, `:105`; `Monoid.lean:115`; `AmiceTransform.lean:157` (ℤ_p only).
  - `Mathlib/Analysis/Fourier/PoissonSummation.lean:216` (dimension one; no lattice version at the pin).
  - `.../Gaussian/FourierTransform.lean:352`; `Mathlib/Analysis/MellinTransform.lean:90`; `.../Gamma/Basic.lean:319` and `:344`.
  - `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416` and `:568`.
  - `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` and `Shift.lean:273`. `UnitCompatibility.lean` gives only the forward direction, so gap:unit-type-classification is minimal.
- **Cross-roadmap citations resolved (14 roadmaps).**
  - On main: GlobalNumberFields Layers 2, 7, 9, 10; ClassFieldTheory Layers 7, 11–13; SchemeAndStackFoundations §§2.7, 2.19, 2.20, 2.23; AlgebraicTopology Stage 5 items 3–4, Stage 6, Stage 8 item 8; DifferentialGeometry Layers 0, 1, 9; Hyperfunctions HF2.AnalyticPreparation.CurrentResolution (its (−1)^p homotopy and unsigned regularization agree with README line 82); PadicMeasuresIwasawaAlgebras §§0.1, 1.2, 1.7, 2.1, 2.2, 3.1.
  - At open heads: AbelianSchemesAndArithmeticModuliPartII P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3 (fe15b14; the ranks 3 and 6 are stated there, and it stops before EK classes); ComplexMultiplicationAndExplicitReciprocity §0.1, §1.3 (0c6c6e2); ComplexComparisonPartII C1.1, C5.1, C5.4 (2d50a88; C5.4 contains `CurrentCalculus`); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7, R07.1.9, R07.1.13 (34f4657); AutomorphicLFunctionsAndLocalFactors, the AL.0 and AL.1 subsections named in the README (5d22a23).
  - Board package: PeriodsAndSpecialValues PS.0, PS.1 (9f14c68).
- **Supplier order.** The dependency check printed: `depcheck: 28 roadmaps, 242 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. All named suppliers are on main or earlier in `ORDER.txt`, where this roadmap is at line 202.
- **Gaps.** All 13 slugged gaps have the same slug and verbatim `needs` in the plan and in the README. Apart from R02 and R05, none is unowned, vague or already provided.
- **Duplication by object.** Mathlib and Tau Ceti have no Epstein or Kronecker series and no lattice Poisson summation. LFunctions' `epsteinZeta` is the untwisted ideal-lattice sum, a different object. No other roadmap or package owns the EK class, current, theta function or Eisenstein measure. Ownership was checked against the open pull requests with `roadmaps grep`.
- **README shape.** All 24 definitions or constructions have an API and at least three Checks, every target has a locator, and every layer ends with Examples and Dependencies. There is no process narrative, LaTeX or pull-request reference.

## Not verifiable

- **Re-planning of the parent.** I could not check whether this Part II re-plans its parent: AutomorphicPadicLFunctions has no readable head (R01). The sibling design `packages/NonordinaryCMSpecialValues/design/README.md` (lines 7, 96) treats a node "AutomorphicPadicLFunctions:L3/cm-periods" as owning the ordinary CM p-adic period, which §6.2 defines here. A human should check this against the parent once it is readable.
- **Overlines.** The KS-v4 text extraction drops overlines. Bar placements (Prop. 1.11 types, Def. 5.3's A(n), the Σ̄_p depletion in Thm 5.27) were checked by consistency with the surrounding statements, not by reading the bar.
- **de Shalit.** The de Shalit argument cited in KS-v4 Step 2 is not in the manifest and was not read. The README claims nothing from it.

## Source issues

- **Error** in KS-v4 at Proposition 3.13, p.35: the source says the residues at s=0 and s=d belong to K itself; it should be that they belong to π^(−s)Γ(s)K, with K regular at 0 and residue π^d/(Γ(d)vol_HΛ) at d; affects a stated result.
- **Misprint** in KS-v4 at Proposition 3.13, p.35: the source says the functional-equation phase is exp(2πi⟨z,w⟩); it should be exp(2πi⟨w,z⟩), as in the theta transformation in its own proof; affects a stated result.
- **Error** in KS-v4 at Proposition 2.27, proof and diagram (2.4.2), p.23: the source says restriction to a free finite-index subgroup is onto in top homology; it should be that the image has index |Γ_tors|, e.g. multiplication by 2 for d=1, Γ=μ₂; affects the proof.
- **Error** in KS-v4 at Lemma 3.16(2), p.37: the source says the contraction coefficient is (−1)^j·j!·C; it should be (−1)^(j+1)·j!·C, since d=2, j=1 gives +C·v₁v₂(u₂−u₁)∧dz₁∧dz₂ directly; affects a stated result.
- **Error** in KS-v4 at Theorem 3.20, proof, p.41: the source says the coefficient of l̃^[b] in (A+l̃)^(−(j+1)) is (j+b)!/j!·A^(−(b+j+1)); it should carry (−1)^b, and Definition 3.15 with it; affects a stated result.
- **Error** in KS-v4 at Lemma 3.25, p.43: the source says each orbit series scales by [Γ:Γ′] on passing to Γ′; it should require Γ to fix t′ modulo Λ, as ℚ(i), μ₄⊃1, t′=1/3 shows; affects a stated result.
- **Misprint** in KS-v4 at Corollary 4.15, p.54: the source says L_f(χ,0)/c⁺ lies in Qbar×; it should say Qbar, the unit group only when L_f(χ,0)≠0; affects a stated result.
- **Misprint** in KS-v4 at equation (5.6.1), p.72: the source says the exponent is μ(λ); it should be μ(σ); affects nothing.
- **Gap** in KS-v4 at Theorem 5.27, proof Steps 2 and 4, pp.77 and 79: the source says integral values on Hecke characters plus density yield a measure; it should prove uniform congruences, since p⁻¹Σ_gδ_g on C_p has integral character values but value 1/p on δ_e; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f8feb07", "job": "REV-PKG-AutomorphicPadicLFunctionsPartII", "model": "opus", "worker": "fable-rev39"} -->
