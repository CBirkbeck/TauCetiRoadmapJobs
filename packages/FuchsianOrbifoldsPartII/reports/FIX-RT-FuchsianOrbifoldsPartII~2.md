# Repair report: FuchsianOrbifoldsPartII, red-team round 2

Review a returns `accepted` and raises no package finding. Review b raises one finding, F01 (P3), so there is no overlap to merge. The section below uses review b's id.

## F01 (P3) — applied differently

Review b, F01.

What changed: in `packages/FuchsianOrbifoldsPartII/README.md`, §4.1 "μ_mod(∅)=0 …" became the point-null, mass-π/3 clause with a π/6 control. §4.2 "ν_A(∅)=0 …" became ν_A(M)=πℓ_A≥π>π/3 for every class, with the D=12 masses π and 2π. §2.3 "V(0)=0" became the V(−2) sign test. The §2.3 prose and cosh bullet now hold on all of ℝ.

Verified: the finding is correct. μ(∅)=0 holds for every Mathlib measure (`MeasureTheory.measure_empty`), so the two ∅ clauses tell no candidate measure apart. The §2.3 Check "V(0)=0" repeated the API bullet word for word and holds for every odd function.

Why "applied differently":
- **§2.3.** The suggested text said the V(−2) test fixes "the restriction of the arcosh and logarithmic forms to x≥0". That is false for the logarithmic form. With t=x/2, `2 arsinh t = 2 log(t+√(t²+1)) = log((t+√(t²+1))²) = log(1+(x/2)(x+√(x²+4)))`, and this holds for every real x. At x=−2 the logarithmic form gives log(3−2√2)≈−1.762747=V(−2). Also, cosh V(x)=cosh(2 arsinh(x/2))=1+2sinh²(arsinh(x/2))=1+x²/2 for every real x. Only the arcosh form is even, so it equals |V| and needs x≥0. The README had narrowed both the logarithmic form and the cosh identity to x≥0, which is less than the source supports: DIT16 line 397 states the logarithmic form for x with no sign condition and calls it monotone increasing. The new Check states the true split. The §2.3 prose, the "Use x≥0" sentence, the proof-route sentence and the cosh API bullet were corrected to match.
- **§4.1.** The suggested sentence is kept, plus one clause that pins the normalization against a plausible wrong model. π/3 is −2π times the orbifold Euler characteristic 2−1−(1/2+2/3)=−1/6. A convention that divides again by the centre {±I} of SL₂(ℤ) (group Euler characteristic −1/12) gives π/6.
- **§4.2.** The suggested clause would have repeated the D=28 Check just above it. The new clause states the bound for every narrow class: ℓ_A≥1 because a primitive reduced minus period is nonempty, so ν_A(M)≥π, while every restriction of μ_mod to a subset of M has mass at most π/3. It adds the D=12 pair π, 2π, which a class-independent normalization cannot produce.

Pattern search: "∅" occurs in the README only at these two Checks. No other Check bullet asserts a law that every measure, or every odd function, satisfies. All 60 Check bullets were listed and read. The API bullet "V(0)=0" stays: it is an API fact, not a Check. `Suggested.lean` does not mention V, μ_mod or ν_A and does not change.

## Checks

- Elaboration: `lake env lean packages/FuchsianOrbifoldsPartII/Suggested.lean`, run from the content checkout, exits 0. Its only output is five `declaration uses 'sorry'` warnings, at lines 56, 65, 81, 88 and 97. No `TauCeti.*` module had to be built.
- `#check @name` for all eight declarations: `AdmissibleCycle`, `cycleGroup`, `cyclePolygon`, `cyclePolygon_fundamentalDomain`, `cycleGroup_presentation`, `cycleGroup_cuspStabilizer`, `cycleGroup_infiniteIndex` and `cycleGroup_conj_iff_isRotated`. They went in one scratch file, elaborated once. Each type matches its README statement and the job's signature file, and no binder was lost. The Lean file did not change, so nothing else changed either.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

- Gate failures: none were listed for this round.
- Ownership: no construction was added or moved, so no new ownership question arises. No supplier citation changed and no gap changed. `design/plan.json` is untouched.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.3 V(x)=log(1+(x/2)(√(x²+4)+x)) for every real x | x=−2, −1, 0, 2, 4 | V: −1.762747, −0.962424, 0, 1.762747, 2.887271. Log form: the same five values, to 1e−15 | holds on ℝ | prose widened from x≥0 |
| §2.3 cosh V(x)=1+x²/2 for every real x | x=−2, −1, 0, 2, 4 | cosh V: 3, 1.5, 1, 3, 9. 1+x²/2: 3, 1.5, 1, 3, 9 | holds on ℝ | API bullet widened from x≥0 |
| §2.3 V(x)=arcosh(1+x²/2) exactly when x≥0 | x=−2, −1, 0, 2 | arcosh: 1.762747, 0.962424, 0, 1.762747. V: −1.762747, −0.962424, 0, 1.762747. Equal at 0 and 2, unequal at −2 and −1 | iff holds in both directions | stated |
| §2.3 new Check, V(−2) against plausible wrong models | 2arsinh(x/2), totalized arcosh(1+x²/2), arsinh x | At x=−2: −1.762747, +1.762747, −1.443635. arsinh is also rejected by cosh V(2)=3 against √5 | totalized arcosh rejected | Check replaced |
| §4.1 μ_mod(M)=π/3 = −2πχ | modular orbifold (0;2,3;1) | χ=2−0−1−(1/2+2/3)=−1/6, so −2πχ=π/3. Dividing by the centre {±I} gives π/6 | π/6 model rejected | clause added |
| §4.1 μ_mod({π_mod(i)})=0 | preimage PSL₂(ℤ)·i | countable set of points, each of volume 0, so mass 0. An orbifold point mass 1/2 at i fails | atom model rejected | kept |
| §4.2 ν_A(M)=πℓ_A≥π>π/3 | D=5 (ℓ=1); D=12, I [4] and J [3,2]; D=28, I and J | π; π and 2π; 2π and 5π. Each is ≥π>π/3≥μ_mod(E) for every Borel E | image area rejected for every class | Check replaced |
| §4.2 D=12 masses depend on the class | I, J | ℓ_I=1 and ℓ_J=2 give π≠2π. Agrees with §4.4: π+2π=9·π/3, cusp widths 4+5=9 | class-independent normalization rejected | stated |

Recomputation against the rest of the roadmap:
- The §2.3 Checks cosh V(2)=3 and V(4)=2arsinh 2≈2.887271 are unchanged and agree with the widened statements.
- The §3.4 and Layer 3 examples use V only at positive digits, where all three forms agree.
- The §4.4 and §4.6 masses D=12 π, 2π and D=28 2π, 5π agree with the new §4.2 Check.

## Maintainer notes

- `design/plan.json` (lines 1214, 1216, 1252) and `design/README.md` (lines 487, 489, 501) still state the lift-spacing identities for x≥0 only. Those statements are true but narrower than the README now says. This round may not edit them.
- Review a points out an arithmetic slip in the round-1 report (`reports/FIX-RT-FuchsianOrbifoldsPartII~1.md` line 64). The square of the [4] word T⁴S=[[4,−1],[1,0]] is [[15,−4],[4,−1]], whose trace is ε²+ε⁻²=14 for ε=2+√3, not 194; 194 is ε⁴+ε⁻⁴. Review b's round-1 table repeats 194. Neither the README nor `Suggested.lean` contains the number, and the exclusion of [4,4] by primitivity stands.
- No Lean name changed. No cross-roadmap citation changed. No other roadmap is affected.
- No passage in either review asked for anything outside this job.
