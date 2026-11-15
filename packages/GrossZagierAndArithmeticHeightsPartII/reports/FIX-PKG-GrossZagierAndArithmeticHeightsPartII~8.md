# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~8

This round resolves the seven findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~7`. I checked each one against the cached legal sources (LZ, K, Z), the supplier READMEs at their heads and the README's own *Needs* lines. All seven are correct and all are applied.

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: the locators of LZ, K and Z now cover the passages newly cited. No new work and no fetch.

Unchanged: `Suggested.lean`, `metadata.toml` and `design/plan.json` (no supplier gap was added or changed).

## F01 (P2) — applied

Verified: the supplier's §§2.1, 2.4, 2.13 are conjugation integrals (its README:689, 765, 999). Contract: "normalized orbital integrals and their convergence" → exact descriptions, plus "model for, not containing, the S_n integrals". §9.3: added finiteness (regular semisimple per Z §1.2, pp. 4–5; Baire; right-invariance) giving a Laurent polynomial in q^s, an API bullet, and a γ = 1 divergence Check.

## F02 (P3) — applied

Verified: LZ Corollary 5.3.3 (p. 26) precedes (6.4.0.2) (p. 38). §2.3: "equalities after the cycle-class quotient of §2.6" → an explicit Euler-characteristic identity with route via LZ Corollary 5.2.2 and §2.2; *Needs* drops §2.6, adds SchemeAndStackFoundations §§5.3–5.4, 5.7 and MotivesAndAlgebraicCycles §§2.4, 2.7. §§7.3/7.4 exchanged; references in §§7.2, 7.5, 7.8, 8.1, 8.7 and Source corrections updated.

## F03 (P3) — applied

Verified: K Definition 3.4 (p. 17) has both conditions; Definition 3.7 (p. 19) defines test algebras. §7.3: "Define N_Λ by K Definition 3.4 … of K Definition 3.7" → N_Λ defined in words (Z(Λ) at m = 0; Lie-image condition at m ≥ 1); "F^⊥ ⊂ Λ^⊥" qualified "when m ≥ 1"; Checks: Exc_(Λ₀) ⊂ Z(Λ), and m = 0.

## F04 (P3) — applied

All claims recomputed by scanning every *Needs* line. Dependencies: Layer 13 adds Layer 12 and PELModuliPartII §6.1; Layer 7 "Layers 0–1"; Layer 14 "Layers 0, 9 and 12"; Layers 5, 6 add the missing sections. §7.5 and §13.3 *Needs* fixed. Contract entries placed in *Needs* (§§1.3, 2.7, 7.1, 10.1, 10.3) or deleted (§M0.22, MetaplecticAutomorphicForms §2.7).

## F05 (P3) — applied

Verified: LZ Theorem 10.3.1 (p. 66) covers every full-rank lattice, through Theorem 3.4.1, as §3.5 does here. §4.3: "every full-rank integral L" → "every full-rank L"; new Check: at val −2, D_Λ = 0 and Z(x) = ∅, so 0 = 0. No other "full-rank" statement here narrows its source.

## F06 (P3) — applied

Verified: LZ Theorem 13.6.1 (p. 83) assumes φ v₀-admissible and T ∈ Herm_n(O_(F,(p)))_(>0). §13.5: "for positive definite integral nonsingular T" → "for v₀-admissible φ (§10.1) and positive definite T ∈ Herm_n(O_(F,(p)))"; Check added; §10.1 added to *Needs*. §§13.7, 13.8, 13.10 already state their hypotheses on φ.

## F07 (P3) — applied

Verified in the cached texts. §3.1: "LZ §3.3 …; §9.1, pp. 60–62" → "LZ §3.2, (3.2.0.1)–(3.2.0.2) and Definition 3.2.1, p. 16; §3.3 …". §§4.1, 4.3: add "(9.1.4.2), p. 63". §8.7: "p. 75" → "pp. 75–76". §12.9: "after (9.8)" → "Remark 9.1 and (9.7)". §0.4: Vollaard–Wedhorn → "LZ §2.7 recalls (p. 12)".

## Checks run

- **Elaboration.** `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`, run from the content checkout: exit 0, no output.
  - `Suggested.lean` is unchanged. It has one `import Mathlib`, one module docstring and an empty namespace, so there are zero declarations.
  - The `#check @name` comparison therefore had no input: there is no elaborated type to compare with the README.
  - No README change touches a headline's statability, and no new backticked name of this roadmap was introduced.
- **Dependency check.** Exact output after the final edit:

      depcheck: 244 roadmaps, 2258 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. Every supplier section added is in a roadmap that was already a supplier.
- **Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." I checked the newly cited supplier sections at their heads myself:
  - AbelianSchemesAndArithmeticModuli §A4.7 (its README:2126);
  - PELModuliPartII §§5.5, 7.4, 9.8 (board package README:1059, 1379, 1813);
  - LubinTateFormalModulesAndQuasiCanonicalLifts §6.4 (README:2035);
  - MetaplecticAutomorphicForms §2.1 (README:403).
- ***Needs* scan** after all edits:
  - no target needs a target at or after its own position;
  - every layer's Dependencies line lists exactly the internal layers its *Needs* lines use;
  - every supplier section in a *Needs* line appears in its layer's Dependencies;
  - every contract section is consumed by some *Needs* line.
- **Ownership.** The new content is the finiteness of Zhang's η-twisted GL_(n−1)(F₀)-orbital integrals on S_n. I searched for it by object (`roadmaps grep` for S_n = {γγ̄ = 1}, "Laurent polynomial in q^s"; read EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.13 and EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.3–4.6). No other roadmap states it. This roadmap owns Zhang's S_n formulation (§9.3), so it is the owner.
- **Sources.** No source was fetched. `needs-references.toml` was not needed and was not written.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §9.3 finiteness | ℚ₃, n = 2, γ = ((0,1),(1,0)) | h = diag(t,1): conjugate ((0,t⁻¹),(t,0)) is integral iff v(t) = 0; Orb(s) = vol(ℤ₃^×) = 1 | Laurent polynomial ✓ |
| §9.3 finiteness | γ = ((−2,1),(−3,2)), γ² = 1 | conjugate ((−2,t⁻¹),(−3t,2)): v(t) ∈ {0, −1}; shells give 1 and η(3⁻¹)·3^s = −3^s; Orb = 1 − 3^s | ✓, agrees with the existing η̃ Check |
| §9.3 regularity needed | γ = 1 ∈ S₂ (closed orbit, stabilizer GL₁) | Σ_(k∈ℤ) (−1)^k·3^(−ks): \|term\| = 3^(−k·Re s) does not tend to 0 as k → +∞ and k → −∞ at once, for any s | diverges; added as a negative-control Check |
| §9.3 acting rank 0 | n = 1, GL₀ trivial | Orb(γ, f′, s) = f′(γ), a constant | finite ✓ |
| §9.3 route (Baire) | orbit closed (Z §1.2) ⇒ locally compact; GL_m(F₀) σ-compact | the bijection GL_m(F₀) → orbit is open by Baire, hence a homeomorphism; preimage of supp f′ is compact | ✓ |
| §2.3 numerical form | n = 2, unit-norm L♭ | vertical class 0, both sides 0 | ✓ |
| §2.3 route | curve C ⊂ V(Λ) ≅ Y_d, Cartier Z(x) | χ(O_C ⊗ᴸ O_Z(x)) = χ(O_C) − χ(O_C(−Z(x))) = deg O(Z(x))\|_C = ∫ c₁·cl(C); cl(C) Tate in H^(2(d−1)), i = d−1 in §2.2 | depends only on cl(C) ✓ |
| §7.3 definition, m = 0 | type-0 Λ₀ | N_(Λ₀) = Z(Λ₀) = Exc_(Λ₀) ≅ ℙ^(n−1) (K Prop. 3.17) | ✓ |
| §7.3 definition, m = 1 | type-2 Λ ⊂ Λ₀, n ≥ 2 | dim M/Λ̆ = m = 1 (K Lemma 3.9 proof), so on M = Λ̆₀ the only admissible M′ ⊃ Λ̆ is Λ̆; Z(Λ) ⊃ Exc_(Λ₀) of dimension n−1 ≥ 1 | N_Λ ≠ Z(Λ); wrong model "drop condition (2)" refuted, added as a Check |
| §7.3 flag condition | m = 0 | Λ̆ = M, perp of M_O under a perfect form is 0, so F̃^⊥ ⊂ 0 is impossible for rank 1 | "when m ≥ 1" added |
| §7.3/§7.4 order | *Needs* scan | §7.3 needs §7.1; §7.4 needs §§7.1–7.3 | no forward need ✓ |
| §4.3 | rank 1, a = 2, 0, −2 | a = 2: (q+1)·(q+2)/(q+1) = q+2 = ∂Den_Λ; a = 0: 1 = 1; a = −2: D_Λ = 0 (no integral overlattice), Z(x) = ∅, 0 = 0 | "integral" deleted ✓ |
| §13.5 hypotheses | φ_v₀ = 1_(Λ_v₀^n) against another lattice | the semi-global cycle of §10.1 exists only for v₀-admissible φ; the other φ has no Int_(T,v₀) | hypothesis added |
| §10.1 route (A4.7) | semi-global model at p | GM: a lift of x along a nilpotent PD thickening is determined by its crystal, so it is unique, and the lifting locus is closed ⇒ formally unramified; on the generic fibre p is invertible and GM is not used | scoped to the semi-global model |
| Layer 13 Dependencies | §13.6 *Needs* | §§10.4, 12.3; no Layer 11–12 target needs Layer 13 | no cycle ✓ |

## For the maintainer

- **Ids moved.** §7.3 is now "Krämer stratum deformation" and §7.4 "Krämer vertex strata" (exchanged). No roadmap on main, at an open head or in the board packages cites an id of this roadmap (searched "GrossZagierAndArithmeticHeightsPartII" with `roadmaps grep` and in `packages/*/README.md`; the only hits are SchemeKTheoryOperationsPartII's mentions of its own sections). So no old → new table is needed.
- **`design/plan.json`.** Its node records 7.3 and 7.4 still carry the former titles. The brief allows editing only the plan's `gaps` list, which needed no change.
- **Source observation (not edited).** K Lemma 3.8(2) is stated without "m ≥ 1", but condition (e) cannot hold at m = 0. Its proof uses Definition 3.4(2), which exists only for m ≥ 1. The README now states the restriction.
- **No suspicious instructions** were found in the review text.
