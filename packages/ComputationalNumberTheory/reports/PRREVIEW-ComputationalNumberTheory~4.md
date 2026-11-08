# Review of ComputationalNumberTheory (pull request #1408 at ed098d6)

**Verdict:** accepted

This is an incremental re-review of the 70 lines changed since 99719e7. All of them are in `TauCetiRoadmap/ComputationalNumberTheory/README.md`, `Suggested.lean` is unchanged, and nothing outside the folder changed. This head repairs all four findings of the previous review (R01–R04), and none of the repairs introduces a new defect. The gate passes, and the dependency check reports no UPWARD or CYCLE line. The acceptance file elaborates with `sorry` as its only warning. This report has no findings.

## Previous findings

- R01 — repaired: `README.md:270–279` now cites “`TauCeti.finiteExtensionValuativeRel` and `TauCeti.finiteExtension_valuativeExtension` (`TauCeti.NumberTheory.LocalField.FiniteExtension.Basic`)”. A clause names the `algebraicExtension…` forms from `2fd255d9` on, and the §2.20 `*Needs:*` (line 1361) cites `TauCeti.finiteExtension_valuativeExtension`.
- R02 — repaired: `selmerGroupA` and `normM` are gone from the descent bullet (lines 310–320). The §3.4 sentence is gone. Line 129 now reads “§§3.1–3.3” without “good-odd-prime equality”, and so does line 1912. The dimension-zero clause now sits in §4.26 (lines 2527–2529) and §4.31 (line 2593).
- R03 — repaired: §3.19's `*Needs:*` (line 1790) now opens with “EffectiveDiophantineMethods §3.1 (the two quotient sizes for the pinned `W.μ`)”. It keeps HeightsRationalPointsAndObstructions §1.17 as “the owner contract behind §3.1”.
- R04 — repaired: the §3.18 API (lines 1762–1763) is now `localImageSpan` plus the comparison from an EffectiveDiophantineMethods §3.2 coordinate datum. Line 1765 imports `N_v`, `H_v ≤ range μ_v` and `#H_v = 2^rank` from EffectiveDiophantineMethods §§3.1–3.2 without restating them.

## Verified sound

**Coverage.** Read in full: `scratch/changes.md` (the diff: 37 insertions and 33 deletions in README.md), the previous report, `pull-request.md`, `gate.md`, `overlaps.md`, `citations.md` and `signatures.md`. In the README, every changed passage was read together with the passages it cites or that cite it:
- the Scope table (lines 122–135);
- the From Tau Ceti contracts (lines 251–327);
- the EffectiveDiophantineMethods contracts (lines 434–465) and the HeightsRationalPointsAndObstructions gap contract (lines 467–478);
- §2.20;
- §§3.18–3.20 and the Layer 3 Dependencies;
- §§4.26 and 4.31.

The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComputationalNumberTheory'` is empty.

**Gate, dependency check, elaboration (rerun on this head).**

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
lake env lean TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean : 31 × "declaration uses `sorry`", no other output
```

In the merge order, the suppliers named in the changed passages come before this roadmap: AlgebraicModularFormsAndSerreWeights (line 93), EllipticLegendreCharacterInterfaces (96), HeightsRationalPointsAndObstructions (138) and EffectiveDiophantineMethods (173), against ComputationalNumberTheory at line 193. The EffectiveDiophantineMethods README at its open head names ComputationalNumberTheory nowhere, so the edge has no cycle.

**Signatures.** I copied `scratch/signatures/SignatureCheck.lean` and corrected its 59 unqualified `#check` names to `TauCetiRoadmap.ComputationalNumberTheory.<name>`. The copy elaborates all 67 declarations with no error. The four §3.19–3.20 declarations next to the changed prose match the README:
- `localImageSpan W xs = Subgroup.closure (W.μX '' {x | x ∈ xs})` in `W.M`, with `[W.IsElliptic] [W.IsCharNeTwoNF] [DecidableEq K]`;
- `localImageSpan_eq_range_of_card_padic`, with `hcard : #H = (1 + #roots)·(if p = 2 then 2 else 1)`;
- `localImageSpan_eq_range_of_card_real`, with `2·#H = 1 + #roots`;
- `exists_complete_localImage_padic` and `exists_complete_localImage_real`, over `W.map (algebraMap ℚ K_v)`.

No binder was lost. `Suggested.lean` is unchanged, so the earlier padding probe and headline list stand. The headline list is in the README Summary, and every headline is statable at the pins and stated.

**Pinned names, checked at Tau Ceti `a91d3aaf` (the branch manifest and the README's declared pin).**
- `NumberTheory/LocalField/FiniteExtension/Basic.lean`:
  - `:167` `def finiteExtensionValuativeRel : ValuativeRel M` is `ValuativeRel.ofValuation` of the spectral-norm valuation.
  - `:184` `finiteExtension_valuativeExtension : ValuativeExtension K M`.
  - `:207` `finiteExtension_isNonarchimedeanLocalField`.

  The README's description (“the valuative relation of the spectral norm, extending that of `K`”) matches these.
- At `2fd255d9`, the revision the new clause names:
  - `AlgebraicExtension/Basic.lean:130` `algebraicExtensionValuativeRel` and `:147` `algebraicExtension_valuativeExtension`, under `[Algebra.IsAlgebraic K M]` (line 72);
  - `FiniteExtension/Basic.lean:54` still carries `finiteExtension_isNonarchimedeanLocalField`.

  The clause is therefore exact.
- The descent names that remain in the contract:
  - `MordellWeil/XSubT.lean`: `:276` `A`, `:505` `M`, `:566` `μX_of_eval_f_ne_zero`, `:794` `μ`, `:961` `ker_μ_eq`.
  - `MordellWeil/LocalCondition.lean`: `:156` `localRes`, `:234` `localCondition`, `:239` `mem_localCondition_iff`.
  - `MordellWeil/TwoTorsion.lean:57`: `card_ker_nsmul_two`, which states `Nat.card ker[2] = Nat.card {x // f(x) = 0} + 1`.

  Each name is in the module the bullet names. §3.18 consumes `μ`, `M` and `μX_of_eval_f_ne_zero`; §3.19 consumes `ker_μ_eq`, `card_ker_nsmul_two`, `localRes`, `localCondition` and `mem_localCondition_iff`. A grep for `selmerGroupA|normM` in the README returns nothing.
- Both imports of `Suggested.lean` also exist at `2fd255d9`, which is now the Tau Ceti pin of main's manifest.

**Cross-roadmap citations resolved.**
- EffectiveDiophantineMethods, at its open head:
  - §1.7 opens “For `n ≥ 1`, a positive-definite symmetric rational matrix `G` …”, which is the basis for the new §4.26 sentence.
  - §3.1 states `[E(ℚ_p):2E(ℚ_p)] = #E(ℚ_p)[2]·|2|_p^{-1}` and `2·[E(ℝ):2E(ℝ)] = #E(ℝ)[2]`, that `#E(K)[2] = 1 + #roots` in normal form, and that these are the orders of `μ_K(E(K))`. Its API is stated for the pinned `W.μ` over `ℚ_p` and over `ℝ`, which is the generality of this roadmap's §3.19.
  - §3.2 has `H_v = κ_v^{-1}(span c_i)`, `H_v ≤ μ_v(E(K_v))` for every datum, and `#H_v = 2^{rank}`.
  - §3.3 is size-check completeness.

  The new §§3.1–3.3 contract bullet and the §3.18 import sentence say exactly this.
- ClassicalArithmeticCompletion on main has §3.3 `IntMatrix.IsSmithDecomposition` (README line 5341) and §5.2 `ClassGroupPresentation.index_relationLattice` (line 11171). These are the two `citations.md` leads at README lines 405 and 410.
- The other `citations.md` leads:
  - The two Tau Ceti leads at lines 270–271 are false positives: they were searched at main's pin `2fd255d9`, and both names exist at the branch pin `a91d3aaf` (lines above).
  - `PrattTree.validList` is this roadmap's own name and elaborates.
  - R15.2 and R15.3 refer to AlgebraicModularFormsAndSerreWeights Layer 15, as in earlier rounds.
- Overlap leads: the PolynomialGaloisGroups Layer 5 citations (lines 612 and 670) do not break. #763 and #986 add a new `TauCetiRoadmap/PolynomialGaloisGroups` folder, and their `Completed/PolynomialGaloisGroups/README.md` is byte-identical to main's (`cmp` on both checkouts, “### Layer 5: Frobenius specialization” at line 1054). No open pull request changes this roadmap.

**Seeded sample.** None of the fifteen sampled targets is in a changed passage: 0.9a, 0.13, 1.1, 1.6, 1.19, 1.26, 2.9, 3.3, 3.4, 3.9, 3.12, 3.13, 4.3, 4.20a, 4.33. This roadmap's §§3.3–3.4 are the Miller basis and the Sturm bound, not EffectiveDiophantineMethods §§3.3–3.4. I spot-checked three that are cheap to compute:
- **3.9.** `35830422465487817813321292 mod 107 = 106 ≡ −1`.
- **3.12 and 3.13.** BCG line 457 (Remark 3.3, printed p.518) gives 59 with weight 16 as the smallest prime and 79 with weight 38 as the second. BCG line 462 gives the filtered primes 79, 151, 173, 193. CG13 lines 536, 541, 547, 551, 554, 556 and 560 (Appendix table, p.14) carry the N-entries [16], [38], [28], [40], [36], [60] and [24]. Every listed pair satisfies `k + k′ = p + 3`, and filtering by `gcd(k−1, p+1) = 1` keeps exactly {79, 151, 173, 193} (computed gcds: 15, 15, 1, 1, 27, 27, 3, 3, 35, 35, 1, 1, 1, 1, 1, 1).

**Adversarial pass.** There is a new row for every changed statement, with its computed values. Rows for statements the diff leaves untouched carry the previous report (“r3”), which in turn carries the full table of the review before it.

| Statement | Instances and values computed on each side | Result |
| --- | --- | --- |
| Contract §§3.1–3.3 (README 446–453): image orders of `W.μ` | `y² = x³ − x` over `ℚ₂`: roots 0, ±1, `#W[2] = 4`, `|2|₂^{-1} = 2`, so the order is 8. EffectiveDiophantineMethods §3.1 gives `2·4 = 8`. Over `ℚ₃`: 4 on both sides. Over `ℚ₅`, `y² = x³ + 1`: `x² − x + 1` has discriminant `−3 ≡ 2`, a non-square mod 5, so `r = 1` and the order is `2·1 = 2`. Over `ℝ`, `y² = x³ + 1`: `r = 1`, `#W[2] = 2`, order `2/2 = 1`, and §3.1 gives `2·#range = 2`. | Agrees with the supplier |
| Contract §3.2 clause: `2^rank` | At `ℝ` for `y² = x³ − x`, abscissae −1/2 and 2 give sign vectors `(+,−,−)` and `(+,+,+)`. The second is trivial, so the rank is 1 and the order is `2 = 2^1 = (1+3)/2`. | Agrees |
| §3.18 comparison bullet: `κ_v^{-1}(span κ_v(m_i)) = localImageSpan` | `κ_∞` = sign map `M_ℝ ≅ (ℤ/2)³`; `c₁ = (0,1,1)`, `c₂ = 0`; the span is `{0, (0,1,1)}`, whose preimage `{(+,+,+), (+,−,−)}` is the closure of `{μX(−1/2), μX(2)}`. Using the image under `κ_v` instead of the preimage gives the same subgroup, since `κ_v` is an isomorphism. A model that spans the abscissae `x_i` rather than their classes would give a subgroup of `K_v`, not of `M_v`, and does not type-check against `W_v.M`. | Correct |
| §3.18 `N_v` cited to EffectiveDiophantineMethods §3.1 | Non-example Check: `N₂ = (1+3)·2 = 8`. The single abscissa 1/4 gives `f(1/4) = −15/64`, valuation −6 (even), unit part `−15 ≡ 1 mod 8`, so `#H₂ ≤ 2 < 8`. Degenerate Check: `y² = x³ + 1` at `ℝ` gives `N = 1`, so the empty list is complete. | Checks still evaluate correctly |
| §3.19 `*Needs:*` EffectiveDiophantineMethods §3.1 (generality) | §3.1 is stated for `W` over `ℚ_p` or `ℝ` itself, as §3.19 requires. Check `y² = x³ − √2·x`: roots 0 and ±1.18921, so `N = 2`. `f(−1/2) = 0.58211 > 0` and `f(2) = 5.17157 > 0`, with signs `(+,−,−)` and `(+,+,+)`, so the order is 2, and the Lean `hcard` gives `2·2 = 1 + 3`. `p = 3`, `y² = x³ − x`: `hcard` gives `(1+3)·1 = 4`, which is §3.1's `1·#ker`. | Generality matches |
| §4.26 dimension zero (new sentence) | `n = 0`: `ℤ⁰ = {()}` and the quadratic value is the empty sum 0, so `E = {()}` iff `R ≥ 0`. The target condition `0 ≤ aD²R` has the same sign because `aD² > 0`. `R = 0` gives sizes 1 and 1; `R = −1` gives 0 and 0. The empty matrix is `Matrix.PosDef` vacuously, so `n = 0` lies within the hypotheses. EffectiveDiophantineMethods §1.7 is stated for `n ≥ 1`. | Correct and needed |
| Contract §§1.7–1.8 (`n ≥ 1`, dimension zero left to §§4.26 and 4.31) | §4.31 (line 2593): in dimension zero the empty vector is kept iff `c ≥ 0`, since `0 ≤ c`; with `c = −1` it is dropped. | Consistent |
| Tau Ceti local-field bullet and §2.20 `*Needs:*` | `M = ℚ₂(√2)`: the spectral norm gives `‖√2‖ = 2^{-1/2}`, so `√2 ≤ᵥ 1` and `1 ≰ᵥ √2`. On `ℚ₂` the normalized absolute value is `|·|₂` (`q = 2`), so `2 ≤ᵥ 1` holds in `K` and in `M`, as `finiteExtension_valuativeExtension` requires. §2.20, `X² − 3` over `ℚ₃`: `e = 2`, `f = 1`, `e·f = 2 = [ℚ₃(√3):ℚ₃]` (r3). | Names exist at the pin; claims hold |
| Descent bullet (names reduced) | Every one of the 9 remaining names resolves at the pin (lines above) and has a consumer in §§3.18–3.19. `selmerGroupA` and `normM` have 0 README hits. | Correct |
| Scope table row and Layer 3 Dependencies (§§3.1–3.3) | Layer 3 (README lines 1420–1913) cites EffectiveDiophantineMethods §3.1 four times, §3.2 four times, §3.3 twice, §3.17 twice and §3.18 twice. It also cites §§3.1–3.2 once (the import sentence) and §§3.1–3.3, 3.17–3.18 once (the Dependencies line). None cites §3.4. | Consistent |
| 3.9, 3.12, 3.13 (sampled) | See *Seeded sample*: residue −1 mod 107; gcd filter {79, 151, 173, 193}; companion relation `k + k′ = p + 3` for all 16 pairs. | Correct |
| Headlines and all other statements (0.8–0.15, 1.1–1.26a, 2.2–2.23, 3.1–3.17, 3.20, 3.23–3.26, 4.1–4.34, 5.1, the gap) | Untouched by this diff. Values as in r3 and the table it carries: Rabin over `ZMod 2` and `ZMod 5`; `IsolatedAlgebraicRoot` on `X² − 1`; Hecke matrices in weights 12 and 38; Euler–Maclaurin constants 13/6 and 121/30; Platt heights 387.5 and 293.7502; the `ℚ₂` local image of order 8 from −4, −16, −23 (`f` = −60, −4080, −12144, recomputed here). | Carried |

**Declared gap.** `gap:local-two-quotient` (HeightsRationalPointsAndObstructions §1.17) is unchanged at README lines 467–478. It is now the contract behind EffectiveDiophantineMethods §3.1, which consumes the same section. It asks for nothing an earlier roadmap supplies independently.

## Not verifiable

- Mattuck, Theorem 7, p.114, is waived in the manifest and was not reopened. It enters only through the declared gap and EffectiveDiophantineMethods §3.1.
- Twelve of the fifteen seeded targets (0.9a, 0.13, 1.1, 1.6, 1.19, 1.26, 2.9, 3.3, 3.4, 4.3, 4.20a, 4.33) lie outside the changed passages and were not re-read at their locators this round. Their rows from earlier reviews stand.
- Ownership against open pull requests was checked only for the changed passages: EffectiveDiophantineMethods at its head, ClassicalArithmeticCompletion on main, and the #763 and #986 checkouts. Other open pull requests were not searched again.
- The targeted build ran at the branch pins (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`). Main's manifest now pins Tau Ceti `2fd255d9`. Both imported modules exist there, but the build at that pin was not run.

## Source issues

- none
