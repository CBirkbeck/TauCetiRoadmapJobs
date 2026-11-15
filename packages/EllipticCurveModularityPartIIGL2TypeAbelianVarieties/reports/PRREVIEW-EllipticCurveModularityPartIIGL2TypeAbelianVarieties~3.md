# Review of EllipticCurveModularityPartIIGL2TypeAbelianVarieties (pull request #1036 at 983a1f7)

**Verdict:** needs changes

Incremental re-review of the 67 lines changed since `bf5759f`. Four P3 findings, none blocking; the gate passes.

## R01 (P3) — The three notation abbreviations still have no docstring

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean:42`–44: “abbrev Qbar := AlgebraicClosure ℚ”, “abbrev GQ := Field.absoluteGaloisGroup ℚ”, “abbrev AVQ := TauCeti.AlgebraicGeometry.AbelianVariety ℚ”.

**Claim:** Every declaration carries a docstring stating the mathematics; these three have none. This is R02 of the previous review, not repaired: `Suggested.lean` is unchanged since `bf5759f`.

**Witness:** The diff from `bf5759f` to this head touches `README.md` only (33 insertions, 34 deletions). `End0` at line 46–47 has a docstring; lines 42–44 do not.

**Repair:** Add `/-- The chosen algebraic closure of ℚ. -/` before `Qbar`, `/-- The absolute Galois group of ℚ, with its Krull topology. -/` before `GQ`, and `/-- Abelian varieties over ℚ, in the native Tau Ceti sense. -/` before `AVQ`. The elaborated types (`Type`, `Type`, `Type 1`) do not change.

## R02 (P3) — The Lean section comment for Layer 5 keeps the title the README dropped

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean:89`: “/-! ## Layer 5: ℚ-curves as factors of abelian varieties of GL₂-type -/”.

**Claim:** The section comments of `Suggested.lean` repeat the README's layer titles; this head renames Layer 5 in the README and leaves the Lean comment at the old title.

**Witness:** `README.md:1083` at this head: “## Layer 5: ℚ-curves, their cocycles and their GL₂-type factors”. The Layer 1 comment (`Suggested.lean:40`) still equals `README.md:153`.

**Repair:** Replace line 89 by `/-! ## Layer 5: ℚ-curves, their cocycles and their GL₂-type factors -/`.

## R03 (P3) — A group heading and its first target share one number, and “group” is not defined

**Location:** `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:486`–488: “### 2.3 The determinant `ε·χ_ℓ` and oddness of the system … This group provides …”; likewise the headings of 2.5, 2.9, 3.2 and 5.2 (lines 539, 611, 719, 1180).

**Claim:** After the regrouping, `§2.3`, `§2.5`, `§2.9`, `§3.2` and `§5.2` each name both a group of targets (the heading) and one target (the citations). Nothing in the README says which, and “How to read the build” does not mention groups.

**Witness:** `README.md:535`, inside the group headed 2.3: “*Needs:* §2.3” (circular if the heading is meant). `README.md:1354`: “*Needs:* §5.2; §5.4”, although heading 5.2 already names “the endomorphism algebra of the Weil restriction”, which is target 5.4.

**Repair:** Add to “How to read the build”: “Targets that serve one purpose stand under one numbered heading. The heading describes the whole group and carries the number of its first target; the other targets of the group are the bold numbered paragraphs under it. A citation `§k.n` always means the single target with that number.” With this sentence line 535 reads as the determinant target alone and line 1354 is not redundant.

## R04 (P3) — The description's AI-assistance sentence describes an earlier head

**Location:** Pull request description, the paragraph beginning “Validation:”: “AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow.”

**Claim:** The head contradicts both halves: the red-team passes are in the branch, and models the sentence does not name wrote later commits. `CONTRIBUTING.md` (“Attribute AI assistance”) asks for the models used, in the description.

**Witness:** The branch history has six commits titled “red-team repairs”; `bf5759f` and `ee7d010` carry the trailer “Co-Authored-By: Claude Fable 5.1”, and `983a1f7` “Co-Authored-By: Claude Opus 5.5”.

**Repair:** Replace the sentence by: “AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the `Suggested.lean` headline statements; Claude Fable 5.1 and Claude Opus 5.5 for the review repairs and the grouping of sections; red-team passes applied.”

## Previous findings

- R01 — repaired: `README.md:1422` now cites “Theorem 6.1 and its proof, pp. 12–15, especially … Proposition 6.5 and Corollary 6.6, p. 15 … proof of Theorem 5.3, p. 10 … Lemma 7.1 proof, p. 16, for the quadratic specialization.”
- R02 — not repaired: `Suggested.lean:42`–44 are unchanged, “abbrev Qbar := AlgebraicClosure ℚ” and the two lines after it still without docstrings; written again as R01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §6.2, twist of a newform's representation over K (Sources line changed) | `y² + y = x³ − x² − 10x − 20` at p = 3; its twist by the quadratic character of conductor 5 | Point count over 𝔽₃: 0 + 2 + 2 + 1 = 5, so trace −1, det 3. Twist: χ₅(3) = −1, trace +1, det (−1)²·3 = 3. ψ(Frob₃) = −1 on both sides. | Agrees | none |
| Group sentence of 2.3–2.4: `det ρ_λ = εχ_ℓ`, oddness | complex conjugation; p = 3 with ε = 1 | `det ρ(c) = ε(c)χ_ℓ(c) = 1·(−1) = −1`; `d₃ = ε(3)·3 = 3`, equal to the determinant above. | Agrees | none |
| Group sentence of 2.5–2.8: `a_p = ε(p)ā_p`, F totally real | ε(p) = ζ₃, a_p = 1 + ζ₃ | `εā = ζ₃(1 + ζ₃²) = ζ₃ + 1 = a`; `ε⁻¹ā = ζ₃² + ζ₃ = −1 ≠ a`; `a²/ε = (1 + 2ζ₃ + ζ₃²)/ζ₃ = ζ₃/ζ₃ = 1`, real. | Agrees; excludes ε⁻¹ | none |
| Group sentence of 3.2–3.4: f of level dividing `cond(A)`, `j : K_f ≃ E` | the README's level-23 hypothesis, `a² + a − 1 = 0`, n = 2 | `cond = 23² = 529`; divisors 1, 23, 529; `N_f = 23`; `j(a₂)` is a root of `X² + X − 1`, discriminant 5, so `K_f ≃ ℚ(√5) = E`. | Agrees | none |
| Group sentence of 5.2–5.5: `[c_C]`, α, `ε_C`, `E_α`, R, ω, `Lie(B) ≃ R` | K quadratic, `deg μ = 3`, m = 3 and m = −3; m = 4 | m = 3: `α(σ) = √3`, `ε_C(σ) = 3/3 = 1`, `R = ℚ[X]/(X² − 3) ≃ E_α`, `dim Lie(B) = 2 = dim R`. m = −3: `ε_C(σ) = −1`. m = 4: `R ≃ ℚ × ℚ`, ω onto ℚ, not injective. | Agrees | none |
| “§§… consume” sentences of the five groups against the `*Needs:*` lines | every `*Needs:*` line naming §2.3–2.11, §3.2–3.4, §5.2–5.5 | 2.3: {2.4, 2.6, 2.8, 3.2, 3.4, 5.8}; 2.4: {3.2, 4.3, 5.8}; 2.5: {2.7, 3.5, 4.3}; 2.6: {2.8, 3.9, 5.8}; 2.7: {2.8, 3.3, 3.4, 3.7, 3.9}; 2.9, 2.10: {3.2}; 2.11: {2.3, 3.2, 4.3}; 3.4: {3.5, 3.9, 4.3}; 5.2–5.5 outside the group: {5.6, 5.8}. | Each sentence equals the computed set | none |
| R01, R02 of this report | `#check`-level reading of `Suggested.lean:42`–44 and :89 against `README.md:1083` | Three abbreviations, zero docstrings; Lean title “ℚ-curves as factors of abelian varieties of GL₂-type” versus README title “ℚ-curves, their cocycles and their GL₂-type factors”. | Differ | R01, R02 |

The rows of the previous review for the statements this change does not touch stand as in the previous review, of `bf5759f`.

- Source locators checked against the text: 14, all in `ribet92` (the changed Sources line of §6.2 and the targets under the five group headings): Lemma 3.1 `ribet92 line 177` (p. 4), Lemma 3.2 line 207 and Proposition 3.3 line 222 (p. 5), Propositions 3.4, 3.5 lines 238, 258 (p. 6), Proposition 3.6 and Lemma 3.7 lines 277, 295 (p. 7), Lemmas 4.1, 4.2 lines 314, 321 (p. 8), Theorem 5.3 and the character argument of its proof lines 396–421 (p. 10), Theorem 6.1 line 515 (p. 12), Proposition 6.5 and Corollary 6.6 lines 624, 628 (p. 15), Lemma 7.1 line 674 (p. 16). The seeded targets 3.7, 3.8, 3.9, 4.1–4.5 and 6.1 have no changed passage and were not opened again.
- Library declarations: no Lean statement changed; the nine elaborated signatures were compared with the README again and none lost a binder.
- Cross-roadmap citations: the diff adds none; the resolver reports none unresolved. `TateModule.lambdaTateModule` and `TateModule.residualRep` are names planned by ArithmeticGaloisRepresentations §§6.4 and 6.1, not pinned declarations, as in the previous review.
- Gate at this head: every counter 0, `build=0 OK`. Dependency check: `depcheck: 246 roadmaps, 2257 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `declaration uses sorry` warnings (lines 70, 85, 94), nothing else. No file outside the folder is changed.
- Pull request text: title, summary block and prose read against the head; apart from R04 no sentence is contradicted (the folder is new, 53 headings and 9 declarations added, none removed; conductor `Nⁿ`, least level N, the Γ₀ case, §3.8 and §6.4 are as described).
- Remark: 13 of the 44 targets (2.4, 2.6–2.8, 2.10–2.11, 3.3–3.4, 5.3–5.5) are now bold numbered paragraphs under five group headings; all 44 numbers are still present and the gate's `target-ids` counter is 0.
- Overlap check: read EllipticCurveModularity, EllipticCurveModularityTotallyReal, ClassicalSerreModularity, AutomorphicGaloisRepresentations, EllipticCurveModularityImaginaryQuadratic, ModularForms; nothing shared (EllipticCurveModularity leaves GL₂-type modularity to a separate roadmap).

Source independence: changed passages only; 6 passages (the five group paragraphs and the Sources line of §6.2) compared with 1 source, `ribet92`, none shared; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Ribet80, Shimura71, FW84 and DS05 were not read in the previous review and no changed passage cites them; they were not requested again.

## Source issues

- none

## For the human reviewers

- none
