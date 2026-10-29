# CMRankZeroConverse red-team repair report (round 2)

Two reviews: a (RT-CMRankZeroConverse~2a, F01–F02) and b (RT-CMRankZeroConverse~2b, F01–F03). No two findings overlap; each is settled once below.

## RT-CMRankZeroConverse~2a/F01 (P2) — applied

gap:central-jstar-control (README contract and plan `gaps`, kept verbatim equal): the clause “and continuous evaluation κ⁻ʰ … DVR at its selected rational finite-character component” deleted; the gap now asks only for control of the actual Kato j_* complex (finite generation, amplitude, both Tor sequences). §0.4 now defines ev_h = augmentation∘Tw_(κ⁻ʰ) (SelmerIwasawaCohomology §3.0) and proves the residue E and DVR claims from PadicMeasuresIwasawaAlgebras §4.3 (regular local O⟦T⟧, distinguished height-one primes) and §4.6 (character idempotents; at p=2 only (1±σ₋₁)/2 in E[Δ]). *Needs* of §0.4 repointed; new supplier subsection “From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras”; Scope and Layer 0 Dependencies name it. New Check with the reviewer's p=3 and p=2 witnesses and the untwisted-augmentation negative control.

Correction to the suggested repair: the reviewer cited PadicMeasuresIwasawaAlgebras “§4.3” for regularity and height-one primes (correct) but nothing for the splitting into finite-character components; that is §4.6 (`charIdempotent`, which needs #Δ invertible in O), so at p=2 the idempotents are taken over E, as the new text says. §2.1 still cites gap:central-jstar-control for the actual-complex comparison, as the reviewer asked.

## RT-CMRankZeroConverse~2a/F02 (P2) — disputed

The witness does not hold. (1) SelmerIwasawaCohomology (README at its open head) lists, in its scope paragraph (its line 21), “root numbers of modular forms and their constancy in families” among what is *not* in that roadmap. (2) In §4.29 the proved targets are the local Kummer-image table (σ_φ) and the parity of corank Sel_(2∞)(E_n/ℚ); the identification σ_φ = w(E_n/ℚ_v) is introduced as “an independent check” citing Dokchitser and Cowland Kellock–Dokchitser, and “The same signs are the global root numbers w(E_n/ℚ)” is a citation of Cowland Kellock–Dokchitser Theorem 3.40, not a target. (3) What §§5.3–5.4 need is the sign w_E of the analytic functional equation Λ(E,s)=w_EΛ(E,2−s) of EllipticCurveModularity R29.6, which that section defines as the eigenvalue of −W_N on the attached newform; equating it with a product of local root numbers is itself a theorem nobody supplies. So deleting the gap would leave the vanishing of L(E_n,1) for n≡5,6,7 mod 8 unsupplied.

Edit made so the next reader sees the reason: one paragraph after the gap stating the above and recording the Selmer-side check (products of σ_φ over ∞, 2 and p|n: n=1: (−1)(−1)=+1; n=5: (−1)(+1)(+1)=−1; n=6: (−1)(−1)(−1)=−1), which agree with the requested table.

## RT-CMRankZeroConverse~2b/F01 (P3) — applied

`etale_jStar_degreeOne` and `blochKatoStructure` occur in neither the README nor Suggested.lean of SelmerIwasawaCohomology at its head (checked: zero hits in its README; the index grep finds `blochKatoStructure` only in another roadmap's prose). Replaced at all four places (supplier contract; §1.2 *Needs*; §2.4 *Needs*) by the target titles: §3.15 “Stalks of j_* and R^q j_*, and the degree-one Leray sequence” and §4.9 “The Bloch–Kato local condition on T and W”. Both titles and their content (degree-one j_* = unramified at Σ; unramified rational condition away from p) were read at that head.

## RT-CMRankZeroConverse~2b/F02 (P3) — applied

From Tau Ceti: `CuspForm.conj` “line 298” → “line 309”. At the pin (Tau Ceti 358314d, the content checkout's `lake-manifest.json`), `TauCeti/NumberTheory/ModularForms/Conjugate.lean` has `namespace CuspForm` at line 305 and `def conj` at line 309; line 298 lies inside `ModularForm`.

## RT-CMRankZeroConverse~2b/F03 (P3) — applied

ArithmeticStatisticsPartI §0.7 (at its open head) is “Number fields ordered by discriminant”, with degree-2 remarks; it never names fundamental discriminants. Supplier contract: “§0.7 for the both-sign fundamental-discriminant family” → “§0.7 for quadratic fields ordered by |Disc|, which are the fundamental discriminants d≠1 through d↦ℚ(√d) with |Disc ℚ(√d)|=|d|, the discriminant d=1 being the single finite exception”. §5.1: “The family is unweighted” gains “(the quadratic fields of ArithmeticStatisticsPartI §0.7 ordered by |Disc|, plus d=1)”.

## Adversarial pass on changed statements

| Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 ev_h = aug∘Tw_(κ⁻ʰ) | p=3,h=1,c=4; σ₋₁ at h=1,2; h=0 | 4⁻¹=1/4 (not 4); σ₋₁↦−1,+1; h=0 gives the plain augmentation, kernel (T) | agrees with the existing Checks and API bullet “twisting followed by augmentation” | definition made explicit |
| §0.4 kernel on the selected component | p=3,h=1,κ(γ)=4; p=2,h=1,κ(γ)=5 | T↦−3/4, kernel (T+3/4), O⟦T⟧/(T+3/4)≅ℤ₃, residue ℚ₃ after 1/3; T↦−4/5, kernel (T+4/5), residue ℚ₂; (1−σ₋₁)/2↦(1+1)/2=1 | a=κ(γ)⁻ʰ−1 ∈ 3ℤ₃, resp. 4ℤ₂, so T−a is distinguished of degree one | Check added |
| §0.4 DVR | O⟦T⟧ regular local dim 2, prime (T−a) of height one | localization regular local of dimension 2−1=1, hence a DVR; p∉(T−a) since ev(p)=p≠0 | holds; at p=2 #Δ=2 is invertible only in E, so components exist only after inverting two | route written with §4.6's invertibility hypothesis |
| §0.4 other components | p odd, Δ of order p−1, χ≠κ⁻ʰ on Δ | ev_h(e_χ)=(1/#Δ)Σχ(a)⁻¹κ(a)⁻ʰ=0 by orthogonality | killed, as the API bullet says | none |
| gap:central-jstar-control (narrowed) | consumers §0.4, §2.1 | §0.4 no longer cites it; §2.1 still needs the actual-complex control and both Tor sequences | no consumer lost an input | README = plan, checked by script for all 13 gaps |
| b/F03 dictionary | d=−3,5,−4,8,12; d=1 | Disc ℚ(√d)=d in each case; d=1 gives ℚ, not quadratic; count 3X/π² per sign, total 6X/π², equal to the §5.4 weight total 6·X/π² | holds | text added |
| Root-number note (a/F02) | n=1,5,6 | σ_φ products +1, −1, −1 from SelmerIwasawaCohomology §4.29's table (σ₂=−1 for n≡±1 or even, +1 for n≡±3; σ_q=(−1/q)) | matches requested table n≡1 → +1, 5,6 → −1 | note added |
| `CuspForm.conj` locator | pinned file | `def conj` at line 309 | correct | locator fixed |

Suggested.lean is unchanged: no finding touches a Lean statement, and no new backticked name of this roadmap was added to the README (the new symbol ev_h is plain text).

## Checks run

- Elaboration of `packages/CMRankZeroConverse/Suggested.lean` (`lake env lean`): first run failed because the Tau Ceti object file for `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic` was missing; the four imported Tau Ceti modules were then built with `lake build <module>`. After the build (exit 0, 4178 jobs) the elaboration exits 0 with exactly five `declaration uses sorry` warnings (lines 55, 67, 78, 106, 132), the five headline theorems; no errors. After the header repair below, the elaboration exits 0 with exactly five `declaration uses sorry` warnings (lines 59, 71, 82, 110, 136, shifted by the new header lines) and no module-system warning. No declaration's binders or statement changed, so the elaborated signatures are as previously audited.
- Dependency check: `depcheck: 186 roadmaps, 1222 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.
- `roadmaps resolve`: the same two leads as before (KatoEulerSystems, ModularIwasawaMainConjecturesPartII), both board packages earlier in the merge order, not on main or in an open pull request; Lean names found nowhere: none.

## Gate failures repaired

- Warning `imports Mathlib from package mathlib, which is designed for use with the module system; consider adding module` (reported twice): `Suggested.lean` now opens with `module`, its five imports are `public import` (still `Mathlib` first, then only the four `TauCeti.*` modules, which are themselves module-system files at the pin), and the declarations sit inside `@[expose] public section … end`, so the definitions stay public with visible bodies. The gate's import scanners report nothing for the new header. No statement, docstring or name changed.

## Notes for the maintainer

- New supplier cited: PadicMeasuresIwasawaAlgebras (on main) §§4.3, 4.6. No declaration names changed; no other roadmap cites a name of this roadmap that changed.
- Ownership against open pull requests: SelmerIwasawaCohomology and ArithmeticStatisticsPartI and EllipticCurveModularity were read at their open heads through the roadmap index; the central-prime algebra is derived here from suppliers, not newly owned.
- The plan's node prerequisites still refer to `RankZeroOneBSD:BSD.0/congruent-number-root-numbers`; this round may edit only the plan's `gaps` list, and the gap itself is retained.
