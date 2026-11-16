# FIX-PKG-LieGroupsPartII~3

Findings of `REV-PKG-LieGroupsPartII~2`: two, both P3. Only `packages/LieGroupsPartII/README.md` changed (three passages). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-LieGroupsPartII~2/F01 (P3) — applied

Verified. `R_φ diag(1, −1) R_φ⁻¹ = ((cos 2φ, sin 2φ), (sin 2φ, −cos 2φ))`. At `φ = π/2` this is `((−1, 0), (0, 1)) = −diag(1, −1)`, and `sin 2φ = 0` holds there, so the stated criterion admits `R_{π/2} ∉ M`.

§7.3 Checks, "The group `M`": "equal to `diag(1, −1)` only for `sin 2φ = 0`" → "equal to `diag(1, −1)` exactly when `cos 2φ = 1`, that is, `R_φ = ±1`. The weaker condition `sin 2φ = 0` also admits `φ = ±π/2`, where the image is `−diag(1, −1)`: it cuts out the four elements of `N_K(𝔞)` of the next Check, not `M`."

Pattern search: every other rotation computation in the README was recomputed and is correct.
- Line 248: `Ad(R_φ)S = ((−sin 2φ, cos 2φ), (cos 2φ, sin 2φ))` and `tr(·H) = −2 sin 2φ`, which is maximal at `φ = −π/4`.
- Line 303: `exp(c(E₁₂ − E₂₁))` at `c = −π/2` is `((0, −1), (1, 0))`, and at `c = −π/4` it is `R_{π/4}`.
- Line 741: `R_{π/4}` sends `diag(1, −1)` to `((0, 1), (1, 0))`.

The other places that state `M` for `SL_2(ℝ)`, `GL_2(ℝ)` and `O(1,1)` (§§2.4, 2.5, 3.2, 3.5, 7.3, 8.1 and the worked example) give the group itself, not a criterion. They agree with `{±1}` and `{diag(±1, ±1)}`.

## REV-PKG-LieGroupsPartII~2/F02 (P3) — applied differently

The finding is right that the scope section does not compare §6.1 with FlagVarieties, which is on main. The suggested sentence is wrong, though. It says FlagVarieties does not state the conjugation into a larger standard parabolic. FlagVarieties §5.2 (`TauCetiRoadmap/FlagVarieties/README.md` line 284) does state it: a `P_J`-fixed coset of `G/P_K` exists iff `J ⊆ K`, and it is then `eP_K`. By its §5.1 a point `hP_K` is fixed iff `h⁻¹P_Jh ⊆ P_K`. Put `g = h⁻¹` and this is exactly `conj_standardParabolic_le_iff`. Its case `J = ∅`, "the only `B`-fixed point is `eP_K`", is our first statement. Its §3.2 (line 226) states self-normalization.

What actually separates the two is generality and route. FlagVarieties needs a connected reductive group over an algebraically closed field and argues through Borel conjugacy inside `P_K` and `N_G(B) = B`. §6.1 needs only a Tits system and argues through the Bruhat decomposition.

The scope paragraph gains this sentence: FlagVarieties §§3.1, 3.2 and 5.2 state the same facts for `G` connected reductive over an algebraically closed `k` and `g ∈ G(k)`, through Borel conjugacy. §6.1 needs no algebraic group or field, so it also covers real Lie groups and `GL_n(k)` over a field `k` that is not algebraically closed. §6.1's comparison sentence (line 563, which the finding also names) gains a one-clause version of the same.

Witnesses: for `GL_3(k)` with `k` algebraically closed, both give that the `(2, 1)` and `(1, 2)` parabolics are not conjugate. For `GL_3(ℝ)`, and for `SL_2(ℝ)` with `(P, N_G(𝔞))`, only §6.1 applies.

No dependency is added: FlagVarieties is not consumed. Ownership: no roadmap on main, open or on the board states the abstract Tits-system form. Both grep tools were run for `conj.*standardParabolic` and for `g B g⁻¹ ⊆ P`, and the only other hit was FlagVarieties §5.2.

## Adversarial pass on the changed text

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `M = Z_{SO(2)}(ℝ·diag(1, −1))` via `cos 2φ = 1` | `φ = 0, π/2, π, −π/2, π/4` | image `diag(1,−1)`, `−diag(1,−1)`, `diag(1,−1)`, `−diag(1,−1)`, `((0,1),(1,0))`; `cos 2φ = 1, −1, 1, −1, 0` | only `φ ∈ πℤ`, i.e. `R_φ = ±1`: `M = {±1}`, as stated |
| `sin 2φ = 0` gives `N_K(𝔞)` | same `φ` | `φ ∈ (π/2)ℤ` gives `R_φ ∈ {±1, ±((0,−1),(1,0))}`; at `π/4` the off-diagonal entry is `1 ≠ 0` | agrees with the next Check `{±1, ±((0, −1), (1, 0))}` |
| FlagVarieties §5.2 = `conj_standardParabolic_le_iff` | `g = h⁻¹`; `J = ∅` | `h⁻¹P_Jh ⊆ P_K ⇔ J ⊆ K ∧ h ∈ P_K` becomes `gP_Jg⁻¹ ⊆ P_K ⇔ J ⊆ K ∧ g ∈ P_K`; `J = ∅`: `g⁻¹Bg ⊆ P_K ⇒ g ∈ P_K` | same statement on `G(k)` |
| Scope of the comparison | `GL_3(ℂ)`; `GL_3(ℝ)`; `SL_2(ℝ)`, `(P, N_G(𝔞))`; `GL_2(𝔽_3)` | first: both apply. Others: the field is not algebraically closed or there is no algebraic group, so FlagVarieties' hypotheses fail; Tau Ceti's `glTitsSystem` (`[Field k] [Nontrivial kˣ]`) and RealSemisimpleLieGroups §3.3 give Tits systems | the sentence holds |
| §6.1 Lean statement (unchanged) | `S = ∅`; rank one, `g ∈ BsB`, `J = J' = ∅` | `P_∅ = G`, both sides true; left side false because `sBs ≠ B`, right side false because `g ∉ B` | unchanged, consistent |

## Checks run

- **Elaboration.** `lake env lean packages/LieGroupsPartII/Suggested.lean`, run from the content checkout, exits 0. It prints 13 `declaration uses sorry` warnings, at lines 65, 174, 200, 221, 238, 255, 269, 284, 308, 325, 341, 357 and 377, and nothing else.
- **Signatures.** I put `#check @name` for all 26 declarations in one scratch file and elaborated it once: exit 0, 26 types. The normalized text is byte-identical (same md5) to the worker's `signatures.md`, so no binder changed and none was lost. `Suggested.lean` was not edited.
- **Dependency direction**, re-run after the final edit:

      depcheck: 239 roadmaps, 2246 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README after the edits reports no cross-roadmap citation and no Lean name found nowhere. The worker's two earlier leads exist in ArithmeticLocallySymmetricSpaces' README (lines 581, 599 and 1187 at its open head): `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`.
- **Style of the new text.** No LaTeX delimiters, process words, pull-request numbers or paths.

## Gate failures

None were listed.

## For the maintainer

- No name changed, no section moved and no supplier gap was added. Nothing cites LieGroupsPartII, so no other roadmap is affected.
- FlagVarieties §5.2 and §6.1 here are the same statement at different generality. A later revision of FlagVarieties could take its §§3.1–3.2 and 5.2 from §6.1 on the Tits system of points, which it already uses through `gap:tits-system-of-points`. That is FlagVarieties' decision; this package does not depend on it.
- Ownership against open pull requests was checked with the `roadmaps grep` tool over all open heads and main, and by a grep of the board's packages.
