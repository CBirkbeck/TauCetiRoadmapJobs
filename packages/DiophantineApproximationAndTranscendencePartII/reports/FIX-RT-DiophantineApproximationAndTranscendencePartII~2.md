# FIX-RT-DiophantineApproximationAndTranscendencePartII~2

Two red-team passes were merged: pass a (F01, F02) and pass b (F01). The findings do not overlap. They are reported below under their review ids, in that order: pass a F01 (P1), pass a F02 (P3), pass b F01 (P3).

## F01 (P1) — applied

Verified: on main, `TauCetiRoadmap/SuccessiveMinima/README.md` §0.1 "Gram determinants and the Hadamard inequality" states 0.1.1 `orthonormal_coordinate_hadamard` and 0.1.2 `hermitian_gram_hadamard`, and its `Suggested.lean` declares both. At its open head, GeometryOfNumbersAndQuadraticArithmetic now imports these results from SuccessiveMinima ("From TauCetiRoadmap.SuccessiveMinima: 0.1.1–0.1.3 supply the Gram–Hadamard bounds"). SuccessiveMinima is on main, so it is a legal supplier.

Change: in the supplier heading, the contract text, Scope, §3.6 (proof and *Needs:*) and the Layer 3 Dependencies, "GeometryOfNumbersAndQuadraticArithmetic §0.1/§0.1.1/§0.1.2" became "SuccessiveMinima §0.1, target 0.1.1 `orthonormal_coordinate_hadamard` / 0.1.2 `hermitian_gram_hadamard`". The Checks are kept: (2,0),(0,3) gives 6=6; (1,0),(1,1) gives 1<√2; the empty family gives 1=1. No GeometryOfNumbersAndQuadraticArithmetic citation remains.

## F02 (P3) — applied

Verified: §3.3's *Needs:* named the later §3.5. The C¹ identity it uses is the pinned `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin`, which is in `TauCeti/Analysis/Calculus/MetricVariation.lean` line 276, takes `ContDiffOn ℝ 1 f (Icc a b)` and needs a complete target (ℝ is complete). It is already listed in the Tau Ceti supplier contract.

Change: "§3.5 for the C¹ specialization" → "Tau Ceti `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` for the C¹ specialization". The C¹ sentence in §3.3's prose now names the same theorem, applied to the real angular pullback on [0,1] (the endpoints are null). This removes the forward edge.

## F01 (P3) — applied

Verified. Take f∈H with annihilator L of order n and leading coefficient a_n, and a nonzero p∈ℚ(x) regular at 0. Then y↦L(p⁻¹y) annihilates pf. Its coefficients lie in ℚ̄(x), its leading coefficient is a_n/p≠0, and its local solution bases are p·(bases of L). Those bases are meromorphic at every point of U, including the poles of p. The pullback (pf)∘χ=(p∘χ)(f∘χ) is integral. The source asks for no pole condition (CDT25 line 467–475).

Change: §4.1 API bullet "p has no poles in U" → "p∈ℚ(x) is regular at 0". In §4.2, "regular throughout U" → "regular at 0 … whether or not p has poles in U". The tensor-with-p proof sentences were rewritten with the L(p⁻¹y) construction. A Check was added: p=1/(1−x), U=ℂ, χ=t. Regularity on U is kept in §4.3 and in the rank theorems built on it.

## Adversarial pass on changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| §3.6 bound via SuccessiveMinima 0.1.1 | (1,−1); (1,1); d=1 | row norms √2,√2, det −2, 2≤2; det 0≤2; empty det 1≤1 | holds. Rows versus columns: det(Aᵀ)=det A |
| §3.3 C¹ variation via Tau Ceti theorem | cos(2πt); constant | ∫₀¹2π\|sin 2πt\|dt=4; 0=0 | holds |
| §4.2 multiplier, p regular at 0 | p=1/(1−x), f=1; p=0; p=2; p=1/2 | pullback Σtⁿ is integral, p·1 has basis {1/(1−x)} at 1; 0∈H; 2f∈H; (1/2)·1 is not integral (excluded because p∘χ=1/2∉ℤ[[t]]) | holds; the old Check x·1∈H, (1/2)·1∉H is unchanged |
| §4.2 multiplier at a pole of order m | p=(1−x)⁻ᵐ, L=D | y↦(p⁻¹y)′ has solutions ℂ·(1−x)⁻ᵐ, a basis with a pole of order m at 1 | holds |

## Checks

- `lake env lean packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean`: exit 0. The only messages are two "declaration uses `sorry`" warnings, at lines 50 and 70. `Suggested.lean` was not changed, so the six elaborated signatures in the worker's signature file still apply. I compared them with README §§0.1–0.2 and 2.1–2.2. No README target that a Lean statement mirrors changed, so I did not need a new `#check @name` file.
- Dependency check output: `depcheck: 56 roadmaps, 643 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Citation resolver: "Lean names found nowhere: None."

## Notes for the maintainer

- The new supplier, SuccessiveMinima, is on main. No later-roadmap edge was introduced, and nothing was moved down.
- No Lean name of this roadmap changed. `design/plan.json` was not edited: no new supplier gap was needed. Its frozen node text still mentions a local Hadamard argument; that does not affect the README.
- Ownership: the Hadamard bound is owned by SuccessiveMinima §0.1 on main. No other object changed owner.
- No source was fetched, and no text is missing.
