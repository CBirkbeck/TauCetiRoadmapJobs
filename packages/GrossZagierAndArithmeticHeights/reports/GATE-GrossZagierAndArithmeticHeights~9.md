# GATE-GrossZagierAndArithmeticHeights~9: answers to human review

Reviewed head `b8e5989`; repairs committed as `bbb42979` (README only; `Suggested.lean` unchanged).

## H01 (rwst) — disputed
LubinTateFormalModulesAndQuasiCanonicalLifts sits at line 294 of the merge order, above this roadmap (line 341). Suppliers merge first, so this README cannot merge before LT.3 and LT.6 are on main. The open roadmap AnticyclotomicLocalUnits (README line 14, §6.1) consumes the same LT sections. Restating LT.3 and LT.6 as targets of §7.2 would therefore give them a second owner. The defect the review points at is real for now: the supplier is not yet public, so the roadmap's text cannot be reviewed against it. That is a merge-sequencing condition for the human merge decision; it is not repaired by editing this README. The dependency the review traced through the N01 fix is removed for F = ℚ (H02). For [F:ℚ] > 1 (item 4), and in §7.2 at general O_(K_v), LT.3 and LT.6 stay as cited suppliers.

## H02 (rwst) — applied
§7.46a item 4 now cites LubinTate LT.3 only "when [F:ℚ] > 1". When F = ℚ, the chart is the universal deformation of E₀[p^∞] over W(k)⟦T⟧ (ModularCurves Layer 7F ST-2), with Drinfeld level from ST-4. The Outline replaces "the Serre–Tate equivalence identifies them with LT.3" with ST-2/ST-4 and says that LT.3 is not used when F = ℚ. The false-elliptic case (F = ℚ, 𝔅 ramified at a finite place) also uses ST-2: the connected height-two factor is isomorphic to E₀[p^∞] by Dieudonné classification. For that reason `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` was added to the §7.46a *Needs*. The *Needs* line of §7.46a and the Layer 7 dependency line scope LT.3 the same way. ST-2 and ST-4 were checked on main (`3ec8d5f`, ModularCurves README lines 1563–1578).

## H03 (rwst) — applied
§9.11 previously asserted both a full-class-group value identity without t_K and that the D₁ root satisfies JSW (5.1.a). These conflict at ℚ(√−7), where h = 1 and t_K = 2.

- **§9.11 root.** The linear root now sums over a set D of representatives of all of Cl(O_K), so its square interpolates exactly Brooks's Proposition 8.9 value with no t_K. This is the review's option (a), with the full sum also used in the measure construction. Burungale's D₁ variant is named as not used.
- **Removed sentences.** The sentence "with the D₁ root … satisfies JSW (5.1.a)" is deleted, and so is the claim that t_K comes from D₁ versus the full sum. Burungale's text says only that the factor "arises from the definition (5.8)" (burungale line 1082).
- **§9.15.** The Outline now says that the quaternionic unit u is t_K times the transport unit, so ψ(L_p(f)) = t_K·(Brooks's value). Uniqueness then pins the JSW element.
- **§9.11 Checks.** The ℚ(√−5) Check is rewritten: the root has 2 terms where the D₁ sum has 1. A new ℚ(√−7) Check records V versus 2V.
- **Wording elsewhere.** §9.4 and §9.21 now say "the shape of (5.8), summed over all of Cl(O_K)".

## H04 (rwst) — answered
This README already declines the EffectiveClassNumbers §2.8 formulas as supplier or consumer (Scope, line 9). Removing that roadmap's duplicate "Prove … Gross–Zagier formula" targets is an edit to EffectiveClassNumbers, outside this folder.

## H05 (rwst) — answered
The README declines gap:integral-family-logarithm and gap:manin-period-comparison by name. Reassigning them is an edit to HeegnerPointEulerSystems and ModularIwasawaMainConjectures, outside this folder.

## H06 (rwst) — applied
§9.5 Outline: "the multiplier is 1−a_p/p" → "1 − a_p χ^(-1)(p̄) = 1 − ε χ^(-1)(p̄)". §9.5 Check: "(p−1)/p" now appears only as the value at the norm character χ = N (χ^(-1)(p̄) = p^(-1)), next to (p+1)/p at a_p = −1. The Check also notes that 1 − a_p^(-1) vanishes at a_p = 1.

## H07 (rwst) — applied
One sentence was added to the introduction of Layers 6, 7 and 8: sections are listed in dependency order and cited by number, so the numbers do not always increase down the page.

## H08 (rwst) — answered
The pull-request body is outside the files this repair may edit; it is left to whoever edits the PR text. For that edit: Scope line 9 denies EffectiveClassNumbers as a supplier. The supplier contracts name ArithmeticGaloisRepresentations and LubinTateFormalModulesAndQuasiCanonicalLifts.

## Adversarial pass on changed statements

| statement | instances | values computed | result | change |
| --- | --- | --- | --- | --- |
| §9.11 square of full-sum root = Brooks value | ℚ(√−7) (h=1); ℚ(√−5) (h=2, Cl=Cl^ram) | √−7: one term, square V, JSW element t_K·V = 2V; √−5: 2 terms vs D₁ 1 term, t_K = 2/(1·2) = 1 | consistent: one root, one constant | rewritten; Checks added |
| §9.15 u = t_K·transport unit | ℚ(√−3): t_K = 6/(3·1) = 2; ℚ(√−5): 1; p = 3 | t_K = 2^(2−t), a unit at odd p | holds | Outline rewritten |
| §9.5 multiplier 1 − εχ^(-1)(p̄) | χ = N, ε = ±1 | ε=1: 1−1/p = (p−1)/p; ε=−1: (p+1)/p; Hida 1−a_p^(-1) at a_p=1: 0 | Check now matches the target | Outline and Check fixed |
| §7.46a item 4, F = ℚ via ST-2/ST-4 | p = 5, j = 0 supersingular; U_v = Γ(p^r) | ST-4 covers [Γ(pⁿ)], i.e. principal level 1+p^r M₂(ℤ_p); ST-2 needs k = k̄, and F̆_v has residue field 𝔽̄_p | hypotheses met | citation scoped |
| §7.46a false-elliptic factor ≅ E₀[p^∞] | connected, dim 1, height 2 over 𝔽̄_p | Dieudonné module isoclinic of slope 1/2, unique up to isomorphism | holds | R07.2 added to *Needs* |

## Build and gate

- `Suggested.lean` is unchanged, so no `#check` signature comparison was redone; the scratch signatures file was unavailable.
- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: Build completed successfully (8981 jobs); the only warning is the `sorry` at line 39.
- Gate summary line: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`; there is no UPWARD or CYCLE line.
- No new sources were cited. Ownership was checked against the open roadmap PRs through `roadmaps grep` ("quasi-canonical", "universal deformation of formal"): only AnticyclotomicLocalUnits, which consumes LubinTate, and this roadmap match.
