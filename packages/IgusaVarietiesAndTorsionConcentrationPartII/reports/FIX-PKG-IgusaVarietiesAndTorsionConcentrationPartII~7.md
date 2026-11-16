# FIX-PKG-IgusaVarietiesAndTorsionConcentrationPartII~7

Findings of REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~6 (four findings: one P2, three P3). Each was checked against the sources and the suppliers at their current heads, and all four are applied. One further hypothesis, found while testing the F01 repair, is recorded under F01.

## F01 (P2) — applied

**Verified.** Layer 9 uses `S′_fin ⊂ Spl_{F/F⁺}`, so it needs `Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}`. The source makes this choice at CS17 lines 3460–3462 (p. 735, citing Shin's Lemma 7.1) and uses `S_fin ⊂ Spl_{F/F⁺}` for the base-change transfer at CS17 lines 3517–3523. EndoscopicTransferAndUnitaryTraceComparison §6.3, read at its head, states only that `Ram_ℚ(ϖ)` is finite. `Spl` does not occur anywhere in that README. The only supplier of the choice is gap:auxiliary-character-finite-avoidance with `D = ∅`.

**Changed.**
- Conventions: the parenthetical now says such a `ϖ` exists by the gap with `D = ∅`, and that §6.3 gives only finiteness.
- Gap contract: the last sentence now reads "needed with `D = ∅` by Layer 9 and §11.4 in Case 2 …, and with `D ≠ ∅` by §§11.5–11.8".
- Scope: the gap is described as "ramification inside `Spl_{F/F⁺}` and avoiding a prescribed finite set".
- Layer 9 header: a sentence deriving `S′_fin ⊂ Spl_{F/F⁺}` from the three ingredients, and the gap dependency.
- The gap is added to the §9.1 *Needs* line, the Layer 9 Dependencies and the §11.4 *Needs* line ("in Case 2").
- §11.6: "with all of Layer 9, on gap:auxiliary-character-finite-avoidance".

**Same pattern elsewhere.**
- §11.4: the statement now says "for a `ϖ` as in the Conventions, so that `S′_fin ⊂ Spl_{F/F⁺}`".
- §11.5 step 3: "choose `ϖ` as in the Conventions (gap … with `D = ∅`)".
- Layer 10 (Case 1) needs no change. Its only surviving term is the trivial endoscopic datum, whose embedding does not involve `ϖ`, and it never forms `S′`.

**Found in the adversarial pass of the repair.** As written, the gap could not be satisfied without the Case 2 ramification condition. The restriction of `ϖ` to `𝔸_ℚ^×` is `ω_{𝒦/ℚ}`, which is nontrivial on `ℤ_q^×` at every `q` ramified in `𝒦`, so `Ram_ℚ(ϖ) ⊇ Ram(𝒦/ℚ)`. Shin's own proof assumes that ramified primes lie in Spl: Shin11 lines 3476–3477, together with (4.1) at Shin11 line 1397.

Changes:
- The gap contract in the README and the `needs` of `auxiliary-character-finite-avoidance` in `design/plan.json` now begin "In the Case 2 setting of §8.1, where every rational prime ramified in `F` lies in `Spl_{F/F⁺}` and in `S`, …".
- The Conventions now say "In the trace layers of Case 2".
- A counterexample is recorded in the gap contract: `𝒦 = ℚ(i)` and `F⁺ = ℚ(√5)`, with `q = 2`. Supplier, section and slug are unchanged.

## F02 (P3) — applied

**Verified.** CS17 line 4065 cites Section 6 of Shin's 2012 paper. Its condition (B2) is at Shin12 line 981, on author p. 20 (the page-20 marker is at line 953). Shin09 Lemma 6.4 is at Shin09 line 879, author p. 20.

**Changed.**
- §10.1: "Shin's 2012 paper, §6" → "[Shin12] §6 (CS17 line 4065), whose standing condition (B2) (author p. 20, Shin12 line 981) takes `p` inert in `F⁺`".
- A **[Shin12]** entry is added to References: AJM 134 (2012), doi:10.1353/ajm.2012.0009, with locators referring to the author's copy.
- The two unkeyed mentions of *Counting points on Igusa varieties* are now keyed. The contract §8.11 line and §10.2 read "[Shin09] Lemma 6.4, author p. 20, Shin09 line 879". In §10.2, CS17's label "[Shi11]" is now written as our key [Shin11], citing CS17 lines 4077–4078.
- `sources.toml`: the `Shin12` locator is now "Section 6, condition (B2), p. 20 (author copy)".

## F03 (P3) — applied

**Verified.** At the head of AlgebraicModularFormsAndSerreWeights, R15.5 is "Layer 5: Deligne–Serre eigenvalue lifting". The target used is "### 5.10 Deligne–Serre eigenvalue lifting". The phrase "the lifting lemma and its sharp limits" occurs only in the layer's prose.

**Changed.** The supplier contract, the §11.4 route and the §11.4 *Needs* line now cite "R15.5, §5.10 «Deligne–Serre eigenvalue lifting»". The Layer 11 Dependencies cite "R15.5, §5.10". The contract bullet now states §5.10's actual hypotheses: a DVR `O`, a finite free module, and a nonzero common residual eigenvector with eigenvalues in the residue field.

**Found in the adversarial pass.** §5.10 needs residual eigenvalues in the residue field `κ` of `O`. Over `ℤ_ℓ` with `κ(𝔪^∨) ≠ 𝔽_ℓ` there may be no such vector: an operator whose characteristic polynomial is irreducible over `𝔽_ℓ` has no eigenvector over `𝔽_ℓ`. §11.4 therefore now applies §5.10 to `O ⊗_{ℤ_ℓ} H^{d_b}_c(…)_{𝔪^∨}`, where `O` is the unramified extension with residue field `κ(𝔪^∨)`. The identity factor of `κ ⊗_{𝔽_ℓ} κ` provides the required eigenvector.

**Same pattern elsewhere.** I checked every other «…» title the README cites against its heading at the supplier's head. The AG2.2, AG2.3, AG2.5, AG2.7 and AL.3 titles match, and SR.5.2's is a bold target label. One AG2.5 heading is spelled "Caraiani’s" with a typographic apostrophe; the README now uses that spelling in all four places.

## F04 (P3) — applied

**Verified.**
- CS17 lines 4030–4032, on printed p. 748 (page marker 100), give the one-point set for central `μ_i` in the proof of Theorem 5.5.7.
- Shin09 Definition 5.2, lines 570–575 on author p. 13, asks for positivity of `⟨v, h(√−1)w⟩` and nothing like SV3.
- Shin09 Definition 5.3, line 703 on author p. 16, defines the Igusa varieties on that datum.

**Changed.**
- §8.9: "Prove the following." now carries a parenthetical with these locators. It says the finiteness, cohomology and Igusa-pullback statements are deduced from the *Needs* suppliers and are not stated in [CS17].
- `sources.toml`: "8.9" is added to `cited_for` of `CS17` and `Shin09`, and "Definition 5.3, p. 16" to the `Shin09` locator.

## Checks

- **Elaboration.** `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout, exits 0. Its only output is `declaration uses 'sorry'` at lines 79 and 91. There are no `TauCeti.*` imports, and the file is unchanged this round.
- **Signatures.** I put `#check @name` for all four declarations in one scratch copy and elaborated it once (exit 0). Every type keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`, and both theorems keep their existential hypotheses. They agree with README §§8.7–8.8. Nothing changed.
- **Dependency check**, complete output:

  ```text
  depcheck: 245 roadmaps, 2248 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` finds no unresolved cross-roadmap citation and no unknown Lean name.
- **Sources.** No new text was fetched, all locators were read in the cached texts, and `needs-references.toml` was not written.
- **Ownership.** No new target or construction was added. The changes are dependency records, citations and one hypothesis on an existing gap, so there was no new ownership question. The suppliers cited were read at their heads: EndoscopicTransferAndUnitaryTraceComparison, AlgebraicModularFormsAndSerreWeights, AutomorphicGaloisRepresentationsPartII and AutomorphicLFunctionsAndLocalFactors at their open pull-request heads, and SmoothRepresentationsOfLocalGroups on main.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| `S′_fin ⊂ Spl_{F/F⁺}` (Layer 9 header) | `p` split in `𝒦`, place `w` of `F⁺` above `p` | `F ⊗_{F⁺} F⁺_w = (𝒦 ⊗ ℚ_p) ⊗_{ℚ_p} F⁺_w = F⁺_w × F⁺_w`: split | `p ∈ Spl`; with `S ⊂ Spl` (Case 2) and the gap, the inclusion holds; none |
| `Spl_{F/F⁺}` vs `Spl_{𝒦/ℚ}` | `𝒦 = ℚ(i)`, `F⁺ = ℚ(√5)`, `q = 3` | 3 inert in `F⁺` (5 is a non-residue mod 3); `F⁺_w = ℚ_9 ∋ √−1` | `3 ∈ Spl_{F/F⁺}` but `3 ∉ Spl_{𝒦/ℚ}`; the sets differ, so the README keeps both; none |
| Gap at `D = ∅` without the Case 2 hypothesis | same fields, `q = 2` | `ω_2` ramified, so `2 ∈ Ram_ℚ(ϖ)`; 2 inert in `F⁺`, `F⁺_w = ℚ_4`, `ℚ_4(i)/ℚ_4` has `e = 2` | `2 ∉ Spl`: no `ϖ` exists; **hypothesis added** to gap and plan |
| Gap with the Case 2 hypothesis | `𝒦 = ℚ(i)`, `F⁺ = ℚ(√7)`, `q = 2` | `7 ≡ −1` mod 8, so `−7` is a square and `√7 ∈ ℚ_2(i)`; `F⁺_w = ℚ_2(i)` and `F_w` splits | `2 ∈ Spl`, so a prime ramified in `𝒦` can lie in `Spl_{F/F⁺}` and the forced `2 ∈ Ram(ϖ)` is allowed (this `F` still fails the Case 2 condition at 7, since `−1` is not a square mod 7); none |
| Gap avoidance `Ram ∩ D = ∅` | `D` disjoint from `S` | `Ram(𝒦/ℚ) ⊂ Ram(F/ℚ) ⊂ S`, so `D ∩ Ram(𝒦/ℚ) = ∅` | the forced primes never collide with `D`; none |
| §5.10 applied to the §11.4 lattice | `κ(𝔪^∨) = 𝔽_{ℓ²}`; `T` acting on `𝔽_ℓ²` by a matrix with irreducible characteristic polynomial | eigenvalues lie in `𝔽_{ℓ²} ∖ 𝔽_ℓ`, so there is no eigenvector over `𝔽_ℓ`; over `W(𝔽_{ℓ²})`, `κ ⊗_{𝔽_ℓ} κ ≅ κ × κ` and the identity factor gives one | hypothesis of §5.10 fails over `ℤ_ℓ`; **scalar extension added** |
| §5.10 when `κ(𝔪^∨) = 𝔽_ℓ` | `O = ℤ_ℓ` | `O ⊗ M = M`, and the `𝔪^∨`-torsion of the nonzero reduction gives the vector | unchanged route; none |
| §10.1 (B2) remark | Shin12 (B2) at line 981; CS17 line 4065 | (B2): `p` inert in `F⁺` and split in `K`; the README's index argument uses neither | claim correct; none |
| §8.9 central `μ_i` | `n = 2`, signatures `(2,0)` and `(0,2)` | `μ_i = z` or `0`; `B(G_i, μ_i⁻¹)` has one element, as CS17 lines 4030–4032 say | locator matches; none |

## For the maintainer

- `design/plan.json`: the `needs` sentence of `auxiliary-character-finite-avoidance` gained the Case 2 ramification hypothesis. Slug, supplier and section are unchanged. EndoscopicTransferAndUnitaryTraceComparison now faces a weaker request than before.
- No Lean name changed. The cross-roadmap identifiers of this roadmap are unchanged, and no other roadmap needs an update.
- No suspicious instructions were found in the review text.
