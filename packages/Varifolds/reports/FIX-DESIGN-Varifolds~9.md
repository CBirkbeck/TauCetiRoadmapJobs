# FIX-DESIGN-Varifolds~9: repair of the Varifolds design

The review REV-DESIGN-Varifolds~8 has two findings: F01 (P2) and F02 (P3). Both are right.

- F02 is applied as the review asks.
- F01 is applied differently. The review's suggested 7.5 says that Z is the whole set where the
  ratio bounds fail and that p(Z) is small. That combination is false; a counterexample is given
  below. The repaired 7.5 takes Z to be the part of that set with positive upper density, and proves
  the measure bound on A from the mass bound on Z.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`
- `packages/Varifolds/sources.toml`: the `Simon1983` locator now names Chapter 1 §§3–4, because §3
  (3.3, 3.5) is now cited. No source was fetched; no key was added.

The review's "For the human reviewers" section (two licence questions) lists no finding, so nothing
was changed for it. The review contains no instruction-like text.

## F01 (P2) — applied differently

**What changed.** 7.5, old: set A, Lᵏ(A) < δ, bound for x ∉ A. New: Borel Z = R ∩ {Θ^{*k} > 0}, ‖V‖(Z) < δ, bound off Z for every x, and p(Z) ∩ B_1(0) ⊆ A with Lᵏ(A) < δ. 7.6's route: ψ' + ψ'' argument. Added: a 2.2 bullet and Check, two 7.5 Checks; plan.json updated.

**Verified that the finding is right.** Take the review's witness: ψ_i = 1 + i·1_{E_i}, with
i·1_{E_i} → ½ weakly and Lᵏ(E_i) ≈ ω_k/(2i) → 0.

- ψ_i ≤ 3/2 off E_i.
- ψ_i Lᵏ → (3/2)Lᵏ.
- min(ψ_i, 2) = 1 + 1_{E_i} → 1 in L¹, not 3/2.

So the old conclusion of 7.5 and the weak convergence together do not give 7.6. What is missing is
a bound on the mass over the exceptional set.

At Simon1983 line 8047–8052 the proof restricts to x ∉ p(A_1 ∪ A_2) and proves the slab estimates
(7), (8) for y ∈ B_1(0) ∖ (A_1 ∪ A_2). At line 8087–8088 it applies (9) to fibre points over 0, and
at line 8119–8120 it selects the next centres z_1, …, z_Q (Q ≤ N − 1). The displays there are lost
in the extraction. I checked independently that the clustering induction can always take each
stage's centres among the given fibre points. Slabs of width τ < d/2 around points at vertical
separation ≥ d are disjoint, so each cluster's slabs fit inside one larger slab around any one of
its members. Hence the bound holds for the fibre points outside the failure set R, over every x.

The Besicovitch bound on ‖V‖(R) needs no lower density:

- For y ∈ A_1 the bad radius gives ‖V‖(B_ρ(y)) < ε⁻¹‖δV‖(B_ρ(y)).
- For y ∈ A_2 ∖ A_1, monotonicity at y gives ‖V‖(B_ρ(y)) ≤ cρ^k < cε⁻¹ times the tilt integral.

Summing over the Besicovitch subfamilies gives ‖V‖(R) ≤ cε⁻¹·ε² = cε.

**Why the suggested text was changed.** The review's text says "Z ⊆ spt‖V‖ ∩ B_2(0) … whose
projection p(Z) ∩ B_1(0) lies in A of measure < δ" and "the set Z = A_1 ∪ A_2". The second claim
fails on the following example.

- Setting: k = 2, N = 3, h = e, and V the sum of disjoint horizontal discs D_j of radii r_j < ε,
  with centres dense in B_3(0) and Σ 2πr_j < ε².
- Hypotheses: the tilt is 0, ‖δV‖(B_3(0)) < ε², and spt‖V‖ ⊇ B_3(0).
- Every y ∈ B_2(0) fails the ratio bound. The radii at which ∂B_ρ(y) meets some disc have total
  length < ε²/π, so some ρ ∈ (½, 1) has a sphere that meets no disc. That ball contains whole discs
  only, so ‖δV‖(B_ρ(y))/‖V‖(B_ρ(y)) ≥ 2/sup r_j > ε.
- Hence A_1 ⊇ B_2(0) and p(A_1 ∪ A_2) ⊇ B_1(0) ∩ ℝ², of measure π.

The lemma itself survives once Z is restricted to the points of positive upper density:

- Points of R with Θ^* = 0 have density 0 and add nothing to a fibre sum.
- Z ∖ Γ' is Hᵏ-null, by Simon1983 line 774–788 (3.5: the upper density of ‖V‖ vanishes Hᵏ-a.e.
  off the carrier) and 2.1.
- θ ≥ 1 on Γ' and p is 1-Lipschitz, so Lᵏ(p(Z)) ≤ Hᵏ_e(Z ∩ Γ') ≤ (1 + Cε²)‖V‖(Z) < δ/2.

That vanishing fact is new here, as a 2.2 bullet with its locator and a Check. On the disc example
it gives Lᵏ(p(Z)) ≤ Σπr_j² < ε².

**7.6.** The route is the review's, with these details made explicit:

- an orthonormal frame with g_x = e and T_x = ℝ^k × {0};
- Λ = θ(x)ω_k3^k + 1;
- an integer-valued representative θ_i, with ψ'_i ≤ a only Lᵏ-a.e. (null sets project to null
  sets);
- lim sup_i sup_{|ξ|≤1} ‖Ṽ_i‖(B_2(ξ)) ≤ θ(x)ω_k2^k;
- ∫ψ''_i ≤ (1 + o(1))‖Ṽ_i‖(Z_i).

**Same pattern elsewhere.** A small-measure bound used for an L¹ conclusion: grep for "L¹",
"measure less than" and "small measure" finds only 7.5 and 7.6. 8.2's route uses 7.6 and needs no
change.

## F02 (P3) — applied

**What changed.** In 9.3, old: v(Γ_T, |θ_T|), four times. New: v(Γ_T⁺, |θ_T|), with Γ_T⁺ = {θ_T ≠ 0} (θ_T may vanish) and weight ‖T‖ = |θ_T|Hᵏ⌞Γ_T. The cancellation Check computes Γ_T⁺ = ∅. plan.json 9.3 statement and test updated.

**Verified.** GeometricCurrents G2 (main, README line 242–248) takes a "locally integrable integer
multiplicity" with simultaneous orientation/multiplicity reversal and mass equal to absolute
multiplicity times Hᵏ. So θ_T may be 0 or negative. 2.2 requires θ : Γ → (0, ∞).

- [[P]] + (−[[P]]) on carrier P has θ_T = 0, so Γ_T⁺ = ∅ and v(∅, ·) = 0.
- An oriented plane with multiplicity ±2 has Γ_T⁺ = P and gives v(P, 2).

**Same pattern elsewhere.** grep for every v(·, θ) with a non-constant θ: 3.1 uses
θ_f = Σ θ > 0 on f(Γ⁺); 6.4 already writes v({θ > 0}, θ); 6.3's step and e^{−1/|t|}
multiplicities are positive (off one null point). None needs a change.

## Checks run

Dependency check (after all edits):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

There is no UPWARD and no CYCLE line.

`roadmaps resolve packages/Varifolds/design/README.md` finds no cross-roadmap citation and no Lean
name that is missing. The tool did not check Mathlib names on this host, so I checked the two new
ones at the pin myself:

- `Vitali.exists_disjoint_subfamily_covering_enlargement`
  (`Mathlib/MeasureTheory/Covering/Vitali.lean:62`, any type, `δ a ≤ τ * δ b`);
- `LipschitzWith.hausdorffMeasure_image_le` (`Mathlib/MeasureTheory/Measure/Hausdorff.lean:745`;
  `euclideanHausdorffMeasure` is a constant multiple of `μH[d]`, `…/Volume/Measure.lean:68`).

Both are added to the Mathlib supplier contract.

There is no `Suggested.lean` at the design stage, so the `#check` comparison and elaboration do not
apply.

plan.json still parses. It has 34 targets. Every changed target has at least 3 tests, and `gaps` is
empty.

Ownership: `roadmaps grep -i 'upper density|density theorem'` over main and the open heads finds no
owner of the vanishing of the upper density of a weighted rectifiable measure off its carrier.
GeometricMeasureTheory G2's "density theorem" concerns density on the rectifiable set. So this
roadmap keeps the fact, as an API bullet of 2.2.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 7.5, mass of Z | plane m·v(ℝ^k×{0}, 1) | δV = 0 and tilt 0, so R = ∅, Z = A = ∅; fibre sum m ≤ (1 + δ)m + δ | sound |
| 7.5, mass of Z | dense discs | ‖V‖(R) = ‖V‖(B_2) ≤ Σπr_j² < (ε/2)ε², consistent with ‖V‖(R) ≤ cε | sound |
| 7.5, A from Z | dense discs | p(R) has measure π > δ (so Z = R fails); p(Z) has measure ≤ Σπr_j² < ε² < δ | the suggested Z refuted; repaired Z sound |
| 7.5, bound off Z for every x | dense discs; two sheets ℝ^k × {±ε/2} | discs: all slab fibre points over B_1 lie in B_{√(1+ε²)} ⊆ B_2, so they are in R, and those off Z have Θ = 0: sum 0 ≤ δ. Sheets: R = ∅, sum 2 ≤ (1 + δ)·2(1 − ε²/16)^{k/2} + δ for small ε | sound |
| 7.5, spikes | ψ_i = 1 + i·1_{E_i}, θ = 3/2 | ψ' ≤ 3/2 + 7δ/2 < 2 for δ < 1/7, so at most 1 off Z; ∫ψ'' ≥ i·ω_k/(2i) = ω_k/2 > δ when δ < ω_k/2 (ω_1/2 = 1, ω_20/2 ≈ 0.013) | excluded; the δ bound added |
| 2.2, vanishing off the carrier | v((0,1)×{0}, 1) | endpoints: ‖V‖(B_ρ) = ρ, Θ = ρ/(2ρ) = ½ > 0 on an H¹-null set; a point at distance d > 0: ‖V‖(B_ρ) = 0 for ρ < d | sound (a.e. only, recorded as a Check) |
| 2.2, hypotheses of Simon 3.5 | ‖V‖⌞K Radon on (W, d_g) | Borel regular, ‖V‖(Γ ∩ K) < ∞, and ‖V‖ = ‖V‖⌞Γ near x ∈ int K | sound |
| 7.6, final estimate | ψ' ≡ 2, θ = 2 | a = 2 + 4δ; ∫\|ψ' − θ\| = 0 ≤ 2(2δ + 2δ)ω_k + δ; distance 0 | sound |
| 7.6, final estimate | ψ' ≤ a, ∫ψ' ≥ θω_k − δ | ∫(a − ψ') ≤ (δθ + 2δ)ω_k + δ, plus ∫(a − θ) = (δθ + 2δ)ω_k: total 2(δθ + 2δ)ω_k + δ; dist(θ, ℤ) ≤ (4 + 2θ)δ + δ/ω_k → 0 | sound |
| 7.6, hypotheses of 7.5 for Ṽ_i | Λ = θω_k3^k + 1 | lim sup ‖Ṽ_i‖(B̄_3) ≤ θω_k3^k < Λ; ‖h_i − e‖_{C²} → 0; first variation and tilt → 0 | sound |
| 9.3, Γ_T⁺ | [[P]] − [[P]]; ±2[[P]]; θ_T = 0 on half of P | Γ⁺ = ∅, v = 0 = ‖T‖; Γ⁺ = P, v(P, 2), ‖T‖ = 2Hᵏ⌞P; Γ⁺ is the other half, weight \|θ_T\|Hᵏ⌞Γ_T unchanged | sound |

## For the maintainer

- No name that another roadmap cites has changed. The ids 7.5, 7.6, 9.3 and 2.2 are kept.
- Source note (no action in this package): in Simon1983's proof of 42.9, the set A = p(A_1 ∪ A_2)
  can have full measure (the dense-disc example). Simon's lemma stays true once A is taken over the
  part of A_1 ∪ A_2 with positive upper density, as 7.5 now does. This adds to the review's "Source
  issues" on 42.8.
- The a priori bound on the number of fibre points in Simon's Remark 42.10 (line 8008–8010) is cited
  as before. This round did not change it.
