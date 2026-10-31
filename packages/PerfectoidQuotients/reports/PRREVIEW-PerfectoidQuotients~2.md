# Review of PerfectoidQuotients (pull request #1042 at a3fe4b4)

**Verdict:** accepted

Incremental re-review of the 71 lines changed since 502f1d5. Every finding of the previous review is repaired, no repair introduced a new problem, the gate passes, and the two findings below are P3 notes the author may take or leave.

## R01 (P3) — "continues this roadmap's layer numbering" does not match the layers here

Location: `TauCetiRoadmap/PerfectoidQuotients/README.md` line 55, "that Part II continues this roadmap's layer numbering and imports §§0.4–0.6".

Claim: PerfectoidQuotientsPartII's Layers Q5–Q10 continue this roadmap's numbering.

Witness: this README's layers are `## Layer 0`, `## Layer 1`, `## Layer 2` (lines 373, 1053, 1297), with no Q-prefix and no Layers 3–4; the board's PerfectoidQuotientsPartII design opens with Layer Q5. A reader looking here for Layers Q0–Q4 finds none.

Repair: "that Part II numbers its layers Q5–Q10 and imports §§0.4–0.6".

## R02 (P3) — Backticked own names in API bullets that `Suggested.lean` does not declare

Location: `README.md` lines 1157–1164 (`bhattRootExtension.map`, `.root`, `.root_pow`, `.perfectoid`, `.raw_almost_iso`, `.map_comp`, `bhattRootExtensionPower`, `bhattRootExtensionModel`), 861–864 (`quotientPowerMap`, `_mk`, `_natural`), 1215 (`monicRootPair.map`), 1245 (`almostAicExtension.map`).

Claim: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

Witness: `Suggested.lean` declares one theorem, `Witt.witt_principal_quotient_p_torsion`; the citation tool lists `bhattRootExtension.raw_almost_iso` as found nowhere. The gate's `readme-ids-missing` check does not reach these dotted names, so this is outside the gate and was noted in the previous review's R01.

Repair: write these API bullets as prose without the backticked names (the statements stay). No Lean declarations should be added: the carriers (perfectoid fields, the almost category, `IsIntegralPerfectoid`) are absent at the pins.

## Previous findings

- R01 — repaired: §0.3 now reads "1. If `p² | ξg`, then `p | g`. 2. If `p²f ∈ (ξ)`, then `pf ∈ (ξ)`." with only the declared theorem named; the gate reports `readme-ids-missing=0`. Its remark on other API-bullet names is R02 above.
- R02 — repaired: the supplier contract now cites "CrystallineCohomology §CR.4.4, *Inputs on Witt vectors* (its paragraph *Finite-length Witt operators and their identities*)" and describes the finite Frobenius and its truncation compatibility; both exist at CrystallineCohomology's open head (its README lines 5156–5158 and API bullet "Finite Frobenius and Verschiebung commute with truncation"). Neither invented name remains.
- R03 — repaired: the invented owners are gone (zero hits for either name). Fibre-product and valuation methods go to PerfectoidQuotientsPartII Layers Q5–Q6, Theorem 2.3.4 to Q7–Q9 (lines 52–56, 812, 1112); perfectoidization of animated rings, arc descent and `J`-almost purity to PrismaticCohomology §§2.0, 2.22–2.31 (line 51); line 1377 names the two roadmaps. All resolved, see Verified sound.
- R04 — repaired: the Mathlib pull-request link is deleted; line 176 keeps "adopt Mathlib's vocabulary for integral perfectoid rings through that single supplier".
- R05 — repaired: §0.1 lines 574–586 add `J = (ξ₀)`, the idempotent `e = ξ₀^p a₁ ∈ J` with `ξ₀ = ξ₀e`, the vanishing of idempotents of the inverse perfection with zeroth coordinate zero, hence `ξ₀ = 0`, `J = 0`, `ξ₁a₀^p = 1`; plus the Check `thetaKernelIdempotentStep`. Recomputed below; correct.

## Verified sound

**Gate and dependency check.** The worker's gate at a3fe4b4 passes every check (`readme-ids-missing=0`, `build=0`, `set_option=0`, `prnum=0`, `sorry-data=0`, `stray-files=0`, `outside-folder=0`). `git diff --stat origin/main...HEAD` outside the folder is empty. The dependency check run from this review:

```
depcheck: 205 roadmaps, 1402 edges, 0 problem(s)
```

No UPWARD or CYCLE line. PerfectoidQuotients is at merge-order line 20, after CrystallineCohomology (19). The roadmaps the changed scope passage names as deferral owners are consumers or extensions, not suppliers: PrismaticCohomology is at line 54 and PerfectoidQuotientsPartII at line 202, and the edge count dropped by one against the previous head, so no supplier edge was added.

**Cross-roadmap citations the diff adds, resolved now.**

- PrismaticCohomology at the head of its open pull request: `## Layer 2: Animated inputs and perfectoidization` (its README line 2650), `### 2.0 Arc descent for the comparisons` (2657), `### 2.22 Perfection of derived prismatic cohomology and perfectoidization` (3107) through `### 2.31 Integral perfectoidization and arbitrary-ideal almost purity` (3268), with §2.27 "Connective perfectoidizations are perfectoid and universal" and §2.30 "arc excision" in between. Its summary (line 8) and supplier table (line 176) name PerfectoidQuotients §§0.0, 0.1, 0.3 as its supplier, so "a consumer of this roadmap" is accurate.
- The board's PerfectoidQuotientsPartII design (`packages/PerfectoidQuotientsPartII/design/README.md`): "continues the parent's layer numbering with Q5–Q10" (line 7); Q5 "Tilting identities, torsion transfer and fibre products" (87), Q6 "relative tilting equivalence, valuation rings" (209), Q7–Q9 "(after Česnavičius–Scholze Theorem 2.3.4)" (13) with Q9 "The ind-syntomic André lemma" (601); imports from this roadmap §0.4, §0.5, §0.6 (25–28); its J-almost purity is imported from PrismaticCohomology Part I §§2.30–2.31 (36–38), consistent with where this README now sends it. Its plan.json declares one gap, on Q10, naming no section of this roadmap; it supplies nothing back.
- CrystallineCohomology at the head of its open pull request: `### CR.4.4 Inputs on Witt vectors` (line 5156) opening with the bold paragraph *Finite-length Witt operators and their identities*, constructing `F_r : W_(r+1)(R) → W_r(R)` on `TruncatedWittVector p r R`, with "The finite projection identities have no characteristic-p hypothesis" and the API bullet "Finite Frobenius and Verschiebung commute with truncation of the infinite operators", exactly what this README's contract now says.

**Sources in the changed passages (seeded targets 0.1 and 0.3).** bms1 fetched from arXiv through the sources service (1602.03148v3). Lemma 3.10, lines 1062–1111 (pp.22–23): the proof's coordinate computation `ξ = ξ′a`, `(ξ′₀a₀, ξ′₀^p a₁ + ξ′₁a₀^p, …)` at line 1088, with `ξ′₁a₀^p` shown to be a unit by reducing to `S/πS` (lines 1089–1091), which uses the lemma's standing surjectivity of `S/π → S/π^p`. This README's `theta_kernel_charP` drops that hypothesis (line 588, "Neither lemma assumes Frobenius surjective"), so the source's unit step is not available and the added idempotent step is what carries the route; the citation "Lemma 3.10 and its proof" is the right locator for the pattern. Example 3.15, lines 1166–1170 (p.24): for perfect `S` the kernel of `θ` is generated by `p`, and conversely `p` is distinguished under surjective Frobenius; as cited. §0.3's statements and locator (BMS2 Proposition 4.19(3)) are unchanged since the previous review, which verified them at bms2 lines 920–957.

**Lean.** `Suggested.lean` is unchanged since 502f1d5 (the diff touches only the README). Re-elaborated on a scratch copy with `lake env lean` from the worktree, Mathlib 6b7abb3c and Tau Ceti a91d3aaf in the packages directory: the only warning on the original text is `declaration uses sorry`; `#check @witt_principal_quotient_p_torsion` gives `∀ (p) [Fact p.Prime] {k} [CommRing k] [CharP k p] [PerfectRing k p] (ξ : WittVector p k), IsUnit (ξ.coeff 1) → ∀ n (x : WittVector p k ⧸ Ideal.span {ξ}), ↑p ^ n * x = 0 → ↑p * x = 0`, equal to the README's §0.3 statement 3 at the same generality (perfect ring, not field); no section binder lost. One-tactic probes on three copies: `simp_all` "made no progress", `simp [*]` "made no progress", `aesop` "failed, made no progress"; the theorem is not padding. The headline list and the docstring's not-statable list are as in the previous review; nothing statable is absent.

**Adversarial table.** Rows for statements the diff leaves untouched carry forward from the previous review (PRREVIEW-PerfectoidQuotients~1, "Adversarial table"); rows for changed statements are computed here.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `theta_kernel_charP`, new route: `J = (ξ₀)` | `R` nonzero of characteristic `p`, `θ(x) = (x₀)₀` since `p = 0` in `R` | `j ∈ J ⇒ θ([j]) = j₀ = 0 ⇒ [j] ∈ (ξ)`; mod `p` through `W(R♭)/p ≃ R♭`: `j ∈ (ξ₀)`; and `θ(ξ) = 0 ⇒ ξ₀ ∈ J` | `J = (ξ₀)` true | none |
| §0.1 new route: the idempotent | `p = ξa`, `p = (0,1,0,…)` | `ξ₀a₀ = 0`; `ξ₀^p a₁ + ξ₁a₀^p + pξ₁a₁ = 1`, last term `0`; times `ξ₀`: `ξ₀^{p+1}a₁ = ξ₀` since `ξ₀a₀^p = 0`; `e = ξ₀^p a₁`: `e² = (ξ₀^{p+1}a₁)ξ₀^{p−1}a₁ = ξ₀^p a₁ = e`, `e ∈ J` | idempotent, in `J` | none |
| §0.1 new route: idempotents of `lim_F R` with `e₀ = 0` | `e = (e_n)`, `e_n^p = e_{n−1}`, `e² = e` | `e_n² = e_n` and `e_n^{p^n} = e₀ = 0` give `e_n = e_n^{p^n} = 0` | `e = 0`, so `ξ₀ = 0`, `J = 0`, `ξ₁a₀^p = 1`, `a₀` a unit, `a` a unit by `witt_isUnit_iff` | none |
| §0.1 Check `thetaKernelIdempotentStep` | `W(F_p × F_p) ≃ ℤ_p × ℤ_p`, `ξ = ((1,0),(0,1),0,…) = (1,p)`, `a = ((0,1),(1,0),0,…) = (p,1)` | `ξ₀a₀ = (1,0)(0,1) = 0`; `ξ₀^p a₁ + ξ₁a₀^p = (1,0)(1,0) + (0,1)(0,1) = (1,1) = 1`; `ξa = (p,p) = p`; `a₀ = (0,1)` not a unit; `θ(ξ) = (1,0) ≠ 0` so `ξ ∉ ker θ` | the two equations alone do not force `a₀` a unit; consistent with the route, which uses `J = (ξ₀)` | none |
| §0.1 `tilt_projection_injective_charP` | `J = 0` from the row above | `pr₀` injective iff Frobenius on `R` injective | unchanged, follows | none |
| §0.3 lemmas 1–2 (now prose), lemma 3 (Lean) | as previous report | `ξg ≡ [ξ₀g₀] + p([ξ₀g₁^{1/p}] + [ξ₁^{1/p}g₀])`, `g₀² = 0 ⇒ g₀ = 0`; cancel `p` in `W(k)` | true; only names changed | none |
| §0.3 negative control `W(F₂)/(4)` | carried, previous report | `(p²).coeff 1 = 0`; `4·1 = 0`, `2·1 ≠ 0` in `ℤ/4` | hypothesis necessary | none |
| Supplier CR.4.4 finite Frobenius | `r = 1`, `R = ℤ`, `p = 2` | `F(x₀,x₁) = x₀² + 2x₁`: `(1,1) ↦ 3`; `F_0 : W_1 → W_0 = 0` | matches the contract's Checks and the supplier's "no characteristic-p hypothesis" | none |
| Scope deferrals (line 51–56, 812, 1112, 1377) | each named owner opened at its head | PrismaticCohomology §§2.0, 2.22–2.31 exist and consume §§0.0–0.3 here; Part II Q5–Q10 exist and import §§0.4–0.6 | consistent, no cycle (edges 1402, 0 problems) | R01 wording only |
| §0.0–§0.2, §0.4–§0.7, §1.1–§1.4, §2.1 (all untouched) | carried from the previous report's table, rows 1–40 | as recorded there | unchanged | none |

**Previous-review items still holding.** The library declarations opened at the pins, the cross-roadmap citations of PerfectoidSpaces, DerivedModuleAlgebra, EnhancedDerivedSheaves, SchemeAndStackFoundations, AdicSpaces and DerivedDeRhamCohomology, and the source locators of the full seeded sample are as recorded in the previous report; the diff cites none of them differently.

## Not verifiable

- None of the texts needed for the changed passages was unreadable. Ownership against open pull requests was checked for the three roadmaps the diff newly names (PrismaticCohomology at its open head, CrystallineCohomology at its open head, the board's PerfectoidQuotientsPartII design); the wider ownership sweep is the previous review's.

## Source issues

- none
