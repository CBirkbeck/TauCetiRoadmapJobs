# Review of CongruenceSpectralGap (pull request #1504 at 86faacb)

**Verdict:** accepted

This report has no findings. The previous report's one finding is repaired, the repair introduced no new problem, and the gate passes at this head.

## Previous findings

- R01 — repaired: `README.md:98` now reads “whose congruence subgroup `ideleCongruenceSubgroup` is ℝ_(>0)×U(N). Here U(N)={x∈ℤ̂^× : x≡1 mod N} …”. Line 302 reads “det K(N)=U(N)={x∈ℤ̂^× : x≡1 mod N} (AdelicAlgebraicGroups §5.2)”, line 306 reads “det K(N)=U(N)”, and the N=5 negative control is at line 319.

## Verified sound

:robot: Independent AI incremental re-review of **7 changed lines since 77c3e7b**: 4 insertions and 3 deletions, all in `README.md`. `Suggested.lean` is byte-identical to the previous head (`git diff 77c3e7b9 HEAD` on it is empty), and nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean).

I checked:
- the previous finding R01, and all three parts of its repair;
- every changed passage:
  - the GlobalNumberFields contract (line 98);
  - the §0.5c residual bullet (line 302);
  - the §0.5c route (line 306);
  - the new §0.5c N=5 Check (line 319);
- what depends on them:
  - §0.5c's other Checks (N=1, 2, 3 and the spherical vector);
  - §0.6's reduction of the residual part to the constants;
  - §1.2, which cites the same GlobalNumberFields paragraph for the norm shift;
  - the §0.5c *Needs* line (322) and the Layer 0 Dependencies (364);
- the pinned Tau Ceti declarations named in the changed text;
- AdelicAlgebraicGroups §5.2 at its open head, and GlobalNumberFields Layers 6, 7, 9 and 10 on main;
- the gate, the dependency check, the elaboration, the `#check` probe and the one-tactic probe;
- the declared gaps;
- the seeded sample: §§0.6 and 1.2 depend on the changed passages and were checked in full; the cached locators of the rest were re-read.

The adversarial tables add **15 fresh rows** with computed values and carry **107 rows** forward.

**Gate and dependency direction.** I reran the gate at this head:

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on this head, which includes the targeted build, also reports `build=0 OK`. The prescribed dependency command returned:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The diff adds no supplier:
- GlobalNumberFields is on main as a completed roadmap (`Completed/GlobalNumberFields`).
- AdelicAlgebraicGroups was already cited. It is at line 35 of the merge order, and this roadmap is at line 153.

**Elaboration, signatures and padding.**
- `lake env lean` on `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` succeeded. Its only output was the three `sorry` warnings, at lines 52, 63 and 79.
- A scratch copy with `#check @name` for all four declarations elaborated, with types identical to the previous report's and to the README:
  - `hyperKloosterman : (F : Type u_1) → [Field F] → [Finite F] → {K : Type u_2} → [CommRing K] → ℕ → AddChar F K → Fˣ → K`;
  - `hyperKloosterman_bound`, with `1 ≤ k` and `ψ ≠ 1`;
  - `gauss_power_even_average_bound`, with `2 < q` and `1 ≤ k`;
  - `congruence_eigenvalue_bound`, with `IsCongruenceSubgroup Γ`, `ContDiffOn ℝ 2`, Γ-invariance, boundedness and nonconstancy.
- No section binder is lost, and nothing changed.
- One-tactic probe, rerun on a scratch copy with each `sorry` replaced by `simp`:
  - line 56: “`simp` made no progress”;
  - line 68: “unsolved goals”;
  - line 87: “`simp` made no progress”.
- No declaration is padding.
- The headline theorems are unchanged: the three numerical and eigenvalue headlines are stated. The module docstring names the non-statable ones, among them the principal-level adelic spectral decomposition of §0.5c, which lacks the adelic quotient carrier.

**Pinned Tau Ceti declarations opened for the changed text.** Tau Ceti is pinned at `a91d3aaf`, unchanged. All of these are in `TauCeti/NumberTheory/NumberField/Global/`.

| Declaration | File:line | What it says, against the README |
| --- | --- | --- |
| `ideleCongruenceSubgroup` | `Ideles/Congruence.lean:193` | It requires valuation one at every p∤𝔪, x_p−1 of valuation at most exp(−v_p(𝔪)) at p∣𝔪, and positivity at the selected real places. At `ratModulus N` this is ℝ_(>0)×U(N), as line 98 now says. |
| `ideleCongrOneSubgroup` | `Ideles/Congruence.lean:103` | Its docstring says that no condition is imposed at any other place. The README's file path is correct, and so is its statement that this subgroup omits the unit condition. |
| `ideleCongrOneSubgroup_inf_ideleCongruenceSubgroup_one` | `Ideles/Congruence.lean:478` | The congruence subgroup is the meet of the congruent-to-one subgroup with the units at every finite place, which is the decomposition the README describes. |
| `ratModulus` | `RayClass/Rat.lean:73` | Finite part (n) and infinite part the real place, i.e. the modulus N·∞. |
| `ratModulusEquivZMod` | `RayClass/Rat.lean:202` | `RayClassGroup (ratModulus n hn) ≃* (ZMod n)ˣ`. |
| `raySubgroup` | `Ideles/Ray/Subgroup.lean:63` | Image of `ideleCongruenceSubgroup`. |
| `rayClassQuotient`, `rayClassQuotient_surjective`, `ker_rayClassQuotient` | `Ideles/Ray/ClassQuotient.lean:203`, `:229`, `:305` | Onto, with kernel `raySubgroup 𝔪`. |
| `HeckeCharacter.shift`, `HeckeCharacter.unitaryPart` | `HeckeCharacter/Shift.lean:209`, `:273` | Unchanged citations; they exist. |

**Cross-roadmap citations resolved for the changed passages.**

| Supplier | Passage resolved |
| --- | --- |
| AdelicAlgebraicGroups, at its open head (`roadmaps show`) | §5.2 “`GL₂` over `ℚ` and principal levels” (its README line 5328). The principal-congruence-level item at its line 5457 proves det K(N)={x∈ℤ̂^× : x≡1 mod N} (line 5458), with components indexed by (ℤ/N)ˣ. Its line 4947 writes U(N)=ℤ̂^×∩(1+Nℤ̂), the notation now adopted. |
| GlobalNumberFields, on main (`Completed/GlobalNumberFields/README.md`) | Layer 7 at line 459 defines one `ideleCongruenceSubgroup 𝔪`: principal units at the divisors of 𝔪, local units at the other finite places, positivity at the selected real places. `rayClassQuotient` is at line 469 and the `ratModulus` identification at line 566 (Layer 10, line 531). Layers 6 and 9 are at lines 439 and 508. |

- `roadmaps resolve` on the README reports no unresolved citation or Lean name. The Tau Ceti names it could not check on this host were checked by hand at the pin above.
- `roadmaps overlaps` lists no other pull request that changes this folder, no dropped id and no id defined only by an open revision.
- `roadmaps grep ideleCongrOneSubgroup` finds the name only at this README's line 98, so no other roadmap uses the wrong subgroup.

**Seeded sample.** Two sampled targets depend on the changed passages: §0.6, which transports §0.5c, and §1.2, which cites the GlobalNumberFields paragraph. Both were checked in full, and their fresh rows are below. The others are untouched by the diff; their rows are carried, and their cached locators were re-read at this head.

| Seeded target | Treatment at this head |
| --- | --- |
| 0.5b Principal-level cusp compactness | Unchanged; rows carried (width tails 1/(4π²R²), 9/(4π²R²)). The lrs95 §1 locator is uncertified. |
| 0.6 Congruence spectral description | Depends on §0.5c. The residual part restricts to the constants for every φ(N) (fresh row). The Checks (Γ(1): (3/π)(π/3)=1; Γ(2): (1/(2π))(2π)=1, three channels; 1/5 excluded) are unchanged and consistent. |
| 0.7 Rayleigh and clipped spectrum comparison | Unchanged. teschl line 5044 is Theorem 4.10 (min-max), and line 5053 is its form-domain version. Both are under the extraction's page marker 131, printed p.119, as the README locates them. |
| 1.1 Exceptional cuspidal dictionary | Unchanged; the row r=0, .2, .5 → .25, .21, 0 is carried. lrs95 §1 is uncertified. |
| 1.2 Monomial archimedean temperance | It cites the unchanged last sentences of line 98. Its σ=1 Check (line 400) is recomputed fresh. gj78 line 528 (Definition 3.1.3) and line 538 (Proposition 3.2) are under page marker 16, and line 721 (§3.7) under marker 22, as cited. |
| 2.0 Local self-pair positivity and analytic character transport | Unchanged. rs96 line 3181 (the p-adic Rankin–Selberg factors, manuscript p.52) and line 3302 (Lemma 5.1, p.54) were re-read. lrs95 Lemma 2.1 is uncertified. |
| 3.1 Mellin cutoff kernel | Unchanged. Mathlib `mellin` and `mellinInv` match the conventions (previous report). lrs95 (3.6) is uncertified. |
| 4.1 Even prime-twist average | Unchanged; the Q=3 row is carried. lrs95 (3.4) is uncertified. |
| 4.2a Raw hyper-Kloosterman sums over every finite field | Unchanged. katz-gkm line 1845 (table of multiplicative convolutions) and line 1871 (product-fibre sums) were re-read. |
| 4.2b Kloosterman sheaves and the general Deligne estimate | Unchanged. katz-gkm line 1902, Theorem 4.1.1, was re-read. |
| 4.3 Gauss-power average | Unchanged. The Lean `gauss_power_even_average_bound` is unchanged, and the q=3 and q=5 rows are carried. lrs95 Proposition 3.1 is uncertified. |
| 4.4 Prime-twist average asymptotic | Unchanged; the balanced-error and divisor-boundary rows are carried. lrs95 (3.18) is uncertified. |
| 5.1 Luo–Rudnick–Sarnak parameter bound | Unchanged; the m=2, 3 endpoint rows are carried. lrs95 Theorem 1.2 is uncertified. |
| 5.4 Congruence Rayleigh inequality | Unchanged. teschl lines 5044 and 5053 were re-read, and the rows 0≤0, .21=.21, .84=.21·4 are carried. |
| 5.5 Curvature rescaling comparison | Unchanged; the κ=4 row (quotient .84=21/25, threshold 1) is carried. |

**Fresh adversarial computations** (the changed statements and those that depend on them):

| Statement | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| Line 98: `ideleCongruenceSubgroup` at N·∞ equals ℝ_(>0)×U(N) | The pinned conditions at `ratModulus N` and the README's components agree at every place. N=1: pinned ℝ_(>0)×ℤ̂^×, and U(1)=ℤ̂^×. N=3 at p=2: pinned ℤ₂^× (2∉), and U(3)₂=ℤ₂^×. N=12: pinned 1+4ℤ₂ and 1+3ℤ₃, and README 1+2²ℤ₂ and 1+3ℤ₃. | Correct; R01 repaired. |
| Line 98: U(N) is the product of its components and is a group | Closure: (1+pᵏa)(1+pᵏb)=1+pᵏ(a+b+pᵏab) for k=v_p(N)≥1. By CRT, x≡1 mod N iff x_p≡1 mod p^(v_p(N)) for every p∣N. Index at N=12: [ℤ₂^×:1+4ℤ₂]·[ℤ₃^×:1+3ℤ₃]=2·2=4=φ(12). | Correct. |
| Line 98: ℚ^×\𝔸^×/(ℝ_(>0)×U(N)) ≅ ℤ̂^×/U(N) ≅ (ℤ/N)ˣ | Every idele times sign(x_∞)∏p^(−v_p(x_p))∈ℚ^× lies in ℝ_(>0)×ℤ̂^×. A rational number that is a unit at every p is ±1, and positivity at ∞ leaves 1, so the intersection is {1}. Orders for N=1, 2, 3, 4, 5, 12: 1, 1, 2, 2, 4, 4. | Correct. |
| Line 98: direction of the composite (convention probe) | Pinned: `rayClassQuotient_mk_of_mem` sends an idele congruent to one to the class of its ideal, and `coe_ratModulusEquivZMod_idealClass` sends that class to the norm mod n. So e_p (p at the place p) ↦ p mod N, while reduction on ℤ̂^×/U(N) sends the same class, that of p⁻¹e_p, to p⁻¹. At N=5, p=2 the values are 2 and 3. | The two maps differ by u↦u⁻¹, an automorphism, which on characters is χ↦χ̄, a bijection. Line 98 asserts only an isomorphism and a count, and no statement fixes a τ↔χ pairing; the N=3 Check uses the real χ₃, whose values (1,−1) are the same either way. No change. |
| Line 98: `ideleCongrOneSubgroup` omits the unit condition | At 5·∞ the pinned subgroup contains e₂: no condition applies at 2, x₅=1∈1+5ℤ₅ and x_∞=1>0. The valuation of 2 at 2 is not one, so e₂∉`ideleCongruenceSubgroup`(5·∞). | The README's disambiguation is correct. |
| Line 98: Hecke characters trivial on ℝ_(>0)×U(N) ↔ Dirichlet characters mod N | Such a τ is trivial on `raySubgroup`(N·∞), so it factors through `RayClassGroup` ≅ (ℤ/N)ˣ. The count is φ(N). N=4: {1, χ₄}, both parities, 2=φ(4). N=1: the constant only, and (ZMod 1)ˣ is trivial. | Correct; “primitive or not” is consistent. |
| Line 302: det K(N)=U(N) | ⊆: k≡I mod N gives det k∈ℤ̂^× with det k≡1 mod N. ⊇: diag(u,1)∈K(N) for every u∈U(N). N=1: det GL₂(ℤ̂)=ℤ̂^×=U(1). N=3 at p=2: K(3)₂=GL₂(ℤ₂), with determinant ℤ₂^×=U(3)₂. AdelicAlgebraicGroups §5.2, line 5458 at its head, states the same. | Correct; the citation resolves. |
| Line 302: residual dimension φ(N) | N=1, 2, 3, 5 give 1, 1, 2, 4, agreeing with the Checks at lines 316, 317, 318 and 319. The τ∘det are orthogonal: Σ_(d∈(ℤ/N)ˣ)χ₁(d)·conj χ₂(d)=0 for χ₁≠χ₂, since the components have equal volume. At N=5, χ of order 4 against 1: 1+i−1−i=0. | Consistent. |
| Line 306: route through det K(N)=U(N) | det SO(2)={1}, so right K(N)·SO(2)-invariance of τ∘det is triviality of τ on U(N), and `ideleCongruenceSubgroup`(N·∞)=ℝ_(>0)×det K(N). This feeds Layers 7 and 10 exactly as line 98 states. | Consistent. |
| Line 319: N=5 negative control, the larger group | The described group (positive at ∞, ≡1 mod 5 at the place 5, nothing elsewhere) is exactly the pinned `ideleCongrOneSubgroup`(5·∞). It contains ℝ_(>0)×U(5). | The Check names the plausible wrong model. |
| Line 319: classes of the primes | p⁻¹e_p has entry p⁻¹ at ∞ and at every ℓ≠p, and 1 at p. Its 5-component is p⁻¹. Inverses mod 5: 2·3=6≡1, 3·2≡1, 11≡1, 19≡4 with 4·4=16≡1. The classes 3, 2, 1, 4 equal {1,2,3,4}=(ℤ/5)ˣ. | Matches the README's values. |
| Line 319: conclusion | The image of the larger group contains ℝ_(>0)×U(5) and a representative of every class of ℤ̂^×/U(5), so it is all of C_ℚ≅ℝ_(>0)×ℤ̂^×. This leaves 1 character and a 1-dimensional residual part, against φ(5)=4. | Correct and discriminating (1 against 4). |
| §0.6 constants (uses §0.5c) | Restriction to the identity component (det class 1) sends τ∘det to τ(1)=1, so the φ(N) componentwise constants give one line. N=5: 4 → 1. N=3: (1,1) and (1,−1) restrict to 1 and 1. | Consistent with “the residual weight-zero subspace is exactly the constants”. |
| §1.2 σ Check (line 400, uses line 98's last sentences) | For x∈𝔸_ℚ^×⊂𝔸_K^×, \|x\|_K=\|N_(K/ℚ)x\|=\|x\|², so θ₀\|·\|_K^σ restricts to \|·\|^(2σ). σ=1 gives 2, which is not unitary; σ=0 gives 0. | Correct. |
| §0.5c Checks, mutual consistency | φ(N) for N=1, 2, 3, 5 is 1, 1, 2, 4; c(N) for N=1, 2, 3 is 1, 3, 4; h_N for N=1, 2, 3 is 1, 3, 8. The N=5 Check states no cusp count, so nothing conflicts with c(5)=60/5=12 (projective index 60, width 5). | Consistent. |

**Carried adversarial rows.** These are the previous report's rows for statements the diff leaves untouched. Each is attributed:
- `[r4]` marks rows computed by the previous report.
- `[r3 via r4]` and `[r2 via r4]` mark rows that report carried from earlier reports.

They are not re-derived here. The line numbers are those of the head each report read. Lines after 318 have shifted down by one at this head: the §0.5c *Needs* line is now 322 and the Layer 0 Dependencies paragraph is now line 364. Pipes inside cells are escaped.

[r4]: packages/CongruenceSpectralGap/reports/PRREVIEW-CongruenceSpectralGap~4.md

| Statement | Instances and computed sides | Result / change |
| --- | --- | --- |
| Line 318: N=3 Check | SL₂(ℤ)→SL₂(𝔽₃) is onto and \|SL₂(𝔽₃)\|=24. −I≡diag(2,2)≢I mod 3, so −I∉Γ(3) and the image in PSL₂(ℤ) ≅ Γ(3), of index 24/2=12. Each cusp has width 3 (stabilizer ⟨T³⟩), so c(3)=12/3=4. Genus 1+12/12−0−0−4/2=0. h₃=2·4=8. Components {1,2}: 1∘det=(1,1), χ₃∘det=(1,−1). | Correct; the quotient notation of the previous R03 is gone. [r4] |
| Line 318: full-Borel negative control | −1∈ℚ^× maps onto −1∈𝔽₃^×, so GL₂(𝔸_f)=GL₂(ℚ)K(3). GL₂(ℚ)∩K(3)=Γ(3), since det ±1 with det ≡ 1 mod 3 forces det = 1. B(ℚ)\GL₂(ℚ)/Γ(3)=Γ(3)\ℙ¹(ℚ) has 4 points, against 8 for B(ℚ)⁺. The O(2) quotient has (ℤ/3)ˣ/{±1}, i.e. 1 component. | Correct (unchanged clause of the edited sentence). [r4] |
| §0.5c N=2 Check (uses line 98) | 1+2ℤ₂=ℤ₂^×, so U(2)=ℤ̂^×=U(1) and the quotient is trivial; φ(2)=1, and the only character has conductor 1. | Consistent. [r4] |
| §0.6 constants (uses the residual count) | Restricting to the identity component (det class 1) sends each τ∘det to the constant τ(1)=1, so the φ(N) functions give one line: at N=5, 4 → 1. | Consistent with “the residual weight-zero subspace is exactly the constants”. [r4] |
| Lines 321 and 363: *Needs* and Dependencies | GlobalNumberFields Layers 6, 7, 9 and 10 are on main at `Completed/GlobalNumberFields/README.md:439`, 459, 508 and 531, and at its open revision's head at 673, 694, 746 and 769. The revision adds Layer 3G and renumbers nothing. Each layer is used: density (6), ray quotient (7), Hecke characters, shift and pullback (9), the `ratModulus` identification and character types (10). | Consistent; no dangling layer. [r4] |
| Repair of the previous R01: rs96 entry | The manifest key `rs96` has sha 393cd6ad…, which names the cached text. rs96 line 3181 (p.52), line 3254 (p.53), line 3302 (p.54, Lemma 5.1) and line 3339 (p.55) lie on manuscript pp.52–55 as the locator states. | Repaired. [r4] |
| Title and scope, lines 1 and 7 | AutomorphicSpectralTheory's own Part II is AutomorphicSpectralTheoryPartII (merge order line 290), which cites this roadmap at `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:103` and 387 (quotient Laplacian from §§0.1–0.2, compact cuspidal resolvent from §0.5b). A second “Part II” of the same base would have two Part-II owners. | Standalone title is consistent with the existing consumer; no change. [r3 via r4] |
| AST contract, line 80: level-one expansion only | AST §4.8 at its head (line 2403) displays the one-cusp formula on PSL₂(ℤ)\ℍ and says a level subgroup has one family per cusp, without stating it; grep of the AST head for `K(N)` and “principal level” returns nothing. | §0.5c's specialization is new work, owned here; no re-plan. [r3 via r4] |
| §0.5c residual Casimir | τ∘det is right-SL₂(ℝ)-invariant; the 𝔰𝔩₂ Casimir differentiates along SL₂(ℝ), so Ω_N(τ∘det) = 0 on all φ(N) functions. A hypothetical value 1/5 would contradict this, as §0.6's third Check says. | Correct. [r3 via r4] |
| §0.5c continuous multiplicity, real factor | B(ℝ)∩SO(2) = {±I}; T(ℝ)/T(ℝ)⁰ = {±1}², modulo ±I two classes. diag(−1,1) (det −1) swaps them; diag(a,b) with ab > 0 has signs (+,+) or (−,−) = −I·(+,+) and fixes them. | The reduction to B(ℚ)⁺ is right. [r3 via r4] |
| §0.5c strong approximation step | For g ∈ GL₂(𝔸_f), gK(N)g⁻¹∩N_B(𝔸_f) is an open subgroup V of 𝔸_f and ℚ+V = 𝔸_f, so N_B(𝔸_f)gK(N) = N_B(ℚ)gK(N). At N = 1, g = 1: V = ℤ̂ and ℚ+ℤ̂ = 𝔸_f. | Density input used correctly (GlobalNumberFields Layer 6, line 679 at its head). [r3 via r4] |
| §0.5c cusp count h_N | GL₂(𝔸_f)/K(N) = ⊔_(ℤ/N)ˣ GL₂(ℚ)⁺/Γ(N) (K(N) normal in GL₂(ℤ̂), representatives there); B(ℚ)⁺\GL₂(ℚ)⁺ = ℙ¹(ℚ) with stabilizer of ∞ equal to B(ℚ)⁺ (SL₂(ℚ) is already transitive). So #X = φ(N)·#(Γ(N)\ℙ¹(ℚ)): N = 1, 2, 3 give 1, 3, 8. | Formula h_N = φ(N)c(N) verified; equals the cusp count of ⊕_(ℤ/N)ˣ L²(Γ(N)\ℍ). [r3 via r4] |
| §0.5c N = 2 Check | φ(2) = 1, c(2) = 3 (index 6 in PSL₂(ℤ), widths 2); the only character mod 2 is the trivial one, conductor 1, imprimitive. | Correct. [r3 via r4] |
| §0.5c N = 1 Check versus AST §4.8 | AST line 2403 displays (4π)⁻¹∫_ℝ⟪E(·,1/2+it),f⟫E(z,1/2+it)dt. The integrand is even in t (E(z,1/2−it) = φ(1/2−it)E(z,1/2+it) with \|φ\| = 1 on the line), so (4π)⁻¹∫_ℝ = (2π)⁻¹∫_(t>0); treating ±t separately would double the multiplicity. | Matches AST's displayed normalization. [r3 via r4] |
| §0.5c symmetric-family norm | AST §4.1 (line 2298) defines the norm Σ_P n_P⁻¹∫‖F_P‖² with n_P = Σ_Q \|W(𝔞_P,𝔞_Q)\|; for the Borel of GL₂, n_B = 2 and the Check at line 2309 says a reflected section has half the full integrated norm. With F(−λ) = M(w,λ)F(λ) and M unitary, (1/2)∫_ℝ‖F‖² = ∫_(t>0)‖F(it)‖². | The unitary equivalence with L²((0,∞),V) is normalization-consistent. [r3 via r4] |
| §0.5c spherical vector | −y²(∂ₓ²+∂ᵧ²)y^s = −y²·s(s−1)y^(s−2) = s(1−s)y^s; at s = 1/2+it this is 1/4+t², at t = 0 it is 1/4; s(s−1) would give −1/4−t² ≤ −1/4. 1/4 is in the spectrum but not an eigenvalue: the level set {t : 1/4+t² = 1/4} = {0} has measure zero. | Correct. [r3 via r4] |
| §0.5c sum over χ equals #X | ⊕_χ I_B(χ)^(K(N)SO(2)) is the Peter–Weyl decomposition under the compact group T(ℚ)T(ℝ)⁰\T(𝔸) ≅ (ℤ̂^×)² of the functions on the finite set X; dimension #X. At N = 1 only χ = 1 contributes, dimension 1. | The “dim V is the number of points of …” step is justified. [r3 via r4] |
| §0.5c adelic Iwasawa input | AdelicAlgebraicGroups §3.1 at its head, line 2730: `G(𝔸_F) = P(𝔸_F)K = N_P(𝔸) M_P(𝔸)^1 A_P(ℝ)^0 K`, surjective and open (line 2693). For B ⊂ GL₂ this is the displayed factorization. | Citation resolves. [r3 via r4] |
| §0.5c residual blocks input | AST §4.14a (line 2508) works at a fixed unitary central character; §4.6 (line 2381) restricts the decomposition to a fixed central character and twists by unitary characters. L²([GL₂]¹) is the Hilbert sum over the characters of the compact ℚ^×\𝔸^(×,1), so the blocks with d = 1, ν = 2 of all ω give exactly the τ∘det with τ² = ω. | Route inputs exist; the all-central-character passage is covered by §4.6. [r3 via r4] |
| §0.5c projections and reduction | AST §4.4 `projection_equivariant` (line 2358): projections commute with the right action and integrated Hecke actions; the averaging idempotent of K(N)·SO(2) is such an operator, so H_N = ⊕ of the three parts. Reducing Ω_N: the cuspidal part by §0.5a, the residual part (finite-dimensional, in the domain, Ω_N = 0), the continuous part as the complement of two reducing subspaces. | Consistent. [r3 via r4] |
| §0.5b route without the adelic input | Model λ_n = n on the cuspidal space: (A+1)⁻¹ has eigenvalues 1/(n+1) → 0, compact. Tail bound: frequency 2πn/w, n ≠ 0, gives ∫\|u\|²y⁻² ≤ R⁻²∫\|u\|² ≤ (w/(2πR))²∫\|∂ₓu\|² on y ≥ R; widths 1 and 3 give constants 1/(4π²R²) and 9/(4π²R²). The zero mode has ∂ₓu = 0 and positive mass. | Geometric compactness no longer presupposes the finite-multiplicity contract; the transport to the adelic cusp space goes through §0.5a. [r3 via r4] |
| §0.5b *Needs* versus §0.5c *Needs* | §0.5b needs §§0.1–0.2, 0.5a; §0.5c needs §§0.5a–0.5b; §0.6 needs §§0.2, 0.5a–0.5c. The build order 0.5a < 0.5b < 0.5c < 0.6 has no cycle. | No cycle. [r3 via r4] |
| §0.6 after the change | At level N the restriction to the identity component is the average of multiplications by τ∘det over (ℤ/N)ˣ, which preserve the three parts (AST §4.6 twisting). Residual: φ(N) componentwise constants restrict to one constant line; continuous: c(N) channels per component; Γ/Γ(N)-invariant channels ↔ Γ-orbits of cusps of Γ(N) = cusps of Γ (Γ(2): 3 → 3 at Γ = Γ(2); 3 → 1 at Γ = SL₂(ℤ)). | Correct. [r3 via r4] |
| §4.2b Euler–Poincaré descent | Over 𝔽₃ remove the degree-two point x²+1 = 0: one closed point of degree 2, two geometric points over 𝔽₉, each with Swan 1 for Lψ(1/(x²+1)); grouped sum 2·1 = 2 = 1+1; χ_c = (2−2)−2 = −2. Over 𝔽₂ with k = 𝔽₂: x²+x+1 is irreducible, degree 2, same count. | Residue-degree grouping by Galois orbits is correct for perfect k. [r3 via r4] |
| §4.2b imperfect-field Check | k = 𝔽_p(s): x^p−s = (x−s^(1/p))^p over k̄, one geometric point of residue degree p; U⊗k̄ = 𝔸¹, χ_c = 1 for the constant rank-one sheaf; the weighted formula would give 2−p (−1 at p = 3). | Negative control is correct and discriminates perfectness. [r3 via r4] |
| §4.2b coefficient extension step | For a lisse E_λ-sheaf, L⊗ℚ̄_ℓ has the same rank, the same dimensions of H^i_c (flat base change of coefficients) and the same Swan conductors (AGR §3.1 at its head, line 2635: invariance under extension of coefficients). Tame rank-one Kummer sheaf on 𝔾_m: 0 = 0 both before and after. | Inputs named and exist. [r3 via r4] |
| §4.2b owner EtaleDualityAndPerverseSheaves §5.2 | At its head, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4922`–4941: `curveEulerPoincareSwan` for a smooth connected curve U with smooth proper completion C over algebraically closed k, ℓ invertible in k, lisse ℚ̄_ℓ-sheaf L; includes the finite coefficient-field form and compatibility with coefficient extension; no characteristic restriction; U = C allowed (C∖U empty gives χ_c = r(2−2g)). EDPS does not cite CongruenceSpectralGap. | Single owner earlier in the order (line 96 < 147); the former two-owner situation is gone. [r3 via r4] |
| `hyperKloosterman` with `Finite F` | 𝔽₂, k = 2, r = 1: tuples (1,1) only, ψ(0) = 1, value 1 ≤ 2·2^(1/2). 𝔽₃, k = 2, r = 1: (1,1),(2,2) give ζ²+ζ = −1, norm 1 ≤ 2√3. 𝔽₄, k = 1: ψ(r) of norm 1 ≤ 1. `Nat.card 𝔽₄ = 4` so the bound at k = 2 is 2·2 = 4 ≥ 3. | Instance change preserves values and bound. [r3 via r4] |
| `hyperKloosterman_bound` nontriviality guard | Trivial ψ on 𝔽₅, k = 3: value (5−1)² = 16 > 3·5 = 15. | `hψ` remains essential; carried value re-checked. [r3 via r4] |
| Conventions; 0.1 effective area | Signature (0;2,3;1 cusp) gives 2π(−2+1+1/2+2/3) = π/3; projective index 6 at Γ(2) gives 2π. | Counts ±I once; keep. [r2 via r4] |
| 0.1 finite measure/nonzero level | Γ(1) mass π/3 > 0; Γ(2) mass 2π > 0; Γ(0) is the identity subgroup, infinite area. | N ≠ 0 necessary. [r2 via r4] |
| 0.2 positive expression | Δ1 = 0; Δy² = −2y²; s(1−s) = 1/4+t². Opposite sign gives +2y². | Sign fixed. [r2 via r4] |
| 0.2 closed realization/cover | Torsion-free cover levels 3, 6 at N = 1, 2; cutoff beyond R loses mass ∝ w/R and energy ∝ w/R. | Constants survive the closure. [r2 via r4] |
| 0.2 nonzero operator | A nonconstant bump in a free chart has ∫\|∇u\|² > 0. | Excludes the zero realization. [r2 via r4] |
| 0.3 complex mean zero | Integrals of 1 and i are V and iV; v−(∫v)/V integrates to 0. | Real-part kernel would keep i. [r2 via r4] |
| 0.3 integral bound | \|∫c\| = \|c\|V = √V·(\|c\|√V); zero-integral bump gives 0 with positive norm. | Keep. [r2 via r4] |
| 0.4 Rayleigh definition | diag(0,.21,.25): e₂ gives .21/1; 2ie₂ gives .84/4 = .21; norm-only denominator .42. | Correct scaling. [r2 via r4] |
| 0.4 infima/core | Full infimum 0; constant-complement infimum .21; truncation of e₂ is 0 for R < .21. | Keep. [r2 via r4] |
| 0.5 clipped infimum | ∅, {.21}, {1/3} give .25, .21, .25. | Keep. [r2 via r4] |
| 0.5 lower-bound guard | S = {−n} has no real lower bound. | Bounded-below premise kept. [r2 via r4] |
| 0.5a measure isometry | Constant 1 on a component with c_N dA has norm² c_N V; image √c_N has c_N V; unscaled gives V. | Factor necessary. [r2 via r4] |
| 0.5a components/right action | N = 3: SO(2) gives 2 components, O(2) gives 1. N = 5, det 2 moves support 1 → 2⁻¹ = 3. | Convention matches supplier. [r2 via r4] |
| 0.5a level-changing maps | Conjugating [[1,1],[0,1]] by diag(p,1)^∓ gives entry 1/p. | Only GL₂(ℤ̂) acts at fixed level. [r2 via r4] |
| 0.5b cusp tail | Widths 1, 3 give 1/(4π²R²), 9/(4π²R²). | Width cannot be suppressed. [r2 via r4] |
| 0.5b zero-mode exclusion | x-constant tail has positive mass, zero x-energy. | Cuspidality essential. [r2 via r4] |
| 0.6 spectral channels | Γ(1) one channel, Γ(2) three; t = 0, 1 give .25, 1.25. | Not a universal one-channel expansion. [r2 via r4] |
| 0.6 residual removal | Componentwise constants have dimension φ(N) = 4 at N = 5; classical constant line is one. | Component restriction present. [r2 via r4] |
| 0.7 spectral/clipped equality | No exceptional eigenvalue: both .25; with .21: both .21; keeping the constant would give 0. | Right complement. [r2 via r4] |
| 1.1 exceptional parameter | r = 0, .2, .5 give λ = .25, .21, 0. | Open range; parity irrelevant. [r2 via r4] |
| 1.2 unitary monomial branch | Norm shift σ gives central modulus exponent 2σ; σ = 1 at norm 2 gives 4. | Real shift must vanish. [r2 via r4] |
| 1.2 archimedean temperance | Unitary induction bounded; diag(2,1/2) unbounded. | Excludes complementary model. [r2 via r4] |
| 1.3 adjoint normalization | a = 2, b = 3: adjoint weights 2/3, 1, 3/2 (product 1); raw Sym² gives 4, 6, 9. | Central inverse needed. [r2 via r4] |
| 1.3 exceptional lift | r = .2 gives {.4, 0, −.4}. | Spherical GL₃ specialization agrees. [r2 via r4] |
| 2.0 ramified positivity | (1−T)⁻¹ coefficients 1,1,1; deleting the factor gives 1,0,0. | All-prime target necessary. [r2 via r4] |
| 2.0 supercuspidal/logarithm | e = 2: coefficients 1,0,1; log 0,1. e = 1: log 1, 1/2. | Nonnegative. [r2 via r4] |
| 2.0 Steinberg blocks | (1−T)⁻¹(1−T/2)⁻¹: linear 3/2, quadratic 7/4; 5/8+(3/2)²/2 = 7/4. | Agrees. [r2 via r4] |
| 2.0 character transport | η(p) = −1 sends 1 → −1; conductor exponent 2 gives multiplier 1. | Includes ramified pairs. [r2 via r4] |
| 2.0 primitive-twist epsilon | m = 2 ratios 1, a/b, b/a, 1; \|τ\|⁴q⁻² = 1. | Degree m². [r2 via r4] |
| 2.1 functional equation normalization | f = 4, q = 5, m = 2: conductor 2500, numerator norm 50, 50/√2500 = 1. | Unit root number. [r2 via r4] |
| 2.1 gamma/analytic adapter | μ = ±.2: shifts .4, 0, 0, −.4; at Re s = 1 smallest real part .6. | No boundary pole. [r2 via r4] |
| 2.1 excluded twist cases | Primitive twist changes inertia; odd χ has sign −1. | Real hypotheses. [r2 via r4] |
| 2.2 forced zero | β₀ = .4: maximal gamma argument 0; sΓ_ℝ(s) → 2. | No division by a pole value. [r2 via r4] |
| 3.1 cutoff tail | Bump in [1,2]: F₁(.5) = 1, F₁(3) = 0; doubling gives Mellin mass 2. | Normalization fixes the kernel. [r2 via r4] |
| 3.1 Mellin normalization | Indicator of [1,2]: log 2 versus 1; contour factor (2π)⁻¹. | Correct measure. [r2 via r4] |
| 3.2 dual kernel | G = 1, bump in [3,4]: x = .2 gives 1, x = 2 gives 0. | Inversion at 1/x. [r2 via r4] |
| 3.2 differential sign | G(w) = w: βT−a versus βT+a, difference 2a. | Minus sign kept. [r2 via r4] |
| 3.3 pole collision | d = 4: pole order 5, log⁴, absorbed by x^ε. | ε-loss. [r2 via r4] |
| 3.3 small-x integrability | σ = .5, β₀ = .4, ε′ = .1: exponent −.5, integral 2; at ε′ = .6 diverges. | ε′ < 1−β₀. [r2 via r4] |
| 3.4 two-kernel equation | β = .5: both n^(−.5); Y → 2Y doubles nY/(fq^d). | Reciprocal scale. [r2 via r4] |
| 4.1 finite average | Q = 3 gives q = 5, total 1; fπ = 5 removes it. | Indexing verified. [r2 via r4] |
| 4.2 even orthogonality | q = 5: residues give 0,1,−1,−1,1; q = 3 gives 0. | Principal subtraction required. [r2 via r4] |
| 4.2 main n = 1 coefficient | q = 5: (q−1)/2−1 = 1. | Passes. [r2 via r4] |
| 4.2a rank zero/one | 𝔽₃, k = 0: r = 1 gives 1, r = 2 gives 0; k = 1 gives ψ(r). | Empty product handled. [r2 via r4] |
| 4.2a coefficient ring | 𝔽₃, k = 2, r = 2 raw sum 2; mod 2 gives 0; zero ring 0 = 1. | General coefficients allowed. [r2 via r4] |
| 4.2a additive scaling | a = −1, k = 2: same values; k = 1 sends ψ(r) to ψ(−r). | Direction correct. [r2 via r4] |
| 4.2a eliminated-variable comparison | 𝔽₃, k = 2, r = 1: ζ²+ζ = −1 both ways; r = 2: 2. | Agrees. [r2 via r4] |
| 4.2b additive sheaf | 𝔽₃: trace ζ at 1; over 𝔽₉ trace ζ². | Geometric Frobenius fixed. [r2 via r4] |
| 4.2b tensor phases | Characteristic 2: phase 2x = 0, trace 1, Swan 0. | Phase addition. [r2 via r4] |
| 4.2b Euler–Poincaré, tame/proper | Constant rank r on 𝔾_m: 0; on ℙ¹: 2r; Kummer sheaf H_c = 0,0,0. | Empty boundary and characteristic zero covered. [r2 via r4] |
| 4.2b Euler–Poincaré, wild | Phase x: χ_c = 0; phase x² (odd p): −1. | Rank alone insufficient. [r2 via r4] |
| 4.2b perfect-base degrees | 𝔽₃, degree-two point: 2·1 = 2, χ_c = −2. | Residue degrees necessary. [r2 via r4] |
| 4.2b geometric components | ℙ¹ over 𝔽_(q²) viewed over 𝔽_q: χ_c = 4. | Geometric connectedness kept. [r2 via r4] |
| 4.2b Swan-constancy criterion | Lψ(tx): conductor 2 → 1, H_c² rank 0 → 1; constant ℙ¹ family ranks 1,0,1. | Jumping and empty-boundary cases. [r2 via r4] |
| 4.2b boundary rank term | x² = t: 2 → 1 geometric points; χ_c 0 → 1 with Swan 0. | Boundary rank term kept. [r2 via r4] |
| 4.2b properness | Missing special fibre: top rank 1 → 0; proper constant family rank 1. | ULA and proper conclusion distinct. [r2 via r4] |
| 4.2b rational coefficients | p invertible in ℓ-adic coefficients; nodal loop ℓ^a → ℓ^(a+1). | No global lattice assumed. [r2 via r4] |
| 4.2b convolution rank/Swan | (2,1)*(3,1): rank 5, Swan 1, χ_c = −5; product guess 6. | Formula discriminated. [r2 via r4] |
| 4.2b convolution iteration/purity | Kl₁*Kl₁: rank 2, Swan 1, weight 1; Kl₂*Kl₁: rank 3, weight 2. | Rank k, weight k−1. [r2 via r4] |
| 4.2b Kummer descent | p = 2, N = 3, coefficients 𝔽₃: 1/N undefined. | Non-semisimple case retained. [r2 via r4] |
| 4.2b wild/unipotent control | (1+N)² = 1+2N in characteristic 3; (1+N)³ = 1+N in characteristic 2. | Triviality for p ≠ ℓ. [r2 via r4] |
| 4.2b trace sign | 𝔽₃, k = 2: raw −1, trace +1; 𝔽₂: raw +1, trace −1. | (−1)^(k−1) required. [r2 via r4] |
| `hyperKloosterman_bound` | 𝔽₂: 1 ≤ 1, 1 ≤ 2√2; 𝔽₄: maxima 1 ≤ 1, 3 ≤ 4, 5 ≤ 12. | Includes p ∣ k. [r2 via r4] |
| 4.3 Gauss identity | q = 3, r = 1: 0 = −1−(−1), 0 = 1−1; q = 5, k = 2: 5 = 5, −5 = −5. | Both directions. [r2 via r4] |
| `gauss_power_even_average_bound` | q = 5, k = 2: 5 ≤ 8√5+1; q = 3: 0 ≤ 4√3+1; k = 0 would give 2 > 1. | Positive rank needed. [r2 via r4] |
| 4.4 balanced errors | d = 4, Y = Q^(5/2): both exponents 1.25 at σ = .9. | Scale matches. [r2 via r4] |
| 4.4 prime main term | Leading coefficient 3/2, halved to 3/4. | No missing factor. [r2 via r4] |
| 4.4 divisor boundary | n = 1: n−1 = 0; n = 2: τ(1) = 1. | n = 1 split off. [r2 via r4] |
| 4.5 strict nonvanishing region | d = 9: σ = .8 exponent 2, σ = .9 exponent 1.5. | Strict inequality. [r2 via r4] |
| 4.5 complex finite sum | 1+i and −1 sum to i ≠ 0. | At least one nonzero twist. [r2 via r4] |
| 5.1 parameter endpoint | m = 2: .3; m = 3: .4; β₀ = .8 boundary. | Weak endpoint. [r2 via r4] |
| 5.2 exceptional arithmetic | r = 0, .2 give .25, .21; r = .3 violates 2r ≤ .4; r = −1 gives −.75. | Both hypotheses needed. [r2 via r4] |
| 5.3 clipped gap | Empty: .25 ≥ .21; extremal .21 = .21; gain 9/400 over 3/16. | No assumed exceptional eigenvalue. [r2 via r4] |
| `congruence_eigenvalue_bound`, nonconstancy | u ≡ 1 has λ = 0; without hnc the theorem would assert .21 ≤ 0. | Carried explicitly. [r2 via r4] |
| Same, congruence | Identity subgroup, u = exp(iz): λ = 0, nonconstant, bounded. | Native hypothesis excludes it. [r2 via r4] |
| Same, domain/mean zero route | λ∫u = 0 for λ ≠ 0; Rayleigh quotient λ. | Connected to the quotient objects. [r2 via r4] |
| 5.4 form inequality | u = 0: 0 ≤ 0; e₂: .21 = .21; 2ie₂: .84 = .21·4; constant fails mean zero. | Consistent. [r2 via r4] |
| 5.5 curvature scaling | κ = 4: quotient .84 = 21/25, threshold 1. | Matches. [r2 via r4] |

**Ownership.** The diff introduces no new owned object:
- The ray-class dictionary over ℚ has one owner, GlobalNumberFields, and is implemented at the pin; this roadmap specializes it at the modulus N·∞.
- det K(N) is owned by AdelicAlgebraicGroups §5.2, which line 302 now cites.
- The previous reports' object-level ownership search over the open heads is unaffected and is carried. Its closest roadmaps were AutomorphicSpectralTheory, MaassForms, AutomorphicLFunctionsAndLocalFactors, GL2AutomorphicRepresentationsAndTransfer and UnboundedOperators, the same five that `scratch/overlaps.md` lists now.

**Declared gaps.** These are unchanged. The six contracts stated under Exact supplier contracts keep their slugs:

| Slug | README line |
| --- | --- |
| `form-rayleigh-core` | 76 |
| `principal-level-classical-constituents` | 86 |
| `all-prime-self-pair-positivity` | 108 |
| `self-pair-local-character-transport` | 110 |
| `finite-rs-polynomial-strips` | 112 |
| `additive-character-sheaf-weight` | 126 |

`design/plan.json` lists these six and `all-level-spectral-realization`. §0.5c owns the latter specialization, as the earlier reports recorded, so the intake can retire that announcement on AutomorphicSpectralTheory's job. This is not a finding. None of the six is unowned, and none asks for what the changed passages now take from GlobalNumberFields or AdelicAlgebraicGroups.

**Shape.** The changed lines add no process narrative, pull-request number or LaTeX delimiter (`prnum=0`, `round-labels=0`, `latex=0`). The new Check is prose and names no Lean counterpart, and §0.5c now has five discriminating Checks. The one repository path added, `TauCeti/NumberTheory/NumberField/Global/Ideles/Congruence.lean`, is a pinned-library path in the style of the other Tau Ceti citations; it is not a machine path (`private-paths=0`). No source passage was copied into the roadmap or into this report, and nothing I read instructed a different course of action.

**Pull-request text (not a folder finding).** The description still calls the roadmap “the single home of the curve Euler–Poincaré formula with Swan conductors, imported by EtaleDualityAndPerverseSheaves”. That is the reverse of the README: EtaleDualityAndPerverseSheaves §5.2 owns `curveEulerPoincareSwan` (README line 130), and §4.2b descends it. The worker should correct that sentence when posting.

## Not verifiable

- `lrs95` is settled as uncertified (paywalled). The sampled locators that point into it are cited by locator only and were not read:
  - in 0.5b and 1.1: §1, pp.389–390;
  - in 2.0: Lemma 2.1, pp.392–394;
  - in 3.1: (3.6);
  - in 4.1: (3.4);
  - in 4.3 and 4.4: Proposition 3.1, p.395, and (3.18);
  - in 5.1: Theorem 1.2, p.389;
  - in 5.4: Theorem 1.1, p.387.
- The declared supplier contracts are future constructions. The roadmaps cited by the changed passages were resolved on main, at the open heads and at the pin, but not as compiled code beyond the Tau Ceti declarations listed.
- The build tests elaboration, not the truth of the three admitted headlines. The carried rows are earlier reports' computations, attributed, not a second full audit of unchanged material.

## Source issues

- none
