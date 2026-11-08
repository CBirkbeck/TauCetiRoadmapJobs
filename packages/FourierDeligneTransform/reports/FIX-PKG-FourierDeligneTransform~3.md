# FIX-PKG-FourierDeligneTransform~3

One review was resolved: `REV-PKG-FourierDeligneTransform~2`, which has one finding.

## REV-PKG-FourierDeligneTransform~2/F01 (P3) — applied

The finding is right. LAU87 Corollaire (1.2.2.5) (LAU87 lines 445–449) states only `Rπ'_!FT(K) ≅ σ^*K(−r)[−r]`. Its proof applies (1.2.2.4) to `π'` and then uses (1.2.2.1). KL85 (2.1.5) (KL85 lines 388–393) and BRY86 9.4–9.5 (BRY86 lines 3449–3456) do not state `σ'^*FT(K)` either.

Changes in `packages/FourierDeligneTransform/README.md`, §3.4:

- Old: "Prove also … and `σ'^*FT_ψ(K) ≅ Rπ_!K[r]` (LAU87 Corollaire (1.2.2.5), …)".
- New: the (1.2.2.5) locator is attached to the first isomorphism only. The second is justified as proper base change of `Rpr'_!` along `σ'`, using the restriction `Λ` of the kernel (§3.1 API), and as the case `f = π : V → S` of LAU87 Théorème (1.2.2.4), LAU87 lines 435–444.
- A Check for the zero-section values was added.
- §2.4 was added to the Needs line. The route already used §2.4 but the line did not list it.

I used both routes the reviewer suggested and added the (1.2.2.4) locator, so the second statement has a source too:
- In (1.2.2.4), take `E_1 = V`, `E_2 = S` (rank 0) and `f = π`. The transpose of `π` is `σ'`, and the transform on the zero bundle is the identity.
- This gives `Rπ_!K ≅ σ'^*FT(K)[0 − r]`, which is the stated isomorphism.

## Pattern repair

I searched the whole README for the same defect: one locator placed after several statements when the source states only some of them.

**§3.2 had the same defect, now fixed.** The locator for LAU87 Définition (1.2.1.1) and KL85 (2.1.1)–(2.1.2) came after two claims that neither text states: `FT_ψ(σ_*M) ≅ π'^*M[r]` and `FT_{ψ^{−1}} ≅ [−1]^* ∘ FT_ψ`. The fix:
- The locator now sits on the definition sentence.
- The first claim gets its route: proper base change `pr^*σ_*M ≅ (σ × id)_*π'^*M`, the projection formula for the closed immersion `σ × id`, and the kernel restricting to `Λ` on `σ(S) ×_S V'`. For `M = Λ` it is LAU87 Proposition (1.2.3.1) with `s = 0`, LAU87 lines 477–480.
- The second claim gets its route: `ℒ_{ψ^{−1}}(f) ≅ ℒ_ψ(−f)` (§2.5), bilinearity (§3.1), and base change along the automorphism `[−1]` of `V'`.
- §2.5 was added to §3.2's Needs line.

**No other occurrence.**
- LAU87 (1.2.2.5) is cited nowhere else.
- In §3.8, the trace forms of §§3.4–3.6 come after the (1.2.1.2) locator, not under it.
- The other compound locators in §§3.3, 3.5 and 3.6 each cover what they are attached to. I re-read KL85 lines 372–393 and LAU87 lines 378–391 and 401–518 to confirm this.

## Adversarial pass on the new and changed text

The statements themselves are unchanged; only their justification and locators are new. I recomputed each one below.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §3.4 `σ'^*FT(K) ≅ Rπ_!K[r]` | `r = 1`, `K = i_{a*}Λ` with `a ≠ 0` | left `σ'^*ℒ_ψ(a x')[1] = Λ[1]`; right `Rπ_!(i_{a*}Λ)[1] = Λ[1]` | holds | new Check |
| same | `r = 1`, `K = Λ[1]` | left `σ'^*σ'_*Λ(−1) = Λ(−1)`; right `Λ(−1)[−2][2] = Λ(−1)`; with the shift `[−r]`, `Λ(−1)[−2]` | holds; the shift is pinned | new Check |
| same | `r = 0` | `σ' = id` and `FT = id`, so both sides are `K` | holds | none |
| same, on functions | `S = Spec 𝔽_q`, value at `0'` | `(−1)^r Σ_e t_K(e)ψ(0) = (−1)^r Σ_e t_K(e) = t_{Rπ_!K[r]}` | holds | none |
| same, via (1.2.2.4) | `E_1 = V`, `E_2 = S`, `f = π`, `f^∨ = σ'` | `FT^S(Rπ_!K) = σ'^*FT(K)[0 − r]`, with `FT^S = id` | holds | locator |
| §3.4 `Rπ'_!FT(K) ≅ σ^*K(−r)[−r]` | `K = i_{0*}Λ`; `K = i_{a*}Λ` with `a ≠ 0`; `K = Λ[1]` | `Rπ'_!Λ[1] = Λ(−1)[−1] = σ^*δ_0(−1)[−1]`; `Rπ'_!ℒ_ψ(a x')[1] = 0 = σ^*δ_a` by §2.4; `Rπ'_!σ'_*Λ(−1) = Λ(−1) = Λ[1](−1)[−1]` | holds | new Check |
| §3.2 `FT(σ_*M) ≅ π'^*M[r]` | `r = 1`, `M = Λ`; `M` arbitrary; `r = 0` | `FT(δ_0) = Λ[1]` (the §3.2 Check); stalkwise `(σ×id)_*A ⊗ B = (σ×id)_*(A ⊗ (σ×id)^*B)`, with no Tor hypothesis needed for a closed immersion; `id` | holds | route and locator |
| §3.2 `M = Λ` against (1.2.3.1) | `F = 0`, `s = 0`, `F^⊥ = E^∨` | `FT(Λ_{V(0)}[0]) = Λ_{V'}(0)[r]` | agrees with §3.6 sub-bundles | locator |
| §3.2 `FT_{ψ^{−1}} ≅ [−1]^*FT_ψ` | `δ_a`, `r = 1` | `ℒ_{ψ^{−1}}(a x')[1] = ℒ_ψ(−a x')[1] = [−1]^*ℒ_ψ(a x')[1]` | holds; agrees with the §5.2 API row `[−1]^*FT(δ_a) = FT(δ_{−a})` | route |

## Checks

**Elaboration.** I ran `lake env lean` on `packages/FourierDeligneTransform/Suggested.lean` from the content checkout.
- Result: exit 0, no output, 31 s wall time.
- `Suggested.lean` was not changed. It declares nothing, so the `#check @name` comparison of elaborated signatures has nothing to compare, and no binder changed.

**Direction check** (`gate --depcheck … --movable`):

    depcheck: 244 roadmaps, 2459 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. No supplier or Needs line was added that names anything outside this roadmap: §2.4 and §2.5 are this roadmap's own sections, and EtaleCohomologyFoundations §§0.8 and F.2.1 were already cited.

## Gate failures

None were listed.

## Notes for the maintainer

**Unchanged files.**
- `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` were not edited. The gaps are unchanged.
- No new source was needed: LAU87 and KL85 are already in the manifest, and so is BRY86, which was read for the F01 check only and is not cited in the new text. No `needs-references.toml` entries were written.

**No section ids or names changed.** No section, target or Lean name was added or removed, so other roadmaps' citations of this roadmap are not affected.

**Ownership.** No new object was introduced, so the ownership position is unchanged. The overlap report lists no open pull request that changes this roadmap and no dropped id.

**Lean-name leads in `scratch/citations.md`.** I checked them:
- `VanishingCycles.*`, `ClassicalAlgebraic.*` and `PerfectComplex.lefschetzNumber` occur in `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` on main.
- `Lang.lang_surjective` occurs in `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` on main.
- `VanishingCycles.etaleTraceFormulaFinite` and `VanishingCycles.etaleTraceFormula` are named targets of InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T3 at that roadmap's open head.
- None of them is a pinned-library name or a name of this roadmap, so these leads are not defects.
