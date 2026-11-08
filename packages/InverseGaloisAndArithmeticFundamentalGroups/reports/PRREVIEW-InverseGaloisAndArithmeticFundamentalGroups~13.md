# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 9432671)

**Verdict:** accepted

This is an incremental re-review of the 6 README lines changed since 1b8b367 (README:989–995, the
*Layer IG.0 → Dependencies* paragraph). `Suggested.lean` is unchanged, and nothing outside the
folder changed. The previous report's only finding is repaired, and the repair introduces no new
problem. The gate passes with the build, the dependency check is clean, and `Suggested.lean`
elaborates with `sorry` as its only diagnostic. This round raises no finding.

## Previous findings

- R01 — repaired: README:991–995 now read "SchemeAndStackFoundations §§2.11 and 2.16 (Hilbert 90,
  the Kummer sequence, Tsen's theorem and the cohomology of `𝔾_m` on curves, for the finite-level
  `H¹`–Jacobian comparison) and SchemeAndStackFoundations §§5.6 and 5.9 (intersection products …,
  for the graph–diagonal formula)".

## Verified sound

**Gate, build, dependency check, elaboration.**
- I ran the gate from the brief with the moved order (`--order`) and `--build`. Every counter is 0,
  `build=0`, `OK`, exit 0. This agrees with the worker's gate at 9432671.
- The dependency check from the brief (moved order, `--movable`), output in full:
  `depcheck: 239 roadmaps, 2373 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
  - In the moved order, JacobianChallenge is at line 1, AbelianSchemesAndArithmeticModuli at 41,
    ArithmeticGaloisDuality at 58 and this roadmap at 59.
  - SchemeAndStackFoundations is on main (35884a8c).
  - The change adds no new supplier: §§2.11 and 2.16 are in Layer 2, which the Scope list
    (README:164, "Layers 0–4") and the contracts (README:426–427, "2 (sites, étale and pro-étale
    cohomology, Brauer groups of schemes)") already declare.
- `lake env lean …/Suggested.lean`: exit 0 and 18 diagnostics, all `declaration uses sorry`. They are
  at lines 78, 82, 89, 104, 112, 119, 127, 181, 236, 256, 263, 279, 304, 326, 345, 370, 377 and 387,
  the same as at 1b8b367.
- The rest is carried from the previous report, because `git diff --stat 1b8b367 HEAD` shows only
  `README.md`:
  - the `#check @name` binder audit (36 declarations; `signatures.md` reports 0 lost binders);
  - the padding probe (no padding);
  - the headline list: the seven statable end theorems are stated, and the not-statable headlines
    are named in the module docstring.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**The changed gloss, resolved against SchemeAndStackFoundations on main (35884a8c).**
- §2.11 is at README:3656, *Hilbert 90, the Kummer and Artin–Schreier sequences, finite
  pushforward*. It proves `hilbert90`, giving `H¹(X_ét, 𝔾_m) ≅ Pic(X)`, and `fppf_kummer_sequence`,
  which is étale-exact for `n` invertible.
- §2.16 is at README:3896, *Tsen's theorem, `𝔾_m` on curves and proper hypercoverings*. It proves
  `tsen_theorem` and `curve_Gm_cohomology` (`H¹ = Pic`, `H^{≥2} = 0`, the degree sequence). It also
  says that `μ_n` on curves follows from this together with the Kummer sequence of §2.11.
- So all four items of the new parenthetical ("Hilbert 90, the Kummer sequence, Tsen's theorem and
  the cohomology of `𝔾_m` on curves") are in the two cited sections.
- §5.6 (README:6921, *Intersection products on smooth varieties*) and §5.9 (README:7129, *Surfaces:
  the relative intersection pairing …*) match their clause.
- The assignment matches the IG.0.T1 *Needs:* line (README:520: "SchemeAndStackFoundations
  §§2.11, 2.16, 5.6, 5.9"). It also matches SchemeAndStackFoundations' own consumer note
  (README:7388–7390), which says `VanishingCycles.curveEndomorphismTrace` consumes §§2.11, 2.16,
  5.6 and 5.9.
- House style: Unicode and code spans only; no LaTeX and no process words.
- The changed lines carry no backticked name of this roadmap's own. `citations.md` has no lead in
  README:985–999.

**Seeded sample.** One sampled target is cited by the changed passage: *Weil's curve trace and
graph–diagonal formula* (IG.0.T1, README:507–526). I checked its locator in the text, because the
board manifest does not record the Stacks Trace Formula chapter. I read that chapter through the
sources service, into a scratch copy of the manifest; the review edits no manifest.
- "Stacks §64.14" is right: Chapter 64 is *The Trace Formula* (tag 0F5P), and §64.14 is
  *Lefschetz numbers*.
- Theorem 64.14.4 (Weil, tag 03U1, chapter p. 13) states `V(φ) = Δ_C·Γ_φ = 1 − Tr_J(φ*) + deg φ`. Its
  hypotheses are a nonsingular projective curve over an algebraically closed field and `φ ≠ id`.
- The README's form is consistent with the theorem:
  - It works over any `k`, with `C` geometrically connected, by passing to `k̄`.
  - It treats `φ = id` separately through `Δ²`.
  - It uses `φ_*` where Stacks uses `φ*`. These have the same trace, because `φ_*` is the Rosati
    adjoint of `φ*`.
- Example 64.14.5 (tag 03U2, p. 14), multiplication by `n` on an elliptic curve, agrees with the
  README's Checks.

The other 14 sampled targets do not lie in the changed lines and do not cite them. Their locator
checks are carried from earlier rounds. The README flags no locator as unverified.

**Overlap leads.**
- "PolynomialGaloisGroups Layer 9 dropped by #763 and #986" is still a false positive:
  - `Completed/PolynomialGaloisGroups/README.md:1385` on main is still `### Layer 9: Sₙ as a Galois
    group over ℚ`.
  - Both heads add new folders, and each new README opens by saying it continues the completed
    roadmap.
- No open pull request changes this roadmap.
- The change adds no owned object, so ownership against the sibling checkouts is as in the previous
  report.

**Adversarial pass.** The new rows cover the changed gloss and the target it annotates, with
computed values:

| Statement (README line) | Instances and values | Result |
| --- | --- | --- |
| §§2.11 + 2.16 give the finite-level comparison `H¹(C_k̄, ℤ/ℓⁿ) ≅ Hom(J_C[ℓⁿ](k̄), ℤ/ℓⁿ)` (991–993, 512–514) | Kummer on proper connected `C/k̄` of genus `g`: `0 → k̄^×/ℓⁿ → H¹(μ_{ℓⁿ}) → Pic[ℓⁿ] → 0`, with `k̄^×/ℓⁿ = 0` (divisible) and `Pic[ℓⁿ] = J[ℓⁿ] ≅ (ℤ/ℓⁿ)^{2g}` (since `Pic/Pic⁰ = ℤ`). So both sides have order `ℓ^{2gn}`. `ℙ¹`: `0 = 0`. `E`, `ℓⁿ = 2`: `(ℤ/2)²` on both sides. Negative control: `ℓ = p = char k` on `𝔸¹`. There the Kummer sequence is not étale-exact (§2.11), and `H¹(𝔸¹, ℤ/p)` is infinite (Artin–Schreier), while `Pic = 0`. This is excluded by "`ℓ` invertible in `k`" (510) | Holds |
| §§5.6 + 5.9 give the graph–diagonal side (993–995) | Identity on genus 2: `Δ² = 2 − 2g = −2 = 1 − 4 + 1`. Constant `φ`: `Γ_φ = C × {c}` meets `Δ` once, `φ_* = 0` on `J`, `deg φ = 0`: `1 = 1 − 0 + 0`. These cases need intersection numbers, not cohomology. The wrong model (§§2.11/2.16 for the intersection side) computes no `Δ·Γ_φ`, so it is excluded | Holds |
| IG.0.T1 trace formula against Stacks Theorem 64.14.4 (509–511) | `[2]` on `E`: fixed points `E[1] = {O}`, so `1 = 1 − 4 + 4`. Frobenius on `y² = x³ + x` over `𝔽₃`: 4 points, so `4 = 1 − 0 + 3`. `φ_*` versus `φ*`: for Frobenius these are `π_E` and `V`, both with characteristic polynomial `X² − aX + q`, here trace 0 for both | Holds |

The rows for statements the diff leaves untouched are carried from the previous report (the review
at 1b8b367, *Adversarial pass*, and the rows it carried from 13ba9e1), unchanged:
- **Rows added at 1b8b367:** braid group (`B₂ ≅ ℤ`, `orderOf σ₀ = 0`); transgression (`Q₈` and
  `C₄`); `prodMulEquiv` (`ℤ²`); `cast_map_prod_mul` (`S¹`); the simply connected `isIso`
  (`SL₂ → PGL₂`); `of_openSubgroup` (`ẑ`, `F₂`); `ehresmannFibration` (`ℂ² ∖ {0} → ℂ`);
  DifferentialGeometry flows (`x²`); §5.1 zero-cycles (degrees 2 and 3).
- **Integral and pro-étale theory:**
  - lisse part (nodal monodromy `p`);
  - bounded lattices (`2m+1`);
  - pro-étale `π₁`;
  - Henselian base (`ℤ_(5)[i]`);
  - reduced denominators (`D(T⁻¹Y + T⁻¹) = T²`).
- **Specialization, thin sets and Hilbertian fields:**
  - simultaneous avoidance over `𝔽₂`;
  - thin-set count (`⌊√N⌋ + 1`);
  - `Sₙ` (`X³ − 3X + 1`);
  - `IsHilbertian` (`𝔽₂`, `𝔽₂(S)`);
  - `infinite_full_group` (`Y² − T`);
  - Weissauer and normal subgroups (`ℚ(μ_{2^∞}, ∛2)`, `Γ_ℝ`).
- **Rigidity and realizations:**
  - the rigid `S₃` cover (`disc = 27(4 − x²)`);
  - coprime semidirect products (`S₃`, `C₆`);
  - torus types (`Pic(PGL₂) = ℤ/2`);
  - coprime degrees (`n = 0`);
  - rigidity (`(2A, 2A, 3A)`);
  - lifting invariant;
  - Shafarevich (`C₄ → C₂`);
  - supersolvable (`A₄`, `C₈`);
  - disjoint realizations (`t = 3, 8, 6`).
- **Covers and characteristic `p`:**
  - mod-ℓ Hurwitz (`n = ℓ = 2`);
  - Harbater (quasi-`p`);
  - Abhyankar (`g = 0`, `D = ∅`);
  - the Artin–Schreier Check;
  - Euler characteristics (`y² − y = x`).
- **Arithmetic:**
  - Frobenius on `C₃`;
  - `ℚ(√−35)`;
  - Serre's growth formula;
  - the hyperelliptic coordinate group;
  - the cyclotomic twist (`C₅`, `S₃`).

**Remarks on untouched text (no change requested).**
- The IG.0.T1 secondary locator "SGA 4½, curve/Jacobian trace argument" (README:519) names no
  section or page.
- The source issues recorded in earlier reports still stand: kedlaya-liu Remark 1.4.4,
  wood-lifting Theorem 2.5, wood-moments Conjecture 5.1, lwzb Corollary 12.9, and the HOPS
  `d′ = md` misprint.

## Not verifiable

- SGA 4½ (the IG.0.T1 secondary citation) was not opened. It has no precise locator, and the
  claim is fully covered by Stacks Theorem 64.14.4, which I read.
- Carried from the previous report, cited by locator only:
  - Serre, *Topics in Galois Theory* (no legal open copy);
  - Fried–Jarden, *Field Arithmetic*;
  - Poonen §8.2;
  - Kollár IV.6.10;
  - Huppert and Ribes–Zalesskii (uncertified in the manifest).

## Source issues

- none
