# Review of QuantumFoundations (pull request #1771 at 05c97bc)

**Verdict:** accepted

Incremental re-review of 24 changed lines since 824bab8 (`README.md` only; `Suggested.lean` and `metadata.toml` unchanged). No finding.

## Previous findings

- R01 — repaired: line 15 drops "and vacuum cyclicity"; line 24 defers "vacuum characteristic function and vacuum cyclicity (OperatorAlgebraDynamics D8)"; §6.4 line 742 "Consume D8's cyclicity of the vacuum for the symmetric Fock Weyl representation; prove, on the real one-particle space, …".
- R02 — repaired: no "P.6" remains in the README; line 65 "NoncompactQuantumSymmetry P.1–P.5"; line 711 "Consume OperatorAlgebraDynamics D8 for the permutation unitaries `U_σ` … and its projections `P_s`, `P_a`, written `P₊`, `P₋` here"; `*Needs:*` lines 716, 732 name D8.
- R03 — repaired: the description now reads "`Suggested.lean` states the six headline theorems … together with the three definitions they need" and "elaborates … with six theorem admissions and no other warning"; the head has 3 definitions, 6 theorems, 6 `sorry` warnings.
- R04 — repaired: the description now reads "Suppliers are cited by roadmap name and section … or by pinned Mathlib and Tau Ceti declarations; no supplier is proposed here"; the README has no URL.

## Verified sound

| Statement | Instances | Computed | Result |
|---|---|---|---|
| §6.4 strong continuity of `h ↦ W(h)`, now resting on D8's vacuum cyclicity (line 742) | coherent vector `W(g)Ω`; `g = 0`; `h = 0` one-particle space | With D8's `W(f)W(g) = exp(−i·Im⟨f,g⟩/2)W(f+g)`: `W(−g)W(h)W(g) = exp(−i·Im⟨h,g⟩)W(h)`, so `‖W(h)W(g)Ω − W(g)Ω‖² = 2 − 2cos(Im⟨h,g⟩)exp(−‖h‖²/4) → 0`; at `g = 0`: `2 − 2exp(−‖h‖²/4)`, the Check's value (`≈ 0.442` at `‖h‖ = 1`). Zero space: `F = ℂΩ`, `W = 1` | holds; density of `{W(g)Ω}` is exactly what D8 lines 3672–3676 prove, no circularity |
| §6.4 Fock irreducibility, kept as this roadmap's (lines 15, 742, 745) | one bosonic mode; one fermionic mode | Route uses `a†(f₁)⋯a†(f_n)Ω = √(n!)P_n(f₁⊗⋯⊗f_n)` (own formula), not Weyl cyclicity: `‖a†(e)ⁿΩ‖² = n!`, joint kernel of `a` is `ℂΩ`; `T = E₂₁` commutes with `a†` only, not scalar | independent of the moved target; D8 line 3699 assigns irreducibility to §6.4 |
| §6.2 sector projections, now D8's `P_s`, `P_a` (lines 711, 721–722, 726) | `n = 2, d = 2`; `n = 3, d = 2`; `n = 0, 1` | `P₊ = (1+Σ)/2`, ranks `3 + 1 = 4`, sum `1`; `dim Sym³ = 4`, `Λ³ = 0`, `4 < 8`; trivial group, `P₊ = P₋ = 1`. D8 lines 3526–3530 give the same three values | agree; `(1/n!)Σ_σ U_σ` is the same operator for left and right actions, so the repointing changes no formula |
| Line 55's convention for `U_σ` | `S₃` on `e₁⊗e₂⊗e₃` | D8 lines 3476, 3516–3521: `U_σU_τ = U_(στ)`, left action; README line 55 and 711 state the same law | agree |

The rows for the untouched statements stand as in the previous review, of 824bab8.

- Cross-roadmap citations resolved against main at 1a19c9f: OperatorAlgebraDynamics D8 lines 163 (sole owner of `U_σ`, `P_s`, `P_a`, vacuum cyclicity), 3468–3483, 3647, 3672–3676, 3697–3702 (bosonic operators, Segal field, norm continuity, irreducibility assigned to this roadmap's §6.4), 4136–4146 (consumer entry matching lines 24, 55, 711, 726, 742). 5 citations, all found.
- `grep 'P\.6'` on the README: 0 hits; the remaining NoncompactQuantumSymmetry citations are P.1–P.5 and M0–M6 (lines 22, 65, 66, 811 and the `*Needs:*` lines), as the description states.
- Seeded sample: only §6.4 falls in a changed passage; the changed sentences carry no source locator (supplier citation only). The other fourteen targets are untouched.
- Description read against the head, every prose sentence and the summary block: none contradicted; the Layer 6 ownership sentence (D8 owns permutation unitaries, projections, Fock carriers, vacuum cyclicity; P.1–P.5 and M0–M6 consumed) matches lines 15, 22, 24, 55.
- Gate at 05c97bc, run again: every check `0`, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no `UPWARD`, `CYCLE` or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/QuantumFoundations/Suggested.lean`: exit 0, six `declaration uses sorry` warnings (lines 55, 64, 76, 88, 109, 126) and nothing else. The file is unchanged since 824bab8; the one-tactic probe and the `#check @` comparison were not repeated.
- `git diff --stat origin/main...HEAD` outside the folder: empty. `overlaps.md`: no dropped id, no open revision of this roadmap, no second copy.

Overlap check: read OperatorAlgebraDynamics (main), NoncompactQuantumSymmetry (open), RelativisticQuantumFieldTheory (open). Shared: vacuum cyclicity of `π_F` and the permutation unitaries with `P_s`, `P_a`, owner OperatorAlgebraDynamics D8, now cited; bosonic creation and annihilation operators, `Γ`, `dΓ`, `N`, Fock irreducibility, owner QuantumFoundations §§6.3–6.4, as D8 lines 163 and 3697–3702 state.

Source independence: changed passages only; 8 changed passages compared, none cites or paraphrases an external source (all are supplier citations of OperatorAlgebraDynamics D8), 0 sources involved; the arrangement was not compared again (no layer added, removed or reordered); the wording and arrangement results of the full reviews stand.

## Not verifiable

- Alfsen–Shultz 1978 and 1998, Iochum–Shultz 1983, Davies–Lewis 1970, Łuczak–Podsędkowska 2015, Gudder–Boyce 1970: settled uncertified in the manifest; untouched this round.
- The description's account of how sources were transcribed: nothing in the head records it.

## Source issues

- none

## For the human reviewers

- **Licence.** The description says model readers "supplied Markdown from source images"; it does not say which sources or where the images came from. The README's uncertified sources are listed under `## Not verifiable`.
