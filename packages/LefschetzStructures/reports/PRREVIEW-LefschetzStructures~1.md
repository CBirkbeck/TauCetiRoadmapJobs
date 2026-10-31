# Review of LefschetzStructures (pull request #1061 at 06a66a1)

**Verdict:** needs changes

The gate fails (`set_option=1`, `prnum=2`), so the folder cannot be accepted as it stands; the findings below are what the gate does not see. Severity: P1 false, P2 overclaim/missing hypothesis/upward supply, P3 locator, Check, style or policy.

## R01 (P1) — The curve case of Layer 2.5 names the wrong correspondence for `Λ`

Location: `TauCetiRoadmap/LefschetzStructures/README.md` line 246, "the Lefschetz inverse is induced by a correspondence for curves (`Λ` on `H²` is `[pt × X]_*` divided by `deg ξ`)".

Claim: for a curve `X`, `Λ|_{H²} = [pt × X]_* / deg ξ`.

Witness: with the action `c_*(α) = pr_{2*}(cl(c) ∪ pr_1^*α)` of MotivesAndAlgebraicCycles §2.3, `cl([pt × X]) = [pt] ⊗ 1 ∈ H² ⊗ H⁰`, so `[pt × X]_*` sends `α ∈ H^i` to `Tr(α ∪ [pt]) · 1`, which is `0` on `H²` and the identity on `H⁰`: it is the Künneth projector onto `H⁰` (a degree-`0` correspondence), not a map `H² → H⁰`. With the transposed convention it is `α ↦ Tr(α)·[pt]`, `H² → H²`. A map `H² → H⁰` is a correspondence of degree `−1`, i.e. a cycle of codimension `0`: `[X × X]_*(α) = pr_{2*}(α ⊗ 1) = Tr(α)·1`, so `[X × X]_*(γ(ξ)) = (deg ξ)·1` and `Λ = [X × X]_* / deg ξ` (it also kills `H⁰` and `H¹`, as `Λ` must). MotivesAndAlgebraicCycles §7.3's Checks agree: "for a surface, the inverse from `H⁴` to `H⁰` has codimension zero on `X×X`".

Repair: replace `[pt × X]_*` by `[X × X]_*` (the fundamental class of `X × X`, degree `−1`).

## R02 (P2) — `set_option` in `Suggested.lean`

Location: `TauCetiRoadmap/LefschetzStructures/Suggested.lean` line 3, `set_option autoImplicit false`.

Claim: the file obeys the Lean form rules. Witness: gate `set_option=1`; the brief lists any `set_option` as blocking. The file elaborates without it (checked on a scratch copy: only the eight `sorry` warnings).

Repair: delete line 3.

## R03 (P2) — Layer 0 consumes two roadmaps later in the merge order, and the edge is hidden from the dependency check

Location: README lines 42–48 (Scope), 143–146 (0.2), 157–160 (0.4): "the adapter from this roadmap's `ℕ`-graded `LefschetzStructure` to #929 §9.7's `lefschetzDecomposition`"; "orthogonality … are #929 §9.7's `lefschetzPairings`".

Claim: the primitive decomposition and the Lefschetz pairings are consumed from DeligneWeightsAndPurity §9.7 and EtaleDualityAndPerverseSheaves §5.7.

Witness: both sections exist at their heads (DeligneWeightsAndPurity §9.7 with `primitivePiece 𝒱 λ n r = 𝒱(n−r) ∩ ker λ^(r+1)`, `lefschetzDecomposition`, `lefschetzPairings` and the `ℕ → ℤ` extension; EtaleDualityAndPerverseSheaves §5.7 with `gradedLefschetz_vectorSpace_compat`, and `abstractPrimitiveDecomposition` named in §5.8). But the merge order lists LefschetzStructures at #69, DeligneWeightsAndPurity at #75 and EtaleDualityAndPerverseSheaves at #91, and neither is on main. Layers 0–1 carry no `*Needs:*` line, so the worker's check reads only the Layer 2 edges to MotivesAndAlgebraicCycles and reports `0 problem(s)`. On a scratch copy with the honest line `*Needs:* DeligneWeightsAndPurity §9.7, EtaleDualityAndPerverseSheaves §5.7, LieHighestWeight Layer 0.` added to 0.2, the check gives

```
UPWARD: LefschetzStructures (#69) -> DeligneWeightsAndPurity (#75) at README lines [146]
UPWARD: LefschetzStructures (#69) -> EtaleDualityAndPerverseSheaves (#91) at README lines [146]
depcheck: 205 roadmaps, 1422 edges, 2 problem(s)
```

and with `--movable`

```
moved: LefschetzStructures moved in the merge order from #69 to #91, right after its last supplier EtaleDualityAndPerverseSheaves (DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 205 roadmaps, 1422 edges, 0 problem(s)
```

Repair: write the `*Needs:*` lines of 0.2, 0.3 and 0.4 naming DeligneWeightsAndPurity §9.7 (and EtaleDualityAndPerverseSheaves §5.7 only if 0.2 really uses the categorical form; otherwise drop that citation), and LieHighestWeight Layer 0 for 0.3. The roadmap then sits after EtaleDualityAndPerverseSheaves; no cycle arises, since MotivesAndAlgebraicCycles (#69's predecessor) names this roadmap only as a consumer and neither DeligneWeightsAndPurity nor EtaleDualityAndPerverseSheaves cites it. (The alternative, owning the decomposition and pairings in Layer 0, would make two owners with DeligneWeightsAndPurity §9.7, which was accepted as the owner and defers exactly these operators downstream in its §9.7 prose.)

## R04 (P2) — Layer 2.5 proves theorems that MotivesAndAlgebraicCycles §7.3 owns

Location: README lines 238–248, "Layer 1's theorems hold on `(H(X), 𝒜(X), A(X))` under explicit hypotheses: if the Lefschetz inverse of `X` is induced by a correspondence, every Künneth grade projector is induced by a correspondence; if moreover the form of 1.4 is positive definite …, the cohomological pairing is nondegenerate on algebraic classes".

Claim: these implications on `H(X)` are this roadmap's targets.

Witness: MotivesAndAlgebraicCycles §7.3 (at its head, lines 1309–1321) defines `B_H(X)` (with "equivalence with algebraicity of the lowering operator and the Lefschetz/primitive projectors"), `C_ℚ,H(X)`, `D_ℚ,H(X)` and Hodge positivity on `PA_H^j`, and states "Prove `B⇒A,C` … Prove `D⇒A` and `A` together with Hodge positivity implies `D`"; §7.4 owns the established cases. Its Scope says "Sections 7.3–7.4 own the shared standard-conjecture predicates, their general implications and the curve case." The README's own Scope (line 58) lists "the established cases" as MotivesAndAlgebraicCycles', but 2.5 still plans the implications a second time.

Repair: recast 2.5 as a comparison: prove that, for `(H(X), 𝒜(X), A(X))` of 2.3, `LambdaAlgebraic`, `ProjectorsAlgebraic`, `PositiveOnAlgebraicPrimitive` and `PairingNondegenerateOnAlgebraic` are MotivesAndAlgebraicCycles §7.3's `B_H(X)`, `C_ℚ,H(X)`, Hodge positivity and `D_ℚ,H(X)`; cite the implications from §7.3 and the cases from §7.4 by section, and prove nothing of theirs again. Layer 1 remains the abstract theory this roadmap owns (nothing on main, at the open heads or at the pins states it: see Verified sound).

## R05 (P2) — 1.3 overclaims its source: an arbitrary algebraic isomorphism gives an algebraic inverse of `L^{n−i}`, not `Λ ∈ 𝒜`

Location: README lines 174–178, "hence, if for each `i ≤ n` there is some bijective `u_i ∈ 𝒜` from `H^{2n−i}` to `H^i` (not necessarily inverse to `L^{n−i}`), then `Λ ∈ 𝒜`. (Statement of Grothendieck's folder 16, pp. 47–48; proved in the Lean appendix …)".

Claim: charpoly rationality on `𝒜` and one algebraic bijection `H^{2n−i} → H^i` for each `i` give `Λ ∈ 𝒜`.

Witness: the cited appendix theorem `inverse_Lefschetz_algebrique` (folder16lean line 277–285) takes a ring `𝒜V` of endomorphisms of one degree `V = H^i` with the charpoly hypothesis, sets `𝒜WV`, `𝒜VW` of maps between the two degrees closed under composition, and concludes that `v = L^{n−i}|_{H^i}` has an algebraic two-sided inverse `v' ∈ 𝒜WV`; it says nothing about `Λ`. In the README's single-ring setting `w = u_i ∘ L^{n−i}` is bijective on `H^i` but is not a unit of `End_K H` (it kills `H^j` for `j ≠ i`), so `inv_mem_of_charpoly` does not apply to it, and the charpoly hypothesis on `𝒜 ⊆ End H` does not give the charpoly of `w|_{H^i}` without the projector `π_i ∈ 𝒜`, which is what one is trying to prove. From the inverses `ℓ_i` of the `L^{n−i}` to `Λ` one needs the grade projectors and then the identity `Λ = Σ_{2 ≤ m ≤ n} ℓ_{m−2} L^{n−m+1} π_m + Σ_{i < n} L^{n−i−1} ℓ_i π_{2n−i}` (checked on `ℚ[ξ]/(ξ³)`, `n = 2`: `ℓ_0 = E₁₃`, `ℓ_1 = 0`, the formula gives `E₁₃·L·π_2 + L·E₁₃·π_4 = E₁₂ + E₂₃ = Λ`).

Repair: state 1.3 as the source does (two-degree form, conclusion "the inverse of `L^{n−i} : H^i → H^{2n−i}` is algebraic"), and derive `Λ ∈ 𝒜` only under the explicit extra hypothesis that the grade projectors lie in `𝒜`, or from homogeneous two-sided algebraic inverses of all `L^{n−i}` through the projector theorem of 1.2 and the displayed identity.

## R06 (P3) — The proof sketch of 1.2 misstates the projector theorem it cites

Location: README lines 170–172, "one-sided inverses in a ring `𝒜 ∋ L` of the `L^{n−i}` put every grade projector in `𝒜`".

Witness: `projecteurs_mem_lefschetz` (folder16lean lines 438–443) requires each `w i` to be homogeneous of degree `−2(n−i)` for the grading idempotents and to invert `L^{n−i}` on both `π_i` and `π_{2n−i}` (hypotheses `hw`, `h₁`, `h₂`). An inverse with uncontrolled behaviour off `H^{2n−i}` does not suffice: on `ℚ[ξ]/(ξ³)`, `n = 2`, the left inverse `ℓ = E₁₁ + E₁₃` of `L²` on `H⁰` gives `L² ℓ = E₃₁ + E₃₃ ≠ π_4`. The Lean theorem is unaffected: `Λ^{n−i}` is homogeneous and two-sided.

Repair: say "inverses homogeneous of degree `−2(n−i)`, two-sided on `H^i` and `H^{2n−i}`", and that `Λ^{n−i}` provides them.

## R07 (P3) — Pull-request numbers, process narrative and a dead link in the README

Location: README lines 43, 47, 59, 74, 97, 145, 159, 252–254 (`#929`, `#1040`, `#1313` as supplier names; "this pull request is meant to merge after #1313"), line 69 ("of those drafts"), line 87 ("not yet implemented in Tau Ceti"), `## Ordering` and `## Provenance` (lines 250–307: "transcription project", a GitHub permalink in the text), line 59's link `../MotivesAndAlgebraicCycles/README.md` (not on main: dead).

Witness: gate `prnum=2` (it catches only the parenthesised form); the Timeless rule.

Repair: cite by roadmap name and section only; delete `## Ordering` (the `*Needs:*` lines carry it); move the appendix pointers into `## References` as ordinary references; drop the link until the supplier is on main. Also: Poincaré duality for `ℓ`-adic cohomology is EtaleCohomologyFoundations §F.5, not §§F.6–F.7 (line 69).

## R08 (P3) — README shape and completeness

Location: whole README.

Witness: there is no `## Exact supplier contracts`, no `## How to read the build`, no `## Downstream consumers`; targets are bold paragraphs (`**0.1 The structure.**`) rather than `### k.n` headings, which is what the gate and the board read for target ids; Layers 0–1 have no `*Needs:*` lines, no `### Examples` and no `### Dependencies`; the definitions `IsGradeProjector`, `IsWeightOperator`, `AlgebraicStructure`, `LambdaAlgebraic`, `ProjectorsAlgebraic`, `PositiveOnAlgebraicPrimitive`, `PairingNondegenerateOnAlgebraic` and the Layer 2 structures have no `**Checks.**` lists (1.5 gives one example for two of them); 0.2, 0.3, 1.2 ("Kleiman 1968 (B(X) implies C(X))"), 1.4 and 2.3–2.5 carry no theorem or page locator.

Repair: the house shape of the brief (compare MotivesAndAlgebraicCycles or DeligneWeightsAndPurity §9.7): `### k.n` headings, three discriminating Checks per definition, locators with theorem and page numbers at each claim (Kleiman 1994 Theorem 4.1 and Proposition 5.1, Kleiman 1968 §1.4 for 0.3 and 1.2–1.4, or the appendix line numbers), `*Needs:*` on every target.

## R09 (P3) — README and Lean differ in generality on the algebraic structure and on positivity

Location: README lines 105–113 and `Suggested.lean` lines 119–149, 167–172.

Witness: (a) the Convention makes `A = ⊕ A^i` `𝒜`-stable; `AlgebraicStructure` has no such field, and theorem 1.4 instead takes `hA` (an algebraic grade projector of an algebraic image is algebraic) together with `hB : LambdaAlgebraic`, while the README's 1.4 hypothesis is "`A` is stable under `Λ`" (which suffices: the primitive components of `x ∈ A^i` are `q(L, Λ)x` followed by grade projection, and `A` is graded by construction). (b) `PositiveOnAlgebraicPrimitive` asks for a positive rational value; the README says "for `F ⊆ ℝ` and the pairing `F`-valued on `A`", positive definite. The two agree only for `F = ℚ`. (c) `hpair_grade` is not used by the route (orthogonality of the Lefschetz components follows from `⟨Lx, y⟩ = ⟨x, Ly⟩` and primitivity alone); a note, not a defect.

Repair: either add the stability field and state 1.4 with "`A` stable under `Λ`", or align the README with `hA`; for positivity, say in the Convention that the values are rational and no ordering of `K` is used (as MotivesAndAlgebraicCycles §7.3 does), or carry an ordered subfield in both.

## R10 (P3) — The Mathlib `𝔰𝔩₂` contract names the wrong bracket and the wrong triple

Location: README lines 83–84 and 102–104; `Suggested.lean` line 21.

Witness: at the pin, `Mathlib/Algebra/Lie/Sl2.lean` line 79 defines a primitive vector by `⁅e, m⁆ = 0`, and line 167 proves `lie_e_pow_succ_toEnd_f : ⁅e, f^(n+1) m⁆ = ((n+1)(μ − n)) • f^n m`. A Lefschetz-primitive `x ∈ P^j` is killed by the lowering operator `f` and raised by `L`, so with `e = L` it is not Mathlib-primitive; it is primitive of weight `n − j` for `IsSl2Triple.symm` (line 49: `(−h, f, e)`), and the README's formula `f L^{k+1} x = (k+1)(n−j−k) L^k x` is that lemma for the symmetric triple. The README says "the computation of `⁅f, e^k x⁆` on a primitive vector". The Lean docstring also says Layer 2 "consumes the Chow rings of SchemeAndStackFoundations Layer 5", which the README's Scope (line 65) says it does not.

Repair: name `lie_e_pow_succ_toEnd_f` applied to `IsSl2Triple.symm`, and make the two docstrings agree with the Scope.

## R11 (P3) — `Suggested.lean`: one declaration mirrors a Check, and the module docstring is not in the headline form

Location: `Suggested.lean` lines 5–28 and 100–106.

Witness: `sl2_lower_L_primitive` is labelled "Layer 0.3, check" and restates the 0.3 Check "`f L x = (n − j) x`"; it closes in no single tactic (probe on a scratch copy: `simp_all`, `rfl`, `infer_instance`, `decide`, `aesop` all fail on every theorem), but mirroring a Check is the criterion. The docstring says the file "suggests Lean forms for particular milestones … `sorry` is allowed in this human-owned roadmap library" and does not name which Layer 2 headlines are not statable and what carrier each lacks.

Repair: delete `sl2_lower_L_primitive` (the README keeps the Check); drop "check" from the docstring of `lambda_pow_L_pow` (it is an API target used by 1.2); rewrite the module docstring as "<title>: target signatures", saying that 2.3 and the comparison of 2.5 are not statable because no Weil cohomology theory or correspondence action exists at the pins (nothing on hard Lefschetz, primitive decomposition or Chow groups is in Mathlib or Tau Ceti at the pins: see Verified sound).

## R12 (P3) — The Check of 1.4 is not a Check of the roadmap's object

Location: README lines 187–202 (the endomorphism frame, `ℍ[ℤ, 0, 0, 0]`, Rosati trace).

Witness: the frame `(E, N, ψ, ξ, I, ν)` is Folder 50's, not a Lefschetz structure; the facts named are those of the appendix file (read: `ModelB` is `E = ℍ[ℤ,0,0,0]`, `N = ℤ`, `ξ = 1`, `α*x = (re α)² x`, `tr(i′i) = 0`; `ModelA` is `ℤ²` with `I(x,y) = x₁y₂`) and are consistent with the README, but none of them exercises `PositiveOnAlgebraicPrimitive`. A negative control on the roadmap's objects is immediate: `ℚ[ξ]/(ξ²)`, `n = 1`, `𝒜 = End`, `A^0 = ℚ·1`, `A^1 = ℚξ`, pairing `⟨1, ξ⟩ = −1`: hard Lefschetz, `Λ ∈ 𝒜` and nondegeneracy hold while `⟨L·1, 1⟩ = −1 < 0`, so positivity is independent of the rest.

Repair: replace the frame digression by Checks on Lefschetz structures (the one above, and `⟨1, ξ⟩ = 1` as the positive instance); keep the Folder 50 material, if at all, as a reference.

## Verified sound

**Gate and build.** `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 18 declarations: only the eight `sorry` warnings; every elaborated type agrees with its README statement (binders `[CharZero K] [FiniteDimensional K H]` present where the README assumes them; none lost). `IsSl2Triple`, `IsSl2Triple.HasPrimitiveVectorWith`, `LinearMap.aeval_self_charpoly` (`Mathlib/LinearAlgebra/Charpoly/Basic.lean` line 89), `LinearMap.BilinForm.Nondegenerate`, `AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`), `QuaternionAlgebra R c₁ c₂ c₃` (`Mathlib/Algebra/Quaternion.lean` line 65) all resolve at the pin. Dependency check as submitted: `depcheck: 205 roadmaps, 1419 edges, 0 problem(s)` (see R03 for the honest run). Diff outside the folder: none. `metadata.toml` has the same shape as ComplexKahlerGeometry's on main.

**Duplication at the pins.** `grep -ri lefschetz` over the pinned Mathlib and Tau Ceti hits only `AxGrothendieck.lean`, `ModelTheory/.../IsAlgClosed.lean` and `TauCeti/AlgebraicTopology/Cohomology/Twisted/Relative.lean` (unrelated uses of the word); no hard Lefschetz, primitive decomposition or Lefschetz operator exists at the pins; no Chow groups in Tau Ceti (only function-field divisors). Ownership against the open pull requests, by `roadmaps grep` for "Lefschetz inverse", "Lefschetz structure", "lowering operator", "grade projector": only DeligneWeightsAndPurity §9.7 (which defers the operators downstream) and MotivesAndAlgebraicCycles §7.3 (variety level, R04) touch these objects; LefschetzPencilsAndVanishingCycles line 1128 is the monodromy operator. The abstract Layer 0–1 theory has no other owner.

**Cross-roadmap citations resolved.** DeligneWeightsAndPurity §9.7 (head of #929: `primitivePiece`, `lefschetzDecomposition`, `lefschetzPairings`, the `ℕ → ℤ` extension, `P^j = primitivePiece 𝒱 λ n (n−j)`); EtaleDualityAndPerverseSheaves §5.7 (`gradedLefschetz_vectorSpace_compat`; `abstractPrimitiveDecomposition` is named in §5.8); MotivesAndAlgebraicCycles §§0.1, 0.2, 0.5, 2.2 (minimal classical Weil theory, forgetful compatibility stated in its Scope), 2.3 (third Check: `ℙ¹`, degrees `1` and `−1`, as the README says), 7.3, 7.4, and its naming of this roadmap (still as "StandardConjectures") as consumer; LieHighestWeight Layer 0 on main (`RepresentationTheory/LieHighestWeight`, `IsSl2Triple` engine); ComplexKahlerGeometry K6.1 on main (hard Lefschetz, primitive decomposition, Hodge–Riemann); SchemeAndStackFoundations §§5.1–5.6, 5.10 on main; EtaleCohomologyFoundations §§F.5–F.7 on main; HodgeStructures under `Completed/`. The worker's six unresolved Lean names (`DonneesHodge.*`, `ModelA.*`, `ModelB.*`) are names in the external appendix files, not claims about `Suggested.lean`: they exist there (folder16lean lines 753, 854, 874; Folder50 read online).

**Adversarial pass.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `LefschetzStructure` | `n = 0`; `K[ξ]/(ξ^{n+1})`; odd-degree example of 0.1 | `n = 0`: `L = 0`, `L⁰` bijective on `H⁰`; `K[ξ]/(ξ³)`, `n = 2`: `L²: 1 ↦ ξ²` bijective `H⁰ → H⁴`, `L⁰` the identity on `H²`; odd example: `L²(1) = ξ²`, `L|_{H¹} = φ(·,−)` bijective iff `φ` nondegenerate | sound; Check (odd) correct | none |
| `primitive` | `i > n`; `n = 1`, `H = Ke₀ ⊕ Ke₂` | `i > n`: `⊥` (natural subtraction would give `H^i ∩ ker L`); `n = 1`: `P⁰ = Ke₀`, `P² = 0`; with `P² = H²` no `Λ` (`Λe₂ = 0` and `Λ(Le₀) = e₀`) | sound; Check correct | none |
| `IsLefschetzInverse`, `existsUnique_isLefschetzInverse` | `n = 1` two-term; `ℚ[ξ]/(ξ³)` | `Λe₂ = e₀`, `Λe₀ = 0`; `Λ = E₁₂ + E₂₃` in basis `1, ξ, ξ²`; condition `j + 2(k+1) ≤ 2n − j` is `k + 1 ≤ n − j`, so `Λ` is defined on all `L^{k}P^j`, `1 ≤ k ≤ n−j`, which span `H` directly by 0.2 | exists and unique over any field; `[CharZero K]` unused | note |
| `IsWeightOperator`, `exists_sl2` | `f L^{k+1}x := (k+1)(n−j−k)L^k x` on `x ∈ P^j` | `[L,f]L^k x = (k(n−j−k+1) − (k+1)(n−j−k))L^k x = (j + 2k − n)L^k x = (deg − n)L^k x`; `[h,L] = ((i+2−n) − (i−n))L = 2L`; `[h,f] = −2f`; matches Mathlib `IsSl2Triple` with `e = L` | sound | R10 (contract wording) |
| `sl2_lower_L_primitive` | `k = 0`; `j = n` | `f(Lx) = 1·(n−j)x`; `j = n`: `Lx = 0 = (n−n)x`, so `j < n` is unneeded; `f ≠ Λ` iff `n − j ≥ 2` (0.3 Check) | true; mirrors Check | R11 |
| `grade_eq_iSup_primitive` | `i = 2n+1`; `ℚ[ξ]/(ξ³)`, `i = 0, 2, 4` | `i > 2n`: LHS `⊥`, RHS `L^k P^{i−2k}` with `k ≥ n−j+1` is `0`; `i = 2`: `P² ⊕ LP⁰ = 0 ⊕ ℚξ`; `i = 4`: `L²P⁰ = ℚξ²` | sound (DeligneWeightsAndPurity §9.7 (i) reindexed) | R03 |
| `lambda_pow_L_pow` | `ℚ[ξ]/(ξ³)`, `n = 2`, `i = 0, 2`; general | `Λ²ξ² = 1`, `Λξ² = ξ ≠ 1`; `i = 2`: `Λ⁰L⁰ = 1`; general: each `Λ` step keeps `j + 2·exp ≤ 2n − j` since `j + 2k = i ≤ n` | sound | none |
| `AlgebraicStructure`, `LambdaAlgebraic`, `ProjectorsAlgebraic` | `𝒜 = End`; `𝒜 = F[L]` on `K[ξ]/(ξ^{n+1})`, `n ≥ 1` | `F[L] ∋ a₀ + a₁L + …` raises degree; `π_0 ξ = 0`, `π_0 1 = 1` forces `a₀ = 1`, `a_i = 0`, so `π_0 = 1 ≠ π_0`: both fail (1.5 correct); Convention's `𝒜`-stability of `A` absent in Lean | definitions determine their object | R09 |
| `PositiveOnAlgebraicPrimitive` | `n = 0`; `ℚ[ξ]/(ξ²)`, `⟨1,ξ⟩ = ±1` | `n = 0`: `⟨x,x⟩ > 0`; `+1`: `⟨L1, 1⟩ = 1 > 0` holds; `−1`: fails while everything else holds (negative control) | value forced into `ℚ` | R09, R12 |
| `PairingNondegenerateOnAlgebraic` | `A¹ = ℚa ⊕ ℚb`, `a·b = 1`, `a² = b² = 0` (`ℙ¹×ℙ¹`), `n = 2` | `a − b` pairs to `0` with `a + b` but to `−1` with `a`: all `y ∈ A^{n−i}` must be tested (as in the definition) | sound | none |
| `projectorsAlgebraic_of_lambdaAlgebraic` | route on `ℚ[ξ]/(ξ³)` | `L = E₂₁ + E₃₂`, `Λ = E₁₂ + E₂₃`: `Λ²L² = E₁₁ = π_0`, `L²Λ² = E₃₃ = π_4`, `1 − LΛ = E₁₁` (projector onto primitives `P⁰`), `L(1−LΛ)Λ = E₂₂ = π_2`; general: `1 − LΛ` projects onto `⊕P^j`, `Λ^{n−j}L^{n−j}(1−LΛ) − Λ^{n−j+1}L^{n−j+1}(1−LΛ)` onto `P^j`, `L^k(·)Λ^k` onto `L^kP^j`; needs only a ring containing `L, Λ` | true as stated | R06 (sketch wording) |
| `inv_mem_of_charpoly` | `w = 1 + L` on `ℚ[ξ]/(ξ³)`, `𝒜 = F[L]`; `w = L` | charpoly `(T−1)³`, `w⁻¹ = 1 − L + L² ∈ F[L]`; `L` not a unit (det `0`), hypothesis `IsUnit` needed; `hD` quantified over all of `𝒜` where only `w` is used | true | note |
| 1.3 "hence `Λ ∈ 𝒜`" | single ring, `u_i ∘ L^{n−i}` | not a unit of `End H`; appendix concludes inverse of `L^{n−i}` only | overclaim | R05 |
| `pairingNondegenerate_of_lambdaAlgebraic_of_positive` | route, `2i ≤ n` and `2i > n`; `n = 0` | `x = Σ L^k x_k`, `x_k ∈ A^{i−k} ∩ P^{2(i−k)}` (via `q_k(L,Λ)` and `hA`); `⟨x, L^{n−2i+k}x_k⟩ = ⟨L^{n−2(i−k)}x_k, x_k⟩ ≠ 0` by positivity, cross terms vanish by `⟨Lx,y⟩=⟨x,Ly⟩` and primitivity; `2i > n`: `x = L^{2i−n}z`, `z = π Λ^{2i−n} x ∈ A^{n−i}`, test vectors `L^{2i−n}(L^k z_k) ∈ L^{2i−n}A^{n−i}`; `n = 0`: positivity gives it directly; `hpair_grade` unused | true as stated | R09 note |
| 0.4 pairing remarks | `n = 1`, `⟨e₀,e₂⟩ = 1` | `⟨Le₀,e₀⟩ = ⟨e₂,e₀⟩ = 1`, `⟨e₀,Λe₀⟩ = 0` | correct | none |
| 0.1 odd Check | `x, y ∈ V` | `⟨Lx,y⟩ = ⟨φ(·,x), y⟩ = −φ(y,x) = φ(x,y) = ⟨x, Ly⟩`; `H²×H²` perfect iff `Q` nondegenerate; `P² = W` | correct | none |
| 2.2 Check (`ℙ¹`) | degrees of `L`, `L⁻¹` | `1`, `−1`; `CH¹(ℙ¹×ℙ¹)_ℚ` is degree `0` | agrees with MotivesAndAlgebraicCycles §2.3 Check 3 | none |
| 2.5 curve case | `[pt × X]_*`, `[X × X]_*` on `H⁰, H¹, H²` | `[pt×X]_* = π_0`; `[X×X]_*(γ(ξ)) = (deg ξ)·1`, kills `H⁰`, `H¹` | false as written | R01 |
| 1.4 Check (frame) | `ModelB`: `α = i` | `α′α = (Re α)² = 0`, `ν(α+n) = (a+n)²`, `tr = 2a = 0`; `ModelA` trace formula `2 ≠ 4`/`2 ≠ 0` | consistent with Folder50 | R12 (not a Check of the object) |

**Sources read.** Folder16.lean at the cited commit (folder16lean, author-page text): `inverse_mem_of_charpoly` line 244 matches `inv_mem_of_charpoly` exactly; `inverse_Lefschetz_algebrique` line 277 (R05); `projecteurs_mem_lefschetz` line 438 with `Homogene` line 304 (R06); `lefschetz_iff` line 854, `poincare_iff` line 874, `assoc_iff` line 753 as described in 0.1 and Provenance. Folder50.lean read online at the same commit (the service rejected it as "unrecognised file"): `ModelA`, `ModelB`, `tr_mul_I`, `ModelA.not_trace_formula`, `ModelB.tr_star_i_mul_i`, `ModelB.nef_pos`, `tr_star_mul_self_pos`, `charPoly_unique`, `natDegree_charPoly` exist with the statements the README describes.

## Not verifiable

- Kleiman 1968 (Dix exposés), Kleiman 1994 (PSPUM 55, DOI 10.1090/pspum/055.1/1265519), Grothendieck 1969 (Bombay), Lieberman 1968 (AJM, DOI 10.2307/2373533, JSTOR), André 2004 (SMF), Correspondance Grothendieck–Serre (SMF 2001): the sources service found no legal copy; listed in `needs-references.toml`. Their locators in the README are in any case too coarse to check (R08); MotivesAndAlgebraicCycles §7.3 cites Kleiman 1994 Theorem 4.1, Corollary 4.2, Proposition 5.1 for the same implications.
- Montpellier fonds, folders 14, 16 and 50 (pages 43–46, 47–48, 24–28): the archive host timed out twice. The appendix files above are the only readable witness for the folder-16 statements.

## Source issues

- none
