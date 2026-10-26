# FIX-RT-RankZeroOneBSDPartII~1: repair of red-team round 1 (passes a and b)

Two reviews were merged. They reuse finding identifiers, so the sections are grouped under "Review r1a" (pass a) and "Review r1b" (pass b). Overlaps: r1a F01 = r1b F02 (Part VII §5.32) and r1a F03 = r1b F03 (Part I section numbers); each is settled once and both sections point to the same edit. All ten findings were checked against the cited supplier text (ArithmeticStatisticsPartI, PartVI, PartVII at the indexed heads; GrossZagierAndArithmeticHeights at the given checkout and the index head; EffectiveClassNumbers and HeegnerPointEulerSystems at the given checkouts), the cached CGLS text and the pinned Mathlib. All ten hold; none is disputed.

# Review r1a

## F01 (P1) — applied

Old: Part VII §5.10 was named as the supplier of the ratio-one local twist at every ℓ≠3 ("The required instances of the latter local table are part of this local-ratio contract"). New: the supplier contract, §4.2 proof route and Needs, Layer 4 Dependencies and Scope name Part VII §5.32 "Attainable local three-isogeny ratios" for the twist/differential tables and ratio-one twists at ℓ≠3 including 2. §5.10 keeps the ratio definition, Tamagawa formula, strata and bounds.

Evidence: ArithmeticStatisticsPartVII §5.10 "Tamagawa ratio under potentially good reduction" gives c=1 only when some twist is good; the existence of a ratio-one twist at every p≠3, including p=2, is the §5.32 target "Attainable local three-isogeny ratios".

## F02 (P2) — applied

Old (§4.3): "Use the existing relative-density tower theorem." New: B_i⊆Σ_i gives r_X(B_i|all)=r_X(B_i|Σ_i)·r_X(Σ_i|all) at every cutoff. Both factors lie in [0,1] and the second tends to μ(Σ_i), so Mathlib `le_liminf_mul` gives the absolute lower bounds without assuming any limit for B_i. Part I §0.1 is cited only for the ratios. `le_liminf_mul` was added to "From Mathlib". A Check with oscillating ratios (1/16, 5/24) was added.

Evidence: ArithmeticStatisticsPartI "Relative density is multiplicative in towers" assumes HasDensity for both S⊆T and T⊆U. Part I has no lower-density tower target. `le_liminf_mul` is at `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133`, in the root namespace, for real u,v.

## F03 (P3) — applied

Old: all four Part I targets were placed in §0.5. New: §0.2 "Family defined by local conditions", §0.5 "Quadratic twist squareclass family", §0.6 "Squarefree integers in residue classes", §0.15 "Positive squareclass denominator". This is repaired in Scope, the Part I contract, §4.1 Needs, §4.2 Needs, Layer 4 Dependencies, §5.2 Needs and Layer 5 Dependencies.

## F04 (P3) — applied

Old (§0.1 locator): "Theorem E and standing hypotheses, pp. 517–521". New: "standing hypotheses, pp. 518–521, and Theorem E, p. 522; … CGLS line 79, line 219 and line 2145". Pattern: the §5.3 locator "standing good-reduction hypothesis, pp. 517–519" became "p. 518; CGLS line 79 and line 2198". CGLS line 201 carries printed page 522, and Theorem E is at line 219.

# Review r1b

## F01 (P1) — applied differently

Old (Scope): "This is the Eisenstein-converse continuation of RankZeroOneBSD: the base direction stops at …". New: the starting point is credited to named, readable owners: ArithmeticStatisticsPartVI "Heegner logarithm and low rank" and "Elliptic p-parity", and HeegnerPointEulerSystems §§8b.2 and 8b.10. The reviewer's sentence about what exists "on main or in an open pull request" describes repository state, which the README must not, so it was left out. The README no longer names RankZeroOneBSD.

Evidence: `roadmaps grep 'RankZeroOneBSD\b'` finds no folder on main or in any open roadmap pull request. There is no board package and no merge-order line for it. The title and folder name "Part II" are left as they are, because renaming the folder is an intake decision (see maintainer notes).

## F02 (P2) — applied

Same defect and edit as r1a F01: the Part VII contract, §4.2 proof route and Needs, Layer 4 Dependencies and Scope now cite §5.32 "Attainable local three-isogeny ratios".

## F03 (P3) — applied

Same defect and edit as r1a F03. §4.4 Needs keeps §0.5 for the squareclass family. The reviewer's §4.3 replacement "§0.15 positive squareclass denominator" was not used: §4.3 now needs only §0.1 relative density (r1a F02), and §0.15 is cited where the denominator is used (§4.2).

## F04 (P3) — applied differently

Old: "GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.17–8.19 … No squarefree-conductor restriction". New, in Scope, the GZ contract, §2.3 Needs and Layer 2 Dependencies: "§§0.1, 8.14, 8.18, 8.19". The contract says §8.17 assumes squarefree N and is not used. §8.18 supplies the non-torsion criterion, which the reviewer's version (§§0.1, 8.14, 8.19) dropped. §8.19's classical case is EffectiveClassNumbers §2.8 "Gross–Zagier with exact constants".

Evidence: GZ §8.17 assumes "(sqf) N squarefree". §8.18 (F=ℚ, A=E, B=M₂(ℚ)) needs only (N,D)=1 and an admissible level. §8.19 gives the elliptic formula and imports its case c=1, odd D, (N,D)=1 from EffectiveClassNumbers §2.8. That target is stated for every level N with all primes of N split. EffectiveClassNumbers (merge order 202) precedes this roadmap (283).

## F05 (P3) — applied

Old: `Suggested.lean` declared `scopeObstructionCurve` and `no_good_three_twist` and imported `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic`. New: no declarations, only `import Mathlib`. The docstring lists the unstatable headlines and calls the §5.2 density and §5.3 obstruction scope diagnostics kept in the README. README §5.3 keeps the statement with no Lean names, as a negative control for the good-at-three-twist hypothesis.

Evidence: the theorem is a negative control on one explicit curve (v₃(j)=−3 for every twist). The acceptance-file rules exclude boundary cases and controls.

## F06 (P3) — applied

Old (§4.1 Check): "with rational isogeny kernel". New: "whose isogeny kernel is generated by a rational point of order 3 (φ|G₃=1)", with class 2 giving η and a note that every rational isogeny has a Galois-stable kernel. Pattern: the Conventions Check "including a rational p-torsion kernel" became "including a kernel generated by a rational point of order p (φ=1)".

# Checks and notes

## Checks run

- Elaboration: `lake env lean packages/RankZeroOneBSDPartII/Suggested.lean`, run from the content checkout, exited 0 with no messages. No `TauCeti.*` import remains, so no module had to be built.
- Signature check: `Suggested.lean` now has no declarations, so there was nothing to compare per declaration. A scratch file with `#check @le_liminf_mul`, `#check @WeierstrassCurve.minimal` and `#check @WeierstrassCurve.HasGoodReduction` elaborated at the pins. Its output matches what the README says: real u,v; eventual nonnegativity; u bounded above; v cobounded for ≥; and the DVR and fraction-field binders on `minimal` and `HasGoodReduction`.
- Dependency check, exact output:

```text
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README lists only "RankOneConverse §§PC.0", which is a board package earlier in the merge order (line 252). That is the same lead as before this round and not a defect.
- Ownership: no new construction was introduced. The lower-limit product step applies a Mathlib lemma inside a proof route. Part I (by object) has no lower-density tower target. Open-PR ownership was checked through the `roadmaps grep` index and the given checkouts only.
- Sources: no new source was cited, and `sources.toml` and `needs-references.toml` are unchanged. `design/plan.json` gaps are unchanged; no new supplier gap was needed.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed (both sides) | Result / change |
| --- | --- | --- | --- |
| §4.3 absolute bound via r_X(B ∣ all)=r_X(B ∣ Σ)·r_X(Σ ∣ all) and `le_liminf_mul` | (i) r(B ∣ Σ₀) alternating 1/2,1 with μ(Σ₀)=1/8; (ii) r(B ∣ Σ₁)→5/6, μ(Σ₁)=1/4; (iii) cutoffs with N(Σ;X)=0; (iv) Σ₀ empty | (i) liminf 1/2 · 1/8 = 1/16 ≤ liminf of product 1/16; the tower theorem needs a limit that does not exist. (ii) 5/24. (iii) 0 = 0·0. (iv) no conditional assertion, matching the stated hypothesis. Using limsup instead would claim 1/8, an overclaim | Holds; added as a Check |
| `le_liminf_mul` hypotheses on cutoff ratios | atTop on ℝ; u,v ∈ [0,1] | NeBot: yes; u ≥ 0 and u ≤ 1 (bounded above); v ≥ 0 and v ≤ 1, hence cobounded for ≥ | Applies |
| Part VII §5.10 Tamagawa formula at 3: c₃ = abs(φ′(0))₃⁻¹ | admissible twist of nineteen-a3 (d≡2 mod 3) and its dual | Kernel character η is unramified, so the kernel is étale and c₃(φ)=1. The dual kernel has ωη, is connected, and c₃(φ̂)=3. The product 3 = 3^1 agrees with §5.32's α_φ·α_φ̂ = 3^d at d=1 | Consistent |
| §5.32 ratio-one twist at ℓ≠3 | nineteen-a3 at ℓ=2 (good) versus a split-multiplicative ℓ | ℓ=2: untwisted ratio 1. Potentially-good curves have ratio 1 by §5.10. A potentially multiplicative curve needs the §5.32 table | §5.32 is the owner |
| Real-place ratios with finite ratio 1 or 3 | signs ± | Products (1,1/3) give exponents (0,−1); (3,1) give (1,0) | Unchanged; T₀ and T₁∪T₋₁ are both reached |
| Part I §0.6 residue mass at q=3 | positive n≡1 and n≡2 mod 3; signed d≡2 mod 3 | (6/π²)(1/3)(9/8) = (6/π²)(3/8), so each class has 3/8. Signed d≡2 combines positive n≡2 with negative d=−n, n≡1, giving 3/8. Coprime-to-3 total 3/4, multiples of 3 have 1/4, sum 1 | Agrees with the Conventions Check and §5.2 |
| GZ §§8.18–8.19 versus §8.17 at non-squarefree level | E = 20a1 (N=20=2²·5, rational 3-torsion), p=3, K=ℚ(√−71) | −71≡1 mod 8 (2 splits); −71≡4 mod 5, a square (5 splits); −71≡1 mod 3 (3 splits); D odd, < −4; (N,D)=1. §8.17's (sqf) fails for N=20; §8.18 and §8.19 (via EffectiveClassNumbers §2.8) apply | §8.17 dropped; scope with non-squarefree N kept |
| CGLS locators | page markers | Page 2 = printed 518 (line 79, standing hypotheses); page 5 = 521 (line 179, (Sel)); page 6 = 522 (lines 201, 219, Theorem E) | Corrected to pp. 518–521 and p. 522 |
| §4.1 Check, φ restricted to G₃ for classes (1,2,3,6) | φ=1; φ=η; φ=ω | φ=1: (0,1,0,0). φ=η: (1,0,0,0). φ=ω: class 2 gives ωη, admitted, so (0,1,0,0). Ramified classes 3 and 6 give bad reduction | Reworded Check agrees with the Check for nontrivial unramified φ |
| Conventions Check (φ=1 rejected) | kernel generated by a rational point of order 3 | φ=1, which is one of the excluded characters | Holds |
| §5.3 local obstruction (README only) | d=1, d=3, d=0 | Δ(twist) = (4d)⁶(−2160), c₄(twist) = (4d)²(−71), so j = 357911/2160 and v₃(j) = −3. Raw v₃(Δ) is 3 at d=1 and 9 at d=3. d=0 gives Δ=0, excluded by d≠0 | Unchanged mathematics; no Lean declaration |
| Scope: forward-direction owners | r=0,1 | Part VI "Heegner logarithm and low rank" (Part VI line 2278) and "Elliptic p-parity" (line 2332); HeegnerPointEulerSystems §8b.2 (line 2056) and §8b.10 (line 2142) exist at the given head; root signs (+1,−1) for r=0 and (−1,+1) for r=1 | Citations resolve |
| `Suggested.lean` | elaboration | Exit 0; no declarations; no imports beyond Mathlib | Passes |

## Notes for the maintainer

- Two names were deleted: `TauCetiRoadmap.RankZeroOneBSDPartII.scopeObstructionCurve` and `TauCetiRoadmap.RankZeroOneBSDPartII.no_good_three_twist`. `roadmaps grep` finds no citation of either on main or in any open roadmap pull request, and none in the board packages.
- No roadmap named RankZeroOneBSD exists, but the folder and title still say "Part II". The fields of `design/README.md` and `design/plan.json` that this job may not edit also still mention it ("BSD.7a" prerequisites, "Part II of RankZeroOneBSD"). Renaming the folder, or rewriting those design fields, is an intake decision. The sibling designs CMRankZeroConverse and RankOneConverse use the same "Part II" framing.
- A new cross-roadmap mention was added: EffectiveClassNumbers §2.8 "Gross–Zagier with exact constants", in the GrossZagierAndArithmeticHeights contract. It is earlier in the merge order, and depcheck reports no problem.
- ArithmeticStatisticsPartI could state a lower-density tower lemma, d̲(S|U) ≥ d̲(S|T)·d(T|U), for reuse. This roadmap does not depend on it, because it applies Mathlib's `le_liminf_mul` directly.
- No suspicious instructions were found in the reviews or the fetched texts.
