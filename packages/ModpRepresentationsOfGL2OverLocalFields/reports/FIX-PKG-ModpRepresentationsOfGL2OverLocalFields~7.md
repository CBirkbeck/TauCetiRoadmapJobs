# FIX-PKG-ModpRepresentationsOfGL2OverLocalFields~7

Findings of REV-PKG-ModpRepresentationsOfGL2OverLocalFields~6 (four: one P1, three P3). Edited:
`packages/ModpRepresentationsOfGL2OverLocalFields/README.md`, `design/plan.json` (top-level `gaps`
only), `sources.toml`. `Suggested.lean` and `metadata.toml` are unchanged.

## F01 (P1) — applied differently

Verified. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 at the head of its open pull request
(`TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md` l. 8196–8262) states only
irreducibility or length two of `I(σ)/(T − λ)`, with the exceptional set in the `GL₂(ℚ_p)` labels
`(r, λ)`. It names no principal series and makes no finite-presentation statement.
PadicLocalLanglandsForGL2Qp §§2.6–2.7 are `F = ℚ_p` only. `roadmaps grep` finds no other owner. On
the review's suggested gap: as worded, it is not enough. "Every irreducible quotient of some
`I(σ)/(T − λ) ⊗ χ`, `λ ≠ 0`, is ordinary" does not reach a non-supersingular `π` unless every
irreducible is first shown to be such a quotient, and R07.5.15 does not state that for general `F`.
So I stated the gap with the conclusion that §2.4 actually uses.

Changes:
- Old: the contract for R07.5.15 claimed "the Barthel–Livné classification of the quotients
  `I(σ)/(T − λ)`". New: it lists only the declarations R07.5.15 provides and defines
  *supersingular* (CDN23, §1.2.1, p. 11).
- New gap `barthel-livne-ordinary-classification` (README contract and `plan.json`). Every
  non-supersingular irreducible with central character is `χ∘det`, `St ⊗ χ∘det` or
  `Ind_B^G(χ₁ ⊗ χ₂)` with `χ₁ ≠ χ₂`.
- New gap `ordinary-irreducible-hecke-presentation`. Each irreducible principal series and each
  Steinberg twist is `I(σ) ⊗ (χ′∘det)` modulo a finitely generated subrepresentation.
- New §2.4 target with route, `*Needs:*` and three Checks. For every finite `F`: characters,
  Steinberg twists, principal series and `Ind_{B̄}^G U` (`U` of finite length over `𝒪`) lie in
  `𝒞_𝒪(G)`.
- §2.4 Lemme 1.29 route, §2.4 last Check, §2.5 route and `*Needs:*`, Scope, Layer 2 Dependencies
  and the Layer 2 Examples now point at the gaps and the new target.

Why "applied differently":
- The review's second gap ("a principal series is a quotient of some `I(σ)` by a finitely generated
  subrepresentation") would cover `Ind_B^G(χ ⊗ χ)` too. No legal source I could read states that
  reducible case for general `F`.
- So the gap covers irreducible principal series and Steinberg twists, which is exactly what HU12,
  proof of Théorème 3.27, p. 29 (HU12 lines 1674–1689) states via Barthel–Livné Th. 30.
- The reducible `Ind_B^G(χ ⊗ χ)` is then an extension of `St ⊗ χ∘det` by `χ∘det`. It is finitely
  presented by §0.4.
- Admissibility is not part of the gap. It comes from SmoothRepresentationsOfLocalGroups
  *induction-exactness* ("for H\G compact both preserve admissibility"; EMERTON1, Propositions 4.1.5,
  p. 27, and 4.1.7, p. 29, lines 1279, 1345).

Evidence read: CDN23 lines 485–497 (the four classes; supersingular means a quotient of `I(σ)/(T)`),
534–535 (ordinary irreducibles are admissible and finitely presented, also for `F ≠ ℚ_p`), 855–864
(Lemme 1.29), 912–916 (Proposition 1.33 needs `Ind_{B̄}^G Ord(π) ∈ 𝒞`). HU12 lines 974–976 and 1669
(BL Th. 33–34), 2360–2362 (§5.1, p. 42). BP12 line 1705 (BL Cor. 36, p. 44).

## F02 (P3) — applied

§9.2 Check, old → new: "force `p ≥ 15`" → "force `p ≥ 14`, that is `p ≥ 17`: `p = 13` leaves
`5 < r_i < 6`, empty, and `p = 17` gives `r_i ∈ {6, …, 9}`". Other occurrences of the pattern were
recomputed and are correct:
- §3.1: `N`-deep needs `p ≥ 2N + 2`.
- §7.5: `2 < r_i < p − 3` gives `p ≥ 7`.
- §9.1: `2 < r_i < p − 4` gives `p ≥ 8`.

## F03 (P3) — applied

- Added References entries:
  - **SERRE-TREES**: Astérisque 46; Chapter II, §1.4, Théorème 3 and Corollaire 1 (SERRE-TREES lines
    3281–3291).
  - **BARTHEL-LIVNE94**: Duke Math. J. 75, 261–292.
- Wrote the keys in §0.5: Ihara's theorem at Corollaire 1, `G₀ = K *_I K^α` at Théorème 3, and the
  `*Needs:*` line.
- Wrote BARTHEL-LIVNE94 in the contract (Proposition 18) and in §1.1.
- Same pattern elsewhere:
  - §1.1 cited "(Barthel–Livné, Breuil)" for the `ℚ_p` classification. It now cites
    PadicLocalLanglandsForGL2Qp §2.7, which was already in its `*Needs:*`.
  - The contract's "Dotto–Emerton–Gee, Lemma 4.2.1" is now "DEG, Lemma 4.2.1".
- Manifest updates:
  - SERRE-TREES: title corrected to "Arbres, amalgames, SL2"; venue, locator and `cited_for` added.
  - BARTHEL-LIVNE94: venue, locators (Th. 30, 33–34, Cor. 36 as HU12 and BP12 number them) and a
    version note added.

There are now 19 References entries for 19 manifest keys.

## F04 (P3) — applied

§2.4 Le Check, old → new: "contains `⊕ D₀(ρ̄)`" → `D₀(ρ̄)` is "the finite-dimensional `KZ`-module
that BP12, Theorem 13.8, p. 79, attaches to `ρ̄` (LE19, §2.1, p. 3)". For `μ − η` 1-deep it is
§3.5's `D₀(W(ρ̄))`, inflated to `KZ` with `p` acting trivially, since `W(ρ̄)` is then the
Buzzard–Diamond–Jarvis set (§3.4). Sources: BP12 lines 3155–3163; LE19 lines 106–110.

## Checks run

- **Elaboration** (`lake env lean` on `Suggested.lean` from the content checkout): exit 0. The only
  output is seven `declaration uses 'sorry'` warnings, at lines 104, 121, 133, 151, 166, 180 and 202.
  The file is unchanged this round.
- **`#check @name`**, all 12 declarations, on a scratch copy: exit 0. The elaborated types are
  character-for-character identical (after whitespace normalisation) to the worker's
  `signatures.md`. No binder lost; nothing changed.
- **Dependency check**:

  ```text
  depcheck: 223 roadmaps, 1983 edges, 0 problem(s)
  ```

  Exit code 0. There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Style**: no LaTeX delimiters, process words or machine paths in the edited files. The one line
  over 110 characters (l. 1505) predates this round.
- **Gate failures**: none were listed for this round.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| gap `barthel-livne-ordinary-classification` | `F = ℚ_p`; trivial character; Le's `π` (`ℚ_{p³}`) | ℚ_p: the list matches PadicLocalLanglandsForGL2Qp §2.7 minus supersingulars. `1`: augmentation sends `T` to `q + 1 = 1 ≠ 0`, so `T·I(1)` maps onto `1` and `1` is not a quotient of `I(1)/(T)`, as required. Le's `π`: supersingular, so outside the conclusion, consistent with it being non-admissible | holds |
| gap `ordinary-irreducible-hecke-presentation` | `St` over `ℚ_p`, `ℚ_2`, `ℚ_{p²}`; PS with `χ₁ ≠ χ₂` | ℚ_p: `σ = Sym^{p−1}`, dim `p = q`, `λ = 1`, `Π(p−1,1,1)` has trivial sub and `St` quotient (PadicLocalLanglandsForGL2Qp §2.7), so one extra generator. ℚ_2: dim `2 = q`. ℚ_{p²}: `Sym^{p−1} ⊗ Sym^{p−1,(1)}`, dim `p² = q`. PS: image of `T − λ`, `λ ≠ 0` | holds. The reducible PS was excluded from the gap (no source read covers it) |
| §2.4 new target, admissibility | `Ind_B^G(χ₁⊗χ₂)^{K_n}`; induction from `T` | `\|B\G/K_n\| = \|ℙ¹(𝒪_F/ϖ^n)\| = (q+1)q^{n−1}`: `p + 1` for ℚ_p with `n = 1`, `(p²+1)p²` for ℚ_{p²} with `n = 2`. `T\G/K_n` is infinite | holds; negative control added as a Check |
| §2.4 new target, hypothesis on `U` | `U = 0`, `U = 𝒪`, `U = ⊕_ℕ k` | `Ind 0 = 0 ∈ 𝒞`. `U = 𝒪`: constant `1` is not torsion. `⊕_ℕ k`: `K₁`-invariants `⊕_ℕ k^{q+1}` | finite length (not finite generation) is needed; Check added |
| §2.4 new target, Steinberg weight | `I(1) → Ind_B^G(1⊗1)`; `K₁`-invariants | `Ind(1⊗1)^{KZ}` = constants (dim 1). `k[ℙ¹(k_F)] = k ⊕ St_q` since `q + 1 = 1 ≠ 0` in `k`. `St_q ∩ k = 0` | the trivial weight cannot present `St`; Check added |
| §2.4 new target, coefficients | `p = 2`, `k = 𝔽₂` | `k^× = 1`, only trivial characters: `Ind(1⊗1)` is reducible and covered by the extension step | holds |
| §2.4 new target, descent | `V` over `k`, presentation over `k′` | `V ⊗_k k′ ≅ V^{[k′:k]}`, a direct summand with finitely generated complement `V^{[k′:k]−1}`; kernel generators descend by faithful flatness | holds |
| §2.5 route | `V = Ind_{B̄}(χ₁⊗χ₂)`, `St ⊗ χ`, `χ∘det` | `Ord_B`: `χ₁⊗χ₂`, `χ⊗χ`, `0`. Counit kernel lies in `𝒞` via `Ind_{B̄}^G Ord_B(V) ∈ 𝒞` | consistent with the three §2.5 Checks |
| §9.2 Check (F02) | `p = 13, 14, 17` | `5<r<6` empty; `r = 6`; `r ∈ {6,…,9}` | fixed |
| §2.4 Le Check (F04) | `p = 3`; `p ≥ 5` with 1-deep | `p = 3`: 1-deep needs `1 ≤ r ≤ 0`, empty, but BP12 Th. 13.8 still defines `D₀` for generic `ρ̄` (LE19 l. 107). `p ≥ 5`: equals §3.5's `D₀(W(ρ̄))` | fixed |
| §0.5 citations (F03) | Ihara; `G₀` | SERRE-TREES Cor. 1: `SL₂(K) = SL₂(𝒪) *_Γ SL₂(𝒪)′`, `Γ` = lower-left `≡ 0`, i.e. `I ∩ SL₂`. Th. 3 for `G₀ ⊆ GL(V)⁺`, whose closure contains `SL(V)`: `K ∩ K^α = I` (upper Iwahori) for `α = diag(1,ϖ)` | holds |

## Ownership

These were searched by object in `roadmaps grep`, on main and at all open heads: finite
presentation of principal series or Steinberg twists for general `F`, the classification of
non-supersingular irreducibles, and `Barthel.{0,6}Livn`. Only R07.5.15 (FiniteFlatGroupsAndIntegralPadicHodgeTheory)
and the `ℚ_p` sections of PadicLocalLanglandsForGL2Qp touch them, so the general-`F` inputs are
declared as gaps on R07.5.15, the section that already plans Barthel–Livné's Hecke theory.
Membership in `𝒞` is this roadmap's own (`𝒞` and finite presentation are defined in Layers 0 and 2
here); no other roadmap states it. No `Suggested.lean` declaration was added or renamed.

## For the maintainer

- **Consequence for FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15.** It now carries three
  gaps from this roadmap: `barthel-livne-finite-codimension`, and the new
  `barthel-livne-ordinary-classification` and `ordinary-irreducible-hecke-presentation`.
- **Defect in R07.5.15 itself.** It writes the exceptional set as
  `(r, λ) ∈ {(0, ±1), (p − 1, ±1)}` "for every F", but the labels `r` are defined only for
  `F = ℚ_p`. For general `F` the exceptional weights are the trivial weight and the Steinberg weight
  of `GL₂(k_F)` (dimension `q`).
- **Bibliography slip in CDN23.** It attributes Barthel–Livné Proposition 8, Proposition 18 and
  Theorem 19 to its reference [3], the *J. Number Theory* 55 (1995) paper (CDN23 lines 482–484, 695,
  2531). BP12 (lines 1553, 1564) and HU12 (lines 369, 466–467) cite Proposition 8 and Theorem 19
  from the Duke 1994 paper. I kept the human-settled key BARTHEL-LIVNE94 (Duke) for Proposition 18
  and recorded the discrepancy in its `version_note`.
- **Fetch attempt.** One fetch of the 1995 paper was tried, without recording; the service reported
  the DOI landing page as paywalled. Nothing was added to `needs-references.toml`.
- **Names.** No name that other roadmaps cite changed; no section was renumbered.
