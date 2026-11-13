# Repair report: red-team round 2 of MappingClassGroupsAndCanonicalRepresentations

Eight findings in two reviews, which overlap in two places. That leaves six distinct findings, settled
below. All edits are in `packages/MappingClassGroupsAndCanonicalRepresentations/README.md` and
`sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## RT-MappingClassGroupsAndCanonicalRepresentations~2a/F02, RT-MappingClassGroupsAndCanonicalRepresentations~2b/F01 (P2) — applied differently

§5.4 (README lines 1697–1732): admissibility via MixedHodgeModulesAndIrregularHodgeTheory §3.3 → new target, the limit theorem for polarizable complex variations on `Δ^*` without quasi-unipotence (`|λ| = 1`; extended Hodge bundles and `F_lim`; limiting mixed Hodge structure; SS22 §§14, 24, 28, 39). Admissibility is defined through it, with LefschetzPencilsAndVanishingCycles §1.5 for (b). Three Checks.

Why "differently": both suggested texts say that the fibre at `0` of the extended Hodge bundles *is*
the limit filtration. That is false in general. Sabbah–Schnell §190 Example (SS22 lines 4051–4063)
gives a variation with residues `0, α` whose fibre is `ℂ(1, 1)` while `F¹_lim = ℂ(1, 0)`. The repair
therefore states `F_lim = lim e^{−zN}Φ(z)` (SS22 line 413), describes it as the graded pieces of the
fibre for the residue-eigenvalue filtration, and adds that example as a Check.

The source is also different. The reviews cite Steenbrink–Zucker, which is uncertified and not
opened. The repair cites Sabbah–Schnell, arXiv:2206.08166v1, an open text fetched as the new key
`SS22`. It proves the results for arbitrary polarized complex variations on the punctured disc, and
its footnote (SS22 lines 84–86) records that Schmid's proof was never adapted to monodromy that is
not quasi-unipotent.

The witness holds. With `f` vanishing transversally on a smooth point of a level chart `M′`, the
system `R¹π°_*(π°^*χ ⊕ π°^*χ⁻¹)` has local monodromy `exp(±2πi√2)` there. The first new Check
records this.

The same pattern elsewhere:
- Supplier contract: the sentence "involve only the complexified local system …" is replaced by
  what §3.2 and §3.3 assume and by LefschetzPencilsAndVanishingCycles §1.5.
- Ownership: the limit theorem is added to what this roadmap owns. The bullet on what it leaves to
  others now cites §§3.1–3.3 and §1.5.
- The *Needs* line of §5.4, Layer 5 *Dependencies* and the Layer 5 introduction are updated.
- The proof route of Landesman–Litt Theorem 4.1.1 goes through Saito's theory, which assumes
  quasi-unipotent local monodromy (Sch19 line 520). It is now scoped to that case, and the source
  gap is entered under *Corrections to the sources*.

## RT-MappingClassGroupsAndCanonicalRepresentations~2a/F01, RT-MappingClassGroupsAndCanonicalRepresentations~2b/F02 (P2) — applied

§5.11 (README lines 2073–2091): "unitary at every complex embedding" → "unitary for every field embedding `ι : K → ℂ`, the real embeddings included" (LL22 lines 1908–1911). Check: "the two complex embeddings … the real embeddings" → "the pair of non-real embeddings (`|λ′| = 1`) … the two real embeddings (`λ ≈ 1.722`, `λ⁻¹ ≈ 0.581`)".

Other places checked: §§7.6 and 7.7 already say "every embedding `τ : K → ℂ`" and need no change.

## RT-MappingClassGroupsAndCanonicalRepresentations~2a/F03 (P3) — applied

§1.4 (README line 954): adds `R_r(Γ)` and the character variety `M_r(Γ)` without determinant equations; `R_r(Γ)_χ` is a closed `GL_r`-stable subscheme, and the three statements hold with the same proofs. New Check: `Γ = ℤ/2`, `r = 2`, three components, split by determinant. §11.5 (line 2957) cites this version.

The ownership line is updated to match.

## RT-MappingClassGroupsAndCanonicalRepresentations~2a/F04 (P3) — applied

§10.3 condition (4), line 2825: "in the `O_K` sense of §5.1" → "`V ⊗_{O_L, ι} ℂ` for a number field `L` … such that every `V ⊗_{O_L, ι′} ℂ` underlies a complex PVHS", plus a sentence separating `L` from the base field `K`. Check (line 2841): "order three … `L = ℚ(ζ₃)`". *Corrections* entry (line 3243) reworded.

*Conventions* line 213 already says "number field `K`" and is unchanged.

One correction beyond the suggested text: the base field `K` can be a number field when
`(g, n) = (0, 3)`, where `M_{0,3}` is a point. So the README does not say that `K` never has a ring
of integers. It says that `K` contains the function field of `M_{g,n,ℚ}`, of transcendence degree
`3g − 3 + n`.

## RT-MappingClassGroupsAndCanonicalRepresentations~2a/F05 (P3) — applied

§9.9 Check, line 2741: "`G = ℤ^N` … recovers finiteness of `GL_N(ℤ)`-finite characters" → the same claim for `N ≥ 2`. Added: for `N = 2` a transvection sends `(λ, μ)` to `(λ, λ^k μ)`, forcing roots of unity; for `N = 1`, `1 ↦ 2` has orbit `{2, 1/2}` and infinite image, outside the range (`g = 0`).

## RT-MappingClassGroupsAndCanonicalRepresentations~2b/F03 (P3) — applied

§0.2, README lines 651–655: "`PMod(1, 0, 0) ≅ SL₂(ℤ)` inside `Mod(T²) ≅ GL₂(ℤ)`" → "`PMod(1, 0, 0) = Mod(1, 0, 0) ≅ SL₂(ℤ)`, of index two in GeometricTopology's `Mod(T²) ≅ GL₂(ℤ)`", with a clause that the `Mod` of *Conventions* and MordellLawrenceVenkatesh §5.9 excludes orientation-reversing classes.

The torus line at README line 311 sits inside the GeometricTopology contract and is correct as it stands. Line 2263, the symplectic image of `Mod(Σ_g)`, uses the orientation-preserving `Mod` and is consistent.

## Checks run

- **Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout, gave only the
  five intended `declaration uses 'sorry'` warnings (lines 176, 190, 205, 214, 227) and no errors.
  The file imports nothing beyond `import Mathlib`.
- **Mechanical `#check`.** I wrote one scratch file with `Suggested.lean` followed by `#check @name`
  for all 13 declarations, including `instGroupSurfaceGroup`, and elaborated it once. Every
  elaborated type is identical to the worker's signature table and agrees with its README
  statement. Nothing changed, because this round makes no edit to `Suggested.lean`. None of the
  findings asks for one: the new limit theorem is a foundational target, not a headline, and is
  not statable at the pins anyway, since Mathlib has no variations of Hodge structure.
- **Dependency check.** The exact output:

  ```text
  depcheck: 207 roadmaps, 1915 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The suppliers added this round are earlier in
  `merge-order/ORDER.txt`: LefschetzPencilsAndVanishingCycles (line 69) and
  MixedHodgeModulesAndIrregularHodgeTheory (line 261), against line 291 for this roadmap.
- **Citation resolver.** It reports one lead, "144: MixedHodgeModulesAndIrregularHodgeTheory §§3.1:
  no roadmap … on main or in an open pull request". This is the same false positive as last round.
  The roadmap is a board package (`packages/MixedHodgeModulesAndIrregularHodgeTheory`), at
  merge-order line 261, and I read its §§3.1–3.3 there.
- **Gate failures.** None were listed in the brief.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Limit thm (i), `|λ| = 1` | rotation by `2π√2`; rank one with monodromy `2` | `|exp(±2πi√2)| = 1`; `|2| ≠ 1`, and a rank-one variation is unitary (§5.1), so it is not polarizable | holds; the second is a negative Check |
| Residues are real | `λ = exp(−2πiα)` | `|λ| = e^{2π Im α} = 1` forces `Im α = 0` | holds |
| Limit thm (ii), extension and `F_lim` | rotation; SS §190 with `S = diag(0, α)`; unipotent `T` (`S = 0`) | `F⁰ = Ē`, `F¹ = 0`; fibre `ℂ(1,1)` but `F_lim = lim ℂ(1, e^{αz}) = ℂ(1,0)`; `F_lim = Ψ_S(0)` | holds; fibre ≠ `F_lim` in general (Check) |
| Graded-piece description of `F_lim` | `v = (1,1)`, components at `0` and `α` | `e^{−xS}v = (1, e^{−xα})` tends to `(1, 0)` as `x → ∞`; lowest residue leads | matches SS22 line 413 |
| Limit thm (iii), the weights | `k = 0`, `N = 0` | `M_0 = Ψ`, `M_{−1} = 0`: pure of weight 0 | holds |
| Rotation residues (`T = exp(−2πi Res)`) | eigenvalue `e^{2πi√2}`; eigenvalue `e^{−2πi√2}` | `α = 2 − √2 ≈ 0.586`; `α = √2 − 1 ≈ 0.414`, sum `1` | holds |
| Witness `R¹π°_*(V ⊕ V^∨)` | `f` transversal at a smooth point of `M′` | the family is smooth over the disc, so `R¹π°_*ℂ` has trivial local monodromy; eigenvalues `exp(±2πi√2)` | holds |
| Admissibility (a)+(b) | constant variation; `N(e₁) = e₀` with `W₀ = ℂe₀`, `W₁ = ℂ²` | `N = 0`, `M = W` exists; no `M` (LefschetzPencils §1.5 Check) | definition discriminates |
| Scope of the Saito route | quasi-unipotent `V` vs `π°^*χ` | Sch19 line 520 needs roots of unity; `exp(2πi√2)` is not one | route scoped, correction recorded |
| §5.11 criterion | Salem `λ`: `y² − y − 3`, `y ≈ 2.303, −1.303` | `x ≈ 1.722, 0.581` real; the non-real pair has modulus 1; hypothesis fails at the real embeddings | holds, both directions |
| §1.4 without determinant | `ℤ/2`, `r = 2` | `I`, `−I`, orbit of `diag(1, −1)` (dim `4 − 2 = 2`): 3 components, `M_2` = 3 points; `χ = 1` gives `±I`, `χ(s₁) = −1` gives the orbit | consistent with the existing `χ`-Check |
| §11.5 properness | `⟨u, l⟩ ⊕ 1^{r−2}` on `F₂` | irreducible, so the orbit is closed; a fibre of `π` meeting the closed invariant Jordan locus `Z` would put the closed orbit in `Z`, contradiction | proper |
| §10.3 (4) | `(g, n) = (0, 3)`; `(1, 1)`; order-three character | `3g − 3 + n = 0`, so `K = ℚ` is possible; tr.deg `≥ 1`; `L = ℚ(ζ₃)` | statement scoped; the reviewer's "no ring of integers" corrected |
| §9.9 Check | `N = 1, 2, 3` | `g = 0` (`r = 1` excluded); `g = 1`, `(λ, λ^k μ)`; `g = 1` | holds for `N ≥ 2` |
| §0.2 torus | `p = 0`, `b = 0`, `g = 1` | `PMod = Mod(1,0,0) = SL₂(ℤ)`, index 2 in `GL₂(ℤ)` | consistent with *Conventions* and GeometricTopology §1.7.2 |

## Sources

- **Added:** `SS22`, C. Sabbah and C. Schnell, *Degenerating complex variations of Hodge structure
  in dimension one*, arXiv:2206.08166v1. It was fetched through the sources service and is
  certified, open repository. The locators are its numbered paragraphs: §14 and §64 Proposition,
  §24 Theorem, §28, §39 Theorem, §190 Example. The README *References* list now includes it.
- **Re-read:** LL24 lines 1001–1043, LL22 lines 1908–1911, Sch19 lines 520 and 1493.
- `needs-references.toml` lists nothing missing.

## Ownership

- **Limit theorem.** I grepped all roadmaps on main and at the open heads (`roadmaps grep`) and the
  board packages for "nilpotent orbit theorem" and "not quasi-unipotent" with Hodge limits. No
  roadmap owns the limit theorem for monodromy that is not quasi-unipotent.
  MixedHodgeModulesAndIrregularHodgeTheory §3.2 (rational, quasi-unipotent) and ShimuraVarieties
  §3.5b.1 (unipotent) own the special cases. §5.4 owns the general case and says in one clause how
  it differs.
- **Character varieties.** No owner was found for character varieties of finitely presented groups
  without fixed determinant. RealSemisimpleLieGroups defers surface-group character varieties to
  others. §1.4 already owned the fixed-determinant version.
- **Lean names.** No fully qualified Lean name changed.

## For the maintainer

- **MixedHodgeModulesAndIrregularHodgeTheory §3.2** (another package; not edited). It says the
  extended Hodge bundles in `Ē` "define a limit Hodge filtration `F_lim` on `Ψ`" and then uses
  `(Ψ_λ, F_lim, M)`. Read literally, this takes the fibre at `0` as the limit. Sabbah–Schnell §190
  shows that the fibre of the canonical extension need not be `T_s`-stable when an eigenvalue other
  than `1` occurs. The limit on `Ψ_λ` is its graded piece (SS22 line 413), or comes from the cover
  as in that section's proof route. That package may want to state this precisely. §5.4 cites §3.2
  only as "the setting of" the rational quasi-unipotent case, so nothing here depends on the
  literal reading.
- **Residual gap in §5.4, not raised by either review.** Admissibility of `R¹π°_* V_ℝ` for unitary
  `V` with local monodromy that is not quasi-unipotent has no named proof route. Landesman–Litt's
  route through Saito's theory needs quasi-unipotence. The README now says so and records it under
  *Corrections to the sources*, but no supplier or target provides mixed Hodge modules with real
  coefficients and arbitrary eigenvalues of modulus one. A later round may need either a supplier
  gap to MixedHodgeModulesAndIrregularHodgeTheory or a target here.
- **Consequences for other roadmaps.** No section number, heading or Lean name of this roadmap
  changed, so no citing roadmap is affected. §1.4's heading is kept as it was.
- **Ownership against open pull requests.** Checked through the `roadmaps grep` index, which
  covers 437 open pull requests at their heads, plus the listed sibling checkouts. I read
  LefschetzPencilsAndVanishingCycles §1.5 at its open head through `roadmaps show`, and
  MixedHodgeModulesAndIrregularHodgeTheory in the board checkout.
- **Untrusted text.** No suspicious instructions were found in the reviews or in any fetched text.
