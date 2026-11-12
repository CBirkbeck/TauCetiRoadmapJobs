<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6800833948 -->
Red team round 1 pass b (claude) of 6e93daa

Verdict: needs_changes

1. **F01** (P2) a headline declared "not statable" is statable with the file's own definitions

   **Location.** `packages/AmenableTracesOnCStarAlgebras/Suggested.lean:47-49`: "The uniform amenable
   characterization, the clause that the vector trace `τ''` of `π_τ(A)''` is an amenable trace: the
   vector trace … is a construction of the README (§1.4)." README §5.2 (iv),
   `packages/AmenableTracesOnCStarAlgebras/README.md:1537`.

   **Claim.** The module docstring lists §5.2 (i) ⇔ (iv) among the headline theorems that cannot be
   stated at the pins because `τ''` has no carrier.

   **Witness.** `τ''` is the unique normal positive functional on `M_τ` with `τ'' ∘ π_τ = τ`
   (`π_τ(A)` is ultraweakly dense in `M_τ`). `IsNormalState` (`Suggested.lean:261`) and
   `gnsVonNeumannAlgebra` (`:83`) state this; the file already pins `τ̃` (`:147`) and `τ_Γ` (`:444`)
   by their values in the same way.

   **Repair.** In `Suggested.lean`, section `Injectivity` (after
   `isUniformAmenableTrace_iff_isInjective`), add:

   ```lean
   /-- **Uniform amenable traces, vector-trace form.** A normal positive functional `σ` on
   `π_τ(A)''` with `σ ∘ π_τ = τ` is the vector trace `τ''`, the only such functional; `τ` is uniform
   amenable exactly when `σ` is an amenable trace of the C*-algebra `π_τ(A)''` (README §5.2,
   (i) ⇔ (iv); brown2006, Theorem 3.2.2 (1) ⇔ (3), for separable unital `A`). -/
   theorem isUniformAmenableTrace_iff_isAmenableTrace_gns (τ : A →P[ℂ] ℂ) (hτ : IsTracialState τ)
       (σ : (gnsVonNeumannAlgebra τ).toStarSubalgebra →P[ℂ] ℂ)
       (hn : IsNormalState (gnsVonNeumannAlgebra τ) σ)
       (hσ : ∀ a : A, σ ⟨τ.toPositiveLinearMap.gnsNonUnitalStarAlgHom a,
         VonNeumannAlgebra.subset_adjoin _ ⟨a, rfl⟩⟩ = τ a) :
       IsUniformAmenableTrace τ ↔ IsAmenableTrace σ := by
     sorry
   ```

   Delete the second bullet of the "not statable" list (`Suggested.lean:47-49`) and add the clause to
   the "Stated here" paragraph (Layer 5). In README §5.2 add, after the list (i)–(iv): "`τ''` is the
   only normal positive functional on `M_τ` with `τ'' ∘ π_τ = τ`, since `π_τ(A)` is ultraweakly dense
   in `M_τ` and normal positive functionals are ultraweakly continuous (VonNeumannAlgebras V4); in
   this form (i) ⇔ (iv) is `isUniformAmenableTrace_iff_isAmenableTrace_gns`."

   **Tested on.** `A = M_n`, `τ = tr_n`: `M_τ = M_n`, `σ = tr_n`, both sides true. `A = C*(F₂)` with
   its regular trace: `σ` is the trace of `L(F₂)`, whose restriction to the unital subalgebra
   `C*_r(F₂)` is `τ_{F₂}`, not amenable, so the right side is false; the left side is false (README
   §5.2, Check 2). The same instance has `τ` amenable, so the statement with `IsAmenableTrace τ` on
   the left would be false: the clause discriminates. Nonunital `(c₀, Σ 2^{-n}δ_n)`: `M_τ = ℓ∞`,
   `σ(x) = Σ 2^{-n}x_n` is forced by normality along `π_τ(e_m) ↑ 1`; both sides true.

   The bimodule form (first bullet of the same list) would need the operators `π_τᵒᵖ(bᵒᵖ)` supplied
   through a hypothesis on a free function; I regard that as an ad hoc encoding and do not raise it.

2. **F02** (P3) §6.5: the estimate for the `AT` case assumes what it proves

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:1754-1755`: "using
   `‖ψ(x − ex)‖₂² ≤ tr ψ(x*(1 − e)²x)`, which is close to `γ((1 − e)xx*(1 − e)) ≤ ‖x‖²(1 − τ(e))`".

   **Claim.** `tr ∘ ψ` is close to `γ` at `x*(1 − e)²x`, an element of `A` outside `I`.

   **Witness.** `ψ` is an Arveson extension of an approximant `φ` of `τ` on `I`; that `tr ∘ ψ`
   approximates `γ` off `I` is the conclusion of the proposition. At `x = 1`, `I = c₀ ⊆ c`,
   `ψ(x) = (1 − η)x_1 + η·lim x`: `tr ψ((1 − e)²) = η`, `γ((1 − e)²) = 0`.

   **Repair.** Replace the quoted clause by: "using, for the unital extension `ψ̃` of `ψ` to `Ã`
   (§2.1) with Stinespring dilation `ψ̃ = V*σ(·)V` (CStarAlgebras C4.2),
   `‖ψ((1 − e)x)‖₂ = ‖(σ(1 − e)V)*σ(x)V‖₂ ≤ ‖x‖·tr ψ̃((1 − e)²)^{1/2} ≤ ‖x‖(1 − tr φ(e))^{1/2}`,
   where `tr φ(e)` is within `ε` of `τ(e)` once `e` is put in the finite set". Tested on the witness:
   the bound reads `|η·lim x| ≤ ‖x‖·η^{1/2}`, true for `η ≤ 1`; on `I = M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`, `e = (1, 0)`,
   `φ = id`: both sides are `0`.

3. **F03** (P3) §4.6: no Check discriminates `IsNormalState` or the faithfulness hypothesis

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:1457-1465` (Checks of §4.6:
   `M_n`, `L∞[0,1]`, `L(F₂)`, `H = 0`).

   **Claim.** §4.6 introduces `IsNormalState` and states `isAmenableTrace_iff_isInjective` for a
   faithful normal tracial state; each definition needs discriminating Checks.

   **Witness.** All four Checks hold verbatim for any positive functional in place of a normal one,
   and none shows why "faithful" is assumed: `M = L(F₂) ⊕ ℂ`, `τ(x, λ) = λ` is a normal amenable
   tracial state of a non-injective algebra.

   **Repair.** Add to the Checks of §4.6:

   - "Faithfulness is needed: on `M = L(F₂) ⊕ ℂ ⊆ B(ℓ²(F₂) ⊕ ℂ)` the tracial state
     `τ(x, λ) = λ` is normal and amenable (§3.4, the pullback of `id_ℂ` along `pr₂`) with
     `τ((1, 0)) = 0`, while `M` is not injective, its corner `L(F₂)` not being injective
     (VonNeumannAlgebras V13a, V13b)."
   - "Normality: on `M = ℓ∞(ℕ) ⊆ B(ℓ²)` the evaluation `x ↦ x_0` is normal, while a limit `ω` along a
     free ultrafilter is a tracial state that is not: the indicators `p_n` of `{0, …, n}` increase
     strongly to `1` with `ω(p_n) = 0` and `ω(1) = 1`."
   - "`M = M_2`, `τ(x) = x₁₁`: positive and normal but not tracial, so `IsNormalState` does not
     include traciality; `tr_2` is normal, faithful and tracial."

4. **F04** (P3) `generatedCStarAlgebra` restates OperatorAlgebraDynamics's definition without saying so

   **Location.** `packages/AmenableTracesOnCStarAlgebras/Suggested.lean:19-22` ("Nuclearity,
   injectivity, quasidiagonality, AF algebras and normality restate the notions of …") and `:408-413`;
   README §7.3, `packages/AmenableTracesOnCStarAlgebras/README.md:1845-1852`.

   **Claim.** The list of restated notions is complete; `generatedCStarAlgebra` is presented as this
   roadmap's construction.

   **Witness.** `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean:337-339` on main declares
   `generatedCStarAlgebra` with the identical body
   `(StarAlgebra.adjoin ℂ (Set.range T)).topologicalClosure` (D2.FreeGroups). The fully qualified
   names differ (the namespaces), so there is no clash.

   **Repair.** In the module docstring replace "AF algebras and normality restate the notions of
   CStarAlgebras C6.1 and C8.1, VonNeumannAlgebras V4 and V13a and CStarClassification §2.1" by "AF
   algebras, normality and the C*-algebra generated by a family of operators restate the notions of
   CStarAlgebras C6.1 and C8.1, VonNeumannAlgebras V4 and V13a, CStarClassification §2.1 and
   OperatorAlgebraDynamics D2.FreeGroups". In README §7.3 after "(`generatedCStarAlgebra`" insert
   ", restating the definition of the same name of OperatorAlgebraDynamics D2.FreeGroups". In the
   "Left to named roadmaps" bullet for OperatorAlgebraDynamics add the sentence "The definition
   `generatedCStarAlgebra` of this roadmap's `Suggested.lean` restates D2.FreeGroups'."

One blocking finding (R01, P2); R02–R04 are P3. No Lean was elaborated in this pass (the brief
gives no Lean command): the elaborated types were read from the worker's signature table, and the
Lean text proposed in R01 must be elaborated by the repair worker.

## Verified sound

**Dependency check** (run on the README at this head):

    depcheck: 207 roadmaps, 1918 edges, 0 problem(s)

No UPWARD or CYCLE line. FactorRigidity is later in the merge order but is on main, as are
CStarAlgebras, VonNeumannAlgebras, CStarClassification, OperatorAlgebraDynamics and
BanachSpaceTheory. No supplier gap is declared and none is needed. The pull request changes only
`packages/AmenableTracesOnCStarAlgebras/`.

**Counts.** Lean declarations read: 44 (all). README targets read: 40 (all of §1.1–§8.5). Checks
read: 145; recomputed with values: 85. Source locators verified: brown2006, every numbered
statement named in the References (44) against its header line, and the in-proof, footnote and
remark line locators of the README read at the cited lines; schafhauser2020, 4; tikuisis-white-winter2017, 7. Sibling citations checked on main:
CStarAlgebras C2.1, C2.8, C4.1, C4.2, C5.1, C5.2, C5.4, C6.1, C6.2, C6.5, C7.1, C8.1–C8.4, C9.1,
C9.7; VonNeumannAlgebras V13a, V13b, V13b.SpatialNorm, V4 (normality), V0 (GNS, uniqueness);
CStarClassification §2.1, §3.4, §3.5; OperatorAlgebraDynamics D2, D2.FreeGroups; FactorRigidity
§2.2; BanachSpaceTheory B1. Pinned declarations grepped at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`
(the manifest's revisions): every Mathlib and Tau Ceti declaration name listed with a file in the supplier
contracts was searched in that file and found.

**Restated definitions compared with their owners' `Suggested.lean` on main.** `IsNuclearMap` =
`IsNuclearContraction` of CStarAlgebras (same quantifiers, on a bare function); `IsQuasidiagonalSet`
and `IsQuasidiagonal` identical to CStarAlgebras's, universe included; `IsAF` identical to
CStarClassification's; `IsInjective` identical to VonNeumannAlgebras's; `IsNormalState` =
VonNeumannAlgebras's `IsNormalFunctional` on a positive functional.

**Ownership.** `roadmaps grep` for amenable traces, quasidiagonal traces, hypertraces and each
declaration name: no owner on main or in any open roadmap pull request other than R04. Pinned
Mathlib and Tau Ceti have no tracial-state, hypertrace, nuclear-map, quasidiagonality or
injectivity declaration; `IsTracialState` is Tau Ceti's `0`-KMS predicate
(`isKMSState_zero_iff` at `TauCeti/Analysis/CStarAlgebra/Action/KMS/Basic.lean:237`: norm one and
`ω(ab) = ω(ba)`, for nonunital `A`).

**Signatures.** The worker's table flags four dropped binders: `[StarOrderedRing A]` on
`IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace` and the order instances on `IsAF`. None is
needed by the definition's body or by the README statement (`A →P[ℂ] ℂ` needs only the order;
`IsAF` matches its owner). Every theorem carries its separability, unitality and injectivity
hypotheses in its own signature. No `set_option`, `lemma`, `#check`, sorry'd data or other import.

**Padding.** None found: the three instances and the definitions are each used by a stated
headline; no theorem follows by one tactic from a definition or a pinned lemma.

**The computed pass.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `IsTracialState` | zero algebra; `M_2`, `x ↦ x₁₁`; unnormalized `Tr` | no norm-one functional; `τ(e₁₂e₂₁) = 1`, `τ(e₂₁e₁₂) = 0`; norm `2` | excluded by the definition |
| `IsFaithfulTrace` | `(ℂ ⊕ ℂ, pr₁)`; `tr_n` | `pr₁((0,1)*(0,1)) = 0`; `tr_n(x*x) = n⁻¹Σ|x_ij|²` | fails; holds |
| `matrixTrace`, `matrixTwoNorm` | `k = 0`; `e₁₁ ∈ M_2` | `0⁻¹·0 = 0`; `1/2`, `2^{-1/2}` | agree with README |
| `IsAmenableTrace` etc. | `k = 0` approximant; `C(𝕋)` roots of unity; `Tr_m` in place of `tr_m` | recovers only `0`; dual distance `2`; defect `≤ 1/m + 1/m²` | harmless; QD not uniform witness; excluded |
| `isAmenableTrace_unitization_iff` | `A = ℂ` (unital); `A = c₀`, `δ_1`; `A = 0` | `τ̃ = ` first coordinate of `ℂ ⊕ ℂ`, amenable; `x ↦ x_1` both sides; `hτ` false | true; factor `2`: `δ` versus `2δ` at `(1/2, −1/2)` |
| `IsHypertrace`, hypertrace form | `M_n ⊆ B(ℂⁿ)`; `ℂ²`, `ψ′` at `(1,1)/√2`; `H = 0` | `ψ = tr_n`; `ψ′(e₁₁e₁₂) = 1/2`, `ψ′(e₁₂e₁₁) = 0`; `A` trivial, no tracial state | true |
| extension form | `(ℂ ⊕ ℂ, pr₁)` on `ℂ²` | `Φ(T) = T₁₁ ∈ M_τ = ℂ`, `Φ(1) = 1` | true |
| tensor form | `x = Σ aᵢ ⊗ bᵢᵒᵖ`, `x*x`; `M_n` | `μ_τ(x*x) = τ(y*y)`, `y = Σ aᵢbᵢ`; `μ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/n ≤ 1` | positive, so the constant `1` is right |
| `IsFoelnerTrace` | `[a, P] = (1−P)aP − Pa(1−P)`; `C(𝕋)`, `P_n`; `ℂ²`, `τ = (1/3, 2/3)` | `HS² = Σ‖(1−P)aeᵢ‖² + Σ‖(1−P)a*eᵢ‖²`; `2 < εn`; commutator `4/9`, rank 2 gives `1/2` | formula right; Følner; no Følner net |
| Følner sufficiency | compression `PπP`, non-faithful `π` | `‖φ(ab) − φ(a)φ(b)‖₂² ≤ ‖a‖²n⁻¹‖(1−P)π(b)P‖²_HS` | true without faithfulness |
| Følner iff | finite-dimensional `H` | `hess` forces `π = 0`, `A = 0` | vacuous, true |
| `IsInjective`, `IsNormalState`, tracial vN form | `H = 0`; `L(F₂)`; `L(F₂) ⊕ ℂ`, `pr₂` | zero map, norm `0`, no tracial state; both sides false; amenable, not injective, not faithful | true as stated; see R03 |
| uniform amenable ⇔ injective | `M_n`; `C*(F₂)` regular trace; `c₀` nonunital | both true; both false; `M_τ = ℓ∞` injective, UAT | true |
| nuclear ⇒ uniform amenable | `K(ℓ²)`; CAR | `T = ∅`, vacuous; `τ(e₁₁) = 1/2` | true |
| exact TFAE | `C*_r(F₂)`; `C*(F₂)` (not exact) | all four false; amenable but `L(F₂)` not injective | true; hypothesis needed |
| faces | `γ = (1/2, 1/2)`, `τ = (1, 0)` on `ℂ²`; `C*_r(F₂) ⊕ ℂ` | `P = e₁₁`; `AT = {χ ∘ pr₂}` | true |
| normalized restriction | `M_3 → M_4`; `c = 1/2`; `c₀ ⊆ c` | `τ ∘ ι̃ = (3/4)(tr_3)~ + (1/4)χ₀`; `(3/2)tr_3` not a state; `δ_1` | true; `c` forced |
| ideal extension | `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`; `C*(F₂) → C*_r(F₂)` (not injective) | `γ = tr_2 ∘ pr₁`; amenable goes to non-amenable | true; injectivity needed |
| commutative, AF | `C[0,1]`, `f = x`; `M_2 ⊕ ℂ`; CAR | `(n+1)/(2n) → 1/2`; `(Tr x + 2λ)/4`; exact at each stage | true |
| group TFAE, Rosenberg | trivial group; `ℤ`; `S₃`; `F₂`; `λ_1M_{δ_0}λ_1* = M_{δ_1}` | all hold; Lebesgue; `Tr(λ_g) = 6, 0`; all fail; convention matches `L_g` | true; item 4 not vacuous (`τ_Γ` exists) |
| `IsQuasidiagonal.{u}` | `A` separable, any `u`; degenerate `π` | faithful representation on `ℓ²` lifts to `Type u`; `‖Pπ(a)P‖ → ‖a‖` still | conclusions true in every universe |
| QD ⇒ QD trace | `SO₂` (nonunital) | no tracial state | unit needed, present |
| faithful QD trace ⇒ QD | Toeplitz | traces not faithful, not QD | faithfulness needed, present |
| `subalgebra_isAF_simple` | `B = 0`; `B = ℂ ⊕ ℂ`; `M_3 ⊆ M_4 ⊆` CAR; `C*_r(F₂)` | contradicts `Nontrivial A`; `pr₁` not faithful; `c = 3/4`, `tr_3`; no amenable trace | true; simplicity needed |
| §1.3 ideal extension | `γ(ab)` | `lim τ((ea)(be)) = lim τ((be)(ea)) = lim γ(be²a) = γ(ba)` | route sound |
| §1.6 expectation formula | `x = e_kl ∈ B` | `Φ_B(e_kl) = e_kl` | projection onto `B` |
| §2.1 estimates | `0 ≤ h ≤ 1`; spectrum `t(1−t) ≤ δ ≤ 1/8` | `(1−h)² ≤ 1−h ≤ 1−h²`; `t ≤ 2δ` or `1−t ≤ 2δ` | sound |
| §2.2 defects | Stinespring `T(a)`; `tr_n` at `e₁₂`, unitary `u` | `φ(ab) − φ(a)φ(b) = T(a*)*T(b)`; `1/n`; `1 − |tr u|²` | sound |
| §2.4 Ozawa | `h = diag(1/3, 2/3)`; rank one | `tr_3φ(e₁₁) = 1/3`; `max` gives `2/3 > 1/3`; `1 − c² ≤ 2^{3/2}(1−c²)^{1/4}` | sound |
| §4.2 Mazur step | pairing of `S₁(H)` with `B(H)` | `Tr((uh_λu* − h_λ)T) → ψ(u*Tu) − ψ(T) = 0` | weak convergence right; B1's closure agreement covers nets |
| §5.1 commuting-range lemma | `β = id_{M_2}`, `y_kl = e_lk` | `Σ e_kl e_lk = 2·1` versus norm `1` | commutation needed, stated |
| §5.2 averages | `f(t) = t` on `n` intervals | diagonal defect `1/(12n²)` | sound |
| §7.3 (iii) ⇒ (i) | `ψ(M_{L_gf})` | `ψ(λ_gM_fλ_g*) = ψ(M_fλ_g*λ_g) = ψ(M_f)` | matches `TauCeti.Amenable.of_lpTop` |

**Sources.** brown2006: Lemmas 2.1, 2.4, 2.5, 2.7, 2.8, Theorem 2.2, Definitions 3.1.1, 3.2.1,
3.3.1, Propositions 3.1.2, 3.1.3, Lemmas 3.1.4, 3.1.5, Theorems 3.1.6, 3.1.7, 3.2.2, Proposition
3.3.2, Propositions 3.5.1, 3.5.3–3.5.8, 3.5.10–3.5.12, Lemma 3.5.2, Propositions 4.1.1, 4.1.3,
4.1.4, 4.1.6, Corollary 4.1.2, Remark 4.1.7, Theorem 4.2.1, Corollaries 4.3.4–4.3.6, 4.3.8,
Proposition 4.3.7 are at the lines the README gives and say what the README attributes to them;
where the README is more general than the source (no separability, nonunital algebras,
injectivity for hyperfiniteness, uncountable groups) it says so and gives its own route.
schafhauser2020 lines 69–70, 75, 78–84 and tikuisis-white-winter2017 lines 53, 359–364, 376, 431,
456–461, 471 match.

## Not verifiable

- Elaboration of `Suggested.lean` and of the declaration proposed in R01: no Lean command is
  permitted in this pass; the elaborated types were taken from the worker's signature table.
- connes1976, brown-ozawa2008, paulsen2002, pedersen2018 (waived) and kirchberg1993 (uncertified):
  cited as background by locator; their texts were not read. The kirchberg1993 locators agree with
  what brown2006 lines 1910–1913 record.
- The published Memoir numbering of brown2006 was not compared with the arXiv v2 numbering the
  README cites (the manifest records this).
- VonNeumannAlgebras V1, V2, V3, V5, V6: the section headings and the cited results were located by
  search, not read in full.
- Whether normality can be dropped from `isAmenableTrace_iff_isInjective`: no separating instance
  was sought.

## Source issues

- **Gap** in brown2006 at Lemma 3.1.4, proof, printed page 17 (line 667): the source takes the auxiliary orthonormal vectors from a basis of the same Hilbert space, needing as many as the largest numerator; it should be an auxiliary space of dimension the common denominator, since the Hilbert space may be smaller; affects the proof.
- **Misprint** in brown2006 at Proposition 3.5.3, proof, printed page 29 (line 1287): the source says the extension map restricts to the GNS representation of an undefined trace; it should be the GNS representation of the convex combination; affects nothing.
- **Misprint** in brown2006 at Proposition 3.5.11, proof, printed page 33 (line 1464): the source gives the completely positive extension the algebra itself as domain; it should be all bounded operators on the Hilbert space of the faithful representation; affects nothing.
- **Misprint** in brown2006 at Lemma 2.5, printed page 11 (line 488): the source states a strict inequality for every element, which fails at zero; it should be a non-strict inequality or exclude zero; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e93daa8118ca8efae8044fbb5443c1227f7a552", "job": "RT-AmenableTracesOnCStarAlgebras~1b", "model": "fable", "worker": "chris-l"} -->
